Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBBB72F7D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 19:39:22 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id e75so32360787itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 12:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+RiQF+LVvaTfX6rTqoBMIXiWTa9kXbUM5Uq/I/zYSII=;
	b=FZ9AOHEK2MZoewhFZMNo9BBzC8haeRAEq0gFqWil5JEu9xKiLH0IUvgWWorA3Ff1h+
	n19mxZO0p+2QcrpWE8EpOGNoMN7oqPPq1KO5QmQANvcc0JdQuKbSVLdsvk+V4Xe0XV0T
	3qURkeiei8D3TFo718WPOEmM69ed1AjHzbS2gybcDw7ppcCJFdFbgKMRhU571c7v3jiY
	nuwX3BwjJkmm098HtV66U2EhQ7y5aQzPtTTmfmKTsTQ7YmppcRna8nOV5XfQcNn5ouzZ
	qKtr/TUdHmhzNIGnvYy0Eh8DrQkCyjNFksx9TXpN6h2++DqeE73w9De1O8HIwf2ne3td
	OTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+RiQF+LVvaTfX6rTqoBMIXiWTa9kXbUM5Uq/I/zYSII=;
	b=YuKiZ6KyaQVX9rDFZhEBpTgu6lvIUsa049ToVSXXVJo/qNQi4TMlErrUfR20VacSUw
	A+YeVcMd8sjaO3vouMqDq2DgFZcTbEKECd+Uu4qsv/h3hsEGQvaOxSfSAzjt5DwrBJus
	D1G18amHnpzKy3/RDQlabIUVLI6SCj+DiHdWd/+9CIXdEqU38+6XNpmRVDlRamqexqhd
	l8yyBM0PWTKHCiJDftUMfrqHaCMeTjLjfyn6Kxxe7aYNaLvGVSvwXcpVB9u6yZwalnwj
	HQxUhweM/5UpgCbBGdtOO/S+hccC4p0a3YC3ccvBFK+IkcM351J1OIP4Pvb2M31Joery
	H8wQ==
X-Gm-Message-State: AFeK/H3QLG35bsN8u4TejkmVWsPGzcAvzCdwnR5FTTLTRVH1/cksOXzqdtDHS/IxFSxycVg3
X-Received: by 10.36.7.66 with SMTP id f63mr11915938itf.83.1490643563284;
	Mon, 27 Mar 2017 12:39:23 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181])
	by smtp.gmail.com with ESMTPSA id 17sm698073ioq.45.2017.03.27.12.39.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 12:39:22 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 21:39:12 +0200
Message-Id: <e3449d1b18764a93f07673e2f16790f710ae65c6.1490643522.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.e904b46a3797bd3e32fa34431a5549f485271170.1490643522.git-series.patrick.ohly@intel.com>
References: <cover.e904b46a3797bd3e32fa34431a5549f485271170.1490643522.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 1/3] oeqa: allow extending qemuparams="..."
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
X-List-Received-Date: Mon, 27 Mar 2017 19:39:23 -0000

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

