Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 334DE7F380
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:44 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id q10so4879984pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HYYjlFmxQAE5l+TlEW/WEULFDB1zkt/mPN2ZpdvWRjU=;
	b=htKTUbYSnwyaqF4CsHezSqhbg4oA8bqG/Q2GfWPF2MK8Wt2pT2YzGx9HoVWctUm/ka
	d3yGv+M73XDvANJAZ28zuZEdvCQWzgd8X7ZLSw83ta6E7g7WhUO8saFNiWGInifJ2glF
	Fa4ilcHrceoBIR3C4S8QdX763PLbksbJAC4kV5arQPndYDJHjTAi+aCoalA8ts+bzM0c
	FjIVGnXSUGIEnylnIieTU9Qivt5yii1vNmEK2aSZZIIIsWPE+xJMNuMoNANjwlwBLGEr
	5iWARF+Zimq8QYQhrgf7BL1fJ4+f7kNmWxIADyeL0KGzU4RDl+LoWCa2LrZtC/fyCoa/
	bCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HYYjlFmxQAE5l+TlEW/WEULFDB1zkt/mPN2ZpdvWRjU=;
	b=e4+ejuSyEv756Nk/LPvhSKf4rseifeianP5peETXdFNK3gJouIx2yQRBQx5pfbQxVS
	NyFvyGwb7TANx8NbrtMJ4EcLy20vHiTkrqofB0a9dxIOEgT5uCVo5Ehirb7vlrjvcZ8R
	LsmaAmB8B2xZLb19cfjoywUacNqgDAf1Hh4K8ipuB7uDhRaOXbrJJLAvlxlLqCGHEksE
	7BR4CmwMf1PIcMmso44mJHioEVFAttAE8gHuMUpBx3ozKGb9vXSKd2eS4BuHWCRBqMif
	Te4xp5jHROFiPxZhiqMJmmVBlolDhlVTYYy0OIlMTy0byLc6l/M/+oh7esgIt9yQVGR1
	Hiuw==
X-Gm-Message-State: APjAAAV83X1kZkP8ghEkGoSHkNMUinRGnIkVYtFBNv6F2PTNo3mSklSS
	+gDL0SjNon9MdzpDwfqS6pZQaoJkf0w=
X-Google-Smtp-Source: APXvYqxPB6mWyzvJFDjQa6ruaV4Cm7sGQtijZpfmrAAhy7MSA7Xaw0AxgWq/RbSiEmqHKmy7Q7pIdQ==
X-Received: by 2002:a65:6799:: with SMTP id e25mr23255943pgr.271.1569818925051;
	Sun, 29 Sep 2019 21:48:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:45 -0700
Message-Id: <441a2b8979e69c20e7ed0178cdb210eecdec91e1.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 50/54] useradd: Fix build architecture corruption of sstate artefacts
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:44 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When mixing aarch64 and x86_64 host builds with common sstate, useradd failures
were found. This was due to references to:

/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/sysroots-components/aarch64/pseudo-native/usr/bin/pseudo
or
/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo

on the wrong architecture within the useradd postinst files.

Instead of using COMPONENTS_DIR as the FIXME, use PSEUDO_SYSROOT which contains
the arch component as well to avoid this.

Add extra comments to cause the relavent sstate to be rebuilt.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0384622f72a6c0bd8225cf06f692340fdef67d4a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/staging.bbclass | 2 +-
 meta/classes/useradd.bbclass | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 062b281..546fc81 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -167,7 +167,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
     if not fixme:
         return
     cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
-    for fixmevar in ['COMPONENTS_DIR', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
+    for fixmevar in ['PSEUDO_SYSROOT', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
         fixme_path = d.getVar(fixmevar)
         cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
     bb.debug(2, cmd)
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 124becd..5e600de 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -100,6 +100,8 @@ useradd_sysroot () {
 	# Pseudo may (do_prepare_recipe_sysroot) or may not (do_populate_sysroot_setscene) be running 
 	# at this point so we're explicit about the environment so pseudo can load if 
 	# not already present.
+	# PSEUDO_SYSROOT can contain references to the build architecture and COMPONENT_DIR
+	# so needs the STAGING_FIXME below
 	export PSEUDO="${FAKEROOTENV} ${PSEUDO_SYSROOT}${bindir_native}/pseudo"
 
 	# Explicitly set $D since it isn't set to anything
@@ -134,10 +136,10 @@ useradd_sysroot () {
 }
 
 # The export of PSEUDO in useradd_sysroot() above contains references to
-# ${COMPONENTS_DIR} and ${PSEUDO_LOCALSTATEDIR}. Additionally, the logging
+# ${PSEUDO_SYSROOT} and ${PSEUDO_LOCALSTATEDIR}. Additionally, the logging
 # shell functions use ${LOGFIFO}. These need to be handled when restoring
 # postinst-useradd-${PN} from the sstate cache.
-EXTRA_STAGING_FIXMES += "COMPONENTS_DIR PSEUDO_LOCALSTATEDIR LOGFIFO"
+EXTRA_STAGING_FIXMES += "PSEUDO_SYSROOT PSEUDO_LOCALSTATEDIR LOGFIFO"
 
 python useradd_sysroot_sstate () {
     scriptfile = None
-- 
2.7.4


