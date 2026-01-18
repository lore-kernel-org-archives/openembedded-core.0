Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88831CA5FE1
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 15:07:34 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15780.1768748847775182178
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jan 2026 07:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jmwcAp47;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1233702afd3so4326231c88.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jan 2026 07:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768748847; x=1769353647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1xD3gt9FOrrmQ3dyQK5VPO/QB7KTJJr3lOd5m6f6zE=;
        b=jmwcAp47xo+b/g+Yl78Y8LJ+IzIDJzdBzBqGFtV2QUX2gEFR1GGJQ1Is5cpMpyPeOP
         WBb7gb+GN0Dh2lgn0u/hQ2MmKSPtThfnm1wRbz12JRa5mstNrPuvsisyibE1Ev+IJPv8
         r0qI+xGrcPIZRG0SlWWH/2oZgSM7qxZU+QnQsg+6VXY3dipR9KdATmLMt0y+sP4YgZ3u
         rDCKHEqRsq+w4+jVPo44LCYPWqbnobn7uSxjY46YZ8KLwKybUCyKAQRZ6hlEKsu9AbYe
         lg1aLC7A1aD+PKRIRgWmVqDoVzJU/KUmhg33iO5kvJLAFwd4fNrZVK1ZmKlZZ2BiHPyY
         SkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768748847; x=1769353647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+1xD3gt9FOrrmQ3dyQK5VPO/QB7KTJJr3lOd5m6f6zE=;
        b=Xw5Zp3OpcDWskm1EW8aPtgDTSXIYlJvyzcYv+P9VB50+Uoq+uK882ph+IZmj7CxbTl
         z7l3Hah0cjj885tPJQo7DxpBElveXluoJo2SaXdo9Z+S1T5YwlNq+LDgB+CUJZwBtQKK
         SDXc4irnlFHbQOcu5nPazifaoJvVaibkagt8Hn0K2tLEIeeBecNanb6G7FlbZV8ZnAtL
         4wH/fVPClXT3y3mqChMqd+4CJ5BANXzXaaBgNvx9zTgpJf1U9zHaUH0eHIDANUGu9m7o
         8nHxoD/RlxLU5AyZYxylHFiHH9AcXVFLv5oil7txfoAK0bUFzMWLTNT/IMLJ7O/iX+Ai
         KwaA==
X-Gm-Message-State: AOJu0YwTf8pj9Hq3VZ1I/JnDvUKB3vptDC/fipJi8mANFkZZsNDxuB20
	CN9PIMxHjaWA96EM++ZvCzBgpFeUhIDpak43IFkohSVrwkKd9Twz+z6nbYbBIg==
X-Gm-Gg: AY/fxX6UacnwLFx0yrtAqNSHy+/OFoekx2/pygM7/p+gcr8fvNHa/ev1YHNDcqnzFIC
	nMGMzHi16zc97QQVo1xnolcwW9ozvQftNCim6D11hsZjmOQ4iIXXgnxpDcXbdWlNYFbI0iCom7G
	KOs/CwK0LrjS99fmsh0xA2gsk47cWpJ05IdnbxvfJxTqT6UifZUZUChu+ridlWR+XRzNKMP4ji6
	PMqLU+iZG5uidiW/s6R9WzgWm38AGO+i9xv8hwSkvU7mCtpE3mcjGfurpiAlXxBIgz50nAFwSLa
	E4dKAOTA8EWFfniQ3r1uP1hY0z/aWj9SjmsAX9KPC9H2wWscGKqbAQJ1KDFTNITcqmL3rbpuVJ3
	khkmIHsC2jRGmMebADZL3L13JLovUZ8FhuGBJw2DjkfOc/kTZyq/1rSm8JtFluaiLC7WMRslSCb
	Y9ONrdj0SiSCxMFlX76eMWAGfzDrJXL7iYFafEMYqffNwHkuUjeR6BFXQoWmFdD6zNleHyEX95R
	0LZ9Wb98CpYHW15JBrqkxMLm3RIeAc=
X-Received: by 2002:a05:7022:f96:b0:123:3488:899c with SMTP id a92af1059eb24-1244a7830f1mr7211838c88.40.1768748846833;
        Sun, 18 Jan 2026 07:07:26 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244aefa7c5sm12274637c88.10.2026.01.18.07.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:07:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] gn: upgrade to latest revision
Date: Sun, 18 Jan 2026 07:07:22 -0800
Message-ID: <20260118150722.2045208-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118150722.2045208-1-raj.khem@gmail.com>
References: <20260118150722.2045208-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jan 2026 15:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229582

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index e61f3936c9..81d1814191 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "64d35867ca0a1088f13de8f4ccaf1a5687d7f1ce"
+SRCREV = "103f8b437f5e791e0aef9d5c372521a5d675fabb"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""

