Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E35C25B5F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 10:20:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.17151.1714990830549012210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 03:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EkPTJgqB;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34da84cb755so1449627f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990828; x=1715595628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk3ppHPMXtK9DpE8H5wTOVQ0suG+vk21bdxr54jLn/M=;
        b=EkPTJgqB9wZYFiAJl5IOkdjldL+DjEne7qExHILI9enTYOrbXFkskpS+RmcCxE6KsN
         6XFyWHNM1vYB7oIxpHTldzRWuDLbKvF35Gz1WMgEafE0XepVF3Pt6rq6SozyXMfS4QR2
         /UgllswtRTDaD6HeGLGT1eIpkRwIbDOKNvRRNgdw1xVWsQw8Cc+Yjz9FJalEpi/wCFJN
         JAGQ0NhyBZTRXge2GNgfBr3VZJOl+vnLvITzbooCT0/KqCCbZtO84WmTaBIo2GSq1t/M
         27ZGMvpw/yEzhuywqySzcrtFGsUWQY3Yf7WKJ58pPYXsKrdO840M8LcmNbrd2ScatTwZ
         RlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990828; x=1715595628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk3ppHPMXtK9DpE8H5wTOVQ0suG+vk21bdxr54jLn/M=;
        b=O6IIVNctDd/LD/BoV9wwdQZzFdwtNUxmieh91GfgMEHq25JwRR+054IV6p4/Zr1nMA
         XHJQSa8GMXPx6ToAX7zJGDnmq0a+zKgEmrnWrE6lhtbtEZzzt2ZkSj+0aZAUcKpKJvl7
         id8Q0Djg630wWPxmQY7auW2ukI4xFo7UPiZ08XIho7EsuK0wKf84SkLC5dnKbdK7XAbh
         1F/yqV/RSt5RdfC0OWtKQxBSEwKtZgXaMU8EVLjSYoYnxlAO7uVv47hWCjLHKJux7eeV
         T2PiXG2IIWJEKqUxyDhkW/fiYYTrwQFO8yfUNJQBTsUSAf508titJHLuopve+ADGMkKg
         hjLw==
X-Gm-Message-State: AOJu0YwVw+/MA2oKXvRnwbXgIfUPNIwks+lgRQBPaBIJyZjA5fsMLuHj
	93n9SO+FhBrvaiBNn4Cp8azymSZorPkrCUuWz8dc6W9E8OSOBGBI2/3JR6Iz
X-Google-Smtp-Source: AGHT+IERGzsJ/fZQCpMunoTk9ba2VmFd3R29W8GwhInYWg3LKh5lOAYNw/Iv4rPIKs6r6UvNpwODjA==
X-Received: by 2002:adf:e40e:0:b0:34c:4b26:cf7f with SMTP id g14-20020adfe40e000000b0034c4b26cf7fmr5989271wrm.67.1714990828564;
        Mon, 06 May 2024 03:20:28 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id o16-20020adfcf10000000b0034b1bd76d30sm10286049wrj.28.2024.05.06.03.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 03:20:28 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH 2/2] Revert "goarch: disable dynamic linking globally"
Date: Mon,  6 May 2024 11:20:19 +0100
Message-ID: <20240506102019.1488-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240506102019.1488-1-jose.quaresma@foundries.io>
References: <20240506102019.1488-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 10:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199039

From: Jose Quaresma <quaresma.jose@gmail.com>

This reverts commit 827c60b79e7fcafd14e68870f6b69dcc48ac9c39.

Fixed with the drop of the linkmode

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8f46f60a703defc3e74adad382320c129cef0b06)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/goarch.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
index 6899ec28e4..1ebe03864f 100644
--- a/meta/classes-recipe/goarch.bbclass
+++ b/meta/classes-recipe/goarch.bbclass
@@ -38,13 +38,13 @@ BASE_GOARM:armv5 = '5'
 # Go supports dynamic linking on a limited set of architectures.
 # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
 GO_DYNLINK = ""
-GO_DYNLINK:arm = ""
-GO_DYNLINK:aarch64 = ""
-GO_DYNLINK:x86 = ""
-GO_DYNLINK:x86-64 = ""
-GO_DYNLINK:powerpc64 = ""
-GO_DYNLINK:powerpc64le = ""
-GO_DYNLINK:class-native = ""
+GO_DYNLINK:arm ?= "1"
+GO_DYNLINK:aarch64 ?= "1"
+GO_DYNLINK:x86 ?= "1"
+GO_DYNLINK:x86-64 ?= "1"
+GO_DYNLINK:powerpc64 ?= "1"
+GO_DYNLINK:powerpc64le ?= "1"
+GO_DYNLINK:class-native ?= ""
 GO_DYNLINK:class-nativesdk = ""
 
 # define here because everybody inherits this class
-- 
2.45.0


