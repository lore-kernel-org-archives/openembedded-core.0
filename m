Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01BCC48BF2
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:35 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.4910.1708035446360323748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HyZAW14L;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33d07ee22eeso82022f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035444; x=1708640244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8tfzimZjDkoqv1DWfEruJTtwJF+/ErC9UenZzjdzZk=;
        b=HyZAW14Ld6mHT6ulinZuNiiiAxmNrVkOJrgI6qVSGHWt+2+PzLyDnHod4edGIcsSQz
         s1R2Ry+xqTFqwWQewzpzZhFSwNjRSWQoSVLqUjhLlqMIy2TIl9lEjcZnhixyB0H330qV
         bjjZsh57L+mI1sixXVzvSZbI6EwHlmkqaGRkiSyUTkLJbWpE/f4TvAsb+WfuwbKM8upl
         yi0GkwsDKvkEy2Oz2HDAW0iMiHXeospydn/MUICFZiPuBkmDsSBah6Ti4OFcOzxy2V0o
         n2WfgTtO2kiql1sJma2SuYzEAxk5gBlbtTqxYWaZ09WmvQ/ZPPsMKTWvrICOx31R1YbT
         8Hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035444; x=1708640244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8tfzimZjDkoqv1DWfEruJTtwJF+/ErC9UenZzjdzZk=;
        b=pmPKVmSV8AuQuOrJS0lmD0V7Q3A2JSXQEeBckGu9visWFbYiUz17tSCrd0GRfwxKA+
         NdZcsI6enGgbfNDS/XlVRVGumrvQag/cYgnyxeST67Www3wWbFGfRTtAupg+l0fhNO19
         9VDVVj2gzSVRk2n+HacLxvcUCcdE/TTM0/v8xZyYsaO+l1LuSYm3KiFnK65EfTFT4y7+
         GXyEEYLI+uLA3JxJk1GjocWQXCp1oNSMlb1tVM12EXFNB4Mcuc7WonNyMZHLspeAzMAv
         Xcrq4NbRCQZlur++gKCGcg9HI2ls5WQtYUIlUsc9nxbQEKKBWip4drHj3F2EdV4/MiDj
         A+Yg==
X-Gm-Message-State: AOJu0Yz/6AHO8fnZXE1qvSNtWSWYHUXq+7yY7U8vq+LZXDLVk7/I7NTF
	kxe0qQwANPEq2NJiMl36JOJpFvWnQlzSpW8NmyL1Nmn4IhtFsYBLgK6/nhNjJP8=
X-Google-Smtp-Source: AGHT+IF6RF0qV7lOGXb1XiNnNhmeJ1JMqGWG48Nsu7bSUgiMt3843tK+HIYFqIpLVD+rpvvjiM7XFA==
X-Received: by 2002:a5d:6a8b:0:b0:33c:f0e1:6fae with SMTP id s11-20020a5d6a8b000000b0033cf0e16faemr2513414wru.43.1708035444614;
        Thu, 15 Feb 2024 14:17:24 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:24 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 09/12] feature-microblaze-versions.inc: python 3.12 regex
Date: Thu, 15 Feb 2024 23:13:55 +0100
Message-ID: <20240215221711.332614-10-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195720

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

feature-microblaze-versions.inc#

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master: 662f52f1713c9f070550fc0c874eb62312218ea4

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../machine/include/microblaze/feature-microblaze-versions.inc  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
index 5c37f49abb..658e87b8cd 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -16,7 +16,7 @@ def microblaze_current_version(d, gcc = False):
     # find the current version, and convert it to major/minor integers
     version = None
     for t in (d.getVar("TUNE_FEATURES") or "").split():
-        m = re.search("^v(\d+)\.(\d+)", t)
+        m = re.search(r"^v(\d+)\.(\d+)", t)
         if m:
             version = int(m.group(1)), int(m.group(2))
             break
-- 
2.43.1


