Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.37295.1597028403766320127
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ASDzMO9O;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id y6so4069096plt.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=9/QSIVh+kSiBuMUfmgSZREp4Zwdt4IayFbcAOri6/+o=;
        b=ASDzMO9OE+evSChKV72/gRNGr+YuLDodHSJAafGVuzQlWguB1ge8BGqbGBJRybKRKA
         0Fk5yXCG7ZgNAl8HzDyw5f+rFO3HWeIC0g7/u7KmMgjV61rGj5oRcUgbCf+eT+q2YNbj
         9JfTIEE1kMTPha7orlQawiPp7UTmeRzr3yQ2257Z/Sj6N8H/r+IiIzauBTvmjQVfKlqI
         Hqk1sPR4pOXfo1Xop/0lWVbtZGpDR9uO7Iz8P0TNsLSiqa3qtfzNjMnhDQMVQeSRORTw
         dsx5UQ7GECiR6LUzHqQYdG4QXPxNLqlVxfqvGQeOe6lEyZ6TN8ueT7dXyVw7E6zTctt/
         JgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=9/QSIVh+kSiBuMUfmgSZREp4Zwdt4IayFbcAOri6/+o=;
        b=ncXFswvDf13mY9DlMOF8nWnEwzgNHNRuqhGNJEdMNBVkrQDV/jMFQIirSxLBccwilW
         QkuDGruQ8ZOqB4xyz+hhOXVKm4uh9snFtkQYDYVzG9NWF+XH8B8zv9uffim6Pmc9OfjO
         Y8fqDylHPPnGzTrRy1OvJuEZr+eFDAolKDgIpnzayb5icf5q24qrsyfG5OWTSybm++Cz
         a88Lo7DQxohs3hIsXQQjiP32mIw1Adg+8yC8pCxWbFuE3OEvk9ViErxmhR15M/wmLBeT
         PlozAjz/rxT5A9ok1KosBocjSvugfableYYkazFw8a4Q6bv02echwIy1GWv1w90QXNiU
         KSeg==
X-Gm-Message-State: AOAM533DoXFoArAWYWD7pWg8p/JhFwD1pJIGBVYQkBq0AbGg0zsZM/LE
	EGoXmge0J/7wTKgki56rDIyuLeDlJ/HhNQ==
X-Google-Smtp-Source: ABdhPJw2mHJVdxrSq6j7kDitRXWctnPBS2G7N39TLYGXcKbce7dN22U04xTnLxmLclENUZtG4E9KUw==
X-Received: by 2002:a17:902:8495:: with SMTP id c21mr23198133plo.82.1597028402777;
        Sun, 09 Aug 2020 20:00:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/19] kernel-devicetree: Fix intermittent build failures caused by DTB builds
Date: Sun,  9 Aug 2020 16:59:15 -1000
Message-Id: <7c1fff00b7268d518afa87078bdc781324c63d03.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Tyler Hicks <tyhicks@linux.microsoft.com>

Fix a build-time race condition that resulted in intermittent build
failures in the do_assemble_fitimage task. The race condition involved
the do_assemble_fitimage task reading the vmlinux file while the
do_compile_kernelmodules task was re-writing the vmlinux file.

This can be seen with an aarch64 image build that uses a 5.4 based
kernel and sets KERNEL_DEVICETREE. The problem is that the do_compile
snippet that the kernel-devicetree class appends did not specify the
full kernel build environment when building the DTB(s) from the kernel
tree. This resulted in CONFIG_CC_CAN_LINK=y being removed from the
kernel config file just before the do_compile task completed. The
CONFIG_CC_CAN_LINK=y line was then re-inserted into the kernel config
file as part of the do_compile_kernelmodules task.

In some cases, this resulted in the do_compile_kernelmodules task to
re-link vmlinux which sometimes occured at the same time that the
do_assemble_fitimage task was attempting to use vmlinux. The
do_assemble_fitimage task would fail with the following error message:

 aarch64-poky-linux-objcopy:vmlinux: file format not recognized

We can use the pine-a64-lts machine, from the meta-pine64 layer, to show
that the kernel config file was changed between do_compile and
do_compile_kernelmodules:

 $ C=tmp/work/pine_a64_lts-poky-linux/linux-pine64/5.7+gitAUTOINC+ae03bade3b-r0/linux-pine_a64_lts-standard-build/.config
 $ bitbake -c do_kernel_configcheck virtual/kernel
 ...
 $ md5sum $C; grep CC_CAN_LINK $C
 32b133cf8a749a91f698a7ca8616c84f  ...
 CONFIG_CC_CAN_LINK=y

 $ bitbake -c do_compile virtual/kernel
 ...
 $ md5sum $C; grep CC_CAN_LINK $C
 2fd2ec2a66eecc329dcb5afaf005eada  ...

 $ bitbake -c do_compile_kernelmodules virtual/kernel
 ...
 $ md5sum $C; grep CC_CAN_LINK $C
 32b133cf8a749a91f698a7ca8616c84f  ...
 CONFIG_CC_CAN_LINK=y

With this change, the do_compile snippet appended by the
kernel-devicetree class does not modify the kernel config. The kernel
config is unchanged across the do_compile and do_compile_kernelmodules
tasks and do_compile_kernelmodules will not attempt to re-link vmlinux.

Signed-off-by: Tyler Hicks <tyhicks@linux.microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74619de0277471f446bf7a719f4c445359c823f6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-devicetree.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 522c46575d..81dda8003f 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -52,7 +52,7 @@ do_configure_append() {
 do_compile_append() {
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
-		oe_runmake $dtb
+		oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
 	done
 }
 
-- 
2.17.1

