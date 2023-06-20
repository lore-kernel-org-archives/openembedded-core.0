Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8D4EB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:15 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.721.1687275605498174900
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5hxJ8WB+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b4fef08cfdso24259285ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687275604; x=1689867604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0gkuVn4bw6kfGM8S+gRCbTe/RMDnuvvQ1jRJTg9IME=;
        b=5hxJ8WB++OEHWRlSAFUvLj+emBvRejjvZMTG6NBkwbkq19NaETzSZWnFD6ExqCEIY5
         wRpeVfdrAshL1fQNjibIqweE7HoqjP6m/FmBFuMXe8OrzR0JCfmafIt17LF1Zg1MYvG/
         ZYreZQV7sYxOBjPoumm9PlF3spDztxt6H74bE9FMAZK1QtNm2kTuy0FWnUGOOMumjKck
         bxsNNXeaMZ/Q0TAlLIv+NRAyvmKgrcUDyDY29wcDHjYeinc2rB95RYEnTQvKaVShfQHQ
         sqARAHCZc0OfNuwln29iwalJpHev6MMf357NpfghhNFrF6qTeIBhsBKDrn4KzrIiucHs
         6d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275604; x=1689867604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0gkuVn4bw6kfGM8S+gRCbTe/RMDnuvvQ1jRJTg9IME=;
        b=ddRj5ZQyFaO0BzqMq/CHqc4xhvt3GgVN4T8ZgpIfkrOFl97H21yMZeg6+Ol+LZTWzY
         9KdhPxazaNkhAvCGqtreDJ6+w0eOGyE9OdaZWAUQrzWDc/p5SJLJvO3CwccGdw283LK7
         3pZUhZs8t6VgPzCjkRiZM8d2gUgQahRwxPyeNMwCXtPfX77NBzyFst/W9NTmpfLvv1mN
         WWCkvMHkmTGorQNQ4S3IwpljkUsHKYc2fwRB7vXnKJrtEZhLdiBdgLKAPUGhgldsl8tO
         BD7WMqDEr0qCzSMMd4MkWPSsJlc/zQv6shmdC2nqrxP1D1eYPePrk6ZwsYpL1bKbcU2F
         FQUQ==
X-Gm-Message-State: AC+VfDzkJJnWxV6zQboyNlJDQpYqmOxjyLFvuDqDYiUQ3fgG5g6qmnqZ
	oZMMd6H/DrX5W4tWtxQ0pUkMCAdLHiTjdm+q8wI=
X-Google-Smtp-Source: ACHHUZ6uCrY26xXkjEFBMHkOorITy79ZLDPE4QrKF2iPHnhiz5tm86Aja82ClqbUZ6/83L6RJCVzzw==
X-Received: by 2002:a17:903:124d:b0:1b0:3a74:7fc4 with SMTP id u13-20020a170903124d00b001b03a747fc4mr9273821plh.24.1687275604541;
        Tue, 20 Jun 2023 08:40:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001ab2592ed33sm1792119pls.171.2023.06.20.08.40.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:40:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] conf: add nice level to the hash config ignred variables
Date: Tue, 20 Jun 2023 05:37:23 -1000
Message-Id: <c89090e148cdf404e25e1262d1366e963277fd2c.1687274724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687274724.git.steve@sakoman.com>
References: <cover.1687274724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183147

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
index 82b115e3a2..8ef4b00d08 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -948,7 +948,7 @@ BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
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


