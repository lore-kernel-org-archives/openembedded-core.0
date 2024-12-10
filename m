Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADD9E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 17:33:20 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.16687.1733851991914982178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 09:33:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iAJI+XK1;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3eb6b16f1a0so403301b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733851990; x=1734456790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JxapN/KBUzSwOvPFPj7Nq7QToJJ6t4lVvQV4HaMQjf4=;
        b=iAJI+XK1ZuG1/l0nc14ZtWxVH6PCL7MfKNGy60ZgUcN1hwjeznF3ZngqXmNz+p/gv2
         K3EJpcua+fKF56yzV3bh1/XxICqbUNj/3AeTOYnSvQDE93MA3WTy8lK2ik5D7QJTSzaV
         mmiy7gYIsIpHX85MrBRr/GZYYlSEXqnUWpBM0QDLeEWceJnLIue9/kygsKoWoWudCPMF
         51UPxWUXh0R4wda91x96vfwzu/lGhoPHLxgcIkeMmTokGMpjH5nQHx1Hgi2HbLW4CEvn
         lKZCXyEQmofeVzGzM0eSxcNLdOllWSM3p7dQ1b9kwYyWI6ZAfVOaj7jaJ2t60XyWA4YE
         30Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851990; x=1734456790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxapN/KBUzSwOvPFPj7Nq7QToJJ6t4lVvQV4HaMQjf4=;
        b=akpvLxAXTTLpNEt8TDygmciu/nevBkt7qjEuWfQOQskgOIHPvc9BqStR8zCWOfp63e
         iZgqcMYKBOmlnsN13IU0M7aPSjsbXrJxkwdRVk4vlZdXFt+9uYK9kkj9PxN0XhE9yvKv
         uDymNYla4R8hCMScd4HLPK8KCPcRrursxFzVqfqGUVyjsECGGKMGIBlEzy6wH2dONDJf
         rSLQO6D3c5D8TQ3vAycFhdfPorLlMTndGr9yzRukH4lhDjFqcJMaziJYZHV5wIIuCyRs
         sO/XVl2yhysV5i+i5B4Y5rDoe4n9mCVqem4GsGUhNrMScLWce8m+BfpPv4GZE8l75SUE
         Wetg==
X-Gm-Message-State: AOJu0YxgQYcH9SguskHsw2GKE0JOXAaO5IwiDSMGvU59R9TgT2hRgmTZ
	N5HdB6Cg5IcbQ9IezVlJ/SBPyNcRN9SaFpFn4bmj1ytDJfA0w841rCAwug==
X-Gm-Gg: ASbGnctGeXMTSOzHiXA15xICO81cbx44QI0/qNTGozLKEFHVyoV0LIrm5z4vN3CD/h1
	Q5jcvmGd3gtUBDAdk+em9aD2K4r5VzuwUTrHVCFRkuhrpEKht7rQmfME1L6Y2wVdr/Ii5xZBJSE
	V0ikwm5P54Vn9QeyD+q4cDoDiJYP5uUs/SqvEetuBwSHRrPvsra1VGFkW4lEnWcaA3zueOyZuSW
	EfjCtOIcoV9pkWLrSvxh5TpPFeRB3oNoJvDsjpqeF3dqZKdY2pU
X-Google-Smtp-Source: AGHT+IGTWMT/6crqRRsbOGm5nj7YAelq2da75KOwfr4a2enrKvSK7VCU/8Nw+ngIs0PyOa8qoF0glg==
X-Received: by 2002:a05:6808:2121:b0:3e7:ac6a:213a with SMTP id 5614622812f47-3eb66f0ac3amr3124133b6e.28.1733851990404;
        Tue, 10 Dec 2024 09:33:10 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71df2d54bcdsm1211115a34.33.2024.12.10.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:33:09 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx 3.0: Rework how SPDX aliases are linked
Date: Tue, 10 Dec 2024 10:33:07 -0700
Message-ID: <20241210173307.1381828-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 17:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208542

The SPDX code needs to be able to look up an Element by its SPDX ID,
locating the file that (should) contain the SPDX ID and opening it for
parsing. Previously, the code would do this be hashing each Element
SPDX ID and Alias, and the creating a symbolic link to the file that
contains the element with a name of the hash.

