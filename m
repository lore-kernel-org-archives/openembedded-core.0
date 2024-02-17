Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8741C48BC3
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 17:09:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.1225.1708189764818077311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Feb 2024 09:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JS59HR4G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-337d05b8942so2046160f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 09:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708189763; x=1708794563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVoecruvpxpiyxlhQ1Qzq8DIUnbIql7VjGD9etB/WS0=;
        b=JS59HR4GHBi8LiLabWoamoxq3D88OkyRQuWHpqXDPlnIvkoi1uz1BxsGBcYRcF5rVV
         KhVmUbCgfndeG0Bg1I8JTFIeh26ydS+xpTJNp4JjvBN2rqJ4i3PB/JG48QrNS7jn7osJ
         kf1skAG49kqE1iuwFH92Xwgahw+eN3I3rFfHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708189763; x=1708794563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVoecruvpxpiyxlhQ1Qzq8DIUnbIql7VjGD9etB/WS0=;
        b=Eb0WXsYyzOxQ2UcQgjXqdj2Xu8k8e9hAGvR+kyk7+BW/iBXnqbCBnma32hNyk6j2JX
         IfMxxPO4GUVrn0CetlpVsV4ob4r033w8xnaf0ZQjGW0MhdaaQuF/9DBq13UWanKAaLyH
         fULH2gCZmHrMPHgdmQlvQkyuapoTnZvL0z5Fc8o6DJWaslAJ8A94c3khZT+h/MxOSggs
         wJNM7cbYdxMjGZc54RN2+m7w+9A153XNQPj+ivM7uBr6W7eIAwVMd7KZcQQOXVQbfiCR
         ZzPMwJ1eTiTKbUvy/ucL97v3+xqg6CZFba8mVVcAgjigZNmkApi9feOtA5JGG/n5sL2A
         1+xg==
X-Gm-Message-State: AOJu0YxBjI1wthEZpqz9Lba7nn95tmY8K9SOcLXdExUSrDgNrdTCby1g
	IWQMcQIW9ycpRlA7fcH9ZPNggKRzYqqw9tcU0FhzCM7uoVWgFFKUWPr9zlH9HZJ3b9AUAco3zNi
	+
X-Google-Smtp-Source: AGHT+IHEE7j6vAIqSaaqsBBInBz1cRzG99S0MDsIUFcxHvkmr26JA629DgoyF4oFx7H9msGzC6cJzA==
X-Received: by 2002:a5d:64c8:0:b0:33d:2b36:3bf6 with SMTP id f8-20020a5d64c8000000b0033d2b363bf6mr1246602wri.71.1708189762846;
        Sat, 17 Feb 2024 09:09:22 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3666:ec64:7355:426b])
        by smtp.gmail.com with ESMTPSA id d2-20020adfef82000000b0033b75b39aebsm5396292wro.11.2024.02.17.09.09.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 09:09:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] testsdk: Avoid PATH contamination
Date: Sat, 17 Feb 2024 17:09:21 +0000
Message-Id: <20240217170921.265808-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 17:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195815

The autobuilder has been seeing increasing numbers of testsdk failures
where xz was 'missing':

ERROR: core-image-sato-1.0-r0 do_testsdk: Couldn't install the SDK:
Error: xz is required for installation of this SDK, please install it first

This is probably due to xz and it's libraries not being in the sysroots
in a way which works without races.

Since the SDK should be using the host, fix this. The eSDK already does
this to solve a similar problem so copy the code from there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/testsdk.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 35e40187bc4..b4719110edb 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -79,6 +79,9 @@ class TestSDK(TestSDKBase):
         # sdk use network for download projects for build
         export_proxies(d)
 
+        # We need the original PATH for testing the eSDK, not with our manipulations
+        os.environ['PATH'] = d.getVar("BB_ORIGENV", False).getVar("PATH")
+
         tcname = self.get_tcname(d)
 
         if not os.path.exists(tcname):
-- 
2.40.1


