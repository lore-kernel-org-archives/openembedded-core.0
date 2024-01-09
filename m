Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426D1C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 15:37:11 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.19508.1704814626045411908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 07:37:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O6eBKeHp;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bb69bfdd96so1760056b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 07:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704814624; x=1705419424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVoIEktKryoKtaCJgyKg2YCqW7jrpU8etVx9Le4gKkk=;
        b=O6eBKeHp11SvnNQGzqk/7M6Z9grcdeQ0k1FdkDH7Iot7/c9iqTHIdNnu4CNdPqeplC
         L3T2Q4iRrNqU0gBwL14yltDyjiL/Oo/A6Mpsqil0oa4WVXaoQVgB/GrQPRZQKVfx8mvm
         vajueu66+k+cbgcEDXXuPKRUwK/AQxa9xOEHO4HGDjK6Ym3kiMRLAeMYrDvYbfpCqAjv
         j1/MzOnxd20YwxLrvp7vAIxcxonFzJ95TlQPbB8BTXlZ0lJC5/ZK1pcfuVATS2CvUfCW
         ng1LREPuz8xf3PCJrdNMsDTl0QltVHFqZYgQkzrEiHgf+97cqCR7H34c6CVxLJO9+YC3
         36LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814624; x=1705419424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVoIEktKryoKtaCJgyKg2YCqW7jrpU8etVx9Le4gKkk=;
        b=Ans4zNgXVHqmpjg/GNyk0hKo+nepuAILUVrJC80p7nk9v7IZgGO3X8IEdhzxXIkGNR
         P/ngofLtsohDP4FO5BJIEfnnP16+cScce5PiJ8gasM5WeGtumUCOatH129uTKc0W3Lhf
         /n1JmlaV7rvWJkXwtqrHOcGTh/1B6W9RrC5ok3EKKywNuBXB5FV07WuNDdzy/XuD+/gY
         zSWJMl6Lupsmxqrb6KC+qHF90TWhOYEdkblu9YCUMZ7dE8A4rhEHUxCZAFxeN8uJwa9R
         C9zaYbndsBqXibhJ0ARPd4ItB2oCZqRSZBz+TKcXXo0ZiYJoHOkLfmcGxP46up4ELjr9
         U23Q==
X-Gm-Message-State: AOJu0YztXTPww6VRYAUlU8fJA8Mgr6YVHEKJB7XqeBghpPzmmGYekKAf
	thHG86yO0DGdoWjBAvam03Tm/EzaUwo=
X-Google-Smtp-Source: AGHT+IFsZ2Xa/6S1HZ6HjjFSjAsvMtV3GUprIhPcxy5a5ZJgn5CRuvnWWuSVLBSs+53l8zBqNXhwjQ==
X-Received: by 2002:a05:6808:1911:b0:3bd:3601:84d with SMTP id bf17-20020a056808191100b003bd3601084dmr328342oib.35.1704814623793;
        Tue, 09 Jan 2024 07:37:03 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::24d0])
        by smtp.gmail.com with ESMTPSA id fa5-20020a0568082a4500b003bbc30937b2sm371414oib.4.2024.01.09.07.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 07:37:03 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] sstatesig: Ensure SPDX dependencies update when ABI safe recipes change
Date: Tue,  9 Jan 2024 08:36:51 -0700
Message-Id: <20240109153651.1732423-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 15:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193462

Because of the way that SPDX documents are linked together, the SPDX
creation tasks must re-run, even for ABI safe recipes. This sstatesig
change is more comprehensive version of the same fix found in [1],
which also has more information about the specific reproducer.

In order to this to work correctly with the concept of allarch recipes,
a few changes need to be made to the SPDX creation tasks:
 1) All tasks now have stamp-extra-info on MACHINE_ARCH, which ensure
    they are machine specific (but doesn't affect the actual stamp
    contents)
 2) All machine specific variables are excluded from signature values
    (specifically, SSTATE_PKGARCH and MACHINE_ARCH). These aren't
    necessary since the tasks are now machine dependent anyway.
 3) do_create_spdx is no longer run before do_build. Practically
    speaking, this means users should explicitly run `bitbake -c
    create_spdx <recipe>` to generate the SPDX for a specific recipe. No
    changes are needed to generate the SPDX for a complete image as the
    tasks are automatically pulled in for that case, so this should not
    affect very many users