This worked well as it was possible to look up any arbitrary SPDX ID or
alias by simply hashing it and following the symbolic link to get the
file. However, the down side of this approach is that it creates a lot
of symbolic links, since it will make one or two per Element in the
document. This can be a problem when using SPDX_INCLUDE_SOURCES, for
example.

This change reworks this strategy so that the only Element that gets a
symbolic link based on the hash is the singular SpdxDocument that is
create for each file. All other Elements are assigned an alias with a
special prefix that encodes the hash of SpdxDocument alias. Thus, when
attempting to look up an arbitrary alias, the code sees the special
prefix, extract the hash, opens the file based on the symlink with that
hash name, then finds the matching Element in the file. This drastically
reduces the number of symbolic links by making only one per file.

This also means that the custom link extension can be removed since it
is now superfluous.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py                | 159 ++++++++++-----------------
 meta/lib/oe/spdx30_tasks.py          |  60 ++++++----
 meta/lib/oeqa/selftest/cases/spdx.py |  22 ++--
 3 files changed, 106 insertions(+), 135 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 9a3b188dbbb..29cb9e45ad5 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -21,45 +21,8 @@ VEX_VERSION = "1.0.0"
 
 SPDX_BUILD_TYPE = "http://openembedded.org/bitbake"
 
-
-@oe.spdx30.register(OE_SPDX_BASE + "link-extension")
-class OELinkExtension(oe.spdx30.extension_Extension):
-    """
-    This custom extension controls if an Element creates a symlink based on
-    its SPDX ID in the deploy directory. Some elements may not be able to be
-    linked because they are duplicated in multiple documents (e.g. the bitbake
-    Build Element). Those elements can add this extension and set link_spdx_id
-    to False
-
-    It is in internal extension that should be removed when writing out a final
-    SBoM
-    """
-
-    CLOSED = True
-    INTERNAL = True
-
-    @classmethod
-    def _register_props(cls):
-        super()._register_props()
-        cls._add_property(
-            "link_spdx_id",
-            oe.spdx30.BooleanProp(),
-            OE_SPDX_BASE + "link-spdx-id",
-            min_count=1,
-            max_count=1,
-        )
-
-        # The symlinks written to the deploy directory are based on the hash of
-        # the SPDX ID. While this makes it easy to look them up, it can be
-        # difficult to trace a Element to the hashed symlink name. As a
-        # debugging aid, this property is set to the basename of the symlink
-        # when the symlink is created to make it easier to trace
-        cls._add_property(
-            "link_name",
-            oe.spdx30.StringProp(),
-            OE_SPDX_BASE + "link-name",
-            max_count=1,
-        )
+OE_ALIAS_PREFIX = "http://spdxdocs.org/openembedded-alias/by-doc-hash/"
+OE_DOC_ALIAS_PREFIX = "http://spdxdocs.org/openembedded-alias/doc/"
 
 
 @oe.spdx30.register(OE_SPDX_BASE + "id-alias")
@@ -185,18 +148,6 @@ def get_element_link_id(e):
     return e._id
 
 
-def set_alias(obj, alias):
-    for ext in obj.extension:
-        if not isinstance(ext, OEIdAliasExtension):
-            continue
-        ext.alias = alias
-        return ext
-
-    ext = OEIdAliasExtension(alias=alias)
-    obj.extension.append(ext)
-    return ext
-
-
 def get_alias(obj):
     for ext in obj.extension:
         if not isinstance(ext, OEIdAliasExtension):
@@ -206,6 +157,10 @@ def get_alias(obj):
     return None
 
 
+def hash_id(_id):
+    return hashlib.sha256(_id.encode("utf-8")).hexdigest()
+
+
 def to_list(l):
     if isinstance(l, set):
         l = sorted(list(l))
@@ -220,6 +175,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
     def __init__(self, d):
         super().__init__()
         self.d = d
+        self.alias_prefix = None
 
     def create_index(self):
         self.by_sha256_hash = {}
@@ -230,11 +186,10 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         if isinstance(obj, oe.spdx30.Element):
             if not obj._id:
                 raise ValueError("Element missing ID")
