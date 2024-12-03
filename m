Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD26E64A98
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:37:44 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.19387.1733233063444226426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mc6TItf8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-215bb7bb9f9so7020755ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733233063; x=1733837863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKpDTxbunK9qDyIquX4Czy7ibw4CRYpG2VNBWyATX78=;
        b=mc6TItf8XhoNpwaTtmzCtguoojeQSRC/ezN0g5hQz3ABhZ1EQDLITBcXVnlgRBkk+Z
         o7axi2WqOg58VWsdGK1IXPy2G2c28c0sXGuSilMP781cx3udnHEmkM/qbUSjkXiDRhvb
         aHVcInJ0mHnduAyMgZyCiF0r71+6Gnh+L8L8+hTAUh6UkfkR9s2zHuKqgho93HSsi8Tz
         QiomWWQxaXzQiRvpUT9XfSyMMklkFsnaCqUUSHjvkJ+ivdIeckPcN0dSj9zUBp/kxdvj
         qUcSJjKWxuajZIeQmOZ9O+GcOVwo2RDiJ456oNPoM9RAYA8VhUC7z7aUNBXI3w+ynoOJ
         PG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233063; x=1733837863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKpDTxbunK9qDyIquX4Czy7ibw4CRYpG2VNBWyATX78=;
        b=gjXX0USDGCK1SGDm2SpX8jgDeGMs5dAoRQMBdmtEP0PCMNoFvytmtNg1wmVXbqrU8x
         +tvDg8Ss9W2AhEjsXaqUjVASmoF4yLGm+nT8L1OTq6tqqiF+ylrN+qH9bsBE9CwajzVA
         Ol1otXt/ic5dLQOk/zJ6Re0ksUQcIB/7zID0u5a8RJNId+4Bs3EWByfSDW8k5OZCGruW
         VSdlOC30EDZ5XFp6v7mW9Km1rqY4jGcXt5j+H+bsBic7HpMdqR7cjOMNnS2WvM+RnqlX
         WiDdEJbfepZJg6reVqS96+OcXABUVF7sIiI+1wXQsbPOGgOWt8qIiyrwXLMcd6v8rWMb
         wJUg==
X-Gm-Message-State: AOJu0Yx+F1ZgCTiQG3siX44Gn9TB9Wytm+yAUgBsLtqvqys4IdLMEGYY
	1ka+tXtm2pN9zxIdG/uOcuZWHErDNpo5eGMPTMXch/h2S4UX7xY64cin3C2aM3sebtpmR6fGx81
	m
X-Gm-Gg: ASbGncuBTE+5mpuM2ExlLhvOF6itsttbZWVnY34tsY6YEm4c7GITpfkP1ck39ReBJMN
	pLWZtPRvqLQf/3n5TDwIbovIUbdbZkkn30K5td69OMcfWgQxl2UovqHCSjxW2eQ51dK1x87w1Ws
	Am386AcRH4895wOlnPZE40yvEV0uN/bx7uwvokFVxWn61qKXDX3QbtYAMzU4rVO5paD3h+cGgcM
	MqpomILGtqdJ7XStFHKg7LsWqX/qm7UYd/dTNQ=
X-Google-Smtp-Source: AGHT+IEPr/QTcHIN562vtNeZeBu2hUxomMM1+ZgwIh2j1kzgvBYV8pL1+Qo4lbFfmWoVG3Eu1mRSHQ==
X-Received: by 2002:a17:902:f542:b0:215:5d8c:7e47 with SMTP id d9443c01a7336-215d00b97c9mr3057145ad.36.1733233062750;
        Tue, 03 Dec 2024 05:37:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2153540d792sm84560225ad.66.2024.12.03.05.37.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:37:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/16] scripts/install-buildtools: Update to 5.0.5
Date: Tue,  3 Dec 2024 05:37:13 -0800
Message-Id: <97841ea6f6d3d8225b4865e389815090f153ee55.1733232895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733232895.git.steve@sakoman.com>
References: <cover.1733232895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208198

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.0.5 release of the 5.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


