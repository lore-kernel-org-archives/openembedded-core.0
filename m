Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 737EF73219
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:19 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id r187so5033500pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=2OH7wxbzwIuNQJzmlSXVQmUlYYra1BYaKwipRguWIVY=;
	b=smWTDyfI63mSEzxNVqCG8pNwDl2Qq2NSzInP0Yr1d1HgdoQEugIPNBjbes0jprQ0ZP
	mNw2V3i7gZkncnmpRaEj+VRlgZOwCjuT1HZp7onSnvxUa8UHT4rX/pnlUgWGEd5l6Mhf
	5upH17WYyatKLkU/4L+FGjQFvXdyu+IxffFathsrwc6rMrwm+16H7qilLAKmsF4ZOqW8
	Obd8vS4UahGtwC3LpulVgk07Ov3aOoRnFJOZrGBmjoIMtYQq36ml+5R39b29/WK2R+7h
	OezOdqemznlqvXXdFiiDGG1RbdzvzAfU3cbmtV1lfXECM+//TUewWvLC3IOemR69wrh6
	ctyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=2OH7wxbzwIuNQJzmlSXVQmUlYYra1BYaKwipRguWIVY=;
	b=LmBmC9iUBhmX/uFi5szMUhtIEJjJiItKmm6M8Ga/3g4kgApqhaatxJw+5tCa66I6pw
	pZ1+Npb2lWhHEqtTvPiTJOjE1WDe7y4c+oSM/nFaDDMxf96jvWY9QuzCEHDJqcsEGc1Z
	WNkvkNJLlSmyMD9UnHQh1c3KwjDtVc7lveHal4oBZOSFxpZGpAPL5NE4LPfdewfzkcYk
	kAFOEoqAVEKrwsByCbC+2J4ZkK9GgBD8AxEMczS2wY5ZALRO9+upkkA05225diQXOgyZ
	x3eAa/7qtL69crr6O2CopVxBd9AfM2ZsY7v8LGohyqhTmNoUqFqXxO0MzLZrJ9e+slPR
	V0Cw==
X-Gm-Message-State: AOPr4FU9rJEvOGO8Aymy/llZcP//HHrvmuJV9RMe7UcZZ3Kek6VPz2OO2GU6BHAKbv/+ug==
X-Received: by 10.98.27.129 with SMTP id b123mr6752811pfb.111.1462988180514;
	Wed, 11 May 2016 10:36:20 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:31 -0700
Message-Id: <76190162922fd9826e52de43dadbf79c2cb2364c.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 28/42] libgcc: Ensure that gcc configure options are passed to libgcc too
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
X-List-Received-Date: Wed, 11 May 2016 17:36:19 -0000

libgcc uses certain options from EXTRA_OECONF as well, curently we are
ignoring them, as a result we do not configure libgcc to match cross gcc
in some cases e.g. ppc/musl should have used 64bit long doubles but
it went for 128-ldbls which is default, works on glibc but not on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc    | 2 ++
 meta/recipes-devtools/gcc/libgcc-common.inc | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index e4fd4d6..f540b4d 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -33,6 +33,8 @@ def get_gcc_ppc_plt_settings(bb, d):
 def get_long_double_setting(bb, d):
     if d.getVar('TRANSLATED_TARGET_ARCH', True) in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC', True) in [ 'uclibc', 'glibc' ]:
         return "--with-long-double-128"
+    else:
+        return "--without-long-double-128"
     return ""
 
 def get_gcc_multiarch_setting(bb, d):
diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
index dae07e9..e6d31bc 100644
--- a/meta/recipes-devtools/gcc/libgcc-common.inc
+++ b/meta/recipes-devtools/gcc/libgcc-common.inc
@@ -4,6 +4,13 @@ require gcc-shared-source.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+EXTRA_OECONF += "\
+    ${@get_gcc_mips_plt_setting(bb, d)} \
+    ${@get_gcc_ppc_plt_settings(bb, d)} \
+    ${@get_long_double_setting(bb, d)} \
+    ${@get_gcc_multiarch_setting(bb, d)} \
+"
+
 do_configure () {
 	target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
 	install -d ${D}${base_libdir} ${D}${libdir}
-- 
2.8.2


