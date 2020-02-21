Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF3461780
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PP4K570Lz40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:00:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582318833;
	bh=MPYP8ZeR/PHH/r5tuctkCMVd1BkXPh3W8O8sV46xSMk=;
	h=From:To:Subject:Date:From;
	b=QzUXb2c8jGBkKl5AgWJuQWYhp2De0TwegUqeuO3FkpngObg68xX7FOJ4E9VT/RAwX
	9NFfB1ehb25vgZz9kKW6xbPxvSKmqHFT3oAIAtf0y9dAoAMOKwwbMWtlIFGyv3SC+c
	eQEuotH/1rJJvG3TiR50OGTP+oq6YXmfhTJm3H4sOmMICsJewsJx/KXrjuLKr2CQhI
	quhJFMm7Zg7p+quB30Ko8ejDt+9WJP3ffMVSvKrUeEtwRh1eodjWdTF0z9/4a08nQs
	BGrmMQvg0PYY/jnu1s7LLGAvz/VHnYNU48OD+M0nZBpiR9PwA/+bclWC21COtjxzvA
	IjYan38CKJsx4BsVzgU4SKQeLQ+mKvv6Si1/51Pip+cQmNxgFKJRdHWg7I7dn2yOue
	EjVkMrIZ0p3/eNhpUT6X2A/Fn6Yh0lgoq42EfRK8yHDeaeOem0NxkmdCirAF02mB8/
	qRixIFC7Bv+UQeA+y34FFKO5vL2AoGg5kO3bs4OtLEJGdjb/TJcQ14BZH605UsBriJ
	H4A3JlwnJwaB2HBzY3oR7wZfnK8JxHS6tPWVd7yvs0Bh36mqX/bFv8w97nmyWYCMDX
	NDUpcxltrL/RtxIr44v1c9lIU6r8YEHZyVpFel3LFm2Ikqr3fyfzhBJRCgxzhW2e+O
	3xnXG/9fUOzyapfMPeM0CnKQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 23:00:31 +0200
Message-Id: <20200221210032.3414-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH 1/2] libxml2: fix CVE-2020-7595
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
X-List-Received-Date: Fri, 21 Feb 2020 21:00:33 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libxml/libxml2/CVE-2020-7595.patch        | 36 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.9.bb     |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
new file mode 100644
index 0000000000..facfefd362
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
@@ -0,0 +1,36 @@
+From 0e1a49c8907645d2e155f0d89d4d9895ac5112b5 Mon Sep 17 00:00:00 2001
+From: Zhipeng Xie <xiezhipeng1@huawei.com>
+Date: Thu, 12 Dec 2019 17:30:55 +0800
+Subject: [PATCH] Fix infinite loop in xmlStringLenDecodeEntities
+
+When ctxt->instate == XML_PARSER_EOF,xmlParseStringEntityRef
+return NULL which cause a infinite loop in xmlStringLenDecodeEntities
+
+Found with libFuzzer.
+
+Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/0e1a49c89076]
+CVE: CVE-2020-7595
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
+---
+ parser.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index d1c31963..a34bb6cd 100644
+--- a/parser.c
++++ b/parser.c
+@@ -2646,7 +2646,8 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
+     else
+         c = 0;
+     while ((c != 0) && (c != end) && /* non input consuming loop */
+-	   (c != end2) && (c != end3)) {
++           (c != end2) && (c != end3) &&
++           (ctxt->instate != XML_PARSER_EOF)) {
+ 
+ 	if (c == 0) break;
+         if ((c == '&') && (str[1] == '#')) {
+-- 
+2.24.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.9.bb b/meta/recipes-core/libxml/libxml2_2.9.9.bb
index c44a90b1c2..5797dd6bee 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.9.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.9.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
            file://Fix-CVE-2019-19956.patch \
+           file://CVE-2020-7595.patch \
            "
 
 SRC_URI[libtar.md5sum] = "c04a5a0a042eaa157e8e8c9eabe76bd6"
-- 
2.17.1


