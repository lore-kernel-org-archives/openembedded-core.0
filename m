Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B08EB64DA
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:17 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.338.1688831775608789876
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5Sw+/ejP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-262e839647eso2287261a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831774; x=1691423774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdFBJLxKAfV9Y7ZM7MHavdkTizvX4XDPfGpLHxe+uOc=;
        b=5Sw+/ejPiCRDv+3uMr4VwmguoMBoc8qUNzUImMjwx9ZsRf6NcjVsqYZDZM0UJNGXz8
         gF+A5tIz9XaB4a4vwNY22KH7qPPNWWBeMV84z+803O0JiLm5FUjvof86Iwa7/S8BcMSY
         hy1hNTZel3BydvnpIodqH21YwhvCIQXUb0Jx7atCKgdqmkhMD/3b8yjjXkMaRkLazK+1
         VLjQlpF3If0G0C5U+OXVHLcxy1Afy5BGdetvlpCAlegFIltP1m3BT6kHN7/7i3vKOsIN
         Z5R2U9IVqKbuRouFtx4l1xBDmjmocJMDy7aliD2/unKa6Qh8cf8+7Y3YQcxX6NDXsCCF
         gvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831774; x=1691423774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdFBJLxKAfV9Y7ZM7MHavdkTizvX4XDPfGpLHxe+uOc=;
        b=N+WS4YHZlYd6FO/VNpcW3EBQL/0zUPjzwTpd/n1uPmiLcMQoJJ15cj7z6HcO3Of/ls
         CJ2mHGdSDZzjdQpgJUoF3QOZHFrYdTTbGE4rvnaxFkPA+sDbIB1LLyV4i6MbrdlcUFaq
         ueaLA5JeSKaakUE7xGi4Qfbjnt3jTzES70NQmVg9y/2+3++j1W5oPwj82xOXfyEr7M5J
         1duXlMaGMJoeRbKpvHfrkBU5Jf7G5wo6UaMoMiCORafiW9IoeeMXYtW26KecyrkXIMvr
         kqmsi+i6fEQ9uqvN2xwxYFh26lEORikCVDLjFtORVPyVk6SKv2atgJTNqP3LzbJvlk3O
         PTeQ==
X-Gm-Message-State: ABy/qLao+toEM3Tjn6xvBkISNPOiQryREAwhjxPuKXJGDBirrgFw5bfk
	nFNkrjid5ClurlSJXiByXFmPc9IVvLIoCIC8Zd0=
X-Google-Smtp-Source: APBJJlGHBWneD1yTVo7LQmsaWIoa/s4NpQnVZiOey3QoJLWmNCJa1nBgl/oc2QHzj3kQTtTt5l4ZFQ==
X-Received: by 2002:a17:90b:390d:b0:262:f99b:a530 with SMTP id ob13-20020a17090b390d00b00262f99ba530mr8382725pjb.34.1688831774573;
        Sat, 08 Jul 2023 08:56:14 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/17] conf: add nice level to the hash config ignred variables
Date: Sat,  8 Jul 2023 05:55:42 -1000
Message-Id: <b77850f613bdc103e5d529b6c62ae90e134106ae.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184028

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
index 91f003d6dd..457b7790c2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -897,7 +897,7 @@ BB_HASHCONFIG_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
     GIT_PROXY_COMMAND ALL_PROXY all_proxy NO_PROXY no_proxy FTP_PROXY ftp_proxy \
     HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PASSWD \
-    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT"
+    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT BB_NICE_LEVEL"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
     file-checksums python func task export unexport noexec nostamp dirs cleandirs \
-- 
2.34.1


