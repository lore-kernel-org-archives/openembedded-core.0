Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D196DCDB479
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38265.1781858001904076452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FgmUwlZL;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so10734575e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781858000; x=1782462800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPV8LZJxt2/BzHqlQw2NU+uLao7DiBGwtVVLG5E+PVc=;
        b=FgmUwlZLw3zgHgk1zNdjpvfRtOtHKOfQOJPduwfA1HvPMleYIBuwxZ1ttz8P0XiQWN
         yTCG0lIeh4a8jnFIEg2F/o3NMVcaz8H+uqzxibqUCg0BWlXrMdGh3ybVmmpn5mykWbOW
         0daBNtdlIOjZIypx8qob4n+/BLWUPN/oKmdDCrK/E0AWwClz+UNUgd8r1q+kn8xNoQL+
         RSDp2Gnjd9ZXf84CuRPB4fwOsKvDevRU4JXjurevlqF7TNi19qboxJ1TlEzUAjf6ZvKt
         DLeizeRHD4DQT8EUfICO6AVNFPjYLHsSpxsmR1JNMmRYigafJnhQR6Xu6gv6uhM5kzEW
         CS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781858000; x=1782462800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lPV8LZJxt2/BzHqlQw2NU+uLao7DiBGwtVVLG5E+PVc=;
        b=XHHZRBF9XFFRDJls0qB1weOBQYE0KB1ogg1rzZe6SkFGGu8PV+RR7oL7udxT3ot3ew
         eafxokbKTf2gJUDZqPhmikcjR2nbvzfJEGdPzB74TU7IzJ2UDm2zpK2+PREoo6vQhrgu
         uQOVkFJfHZ6UJniQ0zdObDm43kM8+8Stz3VscNHgVEaYZf4H610d4HaDFpGfTjWdlqOM
         MHRKQiUTGlSbg2cyLT4GEGdEj7wGqZtkB2ETtkc/8QxSZtnqp9TVb5ot2WbNWb/I1EZl
         fvYkMniykZFhfcOSl6HJkhCis32NrVuGlHppuu+QX810B2rke0DHhb/7e/xTuPmk91yI
         yD1A==
X-Gm-Message-State: AOJu0YwlB2jPFBSaWynM4/edm5nWa7VdYT3I164e71tETuPAfpuKtrTj
	6vawXxCfaLc8BTEzkBuPGGpANoox7+FpbCb6Pgplq4jISHoYejtQLefDuvMj70ev
X-Gm-Gg: AfdE7cmQ/WeWLYKsJXa3/ycTAbzen13ZH8VXZyQfj6JhRPauLpzB2xxPrhRH4slRC2a
	NdFgDqHHbhckvc30Hw8v2dugXHrzcV/myefiqhBI03BSAV6cwVWAlhZBPsUUKa3tGMMvGC7Pnsa
	A4xe6u0Fb+qfpKCPyjFY7fw/Zw9T7+9dwaHyiBPRbZxParBZEYrb8+QDA2ZGGDYinK8GSnXI4gb
	E72BoBw9/mUXXVOeax/C2xzmIMTqWmgcXPfr9X+THU8X+fJ9tFNBcYap6FcC/ko4tXiT3Z9Y5Gi
	zAH+meLTGiESpfQHsgrJmbrW/gffhw9eX16Fkstg4OMHc5mbkVQzVfsVl9K231zyZ7GasS420Y/
	5p+JrJnkZIYBMcA/LgJ7mzWLlFzS3KKBL2S/xJh8KEGW/gojGwlli+/LOCkSEKVxwGFKQBssY3Q
	XcWQFdTYI3uORDSzGQgWAR13tmXRKqu26iHPqaCqjygFx0uedZ
X-Received: by 2002:a05:600c:a00f:b0:48a:7a10:4f17 with SMTP id 5b1f17b1804b1-4923ef47e5dmr50175725e9.6.1781857999858;
        Fri, 19 Jun 2026 01:33:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/15] ovmf: upgrade edk2-stable202511 -> edk2-stable202605
Date: Fri, 19 Jun 2026 10:32:57 +0200
Message-ID: <20260619083305.3505156-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239150

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...Tools-StringFuncs-fix-gcc-16-warning.patch |  43 --------
 ...ovmf-update-path-to-native-BaseTools.patch |   9 +-
 ...aseTools-EfiRom-fix-compiler-warning.patch |  45 --------
 ...ile-adjust-to-build-in-under-bitbake.patch |   9 +-
 .../ovmf/ovmf/0003-debug-prefix-map.patch     | 101 ++++--------------
 .../ovmf/ovmf/0004-reproducible.patch         |  29 +++--
 ...ceptionHandlerLib-fix-push-instructi.patch |  46 --------
 meta/recipes-core/ovmf/ovmf_git.bb            |   7 +-
 8 files changed, 43 insertions(+), 246 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-StringFuncs-=
