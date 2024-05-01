Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1A0C25B10
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 21:56:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.9384.1714600607032491885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 14:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M1+1esi9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41bab13ca4eso36934715e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 14:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714600605; x=1715205405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjkD+S3kNuyLh/cZa0DsYUEpdVtWmZEOywIOb5QBY3M=;
        b=M1+1esi9sNPjQOVZ90R0U6McSqEm0ekYOhFfrYJ7puTOzRGfW3B6vcypjt5EDCiHLR
         1exnv5Vfky/Nv5uGQJgsbrEGU0Y2ID2rDkhfihuqCLWFqkZxLCCB7DdTuFqWa0IphA2n
         sJLv4kGXa45g8pOXSPRIARUpxZshYNcHTLaTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714600605; x=1715205405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjkD+S3kNuyLh/cZa0DsYUEpdVtWmZEOywIOb5QBY3M=;
        b=m3FC19ZG+WLlpbZsJ2xJEPRAk80y/rPUtj+20lVJ3dVUVieUAAgbHv9uSCIhTwJ5G1
         to3O08NuAqAN+oEMN56BQFDhkhW4si8DZFxTy4F8JOSsolXzrOyoPa2YI6tCBEg4tTKe
         eaNt3POXZVMH6VEU+g2HQcqXQZuVHsCM1h/Ls7VztxSmsEPowWHlC3QqxJd0bsKJruNP
         QlCz7llO+6KR5Vq/FIFkcRFVjqno0eIJRJAMpJATk6IOWqmAoV25ikSkLWxpwMNE43sN
         3ARQfof9Azl55Lnzju3FQgbIJrFWRCUSNWb/jpQJ1zprwTUq6mUCHhwT3+N6Ge8lWw/P
         TDfA==
X-Gm-Message-State: AOJu0YzMriMaLokZbBjDXcKSn2Up4xqmFyL7EetgBJ+SUohTf9Z+xhGx
	Np8gdm+x1MB62SYv1oZ4UfSgLy+X/+tk4S54dkGj6N4MyPztGihX5na/GN7nyZ694wIrTIcJj8P
	DFPY=
X-Google-Smtp-Source: AGHT+IHm1tQCpkSi9IxEPtnYZlkzIsQRwq4yseKvq5MjEPiiVqXmUKtoP3jDLLQnPL8sV91wLVrx8Q==
X-Received: by 2002:a05:600c:b4e:b0:419:ec97:1cf1 with SMTP id k14-20020a05600c0b4e00b00419ec971cf1mr2714319wmr.20.1714600605125;
        Wed, 01 May 2024 14:56:45 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e92c:f8cd:59ee:48e5])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b0041a49b10a13sm3406986wmo.11.2024.05.01.14.56.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 14:56:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] classes/lib/scripts: Initial WORKDIR -> UNPACKDIR updates
Date: Wed,  1 May 2024 22:56:41 +0100
Message-Id: <20240501215643.3386307-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org>
References: <20240501215643.3386307-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 21:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198889

Work through the initial issues I found where we need to change WORKDIR
to UNPACKDIR.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-yocto.bbclass | 38 ++++++++++++------------
 meta/classes-recipe/kernel.bbclass       |  4 +--
 meta/classes-recipe/ptest.bbclass        |  4 +--
 meta/lib/oe/patch.py                     |  8 ++---
 scripts/lib/recipetool/append.py         |  6 ++--
 5 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 9a86616dad4..6468e8aa903 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -63,7 +63,7 @@ def find_sccs(d):
     return sources_list
 
 # check the SRC_URI for "kmeta" type'd git repositories. Return the name of
-# the repository as it will be found in WORKDIR
+# the repository as it will be found in UNPACKDIR
 def find_kernel_feature_dirs(d):
     feature_dirs=[]
     fetch = bb.fetch2.Fetch([], d)
