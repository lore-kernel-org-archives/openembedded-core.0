Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F62EC71150
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 20:59:48 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7312.1749848384415035668
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 13:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6LLidhi;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6086502e750so4844690a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749848383; x=1750453183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+PGvdMg/bT5ZPZ5yaPy5f7Sp0Ckm2LjGGuLQmEJ+W0=;
        b=U6LLidhiCDt+HStEimzpvuqbI/tfDJIvUc3IwM2sfWTdQxY3jratlhHAamkv/1iWnY
         GAkZwMgilsyVE7rlirtX0hj5wVo2ke/XM8NxPo3ZALFOuOiq6n8Ya4b5Wv/gkq7nkuTm
         HtQteUNyjd+GNnvzSOT/aMziFk/mLaWR4xZ1jw4bM0TErq1d7lUMo6RVqqyk40l8j+MA
         Kzn+sZiVs3BhW/H92SMxKZfaLuzO+9oAF4IV3PHkwo71cGYjFYUTOjF/YFZo/Df5zv8o
         Oup7kBeN6cVa2LjCmdxgWi/2Jt/dE9oGwa4sKWjzDerNe1/cnvbI2ZrITaFRiILRiMHr
         tYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848383; x=1750453183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+PGvdMg/bT5ZPZ5yaPy5f7Sp0Ckm2LjGGuLQmEJ+W0=;
        b=aAgQ2rAWGtrg+neQ7Yut0+H6ljVdJSy4f7gNOhCOG9Y/lO8UO39I51u3whtTJDsfqD
         6mDQz+d4wNijGJ+6I0ZTPA882N2apGR6GOh5dRUGlG/gXM7MCIOQXkeXBbftNS2Qwey+
         xuvrNSHeKVmbwMsS7HYuK7meeEa8HK9tr6nU43kJvDe5WxojtmtHzMdSRjKJiW7W17wX
         kvvxuy6WkQ81NAkv9daFHDlPcOhyrJsO3nE74EVVubRvvq2RE5FPjxfFV5h8rMrM8u7+
         eJ3sX/l9EBFcuyCh1c4ePh2gppwcBoDMQs175nUCY128/ABzKs9oOKWkaAkOu5OV7AJ+
         ZmBw==
X-Gm-Message-State: AOJu0Yw3oEofr7tqN+ZJhWePXWYNTD2h49IIGs6nKjEOiimNvQM/vRH+
	MUIVP9K2+ms9GNB6jmoscQPiLYk4NLa6MhpsbDNN5VzUsT7VT96guj1L+JzajQ==
X-Gm-Gg: ASbGncvCLMw/v135CjcCTFLTXfV8ulwM3D0Y06UzCIu6TLHE0OrVJ7kfquusw5gnfj8
	75apram+Fjsy//B9KcXucCvqGdddRoRInmxBlniGvo8EODK8F1UFFlReZS2X45tvdbWgJz+d6g7
	YKBq4VFZxCIx4Odjko5Ht/M2VxAj5KTLI+xJemp5INHM9r79LGzWZYT4Xtyzr/gTOSUZBUTlsyA
	YUYxSTSvtyBy3dH2XxagWWcRB+EnIrrRoLEvjs5xzRmoqXLWowTg1qQ5Krif08JdEfScbwC02yw
	8gdEQpXXQchESck+DK779Xv7+kq0O64gWuzZWYpg5BeGci4TLNoI/PwygQvhJQ==
X-Google-Smtp-Source: AGHT+IHnYw0OKch8EosRxuCGQOR9mL89MLVxZv8UTe2wjI6CKfct4eCX5D/E3mCExVjVHJD0iS0IHQ==
X-Received: by 2002:a17:907:3f0b:b0:ad5:4806:4f07 with SMTP id a640c23a62f3a-adfad31f878mr58429366b.2.1749848382723;
        Fri, 13 Jun 2025 13:59:42 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:61c:a000:5c5e:8cd0:a3f7:8c84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159377sm185097566b.9.2025.06.13.13.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 13:59:42 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [walnascar][PATCH] scripts/install-buildtools: Update to 5.2.1
Date: Fri, 13 Jun 2025 22:59:34 +0200
Message-ID: <20250613205934.332435-4-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613205934.332435-1-an010@live.com>
References: <20250613205934.332435-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 20:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218629

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2.1 release of the 5.2.1 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 6750ffcbcc..aa23942858 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2'
-DEFAULT_INSTALLER_VERSION = '5.2'
+DEFAULT_RELEASE = 'yocto-5.2.1'
+DEFAULT_INSTALLER_VERSION = '5.2.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


