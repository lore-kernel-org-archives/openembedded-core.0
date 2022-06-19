Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC853CCA480
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:27 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.22257.1655667081020488787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JYyZ9xpv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso8424918pjk.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=t4IrKe9vwuWA4YBqy4DazRP9U0ztsB/2F181wuJDHAY=;
        b=JYyZ9xpvJkjwHjzIDYlYUASqYZMdp5V3pXFXP/6zUv6mlNpe1380CaUXXCMQuJmICN
         VZ4plWR4jecoYtjVUVWrCRioN0qutPAlFg9qDNZGJL585d8lLLVAFf+QFkJppp/yB8S/
         GX80f25Ne3rzPhIq0Wa7Mr4qbX+CMFUqqH782YEUJhBqVquxC8jbRf2/HjlCKU1ByKLT
         zFdXEW8sCy87WdqkL7z1tw4BPi0epaW2iScaPHM7oCpzdtipILUbwijG1sqjapj4my7N
         84SPaBz30tBDM7ioGAmydBnTb0Xbzogs7L3CxUGHr/Z9fYWTlcDNpdcdnMljYKlnyKDO
         pB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t4IrKe9vwuWA4YBqy4DazRP9U0ztsB/2F181wuJDHAY=;
        b=fItLUUSN7ahHEdtD67d+dRqb9uL0sGmBwYALm9aoCJrHTemMeA9IFYtlY1eUG187i8
         lKGepXKpzseznlDPWYqDFTE+x/Ux9SNda4rC7UgGs7ylDSK79UElAzsPikJzTQFUm7rX
         7QjiCnrIAGcbKE44V1tK9ax90SDnXNQFoYNbf/zz90P5hYRVM/8Kt6OJxFrawTUtEfio
         GebG1TtxdnWdCLFOYz9l9RESjScwjILWYC1QYXuFZSdDLT8OpAkIHDQdUT/E8mBaHKub
         Tp0qWCwAU0DCsI/6IjtSOVIJQBZ4Onu29BBb8BwZjIithK0Zp3Z8AbZYbat/C/tGT9yq
         1YDQ==
X-Gm-Message-State: AJIora/XxfehyyQvKBa3OWnpeuiX222aF3jaOmnclCwvv4R8rpKekhWG
	05G43rgmNLk+dPWFCBUccArqyiGA5PkykflO
X-Google-Smtp-Source: 
 AGRyM1t7jWRX7EZOTzxaIX+WkcgIRi1/j0P6YD+M24oXKq1QmMAVsVoc9qBicKMixvIPmfSwsvaK4A==
X-Received: by 2002:a17:902:f60d:b0:16a:1a7f:a22f with SMTP id
 n13-20020a170902f60d00b0016a1a7fa22fmr4930701plg.13.1655667079967;
        Sun, 19 Jun 2022 12:31:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/15] oescripts: change compare logic in
 OEListPackageconfigTests
Date: Sun, 19 Jun 2022 09:30:43 -1000
Message-Id: 
 <8c74bca4d652af93c7e36a2a8847d8010b8cc009.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167054

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
index cd687816c8..bd84f151cb 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -129,7 +129,8 @@ class OEListPackageconfigTests(OEScriptTests):
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


