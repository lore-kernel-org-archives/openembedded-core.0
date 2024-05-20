Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389E2C41513
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:56 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.60345.1716212035779753775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hJZZQ/t4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1ee954e0aa6so42629235ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212035; x=1716816835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17SMrBBb8pHkvS9XpyI3j8pil586E99gVxjn/foBUVY=;
        b=hJZZQ/t4NkDams201O3ZZDyeFtsjqf6/T+M4dswcrwEdzIIYxVhqQIckD8uc+EnhWN
         Juw5d/sQ0RQqBraA8fotYBIJEseu804XJq7mFAGHp1M7Zi7MQ+KjQxidzVyds4/0PvRk
         T6BDnHZCveQBRLLwrNF5L4TgRge1/SgBxmpJEtNDd/j9WcIZkok4zGVMIskYzyncUTQm
         G0C6HsDOYL/jPlRk6Iq1z1zKFNMHAsOxtHJnv9BgilUuxthbh1VKU4Bqz0LrrIGs9Zp6
         s0o6UJBh9cX2KmlCgcYwHKD5Qn7kg5iReEBTLMRcmpjeUY6nSRdCTELURtuTGzQIdbLs
         Ey0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212035; x=1716816835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17SMrBBb8pHkvS9XpyI3j8pil586E99gVxjn/foBUVY=;
        b=Sx3K9yhXsrwwRdIVYj8YjYwoy7EtLYqPTJBEOIXUnbbH+7xJvhFqRXHTMp2BQNqHo+
         FEYdrnTP9fl3H+g0q/Yvvs+YW5sKfIfY/4GP13yS4BzcpS8BZPNWr6wLJfTg2P3oAMsV
         PEg57NwXC7BzfAqKOXmi0D4xrd8i7FYGWNh7BsNCAigNcH0e6GVIPiiy6ZjnWyfgZkBh
         oGymd8wYNlv2s6RfckVbJrXIT65fxjynWlW2KzoDtCJjc5cOaiSR+uIxUkru4WQTgeyE
         p5eQLGbPfvmfQryeD9ITintffWMAJG94Wl1eCS/dO6pyl1Xg/smxRjvNJbEPO+MmMG4G
         IlJg==
X-Gm-Message-State: AOJu0Yxl8AwwZTFZ9jf+2JuJVChMg17VDO3Z+SgoROQV/qNR/IIVG5tR
	L6nWYNIb5G14LwE1KHXrjIxBbBlLSSAp7+FZmY4FGSR0SxT/R9buLqegr1nRlIwvURrLSR0Ehk5
	x
X-Google-Smtp-Source: AGHT+IGVItV41oBsj5Pg94bkM6ieEbPQ29WvPPyeTVb19WitO3/JSCtrhNfveQzvGyRKuMOJm5H7uw==
X-Received: by 2002:a05:6a21:3a82:b0:1b0:119c:7587 with SMTP id adf61e73a8af0-1b0119c783bmr19170701637.51.1716212035048;
        Mon, 20 May 2024 06:33:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/21] Revert "goarch: disable dynamic linking globally"
Date: Mon, 20 May 2024 06:33:23 -0700
Message-Id: <137bb70ddf9dce30374cbb366196da0d8cc94205.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199583

From: Jose Quaresma <quaresma.jose@gmail.com>

This reverts commit 827c60b79e7fcafd14e68870f6b69dcc48ac9c39.

Fixed with the drop of the linkmode

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8f46f60a703defc3e74adad382320c129cef0b06)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


