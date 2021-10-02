Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26E7C433EF
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 22:18:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.16144.1633213087145938621
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 15:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MeI63kwb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id o20so3847060wro.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Oct 2021 15:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0pO78np4xgBbyYxehqdPPX0KQFimmF/LuBQYVhiqW3s=;
        b=MeI63kwbpxRObPOXrvhbZ+bZZc05JlG/c5Ubq1YZaFJ/JoHmJQsee3KtKQOfsOFEoE
         ardmGE67NUKfRzgQnTpWTIhPbw8HDMKUkXSUsF2deOsbIFm7xbAnDEpTGBL6btBlyn/J
         Cv0XBtNJTJIzuZ5PU3/g6823XUIrz1u0cvyec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0pO78np4xgBbyYxehqdPPX0KQFimmF/LuBQYVhiqW3s=;
        b=z9jPgqoMaAGFKoUWM9Z7ZXx3nloZ2Vd6nRP6GZGH0GpulAVU8THC7TSAbddxR1IpJ+
         dIX2aBwYqDMw4VGJtsr+aLVKEo8CXDJv2W+YR+yhNLqcVTzBsKnw9PdwrmKscD17jVbR
         zjM+ZLXU21xNP2wJfSRc3Umx2DxobAKyjqrFO8wJzVPT28ktEWC4SpGge+4N1JwsFXpO
         8zzeCjw3Ua7M0R91D/YxUWdVMAYJrm489Bf9d4HoEah5XthGvjP1PNZByfvjmaiHWw8B
         2pHviV4zmLvfi8JkjYOla/8ru03cDVl+aw8tcVwzMrV6WyYXWZDCWPqywLSMBAMi1OIh
         piaA==
X-Gm-Message-State: AOAM530ui2Lpag/fgEir5p8MTFSU3Ke5B+NpYrcQWB1Uw3Rit9MQNsdW
	BkJGl6fwvQ0Yrnn3i8gf/z2rUXXM8CFSau3E
X-Google-Smtp-Source: 
 ABdhPJzuFd/AQSPDHBOZtejwA4Nqo/9wE/a56ipVQBG6wEpipemuuYOjHqdVoUW428BxBRfo0SF8fg==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr5368596wri.62.1633213085506;
        Sat, 02 Oct 2021 15:18:05 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6])
        by smtp.gmail.com with ESMTPSA id
 z8sm11172777wrm.63.2021.10.02.15.18.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 15:18:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] sstatesig: Add processing for full build paths in sysroot
 files
Date: Sat,  2 Oct 2021 23:18:00 +0100
Message-Id: <20211002221803.2283254-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
References: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Oct 2021 22:18:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156540

Some files in the populate_sysroot tasks have hardcoded paths in them,
particularly if they are postinst-useradd- files or crossscripts.

Add some filtering logic to remove these paths.

This means that the hashequiv "outhash" matches correcting in more
cases allowing for better build artefact reuse.

To make this work a new variable is added SSTATE_HASHEQUIV_FILEMAP
which maps file globbing to replacement patterns (paths or regex)
on a per sstate task basis. It is hoped this shouldn't be needed
in many cases. We are in the process to developing QA tests which
will better detect issues in this area to allow optimal sstate
reuse.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass                   |  7 ++++
 meta/lib/oe/sstatesig.py                      | 39 +++++++++++++++++--
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  7 ++++
 meta/recipes-devtools/python/python3_3.9.6.bb |  8 ++++
 .../qemu/qemuwrapper-cross_1.0.bb             |  1 +
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |  5 +++
 6 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 92a73114bb5..89e9f561787 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -67,6 +67,13 @@ SSTATE_DUPWHITELIST += "${DEPLOY_DIR_IMAGE}/microcode"
 SSTATE_SCAN_FILES ?= "*.la *-config *_config postinst-*"
 SSTATE_SCAN_CMD ??= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
 SSTATE_SCAN_CMD_NATIVE ??= 'grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE_SYSROOT_NATIVE} -e ${HOSTTOOLS_DIR} ${SSTATE_BUILDDIR}'
+SSTATE_HASHEQUIV_FILEMAP ?= " \
+    populate_sysroot:*/postinst-useradd-*:${TMPDIR} \
+    populate_sysroot:*/postinst-useradd-*:${COREBASE} \
+    populate_sysroot:*/postinst-useradd-*:regex-\s(PATH|PSEUDO_IGNORE_PATHS|HOME|LOGNAME|OMP_NUM_THREADS|USER)=.*\s \
+    populate_sysroot:*/crossscripts/*:${TMPDIR} \
+    populate_sysroot:*/crossscripts/*:${COREBASE} \
+    "
 
 BB_HASHFILENAME = "False ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 24577249ffa..0c3b4589c57 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -470,6 +470,8 @@ def OEOuthashBasic(path, sigfile, task, d):
     import stat
     import pwd
     import grp
+    import re
+    import fnmatch
 
     def update_hash(s):
         s = s.encode('utf-8')
@@ -479,6 +481,8 @@ def OEOuthashBasic(path, sigfile, task, d):
 
     h = hashlib.sha256()
     prev_dir = os.getcwd()
+    corebase = d.getVar("COREBASE")
+    tmpdir = d.getVar("TMPDIR")
     include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
     if "package_write_" in task or task == "package_qa":
         include_owners = False