fix-gcc-16-warning.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0002-BaseTools-EfiRom-fix-c=
ompiler-warning.patch
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptio=
nHandlerLib-fix-push-instructi.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-StringFuncs-fix-gcc=
-16-warning.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-StringFuncs-=
fix-gcc-16-warning.patch
deleted file mode 100644
index 38c26224df..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-StringFuncs-fix-gcc-16-war=
ning.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3597306191297b504683b83fe7750e49c6a2e836 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Thu, 29 Jan 2026 09:23:32 +0100
-Subject: [PATCH 1/2] BaseTools/StringFuncs: fix gcc 16 warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-StringFuncs.c: In function =E2=80=98SplitStringByWhitespace=E2=80=99:
-StringFuncs.c:113:15: error: variable =E2=80=98Item=E2=80=99 set but not u=
sed [-Werror=3Dunused-but-set-variable=3D]
-  113 |   UINTN       Item;
-      |               ^~~~
-
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Upstream-Status: Backport
----
- BaseTools/Source/C/Common/StringFuncs.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/BaseTools/Source/C/Common/StringFuncs.c b/BaseTools/Source/C/=
Common/StringFuncs.c
-index 53e44365e9..df02d9c808 100644
---- a/BaseTools/Source/C/Common/StringFuncs.c
-+++ b/BaseTools/Source/C/Common/StringFuncs.c
-@@ -110,7 +110,6 @@ SplitStringByWhitespace (
-   CHAR8       *EndOfSubString;=0D
-   CHAR8       *EndOfString;=0D
-   STRING_LIST *Output;=0D
--  UINTN       Item;=0D
- =0D
-   String =3D CloneString (String);=0D
-   if (String =3D=3D NULL) {=0D
-@@ -120,7 +119,7 @@ SplitStringByWhitespace (
- =0D
-   Output =3D NewStringList ();=0D
- =0D
--  for (Pos =3D String, Item =3D 0; Pos < EndOfString; Item++) {=0D
-+  for (Pos =3D String; Pos < EndOfString;) {=0D
-     while (isspace ((int)*Pos)) {=0D
-       Pos++;=0D
-     }=0D
---=20
-2.53.0
-
diff --git a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-Ba=
seTools.patch b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native=
-BaseTools.patch
index bc70c1ab91..7590c7b2bd 100644
--- a/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
+++ b/meta/recipes-core/ovmf/ovmf/0001-ovmf-update-path-to-native-BaseTools=
.patch
@@ -1,7 +1,7 @@
-From 89a7bfe82c9dea89fa7d859eb392aa414a365578 Mon Sep 17 00:00:00 2001
+From 7a517d144ead6a50baab6eaf7d6d763620243440 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Thu, 9 Jun 2016 02:23:01 -0700
-Subject: [PATCH 1/5] ovmf: update path to native BaseTools
+Subject: [PATCH] ovmf: update path to native BaseTools
=20
 BaseTools is a set of utilities to build EDK-based firmware. These utiliti=
es
 are used during the build process. Thus, they need to be built natively.
@@ -16,7 +16,7 @@ Upstream-Status: Inappropriate [oe-core cross compile spe=
cific]
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/OvmfPkg/build.sh b/OvmfPkg/build.sh
-index 30f4830173..ce4ffb20ab 100755
+index ed3ed001b4..15f13424e5 100755
 --- a/OvmfPkg/build.sh
 +++ b/OvmfPkg/build.sh
 @@ -24,7 +24,7 @@ then
@@ -28,6 +28,3 @@ index 30f4830173..ce4ffb20ab 100755
    echo $EDK_TOOLS_PATH
    source edksetup.sh BaseTools
  else
---=20
-2.47.3
-
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-EfiRom-fix-compiler=
-warning.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-EfiRom-fix-comp=
iler-warning.patch
deleted file mode 100644
index f463103661..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-EfiRom-fix-compiler-warnin=
g.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 9af06ef3cbb052b142f9660c2c01e7aeb401300c Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Mon, 8 Dec 2025 10:28:50 +0100
-Subject: [PATCH 2/2] BaseTools/EfiRom: fix compiler warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-New warning after updating gcc:
-
-EfiRom.c: In function =E2=80=98main=E2=80=99:
-EfiRom.c:78:17: error: assignment discards =E2=80=98const=E2=80=99 qualifi=
er from pointer target type [-Werror=3Ddiscarded-qualifiers]
-
-The assigned value is not used, so fix the warning by just removing it.
-
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Upstream-Status: Backport
----
- BaseTools/Source/C/EfiRom/EfiRom.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/BaseTools/Source/C/EfiRom/EfiRom.c b/BaseTools/Source/C/EfiRo=
m/EfiRom.c
-index fa7bf0e62e..6e903b3504 100644
---- a/BaseTools/Source/C/EfiRom/EfiRom.c
-+++ b/BaseTools/Source/C/EfiRom/EfiRom.c
-@@ -44,7 +44,6 @@ Returns:
-   FILE_LIST *FList;=0D
-   UINT32    TotalSize;=0D
-   UINT32    Size;=0D
--  CHAR8     *Ptr0;=0D
- =0D
-   SetUtilityName(UTILITY_NAME);=0D
- =0D
-@@ -75,7 +74,7 @@ Returns:
-   //=0D
-   if (mOptions.DumpOption =3D=3D 1) {=0D
-     if (mOptions.FileList !=3D NULL) {=0D
--      if ((Ptr0 =3D strstr ((CONST CHAR8 *) mOptions.FileList->FileName, =
DEFAULT_OUTPUT_EXTENSION)) !=3D NULL) {=0D
-+      if (strstr ((CONST CHAR8 *) mOptions.FileList->FileName, DEFAULT_OU=
TPUT_EXTENSION) !=3D NULL) {=0D
-         DumpImage (mOptions.FileList);=0D
-         goto BailOut;=0D
-       } else {=0D
---=20
-2.53.0
-
diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-=
build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-m=
akefile-adjust-to-build-in-under-bitbake.patch
index 27c4324b67..b8f4feae5f 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-makefile-adjust-to-build-i=
n-under-bitbake.patch
@@ -1,7 +1,7 @@
-From 8b4941871ccc88ed8b31eb7ffc097e1fe39fe57d Mon Sep 17 00:00:00 2001
+From 5f9cc244e566bd28a2a9c46454d206d795a02847 Mon Sep 17 00:00:00 2001
 From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
 Date: Fri, 26 Jul 2019 17:34:26 -0400
-Subject: [PATCH 2/5] BaseTools: makefile: adjust to build in under bitbake
+Subject: [PATCH] BaseTools: makefile: adjust to build in under bitbake
=20
 Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
@@ -18,7 +18,7 @@ Upstream-Status: Inappropriate [needs to be converted to =
in-recipe fixups]
  1 file changed, 7 insertions(+), 8 deletions(-)
=20
 diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Sour=
ce/C/Makefiles/header.makefile
-index 53e73abe53..0b3f9bbb2a 100644
+index d63f487724..0403f83f77 100644
 --- a/BaseTools/Source/C/Makefiles/header.makefile
 +++ b/BaseTools/Source/C/Makefiles/header.makefile
 @@ -151,35 +151,34 @@ endif
@@ -64,6 +64,3 @@ index 53e73abe53..0b3f9bbb2a 100644
  ifeq ($(HOST_ARCH), IA32)=0D
  #=0D
  # Snow Leopard  is a 32-bit and 64-bit environment. uname -m returns i386=
, but gcc defaults=0D
---=20
-2.47.3
-
diff --git a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch b/meta=
/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
index 18ea24802a..0f07aa1924 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-debug-prefix-map.patch
@@ -1,7 +1,7 @@
-From 640b1e443a1b400d32d9af0c478abbbaebd491f1 Mon Sep 17 00:00:00 2001
+From ce5cd61548663f85845b8c645f21185fc7419b1b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:56:28 +0200
-Subject: [PATCH 3/5] debug prefix map
+Subject: [PATCH] debug prefix map
=20
 We want to pass ${DEBUG_PREFIX_MAP} to gcc commands and also pass in
  --debug-prefix-map to nasm (we carry a patch to nasm for this). The
@@ -18,87 +18,30 @@ Upstream-Status: Submitted [https://github.com/tianocor=
e/edk2/pull/2202]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- BaseTools/Conf/tools_def.template | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
+ BaseTools/Conf/tools_def.template | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 90a389bdff..1e134b299a 100755
+index eca4cb82d0..7ccbb9c763 100644
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -833,7 +833,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
+@@ -925,7 +925,7 @@ NOOPT_*_*_OBJCOPY_ADDDEBUGFLAG     =3D --add-gnu-debug=
link=3D"$(DEBUG_DIR)/$(MODULE_
  *_*_*_DTC_PATH                     =3D DEF(DTC_BIN)=0D
  =0D
  # All supported GCC archs except LOONGARCH64 support -mstack-protector-gu=
ard=3Dglobal, so set that on everything except LOONGARCH64=0D
--DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common -fstack-protector=0D
-+DEFINE GCC_ALL_CC_FLAGS            =3D -g -Os -fshort-wchar -fno-builtin =
-fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h -fn=
o-common -fstack-protector ENV(GCC_PREFIX_MAP)=0D
- DEFINE GCC_IA32_X64_CC_FLAGS       =3D -mstack-protector-guard=3Dglobal=0D
- DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_FLAGS) -mabi=3Dlp64=
d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsigned-ch=
ar -ffunction-sections -fdata-sections=0D
- DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-sections -fd=
ata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-table=
s -fno-pic -fno-pie -ffixed-x18 -mstack-protector-guard=3Dglobal=0D
-@@ -845,8 +845,8 @@ DEFINE GCC_AARCH64_DLINK_FLAGS     =3D -Wl,--emit-relo=
cs -nostdlib -Wl,--gc-sectio
- DEFINE GCC_LOONGARCH64_DLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_COMMON) =
-z common-page-size=3D0x20=0D
- DEFINE GCC_AARCH64_ASLDLINK_FLAGS  =3D DEF(GCC_AARCH64_DLINK_FLAGS) -Wl,-=
-entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) -Wl,--defsym=3DPECOFF_HEA=
DER_SIZE=3D0 DEF(GCC_DLINK2_FLAGS_COMMON) -z common-page-size=3D0x20=0D
- DEFINE GCC_LOONGARCH64_ASLDLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_FLAGS=
) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
--DEFINE GCC_ASM_FLAGS               =3D -c -x assembler=0D
--DEFINE GCC_PP_FLAGS                =3D -E -x assembler-with-cpp -include =
AutoGen.h=0D
-+DEFINE GCC_ASM_FLAGS               =3D -c -x assembler ENV(GCC_PREFIX_MAP=
)=0D
-+DEFINE GCC_PP_FLAGS                =3D -E -x assembler-with-cpp -include =
AutoGen.h ENV(GCC_PREFIX_MAP)=0D
- DEFINE GCC_VFRPP_FLAGS             =3D -x c -E -DVFRCOMPILE --include $(M=
ODULE_NAME)StrDefs.h=0D
- DEFINE GCC_ASLPP_FLAGS             =3D -x c -E -include AutoGen.h=0D
- DEFINE GCC_ASLCC_FLAGS             =3D -x c -include AutoGen.h -fshort-wc=
har=0D
-@@ -980,7 +980,7 @@ DEFINE GCC5_LOONGARCH64_PP_FLAGS           =3D -mabi=
=3Dlp64d -march=3Dloongarch64 DEF(
- *_GCC48_IA32_DLINK2_FLAGS         =3D DEF(GCC48_IA32_DLINK2_FLAGS)=0D
- *_GCC48_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
- *_GCC48_IA32_OBJCOPY_FLAGS        =3D=0D
--*_GCC48_IA32_NASM_FLAGS           =3D -f elf32=0D
-+*_GCC48_IA32_NASM_FLAGS           =3D -f elf32 ENV(NASM_PREFIX_MAP)=0D
- =0D
-   DEBUG_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS)=0D
- RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable=0D
-@@ -1008,7 +1008,7 @@ RELEASE_GCC48_IA32_CC_FLAGS       =3D DEF(GCC48_IA32=
_CC_FLAGS) -Wno-unused-but-set
- *_GCC48_X64_DLINK2_FLAGS         =3D DEF(GCC48_X64_DLINK2_FLAGS)=0D
- *_GCC48_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
- *_GCC48_X64_OBJCOPY_FLAGS        =3D=0D
--*_GCC48_X64_NASM_FLAGS           =3D -f elf64=0D
-+*_GCC48_X64_NASM_FLAGS           =3D -f elf64 ENV(NASM_PREFIX_MAP)=0D
- =0D
-   DEBUG_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS)=0D
- RELEASE_GCC48_X64_CC_FLAGS       =3D DEF(GCC48_X64_CC_FLAGS) -Wno-unused-=
but-set-variable=0D
-@@ -1087,7 +1087,7 @@ RELEASE_GCC48_AARCH64_CC_FLAGS   =3D DEF(GCC48_AARCH=
64_CC_FLAGS) -Wno-unused-but-s
- *_GCC49_IA32_DLINK2_FLAGS         =3D DEF(GCC49_IA32_DLINK2_FLAGS)=0D
- *_GCC49_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
- *_GCC49_IA32_OBJCOPY_FLAGS        =3D=0D
--*_GCC49_IA32_NASM_FLAGS           =3D -f elf32=0D
-+*_GCC49_IA32_NASM_FLAGS           =3D -f elf32 ENV(NASM_PREFIX_MAP)=0D
- =0D
-   DEBUG_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS)=0D
- RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32_CC_FLAGS) -Wno-unuse=
d-but-set-variable -Wno-unused-const-variable=0D
-@@ -1115,7 +1115,7 @@ RELEASE_GCC49_IA32_CC_FLAGS       =3D DEF(GCC49_IA32=
_CC_FLAGS) -Wno-unused-but-set
- *_GCC49_X64_DLINK2_FLAGS         =3D DEF(GCC49_X64_DLINK2_FLAGS)=0D
- *_GCC49_X64_RC_FLAGS             =3D DEF(GCC_X64_RC_FLAGS)=0D
- *_GCC49_X64_OBJCOPY_FLAGS        =3D=0D
--*_GCC49_X64_NASM_FLAGS           =3D -f elf64=0D
-+*_GCC49_X64_NASM_FLAGS           =3D -f elf64 ENV(NASM_PREFIX_MAP)=0D
- =0D
-   DEBUG_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS)=0D
- RELEASE_GCC49_X64_CC_FLAGS       =3D DEF(GCC49_X64_CC_FLAGS) -Wno-unused-=
but-set-variable -Wno-unused-const-variable=0D
-@@ -1314,7 +1314,7 @@ RELEASE_GCCNOLTO_AARCH64_DLINK_XIPFLAGS =3D -z commo=
n-page-size=3D0x20
- *_GCC5_IA32_DLINK2_FLAGS         =3D DEF(GCC5_IA32_DLINK2_FLAGS) -no-pie=
=0D
- *_GCC5_IA32_RC_FLAGS             =3D DEF(GCC_IA32_RC_FLAGS)=0D
- *_GCC5_IA32_OBJCOPY_FLAGS        =3D=0D
--*_GCC5_IA32_NASM_FLAGS           =3D -f elf32=0D
-+*_GCC5_IA32_NASM_FLAGS           =3D -f elf32 ENV(NASM_PREFIX_MAP)=0D
- =0D
-   DEBUG_GCC5_IA32_CC_FLAGS       =3D DEF(GCC5_IA32_CC_FLAGS) -flto=0D
-   DEBUG_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X64_DLINK_FLAGS) -flto=
 -Os -Wl,-m,elf_i386,--oformat=3Delf32-i386=0D
