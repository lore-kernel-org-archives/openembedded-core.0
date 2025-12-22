Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CE0E69197
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87796.1766434096589579800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DI/VTqkH;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b76b5afdf04so633097566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434095; x=1767038895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lTmnLGv339Smyx/wg7d0Q/GWKBA1ZvnqDXsvHmyClk=;
        b=DI/VTqkHiBbWiVNKCZhDWEHKyCTKpJ4eegHQztato3zrClhRjnAfheuM297qnQayDH
         YtefXkefw8++Z0RNorwZCAXPzU/1caeNXobbVfDowFTtfDJubiIH20C7Y5BWjiuWQD06
         Bmdv9OOjC/lMGFhxLrvszgdBS86y2U3tg/H668rS0VOwPa92F9tPFOL6rHA1+mt/yYaA
         ce6cnnYs7iMbMRmUwZ58VOJIEq8zM/B+BgcUVliubSYivytQvLo2XSqklPoIfXV3q7HB
         SiXZjx/EoEPK2TwVOhVkzLqBjmq+o4i6sY0zHb7o78vKpd7q9U+W0uW8C+JdvhmphTd0
         G4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434095; x=1767038895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5lTmnLGv339Smyx/wg7d0Q/GWKBA1ZvnqDXsvHmyClk=;
        b=XPAR4GXXeTsmWDs02sm79ny/F0aluw3ykif5Z95mSM/5hliIGd4AI16OBFAKgOYTKw
         2kOTcOeQhrEvNRJAiScbtWVitKYPJMRSkfOAq66D2fKUK0EHDtc+VVik4wyybRrJNSkg
         rjp3l/0wCyFt1oJZcB3bp/14K0oJhJU8CHDJHCTlfas/FZeai6cwp5Q5ZPsIW1YjhbKW
         urD0gvuOI97Uh+g0wlHJdH9CyGTdG0o8VlY8Z9xC4OlQJ7CSa31pESMcZJ6Z2LImJXp2
         RdA9VWOQGGlUSPwRkI4rCF54TSxvgmYDpmYInvm0ZNwk8+THF2ef19dTqLI2KKOcQ2R0
         7MKg==
X-Gm-Message-State: AOJu0YzTrrdFjhSVDsaOu6px9jmlwmHgsmrILBzb8LZ3IoVOnibFCCY4
	WNyN1T4gYYlxkeZjxoSbj/Vt7L3Bc5jn5190BIfU1UHkCVFfTuas1/AIn5ZOOA==
X-Gm-Gg: AY/fxX6UyBq3Iirg1EHzPMoNQ5WRID0n0q7zeKm4mkoLqfwpKvCvhCM3sqH5nR6ubFY
	QAvaMrbs7aiQY0A/VCpsmqDacuR+YW3+EDtAk2jfL5FWF8nULpzXOuOMCwkjrdDrWlvhOTLUvZK
	8rJV0xOxp9uvHUaoq1t7DK1rybjA7mTwzY9vJb5NVPRrXIaEQiDLsjezt7geYf7TbnkgQSigd7T
	8mspjiFmPqEIJ3Q4j5TzlpEtcZox0uoPe6ACt7CBk9m/31PYx572+LM5hKScSlCo1uK6N+CNrqo
	sjUgoDOnq+V5+ZhMfR08d/iyo1CFar3oggNypuZtK8+K10J5RbhMUM9O1XoCVnjGDeJ3mBvQoR8
	hmwPKNAtQCcWn8+OWNhCpRExyJQxli4SrcokZBb6rBwCwS5EW3S64S2kbv6LgHBIei+iT4smAbO
	SJnfYY8iCAB9B/++hYo+coONAUmAQYqz5L4IoeZqDzaieu5At32WnsA1MLpQ==
X-Google-Smtp-Source: AGHT+IHDX3VLFhound6+T4UVvn0fO5gtGOVvseSsEn+OYTAcCNOi/RWupnoly9uTOtgcGN+AWasKsg==
X-Received: by 2002:a17:907:1c17:b0:b76:4c16:6afa with SMTP id a640c23a62f3a-b8036f637d8mr1335093766b.28.1766434094768;
        Mon, 22 Dec 2025 12:08:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 041/114] libva: upgrade 2.22.0 -> 2.23.0
Date: Mon, 22 Dec 2025 21:06:23 +0100
Message-ID: <20251222200739.2278706-41-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228366

From: Alexander Kanavin <alex@linutronix.de>

Convert libva to git, as upstream doesn't publish tarballs anymore.
libva-utils is already using git to get the source.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libva-initial_2.22.0.bb => libva-initial_2.23.0.bb} | 0
 .../{libva-utils_2.22.0.bb => libva-utils_2.23.0.bb}     | 4 ++--
 meta/recipes-graphics/libva/libva.inc                    | 9 +++++----
 .../libva/{libva_2.22.0.bb => libva_2.23.0.bb}           | 0
 4 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.22.0.bb => libva-initial_2.23.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva-utils_2.22.0.bb => libva-utils_2.23.0.bb} (88%)
 rename meta/recipes-graphics/libva/{libva_2.22.0.bb => libva_2.23.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.22.0.bb b/meta/recipes-graphics/libva/libva-initial_2.23.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.22.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.23.0.bb
diff --git a/meta/recipes-graphics/libva/libva-utils_2.22.0.bb b/meta/recipes-graphics/libva/libva-utils_2.23.0.bb
similarity index 88%
rename from meta/recipes-graphics/libva/libva-utils_2.22.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.23.0.bb
index de36f01afd..970ff50ac9 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.22.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.23.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.22-branch;protocol=https"
-SRCREV = "1a13ae13382b7b548f3a7e8035e1d7df66662c0a"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.23-branch;protocol=https;tag=${PV}"
+SRCREV = "5896b6779d36f83bf483aff62da8aae30ba8d664"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
 
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 5dda701ed0..b3ec4f61d1 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -16,13 +16,14 @@ BUGTRACKER = "https://github.com/intel/libva/issues"
 SECTION = "x11"
 LICENSE = "MIT"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "e3da2250654c8d52b3f59f8cb3f3d8e7fb1a2ee64378dbc400fbc5663de7edb8"
 
-S = "${UNPACKDIR}/libva-${PV}"
+SRC_URI = "git://github.com/intel/libva.git;branch=v2.23-branch;protocol=https;tag=${PV}"
+SRCREV = "dbf83dc3b1ce6bad46e1628aaf2da5ef731157b8"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>(\d+(\.\d+)+))$"
 
-GITHUB_BASE_URI = "https://github.com/intel/libva/releases"
+S = "${UNPACKDIR}/libva-${PV}"
 
 DEPENDS = "libdrm"
 
diff --git a/meta/recipes-graphics/libva/libva_2.22.0.bb b/meta/recipes-graphics/libva/libva_2.23.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.22.0.bb
rename to meta/recipes-graphics/libva/libva_2.23.0.bb
-- 
2.47.3


