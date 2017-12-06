Return-Path: <msm-oss@mcclintock.net>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7AAB878679
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 22:53:26 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id j124so3159274pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 14:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google; h=from:to:subject:date:message-id;
	bh=PldKEHvR9YmQtWimMASDN+HW7feZ62l9FNrnjhxbuQg=;
	b=L2+wW40D/lAtjQSvIsob513KEMFJfiH3dp7VzDT5ILUFrMP8CCUZSJCOGaYLq7pbv9
	txh3CmPYVtyaxFuUqxbJgZQdvXcAFHCnQ8hzMDptCZ5Zz32/YC8nYeh4KLBLneQtOUUd
	oRaBHZpOuuKTvxaE+/ulv8UBtWY+GL8iD4lCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PldKEHvR9YmQtWimMASDN+HW7feZ62l9FNrnjhxbuQg=;
	b=rne9YMmZXbk8nFBYY94tyj9ojPveFyqjCAjEzWsH1lbM/DtvFoVtkjbG+2YNUrGJjS
	X5qd4PngCLFsOJ0Nig7qtchTYDn8LgqOmm9WgggzDJa8+7LSNdCDuKP6OSeqtQ5bIEwJ
	BNzCdGeMbs0JSKqI+F4ZfKMr2U4B0YAR7UyShVr1sr+P/wOei/v3qASqG9RxCGDywU6T
	p9eLmDyOaKPErgRkPVrEV0djZm6J9pSxc3aAaenx/Sw1ihgSBsqy6ThUa392hk1dtF/e
	twZLSlTpllcH5Sav+ea9kXnllAw3GUU02eYfL0EtcriXAR4nmz9Z4gww95KUFhRHhw3U
	fomw==
X-Gm-Message-State: AJaThX7C6IyJVM3bc62lMVnXCVBTFTAe7irKPLjHwzMnOK00RbJ9HCKx
	BcFtqqxYK/PoPrMJKI7IUNUFL/JA
X-Google-Smtp-Source: AGs4zMasqYgus/tC7sX7QpAxGl5UK/KMMgPU4zbPMzSn3BobMiZDOtGtQy1acDyCSqb2kyNbHwcNFw==
X-Received: by 10.99.125.81 with SMTP id m17mr22202800pgn.279.1512600802648;
	Wed, 06 Dec 2017 14:53:22 -0800 (PST)
Received: from c4.lgirdk.com ([4.16.80.118]) by smtp.gmail.com with ESMTPSA id
	c79sm6278999pfj.49.2017.12.06.14.53.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Dec 2017 14:53:22 -0800 (PST)
From: Matthew McClintock <msm-oss@mcclintock.net>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 14:53:18 -0800
Message-Id: <20171206225318.1269-1-msm-oss@mcclintock.net>
X-Mailer: git-send-email 2.14.1
Subject: [pyro][PATCH] staging.bbclass: handle postinst-useradd-* fixmes
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
X-List-Received-Date: Wed, 06 Dec 2017 22:53:26 -0000

From: Mikko Ylinen <mikko.ylinen@linux.intel.com>

After 02457ef7f600ce954874e2d11e74b1c6daaa3bfc, PSEUDO for
postinst-useradd-* scripts get to use only one PSEUDO_LOCALSTATEDIR
which is set under recipes ${WORKDIR}.

When the those scripts are run in a clean build environment that
is built from the sstate (populate_sysroot_setscene run for
postinst-useradd-* providers), pseudo fails to run because it cannot
access the PSEUDO_LOCALSTATEDIR (recipe ${WORKDIR}s do not exist).
This triggers a sysroot staging error.

Previously, the PSEUDO_LOCALSTATEDIR setting in useradd.bbclass
worked because the RSS sstate/staging logic automagically processed
${STAGING_DIR_TARGET} in postinst-useradd-* scripts to point under
the sysroot being built.

The fix uses the same fixme processing by adding PSEUDO_LOCALSTATEDIR
variable to it. Furthermore, LOGFIFO is added to be able to use
the logging fifo of the recipe that actually runs postinst-useradd-*.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/staging.bbclass | 2 +-
 meta/classes/useradd.bbclass | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index a90cf43c94..984051d6aa 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -249,7 +249,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
     if not fixme:
         return
     cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
-    for fixmevar in ['COMPONENTS_DIR', 'HOSTTOOLS_DIR', 'PKGDATA_DIR']:
+    for fixmevar in ['COMPONENTS_DIR', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
         fixme_path = d.getVar(fixmevar)
         cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
     bb.debug(2, cmd)
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 0f51e5522b..0f551b50f3 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -133,9 +133,10 @@ useradd_sysroot () {
 }
 
 # The export of PSEUDO in useradd_sysroot() above contains references to
-# ${COMPONENTS_DIR}. These need to be handled when restoring
+# ${COMPONENTS_DIR} and ${PSEUDO_LOCALSTATEDIR}. Additionally, the logging
+# shell functions use ${LOGFIFO}. These need to be handled when restoring
 # postinst-useradd-${PN} from the sstate cache.
-EXTRA_STAGING_FIXMES += "COMPONENTS_DIR"
+EXTRA_STAGING_FIXMES += "COMPONENTS_DIR PSEUDO_LOCALSTATEDIR LOGFIFO"
 
 python useradd_sysroot_sstate () {
     task = d.getVar("BB_CURRENTTASK")
-- 
2.14.1


