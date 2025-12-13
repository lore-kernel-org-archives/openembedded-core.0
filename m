Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD16BD5B149
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2926.1765620157637081754
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O3ktuUe7;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0a33d0585so884735ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620157; x=1766224957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOBxGCy+dwrfi5A7kzQXwdEzigTQxjyMn3gH4pLakrw=;
        b=O3ktuUe7dnRmKUmTPF3pFPfjN5yN4bPVcWNXkVxrzHULg0GuKdQhsVSym0grdV0wIz
         gn/9/82ncwvz4lBVUdf33+GrtTGMiT/b8MZylavnNiuSVBLytfu3XpxvpIdOhuF9SosY
         q7RNA2Wzyst7FYDWDtBNJXta1lQkjC6nAGfiTKQUNWHKJpT7pogQvZCOsur2ku1TZGni
         s9sgP/YytXmp+1JDLWPP9RJzRgCDeFgK5FmIVY3EvQRrXiiBhIvFT8lNkeXHkvE4AtVt
         67pGLhYdg9GqvtiA6cK65A9yEfTOiqkXTOrIFdp7ql8p2zDkxAPhiuTxIQXfu1QP9tXZ
         TeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620157; x=1766224957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iOBxGCy+dwrfi5A7kzQXwdEzigTQxjyMn3gH4pLakrw=;
        b=HOkWmfvkURtP8vqDxfY/VjdsG0AVX2MXt1T1ij5jthpIwj1FMunWIU6VmSAVXVtJn5
         BS7PZDTH5MHigV9xkJDP9+TZtmNcshb5HDEUb4b20N6g9VkDcjUzzyJEvthQgR0HKki4
         U+EmuEHZ/gXBTFNkLWLJUNxS4P8vOYYH6frj9vvAWDfoGFxXhOhALdmm4UnuD5PN40Z/
         3xG3ymbyAVTGff3DTxYMIx7nVjPaOQPA5zNNV6AdCoBFrOXvGzy9wc8kqFH65d2ywbe/
         +nFOIG9d9BGfEggFeL6H01WrVNVoNx2KDj9M+d8HM8lCXcuH++wA/al5svebusIC9MDu
         hv/A==
X-Gm-Message-State: AOJu0YyL7UKqx6SVX0SCOG2bbX10mNPz9IhDgTFlBkO61OgCC6qm51Dp
	BynbUcj2xcLBXWvKcb4kWQB78+MCcafK+sxJi8Inop8cfFV7Yh+4MtNxTAviWdS5
X-Gm-Gg: AY/fxX460ySjrkNNlThmYewWp8WKgpR2rGXAcQE+cdCHN/G/c/ZwlXrMiDag3Rb2GEJ
	E0R8el6/rwYOmdRrbHLPBLjbMuzbWC7GexZ5kD1sOxvDho19jhrWUHXCu9l/GF1RTmg3avQJWCy
	0jo9VvB0TYyAAm39jlRWaWmMGBeZ/2xn1fJ3+em09yY27zWDmWNk6j2fKg4ALqbW4/XUr3xnAen
	gWPbO7WoMZDp/blVd2TbY0O0vjJMtTOBid0EDPYHiWCkX1vwYo5l6XvXYoI3VLrm1xe0ygP45OI
	JVAyLknfHMi45rK1WkeeF7KyV2rRpgWjGA7JK6VeXkPWl6XSc3J17Jger/jfIsaXuo6qpeuUUMC
	lIAvnq8VboP20Wf7gOGoZadk8RSuZLNNmOrhiPmEMgyPSFg25Pz7b9qgeox6SuSZ/Ir4NVvW9Hv
	p+brgoz4kW8GXFjRgjq9zklQQ4kNnJbo6J9yk=
X-Google-Smtp-Source: AGHT+IEG4Pm8O4lSvewfkyU+zL7UhLJGTY/r1mjPZYu5NtXcGQmfynWotNus1R+dz9KOvC0vWSbtRg==
X-Received: by 2002:a17:903:1251:b0:294:f6e2:cea1 with SMTP id d9443c01a7336-29f2403ae65mr38719445ad.38.1765620156846;
        Sat, 13 Dec 2025 02:02:36 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][whinlatter][PATCH 63/67] libxmlb: upgrade 0.3.23 -> 0.3.24
Date: Sat, 13 Dec 2025 15:29:27 +0530
Message-ID: <20251213095931.2571498-63-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227681

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/hughsie/libxmlb/releases/tag/0.3.24

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1316eceb9fef09ad0fdeede0d1772eac38c2261e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.23.bb => libxmlb_0.3.24.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
index 54df81c718..24eb62c98c 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.23.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.24.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "65bfb3099beeb7a5ffae995db124f55bea70f41e"
+SRCREV = "d004cca465e5c5af3ce02c02a15978ff02b510c3"
 
 DEPENDS = "glib-2.0 xz zstd"
 

