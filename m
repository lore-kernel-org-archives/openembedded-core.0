Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9058C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:35:00 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.25216.1673447691305246476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YwgUcHeh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id 200so5373056pfx.7
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 06:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mX1H2uMdo39097YTW9nt9z2JNKEtp4KV8FMoLhng3HY=;
        b=YwgUcHeh8jjmmcUGuW6WOSKBjSQs3t5Yk6FOrWW8NrWYVzCw/VzCorEOSeXv82TBXc
         plXo7BvxFmtf5YCzb0Rbx2fclyS1xi/rDpZAQ9o+H6wjksmchs+iF1rP9PpIaJbvyQDz
         SYOubSz/Nn2iXon5n99laZqCGFNprfj9ish71WLNFcOCVTmg6p3zv+LFJIK6E8Fri56g
         8ItqNzYgDnphEtF47eA3Q47Qqqeu90BDb5PvkZcVlsSic5gh2Exz5iGoUzSmFtQC06pj
         44dl+wNLJFhcTYJTSDkcyxKxMV3q4iY/G3Nd/dtvUVDuX9SMLUAWfsz+AoURPymCX0rW
         8VYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mX1H2uMdo39097YTW9nt9z2JNKEtp4KV8FMoLhng3HY=;
        b=T7cclMGhxikHlNoY5UF3156dbBhFLSm+jJCJwX2cd/tVxswwJLHOQodF63zZGOZoSA
         lgFlzCipvqv4EnzxN8EfHb61b+MJLBIkiH+ISkswKEoUsr7EAyJCWA3+Vo0J5CpGrO1I
         GOzMh5B2u/N3wvy70LTei808tPM1i1AdpF1CnNXt+tpBiz8x2woUE/cGWp2QjRB40KbO
         2b1V3jmB+a0Cd3TUo+6XPyzDLZfwyLtASvGzaq/2DRB5grqrZW9TctedUlj5vizxI3Bw
         Dv0bOZPFOxj8oTfTRmgWda/EHYUf170eL3nMAe0Y/ddvFI3ZGN0z7E6teuaxI7ECQWrE
         zHrA==
X-Gm-Message-State: AFqh2kpCYM0WSR1/gIilWTb9mMTCbi8j+c8z7AlG7naxo0Ydzi4ZBfb8
	tE+XMfD/qfw+xIaEp67FmSLDs566oIt6sEYQ4UE=
X-Google-Smtp-Source: AMrXdXtW6WSAsHY2urtubBpqEUYNmWPjOPrv7o5+NuFq+49JI+gkGPBtsLqFm9NfcR8xq7hGyg+rdw==
X-Received: by 2002:aa7:8a41:0:b0:585:fc75:c544 with SMTP id n1-20020aa78a41000000b00585fc75c544mr2679550pfa.15.1673447690310;
        Wed, 11 Jan 2023 06:34:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y29-20020aa793dd000000b0056c2e497b02sm10381288pff.173.2023.01.11.06.34.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:34:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/8] oeqa/rpm.py: Increase timeout and add debug output
Date: Wed, 11 Jan 2023 04:34:27 -1000
Message-Id: <e4d2351a2b5aa0c4d900abc5d75ab5da9b5e1f8a.1673447528.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673447528.git.steve@sakoman.com>
References: <cover.1673447528.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175746

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
index 7a9d62c003..2b6cfe5ff2 100644
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


