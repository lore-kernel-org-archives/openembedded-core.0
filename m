Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67F3C54E60
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:23:52 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.16308.1709742232018626276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:23:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tw0Us0Ty;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5101cd91017so9897880e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 08:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709742230; x=1710347030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMdp/eaht66CAgl6jGyIvxyrBtiS4QYXpTxz+pFDNfM=;
        b=Tw0Us0Tyvp6hVDNEJvxRPs/DZ77Xbu+mgmcCT3FWM3QIF0ayGzAxgAWYA7a/kNgSsj
         kCnM/lp1eseGneTs9VGNc/YSCJ1IM3WAqjq28/ASgD7X8OLANVxKUOiYgNCeEDmqHEll
         YVDWo/kn+asiTFWAL2juqZBBC2iO7dNr/nDJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742230; x=1710347030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMdp/eaht66CAgl6jGyIvxyrBtiS4QYXpTxz+pFDNfM=;
        b=YPsTH94SZN32b/oytE7XKa3Kmq47QKITlVeFdfX89YrUSevOXyIt3d3K73yTDMIaUH
         cD6EaLz3pLbahHjxBdx4DiI7q1uwnYl0NRbeyXsB8t1XYWgv6ZoBoA7QoTRbbyCQhi74
         Ubb1FfNVmHGO+43LWgxT39gdEgWddfUdexwqw1A+0TEmwPGnvSBMFc9axwJF//fPwBI8
         brLdFizhDJAoL7pqLv+8KUR64UYp7bkMQ4qRcR3mtELkCrMTAEjwFxSd9nIcKpTJJcJI
         uvfNMyhULfFw8K/4zG7E9bTnTU8mAMWkW9pf5aAmpL9eSoHqUmiLrMVGHIMQpDRFWO88
         qRdw==
X-Gm-Message-State: AOJu0YwilGci5mY3WR/zbd4zk+vctDxfBgmPwKcBadW0+lC0GrPrWqbf
	gC7rjh52QLxTPnagbSfQQfU6Vn94T2miuWLYEitB+kpKF4lymM1OwbCQRlUoBcB33/RvgB4X8ef
	9
X-Google-Smtp-Source: AGHT+IG4YFnw8h6UVeBaHnyzvOGuTJ+EGxrIKKVmPh+3e/TxiTOT0LB5nCXTUSJPTYOBNoeOS9HqFQ==
X-Received: by 2002:a19:644b:0:b0:513:39a0:1fec with SMTP id b11-20020a19644b000000b0051339a01fecmr3446172lfj.66.1709742229862;
        Wed, 06 Mar 2024 08:23:49 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id k34-20020a05600c1ca200b00412f81ba413sm1929791wms.11.2024.03.06.08.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 08:23:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 8/9] oeqa/runtime/login: Add screenshot sample logic/timeout/dbus-wait
Date: Wed,  6 Mar 2024 16:23:40 +0000
Message-Id: <20240306162341.2267587-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
References: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196743

From: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>

This patch uses dbus-wait to wait for matchbox to be up. Once that
happens, it sets a timeout of 60 seconds and takes a screenshot
and compares it, every 2 seconds. If diff=0 it passes. If the timeout
ends, it fails.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/lib/oeqa/runtime/cases/login.py | 79 +++++++++++++++-------------
 1 file changed, 41 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime/cases/login.py
index edbc48ac205..0a662e5d02b 100644
--- a/meta/lib/oeqa/runtime/cases/login.py
+++ b/meta/lib/oeqa/runtime/cases/login.py
@@ -26,7 +26,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 ###
 
 class LoginTest(OERuntimeTestCase):
-    @OEHasPackage(['matchbox-desktop'])
+    @OEHasPackage(['matchbox-desktop', 'dbus-wait'])
     def test_screenshot(self):
         if self.td.get('MACHINE') in ("qemuppc64", "qemuarmv5", "qemuriscv32", "qemuriscv64", "qemuloongarch64"):
             self.skipTest("{0} is not currently supported.".format(self.td.get('MACHINE')))
@@ -66,45 +66,48 @@ class LoginTest(OERuntimeTestCase):
         # Which is ugly and I hate it but it 'works' for various definitions of
         # 'works'.
         ###
+        status, output = self.target.run('dbus-wait org.matchbox_project.desktop Loaded')
+        if status != 0:
+            self.fail('dbus-wait failed. This could mean that the image never loaded the matchbox desktop.')
 
