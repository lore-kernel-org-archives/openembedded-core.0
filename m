Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web09.8172.1605622005197182767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 06:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bD/D/w3c;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id u23so3177466qvf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PoayGjTtqR4m2nxOiLZDpFH3VUh+4/ZKH5z5Dl0JI8I=;
        b=bD/D/w3ciq0lncHJzFSYBLgpQjD3fR957ZhkOO5Bv/NZ/mQaD7FuSWQ3WtoRchkDzK
         xICnv+EO6i0aS3UiDtb4MdkzvGV5SPPE5cRd5ApiaAbFdugRFLeTzxmfLMGjCrqV1C8Q
         SGSDJIW+COfcYennnm8Dm9wZZVk3a7SmRA6jGxPOdodfRIhqvUM5wwfn2F9EHbW6x7OP
         wNj7c8IZqQwU+crQyqtGksUZFECNhr1Eg4KoFYHyiqNwSc4axoK1ir4wO++cgtGuJAtw
         KjrJLdFIZ7b3iRxGsqRWk5lmS1pHK2W/7s29UFaAmXgtj+4lSLs1aLtL5Fh1QaqYaXYL
         tugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PoayGjTtqR4m2nxOiLZDpFH3VUh+4/ZKH5z5Dl0JI8I=;
        b=I6tk6Lkv6gMd6SJqZgySO4SS41CZtzsVPs3EUZSrTSp4NFdiLjCDHzX3xfKxky58ay
         bo0mXi3y6y4gnny0SBVwskrHL2Yg7swlAxBnNnn3TjzaodWVXPpbp3iU1t3ier8xw+tq
         wUI+Bu53a0TOpSj+BvrdE7348hQrcoGe20MopebUprglydfEPD2sKUgL4ZO0F1nwntNv
         xxcdKJnmb6yArzI8P26HjL43ZJ14fYMhIWZc3X+3g6kODEB75Vw5/+BrC7NkcjE2kVNU
         2cX+2PyabmdEdiyDpSxXOC1fDi0bpOUjn5wJn6QqsSc0aRmETdf//WKpBWnTdw3myw6H
         ysKQ==
X-Gm-Message-State: AOAM532Q5buvp2PJPz2/p9ZYDky2I6MSCuLT9rS50hIlIh7KbTcTSP0K
	ApKd1Cy43ZaEttYqCC/itLE=
X-Google-Smtp-Source: ABdhPJzhy4CQIkc4m4BK1o71QymHGduuR8hQtunhj/7sbE2rvdWkL/9JWF+10zxI2nJ5LmfpAk/20g==
X-Received: by 2002:a0c:a223:: with SMTP id f32mr21273514qva.9.1605622004225;
        Tue, 17 Nov 2020 06:06:44 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id z11sm13813743qkz.38.2020.11.17.06.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 06:06:43 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel: relocate copy of module.lds to module compilation task
Date: Tue, 17 Nov 2020 09:06:41 -0500
Message-Id: <20201117140641.19575-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

There were two copies of this patch floating around, and the merged
variant has the copy in the wrong place.

module.lds is only created during modules_prepare, and that target is
not invoked during our main build of the kernel. We aren't about to
change the kernel build (there's no need), so we move the copy into
the compile_kernelmodules task. After that runs, we have module.lds
availble to copy.

This has been tested against clean kernel + out of tree module
builds, and the dependencies are correct that the file is copied
before the out of tree module build starts.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This is just a fixup to the patch [kernel: provide module.lds for out of
tree builds in v5.10+], which v1 merged instead of v2.

Build tested locally.

 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ccd74e61e8..af4c891de4 100644
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
@@ -494,7 +495,6 @@ do_shared_workdir () {
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
 	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
-	[ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.19.1

