Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.11003.1625238837053029845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 08:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FBq4ASoq;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id v139so9644100qkb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TRjWO1WeWCAMlBOt3uPvUZW6HV7AWRrWplTZNk+pCZM=;
        b=FBq4ASoqOdnQv54dpeQSYXXeXBD28rS8QEYAKhGH045tBAQ4ijviuwT8g7yBBzHeOu
         9kOsCAuzj4JTwwj6QriyRu6GLInRWMfg27TwrRpLB4cAHnSdbALsUcmAq+aNiinAs7M2
         Co++ZSgMAnQSVZObRf4WI0lWqfQBYbjNHQndTyKgNbyodk8Fjbd9Ca4KDuppDdlxssdy
         O68vX13A+K2OoGai11J/TDxpOHx3uLYl0mQja2XkyMJC1V/MAlbLsDqtCX+IEk4PLXHS
         LJeiX5L+A7Zyf8eoY6Hq/rckAq+T7q7+OESohYZwK+kD2UtmW09Tlmb12y0PiT62b7Pb
         AeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TRjWO1WeWCAMlBOt3uPvUZW6HV7AWRrWplTZNk+pCZM=;
        b=ts2sFfdTMRK+pbx1xs4Ybgvd1CHeLr4re7TgTHMtAhM4uCCbWETwqDiAztI6W9Oho5
         tOcHNAwiVxh2vNWOhOiWtFYHmbbYKdRUWESJM3XM2zmIiH5rgYTBl+8JxjrhfU5m2hz6
         a+FkUMK9qM0LLMUIHbyjr0T8i2y7F1DlICJZei4/9DR0m0PG1obNzVOlOTkSmrlr/lIs
         X1hm93YkJfTUCjwKYG985PElMJQIQ97MbyuZrKyXLMmPGXpc+npDxtQONVlj+NHfvFDQ
         p3vhreSqoA3ySZNyJp5+Vx8P0MCHbRiFDzPxDT0geiTaA5vMaUJtm5fZSOfN/fsKk0tb
         jT3A==
X-Gm-Message-State: AOAM532Nd/oUac7VZsqqY5xv8VJJeR6Li+1S63P+H8jxP34RtlJyynpd
	4L0N3C9AeuFKXbcuebkeI5k=
X-Google-Smtp-Source: ABdhPJwy0R6Zuo6kxmjPVLa75yHhp1gcw+sKT51Q6R43XJwdCuyeaOyC4OlTo5xfDTaH8xFDeZfR9A==
X-Received: by 2002:a37:7f42:: with SMTP id a63mr319010qkd.288.1625238836217;
        Fri, 02 Jul 2021 08:13:56 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id o200sm1466800qke.105.2021.07.02.08.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:13:55 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] kernel-devsrc: fix scripts/prepare for ARM64
Date: Fri,  2 Jul 2021 11:13:45 -0400
Message-Id: <07e827737e650303cf44820d775d897479d47c8a.1625238537.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1625238537.git.bruce.ashfield@gmail.com>
References: <cover.1625238537.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

There are two new tools in 5.13+ required for on target
recreation of the build environment.

We conditionally add them to the devsrc recipe to support
both 5.13 and older kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 84e99233e6..b1837b3a51 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -163,6 +163,14 @@ do_install() {
             cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
 
             cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
+
+            # 5.13+ needs these tools
+            cp -a --parents arch/arm64/tools/gen-cpucaps.awk $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/arm64/tools/cpucaps $kerneldir/build/ 2>/dev/null || :
+
+            if [ -e $kerneldir/build/arch/arm64/tools/gen-cpucaps.awk ]; then
+                 sed -i -e "s,#!.*awk.*,#!${USRBINPATH}/env awk," $kerneldir/build/arch/arm64/tools/gen-cpucaps.awk
+            fi
 	fi
 
 	if [ "${ARCH}" = "powerpc" ]; then
@@ -307,3 +315,5 @@ RDEPENDS_${PN} += "openssl-dev util-linux"
 RDEPENDS_${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils', '', d)}"
 # 5.8+ needs gcc-plugins libmpc-dev
 RDEPENDS_${PN} += "gcc-plugins libmpc-dev"
+# 5.13+ needs awk for arm64
+RDEPENDS_${PN}_append_aarch64 = " gawk"
-- 
2.19.1