-@@ -1346,7 +1346,7 @@ RELEASE_GCC5_IA32_DLINK_FLAGS    =3D DEF(GCC5_IA32_X=
64_DLINK_FLAGS) -flto -Os -Wl,
- *_GCC5_X64_DLINK2_FLAGS          =3D DEF(GCC5_X64_DLINK2_FLAGS)=0D
- *_GCC5_X64_RC_FLAGS              =3D DEF(GCC_X64_RC_FLAGS)=0D
- *_GCC5_X64_OBJCOPY_FLAGS         =3D=0D
--*_GCC5_X64_NASM_FLAGS            =3D -f elf64=0D
-+*_GCC5_X64_NASM_FLAGS            =3D -f elf64 ENV(NASM_PREFIX_MAP)=0D
- =0D
-   DEBUG_GCC5_X64_CC_FLAGS        =3D DEF(GCC5_X64_CC_FLAGS) -flto -DUSING=
_LTO=0D
-   DEBUG_GCC5_X64_DLINK_FLAGS     =3D DEF(GCC5_X64_DLINK_FLAGS) -flto -Os=
=0D
---=20
-2.47.3
-
+-DEFINE GCC_ALL_CC_COMMON               =3D -g -Os -fshort-wchar -fno-buil=
tin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h=
 -fno-common -fstack-protector=0D
