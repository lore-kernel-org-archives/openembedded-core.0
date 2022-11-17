Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271B6C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:55:23 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.1044.1668704114657146927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IOvGTY6L;
 spf=pass (domain: linaro.org, ip: 209.85.222.182, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f182.google.com with SMTP id d8so1567719qki.13
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXT+W0zbHuymxkPFSaObhvABgMTfYjMvfjJsT+ZEhts=;
        b=IOvGTY6L1zCorBGMWZ7jlp8ms2Jiw+ZIlUPp0p5kLNMh7/YPR5iPHC0dXJpBH+gvKw
         L4me4vtjaQ4OJLooKeDM83YicrnMDzyyzI+ko6UiYiTCnfYY2z10JZjS84n0u1kS0RmH
         BiXhrQAlzrzOCCUloLf7NRvQMBBjtgx/kZ1i6rBGlWUUpvSK/Rar+2e2PiCSdNKE4LEp
         4uhVptnhcespQ+z2Y/sjvBLx0znJsQHlsEWaUdUFZJPn7yBkV0GY87gpogM7tDJW6u/L
         2pFZ5W+HBagd0xATW7tKYNf6CwS/KxySB55YDO9xVyZ/8HIwY1tKVzbCCLKiQWB4orG8
         NK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXT+W0zbHuymxkPFSaObhvABgMTfYjMvfjJsT+ZEhts=;
        b=wv8kWGIIAKIXQPJ/pIT1NOB0liTqiQ0SGZsPrpbjOFAtQvcHtrnRKqLtXg4TLVl0qQ
         icvb+cY9AlmMlBSKo7Cwf4k/U9v77khMcXQhBMo8xowzlyrmgbrzZ275Fnx8ZZpwcjBx
         VnsZa1A65zpyCn5NaqklONBucsrV7jRbPMOP6hhG2SFyocpkAJQFk9u1e5OsbsdYLeF1
         zpexhu2YkMYexONBDNjgfN6S0r7RO/npZ6SbbjxKN3LsDL/eVf/jB2SetQBqr8bPiDn5
         za3KZUzNOIlGgRob6ALDZx6BchOr/p9uhv8rTCnI6ApEVfqZAMOTVUWUBoTiMLlkDmDH
         9NFw==
X-Gm-Message-State: ANoB5pnmcIDkx1hdikpIeJaaWEJkixW1NlMvbxIQcUEnxKXgC3ECkIBe
	3bj4qahMUdF4GW5XhnmNxx/GiLNKNqJiIA==
X-Google-Smtp-Source: AA0mqf4aLfJYh1LzKs6vWDaZE3FndrCpSQv270djdRmGMPpCeC/UfTv16uNhEwcmbHHUjP120VfgDA==
X-Received: by 2002:a37:a951:0:b0:6fb:9f9c:fb1d with SMTP id s78-20020a37a951000000b006fb9f9cfb1dmr2441698qke.499.1668704113794;
        Thu, 17 Nov 2022 08:55:13 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm785081qkp.74.2022.11.17.08.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:55:13 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH 10/11] golang: ignore CVE-2022-30580
Date: Thu, 17 Nov 2022 11:54:55 -0500
Message-Id: <20221117165456.1029099-10-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
References: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173443

Only affects Windows platform, as per the release announcement [1]:

"If, on Windows, Cmd.Run, cmd.Start, cmd.Output, or cmd.CombinedOutput
are executed when Cmd.Path is unset and, in the working directory, there
are binaries named either "..com" or "..exe", they will be executed."

[1] https://groups.google.com/g/golang-announce/c/TzIC9-t8Ytg/m/IWz5T6x7AAAJ

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-devtools/go/go-1.14.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index ef33bf5afb..4c10104aca 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -64,6 +64,7 @@ CVE_CHECK_WHITELIST += "CVE-2022-29526"
 
 # Issue only on windows
 CVE_CHECK_WHITELIST += "CVE-2022-29804"
+CVE_CHECK_WHITELIST += "CVE-2022-30580"
 CVE_CHECK_WHITELIST += "CVE-2022-30634"
 
 # Issue is in golang.org/x/net/html/parse.go, not used in go compiler
-- 
2.25.1


