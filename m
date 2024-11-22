Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B242E65D3B
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 09:32:35 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.20466.1732267945630090682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 01:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z4PI7TiK;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa3a79d4d59so286622366b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 01:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732267944; x=1732872744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DHGk1JCrOcBfFgTQwIIbov9nkzM4We1YPfS2bbJSGus=;
        b=Z4PI7TiKY3qIUOrFj+xuamzDZBpKBGp+15+bayyx5/anov6GoMwiOuNKc0epJU0bH4
         +H8MKftnOWTtVjKvbzYMPXrBdHiapntI/HzUbM1ybS2opczBtGB4nX87pXZrgHLcMuN7
         MjCATTZKGLHG78y/7a1WqL2pI/2fftEZsH1RwGxAiycQkP5IUlQKsDhMGnJvo5DNX3YD
         1U7G0jCvmqxf7GHeA01FyAaqvnP3BaJx1jvq63ZyO84xrvdEEYc/L/5RrkwODVMGeXI3
         edbtlfWlitAaalvRHG6bs1PVnlaiVzp05XbRA/wZr+QkS6202MY7wv4bCtCYb8754qBN
         3P5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732267944; x=1732872744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHGk1JCrOcBfFgTQwIIbov9nkzM4We1YPfS2bbJSGus=;
        b=asCORlnWPPX5mLgSa0syUTDmMPjSCpIz0mMX0p0gCtZOTNNuzWwrONVK1BqzjunUja
         NPEY2j+NVtpYRGPWQ7d7wJG+LlUTcbSEhuHQjEgtbuQjiutRbNYR5HUKJKx9ydGpiX0B
         V4ogU8HiESdsU35G8rTdcbqIu/TJdHIDT4xp2zOCg/hogH9pRNF3MBsIG+pV3rpz9cOd
         BU4N3F38eMyR7DOsdmPNZ0o2LSUHjkZLtcS8KHCOIevKr/LA5UzcdDi37pm11FAI/fXR
         f91SgqMfervS7i+LCdcoSbWXmImVytSRIDZlLElnvf97cO458hzPfNmZhN1/gkCZxJVM
         8Uxw==
X-Gm-Message-State: AOJu0Yx9ECnwnEzY98Ryh1sL5TTpmPLU5U+NEy0hzJ6myA286ll+np4H
	DRYWiIFkeCQhu/2/6O36gr7JpjYHCNo/j19NtP5jOexRC3m+fJl+VHJJeA==
X-Gm-Gg: ASbGncvDnfa2kQRAuGwukAYMArxpqgrhhrsnaymbF09eJjDf/2YXmwDsdVlFGRnKg/6
	qh0iRU3ccGaKUCB01tOrfawoACNArjtLx5/h5obEUn7FvcN9D/mwKkEH95LhNZBtNYJKugt4Fnb
	4mBci7KXIqYftVqfQZSJ4hpe5gjaeQbe/PdqGg8VEeMIffetyS+QMFrQHxpeysGb+HBRKE76qN2
	e8eiO4sD9OjCTMZNtNyZr4jKNTo0YtssVfMj0CANAT6dtVC
X-Google-Smtp-Source: AGHT+IHvVv2luEbVDVqIfXZ++UUUVyxBhhVpF4srFXxcPwLIj/Wujh/eg8ZrWMrwcr454jRM0N/pfg==
X-Received: by 2002:a17:907:ca07:b0:a9a:2afc:e4e3 with SMTP id a640c23a62f3a-aa509d7914emr152945066b.50.1732267943829;
        Fri, 22 Nov 2024 01:32:23 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:640:1648:6dc:bcdc:d29d:d478])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2efa73sm74906466b.42.2024.11.22.01.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:32:23 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [styhead][PATCH] scripts/install-buildtools: Update to 5.1
Date: Fri, 22 Nov 2024 10:32:17 +0100
Message-ID: <20241122093217.68643-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207595

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.1 release of the 5.1 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 92a4c9dfb1..6387287ade 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.3'
-DEFAULT_INSTALLER_VERSION = '5.0.3'
+DEFAULT_RELEASE = 'yocto-5.1'
+DEFAULT_INSTALLER_VERSION = '5.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


