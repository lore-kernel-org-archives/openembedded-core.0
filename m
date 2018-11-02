Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Greylist: delayed 587 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Nov 2018 14:49:44 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id 86F8079F5A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 14:49:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.54,456,1534802400"; 
   d="scan'208";a="4970171"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 02 Nov 2018 15:39:57 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Fri, 02 Nov 2018 15:39:57 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 02 Nov 2018 15:39:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1541169597; x=1572705597;
	h=from:to:cc:subject:date:message-id;
	bh=8VtHOMlxNJjGSK+ouS1EynA8cUhIg99spNs64xjH8so=;
	b=JYOLMiMAXiO6e7IcZjy/k1H05BopTHVM9IjTbsFpAfyzc29haps2cnU5
	ETM0RkrIfvbrj5HDxz1xryc4uLT0hfgTZn3hudAuFn86jKiAaeOZNw8P7
	RM+kPIRNW18DLTbXO9xAmCZOpzrrFAFNpkIsY2q/eBmWODI9UwxvAKDf/
	VEIngkEkKnCcdlqAtovRb5UQ4ZTFCtFU8lCcsMggWA90tw8xbA+IVTG9K
	q9Qq5pcGFignxh8mCD7qnU5k9bavySs3yPFexPFcSfVI5SHckWN8ZpavO
	DNFKUPspmHOFbyQXB06I/VdFqKaI2TIEikGFBbw9ryBJ2atH3QyuGJqMa w==;
X-IronPort-AV: E=Sophos;i="5.54,456,1534802400"; 
   d="scan'208";a="4970170"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 02 Nov 2018 15:39:57 +0100
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id BD857280065;
	Fri,  2 Nov 2018 15:40:11 +0100 (CET)
From: matthias.schiffer@ew.tq-group.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Nov 2018 15:39:27 +0100
Message-Id: <20181102143927.15387-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] base.bbclass: avoid 'find -ignore_readdir_race -delete'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Nov 2018 14:49:44 -0000

From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Until recent versions of findutils, -ignore_readdir_race did not work
correctly with -delete. This led to spurious build failures when files
disappeared; specifically this was seen due to do_configure and
do_populate_lic running concurrently for packages with ${B} == ${WORKDIR}:

   find: '.../sstate-build-populate_lic': No such file or directory

As the find command of the host system is used here, we can't ensure that
the used version contains the fix. Work around the issue by passing the
output of find to 'rm -f' instead of using -delete.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

It would be great if this patch could be backported to all versions back to
Rocko, as our current setup is still based on Rocko.

 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index df11c8b270..5ffd8396e3 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -303,7 +303,7 @@ base_do_configure() {
 			if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile -o -e makefile -o -e GNUmakefile \) ]; then
 				oe_runmake clean
 			fi
-			find ${B} -ignore_readdir_race -name \*.la -delete
+			find ${B} -ignore_readdir_race -name \*.la -type f -print0 | xargs -0 rm -f
 		fi
 	fi
 	if [ -n "${CONFIGURESTAMPFILE}" ]; then
-- 
2.17.1


