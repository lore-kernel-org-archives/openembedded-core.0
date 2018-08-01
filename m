Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5243678D07
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 05:57:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w715v3C7021725
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 22:57:03 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 31 Jul 2018 22:57:02 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 13:57:01 +0800
Message-ID: <1533103021-279891-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libxml2: fix libxml2 ptest fails
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
X-List-Received-Date: Wed, 01 Aug 2018 05:57:02 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

for core-image-minimal image,  missing these two dependency
will cause below warning and error:

warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
./test/icu_parse_test.xml generated an error

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/libxml/libxml2_2.9.8.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index 1f22bb0..27a648e 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -44,7 +44,12 @@ RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG', 'python', 'l
 
 RDEPENDS_${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
 
-RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-ebcdic-us glibc-gconv-ibm1141 glibc-gconv-iso8859-5"
+RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-gconv-ebcdic-us \
+                                           glibc-gconv-ibm1141 \
+                                           glibc-gconv-iso8859-5 \
+                                           glibc-gconv-euc-jp \
+                                           locale-base-en-us \
+                                         "
 
 export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
 
-- 
2.7.4


