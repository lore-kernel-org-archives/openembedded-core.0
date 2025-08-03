Return-Path: <anakin@childerhose.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE66DC87FDB
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 01:05:03 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.9215.1754183096514005780
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 18:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@childerhose-ca.20230601.gappssmtp.com header.s=20230601 header.b=izktFU27;
 spf=none, err=permanent DNS error (domain: childerhose.ca, ip: 209.85.160.177, mailfrom: anakin@childerhose.ca)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4abac5b1f28so32459091cf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 18:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=childerhose-ca.20230601.gappssmtp.com; s=20230601; t=1754183095; x=1754787895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFzI1GhtoGzGxWfOCRVGa0hQbVpLeuVYULB/CYC5MNo=;
        b=izktFU27Gmulvkvqa6EBHpoIt+VqmTh0wBHksthcMmQr/I2gVCwBtuNk/CvkpyML4T
         by+IUIljWPUDkwsoxx94OXLKar4B7+zw6ifMLhtsl5VlbfO6Rws/ZXgl29VAqpp/Oxuu
         VOroeK/Rrkl5nMMndFVkzd0W10Ccph53q0cJZ/Sh93TdeTxgrcFejfOKGIGbgnd36tIT
         m4vNQfanw/TYx7ttrYG76O7SnVIXCkTuETEfPTUFK824Ki5Et+LOZ4TA3ZMnjqL9lP+A
         nlzsc9mLyrj6Oybcr6HSZyVVmjB76GXdqD6F9+degjiW46AoJoeqZDc5HASBgcwVikOW
         J7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754183095; x=1754787895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFzI1GhtoGzGxWfOCRVGa0hQbVpLeuVYULB/CYC5MNo=;
        b=oUv0hPeeqexbUuNsMNHBKhxwaO9rVPHF7MYsnHP/lN1oeZExJ16jWNC26Zagwd+3qr
         KZ8KJW5E2whVKbsKYJToSDFWTmxw2A8JP4qp4tf8tUPPu6bMoHHouToJeHrydsqzQkHx
         TETb/CfHX2bHPGPL+aHI6+qAjYQieBNV5a294ueXUpyklLDsOu8txDS9Kg9oXq1119jF
         QjnO55VxlMrcajzO0yG7TYnm5zLDpaaIH5uROaNR9ds9TG/nJ8BTxiTQijt1vbTRh+Y7
         j0N4FfpBqHe94f+9+AV796y+Xpbz5MfNGYprxAd+J7v0FSBaZq2vmcepDmQ61P/PgGhj
         teyQ==
X-Gm-Message-State: AOJu0Yx2zclkHcgd8YFcgLcJDJ1UCEQrumDVKXTjrUlP/g3Azel9NdM1
	k1g35pS13ClmSWUcP2REv3sRfP+SOXU1FTvuHwgHtygA9TnP8iIS8jxxcCOHYTsIBoB4LlpLWy2
	HbsQ+m5phnw==
X-Gm-Gg: ASbGncvNKq99yAyxN8Jgr/laa2hZE2VVLHpNIOjz/Apkt5UgJ3Civ1kEgglMPXyp/ez
	KeOeEcBaDUAEQQWQysGWNUUc5TVH+JIvN1ahDRQxtN5t5B8dli4cigy7ewqcLYdqojsf70pGbmv
	jYx7RQvtM4C7yyWFS6i/W+megLQJmUcgjhq0fRJfgz6xObwAHH3B476R3NLopAD0UqzP/ZbRKvI
	FciM0l08GVzA7qcSuaqLQoNMpZl81eXDrTu4eu3vmoTGMrakMNWMHnLbDAyTZBa+d7F5zDhxzqa
	JQeglkLL54SfAFZIcM2D8so37dnU60GjHMdvyVV8HeK1xyIpw8BOrPbmKhG3OHqdqUxJn1N6XXA
	DYsZh89+htg6XVjSq
X-Google-Smtp-Source: AGHT+IHwlXe3ieo7QiAYFGPROEiWdM5Dndmgm7zm217VBK+DEjMwBBwDXXaSptbiiamXb/b3DlsVMg==
X-Received: by 2002:a05:622a:1809:b0:4ab:7f5f:620b with SMTP id d75a77b69052e-4af10ab80c0mr78161981cf.34.1754183095213;
        Sat, 02 Aug 2025 18:04:55 -0700 (PDT)
Received: from vader ([198.16.184.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f594206sm389169685a.4.2025.08.02.18.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 18:04:54 -0700 (PDT)
From: Anakin Childerhose <anakin@childerhose.ca>
To: openembedded-core@lists.openembedded.org
Cc: Anakin Childerhose <anakin@childerhose.ca>
Subject: [PATCH 2/3] cmake.bbclass: inherit compile_commands.bbclass
Date: Sat,  2 Aug 2025 21:04:22 -0400
Message-ID: <20250803010422.21838-4-anakin@childerhose.ca>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803010422.21838-2-anakin@childerhose.ca>
References: <20250803010422.21838-2-anakin@childerhose.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 01:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221398

cmake.bbclass generates a compile_commands.json file by default in ${B}.
To automatically configure the clangd language server, link the
compile_commands.json file to ${S} via compile_commands.bbclass.

Signed-off-by: Anakin Childerhose <anakin@childerhose.ca>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 1488d744d4..2da4a9a6c5 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -4,6 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
+inherit compile_commands
+
 # Path to the CMake file to process.
 OECMAKE_SOURCEPATH ??= "${S}"
 
-- 
2.50.1


