Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A91E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:41 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.8144.1733294973560558203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HT1aw36a;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434ab114753so54310105e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294972; x=1733899772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2OX4UzviGYZv5diDFdOzf7UBeFyurMd+NiJVuaDF58=;
        b=HT1aw36a3iPsnuKmLY6AvT1OTDyvINCByn3MozNseQ92LXvOzZuX9wFkaw6yPAouV+
         vI/T3KUCJrfNLM/hIivy1XpscwNGAk9xmLPIPB0PUuIGqJGK2BjdcqjzICrAPZUqIdYb
         7WhMCZO18flQa0OV3A1F3X93UbX7scDNgnB12P3J6pW0flK6nHZBllofbCkxcUKkUd5+
         NifnaBSM47yHJZJpA9jcA3j660sXl27tuLzzrHVPlc7AwpQiDlaq2LWLYNzhxXW9gvi2
         9DExQ/9bffGcC0w0z+MynFIgtRzgkETHTJiiiEZyPTSU/vHs4dBEMs3Ymdy2VuZluEfU
         QEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294972; x=1733899772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2OX4UzviGYZv5diDFdOzf7UBeFyurMd+NiJVuaDF58=;
        b=WdotYT8+uaJ5XT8z4dngp9ZVAWoFTg+UhCpWFtv/zui1KHergdEih5dc9MdHK/sA8e
         pC0OAJQk+qZD8D0uPVJAxmQFy7nUmKkUorVNjIi7MmDb5Ql7APbeRm16soiNkkws77bn
         iIT7YHhEwa/6GddAXugvUjQSAJray/UNgLhku02RyGYuqiRgUedi7FwzpivBQdQqDrw3
         TPDQsTNvNN9hhzWfy2CmXc8aN7agvpRAivqPBudywb2xpe8LGdu8vL0q2eMDskWUN3K8
         baqclPujZPZsne0s7jX6at03m6wYvn4qdlnA3/se+nkz1nJ80uRvtg9nZJxYtrko2gHJ
         KaQw==
X-Gm-Message-State: AOJu0YyGZeL2yGDcm6od1XBf6HQ8vA9KwyBTjXl4CnEwj0Hdek0b08O3
	zSvsNIuAGKYVWku2OUN6xHlUAQj1pL8A9iRnFs1AZ1oidiCmdOZ/jB/+VA==
X-Gm-Gg: ASbGnctBzLO7w/5M3EUth2RP7dmbzC8YDHvGWRtJ76SH0qWaz3qtWMkx2ZbWXTJW19e
	TaGbXnuPXT4nQKEIzdkIO0cLnrEYJWp6kNdSDL6wZ5debWIOgqCDD2GLAqk1dcfRgB2cm5/E7JR
	p2mC43wAfST1D+aeiSEeH6UrXX6LZ2zhH1ZAZu4KkmqBI+waZ+HJns0dsFK1z7zuKliFJq8s83C
	ACKz4wHAhtOmzSLlseT7nUGY3YK4hkaPxK9C6vU8uO8ExRtN8lP2PMoN2wYiLbTzsOh71Hi5e9h
	IrkdOpWHb7o=
X-Google-Smtp-Source: AGHT+IEcnAEBr2hFmWkGMErsRTYUhMTFnWJBTnkkYgHm6YMiT2F5Tl9KuOQH13LtMTvAWcGzmY/UiA==
X-Received: by 2002:a05:600c:4e8a:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-434d09c8d82mr46019335e9.15.1733294971675;
        Tue, 03 Dec 2024 22:49:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/37] barebox: add more common items into shared .inc with barebox-tools
Date: Wed,  4 Dec 2024 07:48:46 +0100
Message-Id: <20241204064920.817016-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208232

From: Alexander Kanavin <alex@linutronix.de>

barebox-tools needs to be updated in lockstep with barebox,
and was already once erroneously updated to 2024.10 without
barebox itself.

Particularly, this change puts PV into .inc as well for both
recipes. This will allow AUH to produce correct update patches,
as barebox recipe is mutually exclusive with u-boot, and
so isn't handled by AUH. mesa-gl recipe uses a similar trick
with mesa.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-bsp/barebox/barebox-common.inc            |  8 ++++++++
 .../{barebox-tools_2024.10.0.bb => barebox-tools.bb}   |  9 ++-------
 meta/recipes-bsp/barebox/barebox-version.inc           |  1 -
 .../barebox/{barebox_2024.10.0.bb => barebox.bb}       | 10 ++--------
 4 files changed, 12 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-bsp/barebox/barebox-common.inc
 rename meta/recipes-bsp/barebox/{barebox-tools_2024.10.0.bb => barebox-tools.bb} (83%)
 delete mode 100644 meta/recipes-bsp/barebox/barebox-version.inc
 rename meta/recipes-bsp/barebox/{barebox_2024.10.0.bb => barebox.bb} (67%)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
new file mode 100644
index 00000000000..5dcdb707578
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -0,0 +1,8 @@
+HOMEPAGE = "https://barebox.org/"
+SECTION = "bootloaders"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
+
+PV = "2024.10.0"
+SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"
diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
similarity index 83%
rename from meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
rename to meta/recipes-bsp/barebox/barebox-tools.bb
index 25d6a5c0622..2a117bc9c08 100644
--- a/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -1,16 +1,11 @@
 SUMMARY = "barebox bootloader tools"
-HOMEPAGE = "https://barebox.org/"
-SECTION = "bootloaders"
+
+require barebox-common.inc
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
 DEPENDS = "bison-native flex-native libusb1"
 
-SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-
-require barebox-version.inc
-
 S = "${WORKDIR}/barebox-${PV}"
 B = "${WORKDIR}/build"
 
diff --git a/meta/recipes-bsp/barebox/barebox-version.inc b/meta/recipes-bsp/barebox/barebox-version.inc
deleted file mode 100644
index d008c49f289..00000000000
--- a/meta/recipes-bsp/barebox/barebox-version.inc
+++ /dev/null
@@ -1 +0,0 @@
-SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"
diff --git a/meta/recipes-bsp/barebox/barebox_2024.10.0.bb b/meta/recipes-bsp/barebox/barebox.bb
similarity index 67%
rename from meta/recipes-bsp/barebox/barebox_2024.10.0.bb
rename to meta/recipes-bsp/barebox/barebox.bb
index aa63be4080c..dc9ae669d76 100644
--- a/meta/recipes-bsp/barebox/barebox_2024.10.0.bb
+++ b/meta/recipes-bsp/barebox/barebox.bb
@@ -4,15 +4,9 @@ but also for initial hardware bringup and development. \
 Users should feel right at home with a shell with UNIX-like virtual file system access to hardware, \
 Linux kernel driver API for making driver porting easier, \
 and a subset of the POSIX C library for writing more command-line utilities."
-HOMEPAGE = "https://barebox.org/"
-SECTION = "bootloaders"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
+require barebox-common.inc
 inherit barebox
 
-SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2 \
-           file://0001-lib-lz4-use-lz4-instead-of-lz4c.patch \
+SRC_URI += "file://0001-lib-lz4-use-lz4-instead-of-lz4c.patch \
            "
-
-require barebox-version.inc
-- 
2.39.5


