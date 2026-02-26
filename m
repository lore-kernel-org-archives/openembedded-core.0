Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34AFFC5935
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 11:36:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67989.1772105769466952059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 03:36:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QxgJYVUV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48069a48629so8117205e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 03:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772105767; x=1772710567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LqK62lJgO6Uqtoc/fcEiFcBAm02flyXmHrhCnjR8p8Q=;
        b=QxgJYVUV6BPudeUvWyglB5/e5jb/DvvCknGtLj+6H7nYQ8+NX56iRMolhLflvQg0CI
         SQ0ep642PT/TcMGe4GZf+j52myakkC5ahPsudJY4wgxa2wqKDBSnInbZaO4UjOpBPymI
         yAqw+PGIXlnL2T9sSqPofDTx91GIEiIbSCW7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772105767; x=1772710567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqK62lJgO6Uqtoc/fcEiFcBAm02flyXmHrhCnjR8p8Q=;
        b=amq8KCjk8MKr98q8lJlBiR9H4CsG+4Fw7uzbrUuWcFjmVIbaKmPJ8RYiGRyXZxOfmb
         t7/GhA9InZTAzqFrJ7dmVR0yso8XIZBjPNnGlVsMb5f2QG6HYczf7RBVAIBGOxeX8Pws
         3vgBC8Dlmc0cJdF/ONILje+/yindozgaqqEMk5GXcGgpQRCn+Ezx/7exEvdp/rcI0wKi
         EEFHN/8g3hY26R4muevb+Ud4FybROY6ZCkC41GZzP5zQT79WW/lt+7uRyxCBqMgtjPat
         HPfkBkr683JzOKjHCWPEYOxGy4yFzYWTf0couOPS3NMX7Lhcsk+smJWyBmJ8fxv6ycD6
         ioQg==
X-Gm-Message-State: AOJu0YxvVHg01SlYn3bEX8BGRynpu+pJWp1IKIFiUbw4gjsoABrG6MIg
	fNjM/oK5tS83Sc/0PLQ8g/XsqmC+uytl1J12bmWE7Wyv00y3pBR66ei8fjVr8l6ABi+wc5PCkNX
	PCwOxG+o=
X-Gm-Gg: ATEYQzwpg0re7rumiC0MvxVmTHfhYy/ZarrE5Kz08UMv3Byj5pSzGx3VY/4vof0PF5W
	R/44MrdiLPws3KcxbTJytJjQbvOI6MSKG/sHfkojnwRHvCsPHiHzQTcPq7WZuoPxniPiEmk6YEq
	IwDUhIt6blJDd10L48dSQzA691J9K5I9zgjZ33T6IMdHaTujGqlCIOL6ptpOPM0OFI4q9DDyAY8
	7dAvAc3LHiOJGg+D66Jvspj8X4uyRRl6GYvBw/F2RZjkfHDMJw8zuDi012+xKFoENYuzimtDJQg
	FklwtxBS7/euW0y7ONYaaJZXxYWRNDP/wGdXA0heduYKkVn1WkQbkCZxhJHg59eF2VJeWezbJzM
	qHnUYosu5UEO0bGmsqboGOY33aFYN7jXE9IUyJG/oNj7JrpbKs0u7pip6+hZu8D9HdWWJHmAeef
	WSe1pOEA/Kskub2/FWQLCfvXoPsQLtRj/2h4oJWpS9wxLoSV3mumw=
X-Received: by 2002:a05:600c:a418:b0:483:b3d7:2e80 with SMTP id 5b1f17b1804b1-483b3d72f30mr189762975e9.33.1772105767041;
        Thu, 26 Feb 2026 03:36:07 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:caa1:9aad:9b9e:38c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84139sm44941275e9.14.2026.02.26.03.36.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 03:36:06 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Switch BB_SIGNATURE_HANDLER to OEEquivHash by default
Date: Thu, 26 Feb 2026 11:36:05 +0000
Message-ID: <20260226113605.704256-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 11:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232001

Hash Equivalence is an extremely powerful feature for reducing build time.
In simple terms, if something is rebuilt and the output is the same as a
previous build, all sstate build artefacts beyond that point can be reused
instead of being rebuilt.

This can be done with a local hash equivalence database/server which is the
default and even local builds with a local sstate can benefit hugely from it.

There is an assumption that builds are reproducible in order for this to work
optimally.

The downside is that when enabled to pull from a shared sstate cache, you need
to use a common hash equivalence server to match it for things to work well.

OE-Core wasn't enabling hash equivalence by default but this changes it to do
so. This has been extensively tested as the deafault in Poky for a long time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d247eb3adfc..9308ee431f2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -951,7 +951,7 @@ BB_DEFAULT_EVENTLOG ?= "${LOG_DIR}/eventlog/${DATETIME}.json"
 BB_DEFER_BBCLASSES = "native nativesdk cross crosssdk"
 
 # Setup our default hash policy
-BB_SIGNATURE_HANDLER ?= "OEBasicHash"
+BB_SIGNATURE_HANDLER ?= "OEEquivHash"
 BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \
     THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \

