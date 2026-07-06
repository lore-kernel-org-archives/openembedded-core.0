Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E899AC44509
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155300.1783358241905015590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DcxDWHh/;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso33769075e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358240; x=1783963040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHKYecLSKZgGjmAi1nV9I89NqVaAAtZd+GUeZNA7YbM=;
        b=DcxDWHh/wd3XZT3kKxCcowjugo4xDQhbTnT9RNAwkKUdAoQWvg7Z3W1eyYwrKQYW/d
         UPaY5OLhiwLImg8nTfUGE9K712RkUPoOH6uw1KCI6HbJsnFVcX6RTr7JDtiRexLPErTC
         xObQ6lTciGaU4tNbGR0C5F9VwpEeMkaDfkxf4/adr8kEehJJKiTHpIeufISGP9zu8kZ+
         rTbmAze6B+uGmBVwkxP3STJDEkSgxx6yOyVANoBzN8JlM3WPl9y6XGz8UfOXTdwVM7w4
         +DfAiZGUk04PYEnp7JmjODijYsxlhfBUKk3ig3BT6gc8/znrX1pV4dx9tryeyAeQX4TX
         O1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358240; x=1783963040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LHKYecLSKZgGjmAi1nV9I89NqVaAAtZd+GUeZNA7YbM=;
        b=BWgtLmYL0UhmTCURcDr+aFGv35sFM9HXo9knYg/XksdercMR+rOFOpDMriAKHnby24
         1iS9GGo0K5FpIPOHSgvH5tx9pelv54AABKfBw0vCsZr9MZ6pA83ZjleUk3Prgx4Ouvez
         l++ytrWY2OzXMjm4hw//hFo/3UNa/kLnh1Nlwa8yTaK7/Ao8bgT+botXY1BhHXXnLa1R
         hPd1heAmFb80LmRzDrUrRmtKDekbKbmBKvbz7igxWtADrKq1UasB8sqRMnjJiLYFeK+N
         E+vY1rZ9wpBoQEM5XIB6ealcTc+JSP4l3TXlkhZ5YZ1OrscVncDSwAHz/OthK190Cn/r
         FEyg==
X-Gm-Message-State: AOJu0YyntOcO0DJWvzhORPdIBIK2qJahW4kg/xa//LpXNrp6eEtzhxRo
	6FdmYDwckJArj5zPLl4ojrrA00S4n4z9Zac/GAzaxYnkQQW+6r1Zzx23MKQvDg==
X-Gm-Gg: AfdE7clGLDtKsPqbPzPXec+6Ox6wTZ0wFh3h9LnvyagsJk26ITQ2d3XZGHfJyPM5b9i
	EhcP5nIb1H1lJXhG6KFzfMXdZAAd7SjuNDzVqk3t4o8WTqWqZS1UakXKiDbzwyZ54Q53NE9rcgl
	+DVIWEuoaOajik6n9rnzAJ0usEOOnJU0u3qkIoXLlWdp98O7rJv3hqbQ7a7IxrubQh+5ObesDYq
	bPOIW20SBE8XcQ+5ZvhrwZfy8H8g3oyfrgjAdrQJd7a3HjoJmd/e7z3qY0q4VVhy6vZAPO9MaoJ
	m7AxXnx6uug6PsfHYybgUpRZsLvP9oBwxVd4s6x4sLfsMrFLQ4+6p+EQa29b7N2YtTnt4PTdUMh
	KsRcJje31HWeji8li+ZLGTYzMj0nBGzLBGOd6oMIhqMwSvd1ZS83wtBEiRGD5p6RQK3vWp6H+b7
	zfb6JRmE6y2cYEyv1ACv4w5boimZNO3DkgTtKvTpIvg96GOCqNL7YOlHk6Eiw=
X-Received: by 2002:a05:600c:3f0a:b0:493:c182:6b08 with SMTP id 5b1f17b1804b1-493df0a07e3mr16074935e9.36.1783358240134;
        Mon, 06 Jul 2026 10:17:20 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/45] libarchive: upgrade 3.8.7 -> 3.8.8
Date: Mon,  6 Jul 2026 19:16:32 +0200
Message-ID: <20260706171701.70536-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240304

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libarchive/{libarchive_3.8.7.bb => libarchive_3.8.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.7.bb => libarchive_3.8.8.bb} (97%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.8.bb
similarity index 97%
rename from meta/recipes-extended/libarchive/libarchive_3.8.7.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.8.bb
index e8c3a3bfe3..2c8bf922a6 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.8.bb
@@ -34,7 +34,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "4b787cca6697a95c7725e45293c973c208cbdc71ae2279f30ef09f52472b9166"
+SRC_URI[sha256sum] = "038918ea315cdd446cc63acfe880d6011832bbe1711c887de5de5441b306c190"
 
 inherit autotools update-alternatives pkgconfig ptest
 
-- 
2.47.3