++DEFINE GCC_ALL_CC_COMMON               =3D -g -Os -fshort-wchar -fno-buil=
tin -fno-strict-aliasing -Wall -Werror -Wno-array-bounds -include AutoGen.h=
 -fno-common -fstack-protector ENV(GCC_PREFIX_MAP)=0D
+ DEFINE GCC_IA32_X64_CC_FLAGS           =3D -mstack-protector-guard=3Dglob=
al=0D
+ DEFINE GCC_LOONGARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_COMMON) -mabi=
=3Dlp64d -fno-asynchronous-unwind-tables -Wno-address -fno-short-enums -fsi=
gned-char -ffunction-sections -fdata-sections -march=3Dloongarch64 -mno-mem=
cpy -Werror -Wno-maybe-uninitialized -Wno-stringop-overflow -Wno-pointer-to=
-int-cast -no-pie -fno-stack-protector -mno-explicit-relocs -mno-relax=0D
+ DEFINE GCC_AARCH64_CC_COMMON           =3D DEF(GCC_ALL_CC_COMMON) -mlittl=
e-endian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-section=
s -fdata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-=
tables -fno-pic -fno-pie -ffixed-x18 -mstack-protector-guard=3Dglobal=0D
+@@ -936,8 +936,8 @@ DEFINE GCC_AARCH64_DLINK_COMMON        =3D -Wl,--emit-=
relocs -nostdlib -Wl,--gc-se
+ DEFINE GCC_LOONGARCH64_DLINK_COMMON    =3D -Wl,--emit-relocs -nostdlib -W=
l,--gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(=
DEST_DIR_DEBUG)/$(BASE_NAME).map -z common-page-size=3D0x20=0D
+ DEFINE GCC_AARCH64_ASLDLINK_COMMON     =3D DEF(GCC_AARCH64_DLINK_COMMON) =
-Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) -Wl,--defsym=3DPECOF=
F_HEADER_SIZE=3D0 DEF(GCC_DLINK2_FLAGS_COMMON) -z common-page-size=3D0x20=0D
+ DEFINE GCC_LOONGARCH64_ASLDLINK_COMMON =3D DEF(GCC_LOONGARCH64_DLINK_COMM=
ON) -Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT)=0D
+-DEFINE GCC_ASM_COMMON                  =3D -c -x assembler=0D
+-DEFINE GCC_PP_FLAGS                    =3D -E -x assembler-with-cpp -incl=
ude AutoGen.h=0D
++DEFINE GCC_ASM_COMMON                  =3D -c -x assembler ENV(GCC_PREFIX=
_MAP)=0D
++DEFINE GCC_PP_FLAGS                    =3D -E -x assembler-with-cpp -incl=
ude AutoGen.h ENV(GCC_PREFIX_MAP)=0D
+ DEFINE GCC_VFRPP_FLAGS                 =3D -x c -E -DVFRCOMPILE --include=
 $(MODULE_NAME)StrDefs.h=0D
