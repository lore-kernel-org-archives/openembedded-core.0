Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 859BE77C13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 21:46:32 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id y18so8102722itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wurCKaN6d/sD4pVT0t4XGqGjN3q12tKk3vGuBXDxVUA=;
	b=C0ak7FKebZsdAvYqiL/SuUi2DWOhRF4rX4kaSPAhbCvCXhblpaT1PWWagFDn56ZmeL
	Woy2d4xtDgcIL4kWkh/noXfktwz8ZdbFD/SaH0eiXRqhIgL+Y5VKnTxlXlpWy87bmEMd
	V42kisgZ86wQJOxSoL2L2o1dvAwSNzqFvbo2gEPxhL0MEi2b80+8Dlv2bWWQ2FuezHEv
	WdGw7D2r8whwOWUAUrHQyjupJE4WqwcxR4AHK+Dh6pIiG0YGIbmsODOwL2+3sklsy9H0
	wUGv6zov5dLBQrZiurDzaXRGv3t6AI0XahdbXWIFTJHmhshzkduK20DhgjR1tRknzyCi
	YxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wurCKaN6d/sD4pVT0t4XGqGjN3q12tKk3vGuBXDxVUA=;
	b=a37iV6J5mW9/QdR0ZMM/QwImQfKzkgRjx7BK9jGHiBwswxwhVteTS1Laq2ecJUltcB
	uAaUzQQzJaw/QU0FxVyIyQBvsY7Ht6kvpJTfWRLgLy0AervP0iGr2SaupGskZQjPclGh
	8wKh4u+NV5USp8r5SHuQKimR4gA5L7p2on+hsKpgaNw/DAKi6GPfDOzkIIwp/Z3lG4GX
	XjIygGZN73sUZHDFASxvjmn6lHuHYkbrCsZlykQ6X7cDf77X/cnNuu4YuUNLIaehm1hB
	4MDJWdfmrLikkZ7/2W4YL32WO67Ux80leWBn0qpgZ97em24IwLfXATz2PVMWqFBvXFLq
	O+Ew==
X-Gm-Message-State: AFeK/H3YikO0dbw3r9JCCif7wZUTmXe/0Pr3WbUdU5Tmi4rg4PILdaBl4/iLcXaI87SS3gdI
X-Received: by 10.36.47.75 with SMTP id j72mr4987306itj.7.1490391993602;
	Fri, 24 Mar 2017 14:46:33 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E2F9.dip0.t-ipconnect.de.
	[93.232.226.249])
	by smtp.gmail.com with ESMTPSA id 202sm1567370ith.7.2017.03.24.14.46.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 14:46:32 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 22:46:18 +0100
Message-Id: <6ffd0229f29bcf612531911203c7d754f2abd50c.1490391921.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.0d2b67b6fd1ebbbb5d2fa788032f2316e484f09b.1490391921.git-series.patrick.ohly@intel.com>
References: <cover.0d2b67b6fd1ebbbb5d2fa788032f2316e484f09b.1490391921.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 3/4] oeqa: allow customizing image used by runqemu()
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
X-List-Received-Date: Fri, 24 Mar 2017 21:46:32 -0000

runqemu() takes all parameters for the virtual machine from the
variables of the given recipe. By allowing the caller to provide a
hash with variables that get applied locally, the caller gets more
control.

Here's the intended usage:

   <prepare internal-image in self.resultdir>
   overrides = {
        'DEPLOY_DIR_IMAGE': self.resultdir,
        'IMAGE_LINK_NAME': 'internal-image-%s' % self.image_arch,
   }
   with runqemu('refkit-installer-image', ssh=False,
                 overrides=overrides) as qemu:
       ....

This can be used to replace the image completely with something else
or to copy it before allowing runqemu() to write into it.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 4a71ba4..9bae48b 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -218,7 +218,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}):
     """
     launch_cmd means directly run the command, don't need set rootfs or env vars.
     """
@@ -240,6 +240,8 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, 
             tinfoil.config_data.setVar("FIND_ROOTFS", '1')
 
         recipedata = tinfoil.parse_recipe(pn)
+        for key, value in overrides.items():
+            recipedata.setVar(key, value)
 
         # The QemuRunner log is saved out, but we need to ensure it is at the right
         # log level (and then ensure that since it's a child of the BitBake logger,
-- 
git-series 0.9.1

