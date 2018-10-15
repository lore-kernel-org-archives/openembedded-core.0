Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF1D179A71
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 07:24:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9F7ODLL017034
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 00:24:13 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 15 Oct 2018 00:24:12 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Oct 2018 15:24:11 +0800
Message-ID: <1539588251-187978-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] update-rc.d: add -f into postinst OPT
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
X-List-Received-Date: Mon, 15 Oct 2018 07:24:13 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

add -f into postinst OPT to fix run postinst scriptlet fail
problem during do rootfs, while INITSCRIPT_PARAMS set to remove.

+ type update-rc.d
+ '[' -n qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs ']'
+ OPT='-r qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs'
+ update-rc.d -r work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs keepalived remove
update-rc.d: work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs/etc/init.d/keepalived exists during rc.d purge (use -f to force)
D: %post(keepalived-1.4.2-r0.core2_64): waitpid(305974) rc 305974 status 100

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/update-rc.d.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 06e3b21..265c4be 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -39,9 +39,9 @@ PACKAGE_WRITE_DEPS += "update-rc.d-native"
 updatercd_postinst() {
 if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
-		OPT="-r $D"
+		OPT="-f -r $D"
 	else
-		OPT="-s"
+		OPT="-f -s"
 	fi
 	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
 fi
-- 
2.7.4


