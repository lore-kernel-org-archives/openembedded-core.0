Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 29F1560620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:31:04 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so68176471igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 00:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fEsUu6U8HUwr1NDDCz28VQ9s8tccN27zIhs4n/+YaCA=;
	b=OxLFw4J+p6BCWiIiWgTUgSpz4ynKXcO0EJGBG6/+sapY2kRlZGU4cpasadGtgaYl1v
	zzA574Gu+DWIt5BwthQ39l1P0cYx/Xl2sAOGmb3D+ZDtPiqqiLXIM5piDHKCroEhp9b+
	tHEbsrwfcMyDmGepOpx2AOXNnyg/req0n5aZZyeX0oJzhLy4ignpB3dGy0CMWcVcCJZ6
	As48GiLs3wzRrEr4jqgilX5eNaofZqN9Hm8pwCyMxLMKG/xmNaJLwproyssaNN6FOl5r
	Co6GOqUhxsAjmXWT5IOSxYuZi8udX/fDjZTs+es2uyaQThnr431P7o34hVGG0Dhqhh6r
	ibhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=fEsUu6U8HUwr1NDDCz28VQ9s8tccN27zIhs4n/+YaCA=;
	b=BsjFYpgeKjN7iV9wWH8TTPdg9O4GX+G44ieOrIj4PmGtB0ITgf5T/PG4rjsFQwbzwE
	l75c56CGNe6h1NW10jC17S9n9rogZsGGDpLaLc/WKNRTLTIuBEnRYfEepf2AwjUoxmP+
	J9Fm6+jm6VGWy5v1hhHqBNnh8TxVv8zThujlpGCmbJJ9HD6l/lDbZhT9K4sqF85ZfeSW
	A94XMXeRU1q/8uFPyTGH1Ep7yJgSUxiK1cVtiOLxPZ7B+nFLQV/kp+qjFvRWDv7HdvH4
	bhwqRYwRN0Ic2ngLqCKRckIN0KbUI9W9Zqr4xbNfBdjtulTSKKfz5SJaxt+GxcUNxmCO
	OzgA==
X-Gm-Message-State: ALoCoQkZVag8jaUu+zRYcjRNTbX2Gxorm0I91aPiVK0hK1G31oK9Nsiq1QQplMxdcv7oU3ujhxSL
X-Received: by 10.50.67.18 with SMTP id j18mr2825197igt.43.1448440265384;
	Wed, 25 Nov 2015 00:31:05 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56CC0.dip0.t-ipconnect.de.
	[87.165.108.192]) by smtp.gmail.com with ESMTPSA id
	i69sm8398302iod.27.2015.11.25.00.31.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Nov 2015 00:31:05 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 10:30:32 +0100
Message-Id: <10f00a2b408869e7b8a7e850920d63dce65b4ca5.1448442869.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com, alexander.kanevskiy@intel.com
Subject: [PATCH 4/4] buildhistory-extra.bbclass: more complete and reliable data gathering
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
X-List-Received-Date: Wed, 25 Nov 2015 08:31:07 -0000

buildhistory_emit_pkghistory() only runs for recipes with packages and
when gathering information about packages is enabled. Information
about source files is needed in all cases because one cannot assume
that native compilation is based on exactly the same sources as
compilation for the target and/or there might not be the corresponding
information about the target compilation. This was not mentioned in
the feature description of
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8138 and thus not
covered by the original implementation.

Therefore we need to ensure that the extra code runs independently
from buildhistory_emit_pkghistory(). This is done in a similar way,
except that the code runs earlier when populating the sysroot, which
is done for native and target recipes.

Because the code now runs before buildhistory_emit_pkghistory(), we
may have to create the recipe directory. This was already true for
buildhistory_extra_emit_kernelconfig() which failed when starting with
a build history that had no directory for the kernel. Even if it was
written, that "kconfig" file then later got removed again by the
directory cleaning code in buildhistory_emit_pkghistory(). Now the new
BUILDHISTORY_PRESERVE mechanism is used to prevent that.

Handling the "latest" file is tricky: it mixes values that only exist
for recipes with packages (PACKAGES, obviously) and values that always
exist (like PV and PR), but the base class only writes it for recipes
with packages. Instead of doing intrusive changes to the base class to
fix that, the file now simply gets written by the extra code first and
later gets overwritten with a more complete version by the base
class. Another alternative would be to store PV and PR twice, but some
redundant work during build time seems better than redundancy in the
result.

