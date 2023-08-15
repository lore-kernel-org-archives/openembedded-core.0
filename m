Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87957C001DB
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 12:57:32 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.133444.1692104246870865946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 05:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=em828O4P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3179ed1dfbbso4757184f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692104245; x=1692709045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t7sVM20YCJl1nxrsBipbWOpMKAoFhHQ8ieyf07xc/iQ=;
        b=em828O4PUj1CIzx+WC4VZq5PEFb3txY+eUIoDgQyHWcMSdVPvPur3BoQ87gyokGi55
         4z3xbEHN45+Gock8wFggDqvO8CsZzwRnu1CkRrtSxUjh8dztu1Fm27LDy36M8KSdlKbj
         5yTfB+QdzpRvvoeVgxAETXDR+vNRBBGQNu17M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692104245; x=1692709045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7sVM20YCJl1nxrsBipbWOpMKAoFhHQ8ieyf07xc/iQ=;
        b=krnAPEUi5769U3cnzq2lY+PoJQeWn5sN6lgQOlXXpYEV6E7nnq/pftM3qaBvy58kSu
         NN8fIZVFWd7MzrLrHNu+0tQbYqalGYs33HBObxJEtpDPk4gG54a6BnMyRATBPJUlTqFi
         Twtwimr7MM8NkLUq2608Y2Jk4U6uBOSnzdTFRMZi5b+MdB4HBXNdXA05+oDToGhol48F
         E8bOnpI8psT0YGcRVcS6a5xVw32ONWLuvmi2LmOGiV4hL64OywZ1/YMkRjIoDiaQeNIK
         FR/6wyTMGtpx4LTv1VkESxS4Tc6ibuTvLAo2YMBMvVGc7MZNWv75kV/DlcTjRjPHA8iq
         W5jQ==
X-Gm-Message-State: AOJu0YwuX/OwGOElMd0/NGBFMyB1SQaUBEjZWwT7/gtFpYYN89Al4jv7
	fimwRrGM/Mf6qgdnHpOCvtXRskjlDqrzYV1iP9c=
X-Google-Smtp-Source: AGHT+IHTSrPLxPov9Hbds0K4P7EAErP8EVuMWfBlLukLbXapJz1MwDs7eoJTrtA0d+3YiTdAPzGTYA==
X-Received: by 2002:adf:f842:0:b0:317:6513:da7e with SMTP id d2-20020adff842000000b003176513da7emr9763306wrq.36.1692104244665;
        Tue, 15 Aug 2023 05:57:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6020:ab41:e8d3:f1e6])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b003197c2316ecsm5228964wru.112.2023.08.15.05.57.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 05:57:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] base/package: Move source revision information from PV to PKGV
Date: Tue, 15 Aug 2023 13:57:22 +0100
Message-Id: <20230815125722.437701-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 12:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186062

Source control information being present in PV used to be a hard requirement
for bitbake to operate correctly. Now that hashes are a required part of task
stamps, this requirement no longer exists.

This means we can defer the hash pieces to PKGV and simplify PV.

Use new bitbake fetcher API to inject the source revisions directly into the hash
allowing removal of some horrible code from base.bbclass and avoiding any hardcoding
about how SRCREV may or may not be used.

Use that API to object the string to append to PKGV and append that directly.

The user visible effect of this change is that PV will no longer have revision
information in it and this will now be appended to PV through PKGV when the
packages are written. Since PV is used in STAMP and WORKDIR, users will see
small directory naming and stamp naming changes.

This will mean that sstate reuse through hash equivalence where the source
revision changes but the output does not will become possible as the sstate
naming will become less specific and no longer contain the revision.

The SRCPV variable will no longer be needed in PV and is effectively now just
a null operation. Usage can be removed over time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gitunpackoffline/gitunpackoffline-fail.bb | 18 ++--------
 .../gitunpackoffline/gitunpackoffline.bb      |  2 +-
 .../gitunpackoffline/gitunpackoffline.inc     | 16 +++++++++
 meta/classes-global/base.bbclass              | 33 +++++--------------
 meta/classes-global/package.bbclass           |  6 +++-
 meta/classes/externalsrc.bbclass              |  4 +++
 meta/conf/bitbake.conf                        |  5 +--
 meta/lib/oeqa/selftest/cases/fetch.py         |  2 +-
 8 files changed, 39 insertions(+), 47 deletions(-)
 create mode 100644 meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc

diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb
index 602e895199b..51461296669 100644
--- a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb
+++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline-fail.bb
@@ -1,16 +1,4 @@
-SUMMARY = "Test recipe for fetching git submodules"
-HOMEPAGE = "https://git.yoctoproject.org/git/matchbox-panel-2"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+require gitunpackoffline.inc
 
-INHIBIT_DEFAULT_DEPS = "1"
-
-TAGVALUE = "2.10"
-
-# Deliberately have a tag which has to be resolved but ensure do_unpack doesn't access the network again.
-SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https"
-SRC_URI:append:gitunpack-enable-recipe = ";tag=${TAGVALUE}"
-SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
-SRCREV:gitunpack-enable-recipe = ""
-
-S = "${WORKDIR}/git"
+# Clear the base.bbclass magic srcrev call
+fetcher_hashes_dummyfunc[vardepvalue] = ""
diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
index a687bcc2a7c..d9a54690b23 100644
--- a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
+++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.bb
@@ -1,4 +1,4 @@
-require gitunpackoffline-fail.bb
+require gitunpackoffline.inc
 
 TAGVALUE = "2.11"
 
diff --git a/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc
new file mode 100644
index 00000000000..602e895199b
--- /dev/null
+++ b/meta-selftest/recipes-test/gitunpackoffline/gitunpackoffline.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Test recipe for fetching git submodules"
+HOMEPAGE = "https://git.yoctoproject.org/git/matchbox-panel-2"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+TAGVALUE = "2.10"
+
+# Deliberately have a tag which has to be resolved but ensure do_unpack doesn't access the network again.
+SRC_URI = "git://git.yoctoproject.org/git/matchbox-panel-2;branch=master;protocol=https"
+SRC_URI:append:gitunpack-enable-recipe = ";tag=${TAGVALUE}"
+SRCREV = "f82ca3f42510fb3ef10f598b393eb373a2c34ca7"
+SRCREV:gitunpack-enable-recipe = ""
+
+S = "${WORKDIR}/git"
diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index cbda8d12f09..7c774d250f8 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -126,11 +126,18 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     if notfound and fatal:
         bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
 
+# We can't use vardepvalue against do_fetch directly since that would overwrite
+# the other task dependencies so we use an indirect function.
+python fetcher_hashes_dummyfunc() {
+    return
+}
+fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}"
+
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
 do_fetch[file-checksums] += " ${@get_lic_checksum_file_list(d)}"
