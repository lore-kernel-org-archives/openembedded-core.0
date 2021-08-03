Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.3216.1628017482552854055
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 12:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pNe7KaaU;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id f13so358656edq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Aug 2021 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OAa+FazDz3t4mBQLeHG3DDmDcmOMYiH8PTEP5lAyfWI=;
        b=pNe7KaaU3qaTzqPd/M4yirH3g2CrEV6My9v5+qo183HjYFT5BH6bxM6SsYgql0MN/g
         yfjB6/9IYhtf6J+t43lloesCMjidZA0Izcd9LvM5s3f3OXNDx6v1hMPyCkVxweZvqXT4
         nvtUTF0GuVukXQ9dneaKjfQG3fP6Waqod1ReUuLoSv6uyQpJsg5QoRu1YqNQ40NKhTtG
         VlTyzKbfNag0S8EsrB+yVUcpLc+cmHSljbdML5nh9umSIYt+aGWpTcRYyNUTfYYlkeET
         pbY6kJ7qie1Xw+LFP2aZwe6pMjJVmNxXrGZvQ9wURje7kaTCZaVV94YrRM3bNltN9nZ/
         okOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OAa+FazDz3t4mBQLeHG3DDmDcmOMYiH8PTEP5lAyfWI=;
        b=qAxBJAaifdo/r4QILsXioWJWk9YvKFlUD2WjYzNRjKI7SClaHJ2VY8fvsvw1FlLact
         eAl2yvRKtSp96X9/8Sq3akorxCM7MujWQv3zRs/chfhURrZf66IrLIuP2NO8BLCcdqlR
         rqyZOTiiucDyRG4wedyC5xUgsWiO1I8sg8/s5W5+a61wT5/SPPuqGH5Uk6MF6sqKIUwN
         bNCcvq17klECwAfTMOa3IgkNtkDklvCqrFwEeuxZWzp9MSYncOBQBLkQ3woleRzIs7vI
         44cF4zh+9IphnHspVcv1810MYWAKs3q09UxBUx6GNafEFcQCyIJurz5VvSPJOucht5a3
         zcUg==
X-Gm-Message-State: AOAM533Ec5H47OQ+1OcKjsfh8bX9enubSCInz8TgyH3/deyHjUTsnVQV
	cNTE8uYaSo+s9Qh58KKYPNtxUoZSmTRNUw==
X-Google-Smtp-Source: ABdhPJyqEtSu2J3xkt9P07EfiBDpdik5lVdZf4IPIXJCIX7EW0U3MWTQdMwhcbzZHrX5o4dGyLbaZA==
X-Received: by 2002:a50:ed14:: with SMTP id j20mr26798397eds.323.1628017480916;
        Tue, 03 Aug 2021 12:04:40 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d2sm6518526ejo.13.2021.08.03.12.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 12:04:40 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] systemd-boot: use ld.bfd as efi-ld when gold is being used by default with ld-is-gold
Date: Tue,  3 Aug 2021 21:04:35 +0200
Message-Id: <20210803190435.332065-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1696468844291952.7588@lists.openembedded.org>
References: <1696468844291952.7588@lists.openembedded.org>
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

  work around this by using ld.bfd when ld-is-gold is in DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_249.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.1.bb b/meta/recipes-core/systemd/systemd-boot_249.1.bb
index d767b5bf8d..18f4fe55ce 100644
--- a/meta/recipes-core/systemd/systemd-boot_249.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot_249.1.bb
@@ -19,11 +19,13 @@ objcopy = ${@meson_array('OBJCOPY', d)}
 EOF
 }
 
+EFI_LD = "${@d.getVar('LD').split()[0]}"
+
 EXTRA_OEMESON += "-Defi=true \
                   -Dgnu-efi=true \
                   -Defi-includedir=${STAGING_INCDIR}/efi \
                   -Defi-libdir=${STAGING_LIBDIR} \
-                  -Defi-ld=${@ d.getVar('LD').split()[0]} \
+                  -Defi-ld=${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld.bfd', '${EFI_LD}', d)} \
                   -Dman=false \
                   --cross-file ${WORKDIR}/meson-${PN}.cross \
                   "
-- 
2.30.2