-            for ext in obj.extension:
-                if not isinstance(ext, OEIdAliasExtension):
-                    continue
-                if ext.alias:
-                    self.obj_by_id[ext.alias] = obj
+
+            alias_ext = get_alias(obj)
+            if alias_ext is not None and alias_ext.alias:
+                self.obj_by_id[alias_ext.alias] = obj
 
             for v in obj.verifiedUsing:
                 if not isinstance(v, oe.spdx30.Hash):
@@ -248,6 +203,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         super().add_index(obj)
         if isinstance(obj, oe.spdx30.SpdxDocument):
             self.doc = obj
+            alias_ext = get_alias(obj)
+            if alias_ext is not None and alias_ext.alias:
+                self.alias_prefix = OE_ALIAS_PREFIX + hash_id(alias_ext.alias) + "/"
 
     def __filter_obj(self, obj, attr_filter):
         return all(getattr(obj, k) == v for k, v in attr_filter.items())
@@ -307,6 +265,21 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         for o in self.foreach_type(oe.spdx30.Element):
             self.set_element_alias(o)
 
+    def new_alias_id(self, obj, replace):
+        unihash = self.d.getVar("BB_UNIHASH")
+        namespace = self.get_namespace() + "/"
+        if unihash not in obj._id:
+            bb.warn(f"Unihash {unihash} not found in {obj._id}")
+            return None
+
+        if namespace not in obj._id:
+            bb.warn(f"Namespace {namespace} not found in {obj._id}")
+            return None
+
+        return obj._id.replace(unihash, "UNIHASH").replace(
+            namespace, replace + self.d.getVar("PN")
+        )
+
     def remove_internal_extensions(self):
         def remove(o):
             o.extension = [e for e in o.extension if not getattr(e, "INTERNAL", False)]
@@ -334,21 +307,17 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
         alias_ext = get_alias(e)
         if alias_ext is None:
-            unihash = self.d.getVar("BB_UNIHASH")
-            namespace = self.get_namespace()
-            if unihash not in e._id:
-                bb.warn(f"Unihash {unihash} not found in {e._id}")
-            elif namespace not in e._id:
-                bb.warn(f"Namespace {namespace} not found in {e._id}")
-            else:
-                alias_ext = set_alias(
-                    e,
-                    e._id.replace(unihash, "UNIHASH").replace(
-                        namespace,
-                        "http://spdx.org/spdxdocs/openembedded-alias/"
-                        + self.d.getVar("PN"),
-                    ),
-                )
+            alias_id = self.new_alias_id(e, self.alias_prefix)
+            if alias_id is not None:
+                e.extension.append(OEIdAliasExtension(alias=alias_id))
+        elif (
+            alias_ext.alias
+            and not isinstance(e, oe.spdx30.SpdxDocument)
+            and not alias_ext.alias.startswith(self.alias_prefix)
+        ):
+            bb.warn(
+                f"Element {e._id} has alias {alias_ext.alias}, but it should have prefix {self.alias_prefix}"
+            )
 
     def new_spdxid(self, *suffix, include_unihash=True):
         items = [self.get_namespace()]
@@ -812,9 +781,17 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             _id=objset.new_spdxid("document", name),
             name=name,
         )
-        document.extension.append(OEIdAliasExtension())
-        document.extension.append(OELinkExtension(link_spdx_id=False))
+
+        document.extension.append(
+            OEIdAliasExtension(
+                alias=objset.new_alias_id(
+                    document,
+                    OE_DOC_ALIAS_PREFIX + d.getVar("PN") + "/" + name + "/",
+                ),
+            )
+        )
         objset.doc = document
+        objset.add_index(document)
 
         if copy_from_bitbake_doc:
             bb_objset = objset.import_bitbake_build_objset()
@@ -907,9 +884,7 @@ def jsonld_arch_path(d, arch, subdir, name, deploydir=None):
     return deploydir / arch / subdir / (name + ".spdx.json")
 
 
-def jsonld_hash_path(_id):
-    h = hashlib.sha256(_id.encode("utf-8")).hexdigest()
-
+def jsonld_hash_path(h):
     return Path("by-spdxid-hash") / h[:2], h
 
 
