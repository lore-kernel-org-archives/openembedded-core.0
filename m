Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.10305.1587905509639554162
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 05:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C1reHDBo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id f13so17148655wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mZt7nV/MvLRVP1I37xIX+eL+YxfOAqrc6kQqfn2w6jo=;
        b=C1reHDBo62fWGjdjtd0I7u6/7O0v0YgHZuaOOC6DcdyRZ+Hku2kZleEaBkKLG23nhr
         f/AKD7hFgNpfYuUxQpiCrrKgleR4T2Gvs3agFImCCl78/1MVfIVbqmXBrRLPMC289U0g
         ek+vShr+jiQkTd72aeeRZLHMnILnNDvMFx/CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mZt7nV/MvLRVP1I37xIX+eL+YxfOAqrc6kQqfn2w6jo=;
        b=WWRpWvd/Naar5psCgagaxHydu4+owfFLM8s2/IksmQXupqi/CyjpBKXm+13SH8Roj0
         K4Yusz2ivraa3uJWZ/E9JMou008AmimDxBET8JaZnDYuiRxlH9me5gFSyuR0OhgsyKoH
         SGYMqOjwK4Xk4oPN0bZkFTGdTKmav7ransuCzdtUs7CyuTdJUQYcPATds5zXZjtWuiw7
         bx6hdcXSS8xotTjrBxCoh3Ledcz/47Q6UgFmPVESCwX7F/gFyLmyS0k09IyiB3jztJeG
         TCjAoA2NuqSSpo1O84zZcuKZv2hYvl4UceMOcj5HK6DKQbYwRC/khCaccr0sB5mt3hUy
         FCLA==
X-Gm-Message-State: AGi0PuYBgs2FAVOBCO9nMUJYToWIh6UqyGiN7DgmgNnxnPH5z6at3o6+
	J4oZimkpkpKgVEs42aV+/V0h6ZbHYnw=
X-Google-Smtp-Source: APiQypLPYvMytYYJN760Pg7NAjpLDXTDoZY88EPsp2l5mRo+JR5BGK70XhgILkkBaYp0aygohDsmAA==
X-Received: by 2002:a05:6000:10c2:: with SMTP id b2mr23529789wrx.118.1587905507783;
        Sun, 26 Apr 2020 05:51:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r2sm11397385wmg.2.2020.04.26.05.51.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 05:51:47 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] targetcontrol: Fix leaking log handler
Date: Sun, 26 Apr 2020 13:51:46 +0100
Message-Id: <20200426125146.1110969-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We had a mystery failure on the autobuilder where runqemu appeared to
be failing as a logfile directory no longer existed. The key to
reproducing was running a runqemu where the image was deleted (as
devtool does), then running another runqemu test. E.g.:

'oe-selftest -r  devtool.DevtoolExtractTests.test_devtool_deploy_target wic.Wic2.test_qemu_efi'

This then tries to write to the logfile from the first test, the
image directory was deleted and we get strange failures.

The fix is to remove the logging handler when qemu is stopped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/targetcontrol.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 0b2915d5ccd..2aa548e1ad2 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -117,9 +117,9 @@ class QemuTarget(BaseTarget):
         import oe.path
         bb.utils.mkdirhier(self.testdir)
         self.qemurunnerlog = os.path.join(self.testdir, 'qemurunner_log.%s' % self.datetime)
-        loggerhandler = logging.FileHandler(self.qemurunnerlog)
-        loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
-        self.logger.addHandler(loggerhandler)
+        self.loggerhandler = logging.FileHandler(self.qemurunnerlog)
+        self.loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
+        self.logger.addHandler(self.loggerhandler)
         oe.path.symlink(os.path.basename(self.qemurunnerlog), os.path.join(self.testdir, 'qemurunner_log'), force=True)
 
         if d.getVar("DISTRO") == "poky-tiny":
@@ -183,6 +183,7 @@ class QemuTarget(BaseTarget):
 
     def stop(self):
         self.runner.stop()
+        self.logger.removeHandler(self.loggerhandler)
         self.connection = None
         self.ip = None
         self.server_ip = None
-- 
2.25.1

