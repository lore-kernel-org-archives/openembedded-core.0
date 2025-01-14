Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD77C02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 11:12:34 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.42265.1736853149313137859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 03:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aTJzspP/;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso9302580a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 03:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736853148; x=1737457948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7U6BSAo6lhl0guY5tKWtq6ngd2Mi7fP9ys8CprfWGn4=;
        b=aTJzspP/EycyhtFk+jaVUI8KT+rP1F7R/hlCP0MLfzptAgamGse9TbdLWIvWmXRRmv
         LMIhpIrXgOCEvBMoI6L7dONRSxqU0a3yBwuSBMaUEyoH+6RVT4ZPounJh/x4R6sE65UC
         +CVQb3WLoCkKxs/QYr6+w/udFkqtaA9bJbb1xd34TZaNcgY0EV7dFnDnoVf+Q1GywkT1
         e6zv1mjz2YLjc2YBIGLQdzff85gX86I4H5W32LLGi6w0adfI1ERIAdK4FVWMv80zDi0d
         1pcyJnfjVzx7Fj/LpJhRGdtFhHGEmZxCTqn2byEt+X955T1fXlAEquJmZN6mAjTBcVKy
         mR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853148; x=1737457948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7U6BSAo6lhl0guY5tKWtq6ngd2Mi7fP9ys8CprfWGn4=;
        b=p1ie97rTB2WFqrWRQwrmwfEW+Nzy9TAI6ysPBpLXTp1osDB00aRK+Q08eJyjTg3w3O
         iouVC9/6RgtR4HfYuQ3/fQsdxQdGFrwq8nhfLZtWkjoVnr6fsgy1dogPYrOoT9DNP0YX
         4xX4A8RKtv4PUjPg4DxvaLY9/9+6IqZknHeM6kXRnVOlGZ0ro62Sfq24mKKxQUqycZit
         zdQxv8JXv3zr+c5wB6PSkjnte2F3cw73Ri4q9GkVcW9U05mNXg91fg7T6bgiGAYoTJ5q
         Uieu7mJdMZwuuZufeaSWlIRlzoWyadTjpLq7cP654PH4VX6xhvFEI1DHqPmfhOsFH+UU
         E9pQ==
X-Gm-Message-State: AOJu0YwN1Vj+0JadcgiH2TfzBtJdJSCoFYYkvuO32qNVEQT4/6OZvPwP
	X3YPl0F/hQs5QS9yTZHpWw1wPul/WshrkknZeEJWW1I47o3FPtAWKU9f/g==
X-Gm-Gg: ASbGncu2aX8gnjz3NMAkiQ1b+jPFH/z+bse8/0kpcz0d8DRD7UL6lVIkniDwltSdySA
	iAWgyJLW3pnhVNhJtitWvDDjTQSWbpqg3ZO1/FE7rU85GcoPmg0lBJlVtn1GkYXsvYH8ySJBFJ5
	O2iqtbobDLpRkjyMOchpXl7Hr0Fvl86Cit93SBEwjd2suR9kBc/WE1EgpMwjg+uBBX8ILuLMsSm
	5CLvxb4VmliHP+drLYPgsE8wsGTrNYM2T1xQzc9S23s9qhWiw79wdjS
X-Google-Smtp-Source: AGHT+IFdd70MMQDf5d6xTDMeRSXDAFe2mVGKFUIqbSFs9oy8BiIP6IMua8Ls7nqx6U9GmBAIQmDCQg==
X-Received: by 2002:a50:9f88:0:b0:5d9:ef14:e506 with SMTP id 4fb4d7f45d1cf-5d9ef14e8b5mr3065474a12.6.1736853147339;
        Tue, 14 Jan 2025 03:12:27 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:600:25f4:7e14:2af5:7625:b631])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4400sm6091068a12.52.2025.01.14.03.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:12:26 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH] scripts/install-buildtools: Update to 4.0.23
Date: Tue, 14 Jan 2025 12:12:23 +0100
Message-ID: <20250114111224.22466-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 11:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209788

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.23 release of the 4.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 616330dfdc..01253e5f95 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.22'
-DEFAULT_INSTALLER_VERSION = '4.0.22'
+DEFAULT_RELEASE = 'yocto-4.0.23'
+DEFAULT_INSTALLER_VERSION = '4.0.23'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


