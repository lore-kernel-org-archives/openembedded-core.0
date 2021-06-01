Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.58331.1622557131127044819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vrZJiw9m;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id mq2-20020a17090b3802b0290162428291f5so2024954pjb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kRw//feXELBZn0+ua1g6CwCseL52PO/QR4Ub/qAwprs=;
        b=vrZJiw9mbj6XUziIV0/LbbMiBYW1AOG/tiqE066fUPvTn3Krv6YizJi4lkMaLslzMU
         9QomgNFRyoIdxHqZCGG6dBQR2WvNrNvDoTuDmM+dFrTfHJxaruaIg7SjQs7IRCUsEBCu
         3e3gwk+oPkMJLH15GlxEnpbt0+WsQiAOpA72/qBAab9F6mPwpZHogi8P+wgeBo51Fgto
         JqIKseA6Mub0Qm8Z+utlDpPhQB51FF9dEBdJsY9BoCX7q0iljHMSjxNI0S1mFI9/bLfc
         +wN8jlZEc9J2vCN9egGKFGm8wU4i1KzZ29VrTLjWzYw/0AgG+cQA5S81UqGuy0YUMLWj
         ftYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kRw//feXELBZn0+ua1g6CwCseL52PO/QR4Ub/qAwprs=;
        b=MUZaRg7GTugZoov/rCyp1NzSTtqMpFbtKklssooxA44pVK+bTPkIi4/q1ou20z9GSj
         H+YO5lQbDQxhCEG69VPQIfhAWtaqkGxnv/eKhnnmFXddAoDuj4rCP/TZu8mCFw5UAK12
         dP1awIWLpgd2XG3mh6g7MNKbYa33w8t+Kh+kK/d8VYy5kOQRAeTg6zPprlL77HbX/EKc
         ErB8gNms9ehH7yAymYUVrE0p9G4OqtceZctq1W2LlST7WyNiaI3sS50pDQXcQsoYFj3u
         Gwn4U0b703LXWrhL8mZKen2dTZ76mo+IJVybjDSOQwWztYTIIhsaOMvaUK7gIql56Jb0
         A2Qg==
X-Gm-Message-State: AOAM532NyDXIWyjGQKCCsyF7aE/dqHzrYdPJRL1eU8u+UgJrOKVFuO8K
	yA6wj/ZQ6dIrjy4WURGzl+FXLz/QmvqxDech160=
X-Google-Smtp-Source: ABdhPJwl0dDZOemN5jfwXudpiQskHw/GVVwLbPSSDOa08/xf+Kum6EfNvBjS7w+AwYjlypQfacp42Q==
X-Received: by 2002:a17:90a:ab92:: with SMTP id n18mr153801pjq.72.1622557130206;
        Tue, 01 Jun 2021 07:18:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/26] kernel-yocto: provide debug / summary information for metadata
Date: Tue,  1 Jun 2021 04:17:57 -1000
Message-Id: <8c299837622795408f4e4a9e8c2b3b3d6f409acd.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b95b11e130e91cb7c5e65f0f9a1c655bcbcbc919)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index ec5fb7b1de..66cce92362 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -105,6 +105,8 @@ do_kernel_metadata() {
 	cd ${S}
 	export KMETA=${KMETA}
 
+	bbnote "do_kernel_metadata: for summary/debug, set KCONF_AUDIT_LEVEL > 0"
+
 	# if kernel tools are available in-tree, they are preferred
 	# and are placed on the path before any external tools. Unless
 	# the external tools flag is set, in that case we do nothing.
@@ -252,6 +254,21 @@ do_kernel_metadata() {
 			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
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
2.25.1

