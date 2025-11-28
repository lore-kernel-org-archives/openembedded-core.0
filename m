Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29EACFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10203.1764310756061473811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DSxco0i4;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-295548467c7so17543775ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310755; x=1764915555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cw8HBVY9JZdhWnLWI1nq6Y63lPUR6TyCIAS0JfVF20=;
        b=DSxco0i4DC3NFcIfCdYZVvFcuet9oGc31jMXG5AdtjkQS3KW58lVRmhv7YWCamwFNw
         fx4qdbm0IUDDzxeVuQR+PzqK40B6t6j7sVzOS6hqFbTH940aqrOomhctXvNi9iUnq6sO
         LVESD2SBM2EXUOfn29mVq6kgoxgSbUi3F5afZ2BHpS/7M74GZQqCaV/ThVUxc3j1Xx5b
         sQ1a4tPeWj+mSYVb3ZTxFMb6ZcrtdRvMT/QQq6bkv73uFOgRor0L9pagIcFeO3ozWKfX
         Px2yCk+c4GcRcvMrG9K7k2EBWRO06bErJQjoL/hoblAIZ+lMJ3ngyDuShxnNsX+Wpw4A
         MjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310755; x=1764915555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5cw8HBVY9JZdhWnLWI1nq6Y63lPUR6TyCIAS0JfVF20=;
        b=bY65yoo4Vq5VGJrRfq/O9p1NcBGg0I62Uri+vMNq9xMAKW40pHj2ESqs6ZHcIvjM8W
         FFiIisHhGni0CjUuDo3WLUuQPx18aiCH/fCxhtpGI8cGB51QsdOjgxaxDbK3JggoPBdI
         bxtYYMo3g9TdAtwRyjvqdjmgyi0PTILnGf1IQ2aGqB+RdZsgeKCpxXmAFAPqOIe++2GQ
         FLWFOlMxZC/qvO/aHLujHbScj04jGxLrIqAcRUtOZkUXAnQbsswKiXJlemEYoYlIWckd
         NBr3OxHnNWovKWKcdXUGVBhO0fe+GojoJzOPEkDMfjudZcf2QwWjo1w3LmfvvRM0SyCL
         p9rg==
X-Gm-Message-State: AOJu0YzuTRWmdKJ85/AdfHkfu/mMHDJ0gaUZ8lFjGNmwHstIQkwvgdyX
	tUHUL24VQuAiMo10g/HldVU+mI6VEQYq+SEWKIsgf6BWXv5paG4LM1GdibEnAA==
X-Gm-Gg: ASbGncszfA8gfTfQWpvl3sHkpwCrL5GcDsz7UBZpQSGVlZAsUG1mFOm0urNByL41hmo
	yQD158mHG0ebUbCl1K7FfCGv8tdVFpZvUzW/W/C1dqsRJ9EUOciXRD4JANfhg6+o2OosMqa3bFa
	6y95x6tqyKFcJMyQfzUdThZZp3Z/GG+vXWW1svxLsAO2wrGaJMCQKQPGUmA11zGqxkC9imE11QH
	yqpbd7LCdmARsTTKh4FwQy8doM3z7ViuB4uHRUSm8ns9Uj6jjfq8El3pZbqauAymfSMVGFe71nX
	xckiHbxC/GNBgx4VikQhfnQgBYkt8CEISHJGwaNMgBSs3ARiAH7t2kpW0eNEkDKF7GW7quScuF0
	F16PP0LTL9jm3t7Vh4jchwcTTq3gXL3pj5z2t6Zr1WVSif0RAjycRvVzztVbqWpu9kWEqveOdQC
	z3/BKo3xli6JcopoKPY3A13+Cr
X-Google-Smtp-Source: AGHT+IGPoKkbmIOwYXCGTJJrxrHT8BWyn/JBPzMw3dPgZf89Bf6Yg5CQEEjhtj10CPR28GEJ9oawnQ==
X-Received: by 2002:a17:902:ccc9:b0:295:596f:84ef with SMTP id d9443c01a7336-29b6bf3b5dfmr334591355ad.31.1764310755195;
        Thu, 27 Nov 2025 22:19:15 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 10/14] libnotify: upgrade 0.8.6 -> 0.8.7
Date: Fri, 28 Nov 2025 19:18:47 +1300
Message-ID: <20251128061851.1634479-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226893

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://gitlab.gnome.org/GNOME/libnotify/-/blob/0.8.7/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnotify/{libnotify_0.8.6.bb => libnotify_0.8.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.6.bb => libnotify_0.8.7.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
index 6ff7ee4be1..1bea8ae319 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.7.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "c5540aaefb60e1d63b1c587c05f2284ebe72ece7d0c0e5e4a778cfd5844b6b58"
+SRC_URI[archive.sha256sum] = "4be15202ec4184fce1ac15997ece5530d2be32fe9573875aeb10e3b573858748"
 
 EXTRA_OEMESON = "-Dman=false"
 

