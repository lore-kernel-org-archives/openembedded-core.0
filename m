Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C99C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 16:33:21 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.106721.1674837191307815353
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 08:33:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hRydkHYC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id t18so5491531wro.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 08:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=71N0RHqSbRZ8gVCMmLpdsKEjhsUlLS6HtBEUYpNIuhE=;
        b=hRydkHYCn3eV+QxlplimtHsru7bG2xZ9qCzd7Uyvlng8zxRCFvTxJufQtgeSie6M5q
         f3rHIn3HT5HVVkI2rZT0Zo9pEEdKKwXUibw9pdsvy4niRsTGQJUB0m0a/8GbJ90DmEEo
         veRSHtfe+l08AWNzhRgVefTFAgA/UrrnOvIsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71N0RHqSbRZ8gVCMmLpdsKEjhsUlLS6HtBEUYpNIuhE=;
        b=Q9RR18FXbthgRZ40lndJ3L1mFV7xybijDXhit9/uzOU+ncH6n5ZEf6aCbCT+af04jv
         15WMtyB/LHEUHthwBDumI20vFek9Z5CiVSq1TwDWigUxpxA4Fc/dzovYeDW7xb1eFk4U
         6Y6XX3CWDzaQDo8a7DJYZOHEGTsNWLUPEopJ05RfgInijdSADMn0yxW4+DSIeEz2pz8x
         WErcHd2/a14DmkAYh7ddSwU3bX+jFCv0cstEWSwj6NaqZmut8Y6OwF88JdFCXcSwgUFx
         FXm7r9g7xHj7Sm9md6+DMzmjTVkd3b+wuTW+XybJ+gf/u7pdxRo/zU+g/iAYkLYqOt8f
         OPRw==
X-Gm-Message-State: AO0yUKWHC9JAEmMnH8LYuyjKL6B8pKAIQQGK2GkQvnKvl5zby5770AUP
	QFQoeVibPGikmM2yBhtoQVYWEFRt82L1pySG
X-Google-Smtp-Source: AK7set8HjOCZCKSY+yHBocvqY0w7OHS4e9DTAglHF/hhHJ9XD7C3kU3Bg4bzVVmvYqidvkfVaXMsTA==
X-Received: by 2002:adf:e745:0:b0:2bf:bae4:a369 with SMTP id c5-20020adfe745000000b002bfbae4a369mr9777721wrn.10.1674837189360;
        Fri, 27 Jan 2023 08:33:09 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3876:ca46:43a6:4b49])
        by smtp.gmail.com with ESMTPSA id r7-20020a5d52c7000000b002bdf5832843sm4324866wrv.66.2023.01.27.08.33.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:33:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Inject a dash into PN for BB_HASH_CODEPARSER_VALS
Date: Fri, 27 Jan 2023 16:33:08 +0000
Message-Id: <20230127163308.2649311-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 16:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176452

We've had a couple of reports of recipes expecting to be able to call
split("-") on PN. There isn't any real harm in adding a dash to the dummy
PN value to avoid these errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5aadf6e7078..530b068757b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -959,7 +959,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
     recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
     progress mcdepends number_threads"
-BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234 PV=0.0-1 PN=nopn METADATA_REVISION=1234"
+BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234 PV=0.0-1 PN=no-pn METADATA_REVISION=1234"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
2.37.2


