Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42012C28B28
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 07:29:57 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.5798.1742023790332269383
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 00:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aLqXsjdy;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22403cbb47fso52028805ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742023789; x=1742628589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6H0xrArj6j9O8aUkjLK4QdI+063+1y70QVLJ/uTvw4=;
        b=aLqXsjdya+6u9dVMSkTmtcVtdA1WriednGsdQlgTpYzlDzNuFZWxCYoJzjdptBghc4
         ObiMJCOR6ED8+gSWZWIGUq9TiWKP7XZ388lgffEpZ3QeuB0+TT1zwRlZK5NiBZ0iuEP6
         PlvVTPgY8cZ0LzfJUMmZ2UoQBR8XrnWruGy1g8vKBCYaS8FzaOZl/WonFtsoXD2ut2o1
         RPjIU+ApHUiY+kqod2zuVYVpgNQP2p/P81EXvmbkU+n385/a1kZ6JecLrwbnLzF5U8XJ
         OOhxLECBu0t5TqAQwvzOTyYzSke7OvQmtoDn+mbTsCc7ZxuJHUXqJfZk2c/Ec26LKiFi
         3lPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742023789; x=1742628589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6H0xrArj6j9O8aUkjLK4QdI+063+1y70QVLJ/uTvw4=;
        b=TbHg/aKjkxlnbTRq8gAPTFPe5QIWy26rcNZNJYx7GqZH+BhwO3hY8I3md7uFIcSlLJ
         juAepD3H+be2zrkg4vNpliWM5KGGiCe+VKzGsCRNG2oMsIN12XWSP16HAGED4XB8xZ6v
         TWbAV+ZAt4z+JNAGdPC9WbThdVe8sLyCKruLGwLr+mpRswUWt16Jz+i5QM8dj5aMmasX
         fxD4YuJ8wVhl3QU6j4mJvc5xm9En4j/VC9UbAYBb6S5GNetuBbVBp5hXjiEMMlOqWgrB
         QlZe5ai1JMrm8L/LECeo38MzJy1LjADXhdo8FX50S7eeWIaq4+67GjdmByTHv12R+IvN
         m39A==
X-Gm-Message-State: AOJu0YwMi88qTswPTXQtQrbKD599fnws8c962pAUvWZApqL0p7K9N7GE
	BX+guzF2rL0em+UuAu9D17KX8JjhRBc50bpB/U6Sm+v1gDjysikVymuvhMCc
X-Gm-Gg: ASbGnctcNGdAcsZksRW2GDNnfabWPErdU5ebznZp7mQj3ThFXr01CIdpeixWzYsj3tf
	HqTLgVQi9CkP2ANFguRkQaJWyd/wjBU0C12+Yhc2vOuHuPa3XaDta1L1kGBnYCSZfHV6/IrLqXU
	DJDhKVxqY19P6dR5VoyUid4AK2KbJuiYnMqIBghn26KCTfR0yEVzMduB2J/N66jkOcv3EMkYSUt
	YKszXiG+g8B/P1+cSu//wSNrlVqHLlVOY280YPl9igr42qtWYie79MrjRkWxtLgIjXVxs0Hwd3S
	IlaqrLQVf0vB3X8Sm8N4m+pLhwN4zki+9CF3
X-Google-Smtp-Source: AGHT+IHvDOa4CXCtOkg+S9mkrbuOAKnXg/R3dUWgAJqRiiSTeZBSpPykETID8UMYdDatAeT5H0SBGQ==
X-Received: by 2002:a05:6a21:9185:b0:1f5:70af:a32a with SMTP id adf61e73a8af0-1f5c1386049mr8609967637.32.1742023789308;
        Sat, 15 Mar 2025 00:29:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea7c7ffsm3147561a12.55.2025.03.15.00.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 00:29:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] m4: Stick to C17 standard
Date: Sat, 15 Mar 2025 00:29:46 -0700
Message-ID: <20250315072946.215678-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 07:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212868

GCC15 imposes C23 by default and 1.4.19 release has gnulib version which
can not be compiled without errors, while new release of m4 is in progress
we might use C17 until then and use GCC15 to compile it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index 8fb13f543b2..6a6aa21dafe 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -27,6 +27,8 @@ EXTRA_OECONF += "--without-libsigsegv-prefix"
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 
+CFLAGS += "-std=gnu17"
+
 do_compile_ptest() {
 	cd ${B}/tests
 	sed -i '/^buildtest-TESTS: /c buildtest-TESTS: $(TESTS) $(check_LIBRARIES) $(check_PROGRAMS)' Makefile

