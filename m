Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 72E8A77AF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 09:51:22 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 190so46429890itm.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 02:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w7R7QWekHkJfUzCWXD+bxaXlFv4b46FC1YpCaCQNzIQ=;
	b=mqAbULfU7s1NX4PHfq+gaNYZGIfKLFwnJSDNC6SIbj0lzA6KbMWPSdAOLoyGHxCWmD
	v4kNZbyR7dzVPVcqElAN1eWN2KFFAieYB0XpNvtXQmhlTAacopa0Cyj/A5d/PNFPrqdU
	VtHoN1V9jQxvAdcQicLDsUXLLUhOQyro745zUn6CQpbLivfvklsH189z+lws9gUbYn1q
	380kqvqO8UjyoLSdOOHh4wbTPZiRyW9hHq/O2+PvCLyOsID74qL/wXeJ+xRjXneqA7Pi
	ZdwgNrTN5PC+HGal7miZ75kvMH0ADMVtPwx44iZji+uR09JM03yfuMe9A7513sAXrVpw
	Fnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w7R7QWekHkJfUzCWXD+bxaXlFv4b46FC1YpCaCQNzIQ=;
	b=m26OuLt0DpbQVIpT7XbDS1O/MEoYNn+pY4w9NneKsxiXGYGYDWrso4PVH/StPr37Bm
	2Sb28Qq7Oa7/ENH9fdyGUMsHrte/ZHzdf7FnaSYBgkO7JcVy0KcbR+wS5kGDXSoXJjXZ
	D3j2ZuMd7yhA6eXB9F2XO5tqDJIG2lpYltM1gE+xguNQb25snAVNhEUj+5R0ZwZD8H0y
	VkmJDZl/jcmXnE6CBPcUq7mv1wO1RazjfZZx6Yl0DLqdPGnzBIo0rAOOcKaElpmgvI2e
	96jnWuxL+jpOSFpdfAvzHH/tXgOVo2NMkbH8Ke+Bz8fMu9+8J9J1jIpyygpf+fX2dd1Q
	4/hw==
X-Gm-Message-State: AFeK/H14vHeypzKExgbG3JKi3kQlJaCqI3hm8Rcnbs6MXkXMGwQLLqnbMwcl04lRiDO/b6r1
X-Received: by 10.107.201.208 with SMTP id z199mr19033020iof.217.1490608283929;
	Mon, 27 Mar 2017 02:51:23 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181])
	by smtp.gmail.com with ESMTPSA id q185sm32060itc.22.2017.03.27.02.51.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 02:51:22 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 11:50:39 +0200
Message-Id: <aab703e3ac32cab1078669e867eb15f39b66abeb.1490608195.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c7547f2eda8922d28653c6746806ea5c16d5a976.1490608195.git-series.patrick.ohly@intel.com>
References: <cover.c7547f2eda8922d28653c6746806ea5c16d5a976.1490608195.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 2/3] oeqa: allow customizing image used by runqemu()
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
X-List-Received-Date: Mon, 27 Mar 2017 09:51:22 -0000

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

