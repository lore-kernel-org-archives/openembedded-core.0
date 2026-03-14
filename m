Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C0C10706F3
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 18:02:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14773.1773511317299869912
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 11:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WS9ZMP42;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso28081015e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 11:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773511316; x=1774116116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kRRTW3G6AFu0rZpDn5b9ufJj4bdcODuKQZDGX0L1vM=;
        b=WS9ZMP42ksLYgIOXimUyrfI65jHlQT7P6f4R117zZ2iiTtfku4NIllEXIqdr4I3wI1
         +JpmgKTUlXbj+3aEFAwQGtyUJR2JCNyqIaR+GvUKD9nHjcameIeFu06u9lTbqBrf9lRD
         z/uiUO6HDH3MaUSWN8Al449BTLh//06cnrPh4Br8g9Y/GtMUABO56BEF3FN8M6AIRokc
         vtkBMSaapl8OmhLpzD5P7L5dy6pNwV5MUnfoL5dtdGnLX1PpQb4M28Rh4F9NTlpD71sM
         +QgX4pOLFPtMb2kzB3nMLUYA/3M5KHpuDiHCEWjPAXQxBjAU/1fjmrr/Oqd7le7E/Ysb
         pZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773511316; x=1774116116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kRRTW3G6AFu0rZpDn5b9ufJj4bdcODuKQZDGX0L1vM=;
        b=MzYjSgFU9rFF5CjNXlnADJot8CWEqV+jUm2AZCyJXFYgkJBh7BZNqU2GJPQg2x3kNr
         HWS/EHgZdTRRLChp/YhTUVbsOZ9lMTI2iUbratJ7s/MeScJQpsNIqbhfjIwGfTujRjn5
         E3raD3+o8cV+2TyJVusB9pvfMF5KmPtKMDdhk87GW30s1a3DtCxA29xw9UgCTl4uHHlq
         AzOJ+fAeuBT22ltZK1n+yM6JupxIOM457Xc6DolcZBrUaSNlRHP1PO0mmJjX6geWpntF
         slAdwbaEr9/mSq0wd+jOWvjfpq9FFlh1WprVhz65Vigr6jFYGjjYwWWi4EPCfnPEECST
         hVsw==
X-Gm-Message-State: AOJu0YybzDg7cljXR+9KYT3bTGrJISNm0JKSTf2YlVhOKXyUzR/AU5gg
	8z4fdqCjBNcNVeAyggMDsnSXELL5dNNIOEvTGbMnmwBNs3DQtiu2JdoiqniiMQ==
X-Gm-Gg: ATEYQzy1Xfu5d+KL41O0YpRhEBE5p9qIIrGsGJJNQGp8QkZnAKb8VvAU7O8Vb1jFsOV
	PxSUvXCy4M+UaTMfwkajCFPk+e9rCxjJDnViZYaZ3hKm6YI38sEPwCbqy+5RxlZj+m9mwQ9r0Zn
	0uETrrys1TodHiG5SyS9ukFaGgoGUFlYOhkrcMQTMoXgKYU1lQVSmmtg1WBgvNTHNFVWRbgimVe
	XtVd3fFIfgAvLHChJauI+bnGJJnexQtNcn2R35E7TlRaQhoLh5WjjFSs5KsZbOufYISq1IK8oG4
	4pXPu71aUUqLFjsLP6kGqDCcc6MkqX/doDQv3jpYM8Ya9LSV8M5ktjT82ObN7p4DHFMttwfaMsk
	zJp/QzU/FEwhOs4fj6CtI9rD72eWdO+gf5rtuGfE5M6UM5l4gM7QkyBZkh0CT2XLG5l8G6QWajM
	H+grenpfuTnFYKewiwPlYpqr+RSf/pHYxb/aMpD4hna4AX4eBt9mygnBwMkE57SkyhVFz4wYai0
	LO5I6Z2IR5oQKTN1g==
X-Received: by 2002:a05:600c:a009:b0:485:3b00:f92e with SMTP id 5b1f17b1804b1-485566c6a8cmr127535025e9.2.1773511315403;
        Sat, 14 Mar 2026 11:01:55 -0700 (PDT)
Received: from acert-swift3.. (178-221-163-183.dynamic.isp.telekom.rs. [178.221.163.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66e3f8sm285902825e9.14.2026.03.14.11.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 11:01:54 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Subject: [kirkstone][PATCH] scripts/install-buildtools: Update to 4.0.33
Date: Sat, 14 Mar 2026 19:01:49 +0100
Message-ID: <20260314180151.43501-1-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 18:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233093

Update to the 4.0.33 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index c105dfe462..6a1762c14b 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.32'
-DEFAULT_INSTALLER_VERSION = '4.0.32'
+DEFAULT_RELEASE = 'yocto-4.0.33'
+DEFAULT_INSTALLER_VERSION = '4.0.33'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


