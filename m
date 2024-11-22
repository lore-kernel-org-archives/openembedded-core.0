Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA376D75E30
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 11:48:25 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.22113.1732276095441061887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 03:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hhAGOxeC;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cef772621eso2557076a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 03:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732276094; x=1732880894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lh1Vis//C3AiB6rn5tzCFtc0gisnYdyDkhZv8ChCnM=;
        b=hhAGOxeCmFoBk1qbaGqJKik6IjgKFmqr2Q1vCqN8S6SetRYIJlv6gWb1qOAcI03QRa
         e69yCSCdUCReTejzVAcAytVjWS2KE8BT1zdNaz82B2FiwLo1WxYasxVeZxngHGjUMhUz
         yey2B27XaEF0kJHVye7968iYOE/wtSHz3ajZtsy8b4FeggqumU6/MgHsHKf9VuQT3hoT
         lBS1njcgxEv3xp9eUsNkpXDX0ohDeMim7p9XGCLv7Q+h8/CH26QaLkhQxPMRg8gEBQ/v
         HlHCvLm8DuZGPBh9Ft4+ugiee852gpJns6V+T3Sz0L0pK8OueEsbubw/QOaQlRsGvcON
         0++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732276094; x=1732880894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lh1Vis//C3AiB6rn5tzCFtc0gisnYdyDkhZv8ChCnM=;
        b=GYNNkoJJbGKsBL/HXzsbO9B/wE2PMfcIFZAAGbDKwsBqE2Jix1tMQZ1CIogxlqQr5E
         1jJnZKK3s7gj/I59v4GC4b5A2kW/MNYHQEXdNlblBiM+r2gcLSshgeXXIWo5379RLktR
         TBhcGbsqQjU4+M0L2s2tCeEVz5fOzV8C8LLxS53mvWIb+2MZn70fImFPMOIreRh8noev
         5Lxe+kG4+EYencH9HA3m3gSaho+Je85uAq4tJMw+y3gObd5+Ix1GkKueqgG5hXDxocb5
         a1ivpea214TvmKtEVToLcFX7C+IMJLtLdYSRDB3yPap1qA6dNhY5HPZT36wK5xIdG5FI
         1o9A==
X-Gm-Message-State: AOJu0YwOyOC0nX8ymUjovyaLqcf3zhSK454eHMpeiiU4LfNeiaM5VgZw
	oIBIrQMOo12+DG6l055AOj4BaZr8vk6cwnDax+jllN1QCViAYR48SaQfyw==
X-Gm-Gg: ASbGncsgkH4bR5EnRDbBvWTqGXW33d9cGSenM8lVbxAOlg+nraWupE40US6Vv1RLxnN
	2yy8HiA++P2MlAppVLacn6MJ2EW5kE3rsYky3q6zTOLdqPN6ZjuXqeDsa9PPqB0zS85mk3ViY5L
	FSv7e0zZzJGD9XRNjj9h0nulpm0byFTpaNiZqDoSlHgvPHdHyCSs+mAouYkiSVaya8mwzABJOUE
	siJpjIuYlOfabYchOmIE+c9AUysjWyB7ntTLPgM0u2fGY+Z
X-Google-Smtp-Source: AGHT+IGXIXgssF3a3cS6HeV3nmpa+sHnSG05dOB9exdnXUSRmE0VIG1JOAOJAn+L5n3CUYhQ0d4LpA==
X-Received: by 2002:a05:6402:3595:b0:5cf:baf3:d567 with SMTP id 4fb4d7f45d1cf-5d0206260c3mr1921972a12.14.1732276093383;
        Fri, 22 Nov 2024 03:48:13 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:640:1648:6dc:bcdc:d29d:d478])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d41aea8sm815133a12.85.2024.11.22.03.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 03:48:12 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH] scripts/install-buildtools: Update to 5.0.5
Date: Fri, 22 Nov 2024 12:48:04 +0100
Message-ID: <20241122114805.71642-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 11:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207605

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.5 release of the 5.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 92a4c9dfb1..ee6bfb89eb 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.3'
-DEFAULT_INSTALLER_VERSION = '5.0.3'
+DEFAULT_RELEASE = 'yocto-5.0.5'
+DEFAULT_INSTALLER_VERSION = '5.0.5'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


