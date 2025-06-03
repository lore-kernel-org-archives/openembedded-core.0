Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1624FC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 16:11:50 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.15848.1748967100045977768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 09:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mdt3tBP5;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so14695b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748967099; x=1749571899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rdDL1uukE3yutQMjaCedlG4HoDpuiUwqXf1WU6jMLU=;
        b=mdt3tBP5ZdejSUruSD1eNEVkNEeRddWvG9rDhiVbcBXJgBwXVkGBYFgLTOr14Xpav6
         qO0lOnwoAeJfApWWp2+t5kHaIi6PUCC4lTCjiv6Jv3P5JdQ1FNkfQpr1wpSj16WJxWtl
         P8Nmwd1vhBv4FlaYVNUDJk5yDNFWqMBUJ+49NMANs1frjx4PpQO7wIflQ7wyaDx0PENp
         +0etIul66E85ku3FWMAxFHN8qy8WLmUR//FGMLWWstnDjYMrHspCD68ATR87vcGP8k/b
         5mNHItyZqrAgi0fkVCNz7qhuHEYbpSFqhWz5Wk3j+OiGm3wwBeJSG0jIO6W5u79cXCyh
         258w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748967099; x=1749571899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rdDL1uukE3yutQMjaCedlG4HoDpuiUwqXf1WU6jMLU=;
        b=we9NgFNdYBiDJ9Xl8h80UNf8fXZJMqH/9CMECW51nucM8D9AKXAncruRDsOnFLQZXz
         7I2tHE9+1acJXudDfe/qupMWewA/5yhOjuvYILEMhLm3oXaOpU41lqkMFJQW5Egl3/TC
         S/adWwt8vzU9qEFJjstDAhCArT8ll1xtjAj/Zy7VYD5MliC0IhqXH/oy2QpTkQomwspr
         7RxU/jZtAaOLnTacRz3FHQHtsWA1lj2vlokk4xEEvMPcwCmd/321Lw9S+PH7dtR3wD6X
         fRiStxvoyR01dewSQDddAjdjZNQfbAbA6VSCO2LbIqNWehJzsgF2hF6IKkdF3lydxuIP
         mH+A==
X-Gm-Message-State: AOJu0YysZsEF8WBcZoyuoFE429JrzUgU1K2vo4vTZni+uGwW8oDfydIA
	E5MXxVtCLQmTzjIXKsA2Pmc9RboxqfHOL3W/y1FrlYQLC+vr6z8ZSzhvKNI21w==
X-Gm-Gg: ASbGncvtEuetpcebJqIAXw9qSEf9J1g3OoVSKb1g4gNFPqIYce/DyxqXO+1+/TUn0i9
	InYQq4zxWFhcEP+WU5eyXrQY0ihM3D4NagzHXIrYjiRB/KXNBqoHl+qV+lTXXJwXjoe9mblMpEp
	NHYiEU5pGI+bKS2f/7X02yu1U22l+wg88WXAnZAf/uo+iUfabpV9FG1j8Y3txl8RdBS3W/OzpZB
	V3SEtNxQqAPoDfqsw5ddPma4uTZk21bXfLXjvuTlBpShgZkj0c0VMvvTJv67vTAgTtmZng1FXXd
	Ts8L5OE9/G6smwZRFugP5ltmonARtJusnToXBudagQ==
X-Google-Smtp-Source: AGHT+IGkzg61rvFrDLlcgBLmdf58Ukee29UOv5llSd7fwxbPiC2MQs3bYMVe5WiykXB0L47dotWYmg==
X-Received: by 2002:a05:6a00:b86:b0:736:b400:b58f with SMTP id d2e1a72fcca58-747fde8480dmr4016133b3a.0.1748967098882;
        Tue, 03 Jun 2025 09:11:38 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::d6e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd441asm9596464b3a.153.2025.06.03.09.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 09:11:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 1/2] bluez: Disable invalid-pp-token warning with clang
Date: Tue,  3 Jun 2025 09:11:34 -0700
Message-ID: <20250603161135.1013947-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 16:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217818

We add FIRMWARE_DIR via CFLAGS using escapes for string and clang
option parser flags it

<command line>:4:23: warning: missing terminating '"' character [-Winvalid-pp-token]
    4 | #define FIRMWARE_DIR \"/usr/lib/firmware\"
      |                       ^

emitting this warning during configure means some tests fail wrongly. e.g.
test for enable -fPIC -DPIC, which results in textrels in libbbluetooth.so

This warning can be disabled, the string is correctly passed to sources in
the end, so its spurious

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v5: Rebase

 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7bae968094f..5835662f7a6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -84,6 +84,7 @@ EXTRA_OECONF = "\
 "
 
 CFLAGS += "-DFIRMWARE_DIR=\\"${nonarch_base_libdir}/firmware\\""
+CFLAGS:append:toolchain-clang = " -Wno-invalid-pp-token"
 
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.

