Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9D8C433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 09:38:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.5329.1632562705858837624
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 02:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eRzPEL2K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id r23so9485919wra.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=csCefaTNq5p5JPWQPhqhW8ByDCD8fJfSuTpXaZD+8CY=;
        b=eRzPEL2KPel0fKt1U8r/+aTGFvTlBXB6YPbSma14GsdyaJouJCs5dZH7428FoMdpYG
         qhEzQefnVdUGqbUJWO9jYFT0LrlSVLgDUVf0PMgLoBA2YIjUByEc3YHIsuIKUE1vjxts
         2LPW4pKyCkvE/xvSdkqy2oDTheyUQi+yPTJ6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=csCefaTNq5p5JPWQPhqhW8ByDCD8fJfSuTpXaZD+8CY=;
        b=NVqgjW9hY83UcRP+Kz4w/dPiAN56eNnVsK+FLGi7T1crCT5/MoIz81+WuwMA5cI/Ss
         Vl4zI2zl1XHTDOrbbAeMRuw051hPHWyZDdxsh7ob13OO2ybKH7Y/n1WN3mX09H2NrPpF
         4h0exbWLA4NQkQdiBB/stZgokDaTfqZQ0uOf1Y0xJG/wCPRuBQuZRFN7INFjDMB8BpZa
         CuMoBh2NM8WOCuzlg++oovllueb91igoyYhRaBiMCvYJSA4t4bm05ngXTChv8IU7CAwB
         Ks1sjM2suw2wPqEJDEw/9hDKbyLmIiTLUeC+/cr+9KIoCgYuuuS6jms+C/jFBy1iwdjA
         yMpA==
X-Gm-Message-State: AOAM5322vPKk+olgAk5xd/byJ/mKZ4JIwK1COTIfhkC4o1QMrku7KrAt
	5HwZ9LFQ6LYh290q/YaqgAKp/HxcuMA2Pfsz
X-Google-Smtp-Source: 
 ABdhPJxk0qxB6Cm1ajlEuIMW90Lc+7zoAJZsUAxje/7gFT6mRPwKvlJA8HOEiRkdDPj1gZEjUh8pwQ==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr6582617wmc.117.1632562704381;
        Sat, 25 Sep 2021 02:38:24 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2185:dd9d:1e31:557d])
        by smtp.gmail.com with ESMTPSA id
 f8sm10491742wrx.15.2021.09.25.02.38.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 02:38:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/qemurunner: Use oe._exit(), not sys.exit()
Date: Sat, 25 Sep 2021 10:38:22 +0100
Message-Id: <20210925093823.1780735-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 09:38:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156344

sys.exit will cause finally statements and other code to run at exit. Since
we're using os.fork() here, os._exit() is apprioriate in this codepath.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index d55248c497e..d961a9a2183 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -265,7 +265,7 @@ class QemuRunner:
             r = os.fdopen(r)
             x = r.read()
             os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
-            sys.exit(0)
+            os._exit(0)
 
         self.logger.debug("runqemu started, pid is %s" % self.runqemu.pid)
         self.logger.debug("waiting at most %s seconds for qemu pid (%s)" %
-- 
2.32.0


