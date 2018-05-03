Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDE474832
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 09:09:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39520887"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 May 2018 17:09:28 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D9FE14B314A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 17:09:24 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 3 May 2018 17:09:23 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 May 2018 17:09:17 +0800
Message-ID: <20180503090918.20964-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: D9FE14B314A2.A05D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] flex: update to 2.6.4.
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
X-List-Received-Date: Thu, 03 May 2018 09:09:30 -0000
Content-Type: text/plain

From: Lei Maohui <leimaohui@cn.fujitsu.com>

* Deleted 3 patches because these patches have been fixed in new version.
* Added "--disable-bootstrap" to avoid the build error of stage1flex on host.

stage1flex-misc.o: In function `allocate_array':
misc.c:(.text+0x38f): undefined reference to `reallocarray'
stage1flex-misc.o: In function `reallocate_array':
misc.c:(.text+0xc8a): undefined reference to `reallocarray'
collect2: error: ld returned 1 exit status


Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} (84%)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
similarity index 84%
rename from meta/recipes-devtools/flex/flex_2.6.0.bb
rename to meta/recipes-devtools/flex/flex_2.6.4.bb
index b89b751..4d59cc6 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -10,17 +10,14 @@ BBCLASSEXTEND = "native nativesdk"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/westes/flex/releases/download/v2.6.4/flex-${PV}.tar.gz \
            file://run-ptest \
-           file://do_not_create_pdf_doc.patch \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch \
-           file://CVE-2016-6354.patch \
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
            "
 
-SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
-SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
+SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
+SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
 
 # Flex has moved to github from 2.6.1 onwards
 UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
@@ -30,7 +27,9 @@ inherit autotools gettext texinfo ptest
 
 M4 = "${bindir}/m4"
 M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
-EXTRA_OECONF += "ac_cv_path_M4=${M4}"
+EXTRA_OECONF += "ac_cv_path_M4=${M4} \
+                 --disable-bootstrap \
+                "
 EXTRA_OEMAKE += "m4=${STAGING_BINDIR_NATIVE}/m4"
 
 EXTRA_OEMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', 'FLEX=${STAGING_BINDIR_NATIVE}/flex', '', d)}"
-- 
2.7.4




