Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D152CF8844
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 11:24:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32017.1763637869252001451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 03:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihkFdkcC;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso13211385e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 03:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763637867; x=1764242667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=towQDHuBiW+qFIzhUUc+r4E2bazO60gVWb0ngI9EloE=;
        b=ihkFdkcCnbormmGvfeW3caV9TQjD5CrUr+yII0Hng4Gy7C8v7PmAvTLl3dFKyd6e3z
         j/5OpC2/aot/3hAQDehb3wVjel7ihdqJFzujf1rYZty6Jo9Zju/y9DjGvHiTfVVW8V08
         i+a/rsMWGGB0wXGgHyLIRzZr2QjBt3cVc7fyPVhL8L+Pfp6l6q/SxPNg+IGfZhXroUyl
         PGIYpvv1vrGbtX0QpEguHX67RprCiS/2tfN2rSk6JudloerM5RF6wMhiNdkrmBeNU311
         pfsTec23gpNdsLZK7CXfa0mcmOXb3nCaikiI9ntJtpjNKRBv/A+VeTiDXJAiGXgC1XG7
         Tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763637867; x=1764242667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=towQDHuBiW+qFIzhUUc+r4E2bazO60gVWb0ngI9EloE=;
        b=pgtwPPG2TODKWtE694TfUBGoLkuQVvp6hSqhCXoQYIF7pFN7wuKwzY1BO+mcG4nrds
         4T3nVWnNph4TzaPyo93t52alyeE6KEjtqCVZBviB42k6nIKh/V1QAr9a22RH0HAnDnMM
         kOr+hrfidtSVXAJHx29RVzMuI6xyE+4cQptUoA7hrV7dx/FVV58CCt5IouCUmBSSIQT3
         rzCjmt0tc4WyM2uGEs15VwAZ2/SlalePheEUPBrlf2DKPnLabFhvWJ/Ivf61VXqJa8CC
         Jot9AjH42NS05xv7jU8AgIiqgamBvYE7c2ANa4i6FOqCehxkArnQmty7vMWYseVos7NX
         OMYw==
X-Gm-Message-State: AOJu0YyL+FrmmnUavbKHllZ9byzL9vtob0GLEhYVtccZsRC9IY6rLYrJ
	FFNqaOkp1vB//3ATdEoW94oYUdvbK0tVCBZ65jcIZgWcuAKfvFbXsGjnEzC64g==
X-Gm-Gg: ASbGncuuTlwVmO6FBm7eVU/r5zFVbJEGviyWQz98NGvo+e0Vg/kRIJbEda1G13Gdr2A
	z2TdI4NOzVlRPR0pVdrJcAsZYpi1yqkJaEI3LrqTudaZsCHx/WxnGdeoc0PMlVGRZHjmIOp29Fa
	rWYOKcDgZTQoWp+aZqtCyrpiIIlZLko5CQIUdtWkXAwg/yAbK2SZ3gmB85uYwDTrx8tnPk8thjb
	yqQWlUp8xvwmZkOHwvEleC27Kk95we1sNk6up4NQ0nIHsMpfj+9FZ0umxJWf+EACAbcoOlIJR7d
	VVOvtEMNBEG82O40aHhdjQIrXXYlIde60n/TUyWx9OOf+YkdhtPn9N8hFh3mhaTuYeWhpKPQH9w
	2BFu1fxogoH+CkbXRYDyuzfta/lghIe9xUgOCPwBQXezhIQ7wXWRDkmhWLu5kUJNTFrGkDWCbn6
	3YCWHMZ1MCqhYfiu9w1NDo2FCaRMXwTSQg1YEMfAFzz5EF0Sg=
X-Google-Smtp-Source: AGHT+IHvmKawzj6adXAAPgLQHfrWZVBMWJhFZj8oNWKAQBfQCLGykE2n2OXYZYeTIENzsPfObZwRsg==
X-Received: by 2002:a05:600c:1987:b0:471:665:e688 with SMTP id 5b1f17b1804b1-477b9ed0b1fmr22995645e9.17.1763637867518;
        Thu, 20 Nov 2025 03:24:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b831ad9dsm42485555e9.13.2025.11.20.03.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:24:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] bbconfigbuild/configfragments.py: add information about enabling fragments to toolcfg.conf
Date: Thu, 20 Nov 2025 12:24:23 +0100
Message-Id: <20251120112423.137726-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 11:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226613

From: Alexander Kanavin <alex@linutronix.de>

The info was first added to bitbake-setup, but this is actually the
correct place to do it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bbconfigbuild/configfragments.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 6fdac33a5da..fe2c629d927 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -115,7 +115,11 @@ class ConfigFragmentsPlugin(LayerPlugin):
     def create_conf(self, confpath):
         if not os.path.exists(confpath):
             with open(confpath, 'w') as f:
-                f.write('# Automated config file controlled by tools\n')
+                f.write("""# Automated config file controlled by tools
+#
+# Run 'bitbake-config-build enable-fragment <fragment-name>' to enable additional fragments
+# or replace built-in ones (e.g. machine/<name> or distro/<name> to change MACHINE or DISTRO).
+""")
         with open(confpath, 'r') as f:
             lines = f.read()
         if "OE_FRAGMENTS += " not in lines:
-- 
2.39.5


