Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC740CD690C
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 08:53:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.86414.1696928012121534556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 01:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fbsug6x0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-406619b53caso49847695e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 01:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696928010; x=1697532810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9lHLNgcQrEeCtODwMUU5LqmsrL2ldYWwieMZn/MB5s=;
        b=Fbsug6x03UG35VkFHrevEFwjEN9StELDhabO/VU5UU8jy40uo0fUkAMri+i+H6f4yw
         ewdpoIqOqm/QbX+sUrJiFdZqvO3GdmFbCU2Xj7hPsnVz9VQIXoYua/cfZXR4vhbfnZhL
         VfqcOpU7AtdWom/tyJZDkeWKb3UYdvDiyWbAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696928010; x=1697532810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9lHLNgcQrEeCtODwMUU5LqmsrL2ldYWwieMZn/MB5s=;
        b=kDQ10yj/M3OyOVzo6Q97T776znd613IXozEqocUdUaeViyd8t8AwHnBG5mdU4Lt2YE
         wDVq8Qjv+SB+svOeHi5UYVZlxLJScjNaeINC4PRm7ayS52QOIcoNV9UoOEpb03GexU4B
         pD636O++bPwxv0BKE8QJqmA4dg/1dfBauxBBwyPsk3eIabCmTFPDx0ee0wnTmWzvqQbL
         UDPkM38PXBlm2H/M6xawhmxhlG6Afyeq/eXj2jODOUHQicvFeJbqMNWZRZFxE9J/Qqn+
         /juZ/S7pHBJhElb/7flXcg6fECm3Btj+MEechgzk+A55blv1z6pC3Upam1XAfFmRkzXk
         3yxA==
X-Gm-Message-State: AOJu0Yyerh3klL4gguSoJ7i9t/Dc3dy1ubp4dWm7ed9puobCbfU/uXvo
	LFGw4CG0wq/LJ9IoP4Jet3F7UDyW8o+pLPacLzA=
X-Google-Smtp-Source: AGHT+IEU99zDS6kUYuMqH6nXmXqX9eNiVdSWuxkCQweYFwRnXe/qxdvKRSyYxfwRo6y4y9Xb0XA60A==
X-Received: by 2002:a1c:720c:0:b0:3fe:4cbc:c345 with SMTP id n12-20020a1c720c000000b003fe4cbcc345mr16001378wmc.41.1696928009559;
        Tue, 10 Oct 2023 01:53:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2892:849c:e303:df3f])
        by smtp.gmail.com with ESMTPSA id i14-20020a05600c354e00b004068de50c64sm13527338wmq.46.2023.10.10.01.53.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 01:53:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/qemurunner: Add extra logging when console doesn't appear
Date: Tue, 10 Oct 2023 09:53:27 +0100
Message-Id: <20231010085327.3677768-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 08:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188873

If the console doesn't appear, breifly sleep and try an extra read. This
is a useful debugging trick which we may as well preserve in the code. We're
already failing at this point so extra data is useful.

This means if we perturb things on the other port, we may gain useful logging
insight.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 574696eb7e3..cb3231da63b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -519,6 +519,16 @@ class QemuRunner:
             self.logger.warning("Last 25 lines of all logging (%d):\n%s" % (len(self.msg), tail(self.msg)))
             self.logger.warning("Check full boot log: %s" % self.logfile)
             self.stop()
+            data = True
+            while data:
+                try:
+                    time.sleep(1)
+                    data = qemusock.recv(1024)
+                    self.log(data, extension = ".2")
+                    self.logger.warning('Extra log data read: %s\n' % (data.decode('utf-8', errors='backslashreplace')))
+                except Exception as e:
+                    self.logger.warning('Extra log data exception %s' % repr(e))
+                    data = None
             return False
 
         # If we are not able to login the tests can continue
-- 
2.39.2


