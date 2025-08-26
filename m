Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68274CA0FEB
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:36 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.64605.1756215690433514512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hnDCga2g;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e2e6038cfso6288734b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215690; x=1756820490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i7IiVQyoBH6R+YMBv/LEP8CyGYexYPTSNtrQKLxj1Nk=;
        b=hnDCga2g6JMwU10asJ8TiimNtGbOSZCjoQCsH2yCrurET7qn1+a3Y1xqxRPyzBrdiB
         Y3nRTZ5x4wDfcSPw6sWw3MdC3IPq4dsQIfYJkbZQIYODjUWe7zIltCynCp5LcDK7g8Yy
         xx9js6F0OAJGOp+qyygBYUfSqBtV3APwDM8vCIhezvxNHL+EyvTsdIcB40RKXtCOgQvl
         DrE9CEMpE22dOTAntvmilRFjF0HRGe2Q1bAmURNsp/palCPcpBa/d95sDyCK/Hm/87HD
         GohVVwMA2DJXlJHfg1UWK5JJmRthlESNO2idnelVld86s/0gBXRTgJzepp9OdD0Y9Eys
         2aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215690; x=1756820490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7IiVQyoBH6R+YMBv/LEP8CyGYexYPTSNtrQKLxj1Nk=;
        b=vPLiyQneJ/9/C4K8BUjR25rctungEgXcFcQARpD4MkBOk97USjZnGHhh8nVCMH0Pm+
         /aC//wUst3g9vpVJauQw16CdbY2T98wkVpqBVLBJnbfESgqwnN5XVbKpZ7fXi22tcyM0
         I42cVa/RAl89Btj/RLQKZ8mUCWoqKG98lhurUPVozXvvGM3zJExHH+y/7eWLlljPrZ4J
         AxdpzEbouiEg1PhrXOB0Ma/EKd2EpYTIFiBcDXISFr9vSoFEDLVU33jaA1Pb4yHXPnNK
         4Tf0c4Kk1GUO6Oc3Xz9O40iwzl4/kjCltgjGDE3T2hw4mg2nvqTasNxDQfYvA8dwhiee
         53vw==
X-Gm-Message-State: AOJu0YxjnhWdewaNqtvMPJfRqYloFjYZgWmxCekkeuVTxg/y3uWUxbUS
	2gIqEfMR/fexaiVNiEXl+Ux112adKoFFzkaM9oDHO89ln+Z+smQYIn8KyT2SmkQUybbSWnxpVqa
	mTuN4
X-Gm-Gg: ASbGncvWYfdEZj8Asf6tBnTnjxXJg3yIiBaP7kXCtxvLVrianYbDS+mnWHpHmT6Xpsj
	D1mzi2yrOgcdq8WIuSKaySQeC8j0PLeMtCqS9LwMe3i52Mv31NZ/MgbDe8dH+D7BWfbnlj/WOaO
	MExo9MYTIE9s3VTjovyfHpA71zGzTkkU2hTRRRN9e6s9+odDjFJwmwIzgVRbUZzX/lLg0fAQFh2
	U+7UWguebaoTm/KQ5kAZ334sgzApFUROL/5hU1raLoLGDmKK15/Sghe1bjbdb5WOatMFpxxGSg2
	U9YKooCDeceY2Sy6vo16yfUtQqnIKDQYM3I9FhOFLoxJHo2FhWO+NNhe8NgziQQclPAGXpARgd6
	As+4lq3ZO0Hb22w==
X-Google-Smtp-Source: AGHT+IFTUMZn50LyTG5x6cNRaWKdd9wQoi35SbzOMyunKe/yrZGOqgZ9rDPvWioelBMxEoTovqSsyg==
X-Received: by 2002:a05:6a20:914f:b0:23d:d5c3:c92f with SMTP id adf61e73a8af0-24340ab3fbcmr23202419637.7.1756215689499;
        Tue, 26 Aug 2025 06:41:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/19] gstreamer1.0-plugins-good: upgrade 1.24.12 -> 1.24.13
Date: Tue, 26 Aug 2025 06:40:46 -0700
Message-ID: <01d4f52c290dc4acc7dd6e129db5470a626bfa90.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222452

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ins-good_1.24.12.bb => gstreamer1.0-plugins-good_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.12.bb => gstreamer1.0-plugins-good_1.24.13.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.13.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.13.bb
index 9cc2d462f6..e1710d0bab 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.13.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d0e66e2f935d1575f6adbef7d0a2b3faba7360344383c51bf0233b39e0489a64"
+SRC_URI[sha256sum] = "574ac6f9fd84b32eb04e80572391d6762df6f9802a47bc0386cd6cc48c14d08b"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


