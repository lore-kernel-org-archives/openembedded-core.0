Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C947C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 21:05:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.1796.1647551119259457353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 14:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KKTQAI/1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id r6so9065025wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 14:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SUsfgmjSSUAoiswwk/744cRAISLPqsAzBbfFd3C2FYE=;
        b=KKTQAI/1O848osFwpAQaFIBmVO6yvyuExioYTFd6xVnjLKjn+tppslTWdSoPbBEMsJ
         7UmEgBXWQ6AHFD4FMRw3106SglVnq8g5znrQWdm9eLXLxrayoxFuHbSViBMjrvwdVcSQ
         xWmUsrKYYmFsEVElhmP0sxHKY4Qrvh7Mi2nJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SUsfgmjSSUAoiswwk/744cRAISLPqsAzBbfFd3C2FYE=;
        b=L58jm1K232wfgDlM4fUrBWmFdgL3KmZyoFGQvRVCFtvTN0y8NZQlBOd/1exAuuobFG
         2mfyvvk+CYS0GRYFiQTA+lhqob8+kGuybvU4mGmhg2+RZcx8cKUBBFgwO/bgV3wed5XW
         BZzc2b3/e3goGJonFVghnFnb1AaCLH38hK0kjkSdZZxM4uVlltaz6PWipLJWXy+TCeLe
         C39yJOjoH2wmiiMgNzthA9f2aqvqojPWtEms39sCkCPH2NFgy3Pg6/UutTk/eOE/KCbp
         RDQwbFn/Er0EPIsqHabmPnbwwwkaiY2Mq8C2KXuA7+FZJdlzCgrjbu/Ua+oFkgeDl+Yu
         Zu/w==
X-Gm-Message-State: AOAM53231sjjuGZG08UnnSrZsppk7T06FeISkjrTJXSRZ9Ep5pV187FQ
	DVgjrKtVFNAHdlyXmeHZ8xzLdJsRjshDvR2H
X-Google-Smtp-Source: 
 ABdhPJyF9jAlnRcb5uqVgEy13E3Q2/RNo0vvvx6G03XoKayzfbI154GcsUeo7vjvXU42PYrP8a/zfw==
X-Received: by 2002:adf:ee41:0:b0:203:de82:c2aa with SMTP id
 w1-20020adfee41000000b00203de82c2aamr5399117wro.390.1647551117291;
        Thu, 17 Mar 2022 14:05:17 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37])
        by smtp.gmail.com with ESMTPSA id
 l11-20020a5d674b000000b001f047c49e99sm4865697wrw.2.2022.03.17.14.05.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 14:05:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/tinfoil: Improve tinfoil event test debugging
Date: Thu, 17 Mar 2022 21:05:15 +0000
Message-Id: <20220317210515.1013829-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 21:05:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163435

We still see occasional test failures for unknown reasons. Add some debugging to
show whether the matching files event was received even if the command complete wasn't.

Also ensure any commandfailed/commandexit event is shown.

This will hopefully aid debugging the next time the issue occurs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 8fd48bb0540..63ceddf118a 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -87,7 +87,7 @@ class TinfoilTests(OESelftestTestCase):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=True)
 
-            tinfoil.set_event_mask(['bb.event.FilesMatchingFound', 'bb.command.CommandCompleted'])
+            tinfoil.set_event_mask(['bb.event.FilesMatchingFound', 'bb.command.CommandCompleted', 'bb.command.CommandFailed', 'bb.command.CommandExit'])
 
             # Need to drain events otherwise events that were masked may still be in the queue
             while tinfoil.wait_event():
@@ -118,7 +118,7 @@ class TinfoilTests(OESelftestTestCase):
                     else:
                         self.fail('Unexpected event: %s' % event)
 
-            self.assertTrue(commandcomplete, 'Timed out waiting for CommandCompleted event from bitbake server')
+            self.assertTrue(commandcomplete, 'Timed out waiting for CommandCompleted event from bitbake server (Matching event received: %s)' % str(eventreceived))
             self.assertTrue(eventreceived, 'Did not receive FilesMatchingFound event from bitbake server')
 
     def test_setvariable_clean(self):
-- 
2.32.0


