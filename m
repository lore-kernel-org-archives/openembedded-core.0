Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912F3C38142
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 21:23:28 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.6466.1674336201858545354
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jan 2023 13:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dOiGfKbS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q5so3001330wrv.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jan 2023 13:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HvvIswm4nrn/mavpoVdvAU+BnnpwbTEOmcBqnsgWReo=;
        b=dOiGfKbSG86hbCfelr3ERe5BZVhbKr5O2ZABi3Lm8FfBQ+IlnzIgaAovA8PAZUS2BW
         iSYtfSPNul1pnCmJ210+3Y10D/vj3N/YClWsrwt9mFwCeD6n6vBFCmBadK4HpYG3HqkW
         cUKXqkdDxfgl0VPucszxlsZK3Widyn9Xv41R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvvIswm4nrn/mavpoVdvAU+BnnpwbTEOmcBqnsgWReo=;
        b=cCHn+FmyiLRPaVrxH8yVECdKxvA4XJKGDEJUkbF2sZxbSIpaACg582u1szELCezfS9
         aDxsHF9qJSeGEQvu1OtmdrQTmMDig8x05gtPBAc7J7nasRy90M+vPVZPmFzVzTW8icCd
         d6cF3KAi729C5Y4kg0Rns+MnbcVF8AyRe3lA+WCaOBFZ8AwbIAB9tiraPix9Oa9uyty3
         HdusvxE7NwiQHC2N00vJBaIY7HQcnj1EuU/MVMMqEk+vaEsF/RmYyRf55CFv6Qp216hW
         QS1K+WKWluANZiOfD7R81RELaAbSqPBt9iB0o9BiNwscFYXmmFKd6jwHUtlgRJqzx66p
         RYPQ==
X-Gm-Message-State: AFqh2kq/Zop8eRP5accg8XlKOo1wBlyER6S67zMoQThHZ2lswkct+/BE
	Op2EJaXbI7h//oJGvtJu+xYlwjdwHCszDuu1
X-Google-Smtp-Source: AMrXdXs6DP2G0Wl98NSlYmYKRcVqSFdKJmjqmbj6NPxysHvl0haosQo+oN/Z4ESsEFMCOkGw8/cB+g==
X-Received: by 2002:adf:f6cf:0:b0:2bc:858a:3def with SMTP id y15-20020adff6cf000000b002bc858a3defmr25297470wrp.5.1674336199767;
        Sat, 21 Jan 2023 13:23:19 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f1f:fd3b:ca38:d2c5])
        by smtp.gmail.com with ESMTPSA id d28-20020adfa41c000000b00286ad197346sm676667wra.70.2023.01.21.13.23.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 13:23:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Add BB_HASH_CODEPARSER_VALS
Date: Sat, 21 Jan 2023 21:23:18 +0000
Message-Id: <20230121212318.2171379-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jan 2023 21:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176256

Add an initial value for the new bitbake BB_HASH_CODEPARSER_VALS support,
which optimises the codeparser cache's size and stops it growing at every
parse.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 05d5a844de2..c154f271cf8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -959,6 +959,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
     recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
     progress mcdepends number_threads"
+BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234 PV=0.0-1 PN=nopn"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
2.37.2


