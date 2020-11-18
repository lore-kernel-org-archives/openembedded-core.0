Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web12.19901.1605675396682879424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 20:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FuusrKXJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id r1so614897iob.13
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 20:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lclG091s7V+lKjUXlmZRogPO0JYem5N+kCPHxN5fABA=;
        b=FuusrKXJKJWcSpQIBmaIkl4iFSZFUfGTAqhOoOnyjIHmHo5bHM2ifh0M+vvPOaeOUv
         +1+wgg4fG+LShicdtPG/i9HFwdaPJS6IvExw4Ar7GV7pHB9hClWtPYXdmGmKJml1lYp4
         rCoC3vYBmC7N1nTXS2HG5YWjinECWg94X6J46OwdMpxCudVWuPJ2x7e5TZu7eZLPtttf
         VqoAx74H9g6awK2ey86YozreehM39fOAEobS2jX+pHMtfbNdgS2q0n33cbsIWsGDvYA4
         Pp0Tf72Qs5LyS5E+4NR39qE27bIUz7h8kSND0zg79L3UQbjz3mGppfM9jjfFy51XX/yA
         MWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lclG091s7V+lKjUXlmZRogPO0JYem5N+kCPHxN5fABA=;
        b=CsOjXtQLXONzMUEVxLz1O6Hxw3UP829WTUkXyAYS5v/yPxIoxbcUK769P5K9aLufvV
         Hgti429r67qmxBX22KCRL9zGtsjzDaZNGNoqs0G8I6uD9hU3/GklFuIFIxuQPujtBXdq
         WLo/uZjTIw6OFWbujR3/sLrRgUuJ6vnylGndkhdGzn0WHnU0Ut60nvIwCbUA7CfyEIJn
         H/AFu2SGTgYLPL2dU002WwBDzn1a47knU2joBanve21+3bC15Pp2WSdMDjcJsqZjd9G8
         TmhTgETmPyNmHp6Yz6LqibOkOjpmkb118lyr7ZqojgrljumUCmJWlkhUvefmgZugoDqC
         Iuqw==
X-Gm-Message-State: AOAM5320mOcVY/yxDW9XN9nZC9fggN2um+NjHd8GH/HgxeOjaKAq+hZi
	nIuHyZFtbzQXdR2QBCbumZc=
X-Google-Smtp-Source: ABdhPJzoQeIPvPrIOkH/VRECdLEAK1mSCpBV1Nhp07W03tNo59W5UWxe2Tfj96MLldPW3MpcQp7ZSA==
X-Received: by 2002:a5d:9284:: with SMTP id s4mr14383962iom.165.1605675396017;
        Tue, 17 Nov 2020 20:56:36 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id 186sm15370783ile.4.2020.11.17.20.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 20:56:34 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] kernel: relocate copy of module.lds to module compilation task
Date: Tue, 17 Nov 2020 23:56:33 -0500
Message-Id: <20201118045633.47396-1-bruce.ashfield@gmail.com>
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

v2:

I had done my test builds on a branch that didn't actually contain my
change, hence why 5.8 builds where blowing up.

I switched to the if [ ] model, since that doesn't run afoul of the
exit handler. I do find it curious that the compile task behaves so
differently than the install ones (even with set +e, I couldn't use
the [ ] method.

Anyway, this is tested against 5.8 and 5.10 + eternal module builds

Bruce

 meta/classes/kernel.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ccd74e61e8..8b28ee626f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -391,6 +391,10 @@ do_compile_kernelmodules() {
 		# other kernel modules and will look at this
 		# file to do symbol lookups
 		cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
+		# 5.10+ kernels have module.lds that we need to copy for external module builds
+		if [ -e "${B}/scripts/module.lds" ]; then
+			install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
+		fi
 	else
 		bbnote "no modules to compile"
 	fi
@@ -494,7 +498,6 @@ do_shared_workdir () {
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
 	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
-	[ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.19.1