@@ -489,8 +493,17 @@ def OEOuthashBasic(path, sigfile, task, d):
         include_root = False
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
+    filemaps = {}
+    for m in (d.getVar('SSTATE_HASHEQUIV_FILEMAP') or '').split():
+        entry = m.split(":")
+        if len(entry) != 3 or entry[0] != task:
+            continue
+        filemaps.setdefault(entry[1], [])
+        filemaps[entry[1]].append(entry[2])
+
     try:
         os.chdir(path)
+        basepath = os.path.normpath(path)
 
         update_hash("OEOuthashBasic\n")
         if extra_content:
@@ -572,8 +585,13 @@ def OEOuthashBasic(path, sigfile, task, d):
                 else:
                     update_hash(" " * 9)
 
+                filterfile = False
+                for entry in filemaps:
+                    if fnmatch.fnmatch(path, entry):
+                        filterfile = True
+
                 update_hash(" ")
-                if stat.S_ISREG(s.st_mode):
+                if stat.S_ISREG(s.st_mode) and not filterfile:
                     update_hash("%10d" % s.st_size)
                 else:
                     update_hash(" " * 10)
@@ -582,9 +600,24 @@ def OEOuthashBasic(path, sigfile, task, d):
                 fh = hashlib.sha256()
                 if stat.S_ISREG(s.st_mode):
                     # Hash file contents
-                    with open(path, 'rb') as d:
-                        for chunk in iter(lambda: d.read(4096), b""):
+                    if filterfile:
+                        # Need to ignore paths in crossscripts and postinst-useradd files.
+                        with open(path, 'rb') as d:
+                            chunk = d.read()
+                            chunk = chunk.replace(bytes(basepath, encoding='utf8'), b'')
+                            for entry in filemaps:
+                                if not fnmatch.fnmatch(path, entry):
+                                    continue
+                                for r in filemaps[entry]:
+                                    if r.startswith("regex-"):
+                                        chunk = re.sub(bytes(r[6:], encoding='utf8'), b'', chunk)
+                                    else:
+                                        chunk = chunk.replace(bytes(r, encoding='utf8'), b'')
                             fh.update(chunk)
+                    else:
+                        with open(path, 'rb') as d:
+                            for chunk in iter(lambda: d.read(4096), b""):
+                                fh.update(chunk)
                     update_hash(fh.hexdigest())
                 else:
                     update_hash(" " * len(fh.hexdigest()))
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index 0e0fe7f9854..175db4ee319 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -385,3 +385,10 @@ EOF
        chmod 0755 ${SYSROOT_DESTDIR}${bindir}/nativeperl
        cat ${SYSROOT_DESTDIR}${bindir}/nativeperl
 }
+
+SSTATE_HASHEQUIV_FILEMAP = " \
+    populate_sysroot:*/lib*/perl5/*/*/Config_heavy.pl:${TMPDIR} \
+    populate_sysroot:*/lib*/perl5/*/*/Config_heavy.pl:${COREBASE} \
+    populate_sysroot:*/lib*/perl5/config.sh:${TMPDIR} \
+    populate_sysroot:*/lib*/perl5/config.sh:${COREBASE} \
+    "
diff --git a/meta/recipes-devtools/python/python3_3.9.6.bb b/meta/recipes-devtools/python/python3_3.9.6.bb
index aae7837180a..d09943f891b 100644
--- a/meta/recipes-devtools/python/python3_3.9.6.bb
+++ b/meta/recipes-devtools/python/python3_3.9.6.bb
@@ -195,6 +195,14 @@ do_install:append:class-nativesdk () {
 }
 
 SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
+SSTATE_HASHEQUIV_FILEMAP = " \
+    populate_sysroot:*/lib*/python3*/_sysconfigdata*.py:${TMPDIR} \
+    populate_sysroot:*/lib*/python3*/_sysconfigdata*.py:${COREBASE} \
+    populate_sysroot:*/lib*/python3*/config-*/Makefile:${TMPDIR} \
+    populate_sysroot:*/lib*/python3*/config-*/Makefile:${COREBASE} \
+    populate_sysroot:*/lib*/python-sysconfigdata/_sysconfigdata.py:${TMPDIR} \
+    populate_sysroot:*/lib*/python-sysconfigdata/_sysconfigdata.py:${COREBASE} \
+    "
 PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 
 py_package_preprocess () {
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index a0448a18039..97b44ad2e57 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -18,6 +18,7 @@ do_install () {
 
 	cat >> ${D}${bindir_crossscripts}/${MLPREFIX}qemuwrapper << EOF
 #!/bin/sh
+# Wrapper script to run binaries under qemu user-mode emulation
 set -x
 
 if [ ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)} = False -a "${PN}" != "nativesdk-qemuwrapper-cross" ]; then
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index 60181f26c70..2ff9c2b1122 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -195,3 +195,8 @@ rpm_package_preprocess () {
 	sed -i -e 's:--sysroot[^ ]*::g' \
 	    ${PKGD}/${libdir}/rpm/macros
 }
+
+SSTATE_HASHEQUIV_FILEMAP = " \
+    populate_sysroot:*/rpm/macros:${TMPDIR} \
+    populate_sysroot:*/rpm/macros:${COREBASE} \
+    "
-- 
2.32.0


