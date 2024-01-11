Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93742C47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:28:02 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.15566.1704990473686829158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TEiDMwNq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d409bcb0e7so30427145ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990473; x=1705595273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dvbx0o1mXPdzKO50S+iVRWUre/xKXPvlq8fgK9Egfeo=;
        b=TEiDMwNqQxmssjdUA3FKm7fBxP1dSA9bgPTbEHHLmZcZXonq0A30a/xOGsyB4+H41V
         epcRaRAgsHTOW+Du9jFqt5rfX8M6oNghIrYrlUcp0oZpwdVJj2t8K0R83LU/1I4tpgad
         H26sh15nswfywXfNGsY+SNeVZne4f85ZMAusvbewJNu0n7Ko3N450vB9ONWn8V5cXXse
         KuX2CVXW2togu/bBESn60vU/3HgVM1tYVY3U+ns/Oq5iLPvLmVYOoOfpJRh74gLXmg/W
         HS7GkSONUYMiLS7l1P+V1qZFJlCmwUq5Z3xLnBf21w/Wu2+vi2UklaNlU/BIrk9zY2CP
         Afiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990473; x=1705595273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dvbx0o1mXPdzKO50S+iVRWUre/xKXPvlq8fgK9Egfeo=;
        b=D3Js36Q0X1DZrr2Q3Ff2KnWEizlDlPvtH7LGQ3pUIWD5xlafBE53nvk7hM46AhTTBF
         VcPX7vpQyo/+0paVEH1i3qTG9LU4A/VU2b64L2zuOWm9J9yqs+J2mvEn6WKBeM+QlMVj
         ZIrdgqdlO0jHoI8Kqp9r9RyNOyF67LzSrkcipRHKZ2lkPFbKshBU/tJHp8hQJIkFALwD
         ASWh6JMfUWcUePWxyEmhkBactGio90heoi2DSgkRbx6KWi5K8v0gyCLyGc2wuG7yvw4A
         YRBoKFbRbcE+hjDspmMUvcgdpQEz/XnjBnRIPjjn8jLAyEZQtwZ9qyuiv7pM3goBaq4/
         w4GA==
X-Gm-Message-State: AOJu0YzSLwpegUQ1qdwV/xBY3DymC3Pc8XRdIG6v6VtXT2apd2Dphpqn
	jey6ECCmRY6+uYDoETBNIgooA/aMZDuFYRY1oatoKKCKz84ntQ==
X-Google-Smtp-Source: AGHT+IFDF+ck9MzZxBe9NMXfQJNSkofIE3rbW1qNSmqY5uiN8Iyon56th4TVCNFzn1VDe+PaT2oeIQ==
X-Received: by 2002:a17:903:41ce:b0:1d4:a179:e68b with SMTP id u14-20020a17090341ce00b001d4a179e68bmr1574253ple.19.1704990472855;
        Thu, 11 Jan 2024 08:27:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 12/12] pseudo: Update to pull in syncfs probe fix
Date: Thu, 11 Jan 2024 06:27:25 -1000
Message-Id: <ff0dc585479136e3d031da08ef15e8e5c6e92c8d.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193560

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in the changes:

Eilís 'pidge' Ní Fhlannagáin (1):
      subports: Add _GNU_SOURCE for syncfs probe

Richard Purdie (1):
      SECURITY.md: Add file

Wu Zhenyu (1):
      pseudo.1: Fix a typo

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9aab5be508c0dd88a4d9767f65ba5b6fcd5fb9dd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4a894ebdd0..699cab11c6 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ec6151a2b057109b3f798f151a36690af582e166"
+SRCREV = "a8453eea4d902bbb0e01c786f1cb4a178c3bbee3"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.34.1