@@ -981,7 +956,7 @@ def write_recipe_jsonld_doc(
     dest = jsonld_arch_path(d, pkg_arch, subdir, objset.doc.name, deploydir=deploydir)
 
     def link_id(_id):
-        hash_path = jsonld_hash_path(_id)
+        hash_path = jsonld_hash_path(hash_id(_id))
 
         link_name = jsonld_arch_path(
             d,
@@ -1005,28 +980,9 @@ def write_recipe_jsonld_doc(
 
     try:
         if create_spdx_id_links:
-            for o in objset.foreach_type(oe.spdx30.Element):
-                if not o._id or o._id.startswith("_:"):
-                    continue
-
-                ext = None
-                for e in o.extension:
-                    if not isinstance(e, OELinkExtension):
-                        continue
-
-                    ext = e
-                    break
-
-                if ext is None:
-                    ext = OELinkExtension(link_spdx_id=True)
-                    o.extension.append(ext)
-
-                if ext.link_spdx_id:
-                    ext.link_name = link_id(o._id)
-
-                    alias_ext = get_alias(o)
-                    if alias_ext is not None and alias_ext.alias:
-                        alias_ext.link_name = link_id(alias_ext.alias)
+            alias_ext = get_alias(objset.doc)
+            if alias_ext is not None and alias_ext.alias:
+                alias_ext.link_name = link_id(alias_ext.alias)
 
     finally:
         # It is really helpful for debugging if the JSON document is written
@@ -1055,7 +1011,10 @@ def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, **attr_filter):
 
 
 def find_by_spdxid(d, spdxid, *, required=False):
-    return find_jsonld(d, *jsonld_hash_path(spdxid), required=required)
+    if spdxid.startswith(OE_ALIAS_PREFIX):
+        h = spdxid[len(OE_ALIAS_PREFIX) :].split("/", 1)[0]
+        return find_jsonld(d, *jsonld_hash_path(h), required=required)
+    return find_jsonld(d, *jsonld_hash_path(hash_id(spdxid)), required=required)
 
 
 def create_sbom(d, name, root_elements, add_objectsets=[]):
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 3d7035909f0..036c58bf4b3 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -56,6 +56,7 @@ def add_license_expression(d, objset, license_expression, license_data):
                 name=name,
             )
         )
+        objset.set_element_alias(lic)
         simple_license_text[name] = lic
 
         if name == "PD":
@@ -106,7 +107,9 @@ def add_license_expression(d, objset, license_expression, license_data):
 
         spdx_license = "LicenseRef-" + l
         if spdx_license not in license_text_map:
-            license_text_map[spdx_license] = add_license_text(l)._id
+            license_text_map[spdx_license] = oe.sbom30.get_element_link_id(
+                add_license_text(l)
+            )
 
         return spdx_license
 
@@ -277,7 +280,7 @@ def collect_dep_objsets(d, build):
     for dep in deps:
         bb.debug(1, "Fetching SPDX for dependency %s" % (dep.pn))
         dep_build, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
-            d, "recipes", dep.pn, oe.spdx30.build_Build
+            d, "recipes", "recipe-" + dep.pn, oe.spdx30.build_Build
         )
         # If the dependency is part of the taskhash, return it to be linked
         # against. Otherwise, it cannot be linked against because this recipe
@@ -461,7 +464,7 @@ def create_spdx(d):
     if not include_vex in ("none", "current", "all"):
         bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'all'")
 
-    build_objset = oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"))
+    build_objset = oe.sbom30.ObjectSet.new_objset(d, "recipe-" + d.getVar("PN"))
 
     build = build_objset.new_task_build("recipe", "recipe")
     build_objset.set_element_alias(build)
@@ -501,8 +504,11 @@ def create_spdx(d):
                 bb.debug(1, "Skipping %s since it is already fixed upstream" % cve)
                 continue
 
+            spdx_cve = build_objset.new_cve_vuln(cve)
+            build_objset.set_element_alias(spdx_cve)
+
             cve_by_status.setdefault(decoded_status["mapping"], {})[cve] = (
-                build_objset.new_cve_vuln(cve),
+                spdx_cve,
                 decoded_status["detail"],
                 decoded_status["description"],
             )
