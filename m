Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8682F782D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 08:30:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7N8UlmD013846
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 01:30:47 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 01:30:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<jussi.kukkonen@intel.com>
Date: Wed, 23 Aug 2017 04:30:45 -0400
Message-ID: <1503477045-37003-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2] libxml2: Fix CVE-2017-8872
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
X-List-Received-Date: Wed, 23 Aug 2017 08:30:48 -0000
Content-Type: text/plain

fix global-buffer-overflow in htmlParseTryOrFinish (HTMLparser.c:5403)

https://bugzilla.gnome.org/show_bug.cgi?id=775200

Here is the reproduce steps on ubuntu 16.04, use clang with "-fsanitize=address"
...
export CC="clang"
export CFLAGS="-fsanitize=address"

./configure --disable-shared

make clean all -j

wget https://bugzilla.gnome.org/attachment.cgi?id=340871 -O poc

./xmllint --html --push poc
==2785==ERROR: AddressSanitizer: global-buffer-overflow on address
0x000000a0de21 at pc 0x0000006a7f6e bp 0x7ffdfe940c10 sp 0x7ffdfe940c08
READ of size 1 at 0x000000a0de21 thread T0    #0 0x6a7f6d
(/home/jiahongxu/Downloads/libxml2-2.9.4/xmllint+0x6a7f6d)    #1 0x6a7356
(/home/jiahongxu/Downloads/libxml2-2.9.4/xmllint+0x6a7356)    #2 0x4f4504
(/home/jiahongxu/Downloads/libxml2-2.9.4/xmllint+0x4f4504)    #3 0x4f045e
(/home/jiahongxu/Downloads/libxml2-2.9.4/xmllint+0x4f045e)    #4 0x7f81977d682f
(/lib/x86_64-linux-gnu/libc.so.6+0x2082f)    #5 0x419ad8
(/home/jiahongxu/Downloads/libxml2-2.9.4/xmllint+0x419ad8)
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libxml/libxml2/libxml2-CVE-2017-8872.patch     | 37 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
new file mode 100644
index 0000000..26779aa
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
@@ -0,0 +1,37 @@
+From d2f873a541c72b0f67e15562819bf98b884b30b7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 23 Aug 2017 16:04:49 +0800
+Subject: [PATCH] fix CVE-2017-8872
+
+this makes xmlHaltParser "empty" the buffer, as it resets cur and ava
+il too here.
+
+this seems to cure this specific issue, and also passes the testsuite
+
+Signed-off-by: Marcus Meissner <meissner@suse.de>
+
+https://bugzilla.gnome.org/show_bug.cgi?id=775200
+Upstream-Status: Backport [https://bugzilla.gnome.org/attachment.cgi?id=355527&action=diff]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ parser.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index 9506ead..6c07ffd 100644
+--- a/parser.c
++++ b/parser.c
+@@ -12664,6 +12664,10 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {
+ 	}
+ 	ctxt->input->cur = BAD_CAST"";
+ 	ctxt->input->base = ctxt->input->cur;
++	if (ctxt->input->buf) {
++		xmlBufEmpty (ctxt->input->buf->buffer);
++	} else
++		ctxt->input->length = 0;
+     }
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index f67c47d..107539b 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -28,6 +28,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-CVE-2017-9049_CVE-2017-9050.patch \
            file://libxml2-CVE-2017-5969.patch \
            file://libxml2-CVE-2017-0663.patch \
+           file://libxml2-CVE-2017-8872.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            "
 
-- 
2.8.1


