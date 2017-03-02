Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id C7FDE7750C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 16:16:51 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n11so28690355wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 08:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=lrn1XTxgd3K08tMb/b58hGQprTUqkgtaCcP8XDBTu5A=;
	b=VDIedRF+5J/CeZH1dgQmFjwgiYFuvJK4VGaNOrcP6ILdXRvBXTZgM6a4LjZUzb5iSI
	EUox/oVooTFKWPCAWPICeUOKm+To1IRlLePsHZ/zsD+J/s3Rai72ew6FAVHwxZbxap3Q
	7L7MpCZk8+twvwvber4YwcQqN8EIRLZQfORZkfnX5DSSRNnPtTG8SXr73VWvWuuoUNJc
	YTLZJD6M+ZUif9Tic9yVQtf+lgkVJQtoO/XbCL+dO1ZTvW+7Mqr3FAh67gi9FK9aRxEM
	EN5YvEE96h0JddKCgIYB1byHw2HWYj3Wrhvi26Zq5xid4OoAH8dr01zgqeVgEBqVJ0eM
	Uqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lrn1XTxgd3K08tMb/b58hGQprTUqkgtaCcP8XDBTu5A=;
	b=N4zDI/+mPhtxv9cYmBeEWuzHPcW9cNrTP86LP61tDDp0hiMVz1Vp5Uqja3OazCXyY3
	5X/831OTouFw37Ic15xQpMF1jlTJSPNSEjpW8Z1DmI/k/yeYX3k4J5ax+mIJ4U/KNHKi
	VPkLrke3fCuhljwBxIJCv7mxZklMm2Zz7dpIlPkFXUQI03GPjAa7YuntUJRcrhvNxr1M
	dvt8v9knVN3w8PhLLQnk+CgTbd16OQbpQ5FSO8Qtj4PL8DnbPFu7wV2uo++4gpRIqQip
	s8kXsopaR4FxgBtKh/IKHs2sDVk2oqqsDF61whvT0EcEkjXo1BrINHgFtOZM9SNdUN7y
	TVPA==
X-Gm-Message-State: AMke39nJ+KHhAvCvevvwBOFkgns3nV86te4QxxONCn3pDCpPvFZnuEwc1D60Ca3NXuX3TiFG
X-Received: by 10.28.135.82 with SMTP id j79mr8641851wmd.19.1488471412139;
	Thu, 02 Mar 2017 08:16:52 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m201sm11838355wmd.19.2017.03.02.08.16.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Mar 2017 08:16:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Mar 2017 16:16:49 +0000
Message-Id: <1488471409-11114-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gcc-source: rewrite do_preconfigure() in shell
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
X-List-Received-Date: Thu, 02 Mar 2017 16:16:52 -0000

This function is essentially just four lines of shell, that for some reason was
written in Python.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index fab99f2..7dcdb75 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -1,8 +1,8 @@
-deltask do_configure 
-deltask do_compile 
-deltask do_install 
+deltask do_configure
+deltask do_compile
+deltask do_install
 deltask do_populate_sysroot
-deltask do_populate_lic 
+deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
 inherit nopackages
@@ -18,20 +18,17 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
 
-python do_preconfigure () {
-    import subprocess
-    cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+do_preconfigure() {
+    (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
+
     # See 0044-gengtypes.patch, we need to regenerate this file
-    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.c"))
-    cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    rm -f ${S}/gcc/gengtype-lex.c
+
+    sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure
 
     # Easiest way to stop bad RPATHs getting into the library since we have a
     # broken libtool here (breaks cross-canadian and target at least)
-    cmd = d.expand("sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure")
-    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
 }
 addtask do_preconfigure after do_patch
 do_preconfigure[depends] += "gnu-config-native:do_populate_sysroot autoconf-native:do_populate_sysroot"
-
-- 
2.8.1