@@ -574,7 +580,7 @@ def create_spdx(d):
 
             bb.debug(1, "Creating SPDX for package %s" % pkg_name)
 
-            pkg_objset = oe.sbom30.ObjectSet.new_objset(d, pkg_name)
+            pkg_objset = oe.sbom30.ObjectSet.new_objset(d, "package-" + pkg_name)
 
             spdx_package = pkg_objset.add_root(
                 oe.spdx30.software_Package(
@@ -662,20 +668,21 @@ def create_spdx(d):
             for status, cves in cve_by_status.items():
                 for cve, items in cves.items():
                     spdx_cve, detail, description = items
+                    spdx_cve_id = oe.sbom30.get_element_link_id(spdx_cve)
 
-                    all_cves.add(spdx_cve._id)
+                    all_cves.add(spdx_cve_id)
 
                     if status == "Patched":
                         pkg_objset.new_vex_patched_relationship(
-                            [spdx_cve._id], [spdx_package]
+                            [spdx_cve_id], [spdx_package]
                         )
                     elif status == "Unpatched":
                         pkg_objset.new_vex_unpatched_relationship(
-                            [spdx_cve._id], [spdx_package]
+                            [spdx_cve_id], [spdx_package]
                         )
                     elif status == "Ignored":
                         spdx_vex = pkg_objset.new_vex_ignored_relationship(
-                            [spdx_cve._id],
+                            [spdx_cve_id],
                             [spdx_package],
                             impact_statement=description,
                         )
@@ -810,7 +817,7 @@ def create_package_spdx(d):
             d,
             pkg_arch,
             "packages-staging",
-            pkg_name,
+            "package-" + pkg_name,
             oe.spdx30.software_Package,
             software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.install,
         )
@@ -849,7 +856,7 @@ def create_package_spdx(d):
                 dep_spdx_package, _ = oe.sbom30.find_root_obj_in_jsonld(
                     d,
                     "packages-staging",
-                    dep_pkg,
+                    "package-" + dep_pkg,
                     oe.spdx30.software_Package,
                     software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.install,
                 )
@@ -949,13 +956,14 @@ def write_bitbake_spdx(d):
             )
 
     for obj in objset.foreach_type(oe.spdx30.Element):
-        obj.extension.append(oe.sbom30.OELinkExtension(link_spdx_id=False))
         obj.extension.append(oe.sbom30.OEIdAliasExtension())
 
     oe.sbom30.write_jsonld_doc(d, objset, deploy_dir_spdx / "bitbake.spdx.json")
 
 
 def collect_build_package_inputs(d, objset, build, packages):
+    import oe.sbom30
+
     providers = oe.spdx_common.collect_package_providers(d)
 
     build_deps = set()
@@ -972,11 +980,11 @@ def collect_build_package_inputs(d, objset, build, packages):
         pkg_spdx, _ = oe.sbom30.find_root_obj_in_jsonld(
             d,
             "packages",
-            pkg_name,
+            "package-" + pkg_name,
             oe.spdx30.software_Package,
             software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.install,
         )
-        build_deps.add(pkg_spdx._id)
+        build_deps.add(oe.sbom30.get_element_link_id(pkg_spdx))
 
     if missing_providers:
         bb.fatal(
@@ -1002,7 +1010,9 @@ def create_rootfs_spdx(d):
     with root_packages_file.open("r") as f:
         packages = json.load(f)
 
-    objset = oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename, machine))
+    objset = oe.sbom30.ObjectSet.new_objset(
+        d, "%s-%s-rootfs" % (image_basename, machine)
+    )
 
     rootfs = objset.add_root(
         oe.spdx30.software_Package(
@@ -1030,6 +1040,8 @@ def create_rootfs_spdx(d):
 
 
 def create_image_spdx(d):
+    import oe.sbom30
+
     image_deploy_dir = Path(d.getVar("IMGDEPLOYDIR"))
     manifest_path = Path(d.getVar("IMAGE_OUTPUT_MANIFEST"))
     spdx_work_dir = Path(d.getVar("SPDXIMAGEWORK"))
@@ -1037,7 +1049,9 @@ def create_image_spdx(d):
     image_basename = d.getVar("IMAGE_BASENAME")
     machine = d.getVar("MACHINE")
 
-    objset = oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename, machine))
+    objset = oe.sbom30.ObjectSet.new_objset(
+        d, "%s-%s-image" % (image_basename, machine)
+    )
 
     with manifest_path.open("r") as f:
         manifest = json.load(f)
