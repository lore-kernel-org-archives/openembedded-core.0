Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A17C4167B
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 17:25:59 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.37984.1698945953103032994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 10:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=r/lxmMki;
 spf=pass (domain: baylibre.com, ip: 209.85.219.51, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-66cfd874520so6718856d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 10:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698945951; x=1699550751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmo+OVrwCgAtxw1E+3V9uAB6ACWUJIvtQaowi9FwvkI=;
        b=r/lxmMki449m5fWVBJiAyR/qzc3McfopoVjnewZfbz5cWSfuBWRDfR+1531kn3mym7
         /f9owply5v25fbddAFq+e9ac0uh9XmatmHqzHMnNPWx04/zQgTePFh+z0cKnNXCm/3M6
         PXbcekLJ4q7t05obG0a/SRVXcM4RPre/w5cL49aJKpF6KkPMy05SeQcKf7uLwCS8wLJW
         uZUEap6P2SMNaBZKAgjWX16c9QpbV/V0bhch7Pkx8so1W5bK3c3G0L/coDTBUuq8BYXK
         J3LpeLJuwsS+vuitUzz+CMrekJ0aqn/vb+6fiD5D+p/tx33Paaqve/213UrP001jWRqg
         snrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698945951; x=1699550751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmo+OVrwCgAtxw1E+3V9uAB6ACWUJIvtQaowi9FwvkI=;
        b=Q2tQBRnT/zYwceFwBXm3p9uf8J1q9t0+IAtzxF7aAH7/999/eO5LjMXki/aL8Xr733
         PfE9dVJsmUSfxBhwk6Q+M/ny8kiKTiRjkI6I7EVy6ds91m0YTmtTaBimAUBQRmVM/1fa
         Wjvt/QJeegoAYh+h7Nxjhs84DI/kdidwk6mmmZl08/HU0eizlr6pKpqDrPZOVYBWTICL
         5/oXQpZb2LCr5FVRx5UZDxJ/ajgY+ANl/rtPk+uwFNbwTd6rgo8ojcyLisamzdk3LfgB
         MIUtpM2/DMLs5t+GlPoqKiibKbZHi+GiwAam+LhdXZXlDaeGhRePth9x+3on9QvmA9Tp
         i2KA==
X-Gm-Message-State: AOJu0Yy0x+/pNZrj9wqAg72py8bjRk2FcIqU+Z4VuUMD0I2m0QsOuHRo
	stpR1C+rehpSAmbCeH4KaYQOoOzrHftuEKIO/uISfQ==
X-Google-Smtp-Source: AGHT+IFKeWS3TczNgb9fL3/Pmok2OFkOxeYJJmtWo8mhiKsIFMu7BNrOYJich8V00SoUc2Mqa0p59w==
X-Received: by 2002:a05:6214:1316:b0:656:2d03:a4be with SMTP id pn22-20020a056214131600b006562d03a4bemr25386437qvb.40.1698945951649;
        Thu, 02 Nov 2023 10:25:51 -0700 (PDT)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id f10-20020a05621400ca00b0066d20f29e5fsm123062qvs.35.2023.11.02.10.25.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 10:25:51 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest-send-results: fix sender parsing
Date: Thu,  2 Nov 2023 13:25:49 -0400
Message-ID: <20231102172549.2153861-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 17:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190090

Not all mbox 'from' fields will contain angle brackets, so the
re.findall invocation used for getting a reply_address may fail. Use a
simpler reference to the field to get the sender's email address.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest-send-results | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 1df81f943a1..71b73f0940f 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -59,7 +59,7 @@ subject_line = f"Patchtest results for {mbox_subject}"
 
 # extract the submitter email address and use it as the reply address
 # for the results
-reply_address = re.findall("<(.*)>", mbox[0]['from'])[0]
+reply_address = mbox[0]['from']
 
 # extract the message ID and use that as the in-reply-to address
 in_reply_to = re.findall("<(.*)>", mbox[0]['Message-ID'])[0]
-- 
2.41.0