[1]: https://lists.openembedded.org/g/openembedded-core/message/192743

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass        | 30 +++++++++++++++------
 meta/lib/oe/sstatesig.py                    |  6 +++++
 meta/lib/oeqa/selftest/cases/sstatetests.py |  2 ++
 3 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 486efadba96..ac0ec60716c 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -4,7 +4,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx"
+DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx/${MACHINE_ARCH}"
+DEPLOY_DIR_SPDX[vardepsexclude] += "MACHINE_ARCH"
 
 # The product name that the CVE database uses.  Defaults to BPN, but may need to
 # be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
@@ -100,6 +101,14 @@ python() {
         d.setVar("SPDX_LICENSE_DATA", data)
 }
 
+def unpack_deps(d):
+    # NOTE: Depending on do_unpack is a hack that is necessary to
+    # (transitively) pull in its dependencies so that source can be unpacked
+    # for reporting and archiving
+    if d.getVar("SPDX_INCLUDE_SOURCES") == "1":
+        return "do_unpack"
+    return ""
+
 def convert_license_to_spdx(lic, document, d, existing={}):
     from pathlib import Path
     import oe.spdx
@@ -502,11 +511,13 @@ python do_collect_spdx_deps() {
     with spdx_deps_file.open("w") as f:
         json.dump(deps, f)
 }
-# NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
-addtask do_collect_spdx_deps after do_unpack
+do_collect_spdx_deps[vardepsexclude] = "SSTATE_PKGARCH"
+
+addtask do_collect_spdx_deps after ${@unpack_deps(d)}
 do_collect_spdx_deps[depends] += "${PATCHDEPENDENCY}"
 do_collect_spdx_deps[deptask] = "do_create_spdx"
 do_collect_spdx_deps[dirs] = "${SPDXDIR}"
+do_collect_spdx_deps[stamp-extra-info] = "${MACHINE_ARCH}"
 
 python do_create_spdx() {
     from datetime import datetime, timezone
@@ -693,9 +704,10 @@ python do_create_spdx() {
 
             oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", indent=get_json_indent(d))
 }
-do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
-# NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
-addtask do_create_spdx after do_package do_packagedata do_unpack do_collect_spdx_deps before do_populate_sdk do_build do_rm_work
+do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS SSTATE_PKGARCH"
+addtask do_create_spdx \
+    before do_populate_sdk do_rm_work \
+    after do_package do_packagedata do_collect_spdx_deps ${@unpack_deps(d)}
 
 SSTATETASKS += "do_create_spdx"
 do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
@@ -709,6 +721,7 @@ addtask do_create_spdx_setscene
 do_create_spdx[dirs] = "${SPDXWORK}"
 do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
 do_create_spdx[depends] += "${PATCHDEPENDENCY}"
+do_create_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
 
 def collect_package_providers(d):
     from pathlib import Path
@@ -869,9 +882,9 @@ python do_create_runtime_spdx() {
             oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
-do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS"
+do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS SSTATE_PKGARCH"
 
-addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
+addtask do_create_runtime_spdx after do_create_spdx before do_rm_work
 SSTATETASKS += "do_create_runtime_spdx"
 do_create_runtime_spdx[sstate-inputdirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_runtime_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
@@ -884,6 +897,7 @@ addtask do_create_runtime_spdx_setscene
 do_create_runtime_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_runtime_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_runtime_spdx[rdeptask] = "do_create_spdx"
+do_create_runtime_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
 
 def spdx_get_src(d):
     """
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 1b4380f21bc..cf39f68a102 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -44,6 +44,12 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
             return False
         return True
 
+    # The link between do_collect_spdx_deps and do_create_spdx must be
+    # preserved in order to correctly link documents together, regardless of
+    # ABI safe status of a recipe or task
+    if task == "do_collect_spdx_deps" and deptaskname == "do_create_spdx":
+        return True
+
     # Exclude well defined recipe->dependency
     if "%s->%s" % (recipename, depname) in siggen.saferecipedeps:
         return False
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 393eaf63393..119ce5a95f5 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -510,6 +510,8 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
                         continue
                     if "qemux86copy-" in root or "qemux86-" in root:
                         continue
+                    if re.match(r'.*spdx.*\.(qemux86copy|qemux86)$', name):
+                        continue
                     if "do_build" not in name and "do_populate_sdk" not in name:
                         f.append(os.path.join(root, name))
             return f
-- 
2.34.1


