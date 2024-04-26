Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AC7C19F4E
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 08:31:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.9165.1714120276342345322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=IhoIpOdK;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41b2119da94so15669235e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714120275; x=1714725075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF7PhQXWSYtKsabcPUZdtVqA3N8YYGA+KQC4/PvPUVg=;
        b=IhoIpOdKdTfKWQ01J3BUyhMzQH8oAofPoM/em3Cs175q4SOIr0piIrzfWDrPbuJoVA
         of7csUExrK89KX8dkxjft9krpS4lWXUSukG5gkfuBEWOvOQIYJbjAqAiGEy/4HTtSxDr
         keHoaTdevxh3van0VcoixLoE0p19hi0Hmythr3cuHHsFiO5t6Bpqks+LhJB/t53LTRqW
         JcHuEvSY2pal9ZvLedHbTPS9Ep08BvDjARWg8vMnDVke0vt+y03fKUo6xtEQ4NwGuCNH
         7u1RjnphaboZ/wyvMDF89LXnE+b4syEsS+3CG0Qf6o4Hyzv77ZakWMbIgb6UjnXFNH5G
         nTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714120275; x=1714725075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mF7PhQXWSYtKsabcPUZdtVqA3N8YYGA+KQC4/PvPUVg=;
        b=EutxwoaAMxfVyjKmB5Jn4x2ghPJLLVYuhV4vAashxfwwWvm/8u0u9uVnml+3qhlOSf
         wNy9gX0N7zgp6Og+SQ9mK+Qpn3RkK70CT1jX0D03pLEohf4u+EDNTpLRf+wmVyvnIkR8
         v39i26GtOW5ulwmkinxM0Enq7jOz15tArBk4+92n1n891r6IiZBMRQf/CItcxn+M3qDm
         S9cu3Bp9QVbsQ+PwoS/9lyj5E2xuKKcm3SN+ytKWsGqey88iTOZY26fKQPl0vcuUmD8G
         jpjcvCyD6DpUcQXv5nYz5F+nmgvN46Ul4x9jEtNBNS6PAQPQH+oSP5FlTUZUL1H24Za9
         ljlg==
X-Gm-Message-State: AOJu0YwcLp2cPKv7IefDy1rsjjBVx5ChNOlaYK1+Byrgtky4v8wKSMGN
	NuMuSRVwRyHpSlBWvUjV9ir2fyNh5u1UOgWuLWBY1EYpRrJEqQCq8tK414Jh/IH+WsV8c7pqW1l
	W
X-Google-Smtp-Source: AGHT+IHDJiXhcr4hZ3cJKUrYONVBP8uGxVIe/Si5RfJsxMNoapRLlo0KYmu69z72VGGYFfzXQH4KmQ==
X-Received: by 2002:a05:600c:474c:b0:418:fe93:22d0 with SMTP id w12-20020a05600c474c00b00418fe9322d0mr1403637wmo.11.1714120274724;
        Fri, 26 Apr 2024 01:31:14 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d4844000000b00349f098f4a6sm21685496wrs.53.2024.04.26.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 01:31:14 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Vincent Kriek <vincent@coelebs.dev>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/2] oeqa/selftest/devtool: fix _test_devtool_add_git_url
Date: Fri, 26 Apr 2024 10:30:38 +0200
Message-Id: <20240426083038.8555-2-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426083038.8555-1-alexandre.truong@smile.fr>
References: <20240426083038.8555-1-alexandre.truong@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 08:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198714

This patch is a follow-up to the bug#15466.

As a reminder, the bug was about devtool’s submodule detection
checking for HEAD when a version is being passed.

As Vincent Kriek pointed out:
the --version that is being passed to devtool is only used for
setting the PV value in the recipe. To take into account the tag,
we add --srcrev to the command:
devtool add --srcrev v3.1.0 --version v3.1.0 mbedtls git://git@github.com/ARMmbed/mbedtls.git;protocol=https

Changes to _test_devtool_add_git_url have been made to take
into account the srcrev. srcrev will be passed as an optional
parameter because the test_devtool_add_git_style1
does not need the srcrev contrary to test_devtool_add_git_style2

Fixes [YOCTO #15466]

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reported-by: Alexandre Truong <alexandre.truong@smile.fr>
Suggested-by: Vincent Kriek <vincent@coelebs.dev>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 1f8781a28b..c8f9534e41 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -286,10 +286,13 @@ class DevtoolTestCase(OESelftestTestCase):
         else:
             self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
 
-    def _test_devtool_add_git_url(self, git_url, version, pn, resulting_src_uri):
+    def _test_devtool_add_git_url(self, git_url, version, pn, resulting_src_uri, srcrev=None):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add --version %s %s %s' % (version, pn, git_url))
+        command = 'devtool add --version %s %s %s' % (version, pn, git_url)
+        if srcrev :
+            command += ' --srcrev %s' %srcrev
+        result = runCmd(command)
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         # Check the recipe name is correct
         recipefile = get_bb_var('FILE', pn)
@@ -479,11 +482,12 @@ class DevtoolAddTests(DevtoolBase):
 
     def test_devtool_add_git_style2(self):
         version = 'v3.1.0'
+        srcrev = 'v3.1.0'
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
         git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
         resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
-        self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
+        self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri, srcrev)
 
     def test_devtool_add_library(self):
         # Fetch source
-- 
2.34.1


