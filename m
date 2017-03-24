Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 96B4377BC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 17:18:57 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id 190so7494258itm.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SAh/fY9YyolSHjyd1jDWZiN2bnEMBsIwRt8xusIjmw4=;
	b=E+DaCBxtf4R/u8kaC1VMGn55yHeUJYd3UDCAqAduchK11FZXm6sy1x4zM+Nr0qRI4g
	z3XOrNuU+vqMy+dxwZFx9b/kz7cT8Ys6Jd/hqLUDfoygyid3Lwm1qm1V/MR+mtRBm02q
	FrZnGne6v/NEWNDkmyG+BA5GAS0bTkCt5rK7ILesuYhtloY5Jfu47q8ZFfvyAcZ27VzG
	Hjo2apn0kKkWLM/lmn6CATivaDDDUQkXNHxt3R2HbiNVwob3Du53U2mLJdAc3sJ8xEzF
	uG6xLR0hujQmfSJcvuFS0wp0A8TPntyeUF/iPYWvOP7zQAkOD1Riglo2iKvPoMzzusPH
	WTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SAh/fY9YyolSHjyd1jDWZiN2bnEMBsIwRt8xusIjmw4=;
	b=hXPeVpqLI3IEDqTdnIfHfNIIWI+hEsxFYP/sQc5fvLJ6rjYhJbqEXnHdbB4td+tASR
	v8DlcXa7glTP218QVDho/BV7aezKBIu3FsQzHSINFHRz/KvQUvvXr2/2Z6fMTyCizPU6
	PlXBoUbI3Zf3CFORKcnpws1FmCHz2WXCBqrY9KWJaTDPS7JCr2xQgYOsuwCC3FNWF+Jd
	FXly+5fqkEueE5f6oa3tRoT63jdFcMFVPBsc7OZqt3gZViSxr9AqpYMZQvadHoail1w+
	O7OpdOvgoF030ZBNTrRvQf8r5bLLYF/II/W+LgRsjID4H370Y+6snqn0V5WdB2vF0JOm
	8uhA==
X-Gm-Message-State: AFeK/H167PT9eN/AlcQgtsAqG/6+BkYPcjzYajC7dUm8E0ODHv+36gV1VkRRDnClKp0xQIBu
X-Received: by 10.107.47.130 with SMTP id v2mr8678247iov.201.1490375938415;
	Fri, 24 Mar 2017 10:18:58 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E2F9.dip0.t-ipconnect.de.
	[93.232.226.249]) by smtp.gmail.com with ESMTPSA id
	g23sm1477725ioi.20.2017.03.24.10.18.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 10:18:57 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 18:18:37 +0100
Message-Id: <8aaa7e210e3a1ab784cdb313ed31169fe3327f66.1490375888.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
References: <cover.893d808ab8d6ae450d8d95e1b23eeecb627cde36.1490375888.git-series.patrick.ohly@intel.com>
Subject: [PATCH 3/4] oeqa: allow customizing image used by runqemu()
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
X-List-Received-Date: Fri, 24 Mar 2017 17:18:57 -0000

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
index d5607d9..ed99d0e 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -218,7 +218,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, qemuparams=None):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, qemuparams=None, overrides={}):
 
     import bb.tinfoil
     import bb.build
@@ -231,6 +231,8 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, qemuparams=None):
         tinfoil.config_data.setVar("TEST_LOG_DIR", "${WORKDIR}/testimage")
         tinfoil.config_data.setVar("TEST_QEMUBOOT_TIMEOUT", "1000")
         recipedata = tinfoil.parse_recipe(pn)
+        for key, value in overrides.items():
+            recipedata.setVar(key, value)
 
         # The QemuRunner log is saved out, but we need to ensure it is at the right
         # log level (and then ensure that since it's a child of the BitBake logger,
-- 
git-series 0.9.1

