Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id D8D5577BE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 17:18:53 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 190so7492166itm.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 10:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U1293u5/BjyO68DrhS/Za9iDBhnnxKSmZfHu0BG3zIE=;
	b=iLeU5Pd2OlJk29LKfIn37X1sQoXCrJbM4btmI10F6mXX8Lz1RU4lRnZPDNt6G1Ai6h
	dbdMA0kaKGx3vfLsJYpaEVJ4qtPVXDdfY9WdHThwpbAgTZtQ7BOJCG3VTobTFldUTqWG
	HCMqFvlUpNI/xPdAqV8u8Gd54zg0Ello6HCOrpov0kf0+ZwdUTtmU7OvqgZDnQmoLs/o
	hvz/uv0Mzqnkjf0Ro8x8/rfMPnw2RWWlt5e1KUcWpNJP8orGvRsuhPtgjuAm1APkMy0Q
	uAHqbi3hZBrqb2o/GwF061pAn83i9LmJ/3hMkUwULl46u9Qrm4IN6n7VoY+B+9QXZ0P9
	boLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U1293u5/BjyO68DrhS/Za9iDBhnnxKSmZfHu0BG3zIE=;
	b=BftKolFr8eiF1G28BuH5rub8i0XXYIro41zQcXZ843Ln3XaTSwGHjepBKC+t5KX28M
	TMpvsHnM5RUrbK6F+5qtdATx5/3okCgR3VA8FwtK1Z9Yc5H2IOLBvFNp+NDqQ3UkmxXJ
	Hf+hVde8MmvRJTpIzxFpV5IC3b2r5PQDZIY3lI9Jnb1smVZ5KyvuMKHUE/m+MG5NBo0+
	KmHamVStghrCsZksU3k9EpRklflUwPfqTFuW0nIhB21wLqT+8E2NAjlAi6mLUixfOZhW
	1UPg7OumV/QjP2GZ+A8Mmvkl3Rv1LltZR7AWqinzV9D1paCKu6FF+Eav5pJF2fqUhpYv
	suXA==
X-Gm-Message-State: AFeK/H2xpONr606mcf4m/6j+mhBICOkU7Dj7bsT/d8uIk9WcIcsF6I43LWMnd9N9doHQPaKq
X-Received: by 10.36.2.136 with SMTP id 130mr25692itu.88.1490375934435;
	Fri, 24 Mar 2017 10:18:54 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E2F9.dip0.t-ipconnect.de.
	[93.232.226.249]) by smtp.gmail.com with ESMTPSA id
	g23sm1477725ioi.20.2017.03.24.10.18.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 10:18:53 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 18:18:36 +0100
Message-Id: <00b19f1c84f484676f1aaa04a300c5a51f9ddd42.1490375888.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
References: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/4] oeqa: allow extending qemuparams="..."
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Mar 2017 17:18:54 -0000

Sometimes it is useful to reconfigure the qemu virtual machine
directly. runqemu has the "qemuparams" parameter for that, and the
underlying start() methods also supported modifying that via their
"params" parameter. Only the runqemu() wrapper function lacked
a way to specify additional parameters.

One potential usage is to attach additional disks.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 82c5908..d5607d9 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -218,7 +218,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, qemuparams=None):
 
     import bb.tinfoil
     import bb.build
@@ -260,7 +260,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None):
     try:
         qemu.deploy()
         try:
-            qemu.start(ssh=ssh, runqemuparams=runqemuparams)
+            qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams)
         except bb.build.FuncFailed:
             raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
 
-- 
git-series 0.9.1

