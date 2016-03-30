Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 838E26072C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:19:27 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id y89so30527022qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 22:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=C2JZJGlrh33QhMMZNa+RLDx2N+tzdkK+RhwGh14bXNc=;
	b=sb6yfsJhVbnvvWeaRm+zAQyyTZFqhdxyhtHOWi4vkVMcsCEkt4WcjxNMrbsIQHSDtg
	A+FcnjdPFjY9mlQLiEHJuH8f93zzAEAVwpOYAz8UIGHYEnkrCV+qza1+NSVJb32jQTak
	rZzP5u8e6Im7DBIQ0r48jtQsCw1+p3jDR684Q3MOObjTjbHQjzLeJHlu3xdFJyUN2naV
	7OLw8gKXAIGWJmZa7pfpvsup4lu7WOiWdf7qLLKARiLlkyJfZsEsloL/OWoIMBFVtK9A
	h3ICrq1xqepYDNs39LEjYcpO2S+ABp68jVORHYxpfuvdkZHN6I1Ik3MlzH+QL/Twpp9a
	yblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C2JZJGlrh33QhMMZNa+RLDx2N+tzdkK+RhwGh14bXNc=;
	b=KV/I3uBAgW0C61zjCNQJNxO9dvl+2UZ6RZROB0x6tof/pF2H2YCEURVNooV7CvpuuK
	sCqVmO0jSeOWZIpRBZaVEfMfl5M5CqR+vLVoP3NWuFhgpn0eekLUBS6OfQoAWFTXq4wY
	/O9AS7JOFCiSxPIQukjz7W2uqhE28GBTOBudY4S2OxzF7kwUUfdQ4yZezjxDjeyDvaPI
	7JPEAkw14hDS55dEolp23vjjlaQR4T2voFYc3C+ljJFHOQMo+PMcXiaUcZRmVmFod2hF
	Ei4bj05gT8WNKHrpjuq+KhLhxOr19Rag3kzJLgRDWjavDjsOwEwrCxqyusCnsbdW1qR9
	BDCA==
X-Gm-Message-State: AD7BkJIoVBtZq/hW39FeKICgdFlkDWW01AcMf2868paal8yY1NPp6jAno412K67dL3ytrQ==
X-Received: by 10.140.82.20 with SMTP id g20mr7255939qgd.69.1459315168079;
	Tue, 29 Mar 2016 22:19:28 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	d187sm1016575qhc.38.2016.03.29.22.19.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Mar 2016 22:19:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 05:19:19 +0000
Message-Id: <1459315159-11179-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] gcc: Fix musl ldso name for mips64
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
X-List-Received-Date: Wed, 30 Mar 2016 05:19:35 -0000

Now we have mips64 port of musl and there is
a name for ldso, backport the fix from upstream
gcc master

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc-5.3/0045-Support-for-arm-linux-musl.patch  | 26 +++++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0045-Support-for-arm-linux-musl.patch b/meta/recipes-devtools/gcc/gcc-5.3/0045-Support-for-arm-linux-musl.patch
index 7f7307b..3c1115a 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3/0045-Support-for-arm-linux-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0045-Support-for-arm-linux-musl.patch
@@ -1,7 +1,9 @@
-From a32a7901315bf01d0605e43cb7d0427a6d7e4b75 Mon Sep 17 00:00:00 2001
+From a6c649571d49c972e6d207577780ada7e9b6bad5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 8 Dec 2015 08:31:52 +0000
-Subject: [PATCH 45/46] Support for arm-linux-musl.
+Subject: [PATCH 45/57] Support for arm-linux-musl.
+
+Fix musl ldso for all arches
 
 Upstream-Status: backport [partial]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -10,12 +12,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/config/arm/linux-eabi.h        | 17 +++++++++++++++++
  gcc/config/i386/linux.h            |  1 +
  gcc/config/i386/linux64.h          |  5 +++++
- gcc/config/mips/linux.h            |  6 +++++-
+ gcc/config/mips/linux.h            |  8 +++++++-
  gcc/config/rs6000/linux64.h        | 13 +++++++++----
  gcc/config/rs6000/sysv4.h          | 10 +++++++---
  libitm/config/arm/hwcap.cc         |  4 ++++
  libitm/config/linux/x86/tls.h      |  8 ++++++--
- 9 files changed, 55 insertions(+), 10 deletions(-)
+ 9 files changed, 57 insertions(+), 10 deletions(-)
 
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
 index f9e65fc..1b2d0c0 100644
@@ -80,21 +82,23 @@ index 6185cce..5a3a977 100644
 +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
 +
 diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index c306afb..44d4c12 100644
+index c306afb..b899388 100644
 --- a/gcc/config/mips/linux.h
 +++ b/gcc/config/mips/linux.h
-@@ -21,6 +21,10 @@ along with GCC; see the file COPYING3.  If not see
+@@ -21,6 +21,12 @@ along with GCC; see the file COPYING3.  If not see
  #define GNU_USER_LINK_EMULATION64 "elf64%{EB:b}%{EL:l}tsmip"
  #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
  
-+#define MUSL_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
-+#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
-+#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
++#undef MUSL_DYNAMIC_LINKER32
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-mips%{EL:el}%{msoft-float:-sf}.so.1"
++#undef MUSL_DYNAMIC_LINKER64
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-mips64%{EL:el}%{msoft-float:-sf}.so.1"
++#define MUSL_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld-musl-mipsn32%{EL:el}%{msoft-float:-sf}.so.1"
 +
  #define GLIBC_DYNAMIC_LINKER32 \
    "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
  #define GLIBC_DYNAMIC_LINKER64 \
-@@ -40,4 +44,4 @@ along with GCC; see the file COPYING3.  If not see
+@@ -40,4 +46,4 @@ along with GCC; see the file COPYING3.  If not see
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
    CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
@@ -208,5 +212,5 @@ index e731ab7..54ad8b6 100644
  
  #endif // LIBITM_X86_TLS_H
 -- 
-2.6.3
+2.7.4
 
-- 
1.8.3.1


