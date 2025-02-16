Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15BFC02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 16:16:33 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.31631.1739722591669688619
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 08:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBbLuCgX;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7ee6f54faso423007466b.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 08:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739722590; x=1740327390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nDrxlPbDxNtQSXPw72pc4XoXnhGf7exIdVfe3Sj7w10=;
        b=LBbLuCgXH4IS+qisW0bk57Fp1KEEqNDt74UKtJYjCn0TSx3tkNT0BQbOkS2/xS2E1G
         1mW/ABqZayGFkOxB8TC7aHtt028Fd6NNKbehmzm5npqoGrY9f1+OUcDLMUZ6NjzPf2k6
         1wlH47L+pTk3NYNIjVlkzhq1PW6+xvrjB6EReMjEDUP5eM0XFhpsffsF008Q7om0zQh+
         9IiiMf7TsuYJDJg8qTW5+KygGLoBPw2goYdPzycJ/QVMk3GQ8z7n7xVlX3Pm0fhChJrB
         r1flsMPiEvbzoZvM2NNep1coE88nsMRp34oafwVG6WQNXb4YVI1NEld9OzWtG2oVDI4S
         DnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739722590; x=1740327390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDrxlPbDxNtQSXPw72pc4XoXnhGf7exIdVfe3Sj7w10=;
        b=faxuZmWPwBWP5xxismnuX6cOmwjmB12VZZDs0RtLDZSxSgIpodOW2sMIRv92CcOWvm
         bd7bBqY8Poe2X+HBW+FyK6JDvqy4zaljT00PYdYfOSfNJYPpZth7ZDFMbYipUFdxdonC
         +R6fkXKstYymD4M/aut3Gm+hZfieEB3QwkHkpj5aCQu+cNYR+xH+9cWCXUublH5i8AGC
         zp5a6pwt2moAxZ7mxRpdmNMS2Fha/7GrMkZnNIb6sOVSr1zlhsiSYS5Bj1qb4FnRZT8i
         fUMHFbws1/2BgLWJLJlkZZeXD4yH5pj0We5JjSl+lQeTerZdOal+CcsrVoFwxDOXp9RK
         6fdg==
X-Gm-Message-State: AOJu0Yw6sZ6tPeeih7SbF2VBE3QYSIe0joNlUrsTU2h2s0j7ehgxK0QM
	LzJWSrxsLnDdcKYehGkvK2t1iV8oy7/kkahwUSBZa67GDUidVkLDPUBoNJWD
X-Gm-Gg: ASbGnctVCSPnbJhF+qtzVikbKvNt35CEk6DWQfOTPPwZD2PpTfw6mxf76VOeEl1u9Sq
	l6lMSCJa9DRocFBeoibu6x/rN7UxsCQDsmfz5Bcw4emhJxYjtPCqvp9aoyLmHWhN/Ny0Pkzbrwg
	oxa5oUb+gBwLxJDw0U9PcWEW72SmfH4e07jd6vA1tMO7jQ9qJFqukfdTcshoPIN9DAn1HaMaV2m
	UfO3Yzzq8ISu/CtqIQUgEOSYTd/xT//EKhpYc+xTwAtEJYM7AzifldoNfRPybVxgIgERY+tM1cH
	FnkEuElSNzrN
X-Google-Smtp-Source: AGHT+IFbp2Yn9F+0A4JLPq9pXZT37covL0OwDwmzmjwtu+0HE8WO69kqQCmj3lT/aUEewv383lR5MQ==
X-Received: by 2002:a05:6402:268a:b0:5de:594d:e9aa with SMTP id 4fb4d7f45d1cf-5e03602e4a5mr19271364a12.8.1739722590005;
        Sun, 16 Feb 2025 08:16:30 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:600:5a3c:6621:dedc:472:571])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bdd04sm720869466b.164.2025.02.16.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 08:16:29 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [styhead][PATCH] scripts/install-buildtools: Update to 5.1.2
Date: Sun, 16 Feb 2025 17:16:26 +0100
Message-ID: <20250216161626.406275-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 16:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211505

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.1.2 release of the 5.1 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 6387287ade..5e5c42ef31 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.1'
-DEFAULT_INSTALLER_VERSION = '5.1'
+DEFAULT_RELEASE = 'yocto-5.1.2'
+DEFAULT_INSTALLER_VERSION = '5.1.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


