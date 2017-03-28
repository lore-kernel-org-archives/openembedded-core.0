Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9903D77A42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 08:02:32 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id y18so9946015itc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w7R7QWekHkJfUzCWXD+bxaXlFv4b46FC1YpCaCQNzIQ=;
	b=jK+7k/5xT2tgByp3h6WB7MDnIg94kDJcZ/62bqegRpz0dW8fyXI4OSrdhqqGBb1Fx6
	1rbgJktH3MpskYzT9X+gAdQHpATCM6qpPcCvBFb4SZ9n7+8CaUbbf9WvKybaI2ePYxXs
	lg+4JLPJMnzWVQO63Dnip1Rm12EAkUFVbo/YlY5oi/74bMgR/nC5CLO/91LezLXQdk3e
	u9x9y/Tmu1OxTkIRFplP/5V1q8TIFgkW2aK7VwJ6RLAZzizEefeWteo/CRD8PAMnwPzo
	luHwC/rqbewNYm5axZGqe0+vV+cPVWhmcb9dOxKFuQoE/ZCi/0/1cstzd3LaQcrFABiE
	HpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w7R7QWekHkJfUzCWXD+bxaXlFv4b46FC1YpCaCQNzIQ=;
	b=XXalq55gy0pNvCghTva4UfQTfB3dh415+jvVm2JLC9+b1n2qCUKJ+oAXCjMKKipP20
	XHFm1ys4dVGzwO+tA30MTrL5sKiJOanUGTRWRYtnGzzJ3QMxvbfCvovyBn66/LYR7zRT
	IQmwPe4HyzXQYYm1M9hh7wuMjpnKa5vQdxEvJgo/FA5bBI82iSHuiLEp2vIHw6j5YnYZ
	Q5+V9OWhvD3nd14P5ZY2ImUQKEfGjhMYAXtWiSBAa6xUm1PitmIcZsY2514/uRbf/87k
	iptukH7wNIaO6fQcSt/xJcYgDBfYTX8zHsm1M6LTFovX6Fj812eTY5dfzt6N3hFOWog1
	zUlw==
X-Gm-Message-State: AFeK/H2psGadTV8yga8dfE9kzITYwarN9PAL6W7pHOMpVWAWugjg2PVgpNVvKuOBZ5nc0nzW
X-Received: by 10.36.41.81 with SMTP id p78mr11670761itp.8.1490688153362;
	Tue, 28 Mar 2017 01:02:33 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2BA.dip0.t-ipconnect.de.
	[93.232.210.186]) by smtp.gmail.com with ESMTPSA id
	k186sm1137867ita.30.2017.03.28.01.02.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 01:02:32 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 10:02:18 +0200
Message-Id: <aab703e3ac32cab1078669e867eb15f39b66abeb.1490687992.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.dc1fc462863c093e384c22eb65a3a07dbc6f3004.1490687992.git-series.patrick.ohly@intel.com>
References: <cover.dc1fc462863c093e384c22eb65a3a07dbc6f3004.1490687992.git-series.patrick.ohly@intel.com>
Subject: [PATCH v5 2/3] oeqa: allow customizing image used by runqemu()
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
X-List-Received-Date: Tue, 28 Mar 2017 08:02:32 -0000

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
index 3dfff0f..88c9bb1 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -225,7 +225,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}):
     """
     launch_cmd means directly run the command, don't need set rootfs or env vars.
     """
@@ -247,6 +247,8 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, 
             tinfoil.config_data.setVar("FIND_ROOTFS", '1')
 
         recipedata = tinfoil.parse_recipe(pn)
+        for key, value in overrides.items():
+            recipedata.setVar(key, value)
 
         # The QemuRunner log is saved out, but we need to ensure it is at the right
         # log level (and then ensure that since it's a child of the BitBake logger,
-- 
git-series 0.9.1

