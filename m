Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0111ACD8C85
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6142.1780698868879127145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O3iACHlF;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso1119668f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698867; x=1781303667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HE06sU+/QQ4uc2TkX7Xoyoit/sJ+dyN/VilGGCp61Xo=;
        b=O3iACHlF4O5QAYf5epyq/yVRqZhC4aoF8+xHdwEnDiW9RPRth9Ykk8LEHezANhh3JP
         B/FLGi9aJgu/xUB39uNKm7SRRTWAVkXiw5q5152Sl7oBaXFrDdaVaDF0ew3aE3BwgLdN
         rZ71xj2r7eCl/zY2rMcOF9DBy342HLGZK0EWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698867; x=1781303667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HE06sU+/QQ4uc2TkX7Xoyoit/sJ+dyN/VilGGCp61Xo=;
        b=rgg1ZckTgim+JsHNxMCtgH74V/GSb3QePxvFcwa1XULBJhiU+xr7gIU54oGcDv8Qv4
         th4iC1lDbIJjRj1CoyQRzLlI04Ld7zAAJzdyBcZUT24IvzNWKDY9wEV2LABEc761Iqjj
         5dddRcFWONp7AqEZrazOJuxZtQVeNUD/KuxZNaByO2biFAXMBXxHo/yUfyyd5z/4dgoL
         Lgba8RoZ97Y/zAiG+q1j/87WFr0SqFSh+FKvQ3vhTEhF/j6u1G76JgonYAlUTQPt6S7w
         GkSYxVRt8MoCLcmg6bkc9u8cBvlE9KilL2l2ohwT87wV+D039PNgPAaXX9BqqBzf+mAs
         WNxg==
X-Gm-Message-State: AOJu0YwS6ETsFOhYVOyh1OXH4HRvyRL7OEF56xs6fMwBbgiCWrCUydm7
	koJLOrhJlubpSi5BawgM1+4XIGBoPJrS1eTPZvXjV+982O3EG1KibbkvUHl2paUn9nwg4Y4/0K/
	87zYd
X-Gm-Gg: Acq92OHN5OMCs5DTTFmkV1gRBVnlwBm3gwLyfPX4PyjluXyxo3WTzbvngEseqNymO+D
	ws+VEkB2Jm86M3iIWrOiyxJ/pcutuxFI4sJSh1nc5B63nOHUoO4jZdk/kbNqx4cNnvCwkNr+2KR
	fK0yMRS8xH0f+Cr+IsRRF0aFmUTN9/RB8I5GQYzmU5BLoFT7ejuQRqd8ygYYRioiR4Hf6mwEn59
	F8658uFzeyZyAcnQLoYFEe9czbEYT/iJihsivLHxBPBZDhEmPkWthIv2Y7UJ9O05R5EfY3Q18Ol
	XYiZS9ZJezCi9utfoC2OorhXykaQaFPg0Bd1DiQvYh84Sz8n7I/X9/nKrCHT8kN1vz6o0pSAcZ3
	XWTHTWvk33QShn03zDCkalq8yBptBVjZjbrL2xfohRQ/7YxA1klAfPp4fr+wEyZ4HqUvn4mKrAF
	2QRoJexeH5EdtgDJ3S7KJYTLRFbNnblUU5mgUpZ89PNF7TMkk+D7ZmjRqIe/iBQQk/LUYDB9WT4
	6kP8MLFhDrboE8zRUQN3kmo1rqLsAr5ceAu00PaCWFaOBFpGA==
X-Received: by 2002:a5d:4712:0:b0:43c:fb48:6856 with SMTP id ffacd0b85a97d-460302ee23emr6280779f8f.13.1780698867256;
        Fri, 05 Jun 2026 15:34:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/25] pseudo: Upgrade to 1.9.5
Date: Sat,  6 Jun 2026 00:34:08 +0200
Message-ID: <876e6497f3323d74d9ac8ce303ed5165a7fda283.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238210

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This adds a wrapper for the __open_2 function

This was breaking shadow and the real reason for the open() call changes.
Add the missing wrapper to properly fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8ea63d320aba32d3894cace9e71e850bdff1d6b2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7cb221403fb..3760af2fa4b 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "6c0d8c6b81ca7c2ef2b5a9a996605e1a51814442"
+SRCREV = "0bad85523ff71f1a84cea5fdf72e7f560c4aeed4"
 S = "${WORKDIR}/git"
-PV = "1.9.4"
+PV = "1.9.5"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

