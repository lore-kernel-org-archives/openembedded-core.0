Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id B16D972F5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 19:39:25 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id y18so87959250itc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 12:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w7R7QWekHkJfUzCWXD+bxaXlFv4b46FC1YpCaCQNzIQ=;
	b=LB3n/mIiCO7nob3hBoC1lQEdVfMSZ/Ehz1/lhZvKkHyBLm3y2a3uLhSx5vttbOXqkU
	ItKc7jjtZLgan+fs78epge5eMEZli7BoAeFWyOXwGGYv687U5eRLSyz0jeDJu/DEYMGn
	M7K+OfWNZWb5za78jWW5WSAef0ozGR5X3KkuLP2/9iHSIkXUKWgGdwYvyhwOEk57CMiR
	EztL0hw2ePZWUKgaRujsw/WdqIxrawKtL6qdDTW5n7LcTDN2kpgFgbfl45NGhUKV40sS
	1XF1u1iCKaqLH63qQRDvSgIpFGIs5JWUD2IXrC0OTqvlX04tl73UWhP7uQRc0D5SHAfB
	VcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w7R7QWekHkJfUzCWXD+bxaXlFv4b46FC1YpCaCQNzIQ=;
	b=AGFCDKhaZPv919RRXpblW+tIVodooYcxNIZCr0fVDyBUore7e5J6hro+XktHBfAmJL
	vkac5ucHmHAJV1+7L4CtkIo8/LpPLSQipk0bg43qJyJQn/7a3wH4gyxbHJ8WIvSLOD+y
	HXugMkqx4C0h5XiYlLz2f950fLf1e1tADo5N1N3IWM28DxOIKWvIs4RGcHxT9b6NBAsE
	aiBWfwb1JqLRim2IAvRqGj3LmvtpPaCwvD1EKzLgS2L3YD2zmKnvVzf/N2gVK2dgIauo
	1YfgYbTcH3gHECmWy4y/biDnaevfj6krIOsCOVBv5zVLMC84OVae+EUei/OacFLbpGvN
	p1jg==
X-Gm-Message-State: AFeK/H3jI4VdeczU/dVCzS3EtHTgBh2UPyJM0OlaQWZGhowkLr8gO9wkcNV09gRJksH8F6Dz
X-Received: by 10.107.35.211 with SMTP id j202mr22693299ioj.158.1490643566669; 
	Mon, 27 Mar 2017 12:39:26 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181])
	by smtp.gmail.com with ESMTPSA id 17sm698073ioq.45.2017.03.27.12.39.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 12:39:25 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 21:39:13 +0200
Message-Id: <aab703e3ac32cab1078669e867eb15f39b66abeb.1490643522.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.e904b46a3797bd3e32fa34431a5549f485271170.1490643522.git-series.patrick.ohly@intel.com>
References: <cover.e904b46a3797bd3e32fa34431a5549f485271170.1490643522.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 2/3] oeqa: allow customizing image used by runqemu()
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
X-List-Received-Date: Mon, 27 Mar 2017 19:39:25 -0000

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

