Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE49E7719C
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:46:27 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.18204.1735998379779575899
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SfIDqMzD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f441791e40so14990809a91.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998379; x=1736603179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5k826bTKCtBdV23sU+AJ04Dnpi5K4Dsh9NicftjS31c=;
        b=SfIDqMzDFpbd3If2V6oq9rd+xSNH/qQtxyys/0PiKNi5om0FsOm3hMKQTssQYvw0gf
         kY1zL8xyyCPQmk+FmHbuV7KojD2n+qAjuLxkcJu3uJjSOGz778Cn8Mm8J1NTbRh9IPWw
         ffXouFZQDuXdbVbxb/jgj+30IjXQxrnnvGoy0acSWHHzepl5kP4myRNdNpNcC2gZfJpA
         A2oBiA+cQGy/87Zh3s7ut5dZTWTHttQxDzlrFUX/eV/5lJ/IJRdnwzICoGiKlL+XvdSR
         PaVw9tqqq3uz5yCGVx5ginN9PYuFIhEP9iT8VH0cv4GtDsjVAC61aoxx+IsKx2n64cLm
         0k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998379; x=1736603179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5k826bTKCtBdV23sU+AJ04Dnpi5K4Dsh9NicftjS31c=;
        b=puqyK2DLmSUWQkX0fNha9xEpewzxi8CV9cC8yY3j/f7nNVHFXepaXGdaw6pC9KDyg6
         W/8TBxORl0YPj0jRRs4VVeQ60+qXVTNRHas4xBi9nCxIwO6bUCtB3SbiA7U9KlThdOod
         TW9lavmjzWqxvb7XxH0uMA53T3HKt941p10iv7SWHjBtS5SqVwJcOCIRBYsBIiRtZWx7
         a6845ESJqdWFC7cViLdtGEtT5K4BSMoDQYBzHXMymdE4p9UOnPfsO1QZ9Ls1o90Jrh5v
         0qbXIfKStAMssGgYZKLzQgHDp/tEpOEZI1axrhodMtT/BL+N57mc3ia8a+fBS15L6bCE
         KJrg==
X-Gm-Message-State: AOJu0YwC7yoYd9g+4bbwXoYAI0By5d84JZAks5SAygVZmOGm8fSfHAS3
	I94yrzfHbukLOFsyms54A/0X4d/M6/jRWrX9mLoL1v+i2Szp71B7T1SGR2aoSDJugJZoqRzC6Iz
	h
X-Gm-Gg: ASbGncvpZbMxtCqieGTWd/GKPNwOZvdUl8k5/mTMs8R3W2NtzSXwu4QqEvzeh8LDU7N
	tdRq1k8oR3x/7ohKzSrNONsbt5mndIvGpZFx2Ex2uEAsr6wzIt4Dc7iCy8FQUyUAh7CKBP2fCak
	o9b5LAKDcLdWyhzE5PI9GOUV+WYZHF0nD+6z9r7fdy9rvoKbzI/r/9tr0pOqZtA1LrDbFbAX6cX
	yIyLV7TZtLrmvizSffAnC90ewt6rThiaHLlugkkMUIlUA==
X-Google-Smtp-Source: AGHT+IE0p9vzhCyl4fRCT13m4e8FLUbgezWWi9q/0fshDRYvittXWVM8Mbx9oUbCltwfoT+r1bx7sQ==
X-Received: by 2002:a17:90b:544b:b0:2ee:c9d8:d01a with SMTP id 98e67ed59e1d1-2f452e1e54fmr74800552a91.11.1735998379078;
        Sat, 04 Jan 2025 05:46:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882b09sm33498230a91.41.2025.01.04.05.46.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:46:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 05/10] gstreamer1.0: run ptests in parallel
Date: Sat,  4 Jan 2025 05:45:57 -0800
Message-ID: <6a1060341df2b1f13b34d8713d3915240adfe8db.1735998221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735998221.git.steve@sakoman.com>
References: <cover.1735998221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209400

From: Ross Burton <ross.burton@arm.com>

Run the ptests in four parallel jobs (reduces runtime from ~80s to ~20s
on my machine), and also pass any arguments in the scripts to make it
easier to run individual tests.

(From OE-Core rev: 87a9fadc71c8d3c1eb841c84c96146d5c56f1241)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...004-tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index 629b0563f6..cd795fe0ec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -59,7 +59,7 @@ index 0000000..cf7d31b
 +GST_PLUGIN_LOADING_WHITELIST="@GST_PLUGIN_LOADING_WHITELIST@"
 +GST_REGISTRY=@GST_REGISTRY@
 +GST_STATE_IGNORE_ELEMENTS="@GST_STATE_IGNORE_ELEMENTS@"
-+exec @TEST@
++exec @TEST@ "$@"
 diff --git a/tests/check/template.test.in b/tests/check/template.test.in
 index f701627..b74ef6a 100644
 --- a/tests/check/template.test.in
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 7fee5a3d09..44dc350eb3 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -23,4 +23,4 @@ GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_pull_short_read"
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3524
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_convert_duration,parser_pull_frame_growth,parser_reverse_playback"
 
-gnome-desktop-testing-runner gstreamer
+gnome-desktop-testing-runner --parallel=4 gstreamer "$@"
-- 
2.43.0


