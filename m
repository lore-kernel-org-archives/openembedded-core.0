Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C1DD3B7DA
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 17:26:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11348.1765041979573737187
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Dec 2025 09:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vsGlw7UJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6D8C81A1FC0
	for <openembedded-core@lists.openembedded.org>; Sat,  6 Dec 2025 17:26:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39C09606AC;
	Sat,  6 Dec 2025 17:26:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75C23102F2205;
	Sat,  6 Dec 2025 18:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765041976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d3HX2OBq4jdgaG5hRh7PtbCvSC7JVO56d9RCxlnz7TY=;
	b=vsGlw7UJN9nXhQDWQifb59cYonU4/3JnOL59JU3jEwQTsVeCRCAOGdSvGMm+ULT85c5ITa
	lNmI6pyOeTQJY6JMORDZtzHR/4hybLT4Dgt5Q4V1bJDKJwqIgloGYJwMgRcrDvNziFxH+j
	dhrNllXfUVLwI6mgu4IRQm6ya37TLD6+wKiLs9OxyA/riQ49x/3WhKzKTHaCoJFBXC32jS
	cBMXcCVQHIV8D4j/MiRAPXP0xTk/P+gpWbGprvbGXR8mz9lrHOCJXJG+3h4/lSUA3edwag
	on3JmPrCmpmwOrz3HsceszMpPUlP8Yh2BpmKwDdOrOaQIXrdYpNtsi+66KQsWQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 06 Dec 2025 18:25:52 +0100
Subject: [PATCH 2/2] qemu: backport block image size check fix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20251206-mathieu-qemu-image-sizes-v1-2-144f17f417a3@bootlin.com>
References: <20251206-mathieu-qemu-image-sizes-v1-0-144f17f417a3@bootlin.com>
In-Reply-To: <20251206-mathieu-qemu-image-sizes-v1-0-144f17f417a3@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jon Mason <jon.mason@arm.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765041973; l=7010;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=px8l1ZHYFeThRWHSBpuXp/j8aczrmpfaUxtD0RHY/5s=;
 b=Q6YQayVt4PxvkIiMmR91sfNdp1YhaTLKmRsMRlWIkvXZtvH9jMd9SLdvSe41cHJKJoY5cP9ZY
 Q79gefkp4rEB/FJMgZf7k7Ei4BvEq9rqyEuW6PRVwU5a29vB3nx/B6x
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 17:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227369

Backport qemu patch relaxing size requirements on sdcard sizes, allowing
to use sizes that are not powers of 2, as long as they are above the
SDSC max capacity (2GiB).

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 ...rd-Fix-size-check-for-backing-block-image.patch | 126 +++++++++++++++=
++++++
 2 files changed, 127 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index e02ebd656751..63414196fa15 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-f=