@@ -147,24 +147,24 @@ do_kernel_metadata() {
 	# from the source tree, into a common location and normalized "defconfig" name,
 	# where the rest of the process will include and incoroporate it into the build
 	#
-	# If the fetcher has already placed a defconfig in WORKDIR (from the SRC_URI),
+	# If the fetcher has already placed a defconfig in UNPACKDIR (from the SRC_URI),
 	# we don't overwrite it, but instead warn the user that SRC_URI defconfigs take
 	# precendence.
 	#
 	if [ -n "${KBUILD_DEFCONFIG}" ]; then
 		if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
-			if [ -f "${WORKDIR}/defconfig" ]; then
+			if [ -f "${UNPACKDIR}/defconfig" ]; then
 				# If the two defconfig's are different, warn that we overwrote the
-				# one already placed in WORKDIR
-				cmp "${WORKDIR}/defconfig" "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
+				# one already placed in UNPACKDIR
+				cmp "${UNPACKDIR}/defconfig" "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}"
 				if [ $? -ne 0 ]; then
-					bbdebug 1 "detected SRC_URI or unpatched defconfig in WORKDIR. ${KBUILD_DEFCONFIG} copied over it"
+					bbdebug 1 "detected SRC_URI or unpatched defconfig in UNPACKDIR. ${KBUILD_DEFCONFIG} copied over it"
 				fi
-				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
+				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${UNPACKDIR}/defconfig
 			else
-				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
+				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${UNPACKDIR}/defconfig
 			fi
-			in_tree_defconfig="${WORKDIR}/defconfig"
+			in_tree_defconfig="${UNPACKDIR}/defconfig"
 		else
 			bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree (${S}/arch/${ARCH}/configs/)"
 		fi
@@ -178,7 +178,7 @@ do_kernel_metadata() {
 		patches="${@" ".join(find_patches(d,'kernel-meta'))}"
 		if [ -n "$patches" ]; then
 		    (
-			    cd ${WORKDIR}/kernel-meta
+			    cd ${UNPACKDIR}/kernel-meta
 
 			    # take the SRC_URI patches, and create a series file
 			    # this is required to support some better processing
@@ -193,11 +193,11 @@ do_kernel_metadata() {
 			    # handling the rest of the kernel. This allows us
 			    # more flexibility for handling failures or advanced
 			    # mergeing functinoality
-			    message=$(kgit-s2q --gen -v --patches ${WORKDIR}/kernel-meta 2>&1)
+			    message=$(kgit-s2q --gen -v --patches ${UNPACKDIR}/kernel-meta 2>&1)
 			    if [ $? -ne 0 ]; then
 				# setup to try the patch again
 				kgit-s2q --prev
-				bberror "Problem applying patches to: ${WORKDIR}/kernel-meta"
+				bberror "Problem applying patches to: ${UNPACKDIR}/kernel-meta"
 				bbfatal_log "\n($message)"
 			    fi
 			)
@@ -232,12 +232,12 @@ do_kernel_metadata() {
 	# SRC_URI. If they were supplied, we convert them into include directives
 	# for the update part of the process
 	for f in ${feat_dirs}; do
-		if [ -d "${WORKDIR}/$f/kernel-meta" ]; then
-			includes="$includes -I${WORKDIR}/$f/kernel-meta"
-		elif [ -d "${WORKDIR}/../oe-local-files/$f" ]; then
-			includes="$includes -I${WORKDIR}/../oe-local-files/$f"
-	        elif [ -d "${WORKDIR}/$f" ]; then
-			includes="$includes -I${WORKDIR}/$f"
+		if [ -d "${UNPACKDIR}/$f/kernel-meta" ]; then
+			includes="$includes -I${UNPACKDIR}/$f/kernel-meta"
+		elif [ -d "${UNPACKDIR}/../oe-local-files/$f" ]; then
+			includes="$includes -I${UNPACKDIR}/../oe-local-files/$f"
+	        elif [ -d "${UNPACKDIR}/$f" ]; then
+			includes="$includes -I${UNPACKDIR}/$f"
 		fi
 	done
 	for s in ${sccs} ${patches}; do
@@ -460,7 +460,7 @@ do_kernel_configme() {
 			config_flags=""
 			;;
 		*)
-			if [ -f ${WORKDIR}/defconfig ]; then
+			if [ -f ${UNPACKDIR}/defconfig ]; then
 				config_flags="-n"
 			fi
 			;;
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index c0a2056fec5..d6eedf942cc 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -679,8 +679,8 @@ kernel_do_configure() {
 
 	# Copy defconfig to .config if .config does not exist. This allows
 	# recipes to manage the .config themselves in do_configure:prepend().
-	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
-		cp "${WORKDIR}/defconfig" "${B}/.config"
+	if [ -f "${UNPACKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
+		cp "${UNPACKDIR}/defconfig" "${B}/.config"
 	fi
 
 	${KERNEL_CONFIG_COMMAND}
diff --git a/meta/classes-recipe/ptest.bbclass b/meta/classes-recipe/ptest.bbclass
index 348d729aef1..0941572f8f3 100644
--- a/meta/classes-recipe/ptest.bbclass
+++ b/meta/classes-recipe/ptest.bbclass
@@ -53,8 +53,8 @@ do_install_ptest() {
 }
 
 do_install_ptest_base() {
-    if [ -f ${WORKDIR}/run-ptest ]; then
-        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+    if [ -f ${UNPACKDIR}/run-ptest ]; then
+        install -D ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
     fi
 
     grep -q install-ptest: Makefile 2>/dev/null && oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 60a0cc82914..58c6e34fe83 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -882,7 +882,7 @@ class UserResolver(Resolver):
             os.chdir(olddir)
 
 
-def patch_path(url, fetch, workdir, expand=True):
+def patch_path(url, fetch, unpackdir, expand=True):
     """Return the local path of a patch, or return nothing if this isn't a patch"""
 
     local = fetch.localpath(url)
@@ -891,7 +891,7 @@ def patch_path(url, fetch, workdir, expand=True):
     base, ext = os.path.splitext(os.path.basename(local))
     if ext in ('.gz', '.bz2', '.xz', '.Z'):
         if expand:
-            local = os.path.join(workdir, base)
+            local = os.path.join(unpackdir, base)
         ext = os.path.splitext(base)[1]
 
     urldata = fetch.ud[url]
@@ -905,12 +905,12 @@ def patch_path(url, fetch, workdir, expand=True):
     return local
 
 def src_patches(d, all=False, expand=True):
-    workdir = d.getVar('WORKDIR')
+    unpackdir = d.getVar('UNPACKDIR')
     fetch = bb.fetch2.Fetch([], d)
     patches = []
     sources = []
     for url in fetch.urls:
-        local = patch_path(url, fetch, workdir, expand)
+        local = patch_path(url, fetch, unpackdir, expand)
         if not local:
             if all:
                 local = fetch.localpath(url)
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 341e8933057..10945d60084 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -101,7 +101,7 @@ def determine_file_source(targetpath, rd):
     import oe.recipeutils
 
     # See if it's in do_install for the recipe
-    workdir = rd.getVar('WORKDIR')
+    unpackdir = rd.getVar('UNPACKDIR')
     src_uri = rd.getVar('SRC_URI')
     srcfile = ''
     modpatches = []
@@ -113,9 +113,9 @@ def determine_file_source(targetpath, rd):
         if not srcpath.startswith('/'):
             # Handle non-absolute path
             srcpath = os.path.abspath(os.path.join(rd.getVarFlag('do_install', 'dirs').split()[-1], srcpath))
-        if srcpath.startswith(workdir):
+        if srcpath.startswith(unpackdir):
             # OK, now we have the source file name, look for it in SRC_URI
-            workdirfile = os.path.relpath(srcpath, workdir)
+            workdirfile = os.path.relpath(srcpath, unpackdir)
             # FIXME this is where we ought to have some code in the fetcher, because this is naive
             for item in src_uri.split():
                 localpath = bb.fetch2.localpath(item, rd)
-- 
2.40.1


