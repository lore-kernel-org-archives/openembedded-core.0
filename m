Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E303C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:15 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.8309.1662560471939568119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=t1Q2gS0E;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso10023875pjd.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=zlREAsnoiOPB0R49ESP+hr+PIeGNyDMLft+qAHJvRo8=;
        b=t1Q2gS0EBJzFAYreE9i9Nz0WiCF/bRlvIPcRNURqXtdMOCtbu5I7zGu7OED3zi6iJ0
         MSoV219GFsWTYrgjDP0KzSJUT1pNYEZzgLc5F74KlaJkmpN9iCfD2AakeLHkpKeiBDME
         RujVoo+CIHDgUFmZzi6v7UuVzZUEt9I5unNSaYo9+DtDEUt6KU8lUCJWzJHpM1hmjPjV
         JT6BHxi3ZGVtZ8MpIuPK68BKF5RFN3sqZHMz/qnbpZZfxg5/EsYJDKoR3mjTH+HSpCbC
         c9XvqIEL7cD6C0pWXpN3rwOzLh8rTJiGuuaIjrncfett+sp0jzz8yXo3d5jY3ONOmTL8
         xjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zlREAsnoiOPB0R49ESP+hr+PIeGNyDMLft+qAHJvRo8=;
        b=AROC1GobxRny9TGxhaNNQGFpiMuce6LM3JWZ/QnlOR1j4g0ncT/vzw96JL8qRSFNZF
         5fLmt5wgkZ6cwxuI62XcCB/i2byghar6ks3J9OqQj/H3pU4HyJc48kzswbSY78rK2OZi
         7QNFkRO5vEW4LqRdk1pLgDApS7fsxfQh9JPA482znIVhoSLuhJGZo2MIo75SseVLhbFu
         ELQLWnZ4uXeOVDDxx2oztgtE1teTxdYryPwi7hFvchcJrjMvYPDvjt0btcPVizyIZKVb
         ZD8O18Q4w3K3auN5qMYUI4//HLe8n6yKk47UpVAhLi0e+08Z2BRJ73FKs6j8rVW9TQAw
         bK8Q==
X-Gm-Message-State: ACgBeo1Zauyj5lOkRbgpk4r5XgPO/9ChHTYoWclGiVnpi9jnOkXAVqlj
	Dcix4Os4T+5C860eBrIOUWb7A/J5c3Iyzedr
X-Google-Smtp-Source: 
 AA6agR6LpCXYQTtS1vYriY/Yg9nQ9w2FIL/B7Z665OHssEBXp3JZV6dei4avlU9JGg3poDypfOJ2TA==
X-Received: by 2002:a17:90b:3a8d:b0:1fb:1487:1cca with SMTP id
 om13-20020a17090b3a8d00b001fb14871ccamr4294447pjb.196.1662560470942;
        Wed, 07 Sep 2022 07:21:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/24] bitbake.conf: set BB_DEFAULT_UMASK using
 ??=
Date: Wed,  7 Sep 2022 04:20:16 -1000
Message-Id: 
 <4d603ccf0713ade69d98e452b991a4d1d71c144a.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170410

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Currently, there's no way for the user's site.conf, local.conf or
similar to set BB_DEFAULT_UMASK, because those files are included by
bitbake.conf prior to the unconditional assignment of
BB_DEFAULT_UMASK. To make that possible, use a weak default assignment
instead. This is also consistent with most other variable assignments
in the lower half of bitbake.conf.

I believe the risk of a regression is very small; it would require
something like somebody having a definition of BB_DEFAULT_UMASK in a
local configuration file, and having been relying on that _not_ taking
effect.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit e3dbded499f0bd1e71abb0650ae98fd9ade94250)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2a3cf6f8aa..516a30c963 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -924,7 +924,7 @@ SHELL[unexport] = "1"
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH').replace("_", "-")}"
 
 # Set a default umask to use for tasks for determinism
-BB_DEFAULT_UMASK = "022"
+BB_DEFAULT_UMASK ??= "022"
 
 # Complete output from bitbake
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
-- 
2.25.1


