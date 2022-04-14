Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693A3C64ED6
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.1590.1649979459518878884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 16:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bZmaigYv;
 spf=pass (domain: konsulko.com, ip: 209.85.160.169,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f169.google.com with SMTP id t2so3137127qta.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 16:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S34ZgUwREO+L2AvAkHxisGNYp25oeLEqYxxxECsmCF0=;
        b=bZmaigYvcYFd+DgLS+fx379Rm9r8+Uh2g2z+F9UAuUJeJQOtK/B4JRmD9RWgzhkZbi
         IqVPeqtGsUyDB8NpkJnZdO+yA1AKqTdCNNaT1X9wVv7nHA3ztyoBJy7O2tFH3JUk4R+g
         P8skMeK3ges+WxlCJeRysXlXP4mgiCnheuQmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S34ZgUwREO+L2AvAkHxisGNYp25oeLEqYxxxECsmCF0=;
        b=bGRf4x9hjEwJW8RaXxx11GnvS0EMO0HVPfA/DYmH+ufNiHvc7F79qr5ooMLYt6Foey
         rpg/n6scUS7aZrIoPCRJmq08NKbFIKA+cmtzMod3vWjsNyJeGC8//9rTES4giyKiszg4
         uHqruwfLgtejJKd0IWZUrbub5J09Uno1RItYwjYU5Nre4K5ABXY0yGolsFnmJ8YwN9v6
         2OurijrwSPCHM6UkQoeYmzQNf+e/ec0tmrdGqIZ94e7Y8p6EOXAcUT+HbYydWRw63+Ew
         oyFxWKdOguR+yc1ISWUzmm0VbJFtwHCgOsPYYTeNNGtadcE8hH45mgxCb4PQDcQrforV
         pazw==
X-Gm-Message-State: AOAM532BcXib+YKYvNsRjMekuXEtSKqTQL5fTS7vQj5nWPvAGyDxzrnE
	5m2Y4kfThPY0l0HcKwMRIudFm948FbdjtQ==
X-Google-Smtp-Source: 
 ABdhPJxy2kOHhHRvrgGIHMBTdorU8m8qiLGwip+O0qM18/hv3xyYRzDlz+HNT8HMi0AYTXDPIT/tUg==
X-Received: by 2002:a05:622a:17c9:b0:2ef:c9bd:b8a2 with SMTP id
 u9-20020a05622a17c900b002efc9bdb8a2mr3709810qtk.246.1649979458198;
        Thu, 14 Apr 2022 16:37:38 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 u5-20020a05620a084500b0069c3797e4fasm1723454qku.131.2022.04.14.16.37.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 16:37:37 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqemu: Do not auto detect graphics if publicvnc is
 specified
Date: Thu, 14 Apr 2022 19:37:10 -0400
Message-Id: <20220414233710.1438692-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164415

The graphics option auto detection logic added in 7f78bb7a was not
checking if the publicvnc option had been specified, meaning that
it would be ignored and the auto detection result used instead.
Add setting a flag variable in the argument parsing and check
it along with the ones for the other graphics backend options.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 scripts/runqemu | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 36af764b1b..6e1f073ed2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -182,6 +182,7 @@ class BaseConfig(object):
         self.gl = False
         self.gl_es = False
         self.egl_headless = False
+        self.publicvnc = False
         self.novga = False
         self.cleantap = False
         self.saved_stty = ''
@@ -521,6 +522,7 @@ class BaseConfig(object):
             elif arg == 'snapshot':
                 self.snapshot = True
             elif arg == 'publicvnc':
+                self.publicvnc = True
                 self.qemu_opt_script += ' -vnc :0'
             elif arg.startswith('tcpserial='):
                 self.tcpserial_portnum = '%s' % arg[len('tcpserial='):]
@@ -1366,7 +1368,7 @@ class BaseConfig(object):
         # If we have no display option, we autodetect based upon what qemu supports. We
         # need our font setup and show-cusor below so we need to see what qemu --help says
         # is supported so we can pass our correct config in.
-        if not self.nographic and not self.sdl and not self.gtk and not self.egl_headless == True:
+        if not self.nographic and not self.sdl and not self.gtk and not self.publicvnc and not self.egl_headless == True:
             output = subprocess.check_output([self.qemu_bin, "--help"], universal_newlines=True)
             if "-display gtk" in output:
                 self.gtk = True
-- 
2.35.1