or-.patch \
+           file://0012-hw-sd-sdcard-Fix-size-check-for-backing-block-ima=
ge.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0012-hw-sd-sdcard-Fix-size-c=
heck-for-backing-block-image.patch b/meta/recipes-devtools/qemu/qemu/0012=
-hw-sd-sdcard-Fix-size-check-for-backing-block-image.patch
new file mode 100644
index 000000000000..a8e570db335a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-hw-sd-sdcard-Fix-size-check-fo=
r-backing-block-image.patch
@@ -0,0 +1,126 @@
+From be0a5f477ae2c73d80ade595f28783d85e1ef3e0 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sun, 24 Aug 2025 09:18:33 +0200
+Subject: [PATCH 10/10] hw/sd/sdcard: Fix size check for backing block im=
age
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Alignment rules apply the the individual partitions (user, boot, later
+on also RPMB) and depend both on the size of the image and the type of
+the device. Up to and including 2GB, the power-of-2 rule applies to the
+user data area. For larger images, multiples of 512 sectors must be used
+for eMMC and multiples of 512K for SD-cards. Fix the check accordingly
+and also detect if the image is too small to even hold the boot
+partitions.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Reviewed-by: Warner Losh <imp@bsdimp.com>
+Message-ID: <591f6d8a9dc86428723cb6876df6e717cc41a70e.1762261430.git.jan=
.kiszka@siemens.com>
+Tested-by: C=C3=A9dric Le Goater <clg@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/a362b19a39e458256cc7e3acd0dc7825b0389b48]
+Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
+---
+ hw/sd/sd.c | 67 ++++++++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 47 insertions(+), 20 deletions(-)
+
+diff --git a/hw/sd/sd.c b/hw/sd/sd.c
+index e541c57f8c3c..db86849b8512 100644
+--- a/hw/sd/sd.c
++++ b/hw/sd/sd.c
+@@ -2675,9 +2675,32 @@ static void sd_instance_finalize(Object *obj)
+     timer_free(sd->ocr_power_timer);
+ }
+=20
++static void sd_blk_size_error(SDState *sd, int64_t blk_size,
++                              int64_t blk_size_aligned, const char *rul=
e,
++                              Error **errp)
++{
++    const char *dev_type =3D sd_is_emmc(sd) ? "eMMC" : "SD card";
++    char *blk_size_str;
++
++    blk_size_str =3D size_to_str(blk_size);
++    error_setg(errp, "Invalid %s size: %s", dev_type, blk_size_str);
++    g_free(blk_size_str);
++
++    blk_size_str =3D size_to_str(blk_size_aligned);
++    error_append_hint(errp,
++                      "%s size has to be %s, e.g. %s.\n"
++                      "You can resize disk images with"
++                      " 'qemu-img resize <imagefile> <new-size>'\n"
++                      "(note that this will lose data if you make the"
++                      " image smaller than it currently is).\n",
++                      dev_type, rule, blk_size_str);
++    g_free(blk_size_str);
++}
++
+ static void sd_realize(DeviceState *dev, Error **errp)
+ {
+     SDState *sd =3D SDMMC_COMMON(dev);
++    int64_t blk_size =3D -ENOMEDIUM;
+     int ret;
+=20
+     switch (sd->spec_version) {
+@@ -2690,32 +2713,36 @@ static void sd_realize(DeviceState *dev, Error *=
*errp)
+     }
+=20
+     if (sd->blk) {
+-        int64_t blk_size;
+-
+         if (!blk_supports_write_perm(sd->blk)) {
+             error_setg(errp, "Cannot use read-only drive as SD card");
+             return;
+         }
+=20
+         blk_size =3D blk_getlength(sd->blk);
+-        if (blk_size > 0 && !is_power_of_2(blk_size)) {
+-            int64_t blk_size_aligned =3D pow2ceil(blk_size);
+-            char *blk_size_str;
+-
+-            blk_size_str =3D size_to_str(blk_size);
+-            error_setg(errp, "Invalid SD card size: %s", blk_size_str);
+-            g_free(blk_size_str);
+-
+-            blk_size_str =3D size_to_str(blk_size_aligned);
+-            error_append_hint(errp,
+-                              "SD card size has to be a power of 2, e.g=
. %s.\n"
+-                              "You can resize disk images with"
+-                              " 'qemu-img resize <imagefile> <new-size>=
'\n"
+-                              "(note that this will lose data if you ma=
ke the"
+-                              " image smaller than it currently is).\n"=
,
+-                              blk_size_str);
+-            g_free(blk_size_str);
+-
++    }
++    if (blk_size >=3D 0) {
++        blk_size -=3D sd->boot_part_size * 2;
++        if (blk_size > SDSC_MAX_CAPACITY) {
++            if (sd_is_emmc(sd) &&
++                !QEMU_IS_ALIGNED(blk_size, 1 << HWBLOCK_SHIFT)) {
++                int64_t blk_size_aligned =3D
++                    ((blk_size >> HWBLOCK_SHIFT) + 1) << HWBLOCK_SHIFT;
++                sd_blk_size_error(sd, blk_size, blk_size_aligned,
++                                  "multiples of 512", errp);
++                return;
++            } else if (!sd_is_emmc(sd) &&
++                !QEMU_IS_ALIGNED(blk_size, 512 * KiB)) {
++                int64_t blk_size_aligned =3D ((blk_size >> 19) + 1) << =
19;
++                sd_blk_size_error(sd, blk_size, blk_size_aligned,
++                                  "multiples of 512K", errp);
++                return;
++            }
++        } else if (blk_size > 0 && !is_power_of_2(blk_size)) {
++            sd_blk_size_error(sd, blk_size, pow2ceil(blk_size), "a powe=
r of 2",
++                              errp);
++            return;
++        } else if (blk_size < 0) {
++            error_setg(errp, "eMMC image smaller than boot partitions")=
;
+             return;
+         }
+=20
+--=20
+2.47.3
+

--=20
2.47.3