Allowing a derived class to extend the file would cause even more
complications (like having to write to the file three times, or
introducing some kind of hook mechanism). While doable, it seems easier
to just store extra variables in a separate "variables" file.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildhistory-extra.bbclass | 49 +++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildhistory-extra.bbclass b/meta/classes/buildhistory-extra.bbclass
index 2dd5c5f..05ba4cf 100644
--- a/meta/classes/buildhistory-extra.bbclass
+++ b/meta/classes/buildhistory-extra.bbclass
@@ -6,15 +6,51 @@
 
 inherit buildhistory
 
+# Variables to record in the "variables" file of each recipe.
+#
+# WARNING: changing this does not cause a rewrite of that file unless
+# something causes do_populate_sysroot[_setscene] to be run again,
+# like removing the tempdir and rebuilding (with or without sstate).
 BUILDHISTORY_EXTRA_PKGVARS ?= "PACKAGECONFIG EXTRA_OEMAKE EXTRA_OECONF EXTRA_OECMAKE EXTRA_OESCONS EXTRA_QMAKEVARS_PRE EXTRA_QMAKEVARS_POST OE_FEATURES SUMMARY DESCRIPTION HOMEPAGE LICENSE"
 
-python buildhistory_emit_pkghistory_append() {
+BUILDHISTORY_PRESERVE += "sources metadata variables kconfig"
+
+SSTATEPOSTINSTFUNCS_append = " buildhistory_extra_emit_pkghistory"
+# We want to avoid influence the signatures of sstate tasks - first the function itself:
+sstate_install[vardepsexclude] += "buildhistory_extra_emit_pkghistory"
+# then the value added to SSTATEPOSTINSTFUNCS:
+SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_extra_emit_pkghistory"
+
+python buildhistory_extra_emit_pkghistory() {
+    bb.note('buildhistory_extra_emit_pkghistory %s' % d.getVar('BB_CURRENTTASK', True))
+    if not d.getVar('BB_CURRENTTASK', True) in ['populate_sysroot', 'populate_sysroot_setscene']:
+        return 0
+
     import codecs
 
     relpath = os.path.dirname(d.getVar('TOPDIR', True))
+    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+    if not os.path.exists(pkghistdir):
+        bb.utils.mkdirhier(pkghistdir)
+
+    # Record PV in the "latest" file. This duplicates work in
+    # buildhistory_emit_pkghistory(), but we do not know whether
+    # that will run (it gets skipped for recipes which never
+    # reach the packaging state or when "package" is not in
+    # BUILDHISTORY_FEATURES), so we write the file here
+    # and let buildhistory_emit_pkghistory() overwrite it again
+    # with more information later.
+    infofile = os.path.join(pkghistdir, "latest")
+    pe = d.getVar('PE', True) or "0"
+    pv = d.getVar('PV', True)
+    pr = d.getVar('PR', True)
+    with codecs.open(infofile, "w", encoding='utf8') as f:
+        if pe != "0":
+            f.write(u"PE = %s\n" % pe)
+        f.write(u"PV = %s\n" % pv)
+        f.write(u"PR = %s\n" % pr)
 
     # List sources
-    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
     srcsfile = os.path.join(pkghistdir, "sources")
     with codecs.open(srcsfile, "w", encoding='utf8') as f:
         urls = (d.getVar('SRC_URI', True) or '').split()
@@ -39,15 +75,16 @@ python buildhistory_emit_pkghistory_append() {
                     path = os.path.relpath(path, relpath)
                 f.write('%s %s\n' % (path, sha256sum))
 
-    # List some extra var values
-    latestfile = os.path.join(pkghistdir, "latest")
     vars = (d.getVar('BUILDHISTORY_EXTRA_PKGVARS', True) or '').split()
+    varsfile = os.path.join(pkghistdir, "variables")
     if vars:
-        with codecs.open(latestfile, "a", encoding='utf8') as f:
+        with codecs.open(varsfile, "w", encoding='utf8') as f:
             for var in vars:
                 value = oe.utils.squashspaces(d.getVar(var, True) or '')
                 if value:
                     f.write('%s = %s\n' % (var, value))
+    elif os.path.exists(varsfile):
+        os.unlink(varsfile)
 }
 
 python() {
@@ -64,6 +101,8 @@ python buildhistory_extra_emit_kernelconfig() {
     # during the actual kernel build.
     import shutil
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+    if not os.path.exists(pkghistdir):
+        bb.utils.mkdirhier(pkghistdir)
     shutil.copyfile(d.expand('${B}/.config'), os.path.join(pkghistdir, 'kconfig'))
 }
 
-- 
2.1.4


