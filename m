Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6080ED58D5F
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 15:47:45 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.21774.1732549663650615251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 07:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T5Y+DUpw;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a76156af6bso15707505ab.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 07:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732549662; x=1733154462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QbSYFoQIt1sf/epBKYjr1WXpKkr7IJWeqqO9QoymQNI=;
        b=T5Y+DUpwiw9HdJDe9QZV5Qgbz0wVK0ovYv0V0EkBbujjZ4EGGxscZWWzoyS1KhRUaE
         ufy1FVft1rJoxpPrq7UhJ8zD0DJi2sh9FRDqLlvIDF/DIsA3gvmXl1TuNQfq/qbmkaKc
         Y0aAduGRT5U0YoQpr5tTRwwHYdcdO6h+qWP1rQcd2Ft3m5Okx02z8LNvRHvqJHsTE0bi
         YEja6NyiWYDjdkawArJpFQkJtCiCLXy7cz4Z6oznx3hSSeGxAvQD1hyEzrKCA9scZryG
         /HriM2XbL9Wh/MZlxldPFaKgFPCo58LoKBgdozipst63PVldNtonpLghWjqRQVRYqHdo
         OO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732549662; x=1733154462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbSYFoQIt1sf/epBKYjr1WXpKkr7IJWeqqO9QoymQNI=;
        b=OqFRTOydJElXimkR+knny16JuKwN1Y4+nWegQqKVQmpqIvMC4pmnUkC6EWj+reIyBL
         ihnUHsfaTO08fNyuNHMCvmPKDMBtVDrKlcDkV1kw5gueZwtP0LOfNlkYlZD3RMtpby6T
         cDvsy6PbCuKUR57jzinbj46iaW2cUMjdVan8q7eCn51RC+rfeGDuYBVCuRDQ1ifUNx9g
         OZKe9hz1DBdT4e/LhHLfOn1U+9Mq/UHQVrn9fFKpVjGPD+tdtnohT6CDFGQExvrO4h6H
         K+bX5kPTViXxyta7dQUvJYZNil6w/z6yTCLMiISQuDQRVrGjP1dlA7lDKNGkWniEhHpI
         gcJA==
X-Gm-Message-State: AOJu0YwZQXgKh4qGguAHNVkO+Qq2ZCq35iIM0EKvXFc1qbtQKt4VZNbW
	ZjC/D7pYx9031F68F9uznI9t6IbsVbqUM3CN+9QTi9PmiwhaXNVVdfJjYg==
X-Gm-Gg: ASbGnctLc7JcWtLNqdMhzy6O2tV9LR4e0Dx1PTW5Qob5ZfbdpSoje3wcqcYJRtoW2QW
	WanU5qGSi9jECYMV+rxpUyQs2pG39c4zXjEF1w72icyX73yojU4hWlL+Ic4ig/nkY03wg2evF79
	Zk2nD0Tz1NoC8cI/G8oWkG55x+8nplrlxXtimvTD4TsOyWuvX9PdjOOAwFhQ083apktsHF048zO
	mjOc1Cnr9PLOIApZprtwph4IdoXFpWu7y4zDMl+aHbcVqTw6Cyyno5wIKkhM3cVOp2JhVg6JxBw
	28iDVQ==
X-Google-Smtp-Source: AGHT+IGofaoGuzjW7WWqorRFPloAiZWGfpbR/RaHcshvfvcF4xdqgd6txsJXjwJIMpnhVF7m6sYeng==
X-Received: by 2002:a05:6e02:160c:b0:3a7:7a68:44e2 with SMTP id e9e14a558f8ab-3a79aeacd6dmr147695325ab.15.1732549662632;
        Mon, 25 Nov 2024 07:47:42 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a79acb8808sm17793305ab.74.2024.11.25.07.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 07:47:41 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH] systemd: more optimistic dlopen notes processing
Date: Mon, 25 Nov 2024 09:47:39 -0600
Message-ID: <20241125154739.416548-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 15:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207790

From: Dan McGregor <dan.mcgregor@usask.ca>

Ignore shared object names that differ from names we've already
processed only by their version number. This assumes that the
highest priority is first in the list, and ignores those later
in the list if we've alredy found one.

I saw this with the qrencode PACKAGECONFIG enabled. Its note lists
both libqrencode.so.4 and libqrencode.so.3, which led to a packaging
warning.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/systemd/dlopen-deps.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-core/systemd/dlopen-deps.inc
index e0b333398c2..18768d43491 100644
--- a/meta/recipes-core/systemd/dlopen-deps.inc
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -3,7 +3,7 @@ PACKAGEFUNCS =+ "package_generate_dlopen_deps"
 python package_generate_dlopen_deps() {
     # https://systemd.io/ELF_DLOPEN_METADATA/
 
-    import struct, json
+    import struct, json, re
 
     def extract_segment(filename, segment):
         """
@@ -66,14 +66,18 @@ python package_generate_dlopen_deps() {
                     elf = oe.qa.ELFFile(f)
                     elf.open()
                     for dep in parse(extract_segment(f, ".note.dlopen"), elf.isLittleEndian()):
+                        # Ignore sonames if a higher priority version is found
+                        seen_sonames = []
                         for soname in dep["soname"]:
+                            base_soname = re.sub(r'\.so($|\..*$)', '', soname)
                             if soname in shlibs:
                                 # TODO assumes the first match is good
                                 package, version = list(shlibs[soname].values())[0]
                                 dependency = dep_map[dep["priority"]]
                                 bb.note(f"{pkg}: adding {dependency} on {package} via .note.dlopen")
                                 d.appendVar(f"{dependency}:{pkg}", f" {package} (>= {version})")
-                            else:
+                                seen_sonames.append(base_soname)
+                            elif base_soname not in seen_sonames:
                                 bb.warn(f"cannot find {soname}")
                 except oe.qa.NotELFFileError as e:
                     bb.note(f"Cannot extract ELF notes: {e}")
-- 
2.47.0


