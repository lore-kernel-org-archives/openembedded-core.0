Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D33C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 09:09:57 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.2873.1707728996422217532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 01:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e7gfHT3s;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-558f523c072so4472052a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 01:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707728994; x=1708333794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3cTj4DKy1zOc3uAiQT1IzY64gFi/wHD6+352RfaeiQw=;
        b=e7gfHT3sVSniN4CghllgdOy4TOQpuC7GyImekQqONnk2Khb20kf02XB0ngRH/H0E4j
         TMRTsfu4C5lffD8HaQJhb35F9LieDR20qMVe0tWcrnTBBXHiLVOfWEvCCaqgV/y5MRfe
         MheEjdOh0UmVHf95yjfMMVB7Zklm+WWTfJyqhO7LxtnN81hlhQyrAwRmIaZKYJJwaBow
         0TDZLrALtftArFvdagNC3nIk7/NwluAAIcPLssF7EiPaoQEmwbwszB6KcM3a4LGSfeDN
         wFU0Atk+t3dcMCoodTsVUug6Wr3KW0nKKUGkbsKGZMdmmGVBdW/BRcgo2LVOogEb8lY6
         vo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707728994; x=1708333794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cTj4DKy1zOc3uAiQT1IzY64gFi/wHD6+352RfaeiQw=;
        b=VWGIJU2I72frD94bMpswciDfEwtgDLn+GyugosMIom71auD6x5nl6sd44uzQIhlhn7
         SvnZfjc21JUMZ6pkx6tkwq8OjzTKI1J+RM7MddH6eCem7pnVsg5EYX1hnp9a4cYzIRTo
         OQDwo7UDLFONbAvS+u5aSVR0gtHsDxU6HzNyNnr8xrw4SlSS4040u2/Nm4rUNrSurgoc
         I8vkE9hk4M1gcXijyQYamyq998u6019IlvCtfTWonx0qpNISTjDaoYASE6kkaUhdwd+w
         yEnXNUL1szyySP3OcFfRKd1IdswnbA0TBobOHAAJk8wYNGAGWdVuMEEc28w66nuLQwq9
         62ag==
X-Gm-Message-State: AOJu0YyuR/JSBdjFzbzjxHjCj4TD3nrEXL/hXpj8coUBd2tb31qgz53P
	w8HzMA5WDFhGLEEyhYy8KJcPcFSwL1vcDV4xCC38Ba8A879M7rkdcny9Voou
X-Google-Smtp-Source: AGHT+IHeB0lfN4Yda6IWOE59aDTjBeIm6yY/j5ESYiPlwB3gNIIDU0Oufj24/3t/2KZJ0iab5xG+Ig==
X-Received: by 2002:a17:907:bb86:b0:a3c:be5b:ed90 with SMTP id xo6-20020a170907bb8600b00a3cbe5bed90mr734605ejc.16.1707728994343;
        Mon, 12 Feb 2024 01:09:54 -0800 (PST)
Received: from elitebook.emea.nsn-net.net (host10911.telnetropczyce.pl. [45.158.109.11])
        by smtp.gmail.com with ESMTPSA id f27-20020a170906139b00b00a3cabea1b51sm1344ejc.42.2024.02.12.01.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 01:09:53 -0800 (PST)
From: Michal Sieron <michalwsieron@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH v2] sanity.bbclass: raise_sanity_error if /tmp is noexec
Date: Mon, 12 Feb 2024 10:09:26 +0100
Message-ID: <20240212090926.193109-1-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 09:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195303

Older meson versions save temporary scripts in /tmp.
Similarly some recipies also do that (e.g. ccan in sbsigntool).

As this can lead to unexpected build failures with no simple way
to workaround, make such setup a fatal error.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/classes-global/sanity.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 1bd74e1935..bbbc41ddae 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -840,6 +840,10 @@ def check_sanity_everybuild(status, d):
         status.addresult("Please use a umask which allows a+rx and u+rwx\n")
     os.umask(omask)
 
+    # Ensure /tmp is NOT mounted with noexec
+    if os.statvfs("/tmp").f_flag & os.ST_NOEXEC:
+        raise_sanity_error("/tmp shouldn't be mounted with noexec.", d)
+
     if d.getVar('TARGET_ARCH') == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
         try:
-- 
2.43.0


