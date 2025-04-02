Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04155C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2247.1743577873081772740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h3b0NjKY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso65654325e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577871; x=1744182671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cr98+lYWjgcl+9mfSdn2AmkXe8d2bO/iSsSNJ4623qQ=;
        b=h3b0NjKYQNlnuUDA+D+PUhsuFsJ/T/HUE8qol47gOGtdYkRpVdJnvqmn5Cs4zGWVWc
         LDKxPaAk1IpJuczkEtLC7dzE+mBOUJAIe2yTQD2xNiCCprCuj+sbv2NJLY1Ig0tbDnT6
         QA4yFz/Vm6Hb9y2CaEpEoKhOrJzj1MGZdsJ5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577871; x=1744182671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cr98+lYWjgcl+9mfSdn2AmkXe8d2bO/iSsSNJ4623qQ=;
        b=AaaKqRx3Ml8LzmS6KahsV+yJLMLE2e0kMwJU70IPu/Za2eaYoBLs9Ate6PP40EVuz7
         doab601Pb8GFXwoI8NnSLY7ncKTl9kPaVKdNSSwLS85fJmuSi5mSfli11kIM+6Q9Pf/g
         POXH8Px84e5m5fMsV/KzwTBxXwMT8/B4MgJ4+yLKmC+8MdVNHxxnE4vOJoHXc4MVgHoZ
         A4yjNjkSV2YOKZODBbR9Iti6SlnCsawLL3EkAdPveKmT4ZpepxQVIrCdpEN/LK0nKsDR
         ncNQ9RFlBrOgNPR3f9k5qFm3R7aBJ2VZlKl4Mxn6ytPAURRJk8ZuX5V8IsF1UGnDyMiq
         L4Wg==
X-Gm-Message-State: AOJu0YzSQvhW/P5DHP+Z0MSNFSiMIYsWQRC10xmdieeNyE/5Sg5hRa5+
	pRYWJDzZomlq4h/DbM8lJo2xzGg7XzsDM9lla8vn9WZpT/QX8IaUg/aAGq34ogwotEPX22BRP/u
	H
X-Gm-Gg: ASbGncsg/G5qb8zJbRUmg7HCNyXsnO904gQUEEv4ZnhcDNcBfdAIbSrKYzvvZxQj0km
	aq7UfvCvz0P0YzjEusmbOouEpXQNzlasowxVzXXrwpr5M7eooYQJFLgJzwk18Q3cHDV1ez+nZtr
	I1MvMgGFU7TMCrFAAvinQNEWdKUgaydTZ2QrooIW73PavIe5s7rGKvatsNZ2vL5pYPiM01dp7Ap
	zIgIStaFlLREEJiCa9hV0XwMN1hacN3k0z+2nd4vZ6uLTVPNBepSL6Y5niVHksIMkd1q8+VdwJb
	IJR9LE2Uo0L+LgcGALNs2Fd2e3ucLwRM2il2yOsLSZJQwCB5xPOSNi86kPQ/G95a1K8M5eTpFw=
	=
X-Google-Smtp-Source: AGHT+IHUmiLiL5xlDOt3rzBj+B71rRAu7yyJWeyqNdoodFa1SZ9sJyRLIad58IAgvIUdulekxxKxbg==
X-Received: by 2002:a05:600c:4e87:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43db61d8249mr125670835e9.4.1743577871112;
        Wed, 02 Apr 2025 00:11:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/48] libsoup: upgrade 3.6.4 -> 3.6.5
Date: Wed,  2 Apr 2025 08:09:49 +0100
Message-ID: <20250402071017.2157620-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214193

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libsoup/{libsoup_3.6.4.bb => libsoup_3.6.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.6.4.bb => libsoup_3.6.5.bb} (96%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.4.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
similarity index 96%
rename from meta/recipes-support/libsoup/libsoup_3.6.4.bb
rename to meta/recipes-support/libsoup/libsoup_3.6.5.bb
index 4d50e1353ef..fbe9a79b0f1 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9b54c76f5276b05bebcaf2b6c2a141a188fc7bb1d0624eda259dac13a6665c8a"
+SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"

