Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6057548B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 10:53:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41424598"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jun 2018 18:53:50 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E88CC4B34D54
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 18:53:47 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Sat, 23 Jun 2018 18:53:50 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 24 Jun 2018 03:52:58 +0800
Message-ID: <1529783581-46179-6-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: E88CC4B34D54.A7B07
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH 5/8][PATCH v2] createrepo-c: Add nativesdk
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
X-List-Received-Date: Sat, 23 Jun 2018 10:53:49 -0000
Content-Type: text/plain

Add nativesdk for createrepo-c.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/createrepo-c/createrepo-c_git.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
index 3176136..9be9f9e 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_git.bb
@@ -21,7 +21,7 @@ inherit cmake pkgconfig bash-completion distutils3-base
 
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 # Direct createrepo to read rpm configuration from our sysroot, not the one it was compiled in
 do_install_append_class-native() {
@@ -29,3 +29,8 @@ do_install_append_class-native() {
                 RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm
 }
 
+do_install_append_class-nativesdk() {
+        create_wrapper ${D}/${bindir}/createrepo_c \
+                RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm
+        rm -rf ${D}/etc
+}
-- 
2.7.4




