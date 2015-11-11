Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 71A5E77140
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 15:40:21 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so61664216wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IFMFCCt22Lx9tA9IsRXYrhlFjCozIIdjffGLeo/AExM=;
	b=WA8Bz+J1Q5bhPoWyqUARwEi8dcujXBHNT+hpEPuiH3Fmx98ApkhG98UwVfhy0elgtT
	EISrd0p+TLqHVGcYxwbBVqeKsWHO37ahnS7k1KuSo1w13garklY3rkT6ewxKeGzPGTWP
	QwxlhtS+2udKjM8gN9AWjhzAnIlZxEmhD3Z9CXTpPN43i+ErZ/dfj6BeH0M2INCNEc45
	e2Otk9xZkcJhx92bNWsf3f4cSb6LHgjPeyR9CyTyseGIT8U2ipLRhMrTZ+6BNsFDJkgs
	FKvQkEUpy/8aIMN37B4vZrVWOzhd4K6sdOv4KDQaP0NEvJEfEilRHngNM4LTolyRS2Ws
	ryEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IFMFCCt22Lx9tA9IsRXYrhlFjCozIIdjffGLeo/AExM=;
	b=Zj9a9oadVLyamZ2vIfF0rH0P6dpUmjX9b65KbTPtLNziZHHALnM18Tc0tl4LTS8wDy
	5hQ5A7Ioy2SZUkfNta9kFqlQRezot47qmrp2hoM/R+0evWAREU7asB25NGI/y9P6raR9
	wftfLUEqhy0uqh7kMU6vOtdeg5ctWKCrrscyfM6k0Da3U9weq+MMRpXuIsBTSQaF7I8/
	Pups39oP040wuxDeIFWl126IzJMy7qfvEgOUK5nYfH0Pp1J5keS5OIx7PhAN6NV/4UcC
	lz0sMPvyvheeHg2TOXKsx3OY5bDfvJgJQYI+TuG/grs2ixgEEYzP0hkCZZvEUuUAtv1Q
	9G1Q==
X-Gm-Message-State: ALoCoQmHwNR1US8ELEH7z18qtbiDiAh6AdK/HRXXy5vlmAde0nKXyE1my0Yk6lL5q/Hs1h4usOkc
X-Received: by 10.28.134.205 with SMTP id i196mr37337467wmd.17.1447256421020; 
	Wed, 11 Nov 2015 07:40:21 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e79sm25875470wmd.16.2015.11.11.07.40.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 07:40:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 15:32:01 +0000
Message-Id: <1447255921-9535-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447255921-9535-1-git-send-email-ross.burton@intel.com>
References: <1447255921-9535-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 2/2] openssl: use subdir= instead of moving files in do_configure_prepend()
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
X-List-Received-Date: Wed, 11 Nov 2015 15:40:22 -0000

For clarity and correctness of source archiving, don't move find.pl from WORKDIR
to S in do_configure_prepend but tell the fetcher to put it in the right place
when unpacking.

Also re-order the files in SRC_URI so that patches are grouped together.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 659e0bd..8e8d05f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 export DIRS = "crypto ssl apps engines"
 export OE_LDFLAGS="${LDFLAGS}"
 
-SRC_URI += "file://configure-targets.patch \
+SRC_URI += "file://find.pl;subdir=${BP}/util/ \
+            file://run-ptest \
+            file://configure-targets.patch \
             file://shared-libs.patch \
             file://oe-ldflags.patch \
             file://engines-install-in-libdir-ssl.patch \
@@ -29,11 +31,9 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl_fix_for_x32.patch \
             file://fix-cipher-des-ede3-cfb1.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
-            file://find.pl \
             file://openssl-fix-des.pod-error.patch \
             file://Makefiles-ptest.patch \
             file://ptest-deps.patch \
-            file://run-ptest \
             file://crypto_use_bigint_in_x86-64_perl.patch \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
@@ -53,10 +53,6 @@ FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
 PARALLEL_MAKE = ""
 PARALLEL_MAKEINST = ""
 
-do_configure_prepend() {
-  cp ${WORKDIR}/find.pl ${S}/util/find.pl
-}
-
 # The crypto_use_bigint patch means that perl's bignum module needs to be
 # installed, but some distributions (for example Fedora 23) don't ship it by
 # default.  As the resulting error is very misleading check for bignum before
-- 
2.1.4


