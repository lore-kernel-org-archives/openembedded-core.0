Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E86EE49BD
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:45 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71916.1767125560197459704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lXLFjyhc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0bae9aca3so148698875ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125559; x=1767730359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH2WFuPbm7LfANUasXIupup5dZ0ekpYyQSRFsYl2rFc=;
        b=lXLFjyhcFEpTSlOSKSUatsQcxcxoRumntu5MH9wqLY3hJ5OO0iW3tfLVSaLIaXGGWh
         zxp5fh5/ihI63gSAw9pEb+mpDoUGZgjoR+5Y5D7iWI3vbMCoV2ObGlKuEOPAJ4wW2tR2
         D1dThgdEFVK2AUmXpeCcKQuiRDMuDLj6/CnCrZXjyZS1AYZRMGAgHqrwYHAgjYsEfwgF
         AbUjoh2QCPyIZYHKR2YRBqzRsETfsi3HZ4YF6BfHzRBquYMLcdiFRSNNu8JMn85Wy6LX
         mnDUgMhA/aUGIO9IPnBIdDNj8oOmNYP4RgonjJLl2ig4P6J4SN6cdbcvvfUvpCcFL8Cw
         VoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125559; x=1767730359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mH2WFuPbm7LfANUasXIupup5dZ0ekpYyQSRFsYl2rFc=;
        b=SiRFIxr2Rfv/8o8tWuItxeygovc5ZrQUbp7Zq+7krRjKhNjPQwXW2gQCZNYZPVtiPI
         deqc4mJ4rF1duS8aylF66CasNI70Q/IcvWF0S8R+2u9BCFJJfHj99fZKiAcCDEKhoiT0
         IrsZ5qefVk5+4nH2N0WfUqGE84/se0gikAkycap0ngByhyuACbEHSFVqKbfV3F9Jha6s
         bZUf24SseGb5+mYY+nVXsEBlkwTf8qsuvuIU70hXU0z4JoIxNsQTFxDAci5yrvOO/tAP
         rJStDZpR+KFhQnaLhCRXrpPOQyw6P2mguKxCZIZDYAW939WG6M0E94XB6V/V/1OYf3Fk
         w2VA==
X-Gm-Message-State: AOJu0YwYkU5lLvR4oJnvYFXTu1ek+AXq2npX6DJbAVdM0CsFwUdzcOkS
	oKDCAgKva/a6EyF8J9v5GB0PElu8WlQAIkYRtct6ej61jXtOELm7nCjYsqZrpOD7b4fiCudeA+8
	dAodq
X-Gm-Gg: AY/fxX7X1c9dTgyhUHfb1mbgZ8W95g/PaUgKa6K5QnIn5fc1PsxmYsPDCcNdGv4hPTn
	V5aF0La5E+ENSzQFcToAjyFOQZydZZ3F9VFgBb6PGugVdpk6hCHUD3Y/ccfdrv2aT4zKJIxWDAD
	oGPLSdet9TZlKPgHzE5v9l24RVwENJoYFNFoEhrx/4/fjYceHG8X1gNgpvcECxCanlW6W8TT2Fp
	dF0E21oO3snA7siQ9MMLK62N6M4EAXeORTPNCxv7n4vUpT4MO1sDzr80ZDTwlrNyuB16Bj441Vy
	dzYLREYOP0L7OAvbVWt1Ir3FvqPRepDpGlpqm9gvEvklqZJuOoG6UKGAjBvnsRr/lvDpkjmuZM8
	b6uVz3MwN2g29OL491MUaB7V8Tz79/IyTfXDLmZflmcfHCh5PAJpW8IXbpI7+qWeZsNKXs2cpl3
	8JmQ==
X-Google-Smtp-Source: AGHT+IHQakyepB72Bqhre15W3uyGBLAO5k2JyGvUuwngCg61pGrdtyZpkBthgF61uX3RFLiEx4lsGw==
X-Received: by 2002:a17:902:f706:b0:29f:ad9:f705 with SMTP id d9443c01a7336-2a2f293d057mr320042815ad.45.1767125559454;
        Tue, 30 Dec 2025 12:12:39 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 19/29] gstreamer1.0: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:49 -0800
Message-ID: <8dc5a5e3ba17a932231775c0ca3c903f052060c3.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228711

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 985ac9fcbe526617265a9e61d529c492a0400e24)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gstreamer1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.26.5.bb => gstreamer1.0_1.26.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
index 4c800c22d4..444165a869 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "0a7edb0e7b42dbe6b575fce61a4808a3f6b20e085a1eaecbc025d0ec21f1e774"
+SRC_URI[sha256sum] = "18a5e214114dc501407697dd458514bba62cadd5414c60f793cf70141a4d0bb3"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


