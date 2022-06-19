Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FB0C43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:37 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web08.22297.1655667337600264340
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EFwOS5aq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id b10so1066523plg.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vqyFd+0vhx1+6qC9ELhGTeQrmCiBXtHpB8oSrfarIuk=;
        b=EFwOS5aq6Ya/YqaMNXjhwrjC7oYCASMjS/vMUGh3VI7S/Rl57uOukV8xevtpx1oF4T
         AtppKWPpPXp+3Eg1FBwA551JOCY9DmtogW2ZvOfhRUJexmKLiBA6wqvTTL/SSrP2uiQ2
         g/GPegKZaibcuqRQTufNE8q40yYtMgNgNYKcxA527erez21rWqhwpZ+Tlh1PwRBxf0BM
         y7aXWqXHpGOlA8hKbebSSGFIKhMNUDzVR94YpPnD8MO3Fr2HAabv5SrClPukoJ4mXObv
         Pku9Lzobfrg8tteH2hEwQIOmtR9oVmUFQ+jQs7BwMOCPg2ia05TaYmFnzw0PoiEaNsWb
         Uvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vqyFd+0vhx1+6qC9ELhGTeQrmCiBXtHpB8oSrfarIuk=;
        b=QRTxNq5X5XIgd1I1oUfMlTIqGdz89mZY2MI2a3K7NKV/azGdeqEDNMOVdRHHhqxZV6
         i8l7fXxRKW9UUVBX/McHSEGW5vZNr8CKOs2azHQaw4KjeEcis8KsDYMyajfgPAPYPQVg
         kuu2KMbHel0PJthEOlhYPXcidzNhWJr/Cz8fsD2t/rVHrrJnqgIUrXddtd7o5Rhzkdfk
         t4JQQd2qlZGmeMMLAv/LFtqZVuny1tG/eCcsNKFyY/FeFwzhsX6uSQhiMhZg9Gj2vY3u
         PqvEBRIaTx0slxWuA/LE2F+3qe25BySuAa0Wp777uSxeueO41YPwqz7cL8/jlPhCdKsa
         BKsw==
X-Gm-Message-State: AJIora/fINW/zZX/TsTzlzUafrY1y20ZjQ3Cnxo/FRWK9KWToH+yGdbJ
	YYm41kVP9/400FeuTAFPh3l8NxaZr/BvyZyC
X-Google-Smtp-Source: 
 AGRyM1t/cNSA4g/ozd1qxRJPZvHkGIAALQ9rH3A6xaWXhuoibZeHfXThyWhDO3jV4kxiJJZ65xcgbw==
X-Received: by 2002:a17:902:a704:b0:168:e48d:b9a9 with SMTP id
 w4-20020a170902a70400b00168e48db9a9mr19972844plq.49.1655667336526;
        Sun, 19 Jun 2022 12:35:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] oescripts: change compare logic in
 OEListPackageconfigTests
Date: Sun, 19 Jun 2022 09:35:03 -1000
Message-Id: 
 <9eecfbfc957359b7933f1e1bde3aba1780dde202.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167071

From: Mingli Yu <mingli.yu@windriver.com>

When multilib enabled and add layers/meta-openembedded/meta-oe in
conf/bblayers.conf, it reports below error when run oe-selftest.
 $ oe-selftest -r  oescripts
 [snip]
 [20:36:33-0700] 2022-05-16 03:36:33,494 - oe-selftest - INFO - RESULTS - oescripts.OEListPackageconfigTests.test_packageconfig_flags_option_flags: FAILED (585.37s)
 [snip]

 It is because the output of "list-packageconfig-flags.py -f" as below:
 $ ../scripts/contrib/list-packageconfig-flags.py -f
 [snip]
 qt                     lib32-pinentry  lib32-wxwidgets  nativesdk-pinentry  pinentry  pinentry-native  wxwidgets  wxwidgets-native
 secret                 lib32-pinentry  nativesdk-pinentry  pinentry  pinentry-native
 [snip]

 But the check logic as below:
 class OEListPackageconfigTests(OEScriptTests):
    #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
    def check_endlines(self, results,  expected_endlines):
        for line in results.output.splitlines():
            for el in expected_endlines:
                if line.split() == el.split():
                    expected_endlines.remove(el)
                    break

 def test_packageconfig_flags_option_flags(self):
        results = runCmd('%s/contrib/list-packageconfig-flags.py -f' % self.scripts_dir)
        expected_endlines = []
        expected_endlines.append("PACKAGECONFIG FLAG     RECIPE NAMES")
        expected_endlines.append("qt                     nativesdk-pinentry  pinentry  pinentry-native")
        expected_endlines.append("secret                 nativesdk-pinentry  pinentry  pinentry-native")

        self.check_endlines(results, expected_endlines)

And the test will fail as line.split() doesn't equal el.split() as
line.split() is ['lib32-pinentry', 'lib32-wxwidgets', 'nativesdk-pinentry',
'pinentry', 'pinentry-native', 'wxwidgets', 'wxwidgets-native'] and
el.split() is ['nativesdk-pinentry', 'pinentry', 'pinentry-native'].

So change the compare logic to fix the gap.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 239f22847bcae0cb31769adb0a42b5440173a7c5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 726daff7c6..fb99be447e 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -133,7 +133,8 @@ class OEListPackageconfigTests(OEScriptTests):
     def check_endlines(self, results,  expected_endlines): 
         for line in results.output.splitlines():
             for el in expected_endlines:
-                if line.split() == el.split():
+                if line and line.split()[0] == el.split()[0] and \
+                   ' '.join(sorted(el.split())) in ' '.join(sorted(line.split())):
                     expected_endlines.remove(el)
                     break
 
-- 
2.25.1


