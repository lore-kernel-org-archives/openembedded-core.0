Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F3EF3ED7B
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 03:58:09 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.221949.1775966281318317947
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2026 20:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b46tIpeW;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so7380638eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 20:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775966280; x=1776571080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1qowTnWcIGXA1JJZz7u5xCDHP4rtNQWDT3kVstMMcY=;
        b=b46tIpeWgRuZ0e0kn8iffH8bHdZ2BTjsGrEC30/pJ4/E+qcI6q/R6N0GpTapxsR5g9
         +yObm81+8Rj/4jcjiNxXN57K0ieiVDbVkN3kNAP8QfJwvTNNPVoysASkqU5Q6mo8EY+H
         IrCfcPLzxEc0g84d9cOpv/cUqk0+86ixF1IRwLOIeA92s0dQON2T7IR8fSd0wIJZTgWn
         cOpdy6FC8V2O+mFgUfUBjOOk5ib/1uPxJXSUnzVSimtGKgJuvvBTOrkmQvejZioUiPLZ
         d8YUOajkrxdgypa1ws8By0rVw9DE6qcDo5NZOfxI6qICT7MWXVRPJtLLZeENTv5mmJ8V
         Ez6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775966280; x=1776571080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1qowTnWcIGXA1JJZz7u5xCDHP4rtNQWDT3kVstMMcY=;
        b=R1m6T6oFejiVxdDzQyXhBFiAHGjSzExMpplY3Swjo9gT70hV9W8Pq9wGjV71Aa0yVd
         Z9CM9aZGieIvWkVXz5hRQiG4Yq9Kn4ix+QjaYPAjLDiH+zfrSAFPwcR51fAUxwbkB3mH
         3tvp6t0SL7HAIhp0G1OKbdQBqSUHewG333nU67uoKbguutVtNKFt+UXD04pKIlpnNbNp
         sm/0HmehyGc2fL2B8ZV3auPO9ZlIWg5aEgI9MefvASGf/dDM9livVvo7okNZscCgF492
         vDKHzB8iTZq7wedwCMH7vbvaKOlGVSt4pEeNxRPxdizjZ8WdZohvfaZ6qG9f8LU6MSKg
         HKIQ==
X-Gm-Message-State: AOJu0Ywzd6S4DivG/IS5H7lsQdnKYubvgHwkMrafJ3X7/pOT2stocGfZ
	dib8ae56QQSsE/T5VSQ/roeNTCOr1dO2kwYGgPOD0zi53NqSwbeiKrqEUv43xkmv
X-Gm-Gg: AeBDieuKpbI/aTmjqWFWYyEODBeK+oshpexFI0BhHBXM3vk2jY6hm9LXJ2ZdPq5OUvd
	MEyp2LUZKnZBPB4xXMv2fkyEDTdnQDPx68xDe2SGVL5VrOsUc9yfp5CbJY/QmVUC6MO7EfpR01C
	HNqSWUZKUgtgkAJPY2J8xbxP/zy//UDXtNC+ZEDEVdcdC9xvDG3u21xAFyWuI9uy7vBv7XsbYAU
	sV7M6rwi3E39B/X2r/aA7AzHl58k6Jn4J08iRizTB8MdY587QSNGTaXqFnQN9nLak55XUtkcjDb
	MBBSPjGRVOEGSLw6t4kBH1UsJq4DiCHS1udB5B18EDb8tKF0XNFsoiM7aqZfrTWPSnW2TwHodYi
	gmmTzZmOvhy7kN7TwtNInfcOJP7jaRhPJAktMuKI0iXlatxt55hdZPlYeYe/qlgy2Kcn7LGZpUD
	2wja7fkL8E3llrbw1gZh0i/eJ9XUddUAQVlw7qv+IUvJYoUisdxy1wX7B6/okthtQiB/TkNEUMz
	EgcQ6dGAnvU8eJ0RtaYA3VAiN7/NbnVRZVDs90G4zXnMNcV6QStg7e8wIKr
X-Received: by 2002:a05:693c:2d91:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-2d5898a73famr5557807eec.20.1775966280211;
        Sat, 11 Apr 2026 20:58:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d7d55sm11018878eec.22.2026.04.11.20.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 20:57:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2] u-boot-tools: Add dependency on libyaml for dtschema validation
Date: Sat, 11 Apr 2026 20:57:57 -0700
Message-ID: <20260412035757.134385-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 03:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235052

yamltree host tool, used to emit YAML from the DT, is now
built as part of the normal u-boot-tools build to support
the schema infrastructure

Fixes link errors like

| /usr/bin/ld: scripts/dtc/yamltree.o: in function `dt_to_yaml':
| yamltree.c:(.text+0x91b): undefined reference to `yaml_emitter_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x926): undefined reference to `yaml_emitter_set_output_file'
| /usr/bin/ld: yamltree.c:(.text+0x933): undefined reference to `yaml_stream_start_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x93e): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x957): undefined reference to `yaml_document_start_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x962): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x983): undefined reference to `yaml_sequence_start_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x98e): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9ab): undefined reference to `yaml_sequence_end_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x9b6): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9c8): undefined reference to `yaml_document_end_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x9d3): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9e3): undefined reference to `yaml_stream_end_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x9ee): undefined reference to `yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9fa): undefined reference to `yaml_emitter_delete'

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Add dep on native libyalm alone

 meta/recipes-bsp/u-boot/u-boot-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
index 4e4f7fa092..a055409c2c 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -1,5 +1,5 @@
 SUMMARY = "U-Boot bootloader tools"
-DEPENDS += "gnutls openssl util-linux swig-native"
+DEPENDS += "gnutls openssl util-linux swig-native libyaml-native"

 inherit python3native
 export STAGING_INCDIR = "${STAGING_INCDIR_NATIVE}"

