Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D01FC5479D
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:44 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.45236.1673490806146226232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=29m0ct0/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id jn22so18769493plb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuRFmRLn/MSSa14UUti0pBrxhByfafb/HNEmMma+FBQ=;
        b=29m0ct0/3PehpCyjxPyQ+9n1HMj2BZLvkpVm0pwaCIV8U/SIPlWPLNDvWV65JLmYOz
         XyKZ0H9mF8uHcex9Vnhi+Ue/LQO0rFfJtobYf1sWXelvshemwvK3Wzf54zb+GaU7AZcW
         Jfmf24ZQ6DKHtznI/EjxCLQ9txcF9ApOt1bA7DFoNCWoFxn16w51csqtzvqfI0OiLNvK
         FPviompQ7CGZVmsLHFeq9JiEoyAGL5XtNfaWXMiLyxrxW8RWnbs3OZQxljasiUSOYmTw
         VeopzAO+IwZZ1m0yZCsl1JcfvHksXP4h0fz3GwQhe+QlvEo8wWwhnuO79NQ5Zael+mg1
         nu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuRFmRLn/MSSa14UUti0pBrxhByfafb/HNEmMma+FBQ=;
        b=0x6B7WZspW/s/IIC6zAX7f1ErvMJ9SGcqMnAsLOU3mZ5kZ4CB35zMgHh+r69m06eIk
         GowRX21HgUjtsjjPHSuGaBNQ7KiqAwihRy2DUKVwHOpB90yb4IXz3cKVwcmb4wlShizH
         hHW2VL0D+PK7LIuFGqc0rvCKliCN9hDxK9q8wwcmq8ACUSRY0bF4WgYBAqZA4n58M3wo
         ZJpyJLy98oXJAyaOyDULACpeyM6rcbB8dohH+so8AqFhV5wl9mhzK3XbMkJnTwBOikB7
         4ljtmLoUgNb8rxdMMCA4iiixPo8nwZbpYBDFN/MKZ1CcV++iCHgfj8QR3/hG0LNQvtIv
         7x1Q==
X-Gm-Message-State: AFqh2kotmL7QOcP7jhx2QMbvFfnkUdScVweDRVYv/FymcjWhKfqi+frX
	iIQNFaYTNomCj3GcSSyx8EmG3YaJ6DwcqX4QUeY=
X-Google-Smtp-Source: AMrXdXvvIwwCqxd95VC5R9e8JJvx5HISHS1OEEEAC03Gk67MRRH0r+BuQrayKoJf70Nw5Ap0FZb3hQ==
X-Received: by 2002:a17:903:32c2:b0:192:b0cb:2e23 with SMTP id i2-20020a17090332c200b00192b0cb2e23mr57414309plr.46.1673490816973;
        Wed, 11 Jan 2023 18:33:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/11] oeqa/rpm.py: Increase timeout and add debug output
Date: Wed, 11 Jan 2023 16:33:09 -1000
Message-Id: <46b5bb52e029e435357f4cf3f37d0c8770f9154b.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673490673.git.steve@sakoman.com>
References: <cover.1673490673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175781

From: Pavel Zhukov <pavel@zhukoff.net>

[Yocto #14346]
Systemd may be slow in killing pam session sometimes [1][2]. It may cause rpm
test to fail because there's process (sd_pam) running and own by "test1" user
after timeout.
Increasing timeout to 2 mins and assert earlier with debug output if
there's such process(es). If increasing of timeout doesn't help we may
want to force deletion of the user as [2] suggests.

[1] https://github.com/systemd/systemd/issues/8598
[2] https://access.redhat.com/solutions/6969188

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 972fcc0ed1e0d36c3470071a9c667c5327c1ef78)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index a4339116bf..5bdce3d522 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -49,21 +49,20 @@ class RpmBasicTest(OERuntimeTestCase):
             msg = 'status: %s. Cannot run rpm -qa: %s' % (status, output)
             self.assertEqual(status, 0, msg=msg)
 
-        def check_no_process_for_user(u):
-            _, output = self.target.run(self.tc.target_cmds['ps'])
-            if u + ' ' in output:
-                return False
-            else:
-                return True
+        def wait_for_no_process_for_user(u, timeout = 120):
+            timeout_at = time.time() + timeout
+            while time.time() < timeout_at:
+                _, output = self.target.run(self.tc.target_cmds['ps'])
+                if u + ' ' not in output:
+                    return
+                time.sleep(1)
+            user_pss = [ps for ps in output.split("\n") if u + ' ' in ps]
+            msg = "There're %s 's process(es) still running: %s".format(u, "\n".join(user_pss))
+            assertTrue(True, msg=msg)
 
         def unset_up_test_user(u):
             # ensure no test1 process in running
-            timeout = time.time() + 30
-            while time.time() < timeout:
-                if check_no_process_for_user(u):
-                    break
-                else:
-                    time.sleep(1)
+            wait_for_no_process_for_user(u)
             status, output = self.target.run('userdel -r %s' % u)
             msg = 'Failed to erase user: %s' % output
             self.assertTrue(status == 0, msg=msg)
-- 
2.25.1


