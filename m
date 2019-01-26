Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C10407C2E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 21:42:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w73so6251644pfk.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 13:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M3jJjabcAZe3cjkZ0Iw3IV8SDCHlgz76mBDA9W9/NmM=;
	b=qLp1s2sZ+4DPabnWHNIIrUN+xqEa1x3tVmEc363S7szXGRskYgfDiy2g5CRic6I7Gd
	XaRxeXQNO4WMlVcJXPo9BADVvgBrcVE31p9jS6jPYnVOndVFDkuw+6rd0laJzHd/0wo1
	5EKO4xFZqASSwahfCSrD7UWE74xjljxD/9PyVTv4umQ3VQE6ChcFYSxkhM8J/AnUqFK/
	oqcMP5hDsLU2Tk0l4xO/Ab9xjKZXNFW6VX2Oyx8msW+Eq9+FnXyUU49R/erJv/wLrbBV
	D1s4of4QIx58RxKonj3whlnGDdgPL6Yhh1ZPkDFwCcjjCM9X/Wsv1uKNJW3DxufiR+4p
	wgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M3jJjabcAZe3cjkZ0Iw3IV8SDCHlgz76mBDA9W9/NmM=;
	b=GUQHM3KiwWmOphqbLpdpYwQt+9NhDmMAI6P4AcJ65zTIQTzpZ964z2LN6VZuysWQzt
	gm1RyFZ66Mxmx9lYlqTjofZT/21OBiPE8kc3Epw18PDMZst8AoTw0FvFb+DexDmq3UEE
	MHub0jS0GvSc/TyxcoQmYr0fjdY/5ZJ+TLjOwKZGID6KbVeLGuBSNRGLmNqler+h8y2e
	yjy99puG7KwBmux8gDMyWUV65AhAEH09REa8LroiPM7GJcTNMqK706DPrqviYxzI4byM
	kRbpg88oW+gQSEPgbP4dDFqMus5/XiLIGsHckdq4+sa+Bf5T5Mal7vB4j3hrnqsBER4q
	8tdg==
X-Gm-Message-State: AJcUukdsGG1l0e5qYnMrp/pRpOofxAEA/R2j12T5nlfGgFuhcpNhKNTP
	BToG2kY6I1zksVvsbIqXu1jN2oj93hU=
X-Google-Smtp-Source: ALg8bN70Kf2jLCTPA2+XzNkdRDd+TY86lCvQs5KUP9ji+SzY2yDj1AncMxmGxHzJ4fjuWpo8PEWDzg==
X-Received: by 2002:a63:2b01:: with SMTP id r1mr14507168pgr.432.1548538931987; 
	Sat, 26 Jan 2019 13:42:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	e24sm34832472pfi.153.2019.01.26.13.42.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Jan 2019 13:42:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Jan 2019 13:41:59 -0800
Message-Id: <20190126214159.38217-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libtool: Fix ignoring compiler-rt libs
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
X-List-Received-Date: Sat, 26 Jan 2019 21:42:12 -0000
Content-Transfer-Encoding: 8bit

This is a limitation of libtool where it is not aware of compiler-rt
being a compiler internal library, this patch fixes it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtool/libtool-2.4.6.inc                 |  1 +
 ...r-static-libs-for-internal-compiler-.patch | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-libtool-Check-for-static-libs-for-internal-compiler-.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index f307a10751..8e17b56d46 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://nohardcodepaths.patch \
            file://unwind-opt-parsing.patch \
            file://0001-libtool-Fix-support-for-NIOS2-processor.patch \
+           file://0001-libtool-Check-for-static-libs-for-internal-compiler-.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/0001-libtool-Check-for-static-libs-for-internal-compiler-.patch b/meta/recipes-devtools/libtool/libtool/0001-libtool-Check-for-static-libs-for-internal-compiler-.patch
new file mode 100644
index 0000000000..8c7c39feb6
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/0001-libtool-Check-for-static-libs-for-internal-compiler-.patch
@@ -0,0 +1,37 @@
+From 40a2da75e6d95cc7c498ebda95ab19ae0db2ebfb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Jan 2019 12:54:26 -0800
+Subject: [PATCH] libtool: Check for static libs for internal compiler
+ libraries
+
+Libtool checks only for libraries linked as -l* when trying to
+find internal compiler libraries. Clang, however uses the absolute
+path to link its internal libraries e.g. compiler_rt. This patch
+handles clang's statically linked libraries when finding internal
+compiler libraries.
+
+https://crbug.com/749263
+
+Upstream-Status: Submitted [https://debbugs.gnu.org/cgi/bugreport.cgi?bug=27866]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4/libtool.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/libtool.m4 b/m4/libtool.m4
+index d0389a0..9619c57 100644
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -7536,7 +7536,7 @@ if AC_TRY_EVAL(ac_compile); then
+   for p in `eval "$output_verbose_link_cmd"`; do
+     case $prev$p in
+ 
+-    -L* | -R* | -l*)
++    -L* | -R* | -l* | */libclang_rt.*.a)
+        # Some compilers place space between "-{L,R}" and the path.
+        # Remove the space.
+        if test x-L = "$p" ||
+-- 
+2.20.1
+
-- 
2.20.1


