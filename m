Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web09.2676.1605331625266879553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 21:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m9iOZ1oX;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id m13so11972325ioq.9
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 21:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+twl7k7XFOuxZHC6DO0Uux8Yg4tGA0K0q/CG4SwPWI=;
        b=m9iOZ1oXFndDP9U/Q396tmRNdTdoHlxoD7MZw0GL3+aqPc/LrQBkMrnI6WGnJZHpKC
         v/BSUT6M33zvNpBLqLV9b63eWE2WnX9PWkxCItMGgDTd9Mo9fyC+B6ShzhQ5MJHuYdbH
         3T1ChuOUnBNwgXqasXCc6agd40LDUx5O5y6HOSqBat7hOBTRcZS9kuwp37h7Dgm6Xo1m
         SZvXArzPkCuUMWgtJhRIFgg11BjKcGc3kQGJUOyFeFJH3ukK86RjTxaEvJY3Hu8HTTa2
         D+k33bM6E7DYnvne7RwcUV0EjnPAx/7Zquj5xnK+m5XRVFly7M2WYVZVQNqxrcZ6mXBo
         T0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+twl7k7XFOuxZHC6DO0Uux8Yg4tGA0K0q/CG4SwPWI=;
        b=breL99rYsqXb0PtE6DQSdOd3fhygBXvYgoH8jTTsj0RMvTSqDNgLSj67gJ4nUXHOX+
         bEMj1j0+EuEye8beuY4ESPEmL2NzT1jYC8+QQ1FVljJuwNYcB42n1avHShIztjaaUF1T
         drsOuqCuysibnjH9Hlz3zEOFSzP0nPsyr2Khxb2vd7efrmSJa0COdV3XXRs4ukrpytwu
         INpHYPv33jem4U//bT+ME8oXXsgy4UHZBWmbRCMwqyw5hV8brdg2RCbxnOWUw/LuSBfW
         nwPwvorWeKSaDjJ1eFPz6YFl/+fwTQT4lfQnqn4Xkd/Y46Q05FsQnyWxm5oHg+aQRD+P
         PVog==
X-Gm-Message-State: AOAM531hgwzS9T3opq2g5OcGQf/899m9SbmtC2caGweIpERK+G1UF11G
	NsgzEP6MYrmi0xUe9uZGlxY=
X-Google-Smtp-Source: ABdhPJzhnN+PJje0a8ucqXJcOsNd4/9sT6YPZ3bg4x2TvBhaOZWjNOFPbCLTUo194LKapuABwp9INA==
X-Received: by 2002:a05:6602:2407:: with SMTP id s7mr2225873ioa.79.1605331624565;
        Fri, 13 Nov 2020 21:27:04 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id i201sm6192128ild.12.2020.11.13.21.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 21:27:03 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: lili.li@intel.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH v2] kernel: provide module.lds for out of tree builds in v5.10+
Date: Sat, 14 Nov 2020 00:27:01 -0500
Message-Id: <20201114052701.8880-1-bruce.ashfield@gmail.com>
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

v2:
  - I was right that we really only should be copying this in one
    location, but it wasn't clear that the main kernel build no
    longer runs modules_prepare so the do_shared_workdir task will
    *never* fine module.lds on a clean run.

    So we just need the single copy after we've build our modules
    to ensure that the file is available.

    Tested against a clean kernel and module build, just building
    the module. Dependencies are correct and the file is copied
    for the module to build.

    We could do the same thing for Module.symvers, but historically
    it was generated during the main kernel build .. so we can leave
    it there for old kernel support.


 meta/classes/kernel.bbclass                | 1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index be93a258f6..af4c891de4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -391,6 +391,7 @@ do_compile_kernelmodules() {
 		# other kernel modules and will look at this
 		# file to do symbol lookups
 		cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
+		[ -e ${B}/scripts/module.lds ] && install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
 	else
 		bbnote "no modules to compile"
 	fi
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

