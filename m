Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3A9C87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:54:09 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.3085.1753386840107540318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 12:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N3o1AGLo;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so2249194a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753386838; x=1753991638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNrfo4WRU7/Q0YJgnIR7dPkwsij8TO4kbA6w0PvR55g=;
        b=N3o1AGLoMJOz00rGWHCJuRJy8ABSZmF0oNObPT8aKlUMShn8VCv0HeGgVDGqKvKkjP
         wQjoD2IMseJne0LA/LDt6JDxU+apXsGIaTWmI5Q+KOff+VwkmQFHF7ixukuu9hnWPu2l
         OdLAMb7RSczb5C06EoBgmKfxf2bmAV50Dj2rSbLsagrCbepWB23rzQZbJDeAyI65A8nC
         5/xYmL0K+HfAh7VS7JOmZyBm4n3DPK7lml+ZDE5qup0ktzhFboMfpM4z5yTFDQ2WqDtQ
         FTTBntbQMupDfVHeTrQgsujkVWlw/N+iCwhLDv5OkXJaKEiLoEzyM5g56kJ/sic2Su6/
         mr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753386838; x=1753991638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNrfo4WRU7/Q0YJgnIR7dPkwsij8TO4kbA6w0PvR55g=;
        b=U2SZnN3ZlCvNMwwcPMbzVl9WrCSL0Lk8hcR3EgX6g3QW94RPVoTUmVU04AMwy57UmH
         BgAnOuSroAmcVnBXRvcO2pvlQvt8cpnmyECyUNnOgZUYcTzVOCjteaOYv4KRQemgbnzA
         qQoMx4EMEfR9dqf7S/J89R53fdCq3SBlFbsVkLt42zgD6AKkEnHXqhABZtSPls6j+VZ3
         zb3uAnicA5pIizjJNlxhqS5EGimY87thkqoDwVWhTpbICLP0pBcQl1/Vyoq1p5ud9Sm/
         JsNBouYtGRpMEqY1pT+QwtsedlFSS3yOMMs7HNOwAttcIKHKgJE906j+wQ3KHxkqr9eb
         PXIA==
X-Gm-Message-State: AOJu0YyGNJxGu4QapGXpsYHX8lON/7TDF2nGG7sENgNS5zYELCxff4vB
	/5WB7yY1DEEFTxKpwXnuelde8DEtM60Kc2itXm/OhEQSIbIs4X5smUKpXxiuAA==
X-Gm-Gg: ASbGncsCEVvmcA+Wz5heE4buHnkCiL66rwPsdeaY8JqUaqgYL72qWqkOcKWhm1D4HkI
	19DUhLd5FvfKyae7AC3BfswxwXEnmw3nZBklTWg+VKP3wF+DashmQMTnlXUfMsvzU+owm4izYnI
	/l1/LSunypziJTEF4rwNReuHq/GS7Nr7CWZc9GzOp16FCLDjhKxJ8Tk4ZC/TDhBT1PyqrougzOw
	Jfh4TTn2PkeLvJzxJ1pmOiTyQo7rnocuDGADX0Fy2ITptBRHRd7+LufE0W8m/p5Kq/+VuiJVn24
	shy8DMNq+bXBKHHSN/BJCIs0V/9BqCSGNzJvK0dQVo/qpxgds5cZGpqbaz2LgCeR/Q3706X7+ox
	I4FldRuUsx0AXORwihIfk
X-Google-Smtp-Source: AGHT+IGe0NTqzr7cZpzqEnxNbseCHxRUBqBt8/928Kp21KDzBeVr7m0Z9yqRk0rvHH60Le3M6hgH2w==
X-Received: by 2002:aa7:c889:0:b0:612:b67d:c2ae with SMTP id 4fb4d7f45d1cf-6149b589426mr6129663a12.16.1753386838045;
        Thu, 24 Jul 2025 12:53:58 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:61c:a000:a5c4:a4a:87da:e28d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd3432b6sm1197428a12.63.2025.07.24.12.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:53:57 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [kirkstone][PATCH] scripts/install-buildtools: Update to 4.0.28
Date: Thu, 24 Jul 2025 21:53:51 +0200
Message-ID: <20250724195354.33606-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 19:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220866

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.28 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index cf75d84630..3c86a087e8 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.27'
-DEFAULT_INSTALLER_VERSION = '4.0.27'
+DEFAULT_RELEASE = 'yocto-4.0.28'
+DEFAULT_INSTALLER_VERSION = '4.0.28'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