-        # qemumips takes forever to render. We could probably get away with 20
-        # here were it not for that.
-        time.sleep(40)
-
+        # Start taking screenshots every 2 seconds until diff=0 or timeout is 60 seconds
+        timeout = time.time() + 60
+        diff = True
         with tempfile.NamedTemporaryFile(prefix="oeqa-screenshot-login", suffix=".png") as t:
-            ret = self.target.runner.run_monitor("screendump", args={"filename": t.name, "format":"png"})
-
-            # Find out size of image so we can determine where to blank out clock.
-            # qemuarm and qemuppc are odd as it doesn't resize the window and returns
-            # incorrect widths
-            if self.td.get('MACHINE') == "qemuarm" or self.td.get('MACHINE') == "qemuppc":
-                width = "640"
-            else:
-                cmd = "identify.im7 -ping -format '%w' {0}".format(t.name)
-                width = subprocess.check_output(cmd, shell=True, env=ourenv).decode()
-
-            rblank = int(float(width))
-            lblank = rblank-80
-
-            # Use the meta-oe version of convert, along with it's suffix. This blanks out the clock.
-            cmd = "convert.im7 {0} -fill white -draw 'rectangle {1},4 {2},28' {3}".format(t.name, str(rblank), str(lblank), t.name)
-            convert_out=subprocess.check_output(cmd, shell=True, env=ourenv).decode()
-
-
-            bb.utils.mkdirhier(saved_screenshots_dir)
-            savedfile = "{0}/saved-{1}-{2}-{3}.png".format(saved_screenshots_dir, \
-                                                                        datetime.timestamp(datetime.now()), \
-                                                                        pn, \
-                                                                        self.td.get('MACHINE'))
-            shutil.copy2(t.name, savedfile)
-
-            refimage = self.td.get('COREBASE') + "/meta/files/screenshot-tests/" + pn + "-" + self.td.get('MACHINE') +".png"
-            if not os.path.exists(refimage):
-                self.skipTest("No reference image for comparision (%s)" % refimage)
-
-            cmd = "compare.im7 -metric MSE {0} {1} /dev/null".format(t.name, refimage)
-            compare_out = subprocess.run(cmd, shell=True, capture_output=True, text=True, env=ourenv)
-            diff=float(compare_out.stderr.replace("(", "").replace(")","").split()[1])
+            while diff != 0 or time.time() > timeout:
+                time.sleep(2)
+                ret = self.target.runner.run_monitor("screendump", args={"filename": t.name, "format":"png"})
+
+                # Find out size of image so we can determine where to blank out clock.
+                # qemuarm and qemuppc are odd as it doesn't resize the window and returns
+                # incorrect widths
+                if self.td.get('MACHINE') == "qemuarm" or self.td.get('MACHINE') == "qemuppc":
+                    width = "640"
+                else:
+                    cmd = "identify.im7 -ping -format '%w' {0}".format(t.name)
+                    width = subprocess.check_output(cmd, shell=True, env=ourenv).decode()
+
+                rblank = int(float(width))
+                lblank = rblank-80
+
+                # Use the meta-oe version of convert, along with it's suffix. This blanks out the clock.
+                cmd = "convert.im7 {0} -fill white -draw 'rectangle {1},4 {2},28' {3}".format(t.name, str(rblank), str(lblank), t.name)
+                convert_out=subprocess.check_output(cmd, shell=True, env=ourenv).decode()
+
+                bb.utils.mkdirhier(saved_screenshots_dir)
+                savedfile = "{0}/saved-{1}-{2}-{3}.png".format(saved_screenshots_dir, \
+                                                                            datetime.timestamp(datetime.now()), \
+                                                                            pn, \
+                                                                            self.td.get('MACHINE'))
+                shutil.copy2(t.name, savedfile)
+
+                refimage = self.td.get('COREBASE') + "/meta/files/screenshot-tests/" + pn + "-" + self.td.get('MACHINE') +".png"
+                if not os.path.exists(refimage):
+                    self.skipTest("No reference image for comparision (%s)" % refimage)
+
+                cmd = "compare.im7 -metric MSE {0} {1} /dev/null".format(t.name, refimage)
+                compare_out = subprocess.run(cmd, shell=True, capture_output=True, text=True, env=ourenv)
+                diff=float(compare_out.stderr.replace("(", "").replace(")","").split()[1])
             if diff > 0:
                 # Keep a copy of the failed screenshot so we can see what happened.
                 self.fail("Screenshot diff is {0}. Failed image stored in {1}".format(str(diff), savedfile))
-- 
2.40.1


