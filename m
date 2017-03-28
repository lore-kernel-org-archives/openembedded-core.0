Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC8977A57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 08:02:29 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id 190so9962124itm.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+RiQF+LVvaTfX6rTqoBMIXiWTa9kXbUM5Uq/I/zYSII=;
	b=LP/91OnR92nFAM1MvSxOJqVRIJbxgQzO75Ru/d48Jbr4i+hMASO9DwcIr39aRXmksS
	792p9TVG7v1NKZD7RhMe+Bgv8cQ/bpz5dpdj9HAvKl+McRuCVqKnu0GeqGggK0bUkQh9
	LG91uig8/vIOHMBDgO42EckfxX+S5Nu8pGurAxfmd/pqKU8AuXu1DHWYZyfY5eXR7rVu
	ZlHPiFec0LKnqsN0rmxXTItLdx0QvIUu3bUuHl6UTNFOEQ5X5avpr1eUeTGh/H27efX9
	uoOsCwSr3FVWd4y0DhOlRiwoHxKei9XnVGtQ5h2KtlJtHNqeVLQJFJtW9u6pmfIUSkK9
	D3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+RiQF+LVvaTfX6rTqoBMIXiWTa9kXbUM5Uq/I/zYSII=;
	b=ea3pw9akMfaYAlyVbvp2it4PKFagXugWC2gNHqTuWKKM8IzCoiv3ESQrsUmFcjfyI6
	cENOTbE68amteKpFHNvwkpduKOjkWliF8U2flzVnSOVhRBNv+FAYcqEBdIkbywkY+WVu
	W78ep136qRN20LNz4SUjYhUq50U8+IUG2P4TC675sQlPxH0Uc9H5ckPp9DuPQoNwRBLA
	0FE36ObdjBGS+xHs044qPA6QeOX/GyW89hV2cibBU9jR5jvmG3akqGWca9s6JMdbupoE
	J41miKQr+W9RbmoEOEM/VlNHtc5/Zb98iqN1YYZo9P3rlo1n/u8xel5BzqZIDpDAgpjV
	JTYA==
X-Gm-Message-State: AFeK/H0ctIF29qK+tRt3qmYfR48bf0N3YG1cm2gr75icUt3TYkDLHyqH97XMAwdaF/Qvc2Pt
X-Received: by 10.107.166.207 with SMTP id p198mr24960603ioe.15.1490688150397; 
	Tue, 28 Mar 2017 01:02:30 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2BA.dip0.t-ipconnect.de.
	[93.232.210.186]) by smtp.gmail.com with ESMTPSA id
	k186sm1137867ita.30.2017.03.28.01.02.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 01:02:29 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 10:02:17 +0200
Message-Id: <e3449d1b18764a93f07673e2f16790f710ae65c6.1490687992.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.dc1fc462863c093e384c22eb65a3a07dbc6f3004.1490687992.git-series.patrick.ohly@intel.com>
References: <cover.dc1fc462863c093e384c22eb65a3a07dbc6f3004.1490687992.git-series.patrick.ohly@intel.com>
Subject: [PATCH v5 1/3] oeqa: allow extending qemuparams="..."
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
X-List-Received-Date: Tue, 28 Mar 2017 08:02:29 -0000

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
index cd7a5e3..3dfff0f 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -225,7 +225,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None):
     """
     launch_cmd means directly run the command, don't need set rootfs or env vars.
     """
@@ -276,7 +276,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None):
     try:
         qemu.deploy()
         try:
-            qemu.start(ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd)
+            qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd)
         except bb.build.FuncFailed:
             raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
 
-- 
git-series 0.9.1

