Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web12.891.1605249129233997318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 22:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gEerYfuf;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id r12so8715947iot.4
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 22:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R1cRsLgWCBeipaN8nJ6pdxF2IUDNBvCV04a7lXBI4qc=;
        b=gEerYfufXyhpgCjLRrxWVo/rlJTrz/Uz2GbUreMPJDeBJ6xqnk8Tob18Fp/gYjVZJD
         IsdHP/1xWlTBlwfhs0FJMY1I+U7eybDMhv8a2e3Ylk2ADuLMoPSwYKZtzNAeuqgWfGnA
         1zt9Ajlwiob4a79HNxDD2McRPBniCabf/kbTZwXrYQMPrC6Oq4WBpron1zE022JyQkXY
         FKgcMYsG4pt/620gvDiZa5kHY85DtnkXzNymb6YIdWjBZfdBPj3TqtxDN3NXLdJ6NSR1
         YLIpEJgJgMObDFKRIcul2QN3UkPmCQ0Cgeknc0TWUu0G5AB7dhh+TgclZq5FYqrmyapY
         Fdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R1cRsLgWCBeipaN8nJ6pdxF2IUDNBvCV04a7lXBI4qc=;
        b=Gb9cNqND8XtMGPkMkeIIvZGqL1CA9wncF+oBeK32Okn7+GAtaVUk/Z9oRYMOCSy1EM
         GEAjq7Z/tib3y+c2Um5ut9T8ydmi+YY8n4PFv+iJVmqu6Is7+Xznw762+bLuj4nV/4DW
         TbhuLxKdZJ/WNc74VtdcrC7aSrT2bivvEsxAaIerDi7tXfgwI7UsMRKJYyYVlWd3yOQU
         36uWi2FEeQRI6p8Um29lq0SKnfkm39GSPK1NZh9/wKfTFuy0/nY0FgIDCp+/pegwEiK1
         4sNigCfcUhVnGTQOn0jjmUeYieQzGBd8J17uaEKT1X5Sj7C9eJGNHHtw22CufYb0Fj2B
         Z9FQ==
X-Gm-Message-State: AOAM5303iahrpqTjACMtYFbGnvvqBTueUZCQc9ApB/E5DRqyrSuZlhxy
	vPPM7M3ZCes+Z8guXxT+hBI=
X-Google-Smtp-Source: ABdhPJwAuWezOGh+sP6hkUPXCSTT3YoUZhkjZ/AuvlKepxXVNO4mS3kyoQs5rw2LSr0PAIt5rT2wJA==
X-Received: by 2002:a02:408a:: with SMTP id n132mr773577jaa.66.1605249128550;
        Thu, 12 Nov 2020 22:32:08 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id j12sm3667801iow.27.2020.11.12.22.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 22:32:07 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: lili.li@intel.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel: provide module.lds for out of tree builds in v5.10+
Date: Fri, 13 Nov 2020 01:32:06 -0500
Message-Id: <20201113063206.1716-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The upstream commit 596b0474d3d [kbuild: preprocess module linker
script], adds a dependency on module.lds for external module
building.

Since module.lds is generated as part of 'modules_prepare', we
must make it available with the other kernel artifacts in the
kernel shared workdir, otherwise out of tree builds fail.

This fixes errors like:

    | make[4]: *** No rule to make target 'scripts/module.lds', needed by
        'build/tmp/work/qemuarm64-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.
        Stop.
    | make[4]: *** Waiting for unfinished jobs....

We also ensure that kernel-devsrc has a copy to support on
target module builds that are often prepared with 'make scripts
prepare'. Those targets won't regenerate it, so the build fails.
If 'make modules_prepare' is used, the file will be regenerated
and overwrite our copy (as expected).

Signed-off-by: Pan, Kris <kris.pan@intel.com>
Signed-off-by: Lili Li <lili.li@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel.bbclass                | 1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index be93a258f6..ccd74e61e8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -494,6 +494,7 @@ do_shared_workdir () {
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
 	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
+	[ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 81b1e36041..5f0dedbdf7 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -100,6 +100,12 @@ do_install() {
 	# be dealt with.
 	# cp -a scripts $kerneldir/build
 
+	# although module.lds can be regenerated on target via 'make modules_prepare'
+	# there are several places where 'makes scripts prepare' is done, and that won't
+	# regenerate the file. So we copy it onto the target as a migration to using
+	# modules_prepare
+	cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
+
         if [ -d arch/${ARCH}/scripts ]; then
 	    cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
 	fi
-- 
2.19.1

