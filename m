Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87295C5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 07:20:54 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10853.1786213023696355941
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 11:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elder-tomes-com.20251104.gappssmtp.com header.s=20251104 header.b=lu8RMUFd;
 spf=pass (domain: elder-tomes.com, ip: 74.125.224.45, mailfrom: levi.shafter@elder-tomes.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-669944f60b3so667691d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 11:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elder-tomes-com.20251104.gappssmtp.com; s=20251104; t=1786213023; x=1786817823; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:content-language:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ViBhAyqgpTUtu6s1BTP5ADB62vJw0mJv0tQUkAQYnU=;
        b=lu8RMUFdYRdSC7vlDDSYFCKVGv9nDvW9sEMWCbgwn/u35lEl9ffhSjEG6i2P9QREYn
         Qachvt6rivdqYJA4lmrizuxjsLB5Yo3dLuSdp0iLlMO59iADYJe28JYViyYUmuoN//Qv
         35kKB0eu/QemWKTfdzeiZ2Wcjtbq+VpKmvRC7GexM0/qD+RIYD4u4egTM4uR5UfngJ7W
         EI8TuXK5+aWzoJ/dyh4PNDnp8SgrvREEIrdqP5g8+BbZzZSWNCEpGlgqyeLpRNeG4wwe
         /nGi9L52+poJ0H54NK051VyGqRJRFaYiSX/AAWncrVj0Uh67NVsu3tBDO/BmT7LOVMb7
         zXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786213023; x=1786817823;
        h=content-transfer-encoding:content-type:content-language:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ViBhAyqgpTUtu6s1BTP5ADB62vJw0mJv0tQUkAQYnU=;
        b=HFclRbQfBNZhJ0at6F8Wj7xkE3mk/Jslak5enn/btsfHzkLi9s/JOEZIOTFg0pUcnU
         u72BFHpTxwzEoEV0zzuEv+jDcemN17/TaYo+t5cyjpRciKOU+ydlrKVjANt2OEpoaqwi
         B1FKe4lqNXtZjaRhJ8RZdN7bCDuedfaAoWbtY4pi67KGrGnEZMOKCGDUfjrCbZu/eiJ7
         f60zWDJBSTaAoroXX7U+ySzSnfcuNazGpBIrlYwX4RSDuczjuJSgr+WwG2FPQ4CjqYHo
         SYR4yYCzoCcDOwF1+guecnXLG2s8JGst38q+PP7oZu+X/DRFg1Mvjg4kAABzN2+cbhzt
         iyNA==
X-Gm-Message-State: AOJu0YzPhsamp670CHo4eynYBVig21lwnHeTbV8TXH6IPlzJRdbDofqy
	KpaXN1TH103hFAourX1BoB6B2PRgV42vPm2wFezR0i7/NPwpspcn2FSlxLlREbUzA1azVb0KfC1
	UUn2Z
X-Gm-Gg: AR+sD12VYOcZuwS8DcSTWbtH2pC87pcPIcL8K1bHADWoC0m9xM3Gqs6pEqR2CqvHJw4
	jOUTju7oPnnWwFep8scKarBjGGMh3ucg9MUUljbitNhbutr/uNU+d4RqmdX1hcfadr5lN/0fGs4
	7hJ1Bz6BSlXww5TC+HIMpL9x7VnIHFQcY9B5bOdunS/dYLQorkd+y4GFSBS9Ny+JWfoo16XwRrG
	lW6KTdLu1KVvnS8ugwMHnvAUumLL+oAvfXPQyw8H7s2RPNGCHHqi4v+ukzLmiKC4Sz8Bd0SWILY
	Kfew+zdIC9WwWiGIR4X6urkeR86Kt9azNgOFsOACoj1oqBkDwWSDj7RWm2F/NfZeQBYDUkbfdrT
	kAP0Y29tAxQEWUOR/m2J3dvw7wqqg5gxmcgSO2tpx6j7yjdkJd65PqvR/wD1Fo1f8r8VgVy0oz1
	EsQPP7VAGPe7wEVDxn8Ah6I2fq7/lQ6SzXuMRgPW7eIOcYjnDo1fHVRy7Pia+PigNxJXgfj6nD9
	g8pUxTYvK52M3d6KKut81Zt8kqdeC/7E1gvOw33
X-Received: by 2002:a05:6820:1889:b0:6ac:c1b4:1a21 with SMTP id 006d021491bc7-6ae96c1b323mr16877170eaf.6.1786212712931;
        Sat, 08 Aug 2026 11:11:52 -0700 (PDT)
Received: from [192.168.0.86] (ip-204-57-18-28.co.bambroadband.net. [204.57.18.28])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a9e431sm4462965fac.6.2026.08.08.11.11.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 11:11:52 -0700 (PDT)
Message-ID: <a380db6d-e22b-4417-ac04-d32cc23c698a@elder-tomes.com>
Date: Sat, 8 Aug 2026 12:11:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Levi Shafter <levi.shafter@elder-tomes.com>
Subject: [PATCH] image_types: make oe_mkext234fs reproducible
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 07:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243064

oe_mkext234fs() creates ext2/3/4 images with mke2fs and then runs
"fsck -pvfD". Unlike the ext4 partitions produced by wic
(scripts/lib/wic/partition.py), this direct IMAGE_CMD path embeds build
time into the result and is not reproducible:

  - mke2fs picks a random directory hash seed, and the fsck "-D" pass
    reorders every directory using it;
  - mke2fs and e2fsck stamp the superblock mkfs/write/last-check times
    with the wall clock.

When SOURCE_DATE_EPOCH is set, apply the same handling wic already uses
for its ext4 partitions:

  - export E2FSPROGS_FAKE_TIME and pass a deterministic "-E hash_seed"
    derived from SOURCE_DATE_EPOCH (reusing wic's namespace UUID);
  - after mkfs+fsck, normalize the superblock time fields with debugfs,
    since e2fsck stamps wtime/lastcheck with the current time even under
    E2FSPROGS_FAKE_TIME (debugfs takes epochs with a leading '@').

The filesystem UUID is still assigned by mke2fs and is left for the user
to pin (e.g. "-U ..." via EXTRA_IMAGECMD), matching wic where the UUID
comes from the .wks.

Verified with comparison via xdelta3, getfattr, find, debugfs, and
dumpe2fs between two custom builds using the patch against two custom
builds omitting the patch. Builds were successful, and no delta was
observed due to the usage of fsck.

[YOCTO #16110]

Signed-off-by: Levi Shafter <lshafter@elder-tomes.com>
---
Sponsor: 21SoftWare LLC

v2: Pass deterministic data instead of implementing fsck toggle
v1: https://lists.openembedded.org/g/openembedded-core/topic/117020092

 meta/classes-recipe/image_types.bbclass | 32
++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass
b/meta/classes-recipe/image_types.bbclass
index ca13729225..c0b3a78013 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -72,6 +72,17 @@ IMAGE_CMD:jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS}
--faketime --output=${IMGDE

 IMAGE_CMD:cramfs = "mkfs.cramfs ${IMAGE_ROOTFS}
${IMGDEPLOYDIR}/${IMAGE_NAME}.cramfs ${EXTRA_IMAGECMD}"

+# Derive a deterministic directory hash seed from SOURCE_DATE_EPOCH so
+# reproducible builds get stable ext2/3/4 directory indexes
+def oe_ext234_hash_seed(d):
+    sde = d.getVar('SOURCE_DATE_EPOCH')
+    if not sde:
+        return ''
+    import uuid
+    return
str(uuid.uuid5(uuid.UUID('e7429877-e7b3-4a68-a5c9-2f2fdf33d460'), sde))
+
+REPRODUCIBLE_EXT234_HASH_SEED ?= "${@oe_ext234_hash_seed(d)}"
+
 oe_mkext234fs () {
 	fstype=$1
 	extra_imagecmd=""
@@ -81,6 +92,14 @@ oe_mkext234fs () {
 		extra_imagecmd=$@
 	fi

+	# For reproducible builds, make mke2fs/e2fsck deterministic: a fixed
time and
+	# directory hash seed (the fsck "-D" pass reorders directories using it).
+	# This mirrors what wic does for its ext4 partitions.
+	if [ -n "$SOURCE_DATE_EPOCH" ]; then
+		export E2FSPROGS_FAKE_TIME="$SOURCE_DATE_EPOCH"
+		extra_imagecmd="$extra_imagecmd -E
hash_seed=${REPRODUCIBLE_EXT234_HASH_SEED}"
+	fi
+
 	# If generating an empty image the size of the sparse block should be
large
 	# enough to allocate an ext4 filesystem using 4096 bytes per inode,
this is
 	# about 60K, so dd needs a minimum count of 60, with bs=1024 (bytes
per IO)
@@ -98,6 +117,19 @@ oe_mkext234fs () {
 	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype
-d ${IMAGE_ROOTFS}
 	# Error codes 0-3 indicate successfull operation of fsck (no errors or
errors corrected)
 	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype || [ $? -le 3 ]
+
+	# e2fsck stamps the superblock write/last-check times with the current
time
+	# even under E2FSPROGS_FAKE_TIME, so normalize every superblock time field
+	if [ -n "$SOURCE_DATE_EPOCH" ]; then
+		printf '%s\n' \
+			"set_super_value mkfs_time @$SOURCE_DATE_EPOCH" \
+			"set_super_value wtime @$SOURCE_DATE_EPOCH" \
+			"set_super_value lastcheck @$SOURCE_DATE_EPOCH" \
+			"set_super_value mtime @0" \
+			"set_super_value first_error_time @0" \
+			"set_super_value last_error_time @0" \
+			| debugfs -w -f - ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype
+	fi
 }

 IMAGE_CMD:ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"