+ DEFINE GCC_ASLPP_FLAGS                 =3D -x c -E -include AutoGen.h=0D
+ DEFINE GCC_ASLCC_COMMON                =3D -x c -include AutoGen.h -fshor=
t-wchar=0D
diff --git a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch b/meta/rec=
ipes-core/ovmf/ovmf/0004-reproducible.patch
index b42ecde211..68a49d90d5 100644
--- a/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
+++ b/meta/recipes-core/ovmf/ovmf/0004-reproducible.patch
@@ -1,7 +1,7 @@
-From 8b218dffa0368fbc2bfb5d8051b358476266fcb4 Mon Sep 17 00:00:00 2001
+From 8ae6441f19c71347acab1e789517035ee458449e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 14 Jun 2021 19:57:30 +0200
-Subject: [PATCH 4/5] reproducible
+Subject: [PATCH] reproducible
=20
 This patch fixes various things which make the build more reproducible. So=
me changes
 here only change intermediate artefacts but that means when you have two b=
uild trees
@@ -35,7 +35,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  4 files changed, 24 insertions(+), 16 deletions(-)
=20
 diff --git a/BaseTools/Source/C/GenFw/Elf64Convert.c b/BaseTools/Source/C/=
GenFw/Elf64Convert.c
-index 83f1b285c2..e2f582f8fb 100644
+index bf4baf05d7..295f3f6efb 100644
 --- a/BaseTools/Source/C/GenFw/Elf64Convert.c
 +++ b/BaseTools/Source/C/GenFw/Elf64Convert.c
 @@ -15,6 +15,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
