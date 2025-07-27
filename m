Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0FFC87FCF
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 20:05:02 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.66582.1753646692091910155
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 13:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jlic9emS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23ffa7b3b30so5801165ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 13:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753646691; x=1754251491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaVCZw7rVH9WBQNClAI9WhIhDm7oaqb72sS5HDzbtkU=;
        b=jlic9emSH7bid/RVEZ4HrW1gkULj/PiTGakdrnCpzSAQwV7OLqNWHgWz4LF4c6hGst
         REgzdBFniOUNPS+JS7sh2YskaEl3Y2QevIaB0Va9iFpBu2Fi5Gjja9D2e4/NkFv4zzNr
         JxArRO52scRMB9ZyRCYSjQnCsCvskhAEFSL7cn/HENsj2JPrz4GmnXHd5egpUD07DYUF
         7dyxmeF4C/tsLsExJNAd6k9G1Qc+6NhR5MYVuk3uUpLn0jtcWt6bm7BFD3LT4ZjfTsG2
         NiR5S0TwrI4rWsYE4A1guIi0v8A3/K81afPBYOzonRYhDx6dnW3ujGP9z5uj8u/qN/7y
         MIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753646691; x=1754251491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaVCZw7rVH9WBQNClAI9WhIhDm7oaqb72sS5HDzbtkU=;
        b=f3SIQFY+uatsjaUna2bsLirWc0IxSbg5fhMqYzAKJD2wfRLNt7cCLS8ObCqMGRspsk
         fmd940qZpc8OcOnYixr6LUiFJF4TiLJWac92YQJVbNvHoZlFY9u2iSZRSuh7/Q9hcEoG
         I3Dd7l4VsA9CWBzu/2N77vIi0CyE5XSZpFyd4mCJyuCJPXcTExvHQglbBSuN0zUtTG+o
         OcJA1+PRznmtOjPZ3+JrfaoRCboGaaF1Yyk7BdK8kvtUCvgIirV4BBrWYAc2bQGv+KD2
         U3cEopchdl0HtLE+uTBKkHq6Sm8PSneYTvmbkQ1lGbMlGL2F6fEryzlHXZjr5ECP4DN4
         kC+A==
X-Gm-Message-State: AOJu0Yx3heesdUMYKrTzm4nfoCvPhXRTmnwT+oHdWu2QMqmC7J4YtUMf
	6xLwDscUS2hBBHCetCPW+aaJuJayP4cq6io2oIlrYbEZdv0fivd3bIWzC+oYxvUxm9pOUf0nmnH
	8z3Jap7o=
X-Gm-Gg: ASbGncvcHqYDprWbADv5NosQX9PTpckke0eqe1KRnSl2/B+szjLVs44a2JFxbkIHmk+
	lGuQl4y1elcowHeAJ3zQCHb5ZL21TAysXKqCMiWenBqJ0Eoo6psQA6QMCj+Nmt1O8x/1/ru63Ku
	I/t4R5qV4HZodDiN+yI+0bCsqhcbfFOImdp+zxZ48atAAIwtUQJZw3t+kPZq4QxeFfuQRJadiEn
	J8d+Rf086L8WGZ3AJqrqyqqSeqqcw4t1zsp8wa+kE+yE85gflG8VvLZxMcPRWfq2v+EiOvMo7+C
	gZrWaVQWT9b6pr+6ByCBYv9apY7LiI9EbVy+FutEPRdIY8XP7p6VaE7tNCZrHukRiMVhw9M4pk3
	lmZPW5XaVQpA99Q==
X-Google-Smtp-Source: AGHT+IFZxaz8Hta8m2a+pWtwz3rLDsf4b7ieMHUnXJjgiYHIvG+TQCYmSt8Vu3JazTyRqeD5NrC0gg==
X-Received: by 2002:a17:903:943:b0:23f:f6df:dd2b with SMTP id d9443c01a7336-23ff6dfe33fmr51801315ad.0.1753646691245;
        Sun, 27 Jul 2025 13:04:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:22e3:7abf:ace0:e5ff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe512ef7sm38905665ad.131.2025.07.27.13.04.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 13:04:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/10] orc: set CVE_PRODUCT
Date: Sun, 27 Jul 2025 13:04:34 -0700
Message-ID: <c31dec7b32fe34fafd61dd593a2884eee13084fb.1753646578.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753646578.git.steve@sakoman.com>
References: <cover.1753646578.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 20:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220973

From: Peter Marko <peter.marko@siemens.com>

There are new CVEs reported for this recipe which are not for this
componene, but for a component with same name from apache.

sqlite> select vendor, product, id, count(*) from products where product like 'orc' group by vendor, product, id;
apache|orc|CVE-2018-8015|1
apache|orc|CVE-2025-47436|4
gstreamer|orc|CVE-2024-40897|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/orc/orc_0.4.40.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/orc/orc_0.4.40.bb b/meta/recipes-devtools/orc/orc_0.4.40.bb
index e437831cd7..ee96ca0a4c 100644
--- a/meta/recipes-devtools/orc/orc_0.4.40.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.40.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "3fc2bee78dfb7c41fd9605061fc69138db7df007eae2f669a1f56e8bac
 
 inherit meson pkgconfig gtk-doc
 
+# distinguish from apache:orc
+CVE_PRODUCT = "gstreamer:orc"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG = "enabled"
 GTKDOC_MESON_DISABLE_FLAG = "disabled"
-- 
2.43.0


