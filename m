Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887F8CD5BDE
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 08:31:35 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15713.1779870694552437738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 01:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=XMTWvmWI;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.52, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bceb7fdd44fso127458466b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 01:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779870693; x=1780475493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vrZJvvdGWC+k6AGKilzLdlHrZlhRlNC8nKHtAReDmC0=;
        b=XMTWvmWIohWAFZsbyxHZb4i1r9pwWmPQ5iAzUXP9Ku9rTFeswnadSvA+dElJJBL9Fu
         9kullNb/ziPSt7ZF/gAq5o0boWWRsRv3T4vdmZ9bYjRO3i4f6I7o/A3u24buabOit7aj
         JBQBlVb2m8eqi1UU0EpxZ33+CxYrX4eJJfZMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779870693; x=1780475493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrZJvvdGWC+k6AGKilzLdlHrZlhRlNC8nKHtAReDmC0=;
        b=AzcTL62/xvJVisP5PpdywT6V1fQb27xhGKC0q+Wy5tZ+21IR0vWr4EufyNFwnltm43
         u5J8U4+hbgER6XEmGmUcrRxeTQrJyuhhlnoIx4nZJkVl+DesqzmHMAsbczojbgf8RyMc
         1QHMjStfHkEsuiY2+Muhfqz0GI5bwNkEU4L/NvAsR5KPbkzdjPaA/Eeq4mGWT5+VsR+R
         Fslvxo+Pv5mIrcggrGPlpDJV1zXBElcT2QbC5RNZsuZDiCUWhQDKVRnLP9pT/Qi8LKpP
         PhhvB88wupyrefAk3kP5T5VeSX1yuhV0751dfqpbbP44CPTCE3CPr0GEZymblE+KcxcX
         3Zfg==
X-Gm-Message-State: AOJu0YwRzHYo7um0NedkAmV/CLMqrrLQUMQc7LR397otSdiRh0vAu+JN
	ya8rtOuKyP8EiRGkdF76pNqV70XRehlixIyME9cDviL/YgZ5Mt3c9x4CW8Hqz/6Fhe8mUbWFoIx
	qEKey
X-Gm-Gg: Acq92OHQvZnGk4axWss1/d+QGvwn2fC0NDBXwmw6GbIxu50f4hqww8Y4wxqISBYhLzO
	E8rqeVCCLUXwYSsx3UrLxC+Tx53IXBQG2aFLYFr2onbO5rAr/W6p+5ijFbNmjiLtFcQqwfjT1AH
	KvnqJLUyYaZMwcDiVXaMXdexR5cOw9aqzP0VudS0p8l08IWyrkEgFWlGYli/2hHCLpZq5hs/11I
	m7DbBsQvNWbZqUu43Py8kw/qTAUMsmzUzeJISQBLOlKNaflt0QhD2/Qk4yVyJ9mdFVrwMMKfYfq
	U/lgPsle8VWafIc/98Em8GtulzfMz2tKI4PcQ3EevqRUVv34FFodaw1JO759CTP2z2vZA3QhvXJ
	iXFqpQG2YXX5BoIogEBrS1Ee1YBJH9AjEYuePWHBMRDapP35vsPJy0kkmSosMiy1MF9eWLhnqzm
	UYlWl1r+nv1ZH2prgO9ZFSqdQbdRj/+63E8uDzlQiYkS2upuIEzZpGrxelMienh0fJpZmPf69ag
	zfRXUM2iJsVUXlAxlULrHb2wfV9dn/KvkxM3mGndmXBI9P8gyMyAXRbQ6pSiZ6weVNjigFodpcq
	3kzDhKDHRQpTkeG6VZFzOC4XQs6IkiUd
X-Received: by 2002:a17:907:86a2:b0:bcc:ddd5:1451 with SMTP id a640c23a62f3a-bdd1fe95262mr551797566b.0.1779870692505;
        Wed, 27 May 2026 01:31:32 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-1333-c39e-a751-6a95.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:1333:c39e:a751:6a95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ecf243sm570679566b.36.2026.05.27.01.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:31:32 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Jesse Van Gavere <jesse.vangavere@teledyne.com>,
	Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH] rust: export CARGO_BUILD_TARGET
Date: Wed, 27 May 2026 10:31:30 +0200
Message-ID: <20260527083130.9094-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 08:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237632

From: Jesse Van Gavere <jesse.vangavere@teledyne.com>

To cross compile a rust project with the SDK one currently has to know
the associated target sys and run cargo build with it, by setting
CARGO_BUILD_TARGET to the rust target sys, running cargo build after
sourcing the SDK will immediately have the correct target.
See https://doc.rust-lang.org/cargo/reference/config.html#buildtarget

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Jesse Van Gavere <jesse.vangavere@teledyne.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index df8b78d326..f083bcda82 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -59,6 +59,7 @@ do_install () {
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
 
-- 
2.43.0


