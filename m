Return-Path: <matthias.schiffer@ew.tq-group.com>
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A39C78EFF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 08:56:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.54,471,1534802400"; 
   d="scan'208";a="5001958"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 06 Nov 2018 09:56:47 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Tue, 06 Nov 2018 09:56:47 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Tue, 06 Nov 2018 09:56:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1541494607; x=1573030607;
	h=from:to:cc:subject:date:message-id;
	bh=GDJe2VOUpZdmjY3k8RS0JkF+2H9O0ZwNNqM4JMfcb0A=;
	b=qcbTSbYLRHM/gjv8DLUH0VKz19CmG3TfphKNYGq0539Ib1lT86CgkZ+1
	fxV5xPporduWiwM36axZV5kmLYEA1tu88zAYzxYeXM3erT9lgS/F1a1Sy
	GlAKPB2tDu8BQ9ycN9pkyF9EOHY0CUMPnR6xlWpUndldspIMpttaGDW7v
	pMjMf+6vdQSJpmJOAq6UO9Ip/gOCUNQaWZZ8L0trlN8tVtnpj8OlWX5eg
	LFjjB53a5M972N/tuExX+/k7d0in6G1TRuTTvnUZCWcaZJ8H5ARQMbGM2
	X2+zzqZdzD4BXQolK55AyAXZbnKBqmCdLvMgp25CB4sPhL8tOYWdz0Bdh g==;
X-IronPort-AV: E=Sophos;i="5.54,471,1534802400"; 
   d="scan'208";a="5001956"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 06 Nov 2018 09:56:43 +0100
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 3AA0A280065;
	Tue,  6 Nov 2018 09:56:56 +0100 (CET)
From: matthias.schiffer@ew.tq-group.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Nov 2018 09:56:23 +0100
Message-Id: <20181106085623.19811-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] base.bbclass: avoid 'find -ignore_readdir_race -delete'
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
X-List-Received-Date: Tue, 06 Nov 2018 08:56:47 -0000

From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Due to a bug in find [1], -ignore_readdir_race does not work correctly with
-delete. This can lead to spurious build failures when files disappear
while such a command is running; specifically this was seen in the case of
do_configure and do_populate_lic running concurrently for packages
with ${B} == ${WORKDIR}:

   find: '.../sstate-build-populate_lic': No such file or directory

While the issue is fixed in the findutils git master, the find command of
the host system is called here, so we can't ensure that the used version
contains the fix. Many common distros have not updated to a recent enough
findutils version yet (Ubuntu 18.10 contains the fix, while 18.04 is still
affected).

Work around the issue by passing the output of find to 'rm -f' instead of
using -delete.

[1] https://savannah.gnu.org/bugs/?52981

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

It would be great if this patch could be backported to all versions back to
Rocko, as our current setup is still based on Rocko.

v2: add comment, extend commit message


 meta/classes/base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index df11c8b270..9efb06de5f 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -303,7 +303,9 @@ base_do_configure() {
 			if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile -o -e makefile -o -e GNUmakefile \) ]; then
 				oe_runmake clean
 			fi
-			find ${B} -ignore_readdir_race -name \*.la -delete
+			# -ignore_readdir_race does not work correctly with -delete;
+			# use xargs to avoid spurious build failures
+			find ${B} -ignore_readdir_race -name \*.la -type f -print0 | xargs -0 rm -f
 		fi
 	fi
 	if [ -n "${CONFIGURESTAMPFILE}" ]; then
-- 
2.17.1


