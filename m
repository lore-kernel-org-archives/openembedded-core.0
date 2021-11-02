Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC4BC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 19:59:15 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.619.1635883154130444599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 12:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=wnAiUU1r;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id bj20so170827qkb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 12:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kIOiQmVgqV+EXYFaSC91yd/H8p23mN8SXo49K2KeHCs=;
        b=wnAiUU1rJHss6DzoCK3tgiwFUry7XMDkHXjh5+r9uk0BpA+UMVYMOlMyUjWS/G8tpj
         8zLJnnB5UVDD8Lno6Ey3uOSWzw7HFsOF/IrD7e3TUlPWb8r4VhrjpnPAVH9rks7J6g0I
         AiGNQSGLdSKzIGK/H9AIF1ho6vGsnLUJIQPnXP9oow2cQDhSw1cubozfalUEcmZ+Gqr8
         msTawvz1iieUn93cOtWdkfrwuzmBLAjpB0RVTjtJisAIX9zdrOsBO6W96EBudZkfMoWQ
         ko3dkpK0+mhCakLyaX1+gwtnpldP4oz51IcXLfD4BkZu+0vNnA9k/RPevXIeoGwrQOWm
         PcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kIOiQmVgqV+EXYFaSC91yd/H8p23mN8SXo49K2KeHCs=;
        b=Ndj3aoJ61edlOKyLEqWvZsQtM/pXmxLs3xsrGTILHprrW2lFYSDaaNOKfhwrkG6q9M
         Sez5R+RCJcser6/76CUNxQpVcxJgmzw+Ef4E9ov3uLE1W2XYyN82KJLCtQirWhGcvWiC
         mhG5/kdYT1HI6ieOHq8CIimhEJBDWPAjO/dijBa0E6AQU1iQdejSaGXqzhkTk9WOqs2d
         aRZvuKgPIh3PrgZxdr0w4r/myqwuIcZUhkRe2suhaSdEP8nLrhGdpDYXIMFO7VUH0oWk
         vW8ABVtcT2vqGdZXgau+4CwLpOkA+78+XzEpZsMcDdI2snC9klMPB/cyYScOHeJhCwbT
         sNcg==
X-Gm-Message-State: AOAM533NJkRK+RVeQyG7nXw7+FfIbqMSBxGwS829NDu6NLwZ7pXjj4/O
	T7x1G2q1/TfVGlEcdJvDJUn+VnP3gETaSg==
X-Google-Smtp-Source: 
 ABdhPJz+Re8NuAbrgiGpQvw2Rn1vU05BfDlhLKQ/cLefTwcrqWYmHnryDTSE9bRMzydW0Y9vsohAPA==
X-Received: by 2002:a05:620a:8da:: with SMTP id
 z26mr1675241qkz.362.1635883153101;
        Tue, 02 Nov 2021 12:59:13 -0700 (PDT)
Received: from localhost ([2605:a601:a618:1500:a815:3946:1dd9:5c5b])
        by smtp.gmail.com with ESMTPSA id
 u15sm13775102qki.99.2021.11.02.12.59.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 12:59:12 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqemu: work without SERIAL_CONSOLES being defined
Date: Tue,  2 Nov 2021 15:59:12 -0400
Message-Id: <20211102195912.323-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 19:59:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157813

Not all machine definitions need to have SERIAL_CONSOLES defined, but
runqemu currently will fail with the following script error if not
present:

Traceback (most recent call last):
  File "/builder/meta-arm/poky/scripts/runqemu", line 1604, in main
    config.setup_final()
  File "/builder/meta-arm/poky/scripts/runqemu", line 1446, in setup_final
    self.setup_serial()
  File "/builder/meta-arm/poky/scripts/runqemu", line 1381, in setup_serial
    self.kernel_cmdline_script += ' console=%s' %entry.split(';')[1]
IndexError: list index out of range

To get around this issue, add a sanity check to runqemu to avoid the
parsing of SERIAL_CONSOLES if empty.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1143509975d0..d4f0888f8da2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1376,7 +1376,7 @@ class BaseConfig(object):
 
     def setup_serial(self):
         # Setup correct kernel command line for serial
-        if self.serialstdio == True or self.serialconsole == True or self.nographic == True or self.tcpserial_portnum:
+        if self.get('SERIAL_CONSOLES') and (self.serialstdio == True or self.serialconsole == True or self.nographic == True or self.tcpserial_portnum):
             for entry in self.get('SERIAL_CONSOLES').split(' '):
                 self.kernel_cmdline_script += ' console=%s' %entry.split(';')[1]
 
-- 
2.20.1


