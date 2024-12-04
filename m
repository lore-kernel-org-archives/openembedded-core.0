Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAEAE77173
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8148.1733294975884414019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fzPm2qLL;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so2700635e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294974; x=1733899774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH1G3D6xjY8GNNHI0WnQ1hqfx/9mOzl5gcWCJCYQ4IM=;
        b=fzPm2qLLP3dEZZYyYLx8HKMu+Ok3/cDcwg8kDDZB9vuP/Eguvk1pCXIHoMU2zZdLun
         CCsQTc8UAwxwKMvtGtSndnIZtrDFLCxSxz4XVRe45GAAh5YX5Ih3wmEPGOOA2sqfog0i
         c3zL5hbWM1CrZuMjzxjJVGn1wVNXz5IFB6taF6GinQRJTAC0trwecQZ/1OoxOs4pKyLv
         VaXQiT0vJU8kl9IZBd4VJ4y7WyEGg7Y9kPPIE2n0zK8mYTxsFwZM11DB13vrOZRW2Ooh
         YIpllG12ou4UK6SoCLGt2bMEp73GFgRPks4OWgvqv1e1LhlOAGDpVU7jLhhKSeC/xZ3r
         K1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294974; x=1733899774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TH1G3D6xjY8GNNHI0WnQ1hqfx/9mOzl5gcWCJCYQ4IM=;
        b=YYRivAeVssgW7Yd9i5bzmupJkdjK0agph5z7mgqG1hZ/8O8W0iv0WRPHRHb/nMQioi
         pFH72oq+bpdC4brZ5RfZ7Rb/qOvUhFvPbzHB4cTpCAeIDpvlIXrMo7NdoPkzqQqRBWkP
         wa4cekHmLbF7nwPpny5NEgG6vI4whUzhcMNd+/I4jezkTFv3DcEi0Ro88ml9Ae3dWdHQ
         91V55Na8YGU+WKswNpH5KFPS+IwcQ0Lvb7Q28kXIu/Xm+FRbpCjZ6k8s0/TlwgowEabd
         4iqIN8ETM22sv23T6jejoA3wlBTjBlYm7t+ydGNvlC4j3QMt/tBYa9qInONgmClTJv/P
         unpQ==
X-Gm-Message-State: AOJu0YxGh/d75QG4I/rZZVXXtf28P+yfRDjZSZ1FUlv/XXMkiMdtvWyv
	dL7CaLnFTnByXNKAiBXg4/2qa/wMWTG2al5W81+Mk8TloFiZG7T1UytooQ==
X-Gm-Gg: ASbGncsKSRmsZ2jsNCqA7LCdxjbkQxS7GDbDRZcqGiZMiY5uIq4nVkvhDnMAqli8pOc
	iYWcnXZX699BNE6tbr1m+bgnUSpNXsCRgmNdbiSTXpVWDcGa1HM2hfpB7yig5XCGPp+eOVR+m+w
	QKEoqE+Z7BnicxCZo6GlttAPNhSIA4+gM2A3U5+MLo/o66S2WJjukAacW6MGGss+iai4y/zP4zU
	SotPBjJRGXfQ8jGb9GEhr0jMFtevn2WrbJvtSc2JwuU01RiGILbnKZo3OqUBN/Fy8qgGdw+wS1b
	FITd2hpiFkk=
X-Google-Smtp-Source: AGHT+IH7ISPsrD2owQSDjw6iEKZf+emp1wy8SqCeHZfR/98yJRxWNKEHclUZfry80iREG/gS9CkcUg==
X-Received: by 2002:a05:600c:4fcc:b0:42c:b67b:816b with SMTP id 5b1f17b1804b1-434afb8dea4mr219574745e9.1.1733294974044;
        Tue, 03 Dec 2024 22:49:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/37] cargo.bbclass: do not install libraries by default
Date: Wed,  4 Dec 2024 07:48:49 +0100
Message-Id: <20241204064920.817016-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208235

From: Alexander Kanavin <alex@linutronix.de>

'cargo install' only installs executables and examples into the system,
and we should follow that. Libraries are vendored into
build trees from the crate registry and then baked directly into executables.

Neverthless, there's now a condition variable, so individual recipes can
opt into installing libraries if there's a use case for it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/cargo.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 0829a58dd90..b583f84bdfd 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -61,9 +61,11 @@ cargo_do_install () {
 	for tgt in "${B}/target/${CARGO_TARGET_SUBDIR}/"*; do
 		case $tgt in
 		*.so|*.rlib)
-			install -d "${D}${rustlibdir}"
-			install -m755 "$tgt" "${D}${rustlibdir}"
-			have_installed=true
+                        if [ -n "${CARGO_INSTALL_LIBRARIES}" ]; then
+				install -d "${D}${rustlibdir}"
+				install -m755 "$tgt" "${D}${rustlibdir}"
+				have_installed=true
+			fi
 			;;
 		*examples)
 			if [ -d "$tgt" ]; then
-- 
2.39.5


