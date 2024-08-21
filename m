Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEC6C5320E
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:54 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.18875.1724244649761956361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zKmynUgP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7093efbade6so4242710a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244649; x=1724849449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUTXV9B3a3HJ5cDgKYPX9nR4xthbc0NP9DNpSzTv510=;
        b=zKmynUgP/L9itmitqaGljLsSuV0j9GKrya431ahsqyMf5nZAHXifSdxv3Eh57dJ3Rv
         LfvHnL4PsZNjRrF3gK3P1umf95KlDUm20co+z2OPZKA6XQhaEzXdINm/Svtj2kj7P1Tx
         P3KwzNK9chej9Mk/UcK5Z+5xyWWT5/DPB+04tcYyuU0LInP8yIfJtWQDrl0lH/JrVREp
         MglDnHv0V4uuEHcIiTYengvpoyuSpJ7dLHzUaILrJMXPB2zQamKtZO2H/Tz23eaS3HOA
         uuaauUBLGPc0u7n0TMn7ouV+t3lpny6fPtgFatg0sDxtA9oXv7VAU56C4DhCTWhhR1m3
         nkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244649; x=1724849449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUTXV9B3a3HJ5cDgKYPX9nR4xthbc0NP9DNpSzTv510=;
        b=dLMK+ZQiStnY3er0WJ7Uywk5noLzg7mhqze8Qkdh8k/9h5hRyHHb/SA21jCEFG5YLc
         Rx6APhAqAxW0BWHCXFA7tSYk2/y8mOnJv6hOljM4rRYGtFUbVoTEXMRljdV3Z5bzGjNI
         31UGvuudndD3//QZ0ZZfcU5gWyaCDFX5yyPyNH9bq1mYcKQBwUsQDAxZ5t+oKsiLBkJw
         P7hAN83e9KW8eSMu3Hf7jgfpxWyn8I7M3PID20boDAeZMNyLAC+jfIMPgF3p99N/050z
         nGnjMfsuidflQqDDKPkL9Otg/Nrr46shHQJQJoZZiBiwa6gRk4RBtPudLsgyeSbaVn0X
         oRHg==
X-Gm-Message-State: AOJu0Yy26Lz3bBLjbaiRXNR7wS3EbT2umZbOc4/eLvWzUDasaXjjbxti
	Nhg9rojfHFx9O9cdcfnVTuDFd2Sz4kDkg2TCsMdeWEPZKEaBRk752ZaVTOXhAblOGUpWE1hIaG2
	boaw=
X-Google-Smtp-Source: AGHT+IGX8bdRrNZkTVLtJL/u4R12g6cYwTtHwBrzArk6ZJ8ioDUDbZA3piFZflsvxtDL2HJqcP+pxQ==
X-Received: by 2002:a05:6870:9721:b0:270:22be:a97d with SMTP id 586e51a60fabf-2738be846e3mr2353844fac.47.1724244648620;
        Wed, 21 Aug 2024 05:50:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/18] gstreamer1.0: disable flaky baseparser tests
Date: Wed, 21 Aug 2024 05:50:21 -0700
Message-Id: <90a510acd11fe342d01c62e3b247425836711c50.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203598

From: Ross Burton <ross.burton@arm.com>

There are three baseparser tests which are causing trouble on the AB,
so disable them as we've filed an upstream bug.

Also fix a typo when we were attempting to disable parser_pull_short_read
where a colon was used instead of a comma.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 91dbe8d6c57805f38bd287f1b392759df066589b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index ab2df80dcc..7fee5a3d09 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -16,6 +16,11 @@ GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_functioning"
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_infinite_seek_50_src_live"
 
 # Known unreliable tests as per subprojects/gst-devtools/validate/launcher/testsuites/check.py:
-GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE:parser_pull_short_read"
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_pull_short_read"
+
+# These tests are fragile
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=14884
+# https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3524
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_convert_duration,parser_pull_frame_growth,parser_reverse_playback"
 
 gnome-desktop-testing-runner gstreamer
-- 
2.34.1


