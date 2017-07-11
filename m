Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2C32E780E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 21:56:33 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id r103so7666308wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=veNUgYSynHV+TDVCvgQVv+RZvfPxXtO4GO+8rpUSPrc=;
	b=V77LXPtwUybgtYAjf5G8dFPqATXyQZGLBgZRuzQiRoUlV1h8h7m/SJRgak29FFw2sb
	l/1Gml8VQNXBd+/2wyo96KmiFS6t4fwDwdYERvTB/hjPv6m1eawrWjEJMjaW7uSVs8Ex
	/IvD+mp9W0FLxxK1dHHg5tqiFhizEIvpzpeV0yWEyknSfTvhD8t2rtJ4+rMGYYYLWx51
	yuUhv0NOoYe3WLys2LqCa1Q19OPNaZkhceZ0EKu/ByOqPt92PhhRJxgNgG6oJgMe0cWD
	qZU+N6obJJS5xdWeyEC0vP/XMHqgSBLICIXnIaaP4bXj7/c7F/AOumSDe7WkKs/I4NF0
	Agqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=veNUgYSynHV+TDVCvgQVv+RZvfPxXtO4GO+8rpUSPrc=;
	b=PT+AQ0XED9jecZQ2elcBR4DmFcfbxzgOdagmchIyp2MqZunkCRpNafqUl5OlrckGhf
	hQkjMurDXJVNMGL5udWvc5ghRTNbfBe9rhdsN2PY4/WBxBEK71a+HsRCeKVm9oO+4t6X
	PLhdaPTbZPnAw+RprYw5/EYFeQXN8fI82QtO3jorGfF/Le+qJBrK/umaxbVmEEC+8BAj
	S/Qsk79FhXBbSLWQmzWkTpjljcxjnkG/LR20MoYZs/VFABZVN8x+CMtOxfK1+xdTGzVi
	gHAD1LkKNam7sdm2avw/ptHjkyMDr0ya4qYC+I4HUekwNRf/YFbGKv2PBnC2oh4P+dDm
	JHJQ==
X-Gm-Message-State: AIVw110P1owI6RMqqMyuQWZ/dom4sE3rhf5638+zBZYVFpuhTWNDC8Dr
	SickqaZeQ4tt5clwucw=
X-Received: by 10.223.143.77 with SMTP id p71mr1005027wrb.3.1499810194565;
	Tue, 11 Jul 2017 14:56:34 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 82sm502454wmt.17.2017.07.11.14.56.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 14:56:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 22:56:31 +0100
Message-Id: <20170711215631.1527-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] valgrind: fix link failure with gold
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
X-List-Received-Date: Tue, 11 Jul 2017 21:56:34 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../valgrind/valgrind/link-gz-tests.patch          | 25 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/link-gz-tests.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/link-gz-tests.patch b/meta/recipes-devtools/valgrind/valgrind/link-gz-tests.patch
new file mode 100644
index 00000000000..b55c9043cd5
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/link-gz-tests.patch
@@ -0,0 +1,25 @@
+When checking if the compiler supports compressed debug sections we need to actually link instead of just compile.  Otherwise the compiler thinks that they are supported, but gold does not support -gz=zlib.
+
+Upstream-Status: Submitted (https://bugs.kde.org/show_bug.cgi?id=382256)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- a/configure.ac~	2017-07-11 11:53:16.000000000 +0100
++++ b/configure.ac	2017-07-11 18:16:13.674130483 +0100
+@@ -2119,7 +2119,7 @@
+ safe_CFLAGS=$CFLAGS
+ CFLAGS="-g -gz=zlib"
+ 
+-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[ ]], [[
++AC_LINK_IFELSE([AC_LANG_PROGRAM([[ ]], [[
+   return 0;
+ ]])], [
+ ac_have_gz_zlib=yes
+@@ -2139,7 +2139,7 @@
+ safe_CFLAGS=$CFLAGS
+ CFLAGS="-g -gz=zlib-gnu"
+ 
+-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[ ]], [[
++AC_LINK_IFELSE([AC_LANG_PROGRAM([[ ]], [[
+   return 0;
+ ]])], [
+ ac_have_gz_zlib_gnu=yes
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index b63d27861d5..0cc5eefc88e 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch \
            file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch \
            file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch \
+           file://link-gz-tests.patch \
            "
 SRC_URI_append_libc-musl = "\
            file://0001-fix-build-for-musl-targets.patch \
-- 
2.11.0


