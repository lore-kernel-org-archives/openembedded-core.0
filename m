Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.18013.1586462473675735083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 13:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lFAdRCdY;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id c21so5662pfo.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 13:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JFArg1WJ5vp8AS8EFqSuJgj+ZObMWF/Ubqg6c0C06/8=;
        b=lFAdRCdYu2mEFBslnEp4/yy5R1nsjzzz87MCJ0WtBzvOj+ozR6ijcCUOIcxZRoU+9B
         0cUChARm4+0ZT5E5XvT8WnEv9vWrfwUtYslCUemd3VAS1LUbNTB8D7aHwf7Xykl2+YmH
         Z/QW45nrzazSAQPZfs7rchmKCzqIoiTkW4FQFFuX7O6Nem4wDPOf83tQQVyVCcleEqEH
         tvp8wZqaOoSeFreh+8l8C1Y17s2uC4ludgX8lbKuK1qcCHZDOXujgTTmLnU2cNTb/CjQ
         RolzQUsgxO/5WLaz9V5h6bHtaU+5dyTwW88vl0RcSSQH2K2JlSkWeL5gkuJhc3sWkPev
         qf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JFArg1WJ5vp8AS8EFqSuJgj+ZObMWF/Ubqg6c0C06/8=;
        b=p261bhnhuF2i3YdkxhuNpSfvP+Ik0MhVSSJTWkHDS19DM+YF0ErArtpmYFNAqk87va
         rVjLgUnLjI5GHpqk5FT3R4iaU6XztRadKsF4rx+gkUTsDpWdIUFVGkG/Gdqt0piQ7XCX
         1jTe4YKDpZ/71x8BOT5DY24hE/rnYOycedE2f9giHGlGQa9x6tQr/tOFoeiU0M+xksMk
         82Q0/Tl9/57lYHVDv8DlpNpWCqEf7q/+xUz49F+I3mhSmE7B2ssaqq2CedDjZFfkp+Ap
         sJjHOAqEb0cAnZ11Ubo2GlXQmsf/8llpsVQWPASbf40NatPM67olnCKqcpep5Q7luIGC
         ORxQ==
X-Gm-Message-State: AGi0PuboKbZXzFeaf6vpGnTVKyrcKyibzu0ijkvZcMUQ0y4eiT324FfE
	dWGv5gQKjNbvk2LCJ72MQ2R2o2nODLM=
X-Google-Smtp-Source: APiQypJcEzuaVyDmACCPWwzxxYC0OHfNHO/yvuJt9S/bg+vsPGiHzYL8VHkg7h8BvWZW4crmoUj1Aw==
X-Received: by 2002:a63:f91b:: with SMTP id h27mr1082654pgi.339.1586462472645;
        Thu, 09 Apr 2020 13:01:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id y10sm2583024pfm.201.2020.04.09.13.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 13:01:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libucontext: Bring in mips/mips64 support
Date: Thu,  9 Apr 2020 13:01:25 -0700
Message-Id: <20200409200126.791501-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Latest master 0.10.x+ has added support for mips/mips64, which should
help compile ruby on musl for these architectures

Switch SRC_URI to github upstream URI

Check for common arches before checking others in map_kernel_arch

Drop already upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/libucontext_git.bb | 46 +++++++++++------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index 92cb703b0b..6b4d6209b8 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -8,22 +8,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=864cc1445419406b7093e8e531c9515e"
 SECTION = "libs"
 DEPENDS = ""
 
-PV = "0.1.3+${SRCPV}"
-SRCREV = "e6b4d7516dae9b200e94fcfcb9ebc9331389655f"
-SRC_URI = "git://code.foxkit.us/adelie/libucontext.git;protocol=https \
-           file://0001-pass-LDFLAGS-to-link-step.patch \
-           file://0001-Makefile-Add-LIBDIR-variable.patch \
+PV = "0.10+${SRCPV}"
+SRCREV = "272d6821039813818595e9a3b909ce18f33a89ab"
+SRC_URI = "git://github.com/kaniini/libucontext \
 "
 
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = ".*-musl.*"
 
-valid_archs = "\
-i386 x86 \
-ppc powerpc powerpc64 ppc64  \
-arm aarch64 \
-s390 \
+valid_archs = " \
+    x86 x86_64  \
+    ppc ppc64   \
+    mips mips64 \
+    arm aarch64 \
+    s390x       \
 "
 
 def map_kernel_arch(a, d):
@@ -31,18 +30,19 @@ def map_kernel_arch(a, d):
 
     valid_archs = d.getVar('valid_archs').split()
 
-    if   re.match('(i.86|athlon)$', a):         return 'x86'
-    elif re.match('x86.64$', a):                return 'x86_64'
-    elif re.match('armeb$', a):                 return 'arm'
-    elif re.match('aarch64$', a):               return 'aarch64'
-    elif re.match('aarch64_be$', a):            return 'aarch64'
-    elif re.match('aarch64_ilp32$', a):         return 'aarch64'
-    elif re.match('aarch64_be_ilp32$', a):      return 'aarch64'
-    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):      return 'mips'
-    elif re.match('p(pc|owerpc)', a):           return 'ppc'
-    elif re.match('p(pc64|owerpc64)', a):       return 'ppc64'
-    elif re.match('riscv64$', a):               return 'riscv64'
-    elif a in valid_archs:                      return a
+    if a in valid_archs:                            return a
+    elif re.match('(i.86|athlon)$', a):             return 'x86'
+    elif re.match('x86.64$', a):                    return 'x86_64'
+    elif re.match('armeb$', a):                     return 'arm'
+    elif re.match('aarch64$', a):                   return 'aarch64'
+    elif re.match('aarch64_be$', a):                return 'aarch64'
+    elif re.match('aarch64_ilp32$', a):             return 'aarch64'
+    elif re.match('aarch64_be_ilp32$', a):          return 'aarch64'
+    elif re.match('mips(isa|)(32|)(r6|)(el|)$', a): return 'mips'
+    elif re.match('mips(isa|)64(r6|)(el|)$', a):    return 'mips64'
+    elif re.match('p(pc|owerpc)', a):               return 'ppc'
+    elif re.match('p(pc64|owerpc64)', a):           return 'ppc64'
+    elif re.match('riscv64$', a):                   return 'riscv64'
     else:
         if not d.getVar("TARGET_OS").startswith("linux"):
             return a
@@ -50,7 +50,7 @@ def map_kernel_arch(a, d):
 
 export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
 
-CFLAGS += "-Iarch/${ARCH}"
+CFLAGS += "-Iarch/${ARCH} -Iarch/common"
 
 EXTRA_OEMAKE = "CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}' LIBDIR='${base_libdir}'"
 
-- 
2.26.0

