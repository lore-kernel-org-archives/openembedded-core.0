Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073C9C8300C
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:36 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.156.1686329672678059144
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LBQXzjwK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6532671ccc7so2105172b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329672; x=1688921672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSnt2RYDJ+z7DomQBRoyTCbLTjPJ1GzgTc6AhYgkvsk=;
        b=LBQXzjwKtw660ELRpcs81DU46KcJVTbt2WWIji9o3/rafRK/76wCTRzDrzff43JA4C
         JmXMQLCjDG+SAa4JOYviOEaMxmmnKbfZlP48uqHwqdxStVSh/25+wdgDrFstn0J4XaeP
         3L7+bY7zoVnwxuQpHP7ok2GbiAPvH36UbyfP3Z9EUqtPQLqrmko+TYjXAGINATD28YM5
         T46Pd4fTeTlIRZBesIlewJqwt03nb6mkdUYxMXZBrOLGyR7bKQ8gHUa3qMBS4zbtfUVz
         csSGM6o0u50sXzQDjn7og8iJcZfdmymSzziagMJuxEQpAieL457kd5x5Gpw267z4jB0F
         3R9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329672; x=1688921672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSnt2RYDJ+z7DomQBRoyTCbLTjPJ1GzgTc6AhYgkvsk=;
        b=PIZg1QVkEDzFCzAd46sWp0ujjjSfNfTTZqg7C3JFS3rBNKYeE6pn0STF+7zSBkwmUR
         KHSOIb0DlWfqizZKoGXJrCT3OnSx7KG3v8by3YYfUUhmH9eJQCU7gZ9zfVA6/fbGYocA
         7AXoZx4GU1zNNb+pFypS9n/EIhlK4QYzMtO95ORyJX+IE2KGmgtJiQ3vY7iezJ77wT4D
         mQqn/IiiuxbEtQdMK/Eqc7tZOpHvujCXMYfNc7enWM/58krL35WJ8fDDUBTPyreIsbgP
         AhGaKwmf0bRd9f2Ky3ba+VfgRun60c6IDRRjAkNNHs8TBt6qMUYVjGSV+rKR8RBNxy9Z
         L9JQ==
X-Gm-Message-State: AC+VfDy96cefsap1+Ou/1mDJOpr0X/uVgX5qyiGQr0YbKW/lOkMUv/OT
	Yt0TCHO1gXC8bvJylPPFB8FbfkgciNzzHVDXN08=
X-Google-Smtp-Source: ACHHUZ44PRBgPGukP+4Krzwahu8ATJMp5j1ope766Kdg5VZcNV54xflzG2VAqADKRISLBuvpmDHGGA==
X-Received: by 2002:a05:6a20:3d26:b0:114:7239:6a5e with SMTP id y38-20020a056a203d2600b0011472396a5emr1987184pzi.10.1686329671790;
        Fri, 09 Jun 2023 09:54:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/30] conf: add nice level to the hash config ignred variables
Date: Fri,  9 Jun 2023 06:53:44 -1000
Message-Id: <c7eeb912b6c39df654d82e26608514221022aa2a.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182583

From: Lorenzo Arena <arena.lor@gmail.com>

This is needed as each user could be setting different nice levels
while building, however this should not make the shared cache unusable.

Signed-off-by: Lorenzo Arena <arena.lor@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 42784f9360345da1c01d988070253e7ffd5ac4ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index afd9e2f552..52ef64b50a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -959,7 +959,7 @@ BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
     GIT_PROXY_COMMAND ALL_PROXY all_proxy NO_PROXY no_proxy FTP_PROXY ftp_proxy \
     HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PASSWD \
-    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT"
+    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT BB_NICE_LEVEL"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     lockfiles vardepsexclude vardeps vardepvalue vardepvalueexclude \
     file-checksums python task nostamp \
-- 
2.34.1


