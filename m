Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC06C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 14:30:47 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.12940.1707489043621355895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 06:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=094ECGsO;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-680b1335af6so17551916d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 06:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707489042; x=1708093842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sJv+qN5/4C6bmudwo9rsf/w0nHajsYg58K5ijXY1KCw=;
        b=094ECGsOjUFzR4UuKTn5BWYTCiEfPQrU/oG+OG0xsXiRnvkxwkHQwxR7nw5BrhImp0
         dOoCpM+vAxs/yQu8GXEoaUXMlQdxIGtZAil9YeGKa7kDiyDhf0CpSCXEyT+b4JVXfjWI
         9RZUnhzJZ2euJ3c+52zZ+hsaVRjchYpi5D1e9rQg+N9nBUHSMFDFV57uT3oaNTjy86KZ
         jGNb+Koh+4TJEA4aIXaJzAcAGQs7QB5wq/DJlAgjPdtW2Sm8/ejZcntLorRRW5gsAdeT
         zy29sI6mzU4AUg1ZupN6lf1WEG4LzKlwNZnhOJr92Xaah7h0BAyMYNc58W8mYvYyXHBS
         LH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707489042; x=1708093842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJv+qN5/4C6bmudwo9rsf/w0nHajsYg58K5ijXY1KCw=;
        b=weKpNKzJfdsiTMHqYgJ2q+zIyppwfrUtJLp1gFBYNfZAWFKrwZQAhnK/i0s0A44UeI
         r7QQQKykgbcMNcJVakaqi1rbj4WRxecGcdnLibbphzmQLy1wkokItYHHA5kP/iXMg6bo
         qGAn5sKhTLDq67FsGgb49f9Jw5Pgfx4WMYFS46ODq3apX2nMTg74BDjCSSdzNXRct728
         IkFHyWNDIWCC9fiEkB0X+XeJC8/WpmQIhc7ykmJKQ8Bb9s+d48ldHhTWmffvRnTJO55v
         VF0efH+S3GcHeBVkNxsiv99YPbDBD8EBBmHkSooi6r9kWJGGek1gUW5ZKvB4F5PTou73
         KmEQ==
X-Gm-Message-State: AOJu0YzrZBJq5ttVpH5RqQ1n5c6ogcs7I9k6x/jMXa90zW2jDupQec3e
	P3GDswm4WYoZLd5EFzr/4EApFfFWVaTLcMFzDks5ZSKa/HSJmrb0WPiflFYmn0AHPyHkbRiTo0a
	o
X-Google-Smtp-Source: AGHT+IH73F+QFLRKlzwi6GrNkUVFIyENId80LNxwdQ/ZjTyA4pWvlofzuTx5lzp3ac8khjWNAddWFQ==
X-Received: by 2002:a05:6214:5092:b0:686:9e8a:a695 with SMTP id kk18-20020a056214509200b006869e8aa695mr2015048qvb.17.1707489042467;
        Fri, 09 Feb 2024 06:30:42 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id da20-20020a05621408d400b0068c4d8a9dcasm857334qvb.140.2024.02.09.06.30.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 06:30:42 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest-send-results: Add 'References' header
Date: Fri,  9 Feb 2024 09:30:41 -0500
Message-ID: <20240209143041.1688862-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 14:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195220

Based on https://www.rfc-editor.org/rfc/rfc2822#section-3.6.4, to get
proper threading there should be a 'References' field defined in
Patchtest's response headers if its replies are going to thread properly
on Patchwork. This wasn't there before, hence why were were seeing the
responses in the right place on the mailing list but not Patchwork.

Since we only want Patchtest to reply directly to the tested patch,
the 'References' field should only need to contain the same ID as the
'In-Reply-To' one.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest-send-results | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 075b60d8f7d..9fd24c9b959 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -81,9 +81,14 @@ if has_a_failed_test(testresult):
         reply_contents = greeting + testresult + suggestions
 
     ses_client = boto3.client('ses', region_name='us-west-2')
+
+    # Construct the headers for the email. We only want to reply
+    # directly to the tested patch, so make In-Reply-To and References
+    # the same value.
     raw_data = 'From: ' + from_address + '\nTo: ' + reply_address + \
         '\nCC: ' + cc_address + '\nSubject:' + subject_line + \
         '\nIn-Reply-To:' + in_reply_to + \
+        '\nReferences:' + in_reply_to + \
         '\nMIME-Version: 1.0" + \
         "\nContent-type: Multipart/Mixed;boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n' + \
         reply_contents + '\n\n--NextPart'
-- 
2.43.0


