Return-Path: <emmanuel.roullit@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B45E479711
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 18:06:00 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o18-v6so12239723wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 11:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=kwfiweYQRKGnz82Gg76pBZVzWS3QC0y3T5WjPcCn0Eg=;
	b=YskLXlJ/VzSmdVWshGGLZlZT6JKUblOIHsErRwUir7lWchk1wkdlcSGA7rWAR3P3WW
	x7gCfJ5UDkEYD6xmhBPLHMjyEbde3fiVKnR9YmRGKh2P+4cso/9KeHin//VKWYLcTm6s
	97+XiFX3wyepDU0IDL1kdGAbB5QnMf+lq2XTkOLp0iJqCCckArmg19dOLRkTpRZDCx5x
	VqaoXmKpkAixeF4PM7RfZ34H0n3tAKCxjqMglVa5ucRYdNIyRCnVIXi25Uoc+19ohPGY
	SUIKm0TCh7QNcdAg0iLUL3qZh3nnRBlAdlPxhGNIU4IKtU2IZmrEppn+XGYY/Z7waqnK
	vBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kwfiweYQRKGnz82Gg76pBZVzWS3QC0y3T5WjPcCn0Eg=;
	b=BVXlhlzGm/lHsr+QipAD6A6btZbCt3s6izITbor6yEin4AJS+n931AD+UHy2oH5lFJ
	dlBeLCKqdO5Qssxge1w9yAlM2ZKyDx2/1vTDgqvsKYZv7h3DaQbe7eYbVgw691JbkFdI
	j2OqpDl6PH0kNNVJ097/EKSzsJGOqK4h87ob+JhrflZgc2H72/YX1cv2w/O9sAPYreJY
	qxKJ0D8T7J6Vx+pm/r2nwwY1v/LyM0mSC5SLTD/6WqHI4lcyOo38U8HQFz5SPI0YqVX4
	zoNiN7C8yw66uPLKoqH34Nlk1/JFxJ5EuGi167vBQvhWEYdY5vTlB++KL7rgu82ygZsK
	oLFg==
X-Gm-Message-State: APzg51BdjLe7ELvJuhspqiiK4DWI+gcVnSEwNM4AkLJKLEf8wXu1I5LG
	3KY2P36WmaqeGCJrlm8ZUHXfiQ0n
X-Google-Smtp-Source: ANB0VdZ4PadQePrkuzvL/CQD/K1sD2gCm3svbWszzN4FgdBq0WGD73xQHG91Xf+BoZgNgu2igS8t8A==
X-Received: by 2002:a1c:80d8:: with SMTP id
	b207-v6mr2984017wmd.146.1536257161233; 
	Thu, 06 Sep 2018 11:06:01 -0700 (PDT)
Received: from localhost.localdomain
	([2a00:c1a0:808b:3900:2cbe:fdfa:c866:6e4a])
	by smtp.gmail.com with ESMTPSA id
	e133-v6sm10322947wma.33.2018.09.06.11.06.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 11:06:00 -0700 (PDT)
From: Emmanuel Roullit <emmanuel.roullit@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 20:05:52 +0200
Message-Id: <1536257152-491-1-git-send-email-emmanuel.roullit@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] wic: squashfs does support partition uuid.
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
X-List-Received-Date: Thu, 06 Sep 2018 18:06:01 -0000

wic allows the user to create disk image and reference each created
partitions via its partition UUID.

squashfs does not support filesystem UUID but it does offer support for
partition UUID.

$ lsblk -o NAME,FSTYPE,UUID,PARTUUID
NAME   FSTYPE   UUID                                 PARTUUID
sda
|-sda1 vfat     6078-ACD0                            95aa4ffb-741d-4d99-adf6-0358bc890046
|-sda2 squashfs                                      7d46da2d-29cc-4d5a-9e39-d0381c4abb0c
|-sda3 squashfs                                      d4a3e24e-410a-4f2c-8ad5-8f8321de177b
|-sda4 ext4     d72ec529-78e4-4cd3-b39b-781b6b1cb47c f3edc990-f4f6-4536-9587-44dae4ceb99f
`-sda5 ext4     a0b265aa-e935-40b8-9c6b-e9e58ad3890f 6e72ebaa-29ed-41cd-844c-3f76976cf41d

Modifying this constrain allows a user to create squashfs-based rootfs and boot
from them with such kernel argument 'root=PARTUUID=7d46da2d-29cc-4d5a-9e39-d0381c4abb0c'

Fixes: 2fbdcf4e59c8 ("wic: kparser.py: Check for SquashFS and use-uuid")
Signed-off-by: Emmanuel Roullit <emmanuel.roullit@gmail.com>
---
 scripts/lib/wic/ksparser.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index e590b2f..a5d2918 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -196,8 +196,8 @@ class KickStart():
                         raise KickStartError('%s:%d: %s' % \
                                              (confpath, lineno, err))
                     if line.startswith('part'):
-                        # SquashFS does not support UUID
-                        if parsed.fstype == 'squashfs' and parsed.use_uuid:
+                        # SquashFS does not support filesystem UUID
+                        if parsed.fstype == 'squashfs' and parsed.fsuuid:
                             err = "%s:%d: SquashFS does not support UUID" \
                                   % (confpath, lineno)
                             raise KickStartError(err)
-- 
2.7.4


