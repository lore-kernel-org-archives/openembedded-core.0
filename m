Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D80CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:54:03 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.51186.1697234038040653800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Zkw10ZtD;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.46, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-57ba5f05395so1435140eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234037; x=1697838837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7F9vrH+fOKDNSgJk733WlCe5dkcIii11ZubGTWMLGY=;
        b=Zkw10ZtDkihi/CgVuh2CwNuM2RTf3TuihX50lR6LgYAkcLvG0SmWUxp6a7Hb88QIWO
         vnB43rkiutXZlif+NeJph/A3SWvDTT32ZynaH/NdtZ18I3veWtSxcG4q67XcweS+U/e8
         wwPAFk5EOvey6mnA9FWWVwKGdmX+Z5wwUCnSzEo2MDR2nhBceVZo8nwU5VpqWMsH3zvo
         WSotqan9A93hCbsDFPwYbTv9vbcDqhkOlO2wTqXuVbICwLfTFYJZfDJicK/qkei9D/Vv
         F/QDAxIk8m4OJ56PITuwffsMYYX1L9bq0/Bldq4FTlYfELoDGeAoONo5HSWyFsIDHRZX
         9xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234037; x=1697838837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7F9vrH+fOKDNSgJk733WlCe5dkcIii11ZubGTWMLGY=;
        b=p7+deUXpwWAIqUv+dzfb16jTqdmpzK2fuZJV302sEhdLb1N2etXJWkFTiatCDJjq84
         BddI25mpbGtgb5WgQQ2iiWrfJPHS2GrapRCevNQM6Mr7L7kxdVJTgNizSnlvlcbhu/J2
         W4GwuOjrYdFmEI1MrKBjcgJ12nJvUsOdHWSaCgzVc6UFC2/3KRu8qFdk/Ja7GQq42xmr
         k246EaQXpVuVkVyaD/tNs4OOnN48vUfJ1++7SKcbKsgWWf++VYRbm0froWdsdQ2I1Z01
         HOSK3C3z1ak8ZFak+2W67pFs0b4Cb/oZ81RjhaPMSzVRp82wSriBZ90VdWIsy+OeQR29
         vh+g==
X-Gm-Message-State: AOJu0YzlzKF1MvNlPw+Q/wlYChxDxvQ/A9JomXs7y11jow4mxWMu6aWo
	zyYv1ag5zHPTaUSFAva6bWN+j9NMdoMBvRMaFY4=
X-Google-Smtp-Source: AGHT+IG93QnEshIXcIGco9/5KdsKg0dBOZ9b2ZJmrjYHRRXQ7DRoesaOHXa8zoWGFLb0lGPjgYy1Xg==
X-Received: by 2002:a05:6358:2806:b0:14c:79ec:1b86 with SMTP id k6-20020a056358280600b0014c79ec1b86mr35430120rwb.24.1697234036988;
        Fri, 13 Oct 2023 14:53:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/27] strace: parallelize ptest
Date: Fri, 13 Oct 2023 11:52:46 -1000
Message-Id: <30b6692ef4a12958419c94b96e3fc5a50e8a7ad6.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189099

From: Alexander Kanavin <alex.kanavin@gmail.com>

strace is one of the slowest tests otherwise (can take 40 minutes or more),
and this brings it to under 10 minutes \0/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c632b418a785494318d9f375a07d879772e8ced)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/strace/strace/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-devtools/strace/strace/run-ptest
index 86daed9220..1224229e8f 100755
--- a/meta/recipes-devtools/strace/strace/run-ptest
+++ b/meta/recipes-devtools/strace/strace/run-ptest
@@ -3,7 +3,7 @@
 set -u
 
 export TIMEOUT_DURATION=240
-make -B -C tests -k test-suite.log
+make -j4 -B -C tests -k test-suite.log
 res=$?
 if [ $res -ne 0 ]; then
     cat tests/test-suite.log
-- 
2.34.1


