Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id CBD9E7653B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 09:01:35 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so18470810wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 02:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lHrRACvDLevc4FpgrdcIzpOydRXSdhG4gT67hxIappM=;
	b=bMZys9v75agIsg4Rx7ov9SN2SdWtFrmB0gIJm07AWO2obgC2upSaBM4j11XIzvB8K5
	cWzF3+VMDZvhRTh6hFJjkbc+CnbRXnADffDfbRC56vhEmERLZWll6bAS83Cnt9wbV1vz
	OOFg+NAftkaLdZcN/nVHjbERRQ3tMLD0zz4f7TGoJzmb63mkhC6ZEb6gVzqXkt0NzlG3
	oD+jZCc/elWqzUHlcd2LghLA0RFko03Di4mH04lpDkpA6+7NiDMYvUmua3807s9kVczn
	e3sjS+fIFaLpg68nEPduJDcWSHYIXjKw0R+hyRbsKNtT2MHjux/UkwbDQoQ29xHNso2E
	GJ4Q==
X-Gm-Message-State: ALoCoQma9ffZmkDCWjYVHc72pFiMrwbyGwzfzTQ8fVoCAHWhqQxM9086Cw680+8iYjhaGR83YfAM
X-Received: by 10.194.87.129 with SMTP id ay1mr27623694wjb.110.1443085294872; 
	Thu, 24 Sep 2015 02:01:34 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p1sm12596101wif.7.2015.09.24.02.01.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Sep 2015 02:01:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 09:54:33 +0100
Message-Id: <1443084873-16310-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2] sstate: run recipe-provided hooks outside of ${B}
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
X-List-Received-Date: Thu, 24 Sep 2015 09:01:36 -0000

To avoid races between the sstate tasks/hooks using ${B} as the cwd, and other
tasks such as cmake_do_configure which deletes and re-creates ${B}, ensure that
all sstate hooks are run in the right directory, and run the prefunc/postfunc in WORKDIR.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b9ad6da..b257734 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -61,16 +61,6 @@ SSTATE_SIG_PASSPHRASE ?= ""
 # Whether to verify the GnUPG signatures when extracting sstate archives
 SSTATE_VERIFY_SIG ?= "0"
 
-# Specify dirs in which the shell function is executed and don't use ${B}
-# as default dirs to avoid possible race about ${B} with other task.
-sstate_create_package[dirs] = "${SSTATE_BUILDDIR}"
-sstate_unpack_package[dirs] = "${SSTATE_INSTDIR}"
-
-# Do not run sstate_hardcode_path() in ${B}:
-# the ${B} maybe removed by cmake_do_configure() while
-# sstate_hardcode_path() running.
-sstate_hardcode_path[dirs] = "${SSTATE_BUILDDIR}"
-
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
@@ -164,6 +154,8 @@ def sstate_install(ss, d):
     shareddirs = []
     bb.utils.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
 
+    sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])
+
     manifest, d2 = oe.sstatesig.sstate_get_manifest_filename(ss['task'], d)
 
     if os.access(manifest, os.R_OK):
@@ -267,7 +259,8 @@ def sstate_install(ss, d):
             oe.path.copyhardlinktree(state[1], state[2])
 
     for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
-        bb.build.exec_func(postinst, d)
+        # All hooks should run in the SSTATE_INSTDIR
+        bb.build.exec_func(postinst, d, (sstateinst,))
 
     for lock in locks:
         bb.utils.unlockfile(lock)
@@ -307,7 +300,8 @@ def sstate_installpkg(ss, d):
             bb.warn("Cannot verify signature on sstate package %s" % sstatepkg)
 
     for f in (d.getVar('SSTATEPREINSTFUNCS', True) or '').split() + ['sstate_unpack_package'] + (d.getVar('SSTATEPOSTUNPACKFUNCS', True) or '').split():
-        bb.build.exec_func(f, d)
+        # All hooks should run in the SSTATE_INSTDIR
+        bb.build.exec_func(f, d, (sstateinst,))
 
     for state in ss['dirs']:
         prepdir(state[1])
@@ -579,8 +573,9 @@ def sstate_package(ss, d):
 
     for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + ['sstate_create_package'] + \
              (d.getVar('SSTATEPOSTCREATEFUNCS', True) or '').split():
-        bb.build.exec_func(f, d)
-  
+        # All hooks should run in SSTATE_BUILDDIR.
+        bb.build.exec_func(f, d, (sstatebuild,))
+
     bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
 
     return
@@ -642,19 +637,22 @@ python sstate_task_prefunc () {
     shared_state = sstate_state_fromvars(d)
     sstate_clean(shared_state, d)
 }
+sstate_task_prefunc[dirs] = "${WORKDIR}"
 
 python sstate_task_postfunc () {
     shared_state = sstate_state_fromvars(d)
+
     sstate_install(shared_state, d)
     for intercept in shared_state['interceptfuncs']:
-        bb.build.exec_func(intercept, d)
+        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR", True,)))
     omask = os.umask(002)
     if omask != 002:
        bb.note("Using umask 002 (not %0o) for sstate packaging" % omask)
     sstate_package(shared_state, d)
     os.umask(omask)
 }
-  
+sstate_task_postfunc[dirs] = "${WORKDIR}"
+
 
 #
 # Shell function to generate a sstate package from a directory
-- 
2.1.4


