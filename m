Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 80BB47CE4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:45:38 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id e24so5033760itl.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AOdWs82pbulE1Z6gQXrLUaO6dvPLQ1WDiJcbJGsqEZs=;
	b=tinidymbiw8vbC55ak04EYCD0DnH7LeYnWoWBLL1pAdb7f2ZZPkywYNXnTjkQ+eu5c
	h40ms2pkJrg6eAhlvpdy9UAv/IKudfymrpEf/+3JJEZWbHqkMfhW7qYlrod/4WNPY79o
	IAZ5HLAu0cyrYnrGdbbZ+UymyZd8h9vFTy6Kb9NNteTSbV6B+uj7GIHQRWoTFVdg603W
	oMKM3FsbyAqWZkYarA5aUBmhPqBRBA7KQf2VuUOp3FRIbrFhKhwMoP+yQ23I3nx8bzNZ
	lF7o+ReQDtgY+Rp/QGc4kZct1vH65KdFilC0H06MKH4A6cTwyaqDfqOcAl7Tp2WemzPe
	GuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AOdWs82pbulE1Z6gQXrLUaO6dvPLQ1WDiJcbJGsqEZs=;
	b=ofCYi2wNfvIDdj1S7+GC2ZJKL8ErBRseMaMhV79DU0JDs9o3TdNkGH/MvZTBhUy332
	+Ct8LcKxHyijy/4OJUeiXXghO7chJ/Gunxp9l8X14Q09i4HeYNwAQ5wDHVUxdHXdEG7I
	jqpL7vSOVj+DarHD6jVdPOpnNfvk5Q5g2TCxQfz853oD/ddPfz6Z7BwmfDBLqgGQYMD+
	FBcYV6hkWV7dBJA7cCBoUet3pwuv29CyJmOi2XmjxTJCTpWj5In00qy0U6lEhuJiM0Tw
	kK5tn5EuT4kSvsvSF8Ef41WE+XVw258/gQzSLWpKa5WqkW9hsJyWeswMJkFjVbvDiwxE
	RcEw==
X-Gm-Message-State: APjAAAUl0tJZ+PsvG6gBb+c6tsHiryzOuNTVjh8zs3OqzCn5KkkYoSTQ
	TI72wyhxeFKfmIxTSNVg1kY=
X-Google-Smtp-Source: APXvYqxKNkLfAEZWiwtXZcZYQPeTy9H3iImHHocrFAu0qLt7k5ym3le1kliO9SarTOJnzTbW+G3AVw==
X-Received: by 2002:a24:304a:: with SMTP id q71mr13880059itq.4.1552275939243; 
	Sun, 10 Mar 2019 20:45:39 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	u197sm7612963itb.9.2019.03.10.20.45.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 20:45:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 10 Mar 2019 23:45:36 -0400
Message-Id: <20190311034537.7190-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.0: fix system tap for arm
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
X-List-Received-Date: Mon, 11 Mar 2019 03:45:38 -0000
Content-Transfer-Encoding: quoted-printable

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating Richard Purdie's kernel patch to fix systemtap on arm:

[
    arm/Makefile: Fix systemtap

    Currently systemtap fails to operate correctly on armv7 systems such as=
 beaglebone and
    soon, qemuarm.

    root@qemuarm:/usr/src/kernel# env -uARCH -uKBUILD_EXTMOD -uCROSS_COMPIL=
E -uKBUILD_IMAGE -uKCONFIG_CONFIG -uINSTALL_PATH -uLD_LIBRARY_PATH PATH=3D/=
usr/bin:/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin m=
ake -C /lib/modules/4.19.19-yocto-standard/build M=3D/tmp/staptcNU6M module=
s CONFIG_DEBUG_INFO=3D CONFIG_STACK_VALIDATION=3D ARCH=3Darm stap_4321_src.=
i --no-print-directory -j2 V=3D1
    test -e include/generated/autoconf.h -a -e include/config/auto.conf || =
(                \
    echo >&2;                                                       \
    echo >&2 "  ERROR: Kernel configuration is invalid.";           \
    echo >&2 "         include/generated/autoconf.h or include/config/auto.=
conf are missing.";\
    echo >&2 "         Run 'make oldconfig && make prepare' on kernel src t=
o fix it.";      \
    echo >&2 ;                                                      \
    /bin/false)
    mkdir -p /tmp/staptcNU6M/.tmp_versions ; rm -f /tmp/staptcNU6M/.tmp_ver=
sions/*
    make -f ./scripts/Makefile.build obj=3D/tmp/staptcNU6M
    (cat /dev/null;   echo kernel//tmp/staptcNU6M/stap_4321.ko;) > /tmp/sta=
ptcNU6M/modules.order
      gcc -Wp,-MD,/tmp/staptcNU6M/.stap_4321_src.o.d  -nostdinc -isystem /u=
sr/lib/gcc/arm-poky-linux-gnueabi/8.3.0/include -I./arch/arm/include -I./ar=
ch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./arch/ar=
m/include/generated/uapi -I./include/uapi -I./include/generated/uapi -inclu=
de ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D__=
KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -=
fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-dec=
laration -Wno-format-security -std=3Dgnu89 -fno-PIE -DCC_HAVE_ASM_GOTO -fno=
-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-s=
ra -mabi=3Daapcs-linux -mfpu=3Dvfp -funwind-tables -marm -Wa,-mno-warn-depr=
ecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv5t -Wa,-march=3Darmv7-a -msoft=
-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format=
-truncation -Wno-format-overflow -Wno-int-in-bool-context -Os -Wno-maybe-un=
initialized --param=3Dallow-store-data-races=3D0 -Wframe-larger-than=3D1024=
 -fstack-protector-strong -Wno-unused-but-set-variable -Wno-unused-const-va=
riable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-trackin=
g-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -Wno-stri=
ngop-truncation -fno-strict-overflow -fno-merge-all-constants -fmerge-const=
ants -fno-stack-check -fconserve-stack -Werror=3Dimplicit-int -Werror=3Dstr=
ict-prototypes -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -We=
rror=3Ddesignated-init -fmacro-prefix-map=3D./=3D -Wno-packed-not-aligned -=
Iinclude2/asm/mach-default -I/lib/modules/4.19.19-yocto-standard/build -inc=
lude /tmp/staptcNU6M/stapconf_4321.h -D "STP_NO_VELREL_CHECK" -freorder-blo=
cks -fasynchronous-unwind-tables -Wframe-larger-than=3D512 -fno-ipa-icf -Wn=
o-unused -Wno-tautological-compare -Werror -I/usr/share/systemtap/runtime  =
-DMODULE  -DKBUILD_BASENAME=3D'"stap_4321_src"' -DKBUILD_MODNAME=3D'"stap_4=
321"' -c -o /tmp/staptcNU6M/stap_4321_src.o /tmp/staptcNU6M/stap_4321_src.c
    /tmp/ccaE9CMG.s: Assembler messages:
    /tmp/ccaE9CMG.s:49: Error: selected processor does not support `dmb ish=
' in ARM mode
    /tmp/ccaE9CMG.s:52: Error: architectural extension `mp' is not allowed =
for the current b

    (which was from running the stap command with -v -v -v -k and then bein=
g able to run the command individually)

    Note that it says armv5t above.

    That comes from the code this patch changes

    root@qemuarm:/usr/src/kernel# gcc -march=3Darmv7-a /tmp/staptcNU6M/stap=
_4321_aux_0.c
    cc1: error: -mfloat-abi=3Dhard: selected processor lacks an FPU

    which makes me wonder if cc-option fails unless -mfpu-vfp is on the com=
mandline too.

    Since we have a gcc which accepts the armv7-a arch, just remove the cc-=
option
    wrapper unconditionally here.

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.0.bb |  4 ++--
 .../linux/linux-yocto-tiny_5.0.bb              |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb   | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes=
-kernel/linux/linux-yocto-rt_5.0.bb
index 2350973fef..8629e5a867 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel t=
o linux-yocto-rt to enable it")
 }
=20
-SRCREV_machine ?=3D "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?=3D "4faa4419884d2bbe65f637befd71a1e95629eaae"
+SRCREV_machine ?=3D "37c8f2a3df1e3154087538a27228fad0c6e172c5"
+SRCREV_meta ?=3D "8fbd119bd954443b1cae496d7797c458faa02495"
=20
 SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH=
};name=3Dmachine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-5.0;destsuffix=3D${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recip=
es-kernel/linux/linux-yocto-tiny_5.0.bb
index e0a6801446..086b53bbbe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -15,9 +15,9 @@ DEPENDS +=3D "openssl-native util-linux-native"
 KMETA =3D "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL =3D "2"
=20
-SRCREV_machine_qemuarm ?=3D "6da91ac9afd3b8c144760e3ceacc6a812ddfa3f6"
-SRCREV_machine ?=3D "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?=3D "4faa4419884d2bbe65f637befd71a1e95629eaae"
+SRCREV_machine_qemuarm ?=3D "2260c031075188dce4d30223527dda68e3940574"
+SRCREV_machine ?=3D "37c8f2a3df1e3154087538a27228fad0c6e172c5"
+SRCREV_meta ?=3D "8fbd119bd954443b1cae496d7797c458faa02495"
=20
 PV =3D "${LINUX_VERSION}+git${SRCPV}"
=20
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-ke=
rnel/linux/linux-yocto_5.0.bb
index f2c066a150..ab8e5aff50 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?=3D "v5.0/standard/base"
 KBRANCH_qemux86-64 ?=3D "v5.0/standard/base"
 KBRANCH_qemumips64 ?=3D "v5.0/standard/mti-malta64"
=20
-SRCREV_machine_qemuarm ?=3D "1fbecad0e6a68b6c57b4f6ef8207e7e90ea764a3"
-SRCREV_machine_qemuarm64 ?=3D "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_machine_qemumips ?=3D "d9dd6d4cfe689efd5cb7bbacd118a3888ac7c517"
-SRCREV_machine_qemuppc ?=3D "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_machine_qemux86 ?=3D "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_machine_qemux86-64 ?=3D "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_machine_qemumips64 ?=3D "5f072445126e6a9e44f9435a552f4fcf6fc15499"
-SRCREV_machine ?=3D "1a0da7e50b77c82841efb501c648dbaca699eac2"
-SRCREV_meta ?=3D "4faa4419884d2bbe65f637befd71a1e95629eaae"
+SRCREV_machine_qemuarm ?=3D "23b538073fdc803b0a749de77677508671e246af"
+SRCREV_machine_qemuarm64 ?=3D "37c8f2a3df1e3154087538a27228fad0c6e172c5"
+SRCREV_machine_qemumips ?=3D "50b5b709ac6b1d14ac815f9a002c50a196306b02"
+SRCREV_machine_qemuppc ?=3D "37c8f2a3df1e3154087538a27228fad0c6e172c5"
+SRCREV_machine_qemux86 ?=3D "37c8f2a3df1e3154087538a27228fad0c6e172c5"
+SRCREV_machine_qemux86-64 ?=3D "37c8f2a3df1e3154087538a27228fad0c6e172c5"
+SRCREV_machine_qemumips64 ?=3D "8322515ba7a858c47386b95c6e7201c8a3a41175"
+SRCREV_machine ?=3D "37c8f2a3df1e3154087538a27228fad0c6e172c5"
+SRCREV_meta ?=3D "8fbd119bd954443b1cae496d7797c458faa02495"
=20
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?=3D "qemuarma15"
--=20
2.19.1


