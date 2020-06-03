Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.9523.1591173538898094518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 01:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bdivH1nj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id x13so1398372wrv.4
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 01:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6mFTZE9xZu3xm6TbDlAb7FNrcpEHRI99hgnbIyeE/lA=;
        b=bdivH1njHAAl/bwURgPZ7HpKvlkMKtiXvIRoM1/N4m9qLKEdApUU0YtKvDxQIHjhqb
         wUyFb2Qom09YhNqhTnGZDAQl7mI9VZx/SboojwsaeUVbWQldwC6UpUbsXoQQb73eoVyO
         bGgb3BFusZhHGWxly0EgCHQpbrnU7Ms5GATs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6mFTZE9xZu3xm6TbDlAb7FNrcpEHRI99hgnbIyeE/lA=;
        b=uYn0SFMkY+OVrI6qg1ubeIGYVFx+1U0FSCzISXD/I+Le0M0c0mIKLBHs/rXiXkF8ZR
         KeXQq3gnrCRSLZMx7/Zr7HzqlWEZJYZX3f0dIya0TK9YbBctsYQBAldufV1vA0/vx3NI
         KtYbn/pLdEEtoEnlGOhaEEZZI4ScQE+PV/nAEMdIFS5gds00W/+HGroC+OipDIKYiAxz
         Y5gxsZJzCVRoQ6ZDnjLXPeujWj8um5D0wU7x0z/76xXBmt7oV+N4ik3FvK5IA7by3BUy
         +4s7OGIcfNm2GDtORZz5pcwbAznja+ytUE2iu02S1ugPhbf8irrof0AKFJSZrIEGFPXx
         BaSg==
X-Gm-Message-State: AOAM532nWng245XHyUD26uw+pVJLadEy1gR407VJl21qFDTmfjBrTTE0
	dIJsFMSziAGK1q52VHlGo/tYIcLLnHAVfw==
X-Google-Smtp-Source: ABdhPJzeWZwv0ScWmwUb/+uQbeYAItAR+fwbS5ulbUnMxhuat54xWXaKVbbxD3Ek2X+HOwWfNajB+w==
X-Received: by 2002:adf:93a3:: with SMTP id 32mr29890498wrp.344.1591173536941;
        Wed, 03 Jun 2020 01:38:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d17sm2468469wrg.75.2020.06.03.01.38.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 01:38:56 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/targetcontrol: Rework exception handling to avoid warnings
Date: Wed,  3 Jun 2020 09:38:54 +0100
Message-Id: <20200603083854.4189969-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're seeing:

WARNING: bitbake/lib/bb/cookerdata.py:136: ResourceWarning: unclosed file <_io.FileIO
name='tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemurunner_log.20200601181912'
mode='ab' closefd=True

which can only be caused by the qemu.stop() method not being called.
Tweak the error handling to fix the blanket exception handler which
is likely meaning this function isn't getting called.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/targetcontrol.py  | 5 ++++-
 meta/lib/oeqa/utils/commands.py | 5 +----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 2aa548e1ad2..7bbba6016b2 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -182,7 +182,10 @@ class QemuTarget(BaseTarget):
         return self.runner.is_alive()
 
     def stop(self):
-        self.runner.stop()
+        try:
+            self.runner.stop()
+        except:
+            pass
         self.logger.removeHandler(self.loggerhandler)
         self.connection = None
         self.ip = None
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index f1679875dc2..df373c41696 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -351,10 +351,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
 
     finally:
         targetlogger.removeHandler(handler)
-        try:
-            qemu.stop()
-        except:
-            pass
+        qemu.stop()
 
 def updateEnv(env_file):
     """
-- 
2.25.1

