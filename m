Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 81E0F77AF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 09:51:19 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 76so3486724itj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+RiQF+LVvaTfX6rTqoBMIXiWTa9kXbUM5Uq/I/zYSII=;
	b=rNMkuRHNLj4MNox6CcIsdIlTao190iQYwnpr+4QusZLPxh3WnTQpYw3L5rUY0qD1cu
	C1Q7kTuCvt3v1c1yzSpXw4isc55DP8wR0PlGu4wx1EVxTu89uoH2+QBpPr9JDlAZMK28
	BGNTSTPTx8SkI8XzifAWPi3bwFq/ZGIaceRijaMrvntMJS6MwVJW2pfAXK2T434qMKzC
	/7FyKehvUNKzspnPaK7gDcyszLCrNTXBDgq1UTRb40Nnc09z3vyCvwIKdXPvBkyDxT/7
	qAyZNTwGOriVuxljolm6f8JWXm8zgqS4p5hZvPoc6zVXl/x4Vu21o30rkiXCfpSlND7i
	II5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+RiQF+LVvaTfX6rTqoBMIXiWTa9kXbUM5Uq/I/zYSII=;
	b=n/l1i4UBS64JiKUD+3Fed+Xw1XF5nkQVP8AGXEn2v3lwYcO2rRvBieIAb+cJIGKJW1
	uSAwwl8VxZoEV7BBmBYEXRhI2C0U2nz97hHH3XUE6WCOJ1T6YdGQ96hQqqLhTIZEIpqY
	Fxmq8AuScTzzJFcgYuGdLXTzK4pzm1BJt3Kwl277+3vfO6oMhjjJdt6eqHa/arz/ByIk
	wUkf2XPVUDu4ylCKTtGOHYgfNihPlA5KIPTPu0Co2BQBV0Y/6/nnHnYvC3AwnlJZgJa5
	/BYCE0oJALoRZ8MpRLo+vlWvk2/6bLGex+8PprkHoYl1nvrfva3iWA0OJe8DB4plxlwj
	gLag==
X-Gm-Message-State: AFeK/H0KgAPBvSlYGgRTTxgFGrSshMVkNL5QgRSuqDqAsKxXJXb6I4gYnT3E8hEtQhr8WRw5
X-Received: by 10.107.132.140 with SMTP id o12mr19339864ioi.181.1490608280102; 
	Mon, 27 Mar 2017 02:51:20 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181])
	by smtp.gmail.com with ESMTPSA id q185sm32060itc.22.2017.03.27.02.50.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 02:50:49 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 11:50:38 +0200
Message-Id: <e3449d1b18764a93f07673e2f16790f710ae65c6.1490608195.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c7547f2eda8922d28653c6746806ea5c16d5a976.1490608195.git-series.patrick.ohly@intel.com>
References: <cover.c7547f2eda8922d28653c6746806ea5c16d5a976.1490608195.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 1/3] oeqa: allow extending qemuparams="..."
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
X-List-Received-Date: Mon, 27 Mar 2017 09:51:19 -0000

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

