Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E91C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.2139.1743577866484232410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VamTdOO1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39149bccb69so5564493f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577864; x=1744182664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFLvcjlgcI4IqyvH4INQGkx0D+CXfMykOZi+xM7YLgU=;
        b=VamTdOO1h8H6Iw/ZuxBDWZ4EUdhIOl8gKMZr+Uf0EzL/8r9C9HWG3n3jNIi3+8pL0q
         bchA0eOZAxVjXD9Fn6DKHe8Y5SNNaT3/TtU+es1a6dE21e3UVXwQRc5tEcN+nBgeBEPu
         XzUmc+HpUUYpoht+1J1GIV6v5f9/CCRC8B/y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577864; x=1744182664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFLvcjlgcI4IqyvH4INQGkx0D+CXfMykOZi+xM7YLgU=;
        b=RDfkgV1zBNw3FHmdS721wdYB2chb58ubZDIa5hpm/xHUVk1vVZv/UN6pCfN8PxzYiq
         alT4Blnw1QpXH4D7h3ODtIsjXpXqv1QnbKFi/6uvIOHG4NxPMu9JzAJ/Koma9ezbP+0c
         mooUADshMvtTIQUeenwUipAbjhDol7QN/Cv4cQdlN17iVJtVxm/0SEq4LnVrKiEUA+x8
         IhRO0bu+a8lrX9xZzdCzpRe+Q7znp27B+qRUkaOuT8b5twjMvjaprAlrdbeic0IFZFuq
         a4eiSxdztKWafgWGu1gaCPmqmUCGqbPYyll643Jc+T9aspcW7vl4coFrJonXMOGelm8o
         dDBg==
X-Gm-Message-State: AOJu0Ywf7zudfKiq7MuLf6M6uMPE9H+SfXpE7aYBzG5rSqjFlnpO0w0W
	qbP8QvbYQnIZXMnj/y8SUfeY3325UqaJO4kzLlema52z1T4PS4oO7GZ+bELKwCtn/al/04G3FYU
	p
X-Gm-Gg: ASbGncsW8QYkwHMyV/TTsaK35ccN+9szd5q3gLTGj38hKWXNY+q0NzIeBz56idmDCMv
	JPAKLs39e875IktFY7yDrhNpFQGd5gzwVNYK9UX+Rdl9bjZ0dKObe2VUWRRxACAOLpvbdDcXsQt
	9E4ATVpYUDBC5zzvU25w7YLrymM866KAzydEWEYb/Vn5737UCTyF5c6L1zd9ZRKzyvJWkPKAyrS
	8nbOyqn+8Nr7dQ84xrol8OFikTqlzOo+bWOklw+cvToy8ekgXBRhUitggLbLoKaTonRuHshSo7X
	3cdnYnEP/gaLqIW2jl5BZWMbmvxxEYcIYgf2586IDebHg/k1kdvQCcPyKzpAlReC4CH3z15wxrJ
	deDnnl+v1
X-Google-Smtp-Source: AGHT+IHkoBNH/bfela1i/8CCivyCEVk4bYhRLiQmO9d01g50QCKEIXAhW2qV0ByFAbKD3SDMjKX0rA==
X-Received: by 2002:a05:6000:430d:b0:39c:f0d:9146 with SMTP id ffacd0b85a97d-39c297e41c5mr998598f8f.45.1743577864490;
        Wed, 02 Apr 2025 00:11:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/48] libnotify: upgrade 0.8.4 -> 0.8.6
Date: Wed,  2 Apr 2025 08:09:47 +0100
Message-ID: <20250402071017.2157620-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214191

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libnotify/{libnotify_0.8.4.bb => libnotify_0.8.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.4.bb => libnotify_0.8.6.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.4.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
index 040df2ad5ec..6ff7ee4be1c 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.4.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "8fa04d4ebdc155b0a239df88bd9f09e8f2739d5707a1390b427ab4985f83d25a"
+SRC_URI[archive.sha256sum] = "c5540aaefb60e1d63b1c587c05f2284ebe72ece7d0c0e5e4a778cfd5844b6b58"
 
 EXTRA_OEMESON = "-Dman=false"
 

