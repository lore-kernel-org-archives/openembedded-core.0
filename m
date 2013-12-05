Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26A5C6E241
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 23:52:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB5NqtCf025331
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 15:52:56 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 15:52:55 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 17:52:19 -0600
Message-ID: <9949be5306f05cc86c941a4ca54b17d0c7a671e1.1386287395.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386287394.git.mark.hatle@windriver.com>
References: <cover.1386287394.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 6/6][master] icu: CVE-2013-2924
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
X-List-Received-Date: Thu, 05 Dec 2013 23:52:56 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Use-after-free vulnerability in International Components for Unicode (ICU),
as used in Google Chrome before 30.0.1599.66 and other products, allows
remote attackers to cause a denial of service or possibly have unspecified
other impact via unknown vectors.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-2924

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 ...fer_length_check_to_UTF_16_or_32_detector.patch | 33 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_51.2.bb               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch

diff --git a/meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch b/meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch
new file mode 100644
index 0000000..ad4d61c
--- /dev/null
+++ b/meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch
@@ -0,0 +1,33 @@
+--- source/i18n/csrucode.cpp
++++ source/i18n/csrucode.cpp
+@@ -33,8 +33,9 @@ UBool CharsetRecog_UTF_16_BE::match(Inpu
+ {
+     const uint8_t *input = textIn->fRawInput;
+     int32_t confidence = 0;
++    int32_t length = textIn->fRawLength;
+ 
+-    if (input[0] == 0xFE && input[1] == 0xFF) {
++    if (length >=2 && input[0] == 0xFE && input[1] == 0xFF) {
+         confidence = 100;
+     }
+ 
+@@ -57,8 +58,9 @@ UBool CharsetRecog_UTF_16_LE::match(Inpu
+ {
+     const uint8_t *input = textIn->fRawInput;
+     int32_t confidence = 0;
++    int32_t length = textIn->fRawLength;
+ 
+-    if (input[0] == 0xFF && input[1] == 0xFE && (input[2] != 0x00 || input[3] != 0x00)) {
++    if (length >= 4 && input[0] == 0xFF && input[1] == 0xFE && (input[2] != 0x00 || input[3] != 0x00)) {
+         confidence = 100;
+     }
+ 
+@@ -81,7 +83,7 @@ UBool CharsetRecog_UTF_32::match(InputTe
+     bool hasBOM = FALSE;
+     int32_t confidence = 0;
+ 
+-    if (getChar(input, 0) == 0x0000FEFFUL) {
++    if (limit > 0 && getChar(input, 0) == 0x0000FEFFUL) {
+         hasBOM = TRUE;
+     }
+ 
diff --git a/meta/recipes-support/icu/icu_51.2.bb b/meta/recipes-support/icu/icu_51.2.bb
index aca3ea5..aabe07b 100644
--- a/meta/recipes-support/icu/icu_51.2.bb
+++ b/meta/recipes-support/icu/icu_51.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://../license.html;md5=443a74288a72fad9069a74e7637192c1"
 BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-51_2-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
+           file://add_buffer_length_check_to_UTF_16_or_32_detector.patch \
           "
 
 SRC_URI[md5sum] = "072e501b87065f3a0ca888f1b5165709"
-- 
1.8.3.4


