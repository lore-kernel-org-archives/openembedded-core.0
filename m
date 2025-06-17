Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DC7C7115E
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:04:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.23246.1750176281340372134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zNfr04HF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-237311f5a54so255475ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176280; x=1750781080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30Oblr50cbQb1maWD7QDnL5aLK9NJpX5OhpyUBoy2lc=;
        b=zNfr04HF00dJoyhdxLVirecgyzOjOKVv83A5vRBpy4sJU3w5pIaRnufFo738wqyu99
         at4GdaEZs4KJUOlFn750En0K/2GDNNYynE5o8fplHuHzefv8+nRtzhng/5fBo5QPjoj2
         9949oHhuZkxKWckgqoV+qedSQhZYBkIyDhZYuUVrb23eaKmbqxpNfYaCkqbKxoF/i1J2
         UY6eul5duKunpudUbKD/1NxbcfhcE232t0DqfLeTIKyk+cux6qCgctdFT01zz4tS7wNM
         bzF73rdVnRv+TGcTUUym8kx7wvwcUQP3yR1oxI0I8UypiuMzJrBPbpwWGzWxb9WbOdeA
         jmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176280; x=1750781080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30Oblr50cbQb1maWD7QDnL5aLK9NJpX5OhpyUBoy2lc=;
        b=kAPnFjFkWyIRiQZmCtCSItEYc972c498n70d+gllBxNznUmVob/At5nTrCL/PlWDcq
         Y9yE6GisRFmgGI3bHFI6NbfeHqs/X+AGMT/3p29wmpTT8sraeRFuEXVC8xrjgA/se97C
         0ZxdOTaNdPQ6A40giyLFwzeagqxzqYHB516+g5sSUBpR2WP7CTJUxsd14M9OTc5LVI+H
         cE4jqKOVjGqAun8wj1qogytiSmF9MQrBf2nJ3YVo6eTVAoEl3gldA9DEBqdgz6eIccz4
         fZIvU/4Op+HJBjci9oQwXjz6wbTaZBNetT+hAhifFMSuf/s5755v5sz2n72f3J6g75hn
         wkhg==
X-Gm-Message-State: AOJu0YyYWNgIHFppz+Onex3UnEsLABgyyd+MZAYc0rQK0H2orqRW9Zgh
	RtdNkMKjQ/E/ECM3Zuhw5imU/FbU5PWH+Gjn9S5efl7jl8h26LRYLm9uiCdN3olso3SYJ1b095l
	jp12p
X-Gm-Gg: ASbGncu4MCaVQvHSTL4qkvBXXITgSM/F1SjRDcTFz9lMxdlAiYAD8ohUcHB//sAfFmy
	ggsj9LCqvrhIImy/d4g/cWV5dG9KuH66PdU2+eXraRargujY2uRsYF6VTPry8qq4ADWhUhEwHHh
	XkWB8lt7AaJtKZs0Rm9dNH/qnPHem0pDyKldUCKavAht/n5W89Xui0wnFZ7I0ttwxivx0n1pyGJ
	0dQHbpjA53eQ+ymTMcILu0g3sqU2d2S2SgZu7jn5cXEBh1NVAAegCz2v72or6/T4cp+wapoQp8M
	QT74azMa2EVU9a1VihTBIU+Zd8yfP/5T7ow+w6hMIrRWhj/Z/HlKLA==
X-Google-Smtp-Source: AGHT+IGhkoLVvsCAnydyRzOVV+vZOqICGXVipf1W5DusWMecbv+8JiIpYvaZDLujKWic8YXkw1TwfQ==
X-Received: by 2002:a17:903:228a:b0:235:1962:1bf4 with SMTP id d9443c01a7336-2366b32ce3amr213662415ad.14.1750176280491;
        Tue, 17 Jun 2025 09:04:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf71sm82043365ad.217.2025.06.17.09.04.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:04:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/8] scripts/install-buildtools: Update to 5.0.10
Date: Tue, 17 Jun 2025 09:04:22 -0700
Message-ID: <6c3344ba51a42252e347db2f6013c49d35413ea0.1750176125.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750176125.git.steve@sakoman.com>
References: <cover.1750176125.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218905

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.10 release of the 5.0.10 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 59b45d8f1c..b699b34270 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.9'
-DEFAULT_INSTALLER_VERSION = '5.0.9'
+DEFAULT_RELEASE = 'yocto-5.0.10'
+DEFAULT_INSTALLER_VERSION = '5.0.10'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


