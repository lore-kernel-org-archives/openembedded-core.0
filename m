Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.258.1621289824747978527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=adH8I3KE;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id o27so7418050qkj.9
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yT4NZr817e1k8dI2528/2Cl8LBdjYIRqp9fVHVxghYk=;
        b=adH8I3KEQ0csNQ5kfh+wYlZ07/kfBLOSBWaotTpKbKNQ63veGywd1ujawL6loZ/IrL
         odEzDIr0RejSg4oNnJ1pIYmbLGbYbAjqjXeuePkfVOxvY2eGIG0+JngoJJmedA5ZWk1K
         VaGfarsEct04fc0zKx4DqjBMtnNw4WKlPWB0JnE0HOiWyxeGjiF787kzkbuCO2fgv8zr
         GOUtSDuLAsVzvC0rsjPgckFOvP9PUDMmjpjbJ1zYxduIs72VPsdaKhcxuZ6JYXkCqwIX
         RNcYMVM1aciaBqbgc19PoVDNuwD1ihR1aXLqeBvllSaDK97BYPz3L0Z6SpDT2Aw1rFjK
         0NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yT4NZr817e1k8dI2528/2Cl8LBdjYIRqp9fVHVxghYk=;
        b=dCjcy+l3VdOhk/8RD4bbj3rPpz8fdz8WXkeFkmfo29y4597G9xUV2KVg7KUmUbL1ej
         rdytaJu87n6kloGJNaIJg00kOSywIwEQxRGrGndrWCU3buBbTFvOKQQ4pr7s+LOItyr6
         R2/CsbArx7zEoteaT9N7yIVMEgAEPUhV4hYJPDtUNjagoOALPgGyQ6xC6quyTcXQVXpb
         yjk8D22LUqcu7uE/JXn/k4lqjlNhXqpEL4yA5Kezub4feubGhP5Xww4e51Px46yS7T7k
         WnNUyUJVxw9nBUkFhk9jzwP4sZ/GBCG6xnEuSyLgtgke7vdEVYBt0W+XS9Q9Yqrcs4MB
         d4Nw==
X-Gm-Message-State: AOAM5301PSnKrQjvIPHr9POoWv+owfZBfo+amA72LhtCKOlJb4DCnxYT
	K0sSqijkHN+EPgU5Oah+GOU=
X-Google-Smtp-Source: ABdhPJy5ZmTyeO9Wci2nxEFJZId92LfXkteL1lphCkO7jP0WpVQM0gCaBxfifNF5jGjYKldGE6/jig==
X-Received: by 2002:a37:5847:: with SMTP id m68mr2106574qkb.111.1621289823914;
        Mon, 17 May 2021 15:17:03 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id y10sm9789558qtm.17.2021.05.17.15.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:17:03 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] kernel-yocto: provide debug / summary information for metadata
Date: Mon, 17 May 2021 18:16:52 -0400
Message-Id: <794d2e08aa7819f8b0eaaa8fa8a02d8a311f5362.1621275692.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1621275692.git.bruce.ashfield@gmail.com>
References: <cover.1621275692.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It was mentioned that when developing a BSP, the information about what
definition was used, or what fragments have been applied is not obvious
and requires looking at the code.

With this change, we can trigger a full summary of the meta data gathering
phase when KCONF_AUDIT_LEVEL > 0.

Sample output follows:

   NOTE: do_kernel_metadata: for summary/debug, set KCONF_AUDIT_LEVEL > 0
   NOTE: kernel meta data summary for qemux86-64 (standard):
   NOTE:
   ======================================================================
   NOTE: BSP entry point / definition:
   /build/tmp/work/qemux86_64-poky-linux/linux-yocto/5.10.34+gitAUTOINC+bca3bfbc74_85c17ad073-r0/kernel-meta/bsp/common-pc-64/common-pc-64-standard.scc
   NOTE: Fragments from SRC_URI:
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/xt-checksum.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/ebtables.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/vswitch.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/lxc.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/docker.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/xen.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/kubernetes.scc
   NOTE: KERNEL_FEATURES:  features/nfsd/nfsd-enable.scc
   features/debug/printk.scc features/kernel-sample/kernel-sample.scc
   features/netfilter/netfilter.scc cfg/virtio.scc
   features/drm-bochs/drm-bochs.scc cfg/sound.scc cfg/paravirt_kvm.scc
   features/scsi/scsi-debug.scc features/gpio/mockup.scc
   features/aufs/aufs-enable.scc cfg/fs/flash_fs.scc cfg/virtio.scc
   NOTE: Final scc/cfg list:
   /build/tmp/work/qemux86_64-poky-linux/linux-yocto/5.10.34+gitAUTOINC+bca3bfbc74_85c17ad073-r0/kernel-meta/bsp/common-pc-64/common-pc-64-standard.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/xt-checksum.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/ebtables.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/vswitch.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/lxc.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/docker.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/cgroup-hugetlb.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/xen.scc
   /poky/meta-virtualization/recipes-kernel/linux/linux-yocto/kubernetes.scc
   features/nfsd/nfsd-enable.scc features/debug/printk.scc
   features/kernel-sample/kernel-sample.scc
   features/netfilter/netfilter.scc cfg/virtio.scc
   features/drm-bochs/drm-bochs.scc cfg/sound.scc cfg/paravirt_kvm.scc
   features/scsi/scsi-debug.scc features/gpio/mockup.scc
   features/aufs/aufs-enable.scc cfg/fs/flash_fs.scc cfg/virtio.scc

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 30f07de4ca..ba139dd7f8 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -113,6 +113,8 @@ do_kernel_metadata() {
 	cd ${S}
 	export KMETA=${KMETA}
 
+	bbnote "do_kernel_metadata: for summary/debug, set KCONF_AUDIT_LEVEL > 0"
+
 	# if kernel tools are available in-tree, they are preferred
 	# and are placed on the path before any external tools. Unless
 	# the external tools flag is set, in that case we do nothing.
@@ -290,6 +292,21 @@ do_kernel_metadata() {
 			fi
 		fi
 	fi
+
+	if [ ${KCONF_AUDIT_LEVEL} -gt 0 ]; then
+		bbnote "kernel meta data summary for ${KMACHINE} (${LINUX_KERNEL_TYPE}):"
+		bbnote "======================================================================"
+		if [ -n "${KMETA_EXTERNAL_BSPS}" ]; then
+			bbnote "Non kernel-cache (external) bsp"
+		fi
+		bbnote "BSP entry point / definition: $bsp_definition"
+		if [ -n "$in_tree_defconfig" ]; then
+			bbnote "KBUILD_DEFCONFIG: ${KBUILD_DEFCONFIG}"
+		fi
+		bbnote "Fragments from SRC_URI: $sccs_from_src_uri"
+		bbnote "KERNEL_FEATURES: $KERNEL_FEATURES_FINAL"
+		bbnote "Final scc/cfg list: $sccs_defconfig $bsp_definition $sccs $KERNEL_FEATURES_FINAL"
+	fi
 }
 
 do_patch() {
-- 
2.19.1

