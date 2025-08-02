Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD65C87FD3
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 21:13:12 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.6142.1754169187838101088
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 14:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=Vwe7A1v3;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.160.169, mailfrom: anakin@childerhose.ca)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ab5aec969eso41605051cf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 14:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754169186; x=1754773986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiBVCm3kHuI0cgqd/pUxZ4FQ9wbP5vfgW9pyekiWoog=;
        b=Vwe7A1v3AU7z0DHHo37bfoGAYdVLlxfeOyN9CpNi+4skaZXmnK1j25Jl73KNH9WpZ+
         BIeCtj6gPXHIL2WJ5zFAYuFz0+AR9rCYdNYkG+Qdwy9D1r0xwtYTcDMYkbOKm7jU+roV
         aA7QEpo4w2LlgUMEfvAmqHhXBX8DF2K0gTyOVYk9jlIOby1N4GSuX5bnLSBkqkN5op52
         zpJ/3T+E0cPXnaXv8gqMFmxWROz92uhUo3ydS3mCtEn9cOrfbc4gICS4EXOOvydJ/1kU
         URNleLYWgyAsxvIlxr0WyKjYwxaPDwUhvflUV0CWaklMgRsPtJSCJZ6Kd5WWxofyZa8s
         FZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754169186; x=1754773986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiBVCm3kHuI0cgqd/pUxZ4FQ9wbP5vfgW9pyekiWoog=;
        b=G+FOyxtcYHrpCiJYcH81Tztu1LeW/a6Qk6nNqFqntLwuV8L676LRkq27qWyh/k74x+
         OvSHw2Jrrg6DO0ufwC+vINCEw+Zk+BB44NkZfhoAFnxbhix70NGDAr75nA0Cyp6X+uGz
         Ow2fFS/ua2F4rHWMdafmgh8mtWw30VBU5z32ADAr/Pn1ZsJ9MnTSMsMQ4MBoUFbvFbMU
         bZ7T4BnR/GlSdQp+UQiguS0kMa1FHQ2pv5gY7HzkD6rq0/QjY/WyGJGJs9Qv58igtgmy
         KZSaP2fx7Qx1Z9QU13K6ozUc+8USliyKU24m51fvctYjYbTlJbrRQyEnulbpGUTT5yqV
         QQAg==
X-Gm-Message-State: AOJu0YxWBG8mZ4zPJKjlW72Pj+r+CrgFx2Fbjmpe1GWTepNHwvchOGmi
	tnLfuhXTPDeJvVucaZrOwifBmdnNFKBSZPKAlNq0Gw2Vv6qUOhOxt6m/F//raHeeuU4LH+n14dd
	Ivhy52GHACA==
X-Gm-Gg: ASbGnct7UGQIu70rC5eq3SrHQDXYslLUfSaBzBqbaPTIOAqJuKurxNpAVm20FMEon2J
	6Xw9eyR9Rf7zfxMqi0PD4iEUoP4nNsQzesW3E86qkoqTLDfXcD03klCMg/PtUch7ZTJNxebKgE8
	2D9J7wuapI4+Sb+KBhkNOCtaT8QgZz6Sv+VUWhO5Re3TJIRbU+xkIp2BEmtSFloNnXmYMIlghzx
	6rrtzz7Ks5WzD/moH+2x7ZqRlLm96K3bdru3PuAA5vyKFVac5SjFxhsht1a0WP5eq6RlFx5EhyC
	cRl2IHkTrpm+3o6rnU+PyV//xtlaiidHDht8/hQNfdXBO/MWehqnlzmUUxZLZ1zrwk9zgx0HD7x
	81POkWtg4F4qlkRMw
X-Google-Smtp-Source: AGHT+IHiPqGaF5Wvuhycl/+8UNHvMBwWqyYy9JbECqPZ959+TaLcHALPZZKJKgdd5dHtQA9lpv+gVw==
X-Received: by 2002:a05:622a:2cc:b0:4ab:95a7:cfa1 with SMTP id d75a77b69052e-4af10d5b0bemr83807731cf.56.1754169186539;
        Sat, 02 Aug 2025 14:13:06 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4af230d8a21sm4955651cf.51.2025.08.02.14.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 14:13:05 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 3/3] meson.bbclass: inherit compile_commands.bbclass
Date: Sat,  2 Aug 2025 17:13:19 -0400
Message-ID: <20250802211319.20060-4-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250802211319.20060-1-anakin@childerhose.ca>
References: <20250802211319.20060-1-anakin@childerhose.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 21:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221391

meson.bbclass generates a compile_commands.json file by default in ${B}.
To automatically configure the clangd language server, link the
compile_commands.json file to ${S} via compile_commands.bbclass.

Signed-off-by: Anakin Childerhose <anakin@childerhose.ca>
---
 meta/classes-recipe/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index c8b3e1ec29..4f5d7b9e5e 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit python3native meson-routines qemu
+inherit python3native meson-routines qemu compile_commands
 
 DEPENDS:append = " meson-native ninja-native"
 
-- 
2.50.1


