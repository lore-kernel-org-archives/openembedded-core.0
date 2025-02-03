Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C94C02197
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:01 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.92656.1738600911006363215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PNWKxWHt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso2526687f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600909; x=1739205709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otRCW/3qBXI0P9kkrjIAUf9RE1kg2n7jAE0Bneb53LU=;
        b=PNWKxWHtojgecwAi6XThTgFk+WwL5/2cwUpOARNXgMcTDp7cBX6TzktBZwMPDyE7uF
         O5SzFFJaqbrcH4s1xa3mmphiTZluZUtCeIiTlviu7qkJ4OxvAzT75sqhT/h+P7+nYWna
         Mpi+ptpW7ujEvre+YUK4pdvr6XPmZjyRG9DDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600909; x=1739205709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otRCW/3qBXI0P9kkrjIAUf9RE1kg2n7jAE0Bneb53LU=;
        b=mZD9g2mC76Hjdg8juxBnPiKLLimuLtXRg3aKs48k21Qp+d5UVGJURaynG7x8X/4mjq
         OnvXpSO/LEHuyDLaE3tQPPnLHXmUSOfXcCq0RPXERJjgqVo8OJ9MEHavw1J9+AAFtg0y
         vUpjQmYE4GNx8jtbyP3M7HPLR1rBJynlW2wYJimu6xJ7qZA5yY8cQYKhEhKQkiWFbajP
         GIVb4L4/+p6P87P5LtNyGckxe7HZZ6YwqvAT8B+ZeVng7tI3JymAR7sYZpbVBiDkqboT
         N+3CN9H67jKjJI7ySflx6w9qgw/weajxG5UWgkOiahPKh2KtPJ3/Lu8y0PiU7Ey+y5NR
         fVvQ==
X-Gm-Message-State: AOJu0Yw+AR95c3TZTb6XFOlKElJbEsc3PoyyRgscpv/g27yYw1IAd40L
	PNR8cLP6FpnXD6jFsPw/9jRljYy/lB3JiKsCaAJSVaBUyaUnfKP5NuqiQ/wrLYlURQ4exmG5C5x
	2
X-Gm-Gg: ASbGnctmnRsbdGVTLWmn1c4BMA/NlbzWmCH19PJ/PeU9DOscsc2OSo/Iq66bE2FZ7jn
	gDXT9fMs0GHgE43n3DFUPM0EUcLlMliP0pcIbIKX837rSGrCRpxTndRFGvdi0DnbC5ijaNjIas1
	VDWSIdyP2eiwP/jhZFkxutHP+ryJzRGNWl3AI70oIPqm68e/mr4IWEvih3fdoXdAKKHwGVnXZDM
	4zmbNDUY9E5nlT+9HR6gbja0wEtekTKlgam/Hom1pZ5yVp+Yhh0+USn4nIpSZzXEXnNemE3Yw1t
	GR5r5CH4SXDCpv+O0JnFDJwBBfemue3pSm8PH9tMbFtL
X-Google-Smtp-Source: AGHT+IGTZ6Hy+zCAq/P1ubDKJJ0jQsZb7rheBHaS4fG9B/RRKj06PavWZUdmk0Sz3RODwBtaKzSVAQ==
X-Received: by 2002:a5d:5850:0:b0:38a:88bc:aea4 with SMTP id ffacd0b85a97d-38c51b62994mr16622230f8f.30.1738600909109;
        Mon, 03 Feb 2025 08:41:49 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/46] libsoup: upgrade 3.6.1 -> 3.6.4
Date: Mon,  3 Feb 2025 16:41:02 +0000
Message-ID: <20250203164130.3403325-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210691

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libsoup/{libsoup_3.6.1.bb => libsoup_3.6.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.6.1.bb => libsoup_3.6.4.bb} (96%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.1.bb b/meta/recipes-support/libsoup/libsoup_3.6.4.bb
similarity index 96%
rename from meta/recipes-support/libsoup/libsoup_3.6.1.bb
rename to meta/recipes-support/libsoup/libsoup_3.6.4.bb
index 6ac48fb9444..4d50e1353ef 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.1.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ceb1f1aa2bdd73b2cd8159d3998c96c55ef097ef15e4b4f36029209fa18af838"
+SRC_URI[sha256sum] = "9b54c76f5276b05bebcaf2b6c2a141a188fc7bb1d0624eda259dac13a6665c8a"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"

