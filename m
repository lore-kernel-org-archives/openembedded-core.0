Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B24EB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 16:32:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.3678.1689352342995969445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 09:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=NiG4WrJg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fc03aa6e04so19851095e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689352341; x=1691944341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nPLF5kqiyj1MDMZAfvqCaSgC+55jSrwdV7wbeHSdJ0Y=;
        b=NiG4WrJgt6rpHsABmwfS6jHozMtGMhg0aQ9Umqk6QUXHj/vsk71aP5AtT/lR+vr4Tp
         Em56guIBhJ2lUWl7AApF2sU/OorT60g7FW1nhh8xltWGqQRYYyn46WyU+blET8JZnHyq
         MmUcLX+tGEaewlJfpcb1FU97s7l9XhJ7FkmdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689352341; x=1691944341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPLF5kqiyj1MDMZAfvqCaSgC+55jSrwdV7wbeHSdJ0Y=;
        b=VnaCdK4g9MkxJBFsC+KW0WH5HUQpdP7yWzHpM9tDqdb+7CLGJfCq3Z6lVsRAhmJ3X7
         fZcA7rHfyt36tIbvwvQa3WEA9WOjkpm8ZxewsP9FUUdggR2RYLLbZFtBNMazybhAyJaa
         r3+jTuot/+y8T7p9B//yVsJy1XtTsia9AdkR3tA14ZrWHnX7jE090vyD3TjYeNLo1cgz
         d9+FJqJiIJb8P1u2bZr7JF6wz77TdktJVfx4BZo/fcyon0CAvLpX/SZ1e2HKwP9LkqFD
         5Xi4x3RlvbrF9OuBuXoFLjdQGvOg0BJE87zIpi3O9Vnj8usqT+PplHnfCiHq52lVQkGu
         HotQ==
X-Gm-Message-State: ABy/qLZc70LwgAVV9hW2LgD5bf/ZinEZVGJJFQTX9MVhudHwW+IrvQbb
	rsxnr1e4bnE2M+ICiJlUTRoG2zX762+CQRsneeM=
X-Google-Smtp-Source: APBJJlEageXH30gXJMQg/ogMwjsROFUshPoGZc6kmjUoER4JMIu7JBiGnrCrAu87z4reez7WzrO1aQ==
X-Received: by 2002:adf:e6c8:0:b0:30f:ca58:a00d with SMTP id y8-20020adfe6c8000000b0030fca58a00dmr4437771wrm.45.1689352341086;
        Fri, 14 Jul 2023 09:32:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9829:fee0:9660:b19c])
        by smtp.gmail.com with ESMTPSA id w8-20020adfd4c8000000b003141e629cb6sm11194433wrk.101.2023.07.14.09.32.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:32:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest-runner: Pull in parallel test fix
Date: Fri, 14 Jul 2023 17:32:19 +0100
Message-Id: <20230714163219.86453-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 16:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184276

Pull in the commit "runner: Correctly handle running parallel tests".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 6f3104499f2..77e2b94f376 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "8259375d306a8129f6c5d8528314496fc6ae1ca3"
+SRCREV = "07d8a676aa962ecc5ec264ec33b0074adf2a8733"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.39.2


