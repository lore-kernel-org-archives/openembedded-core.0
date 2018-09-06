Return-Path: <emmanuel.roullit@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2715179708
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:58:24 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e1-v6so3274082wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=KiWI0rWpjXdMOz5MzLobttz9mEX2aXMZHroAdMG+gZM=;
	b=g4E6wAAtd/68qPquFfZ6xAKpZNwJFsefqZu4tZ6iDrDVyG5PmDjfaQApg7/E1TTGLY
	V0nasd7u/xMW2zJSCF83JSHxlowONhnjhNpM62HMAWB1ZWXQw1APsfOWUrgYHvuZAUY5
	64RRhnm/EqBLlRYXwiFDX2Lua+99DZ+BOjsIyBOAzwAEF+9YYFgwIbHD2lJPu6RodP1Q
	3K8RQNQdN3cRDrSDh0c3rkygPJHh97p+xPs5ygbhCa6UOCg5HuNmVwuAs+uR3KObZNRf
	jnScbaWzw+cb2QQEINEYZOfhypypOtm25OZdUaym/lpnktGKe4yQdUCwDJeJY6Ot42BR
	Rdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KiWI0rWpjXdMOz5MzLobttz9mEX2aXMZHroAdMG+gZM=;
	b=bwaP9CthzqXdwTqKFQ2AwEO+YPws4gpKJzgZbyufrThzzhENDlPYO756CbejLpLNDl
	/5Gf0+LY01Sw0+1pyBl83vbCUPYA6IZcRr2xp11A/nA9GQfty6oA6nmccVHYctLlkVqa
	y0JMVbsGSKlisODvrXqdy0b+jyGEep+J4qgMl+WWViEpB8c+Kb0S68/xlFdSMN4FCjez
	/kpbrled3pCqkjRCI7fwe9Xdagq0190g5eGSq29XzrPAua5TFtllryP+oVdR6+J2461O
	LtGE/qhilTdSlLpsYR70sN7S5Xcutrlcea84SuOlMCiKkPuYQ21NdtQWv2W5rpooxDA2
	GmCw==
X-Gm-Message-State: APzg51BPvgjO56KIsNyHs7lJ4oG5xQrP34pK9cG8Y+3yQy/qChIWLbMO
	WE4HanTlihDll4Xx2w3p1LfNYPr3
X-Google-Smtp-Source: ANB0VdZh8pE/7F4kvRHfeUQqb/2CTWrXdeYCqidSkk5rCIf1kiMpQJIRG58zMQDAnN8ncIApRXekBQ==
X-Received: by 2002:adf:808f:: with SMTP id
	15-v6mr3403099wrl.204.1536256705479; 
	Thu, 06 Sep 2018 10:58:25 -0700 (PDT)
Received: from localhost.localdomain
	([2a00:c1a0:808b:3900:2cbe:fdfa:c866:6e4a])
	by smtp.gmail.com with ESMTPSA id
	h10-v6sm8258890wmf.44.2018.09.06.10.58.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 10:58:24 -0700 (PDT)
From: Emmanuel Roullit <emmanuel.roullit@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 19:57:37 +0200
Message-Id: <1536256657-30925-1-git-send-email-emmanuel.roullit@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] wic: squashfs does support partition uuid.
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
X-List-Received-Date: Thu, 06 Sep 2018 17:58:25 -0000

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


