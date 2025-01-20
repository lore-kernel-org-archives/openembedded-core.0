Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0868C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 14:00:13 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.35803.1737377278555069536
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CI4jylna;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so4253884e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 04:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737377276; x=1737982076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8u7xQrgGV4VdA/n24Uhxjr8Uhud/VRgVrssrEPXv3dw=;
        b=CI4jylnaCna3ZBG/zoejdn1EdgNgh6Eco9L04/qprqFOStTfIzCVG4f2fwc5n8UfJK
         Gh1uEuSAMEbU/ER0uEWfFdpBmzWaxH5X8HEcHN/EVeA3RUcL98WWJbNmILFKSd2cG0zj
         91cuQqQ4W2ll012cGXnMLkppSOJGC4D2RjJngVKlupyYA1ojUfD9RKBxfXHW40n6ge72
         mpaKS2MKnS5ToTLNackIEPzP4I1eviKZhzkkDlOqKNJVT2WS4rqOcDyXoSlOksxqW+GD
         t3O89Cvwow19ZoZo+unOCjjQy5l7j0tYvJetM/xVRBiyqhiR3nHu2+IMfwh6kGBx3keX
         xD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737377276; x=1737982076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8u7xQrgGV4VdA/n24Uhxjr8Uhud/VRgVrssrEPXv3dw=;
        b=GnnqY+KX1aRiKT/4kL7sE48g5ubIQ4JI/JXzYpJtDkHKIrW/LO9k66XO0N+KVbfb+Y
         b7jNCIdZxAUHt/wxfHvEvclofnpzHZ+JlKK8BO2Hi7zN6eEtyYyMji92jw9ivXXJ8hb8
         oSqP67spzGmPek6n4+qjcl+3C94z0BxeEp1mc7ZmzcfrM+na64dh0HmJB/mEPvZ5zRZv
         GSeKuSSqeTuKnpSV79Y+MR7NY2QpFN/g+FzH3VIZcSkKpoBgHr9iR7KjfT8+gcIF9FiL
         jxqvwEKE+4g2PcASbd1+L5CMMjY8m8x+BysjYnNS9thfkZgtJcZDZeW5r2rmSzyFfVbr
         ardQ==
X-Gm-Message-State: AOJu0YzVONH3a42Q2ha9EftXLU4E99dwW/jb/8zkJ5RKxLvr0Gv0Lypm
	FsrHM1JqMqELmw7kFRy1Z7MkxxUwZhgAr86R1xIaieuUhCHwwgJJpSASHA==
X-Gm-Gg: ASbGncuDSEbXpYEtWFHms69ZZ1UhIrvLaXIWWwqrak9gYrZ++sITJxDSPjDoRD2tOPc
	0vmQ22U5HsRyZZXn8ZXDmSth8bbnRLzjqEIrO75wuD3GqCYednROMYwtf5C8LwRST10s+KmdJKw
	0gQgdhkOA/ODP1z2uvfoqfs06MpAd5h4LlcfGxnFrR4mf9g7w0WPPbdn5gV0CwbIbE+gqDmNd5f
	KXM1s7CMfhpq3oLVyM+I266/1ABgOXjXwXKZPC5ldxqWY67Wt8uRXWsYTERyiGB0p/R575SUBLP
	Ow==
X-Google-Smtp-Source: AGHT+IHvHcz4OIAH60WUaRqqp58iY6ZiZNisauHF7FMpNRd7rb9QxaIxLvNOAbNP2Onwu8NLrbyA2A==
X-Received: by 2002:a05:6512:159b:b0:540:358e:36b9 with SMTP id 2adb3069b0e04-5439c2807e3mr4582485e87.45.1737377276237;
        Mon, 20 Jan 2025 04:47:56 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:23ed:c831:8228:ebaa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0742csm1307523e87.37.2025.01.20.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 04:47:55 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v3 8/8] image.bbclass: enable systemd user services
Date: Mon, 20 Jan 2025 13:46:06 +0100
Message-ID: <20250120124605.263817-10-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120124605.263817-2-arturkow2000@gmail.com>
References: <20250120124605.263817-2-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 14:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210039

Run systemctl preset-all with --global flag so user unit's are enabled
the same way system units are.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 84a2017eb5..f08818db03 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -702,6 +702,7 @@ reproducible_final_image_task () {
 systemd_preset_all () {
     if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
 	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+	systemctl --root="${IMAGE_ROOTFS}" --global --preset-mode=enable-only preset-all
     fi
 }
 
-- 
2.47.1


