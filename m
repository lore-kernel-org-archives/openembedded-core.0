Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web12.4516.1626876717462519853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 07:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=XeJiQeFD;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626876719; x=1658412719;
  h=from:to:cc:subject:date:message-id;
  bh=k4hTs+MMMLHnKOgWrHhF/iNAPpLNyMEtBHbNJbrhwZI=;
  b=XeJiQeFDntXU6eENYYCouuKZvmhXuooCr1//WiNYzQdLnsvCuT1kp5lp
   sOlVXz0w1r6Kj6kMoX1vpLJUX2lntBuIkwgpBp5qX9r2wTldL31nJl7Ni
   +5NjG0jlTe2OX6WBekawhdH00rcXnvk8AgKI3B8+MYbuD+WMyFwR74ODy
   H8p2Zb0esPpjlnV74TXVk0qyiHbmX9IHPDWt828QBBGRvPvNAtm83H0xq
   M1YdDtwWdU4z61K54w59e+6tH2pmImTpSTR7/GnKUnAF9svaMibJiW6RH
   jcw4+ZpcMokUhOOqJ2pT75uveJeMbmcWLHXEIm6qoT9rbamG9pL9IPXsa
   A==;
X-IronPort-AV: E=Sophos;i="5.84,258,1620684000"; 
   d="scan'208";a="18573454"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2021 16:11:54 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 21 Jul 2021 16:11:54 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 21 Jul 2021 16:11:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626876714; x=1658412714;
  h=from:to:cc:subject:date:message-id;
  bh=k4hTs+MMMLHnKOgWrHhF/iNAPpLNyMEtBHbNJbrhwZI=;
  b=ZDVcXQpo3XbTbdPYPlHFpatl+PBDYcpKiNqxBzGiC2DW9B+0gcYJ4aLG
   qIR1bQb3Ee5/QT9MeaadxePaDbfBlzmY1jwPLfD5zm6nVKB+2HLokScGG
   Vdas5Lcp8dMFGfAm58cfbtVCAzLDN1SrdngTv3JGiYrAtus8YEO9xuGZH
   OD/K3Eco2Wzy9P30gTJ5lD+VSVghHkRQ4DvfOHYNZ9yrxsFgo+u0YsJDR
   02CcCs9QYwJOTlkgL9i9uF4k80qy3JHUZUNBQllBqcIDLirpZU2ooxUG2
   jxLWTPp2xYv45F0T/n2vZV+WotPenGs4/wYJS8X1Ogl3xjjuV7IBY9fHW
   g==;
X-IronPort-AV: E=Sophos;i="5.84,258,1620684000"; 
   d="scan'208";a="18573453"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2021 16:11:54 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 97EDE280075;
	Wed, 21 Jul 2021 16:11:54 +0200 (CEST)
From: "Matthias Schiffer" <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 2/3] initscripts: populate-volatile.sh: run create_file synchronously
Date: Wed, 21 Jul 2021 16:10:15 +0200
Message-Id: <fe07e5edab1a0db4320e64082ef838b1982cccbc.1626875447.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <0fb2381b97f71a3469e6c5a0de98b2c3e7aa75c2.1626875447.git.matthias.schiffer@ew.tq-group.com>
References: <0fb2381b97f71a3469e6c5a0de98b2c3e7aa75c2.1626875447.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <0fb2381b97f71a3469e6c5a0de98b2c3e7aa75c2.1626875447.git.matthias.schiffer@ew.tq-group.com>
References: <0fb2381b97f71a3469e6c5a0de98b2c3e7aa75c2.1626875447.git.matthias.schiffer@ew.tq-group.com>

The behavior of running create_file in the background was introduced in
d44816bedade ("initscripts: Populate volatile from existing file")
without further explanation. Besides its questionable benefit, this
causes actual issues:

- Not all create_file processes may have finished by the time the
  initscript exits (or when it moves /etc/volatile.cache.build !)
- By making the order of commands nondeterminstic, it could hide
  dependency issues where it was attempted to create files before their
  containing directories

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 .../initscripts/initscripts-1.0/populate-volatile.sh            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index f8b42c6893..b56b72f833 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -201,7 +201,7 @@ apply_cfgfile() {
 			"f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
 				TSOURCE="$TLTARGET"
 				[ "${TSOURCE}" = "none" ] && TSOURCE=""
-				create_file "${TNAME}" "${TSOURCE}" &
+				create_file "${TNAME}" "${TSOURCE}"
 				;;
 			"d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
 				mk_dir "${TNAME}"
-- 
2.17.1

