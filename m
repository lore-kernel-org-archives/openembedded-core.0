Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB6DC87FCE
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:08:44 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.46729.1753909720310761896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TcKJgub8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748e378ba4fso368532b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753909719; x=1754514519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sf1BSoZ7hJZULGq14Uonrd6eFSfI9NM2f9OUYR/UiQs=;
        b=TcKJgub85scCnzTdqLx0E1FmQV8DAEGkev1Q9xWgjupKICZ3UyrcMmM8SCpi53wtmM
         KvB/0yPtrtsfOtYWavd3CwLTrwpZkunFhxhENDThiu/7PSa3FOpqDGfcNG8PJSaUa6la
         Fj7CU7pqSo1mv/T6TVQsozJQWJXc3D+UjEJTxIu3WTomr3GDFzL2AvXRVBPHRw/HsR6Q
         eXW2DMK674KADl4HX0PZD4RSLAL15270T7ANaqM0oLkOW1itnZ1lpBfgKVE6+N2YAEUL
         R4myI3KikxCR1Pu3DVeDblf92lZs6OtgA2kKz60JuPsluOHqVApckk2fberlNdrXNb+U
         z6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909719; x=1754514519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf1BSoZ7hJZULGq14Uonrd6eFSfI9NM2f9OUYR/UiQs=;
        b=Tjo73fPKWOwqe3ldVpLY/vEWfxifn3BTsZkdR6Tgh/2zh7p/p9jQvzgfMTSrBPgRou
         dDiPQCmWEYG5BBvPfu3XxYJoJ20gM/J9VVmpnNL32MRJGeU/i7NLSGeGaq34vuHg6+oK
         EdV3+PikPkXge/1AnBf7gNCnQH3yPXxADCYZanPVcksfvkVAB0TqDfUXXPZSA0ap4aah
         HPkMlj+BSPiP5tjP8LSxBwT4B/+GbKO2MjyPSH9sNw2G2GKZPIGUiX3Ojwm2yY4ckzXl
         iBrjSAXRsVPhcKye/CGjEg86W7SkAWwlwXFKSPtkImzkAZZUnzwsaVlsZ7loJeqpU0je
         xdPw==
X-Gm-Message-State: AOJu0Yy/+Gg/wP963s/VxVDkcEYKq+gUrzfKbyNeNrQp4GqBfbuPZxE1
	QCHbVMdlYKUDFCN4F0hWcmf28FYPMfFNaMfGMRteezDnGnSMdP/Ncs7/Omlk8ITYkGloBUkHGBN
	dqon0
X-Gm-Gg: ASbGncvl2Op0FTh48zp3E96/1s429gll3LyPH7VrGks91MvdgigohF43Teac0/pZk6T
	2N/jQfFGzb4/5GC5JjgNh2oBfcLBeAnruCALNfBREPtk26e5ok5k3lPZ57lkUSHxzWjNJLf0fqR
	rMtIiSipFQnpHM0P7QIXn0bQc0DW3XehM9h4rT1DqmrLQtdiy3kXZ9Up5CP5UtJ2Y2L2p5h2PeM
	zwe9HceSc4M8Z5aQGZ5OcgvVETOvacqxw0+OEc7OT4nhQkCvsnyRYSsi1hKbf4jKIT8YiNy9UVW
	L5vKtsiwVjpJKxiKQpyUu7M3EWf0JrdlBUxU7PwBCNTEN6E2MEpEInicnZXeHKa04d7/cj0sKav
	+ghVvgFu9050v
X-Google-Smtp-Source: AGHT+IH7LVOMhEPjn69dxIRtz85tRRTUCjtx6AKw465kVz6dYTXTgmq5ivhjctwUbA76AD2M4hji9w==
X-Received: by 2002:a05:6a20:7f9c:b0:232:7628:9959 with SMTP id adf61e73a8af0-23dc0d6980bmr8117064637.8.1753909719511;
        Wed, 30 Jul 2025 14:08:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-769ee9ef1casm4929456b3a.3.2025.07.30.14.08.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:08:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 5/8] scripts/install-buildtools: Update to 5.2.2
Date: Wed, 30 Jul 2025 14:08:24 -0700
Message-ID: <9574617a89be544a855c3309e4fcedf34d689eaf.1753909581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753909581.git.steve@sakoman.com>
References: <cover.1753909581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221155

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2.2 release of the 5.2 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index aa23942858..50b5487eb8 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2.1'
-DEFAULT_INSTALLER_VERSION = '5.2.1'
+DEFAULT_RELEASE = 'yocto-5.2.2'
+DEFAULT_INSTALLER_VERSION = '5.2.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


