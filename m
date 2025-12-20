Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0934E668B5
	for <webhook@archiver.kernel.org>; Sat, 20 Dec 2025 11:27:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36430.1766230063732864479
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Dec 2025 03:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iyVMd8Cz;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430ff148844so1370527f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Dec 2025 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766230062; x=1766834862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scDfqqr9cw9ZvfLDoYQD45c29gSSkQvRZE2Cq5wrRhg=;
        b=iyVMd8CzNTdXiR6pAAZR66wCfWPnwEpZe4SzVcotP7zd8f5zcL2XCa30zQgt+Q4NIm
         4TYXlk89c1dgMJFGBmFGt6oUF75kVuqSFblK6RJVRaax3BV3A4j5jSmjug9bXIjILDac
         ZaXDCvdrlTMm3lENQoTJeb+BjXxgGqBx36Wr6VsBz3FDivOTD/uue37xEHmFYm8N3yFp
         ZIUVzfQrrHUN3xRLxTaavRX8Ab6gSUlHnOUNCxPOFlEPIjzmBCb7AH0cWFcXKxxSXcky
         cf5C647ylW9hbZM62/WK+/lGcTLRIofSnFegIE3L698FxDsjnmP5T07UCZbk8NyFYpvM
         91WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766230062; x=1766834862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scDfqqr9cw9ZvfLDoYQD45c29gSSkQvRZE2Cq5wrRhg=;
        b=PKYZGczgyTzcobL94u6/0vW4wQ8otBtQ56swt1EE6leaX5N9Isqm2vKJ/W8JeXoP7G
         JfyyCDpFnlaZPMOGaxQx4OAs0xTNN/9Kksy0UenbS8zr9eR5OeKo5wr3uP/o5mrS7wU5
         fIxnsO9yuT418AunGYb5sZdlUzS4eUVoFN3XOjfkHPEfPaWuf2MSyS38YgAnBdY/2OYd
         fveHWk3DOKgZFcTx1FRCugXKqSaY0zVgUxDTLmBi+BdMCD9bch9/H0FCTEednaWkEn76
         ehcFQYZO0q6okXoPebM8L5FKQFB6LX+DYDaC5CGjmiRlnMAoQt3cp2sFA6MTka8q4T7L
         vx5g==
X-Gm-Message-State: AOJu0Yx4s45lf9YpixlSTAzXgA4WAy2uZI2ZnDMCeQPD6wB2cJsAVaxj
	Khj83mh2DrJ0IkX149FFqUl3cIf319Fuv0lugM2kZJJQHJdRa8fEw8dFdNjv2A==
X-Gm-Gg: AY/fxX5kx0ntcx2TpRkRf3PjSaf+F0DZk26S9eNXcPOIF6j8f4ytazAwOpTIDJZnRMR
	Nyi0hPxFcvtU07h0NZp9lz8aVVVADLjiTfAiQYaQuC1Yf0Pyk2pKcd2jj+gApetVeJEYxKtxNpC
	acUWK3W77bfA98Xajr6iA5BlYlHlWIWsrRXqCt2PLAlyeFhMVZ0W+tmC9rdjEs6/IVhCm/kyeu3
	AgSRViUBPcF4Hjq9ooxCdtLHQooXDtZcjIPySe+2U//j+ukv2gO1HeXCYSD1ijxGMHrqv/ecN7P
	OYDid6H+lmIVvGiBV6/0faO8O6qn75qujHPo3ySXRGoiBwikYTYWam+nimWIlG9rN0517/si30W
	45wGE2kNLxof07MkgGiFKG8cD1eD754ArMxPRzS/D/ObpV3+ZjqQPqXhsCNBp3mv05mtbG4VFYh
	6N8GAFtbxO
X-Google-Smtp-Source: AGHT+IEHLYdmpOQqdrx7K3pCNlYn8V0zQiXAiozQBLdkws2BP3KSXY2jtzSkkJUsP3JJs86u3hUEKQ==
X-Received: by 2002:a05:6000:2282:b0:430:f2ee:b21f with SMTP id ffacd0b85a97d-4324e42e787mr6505220f8f.22.1766230062048;
        Sat, 20 Dec 2025 03:27:42 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:624:a00:6a5d:8d5f:b7ce:4240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm10182272f8f.35.2025.12.20.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 03:27:41 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [walnascar][PATCH] scripts/install-buildtools: Update to 5.2.4
Date: Sat, 20 Dec 2025 12:27:35 +0100
Message-ID: <20251220112735.9373-3-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220112735.9373-1-an010@live.com>
References: <20251220112735.9373-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Dec 2025 11:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228250

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2.4 release of the 5.2 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 50b5487eb8..0af5fc66e0 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2.2'
-DEFAULT_INSTALLER_VERSION = '5.2.2'
+DEFAULT_RELEASE = 'yocto-5.2.4'
+DEFAULT_INSTALLER_VERSION = '5.2.4'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


