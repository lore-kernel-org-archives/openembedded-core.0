Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA077E668B7
	for <webhook@archiver.kernel.org>; Sat, 20 Dec 2025 11:27:46 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36810.1766230062864888139
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Dec 2025 03:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iapskhu1;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so2159599f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Dec 2025 03:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766230061; x=1766834861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlWkcGxVfpAdBiqmXvKql53V06R2ZnSCDHbeVQ+caEQ=;
        b=Iapskhu1xTHlwrnIVX8ZtZAjc0ROsQcp18QzlvexKqcRl3SlZMYlNg4cdw2R6ICt14
         kl3Xy3PrEiiVCqJlyrrmKQ62v7fiIEOshPoQ+UNLMELHBuobby5UzW7b7yWnjFb7zw+E
         yGIauc9o6VWUkzHe50pDDt3hPoJWaiGm4UI1IUH60LOPqLIwkz9n471TxsB9X4Y778yi
         1OHYCZrUjCnV8jK4hkGeyZ4gIZp8fSOeWKaJGT3MFEchZxaJHUZVH/NPWpDy2vhA5nYJ
         clB/N/QPTJeU7uxNmaySiXmYcUdVC3StUtBrV5BnkY4lZeOkjNn2LDqrghMk8Yny0Eq2
         vS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766230061; x=1766834861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mlWkcGxVfpAdBiqmXvKql53V06R2ZnSCDHbeVQ+caEQ=;
        b=pzrVPdcguegMjwh60rPeAnCWpTuRlycK/p0w4mwq5uGQgSXMWTG4fN5KVTgAtWmJ1s
         y25QGbaGi0PCmky6DgwCnACIvIc0a1NKou3/3e1cq7xvlBKxzQxGu3+IeaoRk/xGVB6V
         8i72eXH+doreVHnYe0FIU225RQbjQYgk0c6DkIcG9rSsMvAvLHiJPJWmNM9kARsc8hmM
         AomT6GPH6Ij+LJDP0xh56HnSjXMzZQgpW8TxiSla0mNFfmwVf60A31nh5CBlIxejj3gv
         odGUlYQGkFPfnMhmSh8mt9mN45lFcBmgl+ix/19UsvATxxqxgNrx/vggdFUYLnwjUwPF
         2shA==
X-Gm-Message-State: AOJu0Yzabxr3Kcfzp2TeZIsY6gA9BKs7+tlRUFXdNybwhif0G157Y4PF
	RsTxVGBDW+asRi1mHMwFz+MMIIqBIOFqEq/xsiIpcNp5ZU2gha+M0AJf8CflfQ==
X-Gm-Gg: AY/fxX5IXYfvMAWEfJkjdJOqrVSy96CDrnoLVmY6R3q/mE9LYKRN1t61ReFwcVcn3s6
	rASixCT77t3rEvZCN4/7AUT7Q3H2f5PvM3/ur400QL8XdaMRhcJ62P616Z4d0JSD52kuWgbnCKA
	fU320Oh1pN5bUdiYy7GI6jzZ2VfUsVBmbJiEsrQK5Y+k8g9U20eZnp8JhYZ+BPnTI425rKgqUVO
	ZMkw7KJ803mGeTIYPAFUNLR6OQ0jhFPODLb2weB0X11UPTZEOJRFwp1qLYg1xWeQhRN67T8/Zd5
	FrZK7fZTpwJSF0SufM9ssILeyIl+Yz6xCNIa5IqekaJw+a3y2VUAoDPZBW1bol4CrRenDdzOVu2
	axxIFEZb20MXHkVZG3xDQeZkDOPBzrPwFPff+A0IwKEFGHLt0+A7AkFMACCukkzX1MZ+klY3Z+J
	QraWAluTjS
X-Google-Smtp-Source: AGHT+IHuqGOYSp5t6pB3IYIa4ET8gsdyOW+z94eVHs2S3qGGCX7BEqdjI3nfhoxyAJursdTOwaQXdA==
X-Received: by 2002:a5d:588c:0:b0:42b:2a09:2e55 with SMTP id ffacd0b85a97d-4324e45d3famr5192354f8f.0.1766230060902;
        Sat, 20 Dec 2025 03:27:40 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:624:a00:6a5d:8d5f:b7ce:4240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm10182272f8f.35.2025.12.20.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 03:27:40 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH] scripts/install-buildtools: Update to 5.0.14
Date: Sat, 20 Dec 2025 12:27:34 +0100
Message-ID: <20251220112735.9373-2-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220112735.9373-1-an010@live.com>
References: <20251220112735.9373-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Dec 2025 11:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228249

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.14 release of the 5.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index a449e45cff..f1c3084245 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.12'
-DEFAULT_INSTALLER_VERSION = '5.0.12'
+DEFAULT_RELEASE = 'yocto-5.0.14'
+DEFAULT_INSTALLER_VERSION = '5.0.14'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


