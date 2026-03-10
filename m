Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5969FD88D2
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 23:33:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8770.1773185594121887059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 16:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I3bl6O6k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso19434835e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 16:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773185592; x=1773790392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuCFZ6GqW43D5GCzmc5AdEGRxFKMKZY+4uWmrSOSgw8=;
        b=I3bl6O6k4qiMQgSqz1YjdJw+c7HFHNLypEjaG/7TmMAJhdIDeysnElrDrWAngSQGw9
         9qBIvoVAe8chpdToXI48zQNp2JztlQx653EhK7Gt+HIGFHeofbDW6IgpoUyDVNEcrn4d
         ldloXm571LEyxHnybm04uW2gk+/DKiU1Fsr7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773185592; x=1773790392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuCFZ6GqW43D5GCzmc5AdEGRxFKMKZY+4uWmrSOSgw8=;
        b=uG9QcNqwSCxb2A/xzAhfKjq8nyMRtuuVfqM95OTgyQfvkXmsaYAW6L/FkN0rtDYVMj
         IqJ3m4PffnjO67qxpEJ/0P9fTfeNckoKCFkzwTwo6kJCB/NLKgx2S57vdro1zzGJ+mzS
         xai8+M4DeK3ul6PUBdOaDwZKZYnNxoUvR0Lnb4j4fwQ4ehfTmHvHiMBmbIYNeXlarDxq
         2XkPzZb8bEv2S3TuOhvysKEI04gJT1jQcZXNX8krb2R64XmT65pmrLZkBoBPaYjqXtmn
         0XcCrpLqNffkZMnH6JJpOOu4yNXWBcopbR1D7g0sCXtVAIB+5aGJbyRtve8jT/2CN47k
         3BAQ==
X-Gm-Message-State: AOJu0YxqJEDdJW/OuBCw+g2CSZiBTtYcWMWKlVB783C7kJ782dHJMHVo
	CEfX0wyrZ8uAfl8Nq9Ze20lB4symDx/KUjXn9z9UlVe79j48CjsRj2E1fQG64CpnoHBUymDD9Eo
	0Bt6S4q4=
X-Gm-Gg: ATEYQzyRybFcuBU/Jq8Vs65aYkC/X9H2z6Cvd608YUiqHtCfRLF/1R8NDzfTiOjl0Sq
	vwl+O7944DtNaydh77CjQGORs0Ett3pztY9y2pWg3IamdAP1VD17RHEftM5gdQikhpNVyJZk5i+
	QwDdh8mySRrUdSkJrx9MgZEQwoRP0kNCDIFSOYonkolZ9xCO7Di0mYNXErfmBfjLb+2Hc7zvJF4
	cKEJkmURdnT70zmOnFUbTc38Xley48jKq//njJDx9zRYLUmFnVInh7hnhzSK0ugmq1l9kAls4bb
	2B5pOjIVQds7i693m9hs/kWu6WHWXVVc66/RPLp2nBTvPotGdjWiVi167CZb9ozAx+WPU1BbSMw
	qZRxCczlo9oNrm2pCGkukH4vIfikkDmxzmv2S+d3UKQN2lDO2+vWn0TLLdAfEU1JmGUc4eF4k9F
	KUMSqwE1B8k4gYX71gn5CPPMeLlogaMACAnpt6zIMGfXPI+APMbWs=
X-Received: by 2002:a05:600c:8a0c:20b0:485:4552:8fbb with SMTP id 5b1f17b1804b1-4854b107fefmr6800125e9.22.1773185591813;
        Tue, 10 Mar 2026 16:33:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4968:9824:44c9:31a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a2fd030sm10181445e9.2.2026.03.10.16.33.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 16:33:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] scripts/runqemu: Allow VNC use as a fallback when there is no DISPLAY set
Date: Tue, 10 Mar 2026 23:33:09 +0000
Message-ID: <20260310233310.3364647-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 23:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232829

We would like to be able to fall back on QEMU's internal VNC server when
there is no DISPLAY available. Add code to do this, putting a socket for
VNC alongside the network interface tap lock files.

This won't work if tap networking isn't enabled but in most of our use
cases it will be and it avoids having to invent a new location for the
sockets. If there are needs outside this, that can be addressed in future.

Also move the other "publicvnc" code to be alongside the rest of the graphics
parameters for ease of reading the code. The publicvnc option doesn't
work for this use case as it can't handle multiple concurrent qemu istances.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5587d47865c..00ff77a0ed7 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -581,7 +581,6 @@ to your build configuration.
                 self.snapshot = True
             elif arg == 'publicvnc':
                 self.publicvnc = True
-                self.qemu_opt_script += ' -vnc :0'
             elif arg == 'guestagent':
                 self.guest_agent = True
             elif arg == "qmp":
@@ -1468,15 +1467,22 @@ to your build configuration.
         if (self.gl_es == True or self.gl == True) and (self.sdl == False and self.gtk == False):
             raise RunQemuError('Option gl/gl-es needs gtk or sdl option.')
 
+        if self.publicvnc:
+            self.qemu_opt += ' -vnc :0'
+
         # If we have no display option, we autodetect based upon what qemu supports. We
         # need our font setup and show-cusor below so we need to see what qemu --help says
         # is supported so we can pass our correct config in.
         if not self.nographic and not self.sdl and not self.gtk and not self.publicvnc and not self.egl_headless == True:
             output = subprocess.check_output([self.qemu_bin, "--help"], universal_newlines=True, env=self.qemu_environ)
-            if "-display gtk" in output:
+            if "-display gtk" in output and "DISPLAY" in os.environ:
                 self.gtk = True
-            elif "-display sdl" in output:
+            elif "-display sdl" in output and "DISPLAY" in os.environ:
                 self.sdl = True
+            elif "-display vnc" in output and self.taplock_descriptor:
+                vncaddress = "unix:%s" % self.taplock.replace(".lock", ".vnc-socket")
+                logger.info("Using VNC server at %s for graphical output" % vncaddress)
+                self.qemu_opt += " -vnc %s" % vncaddress
             else:
                 self.qemu_opt += ' -display none'
 

