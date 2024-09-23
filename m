Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6DECF9C71
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 09:42:22 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.32875.1727084538241332020
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 02:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C5FEMmFo;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a910860e4dcso122763466b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727084537; x=1727689337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzmgM2imAVfZr190wkfxU+y4p+O3VHftLXS7EV0yJ9M=;
        b=C5FEMmFoRIpWxg+HZ7o2fquyEPhNFGzYZfeutBu4n6KRes24NkT94kjjj+NwHxoxjy
         /Nx+TGyYG15F+MPPYXPrZAWzlnGmj4wM/wI2iXa9sLLa7EANRIHpnoo1eL8JUIZ2NLOd
         WxXEDPm4lBZqg6HA4cwgdwOrrChVXAC0CczuOTiAZPqdRtHoPS+hWCQRfQO3cRPRSsGt
         db9S7etzKMsJRm3fNwqA0wLZWg8iq6y/S6qZFyvVTIHHdO59MYs29c2fx/5ukvpAeDZn
         nDMwo3GCMAobrGzTBOKGjX2S5cWanyBSXFd32cyVfBctJ3Z5saicHGrUYRq5VaNuruuF
         z9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727084537; x=1727689337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzmgM2imAVfZr190wkfxU+y4p+O3VHftLXS7EV0yJ9M=;
        b=JMnbbMfdaNZpiVNZGCE+0Toh/J727mTOl5hSIfQag+nFwj53jtobKAAE1mRkEHPcd9
         W6HtBfwVtVfXR4mfdlTvdEzPpsH+tdxNWqWcZZbLz+rQ/uJYnecs0ZH/Lox1fLHOJRa1
         JGK4JG95yaGAYRW4gtmhokPQs2RMRABinq5TUga9rtizhEYvQC68LnU1Fa352pB9tYKP
         wTzz0bqrWWZjHDCYwK6HTb8olLM9JfOBi/fVqNoBimL6wTT2/mvJ2Xadnb0QodMHNV/Z
         mFjui8Llz0sLFc0x0dH4FCGX7Eu7eURi8vmdn0IDmVZAmMhU/aALS47Vz/jlQAwWsrhe
         wmbA==
X-Gm-Message-State: AOJu0YypgT93DmJumj2vVtAeFXyiTojlVQubbgDrUmZ7xk3RBm1X6jso
	Ryz5ZhvN0vLlVcwis3ZiXCyme1Y6KEmrTpQKA8l89oLP0Dj21P0AB1xA0OdZcQE=
X-Google-Smtp-Source: AGHT+IFbxiIRO3o/8ctjCdtsdAwy8dTFpjaK/zvbIRpkA9lQpnKuM1a9SOVWIo/3SGr5EgjZy5JINA==
X-Received: by 2002:a17:907:f74b:b0:a8d:3b04:29db with SMTP id a640c23a62f3a-a90d508b709mr1067572566b.39.1727084536519;
        Mon, 23 Sep 2024 02:42:16 -0700 (PDT)
Received: from an.. ([2a02:810d:600:2744:e855:ba31:e4ab:c4bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3877sm1183903066b.112.2024.09.23.02.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:42:16 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 3/4] install-buildtools: update base-url, release and installer version
Date: Mon, 23 Sep 2024 11:41:58 +0200
Message-Id: <20240923094159.51274-3-an010@live.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923094159.51274-1-an010@live.com>
References: <20240923094159.51274-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 09:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204803

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update the following default values:
- DEFAULT_BASE_URL (https instead of http)
- DEFAULT_RELEASE (5.0.1)
- DEFAULT_INSTALLER_VERSION (5.0.1)

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b2ebb965a5aa128b05ed7ddc9216171463777732)
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 4f85fe87d4..5b86c13077 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -56,9 +56,9 @@ PROGNAME = 'install-buildtools'
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
-DEFAULT_BASE_URL = 'http://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.1'
-DEFAULT_INSTALLER_VERSION = '4.1'
+DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
+DEFAULT_RELEASE = 'yocto-5.0.1'
+DEFAULT_INSTALLER_VERSION = '5.0.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


