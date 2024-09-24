Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92889CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 21:37:30 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.1021.1727213844400376615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 14:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hwIJc+eB;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2059204f448so52717215ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 14:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727213844; x=1727818644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxviliYc2A/gxhC5hbmJOgPwQr97cEwFr7ndTjMLRaQ=;
        b=hwIJc+eBORUNJzma7HvhpIchowFFk5gk/PdpQc4kGRkHyz9f0cu2cYnl/pK82W+ybH
         z9WltAgfPrDMZJ1PEfQhNo0/vdBObeKHev2ctxyKAl5DasbxVeiJBwgk5kAcWLJxEFYr
         6ocMwQAFiaPP7AVWwLJnIb9XG5FYGiEiolvKv0cw14d0iz4ARIAmK9tLaO+cp8RsT/32
         76OJsCWKGautGw0WRIMMOfvELXMKuYQe/Mp1kqryiG3Q7BLveesFmZk6+8xYWMFrM+3Z
         xvEEDbL2/Ub46h4LFHwIQU/eR/81HU6KEOOpjMBIjKEfYIfPwxPems2carl/Rd9ZQuBl
         TKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727213844; x=1727818644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxviliYc2A/gxhC5hbmJOgPwQr97cEwFr7ndTjMLRaQ=;
        b=FfF4/EfhO2TcLO7KGKJmzOmGlg4g/ily//eD6Lm6+jvWgHMnM9u391asoESLw9o0GX
         lMW+ziWzkr9ZjkARAQ7oH8Lst3uUVa9+CSojUWy0rG87z12b2Z287kVVKaa0OQtv635o
         pY1zI11nmJm80VBG3pbe/Eq0xWGSlTeh4K81EszUoKyZ40grVFvQHE6I1RZjBx7zdjMR
         rOqrskm6jEXDmlNEZztd+YeLj3KljdmdXe6zgxBqsbPO8umi5xSs2MT+amwNWNT5gN7w
         SHi+sUKCHVkXr3FqGm0PP7+dLf3VjO/aEWXYxsiaGgHNuUkJO+7tvfsJvdsuRzN1NJd9
         9nEQ==
X-Gm-Message-State: AOJu0YynpKrWg/PPKdSZLoNGH2ZdXVMsLJBm9RQ8Z30+lNmobKFa8RAh
	r94PB18KuhO9b0OYdVNomMbF/U4Pqvgky7pLXUPNDWbFo20skEkbqFF5Ful5
X-Google-Smtp-Source: AGHT+IEeR0hyW75JoJ4e53j5j9T6eiXSrmPS6ClCZMCodTKn+N2EXC5UQ1PrICYW6cbYW7q3VIIp3A==
X-Received: by 2002:a17:902:fc4e:b0:205:5de3:b964 with SMTP id d9443c01a7336-20afc42ad39mr7561915ad.5.1727213843572;
        Tue, 24 Sep 2024 14:37:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7062])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1854c32sm13897485ad.268.2024.09.24.14.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 14:37:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] vte: Upgrade to 0.78.0
Date: Tue, 24 Sep 2024 14:37:20 -0700
Message-ID: <20240924213720.2885798-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240924213720.2885798-1-raj.khem@gmail.com>
References: <20240924213720.2885798-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 21:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204882

- Needed for Gnome-47 components e.g. gnome-console

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop the arm gi data disabling

 meta/recipes-support/vte/{vte_0.76.3.bb => vte_0.78.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.76.3.bb => vte_0.78.0.bb} (96%)

diff --git a/meta/recipes-support/vte/vte_0.76.3.bb b/meta/recipes-support/vte/vte_0.78.0.bb
similarity index 96%
rename from meta/recipes-support/vte/vte_0.76.3.bb
rename to meta/recipes-support/vte/vte_0.78.0.bb
index 515ff228fd4..d0cbf863fbe 100644
--- a/meta/recipes-support/vte/vte_0.76.3.bb
+++ b/meta/recipes-support/vte/vte_0.78.0.bb
@@ -15,11 +15,10 @@ DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native i
 
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
-
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "f678e94c056f377fd0021214adff5450cb172e9a08b160911181ddff7b7d5d60"
+SRC_URI[archive.sha256sum] = "07f09c6228a8bb3c1599dd0f5a6ec797b30d3010c3ac91cf21b69d9635dfaf7c"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

