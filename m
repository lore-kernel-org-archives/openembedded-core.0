Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAC3C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:46 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.23925.1641765886414572306
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iG4p+HkR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id u20so9062562pfi.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gE/7CuB/R8j50duJqRPYuPpCLRbpOvAe+OPXBkWMq5E=;
        b=iG4p+HkRlmg6TtdooUVf2OPWWiwD0IqbK75cMNcVBm8lCFVVM/2Et5hp+LXywDPGm8
         03KWCn3voy7cmu7BF/mxaz/T7nqTlFGkgKaDYWzd4EtIeV/nHDQ7GIbzql+91xtTiMLA
         S/ashwDTQDNi939GZvptLShJh5LzwGLPkDZZGa/XntUNDVcPJeZnW6ADblNWhqxZm02e
         HtMcGu+MMdNWMwkHGhhsv+jOHZDzglAidQknMvabwKgoFW7y9nNm+q2jJGWfUD5wrz1u
         yZLK7Nm6heebSc4CZG2WsfSZOvcPEN6y+DGgfY22y3Qdb2ioUGg0nzgbPdg5MSUaz/wU
         d+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gE/7CuB/R8j50duJqRPYuPpCLRbpOvAe+OPXBkWMq5E=;
        b=yOC+qUaHbIzCky4w8yj9LNUKgwKyjNaxOEXPQev6RxCUDCIA4fekrs6JJR8puVBzFb
         MHzn8KBuy6itoVtdvMoqPCsFt9VrG2j1/saM67jGmgutPU1BkT2Ef3z1HnfMQGSAtIB/
         ZeBcfPLr872SxhLnAfPX5xg+CJSz4d4CVpBzdCoeamNitkhE8/cdfDj8Yf0Af6yZnT9I
         vanorp3thVbxw5662bWUXIN4a3IVES08NCPzJOndMWH3sUTVDFTyixSBMm7pwz2gduAv
         LwC7/5O8zmRkE4PuFUS5mAErgq7Ad4skMAHcFBE28yraNtGonEl0DxebCEOJ4CrI/oJ5
         ZreA==
X-Gm-Message-State: AOAM531PItr+N8e+EPy7J0rZX2wx1/AQXquKUry1hEI6K1z6kJt3Dt23
	zjsmwkEXMj9l/WYuMEcvGGeJtqhUVWXKMOkF2P4=
X-Google-Smtp-Source: 
 ABdhPJwNU+LCNdnvrFEeK5Sda7ebhd/Jqu5/gGvRw2xSnckh60VUGSI9uUpfbrOTqCHiSijNVanyMA==
X-Received: by 2002:a63:6cc5:: with SMTP id
 h188mr62738518pgc.401.1641765885486;
        Sun, 09 Jan 2022 14:04:45 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] oeqa/selftest/tinfoil: Update to use test
 command
Date: Sun,  9 Jan 2022 12:04:10 -1000
Message-Id: 
 <351b02feb9cb680aa3dbe4c8ea4162a6456a469f.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160297

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We've had IO load issues on the autobuilder with this test. Avoid
those by using a specilised test command instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 106445b1eb74fc37e03c72a0c011541b50a16c19)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index a51c6048d3..0204537d49 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -94,14 +94,13 @@ class TinfoilTests(OESelftestTestCase):
                 pass
 
             pattern = 'conf'
-            res = tinfoil.run_command('findFilesMatchingInDir', pattern, 'conf/machine')
+            res = tinfoil.run_command('testCookerCommandEvent', pattern)
             self.assertTrue(res)
 
             eventreceived = False
             commandcomplete = False
             start = time.time()
             # Wait for maximum 60s in total so we'd detect spurious heartbeat events for example
-            # The test is IO load sensitive too
             while (not (eventreceived == True and commandcomplete == True) 
                     and (time.time() - start < 60)):
                 # if we received both events (on let's say a good day), we are done  
@@ -111,7 +110,8 @@ class TinfoilTests(OESelftestTestCase):
                         commandcomplete = True
                     elif isinstance(event, bb.event.FilesMatchingFound):
                         self.assertEqual(pattern, event._pattern)
-                        self.assertIn('qemuarm.conf', event._matches)
+                        self.assertIn('A', event._matches)
+                        self.assertIn('B', event._matches)
                         eventreceived = True
                     elif isinstance(event, logging.LogRecord):
                         continue
-- 
2.25.1


