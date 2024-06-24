Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EEFC30653
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:32:10 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.150919.1719257528829379465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cowx+3Qp;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3d2469e797fso2118676b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257526; x=1719862326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46JFKYIwHeGrZDI5BGmUK2WP1uFt4pMx/tQfBUMEpzE=;
        b=Cowx+3QpcOM4rdbpshg1fNnPKfCnKJ5DqDvehEuRRP4xfNudMsnHpnSF6FYGd/BZf6
         b5evBheUZLYreCSHdEa7k/EjCV8nv2qyZC2MhLa3Hanz5vKwjyWwQmhKaSWkp7Sfp7hD
         UMPHbi31aj4un1NJahb/2r79g9pzJ7FaTICXyPrjC9ZoRazVcj//MCw+DxLMvvlfih0v
         Aa0RvaJxgrIYfcV1hlqf/K3phDatuzfV5UUsB3nbS/1A76+IEFS1EbF9ElCA2uN7glZA
         2cRwwh6VmReBuS/2TilXYl760O3k+zQuDRDtjn3v6rTcsbNpFiKqTazNgzJU2PFHzkzK
         5TWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257526; x=1719862326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46JFKYIwHeGrZDI5BGmUK2WP1uFt4pMx/tQfBUMEpzE=;
        b=cfgv5G68TsEa80YNBDg177YQ9z6TYApr4iBhq8flbbIUMpuXK1EAVJyUDfJWkU1Rwu
         51zQTw61A+AgJbRG/DrtHQNLbIblpKmWBTwn7WOkz36Zvl2J1LxYOjhXSKkcRRYa1Lsl
         0GQuwSXwo0L3ogWvnOVFaRPZ55qoo+3CePpNwW+9EvAWUFlquQ7v7ta/LjJKFO+TwHR7
         ENV4d5JcZDFB56QmosHCMfVFcU2QRz+gcpzRn6JUj0MZSOE7V+xcjSDMBuTO67GBTXei
         CU3V/AnCE3j4+vhKHatE9srqyETxyf/MEMSOBYnEPSPaj6szdpwoqdewcGS/J5UfWUli
         7+mg==
X-Gm-Message-State: AOJu0Yy7JciY1skZAhsfKA6dD46AUx8NLUtctcvBFzpACFXD78wntXMB
	XlmH352JwKBQswpSFhzVt7c1LKsTQCyjBapswFwQ4Nn0xmmOVAPAnDNR+Q==
X-Google-Smtp-Source: AGHT+IFPuByCtIMPjcuvnoYgrESrrtKgcRTzHSIe1y8UW8UaZBAenXDB1PDolqE3TYKwhJHnf8joVA==
X-Received: by 2002:a05:6808:1595:b0:3d1:d36b:379e with SMTP id 5614622812f47-3d540328b28mr2828684b6e.26.1719257519796;
        Mon, 24 Jun 2024 12:31:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa91csm1586711b6e.19.2024.06.24.12.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:31:57 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 03/10] classes/create-spdx-3.0: Add classes
Date: Mon, 24 Jun 2024 13:10:53 -0600
Message-ID: <20240624193151.1645802-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624193151.1645802-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201106

Adds a class to generate SPDX 3.0 output and an image class that is used
when generating images

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/packagegroup.bbclass   |    2 +
 meta/classes/create-spdx-3.0.bbclass       | 1179 ++++
 meta/classes/create-spdx-image-3.0.bbclass |  224 +
 meta/classes/spdx-common.bbclass           |    6 +-
 meta/lib/oe/sbom30.py                      | 1122 ++++
 meta/lib/oe/spdx30.py                      | 5996 ++++++++++++++++++++
 6 files changed, 8528 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/classes/create-spdx-image-3.0.bbclass
 create mode 100644 meta/lib/oe/sbom30.py
 create mode 100644 meta/lib/oe/spdx30.py

diff --git a/meta/classes-recipe/packagegroup.bbclass b/meta/classes-recipe=
/packagegroup.bbclass
index cf6fc354a81..2099c8b37d6 100644
--- a/meta/classes-recipe/packagegroup.bbclass
+++ b/meta/classes-recipe/packagegroup.bbclass
@@ -56,6 +56,8 @@ deltask do_populate_sysroot
=20
 do_create_runtime_spdx[deptask] =3D "do_create_spdx"
 do_create_runtime_spdx[rdeptask] =3D ""
+do_create_package_spdx[deptask] =3D "do_create_spdx"
+do_create_package_spdx[rdeptask] =3D ""
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
=20
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass
new file mode 100644
index 00000000000..ac84bb0ca26
--- /dev/null
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -0,0 +1,1179 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+inherit spdx-common
+
+SPDX_VERSION =3D "3.0.0"
+
+# The list of SPDX profiles generated documents will conform to
+SPDX_PROFILES ?=3D "core build software simpleLicensing security"
+
+SPDX_INCLUDE_BUILD_VARIABLES ??=3D "0"
+SPDX_INCLUDE_BUILD_VARIABLES[doc] =3D "If set to '1', the bitbake variable=
s for a \
+    recipe will be included in the Build object"
+
+SPDX_IMPORTS ??=3D ""
+SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variable that describes ho=
w to \
+    reference external SPDX ids. Each import is defined as a key in this \
+    variable with a suffix to describe to as a suffix to look up more \
+    information about the import. Each key can have the following variable=
s: \
+        SPDX_IMPORTS_<key>_spdxid: The Fully qualified SPDX ID of the obje=
ct \
+        SPDX_IMPORTS_<key>_uri: The URI where the SPDX Document that conta=
ins \
+            the external object can be found. Optional but recommended \
+        SPDX_IMPORTS_<key>_hash_<hash>: The Checksum of the SPDX Document =
that \
+            contains the External ID. <hash> must be one the valid SPDX ha=
shing \
+            algorithms, as described by the HashAlgorithm vocabulary in th=
e\
+            SPDX 3 spec. Optional but recommended \
+"
+
+# Agents
+#   Bitbake variables can be used to describe an SPDX Agent that may be us=
ed
+#   during the build. An Agent is specified using a set of variables which=
 all
+#   start with some common base name:
+#
+#   <BASE>_name: The name of the Agent (required)
+#   <BASE>_type: The type of Agent. Must be one of "person", "organization=
",
+#       "software", or "agent" (the default if not specified)
+#   <BASE>_comment: The comment for the Agent (optional)
+#   <BASE>_id_<ID>: And External Identifier for the Agent. <ID> must be a =
valid
+#       ExternalIdentifierType from the SPDX 3 spec. Commonly, an E-mail a=
ddress
+#       can be specified with <BASE>_id_email
+#
+#   Alternatively, an Agent can be an external reference by referencing a =
key
+#   in SPDX_IMPORTS like so:
+#
+#   <BASE>_import =3D "<key>"
+#
+#   Finally, the same agent described by another set of agent variables ca=
n be
+#   referenced by specifying the basename of the variable that should be
+#   referenced:
+#
+#   SPDX_PACKAGE_SUPPLIER_ref =3D "SPDX_AUTHORS_openembedded"
+
+SPDX_AUTHORS ??=3D "openembedded"
+SPDX_AUTHORS[doc] =3D "A space separated list of the document authors. Eac=
h item \
+    is used to name a base variable like SPDX_AUTHORS_<AUTHOR> that \
+    describes the author."
+
+SPDX_AUTHORS_openembedded_name =3D "OpenEmbedded"
+SPDX_AUTHORS_openembedded_type =3D "organization"
+
+SPDX_BUILD_HOST[doc] =3D "The base variable name to describe the build hos=
t on \
+    which a build is running. Must be an SPDX_IMPORTS key"
+
+SPDX_INVOKED_BY[doc] =3D "The base variable name to describe the Agent tha=
t \
+    invoked the build, which builds will link to if specified."
+
+SPDX_ON_BEHALF_OF[doc] =3D "The base variable name to describe the Agent o=
n who's \
+    behalf the invoking Agent (SPDX_INVOKED_BY) is running the build."
+
+SPDX_PACKAGE_SUPPLIER[doc] =3D "The base variable name to describe the Age=
nt who is supplying \
+    artifacts produced by the build"
+
+SPDX_PACKAGE_ADDITIONAL_PURPOSE ?=3D ""
+SPDX_PACKAGE_ADDITIONAL_PURPOSE[doc] =3D "The list of additional purposes =
to assign to \
+    the generated packages for a recipe. The primary purpose is always `in=
stall`. \
+    Packages overrides are allowed to override the additional purposes for=
 \
+    individual packages."
+
+SPDX_IMAGE_PURPOSE ?=3D "filesystemImage"
+SPDX_IMAGE_PURPOSE[doc] =3D "The list of purposes to assign to the generat=
ed images. \
+    The first listed item will be the Primary Purpose and all additional i=
tems will \
+    be added as additional purposes"
+
+SPDX_SDK_PURPOSE ?=3D "install"
+SPDX_SDK_PURPOSE[doc] =3D "The list of purposes to assign to the generate =
SDK installer. \
+    The first listed item will be the Primary Purpose and all additional i=
tems will \
+    be added as additional purposes"
+
+SPDX_INCLUDE_VEX ??=3D "current"
+SPDX_INCLUDE_VEX[doc] =3D "Controls what VEX information is in the output.=
 Set to \
+    'none' to disable all VEX data. Set to 'current' to only include VEX d=
ata \
+    for vulnerabilities not already fixed in the upstream source code \
+    (recommended). Set  to 'all' to get all known historical vulnerabiliti=
es, \
+    including those already fixed upstream (warning: This can be large and=
 \
+    slow)."
+
+IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
+
+def add_license_expression(d, objset, license_expression):
+    from pathlib import Path
+    import oe.spdx30
+    import oe.sbom30
+
+    license_data =3D d.getVar("SPDX_LICENSE_DATA")
+    simple_license_text =3D {}
+    license_text_map =3D {}
+    license_ref_idx =3D 0
+
+    def add_license_text(name):
+        nonlocal objset
+        nonlocal simple_license_text
+
+        if name in simple_license_text:
+            return simple_license_text[name]
+
+        lic =3D objset.find_filter(
+            oe.spdx30.simplelicensing_SimpleLicensingText,
+            name=3Dname,
+        )
+
+        if lic is not None:
+            simple_license_text[name] =3D lic
+            return lic
+
+        lic =3D objset.add(oe.spdx30.simplelicensing_SimpleLicensingText(
+            _id=3Dobjset.new_spdxid("license-text", name),
+            creationInfo=3Dobjset.doc.creationInfo,
+            name=3Dname,
+        ))
+        simple_license_text[name] =3D lic
+
+        if name =3D=3D "PD":
+            lic.simplelicensing_licenseText =3D "Software released to the =
public domain"
+            return lic
+
+        # Seach for the license in COMMON_LICENSE_DIR and LICENSE_PATH
+        for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar('LIC=
ENSE_PATH') or '').split():
+            try:
+                with (Path(directory) / name).open(errors=3D"replace") as =
f:
+                    lic.simplelicensing_licenseText =3D f.read()
+                    return lic
+
+            except FileNotFoundError:
+                pass
+
+        # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be set
+        filename =3D d.getVarFlag('NO_GENERIC_LICENSE', name)
+        if filename:
+            filename =3D d.expand("${S}/" + filename)
+            with open(filename, errors=3D"replace") as f:
+                lic.simplelicensing_licenseText =3D f.read()
+                return lic
+        else:
+            bb.fatal("Cannot find any text for license %s" % name)
+
+    def convert(l):
+        nonlocal license_text_map
+        nonlocal license_ref_idx
+
+        if l =3D=3D "(" or l =3D=3D ")":
+            return l
+
+        if l =3D=3D "&":
+            return "AND"
+
+        if l =3D=3D "|":
+            return "OR"
+
+        if l =3D=3D "CLOSED":
+            return "NONE"
+
+        spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
+        if spdx_license in license_data["licenses"]:
+            return spdx_license
+
+        spdx_license =3D "LicenseRef-" + l
+        if spdx_license not in license_text_map:
+            license_text_map[spdx_license] =3D add_license_text(l)._id
+
+        return spdx_license
+
+    lic_split =3D license_expression.replace("(", " ( ").replace(")", " ) =
").replace("|", " | ").replace("&", " & ").split()
+    spdx_license_expression =3D ' '.join(convert(l) for l in lic_split)
+
+    return objset.new_license_expression(spdx_license_expression, license_=
text_map)
+
+
+def add_package_files(d, objset, topdir, get_spdxid, get_purposes, *, arch=
ive=3DNone, ignore_dirs=3D[], ignore_top_level_dirs=3D[]):
+    from pathlib import Path
+    import oe.spdx30
+    import oe.sbom30
+
+    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
+    if source_date_epoch:
+        source_date_epoch =3D int(source_date_epoch)
+
+    spdx_files =3D set()
+
+    file_counter =3D 1
+    for subdir, dirs, files in os.walk(topdir):
+        dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
+        if subdir =3D=3D str(topdir):
+            dirs[:] =3D [d for d in dirs if d not in ignore_top_level_dirs]
+
+        for file in files:
+            filepath =3D Path(subdir) / file
+            if filepath.is_symlink() or not filepath.is_file():
+                continue
+
+            bb.debug(1, "Adding file %s to %s" % (filepath, objset.doc._id=
))
+
+            filename =3D str(filepath.relative_to(topdir))
+            file_purposes =3D get_purposes(filepath)
+
+            spdx_file =3D objset.new_file(
+                get_spdxid(file_counter),
+                filename,
+                filepath,
+                purposes=3Dfile_purposes,
+            )
+            spdx_files.add(spdx_file)
+
+            if oe.spdx30.software_SoftwarePurpose.source in file_purposes:
+                objset.scan_declared_licenses(spdx_file, filepath)
+
+            if archive is not None:
+                with filepath.open("rb") as f:
+                    info =3D archive.gettarinfo(fileobj=3Df)
+                    info.name =3D filename
+                    info.uid =3D 0
+                    info.gid =3D 0
+                    info.uname =3D "root"
+                    info.gname =3D "root"
+
+                    if source_date_epoch is not None and info.mtime > sour=
ce_date_epoch:
+                        info.mtime =3D source_date_epoch
+
+                    archive.addfile(info, f)
+
+            file_counter +=3D 1
+
+    return spdx_files
+
+
+def get_package_sources_from_debug(d, package, package_files, sources, sou=
rce_hash_cache):
+    from pathlib import Path
+    import oe.packagedata
+
+    def file_path_match(file_path, pkg_file):
+        if file_path.lstrip("/") =3D=3D pkg_file.name.lstrip("/"):
+            return True
+
+        for e in pkg_file.extension:
+            if isinstance(e, oe.sbom30.OEFileNameAliasExtension):
+                for a in e.aliases:
+                    if file_path.lstrip("/") =3D=3D a.lstrip("/"):
+                        return True
+
+        return False
+
+    debug_search_paths =3D [
+        Path(d.getVar('PKGD')),
+        Path(d.getVar('STAGING_DIR_TARGET')),
+        Path(d.getVar('STAGING_DIR_NATIVE')),
+        Path(d.getVar('STAGING_KERNEL_DIR')),
+    ]
+
+    pkg_data =3D oe.packagedata.read_subpkgdata_extended(package, d)
+
+    if pkg_data is None:
+        return
+
+    dep_source_files =3D set()
+
+    for file_path, file_data in pkg_data["files_info"].items():
+        if not "debugsrc" in file_data:
+            continue
+
+        if not any(file_path_match(file_path, pkg_file) for pkg_file in pa=
ckage_files):
+            bb.fatal("No package file found for %s in %s; SPDX found: %s" =
% (str(file_path), package,
+                " ".join(p.name for p in package_files)))
+            continue
+
+        for debugsrc in file_data["debugsrc"]:
+            for search in debug_search_paths:
+                if debugsrc.startswith("/usr/src/kernel"):
+                    debugsrc_path =3D search / debugsrc.replace('/usr/src/=
kernel/', '')
+                else:
+                    debugsrc_path =3D search / debugsrc.lstrip("/")
+
+                if debugsrc_path in source_hash_cache:
+                    file_sha256 =3D source_hash_cache[debugsrc_path]
+                    if file_sha256 is None:
+                        continue
+                else:
+                    if not debugsrc_path.exists():
+                        source_hash_cache[debugsrc_path] =3D None
+                        continue
+
+                    file_sha256 =3D bb.utils.sha256_file(debugsrc_path)
+                    source_hash_cache[debugsrc_path] =3D file_sha256
+
+                if file_sha256 in sources:
+                    source_file =3D sources[file_sha256]
+                    dep_source_files.add(source_file)
+                else:
+                    bb.debug(1, "Debug source %s with SHA256 %s not found =
in any dependency" % (str(debugsrc_path), file_sha256))
+                break
+            else:
+                bb.debug(1, "Debug source %s not found" % debugsrc)
+
+    return dep_source_files
+
+get_package_sources_from_debug[vardepsexclude] +=3D "STAGING_KERNEL_DIR"
+
+def collect_dep_objsets(d, build):
+    import json
+    from pathlib import Path
+    import oe.sbom30
+    import oe.spdx30
+
+    deps =3D get_spdx_deps(d)
+
+    dep_objsets =3D []
+    dep_builds =3D set()
+
+    dep_build_spdxids =3D set()
+    for dep_pn, _, in_taskhash  in deps:
+        bb.debug(1, "Fetching SPDX for dependency %s" % (dep_pn))
+        dep_build, dep_objset =3D oe.sbom30.find_root_obj_in_jsonld(d, "re=
cipes", dep_pn, oe.spdx30.build_Build)
+        # If the dependency is part of the taskhash, return it to be linked
+        # against. Otherwise, it cannot be linked against because this rec=
ipe
+        # will not rebuilt if dependency changes
+        if in_taskhash:
+            dep_objsets.append(dep_objset)
+
+        # The build _can_ be linked against (by alias)
+        dep_builds.add(dep_build)
+
+    return dep_objsets, dep_builds
+
+collect_dep_objsets[vardepsexclude] =3D "SSTATE_ARCHS"
+
+def collect_dep_sources(dep_objsets):
+    import oe.spdx30
+    import oe.sbom30
+
+    sources =3D {}
+    for objset in dep_objsets:
+        # Don't collect sources from native recipes as they
+        # match non-native sources also.
+        if objset.is_native():
+            continue
+
+        bb.debug(1, "Fetching Sources for dependency %s" % (objset.doc.nam=
e))
+
+        dep_build =3D objset.find_root(oe.spdx30.build_Build)
+        if not dep_build:
+            bb.fatal("Unable to find a build")
+
+        for e in objset.foreach_type(oe.spdx30.Relationship):
+            if dep_build is not e.from_:
+                continue
+
+            if e.relationshipType !=3D oe.spdx30.RelationshipType.hasInput=
s:
+                continue
+
+            for to in e.to:
+                if not isinstance(to, oe.spdx30.software_File):
+                    continue
+
+                if to.software_primaryPurpose !=3D oe.spdx30.software_Soft=
warePurpose.source:
+                    continue
+
+                for v in to.verifiedUsing:
+                    if v.algorithm =3D=3D oe.spdx30.HashAlgorithm.sha256:
+                        sources[v.hashValue] =3D to
+                        break
+                else:
+                    bb.fatal("No SHA256 found for %s in %s" % (to.name, ob=
jset.doc.name))
+
+    return sources
+
+def add_download_files(d, objset):
+    import oe.patch
+    import oe.spdx30
+    import os
+
+    inputs =3D set()
+
+    urls =3D d.getVar("SRC_URI").split()
+    fetch =3D bb.fetch2.Fetch(urls, d)
+
+    for download_idx, src_uri in enumerate(urls):
+        fd =3D fetch.ud[src_uri]
+
+        for name in fd.names:
+            file_name =3D os.path.basename(fetch.localpath(src_uri))
+            if oe.patch.patch_path(src_uri, fetch, '', expand=3DFalse):
+                primary_purpose =3D oe.spdx30.software_SoftwarePurpose.pat=
ch
+            else:
+                primary_purpose =3D oe.spdx30.software_SoftwarePurpose.sou=
rce
+
+            if fd.type =3D=3D "file":
+                if os.path.isdir(fd.localpath):
+                    walk_idx =3D 1
+                    for root, dirs, files in os.walk(fd.localpath):
+                        for f in files:
+                            f_path =3D os.path.join(root, f)
+                            if os.path.islink(f_path):
+                                # TODO: SPDX doesn't support symlinks yet
+                                continue
+
+                            file =3D objset.new_file(
+                                objset.new_spdxid("source", str(download_i=
dx + 1), str(walk_idx)),
+                                os.path.join(file_name, os.path.relpath(f_=
path, fd.localpath)),
+                                f_path,
+                                purposes=3D[primary_purpose],
+                            )
+
+                            inputs.add(file)
+                            walk_idx +=3D 1
+
+                else:
+                    file =3D objset.new_file(
+                        objset.new_spdxid("source", str(download_idx + 1)),
+                        file_name,
+                        fd.localpath,
+                        purposes=3D[primary_purpose],
+                    )
+                    inputs.add(file)
+
+            else:
+                uri =3D fd.type
+                proto =3D getattr(fd, "proto", None)
+                if proto is not None:
+                    uri =3D uri + "+" + proto
+                uri =3D uri + "://" + fd.host + fd.path
+
+                if fd.method.supports_srcrev():
+                    uri =3D uri + "@" + fd.revisions[name]
+
+                dl =3D objset.add(oe.spdx30.software_Package(
+                    _id=3Dobjset.new_spdxid("source", str(download_idx + 1=
)),
+                    creationInfo=3Dobjset.doc.creationInfo,
+                    name=3Dfile_name,
+                    software_primaryPurpose=3Dprimary_purpose,
+                    software_downloadLocation=3Duri,
+                ))
+
+                if fd.method.supports_checksum(fd):
+                    # TODO Need something better than hard coding this
+                    for checksum_id in ["sha256", "sha1"]:
+                        expected_checksum =3D getattr(fd, "%s_expected" % =
checksum_id, None)
+                        if expected_checksum is None:
+                            continue
+
+                        dl.verifiedUsing.append(
+                            oe.spdx30.Hash(
+                                algorithm=3Dgetattr(oe.spdx30.HashAlgorith=
m, checksum_id),
+                                hashValue=3Dexpected_checksum,
+                            )
+                        )
+
+                inputs.add(dl)
+
+    return inputs
+
+
+def collect_build_package_inputs(d, objset, build, packages):
+    providers =3D collect_package_providers(d)
+
+    build_deps =3D set()
+
+    for name in sorted(packages.keys()):
+        if name not in providers:
+            bb.fatal("Unable to find SPDX provider for '%s'" % name)
+
+        pkg_name, pkg_hashfn =3D providers[name]
+
+        # Copy all of the package SPDX files into the Sbom elements
+        pkg_spdx, _ =3D oe.sbom30.find_root_obj_in_jsonld(
+            d,
+            "packages",
+            pkg_name,
+            oe.spdx30.software_Package,
+            software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose.i=
nstall,
+        )
+        build_deps.add(pkg_spdx._id)
+
+    if build_deps:
+        objset.new_scoped_relationship(
+            [build],
+            oe.spdx30.RelationshipType.hasInputs,
+            oe.spdx30.LifecycleScopeType.build,
+            sorted(list(build_deps)),
+        )
+
+def set_purposes(d, element, *var_names, force_purposes=3D[]):
+    purposes =3D force_purposes[:]
+
+    for var_name in var_names:
+        val =3D d.getVar(var_name)
+        if val:
+            purposes.extend(val.split())
+            break
+
+    if not purposes:
+        bb.warn("No SPDX purposes found in %s" % " ".join(var_names))
+        return
+
+    element.software_primaryPurpose =3D getattr(oe.spdx30.software_Softwar=
ePurpose, purposes[0])
+    element.software_additionalPurpose =3D [getattr(oe.spdx30.software_Sof=
twarePurpose, p) for p in purposes[1:]]
+
+
+python do_create_spdx() {
+    import oe.sbom30
+    import oe.spdx30
+    from pathlib import Path
+    from contextlib import contextmanager
+    import oe.cve_check
+    from datetime import datetime
+
+    def set_var_field(var, obj, name, package=3DNone):
+        val =3D None
+        if package:
+            val =3D d.getVar("%s:%s" % (var, package))
+
+        if not val:
+            val =3D d.getVar(var)
+
+        if val:
+            setattr(obj, name, val)
+
+    deploydir =3D Path(d.getVar("SPDXDEPLOY"))
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+    spdx_workdir =3D Path(d.getVar("SPDXWORK"))
+    include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
+    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
+    is_native =3D bb.data.inherits_class("native", d) or bb.data.inherits_=
class("cross", d)
+    include_vex =3D d.getVar("SPDX_INCLUDE_VEX")
+    if not include_vex in ("none", "current", "all"):
+        bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'all'=
")
+
+    build_objset =3D oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"))
+
+    build =3D build_objset.new_sub_build("recipe", "recipe")
+    build_objset.doc.rootElement.append(build)
+
+    build_objset.set_is_native(is_native)
+
+    for var in (d.getVar('SPDX_CUSTOM_ANNOTATION_VARS') or "").split():
+        new_annotation(
+            d,
+            build_objset,
+            build,
+            "%s=3D%s" % (var, d.getVar(var)),
+            oe.spdx30.AnnotationType.other
+        )
+
+    build_inputs =3D set()
+
+    # Add CVEs
+    cve_by_status =3D {}
+    if include_vex !=3D "none":
+        for cve in (d.getVarFlags("CVE_STATUS") or {}):
+            status, detail, description =3D oe.cve_check.decode_cve_status=
(d, cve)
+
+            # If this CVE is fixed upstream, skip it unless all CVEs are
+            # specified.
+            if include_vex !=3D "all" and detail in ("fixed-version", "cpe=
-stable-backport"):
+                bb.debug(1, "Skipping %s since it is already fixed upstrea=
m" % cve)
+                continue
+
+            cve_by_status.setdefault(status, {})[cve] =3D (
+                build_objset.new_cve_vuln(cve),
+                detail,
+                description,
+            )
+
+    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar=
("CVE_VERSION"))
+
+    source_files =3D add_download_files(d, build_objset)
+    build_inputs |=3D source_files
+
+    recipe_spdx_license =3D add_license_expression(d, build_objset, d.getV=
ar("LICENSE"))
+    build_objset.new_relationship(
+        source_files,
+        oe.spdx30.RelationshipType.hasConcludedLicense,
+        [recipe_spdx_license],
+    )
+
+    if process_sources(d) and include_sources:
+        bb.debug(1, "Adding source files to SPDX")
+        spdx_get_src(d)
+
+        build_inputs |=3D add_package_files(
+            d,
+            build_objset,
+            spdx_workdir,
+            lambda file_counter: build_objset.new_spdxid("sourcefile", str=
(file_counter)),
+            lambda filepath: [oe.spdx30.software_SoftwarePurpose.source],
+            ignore_dirs=3D[".git"],
+            ignore_top_level_dirs=3D["temp"],
+            archive=3DNone,
+        )
+
+
+    dep_objsets, dep_builds =3D collect_dep_objsets(d, build)
+    if dep_builds:
+        build_objset.new_scoped_relationship(
+            [build],
+            oe.spdx30.RelationshipType.dependsOn,
+            oe.spdx30.LifecycleScopeType.build,
+            sorted(oe.sbom30.get_element_link_id(b) for b in dep_builds),
+        )
+
+    debug_source_ids =3D set()
+    source_hash_cache =3D {}
+
+    # Write out the package SPDX data now. It is not complete as we cannot
+    # write the runtime data, so write it to a staging area and a later ta=
sk
+    # will write out the final collection
+
+    # TODO: Handle native recipe output
+    if not is_native:
+        bb.debug(1, "Collecting Dependency sources files")
+        sources =3D collect_dep_sources(dep_objsets)
+
+        bb.build.exec_func("read_subpackage_metadata", d)
+
+        pkgdest =3D Path(d.getVar("PKGDEST"))
+        for package in d.getVar("PACKAGES").split():
+            if not oe.packagedata.packaged(package, d):
+                continue
+
+            pkg_name =3D d.getVar("PKG:%s" % package) or package
+
+            bb.debug(1, "Creating SPDX for package %s" % pkg_name)
+
+            pkg_objset =3D oe.sbom30.ObjectSet.new_objset(d, pkg_name)
+
+            spdx_package =3D pkg_objset.add_root(oe.spdx30.software_Packag=
e(
+                _id=3Dpkg_objset.new_spdxid("package", pkg_name),
+                creationInfo=3Dpkg_objset.doc.creationInfo,
+                name=3Dpkg_name,
+                software_packageVersion=3Dd.getVar("PV"),
+                builtTime=3Doe.sbom30.spdx_now(),
+            ))
+
+            set_purposes(
+                d,
+                spdx_package,
+                "SPDX_PACKAGE_ADDITIONAL_PURPOSE:%s" % package,
+                "SPDX_PACKAGE_ADDITIONAL_PURPOSE",
+                force_purposes=3D["install"],
+            )
+
+
+            supplier =3D build_objset.new_agent("SPDX_PACKAGE_SUPPLIER")
+            if supplier is not None:
+                spdx_package.supplier =3D supplier if isinstance(supplier,=
 str) else supplier._id
+
+            set_var_field("HOMEPAGE", spdx_package, "software_homePage", p=
ackage=3Dpackage)
+            set_var_field("SUMMARY", spdx_package, "summary", package=3Dpa=
ckage)
+            set_var_field("DESCRIPTION", spdx_package, "description", pack=
age=3Dpackage)
+
+            pkg_objset.new_scoped_relationship(
+                [build._id],
+                oe.spdx30.RelationshipType.hasOutputs,
+                oe.spdx30.LifecycleScopeType.build,
+                [spdx_package],
+            )
+
+            for cpe_id in cpe_ids:
+                spdx_package.externalIdentifier.append(
+                    oe.spdx30.ExternalIdentifier(
+                        externalIdentifierType=3Doe.spdx30.ExternalIdentif=
ierType.cpe23,
+                        identifier=3Dcpe_id,
+                ))
+
+            # TODO: Generate a file for each actual IPK/DEB/RPM/TGZ file
+            # generated and link it to the package
+            #spdx_package_file =3D pkg_objset.add(oe.spdx30.software_File(
+            #    _id=3Dpkg_objset.new_spdxid("distribution", pkg_name),
+            #    creationInfo=3Dpkg_objset.doc.creationInfo,
+            #    name=3Dpkg_name,
+            #    builtTime=3Doe.sbom30.spdx_now(),
+            #    software_primaryPurpose=3Dspdx_package.software_primaryPu=
rpose,
+            #    software_additionalPurpose=3Dspdx_package.software_additi=
onalPurpose,
+            #))
+
+            ## TODO add hashes
+            #pkg_objset.new_relationship(
+            #    [spdx_package],
+            #    oe.spdx30.RelationshipType.hasDistributionArtifact,
+            #    [spdx_package_file],
+            #)
+
+            # NOTE: licenses live in the recipe collection and are referen=
ced
+            # by ID in the package collection(s). This helps reduce duplic=
ation
+            # (since a lot of packages will have the same license), and al=
so
+            # prevents duplicate license SPDX IDs in the packages
+            package_license =3D d.getVar("LICENSE:%s" % package)
+            if package_license and package_license !=3D d.getVar("LICENSE"=
):
+                package_spdx_license =3D add_license_expression(d, build_o=
bjset, package_license)
+            else:
+                package_spdx_license =3D recipe_spdx_license
+
+            pkg_objset.new_relationship(
+                [spdx_package],
+                oe.spdx30.RelationshipType.hasConcludedLicense,
+                [package_spdx_license._id],
+            )
+
+            # NOTE: CVE Elements live in the recipe collection
+            all_cves =3D set()
+            for status, cves in cve_by_status.items():
+                for cve, items in cves.items():
+                    spdx_cve, detail, description =3D items
+
+                    all_cves.add(spdx_cve._id)
+
+                    if status =3D=3D "Patched":
+                        pkg_objset.new_vex_patched_relationship([spdx_cve.=
_id], [spdx_package])
+                    elif status =3D=3D "Unpatched":
+                        pkg_objset.new_vex_unpatched_relationship([spdx_cv=
e._id], [spdx_package])
+                    elif status =3D=3D "Ignored":
+                        spdx_vex =3D pkg_objset.new_vex_ignored_relationsh=
ip(
+                            [spdx_cve._id],
+                            [spdx_package],
+                            impact_statement=3Ddescription,
+                        )
+
+                        if detail in ("ignored", "cpe-incorrect", "dispute=
d", "upstream-wontfix"):
+                            # VEX doesn't have justifications for this
+                            pass
+                        elif detail in ("not-applicable-config", "not-appl=
icable-platform"):
+                            for v in spdx_vex:
+                                v.security_justificationType =3D oe.spdx30=
.security_VexJustificationType.vulnerableCodeNotPresent
+                        else:
+                            bb.fatal(f"Unknown detail '{detail}' for ignor=
ed {cve}")
+                    else:
+                        bb.fatal(f"Unknown CVE status {status}")
+
+            if all_cves:
+                pkg_objset.new_relationship(
+                    [spdx_package],
+                    oe.spdx30.RelationshipType.hasAssociatedVulnerability,
+                    sorted(list(all_cves)),
+                )
+
+            bb.debug(1, "Adding package files to SPDX for package %s" % pk=
g_name)
+            package_files =3D add_package_files(
+                d,
+                pkg_objset,
+                pkgdest / package,
+                lambda file_counter: pkg_objset.new_spdxid("package", pkg_=
name, "file", str(file_counter)),
+                # TODO: Can we know the purpose here?
+                lambda filepath: [],
+                ignore_top_level_dirs=3D['CONTROL', 'DEBIAN'],
+                archive=3DNone,
+            )
+
+            if package_files:
+                pkg_objset.new_relationship(
+                    [spdx_package],
+                    oe.spdx30.RelationshipType.contains,
+                    sorted(list(package_files)),
+                )
+
+            if include_sources:
+                debug_sources =3D get_package_sources_from_debug(d, packag=
e, package_files, sources, source_hash_cache)
+                debug_source_ids |=3D set(oe.sbom30.get_element_link_id(d)=
 for d in debug_sources)
+
+            oe.sbom30.write_recipe_jsonld_doc(d, pkg_objset, "packages-sta=
ging", deploydir, create_spdx_id_links=3DFalse)
+
+    if include_sources:
+        bb.debug(1, "Adding sysroot files to SPDX")
+        sysroot_files =3D add_package_files(
+            d,
+            build_objset,
+            d.expand("${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"),
+            lambda file_counter: build_objset.new_spdxid("sysroot", str(fi=
le_counter)),
+            lambda filepath: [],
+            archive=3DNone,
+        )
+
+        if sysroot_files:
+            build_objset.new_scoped_relationship(
+                [build],
+                oe.spdx30.RelationshipType.hasOutputs,
+                oe.spdx30.LifecycleScopeType.build,
+                sorted(list(sysroot_files)),
+            )
+
+    if build_inputs or debug_source_ids:
+        build_objset.new_scoped_relationship(
+            [build],
+            oe.spdx30.RelationshipType.hasInputs,
+            oe.spdx30.LifecycleScopeType.build,
+            sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
+        )
+
+    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploydi=
r)
+}
+do_create_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS"
+addtask do_create_spdx after \
+    do_collect_spdx_deps \
+    do_populate_sysroot do_package do_packagedata \
+    ${create_spdx_source_deps(d)} \
+    do_package_write_ipk do_package_write_deb do_package_write_rpm do_pack=
age_write_tar \
+    before do_populate_sdk do_populate_sdk_ext do_build do_rm_work
+
+def create_spdx_source_deps(d):
+    deps =3D []
+    if d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1":
+        deps.extend([
+            # do_unpack is a hack for now; we only need it to get the
+            # dependencies do_unpack already has so we can extract the sou=
rce
+            # ourselves
+            "do_unpack",
+            # For kernel source code
+            "do_shared_workdir",
+        ])
+    return " ".join(deps)
+
+SSTATETASKS +=3D "do_create_spdx"
+do_create_spdx[sstate-inputdirs] =3D "${SPDXDEPLOY}"
+do_create_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
+
+python do_create_spdx_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_spdx_setscene
+
+do_create_spdx[dirs] =3D "${SPDXWORK}"
+do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
+do_create_spdx[depends] +=3D "${PATCHDEPENDENCY}"
+
+python do_create_package_spdx() {
+    import oe.sbom30
+    import oe.spdx30
+    import oe.packagedata
+    from pathlib import Path
+
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+    deploydir =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
+    is_native =3D bb.data.inherits_class("native", d) or bb.data.inherits_=
class("cross", d)
+
+    providers =3D collect_package_providers(d)
+    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
+
+    if not is_native:
+        bb.build.exec_func("read_subpackage_metadata", d)
+
+        dep_package_cache =3D {}
+
+        # Any element common to all packages that need to be referenced by=
 ID
+        # should be written into this objset set
+        common_objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-package-co=
mmon" % d.getVar("PN"))
+
+        pkgdest =3D Path(d.getVar("PKGDEST"))
+        for package in d.getVar("PACKAGES").split():
+            localdata =3D bb.data.createCopy(d)
+            pkg_name =3D d.getVar("PKG:%s" % package) or package
+            localdata.setVar("PKG", pkg_name)
+            localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + "=
:" + package)
+
+            if not oe.packagedata.packaged(package, localdata):
+                continue
+
+            spdx_package, pkg_objset =3D oe.sbom30.load_obj_in_jsonld(
+                d,
+                pkg_arch,
+                "packages-staging",
+                pkg_name,
+                oe.spdx30.software_Package,
+                software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpo=
se.install,
+            )
+
+            # We will write out a new collection, so link it to the new
+            # creation info in the common package data. The old creation i=
nfo
+            # should still exist and be referenced by all the existing ele=
ments
+            # in the package
+            pkg_objset.creationInfo =3D pkg_objset.copy_creation_info(comm=
on_objset.doc.creationInfo)
+
+            runtime_spdx_deps =3D set()
+
+            deps =3D bb.utils.explode_dep_versions2(localdata.getVar("RDEP=
ENDS") or "")
+            seen_deps =3D set()
+            for dep, _ in deps.items():
+                if dep in seen_deps:
+                    continue
+
+                if dep not in providers:
+                    continue
+
+                (dep, _) =3D providers[dep]
+
+                if not oe.packagedata.packaged(dep, localdata):
+                    continue
+
+                dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(dep, =
d)
+                dep_pkg =3D dep_pkg_data["PKG"]
+
+                if dep in dep_package_cache:
+                    dep_spdx_package =3D dep_package_cache[dep]
+                else:
+                    bb.debug(1, "Searching for %s" % dep_pkg)
+                    dep_spdx_package, _ =3D oe.sbom30.find_root_obj_in_jso=
nld(
+                        d,
+                        "packages-staging",
+                        dep_pkg,
+                        oe.spdx30.software_Package,
+                        software_primaryPurpose=3Doe.spdx30.software_Softw=
arePurpose.install,
+                    )
+                    dep_package_cache[dep] =3D dep_spdx_package
+
+                runtime_spdx_deps.add(dep_spdx_package)
+                seen_deps.add(dep)
+
+            if runtime_spdx_deps:
+                pkg_objset.new_scoped_relationship(
+                    [spdx_package],
+                    oe.spdx30.RelationshipType.dependsOn,
+                    oe.spdx30.LifecycleScopeType.runtime,
+                    [oe.sbom30.get_element_link_id(dep) for dep in runtime=
_spdx_deps],
+                )
+
+            oe.sbom30.write_recipe_jsonld_doc(d, pkg_objset, "packages", d=
eploydir)
+
+        oe.sbom30.write_recipe_jsonld_doc(d, common_objset, "common-packag=
e", deploydir)
+}
+
+do_create_package_spdx[vardepsexclude] +=3D "OVERRIDES SSTATE_ARCHS"
+
+addtask do_create_package_spdx after do_create_spdx before do_build do_rm_=
work
+SSTATETASKS +=3D "do_create_package_spdx"
+do_create_package_spdx[sstate-inputdirs] =3D "${SPDXRUNTIMEDEPLOY}"
+do_create_package_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
+
+python do_create_package_spdx_setscene () {
+    sstate_setscene(d)
+}
+addtask do_create_package_spdx_setscene
+
+do_create_package_spdx[dirs] =3D "${SPDXRUNTIMEDEPLOY}"
+do_create_package_spdx[cleandirs] =3D "${SPDXRUNTIMEDEPLOY}"
+do_create_package_spdx[rdeptask] =3D "do_create_spdx"
+
+do_populate_sdk[recrdeptask] +=3D "do_create_spdx do_create_package_spdx"
+do_populate_sdk[cleandirs] +=3D "${SPDXSDKWORK}"
+do_populate_sdk[postfuncs] +=3D "sdk_create_sbom"
+POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " sdk_host_cre=
ate_spdx"
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sdk_target=
_create_spdx"
+
+do_populate_sdk_ext[recrdeptask] +=3D "do_create_spdx do_create_package_sp=
dx"
+do_populate_sdk_ext[cleandirs] +=3D "${SPDXSDKEXTWORK}"
+do_populate_sdk_ext[postfuncs] +=3D "sdk_ext_create_sbom"
+POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext =3D " sdk_ext_=
host_create_spdx"
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext =3D " sdk_ex=
t_target_create_spdx"
+
+python sdk_host_create_spdx() {
+    from pathlib import Path
+    spdx_work_dir =3D Path(d.getVar('SPDXSDKWORK'))
+
+    sdk_create_spdx(d, "host", spdx_work_dir, d.getVar("TOOLCHAIN_OUTPUTNA=
ME"))
+}
+
+python sdk_target_create_spdx() {
+    from pathlib import Path
+    spdx_work_dir =3D Path(d.getVar('SPDXSDKWORK'))
+
+    sdk_create_spdx(d, "target", spdx_work_dir, d.getVar("TOOLCHAIN_OUTPUT=
NAME"))
+}
+
+python sdk_ext_host_create_spdx() {
+    from pathlib import Path
+    spdx_work_dir =3D Path(d.getVar('SPDXSDKEXTWORK'))
+
+    # TODO: This doesn't seem to work
+    sdk_create_spdx(d, "host", spdx_work_dir, d.getVar("TOOLCHAINEXT_OUTPU=
TNAME"))
+}
+
+python sdk_ext_target_create_spdx() {
+    from pathlib import Path
+    spdx_work_dir =3D Path(d.getVar('SPDXSDKEXTWORK'))
+
+    # TODO: This doesn't seem to work
+    sdk_create_spdx(d, "target", spdx_work_dir, d.getVar("TOOLCHAINEXT_OUT=
PUTNAME"))
+}
+
+def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
+    from pathlib import Path
+    from oe.sdk import sdk_list_installed_packages
+    import oe.spdx30
+    import oe.sbom30
+    from datetime import datetime
+
+    sdk_name =3D toolchain_outputname + "-" + sdk_type
+    sdk_packages =3D sdk_list_installed_packages(d, sdk_type =3D=3D "targe=
t")
+
+    objset =3D oe.sbom30.ObjectSet.new_objset(d, sdk_name)
+
+    sdk_rootfs =3D objset.add_root(oe.spdx30.software_Package(
+        _id=3Dobjset.new_spdxid("sdk-rootfs", sdk_name),
+        creationInfo=3Dobjset.doc.creationInfo,
+        name=3Dsdk_name,
+        software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose.archi=
ve,
+        builtTime=3Doe.sbom30.spdx_now(),
+    ))
+
+    sdk_build =3D objset.add_root(objset.new_sub_build("sdk-rootfs", "sdk-=
rootfs"))
+    sdk_build.build_buildEndTime =3D oe.sbom30.spdx_now()
+
+    objset.new_scoped_relationship(
+        [sdk_build],
+        oe.spdx30.RelationshipType.hasOutputs,
+        oe.spdx30.LifecycleScopeType.build,
+        [sdk_rootfs],
+    )
+
+    collect_build_package_inputs(d, objset, sdk_build, sdk_packages)
+
+    objset.add_aliases()
+    oe.sbom30.write_jsonld_doc(d, objset, spdx_work_dir / "sdk-rootfs.spdx=
.json")
+
+python sdk_create_sbom() {
+    from pathlib import Path
+    sdk_deploydir =3D Path(d.getVar("SDKDEPLOYDIR"))
+    spdx_work_dir =3D Path(d.getVar('SPDXSDKWORK'))
+
+    create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, d.getVar("TOOLCHAIN_O=
UTPUTNAME"))
+}
+
+python sdk_ext_create_sbom() {
+    from pathlib import Path
+    sdk_deploydir =3D Path(d.getVar("SDKEXTDEPLOYDIR"))
+    spdx_work_dir =3D Path(d.getVar('SPDXSDKEXTWORK'))
+
+    create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, d.getVar("TOOLCHAINEX=
T_OUTPUTNAME"))
+}
+
+def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
+    import oe.spdx30
+    import oe.sbom30
+    from pathlib import Path
+    from datetime import datetime
+
+    now =3D oe.sbom30.spdx_now()
+
+    # Load the document written earlier
+    rootfs_objset =3D oe.sbom30.load_jsonld(d, spdx_work_dir / "sdk-rootfs=
.spdx.json", required=3DTrue)
+
+    # Create a new build for the SDK installer
+    sdk_build =3D rootfs_objset.new_sub_build("sdk-populate", "sdk-populat=
e")
+    sdk_build.build_buildEndTime =3D oe.sbom30.spdx_now()
+
+    rootfs =3D rootfs_objset.find_root(oe.spdx30.software_Package)
+    if rootfs is None:
+        bb.fatal("Unable to find rootfs artifact")
+
+    rootfs_objset.new_scoped_relationship(
+        [sdk_build],
+        oe.spdx30.RelationshipType.hasInputs,
+        oe.spdx30.LifecycleScopeType.build,
+        [rootfs]
+    )
+
+    files =3D set()
+    root_files =3D []
+
+    # NOTE: os.walk() doesn't return symlinks
+    for dirpath, dirnames, filenames in os.walk(sdk_deploydir):
+        for fn in filenames:
+            fpath =3D Path(dirpath) / fn
+            if not fpath.is_file() or fpath.is_symlink():
+                continue
+
+            relpath =3D str(fpath.relative_to(sdk_deploydir))
+
+            f =3D rootfs_objset.new_file(
+                rootfs_objset.new_spdxid("sdk-installer", relpath),
+                relpath,
+                fpath,
+            )
+            f.builtTime =3D now
+
+            if fn.endswith(".manifest"):
+                f.software_primaryPurpose =3D oe.spdx30.software_SoftwareP=
urpose.manifest
+            elif fn.endswith(".testdata.json"):
+                f.software_primaryPurpose =3D oe.spdx30.software_SoftwareP=
urpose.configuration
+            else:
+                set_purposes(d, f, "SPDX_SDK_PURPOSE")
+                root_files.append(f)
+
+            files.add(f)
+
+    if files:
+        rootfs_objset.new_scoped_relationship(
+            [sdk_build],
+            oe.spdx30.RelationshipType.hasOutputs,
+            oe.spdx30.LifecycleScopeType.build,
+            files,
+        )
+    else:
+        bb.warn(f"No SDK output files found in {sdk_deploydir}")
+
+    objset, sbom =3D oe.sbom30.create_sbom(d, toolchain_outputname, sorted=
(list(files)), [rootfs_objset])
+
+    oe.sbom30.write_jsonld_doc(d, objset, sdk_deploydir / (toolchain_outpu=
tname + ".spdx.json"))
+
+python spdx30_build_started_handler () {
+    import oe.spdx30
+    import oe.sbom30
+    import os
+    from pathlib import Path
+
+    # Create a copy of the datastore. Set PN to "bitbake" so that SPDX IDs=
 can
+    # be generated
+    d =3D e.data.createCopy()
+    d.setVar("PN", "bitbake")
+    d.setVar("BB_TASKHASH", "bitbake")
+    load_spdx_license_data(d)
+
+    deploy_dir_spdx =3D Path(e.data.getVar("DEPLOY_DIR_SPDX"))
+
+    nonce =3D os.urandom(16).hex()
+
+    objset =3D oe.sbom30.ObjectSet.new_objset(d, "bitbake", False)
+
+    build =3D objset.add_root(oe.spdx30.build_Build(
+        _id=3Dobjset.new_spdxid(nonce, include_unihash=3DFalse),
+        creationInfo=3Dobjset.doc.creationInfo,
+        build_buildType=3Doe.sbom30.SPDX_BUILD_TYPE,
+        build_buildStartTime=3Doe.sbom30.spdx_now()
+    ))
+
+    host_import_key =3D d.getVar("SPDX_BUILD_HOST")
+    if host_import_key:
+        objset.new_scoped_relationship(
+            [build],
+            oe.spdx30.RelationshipType.hasHost,
+            oe.spdx30.LifecycleScopeType.build,
+            [objset.new_import("SPDX_BUILD_HOST")],
+        )
+
+    invoked_by =3D objset.new_agent("SPDX_INVOKED_BY")
+    if invoked_by:
+        invoked_by_spdx =3D objset.new_scoped_relationship(
+            [build],
+            oe.spdx30.RelationshipType.invokedBy,
+            oe.spdx30.LifecycleScopeType.build,
+            [invoked_by],
+        )
+
+        on_behalf_of =3D objset.new_agent("SPDX_ON_BEHALF_OF")
+        if on_behalf_of:
+            objset.new_scoped_relationship(
+                [on_behalf_of],
+                oe.spdx30.RelationshipType.delegatedTo,
+                oe.spdx30.LifecycleScopeType.build,
+                invoked_by_spdx,
+            )
+
+    for obj in objset.foreach_type(oe.spdx30.Element):
+        obj.extension.append(oe.sbom30.OELinkExtension(link_spdx_id=3DFals=
e))
+        obj.extension.append(oe.sbom30.OEIdAliasExtension())
+
+    oe.sbom30.write_jsonld_doc(d, objset, deploy_dir_spdx / "bitbake.spdx.=
json")
+}
+
+addhandler spdx30_build_started_handler
+spdx30_build_started_handler[eventmask] =3D "bb.event.ConfigParsed"
+
diff --git a/meta/classes/create-spdx-image-3.0.bbclass b/meta/classes/crea=
te-spdx-image-3.0.bbclass
new file mode 100644
index 00000000000..31e6f25d29a
--- /dev/null
+++ b/meta/classes/create-spdx-image-3.0.bbclass
@@ -0,0 +1,224 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# SPDX image tasks
+
+SPDX_ROOTFS_PACKAGES =3D "${SPDXDIR}/rootfs-packages.json"
+SPDXIMAGEDEPLOYDIR =3D "${SPDXDIR}/image-deploy"
+SPDXROOTFSDEPLOY =3D "${SPDXDIR}/rootfs-deploy"
+
+python spdx_collect_rootfs_packages() {
+    import json
+    from pathlib import Path
+    from oe.rootfs import image_list_installed_packages
+
+    root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
+
+    packages =3D image_list_installed_packages(d)
+    if not packages:
+        packages =3D {}
+
+    root_packages_file.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
+    with root_packages_file.open("w") as f:
+        json.dump(packages, f)
+}
+ROOTFS_POSTUNINSTALL_COMMAND =3D+ "spdx_collect_rootfs_packages"
+
+python do_create_rootfs_spdx() {
+    import json
+    from pathlib import Path
+    import oe.spdx30
+    import oe.sbom30
+    from datetime import datetime
+
+    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+    deploydir =3D Path(d.getVar("SPDXROOTFSDEPLOY"))
+    root_packages_file =3D Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
+    image_basename =3D d.getVar("IMAGE_BASENAME")
+    machine =3D d.getVar("MACHINE")
+
+    with root_packages_file.open("r") as f:
+        packages =3D json.load(f)
+
+    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename=
, machine))
+
+    rootfs =3D objset.add_root(oe.spdx30.software_Package(
+        _id=3Dobjset.new_spdxid("rootfs", image_basename),
+        creationInfo=3Dobjset.doc.creationInfo,
+        name=3Dimage_basename,
+        software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpose.archi=
ve,
+        builtTime=3Doe.sbom30.spdx_now()
+    ))
+
+    rootfs_build =3D objset.add_root(objset.new_sub_build("rootfs", "rootf=
s"))
+    rootfs_build.build_buildEndTime =3D oe.sbom30.spdx_now()
+
+    objset.new_scoped_relationship(
+        [rootfs_build],
+        oe.spdx30.RelationshipType.hasOutputs,
+        oe.spdx30.LifecycleScopeType.build,
+        [rootfs],
+    )
+
+    collect_build_package_inputs(d, objset, rootfs_build, packages)
+
+    oe.sbom30.write_recipe_jsonld_doc(d, objset, "rootfs", deploydir)
+}
+addtask do_create_rootfs_spdx after do_rootfs before do_image
+SSTATETASKS +=3D "do_create_rootfs_spdx"
+do_create_rootfs_spdx[sstate-inputdirs] =3D "${SPDXROOTFSDEPLOY}"
+do_create_rootfs_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
+do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx do_create_package_=
spdx"
+do_create_rootfs_spdx[cleandirs] +=3D "${SPDXROOTFSDEPLOY}"
+
+python do_create_rootfs_spdx_setscene() {
+    sstate_setscene(d)
+}
+addtask do_create_rootfs_spdx_setscene
+
+python do_create_image_spdx() {
+    import oe.spdx30
+    import oe.sbom30
+    import json
+    from pathlib import Path
+
+    image_deploy_dir =3D Path(d.getVar('IMGDEPLOYDIR'))
+    manifest_path =3D Path(d.getVar("IMAGE_FILE_MANIFEST"))
+    spdx_work_dir =3D Path(d.getVar('SPDXIMAGEWORK'))
+
+    image_basename =3D d.getVar('IMAGE_BASENAME')
+    machine =3D d.getVar("MACHINE")
+
+    objset =3D oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename=
, machine))
+
+    with manifest_path.open("r") as f:
+        manifest =3D json.load(f)
+
+    builds =3D []
+    for task in manifest:
+        imagetype =3D task["imagetype"]
+        taskname =3D task["taskname"]
+
+        image_build =3D objset.add_root(objset.new_sub_build(taskname, "im=
age/%s" % imagetype))
+        image_build.build_buildEndTime =3D oe.sbom30.spdx_now()
+        builds.append(image_build)
+
+        artifacts =3D []
+
+        for image in task["images"]:
+            image_filename =3D image["filename"]
+            image_path =3D image_deploy_dir / image_filename
+            a =3D objset.add_root(oe.spdx30.software_File(
+                _id=3Dobjset.new_spdxid("image", image_filename),
+                creationInfo=3Dobjset.doc.creationInfo,
+                name=3Dimage_filename,
+                builtTime=3Doe.sbom30.spdx_now(),
+                verifiedUsing=3D[
+                    oe.spdx30.Hash(
+                        algorithm=3Doe.spdx30.HashAlgorithm.sha256,
+                        hashValue=3Dbb.utils.sha256_file(image_path),
+                    )
+                ]
+            ))
+            set_purposes(d, a, "SPDX_IMAGE_PURPOSE:%s" % imagetype, "SPDX_=
IMAGE_PURPOSE")
+
+            artifacts.append(a)
+
+        if artifacts:
+            objset.new_scoped_relationship(
+                [image_build],
+                oe.spdx30.RelationshipType.hasOutputs,
+                oe.spdx30.LifecycleScopeType.build,
+                artifacts,
+            )
+
+    if builds:
+        rootfs_image, _ =3D oe.sbom30.find_root_obj_in_jsonld(
+            d,
+            "rootfs",
+            "%s-%s" % (image_basename, machine),
+            oe.spdx30.software_Package,
+            # TODO: Should use a purpose to filter here?
+        )
+        objset.new_scoped_relationship(
+            builds,
+            oe.spdx30.RelationshipType.hasInputs,
+            oe.spdx30.LifecycleScopeType.build,
+            [rootfs_image._id],
+        )
+
+    objset.add_aliases()
+    objset.link()
+    oe.sbom30.write_recipe_jsonld_doc(d, objset, "image", spdx_work_dir)
+}
+addtask do_create_image_spdx after do_image_complete do_create_rootfs_spdx=
 before do_build
+SSTATETASKS +=3D "do_create_image_spdx"
+SSTATE_SKIP_CREATION:task-combine-image-type-spdx =3D "1"
+do_create_image_spdx[sstate-inputdirs] =3D "${SPDXIMAGEWORK}"
+do_create_image_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
+do_create_image_spdx[cleandirs] =3D "${SPDXIMAGEWORK}"
+do_create_image_spdx[dirs] =3D "${SPDXIMAGEWORK}"
+
+python do_create_image_spdx_setscene() {
+    sstate_setscene(d)
+}
+addtask do_create_image_spdx_setscene
+
+
+python do_create_image_sbom() {
+    import os
+    from pathlib import Path
+    import oe.spdx30
+    import oe.sbom30
+
+    image_name =3D d.getVar("IMAGE_NAME")
+    image_basename =3D d.getVar("IMAGE_BASENAME")
+    image_link_name =3D d.getVar("IMAGE_LINK_NAME")
+    imgdeploydir =3D Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
+    machine =3D d.getVar("MACHINE")
+
+    spdx_path =3D imgdeploydir / (image_name + ".spdx.json")
+
+    root_elements =3D []
+
+    # TODO: Do we need to add the rootfs or are the image files sufficient?
+    rootfs_image, _ =3D oe.sbom30.find_root_obj_in_jsonld(
+        d,
+        "rootfs",
+        "%s-%s" % (image_basename, machine),
+        oe.spdx30.software_Package,
+        # TODO: Should use a purpose here?
+    )
+    root_elements.append(rootfs_image._id)
+
+    image_objset, _ =3D oe.sbom30.find_jsonld(d, "image", "%s-%s" % (image=
_basename, machine), required=3DTrue)
+    for o in image_objset.foreach_root(oe.spdx30.software_File):
+        root_elements.append(o._id)
+
+    objset, sbom =3D oe.sbom30.create_sbom(d, image_name, root_elements)
+
+    oe.sbom30.write_jsonld_doc(d, objset, spdx_path)
+
+    def make_image_link(target_path, suffix):
+        if image_link_name:
+            link =3D imgdeploydir / (image_link_name + suffix)
+            if link !=3D target_path:
+                link.symlink_to(os.path.relpath(target_path, link.parent))
+
+    make_image_link(spdx_path, ".spdx.json")
+}
+addtask do_create_image_sbom after do_create_rootfs_spdx do_create_image_s=
pdx before do_build
+SSTATETASKS +=3D "do_create_image_sbom"
+SSTATE_SKIP_CREATION:task-create-image-sbom =3D "1"
+do_create_image_sbom[sstate-inputdirs] =3D "${SPDXIMAGEDEPLOYDIR}"
+do_create_image_sbom[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
+do_create_image_sbom[stamp-extra-info] =3D "${MACHINE_ARCH}"
+do_create_image_sbom[cleandirs] =3D "${SPDXIMAGEDEPLOYDIR}"
+do_create_image_sbom[recrdeptask] +=3D "do_create_spdx do_create_package_s=
pdx"
+
+python do_create_image_sbom_setscene() {
+    sstate_setscene(d)
+}
+addtask do_create_image_sbom_setscene
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bb=
class
index 03f1d0cc278..9dee325ba6b 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -17,6 +17,7 @@ SPDXDEPLOY =3D "${SPDXDIR}/deploy"
 SPDXWORK =3D "${SPDXDIR}/work"
 SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
 SPDXSDKWORK =3D "${SPDXDIR}/sdk-work"
+SPDXSDKEXTWORK =3D "${SPDXDIR}/sdk-ext-work"
 SPDXDEPS =3D "${SPDXDIR}/deps.json"
=20
 SPDX_TOOL_NAME ??=3D "oe-spdx-creator"
@@ -68,7 +69,7 @@ def get_json_indent(d):
         return 2
     return None
=20
-python() {
+def load_spdx_license_data(d):
     import json
     if d.getVar("SPDX_LICENSE_DATA"):
         return
@@ -78,6 +79,9 @@ python() {
         # Transform the license array to a dictionary
         data["licenses"] =3D {l["licenseId"]: l for l in data["licenses"]}
         d.setVar("SPDX_LICENSE_DATA", data)
+
+python() {
+    load_spdx_license_data(d)
 }
=20
 def process_sources(d):
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
new file mode 100644
index 00000000000..2180438ce4c
--- /dev/null
+++ b/meta/lib/oe/sbom30.py
@@ -0,0 +1,1122 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+from pathlib import Path
+
+import oe.spdx30
+import bb
+import re
+import hashlib
+import uuid
+import os
+from datetime import datetime, timezone
+
+OE_SPDX_BASE =3D "https://rdf.openembedded.org/spdx/3.0/"
+
+VEX_VERSION =3D "1.0.0"
+
+SPDX_BUILD_TYPE =3D "http://openembedded.org/bitbake"
+
+
+@oe.spdx30.register(OE_SPDX_BASE + "link-extension")
+class OELinkExtension(oe.spdx30.extension_Extension):
+    """
+    This custom extension controls if an Element creates a symlink based on
+    its SPDX ID in the deploy directory. Some elements may not be able to =
be
+    linked because they are duplicated in multiple documents (e.g. the bit=
bake
+    Build Element). Those elements can add this extension and set link_spd=
x_id
+    to False
+
+    It is in internal extension that should be removed when writing out a =
final
+    SBoM
+    """
+
+    CLOSED =3D True
+    INTERNAL =3D True
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        cls._add_property(
+            "link_spdx_id",
+            oe.spdx30.BooleanProp(),
+            OE_SPDX_BASE + "link-spdx-id",
+            min_count=3D1,
+            max_count=3D1,
+        )
+
+        # The symlinks written to the deploy directory are based on the ha=
sh of
+        # the SPDX ID. While this makes it easy to look them up, it can be
+        # difficult to trace a Element to the hashed symlink name. As a
+        # debugging aid, this property is set to the basename of the symli=
nk
+        # when the symlink is created to make it easier to trace
+        cls._add_property(
+            "link_name",
+            oe.spdx30.StringProp(),
+            OE_SPDX_BASE + "link-name",
+            max_count=3D1,
+        )
+
+
+@oe.spdx30.register(OE_SPDX_BASE + "id-alias")
+class OEIdAliasExtension(oe.spdx30.extension_Extension):
+    """
+    This extension allows an Element to provide an internal alias for the =
SPDX
+    ID. Since SPDX requires unique URIs for each SPDX ID, most of the obje=
cts
+    created have a unique UUID namespace and the unihash of the task encod=
ed in
+    their SPDX ID. However, this causes a problem for referencing documents
+    across recipes, since the taskhash of a dependency may not factor into=
 the
+    taskhash of the current task and thus the current task won't rebuild a=
nd
+    see the new SPDX ID when the dependency changes (e.g. ABI safe recipes=
 and
+    tasks).
+
+    To help work around this, this extension provides a non-unique alias f=
or an
+    Element by which it can be referenced from other tasks/recipes. When a
+    final SBoM is created, references to these aliases will be replaced wi=
th
+    the actual unique SPDX ID.
+
+    Most Elements will automatically get an alias created when they are wr=
itten
+    out if they do not already have one. To suppress the creation of an al=
ias,
+    add an extension with a blank `alias` property.
+
+
+    It is in internal extension that should be removed when writing out a =
final
+    SBoM
+    """
+
+    CLOSED =3D True
+    INTERNAL =3D True
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        cls._add_property(
+            "alias",
+            oe.spdx30.StringProp(),
+            OE_SPDX_BASE + "alias",
+            max_count=3D1,
+        )
+
+        cls._add_property(
+            "link_name",
+            oe.spdx30.StringProp(),
+            OE_SPDX_BASE + "link-name",
+            max_count=3D1,
+        )
+
+
+@oe.spdx30.register(OE_SPDX_BASE + "file-name-alias")
+class OEFileNameAliasExtension(oe.spdx30.extension_Extension):
+    CLOSED =3D True
+    INTERNAL =3D True
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        cls._add_property(
+            "aliases",
+            oe.spdx30.ListProp(oe.spdx30.StringProp()),
+            OE_SPDX_BASE + "filename-alias",
+        )
+
+
+@oe.spdx30.register(OE_SPDX_BASE + "license-scanned")
+class OELicenseScannedExtension(oe.spdx30.extension_Extension):
+    """
+    The presence of this extension means the file has already been scanned=
 for
+    license information
+    """
+
+    CLOSED =3D True
+    INTERNAL =3D True
+
+
+@oe.spdx30.register(OE_SPDX_BASE + "document-extension")
+class OEDocumentExtension(oe.spdx30.extension_Extension):
+    """
+    This extension is added to a SpdxDocument to indicate various useful b=
its
+    of information about its contents
+    """
+
+    CLOSED =3D True
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        cls._add_property(
+            "is_native",
+            oe.spdx30.BooleanProp(),
+            OE_SPDX_BASE + "is-native",
+            max_count=3D1,
+        )
+
+
+def spdxid_hash(*items):
+    h =3D hashlib.md5()
+    for i in items:
+        if isinstance(i, oe.spdx30.Element):
+            h.update(i._id.encode("utf-8"))
+        else:
+            h.update(i.encode("utf-8"))
+    return h.hexdigest()
+
+
+def spdx_now():
+    return datetime.now(timezone.utc)
+
+
+def get_element_link_id(e):
+    """
+    Get the string ID which should be used to link to an Element. If the
+    element has an alias, that will be preferred, otherwise its SPDX ID wi=
ll be
+    used.
+    """
+    ext =3D get_alias(e)
+    if ext is not None and ext.alias:
+        return ext.alias
+    return e._id
+
+
+def set_alias(obj, alias):
+    for ext in obj.extension:
+        if not isinstance(ext, OEIdAliasExtension):
+            continue
+        ext.alias =3D alias
+        return ext
+
+    ext =3D OEIdAliasExtension(alias=3Dalias)
+    obj.extension.append(ext)
+    return ext
+
+
+def get_alias(obj):
+    for ext in obj.extension:
+        if not isinstance(ext, OEIdAliasExtension):
+            continue
+        return ext
+
+    return None
+
+
+def extract_licenses(filename):
+    lic_regex =3D re.compile(
+        rb"^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$", r=
e.MULTILINE
+    )
+
+    try:
+        with open(filename, "rb") as f:
+            size =3D min(15000, os.stat(filename).st_size)
+            txt =3D f.read(size)
+            licenses =3D re.findall(lic_regex, txt)
+            if licenses:
+                ascii_licenses =3D [lic.decode("ascii") for lic in license=
s]
+                return ascii_licenses
+    except Exception as e:
+        bb.warn(f"Exception reading {filename}: {e}")
+    return []
+
+
+def to_list(l):
+    if isinstance(l, set):
+        l =3D sorted(list(l))
+
+    if not isinstance(l, (list, tuple)):
+        raise TypeError("Must be a list or tuple. Got %s" % type(l))
+
+    return l
+
+
+class ObjectSet(oe.spdx30.SHACLObjectSet):
+    def __init__(self, d):
+        super().__init__()
+        self.d =3D d
+
+    def create_index(self):
+        self.by_sha256_hash =3D {}
+        super().create_index()
+
+    def add_index(self, obj):
+        # Check that all elements are given an ID before being inserted
+        if isinstance(obj, oe.spdx30.Element):
+            if not obj._id:
+                raise ValueError("Element missing ID")
+            for ext in obj.extension:
+                if not isinstance(ext, OEIdAliasExtension):
+                    continue
+                if ext.alias:
+                    self.obj_by_id[ext.alias] =3D obj
+
+            for v in obj.verifiedUsing:
+                if not isinstance(v, oe.spdx30.Hash):
+                    continue
+
+                if v.algorithm =3D=3D oe.spdx30.HashAlgorithm.sha256:
+                    continue
+
+                self.by_sha256_hash.setdefault(v.hashValue, set()).add(obj)
+
+        super().add_index(obj)
+        if isinstance(obj, oe.spdx30.SpdxDocument):
+            self.doc =3D obj
+
+    def __filter_obj(self, obj, attr_filter):
+        return all(getattr(obj, k) =3D=3D v for k, v in attr_filter.items(=
))
+
+    def foreach_filter(self, typ, *, match_subclass=3DTrue, **attr_filter):
+        for obj in self.foreach_type(typ, match_subclass=3Dmatch_subclass):
+            if self.__filter_obj(obj, attr_filter):
+                yield obj
+
+    def find_filter(self, typ, *, match_subclass=3DTrue, **attr_filter):
+        for obj in self.foreach_filter(
+            typ, match_subclass=3Dmatch_subclass, **attr_filter
+        ):
+            return obj
+        return None
+
+    def foreach_root(self, typ, **attr_filter):
+        for obj in self.doc.rootElement:
+            if not isinstance(obj, typ):
+                continue
+
+            if self.__filter_obj(obj, attr_filter):
+                yield obj
+
+    def find_root(self, typ, **attr_filter):
+        for obj in self.foreach_root(typ, **attr_filter):
+            return obj
+        return None
+
+    def add_root(self, obj):
+        self.add(obj)
+        self.doc.rootElement.append(obj)
+        return obj
+
+    def is_native(self):
+        for e in self.doc.extension:
+            if not isinstance(e, oe.sbom30.OEDocumentExtension):
+                continue
+
+            if e.is_native is not None:
+                return e.is_native
+
+        return False
+
+    def set_is_native(self, is_native):
+        for e in self.doc.extension:
+            if not isinstance(e, oe.sbom30.OEDocumentExtension):
+                continue
+
+            e.is_native =3D is_native
+            return
+
+        if is_native:
+            self.doc.extension.append(oe.sbom30.OEDocumentExtension(is_nat=
ive=3DTrue))
+
+    def add_aliases(self):
+        for o in self.foreach_type(oe.spdx30.Element):
+            if not o._id or o._id.startswith("_:"):
+                continue
+
+            alias_ext =3D get_alias(o)
+            if alias_ext is None:
+                unihash =3D self.d.getVar("BB_UNIHASH")
+                namespace =3D self.get_namespace()
+                if unihash not in o._id:
+                    bb.warn(f"Unihash {unihash} not found in {o._id}")
+                elif namespace not in o._id:
+                    bb.warn(f"Namespace {namespace} not found in {o._id}")
+                else:
+                    alias_ext =3D set_alias(
+                        o,
+                        o._id.replace(unihash, "UNIHASH").replace(
+                            namespace, self.d.getVar("PN")
+                        ),
+                    )
+
+    def remove_internal_extensions(self):
+        def remove(o):
+            o.extension =3D [e for e in o.extension if not getattr(e, "INT=
ERNAL", False)]
+
+        for o in self.foreach_type(oe.spdx30.Element):
+            remove(o)
+
+        if self.doc:
+            remove(self.doc)
+
+    def get_namespace(self):
+        namespace_uuid =3D uuid.uuid5(
+            uuid.NAMESPACE_DNS, self.d.getVar("SPDX_UUID_NAMESPACE")
+        )
+        pn =3D self.d.getVar("PN")
+        return "%s/%s-%s" % (
+            self.d.getVar("SPDX_NAMESPACE_PREFIX"),
+            pn,
+            str(uuid.uuid5(namespace_uuid, pn)),
+        )
+
+    def new_spdxid(self, *suffix, include_unihash=3DTrue):
+        items =3D [self.get_namespace()]
+        if include_unihash:
+            unihash =3D self.d.getVar("BB_UNIHASH")
+            items.append(unihash)
+        items.extend(re.sub(r"[^a-zA-Z0-9_-]", "_", s) for s in suffix)
+        return "/".join(items)
+
+    def new_import(self, key):
+        base =3D f"SPDX_IMPORTS_{key}"
+        spdxid =3D self.d.getVar(f"{base}_spdxid")
+        if not spdxid:
+            bb.fatal(f"{key} is not a valid SPDX_IMPORTS key")
+
+        for i in self.docs.imports:
+            if i.externalSpdxId =3D=3D spdxid:
+                # Already imported
+                return spdxid
+
+        m =3D oe.spdx30.ExternalMap(externalSpdxId=3Dspdxid)
+
+        uri =3D self.d.getVar(f"{base}_uri")
+        if uri:
+            m.locationHint =3D uri
+
+        for pyname, algorithm in oe.spdx30.HashAlgorithm.NAMED_INDIVIDUALS=
.items():
+            value =3D self.d.getVar(f"{base}_hash_{pyname}")
+            if value:
+                m.verifiedUsing.append(
+                    oe.spdx30.Hash(
+                        algorithm=3Dalgorithm,
+                        hashValue=3Dvalue,
+                    )
+                )
+
+        self.doc.imports.append(m)
+        return spdxid
+
+    def new_agent(self, varname, *, creation_info=3DNone):
+        ref_varname =3D self.d.getVar(f"{varname}_ref")
+        if ref_varname:
+            if ref_varname =3D=3D varname:
+                bb.fatal(f"{varname} cannot reference itself")
+            return new_agent(varname, creation_info=3Dcreation_info)
+
+        import_key =3D self.d.getVar(f"{varname}_import")
+        if import_key:
+            return self.new_import(import_key)
+
+        name =3D self.d.getVar(f"{varname}_name")
+        if not name:
+            return None
+
+        spdxid =3D self.new_spdxid("agent", name)
+        agent =3D self.find_by_id(spdxid)
+        if agent is not None:
+            return agent
+
+        agent_type =3D self.d.getVar("%s_type" % varname)
+        if agent_type =3D=3D "person":
+            agent =3D oe.spdx30.Person()
+        elif agent_type =3D=3D "software":
+            agent =3D oe.spdx30.SoftwareAgent()
+        elif agent_type =3D=3D "organization":
+            agent =3D oe.spdx30.Organization()
+        elif not agent_type or agent_type =3D=3D "agent":
+            agent =3D oe.spdx30.Agent()
+        else:
+            bb.fatal("Unknown agent type '%s' in %s_type" % (agent_type, v=
arname))
+
+        agent._id =3D spdxid
+        agent.creationInfo =3D creation_info or self.doc.creationInfo
+        agent.name =3D name
+
+        comment =3D self.d.getVar("%s_comment" % varname)
+        if comment:
+            agent.comment =3D comment
+
+        for (
+            pyname,
+            idtype,
+        ) in oe.spdx30.ExternalIdentifierType.NAMED_INDIVIDUALS.items():
+            value =3D self.d.getVar("%s_id_%s" % (varname, pyname))
+            if value:
+                agent.externalIdentifier.append(
+                    oe.spdx30.ExternalIdentifier(
+                        externalIdentifierType=3Didtype,
+                        identifier=3Dvalue,
+                    )
+                )
+
+        return self.add(agent)
+
+    def new_creation_info(self):
+        creation_info =3D oe.spdx30.CreationInfo()
+
+        name =3D "%s %s" % (
+            self.d.getVar("SPDX_TOOL_NAME"),
+            self.d.getVar("SPDX_TOOL_VERSION"),
+        )
+        tool =3D self.add(
+            oe.spdx30.Tool(
+                _id=3Dself.new_spdxid("tool", name),
+                creationInfo=3Dcreation_info,
+                name=3Dname,
+            )
+        )
+
+        authors =3D []
+        for a in self.d.getVar("SPDX_AUTHORS").split():
+            varname =3D "SPDX_AUTHORS_%s" % a
+            author =3D self.new_agent(varname, creation_info=3Dcreation_in=
fo)
+
+            if not author:
+                bb.fatal("Unable to find or create author %s" % a)
+
+            authors.append(author)
+
+        creation_info.created =3D spdx_now()
+        creation_info.specVersion =3D self.d.getVar("SPDX_VERSION")
+        creation_info.createdBy =3D authors
+        creation_info.createdUsing =3D [tool]
+
+        return creation_info
+
+    def copy_creation_info(self, copy):
+        c =3D oe.spdx30.CreationInfo(
+            created=3Dspdx_now(),
+            specVersion=3Dself.d.getVar("SPDX_VERSION"),
+        )
+
+        for author in copy.createdBy:
+            if isinstance(author, str):
+                c.createdBy.append(author)
+            else:
+                c.createdBy.append(author._id)
+
+        for tool in copy.createdUsing:
+            if isinstance(tool, str):
+                c.createdUsing.append(tool)
+            else:
+                c.createdUsing.append(tool._id)
+
+        return c
+
+    def new_annotation(self, subject, comment, typ):
+        return self.add(
+            oe.spdx30.Annotation(
+                _id=3Dself.new_spdxid("annotation", spdxid_hash(comment, t=
yp)),
+                creationInfo=3Dself.doc.creationInfo,
+                annotationType=3Dtyp,
+                subject=3Dsubject,
+                statement=3Dcomment,
+            )
+        )
+
+    def _new_relationship(
+        self,
+        cls,
+        from_,
+        typ,
+        to,
+        *,
+        spdxid_name=3D"relationship",
+        **props,
+    ):
+        from_ =3D to_list(from_)
+        to =3D to_list(to)
+
+        if not from_:
+            return []
+
+        if not to:
+            # TODO: Switch to the code constant once SPDX 3.0.1 is released
+            to =3D ["https://spdx.org/rdf/3.0.0/terms/Core/NoneElement"]
+
+        ret =3D []
+
+        for f in from_:
+            hash_args =3D [typ, f]
+            for k in sorted(props.keys()):
+                hash_args.append(props[k])
+            hash_args.extend(to)
+
+            relationship =3D self.add(
+                cls(
+                    _id=3Dself.new_spdxid(spdxid_name, spdxid_hash(*hash_a=
rgs)),
+                    creationInfo=3Dself.doc.creationInfo,
+                    from_=3Df,
+                    relationshipType=3Dtyp,
+                    to=3Dto,
+                    **props,
+                )
+            )
+            ret.append(relationship)
+
+        return ret
+
+    def new_relationship(self, from_, typ, to):
+        return self._new_relationship(oe.spdx30.Relationship, from_, typ, =
to)
+
+    def new_scoped_relationship(self, from_, typ, scope, to):
+        return self._new_relationship(
+            oe.spdx30.LifecycleScopedRelationship,
+            from_,
+            typ,
+            to,
+            scope=3Dscope,
+        )
+
+    def new_license_expression(self, license_expression, license_text_map=
=3D{}):
+        license_list_version =3D self.d.getVar("SPDX_LICENSE_DATA")["licen=
seListVersion"]
+        # SPDX 3 requires that the license list version be a semver
+        # MAJOR.MINOR.MICRO, but the actual license version is only MAJOR.=
MINOR
+        # (as of this writing). As such, manually append a .0 micro versio=
n if
+        # its missing to keep SPDX happy
+        if license_list_version.count(".") < 3:
+            license_list_version +=3D ".0"
+
+        spdxid =3D [
+            "license",
+            license_list_version,
+            re.sub(r"[^a-zA-Z0-9_-]", "_", license_expression),
+        ]
+
+        license_text =3D (
+            (k, license_text_map[k]) for k in sorted(license_text_map.keys=
())
+        )
+
+        if not license_text:
+            lic =3D self.find_filter(
+                oe.spdx30.simplelicensing_LicenseExpression,
+                simplelicensing_licenseExpression=3Dlicense_expression,
+                simplelicensing_licenseListVersion=3Dlicense_list_version,
+            )
+            if lic is not None:
+                return lic
+        else:
+            spdxid.append(spdxid_hash(*(v for _, v in license_text)))
+            lic =3D self.find_by_id(self.new_spdxid(*spdxid))
+            if lic is not None:
+                return lic
+
+        lic =3D self.add(
+            oe.spdx30.simplelicensing_LicenseExpression(
+                _id=3Dself.new_spdxid(*spdxid),
+                creationInfo=3Dself.doc.creationInfo,
+                simplelicensing_licenseExpression=3Dlicense_expression,
+                simplelicensing_licenseListVersion=3Dlicense_list_version,
+            )
+        )
+
+        for key, value in license_text:
+            lic.simplelicensing_customIdToUri.append(
+                oe.spdx30.DictionaryEntry(key=3Dkey, value=3Dvalue)
+            )
+
+        return lic
+
+    def scan_declared_licenses(self, spdx_file, filepath):
+        for e in spdx_file.extension:
+            if isinstance(e, OELicenseScannedExtension):
+                return
+
+        file_licenses =3D set()
+        for extracted_lic in extract_licenses(filepath):
+            file_licenses.add(self.new_license_expression(extracted_lic))
+
+        self.new_relationship(
+            [spdx_file],
+            oe.spdx30.RelationshipType.hasDeclaredLicense,
+            file_licenses,
+        )
+        spdx_file.extension.append(OELicenseScannedExtension())
+
+    def new_file(self, _id, name, path, *, purposes=3D[]):
+        sha256_hash =3D bb.utils.sha256_file(path)
+
+        for f in self.by_sha256_hash.get(sha256_hash, []):
+            if not isinstance(oe.spdx30.software_File):
+                continue
+
+            if purposes:
+                new_primary =3D purposes[0]
+                new_additional =3D []
+
+                if f.software_primaryPurpose:
+                    new_additional.append(f.software_primaryPurpose)
+                new_additional.extend(f.software_additionalPurpose)
+
+                new_additional =3D sorted(
+                    list(set(p for p in new_additional if p !=3D new_prima=
ry))
+                )
+
+                f.software_primaryPurpose =3D new_primary
+                f.software_additionalPurpose =3D new_additional
+
+            if f.name !=3D name:
+                for e in f.extension:
+                    if isinstance(e, OEFileNameAliasExtension):
+                        e.aliases.append(name)
+                        break
+                else:
+                    f.extension.append(OEFileNameAliasExtension(aliases=3D=
[name]))
+
+            return f
+
+        spdx_file =3D oe.spdx30.software_File(
+            _id=3D_id,
+            creationInfo=3Dself.doc.creationInfo,
+            name=3Dname,
+        )
+        if purposes:
+            spdx_file.software_primaryPurpose =3D purposes[0]
+            spdx_file.software_additionalPurpose =3D purposes[1:]
+
+        spdx_file.verifiedUsing.append(
+            oe.spdx30.Hash(
+                algorithm=3Doe.spdx30.HashAlgorithm.sha256,
+                hashValue=3Dsha256_hash,
+            )
+        )
+
+        return self.add(spdx_file)
+
+    def new_cve_vuln(self, cve):
+        v =3D oe.spdx30.security_Vulnerability()
+        v._id =3D self.new_spdxid("vulnerability", cve)
+        v.creationInfo =3D self.doc.creationInfo
+
+        v.externalIdentifier.append(
+            oe.spdx30.ExternalIdentifier(
+                externalIdentifierType=3Doe.spdx30.ExternalIdentifierType.=
cve,
+                identifier=3Dcve,
+                identifierLocator=3D[
+                    f"https://cveawg.mitre.org/api/cve/{cve}",
+                    f"https://www.cve.org/CVERecord?id=3D{cve}",
+                ],
+            )
+        )
+        return self.add(v)
+
+    def new_vex_patched_relationship(self, from_, to):
+        return self._new_relationship(
+            oe.spdx30.security_VexFixedVulnAssessmentRelationship,
+            from_,
+            oe.spdx30.RelationshipType.fixedIn,
+            to,
+            spdxid_name=3D"vex-fixed",
+            security_vexVersion=3DVEX_VERSION,
+        )
+
+    def new_vex_unpatched_relationship(self, from_, to):
+        return self._new_relationship(
+            oe.spdx30.security_VexAffectedVulnAssessmentRelationship,
+            from_,
+            oe.spdx30.RelationshipType.affects,
+            to,
+            spdxid_name=3D"vex-affected",
+            security_vexVersion=3DVEX_VERSION,
+        )
+
+    def new_vex_ignored_relationship(self, from_, to, *, impact_statement):
+        return self._new_relationship(
+            oe.spdx30.security_VexNotAffectedVulnAssessmentRelationship,
+            from_,
+            oe.spdx30.RelationshipType.doesNotAffect,
+            to,
+            spdxid_name=3D"vex-not-affected",
+            security_vexVersion=3DVEX_VERSION,
+            security_impactStatement=3Dimpact_statement,
+        )
+
+    def import_bitbake_build(self):
+        def find_bitbake_build(objset):
+            return objset.find_filter(
+                oe.spdx30.build_Build,
+                build_buildType=3DSPDX_BUILD_TYPE,
+            )
+
+        build =3D find_bitbake_build(self)
+        if build:
+            return build
+
+        deploy_dir_spdx =3D Path(self.d.getVar("DEPLOY_DIR_SPDX"))
+        bb_objset =3D load_jsonld(
+            self.d, deploy_dir_spdx / "bitbake.spdx.json", required=3DTrue
+        )
+
+        build =3D find_bitbake_build(bb_objset)
+        if build is None:
+            bb.fatal(f"No build found in {deploy_dir_spdx}")
+
+        self.doc.imports.extend(bb_objset.doc.imports)
+        self.update(bb_objset.objects)
+
+        return build
+
+    def new_sub_build(self, name, typ):
+        build =3D self.add(
+            oe.spdx30.build_Build(
+                _id=3Dself.new_spdxid("build", name),
+                creationInfo=3Dself.doc.creationInfo,
+                name=3D"%s-%s" % (self.d.getVar("PN"), name),
+                build_buildType=3D"%s/%s" % (SPDX_BUILD_TYPE, typ),
+            )
+        )
+
+        bitbake_build =3D self.import_bitbake_build()
+
+        self.new_relationship(
+            [bitbake_build],
+            oe.spdx30.RelationshipType.ancestorOf,
+            [build],
+        )
+
+        if self.d.getVar("SPDX_INCLUDE_BUILD_VARIABLES") =3D=3D "1":
+            for varname in sorted(self.d.keys()):
+                if varname.startswith("__"):
+                    continue
+
+                value =3D self.d.getVar(varname, expand=3DFalse)
+
+                # TODO: Deal with non-string values
+                if not isinstance(value, str):
+                    continue
+
+                build.parameters.append(
+                    oe.spdx30.DictionaryEntry(key=3Dvarname, value=3Dvalue)
+                )
+
+        return build
+
+    def new_archive(self, archive_name):
+        return self.add(
+            oe.spdx30.software_File(
+                _id=3Dself.new_spdxid("archive", str(archive_name)),
+                creationInfo=3Dself.doc.creationInfo,
+                name=3Dstr(archive_name),
+                software_primaryPurpose=3Doe.spdx30.software_SoftwarePurpo=
se.archive,
+            )
+        )
+
+    @classmethod
+    def new_objset(cls, d, name, copy_from_bitbake_doc=3DTrue):
+        objset =3D cls(d)
+
+        document =3D oe.spdx30.SpdxDocument(
+            _id=3Dobjset.new_spdxid("document", name),
+            name=3Dname,
+        )
+        document.extension.append(OEIdAliasExtension())
+        document.extension.append(OELinkExtension(link_spdx_id=3DFalse))
+        objset.doc =3D document
+
+        if copy_from_bitbake_doc:
+            build =3D objset.import_bitbake_build()
+            document.creationInfo =3D objset.copy_creation_info(build.crea=
tionInfo)
+        else:
+            document.creationInfo =3D objset.new_creation_info()
+
+        return objset
+
+    def expand_collection(self, *, add_objectsets=3D[]):
+        """
+        Expands a collection to pull in all missing elements
+
+        Returns the set of ids that could not be found to link into the do=
cument
+        """
+        missing_spdxids =3D set()
+        imports =3D {e.externalSpdxId: e for e in self.doc.imports}
+
+        def merge_doc(other):
+            nonlocal imports
+
+            for e in other.doc.imports:
+                if not e.externalSpdxId in imports:
+                    imports[e.externalSpdxId] =3D e
+
+            self.objects |=3D other.objects
+
+        for o in add_objectsets:
+            merge_doc(o)
+
+        needed_spdxids =3D self.link()
+        provided_spdxids =3D set(self.obj_by_id.keys())
+
+        while True:
+            import_spdxids =3D set(imports.keys())
+            searching_spdxids =3D (
+                needed_spdxids - provided_spdxids - missing_spdxids - impo=
rt_spdxids
+            )
+            if not searching_spdxids:
+                break
+
+            spdxid =3D searching_spdxids.pop()
+            bb.debug(
+                1,
+                f"Searching for {spdxid}. Remaining: {len(searching_spdxid=
s)}, Total: {len(provided_spdxids)}, Missing: {len(missing_spdxids)}, Impor=
ts: {len(import_spdxids)}",
+            )
+            dep_objset, dep_path =3D find_by_spdxid(self.d, spdxid)
+
+            if dep_objset:
+                dep_provided =3D set(dep_objset.obj_by_id.keys())
+                if spdxid not in dep_provided:
+                    bb.fatal(f"{spdxid} not found in {dep_path}")
+                provided_spdxids |=3D dep_provided
+                needed_spdxids |=3D dep_objset.missing_ids
+                merge_doc(dep_objset)
+            else:
+                missing_spdxids.add(spdxid)
+
+        bb.debug(1, "Linking...")
+        missing =3D self.link()
+        if missing !=3D missing_spdxids:
+            bb.fatal(
+                f"Linked document doesn't match missing SPDX ID list. Got:=
 {missing}\nExpected: {missing_spdxids}"
+            )
+
+        self.doc.imports =3D sorted(imports.values(), key=3Dlambda e: e.ex=
ternalSpdxId)
+
+        return missing_spdxids
+
+
+def load_jsonld(d, path, required=3DFalse):
+    deserializer =3D oe.spdx30.JSONLDDeserializer()
+    objset =3D ObjectSet(d)
+    try:
+        with path.open("rb") as f:
+            deserializer.read(f, objset)
+    except FileNotFoundError:
+        if required:
+            bb.fatal("No SPDX document named %s found" % path)
+        return None
+
+    if not objset.doc:
+        bb.fatal("SPDX Document %s has no SPDXDocument element" % path)
+        return None
+
+    objset.objects.remove(objset.doc)
+    return objset
+
+
+def jsonld_arch_path(d, arch, subdir, name, deploydir=3DNone):
+    if deploydir is None:
+        deploydir =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
+    return deploydir / arch / subdir / (name + ".spdx.json")
+
+
+def jsonld_hash_path(_id):
+    h =3D hashlib.sha256(_id.encode("utf-8")).hexdigest()
+
+    return Path("by-spdxid-hash") / h[:2], h
+
+
+def load_jsonld_by_arch(d, arch, subdir, name, *, required=3DFalse):
+    path =3D jsonld_arch_path(d, arch, subdir, name)
+    objset =3D load_jsonld(d, path, required=3Drequired)
+    if objset is not None:
+        return (objset, path)
+    return (None, None)
+
+
+def find_jsonld(d, subdir, name, *, required=3DFalse):
+    package_archs =3D d.getVar("SSTATE_ARCHS").split()
+    package_archs.reverse()
+
+    for arch in package_archs:
+        objset, path =3D load_jsonld_by_arch(d, arch, subdir, name)
+        if objset is not None:
+            return (objset, path)
+
+    if required:
+        bb.fatal("Could not find a %s SPDX document named %s" % (subdir, n=
ame))
+
+    return (None, None)
+
+
+def write_jsonld_doc(d, objset, dest):
+    if not isinstance(objset, ObjectSet):
+        bb.fatal("Only an ObjsetSet can be serialized")
+        return
+
+    if not objset.doc:
+        bb.fatal("ObjectSet is missing a SpdxDocument")
+        return
+
+    objset.doc.rootElement =3D sorted(list(set(objset.doc.rootElement)))
+    objset.doc.profileConformance =3D sorted(
+        list(
+            getattr(oe.spdx30.ProfileIdentifierType, p)
+            for p in d.getVar("SPDX_PROFILES").split()
+        )
+    )
+
+    dest.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
+
+    if d.getVar("SPDX_PRETTY") =3D=3D "1":
+        serializer =3D oe.spdx30.JSONLDSerializer(
+            indent=3D2,
+        )
+    else:
+        serializer =3D oe.spdx30.JSONLDInlineSerializer()
+
+    objset.objects.add(objset.doc)
+    with dest.open("wb") as f:
+        serializer.write(objset, f, force_at_graph=3DTrue)
+    objset.objects.remove(objset.doc)
+
+
+def write_recipe_jsonld_doc(
+    d,
+    objset,
+    subdir,
+    deploydir,
+    *,
+    create_spdx_id_links=3DTrue,
+):
+    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
+
+    dest =3D jsonld_arch_path(d, pkg_arch, subdir, objset.doc.name, deploy=
dir=3Ddeploydir)
+
+    def link_id(_id):
+        hash_path =3D jsonld_hash_path(_id)
+
+        link_name =3D jsonld_arch_path(
+            d,
+            pkg_arch,
+            *hash_path,
+            deploydir=3Ddeploydir,
+        )
+        try:
+            link_name.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
+            link_name.symlink_to(os.path.relpath(dest, link_name.parent))
+        except:
+            target =3D link_name.readlink()
+            bb.warn(
+                f"Unable to link {_id} in {dest} as {link_name}. Already p=
oints to {target}"
+            )
+            raise
+
+        return hash_path[-1]
+
+    objset.add_aliases()
+
+    try:
+        if create_spdx_id_links:
+            for o in objset.foreach_type(oe.spdx30.Element):
+                if not o._id or o._id.startswith("_:"):
+                    continue
+
+                ext =3D None
+                for e in o.extension:
+                    if not isinstance(e, OELinkExtension):
+                        continue
+
+                    ext =3D e
+                    break
+
+                if ext is None:
+                    ext =3D OELinkExtension(link_spdx_id=3DTrue)
+                    o.extension.append(ext)
+
+                if ext.link_spdx_id:
+                    ext.link_name =3D link_id(o._id)
+
+                    alias_ext =3D get_alias(o)
+                    if alias_ext is not None and alias_ext.alias:
+                        alias_ext.link_name =3D link_id(alias_ext.alias)
+
+    finally:
+        # It is really helpful for debugging if the JSON document is writt=
en
+        # out, so always do that even if there is an error making the links
+        write_jsonld_doc(d, objset, dest)
+
+
+def find_root_obj_in_jsonld(d, subdir, fn_name, obj_type, **attr_filter):
+    objset, fn =3D find_jsonld(d, subdir, fn_name, required=3DTrue)
+
+    spdx_obj =3D objset.find_root(obj_type, **attr_filter)
+    if not spdx_obj:
+        bb.fatal("No root %s found in %s" % (obj_type.__name__, fn))
+
+    return spdx_obj, objset
+
+
+def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, **attr_filter):
+    objset, fn =3D load_jsonld_by_arch(d, arch, subdir, fn_name, required=
=3DTrue)
+
+    spdx_obj =3D objset.find_filter(obj_type, **attr_filter)
+    if not spdx_obj:
+        bb.fatal("No %s found in %s" % (obj_type.__name__, fn))
+
+    return spdx_obj, objset
+
+
+def find_by_spdxid(d, spdxid, *, required=3DFalse):
+    return find_jsonld(d, *jsonld_hash_path(spdxid), required=3Drequired)
+
+
+def create_sbom(d, name, root_elements, add_objectsets=3D[]):
+    objset =3D ObjectSet.new_objset(d, name)
+
+    sbom =3D objset.add(
+        oe.spdx30.software_Sbom(
+            _id=3Dobjset.new_spdxid("sbom", name),
+            name=3Dname,
+            creationInfo=3Dobjset.doc.creationInfo,
+            software_sbomType=3D[oe.spdx30.software_SbomType.build],
+            rootElement=3Droot_elements,
+        )
+    )
+
+    missing_spdxids =3D objset.expand_collection(add_objectsets=3Dadd_obje=
ctsets)
+    if missing_spdxids:
+        bb.warn(
+            "The following SPDX IDs were unable to be resolved:\n  "
+            + "\n  ".join(sorted(list(missing_spdxids)))
+        )
+
+    # Filter out internal extensions from final SBoMs
+    objset.remove_internal_extensions()
+
+    # SBoM should be the only root element of the document
+    objset.doc.rootElement =3D [sbom]
+
+    # De-duplicate licenses
+    unique =3D set()
+    dedup =3D {}
+    for lic in objset.foreach_type(oe.spdx30.simplelicensing_LicenseExpres=
sion):
+        for u in unique:
+            if (
+                u.simplelicensing_licenseExpression
+                =3D=3D lic.simplelicensing_licenseExpression
+                and u.simplelicensing_licenseListVersion
+                =3D=3D lic.simplelicensing_licenseListVersion
+            ):
+                dedup[lic] =3D u
+                break
+        else:
+            unique.add(lic)
+
+    if dedup:
+        for rel in objset.foreach_filter(
+            oe.spdx30.Relationship,
+            relationshipType=3Doe.spdx30.RelationshipType.hasDeclaredLicen=
se,
+        ):
+            rel.to =3D [dedup.get(to, to) for to in rel.to]
+
+        for rel in objset.foreach_filter(
+            oe.spdx30.Relationship,
+            relationshipType=3Doe.spdx30.RelationshipType.hasConcludedLice=
nse,
+        ):
+            rel.to =3D [dedup.get(to, to) for to in rel.to]
+
+        for k, v in dedup.items():
+            bb.debug(1, f"Removing duplicate License {k._id} -> {v._id}")
+            objset.objects.remove(k)
+
+        objset.create_index()
+
+    return objset, sbom
diff --git a/meta/lib/oe/spdx30.py b/meta/lib/oe/spdx30.py
new file mode 100644
index 00000000000..3d24692f96e
--- /dev/null
+++ b/meta/lib/oe/spdx30.py
@@ -0,0 +1,5996 @@
+#! /usr/bin/env python3
+#
+# Generated Python bindings from a SHACL model
+#
+# This file was automatically generated by shacl2code. DO NOT MANUALLY MOD=
IFY IT
+#
+# SPDX-License-Identifier: MIT
+
+import functools
+import hashlib
+import json
+import re
+import sys
+import threading
+import time
+from contextlib import contextmanager
+from datetime import datetime, timezone, timedelta
+from enum import Enum
+from abc import ABC, abstractmethod
+
+
+def check_type(obj, types):
+    if not isinstance(obj, types):
+        if isinstance(types, (list, tuple)):
+            raise TypeError(
+                f"Value must be one of type: {', '.join(t.__name__ for t i=
n types)}. Got {type(obj)}"
+            )
+        raise TypeError(f"Value must be of type {types.__name__}. Got {typ=
e(obj)}")
+
+
+class Property(ABC):
+    """
+    A generic SHACL object property. The different types will derive from =
this
+    class
+    """
+
+    def __init__(self, *, pattern=3DNone):
+        self.pattern =3D pattern
+
+    def init(self):
+        return None
+
+    def validate(self, value):
+        check_type(value, self.VALID_TYPES)
+        if self.pattern is not None and not re.search(
+            self.pattern, self.to_string(value)
+        ):
+            raise ValueError(
+                f"Value is not correctly formatted. Got '{self.to_string(v=
alue)}'"
+            )
+
+    def set(self, value):
+        return value
+
+    def check_min_count(self, value, min_count):
+        return min_count =3D=3D 1
+
+    def check_max_count(self, value, max_count):
+        return max_count =3D=3D 1
+
+    def elide(self, value):
+        return value is None
+
+    def walk(self, value, callback, path):
+        callback(value, path)
+
+    def iter_objects(self, value, recursive, visited):
+        return []
+
+    def link_prop(self, value, objectset, missing, visited):
+        return value
+
+    def to_string(self, value):
+        return str(value)
+
+    @abstractmethod
+    def encode(self, encoder, value, state):
+        pass
+
+    @abstractmethod
+    def decode(self, decoder, *, objectset=3DNone):
+        pass
+
+
+class StringProp(Property):
+    """
+    A scalar string property for an SHACL object
+    """
+
+    VALID_TYPES =3D str
+
+    def set(self, value):
+        return str(value)
+
+    def encode(self, encoder, value, state):
+        encoder.write_string(value)
+
+    def decode(self, decoder, *, objectset=3DNone):
+        return decoder.read_string()
+
+
+class AnyURIProp(StringProp):
+    def encode(self, encoder, value, state):
+        encoder.write_iri(value)
+
+    def decode(self, decoder, *, objectset=3DNone):
+        return decoder.read_iri()
+
+
+class DateTimeProp(Property):
+    """
+    A Date/Time Object with optional timezone
+    """
+
+    VALID_TYPES =3D datetime
+    UTC_FORMAT_STR =3D "%Y-%m-%dT%H:%M:%SZ"
+    REGEX =3D r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(Z|[+-]\d{2}:\d{2})?$"
+
+    def set(self, value):
+        return self._normalize(value)
+
+    def encode(self, encoder, value, state):
+        encoder.write_datetime(self.to_string(value))
+
+    def decode(self, decoder, *, objectset=3DNone):
+        s =3D decoder.read_datetime()
+        if s is None:
+            return None
+        v =3D self.from_string(s)
+        return self._normalize(v)
+
+    def _normalize(self, value):
+        if value.utcoffset() is None:
+            value =3D value.astimezone()
+        offset =3D value.utcoffset()
+        if offset % timedelta(minutes=3D1):
+            offset =3D offset - (offset % timedelta(minutes=3D1))
+            value =3D value.replace(tzinfo=3Dtimezone(offset))
+        value =3D value.replace(microsecond=3D0)
+        return value
+
+    def to_string(self, value):
+        value =3D self._normalize(value)
+        if value.tzinfo =3D=3D timezone.utc:
+            return value.strftime(self.UTC_FORMAT_STR)
+        return value.isoformat()
+
+    def from_string(self, value):
+        if not re.match(self.REGEX, value):
+            raise ValueError(f"'{value}' is not a correctly formatted date=
time")
+        if "Z" in value:
+            d =3D datetime(
+                *(time.strptime(value, self.UTC_FORMAT_STR)[0:6]),
+                tzinfo=3Dtimezone.utc,
+            )
+        else:
+            d =3D datetime.fromisoformat(value)
+
+        return self._normalize(d)
+
+
+class DateTimeStampProp(DateTimeProp):
+    """
+    A Date/Time Object with required timestamp
+    """
+
+    REGEX =3D r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(Z|[+-]\d{2}:\d{2})$"
+
+
+class IntegerProp(Property):
+    VALID_TYPES =3D int
+
+    def set(self, value):
+        return int(value)
+
+    def encode(self, encoder, value, state):
+        encoder.write_integer(value)
+
+    def decode(self, decoder, *, objectset=3DNone):
+        return decoder.read_integer()
+
+
+class PositiveIntegerProp(IntegerProp):
+    def validate(self, value):
+        super().validate(value)
+        if value < 1:
+            raise ValueError(f"Value must be >=3D1. Got {value}")
+
+
+class NonNegativeIntegerProp(IntegerProp):
+    def validate(self, value):
+        super().validate(value)
+        if value < 0:
+            raise ValueError(f"Value must be >=3D 0. Got {value}")
+
+
+class BooleanProp(Property):
+    VALID_TYPES =3D bool
+
+    def set(self, value):
+        return bool(value)
+
+    def encode(self, encoder, value, state):
+        encoder.write_bool(value)
+
+    def decode(self, decoder, *, objectset=3DNone):
+        return decoder.read_bool()
+
+
+class FloatProp(Property):
+    VALID_TYPES =3D (float, int)
+
+    def set(self, value):
+        return float(value)
+
+    def encode(self, encoder, value, state):
+        encoder.write_float(value)
+
+    def decode(self, decoder, *, objectset=3DNone):
+        return decoder.read_float()
+
+
+class ObjectProp(Property):
+    """
+    A scalar SHACL object property of a SHACL object
+    """
+
+    def __init__(self, cls, required):
+        super().__init__()
+        self.cls =3D cls
+        self.required =3D required
+
+    def init(self):
+        if self.required and not self.cls.IS_ABSTRACT:
+            return self.cls()
+        return None
+
+    def validate(self, value):
+        check_type(value, (self.cls, str))
+
+    def walk(self, value, callback, path):
+        if value is None:
+            return
+
+        if not isinstance(value, str):
+            value.walk(callback, path)
+        else:
+            callback(value, path)
+
+    def iter_objects(self, value, recursive, visited):
+        if value is None or isinstance(value, str):
+            return
+
+        if value not in visited:
+            visited.add(value)
+            yield value
+
+            if recursive:
+                for c in value.iter_objects(recursive=3DTrue, visited=3Dvi=
sited):
+                    yield c
+
+    def encode(self, encoder, value, state):
+        if value is None:
+            raise ValueError("Object cannot be None")
+
+        if isinstance(value, str):
+            value =3D _NI_ENCODE_CONTEXT.get(value, value)
+            encoder.write_iri(value)
+            return
+
+        return value.encode(encoder, state)
+
+    def decode(self, decoder, *, objectset=3DNone):
+        iri =3D decoder.read_iri()
+        if iri is None:
+            return self.cls.decode(decoder, objectset=3Dobjectset)
+
+        iri =3D _NI_DECODE_CONTEXT.get(iri, iri)
+
+        if objectset is None:
+            return iri
+
+        obj =3D objectset.find_by_id(iri)
+        if obj is None:
+            return iri
+
+        self.validate(obj)
+        return obj
+
+    def link_prop(self, value, objectset, missing, visited):
+        if value is None:
+            return value
+
+        if isinstance(value, str):
+            o =3D objectset.find_by_id(value)
+            if o is not None:
+                self.validate(o)
+                return o
+
+            if missing is not None:
+                missing.add(value)
+
+            return value
+
+        # De-duplicate IDs
+        if value._id:
+            value =3D objectset.find_by_id(value._id, value)
+            self.validate(value)
+
+        value.link_helper(objectset, missing, visited)
+        return value
+
+
+class ListProxy(object):
+    def __init__(self, prop, data=3DNone):
+        if data is None:
+            self.__data =3D []
+        else:
+            self.__data =3D data
+        self.__prop =3D prop
+
+    def append(self, value):
+        self.__prop.validate(value)
+        self.__data.append(self.__prop.set(value))
+
+    def insert(self, idx, value):
+        self.__prop.validate(value)
+        self.__data.insert(idx, self.__prop.set(value))
+
+    def extend(self, items):
+        for i in items:
+            self.append(i)
+
+    def sort(self, *args, **kwargs):
+        self.__data.sort(*args, **kwargs)
+
+    def __getitem__(self, key):
+        return self.__data[key]
+
+    def __setitem__(self, key, value):
+        if isinstance(key, slice):
+            for v in value:
+                self.__prop.validate(v)
+            self.__data[key] =3D [self.__prop.set(v) for v in value]
+        else:
+            self.__prop.validate(value)
+            self.__data[key] =3D self.__prop.set(value)
+
+    def __delitem__(self, key):
+        del self.__data[key]
+
+    def __contains__(self, item):
+        return item in self.__data
+
+    def __iter__(self):
+        return iter(self.__data)
+
+    def __len__(self):
+        return len(self.__data)
+
+    def __str__(self):
+        return str(self.__data)
+
+    def __repr__(self):
+        return repr(self.__data)
+
+    def __eq__(self, other):
+        if isinstance(other, ListProxy):
+            return self.__data =3D=3D other.__data
+
+        return self.__data =3D=3D other
+
+
+class ListProp(Property):
+    """
+    A list of SHACL properties
+    """
+
+    VALID_TYPES =3D (list, ListProxy)
+
+    def __init__(self, prop):
+        super().__init__()
+        self.prop =3D prop
+
+    def init(self):
+        return ListProxy(self.prop)
+
+    def validate(self, value):
+        super().validate(value)
+
+        for i in value:
+            self.prop.validate(i)
+
+    def set(self, value):
+        if isinstance(value, ListProxy):
+            return value
+
+        return ListProxy(self.prop, [self.prop.set(d) for d in value])
+
+    def check_min_count(self, value, min_count):
+        check_type(value, ListProxy)
+        return len(value) >=3D min_count
+
+    def check_max_count(self, value, max_count):
+        check_type(value, ListProxy)
+        return len(value) <=3D max_count
+
+    def elide(self, value):
+        check_type(value, ListProxy)
+        return len(value) =3D=3D 0
+
+    def walk(self, value, callback, path):
+        callback(value, path)
+        for idx, v in enumerate(value):
+            self.prop.walk(v, callback, path + [f"[{idx}]"])
+
+    def iter_objects(self, value, recursive, visited):
+        for v in value:
+            for c in self.prop.iter_objects(v, recursive, visited):
+                yield c
+
+    def link_prop(self, value, objectset, missing, visited):
+        if isinstance(value, ListProxy):
+            data =3D [self.prop.link_prop(v, objectset, missing, visited) =
for v in value]
+        else:
+            data =3D [self.prop.link_prop(v, objectset, missing, visited) =
for v in value]
+
+        return ListProxy(self.prop, data=3Ddata)
+
+    def encode(self, encoder, value, state):
+        check_type(value, ListProxy)
+
+        with encoder.write_list() as list_s:
+            for v in value:
+                with list_s.write_list_item() as item_s:
+                    self.prop.encode(item_s, v, state)
+
+    def decode(self, decoder, *, objectset=3DNone):
+        data =3D []
+        for val_d in decoder.read_list():
+            v =3D self.prop.decode(val_d, objectset=3Dobjectset)
+            self.prop.validate(v)
+            data.append(v)
+
+        return ListProxy(self.prop, data=3Ddata)
+
+
+class EnumProp(Property):
+    VALID_TYPES =3D str
+
+    def __init__(self, values, *, pattern=3DNone):
+        super().__init__(pattern=3Dpattern)
+        self.values =3D values
+
+    def validate(self, value):
+        super().validate(value)
+
+        valid_values =3D (iri for iri, _ in self.values)
+        if value not in valid_values:
+            raise ValueError(
+                f"'{value}' is not a valid value. Choose one of {' '.join(=
valid_values)}"
+            )
+
+    def encode(self, encoder, value, state):
+        for iri, compact in self.values:
+            if iri =3D=3D value:
+                encoder.write_enum(value, self, compact)
+                return
+
+        encoder.write_enum(value, self)
+
+    def decode(self, decoder, *, objectset=3DNone):
+        v =3D decoder.read_enum(self)
+        for iri, compact in self.values:
+            if v =3D=3D compact:
+                return iri
+        return v
+
+
+class NodeKind(Enum):
+    BlankNode =3D 1
+    IRI =3D 2
+    BlankNodeOrIRI =3D 3
+
+
+def is_IRI(s):
+    if not isinstance(s, str):
+        return False
+    if s.startswith("_:"):
+        return False
+    if ":" not in s:
+        return False
+    return True
+
+
+def is_blank_node(s):
+    if not isinstance(s, str):
+        return False
+    if not s.startswith("_:"):
+        return False
+    return True
+
+
+def register(type_iri, *, compact_type=3DNone, abstract=3DFalse):
+    def add_class(key, c):
+        assert (
+            key not in SHACLObject.CLASSES
+        ), f"{key} already registered to {SHACLObject.CLASSES[key].__name_=
_}"
+        SHACLObject.CLASSES[key] =3D c
+
+    def decorator(c):
+        global NAMED_INDIVIDUALS
+
+        assert issubclass(
+            c, SHACLObject
+        ), f"{c.__name__} is not derived from SHACLObject"
+
+        c._OBJ_TYPE =3D type_iri
+        c.IS_ABSTRACT =3D abstract
+        add_class(type_iri, c)
+
+        c._OBJ_COMPACT_TYPE =3D compact_type
+        if compact_type:
+            add_class(compact_type, c)
+
+        NAMED_INDIVIDUALS |=3D set(c.NAMED_INDIVIDUALS.values())
+
+        # Registration is deferred until the first instance of class is cr=
eated
+        # so that it has access to any other defined class
+        c._NEEDS_REG =3D True
+        return c
+
+    return decorator
+
+
+register_lock =3D threading.Lock()
+NAMED_INDIVIDUALS =3D set()
+
+
+@functools.total_ordering
+class SHACLObject(object):
+    CLASSES =3D {}
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D None
+    IS_ABSTRACT =3D True
+
+    def __init__(self, **kwargs):
+        if self._is_abstract():
+            raise NotImplementedError(
+                f"{self.__class__.__name__} is abstract and cannot be impl=
emented"
+            )
+
+        with register_lock:
+            cls =3D self.__class__
+            if cls._NEEDS_REG:
+                cls._OBJ_PROPERTIES =3D {}
+                cls._OBJ_IRIS =3D {}
+                cls._register_props()
+                cls._NEEDS_REG =3D False
+
+        self.__dict__["_obj_data"] =3D {}
+        self.__dict__["_obj_metadata"] =3D {}
+
+        for iri, prop, _, _, _, _ in self.__iter_props():
+            self.__dict__["_obj_data"][iri] =3D prop.init()
+
+        for k, v in kwargs.items():
+            setattr(self, k, v)
+
+    def _is_abstract(self):
+        return self.__class__.IS_ABSTRACT
+
+    @classmethod
+    def _register_props(cls):
+        cls._add_property("_id", StringProp(), iri=3D"@id")
+
+    @classmethod
+    def _add_property(
+        cls,
+        pyname,
+        prop,
+        iri,
+        min_count=3DNone,
+        max_count=3DNone,
+        compact=3DNone,
+    ):
+        if pyname in cls._OBJ_IRIS:
+            raise KeyError(f"'{pyname}' is already defined for '{cls.__nam=
e__}'")
+        if iri in cls._OBJ_PROPERTIES:
+            raise KeyError(f"'{iri}' is already defined for '{cls.__name__=
}'")
+
+        while hasattr(cls, pyname):
+            pyname =3D pyname + "_"
+
+        pyname =3D sys.intern(pyname)
+        iri =3D sys.intern(iri)
+
+        cls._OBJ_IRIS[pyname] =3D iri
+        cls._OBJ_PROPERTIES[iri] =3D (prop, min_count, max_count, pyname, =
compact)
+
+    def __setattr__(self, name, value):
+        if name =3D=3D self.ID_ALIAS:
+            self["@id"] =3D value
+            return
+
+        try:
+            iri =3D self._OBJ_IRIS[name]
+            self[iri] =3D value
+        except KeyError:
+            raise AttributeError(
+                f"'{name}' is not a valid property of {self.__class__.__na=
me__}"
+            )
+
+    def __getattr__(self, name):
+        if name in self._OBJ_IRIS:
+            return self.__dict__["_obj_data"][self._OBJ_IRIS[name]]
+
+        if name =3D=3D self.ID_ALIAS:
+            return self.__dict__["_obj_data"]["@id"]
+
+        if name =3D=3D "_metadata":
+            return self.__dict__["_obj_metadata"]
+
+        if name =3D=3D "_IRI":
+            return self._OBJ_IRIS
+
+        if name =3D=3D "TYPE":
+            return self.__class__._OBJ_TYPE
+
+        if name =3D=3D "COMPACT_TYPE":
+            return self.__class__._OBJ_COMPACT_TYPE
+
+        raise AttributeError(
+            f"'{name}' is not a valid property of {self.__class__.__name__=
}"
+        )
+
+    def __delattr__(self, name):
+        if name =3D=3D self.ID_ALIAS:
+            del self["@id"]
+            return
+
+        try:
+            iri =3D self._OBJ_IRIS[name]
+            del self[iri]
+        except KeyError:
+            raise AttributeError(
+                f"'{name}' is not a valid property of {self.__class__.__na=
me__}"
+            )
+
+    def __get_prop(self, iri):
+        if iri not in self._OBJ_PROPERTIES:
+            raise KeyError(
+                f"'{iri}' is not a valid property of {self.__class__.__nam=
e__}"
+            )
+
+        return self._OBJ_PROPERTIES[iri]
+
+    def __iter_props(self):
+        for iri, v in self._OBJ_PROPERTIES.items():
+            yield iri, *v
+
+    def __getitem__(self, iri):
+        return self.__dict__["_obj_data"][iri]
+
+    def __setitem__(self, iri, value):
+        if iri =3D=3D "@id":
+            if self.NODE_KIND =3D=3D NodeKind.BlankNode:
+                if not is_blank_node(value):
+                    raise ValueError(
+                        f"{self.__class__.__name__} ({id(self)}) can only =
have local reference. Property '{iri}' cannot be set to '{value}' and must =
start with '_:'"
+                    )
+            elif self.NODE_KIND =3D=3D NodeKind.IRI:
+                if not is_IRI(value):
+                    raise ValueError(
+                        f"{self.__class__.__name__} ({id(self)}) can only =
have an IRI value. Property '{iri}' cannot be set to '{value}'"
+                    )
+            else:
+                if not is_blank_node(value) and not is_IRI(value):
+                    raise ValueError(
+                        f"{self.__class__.__name__} ({id(self)}) Has inval=
id Property '{iri}' '{value}'. Must be a blank node or IRI"
+                    )
+
+        prop, _, _, _, _ =3D self.__get_prop(iri)
+        prop.validate(value)
+        self.__dict__["_obj_data"][iri] =3D prop.set(value)
+
+    def __delitem__(self, iri):
+        prop, _, _, _, _ =3D self.__get_prop(iri)
+        self.__dict__["_obj_data"][iri] =3D prop.init()
+
+    def __iter__(self):
+        return self._OBJ_PROPERTIES.keys()
+
+    def walk(self, callback, path=3DNone):
+        """
+        Walk object tree, invoking the callback for each item
+
+        Callback has the form:
+
+        def callback(object, path):
+        """
+        if path is None:
+            path =3D ["."]
+
+        if callback(self, path):
+            for iri, prop, _, _, _, _ in self.__iter_props():
+                prop.walk(self.__dict__["_obj_data"][iri], callback, path =
+ [f".{iri}"])
+
+    def property_keys(self):
+        for iri, _, _, _, pyname, compact in self.__iter_props():
+            if iri =3D=3D "@id":
+                compact =3D self.ID_ALIAS
+            yield pyname, iri, compact
+
+    def iter_objects(self, *, recursive=3DFalse, visited=3DNone):
+        """
+        Iterate of all objects that are a child of this one
+        """
+        if visited is None:
+            visited =3D set()
+
+        for iri, prop, _, _, _, _ in self.__iter_props():
+            for c in prop.iter_objects(
+                self.__dict__["_obj_data"][iri], recursive=3Drecursive, vi=
sited=3Dvisited
+            ):
+                yield c
+
+    def encode(self, encoder, state):
+        idname =3D self.ID_ALIAS or self._OBJ_IRIS["_id"]
+        if not self._id and self.NODE_KIND =3D=3D NodeKind.IRI:
+            raise ValueError(
+                f"{self.__class__.__name__} ({id(self)}) must have a IRI f=
or property '{idname}'"
+            )
+
+        if state.is_written(self):
+            encoder.write_iri(state.get_object_id(self))
+            return
+
+        state.add_written(self)
+
+        with encoder.write_object(
+            self,
+            state.get_object_id(self),
+            bool(self._id) or state.is_refed(self),
+        ) as obj_s:
+            self._encode_properties(obj_s, state)
+
+    def _encode_properties(self, encoder, state):
+        for iri, prop, min_count, max_count, pyname, compact in self.__ite=
r_props():
+            value =3D self.__dict__["_obj_data"][iri]
+            if prop.elide(value):
+                if min_count:
+                    raise ValueError(
+                        f"Property '{pyname}' in {self.__class__.__name__}=
 ({id(self)}) is required (currently {value!r})"
+                    )
+                continue
+
+            if min_count is not None:
+                if not prop.check_min_count(value, min_count):
+                    raise ValueError(
+                        f"Property '{pyname}' in {self.__class__.__name__}=
 ({id(self)}) requires a minimum of {min_count} elements"
+                    )
+
+            if max_count is not None:
+                if not prop.check_max_count(value, max_count):
+                    raise ValueError(
+                        f"Property '{pyname}' in {self.__class__.__name__}=
 ({id(self)}) requires a maximum of {max_count} elements"
+                    )
+
+            if iri =3D=3D self._OBJ_IRIS["_id"]:
+                continue
+
+            with encoder.write_property(iri, compact) as prop_s:
+                prop.encode(prop_s, value, state)
+
+    @classmethod
+    def _make_object(cls, typ):
+        if typ not in cls.CLASSES:
+            raise TypeError(f"Unknown type {typ}")
+
+        return cls.CLASSES[typ]()
+
+    @classmethod
+    def decode(cls, decoder, *, objectset=3DNone):
+        typ, obj_d =3D decoder.read_object()
+        if typ is None:
+            raise TypeError("Unable to determine type for object")
+
+        obj =3D cls._make_object(typ)
+        for key in (obj.ID_ALIAS, obj._OBJ_IRIS["_id"]):
+            with obj_d.read_property(key) as prop_d:
+                if prop_d is None:
+                    continue
+
+                _id =3D prop_d.read_iri()
+                if _id is None:
+                    raise TypeError(f"Object key '{key}' is the wrong type=
")
+
+                obj._id =3D _id
+                break
+
+        if obj.NODE_KIND =3D=3D NodeKind.IRI and not obj._id:
+            raise ValueError("Object is missing required IRI")
+
+        if objectset is not None:
+            if obj._id:
+                v =3D objectset.find_by_id(_id)
+                if v is not None:
+                    return v
+
+        obj._decode_properties(obj_d, objectset=3Dobjectset)
+
+        if objectset is not None:
+            objectset.add_index(obj)
+        return obj
+
+    def _decode_properties(self, decoder, objectset=3DNone):
+        for key in decoder.object_keys():
+            if not self._decode_prop(decoder, key, objectset=3Dobjectset):
+                raise KeyError(f"Unknown property '{key}'")
+
+    def _decode_prop(self, decoder, key, objectset=3DNone):
+        if key in (self._OBJ_IRIS["_id"], self.ID_ALIAS):
+            return True
+
+        for iri, prop, _, _, _, compact in self.__iter_props():
+            if compact =3D=3D key:
+                read_key =3D compact
+            elif iri =3D=3D key:
+                read_key =3D iri
+            else:
+                continue
+
+            with decoder.read_property(read_key) as prop_d:
+                v =3D prop.decode(prop_d, objectset=3Dobjectset)
+                prop.validate(v)
+                self.__dict__["_obj_data"][iri] =3D v
+            return True
+
+        return False
+
+    def link_helper(self, objectset, missing, visited):
+        if self in visited:
+            return
+
+        visited.add(self)
+
+        for iri, prop, _, _, _, _ in self.__iter_props():
+            self.__dict__["_obj_data"][iri] =3D prop.link_prop(
+                self.__dict__["_obj_data"][iri],
+                objectset,
+                missing,
+                visited,
+            )
+
+    def __str__(self):
+        parts =3D [
+            f"{self.__class__.__name__}(",
+        ]
+        if self._id:
+            parts.append(f"@id=3D'{self._id}'")
+        parts.append(")")
+        return "".join(parts)
+
+    def __hash__(self):
+        return super().__hash__()
+
+    def __eq__(self, other):
+        return super().__eq__(other)
+
+    def __lt__(self, other):
+        def sort_key(obj):
+            if isinstance(obj, str):
+                return (obj, "", "", "")
+            return (
+                obj._id or "",
+                obj.TYPE,
+                getattr(obj, "name", None) or "",
+                id(obj),
+            )
+
+        return sort_key(self) < sort_key(other)
+
+
+class SHACLExtensibleObject(object):
+    CLOSED =3D False
+
+    def __init__(self, typ=3DNone, **kwargs):
+        if typ:
+            self.__dict__["_obj_TYPE"] =3D (typ, None)
+        else:
+            self.__dict__["_obj_TYPE"] =3D (self._OBJ_TYPE, self._OBJ_COMP=
ACT_TYPE)
+        super().__init__(**kwargs)
+
+    def _is_abstract(self):
+        # Unknown classes are assumed to not be abstract so that they can =
be
+        # deserialized
+        typ =3D self.__dict__["_obj_TYPE"][0]
+        if typ in self.__class__.CLASSES:
+            return self.__class__.CLASSES[typ].IS_ABSTRACT
+
+        return False
+
+    @classmethod
+    def _make_object(cls, typ):
+        # Check for a known type, and if so, deserialize as that instead
+        if typ in cls.CLASSES:
+            return cls.CLASSES[typ]()
+
+        obj =3D cls(typ)
+        return obj
+
+    def _decode_properties(self, decoder, objectset=3DNone):
+        if self.CLOSED:
+            super()._decode_properties(decoder, objectset=3Dobjectset)
+            return
+
+        for key in decoder.object_keys():
+            if self._decode_prop(decoder, key, objectset=3Dobjectset):
+                continue
+
+            if not is_IRI(key):
+                raise KeyError(
+                    f"Extensible object properties must be IRIs. Got '{key=
}'"
+                )
+
+            with decoder.read_property(key) as prop_d:
+                self.__dict__["_obj_data"][key] =3D prop_d.read_value()
+
+    def _encode_properties(self, encoder, state):
+        def encode_value(encoder, v):
+            if isinstance(v, bool):
+                encoder.write_bool(v)
+            elif isinstance(v, str):
+                encoder.write_string(v)
+            elif isinstance(v, int):
+                encoder.write_integer(v)
+            elif isinstance(v, float):
+                encoder.write_float(v)
+            else:
+                raise TypeError(
+                    f"Unsupported serialized type {type(v)} with value '{v=
}'"
+                )
+
+        super()._encode_properties(encoder, state)
+        if self.CLOSED:
+            return
+
+        for iri, value in self.__dict__["_obj_data"].items():
+            if iri in self._OBJ_PROPERTIES:
+                continue
+
+            with encoder.write_property(iri) as prop_s:
+                encode_value(prop_s, value)
+
+    def __setitem__(self, iri, value):
+        try:
+            super().__setitem__(iri, value)
+        except KeyError:
+            if self.CLOSED:
+                raise
+
+            if not is_IRI(iri):
+                raise KeyError(f"Key '{iri}' must be an IRI")
+            self.__dict__["_obj_data"][iri] =3D value
+
+    def __delitem__(self, iri):
+        try:
+            super().__delitem__(iri)
+        except KeyError:
+            if self.CLOSED:
+                raise
+
+            if not is_IRI(iri):
+                raise KeyError(f"Key '{iri}' must be an IRI")
+            del self.__dict__["_obj_data"][iri]
+
+    def __getattr__(self, name):
+        if name =3D=3D "TYPE":
+            return self.__dict__["_obj_TYPE"][0]
+        if name =3D=3D "COMPACT_TYPE":
+            return self.__dict__["_obj_TYPE"][1]
+        return super().__getattr__(name)
+
+    def property_keys(self):
+        iris =3D set()
+        for pyname, iri, compact in super().property_keys():
+            iris.add(iri)
+            yield pyname, iri, compact
+
+        if self.CLOSED:
+            return
+
+        for iri in self.__dict__["_obj_data"].keys():
+            if iri not in iris:
+                yield None, iri, None
+
+
+class SHACLObjectSet(object):
+    def __init__(self, objects=3D[], *, link=3DFalse):
+        self.objects =3D set()
+        self.missing_ids =3D set()
+        for o in objects:
+            self.objects.add(o)
+        self.create_index()
+        if link:
+            self._link()
+
+    def create_index(self):
+        """
+        (re)Create object index
+
+        Creates or recreates the indices for the object set to enable fast
+        lookup. All objects and their children are walked and indexed
+        """
+        self.obj_by_id =3D {}
+        self.obj_by_type =3D {}
+        for o in self.foreach():
+            self.add_index(o)
+
+    def add_index(self, obj):
+        """
+        Add object to index
+
+        Adds the object to all appropriate indices
+        """
+
+        def reg_type(typ, compact, o, exact):
+            self.obj_by_type.setdefault(typ, set()).add((exact, o))
+            if compact:
+                self.obj_by_type.setdefault(compact, set()).add((exact, o))
+
+        if not isinstance(obj, SHACLObject):
+            raise TypeError("Object is not of type SHACLObject")
+
+        for typ in SHACLObject.CLASSES.values():
+            if isinstance(obj, typ):
+                reg_type(
+                    typ._OBJ_TYPE, typ._OBJ_COMPACT_TYPE, obj, obj.__class=
__ is typ
+                )
+
+        # This covers custom extensions
+        reg_type(obj.TYPE, obj.COMPACT_TYPE, obj, True)
+
+        if not obj._id:
+            return
+
+        self.missing_ids.discard(obj._id)
+
+        if obj._id in self.obj_by_id:
+            return
+
+        self.obj_by_id[obj._id] =3D obj
+
+    def add(self, obj):
+        """
+        Add object to object set
+
+        Adds a SHACLObject to the object set and index it.
+
+        NOTE: Child objects of the attached object are not indexes
+        """
+        if not isinstance(obj, SHACLObject):
+            raise TypeError("Object is not of type SHACLObject")
+
+        if obj not in self.objects:
+            self.objects.add(obj)
+            self.add_index(obj)
+        return obj
+
+    def update(self, *others):
+        """
+        Update object set adding all objects in each other iterable
+        """
+        for o in others:
+            for obj in o:
+                self.add(obj)
+
+    def __contains__(self, item):
+        """
+        Returns True if the item is in the object set
+        """
+        return item in self.objects
+
+    def link(self):
+        """
+        Link object set
+
+        Links the object in the object set by replacing string object
+        references with references to the objects themselves. e.g.
+        a property that references object "https://foo/bar" by a string
+        reference will be replaced with an actual reference to the object =
in
+        the object set with the same ID if it exists in the object set
+
+        If multiple objects with the same ID are found, the duplicates are
+        eliminated
+        """
+        self.create_index()
+        return self._link()
+
+    def _link(self):
+        global NAMED_INDIVIDUALS
+
+        self.missing_ids =3D set()
+        visited =3D set()
+
+        new_objects =3D set()
+
+        for o in self.objects:
+            if o._id:
+                o =3D self.find_by_id(o._id, o)
+            o.link_helper(self, self.missing_ids, visited)
+            new_objects.add(o)
+
+        self.objects =3D new_objects
+
+        # Remove blank nodes
+        obj_by_id =3D {}
+        for _id, obj in self.obj_by_id.items():
+            if _id.startswith("_:"):
+                del obj._id
+            else:
+                obj_by_id[_id] =3D obj
+        self.obj_by_id =3D obj_by_id
+
+        # Named individuals aren't considered missing
+        self.missing_ids -=3D NAMED_INDIVIDUALS
+
+        return self.missing_ids
+
+    def find_by_id(self, _id, default=3DNone):
+        """
+        Find object by ID
+
+        Returns objects that match the specified ID, or default if there i=
s no
+        object with the specified ID
+        """
+        if _id not in self.obj_by_id:
+            return default
+        return self.obj_by_id[_id]
+
+    def foreach(self):
+        """
+        Iterate over every object in the object set, and all child objects
+        """
+        visited =3D set()
+        for o in self.objects:
+            if o not in visited:
+                yield o
+                visited.add(o)
+
+            for child in o.iter_objects(recursive=3DTrue, visited=3Dvisite=
d):
+                yield child
+
+    def foreach_type(self, typ, *, match_subclass=3DTrue):
+        """
+        Iterate over each object of a specified type (or subclass there of)
+
+        If match_subclass is True, and class derived from typ will also ma=
tch
+        (similar to isinstance()). If False, only exact matches will be
+        returned
+        """
+        if not isinstance(typ, str):
+            if not issubclass(typ, SHACLObject):
+                raise TypeError(f"Type must be derived from SHACLObject, g=
ot {typ}")
+            typ =3D typ._OBJ_TYPE
+
+        if typ not in self.obj_by_type:
+            return
+
+        for exact, o in self.obj_by_type[typ]:
+            if match_subclass or exact:
+                yield o
+
+    def merge(self, *objectsets):
+        """
+        Merge object sets
+
+        Returns a new object set that is the combination of this object se=
t and
+        all provided arguments
+        """
+        new_objects =3D set()
+        new_objects |=3D self.objects
+        for d in objectsets:
+            new_objects |=3D d.objects
+
+        return SHACLObjectSet(new_objects, link=3DTrue)
+
+    def encode(self, encoder, force_list=3DFalse):
+        """
+        Serialize a list of objects to a serialization encoder
+
+        If force_list is true, a list will always be written using the enc=
oder.
+        """
+        ref_counts =3D {}
+        state =3D EncodeState()
+
+        def walk_callback(value, path):
+            nonlocal state
+            nonlocal ref_counts
+
+            if not isinstance(value, SHACLObject):
+                return True
+
+            # Remove blank node ID for re-assignment
+            if value._id and value._id.startswith("_:"):
+                del value._id
+
+            if value._id:
+                state.add_refed(value)
+
+            # If the object is referenced more than once, add it to the se=
t of
+            # referenced objects
+            ref_counts.setdefault(value, 0)
+            ref_counts[value] +=3D 1
+            if ref_counts[value] > 1:
+                state.add_refed(value)
+                return False
+
+            return True
+
+        for o in self.objects:
+            if o._id:
+                state.add_refed(o)
+            o.walk(walk_callback)
+
+        use_list =3D force_list or len(self.objects) > 1
+
+        if use_list:
+            # If we are making a list add all the objects referred to by r=
eference
+            # to the list
+            objects =3D list(self.objects | state.ref_objects)
+        else:
+            objects =3D list(self.objects)
+
+        objects.sort()
+
+        if use_list:
+            # Ensure top level objects are only written in the top level g=
raph
+            # node, and referenced by ID everywhere else. This is done by =
setting
+            # the flag that indicates this object has been written for all=
 the top
+            # level objects, then clearing it right before serializing the=
 object.
+            #
+            # In this way, if an object is referenced before it is suppose=
d to be
+            # serialized into the @graph, it will serialize as a string in=
stead of
+            # the actual object
+            for o in objects:
+                state.written_objects.add(o)
+
+            with encoder.write_list() as list_s:
+                for o in objects:
+                    # Allow this specific object to be written now
+                    state.written_objects.remove(o)
+                    with list_s.write_list_item() as item_s:
+                        o.encode(item_s, state)
+
+        else:
+            objects[0].encode(encoder, state)
+
+    def decode(self, decoder):
+        self.create_index()
+
+        for obj_d in decoder.read_list():
+            o =3D SHACLObject.decode(obj_d, objectset=3Dself)
+            self.objects.add(o)
+
+        self._link()
+
+
+class EncodeState(object):
+    def __init__(self):
+        self.ref_objects =3D set()
+        self.written_objects =3D set()
+        self.blank_objects =3D {}
+
+    def get_object_id(self, o):
+        if o._id:
+            return o._id
+
+        if o not in self.blank_objects:
+            _id =3D f"_:{o.__class__.__name__}{len(self.blank_objects)}"
+            self.blank_objects[o] =3D _id
+
+        return self.blank_objects[o]
+
+    def is_refed(self, o):
+        return o in self.ref_objects
+
+    def add_refed(self, o):
+        self.ref_objects.add(o)
+
+    def is_written(self, o):
+        return o in self.written_objects
+
+    def add_written(self, o):
+        self.written_objects.add(o)
+
+
+class Decoder(ABC):
+    @abstractmethod
+    def read_value(self):
+        """
+        Consume next item
+
+        Consumes the next item of any type
+        """
+        pass
+
+    @abstractmethod
+    def read_string(self):
+        """
+        Consume the next item as a string.
+
+        Returns the string value of the next item, or `None` if the next i=
tem
+        is not a string
+        """
+        pass
+
+    @abstractmethod
+    def read_datetime(self):
+        """
+        Consumes the next item as a date & time string
+
+        Returns the string value of the next item, if it is a ISO datetime=
, or
+        `None` if the next item is not a ISO datetime string.
+
+        Note that validation of the string is done by the caller, so a min=
imal
+        implementation can just check if the next item is a string without
+        worrying about the format
+        """
+        pass
+
+    @abstractmethod
+    def read_integer(self):
+        """
+        Consumes the next item as an integer
+
+        Returns the integer value of the next item, or `None` if the next =
item
+        is not an integer
+        """
+        pass
+
+    @abstractmethod
+    def read_iri(self):
+        """
+        Consumes the next item as an IRI string
+
+        Returns the string value of the next item an IRI, or `None` if the=
 next
+        item is not an IRI.
+
+        The returned string should be either a fully-qualified IRI, or a b=
lank
+        node ID
+        """
+        pass
+
+    @abstractmethod
+    def read_enum(self, e):
+        """
+        Consumes the next item as an Enum value string
+
+        Returns the fully qualified IRI of the next enum item, or `None` i=
f the
+        next item is not an enum value.
+
+        The callee is responsible for validating that the returned IRI is
+        actually a member of the specified Enum, so the `Decoder` does not=
 need
+        to check that, but can if it wishes
+        """
+        pass
+
+    @abstractmethod
+    def read_bool(self):
+        """
+        Consume the next item as a boolean value
+
+        Returns the boolean value of the next item, or `None` if the next =
item
+        is not a boolean
+        """
+        pass
+
+    @abstractmethod
+    def read_float(self):
+        """
+        Consume the next item as a float value
+
+        Returns the float value of the next item, or `None` if the next it=
em is
+        not a float
+        """
+        pass
+
+    @abstractmethod
+    def read_list(self):
+        """
+        Consume the next item as a list generator
+
+        This should generate a `Decoder` object for each item in the list.=
 The
+        generated `Decoder` can be used to read the corresponding item fro=
m the
+        list
+        """
+        pass
+
+    @abstractmethod
+    def read_object(self):
+        """
+        Consume next item as an object
+
+        A context manager that "enters" the next item as a object and yiel=
ds a
+        `Decoder` that can read properties from it. If the next item is no=
t an
+        object, yields `None`
+
+        Properties will be read out of the object using `read_property` and
+        `read_object_id`
+        """
+        pass
+
+    @abstractmethod
+    @contextmanager
+    def read_property(self, key):
+        """
+        Read property from object
+
+        A context manager that yields a `Decoder` that can be used to read=
 the
+        value of the property with the given key in current object, or `No=
ne`
+        if the property does not exist in the current object.
+        """
+        pass
+
+    @abstractmethod
+    def object_keys(self):
+        """
+        Read property keys from an object
+
+        Iterates over all the serialized keys for the current object
+        """
+        pass
+
+    @abstractmethod
+    def read_object_id(self, alias=3DNone):
+        """
+        Read current object ID property
+
+        Returns the ID of the current object if one is defined, or `None` =
if
+        the current object has no ID.
+
+        The ID must be a fully qualified IRI or a blank node
+
+        If `alias` is provided, is is a hint as to another name by which t=
he ID
+        might be found, if the `Decoder` supports aliases for an ID
+        """
+        pass
+
+
+class JSONLDDecoder(Decoder):
+    def __init__(self, data, root=3DFalse):
+        self.data =3D data
+        self.root =3D root
+
+    def read_value(self):
+        if isinstance(self.data, str):
+            try:
+                return float(self.data)
+            except ValueError:
+                pass
+        return self.data
+
+    def read_string(self):
+        if isinstance(self.data, str):
+            return self.data
+        return None
+
+    def read_datetime(self):
+        return self.read_string()
+
+    def read_integer(self):
+        if isinstance(self.data, int):
+            return self.data
+        return None
+
+    def read_bool(self):
+        if isinstance(self.data, bool):
+            return self.data
+        return None
+
+    def read_float(self):
+        if isinstance(self.data, (int, float, str)):
+            return float(self.data)
+        return None
+
+    def read_iri(self):
+        if isinstance(self.data, str):
+            return self.data
+        return None
+
+    def read_enum(self, e):
+        if isinstance(self.data, str):
+            return self.data
+        return None
+
+    def read_list(self):
+        if isinstance(self.data, (list, tuple, set)):
+            for v in self.data:
+                yield self.__class__(v)
+        else:
+            yield self
+
+    def __get_value(self, *keys):
+        for k in keys:
+            if k and k in self.data:
+                return self.data[k]
+        return None
+
+    @contextmanager
+    def read_property(self, key):
+        v =3D self.__get_value(key)
+        if v is not None:
+            yield self.__class__(v)
+        else:
+            yield None
+
+    def object_keys(self):
+        for key in self.data.keys():
+            if key in ("@type", "type"):
+                continue
+            if self.root and key =3D=3D "@context":
+                continue
+            yield key
+
+    def read_object(self):
+        typ =3D self.__get_value("@type", "type")
+        if typ is not None:
+            return typ, self
+
+        return None, self
+
+    def read_object_id(self, alias=3DNone):
+        return self.__get_value(alias, "@id")
+
+
+class JSONLDDeserializer(object):
+    def deserialize_data(self, data, objectset: SHACLObjectSet):
+        if "@graph" in data:
+            h =3D JSONLDDecoder(data["@graph"], True)
+        else:
+            h =3D JSONLDDecoder(data, True)
+
+        objectset.decode(h)
+
+    def read(self, f, objectset: SHACLObjectSet):
+        data =3D json.load(f)
+        self.deserialize_data(data, objectset)
+
+
+class Encoder(ABC):
+    @abstractmethod
+    def write_string(self, v):
+        """
+        Write a string value
+
+        Encodes the value as a string in the output
+        """
+        pass
+
+    @abstractmethod
+    def write_datetime(self, v):
+        """
+        Write a date & time string
+
+        Encodes the value as an ISO datetime string
+
+        Note: The provided string is already correctly encoded as an ISO d=
atetime
+        """
+        pass
+
+    @abstractmethod
+    def write_integer(self, v):
+        """
+        Write an integer value
+
+        Encodes the value as an integer in the output
+        """
+        pass
+
+    @abstractmethod
+    def write_iri(self, v, compact=3DNone):
+        """
+        Write IRI
+
+        Encodes the string as an IRI. Note that the string will be either a
+        fully qualified IRI or a blank node ID. If `compact` is provided a=
nd
+        the serialization supports compacted IRIs, it should be preferred =
to
+        the full IRI
+        """
+        pass
+
+    @abstractmethod
+    def write_enum(self, v, e, compact=3DNone):
+        """
+        Write enum value IRI
+
+        Encodes the string enum value IRI. Note that the string will be a =
fully
+        qualified IRI. If `compact` is provided and the serialization supp=
orts
+        compacted IRIs, it should be preferred to the full IRI.
+        """
+        pass
+
+    @abstractmethod
+    def write_bool(self, v):
+        """
+        Write boolean
+
+        Encodes the value as a boolean in the output
+        """
+        pass
+
+    @abstractmethod
+    def write_float(self, v):
+        """
+        Write float
+
+        Encodes the value as a floating point number in the output
+        """
+        pass
+
+    @abstractmethod
+    @contextmanager
+    def write_object(self, o, _id, needs_id):
+        """
+        Write object
+
+        A context manager that yields an `Encoder` that can be used to enc=
ode
+        the given object properties.
+
+        The provided ID will always be a valid ID (even if o._id is `None`=
), in
+        case the `Encoder` _must_ have an ID. `needs_id` is a hint to indi=
cate
+        to the `Encoder` if an ID must be written or not (if that is even =
an
+        option). If it is `True`, the `Encoder` must encode an ID for the
+        object. If `False`, the encoder is not required to encode an ID an=
d may
+        omit it.
+
+        The ID will be either a fully qualified IRI, or a blank node IRI.
+
+        Properties will be written the object using `write_property`
+        """
+        pass
+
+    @abstractmethod
+    @contextmanager
+    def write_property(self, iri, compact=3DNone):
+        """
+        Write object property
+
+        A context manager that yields an `Encoder` that can be used to enc=
ode
+        the value for the property with the given IRI in the current object
+
+        Note that the IRI will be fully qualified. If `compact` is provide=
d and
+        the serialization supports compacted IRIs, it should be preferred =
to
+        the full IRI.
+        """
+        pass
+
+    @abstractmethod
+    @contextmanager
+    def write_list(self):
+        """
+        Write list
+
+        A context manager that yields an `Encoder` that can be used to enc=
ode a
+        list.
+
+        Each item of the list will be added using `write_list_item`
+        """
+        pass
+
+    @abstractmethod
+    @contextmanager
+    def write_list_item(self):
+        """
+        Write list item
+
+        A context manager that yields an `Encoder` that can be used to enc=
ode
+        the value for a list item
+        """
+        pass
+
+
+class JSONLDEncoder(Encoder):
+    def __init__(self, data=3DNone):
+        self.data =3D data
+
+    def write_string(self, v):
+        self.data =3D v
+
+    def write_datetime(self, v):
+        self.data =3D v
+
+    def write_integer(self, v):
+        self.data =3D v
+
+    def write_iri(self, v, compact=3DNone):
+        self.write_string(compact or v)
+
+    def write_enum(self, v, e, compact=3DNone):
+        self.write_string(compact or v)
+
+    def write_bool(self, v):
+        self.data =3D v
+
+    def write_float(self, v):
+        self.data =3D str(v)
+
+    @contextmanager
+    def write_property(self, iri, compact=3DNone):
+        s =3D self.__class__(None)
+        yield s
+        if s.data is not None:
+            self.data[compact or iri] =3D s.data
+
+    @contextmanager
+    def write_object(self, o, _id, needs_id):
+        self.data =3D {
+            "type": o.COMPACT_TYPE or o.TYPE,
+        }
+        if needs_id:
+            self.data[o.ID_ALIAS or "@id"] =3D _id
+        yield self
+
+    @contextmanager
+    def write_list(self):
+        self.data =3D []
+        yield self
+        if not self.data:
+            self.data =3D None
+
+    @contextmanager
+    def write_list_item(self):
+        s =3D self.__class__(None)
+        yield s
+        if s.data is not None:
+            self.data.append(s.data)
+
+
+class JSONLDSerializer(object):
+    def __init__(self, **args):
+        self.args =3D args
+
+    def serialize_data(
+        self,
+        objectset: SHACLObjectSet,
+        force_at_graph=3DFalse,
+    ):
+        h =3D JSONLDEncoder()
+        objectset.encode(h, force_at_graph)
+        data =3D {}
+        if len(CONTEXT_URLS) =3D=3D 1:
+            data["@context"] =3D CONTEXT_URLS[0]
+        elif CONTEXT_URLS:
+            data["@context"] =3D CONTEXT_URLS
+
+        if isinstance(h.data, list):
+            data["@graph"] =3D h.data
+        else:
+            for k, v in h.data.items():
+                data[k] =3D v
+
+        return data
+
+    def write(
+        self,
+        objectset: SHACLObjectSet,
+        f,
+        force_at_graph=3DFalse,
+        **kwargs,
+    ):
+        """
+        Write a SHACLObjectSet to a JSON LD file
+
+        If force_at_graph is True, a @graph node will always be written
+        """
+        data =3D self.serialize_data(objectset, force_at_graph)
+
+        args =3D {**self.args, **kwargs}
+
+        sha1 =3D hashlib.sha1()
+        for chunk in json.JSONEncoder(**args).iterencode(data):
+            chunk =3D chunk.encode("utf-8")
+            f.write(chunk)
+            sha1.update(chunk)
+
+        return sha1.hexdigest()
+
+
+class JSONLDInlineEncoder(Encoder):
+    def __init__(self, f, sha1):
+        self.f =3D f
+        self.comma =3D False
+        self.sha1 =3D sha1
+
+    def write(self, s):
+        s =3D s.encode("utf-8")
+        self.f.write(s)
+        self.sha1.update(s)
+
+    def _write_comma(self):
+        if self.comma:
+            self.write(",")
+            self.comma =3D False
+
+    def write_string(self, v):
+        self.write(json.dumps(v))
+
+    def write_datetime(self, v):
+        self.write_string(v)
+
+    def write_integer(self, v):
+        self.write(f"{v}")
+
+    def write_iri(self, v, compact=3DNone):
+        self.write_string(compact or v)
+
+    def write_enum(self, v, e, compact=3DNone):
+        self.write_iri(v, compact)
+
+    def write_bool(self, v):
+        if v:
+            self.write("true")
+        else:
+            self.write("false")
+
+    def write_float(self, v):
+        self.write(json.dumps(str(v)))
+
+    @contextmanager
+    def write_property(self, iri, compact=3DNone):
+        self._write_comma()
+        self.write_string(compact or iri)
+        self.write(":")
+        yield self
+        self.comma =3D True
+
+    @contextmanager
+    def write_object(self, o, _id, needs_id):
+        self._write_comma()
+
+        self.write("{")
+        self.write_string("type")
+        self.write(":")
+        self.write_string(o.COMPACT_TYPE or o.TYPE)
+        self.comma =3D True
+
+        if needs_id:
+            self._write_comma()
+            self.write_string(o.ID_ALIAS or "@id")
+            self.write(":")
+            self.write_string(_id)
+            self.comma =3D True
+
+        self.comma =3D True
+        yield self
+
+        self.write("}")
+        self.comma =3D True
+
+    @contextmanager
+    def write_list(self):
+        self._write_comma()
+        self.write("[")
+        yield self.__class__(self.f, self.sha1)
+        self.write("]")
+        self.comma =3D True
+
+    @contextmanager
+    def write_list_item(self):
+        self._write_comma()
+        yield self.__class__(self.f, self.sha1)
+        self.comma =3D True
+
+
+class JSONLDInlineSerializer(object):
+    def write(
+        self,
+        objectset: SHACLObjectSet,
+        f,
+        force_at_graph=3DFalse,
+    ):
+        """
+        Write a SHACLObjectSet to a JSON LD file
+
+        Note: force_at_graph is included for compatibility, but ignored. T=
his
+        serializer always writes out a graph
+        """
+        sha1 =3D hashlib.sha1()
+        h =3D JSONLDInlineEncoder(f, sha1)
+        h.write('{"@context":')
+        if len(CONTEXT_URLS) =3D=3D 1:
+            h.write(f'"{CONTEXT_URLS[0]}"')
+        elif CONTEXT_URLS:
+            h.write('["')
+            h.write('","'.join(CONTEXT_URLS))
+            h.write('"]')
+        h.write(",")
+
+        h.write('"@graph":')
+
+        objectset.encode(h, True)
+        h.write("}")
+        return sha1.hexdigest()
+
+
+def print_tree(objects, all_fields=3DFalse):
+    """
+    Print object tree
+    """
+    seen =3D set()
+
+    def callback(value, path):
+        nonlocal seen
+
+        s =3D ("  " * (len(path) - 1)) + f"{path[-1]}"
+        if isinstance(value, SHACLObject):
+            s +=3D f" {value} ({id(value)})"
+            is_empty =3D False
+        elif isinstance(value, ListProxy):
+            is_empty =3D len(value) =3D=3D 0
+            if is_empty:
+                s +=3D " []"
+        else:
+            s +=3D f" {value!r}"
+            is_empty =3D value is None
+
+        if all_fields or not is_empty:
+            print(s)
+
+        if isinstance(value, SHACLObject):
+            if value in seen:
+                return False
+            seen.add(value)
+            return True
+
+        return True
+
+    for o in objects:
+        o.walk(callback)
+
+
+# fmt: off
+"""Format Guard"""
+
+
+CONTEXT_URLS =3D [
+    "https://spdx.org/rdf/3.0.0/spdx-context.jsonld",
+]
+
+_NI_ENCODE_CONTEXT =3D {
+    "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/kilowattHour": "ai=
_EnergyUnitType:kilowattHour",
+    "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/megajoule": "ai_En=
ergyUnitType:megajoule",
+    "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/other": "ai_Energy=
UnitType:other",
+    "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType/high": "=
ai_SafetyRiskAssessmentType:high",
+    "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType/low": "a=
i_SafetyRiskAssessmentType:low",
+    "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType/medium":=
 "ai_SafetyRiskAssessmentType:medium",
+    "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType/serious"=
: "ai_SafetyRiskAssessmentType:serious",
+    "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/other": "Annotat=
ionType:other",
+    "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/review": "Annota=
tionType:review",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/cpe22": =
"ExternalIdentifierType:cpe22",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/cpe23": =
"ExternalIdentifierType:cpe23",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/cve": "E=
xternalIdentifierType:cve",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/email": =
"ExternalIdentifierType:email",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/gitoid":=
 "ExternalIdentifierType:gitoid",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/other": =
"ExternalIdentifierType:other",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/packageU=
rl": "ExternalIdentifierType:packageUrl",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/security=
Other": "ExternalIdentifierType:securityOther",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/swhid": =
"ExternalIdentifierType:swhid",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/swid": "=
ExternalIdentifierType:swid",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/urlSchem=
e": "ExternalIdentifierType:urlScheme",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/altDownloadLoca=
tion": "ExternalRefType:altDownloadLocation",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/altWebPage": "E=
xternalRefType:altWebPage",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/binaryArtifact"=
: "ExternalRefType:binaryArtifact",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/bower": "Extern=
alRefType:bower",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/buildMeta": "Ex=
ternalRefType:buildMeta",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/buildSystem": "=
ExternalRefType:buildSystem",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/certificationRe=
port": "ExternalRefType:certificationReport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/chat": "Externa=
lRefType:chat",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/componentAnalys=
isReport": "ExternalRefType:componentAnalysisReport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/cwe": "External=
RefType:cwe",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/documentation":=
 "ExternalRefType:documentation",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/dynamicAnalysis=
Report": "ExternalRefType:dynamicAnalysisReport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/eolNotice": "Ex=
ternalRefType:eolNotice",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/exportControlAs=
sessment": "ExternalRefType:exportControlAssessment",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/funding": "Exte=
rnalRefType:funding",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/issueTracker": =
"ExternalRefType:issueTracker",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/license": "Exte=
rnalRefType:license",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/mailingList": "=
ExternalRefType:mailingList",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/mavenCentral": =
"ExternalRefType:mavenCentral",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/metrics": "Exte=
rnalRefType:metrics",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/npm": "External=
RefType:npm",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/nuget": "Extern=
alRefType:nuget",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/other": "Extern=
alRefType:other",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/privacyAssessme=
nt": "ExternalRefType:privacyAssessment",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/productMetadata=
": "ExternalRefType:productMetadata",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/purchaseOrder":=
 "ExternalRefType:purchaseOrder",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/qualityAssessme=
ntReport": "ExternalRefType:qualityAssessmentReport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/releaseHistory"=
: "ExternalRefType:releaseHistory",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/releaseNotes": =
"ExternalRefType:releaseNotes",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/riskAssessment"=
: "ExternalRefType:riskAssessment",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/runtimeAnalysis=
Report": "ExternalRefType:runtimeAnalysisReport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/secureSoftwareA=
ttestation": "ExternalRefType:secureSoftwareAttestation",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityAdversa=
ryModel": "ExternalRefType:securityAdversaryModel",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityAdvisor=
y": "ExternalRefType:securityAdvisory",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityFix": "=
ExternalRefType:securityFix",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityOther":=
 "ExternalRefType:securityOther",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityPenTest=
Report": "ExternalRefType:securityPenTestReport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityPolicy"=
: "ExternalRefType:securityPolicy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/securityThreatM=
odel": "ExternalRefType:securityThreatModel",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/socialMedia": "=
ExternalRefType:socialMedia",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/sourceArtifact"=
: "ExternalRefType:sourceArtifact",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/staticAnalysisR=
eport": "ExternalRefType:staticAnalysisReport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/support": "Exte=
rnalRefType:support",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/vcs": "External=
RefType:vcs",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/vulnerabilityDi=
sclosureReport": "ExternalRefType:vulnerabilityDisclosureReport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/vulnerabilityEx=
ploitabilityAssessment": "ExternalRefType:vulnerabilityExploitabilityAssess=
ment",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/blake2b256": "Has=
hAlgorithm:blake2b256",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/blake2b384": "Has=
hAlgorithm:blake2b384",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/blake2b512": "Has=
hAlgorithm:blake2b512",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/blake3": "HashAlg=
orithm:blake3",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/crystalsDilithium=
": "HashAlgorithm:crystalsDilithium",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/crystalsKyber": "=
HashAlgorithm:crystalsKyber",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/falcon": "HashAlg=
orithm:falcon",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md2": "HashAlgori=
thm:md2",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md4": "HashAlgori=
thm:md4",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md5": "HashAlgori=
thm:md5",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md6": "HashAlgori=
thm:md6",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/other": "HashAlgo=
rithm:other",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha1": "HashAlgor=
ithm:sha1",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha224": "HashAlg=
orithm:sha224",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha256": "HashAlg=
orithm:sha256",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha384": "HashAlg=
orithm:sha384",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3_224": "HashA=
lgorithm:sha3_224",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3_256": "HashA=
lgorithm:sha3_256",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3_384": "HashA=
lgorithm:sha3_384",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3_512": "HashA=
lgorithm:sha3_512",
+    "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha512": "HashAlg=
orithm:sha512",
+    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/build": "Lif=
ecycleScopeType:build",
+    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/design": "Li=
fecycleScopeType:design",
+    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/development"=
: "LifecycleScopeType:development",
+    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/other": "Lif=
ecycleScopeType:other",
+    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/runtime": "L=
ifecycleScopeType:runtime",
+    "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/test": "Life=
cycleScopeType:test",
+    "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/no": "PresenceType=
:no",
+    "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/noAssertion": "Pre=
senceType:noAssertion",
+    "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/yes": "PresenceTyp=
e:yes",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/ai": "Pro=
fileIdentifierType:ai",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/build": "=
ProfileIdentifierType:build",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/core": "P=
rofileIdentifierType:core",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/dataset":=
 "ProfileIdentifierType:dataset",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/expandedL=
icensing": "ProfileIdentifierType:expandedLicensing",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/extension=
": "ProfileIdentifierType:extension",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/lite": "P=
rofileIdentifierType:lite",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/security"=
: "ProfileIdentifierType:security",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/simpleLic=
ensing": "ProfileIdentifierType:simpleLicensing",
+    "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/software"=
: "ProfileIdentifierType:software",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCompleteness/comple=
te": "RelationshipCompleteness:complete",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCompleteness/incomp=
lete": "RelationshipCompleteness:incomplete",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCompleteness/noAsse=
rtion": "RelationshipCompleteness:noAssertion",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/affects": "Rel=
ationshipType:affects",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/amendedBy": "R=
elationshipType:amendedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/ancestorOf": "=
RelationshipType:ancestorOf",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/availableFrom"=
: "RelationshipType:availableFrom",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/configures": "=
RelationshipType:configures",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/contains": "Re=
lationshipType:contains",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/coordinatedBy"=
: "RelationshipType:coordinatedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/copiedTo": "Re=
lationshipType:copiedTo",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/delegatedTo": =
"RelationshipType:delegatedTo",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/dependsOn": "R=
elationshipType:dependsOn",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/descendantOf":=
 "RelationshipType:descendantOf",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/describes": "R=
elationshipType:describes",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/doesNotAffect"=
: "RelationshipType:doesNotAffect",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/expandsTo": "R=
elationshipType:expandsTo",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/exploitCreated=
By": "RelationshipType:exploitCreatedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/fixedBy": "Rel=
ationshipType:fixedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/fixedIn": "Rel=
ationshipType:fixedIn",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/foundBy": "Rel=
ationshipType:foundBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/generates": "R=
elationshipType:generates",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasAddedFile":=
 "RelationshipType:hasAddedFile",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasAssessmentF=
or": "RelationshipType:hasAssessmentFor",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasAssociatedV=
ulnerability": "RelationshipType:hasAssociatedVulnerability",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasConcludedLi=
cense": "RelationshipType:hasConcludedLicense",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDataFile": =
"RelationshipType:hasDataFile",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDeclaredLic=
ense": "RelationshipType:hasDeclaredLicense",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDeletedFile=
": "RelationshipType:hasDeletedFile",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDependencyM=
anifest": "RelationshipType:hasDependencyManifest",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDistributio=
nArtifact": "RelationshipType:hasDistributionArtifact",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDocumentati=
on": "RelationshipType:hasDocumentation",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasDynamicLink=
": "RelationshipType:hasDynamicLink",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasEvidence": =
"RelationshipType:hasEvidence",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasExample": "=
RelationshipType:hasExample",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasHost": "Rel=
ationshipType:hasHost",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasInputs": "R=
elationshipType:hasInputs",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasMetadata": =
"RelationshipType:hasMetadata",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasOptionalCom=
ponent": "RelationshipType:hasOptionalComponent",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasOptionalDep=
endency": "RelationshipType:hasOptionalDependency",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasOutputs": "=
RelationshipType:hasOutputs",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasPrerequsite=
": "RelationshipType:hasPrerequsite",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasProvidedDep=
endency": "RelationshipType:hasProvidedDependency",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasRequirement=
": "RelationshipType:hasRequirement",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasSpecificati=
on": "RelationshipType:hasSpecification",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasStaticLink"=
: "RelationshipType:hasStaticLink",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasTest": "Rel=
ationshipType:hasTest",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasTestCase": =
"RelationshipType:hasTestCase",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/hasVariant": "=
RelationshipType:hasVariant",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/invokedBy": "R=
elationshipType:invokedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/modifiedBy": "=
RelationshipType:modifiedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/other": "Relat=
ionshipType:other",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/packagedBy": "=
RelationshipType:packagedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/patchedBy": "R=
elationshipType:patchedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/publishedBy": =
"RelationshipType:publishedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/reportedBy": "=
RelationshipType:reportedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/republishedBy"=
: "RelationshipType:republishedBy",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/serializedInAr=
tifact": "RelationshipType:serializedInArtifact",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/testedOn": "Re=
lationshipType:testedOn",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/trainedOn": "R=
elationshipType:trainedOn",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/underInvestiga=
tionFor": "RelationshipType:underInvestigationFor",
+    "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/usesTool": "Re=
lationshipType:usesTool",
+    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/deployed": "Support=
Type:deployed",
+    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/development": "Supp=
ortType:development",
+    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/endOfSupport": "Sup=
portType:endOfSupport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/limitedSupport": "S=
upportType:limitedSupport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/noAssertion": "Supp=
ortType:noAssertion",
+    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/noSupport": "Suppor=
tType:noSupport",
+    "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/support": "SupportT=
ype:support",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevelType/amb=
er": "dataset_ConfidentialityLevelType:amber",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevelType/cle=
ar": "dataset_ConfidentialityLevelType:clear",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevelType/gre=
en": "dataset_ConfidentialityLevelType:green",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevelType/red=
": "dataset_ConfidentialityLevelType:red",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityType/clic=
kthrough": "dataset_DatasetAvailabilityType:clickthrough",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityType/dire=
ctDownload": "dataset_DatasetAvailabilityType:directDownload",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityType/quer=
y": "dataset_DatasetAvailabilityType:query",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityType/regi=
stration": "dataset_DatasetAvailabilityType:registration",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityType/scra=
pingScript": "dataset_DatasetAvailabilityType:scrapingScript",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/audio": "dataset=
_DatasetType:audio",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/categorical": "d=
ataset_DatasetType:categorical",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/graph": "dataset=
_DatasetType:graph",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/image": "dataset=
_DatasetType:image",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/noAssertion": "d=
ataset_DatasetType:noAssertion",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/numeric": "datas=
et_DatasetType:numeric",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/other": "dataset=
_DatasetType:other",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/sensor": "datase=
t_DatasetType:sensor",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/structured": "da=
taset_DatasetType:structured",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/syntactic": "dat=
aset_DatasetType:syntactic",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/text": "dataset_=
DatasetType:text",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/timeseries": "da=
taset_DatasetType:timeseries",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/timestamp": "dat=
aset_DatasetType:timestamp",
+    "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/video": "dataset=
_DatasetType:video",
+    "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/critical":=
 "security_CvssSeverityType:critical",
+    "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/high": "se=
curity_CvssSeverityType:high",
+    "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/low": "sec=
urity_CvssSeverityType:low",
+    "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/medium": "=
security_CvssSeverityType:medium",
+    "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/none": "se=
curity_CvssSeverityType:none",
+    "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogType/kev": "s=
ecurity_ExploitCatalogType:kev",
+    "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogType/other": =
"security_ExploitCatalogType:other",
+    "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/act": "sec=
urity_SsvcDecisionType:act",
+    "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/attend": "=
security_SsvcDecisionType:attend",
+    "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/track": "s=
ecurity_SsvcDecisionType:track",
+    "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/trackStar"=
: "security_SsvcDecisionType:trackStar",
+    "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/compon=
entNotPresent": "security_VexJustificationType:componentNotPresent",
+    "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/inline=
MitigationsAlreadyExist": "security_VexJustificationType:inlineMitigationsA=
lreadyExist",
+    "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/vulner=
ableCodeCannotBeControlledByAdversary": "security_VexJustificationType:vuln=
erableCodeCannotBeControlledByAdversary",
+    "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/vulner=
ableCodeNotInExecutePath": "security_VexJustificationType:vulnerableCodeNot=
InExecutePath",
+    "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/vulner=
ableCodeNotPresent": "security_VexJustificationType:vulnerableCodeNotPresen=
t",
+    "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifierType/gitoi=
d": "software_ContentIdentifierType:gitoid",
+    "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifierType/swhid=
": "software_ContentIdentifierType:swhid",
+    "https://spdx.org/rdf/3.0.0/terms/Software/FileKindType/directory": "s=
oftware_FileKindType:directory",
+    "https://spdx.org/rdf/3.0.0/terms/Software/FileKindType/file": "softwa=
re_FileKindType:file",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/analyzed": "softwa=
re_SbomType:analyzed",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/build": "software_=
SbomType:build",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/deployed": "softwa=
re_SbomType:deployed",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/design": "software=
_SbomType:design",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/runtime": "softwar=
e_SbomType:runtime",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/source": "software=
_SbomType:source",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/application=
": "software_SoftwarePurpose:application",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/archive": "=
software_SoftwarePurpose:archive",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/bom": "soft=
ware_SoftwarePurpose:bom",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/configurati=
on": "software_SoftwarePurpose:configuration",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/container":=
 "software_SoftwarePurpose:container",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/data": "sof=
tware_SoftwarePurpose:data",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/device": "s=
oftware_SoftwarePurpose:device",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/deviceDrive=
r": "software_SoftwarePurpose:deviceDriver",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/diskImage":=
 "software_SoftwarePurpose:diskImage",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/documentati=
on": "software_SoftwarePurpose:documentation",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/evidence": =
"software_SoftwarePurpose:evidence",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/executable"=
: "software_SoftwarePurpose:executable",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/file": "sof=
tware_SoftwarePurpose:file",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/filesystemI=
mage": "software_SoftwarePurpose:filesystemImage",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/firmware": =
"software_SoftwarePurpose:firmware",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/framework":=
 "software_SoftwarePurpose:framework",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/install": "=
software_SoftwarePurpose:install",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/library": "=
software_SoftwarePurpose:library",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/manifest": =
"software_SoftwarePurpose:manifest",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/model": "so=
ftware_SoftwarePurpose:model",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/module": "s=
oftware_SoftwarePurpose:module",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/operatingSy=
stem": "software_SoftwarePurpose:operatingSystem",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/other": "so=
ftware_SoftwarePurpose:other",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/patch": "so=
ftware_SoftwarePurpose:patch",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/platform": =
"software_SoftwarePurpose:platform",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/requirement=
": "software_SoftwarePurpose:requirement",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/source": "s=
oftware_SoftwarePurpose:source",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/specificati=
on": "software_SoftwarePurpose:specification",
+    "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/test": "sof=
tware_SoftwarePurpose:test",
+}
+
+_NI_DECODE_CONTEXT =3D {
+    "ai_EnergyUnitType:kilowattHour": "https://spdx.org/rdf/3.0.0/terms/AI=
/EnergyUnitType/kilowattHour",
+    "ai_EnergyUnitType:megajoule": "https://spdx.org/rdf/3.0.0/terms/AI/En=
ergyUnitType/megajoule",
+    "ai_EnergyUnitType:other": "https://spdx.org/rdf/3.0.0/terms/AI/Energy=
UnitType/other",
+    "ai_SafetyRiskAssessmentType:high": "https://spdx.org/rdf/3.0.0/terms/=
AI/SafetyRiskAssessmentType/high",
+    "ai_SafetyRiskAssessmentType:low": "https://spdx.org/rdf/3.0.0/terms/A=
I/SafetyRiskAssessmentType/low",
+    "ai_SafetyRiskAssessmentType:medium": "https://spdx.org/rdf/3.0.0/term=
s/AI/SafetyRiskAssessmentType/medium",
+    "ai_SafetyRiskAssessmentType:serious": "https://spdx.org/rdf/3.0.0/ter=
ms/AI/SafetyRiskAssessmentType/serious",
+    "AnnotationType:other": "https://spdx.org/rdf/3.0.0/terms/Core/Annotat=
ionType/other",
+    "AnnotationType:review": "https://spdx.org/rdf/3.0.0/terms/Core/Annota=
tionType/review",
+    "ExternalIdentifierType:cpe22": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalIdentifierType/cpe22",
+    "ExternalIdentifierType:cpe23": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalIdentifierType/cpe23",
+    "ExternalIdentifierType:cve": "https://spdx.org/rdf/3.0.0/terms/Core/E=
xternalIdentifierType/cve",
+    "ExternalIdentifierType:email": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalIdentifierType/email",
+    "ExternalIdentifierType:gitoid": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ExternalIdentifierType/gitoid",
+    "ExternalIdentifierType:other": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalIdentifierType/other",
+    "ExternalIdentifierType:packageUrl": "https://spdx.org/rdf/3.0.0/terms=
/Core/ExternalIdentifierType/packageUrl",
+    "ExternalIdentifierType:securityOther": "https://spdx.org/rdf/3.0.0/te=
rms/Core/ExternalIdentifierType/securityOther",
+    "ExternalIdentifierType:swhid": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalIdentifierType/swhid",
+    "ExternalIdentifierType:swid": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalIdentifierType/swid",
+    "ExternalIdentifierType:urlScheme": "https://spdx.org/rdf/3.0.0/terms/=
Core/ExternalIdentifierType/urlScheme",
+    "ExternalRefType:altDownloadLocation": "https://spdx.org/rdf/3.0.0/ter=
ms/Core/ExternalRefType/altDownloadLocation",
+    "ExternalRefType:altWebPage": "https://spdx.org/rdf/3.0.0/terms/Core/E=
xternalRefType/altWebPage",
+    "ExternalRefType:binaryArtifact": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/binaryArtifact",
+    "ExternalRefType:bower": "https://spdx.org/rdf/3.0.0/terms/Core/Extern=
alRefType/bower",
+    "ExternalRefType:buildMeta": "https://spdx.org/rdf/3.0.0/terms/Core/Ex=
ternalRefType/buildMeta",
+    "ExternalRefType:buildSystem": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/buildSystem",
+    "ExternalRefType:certificationReport": "https://spdx.org/rdf/3.0.0/ter=
ms/Core/ExternalRefType/certificationReport",
+    "ExternalRefType:chat": "https://spdx.org/rdf/3.0.0/terms/Core/Externa=
lRefType/chat",
+    "ExternalRefType:componentAnalysisReport": "https://spdx.org/rdf/3.0.0=
/terms/Core/ExternalRefType/componentAnalysisReport",
+    "ExternalRefType:cwe": "https://spdx.org/rdf/3.0.0/terms/Core/External=
RefType/cwe",
+    "ExternalRefType:documentation": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ExternalRefType/documentation",
+    "ExternalRefType:dynamicAnalysisReport": "https://spdx.org/rdf/3.0.0/t=
erms/Core/ExternalRefType/dynamicAnalysisReport",
+    "ExternalRefType:eolNotice": "https://spdx.org/rdf/3.0.0/terms/Core/Ex=
ternalRefType/eolNotice",
+    "ExternalRefType:exportControlAssessment": "https://spdx.org/rdf/3.0.0=
/terms/Core/ExternalRefType/exportControlAssessment",
+    "ExternalRefType:funding": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/funding",
+    "ExternalRefType:issueTracker": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalRefType/issueTracker",
+    "ExternalRefType:license": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/license",
+    "ExternalRefType:mailingList": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/mailingList",
+    "ExternalRefType:mavenCentral": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalRefType/mavenCentral",
+    "ExternalRefType:metrics": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/metrics",
+    "ExternalRefType:npm": "https://spdx.org/rdf/3.0.0/terms/Core/External=
RefType/npm",
+    "ExternalRefType:nuget": "https://spdx.org/rdf/3.0.0/terms/Core/Extern=
alRefType/nuget",
+    "ExternalRefType:other": "https://spdx.org/rdf/3.0.0/terms/Core/Extern=
alRefType/other",
+    "ExternalRefType:privacyAssessment": "https://spdx.org/rdf/3.0.0/terms=
/Core/ExternalRefType/privacyAssessment",
+    "ExternalRefType:productMetadata": "https://spdx.org/rdf/3.0.0/terms/C=
ore/ExternalRefType/productMetadata",
+    "ExternalRefType:purchaseOrder": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ExternalRefType/purchaseOrder",
+    "ExternalRefType:qualityAssessmentReport": "https://spdx.org/rdf/3.0.0=
/terms/Core/ExternalRefType/qualityAssessmentReport",
+    "ExternalRefType:releaseHistory": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/releaseHistory",
+    "ExternalRefType:releaseNotes": "https://spdx.org/rdf/3.0.0/terms/Core=
/ExternalRefType/releaseNotes",
+    "ExternalRefType:riskAssessment": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/riskAssessment",
+    "ExternalRefType:runtimeAnalysisReport": "https://spdx.org/rdf/3.0.0/t=
erms/Core/ExternalRefType/runtimeAnalysisReport",
+    "ExternalRefType:secureSoftwareAttestation": "https://spdx.org/rdf/3.0=
.0/terms/Core/ExternalRefType/secureSoftwareAttestation",
+    "ExternalRefType:securityAdversaryModel": "https://spdx.org/rdf/3.0.0/=
terms/Core/ExternalRefType/securityAdversaryModel",
+    "ExternalRefType:securityAdvisory": "https://spdx.org/rdf/3.0.0/terms/=
Core/ExternalRefType/securityAdvisory",
+    "ExternalRefType:securityFix": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/securityFix",
+    "ExternalRefType:securityOther": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ExternalRefType/securityOther",
+    "ExternalRefType:securityPenTestReport": "https://spdx.org/rdf/3.0.0/t=
erms/Core/ExternalRefType/securityPenTestReport",
+    "ExternalRefType:securityPolicy": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/securityPolicy",
+    "ExternalRefType:securityThreatModel": "https://spdx.org/rdf/3.0.0/ter=
ms/Core/ExternalRefType/securityThreatModel",
+    "ExternalRefType:socialMedia": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/socialMedia",
+    "ExternalRefType:sourceArtifact": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/sourceArtifact",
+    "ExternalRefType:staticAnalysisReport": "https://spdx.org/rdf/3.0.0/te=
rms/Core/ExternalRefType/staticAnalysisReport",
+    "ExternalRefType:support": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/support",
+    "ExternalRefType:vcs": "https://spdx.org/rdf/3.0.0/terms/Core/External=
RefType/vcs",
+    "ExternalRefType:vulnerabilityDisclosureReport": "https://spdx.org/rdf=
/3.0.0/terms/Core/ExternalRefType/vulnerabilityDisclosureReport",
+    "ExternalRefType:vulnerabilityExploitabilityAssessment": "https://spdx=
.org/rdf/3.0.0/terms/Core/ExternalRefType/vulnerabilityExploitabilityAssess=
ment",
+    "HashAlgorithm:blake2b256": "https://spdx.org/rdf/3.0.0/terms/Core/Has=
hAlgorithm/blake2b256",
+    "HashAlgorithm:blake2b384": "https://spdx.org/rdf/3.0.0/terms/Core/Has=
hAlgorithm/blake2b384",
+    "HashAlgorithm:blake2b512": "https://spdx.org/rdf/3.0.0/terms/Core/Has=
hAlgorithm/blake2b512",
+    "HashAlgorithm:blake3": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/blake3",
+    "HashAlgorithm:crystalsDilithium": "https://spdx.org/rdf/3.0.0/terms/C=
ore/HashAlgorithm/crystalsDilithium",
+    "HashAlgorithm:crystalsKyber": "https://spdx.org/rdf/3.0.0/terms/Core/=
HashAlgorithm/crystalsKyber",
+    "HashAlgorithm:falcon": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/falcon",
+    "HashAlgorithm:md2": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgori=
thm/md2",
+    "HashAlgorithm:md4": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgori=
thm/md4",
+    "HashAlgorithm:md5": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgori=
thm/md5",
+    "HashAlgorithm:md6": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgori=
thm/md6",
+    "HashAlgorithm:other": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgo=
rithm/other",
+    "HashAlgorithm:sha1": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgor=
ithm/sha1",
+    "HashAlgorithm:sha224": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/sha224",
+    "HashAlgorithm:sha256": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/sha256",
+    "HashAlgorithm:sha384": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/sha384",
+    "HashAlgorithm:sha3_224": "https://spdx.org/rdf/3.0.0/terms/Core/HashA=
lgorithm/sha3_224",
+    "HashAlgorithm:sha3_256": "https://spdx.org/rdf/3.0.0/terms/Core/HashA=
lgorithm/sha3_256",
+    "HashAlgorithm:sha3_384": "https://spdx.org/rdf/3.0.0/terms/Core/HashA=
lgorithm/sha3_384",
+    "HashAlgorithm:sha3_512": "https://spdx.org/rdf/3.0.0/terms/Core/HashA=
lgorithm/sha3_512",
+    "HashAlgorithm:sha512": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlg=
orithm/sha512",
+    "LifecycleScopeType:build": "https://spdx.org/rdf/3.0.0/terms/Core/Lif=
ecycleScopeType/build",
+    "LifecycleScopeType:design": "https://spdx.org/rdf/3.0.0/terms/Core/Li=
fecycleScopeType/design",
+    "LifecycleScopeType:development": "https://spdx.org/rdf/3.0.0/terms/Co=
re/LifecycleScopeType/development",
+    "LifecycleScopeType:other": "https://spdx.org/rdf/3.0.0/terms/Core/Lif=
ecycleScopeType/other",
+    "LifecycleScopeType:runtime": "https://spdx.org/rdf/3.0.0/terms/Core/L=
ifecycleScopeType/runtime",
+    "LifecycleScopeType:test": "https://spdx.org/rdf/3.0.0/terms/Core/Life=
cycleScopeType/test",
+    "PresenceType:no": "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType=
/no",
+    "PresenceType:noAssertion": "https://spdx.org/rdf/3.0.0/terms/Core/Pre=
senceType/noAssertion",
+    "PresenceType:yes": "https://spdx.org/rdf/3.0.0/terms/Core/PresenceTyp=
e/yes",
+    "ProfileIdentifierType:ai": "https://spdx.org/rdf/3.0.0/terms/Core/Pro=
fileIdentifierType/ai",
+    "ProfileIdentifierType:build": "https://spdx.org/rdf/3.0.0/terms/Core/=
ProfileIdentifierType/build",
+    "ProfileIdentifierType:core": "https://spdx.org/rdf/3.0.0/terms/Core/P=
rofileIdentifierType/core",
+    "ProfileIdentifierType:dataset": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ProfileIdentifierType/dataset",
+    "ProfileIdentifierType:expandedLicensing": "https://spdx.org/rdf/3.0.0=
/terms/Core/ProfileIdentifierType/expandedLicensing",
+    "ProfileIdentifierType:extension": "https://spdx.org/rdf/3.0.0/terms/C=
ore/ProfileIdentifierType/extension",
+    "ProfileIdentifierType:lite": "https://spdx.org/rdf/3.0.0/terms/Core/P=
rofileIdentifierType/lite",
+    "ProfileIdentifierType:security": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ProfileIdentifierType/security",
+    "ProfileIdentifierType:simpleLicensing": "https://spdx.org/rdf/3.0.0/t=
erms/Core/ProfileIdentifierType/simpleLicensing",
+    "ProfileIdentifierType:software": "https://spdx.org/rdf/3.0.0/terms/Co=
re/ProfileIdentifierType/software",
+    "RelationshipCompleteness:complete": "https://spdx.org/rdf/3.0.0/terms=
/Core/RelationshipCompleteness/complete",
+    "RelationshipCompleteness:incomplete": "https://spdx.org/rdf/3.0.0/ter=
ms/Core/RelationshipCompleteness/incomplete",
+    "RelationshipCompleteness:noAssertion": "https://spdx.org/rdf/3.0.0/te=
rms/Core/RelationshipCompleteness/noAssertion",
+    "RelationshipType:affects": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/affects",
+    "RelationshipType:amendedBy": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/amendedBy",
+    "RelationshipType:ancestorOf": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/ancestorOf",
+    "RelationshipType:availableFrom": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/availableFrom",
+    "RelationshipType:configures": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/configures",
+    "RelationshipType:contains": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/contains",
+    "RelationshipType:coordinatedBy": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/coordinatedBy",
+    "RelationshipType:copiedTo": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/copiedTo",
+    "RelationshipType:delegatedTo": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/delegatedTo",
+    "RelationshipType:dependsOn": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/dependsOn",
+    "RelationshipType:descendantOf": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/RelationshipType/descendantOf",
+    "RelationshipType:describes": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/describes",
+    "RelationshipType:doesNotAffect": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/doesNotAffect",
+    "RelationshipType:expandsTo": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/expandsTo",
+    "RelationshipType:exploitCreatedBy": "https://spdx.org/rdf/3.0.0/terms=
/Core/RelationshipType/exploitCreatedBy",
+    "RelationshipType:fixedBy": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/fixedBy",
+    "RelationshipType:fixedIn": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/fixedIn",
+    "RelationshipType:foundBy": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/foundBy",
+    "RelationshipType:generates": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/generates",
+    "RelationshipType:hasAddedFile": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/RelationshipType/hasAddedFile",
+    "RelationshipType:hasAssessmentFor": "https://spdx.org/rdf/3.0.0/terms=
/Core/RelationshipType/hasAssessmentFor",
+    "RelationshipType:hasAssociatedVulnerability": "https://spdx.org/rdf/3=
.0.0/terms/Core/RelationshipType/hasAssociatedVulnerability",
+    "RelationshipType:hasConcludedLicense": "https://spdx.org/rdf/3.0.0/te=
rms/Core/RelationshipType/hasConcludedLicense",
+    "RelationshipType:hasDataFile": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/hasDataFile",
+    "RelationshipType:hasDeclaredLicense": "https://spdx.org/rdf/3.0.0/ter=
ms/Core/RelationshipType/hasDeclaredLicense",
+    "RelationshipType:hasDeletedFile": "https://spdx.org/rdf/3.0.0/terms/C=
ore/RelationshipType/hasDeletedFile",
+    "RelationshipType:hasDependencyManifest": "https://spdx.org/rdf/3.0.0/=
terms/Core/RelationshipType/hasDependencyManifest",
+    "RelationshipType:hasDistributionArtifact": "https://spdx.org/rdf/3.0.=
0/terms/Core/RelationshipType/hasDistributionArtifact",
+    "RelationshipType:hasDocumentation": "https://spdx.org/rdf/3.0.0/terms=
/Core/RelationshipType/hasDocumentation",
+    "RelationshipType:hasDynamicLink": "https://spdx.org/rdf/3.0.0/terms/C=
ore/RelationshipType/hasDynamicLink",
+    "RelationshipType:hasEvidence": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/hasEvidence",
+    "RelationshipType:hasExample": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/hasExample",
+    "RelationshipType:hasHost": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/hasHost",
+    "RelationshipType:hasInputs": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/hasInputs",
+    "RelationshipType:hasMetadata": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/hasMetadata",
+    "RelationshipType:hasOptionalComponent": "https://spdx.org/rdf/3.0.0/t=
erms/Core/RelationshipType/hasOptionalComponent",
+    "RelationshipType:hasOptionalDependency": "https://spdx.org/rdf/3.0.0/=
terms/Core/RelationshipType/hasOptionalDependency",
+    "RelationshipType:hasOutputs": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/hasOutputs",
+    "RelationshipType:hasPrerequsite": "https://spdx.org/rdf/3.0.0/terms/C=
ore/RelationshipType/hasPrerequsite",
+    "RelationshipType:hasProvidedDependency": "https://spdx.org/rdf/3.0.0/=
terms/Core/RelationshipType/hasProvidedDependency",
+    "RelationshipType:hasRequirement": "https://spdx.org/rdf/3.0.0/terms/C=
ore/RelationshipType/hasRequirement",
+    "RelationshipType:hasSpecification": "https://spdx.org/rdf/3.0.0/terms=
/Core/RelationshipType/hasSpecification",
+    "RelationshipType:hasStaticLink": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/hasStaticLink",
+    "RelationshipType:hasTest": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/hasTest",
+    "RelationshipType:hasTestCase": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/hasTestCase",
+    "RelationshipType:hasVariant": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/hasVariant",
+    "RelationshipType:invokedBy": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/invokedBy",
+    "RelationshipType:modifiedBy": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/modifiedBy",
+    "RelationshipType:other": "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/other",
+    "RelationshipType:packagedBy": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/packagedBy",
+    "RelationshipType:patchedBy": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/patchedBy",
+    "RelationshipType:publishedBy": "https://spdx.org/rdf/3.0.0/terms/Core=
/RelationshipType/publishedBy",
+    "RelationshipType:reportedBy": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/reportedBy",
+    "RelationshipType:republishedBy": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/republishedBy",
+    "RelationshipType:serializedInArtifact": "https://spdx.org/rdf/3.0.0/t=
erms/Core/RelationshipType/serializedInArtifact",
+    "RelationshipType:testedOn": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/testedOn",
+    "RelationshipType:trainedOn": "https://spdx.org/rdf/3.0.0/terms/Core/R=
elationshipType/trainedOn",
+    "RelationshipType:underInvestigationFor": "https://spdx.org/rdf/3.0.0/=
terms/Core/RelationshipType/underInvestigationFor",
+    "RelationshipType:usesTool": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/usesTool",
+    "SupportType:deployed": "https://spdx.org/rdf/3.0.0/terms/Core/Support=
Type/deployed",
+    "SupportType:development": "https://spdx.org/rdf/3.0.0/terms/Core/Supp=
ortType/development",
+    "SupportType:endOfSupport": "https://spdx.org/rdf/3.0.0/terms/Core/Sup=
portType/endOfSupport",
+    "SupportType:limitedSupport": "https://spdx.org/rdf/3.0.0/terms/Core/S=
upportType/limitedSupport",
+    "SupportType:noAssertion": "https://spdx.org/rdf/3.0.0/terms/Core/Supp=
ortType/noAssertion",
+    "SupportType:noSupport": "https://spdx.org/rdf/3.0.0/terms/Core/Suppor=
tType/noSupport",
+    "SupportType:support": "https://spdx.org/rdf/3.0.0/terms/Core/SupportT=
ype/support",
+    "dataset_ConfidentialityLevelType:amber": "https://spdx.org/rdf/3.0.0/=
terms/Dataset/ConfidentialityLevelType/amber",
+    "dataset_ConfidentialityLevelType:clear": "https://spdx.org/rdf/3.0.0/=
terms/Dataset/ConfidentialityLevelType/clear",
+    "dataset_ConfidentialityLevelType:green": "https://spdx.org/rdf/3.0.0/=
terms/Dataset/ConfidentialityLevelType/green",
+    "dataset_ConfidentialityLevelType:red": "https://spdx.org/rdf/3.0.0/te=
rms/Dataset/ConfidentialityLevelType/red",
+    "dataset_DatasetAvailabilityType:clickthrough": "https://spdx.org/rdf/=
3.0.0/terms/Dataset/DatasetAvailabilityType/clickthrough",
+    "dataset_DatasetAvailabilityType:directDownload": "https://spdx.org/rd=
f/3.0.0/terms/Dataset/DatasetAvailabilityType/directDownload",
+    "dataset_DatasetAvailabilityType:query": "https://spdx.org/rdf/3.0.0/t=
erms/Dataset/DatasetAvailabilityType/query",
+    "dataset_DatasetAvailabilityType:registration": "https://spdx.org/rdf/=
3.0.0/terms/Dataset/DatasetAvailabilityType/registration",
+    "dataset_DatasetAvailabilityType:scrapingScript": "https://spdx.org/rd=
f/3.0.0/terms/Dataset/DatasetAvailabilityType/scrapingScript",
+    "dataset_DatasetType:audio": "https://spdx.org/rdf/3.0.0/terms/Dataset=
/DatasetType/audio",
+    "dataset_DatasetType:categorical": "https://spdx.org/rdf/3.0.0/terms/D=
ataset/DatasetType/categorical",
+    "dataset_DatasetType:graph": "https://spdx.org/rdf/3.0.0/terms/Dataset=
/DatasetType/graph",
+    "dataset_DatasetType:image": "https://spdx.org/rdf/3.0.0/terms/Dataset=
/DatasetType/image",
+    "dataset_DatasetType:noAssertion": "https://spdx.org/rdf/3.0.0/terms/D=
ataset/DatasetType/noAssertion",
+    "dataset_DatasetType:numeric": "https://spdx.org/rdf/3.0.0/terms/Datas=
et/DatasetType/numeric",
+    "dataset_DatasetType:other": "https://spdx.org/rdf/3.0.0/terms/Dataset=
/DatasetType/other",
+    "dataset_DatasetType:sensor": "https://spdx.org/rdf/3.0.0/terms/Datase=
t/DatasetType/sensor",
+    "dataset_DatasetType:structured": "https://spdx.org/rdf/3.0.0/terms/Da=
taset/DatasetType/structured",
+    "dataset_DatasetType:syntactic": "https://spdx.org/rdf/3.0.0/terms/Dat=
aset/DatasetType/syntactic",
+    "dataset_DatasetType:text": "https://spdx.org/rdf/3.0.0/terms/Dataset/=
DatasetType/text",
+    "dataset_DatasetType:timeseries": "https://spdx.org/rdf/3.0.0/terms/Da=
taset/DatasetType/timeseries",
+    "dataset_DatasetType:timestamp": "https://spdx.org/rdf/3.0.0/terms/Dat=
aset/DatasetType/timestamp",
+    "dataset_DatasetType:video": "https://spdx.org/rdf/3.0.0/terms/Dataset=
/DatasetType/video",
+    "security_CvssSeverityType:critical": "https://spdx.org/rdf/3.0.0/term=
s/Security/CvssSeverityType/critical",
+    "security_CvssSeverityType:high": "https://spdx.org/rdf/3.0.0/terms/Se=
curity/CvssSeverityType/high",
+    "security_CvssSeverityType:low": "https://spdx.org/rdf/3.0.0/terms/Sec=
urity/CvssSeverityType/low",
+    "security_CvssSeverityType:medium": "https://spdx.org/rdf/3.0.0/terms/=
Security/CvssSeverityType/medium",
+    "security_CvssSeverityType:none": "https://spdx.org/rdf/3.0.0/terms/Se=
curity/CvssSeverityType/none",
+    "security_ExploitCatalogType:kev": "https://spdx.org/rdf/3.0.0/terms/S=
ecurity/ExploitCatalogType/kev",
+    "security_ExploitCatalogType:other": "https://spdx.org/rdf/3.0.0/terms=
/Security/ExploitCatalogType/other",
+    "security_SsvcDecisionType:act": "https://spdx.org/rdf/3.0.0/terms/Sec=
urity/SsvcDecisionType/act",
+    "security_SsvcDecisionType:attend": "https://spdx.org/rdf/3.0.0/terms/=
Security/SsvcDecisionType/attend",
+    "security_SsvcDecisionType:track": "https://spdx.org/rdf/3.0.0/terms/S=
ecurity/SsvcDecisionType/track",
+    "security_SsvcDecisionType:trackStar": "https://spdx.org/rdf/3.0.0/ter=
ms/Security/SsvcDecisionType/trackStar",
+    "security_VexJustificationType:componentNotPresent": "https://spdx.org=
/rdf/3.0.0/terms/Security/VexJustificationType/componentNotPresent",
+    "security_VexJustificationType:inlineMitigationsAlreadyExist": "https:=
//spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/inlineMitigationsA=
lreadyExist",
+    "security_VexJustificationType:vulnerableCodeCannotBeControlledByAdver=
sary": "https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/vuln=
erableCodeCannotBeControlledByAdversary",
+    "security_VexJustificationType:vulnerableCodeNotInExecutePath": "https=
://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType/vulnerableCodeNot=
InExecutePath",
+    "security_VexJustificationType:vulnerableCodeNotPresent": "https://spd=
x.org/rdf/3.0.0/terms/Security/VexJustificationType/vulnerableCodeNotPresen=
t",
+    "software_ContentIdentifierType:gitoid": "https://spdx.org/rdf/3.0.0/t=
erms/Software/ContentIdentifierType/gitoid",
+    "software_ContentIdentifierType:swhid": "https://spdx.org/rdf/3.0.0/te=
rms/Software/ContentIdentifierType/swhid",
+    "software_FileKindType:directory": "https://spdx.org/rdf/3.0.0/terms/S=
oftware/FileKindType/directory",
+    "software_FileKindType:file": "https://spdx.org/rdf/3.0.0/terms/Softwa=
re/FileKindType/file",
+    "software_SbomType:analyzed": "https://spdx.org/rdf/3.0.0/terms/Softwa=
re/SbomType/analyzed",
+    "software_SbomType:build": "https://spdx.org/rdf/3.0.0/terms/Software/=
SbomType/build",
+    "software_SbomType:deployed": "https://spdx.org/rdf/3.0.0/terms/Softwa=
re/SbomType/deployed",
+    "software_SbomType:design": "https://spdx.org/rdf/3.0.0/terms/Software=
/SbomType/design",
+    "software_SbomType:runtime": "https://spdx.org/rdf/3.0.0/terms/Softwar=
e/SbomType/runtime",
+    "software_SbomType:source": "https://spdx.org/rdf/3.0.0/terms/Software=
/SbomType/source",
+    "software_SoftwarePurpose:application": "https://spdx.org/rdf/3.0.0/te=
rms/Software/SoftwarePurpose/application",
+    "software_SoftwarePurpose:archive": "https://spdx.org/rdf/3.0.0/terms/=
Software/SoftwarePurpose/archive",
+    "software_SoftwarePurpose:bom": "https://spdx.org/rdf/3.0.0/terms/Soft=
ware/SoftwarePurpose/bom",
+    "software_SoftwarePurpose:configuration": "https://spdx.org/rdf/3.0.0/=
terms/Software/SoftwarePurpose/configuration",
+    "software_SoftwarePurpose:container": "https://spdx.org/rdf/3.0.0/term=
s/Software/SoftwarePurpose/container",
+    "software_SoftwarePurpose:data": "https://spdx.org/rdf/3.0.0/terms/Sof=
tware/SoftwarePurpose/data",
+    "software_SoftwarePurpose:device": "https://spdx.org/rdf/3.0.0/terms/S=
oftware/SoftwarePurpose/device",
+    "software_SoftwarePurpose:deviceDriver": "https://spdx.org/rdf/3.0.0/t=
erms/Software/SoftwarePurpose/deviceDriver",
+    "software_SoftwarePurpose:diskImage": "https://spdx.org/rdf/3.0.0/term=
s/Software/SoftwarePurpose/diskImage",
+    "software_SoftwarePurpose:documentation": "https://spdx.org/rdf/3.0.0/=
terms/Software/SoftwarePurpose/documentation",
+    "software_SoftwarePurpose:evidence": "https://spdx.org/rdf/3.0.0/terms=
/Software/SoftwarePurpose/evidence",
+    "software_SoftwarePurpose:executable": "https://spdx.org/rdf/3.0.0/ter=
ms/Software/SoftwarePurpose/executable",
+    "software_SoftwarePurpose:file": "https://spdx.org/rdf/3.0.0/terms/Sof=
tware/SoftwarePurpose/file",
+    "software_SoftwarePurpose:filesystemImage": "https://spdx.org/rdf/3.0.=
0/terms/Software/SoftwarePurpose/filesystemImage",
+    "software_SoftwarePurpose:firmware": "https://spdx.org/rdf/3.0.0/terms=
/Software/SoftwarePurpose/firmware",
+    "software_SoftwarePurpose:framework": "https://spdx.org/rdf/3.0.0/term=
s/Software/SoftwarePurpose/framework",
+    "software_SoftwarePurpose:install": "https://spdx.org/rdf/3.0.0/terms/=
Software/SoftwarePurpose/install",
+    "software_SoftwarePurpose:library": "https://spdx.org/rdf/3.0.0/terms/=
Software/SoftwarePurpose/library",
+    "software_SoftwarePurpose:manifest": "https://spdx.org/rdf/3.0.0/terms=
/Software/SoftwarePurpose/manifest",
+    "software_SoftwarePurpose:model": "https://spdx.org/rdf/3.0.0/terms/So=
ftware/SoftwarePurpose/model",
+    "software_SoftwarePurpose:module": "https://spdx.org/rdf/3.0.0/terms/S=
oftware/SoftwarePurpose/module",
+    "software_SoftwarePurpose:operatingSystem": "https://spdx.org/rdf/3.0.=
0/terms/Software/SoftwarePurpose/operatingSystem",
+    "software_SoftwarePurpose:other": "https://spdx.org/rdf/3.0.0/terms/So=
ftware/SoftwarePurpose/other",
+    "software_SoftwarePurpose:patch": "https://spdx.org/rdf/3.0.0/terms/So=
ftware/SoftwarePurpose/patch",
+    "software_SoftwarePurpose:platform": "https://spdx.org/rdf/3.0.0/terms=
/Software/SoftwarePurpose/platform",
+    "software_SoftwarePurpose:requirement": "https://spdx.org/rdf/3.0.0/te=
rms/Software/SoftwarePurpose/requirement",
+    "software_SoftwarePurpose:source": "https://spdx.org/rdf/3.0.0/terms/S=
oftware/SoftwarePurpose/source",
+    "software_SoftwarePurpose:specification": "https://spdx.org/rdf/3.0.0/=
terms/Software/SoftwarePurpose/specification",
+    "software_SoftwarePurpose:test": "https://spdx.org/rdf/3.0.0/terms/Sof=
tware/SoftwarePurpose/test",
+}
+
+
+# CLASSES
+# The class that contains properties to describe energy consumption incurr=
ed
+# by an AI model in different stages of its lifecycle.
+@register("https://spdx.org/rdf/3.0.0/terms/AI/EnergyConsumption", compact=
_type=3D"ai_EnergyConsumption", abstract=3DFalse)
+class ai_EnergyConsumption(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Specifies the amount of energy consumed when finetuning the AI m=
odel that is
+        # being used in the AI system.
+        cls._add_property(
+            "ai_finetuningEnergyConsumption",
+            ListProp(ObjectProp(ai_EnergyConsumptionDescription, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/finetuningEnergyCon=
sumption",
+            compact=3D"ai_finetuningEnergyConsumption",
+        )
+        # Specifies the amount of energy consumed during inference time by=
 an AI model
+        # that is being used in the AI system.
+        cls._add_property(
+            "ai_inferenceEnergyConsumption",
+            ListProp(ObjectProp(ai_EnergyConsumptionDescription, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/inferenceEnergyCons=
umption",
+            compact=3D"ai_inferenceEnergyConsumption",
+        )
+        # Specifies the amount of energy consumed when training the AI mod=
el that is
+        # being used in the AI system.
+        cls._add_property(
+            "ai_trainingEnergyConsumption",
+            ListProp(ObjectProp(ai_EnergyConsumptionDescription, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/trainingEnergyConsu=
mption",
+            compact=3D"ai_trainingEnergyConsumption",
+        )
+
+
+# The class that helps note down the quantity of energy consumption and th=
e unit
+# used for measurement.
+@register("https://spdx.org/rdf/3.0.0/terms/AI/EnergyConsumptionDescriptio=
n", compact_type=3D"ai_EnergyConsumptionDescription", abstract=3DFalse)
+class ai_EnergyConsumptionDescription(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Represents the energy quantity.
+        cls._add_property(
+            "ai_energyQuantity",
+            FloatProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/energyQuantity",
+            min_count=3D1,
+            compact=3D"ai_energyQuantity",
+        )
+        # Specifies the unit in which energy is measured.
+        cls._add_property(
+            "ai_energyUnit",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/k=
ilowattHour", "kilowattHour"),
+                    ("https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/m=
egajoule", "megajoule"),
+                    ("https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/o=
ther", "other"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/energyUnit",
+            min_count=3D1,
+            compact=3D"ai_energyUnit",
+        )
+
+
+# Specifies the unit of energy consumption.
+@register("https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType", compact_ty=
pe=3D"ai_EnergyUnitType", abstract=3DFalse)
+class ai_EnergyUnitType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "kilowattHour": "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitTyp=
e/kilowattHour",
+        "megajoule": "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/m=
egajoule",
+        "other": "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/other=
",
+    }
+    # Kilowatt-hour.
+    kilowattHour =3D "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/k=
ilowattHour"
+    # Megajoule.
+    megajoule =3D "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/mega=
joule"
+    # Any other units of energy measurement.
+    other =3D "https://spdx.org/rdf/3.0.0/terms/AI/EnergyUnitType/other"
+
+
+# Specifies the safety risk level.
+@register("https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType", =
compact_type=3D"ai_SafetyRiskAssessmentType", abstract=3DFalse)
+class ai_SafetyRiskAssessmentType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "high": "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentT=
ype/high",
+        "low": "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentTy=
pe/low",
+        "medium": "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmen=
tType/medium",
+        "serious": "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessme=
ntType/serious",
+    }
+    # The second-highest level of risk posed by an AI system.
+    high =3D "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType=
/high"
+    # Low/no risk is posed by an AI system.
+    low =3D "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentType/=
low"
+    # The third-highest level of risk posed by an AI system.
+    medium =3D "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentTy=
pe/medium"
+    # The highest level of risk posed by an AI system.
+    serious =3D "https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssessmentT=
ype/serious"
+
+
+# Specifies the type of an annotation.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType", compact_=
type=3D"AnnotationType", abstract=3DFalse)
+class AnnotationType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "other": "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/oth=
er",
+        "review": "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/re=
view",
+    }
+    # Used to store extra information about an Element which is not part o=
f a Review (e.g. extra information provided during the creation of the Elem=
ent).
+    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/other"
+    # Used when someone reviews the Element.
+    review =3D "https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType/revie=
w"
+
+
+# Provides information about the creation of the Element.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/CreationInfo", compact_ty=
pe=3D"CreationInfo", abstract=3DFalse)
+class CreationInfo(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provide consumers with comments by the creator of the Element ab=
out the
+        # Element.
+        cls._add_property(
+            "comment",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/comment",
+            compact=3D"comment",
+        )
+        # Identifies when the Element was originally created.
+        cls._add_property(
+            "created",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/created",
+            min_count=3D1,
+            compact=3D"created",
+        )
+        # Identifies who or what created the Element.
+        cls._add_property(
+            "createdBy",
+            ListProp(ObjectProp(Agent, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/createdBy",
+            min_count=3D1,
+            compact=3D"createdBy",
+        )
+        # Identifies the tooling that was used during the creation of the =
Element.
+        cls._add_property(
+            "createdUsing",
+            ListProp(ObjectProp(Tool, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/createdUsing",
+            compact=3D"createdUsing",
+        )
+        # Provides a reference number that can be used to understand how t=
o parse and interpret an Element.
+        cls._add_property(
+            "specVersion",
+            StringProp(pattern=3Dr"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d=
*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-=
Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/specVersion",
+            min_count=3D1,
+            compact=3D"specVersion",
+        )
+
+
+# A key with an associated value.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/DictionaryEntry", compact=
_type=3D"DictionaryEntry", abstract=3DFalse)
+class DictionaryEntry(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # A key used in a generic key-value pair.
+        cls._add_property(
+            "key",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/key",
+            min_count=3D1,
+            compact=3D"key",
+        )
+        # A value used in a generic key-value pair.
+        cls._add_property(
+            "value",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/value",
+            compact=3D"value",
+        )
+
+
+# Base domain class from which all other SPDX-3.0 domain classes derive.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Element", compact_type=3D=
"Element", abstract=3DTrue)
+class Element(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provide consumers with comments by the creator of the Element ab=
out the
+        # Element.
+        cls._add_property(
+            "comment",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/comment",
+            compact=3D"comment",
+        )
+        # Provides information about the creation of the Element.
+        cls._add_property(
+            "creationInfo",
+            ObjectProp(CreationInfo, True),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/creationInfo",
+            min_count=3D1,
+            compact=3D"creationInfo",
+        )
+        # Provides a detailed description of the Element.
+        cls._add_property(
+            "description",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/description",
+            compact=3D"description",
+        )
+        # Specifies an Extension characterization of some aspect of an Ele=
ment.
+        cls._add_property(
+            "extension",
+            ListProp(ObjectProp(extension_Extension, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/extension",
+            compact=3D"extension",
+        )
+        # Provides a reference to a resource outside the scope of SPDX-3.0=
 content
+        # that uniquely identifies an Element.
+        cls._add_property(
+            "externalIdentifier",
+            ListProp(ObjectProp(ExternalIdentifier, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/externalIdentifie=
r",
+            compact=3D"externalIdentifier",
+        )
+        # Points to a resource outside the scope of the SPDX-3.0 content
+        # that provides additional characteristics of an Element.
+        cls._add_property(
+            "externalRef",
+            ListProp(ObjectProp(ExternalRef, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/externalRef",
+            compact=3D"externalRef",
+        )
+        # Identifies the name of an Element as designated by the creator.
+        cls._add_property(
+            "name",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/name",
+            compact=3D"name",
+        )
+        # A short description of an Element.
+        cls._add_property(
+            "summary",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/summary",
+            compact=3D"summary",
+        )
+        # Provides an IntegrityMethod with which the integrity of an Eleme=
nt can be
+        # asserted.
+        cls._add_property(
+            "verifiedUsing",
+            ListProp(ObjectProp(IntegrityMethod, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/verifiedUsing",
+            compact=3D"verifiedUsing",
+        )
+
+
+# A collection of Elements, not necessarily with unifying context.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/ElementCollection", compa=
ct_type=3D"ElementCollection", abstract=3DTrue)
+class ElementCollection(Element):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Refers to one or more Elements that are part of an ElementCollec=
tion.
+        cls._add_property(
+            "element",
+            ListProp(ObjectProp(Element, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/element",
+            compact=3D"element",
+        )
+        # Describes one a profile which the creator of this ElementCollect=
ion intends to
+        # conform to.
+        cls._add_property(
+            "profileConformance",
+            ListProp(EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/ai", "ai"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/build", "build"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/core", "core"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/dataset", "dataset"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/expandedLicensing", "expandedLicensing"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/extension", "extension"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/lite", "lite"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/security", "security"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/simpleLicensing", "simpleLicensing"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/software", "software"),
+                ])),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/profileConformanc=
e",
+            compact=3D"profileConformance",
+        )
+        # This property is used to denote the root Element(s) of a tree of=
 elements contained in a BOM.
+        cls._add_property(
+            "rootElement",
+            ListProp(ObjectProp(Element, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/rootElement",
+            compact=3D"rootElement",
+        )
+
+
+# A reference to a resource identifier defined outside the scope of SPDX-3=
.0 content that uniquely identifies an Element.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier", comp=
act_type=3D"ExternalIdentifier", abstract=3DFalse)
+class ExternalIdentifier(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provide consumers with comments by the creator of the Element ab=
out the
+        # Element.
+        cls._add_property(
+            "comment",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/comment",
+            compact=3D"comment",
+        )
+        # Specifies the type of the external identifier.
+        cls._add_property(
+            "externalIdentifierType",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/cpe22", "cpe22"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/cpe23", "cpe23"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/cve", "cve"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/email", "email"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/gitoid", "gitoid"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/other", "other"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/packageUrl", "packageUrl"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/securityOther", "securityOther"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/swhid", "swhid"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/swid", "swid"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/urlScheme", "urlScheme"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/externalIdentifie=
rType",
+            min_count=3D1,
+            compact=3D"externalIdentifierType",
+        )
+        # Uniquely identifies an external element.
+        cls._add_property(
+            "identifier",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/identifier",
+            min_count=3D1,
+            compact=3D"identifier",
+        )
+        # Provides the location for more information regarding an external=
 identifier.
+        cls._add_property(
+            "identifierLocator",
+            ListProp(AnyURIProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/identifierLocator=
",
+            compact=3D"identifierLocator",
+        )
+        # An entity that is authorized to issue identification credentials.
+        cls._add_property(
+            "issuingAuthority",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/issuingAuthority",
+            compact=3D"issuingAuthority",
+        )
+
+
+# Specifies the type of an external identifier.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType", =
compact_type=3D"ExternalIdentifierType", abstract=3DFalse)
+class ExternalIdentifierType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "cpe22": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier=
Type/cpe22",
+        "cpe23": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier=
Type/cpe23",
+        "cve": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTy=
pe/cve",
+        "email": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier=
Type/email",
+        "gitoid": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifie=
rType/gitoid",
+        "other": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier=
Type/other",
+        "packageUrl": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdent=
ifierType/packageUrl",
+        "securityOther": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalId=
entifierType/securityOther",
+        "swhid": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifier=
Type/swhid",
+        "swid": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierT=
ype/swid",
+        "urlScheme": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdenti=
fierType/urlScheme",
+    }
+    # https://cpe.mitre.org/files/cpe-specification_2.2.pdf
+    cpe22 =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTyp=
e/cpe22"
+    # https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf
+    cpe23 =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTyp=
e/cpe23"
+    # An identifier for a specific software flaw defined within the offici=
al CVE Dictionary and that conforms to the CVE specification as defined by =
https://csrc.nist.gov/glossary/term/cve_id.
+    cve =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType/=
cve"
+    # https://datatracker.ietf.org/doc/html/rfc3696#section-3
+    email =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTyp=
e/email"
+    # https://www.iana.org/assignments/uri-schemes/prov/gitoid Gitoid stan=
ds for [Git Object ID](https://git-scm.com/book/en/v2/Git-Internals-Git-Obj=
ects) and a gitoid of type blob is a unique hash of a binary artifact. A gi=
toid may represent the software [Artifact ID](https://github.com/omnibor/sp=
ec/blob/main/spec/SPEC.md#artifact-id) or the [OmniBOR Identifier](https://=
github.com/omnibor/spec/blob/main/spec/SPEC.md#omnibor-identifier) for the =
software artifact's associated [OmniBOR Document](https://github.com/omnibo=
r/spec/blob/main/spec/SPEC.md#omnibor-document); this ambiguity exists beca=
use the OmniBOR Document is itself an artifact, and the gitoid of that arti=
fact is its valid identifier. Omnibor is a minimalistic schema to describe =
software [Artifact Dependency Graphs](https://github.com/omnibor/spec/blob/=
main/spec/SPEC.md#artifact-dependency-graph-adg). Gitoids calculated on sof=
tware artifacts (Snippet, File, or Package Elements) should be recorded in =
the SPDX 3.0 SoftwareArtifact's ContentIdentifier property. Gitoids calcula=
ted on the OmniBOR Document (OmniBOR Identifiers) should be recorded in the=
 SPDX 3.0 Element's ExternalIdentifier property.
+    gitoid =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTy=
pe/gitoid"
+    # Used when the type doesn't match any of the other options.
+    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTyp=
e/other"
+    # https://github.com/package-url/purl-spec
+    packageUrl =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifi=
erType/packageUrl"
+    # Used when there is a security related identifier of unspecified type.
+    securityOther =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdent=
ifierType/securityOther"
+    # SoftWare Hash IDentifier, persistent intrinsic identifiers for digit=
al artifacts, such as files, trees (also known as directories or folders), =
commits, and other objects typically found in version control systems. The =
syntax of the identifiers is defined in the [SWHID specification](https://w=
ww.swhid.org/specification/v1.1/4.Syntax) and they typically look like `swh=
:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2`.
+    swhid =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierTyp=
e/swhid"
+    # https://www.ietf.org/archive/id/draft-ietf-sacm-coswid-21.html#secti=
on-2.3
+    swid =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifierType=
/swid"
+    # the scheme used in order to locate a resource https://www.iana.org/a=
ssignments/uri-schemes/uri-schemes.xhtml
+    urlScheme =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalIdentifie=
rType/urlScheme"
+
+
+# A map of Element identifiers that are used within a Document but defined=
 external to that Document.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/ExternalMap", compact_typ=
e=3D"ExternalMap", abstract=3DFalse)
+class ExternalMap(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Artifact representing a serialization instance of SPDX data cont=
aining the
+        # definition of a particular Element.
+        cls._add_property(
+            "definingArtifact",
+            ObjectProp(Artifact, False),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/definingArtifact",
+            compact=3D"definingArtifact",
+        )
+        # Identifies an external Element used within a Document but define=
d external to
+        # that Document.
+        cls._add_property(
+            "externalSpdxId",
+            AnyURIProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/externalSpdxId",
+            min_count=3D1,
+            compact=3D"externalSpdxId",
+        )
+        # Provides an indication of where to retrieve an external Element.
+        cls._add_property(
+            "locationHint",
+            AnyURIProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/locationHint",
+            compact=3D"locationHint",
+        )
+        # Provides an IntegrityMethod with which the integrity of an Eleme=
nt can be
+        # asserted.
+        cls._add_property(
+            "verifiedUsing",
+            ListProp(ObjectProp(IntegrityMethod, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/verifiedUsing",
+            compact=3D"verifiedUsing",
+        )
+
+
+# A reference to a resource outside the scope of SPDX-3.0 content related =
to an Element.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRef", compact_typ=
e=3D"ExternalRef", abstract=3DFalse)
+class ExternalRef(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provide consumers with comments by the creator of the Element ab=
out the
+        # Element.
+        cls._add_property(
+            "comment",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/comment",
+            compact=3D"comment",
+        )
+        # Specifies the media type of an Element or Property.
+        cls._add_property(
+            "contentType",
+            StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/contentType",
+            compact=3D"contentType",
+        )
+        # Specifies the type of the external reference.
+        cls._add_property(
+            "externalRefType",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/altDownloadLocation", "altDownloadLocation"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/altWebPage", "altWebPage"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/binaryArtifact", "binaryArtifact"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/bower", "bower"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/buildMeta", "buildMeta"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/buildSystem", "buildSystem"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/certificationReport", "certificationReport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/chat", "chat"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/componentAnalysisReport", "componentAnalysisReport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/cwe", "cwe"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/documentation", "documentation"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/dynamicAnalysisReport", "dynamicAnalysisReport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/eolNotice", "eolNotice"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/exportControlAssessment", "exportControlAssessment"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/funding", "funding"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/issueTracker", "issueTracker"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/license", "license"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/mailingList", "mailingList"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/mavenCentral", "mavenCentral"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/metrics", "metrics"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/npm", "npm"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/nuget", "nuget"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/other", "other"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/privacyAssessment", "privacyAssessment"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/productMetadata", "productMetadata"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/purchaseOrder", "purchaseOrder"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/qualityAssessmentReport", "qualityAssessmentReport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/releaseHistory", "releaseHistory"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/releaseNotes", "releaseNotes"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/riskAssessment", "riskAssessment"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/runtimeAnalysisReport", "runtimeAnalysisReport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/secureSoftwareAttestation", "secureSoftwareAttestation"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityAdversaryModel", "securityAdversaryModel"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityAdvisory", "securityAdvisory"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityFix", "securityFix"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityOther", "securityOther"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityPenTestReport", "securityPenTestReport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityPolicy", "securityPolicy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/securityThreatModel", "securityThreatModel"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/socialMedia", "socialMedia"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/sourceArtifact", "sourceArtifact"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/staticAnalysisReport", "staticAnalysisReport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/support", "support"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/vcs", "vcs"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/vulnerabilityDisclosureReport", "vulnerabilityDisclosureReport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/vulnerabilityExploitabilityAssessment", "vulnerabilityExploitabilityAsses=
sment"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/externalRefType",
+            compact=3D"externalRefType",
+        )
+        # Provides the location of an external reference.
+        cls._add_property(
+            "locator",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/locator",
+            compact=3D"locator",
+        )
+
+
+# Specifies the type of an external reference.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType", compact=
_type=3D"ExternalRefType", abstract=3DFalse)
+class ExternalRefType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "altDownloadLocation": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/altDownloadLocation",
+        "altWebPage": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTy=
pe/altWebPage",
+        "binaryArtifact": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/binaryArtifact",
+        "bower": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/bo=
wer",
+        "buildMeta": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/buildMeta",
+        "buildSystem": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/buildSystem",
+        "certificationReport": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/certificationReport",
+        "chat": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/cha=
t",
+        "componentAnalysisReport": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/componentAnalysisReport",
+        "cwe": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/cwe",
+        "documentation": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRe=
fType/documentation",
+        "dynamicAnalysisReport": "https://spdx.org/rdf/3.0.0/terms/Core/Ex=
ternalRefType/dynamicAnalysisReport",
+        "eolNotice": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/eolNotice",
+        "exportControlAssessment": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/exportControlAssessment",
+        "funding": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/=
funding",
+        "issueTracker": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRef=
Type/issueTracker",
+        "license": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/=
license",
+        "mailingList": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/mailingList",
+        "mavenCentral": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRef=
Type/mavenCentral",
+        "metrics": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/=
metrics",
+        "npm": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/npm",
+        "nuget": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/nu=
get",
+        "other": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/ot=
her",
+        "privacyAssessment": "https://spdx.org/rdf/3.0.0/terms/Core/Extern=
alRefType/privacyAssessment",
+        "productMetadata": "https://spdx.org/rdf/3.0.0/terms/Core/External=
RefType/productMetadata",
+        "purchaseOrder": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRe=
fType/purchaseOrder",
+        "qualityAssessmentReport": "https://spdx.org/rdf/3.0.0/terms/Core/=
ExternalRefType/qualityAssessmentReport",
+        "releaseHistory": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/releaseHistory",
+        "releaseNotes": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRef=
Type/releaseNotes",
+        "riskAssessment": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/riskAssessment",
+        "runtimeAnalysisReport": "https://spdx.org/rdf/3.0.0/terms/Core/Ex=
ternalRefType/runtimeAnalysisReport",
+        "secureSoftwareAttestation": "https://spdx.org/rdf/3.0.0/terms/Cor=
e/ExternalRefType/secureSoftwareAttestation",
+        "securityAdversaryModel": "https://spdx.org/rdf/3.0.0/terms/Core/E=
xternalRefType/securityAdversaryModel",
+        "securityAdvisory": "https://spdx.org/rdf/3.0.0/terms/Core/Externa=
lRefType/securityAdvisory",
+        "securityFix": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/securityFix",
+        "securityOther": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRe=
fType/securityOther",
+        "securityPenTestReport": "https://spdx.org/rdf/3.0.0/terms/Core/Ex=
ternalRefType/securityPenTestReport",
+        "securityPolicy": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/securityPolicy",
+        "securityThreatModel": "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/securityThreatModel",
+        "socialMedia": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/socialMedia",
+        "sourceArtifact": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/sourceArtifact",
+        "staticAnalysisReport": "https://spdx.org/rdf/3.0.0/terms/Core/Ext=
ernalRefType/staticAnalysisReport",
+        "support": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/=
support",
+        "vcs": "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/vcs",
+        "vulnerabilityDisclosureReport": "https://spdx.org/rdf/3.0.0/terms=
/Core/ExternalRefType/vulnerabilityDisclosureReport",
+        "vulnerabilityExploitabilityAssessment": "https://spdx.org/rdf/3.0=
.0/terms/Core/ExternalRefType/vulnerabilityExploitabilityAssessment",
+    }
+    # A reference to an alternative download location.
+    altDownloadLocation =3D "https://spdx.org/rdf/3.0.0/terms/Core/Externa=
lRefType/altDownloadLocation"
+    # A reference to an alternative web page.
+    altWebPage =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/=
altWebPage"
+    # A reference to binary artifacts related to a package.
+    binaryArtifact =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/binaryArtifact"
+    # A reference to a bower package.
+    bower =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/bower"
+    # A reference build metadata related to a published package.
+    buildMeta =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/b=
uildMeta"
+    # A reference build system used to create or publish the package.
+    buildSystem =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType=
/buildSystem"
+    # A reference to a certification report for a package from an accredit=
ed/independent body.
+    certificationReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Externa=
lRefType/certificationReport"
+    # A reference to the instant messaging system used by the maintainer f=
or a package.
+    chat =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/chat"
+    # A reference to a Software Composition Analysis (SCA) report.
+    componentAnalysisReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Ext=
ernalRefType/componentAnalysisReport"
+    # A reference to a source of software flaw defined within the official=
 CWE Dictionary that conforms to the CWE specification as defined by https:=
//csrc.nist.gov/glossary/term/common_weakness_enumeration.
+    cwe =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/cwe"
+    # A reference to the documentation for a package.
+    documentation =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTy=
pe/documentation"
+    # A reference to a dynamic analysis report for a package.
+    dynamicAnalysisReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Exter=
nalRefType/dynamicAnalysisReport"
+    # A reference to the End Of Sale (EOS) and/or End Of Life (EOL) inform=
ation related to a package.
+    eolNotice =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/e=
olNotice"
+    # A reference to a export control assessment for a package.
+    exportControlAssessment =3D "https://spdx.org/rdf/3.0.0/terms/Core/Ext=
ernalRefType/exportControlAssessment"
+    # A reference to funding information related to a package.
+    funding =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/fun=
ding"
+    # A reference to the issue tracker for a package.
+    issueTracker =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/issueTracker"
+    # A reference to additional license information related to an artifact.
+    license =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/lic=
ense"
+    # A reference to the mailing list used by the maintainer for a package.
+    mailingList =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType=
/mailingList"
+    # A reference to a maven repository artifact.
+    mavenCentral =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/mavenCentral"
+    # A reference to metrics related to package such as OpenSSF scorecards.
+    metrics =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/met=
rics"
+    # A reference to an npm package.
+    npm =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/npm"
+    # A reference to a nuget package.
+    nuget =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/nuget"
+    # Used when the type doesn't match any of the other options.
+    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/other"
+    # A reference to a privacy assessment for a package.
+    privacyAssessment =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalR=
efType/privacyAssessment"
+    # A reference to additional product metadata such as reference within =
organization's product catalog.
+    productMetadata =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRef=
Type/productMetadata"
+    # A reference to a purchase order for a package.
+    purchaseOrder =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTy=
pe/purchaseOrder"
+    # A reference to a quality assessment for a package.
+    qualityAssessmentReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Ext=
ernalRefType/qualityAssessmentReport"
+    # A reference to a published list of releases for a package.
+    releaseHistory =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/releaseHistory"
+    # A reference to the release notes for a package.
+    releaseNotes =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTyp=
e/releaseNotes"
+    # A reference to a risk assessment for a package.
+    riskAssessment =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/riskAssessment"
+    # A reference to a runtime analysis report for a package.
+    runtimeAnalysisReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Exter=
nalRefType/runtimeAnalysisReport"
+    # A reference to information assuring that the software is developed u=
sing security practices as defined by [NIST SP 800-218 Secure Software Deve=
lopment Framework (SSDF) Version 1.1](https://csrc.nist.gov/pubs/sp/800/218=
/final) or [CISA Secure Software Development Attestation Form](https://www.=
cisa.gov/resources-tools/resources/secure-software-development-attestation-=
form).
+    secureSoftwareAttestation =3D "https://spdx.org/rdf/3.0.0/terms/Core/E=
xternalRefType/secureSoftwareAttestation"
+    # A reference to the security adversary model for a package.
+    securityAdversaryModel =3D "https://spdx.org/rdf/3.0.0/terms/Core/Exte=
rnalRefType/securityAdversaryModel"
+    # A reference to a published security advisory (where advisory as defi=
ned per ISO 29147:2018) that may affect one or more elements, e.g., vendor =
advisories or specific NVD entries.
+    securityAdvisory =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRe=
fType/securityAdvisory"
+    # A reference to the patch or source code that fixes a vulnerability.
+    securityFix =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType=
/securityFix"
+    # A reference to related security information of unspecified type.
+    securityOther =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefTy=
pe/securityOther"
+    # A reference to a [penetration test](https://en.wikipedia.org/wiki/Pe=
netration_test) report for a package.
+    securityPenTestReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Exter=
nalRefType/securityPenTestReport"
+    # A reference to instructions for reporting newly discovered security =
vulnerabilities for a package.
+    securityPolicy =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/securityPolicy"
+    # A reference the [security threat model](https://en.wikipedia.org/wik=
i/Threat_model) for a package.
+    securityThreatModel =3D "https://spdx.org/rdf/3.0.0/terms/Core/Externa=
lRefType/securityThreatModel"
+    # A reference to a social media channel for a package.
+    socialMedia =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType=
/socialMedia"
+    # A reference to an artifact containing the sources for a package.
+    sourceArtifact =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefT=
ype/sourceArtifact"
+    # A reference to a static analysis report for a package.
+    staticAnalysisReport =3D "https://spdx.org/rdf/3.0.0/terms/Core/Extern=
alRefType/staticAnalysisReport"
+    # A reference to the software support channel or other support informa=
tion for a package.
+    support =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/sup=
port"
+    # A reference to a version control system related to a software artifa=
ct.
+    vcs =3D "https://spdx.org/rdf/3.0.0/terms/Core/ExternalRefType/vcs"
+    # A reference to a Vulnerability Disclosure Report (VDR) which provide=
s the software supplier's analysis and findings describing the impact (or l=
ack of impact) that reported vulnerabilities have on packages or products i=
n the supplier's SBOM as defined in [NIST SP 800-161](https://csrc.nist.gov=
/pubs/sp/800/161/r1/final).
+    vulnerabilityDisclosureReport =3D "https://spdx.org/rdf/3.0.0/terms/Co=
re/ExternalRefType/vulnerabilityDisclosureReport"
+    # A reference to a Vulnerability Exploitability eXchange (VEX) stateme=
nt which provides information on whether a product is impacted by a specifi=
c vulnerability in an included package and, if affected, whether there are =
actions recommended to remediate. See also [NTIA VEX one-page summary](http=
s://ntia.gov/files/ntia/publications/vex_one-page_summary.pdf).
+    vulnerabilityExploitabilityAssessment =3D "https://spdx.org/rdf/3.0.0/=
terms/Core/ExternalRefType/vulnerabilityExploitabilityAssessment"
+
+
+# A mathematical algorithm that maps data of arbitrary size to a bit strin=
g.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm", compact_t=
ype=3D"HashAlgorithm", abstract=3DFalse)
+class HashAlgorithm(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "blake2b256": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm=
/blake2b256",
+        "blake2b384": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm=
/blake2b384",
+        "blake2b512": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm=
/blake2b512",
+        "blake3": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/bla=
ke3",
+        "crystalsDilithium": "https://spdx.org/rdf/3.0.0/terms/Core/HashAl=
gorithm/crystalsDilithium",
+        "crystalsKyber": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgori=
thm/crystalsKyber",
+        "falcon": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/fal=
con",
+        "md2": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md2",
+        "md4": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md4",
+        "md5": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md5",
+        "md6": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md6",
+        "other": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/othe=
r",
+        "sha1": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha1",
+        "sha224": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha=
224",
+        "sha256": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha=
256",
+        "sha384": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha=
384",
+        "sha3_224": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/s=
ha3_224",
+        "sha3_256": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/s=
ha3_256",
+        "sha3_384": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/s=
ha3_384",
+        "sha3_512": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/s=
ha3_512",
+        "sha512": "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha=
512",
+    }
+    # blake2b algorithm with a digest size of 256 https://datatracker.ietf=
.org/doc/html/rfc7693#section-4
+    blake2b256 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/bl=
ake2b256"
+    # blake2b algorithm with a digest size of 384 https://datatracker.ietf=
.org/doc/html/rfc7693#section-4
+    blake2b384 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/bl=
ake2b384"
+    # blake2b algorithm with a digest size of 512 https://datatracker.ietf=
.org/doc/html/rfc7693#section-4
+    blake2b512 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/bl=
ake2b512"
+    # https://github.com/BLAKE3-team/BLAKE3-specs/blob/master/blake3.pdf
+    blake3 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/blake3"
+    # https://pq-crystals.org/dilithium/index.shtml
+    crystalsDilithium =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgor=
ithm/crystalsDilithium"
+    # https://pq-crystals.org/kyber/index.shtml
+    crystalsKyber =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm=
/crystalsKyber"
+    # https://falcon-sign.info/falcon.pdf
+    falcon =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/falcon"
+    # https://datatracker.ietf.org/doc/rfc1319/
+    md2 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md2"
+    # https://datatracker.ietf.org/doc/html/rfc1186
+    md4 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md4"
+    # https://datatracker.ietf.org/doc/html/rfc1321
+    md5 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md5"
+    # https://people.csail.mit.edu/rivest/pubs/RABCx08.pdf
+    md6 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/md6"
+    # any hashing algorithm that does not exist in this list of entries
+    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/other"
+    # https://datatracker.ietf.org/doc/html/rfc3174
+    sha1 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha1"
+    # secure hashing algorithm with a digest length of 224 https://datatra=
cker.ietf.org/doc/html/draft-ietf-pkix-sha224-01
+    sha224 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha224"
+    # secure hashing algorithm with a digest length of 256 https://www.rfc=
-editor.org/rfc/rfc4634
+    sha256 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha256"
+    # secure hashing algorithm with a digest length of 384 https://www.rfc=
-editor.org/rfc/rfc4634
+    sha384 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha384"
+    # sha3 with a digest length of 224 https://nvlpubs.nist.gov/nistpubs/F=
IPS/NIST.FIPS.202.pdf
+    sha3_224 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3=
_224"
+    # sha3 with a digest length of 256 https://nvlpubs.nist.gov/nistpubs/F=
IPS/NIST.FIPS.202.pdf
+    sha3_256 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3=
_256"
+    # sha3 with a digest length of 384 https://nvlpubs.nist.gov/nistpubs/F=
IPS/NIST.FIPS.202.pdf
+    sha3_384 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3=
_384"
+    # sha3 with a digest length of 512 https://nvlpubs.nist.gov/nistpubs/F=
IPS/NIST.FIPS.202.pdf
+    sha3_512 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha3=
_512"
+    # secure hashing algorithm with a digest length of 512 https://www.rfc=
-editor.org/rfc/rfc4634
+    sha512 =3D "https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/sha512"
+
+
+# Provides an independently reproducible mechanism that permits verificati=
on of a specific Element.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/IntegrityMethod", compact=
_type=3D"IntegrityMethod", abstract=3DTrue)
+class IntegrityMethod(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provide consumers with comments by the creator of the Element ab=
out the
+        # Element.
+        cls._add_property(
+            "comment",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/comment",
+            compact=3D"comment",
+        )
+
+
+# Provide an enumerated set of lifecycle phases that can provide context t=
o relationships.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType", comp=
act_type=3D"LifecycleScopeType", abstract=3DFalse)
+class LifecycleScopeType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "build": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType=
/build",
+        "design": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeTyp=
e/design",
+        "development": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleSco=
peType/development",
+        "other": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType=
/other",
+        "runtime": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeTy=
pe/runtime",
+        "test": "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/=
test",
+    }
+    # A relationship has specific context implications during an element's=
 build phase, during development.
+    build =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/bu=
ild"
+    # A relationship has specific context implications during an element's=
 design.
+    design =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/d=
esign"
+    # A relationship has specific context implications during development =
phase of an element.
+    development =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeT=
ype/development"
+    # A relationship has other specific context information necessary to c=
apture that the above set of enumerations does not handle.
+    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/ot=
her"
+    # A relationship has specific context implications during the executio=
n phase of an element.
+    runtime =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/=
runtime"
+    # A relationship has specific context implications during an element's=
 testing phase, during development.
+    test =3D "https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopeType/tes=
t"
+
+
+# A mapping between prefixes and namespace partial URIs.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/NamespaceMap", compact_ty=
pe=3D"NamespaceMap", abstract=3DFalse)
+class NamespaceMap(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides an unambiguous mechanism for conveying a URI fragment p=
ortion of an
+        # ElementID.
+        cls._add_property(
+            "namespace",
+            AnyURIProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/namespace",
+            min_count=3D1,
+            compact=3D"namespace",
+        )
+        # A substitute for a URI.
+        cls._add_property(
+            "prefix",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/prefix",
+            min_count=3D1,
+            compact=3D"prefix",
+        )
+
+
+# An SPDX version 2.X compatible verification method for software packages.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/PackageVerificationCode",=
 compact_type=3D"PackageVerificationCode", abstract=3DFalse)
+class PackageVerificationCode(IntegrityMethod):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Specifies the algorithm used for calculating the hash value.
+        cls._add_property(
+            "algorithm",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b256", "blake2b256"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b384", "blake2b384"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b512", "blake2b512"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake3", "blake3"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
crystalsDilithium", "crystalsDilithium"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
crystalsKyber", "crystalsKyber"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
falcon", "falcon"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md2", "md2"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md4", "md4"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md5", "md5"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md6", "md6"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
other", "other"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha1", "sha1"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha224", "sha224"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha256", "sha256"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha384", "sha384"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_224", "sha3_224"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_256", "sha3_256"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_384", "sha3_384"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_512", "sha3_512"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha512", "sha512"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/algorithm",
+            min_count=3D1,
+            compact=3D"algorithm",
+        )
+        # The result of applying a hash algorithm to an Element.
+        cls._add_property(
+            "hashValue",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/hashValue",
+            min_count=3D1,
+            compact=3D"hashValue",
+        )
+        # The relative file name of a file to be excluded from the
+        # `PackageVerificationCode`.
+        cls._add_property(
+            "packageVerificationCodeExcludedFile",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/packageVerificati=
onCodeExcludedFile",
+            compact=3D"packageVerificationCodeExcludedFile",
+        )
+
+
+# A tuple of two positive integers that define a range.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/PositiveIntegerRange", co=
mpact_type=3D"PositiveIntegerRange", abstract=3DFalse)
+class PositiveIntegerRange(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Defines the beginning of a range.
+        cls._add_property(
+            "beginIntegerRange",
+            PositiveIntegerProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/beginIntegerRange=
",
+            min_count=3D1,
+            compact=3D"beginIntegerRange",
+        )
+        # Defines the end of a range.
+        cls._add_property(
+            "endIntegerRange",
+            PositiveIntegerProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/endIntegerRange",
+            min_count=3D1,
+            compact=3D"endIntegerRange",
+        )
+
+
+# Categories of presence or absence.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType", compact_ty=
pe=3D"PresenceType", abstract=3DFalse)
+class PresenceType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "no": "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/no",
+        "noAssertion": "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType=
/noAssertion",
+        "yes": "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/yes",
+    }
+    # Indicates absence of the field.
+    no =3D "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/no"
+    # Makes no assertion about the field.
+    noAssertion =3D "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/no=
Assertion"
+    # Indicates presence of the field.
+    yes =3D "https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/yes"
+
+
+# Enumeration of the valid profiles.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType", c=
ompact_type=3D"ProfileIdentifierType", abstract=3DFalse)
+class ProfileIdentifierType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "ai": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType=
/ai",
+        "build": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierT=
ype/build",
+        "core": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierTy=
pe/core",
+        "dataset": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifie=
rType/dataset",
+        "expandedLicensing": "https://spdx.org/rdf/3.0.0/terms/Core/Profil=
eIdentifierType/expandedLicensing",
+        "extension": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentif=
ierType/extension",
+        "lite": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierTy=
pe/lite",
+        "security": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifi=
erType/security",
+        "simpleLicensing": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileI=
dentifierType/simpleLicensing",
+        "software": "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifi=
erType/software",
+    }
+    # the element follows the AI profile specification
+    ai =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/ai"
+    # the element follows the Build profile specification
+    build =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType=
/build"
+    # the element follows the Core profile specification
+    core =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/=
core"
+    # the element follows the Dataset profile specification
+    dataset =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierTy=
pe/dataset"
+    # the element follows the expanded Licensing profile
+    expandedLicensing =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileId=
entifierType/expandedLicensing"
+    # the element follows the Extension profile specification
+    extension =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifier=
Type/extension"
+    # the element follows the Lite profile specification
+    lite =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierType/=
lite"
+    # the element follows the Security profile specification
+    security =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierT=
ype/security"
+    # the element follows the simple Licensing profile
+    simpleLicensing =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIden=
tifierType/simpleLicensing"
+    # the element follows the Software profile specification
+    software =3D "https://spdx.org/rdf/3.0.0/terms/Core/ProfileIdentifierT=
ype/software"
+
+
+# Describes a relationship between one or more elements.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Relationship", compact_ty=
pe=3D"Relationship", abstract=3DFalse)
+class Relationship(Element):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides information about the completeness of relationships.
+        cls._add_property(
+            "completeness",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCo=
mpleteness/complete", "complete"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCo=
mpleteness/incomplete", "incomplete"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCo=
mpleteness/noAssertion", "noAssertion"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/completeness",
+            compact=3D"completeness",
+        )
+        # Specifies the time from which an element is no longer applicable=
 / valid.
+        cls._add_property(
+            "endTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/endTime",
+            compact=3D"endTime",
+        )
+        # References the Element on the left-hand side of a relationship.
+        cls._add_property(
+            "from_",
+            ObjectProp(Element, True),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/from",
+            min_count=3D1,
+            compact=3D"from",
+        )
+        # Information about the relationship between two Elements.
+        cls._add_property(
+            "relationshipType",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/affects", "affects"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/amendedBy", "amendedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/ancestorOf", "ancestorOf"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/availableFrom", "availableFrom"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/configures", "configures"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/contains", "contains"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/coordinatedBy", "coordinatedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/copiedTo", "copiedTo"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/delegatedTo", "delegatedTo"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/dependsOn", "dependsOn"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/descendantOf", "descendantOf"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/describes", "describes"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/doesNotAffect", "doesNotAffect"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/expandsTo", "expandsTo"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/exploitCreatedBy", "exploitCreatedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/fixedBy", "fixedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/fixedIn", "fixedIn"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/foundBy", "foundBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/generates", "generates"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasAddedFile", "hasAddedFile"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasAssessmentFor", "hasAssessmentFor"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasAssociatedVulnerability", "hasAssociatedVulnerability"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasConcludedLicense", "hasConcludedLicense"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDataFile", "hasDataFile"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDeclaredLicense", "hasDeclaredLicense"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDeletedFile", "hasDeletedFile"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDependencyManifest", "hasDependencyManifest"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDistributionArtifact", "hasDistributionArtifact"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDocumentation", "hasDocumentation"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasDynamicLink", "hasDynamicLink"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasEvidence", "hasEvidence"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasExample", "hasExample"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasHost", "hasHost"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasInputs", "hasInputs"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasMetadata", "hasMetadata"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasOptionalComponent", "hasOptionalComponent"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasOptionalDependency", "hasOptionalDependency"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasOutputs", "hasOutputs"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasPrerequsite", "hasPrerequsite"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasProvidedDependency", "hasProvidedDependency"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasRequirement", "hasRequirement"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasSpecification", "hasSpecification"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasStaticLink", "hasStaticLink"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasTest", "hasTest"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasTestCase", "hasTestCase"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasVariant", "hasVariant"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/invokedBy", "invokedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/modifiedBy", "modifiedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/other", "other"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/packagedBy", "packagedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/patchedBy", "patchedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/publishedBy", "publishedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/reportedBy", "reportedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/republishedBy", "republishedBy"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/serializedInArtifact", "serializedInArtifact"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/testedOn", "testedOn"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/trainedOn", "trainedOn"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/underInvestigationFor", "underInvestigationFor"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/usesTool", "usesTool"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/relationshipType",
+            min_count=3D1,
+            compact=3D"relationshipType",
+        )
+        # Specifies the time from which an element is applicable / valid.
+        cls._add_property(
+            "startTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/startTime",
+            compact=3D"startTime",
+        )
+        # References an Element on the right-hand side of a relationship.
+        cls._add_property(
+            "to",
+            ListProp(ObjectProp(Element, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/to",
+            min_count=3D1,
+            compact=3D"to",
+        )
+
+
+# Indicates whether a relationship is known to be complete, incomplete, or=
 if no assertion is made with respect to relationship completeness.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCompleteness"=
, compact_type=3D"RelationshipCompleteness", abstract=3DFalse)
+class RelationshipCompleteness(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "complete": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCom=
pleteness/complete",
+        "incomplete": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipC=
ompleteness/incomplete",
+        "noAssertion": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Completeness/noAssertion",
+    }
+    # The relationship is known to be exhaustive.
+    complete =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipComple=
teness/complete"
+    # The relationship is known not to be exhaustive.
+    incomplete =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipComp=
leteness/incomplete"
+    # No assertion can be made about the completeness of the relationship.
+    noAssertion =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipCom=
pleteness/noAssertion"
+
+
+# Information about the relationship between two Elements.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType", compac=
t_type=3D"RelationshipType", abstract=3DFalse)
+class RelationshipType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "affects": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/affects",
+        "amendedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/amendedBy",
+        "ancestorOf": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/ancestorOf",
+        "availableFrom": "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/availableFrom",
+        "configures": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/configures",
+        "contains": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/contains",
+        "coordinatedBy": "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/coordinatedBy",
+        "copiedTo": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/copiedTo",
+        "delegatedTo": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/delegatedTo",
+        "dependsOn": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/dependsOn",
+        "descendantOf": "https://spdx.org/rdf/3.0.0/terms/Core/Relationshi=
pType/descendantOf",
+        "describes": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/describes",
+        "doesNotAffect": "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/doesNotAffect",
+        "expandsTo": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/expandsTo",
+        "exploitCreatedBy": "https://spdx.org/rdf/3.0.0/terms/Core/Relatio=
nshipType/exploitCreatedBy",
+        "fixedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/fixedBy",
+        "fixedIn": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/fixedIn",
+        "foundBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/foundBy",
+        "generates": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/generates",
+        "hasAddedFile": "https://spdx.org/rdf/3.0.0/terms/Core/Relationshi=
pType/hasAddedFile",
+        "hasAssessmentFor": "https://spdx.org/rdf/3.0.0/terms/Core/Relatio=
nshipType/hasAssessmentFor",
+        "hasAssociatedVulnerability": "https://spdx.org/rdf/3.0.0/terms/Co=
re/RelationshipType/hasAssociatedVulnerability",
+        "hasConcludedLicense": "https://spdx.org/rdf/3.0.0/terms/Core/Rela=
tionshipType/hasConcludedLicense",
+        "hasDataFile": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasDataFile",
+        "hasDeclaredLicense": "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/hasDeclaredLicense",
+        "hasDeletedFile": "https://spdx.org/rdf/3.0.0/terms/Core/Relations=
hipType/hasDeletedFile",
+        "hasDependencyManifest": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/hasDependencyManifest",
+        "hasDistributionArtifact": "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/hasDistributionArtifact",
+        "hasDocumentation": "https://spdx.org/rdf/3.0.0/terms/Core/Relatio=
nshipType/hasDocumentation",
+        "hasDynamicLink": "https://spdx.org/rdf/3.0.0/terms/Core/Relations=
hipType/hasDynamicLink",
+        "hasEvidence": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasEvidence",
+        "hasExample": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/hasExample",
+        "hasHost": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/hasHost",
+        "hasInputs": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasInputs",
+        "hasMetadata": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasMetadata",
+        "hasOptionalComponent": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/hasOptionalComponent",
+        "hasOptionalDependency": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/hasOptionalDependency",
+        "hasOutputs": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/hasOutputs",
+        "hasPrerequsite": "https://spdx.org/rdf/3.0.0/terms/Core/Relations=
hipType/hasPrerequsite",
+        "hasProvidedDependency": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/hasProvidedDependency",
+        "hasRequirement": "https://spdx.org/rdf/3.0.0/terms/Core/Relations=
hipType/hasRequirement",
+        "hasSpecification": "https://spdx.org/rdf/3.0.0/terms/Core/Relatio=
nshipType/hasSpecification",
+        "hasStaticLink": "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/hasStaticLink",
+        "hasTest": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/hasTest",
+        "hasTestCase": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasTestCase",
+        "hasVariant": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/hasVariant",
+        "invokedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/invokedBy",
+        "modifiedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/modifiedBy",
+        "other": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/o=
ther",
+        "packagedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/packagedBy",
+        "patchedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/patchedBy",
+        "publishedBy": "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/publishedBy",
+        "reportedBy": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/reportedBy",
+        "republishedBy": "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/republishedBy",
+        "serializedInArtifact": "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/serializedInArtifact",
+        "testedOn": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/testedOn",
+        "trainedOn": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/trainedOn",
+        "underInvestigationFor": "https://spdx.org/rdf/3.0.0/terms/Core/Re=
lationshipType/underInvestigationFor",
+        "usesTool": "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/usesTool",
+    }
+    # (Security/VEX) The `from` vulnerability affect each `to` Element
+    affects =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/af=
fects"
+    # The `from` Element is amended by each `to` Element
+    amendedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
amendedBy"
+    # The `from` Element is an ancestor of each `to` Element
+    ancestorOf =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/ancestorOf"
+    # The `from` Element is available from the additional supplier describ=
ed by each `to` Element
+    availableFrom =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/availableFrom"
+    # The `from` Element is a configuration applied to each `to` Element d=
uring a LifecycleScopeType period
+    configures =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/configures"
+    # The `from` Element contains each `to` Element
+    contains =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/c=
ontains"
+    # (Security) The `from` Vulnerability is coordinatedBy the `to` Agent(=
s) (vendor, researcher, or consumer agent)
+    coordinatedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/coordinatedBy"
+    # The `from` Element has been copied to each `to` Element
+    copiedTo =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/c=
opiedTo"
+    # The `from` Agent is delegating an action to the Agent of the `to` Re=
lationship (which must be of type invokedBy) during a LifecycleScopeType. (=
e.g. the `to` invokedBy Relationship is being done on behalf of `from`)
+    delegatedTo =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/delegatedTo"
+    # The `from` Element depends on each `to` Element during a LifecycleSc=
opeType period.
+    dependsOn =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
dependsOn"
+    # The `from` Element is a descendant of each `to` Element
+    descendantOf =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/descendantOf"
+    # The `from` Element describes each `to` Element. To denote the root(s=
) of a tree of elements in a collection, the rootElement property should be=
 used.
+    describes =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
describes"
+    # (Security/VEX) The `from` Vulnerability has no impact on each `to` E=
lement
+    doesNotAffect =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/doesNotAffect"
+    # The `from` archive expands out as an artifact described by each `to`=
 Element
+    expandsTo =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
expandsTo"
+    # (Security) The `from` Vulnerability has had an exploit created again=
st it by each `to` Agent
+    exploitCreatedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/exploitCreatedBy"
+    # (Security) Designates a `from` Vulnerability has been fixed by the `=
to` Agent(s)
+    fixedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/fi=
xedBy"
+    # (Security/VEX) A `from` Vulnerability has been fixed in each of the =
`to` Element(s)
+    fixedIn =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/fi=
xedIn"
+    # (Security) Designates a `from` Vulnerability was originally discover=
ed by the `to` Agent(s)
+    foundBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/fo=
undBy"
+    # The `from` Element generates each `to` Element
+    generates =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
generates"
+    # Every `to` Element is is a file added to the `from` Element (`from` =
hasAddedFile `to`)
+    hasAddedFile =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTy=
pe/hasAddedFile"
+    # (Security) Relates a `from` Vulnerability and each `to` Element(s) w=
ith a security assessment. To be used with `VulnAssessmentRelationship` typ=
es
+    hasAssessmentFor =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/hasAssessmentFor"
+    # (Security) Used to associate a `from` Artifact with each `to` Vulner=
ability
+    hasAssociatedVulnerability =3D "https://spdx.org/rdf/3.0.0/terms/Core/=
RelationshipType/hasAssociatedVulnerability"
+    # The `from` Software Artifact is concluded by the SPDX data creator t=
o be governed by each `to` license
+    hasConcludedLicense =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relatio=
nshipType/hasConcludedLicense"
+    # The `from` Element treats each `to` Element as a data file
+    hasDataFile =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/hasDataFile"
+    # The `from` Software Artifact was discovered to actually contain each=
 `to` license, for example as detected by use of automated tooling.
+    hasDeclaredLicense =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relation=
shipType/hasDeclaredLicense"
+    # Every `to` Element is a file deleted from the `from` Element (`from`=
 hasDeletedFile `to`)
+    hasDeletedFile =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasDeletedFile"
+    # The `from` Element has manifest files that contain dependency inform=
ation in each `to` Element
+    hasDependencyManifest =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/hasDependencyManifest"
+    # The `from` Element is distributed as an artifact in each Element `to=
`, (e.g. an RPM or archive file)
+    hasDistributionArtifact =3D "https://spdx.org/rdf/3.0.0/terms/Core/Rel=
ationshipType/hasDistributionArtifact"
+    # The `from` Element is documented by each `to` Element
+    hasDocumentation =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/hasDocumentation"
+    # The `from` Element dynamically links in each `to` Element, during a =
LifecycleScopeType period.
+    hasDynamicLink =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasDynamicLink"
+    # (Dataset) Every `to` Element is considered as evidence for the `from=
` Element (`from` hasEvidence `to`)
+    hasEvidence =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/hasEvidence"
+    # Every `to` Element is an example for the `from` Element (`from` hasE=
xample `to`)
+    hasExample =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/hasExample"
+    # The `from` Build was run on the `to` Element during a LifecycleScope=
Type period (e.g. The host that the build runs on)
+    hasHost =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/ha=
sHost"
+    # The `from` Build has each `to` Elements as an input during a Lifecyc=
leScopeType period.
+    hasInputs =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
hasInputs"
+    # Every `to` Element is metadata about the `from` Element (`from` hasM=
etadata `to`)
+    hasMetadata =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/hasMetadata"
+    # Every `to` Element is an optional component of the `from` Element (`=
from` hasOptionalComponent `to`)
+    hasOptionalComponent =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relati=
onshipType/hasOptionalComponent"
+    # The `from` Element optionally depends on each `to` Element during a =
LifecycleScopeType period
+    hasOptionalDependency =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/hasOptionalDependency"
+    # The `from` Build element generates each `to` Element as an output du=
ring a LifecycleScopeType period.
+    hasOutputs =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/hasOutputs"
+    # The `from` Element has a prerequsite on each `to` Element, during a =
LifecycleScopeType period
+    hasPrerequsite =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasPrerequsite"
+    # The `from` Element has a dependency on each `to` Element, but depend=
ency is not in the distributed artifact, but assumed to be provided, during=
 a LifecycleScopeType period
+    hasProvidedDependency =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/hasProvidedDependency"
+    # The `from` Element has a requirement on each `to` Element, during a =
LifecycleScopeType period
+    hasRequirement =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationship=
Type/hasRequirement"
+    # Every `to` Element is a specification for the `from` Element (`from`=
 hasSpecification `to`), during a LifecycleScopeType period
+    hasSpecification =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relationsh=
ipType/hasSpecification"
+    # The `from` Element statically links in each `to` Element, during a L=
ifecycleScopeType period
+    hasStaticLink =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/hasStaticLink"
+    # Every `to` Element is a test artifact for the `from` Element (`from`=
 hasTest `to`), during a LifecycleScopeType period
+    hasTest =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/ha=
sTest"
+    # Every `to` Element is a test case for the `from` Element (`from` has=
TestCase `to`)
+    hasTestCase =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/hasTestCase"
+    # Every `to` Element is a variant the `from` Element (`from` hasVarian=
t `to`)
+    hasVariant =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/hasVariant"
+    # The `from` Element was invoked by the `to` Agent during a LifecycleS=
copeType period (for example, a Build element that describes a build step)
+    invokedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
invokedBy"
+    # The `from` Element is modified by each `to` Element
+    modifiedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/modifiedBy"
+    # Every `to` Element is related to the `from` Element where the relati=
onship type is not described by any of the SPDX relationhip types (this rel=
ationship is directionless)
+    other =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/othe=
r"
+    # Every `to` Element is a packaged instance of the `from` Element (`fr=
om` packagedBy `to`)
+    packagedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/packagedBy"
+    # Every `to` Element is a patch for the `from` Element (`from` patched=
By `to`)
+    patchedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
patchedBy"
+    # (Security) Designates a `from` Vulnerability was made available for =
public use or reference by each `to` Agent
+    publishedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipTyp=
e/publishedBy"
+    # (Security) Designates a `from` Vulnerability was first reported to a=
 project, vendor, or tracking database for formal identification by each `t=
o` Agent
+    reportedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType=
/reportedBy"
+    # (Security) Designates a `from` Vulnerability's details were tracked,=
 aggregated, and/or enriched to improve context (i.e. NVD) by a `to` Agent(=
s)
+    republishedBy =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipT=
ype/republishedBy"
+    # The `from` SPDXDocument can be found in a serialized form in each `t=
o` Artifact
+    serializedInArtifact =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relati=
onshipType/serializedInArtifact"
+    # (AI, Dataset) The `from` Element has been tested on the `to` Element
+    testedOn =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/t=
estedOn"
+    # (AI, Dataset) The `from` Element has been trained by the `to` Elemen=
t(s)
+    trainedOn =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/=
trainedOn"
+    # (Security/VEX) The `from` Vulnerability impact is being investigated=
 for each `to` Element
+    underInvestigationFor =3D "https://spdx.org/rdf/3.0.0/terms/Core/Relat=
ionshipType/underInvestigationFor"
+    # The `from` Element uses each `to` Element as a tool during a Lifecyc=
leScopeType period.
+    usesTool =3D "https://spdx.org/rdf/3.0.0/terms/Core/RelationshipType/u=
sesTool"
+
+
+# A collection of SPDX Elements that could potentially be serialized.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/SpdxDocument", compact_ty=
pe=3D"SpdxDocument", abstract=3DFalse)
+class SpdxDocument(ElementCollection):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides the license under which the SPDX documentation of the E=
lement can be
+        # used.
+        cls._add_property(
+            "dataLicense",
+            ObjectProp(simplelicensing_AnyLicenseInfo, False),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/dataLicense",
+            compact=3D"dataLicense",
+        )
+        # Provides an ExternalMap of Element identifiers.
+        cls._add_property(
+            "imports",
+            ListProp(ObjectProp(ExternalMap, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/imports",
+            compact=3D"imports",
+        )
+        # Provides a NamespaceMap of prefixes and associated namespace par=
tial URIs applicable to an SpdxDocument and independent of any specific ser=
ialization format or instance.
+        cls._add_property(
+            "namespaceMap",
+            ListProp(ObjectProp(NamespaceMap, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/namespaceMap",
+            compact=3D"namespaceMap",
+        )
+
+
+# Indicates the type of support that is associated with an artifact.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/SupportType", compact_typ=
e=3D"SupportType", abstract=3DFalse)
+class SupportType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "deployed": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/dep=
loyed",
+        "development": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/=
development",
+        "endOfSupport": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType=
/endOfSupport",
+        "limitedSupport": "https://spdx.org/rdf/3.0.0/terms/Core/SupportTy=
pe/limitedSupport",
+        "noAssertion": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/=
noAssertion",
+        "noSupport": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/no=
Support",
+        "support": "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/supp=
ort",
+    }
+    # in addition to being supported by the supplier, the software is know=
n to have been deployed and is in use.  For a software as a service provide=
r, this implies the software is now available as a service.
+    deployed =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/deploy=
ed"
+    # the artifact is in active development and is not considered ready fo=
r formal support from the supplier.
+    development =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/dev=
elopment"
+    # there is a defined end of support for the artifact from the supplier=
.  This may also be referred to as end of life. There is a validUntilDate t=
hat can be used to signal when support ends for the artifact.
+    endOfSupport =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/en=
dOfSupport"
+    # the artifact has been released, and there is limited support availab=
le from the supplier. There is a validUntilDate that can provide additional=
 information about the duration of support.
+    limitedSupport =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/=
limitedSupport"
+    # no assertion about the type of support is made.   This is considered=
 the default if no other support type is used.
+    noAssertion =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/noA=
ssertion"
+    # there is no support for the artifact from the supplier, consumer ass=
umes any support obligations.
+    noSupport =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/noSup=
port"
+    # the artifact has been released, and is supported from the supplier. =
  There is a validUntilDate that can provide additional information about t=
he duration of support.
+    support =3D "https://spdx.org/rdf/3.0.0/terms/Core/SupportType/support"
+
+
+# An element of hardware and/or software utilized to carry out a particula=
r function.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Tool", compact_type=3D"To=
ol", abstract=3DFalse)
+class Tool(Element):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# Categories of confidentiality level.
+@register("https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevelTy=
pe", compact_type=3D"dataset_ConfidentialityLevelType", abstract=3DFalse)
+class dataset_ConfidentialityLevelType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "amber": "https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentiality=
LevelType/amber",
+        "clear": "https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentiality=
LevelType/clear",
+        "green": "https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentiality=
LevelType/green",
+        "red": "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLe=
velType/red",
+    }
+    # Data points in the dataset can be shared only with specific
+    amber =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLev=
elType/amber"
+    # Dataset may be distributed freely, without restriction.
+    clear =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLev=
elType/clear"
+    # Dataset can be shared within a community of peers and partners.
+    green =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLev=
elType/green"
+    # Data points in the dataset are highly confidential and can only be s=
hared
+    red =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/ConfidentialityLevel=
Type/red"
+
+
+# Availability of dataset.
+@register("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilityTyp=
e", compact_type=3D"dataset_DatasetAvailabilityType", abstract=3DFalse)
+class dataset_DatasetAvailabilityType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "clickthrough": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetA=
vailabilityType/clickthrough",
+        "directDownload": "https://spdx.org/rdf/3.0.0/terms/Dataset/Datase=
tAvailabilityType/directDownload",
+        "query": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabi=
lityType/query",
+        "registration": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetA=
vailabilityType/registration",
+        "scrapingScript": "https://spdx.org/rdf/3.0.0/terms/Dataset/Datase=
tAvailabilityType/scrapingScript",
+    }
+    # the dataset is not publicly available and can only be accessed
+    clickthrough =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/clickthrough"
+    # the dataset is publicly available and can be downloaded
+    directDownload =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAv=
ailabilityType/directDownload"
+    # the dataset is publicly available, but not all at once, and can only
+    query =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvailabilit=
yType/query"
+    # the dataset is not publicly available and an email registration
+    registration =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/registration"
+    # the dataset provider is not making available the underlying
+    scrapingScript =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAv=
ailabilityType/scrapingScript"
+
+
+# Enumeration of dataset types.
+@register("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType", compact_=
type=3D"dataset_DatasetType", abstract=3DFalse)
+class dataset_DatasetType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "audio": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/aud=
io",
+        "categorical": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetTy=
pe/categorical",
+        "graph": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/gra=
ph",
+        "image": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/ima=
ge",
+        "noAssertion": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetTy=
pe/noAssertion",
+        "numeric": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/n=
umeric",
+        "other": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/oth=
er",
+        "sensor": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/se=
nsor",
+        "structured": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetTyp=
e/structured",
+        "syntactic": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/syntactic",
+        "text": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/text=
",
+        "timeseries": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetTyp=
e/timeseries",
+        "timestamp": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/timestamp",
+        "video": "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/vid=
eo",
+    }
+    # data is audio based, such as a collection of music from the 80s.
+    audio =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/audio"
+    # data that is classified into a discrete number of categories,
+    categorical =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/=
categorical"
+    # data is in the form of a graph where entries are somehow related to
+    graph =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/graph"
+    # data is a collection of images such as pictures of animals.
+    image =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/image"
+    # data type is not known.
+    noAssertion =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/=
noAssertion"
+    # data consists only of numeric entries.
+    numeric =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/nume=
ric"
+    # data is of a type not included in this list.
+    other =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/other"
+    # data is recorded from a physical sensor, such as a thermometer
+    sensor =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/senso=
r"
+    # data is stored in tabular format or retrieved from a relational
+    structured =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/s=
tructured"
+    # data describes the syntax or semantics of a language or text, such
+    syntactic =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/sy=
ntactic"
+    # data consists of unstructured text, such as a book, Wikipedia article
+    text =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/text"
+    # data is recorded in an ordered sequence of timestamped entries,
+    timeseries =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/t=
imeseries"
+    # data is recorded with a timestamp for each entry, but not
+    timestamp =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/ti=
mestamp"
+    # data is video based, such as a collection of movie clips featuring T=
om
+    video =3D "https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType/video"
+
+
+# Abstract class for additional text intended to be added to a License, but
+# which is not itself a standalone License.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/LicenseAddit=
ion", compact_type=3D"expandedlicensing_LicenseAddition", abstract=3DTrue)
+class expandedlicensing_LicenseAddition(Element):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Identifies the full text of a LicenseAddition.
+        cls._add_property(
+            "expandedlicensing_additionText",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/addi=
tionText",
+            min_count=3D1,
+            compact=3D"expandedlicensing_additionText",
+        )
+        # Specifies whether an additional text identifier has been marked =
as deprecated.
+        cls._add_property(
+            "expandedlicensing_isDeprecatedAdditionId",
+            BooleanProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/isDe=
precatedAdditionId",
+            compact=3D"expandedlicensing_isDeprecatedAdditionId",
+        )
+        # Identifies all the text and metadata associated with a license i=
n the license
+        # XML format.
+        cls._add_property(
+            "expandedlicensing_licenseXml",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/lice=
nseXml",
+            compact=3D"expandedlicensing_licenseXml",
+        )
+        # Specifies the licenseId that is preferred to be used in place of=
 a deprecated
+        # License or LicenseAddition.
+        cls._add_property(
+            "expandedlicensing_obsoletedBy",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/obso=
letedBy",
+            compact=3D"expandedlicensing_obsoletedBy",
+        )
+        # Contains a URL where the License or LicenseAddition can be found=
 in use.
+        cls._add_property(
+            "expandedlicensing_seeAlso",
+            ListProp(AnyURIProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/seeA=
lso",
+            compact=3D"expandedlicensing_seeAlso",
+        )
+        # Identifies the full text of a LicenseAddition, in SPDX templatin=
g format.
+        cls._add_property(
+            "expandedlicensing_standardAdditionTemplate",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/stan=
dardAdditionTemplate",
+            compact=3D"expandedlicensing_standardAdditionTemplate",
+        )
+
+
+# A license exception that is listed on the SPDX Exceptions list.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/ListedLicens=
eException", compact_type=3D"expandedlicensing_ListedLicenseException", abs=
tract=3DFalse)
+class expandedlicensing_ListedLicenseException(expandedlicensing_LicenseAd=
dition):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Specifies the SPDX License List version in which this license or=
 exception
+        # identifier was deprecated.
+        cls._add_property(
+            "expandedlicensing_deprecatedVersion",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/depr=
ecatedVersion",
+            compact=3D"expandedlicensing_deprecatedVersion",
+        )
+        # Specifies the SPDX License List version in which this ListedLice=
nse or
+        # ListedLicenseException identifier was first added.
+        cls._add_property(
+            "expandedlicensing_listVersionAdded",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/list=
VersionAdded",
+            compact=3D"expandedlicensing_listVersionAdded",
+        )
+
+
+# A property name with an associated value.
+@register("https://spdx.org/rdf/3.0.0/terms/Extension/CdxPropertyEntry", c=
ompact_type=3D"extension_CdxPropertyEntry", abstract=3DFalse)
+class extension_CdxPropertyEntry(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # A name used in a CdxExtension name-value pair.
+        cls._add_property(
+            "extension_cdxPropName",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Extension/cdxPropName",
+            min_count=3D1,
+            compact=3D"extension_cdxPropName",
+        )
+        # A value used in a CdxExtension name-value pair.
+        cls._add_property(
+            "extension_cdxPropValue",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Extension/cdxPropValue=
",
+            compact=3D"extension_cdxPropValue",
+        )
+
+
+# A characterization of some aspect of an Element that is associated with =
the Element in a generalized fashion.
+@register("https://spdx.org/rdf/3.0.0/terms/Extension/Extension", compact_=
type=3D"extension_Extension", abstract=3DTrue)
+class extension_Extension(SHACLExtensibleObject, SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# Specifies the CVSS base, temporal, threat, or environmental severity typ=
e.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType", co=
mpact_type=3D"security_CvssSeverityType", abstract=3DFalse)
+class security_CvssSeverityType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "critical": "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverit=
yType/critical",
+        "high": "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityTyp=
e/high",
+        "low": "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType=
/low",
+        "medium": "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityT=
ype/medium",
+        "none": "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityTyp=
e/none",
+    }
+    # When a CVSS score is between 9.0 - 10.0
+    critical =3D "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityTy=
pe/critical"
+    # When a CVSS score is between 7.0 - 8.9
+    high =3D "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/h=
igh"
+    # When a CVSS score is between 0 - 3.9
+    low =3D "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/lo=
w"
+    # When a CVSS score is between 4 - 6.9
+    medium =3D "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType=
/medium"
+    # When a CVSS score is 0
+    none =3D "https://spdx.org/rdf/3.0.0/terms/Security/CvssSeverityType/n=
one"
+
+
+# Specifies the exploit catalog type.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogType", =
compact_type=3D"security_ExploitCatalogType", abstract=3DFalse)
+class security_ExploitCatalogType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "kev": "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogTy=
pe/kev",
+        "other": "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalog=
Type/other",
+    }
+    # CISA's Known Exploited Vulnerability (KEV) Catalog
+    kev =3D "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogType/=
kev"
+    # Other exploit catalogs
+    other =3D "https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogTyp=
e/other"
+
+
+# Specifies the SSVC decision type.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType", co=
mpact_type=3D"security_SsvcDecisionType", abstract=3DFalse)
+class security_SsvcDecisionType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "act": "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType=
/act",
+        "attend": "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionT=
ype/attend",
+        "track": "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionTy=
pe/track",
+        "trackStar": "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisi=
onType/trackStar",
+    }
+    # The vulnerability requires attention from the organization's interna=
l, supervisory-level and leadership-level individuals. Necessary actions in=
clude requesting assistance or information about the vulnerability, as well=
 as publishing a notification either internally and/or externally. Typicall=
y, internal groups would meet to determine the overall response and then ex=
ecute agreed upon actions. CISA recommends remediating Act vulnerabilities =
as soon as possible.
+    act =3D "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/ac=
t"
+    # The vulnerability requires attention from the organization's interna=
l, supervisory-level individuals. Necessary actions include requesting assi=
stance or information about the vulnerability, and may involve publishing a=
 notification either internally and/or externally. CISA recommends remediat=
ing Attend vulnerabilities sooner than standard update timelines.
+    attend =3D "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType=
/attend"
+    # The vulnerability does not require action at this time. The organiza=
tion would continue to track the vulnerability and reassess it if new infor=
mation becomes available. CISA recommends remediating Track vulnerabilities=
 within standard update timelines.
+    track =3D "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionType/=
track"
+    # ("Track*" in the SSVC spec) The vulnerability contains specific char=
acteristics that may require closer monitoring for changes. CISA recommends=
 remediating Track* vulnerabilities within standard update timelines.
+    trackStar =3D "https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisionT=
ype/trackStar"
+
+
+# Specifies the VEX justification type.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/VexJustificationType"=
, compact_type=3D"security_VexJustificationType", abstract=3DFalse)
+class security_VexJustificationType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "componentNotPresent": "https://spdx.org/rdf/3.0.0/terms/Security/=
VexJustificationType/componentNotPresent",
+        "inlineMitigationsAlreadyExist": "https://spdx.org/rdf/3.0.0/terms=
/Security/VexJustificationType/inlineMitigationsAlreadyExist",
+        "vulnerableCodeCannotBeControlledByAdversary": "https://spdx.org/r=
df/3.0.0/terms/Security/VexJustificationType/vulnerableCodeCannotBeControll=
edByAdversary",
+        "vulnerableCodeNotInExecutePath": "https://spdx.org/rdf/3.0.0/term=
s/Security/VexJustificationType/vulnerableCodeNotInExecutePath",
+        "vulnerableCodeNotPresent": "https://spdx.org/rdf/3.0.0/terms/Secu=
rity/VexJustificationType/vulnerableCodeNotPresent",
+    }
+    # The software is not affected because the vulnerable component is not=
 in the product.
+    componentNotPresent =3D "https://spdx.org/rdf/3.0.0/terms/Security/Vex=
JustificationType/componentNotPresent"
+    # Built-in inline controls or mitigations prevent an adversary from le=
veraging the vulnerability.
+    inlineMitigationsAlreadyExist =3D "https://spdx.org/rdf/3.0.0/terms/Se=
curity/VexJustificationType/inlineMitigationsAlreadyExist"
+    # The vulnerable component is present, and the component contains the =
vulnerable code. However, vulnerable code is used in such a way that an att=
acker cannot mount any anticipated attack.
+    vulnerableCodeCannotBeControlledByAdversary =3D "https://spdx.org/rdf/=
3.0.0/terms/Security/VexJustificationType/vulnerableCodeCannotBeControlledB=
yAdversary"
+    # The affected code is not reachable through the execution of the code=
, including non-anticipated states of the product.
+    vulnerableCodeNotInExecutePath =3D "https://spdx.org/rdf/3.0.0/terms/S=
ecurity/VexJustificationType/vulnerableCodeNotInExecutePath"
+    # The product is not affected because the code underlying the vulnerab=
ility is not present in the product.
+    vulnerableCodeNotPresent =3D "https://spdx.org/rdf/3.0.0/terms/Securit=
y/VexJustificationType/vulnerableCodeNotPresent"
+
+
+# Abstract ancestor class for all vulnerability assessments
+@register("https://spdx.org/rdf/3.0.0/terms/Security/VulnAssessmentRelatio=
nship", compact_type=3D"security_VulnAssessmentRelationship", abstract=3DTr=
ue)
+class security_VulnAssessmentRelationship(Relationship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Identifies who or what supplied the artifact or VulnAssessmentRe=
lationship
+        # referenced by the Element.
+        cls._add_property(
+            "suppliedBy",
+            ObjectProp(Agent, False),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/suppliedBy",
+            compact=3D"suppliedBy",
+        )
+        # Specifies an Element contained in a piece of software where a vu=
lnerability was
+        # found.
+        cls._add_property(
+            "security_assessedElement",
+            ObjectProp(Element, False),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/assessedEleme=
nt",
+            compact=3D"security_assessedElement",
+        )
+        # Specifies a time when a vulnerability assessment was modified
+        cls._add_property(
+            "security_modifiedTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/modifiedTime",
+            compact=3D"security_modifiedTime",
+        )
+        # Specifies the time when a vulnerability was published.
+        cls._add_property(
+            "security_publishedTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/publishedTime=
",
+            compact=3D"security_publishedTime",
+        )
+        # Specified the time and date when a vulnerability was withdrawn.
+        cls._add_property(
+            "security_withdrawnTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/withdrawnTime=
",
+            compact=3D"security_withdrawnTime",
+        )
+
+
+# Abstract class representing a license combination consisting of one or m=
ore
+# licenses (optionally including additional text), which may be combined
+# according to the SPDX license expression syntax.
+@register("https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/AnyLicenseInfo=
", compact_type=3D"simplelicensing_AnyLicenseInfo", abstract=3DTrue)
+class simplelicensing_AnyLicenseInfo(Element):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# An SPDX Element containing an SPDX license expression string.
+@register("https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/LicenseExpress=
ion", compact_type=3D"simplelicensing_LicenseExpression", abstract=3DFalse)
+class simplelicensing_LicenseExpression(simplelicensing_AnyLicenseInfo):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Maps a LicenseRef or AdditionRef string for a Custom License or =
a Custom
+        # License Addition to its URI ID.
+        cls._add_property(
+            "simplelicensing_customIdToUri",
+            ListProp(ObjectProp(DictionaryEntry, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/custom=
IdToUri",
+            compact=3D"simplelicensing_customIdToUri",
+        )
+        # A string in the license expression format.
+        cls._add_property(
+            "simplelicensing_licenseExpression",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/licens=
eExpression",
+            min_count=3D1,
+            compact=3D"simplelicensing_licenseExpression",
+        )
+        # The version of the SPDX License List used in the license express=
ion.
+        cls._add_property(
+            "simplelicensing_licenseListVersion",
+            StringProp(pattern=3Dr"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d=
*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-=
Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/licens=
eListVersion",
+            compact=3D"simplelicensing_licenseListVersion",
+        )
+
+
+# A license or addition that is not listed on the SPDX License List.
+@register("https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/SimpleLicensin=
gText", compact_type=3D"simplelicensing_SimpleLicensingText", abstract=3DFa=
lse)
+class simplelicensing_SimpleLicensingText(Element):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Identifies the full text of a License or Addition.
+        cls._add_property(
+            "simplelicensing_licenseText",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/licens=
eText",
+            min_count=3D1,
+            compact=3D"simplelicensing_licenseText",
+        )
+
+
+# A canonical, unique, immutable identifier
+@register("https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifier", c=
ompact_type=3D"software_ContentIdentifier", abstract=3DFalse)
+class software_ContentIdentifier(IntegrityMethod):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Specifies the type of the content identifier.
+        cls._add_property(
+            "software_contentIdentifierType",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/ContentIde=
ntifierType/gitoid", "gitoid"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/ContentIde=
ntifierType/swhid", "swhid"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/contentIdenti=
fierType",
+            min_count=3D1,
+            compact=3D"software_contentIdentifierType",
+        )
+        # Specifies the value of the content identifier.
+        cls._add_property(
+            "software_contentIdentifierValue",
+            AnyURIProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/contentIdenti=
fierValue",
+            min_count=3D1,
+            compact=3D"software_contentIdentifierValue",
+        )
+
+
+# Specifies the type of a content identifier.
+@register("https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifierType=
", compact_type=3D"software_ContentIdentifierType", abstract=3DFalse)
+class software_ContentIdentifierType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "gitoid": "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdenti=
fierType/gitoid",
+        "swhid": "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentif=
ierType/swhid",
+    }
+    # Gitoid stands for [Git Object ID](https://git-scm.com/book/en/v2/Git=
-Internals-Git-Objects) and a gitoid of type blob is a unique hash of a bin=
ary artifact. A gitoid may represent the software [Artifact ID](https://git=
hub.com/omnibor/spec/blob/main/spec/SPEC.md#artifact-id) or the [OmniBOR Id=
entifier](https://github.com/omnibor/spec/blob/main/spec/SPEC.md#omnibor-id=
entifier) for the software artifact's associated [OmniBOR Document](https:/=
/github.com/omnibor/spec/blob/main/spec/SPEC.md#omnibor-document).
+    gitoid =3D "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifie=
rType/gitoid"
+    # SoftWare Hash IDentifier, persistent intrinsic identifiers for digit=
al artifacts. The syntax of the identifiers is defined in the [SWHID specif=
ication](https://www.swhid.org/specification/v1.1/4.Syntax) and in the case=
 of filess they typically look like `swh:1:cnt:94a9ed024d3859793618152ea559=
a168bbcbb5e2`.
+    swhid =3D "https://spdx.org/rdf/3.0.0/terms/Software/ContentIdentifier=
Type/swhid"
+
+
+# Enumeration of the different kinds of SPDX file.
+@register("https://spdx.org/rdf/3.0.0/terms/Software/FileKindType", compac=
t_type=3D"software_FileKindType", abstract=3DFalse)
+class software_FileKindType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "directory": "https://spdx.org/rdf/3.0.0/terms/Software/FileKindTy=
pe/directory",
+        "file": "https://spdx.org/rdf/3.0.0/terms/Software/FileKindType/fi=
le",
+    }
+    # The file represents a directory and all content stored in that
+    directory =3D "https://spdx.org/rdf/3.0.0/terms/Software/FileKindType/=
directory"
+    # The file represents a single file (default).
+    file =3D "https://spdx.org/rdf/3.0.0/terms/Software/FileKindType/file"
+
+
+# Provides a set of values to be used to describe the common types of SBOM=
s that
+# tools may create.
+@register("https://spdx.org/rdf/3.0.0/terms/Software/SbomType", compact_ty=
pe=3D"software_SbomType", abstract=3DFalse)
+class software_SbomType(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "analyzed": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/an=
alyzed",
+        "build": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/build=
",
+        "deployed": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/de=
ployed",
+        "design": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/desi=
gn",
+        "runtime": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/run=
time",
+        "source": "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/sour=
ce",
+    }
+    # SBOM generated through analysis of artifacts (e.g., executables, pac=
kages, containers, and virtual machine images) after its build. Such analys=
is generally requires a variety of heuristics. In some contexts, this may a=
lso be referred to as a "3rd party" SBOM.
+    analyzed =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/analy=
zed"
+    # SBOM generated as part of the process of building the software to cr=
eate a releasable artifact (e.g., executable or package) from data such as =
source files, dependencies, built components, build process ephemeral data,=
 and other SBOMs.
+    build =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/build"
+    # SBOM provides an inventory of software that is present on a system. =
This may be an assembly of other SBOMs that combines analysis of configurat=
ion options, and examination of execution behavior in a (potentially simula=
ted) deployment environment.
+    deployed =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/deplo=
yed"
+    # SBOM of intended, planned software project or product with included =
components (some of which may not yet exist) for a new software artifact.
+    design =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/design"
+    # SBOM generated through instrumenting the system running the software=
, to capture only components present in the system, as well as external cal=
l-outs or dynamically loaded components. In some contexts, this may also be=
 referred to as an "Instrumented" or "Dynamic" SBOM.
+    runtime =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/runtim=
e"
+    # SBOM created directly from the development environment, source files=
, and included dependencies used to build an product artifact.
+    source =3D "https://spdx.org/rdf/3.0.0/terms/Software/SbomType/source"
+
+
+# Provides information about the primary purpose of an Element.
+@register("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose", com=
pact_type=3D"software_SoftwarePurpose", abstract=3DFalse)
+class software_SoftwarePurpose(SHACLObject):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+        "application": "https://spdx.org/rdf/3.0.0/terms/Software/Software=
Purpose/application",
+        "archive": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurp=
ose/archive",
+        "bom": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/=
bom",
+        "configuration": "https://spdx.org/rdf/3.0.0/terms/Software/Softwa=
rePurpose/configuration",
+        "container": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/container",
+        "data": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/data",
+        "device": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/device",
+        "deviceDriver": "https://spdx.org/rdf/3.0.0/terms/Software/Softwar=
ePurpose/deviceDriver",
+        "diskImage": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/diskImage",
+        "documentation": "https://spdx.org/rdf/3.0.0/terms/Software/Softwa=
rePurpose/documentation",
+        "evidence": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/evidence",
+        "executable": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwareP=
urpose/executable",
+        "file": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/file",
+        "filesystemImage": "https://spdx.org/rdf/3.0.0/terms/Software/Soft=
warePurpose/filesystemImage",
+        "firmware": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/firmware",
+        "framework": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/framework",
+        "install": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurp=
ose/install",
+        "library": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurp=
ose/library",
+        "manifest": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/manifest",
+        "model": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/model",
+        "module": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/module",
+        "operatingSystem": "https://spdx.org/rdf/3.0.0/terms/Software/Soft=
warePurpose/operatingSystem",
+        "other": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/other",
+        "patch": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/patch",
+        "platform": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/platform",
+        "requirement": "https://spdx.org/rdf/3.0.0/terms/Software/Software=
Purpose/requirement",
+        "source": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/source",
+        "specification": "https://spdx.org/rdf/3.0.0/terms/Software/Softwa=
rePurpose/specification",
+        "test": "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/test",
+    }
+    # the Element is a software application
+    application =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/application"
+    # the Element is an archived collection of one or more files (.tar, .z=
ip, etc)
+    archive =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/archive"
+    # Element is a bill of materials
+    bom =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/bom"
+    # Element is configuration data
+    configuration =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwareP=
urpose/configuration"
+    # the Element is a container image which can be used by a container ru=
ntime application
+    container =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/container"
+    # Element is data
+    data =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/da=
ta"
+    # the Element refers to a chipset, processor, or electronic board
+    device =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/=
device"
+    # Element represents software that controls hardware devices
+    deviceDriver =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/deviceDriver"
+    # the Element refers to a disk image that can be written to a disk, bo=
oted in a VM, etc. A disk image typically contains most or all of the compo=
nents necessary to boot, such as bootloaders, kernels, firmware, userspace,=
 etc.
+    diskImage =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/diskImage"
+    # Element is documentation
+    documentation =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwareP=
urpose/documentation"
+    # the Element is the evidence that a specification or requirement has =
been fulfilled
+    evidence =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/evidence"
+    # Element is an Artifact that can be run on a computer
+    executable =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurp=
ose/executable"
+    # the Element is a single file which can be independently distributed =
(configuration file, statically linked binary, Kubernetes deployment, etc)
+    file =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/fi=
le"
+    # the Element is a file system image that can be written to a disk (or=
 virtual) partition
+    filesystemImage =3D "https://spdx.org/rdf/3.0.0/terms/Software/Softwar=
ePurpose/filesystemImage"
+    # the Element provides low level control over a device's hardware
+    firmware =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/firmware"
+    # the Element is a software framework
+    framework =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpo=
se/framework"
+    # the Element is used to install software on disk
+    install =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/install"
+    # the Element is a software library
+    library =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose=
/library"
+    # the Element is a software manifest
+    manifest =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/manifest"
+    # the Element is a machine learning or artificial intelligence model
+    model =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/m=
odel"
+    # the Element is a module of a piece of software
+    module =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/=
module"
+    # the Element is an operating system
+    operatingSystem =3D "https://spdx.org/rdf/3.0.0/terms/Software/Softwar=
ePurpose/operatingSystem"
+    # the Element doesn't fit into any of the other categories
+    other =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/o=
ther"
+    # Element contains a set of changes to update, fix, or improve another=
 Element
+    patch =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/p=
atch"
+    # Element represents a runtime environment
+    platform =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpos=
e/platform"
+    # the Element provides a requirement needed as input for another Eleme=
nt
+    requirement =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePur=
pose/requirement"
+    # the Element is a single or a collection of source files
+    source =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/=
source"
+    # the Element is a plan, guideline or strategy how to create, perform =
or analyse an application
+    specification =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwareP=
urpose/specification"
+    # The Element is a test used to verify functionality on an software el=
ement
+    test =3D "https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePurpose/te=
st"
+
+
+# Class that describes a build instance of software/artifacts.
+@register("https://spdx.org/rdf/3.0.0/terms/Build/Build", compact_type=3D"=
build_Build", abstract=3DFalse)
+class build_Build(Element):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Property that describes the time at which a build stops.
+        cls._add_property(
+            "build_buildEndTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/buildEndTime",
+            compact=3D"build_buildEndTime",
+        )
+        # A buildId is a locally unique identifier used by a builder to id=
entify a unique
+        # instance of a build produced by it.
+        cls._add_property(
+            "build_buildId",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/buildId",
+            compact=3D"build_buildId",
+        )
+        # Property describing the start time of a build.
+        cls._add_property(
+            "build_buildStartTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/buildStartTime",
+            compact=3D"build_buildStartTime",
+        )
+        # A buildType is a hint that is used to indicate the toolchain, pl=
atform, or
+        # infrastructure that the build was invoked on.
+        cls._add_property(
+            "build_buildType",
+            AnyURIProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/buildType",
+            min_count=3D1,
+            compact=3D"build_buildType",
+        )
+        # Property that describes the digest of the build configuration fi=
le used to
+        # invoke a build.
+        cls._add_property(
+            "build_configSourceDigest",
+            ListProp(ObjectProp(Hash, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/configSourceDige=
st",
+            compact=3D"build_configSourceDigest",
+        )
+        # Property describes the invocation entrypoint of a build.
+        cls._add_property(
+            "build_configSourceEntrypoint",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/configSourceEntr=
ypoint",
+            compact=3D"build_configSourceEntrypoint",
+        )
+        # Property that describes the URI of the build configuration sourc=
e file.
+        cls._add_property(
+            "build_configSourceUri",
+            ListProp(AnyURIProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/configSourceUri",
+            compact=3D"build_configSourceUri",
+        )
+        # Property describing the session in which a build is invoked.
+        cls._add_property(
+            "build_environment",
+            ListProp(ObjectProp(DictionaryEntry, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/environment",
+            compact=3D"build_environment",
+        )
+        # Property describing the parameters used in an instance of a buil=
d.
+        cls._add_property(
+            "build_parameters",
+            ListProp(ObjectProp(DictionaryEntry, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Build/parameters",
+            compact=3D"build_parameters",
+        )
+
+
+# Agent represents anything with the potential to act on a system.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Agent", compact_type=3D"A=
gent", abstract=3DFalse)
+class Agent(Element):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# An assertion made in relation to one or more elements.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Annotation", compact_type=
=3D"Annotation", abstract=3DFalse)
+class Annotation(Element):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Describes the type of annotation.
+        cls._add_property(
+            "annotationType",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType=
/other", "other"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/AnnotationType=
/review", "review"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/annotationType",
+            min_count=3D1,
+            compact=3D"annotationType",
+        )
+        # Specifies the media type of an Element or Property.
+        cls._add_property(
+            "contentType",
+            StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/contentType",
+            compact=3D"contentType",
+        )
+        # Commentary on an assertion that an annotator has made.
+        cls._add_property(
+            "statement",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/statement",
+            compact=3D"statement",
+        )
+        # An Element an annotator has made an assertion about.
+        cls._add_property(
+            "subject",
+            ObjectProp(Element, True),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/subject",
+            min_count=3D1,
+            compact=3D"subject",
+        )
+
+
+# A distinct article or unit within the digital domain.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Artifact", compact_type=
=3D"Artifact", abstract=3DTrue)
+class Artifact(Element):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Specifies the time an artifact was built.
+        cls._add_property(
+            "builtTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/builtTime",
+            compact=3D"builtTime",
+        )
+        # Identifies from where or whom the Element originally came.
+        cls._add_property(
+            "originatedBy",
+            ListProp(ObjectProp(Agent, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/originatedBy",
+            compact=3D"originatedBy",
+        )
+        # Specifies the time an artifact was released.
+        cls._add_property(
+            "releaseTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/releaseTime",
+            compact=3D"releaseTime",
+        )
+        # The name of a relevant standard that may apply to an artifact.
+        cls._add_property(
+            "standardName",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/standardName",
+            compact=3D"standardName",
+        )
+        # Identifies who or what supplied the artifact or VulnAssessmentRe=
lationship
+        # referenced by the Element.
+        cls._add_property(
+            "suppliedBy",
+            ObjectProp(Agent, False),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/suppliedBy",
+            compact=3D"suppliedBy",
+        )
+        # Specifies the level of support associated with an artifact.
+        cls._add_property(
+            "supportLevel",
+            ListProp(EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/de=
ployed", "deployed"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/de=
velopment", "development"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/en=
dOfSupport", "endOfSupport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/li=
mitedSupport", "limitedSupport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/no=
Assertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/no=
Support", "noSupport"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/SupportType/su=
pport", "support"),
+                ])),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/supportLevel",
+            compact=3D"supportLevel",
+        )
+        # Specifies until when the artifact can be used before its usage n=
eeds to be
+        # reassessed.
+        cls._add_property(
+            "validUntilTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/validUntilTime",
+            compact=3D"validUntilTime",
+        )
+
+
+# A collection of Elements that have a shared context.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Bundle", compact_type=3D"=
Bundle", abstract=3DFalse)
+class Bundle(ElementCollection):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Gives information about the circumstances or unifying properties
+        # that Elements of the bundle have been assembled under.
+        cls._add_property(
+            "context",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/context",
+            compact=3D"context",
+        )
+
+
+# A mathematically calculated representation of a grouping of data.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Hash", compact_type=3D"Ha=
sh", abstract=3DFalse)
+class Hash(IntegrityMethod):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Specifies the algorithm used for calculating the hash value.
+        cls._add_property(
+            "algorithm",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b256", "blake2b256"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b384", "blake2b384"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake2b512", "blake2b512"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
blake3", "blake3"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
crystalsDilithium", "crystalsDilithium"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
crystalsKyber", "crystalsKyber"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
falcon", "falcon"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md2", "md2"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md4", "md4"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md5", "md5"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
md6", "md6"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
other", "other"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha1", "sha1"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha224", "sha224"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha256", "sha256"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha384", "sha384"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_224", "sha3_224"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_256", "sha3_256"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_384", "sha3_384"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha3_512", "sha3_512"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/HashAlgorithm/=
sha512", "sha512"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/algorithm",
+            min_count=3D1,
+            compact=3D"algorithm",
+        )
+        # The result of applying a hash algorithm to an Element.
+        cls._add_property(
+            "hashValue",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/hashValue",
+            min_count=3D1,
+            compact=3D"hashValue",
+        )
+
+
+# Provide context for a relationship that occurs in the lifecycle.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScopedRelationsh=
ip", compact_type=3D"LifecycleScopedRelationship", abstract=3DFalse)
+class LifecycleScopedRelationship(Relationship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Capture the scope of information about a specific relationship b=
etween elements.
+        cls._add_property(
+            "scope",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/build", "build"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/design", "design"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/development", "development"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/other", "other"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/runtime", "runtime"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/LifecycleScope=
Type/test", "test"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Core/scope",
+            compact=3D"scope",
+        )
+
+
+# A group of people who work together in an organized way for a shared pur=
pose.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Organization", compact_ty=
pe=3D"Organization", abstract=3DFalse)
+class Organization(Agent):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# An individual human being.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Person", compact_type=3D"=
Person", abstract=3DFalse)
+class Person(Agent):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# A software agent.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/SoftwareAgent", compact_t=
ype=3D"SoftwareAgent", abstract=3DFalse)
+class SoftwareAgent(Agent):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# Portion of an AnyLicenseInfo representing a set of licensing information
+# where all elements apply.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/ConjunctiveL=
icenseSet", compact_type=3D"expandedlicensing_ConjunctiveLicenseSet", abstr=
act=3DFalse)
+class expandedlicensing_ConjunctiveLicenseSet(simplelicensing_AnyLicenseIn=
fo):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # A license expression participating in a license set.
+        cls._add_property(
+            "expandedlicensing_member",
+            ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/memb=
er",
+            min_count=3D2,
+            compact=3D"expandedlicensing_member",
+        )
+
+
+# A license addition that is not listed on the SPDX Exceptions List.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/CustomLicens=
eAddition", compact_type=3D"expandedlicensing_CustomLicenseAddition", abstr=
act=3DFalse)
+class expandedlicensing_CustomLicenseAddition(expandedlicensing_LicenseAdd=
ition):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# Portion of an AnyLicenseInfo representing a set of licensing information=
 where
+# only one of the elements applies.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/DisjunctiveL=
icenseSet", compact_type=3D"expandedlicensing_DisjunctiveLicenseSet", abstr=
act=3DFalse)
+class expandedlicensing_DisjunctiveLicenseSet(simplelicensing_AnyLicenseIn=
fo):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # A license expression participating in a license set.
+        cls._add_property(
+            "expandedlicensing_member",
+            ListProp(ObjectProp(simplelicensing_AnyLicenseInfo, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/memb=
er",
+            min_count=3D2,
+            compact=3D"expandedlicensing_member",
+        )
+
+
+# Abstract class representing a License or an OrLaterOperator.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/ExtendableLi=
cense", compact_type=3D"expandedlicensing_ExtendableLicense", abstract=3DTr=
ue)
+class expandedlicensing_ExtendableLicense(simplelicensing_AnyLicenseInfo):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# A concrete subclass of AnyLicenseInfo used by Individuals in the
+# ExpandedLicensing profile.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/IndividualLi=
censingInfo", compact_type=3D"expandedlicensing_IndividualLicensingInfo", a=
bstract=3DFalse)
+class expandedlicensing_IndividualLicensingInfo(simplelicensing_AnyLicense=
Info):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# Abstract class for the portion of an AnyLicenseInfo representing a licen=
se.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/License", co=
mpact_type=3D"expandedlicensing_License", abstract=3DTrue)
+class expandedlicensing_License(expandedlicensing_ExtendableLicense):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Specifies whether a license or additional text identifier has be=
en marked as
+        # deprecated.
+        cls._add_property(
+            "expandedlicensing_isDeprecatedLicenseId",
+            BooleanProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/isDe=
precatedLicenseId",
+            compact=3D"expandedlicensing_isDeprecatedLicenseId",
+        )
+        # Specifies whether the License is listed as free by the
+        # [Free Software Foundation (FSF)](https://fsf.org).
+        cls._add_property(
+            "expandedlicensing_isFsfLibre",
+            BooleanProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/isFs=
fLibre",
+            compact=3D"expandedlicensing_isFsfLibre",
+        )
+        # Specifies whether the License is listed as approved by the
+        # [Open Source Initiative (OSI)](https://opensource.org).
+        cls._add_property(
+            "expandedlicensing_isOsiApproved",
+            BooleanProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/isOs=
iApproved",
+            compact=3D"expandedlicensing_isOsiApproved",
+        )
+        # Identifies all the text and metadata associated with a license i=
n the license
+        # XML format.
+        cls._add_property(
+            "expandedlicensing_licenseXml",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/lice=
nseXml",
+            compact=3D"expandedlicensing_licenseXml",
+        )
+        # Specifies the licenseId that is preferred to be used in place of=
 a deprecated
+        # License or LicenseAddition.
+        cls._add_property(
+            "expandedlicensing_obsoletedBy",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/obso=
letedBy",
+            compact=3D"expandedlicensing_obsoletedBy",
+        )
+        # Contains a URL where the License or LicenseAddition can be found=
 in use.
+        cls._add_property(
+            "expandedlicensing_seeAlso",
+            ListProp(AnyURIProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/seeA=
lso",
+            compact=3D"expandedlicensing_seeAlso",
+        )
+        # Provides a License author's preferred text to indicate that a fi=
le is covered
+        # by the License.
+        cls._add_property(
+            "expandedlicensing_standardLicenseHeader",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/stan=
dardLicenseHeader",
+            compact=3D"expandedlicensing_standardLicenseHeader",
+        )
+        # Identifies the full text of a License, in SPDX templating format.
+        cls._add_property(
+            "expandedlicensing_standardLicenseTemplate",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/stan=
dardLicenseTemplate",
+            compact=3D"expandedlicensing_standardLicenseTemplate",
+        )
+        # Identifies the full text of a License or Addition.
+        cls._add_property(
+            "simplelicensing_licenseText",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/SimpleLicensing/licens=
eText",
+            min_count=3D1,
+            compact=3D"simplelicensing_licenseText",
+        )
+
+
+# A license that is listed on the SPDX License List.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/ListedLicens=
e", compact_type=3D"expandedlicensing_ListedLicense", abstract=3DFalse)
+class expandedlicensing_ListedLicense(expandedlicensing_License):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Specifies the SPDX License List version in which this license or=
 exception
+        # identifier was deprecated.
+        cls._add_property(
+            "expandedlicensing_deprecatedVersion",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/depr=
ecatedVersion",
+            compact=3D"expandedlicensing_deprecatedVersion",
+        )
+        # Specifies the SPDX License List version in which this ListedLice=
nse or
+        # ListedLicenseException identifier was first added.
+        cls._add_property(
+            "expandedlicensing_listVersionAdded",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/list=
VersionAdded",
+            compact=3D"expandedlicensing_listVersionAdded",
+        )
+
+
+# Portion of an AnyLicenseInfo representing this version, or any later ver=
sion,
+# of the indicated License.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/OrLaterOpera=
tor", compact_type=3D"expandedlicensing_OrLaterOperator", abstract=3DFalse)
+class expandedlicensing_OrLaterOperator(expandedlicensing_ExtendableLicens=
e):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # A License participating in an 'or later' model.
+        cls._add_property(
+            "expandedlicensing_subjectLicense",
+            ObjectProp(expandedlicensing_License, True),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/subj=
ectLicense",
+            min_count=3D1,
+            compact=3D"expandedlicensing_subjectLicense",
+        )
+
+
+# Portion of an AnyLicenseInfo representing a License which has additional
+# text applied to it.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/WithAddition=
Operator", compact_type=3D"expandedlicensing_WithAdditionOperator", abstrac=
t=3DFalse)
+class expandedlicensing_WithAdditionOperator(simplelicensing_AnyLicenseInf=
o):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # A LicenseAddition participating in a 'with addition' model.
+        cls._add_property(
+            "expandedlicensing_subjectAddition",
+            ObjectProp(expandedlicensing_LicenseAddition, True),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/subj=
ectAddition",
+            min_count=3D1,
+            compact=3D"expandedlicensing_subjectAddition",
+        )
+        # A License participating in a 'with addition' model.
+        cls._add_property(
+            "expandedlicensing_subjectExtendableLicense",
+            ObjectProp(expandedlicensing_ExtendableLicense, True),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/subj=
ectExtendableLicense",
+            min_count=3D1,
+            compact=3D"expandedlicensing_subjectExtendableLicense",
+        )
+
+
+# A type of extension consisting of a list of name value pairs.
+@register("https://spdx.org/rdf/3.0.0/terms/Extension/CdxPropertiesExtensi=
on", compact_type=3D"extension_CdxPropertiesExtension", abstract=3DFalse)
+class extension_CdxPropertiesExtension(extension_Extension):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides a map of a property names to a values.
+        cls._add_property(
+            "extension_cdxProperty",
+            ListProp(ObjectProp(extension_CdxPropertyEntry, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Extension/cdxProperty",
+            min_count=3D1,
+            compact=3D"extension_cdxProperty",
+        )
+
+
+# Provides a CVSS version 2.0 assessment for a vulnerability.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/CvssV2VulnAssessmentR=
elationship", compact_type=3D"security_CvssV2VulnAssessmentRelationship", a=
bstract=3DFalse)
+class security_CvssV2VulnAssessmentRelationship(security_VulnAssessmentRel=
ationship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides a numerical (0-10) representation of the severity of a =
vulnerability.
+        cls._add_property(
+            "security_score",
+            FloatProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/score",
+            min_count=3D1,
+            compact=3D"security_score",
+        )
+        # Specifies the CVSS vector string for a vulnerability.
+        cls._add_property(
+            "security_vectorString",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/vectorString",
+            min_count=3D1,
+            compact=3D"security_vectorString",
+        )
+
+
+# Provides a CVSS version 3 assessment for a vulnerability.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/CvssV3VulnAssessmentR=
elationship", compact_type=3D"security_CvssV3VulnAssessmentRelationship", a=
bstract=3DFalse)
+class security_CvssV3VulnAssessmentRelationship(security_VulnAssessmentRel=
ationship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides a numerical (0-10) representation of the severity of a =
vulnerability.
+        cls._add_property(
+            "security_score",
+            FloatProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/score",
+            min_count=3D1,
+            compact=3D"security_score",
+        )
+        # Specifies the CVSS qualitative severity rating of a vulnerabilit=
y in relation to a piece of software.
+        cls._add_property(
+            "security_severity",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/critical", "critical"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/high", "high"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/low", "low"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/medium", "medium"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/none", "none"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/severity",
+            min_count=3D1,
+            compact=3D"security_severity",
+        )
+        # Specifies the CVSS vector string for a vulnerability.
+        cls._add_property(
+            "security_vectorString",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/vectorString",
+            min_count=3D1,
+            compact=3D"security_vectorString",
+        )
+
+
+# Provides a CVSS version 4 assessment for a vulnerability.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/CvssV4VulnAssessmentR=
elationship", compact_type=3D"security_CvssV4VulnAssessmentRelationship", a=
bstract=3DFalse)
+class security_CvssV4VulnAssessmentRelationship(security_VulnAssessmentRel=
ationship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides a numerical (0-10) representation of the severity of a =
vulnerability.
+        cls._add_property(
+            "security_score",
+            FloatProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/score",
+            min_count=3D1,
+            compact=3D"security_score",
+        )
+        # Specifies the CVSS qualitative severity rating of a vulnerabilit=
y in relation to a piece of software.
+        cls._add_property(
+            "security_severity",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/critical", "critical"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/high", "high"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/low", "low"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/medium", "medium"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/CvssSeveri=
tyType/none", "none"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/severity",
+            min_count=3D1,
+            compact=3D"security_severity",
+        )
+        # Specifies the CVSS vector string for a vulnerability.
+        cls._add_property(
+            "security_vectorString",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/vectorString",
+            min_count=3D1,
+            compact=3D"security_vectorString",
+        )
+
+
+# Provides an EPSS assessment for a vulnerability.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/EpssVulnAssessmentRel=
ationship", compact_type=3D"security_EpssVulnAssessmentRelationship", abstr=
act=3DFalse)
+class security_EpssVulnAssessmentRelationship(security_VulnAssessmentRelat=
ionship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # The percentile of the current probability score.
+        cls._add_property(
+            "security_percentile",
+            FloatProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/percentile",
+            min_count=3D1,
+            compact=3D"security_percentile",
+        )
+        # A probability score between 0 and 1 of a vulnerability being exp=
loited.
+        cls._add_property(
+            "security_probability",
+            FloatProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/probability",
+            min_count=3D1,
+            compact=3D"security_probability",
+        )
+        # Specifies the time when a vulnerability was published.
+        cls._add_property(
+            "security_publishedTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/publishedTime=
",
+            min_count=3D1,
+            compact=3D"security_publishedTime",
+        )
+
+
+# Provides an exploit assessment of a vulnerability.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/ExploitCatalogVulnAss=
essmentRelationship", compact_type=3D"security_ExploitCatalogVulnAssessment=
Relationship", abstract=3DFalse)
+class security_ExploitCatalogVulnAssessmentRelationship(security_VulnAsses=
smentRelationship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Specifies the exploit catalog type.
+        cls._add_property(
+            "security_catalogType",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/ExploitCat=
alogType/kev", "kev"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/ExploitCat=
alogType/other", "other"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/catalogType",
+            min_count=3D1,
+            compact=3D"security_catalogType",
+        )
+        # Describe that a CVE is known to have an exploit because it's bee=
n listed in an exploit catalog.
+        cls._add_property(
+            "security_exploited",
+            BooleanProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/exploited",
+            min_count=3D1,
+            compact=3D"security_exploited",
+        )
+        # Provides the location of an exploit catalog.
+        cls._add_property(
+            "security_locator",
+            AnyURIProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/locator",
+            min_count=3D1,
+            compact=3D"security_locator",
+        )
+
+
+# Provides an SSVC assessment for a vulnerability.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/SsvcVulnAssessmentRel=
ationship", compact_type=3D"security_SsvcVulnAssessmentRelationship", abstr=
act=3DFalse)
+class security_SsvcVulnAssessmentRelationship(security_VulnAssessmentRelat=
ionship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provide the enumeration of possible decisions in the Stakeholder=
-Specific Vulnerability Categorization (SSVC) decision tree [https://www.ci=
sa.gov/sites/default/files/publications/cisa-ssvc-guide%20508c.pdf](https:/=
/www.cisa.gov/sites/default/files/publications/cisa-ssvc-guide%20508c.pdf)
+        cls._add_property(
+            "security_decisionType",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisi=
onType/act", "act"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisi=
onType/attend", "attend"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisi=
onType/track", "track"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/SsvcDecisi=
onType/trackStar", "trackStar"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/decisionType",
+            min_count=3D1,
+            compact=3D"security_decisionType",
+        )
+
+
+# Asbtract ancestor class for all VEX relationships
+@register("https://spdx.org/rdf/3.0.0/terms/Security/VexVulnAssessmentRela=
tionship", compact_type=3D"security_VexVulnAssessmentRelationship", abstrac=
t=3DTrue)
+class security_VexVulnAssessmentRelationship(security_VulnAssessmentRelati=
onship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Conveys information about how VEX status was determined.
+        cls._add_property(
+            "security_statusNotes",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/statusNotes",
+            compact=3D"security_statusNotes",
+        )
+        # Specifies the version of a VEX statement.
+        cls._add_property(
+            "security_vexVersion",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/vexVersion",
+            compact=3D"security_vexVersion",
+        )
+
+
+# Specifies a vulnerability and its associated information.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/Vulnerability", compa=
ct_type=3D"security_Vulnerability", abstract=3DFalse)
+class security_Vulnerability(Artifact):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Specifies a time when a vulnerability assessment was modified
+        cls._add_property(
+            "security_modifiedTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/modifiedTime",
+            compact=3D"security_modifiedTime",
+        )
+        # Specifies the time when a vulnerability was published.
+        cls._add_property(
+            "security_publishedTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/publishedTime=
",
+            compact=3D"security_publishedTime",
+        )
+        # Specified the time and date when a vulnerability was withdrawn.
+        cls._add_property(
+            "security_withdrawnTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/withdrawnTime=
",
+            compact=3D"security_withdrawnTime",
+        )
+
+
+# A distinct article or unit related to Software.
+@register("https://spdx.org/rdf/3.0.0/terms/Software/SoftwareArtifact", co=
mpact_type=3D"software_SoftwareArtifact", abstract=3DTrue)
+class software_SoftwareArtifact(Artifact):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides additional purpose information of the software artifact.
+        cls._add_property(
+            "software_additionalPurpose",
+            ListProp(EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/application", "application"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/archive", "archive"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/bom", "bom"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/configuration", "configuration"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/container", "container"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/data", "data"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/device", "device"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/deviceDriver", "deviceDriver"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/diskImage", "diskImage"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/documentation", "documentation"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/evidence", "evidence"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/executable", "executable"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/file", "file"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/filesystemImage", "filesystemImage"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/firmware", "firmware"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/framework", "framework"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/install", "install"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/library", "library"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/manifest", "manifest"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/model", "model"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/module", "module"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/operatingSystem", "operatingSystem"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/other", "other"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/patch", "patch"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/platform", "platform"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/requirement", "requirement"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/source", "source"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/specification", "specification"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/test", "test"),
+                ])),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/additionalPur=
pose",
+            compact=3D"software_additionalPurpose",
+        )
+        # Provides a place for the SPDX data creator to record acknowledge=
ment text for
+        # a software Package, File or Snippet.
+        cls._add_property(
+            "software_attributionText",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/attributionTe=
xt",
+            compact=3D"software_attributionText",
+        )
+        # A canonical, unique, immutable identifier of the artifact conten=
t, that may be
+        # used for verifying its identity and/or integrity.
+        cls._add_property(
+            "software_contentIdentifier",
+            ListProp(ObjectProp(software_ContentIdentifier, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/contentIdenti=
fier",
+            compact=3D"software_contentIdentifier",
+        )
+        # Identifies the text of one or more copyright notices for a softw=
are Package,
+        # File or Snippet, if any.
+        cls._add_property(
+            "software_copyrightText",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/copyrightText=
",
+            compact=3D"software_copyrightText",
+        )
+        # Provides information about the primary purpose of the software a=
rtifact.
+        cls._add_property(
+            "software_primaryPurpose",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/application", "application"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/archive", "archive"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/bom", "bom"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/configuration", "configuration"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/container", "container"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/data", "data"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/device", "device"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/deviceDriver", "deviceDriver"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/diskImage", "diskImage"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/documentation", "documentation"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/evidence", "evidence"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/executable", "executable"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/file", "file"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/filesystemImage", "filesystemImage"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/firmware", "firmware"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/framework", "framework"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/install", "install"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/library", "library"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/manifest", "manifest"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/model", "model"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/module", "module"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/operatingSystem", "operatingSystem"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/other", "other"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/patch", "patch"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/platform", "platform"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/requirement", "requirement"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/source", "source"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/specification", "specification"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SoftwarePu=
rpose/test", "test"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/primaryPurpos=
e",
+            compact=3D"software_primaryPurpose",
+        )
+
+
+# A container for a grouping of SPDX-3.0 content characterizing details
+# (provenence, composition, licensing, etc.) about a product.
+@register("https://spdx.org/rdf/3.0.0/terms/Core/Bom", compact_type=3D"Bom=
", abstract=3DFalse)
+class Bom(Bundle):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# A license that is not listed on the SPDX License List.
+@register("https://spdx.org/rdf/3.0.0/terms/ExpandedLicensing/CustomLicens=
e", compact_type=3D"expandedlicensing_CustomLicense", abstract=3DFalse)
+class expandedlicensing_CustomLicense(expandedlicensing_License):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# Connects a vulnerability and an element designating the element as a pro=
duct
+# affected by the vulnerability.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/VexAffectedVulnAssess=
mentRelationship", compact_type=3D"security_VexAffectedVulnAssessmentRelati=
onship", abstract=3DFalse)
+class security_VexAffectedVulnAssessmentRelationship(security_VexVulnAsses=
smentRelationship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides advise on how to mitigate or remediate a vulnerability =
when a VEX product
+        # is affected by it.
+        cls._add_property(
+            "security_actionStatement",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/actionStateme=
nt",
+            compact=3D"security_actionStatement",
+        )
+        # Records the time when a recommended action was communicated in a=
 VEX statement
+        # to mitigate a vulnerability.
+        cls._add_property(
+            "security_actionStatementTime",
+            ListProp(DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\=
d:\d\d:\d\dZ$",)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/actionStateme=
ntTime",
+            compact=3D"security_actionStatementTime",
+        )
+
+
+# Links a vulnerability and elements representing products (in the VEX sen=
se) where
+# a fix has been applied and are no longer affected.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/VexFixedVulnAssessmen=
tRelationship", compact_type=3D"security_VexFixedVulnAssessmentRelationship=
", abstract=3DFalse)
+class security_VexFixedVulnAssessmentRelationship(security_VexVulnAssessme=
ntRelationship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# Links a vulnerability and one or more elements designating the latter as=
 products
+# not affected by the vulnerability.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/VexNotAffectedVulnAss=
essmentRelationship", compact_type=3D"security_VexNotAffectedVulnAssessment=
Relationship", abstract=3DFalse)
+class security_VexNotAffectedVulnAssessmentRelationship(security_VexVulnAs=
sessmentRelationship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Explains why a VEX product is not affected by a vulnerability. I=
t is an
+        # alternative in VexNotAffectedVulnAssessmentRelationship to the m=
achine-readable
+        # justification label.
+        cls._add_property(
+            "security_impactStatement",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/impactStateme=
nt",
+            compact=3D"security_impactStatement",
+        )
+        # Timestamp of impact statement.
+        cls._add_property(
+            "security_impactStatementTime",
+            DateTimeStampProp(pattern=3Dr"^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d=
\dZ$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/impactStateme=
ntTime",
+            compact=3D"security_impactStatementTime",
+        )
+        # Impact justification label to be used when linking a vulnerabili=
ty to an element
+        # representing a VEX product with a VexNotAffectedVulnAssessmentRe=
lationship
+        # relationship.
+        cls._add_property(
+            "security_justificationType",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/VexJustifi=
cationType/componentNotPresent", "componentNotPresent"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/VexJustifi=
cationType/inlineMitigationsAlreadyExist", "inlineMitigationsAlreadyExist"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/VexJustifi=
cationType/vulnerableCodeCannotBeControlledByAdversary", "vulnerableCodeCan=
notBeControlledByAdversary"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/VexJustifi=
cationType/vulnerableCodeNotInExecutePath", "vulnerableCodeNotInExecutePath=
"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Security/VexJustifi=
cationType/vulnerableCodeNotPresent", "vulnerableCodeNotPresent"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Security/justification=
Type",
+            compact=3D"security_justificationType",
+        )
+
+
+# Designates elements as products where the impact of a vulnerability is b=
eing
+# investigated.
+@register("https://spdx.org/rdf/3.0.0/terms/Security/VexUnderInvestigation=
VulnAssessmentRelationship", compact_type=3D"security_VexUnderInvestigation=
VulnAssessmentRelationship", abstract=3DFalse)
+class security_VexUnderInvestigationVulnAssessmentRelationship(security_Ve=
xVulnAssessmentRelationship):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+
+# Refers to any object that stores content on a computer.
+@register("https://spdx.org/rdf/3.0.0/terms/Software/File", compact_type=
=3D"software_File", abstract=3DFalse)
+class software_File(software_SoftwareArtifact):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides information about the content type of an Element.
+        cls._add_property(
+            "software_contentType",
+            StringProp(pattern=3Dr"^[^\/]+\/[^\/]+$",),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/contentType",
+            compact=3D"software_contentType",
+        )
+        # Describes if a given file is a directory or non-directory kind o=
f file.
+        cls._add_property(
+            "software_fileKind",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/FileKindTy=
pe/directory", "directory"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/FileKindTy=
pe/file", "file"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/fileKind",
+            compact=3D"software_fileKind",
+        )
+
+
+# Refers to any unit of content that can be associated with a distribution=
 of
+# software.
+@register("https://spdx.org/rdf/3.0.0/terms/Software/Package", compact_typ=
e=3D"software_Package", abstract=3DFalse)
+class software_Package(software_SoftwareArtifact):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Identifies the download Uniform Resource Identifier for the pack=
age at the time
+        # that the document was created.
+        cls._add_property(
+            "software_downloadLocation",
+            AnyURIProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/downloadLocat=
ion",
+            compact=3D"software_downloadLocation",
+        )
+        # A place for the SPDX document creator to record a website that s=
erves as the
+        # package's home page.
+        cls._add_property(
+            "software_homePage",
+            AnyURIProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/homePage",
+            compact=3D"software_homePage",
+        )
+        # Provides a place for the SPDX data creator to record the package=
 URL string
+        # (in accordance with the
+        # [package URL spec](https://github.com/package-url/purl-spec/blob=
/master/PURL-SPECIFICATION.rst))
+        # for a software Package.
+        cls._add_property(
+            "software_packageUrl",
+            AnyURIProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/packageUrl",
+            compact=3D"software_packageUrl",
+        )
+        # Identify the version of a package.
+        cls._add_property(
+            "software_packageVersion",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/packageVersio=
n",
+            compact=3D"software_packageVersion",
+        )
+        # Records any relevant background information or additional commen=
ts
+        # about the origin of the package.
+        cls._add_property(
+            "software_sourceInfo",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/sourceInfo",
+            compact=3D"software_sourceInfo",
+        )
+
+
+# A collection of SPDX Elements describing a single package.
+@register("https://spdx.org/rdf/3.0.0/terms/Software/Sbom", compact_type=
=3D"software_Sbom", abstract=3DFalse)
+class software_Sbom(Bom):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Provides information about the type of an SBOM.
+        cls._add_property(
+            "software_sbomType",
+            ListProp(EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/a=
nalyzed", "analyzed"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/b=
uild", "build"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/d=
eployed", "deployed"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/d=
esign", "design"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/r=
untime", "runtime"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Software/SbomType/s=
ource", "source"),
+                ])),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/sbomType",
+            compact=3D"software_sbomType",
+        )
+
+
+# Describes a certain part of a file.
+@register("https://spdx.org/rdf/3.0.0/terms/Software/Snippet", compact_typ=
e=3D"software_Snippet", abstract=3DFalse)
+class software_Snippet(software_SoftwareArtifact):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Defines the byte range in the original host file that the snippe=
t information
+        # applies to.
+        cls._add_property(
+            "software_byteRange",
+            ObjectProp(PositiveIntegerRange, False),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/byteRange",
+            compact=3D"software_byteRange",
+        )
+        # Defines the line range in the original host file that the snippe=
t information
+        # applies to.
+        cls._add_property(
+            "software_lineRange",
+            ObjectProp(PositiveIntegerRange, False),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/lineRange",
+            compact=3D"software_lineRange",
+        )
+        # Defines the original host file that the snippet information appl=
ies to.
+        cls._add_property(
+            "software_snippetFromFile",
+            ObjectProp(software_File, True),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Software/snippetFromFi=
le",
+            min_count=3D1,
+            compact=3D"software_snippetFromFile",
+        )
+
+
+# Specifies an AI package and its associated information.
+@register("https://spdx.org/rdf/3.0.0/terms/AI/AIPackage", compact_type=3D=
"ai_AIPackage", abstract=3DFalse)
+class ai_AIPackage(software_Package):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # States if a human is involved in the decisions of the AI softwar=
e.
+        cls._add_property(
+            "ai_autonomyType",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
o", "no"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
oAssertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/y=
es", "yes"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/autonomyType",
+            compact=3D"ai_autonomyType",
+        )
+        # Captures the domain in which the AI package can be used.
+        cls._add_property(
+            "ai_domain",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/domain",
+            compact=3D"ai_domain",
+        )
+        # Indicates the amount of energy consumed to train the AI model.
+        cls._add_property(
+            "ai_energyConsumption",
+            ObjectProp(ai_EnergyConsumption, False),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/energyConsumption",
+            compact=3D"ai_energyConsumption",
+        )
+        # Records a hyperparameter used to build the AI model contained in=
 the AI
+        # package.
+        cls._add_property(
+            "ai_hyperparameter",
+            ListProp(ObjectProp(DictionaryEntry, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/hyperparameter",
+            compact=3D"ai_hyperparameter",
+        )
+        # Provides relevant information about the AI software, not includi=
ng the model
+        # description.
+        cls._add_property(
+            "ai_informationAboutApplication",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/informationAboutApp=
lication",
+            compact=3D"ai_informationAboutApplication",
+        )
+        # Describes relevant information about different steps of the trai=
ning process.
+        cls._add_property(
+            "ai_informationAboutTraining",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/informationAboutTra=
ining",
+            compact=3D"ai_informationAboutTraining",
+        )
+        # Captures a limitation of the AI software.
+        cls._add_property(
+            "ai_limitation",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/limitation",
+            compact=3D"ai_limitation",
+        )
+        # Records the measurement of prediction quality of the AI model.
+        cls._add_property(
+            "ai_metric",
+            ListProp(ObjectProp(DictionaryEntry, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/metric",
+            compact=3D"ai_metric",
+        )
+        # Captures the threshold that was used for computation of a metric=
 described in
+        # the metric field.
+        cls._add_property(
+            "ai_metricDecisionThreshold",
+            ListProp(ObjectProp(DictionaryEntry, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/metricDecisionThres=
hold",
+            compact=3D"ai_metricDecisionThreshold",
+        )
+        # Describes all the preprocessing steps applied to the training da=
ta before the
+        # model training.
+        cls._add_property(
+            "ai_modelDataPreprocessing",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/modelDataPreprocess=
ing",
+            compact=3D"ai_modelDataPreprocessing",
+        )
+        # Describes methods that can be used to explain the model.
+        cls._add_property(
+            "ai_modelExplainability",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/modelExplainability=
",
+            compact=3D"ai_modelExplainability",
+        )
+        # Records the results of general safety risk assessment of the AI =
system.
+        cls._add_property(
+            "ai_safetyRiskAssessment",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssess=
mentType/high", "high"),
+                    ("https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssess=
mentType/low", "low"),
+                    ("https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssess=
mentType/medium", "medium"),
+                    ("https://spdx.org/rdf/3.0.0/terms/AI/SafetyRiskAssess=
mentType/serious", "serious"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/safetyRiskAssessmen=
t",
+            compact=3D"ai_safetyRiskAssessment",
+        )
+        # Captures a standard that is being complied with.
+        cls._add_property(
+            "ai_standardCompliance",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/standardCompliance",
+            compact=3D"ai_standardCompliance",
+        )
+        # Records the type of the model used in the AI software.
+        cls._add_property(
+            "ai_typeOfModel",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/typeOfModel",
+            compact=3D"ai_typeOfModel",
+        )
+        # Records if sensitive personal information is used during model t=
raining or
+        # could be used during the inference.
+        cls._add_property(
+            "ai_useSensitivePersonalInformation",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
o", "no"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
oAssertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/y=
es", "yes"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/AI/useSensitivePersona=
lInformation",
+            compact=3D"ai_useSensitivePersonalInformation",
+        )
+
+
+# Specifies a data package and its associated information.
+@register("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetPackage", compa=
ct_type=3D"dataset_DatasetPackage", abstract=3DFalse)
+class dataset_DatasetPackage(software_Package):
+    NODE_KIND =3D NodeKind.BlankNodeOrIRI
+    ID_ALIAS =3D "spdxId"
+    NAMED_INDIVIDUALS =3D {
+    }
+
+    @classmethod
+    def _register_props(cls):
+        super()._register_props()
+        # Describes the anonymization methods used.
+        cls._add_property(
+            "dataset_anonymizationMethodUsed",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/anonymizationM=
ethodUsed",
+            compact=3D"dataset_anonymizationMethodUsed",
+        )
+        # Describes the confidentiality level of the data points contained=
 in the dataset.
+        cls._add_property(
+            "dataset_confidentialityLevel",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentia=
lityLevelType/amber", "amber"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentia=
lityLevelType/clear", "clear"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentia=
lityLevelType/green", "green"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/Confidentia=
lityLevelType/red", "red"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/confidentialit=
yLevel",
+            compact=3D"dataset_confidentialityLevel",
+        )
+        # Describes how the dataset was collected.
+        cls._add_property(
+            "dataset_dataCollectionProcess",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/dataCollection=
Process",
+            compact=3D"dataset_dataCollectionProcess",
+        )
+        # Describes the preprocessing steps that were applied to the raw d=
ata to create the given dataset.
+        cls._add_property(
+            "dataset_dataPreprocessing",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/dataPreprocess=
ing",
+            compact=3D"dataset_dataPreprocessing",
+        )
+        # The field describes the availability of a dataset.
+        cls._add_property(
+            "dataset_datasetAvailability",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/clickthrough", "clickthrough"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/directDownload", "directDownload"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/query", "query"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/registration", "registration"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetAvai=
labilityType/scrapingScript", "scrapingScript"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/datasetAvailab=
ility",
+            compact=3D"dataset_datasetAvailability",
+        )
+        # Describes potentially noisy elements of the dataset.
+        cls._add_property(
+            "dataset_datasetNoise",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/datasetNoise",
+            compact=3D"dataset_datasetNoise",
+        )
+        # Captures the size of the dataset.
+        cls._add_property(
+            "dataset_datasetSize",
+            NonNegativeIntegerProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/datasetSize",
+            compact=3D"dataset_datasetSize",
+        )
+        # Describes the type of the given dataset.
+        cls._add_property(
+            "dataset_datasetType",
+            ListProp(EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/audio", "audio"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/categorical", "categorical"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/graph", "graph"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/image", "image"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/noAssertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/numeric", "numeric"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/other", "other"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/sensor", "sensor"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/structured", "structured"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/syntactic", "syntactic"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/text", "text"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/timeseries", "timeseries"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/timestamp", "timestamp"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Dataset/DatasetType=
/video", "video"),
+                ])),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/datasetType",
+            min_count=3D1,
+            compact=3D"dataset_datasetType",
+        )
+        # Describes a mechanism to update the dataset.
+        cls._add_property(
+            "dataset_datasetUpdateMechanism",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/datasetUpdateM=
echanism",
+            compact=3D"dataset_datasetUpdateMechanism",
+        )
+        # Describes if any sensitive personal information is present in th=
e dataset.
+        cls._add_property(
+            "dataset_hasSensitivePersonalInformation",
+            EnumProp([
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
o", "no"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/n=
oAssertion", "noAssertion"),
+                    ("https://spdx.org/rdf/3.0.0/terms/Core/PresenceType/y=
es", "yes"),
+                ]),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/hasSensitivePe=
rsonalInformation",
+            compact=3D"dataset_hasSensitivePersonalInformation",
+        )
+        # Describes what the given dataset should be used for.
+        cls._add_property(
+            "dataset_intendedUse",
+            StringProp(),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/intendedUse",
+            compact=3D"dataset_intendedUse",
+        )
+        # Records the biases that the dataset is known to encompass.
+        cls._add_property(
+            "dataset_knownBias",
+            ListProp(StringProp()),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/knownBias",
+            compact=3D"dataset_knownBias",
+        )
+        # Describes a sensor used for collecting the data.
+        cls._add_property(
+            "dataset_sensor",
+            ListProp(ObjectProp(DictionaryEntry, False)),
+            iri=3D"https://spdx.org/rdf/3.0.0/terms/Dataset/sensor",
+            compact=3D"dataset_sensor",
+        )
+
+
+"""Format Guard"""
+# fmt: on
+
+
+def main():
+    import argparse
+    from pathlib import Path
+
+    parser =3D argparse.ArgumentParser(description=3D"Python SHACL model t=
est")
+    parser.add_argument("infile", type=3DPath, help=3D"Input file")
+    parser.add_argument("--print", action=3D"store_true", help=3D"Print ob=
ject tree")
+    parser.add_argument("--outfile", type=3DPath, help=3D"Output file")
+
+    args =3D parser.parse_args()
+
+    objectset =3D SHACLObjectSet()
+    with args.infile.open("r") as f:
+        d =3D JSONLDDeserializer()
+        d.read(f, objectset)
+
+    if args.print:
+        print_tree(objectset.objects)
+
+    if args.outfile:
+        with args.outfile.open("wb") as f:
+            s =3D JSONLDSerializer()
+            s.write(objectset, f)
+
+    return 0
+
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main())
--=20
2.43.2


