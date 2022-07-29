Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE60C19F2C
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.65.1659106092614610376
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hpTbP93L;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d3so4812831pls.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5GGc+fD3/DXQkqh6oIXJ4FFORc91cx5ehtrRLTfUPRs=;
        b=hpTbP93Lcm9QtEkPVxiMgSonK0C2e3LgWnzSH/j5pg7y4r1mynwjRVrFBgO3a79aUm
         Gao75b5KmgeZX6iL+/gr5EUE5YOTZt/2u1fhhwxWAoVINCZHzYU/qRefpyoXZk2XxpRk
         qLs/CC+3B5Igz0LPKIxlWDQjYNlrtHpdQS9DC0ma9gaedf5axvjI3o2j6oLTi0gUdSR1
         hyoZFEAWVrg5LPzSXRhxo871LygecnB2R20oLTmyT9wNds1Gd1apjECjS1LjZveh0VKN
         z3/G1pn6DiZsLVTyoHI6is/cUZO4E4Y3qKxTS4DIoI2CWM5OTA6jNb8VvIz5Xc7LbLAh
         rCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5GGc+fD3/DXQkqh6oIXJ4FFORc91cx5ehtrRLTfUPRs=;
        b=jOIcd6jxfCFo1syeBCK7hMUHj0grffeMuyrjgpmWDVi53RfAaGbai1bpzX1Pcul9tn
         e9MCljJCqMqP7jXZ4WkhsFMwPHLOSwzb3tAXpIV9HmtsrVaC2sx/eXqPVXVAcHmIUpVH
         u7XnzljC656m73Fr5Xb55VvF7V0MK//837VUtVyJ1AFs43Y/NiZKh8ut9BWjhvd6jFfS
         jE2BAtI3+w+nFNa9xMS/Q1AIi/TJWGfnfKgmX47ebNh3gJ1XAHzruUNjTKmsk2+MspYf
         nRYHVOipFBdAnPEJ3EhVyjAxNJ3Aap7LCtsUe/LEwf5XBh7iZ57J6otC4RTIkYRqidQA
         lIsg==
X-Gm-Message-State: ACgBeo15hNHoklwaXUCl0ad6dzRqd+3KKRMK3/uPoO0iC5KoH61MUycq
	TXlGVRgNE3Xrm1T/bOmfV9TV6jFYQCCRTse2
X-Google-Smtp-Source: 
 AA6agR7O2gZFJk0Kz7YTD7Fw9uktYv7aDDOLkx/lnfFI0FH9EYVjd5XdegKEaSliEOZg/25OORTbgQ==
X-Received: by 2002:a17:90a:e58a:b0:1e2:fe75:dd5f with SMTP id
 g10-20020a17090ae58a00b001e2fe75dd5fmr5324409pjz.138.1659106091510;
        Fri, 29 Jul 2022 07:48:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/29] oeqa/runtime: add test that the kernel has
 CONFIG_PREEMPT_RT enabled
Date: Fri, 29 Jul 2022 04:46:37 -1000
Message-Id: 
 <de7bd5b616b9af3a88d718c79e85a4b53efb3280.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168656

From: Ross Burton <ross.burton@arm.com>

This is the absolute bare minimum for testing the RT patches, but it
does mean we if we build and boot a RT kernel we can verify that it is
what we expect.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0301d5845115d09299f87683b3efa46f3b4c7be9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/rt.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/rt.py

diff --git a/meta/lib/oeqa/runtime/cases/rt.py b/meta/lib/oeqa/runtime/cases/rt.py
new file mode 100644
index 0000000000..849ac1914e
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/rt.py
@@ -0,0 +1,17 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+
+class RtTest(OERuntimeTestCase):
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_is_rt(self):
+        """
+        Check that the kernel has CONFIG_PREEMPT_RT enabled.
+        """
+        status, output = self.target.run("uname -a")
+        self.assertEqual(status, 0, msg=output)
+        # Split so we don't get a substring false-positive
+        self.assertIn("PREEMPT_RT", output.split())
-- 
2.25.1


