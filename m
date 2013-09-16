Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49B196028B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:14:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8GBENDJ007583
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 04:14:24 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 16 Sep 2013 04:14:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Sep 2013 19:14:19 +0800
Message-ID: <dd0104c4f2811038c1ee78605e6b81a50045f5f6.1379329974.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379329974.git.hongxu.jia@windriver.com>
References: <cover.1379329974.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libxml2: fix LSB desktop-xml tests failure
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
X-List-Received-Date: Mon, 16 Sep 2013 11:14:22 -0000
Content-Type: text/plain

The commit
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=8780c5ddf2916bbd42fc67b79c286652aebb1546
add a patch to fix a security issue. It modify include file 'tree.h'
to add 'const char *dummy_children' on 'struct _xmlNs'.

But lsb test suites didn't do this in his own include file, so the LSB
desktop-xml tests failed.

Disable this patch for linuxstdbase could fix this issue.

[YOCTO #5151]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/libxml/libxml2_2.9.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.1.bb b/meta/recipes-core/libxml/libxml2_2.9.1.bb
index fa9c657..3b031a1 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.1.bb
@@ -1,6 +1,9 @@
 require libxml2.inc
 
-SRC_URI += "file://libxml2-CVE-2012-2871.patch \
+LIBXML2_CVE = "file://libxml2-CVE-2012-2871.patch"
+LIBXML2_CVE_linuxstdbase = ""
+
+SRC_URI += "${LIBXML2_CVE} \
             http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
 	   "
 
-- 
1.8.1.2


