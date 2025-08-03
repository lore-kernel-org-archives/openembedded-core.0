Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6114C87FD2
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 01:05:03 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.9216.1754183099048175686
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 18:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=K0IW6VHJ;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.222.175, mailfrom: anakin@childerhose.ca)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7dd8773f9d9so258614785a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 18:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754183098; x=1754787898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiBVCm3kHuI0cgqd/pUxZ4FQ9wbP5vfgW9pyekiWoog=;
        b=K0IW6VHJZl/ZJh8JZgGkcY8Jn0fV5DgyynZHMfdF6Fh9tF5wAFkX+xm5tNYAu65B3Y
         joMZk6qBPBIBdbCc0NCvq65JuBGMoDO4N9SdFhLOIpPF7nyL0NfRM0CHxOGrC4dbpOM5
         5tCTkQBN+mWTrxPyZHGWS1+iDCyTXLqN+GQA6qXD0Jjz5iPqMlyf7OmXloeKXg4vQsVH
         GDOZx910TH/qwB5LAvkUTybkUv4z8izkc6dBqTKN9mGY5xmNfyXJe7JeGMiPktCgE3B/
         Lr97VOBnNoN09ohsWEk2gR4VhzV6aFgfiU2tKQ/i3ZykdDKWqBUKeRsMTeKvjRePW8y9
         rKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754183098; x=1754787898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiBVCm3kHuI0cgqd/pUxZ4FQ9wbP5vfgW9pyekiWoog=;
        b=Yn8HwLokgS1+859NKS+J9Trt3OR2WLryak00+vFH/RiXlKckQEHLy6ZPc5iJ9tBHsk
         vFT3x8RGJQEHh74Y6zt+bFLupHTH4VSSOM+2dWEMenxSzAMIEgfnhByyonJXzVEMi+o+
         v/JsatgKfO38A06udxw2j7R68UDUv+XednHDq9LYD3ilHCeWSpeniOAWz9/OcjooQsf2
         AgKjOTIlF338Y4gDhlhRSm1/1HjQ6IPKU+NCLYQvtUEJlxwUyDyTUDR9aRpWVFnqNr53
         aI+HT3utfuI+99wcIaICaAbUHnRGnaabDFc+h3oDHLBh9yhJFF/dpXGKo5FQafUg3xwG
         oOrw==
X-Gm-Message-State: AOJu0Yzq7QHFFXU7CNU5dZw5eUyGk8At9h3LK6KdADqKox12S92DNT0P
	4+0yTxgv3H4mm0ZfeTjh6nYBEqNGylLspHCeMPUa8sXMR+whZH6CrO5El2onM4qe/prOllRlaNJ
	5MCK2wUxSeQ==
X-Gm-Gg: ASbGncvO74+Ewduxgb7j8vIud7Ftha/th+ScwzBU/DEr+woO78RVVU9TaPW9Fegj78m
	l/cFgcd2ohtNC4Gpa8iqdhfwmHj5JoLwS4qxNLI60hhiUOiMhmLKj00mLiqueoaul8KwuQPheLK
	Nf+uFBbhFDISL0ixGNgsc3YfNhyL7T792m+hYetnAHA+TRXlIxfyBRk3X1SLYKjX4V141MAw7IB
	TpxHi1ifvWwCT4rDwPBGgltdxeMT/PJD4OkXqz/dLBbX4iD1DtqLw5Kq+3aiLs757ZR018KAnZS
	HnX2uuoyG/Gg4uvoU1Qws7yS/GAIqRIeiHKkZzN/lkmMVI070w4Ssm8wqDDV5b6H3tv+v2gvoyb
	bD5bKcBR9OeNNKZFMiPknAmNJQHc=
X-Google-Smtp-Source: AGHT+IF2avemKDuKVwCMRX2zast7ikghdYG/dSk2bYS2O2qIEkwHecpZj1c/3RNNX69sIF1h3iiEtQ==
X-Received: by 2002:a05:620a:4494:b0:7e7:bf9a:8556 with SMTP id af79cd13be357-7e7bf9a8801mr117379785a.40.1754183097684;
        Sat, 02 Aug 2025 18:04:57 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f594206sm389169685a.4.2025.08.02.18.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 18:04:56 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 3/3] meson.bbclass: inherit compile_commands.bbclass
Date: Sat,  2 Aug 2025 21:04:23 -0400
Message-ID: <20250803010422.21838-5-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803010422.21838-2-anakin@childerhose.ca>
References: <20250803010422.21838-2-anakin@childerhose.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 01:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221399

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


