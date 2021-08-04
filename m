Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.7182.1628073395348207490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 03:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oKlB73AB;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id b7so2904767edu.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s6vF+LMG6sho0PfRLS3CBRFvjzfeNBiqmrAIvGEoPO4=;
        b=oKlB73AB4ftw8d+MqVhBb3kWkBlaXNmU5rSoYo+jY/1HNtadYxupSyCDcptVEe0I1b
         0pjO0KsDFsBLzwtRc7f8NVPRvTeyEAhMQXn/vOIqXJ4XUWziVq0g5TrtmOiHLfP7tERE
         SgkTAU4PHp9ML/uFH2vpd72Lsuhz6p3pr6Pb+Gzzg/HIlxTxgMnK/LtCHI+DNPv4A8Vj
         Y3OCigmOV6q/cX4ZzgDPcacylbjj0OfRM8BwYebSUyWNol8SLBXi9lZIlNmnTeI1hcPc
         d1IzzCxOe55nBVJNtrMdpxsFlkhDIh6kkcY34cmD52yYON04gvpUA9gTO7dSQJB1zxq3
         02FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s6vF+LMG6sho0PfRLS3CBRFvjzfeNBiqmrAIvGEoPO4=;
        b=G7whPhMcptH0tOMTPjO1NqEQHaRB5QPKulv53c93gApiUV6idBtkcW5tsyJxdjxPyJ
         CWZUwlQZ0T0BBFb55r7OCmfw+lNDTFdOCcyvhZsI2lTTZ71O+IndTxB34vmag7HnnNpp
         +msHDIaPQUJSdxK4dB8hTMcl1PNsZgAN8MiFK9K/vPRwXuFOiJzuPXZvdkgv5yLREhTl
         HSHMb5Kvxdoddgtqp3toXIiKMeWIrWRxY4uV3jlS1DLjYpgCnqaIt5zCwvjMSXWpKY7N
         FKLl7i2xh3qtxhvago35fMiiHhgBXMl7qHCO+l1fO48NENcOv+J6F92uUlzhH67YSKWS
         L4OA==
X-Gm-Message-State: AOAM533ttzqizjFEhzgGUFI2z4geTw+lrrG37Di4C3yRralp3CmPc13c
	Tn7EVoZGmjNilX+0VxxW2SuLKnIv0218Yw==
X-Google-Smtp-Source: ABdhPJza+RYSuGHM3ZFcuSw8Z1Y0rjQFitbjpjEj/L8tpcf2d2kMI84zv2N9CEo/Bh1gXBNS0ajWLw==
X-Received: by 2002:a05:6402:26cd:: with SMTP id x13mr31429626edd.184.1628073393782;
        Wed, 04 Aug 2021 03:36:33 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p18sm785815edu.8.2021.08.04.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 03:36:33 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCHv2] systemd-boot: use ld.bfd as efi-ld even when gold or lld is used in ${LD}
Date: Wed,  4 Aug 2021 12:36:27 +0200
Message-Id: <20210804103627.238411-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1697E299D6012A1A.32176@lists.openembedded.org>
References: <1697E299D6012A1A.32176@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* since the upgrade to 249.1 in:
  https://git.openembedded.org/openembedded-core/commit/?id=323ec445dfe22860cd450c303db5ed8fcb4e791c
  the builds with ld-is-gold are failing with:

  [17/21] Generating linuxx64.elf.stub with a custom command
  FAILED: src/boot/efi/linuxx64.elf.stub
  /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld -o src/boot/efi/linuxx64.elf.stub -T /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds -shared -Bsymbolic -nostdlib -znocombreloc --build-id=sha1 -L /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o src/boot/efi/string-util-fundamental.c.o src/boot/efi/disk.c.o src/boot/efi/graphics.c.o src/boot/efi/measure.c.o src/boot/efi/pe.c.o src/boot/efi/secure-boot.c.o src/boot/efi/util.c.o src/boot/efi/linux.c.o src/boot/efi/splash.c.o src/boot/efi/stub.c.o -lefi -lgnuefi /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.0/libgcc.a
  /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld: internal error in segment_precedes, at ../../gold/layout.cc:3721
  [18/21] Generating boot.c.o with a custom command
  ninja: build stopped: subcommand failed.
  WARNING: exit code 1 from a shell command.

  as reported in:
  https://lists.openembedded.org/g/openembedded-core/message/154246

* if someone is using lld or ld.lld in ${LD} then it would fail as well:
  https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9bf86a764e31

* work around this by always using ld.bfd instead of whatever is set in ${LD}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_249.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.1.bb b/meta/recipes-core/systemd/systemd-boot_249.1.bb
index d767b5bf8d..3c24e7ea4d 100644
--- a/meta/recipes-core/systemd/systemd-boot_249.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot_249.1.bb
@@ -19,11 +19,13 @@ objcopy = ${@meson_array('OBJCOPY', d)}
 EOF
 }
 
+EFI_LD = "ld.bfd"
+
 EXTRA_OEMESON += "-Defi=true \
                   -Dgnu-efi=true \
                   -Defi-includedir=${STAGING_INCDIR}/efi \
                   -Defi-libdir=${STAGING_LIBDIR} \
-                  -Defi-ld=${@ d.getVar('LD').split()[0]} \
+                  -Defi-ld=${EFI_LD} \
                   -Dman=false \
                   --cross-file ${WORKDIR}/meson-${PN}.cross \
                   "
-- 
2.30.2

