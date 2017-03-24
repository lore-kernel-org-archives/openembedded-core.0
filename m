Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 632DD77C11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 21:46:29 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id w124so22081950itb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=J6/o2fN2bJZEYwtHAIfAjWHkA8UeCqaCsYa/5L5seZw=;
	b=OuBeDVYCyFucKrSKX5+tTIk/G6sgm2q3XHPxqNv5DP3rF+3Hl9YqOrKRXhy3uH5eZ2
	9kjpDuQbVStpgmt2zq8eMm/GjErkgsBhr5CM1s9CgEJXy4IisdvkIbNK5TDKOosT44l4
	U24N3uGWyjhBgG+uU34FyAJ21msNywFQ4pwC5NQD8FoCStn20r2/y1c3fmggCq2TtLUi
	1OcIOsF2rt7MeIYXKUvQgmmXH82MnXYc+Uhl0YJr11yrStQLpTJuNX/Zhab4Vo7RcqNS
	H1XnoaaHITBoHqWwXK4zfr1ngudV/KqD853vji1IwPUY63zI/lG3vUNCBojmE6hlF94w
	C7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=J6/o2fN2bJZEYwtHAIfAjWHkA8UeCqaCsYa/5L5seZw=;
	b=praHGg3TwxMia8WqvwkWetOAdoXWM3PxhZjrEx7Fk0DFXVz1YTqP3/RxPm6qRm1hhY
	VWxWjIMUuazOF2/9DY+gecBBXLVlfLM8Er0f/eIqHkF3HP6CYg8GPb9JIcgHbzyCeyLt
	+/TEWwK2K1ArEDu8gxRmfJMSko11dpIgcvJd/DMyuLiuYDPz25BzLnCTBg8vzNHFwhYa
	bpgmFiwSTODl2skihejpy3sH2bNJJWnjioCaEs8cJmIV882whINek0CcXEj4ljVrgG8v
	/y3T26Q211yqeEa51sKsIzD1MB/K8PEJr1R8HLKp3M2z07FVhcOjouH5L1jzCTPifshD
	VOWQ==
X-Gm-Message-State: AFeK/H1pV8PifoU82D8Ona/u+kdqmoUznbfoZ3olvFXdN+0WGccsPRwIpBcitzIsNX+brCg8
X-Received: by 10.107.175.5 with SMTP id y5mr11534190ioe.7.1490391990794;
	Fri, 24 Mar 2017 14:46:30 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E2F9.dip0.t-ipconnect.de.
	[93.232.226.249])
	by smtp.gmail.com with ESMTPSA id 202sm1567370ith.7.2017.03.24.14.46.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 14:46:29 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 22:46:17 +0100
Message-Id: <87b0843150aed0c750bdc7c10bfcce2e5ea70203.1490391921.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.0d2b67b6fd1ebbbb5d2fa788032f2316e484f09b.1490391921.git-series.patrick.ohly@intel.com>
References: <cover.0d2b67b6fd1ebbbb5d2fa788032f2316e484f09b.1490391921.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 2/4] oeqa: allow extending qemuparams="..."
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
X-List-Received-Date: Fri, 24 Mar 2017 21:46:30 -0000

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
index 6528a98..4a71ba4 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -218,7 +218,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None):
     """
     launch_cmd means directly run the command, don't need set rootfs or env vars.
     """
@@ -269,7 +269,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None):
     try:
         qemu.deploy()
         try:
-            qemu.start(ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd)
+            qemu.start(params=qemuparams, ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd)
         except bb.build.FuncFailed:
             raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
 
-- 
git-series 0.9.1