@@ -1090,7 +1104,7 @@ def create_image_spdx(d):
         rootfs_image, _ = oe.sbom30.find_root_obj_in_jsonld(
             d,
             "rootfs",
-            "%s-%s" % (image_basename, machine),
+            "%s-%s-rootfs" % (image_basename, machine),
             oe.spdx30.software_Package,
             # TODO: Should use a purpose to filter here?
         )
@@ -1098,7 +1112,7 @@ def create_image_spdx(d):
             builds,
             oe.spdx30.RelationshipType.hasInput,
             oe.spdx30.LifecycleScopeType.build,
-            [rootfs_image._id],
+            [oe.sbom30.get_element_link_id(rootfs_image)],
         )
 
     objset.add_aliases()
@@ -1107,6 +1121,8 @@ def create_image_spdx(d):
 
 
 def create_image_sbom_spdx(d):
+    import oe.sbom30
+
     image_name = d.getVar("IMAGE_NAME")
     image_basename = d.getVar("IMAGE_BASENAME")
     image_link_name = d.getVar("IMAGE_LINK_NAME")
@@ -1121,17 +1137,17 @@ def create_image_sbom_spdx(d):
     rootfs_image, _ = oe.sbom30.find_root_obj_in_jsonld(
         d,
         "rootfs",
-        "%s-%s" % (image_basename, machine),
+        "%s-%s-rootfs" % (image_basename, machine),
         oe.spdx30.software_Package,
         # TODO: Should use a purpose here?
     )
-    root_elements.append(rootfs_image._id)
+    root_elements.append(oe.sbom30.get_element_link_id(rootfs_image))
 
     image_objset, _ = oe.sbom30.find_jsonld(
-        d, "image", "%s-%s" % (image_basename, machine), required=True
+        d, "image", "%s-%s-image" % (image_basename, machine), required=True
     )
     for o in image_objset.foreach_root(oe.spdx30.software_File):
-        root_elements.append(o._id)
+        root_elements.append(oe.sbom30.get_element_link_id(o))
 
     objset, sbom = oe.sbom30.create_sbom(d, image_name, root_elements)
 
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 9b35793d139..f3b955ed2b4 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -143,35 +143,31 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
     def test_base_files(self):
         self.check_recipe_spdx(
             "base-files",
-            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/base-files.spdx.json",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/package-base-files.spdx.json",
         )
 
-
     def test_gcc_include_source(self):
-        import oe.spdx30
-
         objset = self.check_recipe_spdx(
             "gcc",
-            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/gcc.spdx.json",
-            extraconf=textwrap.dedent(
-                """\
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/recipes/recipe-gcc.spdx.json",
+            extraconf="""\
                 SPDX_INCLUDE_SOURCES = "1"
-                """
-            ),
+                """,
         )
 
         gcc_pv = get_bb_var("PV", "gcc")
-        filename = f'gcc-{gcc_pv}/README'
+        filename = f"gcc-{gcc_pv}/README"
         found = False
         for software_file in objset.foreach_type(oe.spdx30.software_File):
             if software_file.name == filename:
                 found = True
-                self.logger.info(f"The spdxId of {filename} in gcc.spdx.json is {software_file.spdxId}")
+                self.logger.info(
+                    f"The spdxId of {filename} in recipe-gcc.spdx.json is {software_file.spdxId}"
+                )
                 break
 
         self.assertTrue(
-            found,
-            f"Not found source file {filename} in gcc.spdx.json\n"
+            found, f"Not found source file {filename} in recipe-gcc.spdx.json\n"
         )
 
     def test_core_image_minimal(self):
-- 
2.47.1


