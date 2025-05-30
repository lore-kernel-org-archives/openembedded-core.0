Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE5DC5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 14:40:47 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.7733.1748616039340412660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 07:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dCXvXFNd;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234bfe37cccso28597685ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748616038; x=1749220838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b20a9U0ebOfhahs3JzWi58vFKuddsngwQhlCnnAEznI=;
        b=dCXvXFNd9SNQLeLxL7DY1l8nh9bKbkR6wFYBUg8i76qJG/NrsKU/Ul9DlkTBxJrt/D
         S13STZ+QFjMPzgtD1g2U5vCubxmOYf0330rl4NhxDUS8fW5Pfw1ZkiVFRTC1tuOt9Vz9
         T823QDAS8Co01vneDGL5fEzsTLt81ccg8ygdSCo1ii5aPIlK12unxygBVenzgpKjfLfz
         Pe7fzrzYAj2Z1L7Agssr9RISHMQhUVfujr9ieLokGM4ixVg3nq7Bw//A4n2apdf1lt57
         eFI0LUMcO6AGZUpoJBLfGTihpCnCOzxYOeozEg6FwElxRuLQpdlTALBunXK/2Uy48Qja
         dhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748616038; x=1749220838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b20a9U0ebOfhahs3JzWi58vFKuddsngwQhlCnnAEznI=;
        b=W/n0sNA8fXhQo/1RmIEudEvZjkVOrN34OSjEQvQeGVKwzGcDnwa6CIbtCRVpcp4CR+
         3S/y8W2Wtg5O2R9owKMd36H90tGoBgyWheV6nn4chbprXLbQSqvLGMoNcf/j+ODcyLaQ
         OMKhq1j8/GnwF7VLxCunMsyjFjZqyM9oFNodsOb5H++9o92RAWCM2x0c7V9AAVuWBtuI
         5TyvsHVTnb9KzyqBSzODlLXwfDzneXrxpT+BoB6FHSUP8T4M/ySLgfaoc5SjZAj/qDxd
         5FrK+pkY7HnQbsz4DtU5omtmMAiCTG3yViHZEtmNMEciCQH4lWgMlSRwIyd8SoL7UJHV
         skAQ==
X-Gm-Message-State: AOJu0YxoMYd04UJPxCVvQoMi0uyocUOMTE1cQTxvy26/TuPx7H8zSP1x
	TNvtsMio8SS2UrN2UWeJ704gNQek69b3w2qHB7XP5TOaKXkCKU80sPmp07XjSTUK
X-Gm-Gg: ASbGncvO3LrnkLQMVafK0iaFYDbjRkeyRVd8ZhNT4WsCmJ+kXTnjMlZKTA+XhuCQYNr
	/wYg5QNBzHcxmIhtsJgRH9JzWUfOnwAVVLZYnq4WffeEmtw327lHieTAirAE8rxVyLeNgccc6Dk
	EWzfMcbrVIxsrFqoqXHy9nXNs7F55hAX0T8YlUSsEw9+YtfEmRvQU8cETBuby5ib8zWYSfNhfPM
	kNGesf+FNM1GQHJDwOnCj60wJZ1WKnmb76xi4FDpjrRKJOObtu6JRpq3SM3IhnE+QF56f2ZFvcO
	f/fEPwjzrlmzOOLSTLwVRxzjnb9/55nAAtMNt0j+8B1RppLMfEg7sA==
X-Google-Smtp-Source: AGHT+IEamZJrip73KzAGAADM9HI8cn8FDtLLgZzCf9gq3t9NI7CHnVlGaW/9SraL6hl1txX3BLlv5w==
X-Received: by 2002:a17:902:cf05:b0:235:2e0:aa9 with SMTP id d9443c01a7336-235393d518cmr41599565ad.14.1748616038392;
        Fri, 30 May 2025 07:40:38 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8674sm29432205ad.5.2025.05.30.07.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:40:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Upgrade to tip of trunk
Date: Fri, 30 May 2025 07:40:35 -0700
Message-ID: <20250530144035.608464-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217508

Brings following changes

* ae3a8c93 fix strcasestr failing to find zero-length needle
* 23febbd3 align mbsnrtowcs behavior on partial character with new requirements
* 6915b348 dns resolver: reorder sockaddr union to make initialization safe
* a34ca6ea termios: fix input speed handling
* b6b81f69 clone: clear the frame pointer in the child process on relevant ports
* 5e03c03f clone: align the given stack pointer on or1k and riscv
* 06c5e4e8 signal: check sigpause() input parameter
* b0dc340b loongarch64: add bits/hwcap.h for cpu feature bits in AT_HWCAP auxv entry
* cabbd869 bind_textdomain_codeset: fix return value
* 00fb7107 shadow.h: remove declaration of function not implemented
* 362fc545 riscv: mark __restore and __restore_rt hidden
* f1cda422 i386, x86_64, x32: set the symbol type for the crt1 START function

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 5ef8d7bca97..afc459bf1c9 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "c47ad25ea3b484e10326f933e927c0bc8cded3da"
+SRCREV = "ae3a8c93a663b553e65f096498937083dad210d2"
 
 BASEVER = "1.2.5"
 