@@ -47,7 +47,7 @@ index 83f1b285c2..e2f582f8fb 100644
  #endif=0D
  #include <assert.h>=0D
  #include <stdio.h>=0D
-@@ -995,7 +997,7 @@ ScanSections64 (
+@@ -996,7 +998,7 @@ ScanSections64 (
    }=0D
    mCoffOffset =3D mDebugOffset + sizeof(EFI_IMAGE_DEBUG_DIRECTORY_ENTRY) =
+=0D
                  sizeof(EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY) +=0D
@@ -56,7 +56,7 @@ index 83f1b285c2..e2f582f8fb 100644
  =0D
    //=0D
    // Add more space in the .debug data region for the DllCharacteristicsE=
x=0D
-@@ -2329,7 +2331,7 @@ WriteDebug64 (
+@@ -2330,7 +2332,7 @@ WriteDebug64 (
    EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY         *Nb10;=0D
    EFI_IMAGE_DEBUG_EX_DLLCHARACTERISTICS_ENTRY *DllEntry;=0D
  =0D
@@ -65,7 +65,7 @@ index 83f1b285c2..e2f582f8fb 100644
  =0D
    NtHdr =3D (EFI_IMAGE_OPTIONAL_HEADER_UNION *)(mCoffFile + mNtHdrOffset)=
;=0D
    DataDir =3D &NtHdr->Pe32Plus.OptionalHeader.DataDirectory[EFI_IMAGE_DIR=
ECTORY_ENTRY_DEBUG];=0D
-@@ -2362,7 +2364,7 @@ WriteDebug64 (
+@@ -2363,7 +2365,7 @@ WriteDebug64 (
  =0D
    Nb10 =3D (EFI_IMAGE_DEBUG_CODEVIEW_NB10_ENTRY*)(Dir + 1);=0D
    Nb10->Signature =3D CODEVIEW_SIGNATURE_NB10;=0D
@@ -89,10 +89,10 @@ index b829a2503c..afe826b78f 100644
          if Input not in self.Inputs:=0D
              self.Inputs.append(Input)=0D
 diff --git a/BaseTools/Source/Python/AutoGen/GenMake.py b/BaseTools/Source=
/Python/AutoGen/GenMake.py
-index e5f282c4ac..27a34ef7c6 100755
+index b729103efd..afc5b14a8a 100755
 --- a/BaseTools/Source/Python/AutoGen/GenMake.py
 +++ b/BaseTools/Source/Python/AutoGen/GenMake.py
-@@ -571,7 +571,7 @@ cleanlib:
+@@ -579,7 +579,7 @@ cleanlib:
                  os.remove(RespFileList)=0D
  =0D
          # convert source files and binary files to build targets=0D
@@ -101,7 +101,7 @@ index e5f282c4ac..27a34ef7c6 100755
          if len(self.ResultFileList) =3D=3D 0 and len(MyAgo.SourceFileList=
) !=3D 0:=0D
              EdkLogger.error("build", AUTOGEN_ERROR, "Nothing to build",=0D
                              ExtraData=3D"[%s]" % str(MyAgo))=0D
-@@ -722,7 +722,7 @@ cleanlib:
+@@ -730,7 +730,7 @@ cleanlib:
          OutputFile =3D ''=0D
          DepsFileList =3D []=0D
  =0D
@@ -110,7 +110,7 @@ index e5f282c4ac..27a34ef7c6 100755
              if Cmd[2]:=0D
                  for CopyCmd in Cmd[2]:=0D
                      Src, Dst =3D CopyCmd=0D
-@@ -755,7 +755,7 @@ cleanlib:
+@@ -763,7 +763,7 @@ cleanlib:
              self.BuildTargetList.append('\t%s' % CmdString)=0D
  =0D
              self.ParseSecCmd(DepsFileList, Cmd[1])=0D
@@ -119,7 +119,7 @@ index e5f282c4ac..27a34ef7c6 100755
                  self.BuildTargetList.append('%s : %s' % (self.ReplaceMacr=
o(SecOutputFile), self.ReplaceMacro(SecDepsFile)))=0D
                  self.BuildTargetList.append('\t%s' % self.ReplaceMacro(Se=
cCmd))=0D
              self.FfsOutputFileList =3D []=0D
-@@ -794,13 +794,13 @@ cleanlib:
+@@ -802,13 +802,13 @@ cleanlib:
  =0D
      def CommandExceedLimit(self):=0D
          FlagDict =3D {=0D
@@ -140,7 +140,7 @@ index e5f282c4ac..27a34ef7c6 100755
                     }=0D
  =0D
          RespDict =3D {}=0D
-@@ -1014,9 +1014,9 @@ cleanlib:
+@@ -1022,9 +1022,9 @@ cleanlib:
                  if not self.ObjTargetDict.get(T.Target.SubDir):=0D
                      self.ObjTargetDict[T.Target.SubDir] =3D set()=0D
                  self.ObjTargetDict[T.Target.SubDir].add(NewFile)=0D
@@ -153,7 +153,7 @@ index e5f282c4ac..27a34ef7c6 100755
                  if T.GenFileListMacro and T.FileListMacro not in self.Fil=
eListMacros:=0D
                      self.FileListMacros[T.FileListMacro] =3D []=0D
 diff --git a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py b/BaseTools/=
Source/Python/AutoGen/ModuleAutoGen.py
-index 764c51789b..40aadbcfbc 100755
+index c358d7f0e3..6ed48091fa 100755
 --- a/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 +++ b/BaseTools/Source/Python/AutoGen/ModuleAutoGen.py
 @@ -1429,6 +1429,9 @@ class ModuleAutoGen(AutoGen):
@@ -175,6 +175,3 @@ index 764c51789b..40aadbcfbc 100755
  =0D
          # Ignore generating makefile when it is a binary module=0D
          if self.IsBinaryModule:=0D
---=20
-2.47.3
-
diff --git a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandle=
rLib-fix-push-instructi.patch b/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg=
-CpuExceptionHandlerLib-fix-push-instructi.patch
deleted file mode 100644
index 650e084b5b..0000000000
--- a/meta/recipes-core/ovmf/ovmf/0005-UefiCpuPkg-CpuExceptionHandlerLib-fi=
x-push-instructi.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 7e6be0f4068a2158af3c97e873edb33fa4d5c6b8 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Mon, 3 Nov 2025 09:56:52 +0100
-Subject: [PATCH 5/5] UefiCpuPkg/CpuExceptionHandlerLib: fix push instructi=
ons
-
-Nasm 3.0 complains about 'dword' being invalid.  The comment talks about
-a '8-byte value' so 'qword' should be correct here.
-
-With this change the extra comment explaining that the instruction
-actually pushes an 8-byte value despite the 'dword' keyword is not
-needed any more.  Drop it.
-
-Fixes: https://github.com/tianocore/edk2/issues/11635
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/9ccf87=
51a74f26142e584c7b7c7572a182b67997]
-(cherry picked from commit 9ccf8751a74f26142e584c7b7c7572a182b67997)
-Signed-off-by: Ankur Tyagi <ankur.tyagi@navicogroup.com>
----
- .../CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.nasm       | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandle=
rAsm.nasm b/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerA=
sm.nasm
-index 3d64ac9080..671ed98f85 100644
---- a/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.na=
sm
-+++ b/UefiCpuPkg/Library/CpuExceptionHandlerLib/X64/ExceptionHandlerAsm.na=
sm
-@@ -57,7 +57,7 @@ ALIGN   8
- AsmIdtVectorBegin:=0D
- %assign Vector 0=0D
- %rep  256=0D
--    push    strict dword %[Vector] ; This instruction pushes sign-extende=
d 8-byte value on stack=0D
-+    push    strict qword %[Vector]=0D
-     push    rax=0D
- %ifdef NO_ABSOLUTE_RELOCS_IN_TEXT=0D
-     mov     rax, strict qword 0    ; mov     rax, ASM_PFX(CommonInterrupt=
Entry)=0D
-@@ -70,7 +70,7 @@ AsmIdtVectorBegin:
- AsmIdtVectorEnd:=0D
- =0D
- HookAfterStubHeaderBegin:=0D
--    push    strict dword 0      ; 0 will be fixed=0D
-+    push    strict qword 0      ; 0 will be fixed=0D
- VectorNum:=0D
-     push    rax=0D
- %ifdef NO_ABSOLUTE_RELOCS_IN_TEXT=0D
---=20
-2.47.3
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 25c857bdf9..bda33e2631 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -19,13 +19,10 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;bran=
ch=3Dmaster;protocol=3Dhttps;ta
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
-           file://0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instruct=
i.patch \
-           file://0001-BaseTools-StringFuncs-fix-gcc-16-warning.patch \
-           file://0002-BaseTools-EfiRom-fix-compiler-warning.patch \
            "
=20
-PV =3D "edk2-stable202511"
-SRCREV =3D "46548b1adac82211d8d11da12dd914f41e7aa775"
+PV =3D "edk2-stable202605"
+SRCREV =3D "b03a21a63e3bd001f52c527e5a57feddb53a690b"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>edk2-stable.*)"
=20
 CVE_PRODUCT =3D "edk2"
--=20
2.47.3


