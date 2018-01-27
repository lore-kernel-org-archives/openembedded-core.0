Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0000178861
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 13:55:37 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g1so6172991wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 05:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iY3JHmxmSDK+/QD7Rfenv1Z24PsK8UrMV1vLEUz/MJQ=;
	b=a8l79Ue3AKaC5M4T2XZ9kbbbhgQ/3Pa3X69UeffFaIv6R1vArxG7lTbeXs6UUpkZaK
	1MjtgKi+fA8+oJIghuqp4Jj9L/A61coqf39Qy9C2RU5tMtYX2NML0zBxHRNTBTr4Pzvr
	K9HCG3Jg0V+K07mUj2pehOa9kUn3YWzeRtFrBqmozy02YTV15FYkd4I2iDFQI7dhhtw+
	a91tl/xpcsUFwsPSUHevpDl1HhvfAEcVMhysLJHmBmQUzlV8MLsQCVl6un/TMFf0gAp3
	SRBSg7f0HzBFMN0ejYtngJ2FtWTQcjfhtlQIhzZAqSIGfgCxiSo+3KD+QjzpUb64DYjA
	2lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iY3JHmxmSDK+/QD7Rfenv1Z24PsK8UrMV1vLEUz/MJQ=;
	b=KLZC3Hm75pVjTSAPQZkOl6aM9rfVhfSBOAOUT0dmiKidbUcHOybVmkwF282/rdV2HL
	amjKpru+ay62Goh57omGPF+3mHBeJX5OOQdV2FYeMQ+kyJ0AGiI9Tv80k0A6NKlE4fmo
	RBzQt8/rD+dkQ1VioJRkCDkDYc8mWwnVYUbV/3wCWs6R8oykjSKvFxaQ9YXH98LsV7C/
	0NvuTDaWtsscdfaahR42veaUHfHDob/UUSaYaOJgjoksvuNDbTF4f9S8tJimHYo/64rM
	KOwrwN69Z8biVHUyz2J0zClzZBkuqV2L8vYsfFBR9hbjoVNICkHkEIgyoqZCqfGMkUEz
	db8g==
X-Gm-Message-State: AKwxytcRWie+Mi5lg5/EUfCxTLrkrhx8pRtDEnBEUGbJt0iZPCeE3psK
	QChdcMRvhVrJ18UzCla88Sdeyg==
X-Google-Smtp-Source: AH8x224IafYeG6EENLdLfioZnbOyb5073/gYufRNSKuXgQ7fON+zhgove16qiyEPBNuiuSKFmszYjg==
X-Received: by 10.80.133.33 with SMTP id 30mr39303857edr.24.1517061338142;
	Sat, 27 Jan 2018 05:55:38 -0800 (PST)
Received: from Saturn.local.all ([195.48.14.138])
	by smtp.gmail.com with ESMTPSA id
	g21sm3979356edg.88.2018.01.27.05.55.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Jan 2018 05:55:37 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Jan 2018 14:54:08 +0100
Message-Id: <20180127135409.9369-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.13.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] image_types: tar with --numeric-owner
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
X-List-Received-Date: Sat, 27 Jan 2018 13:55:38 -0000

If --numeric-owner is neither used when creating or extracting the archive
containing the rootfs then tar tries to change the numeric uid/gid of the
files based on user/group names of the host used to extract the archive.

Create the archive with --numeric-owner to remove the burden of having to
use --numeric-owner when extracting.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index b17c435274..aeb22a2b59 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -125,7 +125,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 # required when extracting, but it seems prudent to use it in both cases.
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
2.13.6


