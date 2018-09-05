Return-Path: <emmanuel.roullit@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 671C6793EA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 19:53:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a108-v6so8850580wrc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 12:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=+c8c/WlD3trcHYJbvuFsWx2xN4WoEPC3o53zJgd4GQA=;
	b=n7jJ5PagqrVN/tSqF+uc3N62b4q8sz1e189AwU/g9TWWGeZQjHL7eLSzMAo0b2raoj
	f4w68g7tTn+7D2QWNI+4tB9B/s8PH+WAoqZEGYnbkejnveoN9J6C3yX2QfkOpALSpN71
	lYtuzuJd8DcudD79XhJUHY2cFTOMBEZMdvYIlrt/OJQhHw3H5FuTy8MdVnqyE3UNAsh7
	1o1nxT7nAeSjMH1Ec9egJyHpLy+zGddizzEbFB4omN8jvGx9U1KS9CBcfVCt9Zz32LzB
	s9dm5Owk6tBukE4j4kzfMtvhQ7h2oaxFsXHHqQSjWfn8Fdkcz7afEew7sIzg1pGX+nw9
	VRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+c8c/WlD3trcHYJbvuFsWx2xN4WoEPC3o53zJgd4GQA=;
	b=bvkTV0pHEpZZZeBZQGhZf86ZbznhYZYvdO+uLbpC/sIvHBkG2xDJ3avguRMTSui/K1
	fyOnLLHYfZ47wB5S+I7lepruT3TgieGtGK4VhAyMFQDGDHzTzinYg5jXv8eFUDy6Uhav
	Zi3inLyjZV9aqgMqkogSwkU+ekNtaKo2gtu35lE6VstuHIaiV4dlrRTCTM/QujjpM2Xm
	k2LImyLw/fqOdFSU3fxfG22x/op2PnlYTodE7vuCvu+K6V/3U2LPEL4pXVb2P+BRVSzX
	ae1+1pP/RW2xbxJzBhHDQr8h7sm1LQzsTECSJsvAN3W4SKYyiKF8N4in47TU6Gpk0aH5
	44qw==
X-Gm-Message-State: APzg51A4O4qDDDROAAjJvjRrUe5a/EskqXdnbKtgsWvDogt9lLEW5yn0
	FrqK11NOXHIHi98q/XB0/yFYW/kD
X-Google-Smtp-Source: ANB0VdYAFo/IDXCF26eys+uiZcTmjCNWK1VbZwXiHxUBhgg9RB/uspe+Lhldo5agZJexX1WsEaJl/g==
X-Received: by 2002:a5d:550a:: with SMTP id
	b10-v6mr28936515wrv.228.1536177222871; 
	Wed, 05 Sep 2018 12:53:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:c1a0:808b:3900:54d5:fdcf:bff:d301])
	by smtp.gmail.com with ESMTPSA id
	r30-v6sm3871237wrc.90.2018.09.05.12.53.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Sep 2018 12:53:42 -0700 (PDT)
From: Emmanuel Roullit <emmanuel.roullit@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 21:53:25 +0200
Message-Id: <1536177205-505-1-git-send-email-emmanuel.roullit@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic: squashfs does support partition uuid
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
X-List-Received-Date: Wed, 05 Sep 2018 19:53:42 -0000

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

Removing this constrain allows a user to create squashfs-based rootfs and boot
from it with such kernel argument 'root=PARTUUID=7d46da2d-29cc-4d5a-9e39-d0381c4abb0c'

Signed-off-by: Emmanuel Roullit <emmanuel.roullit@gmail.com>
---
 scripts/lib/wic/ksparser.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index e590b2f..92f0b6d 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -196,11 +196,6 @@ class KickStart():
                         raise KickStartError('%s:%d: %s' % \
                                              (confpath, lineno, err))
                     if line.startswith('part'):
-                        # SquashFS does not support UUID
-                        if parsed.fstype == 'squashfs' and parsed.use_uuid:
-                            err = "%s:%d: SquashFS does not support UUID" \
-                                  % (confpath, lineno)
-                            raise KickStartError(err)
                         # using ArgumentParser one cannot easily tell if option
                         # was passed as argument, if said option has a default
                         # value; --overhead-factor/--extra-space cannot be used
-- 
2.7.4


