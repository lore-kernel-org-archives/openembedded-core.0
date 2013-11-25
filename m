Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 089C36163A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 08:58:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAP8ws2N002347
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 00:58:54 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 25 Nov 2013 00:58:53 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Nov 2013 16:58:55 +0800
Message-ID: <1385369935-10918-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] webkit/midori: fix COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 25 Nov 2013 08:58:59 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

webkit can not be built on mips64 with n32 ABI, but can be built on mips64
n64 and o32 ABI whose TARGET_SYS's name is mips-*-linux

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-sato/midori/midori_0.5.5.bb     |    4 ++--
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/midori/midori_0.5.5.bb b/meta/recipes-sato/midori/midori_0.5.5.bb
index 7c233cb..d3f42cc 100644
--- a/meta/recipes-sato/midori/midori_0.5.5.bb
+++ b/meta/recipes-sato/midori/midori_0.5.5.bb
@@ -11,8 +11,8 @@ SRC_URI[md5sum] = "b99e87d4b73a4732ed1c1e591f0242ac"
 SRC_URI[sha256sum] = "ca69382a285222a86028abebd73fed1976735883027ff0adc094b627789bbd62"
 
 # midori depends on webkit-gtk, and webkit-gtk can NOT be built on
-# MIPS64 with 64 bits userspace. So remove it from mips64 temporarily.
-COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
+# MIPS64 with n32 ABI. So remove it from mips64 n32 temporarily.
+COMPATIBLE_HOST_mips64 = "mips64.*-linux"
 
 inherit gtk-icon-cache pkgconfig vala pythonnative
 
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index adab4fa..3581de3 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -31,8 +31,8 @@ SRC_URI = "\
 SRC_URI[md5sum] = "dcbf9d5e2e6391f857c29a57528b32a6"
 SRC_URI[sha256sum] = "ada02d636af61aed38f142d3cded662d141ce71264f624c4eb873621a74cc9e7"
 
-# webkit-gtk can NOT be built on MIPS64 with 64 bits userspace
-COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
+# webkit-gtk can NOT be built on MIPS64 with n32 ABI
+COMPATIBLE_HOST_mips64 = "mips64.*-linux"
 
 inherit autotools lib_package gtk-doc pkgconfig
 
-- 
1.7.10.4


