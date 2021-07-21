Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web12.4516.1626876717462519853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 07:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=XVbuE4ms;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626876720; x=1658412720;
  h=from:to:cc:subject:date:message-id;
  bh=YEjIatjGSRlPE0HzQ8rMx+Ke3PoiQxi6MQKl9BpmdMY=;
  b=XVbuE4msIINqZasBHoXGqUkcSvLIk2noyNQTUtG+fJwixut7uGenxKr5
   ZiujnBG5NzgNwZ3itpVCt1eGsmddJdLSRLDw2XlGuCrT8In23Vpj2/sH2
   hTxWGRbqvjraJRHbrUX7gs4jDmoRt+zSdGIi5B+/GGjdH/TJZG9O6Dgsh
   TXPCLexwx0tMmGYIKFYQoGLC+3Nfm0SgEgCizupL+xqoPB7w0N2ilFvkA
   TmsJUVA885anQdiX0L0WvORU+mQ+TZg+BkfkeMujdss0liJ5kgd7c0DiG
   sSYM1ghKt86v6aTK1Al5skiZfBt6Sa2euinX3iajpCyLD51mfTpJaG/vW
   w==;
X-IronPort-AV: E=Sophos;i="5.84,258,1620684000"; 
   d="scan'208";a="18573456"
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
  bh=YEjIatjGSRlPE0HzQ8rMx+Ke3PoiQxi6MQKl9BpmdMY=;
  b=lgV6rlxVDHv9pGQ+XIsR8F8TqNeK1oSBsLyv7IRdtENhKdiiwm2hsShg
   rRNEKX90d8V6l6X9q6af296VqmJOTgu2pDQy5ywcxpm4JR0wT45HIRYIM
   6Y4Fb2rV5J7+jA216V3RDsU3sOy8mfBIhVn82pfdDAL/y8JPo3YlK8zOe
   UirgQ9sguMJERKCO6lKslr6B7wObS9aOa8YiPtRwhIDP6AlHrGXYpUrjK
   NXqECFKBsDedfyugb0TzDMqYsq0iEt3vtLawVpf20FOyQsc6OvZkx+izh
   5iRDxYh0GAbu+e6fQEcGWCcloEy+NMFi/KrmGlAF0YBRBweTIxuOqqIhq
   w==;
X-IronPort-AV: E=Sophos;i="5.84,258,1620684000"; 
   d="scan'208";a="18573455"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2021 16:11:54 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id A7E0A280078;
	Wed, 21 Jul 2021 16:11:54 +0200 (CEST)
From: "Matthias Schiffer" <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 3/3] initscripts: fix creation order for /var/log with VOLATILE_LOG_DIR=true
Date: Wed, 21 Jul 2021 16:10:16 +0200
Message-Id: <f41298a4ab1593f5fd3e9d24d9960196ab4006f0.1626875447.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <0fb2381b97f71a3469e6c5a0de98b2c3e7aa75c2.1626875447.git.matthias.schiffer@ew.tq-group.com>
References: <0fb2381b97f71a3469e6c5a0de98b2c3e7aa75c2.1626875447.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <0fb2381b97f71a3469e6c5a0de98b2c3e7aa75c2.1626875447.git.matthias.schiffer@ew.tq-group.com>
References: <0fb2381b97f71a3469e6c5a0de98b2c3e7aa75c2.1626875447.git.matthias.schiffer@ew.tq-group.com>

Create the /var/log symlink directly after /var/volatile/log, so
/var/log is available for the creation of /var/log/wtmp a few lines
later.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

An alternative solution would be to move the creation of the /var/log
link (and possibly /var/volatile/log itself) to a separate volatile list
that is applied before 00_core. This would simplify the code and improve
compatiblity with patch [1] (currently applied downstream by
WindRiver Linux, I'm not sure what the status is regarding inclusion in
OpenEmbedded core).


[1] https://patchwork.openembedded.org/patch/176834/


 meta/recipes-core/initscripts/initscripts_1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 5e994f2b7f..65f9c0ae8d 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -106,7 +106,8 @@ do_install () {
 	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
 	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
-		echo "l root root 0755 /var/log /var/volatile/log" >> ${D}${sysconfdir}/default/volatiles/00_core
+		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
+			${D}${sysconfdir}/default/volatiles/00_core
 	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
-- 
2.17.1

