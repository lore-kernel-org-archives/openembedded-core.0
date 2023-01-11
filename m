Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D85FC677F1
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:22:01 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.28316.1673454119058532657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iJg7xpFa;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so2657883pjl.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 08:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8j9VfP4ErpODbwk/8DTnL4XJJs2P8QxEvwBNxPAwKsc=;
        b=iJg7xpFauHxovlnhJC+qZz2sDmAwD85OTqQGTCLiUtffpMofjGLQUi3N4saHDvg4nA
         JnsiFK2KX9ZGcOy/AgyZQSpo50bA7NIteBRzCll4+m7TX2ZpIsdhmHRQhUa8fyY0+hlB
         SU8N2i32o6q4+s0WrtKaPoGQwoEIyiJs/2q8VynLSJplvBDOLOLVBXvu20rNJgfhtE/o
         TC86zNsNxmbUIRb9cZZHHf0Tr0OqyX9uKdN5td/JET765ZIyU8dOTvFxjbOCvwXCHFQl
         ySf+CN/u25aMtnAGssgMQcEi9+Xw6Dn8/t1elvSIYHdLkp32TGMR8V74EyPN4vYWnfxd
         Y5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8j9VfP4ErpODbwk/8DTnL4XJJs2P8QxEvwBNxPAwKsc=;
        b=487FlDV0nuLY+fS395p6DBAt4DXe8q/9cyAs4iEHao0JRudiKB/dRMz/h3uuGMRLlp
         KG3ssJW+11qm7ChFZZ+2mnHq7SDxrbiD5ch7DB2igi29GalMiFFdVrEMT48OWvxfHhMU
         zy3fmJmA7doDtFQ5N+E0cnv5/4HeiRpXi76fDJiIzYidOusQfvC2vcM3tYmkV34nhlIo
         C5p51OxXrVTo2UK/CKPFRj5O36vkxSb5Wmlo9Ms2RhjSRnFWT9OlzmiDoLu0p0sEWDWe
         MlSdhzKJa9l15bYBQy06JYtDQkpPFDK6L7hBrxPd3z+yHhW+vgg2eR7GOUDwobl1GQCO
         IF0Q==
X-Gm-Message-State: AFqh2krCnDBqjT+xFskFaTVzC79Hu7hqJ35CtXRMy3LWfbaob7m2xkQW
	GU2v+F8vBdbAJ8JoaAn9avj5k3rlyg7gnIuvCeA=
X-Google-Smtp-Source: AMrXdXuB311bpimH1NVwgyTRm2VbnyjomLte4jh5wNPJHTJBO3MmSAt4feBA/RVoHKfNa0YF/JRebA==
X-Received: by 2002:a17:90a:a884:b0:226:7ec6:8a53 with SMTP id h4-20020a17090aa88400b002267ec68a53mr32270398pjq.14.1673454118133;
        Wed, 11 Jan 2023 08:21:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id u14-20020a63ef0e000000b0046feca0883fsm8685384pgh.64.2023.01.11.08.21.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 08:21:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/11] oeqa/rpm.py: Increase timeout and add debug output
Date: Wed, 11 Jan 2023 06:21:34 -1000
Message-Id: <ed2c94ae744331a1e977dd4e02005390a84cd5be.1673453368.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673453368.git.steve@sakoman.com>
References: <cover.1673453368.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175764

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
index e3cd818b2b..fa86eb0537 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -51,21 +51,20 @@ class RpmBasicTest(OERuntimeTestCase):
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


