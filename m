Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204CAC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 22:03:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.36594.1650924209671484487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 15:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q9EAdURQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id bg25so9377343wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Xl628NPFhWIXj2U0D9i7t+0rLjcikeW+yi8000V4pE=;
        b=Q9EAdURQGpbBdEATxhcJYk18HQVwIKq8Wahy4xx/VWVq9gnMMcEcjIWKY/XpuCea5C
         ARoIFClZY/2uAhyn8UwSnO48FktdQ0ZKU/exqop8ehnCgvfY10/Nl3RJo6CC4DvhlJY7
         yy/iZOtXv3f7yV81V3w+GdNXxyRxJOiGi2vNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Xl628NPFhWIXj2U0D9i7t+0rLjcikeW+yi8000V4pE=;
        b=RGUDeYFTeUNPJ1N/KESoDwa/cO2L9VGS5kpq6diyDuRefpjjUOfnnwZOtg2mYnhgz/
         t5rgHwhvXPCvCzUkzbtTe1mL/LDQ9ekiCv4EohNNjgl1EsPRRqSgh+/jGGH4/w3MCzdq
         1MLs5jE1xIdadouhmdECJvu0I5dYY4AhtEubEavgUaOj358WsDe/AVaXKLbNWlC+489q
         wF/y1W/qJewyvilJtRNlqLBlFBaCdHyPnDH7L98wkIikNWD/A6XYX/rRoqCG5hkLtd0d
         mSUxqCWfYN9a0J89s2gDJ0nlOWhCu6oAo0Sh5VDAI9+ZLA/VaxDmIhxD/5KJeLXgyroF
         Hq4A==
X-Gm-Message-State: AOAM5324TzWZrzSwGB3+5VuhW7mfFNX+NDvi0pbTfyuOclGBUi2K6aIO
	FLsUTvN6pmy92TGSAH4vWqXNod77AsW49Q==
X-Google-Smtp-Source: 
 ABdhPJwQfZU0umlKUOKh4z7OLp45rQ0m2Li5Gu4M9jr8HIX2zKp8eVkV6S4kRQwZC1/jbvY8xhMNBA==
X-Received: by 2002:a7b:cc17:0:b0:38d:af7:3848 with SMTP id
 f23-20020a7bcc17000000b0038d0af73848mr18604177wmh.41.1650924207785;
        Mon, 25 Apr 2022 15:03:27 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8d4:bce8:ef63:7bc2])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a1c2506000000b0038e6fe8e8d8sm11989769wml.5.2022.04.25.15.03.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 15:03:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base: Avoid circular references to our own scripts
Date: Mon, 25 Apr 2022 23:03:25 +0100
Message-Id: <20220425220325.2761246-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 22:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164846

We'd like to intercept git calls but we don't want circular references
and HOSTTOOLS currently sets them up. Tweak to avoid them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3515720bf95..16b7c69995e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -115,6 +115,9 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     tools = d.getVar(toolsvar).split()
     origbbenv = d.getVar("BB_ORIGENV", False)
     path = origbbenv.getVar("PATH")
+    # Need to ignore our own scripts directory to avoid circular links
+    ourscripts = d.expand("${COREBASE}/scripts")
+    path = path.replace(ourscripts, "/ignoreme")
     bb.utils.mkdirhier(dest)
     notfound = []
     for tool in tools:
-- 
2.32.0