-do_fetch[vardeps] += "SRCREV"
+do_fetch[prefuncs] += "fetcher_hashes_dummyfunc"
 do_fetch[network] = "1"
 python base_do_fetch() {
 
@@ -606,7 +613,6 @@ python () {
                     bb.debug(1, "Skipping recipe %s because of incompatible license(s): %s" % (pn, ' '.join(incompatible_lic)))
                     raise bb.parse.SkipRecipe("it has incompatible license(s): %s" % ' '.join(incompatible_lic))
 
-    needsrcrev = False
     srcuri = d.getVar('SRC_URI')
     for uri_string in srcuri.split():
         uri = bb.fetch.URI(uri_string)
@@ -619,24 +625,17 @@ python () {
 
         # Svn packages should DEPEND on subversion-native
         if uri.scheme == "svn":
-            needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' subversion-native:do_populate_sysroot')
 
         # Git packages should DEPEND on git-native
         elif uri.scheme in ("git", "gitsm"):
-            needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' git-native:do_populate_sysroot')
 
         # Mercurial packages should DEPEND on mercurial-native
         elif uri.scheme == "hg":
-            needsrcrev = True
             d.appendVar("EXTRANATIVEPATH", ' python3-native ')
             d.appendVarFlag('do_fetch', 'depends', ' mercurial-native:do_populate_sysroot')
 
-        # Perforce packages support SRCREV = "${AUTOREV}"
-        elif uri.scheme == "p4":
-            needsrcrev = True
-
         # OSC packages should DEPEND on osc-native
         elif uri.scheme == "osc":
             d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
@@ -645,7 +644,6 @@ python () {
             d.appendVarFlag('do_fetch', 'depends', ' nodejs-native:do_populate_sysroot')
 
         elif uri.scheme == "repo":
-            needsrcrev = True
             d.appendVarFlag('do_fetch', 'depends', ' repo-native:do_populate_sysroot')
 
         # *.lz4 should DEPEND on lz4-native for unpacking
@@ -676,21 +674,6 @@ python () {
         elif path.endswith('.deb'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
-    if needsrcrev:
-        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
-
-        # Gather all named SRCREVs to add to the sstate hash calculation
-        # This anonymous python snippet is called multiple times so we
-        # need to be careful to not double up the appends here and cause
-        # the base hash to mismatch the task hash
-        for uri in srcuri.split():
-            parm = bb.fetch.decodeurl(uri)[5]
-            uri_names = parm.get("name", "").split(",")
-            for uri_name in filter(None, uri_names):
-                srcrev_name = "SRCREV_{}".format(uri_name)
-                if srcrev_name not in (d.getVarFlag("do_fetch", "vardeps") or "").split():
-                    d.appendVarFlag("do_fetch", "vardeps", " {}".format(srcrev_name))
-
     set_packagetriplet(d)
 
     # 'multimachine' handling
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index e8055a9cdc5..7f55b123c4e 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -316,8 +316,12 @@ python package_get_auto_pr() {
 #
 
 python package_convert_pr_autoinc() {
-    pkgv = d.getVar("PKGV")
+    # Expand SRCPV into PKGV if not present
+    srcpv = bb.fetch.get_pkgv_string(d)
+    if srcpv:
+        d.appendVar("PKGV", srcpv)
 
+    pkgv = d.getVar("PKGV")
     # Adjust pkgv as necessary...
     if 'AUTOINC' in pkgv:
         d.setVar("PKGV", pkgv.replace("AUTOINC", "${PRSERV_PV_AUTOINC}"))
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index e90002a4e74..cba80bb1d4d 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -63,6 +63,7 @@ python () {
         else:
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
+        bb.fetch.get_hashvalue(d)
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
         for url in fetch.urls:
@@ -124,6 +125,9 @@ python () {
         d.setVarFlag('do_compile', 'file-checksums', '${@srctree_hash_files(d)}')
         d.setVarFlag('do_configure', 'file-checksums', '${@srctree_configure_hash_files(d)}')
 
+        d.appendVarFlag('do_compile', 'prefuncs', ' fetcher_hashes_dummyfunc')
+        d.appendVarFlag('do_configure', 'prefuncs', ' fetcher_hashes_dummyfunc')
+
         # We don't want the workdir to go away
         d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN'))
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 996cb2ca64e..cf7ff3328c4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -735,10 +735,7 @@ SRC_URI[vardepsexclude] += "\
 SRCDATE = "${DATE}"
 SRCREV ??= "INVALID"
 AUTOREV = "${@bb.fetch2.get_autorev(d)}"
-AUTOREV[vardepvalue] = "${SRCPV}"
-# Set Dynamically in base.bbclass
-# SRCPV = "${@bb.fetch2.get_srcrev(d)}"
-SRCPV[vardepvalue] = "${SRCPV}"
+SRCPV = ""
 
 SRC_URI = ""
 
diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index c9107022c8e..44099176fc5 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -103,7 +103,7 @@ class Dependencies(OESelftestTestCase):
 
             r = """
             LICENSE="CLOSED"
-            SRC_URI="git://example.com/repo;branch=master"
+            SRC_URI="git://example.com/repo;branch=master;rev=ffffffffffffffffffffffffffffffffffffffff"
             """
             f = self.write_recipe(textwrap.dedent(r), tempdir)
             d = tinfoil.parse_recipe_file(f)
-- 
2.39.2


