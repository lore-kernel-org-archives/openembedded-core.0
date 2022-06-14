Return-Path: <sebastian.suesens@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB0BC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 06:27:13 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.3009.1655188031874075459
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 23:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J0GNEejz;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: sebastian.suesens@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id me5so15219933ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 23:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E0xNLktVNlQyyan9GvBTUYyJ/+/Y+0Ir2K74abT8a9U=;
        b=J0GNEejz3Mp45GRfuHs9P/vBBoG+R2SpEnyiR9kPaqf6h4UosfQfScFH6EkMw+7cl6
         3UXCs1msuyYN4OaCoELfxNxtAg2Nhtr0CbYKNFSSK7bZBX+e71Dk7OY4Oy2EEPumtm+j
         UUgsdtFZk8Fbe46jCJU33NofY/h2s0LKYdYuLCquFc+FsBisycvAKdL9JraML8/vkodt
         7Gtb3hBPtxKmJpac856gtaSo3WmLzRX1M+SmxDUYkycc7Jbnzv8dHEQJPCm4W2RXmKM/
         wkcO+0KcCl186MB3+y2LHtgtYABLVF7hnx9EYHBGNM12KZhf+FyseJfvsS0ju75nrrqg
         wLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E0xNLktVNlQyyan9GvBTUYyJ/+/Y+0Ir2K74abT8a9U=;
        b=1ZZPRxjACswPdZ/aEDztMYr9YVAMHrjnDTMf+CElHgKHXW6dDvm5VAxZT8qczmmPvX
         Rok/El5AOMhaY0qOTMVKCjQXPxFOSZbuBg84o6iUqWgRdRR6zr5HGPotzl50bhHvEieC
         j01/FXgR7UMKPWW0krE289OWwRAuDlQA2fqXN6GgH2IQ8jfv7AhhkhLMkdFpSHclWmt/
         E3lkBL0QM8Ih9yeycHJsLYUQWvAF3ol9FqDps3qGctUDYcww1k4hjGpAJYTe2baYz1bv
         GCDrdPFbPFj+q9UjuL4D9NYw0Ehg0Vza85zc9f8prenjKgzMjly83i4elRBx4qGcs96T
         HJaA==
X-Gm-Message-State: AOAM530M+16v/4EaPWgU0kpUD6bfpBTMFoxuZNVm13jJF0OsxGJEmZYq
	sR8sGiLskyTgbNtp4U9IegBgbEj/spkZKyejzjs=
X-Google-Smtp-Source: 
 ABdhPJx7IxaG7H8l1gRzuMy7dTPyD2H2DZjYuzcK1YABoyN5e0awzTJf9Zq9jm3vpw5+FUuuvBuV9g==
X-Received: by 2002:a17:907:3d8a:b0:70d:e791:f82d with SMTP id
 he10-20020a1709073d8a00b0070de791f82dmr2870398ejc.528.1655188030298;
        Mon, 13 Jun 2022 23:27:10 -0700 (PDT)
Received: from ssuesens-qemu.fritz.box
 (p200300d98f3c7d00bcbc9443c92a3bee.dip0.t-ipconnect.de.
 [2003:d9:8f3c:7d00:bcbc:9443:c92a:3bee])
        by smtp.gmail.com with ESMTPSA id
 t10-20020a170906178a00b00711d5baae0esm4684374eje.145.2022.06.13.23.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 23:27:09 -0700 (PDT)
From: Sebastian Suesens <sebastian.suesens@gmail.com>
X-Google-Original-From: Sebastian Suesens <Sebastian.Suesens@baslerweb.com>
To: openembedded-core@lists.openembedded.org
Cc: ssuesens <sebastian.suesens@baslerweb.com>
Subject: [master][PATCH v2 1/3] weston.py: added xwayland test
Date: Tue, 14 Jun 2022 08:27:05 +0200
Message-Id: <20220614062707.2946041-1-Sebastian.Suesens@baslerweb.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 06:27:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166876

From: ssuesens <sebastian.suesens@baslerweb.com>

Test xwayland support if DISTRO_FEATURE X11 is enabled

Test checked if xserver listening on display

Signed-off-by: ssuesens <sebastian.suesens@baslerweb.com>
---
 meta/lib/oeqa/runtime/cases/weston.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index b81cc299ef..1fd471e611 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -77,3 +77,11 @@ class WestonTest(OERuntimeTestCase):
                 self.target.run('kill -9 %s' % w)
         __, weston_log = self.target.run('cat %s' % self.weston_log_file)
         self.assertTrue(new_wl_processes, msg='Could not get new weston-desktop-shell processes (%s, try_cnt:%s) weston log: %s' % (new_wl_processes, try_cnt, weston_log))
+
+    @skipIfNotFeature('x11', 'Test requires x11 to be in DISTRO_FEATURES')
+    @OEHasPackage(['weston'])
+    def test_weston_supports_xwayland(self):
+        cmd ='cat %s | grep "xserver listening on display"' % self.weston_log_file
+        status, output = self.target.run(cmd)
+        msg = ('xwayland does not appear to be running')
+        self.assertEqual(status, 0, msg=msg)
-- 
2.25.1


