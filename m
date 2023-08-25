Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78559C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:12 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.5614.1692931689723563370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YGSPCPlm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68bed2c786eso407398b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931689; x=1693536489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmDdlR5+9C38uGWOLPyrXwLwYl/m39WFf1sdw1o59UE=;
        b=YGSPCPlmp2mxKN0rHo5CF2D6Td2iPF0TUaGO+WnHaRtOg9f1TZXrYtGYK/dnubhmJb
         nFI6s0q5GNE6JnkJjnOYbRzBMY5BoDyWA0grylZFxjWviKmtOf7coHPByII5EoffxngQ
         hpGVAePo7czGdNGZgWtr3eJ7wlR6m8tcVhQKVHVcNjlP+oKjJEnrWJ4PJUNTYt2A20dR
         3RgIKAuzacTT0E1HWiCgx+DTGiwaxFU/q/pX8ajuxJzK0NsNJJnW+qouOtdQO+ETTN/w
         a5GA5MslNrUQCjzJavDK//fQcaCCEHg7MmD2ps5BqD4A/DObRHkM9jXTPSfiBQN9DF9e
         DNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931689; x=1693536489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmDdlR5+9C38uGWOLPyrXwLwYl/m39WFf1sdw1o59UE=;
        b=gQBmzLSzsXxnPWfJWztx7hdZvKhr+WGyUCsnTgssucoVttwqNU2jZRNqT0mX8L0Q1L
         Q4kb62+Fa/rGJ90danaMlJ9zmRM0yXQhAEzjQLkuAKMA3wTRH2/BVx2gKVvJCwcw65sm
         Gf3wcJ+x3ln4G0MHHWNNITP2fwN0bG52G2aY02Bex9WLVLaiwtvms234LtD/+TUSTdYi
         MU4MJC9ieph86E/ELgLQIQkBLVAjK8URe4LrRyR5hX9txoFMp/GJS+8nrh3DXhM/sDFb
         ulUKWXQRLYX9it125xmv1524dUIRBN7mOv0qXmKMUyspjpaYZRnSfSWjsCLoOX6gcMoU
         cxWw==
X-Gm-Message-State: AOJu0YzqSVU0hlCNkD/1O20rHOeafHHEuRI8d+83CYXryYUjEePRrlD+
	UNKkaWTgDMFUX8hJmLjgSpwgguATe3KB0WNh3wM=
X-Google-Smtp-Source: AGHT+IG3Dj2G386BneFAU5kqeaNnm8Xt5dQUiQBnbw9YyOrRZzzcEFbfkZTXsVRSCJplcpiIp5XIjQ==
X-Received: by 2002:a05:6a21:33aa:b0:149:8bd0:830b with SMTP id yy42-20020a056a2133aa00b001498bd0830bmr11734122pzb.48.1692931688875;
        Thu, 24 Aug 2023 19:48:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.48.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:48:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/14] oeqa/runtime/cases/rpm: fix wait_for_no_process_for_user failure case
Date: Thu, 24 Aug 2023 16:47:37 -1000
Message-Id: <c0faaa1220daa7ba6cc836af741a4e962ccf5487.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186686

From: Ross Burton <ross.burton@arm.com>

str.format() doesn't use % notation, update the formatting to work.

assertTrue() is a member of self not a global, and assertTrue(True) will
always pass. Change this to just self.fail() as this is the failure case.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 017f3a0b1265c1a3b69c20bdb56bbf446111977e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 2b6cfe5ff2..203fcc8505 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -57,8 +57,8 @@ class RpmBasicTest(OERuntimeTestCase):
                     return
                 time.sleep(1)
             user_pss = [ps for ps in output.split("\n") if u + ' ' in ps]
-            msg = "There're %s 's process(es) still running: %s".format(u, "\n".join(user_pss))
-            assertTrue(True, msg=msg)
+            msg = "User %s has processes still running: %s" % (u, "\n".join(user_pss))
+            self.fail(msg=msg)
 
         def unset_up_test_user(u):
             # ensure no test1 process in running
-- 
2.34.1


