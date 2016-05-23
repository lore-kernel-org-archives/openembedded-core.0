Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7B862135
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 17:51:07 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n129so81567005wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 10:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=3bUZktj/S3xZWLJhrT2RnL8RhR2lGZZwOn4UR1/TYUo=;
	b=Lb1fz7k0omp6tNDG2TU7My1VPSEt7A+YHpJTKAVuaALYl91zafxOlSytB4R2UJ4LUo
	XIYOyb9uyO82ctNgJzpaU/K/huXxkSra6WUlRhUM2/jcIAyScsP4JYbnwtDvetLn+8Q0
	QOWgvJwyeNVxT0ftsAsffGguBNPLcIErddSG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3bUZktj/S3xZWLJhrT2RnL8RhR2lGZZwOn4UR1/TYUo=;
	b=Qv8cARTRsh+Gz2hNrpE5Uys5lBcUfFJLwPySRU0ipXa7rSEze4xCB1Bgo/eQRMQQQl
	/KOZLiHvuOFsSOR40R6h6mIyGf6A/Bm6+JzqBI69qySdtJl+ZRSSswX+ZHQNLyr4ZcCy
	H0ggdKeHD8kv2emhOXMMyo7FXQ4GO0DlK9+q6zyTS6tFqQA8OIBPMawjS1IElvrjfo6u
	57IVTbW4cOkbdu42kErhFimUUDHomgsjoZB3YMz4XdjVlQsjAmuIlfhS8dKqoTvIJegC
	zRfETIbcW+/PM4PvlOA0JKeUd5gfI9Iqh3DuRnM28arpj1XPGojrR2IVdZPAjdfEKTfh
	+Z/w==
X-Gm-Message-State: ALyK8tLyq9UX+phNOBP7hNTBBA+6uap4sVjaEQ8hkql+1GThhzQjUCI7+V4ommlAnIGgwpA9
X-Received: by 10.194.81.72 with SMTP id y8mr73092wjx.83.1464025868023;
	Mon, 23 May 2016 10:51:08 -0700 (PDT)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by smtp.gmail.com with ESMTPSA id
	h14sm11389496wme.1.2016.05.23.10.51.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 May 2016 10:51:07 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 19:50:57 +0200
Message-Id: <1464025857-23995-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] Revert "image.bbclass: don't execute compression commands multiple times"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 May 2016 17:51:11 -0000

The commit breaks image_types_uboot.bbclass:

ERROR: Logfile of failure stored in: /build/linaro/build/build/tmp-glibc/work/genericarmv8-oe-linux/linaro-image-minimal-initramfs/1.0-r0/temp/log.do_image_cpio.16506
Log data follows:
| DEBUG: Executing python function set_image_size
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_cpio
| 31373 blocks
| Image Name:   linaro-image-minimal-initramfs-g
| Created:      Mon May 23 19:38:56 2016
| Image Type:   ARM Linux RAMDisk Image (gzip compressed)
| Data Size:    7326620 Bytes = 7154.90 kB = 6.99 MB
| Load Address: 00000000
| Entry Point:  00000000
| mkimage: Can't open /build/linaro/build/build/tmp-glibc/deploy/images/genericarmv8/linaro-image-minimal-initramfs-genericarmv8-20160523173835.rootfs.cpio.gz: No such file or directory

This reverts commit 94f61c2682e5cfd819ac84535650c3e0a654415a.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/image.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9f4c83f..df3bd3a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -410,13 +410,9 @@ python () {
                     # Create input image first.
                     gen_conversion_cmds(type)
                     localdata.setVar('type', type)
-                    cmd = "\t" + localdata.getVar("COMPRESS_CMD_" + ctype, True)
-                    if cmd not in cmds:
-                        cmds.append(cmd)
+                    cmds.append("\t" + localdata.getVar("COMPRESS_CMD_" + ctype, True))
                     vardeps.add('COMPRESS_CMD_' + ctype)
-                    subimage = type + "." + ctype
-                    if subimage not in subimages:
-                        subimages.append(subimage)
+                    subimages.append(type + "." + ctype)
                     if type not in alltypes:
                         rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"))
 
-- 
2.4.3


