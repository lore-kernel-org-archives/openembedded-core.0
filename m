Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D43CCD185
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 14:20:27 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.1631.1760019619569235509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 07:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eCvIZg+x;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-639e34ffa69so1468670a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 07:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760019618; x=1760624418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X1Zc0yxK6irjad7yscZJecYz5esZYVF4RHU0EV6ngko=;
        b=eCvIZg+xNSFAmTnZQIQD+7PB6ewgVSyOERokoFM4KgkO2/++faXzRf4n9h6lzw1aIC
         Oc8Zz4zOrYWm9K9ZAQUCg98FH03j8p0pwRF9b2jy9XJawwOL1eRqgiOm2OfTCqHwFgb8
         CDS9f5K8tk9WU8joOzC250GmEqE1wvjAFsxm/sLzjSQizjV/M1YF3POzSmwRV9oCnCmv
         9ZStfxj2jv5ryJDiCptJ81hLYuX6+VESfZN5m7NIYXgZQ0HMrh9CyQJv2PTedAhs9dQH
         Ff9rWkpqL2B+VSY7UviCERvi9lh13/GiZw+Bj5jHVmxq6Kuvkmh1IW64U+0S9eT5n/Sz
         8tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760019618; x=1760624418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1Zc0yxK6irjad7yscZJecYz5esZYVF4RHU0EV6ngko=;
        b=bq+rGRjL+tuTPGLbHt4doKljQoa1wvfbpt8RQ4FKx1vjkizlPEBm295HMfZUz3xJGL
         //W/rpDh+RQytZlgJ6PBsdqmAIMKNMPuwwND+zdlMP4arXp3nfaMtcMfyl6pl5JVopHH
         07V8igml9O2batrCeirzsAW0LcV+aGzrsEVVX4AicSM18vZbriiH/mrdWdDJJYftZf0+
         who+QNKhcy6fsijyzs3PgELDxGVKoyNEj3m2rcDZjdf/zkL6yIH0HdMAXohnDaF/YHvt
         uP0XwnsxDfFHhAIJmEoK2QhAHCNsN7Ux7i+rqVqgdGkr6piItWDEh41IsFQBXvBgoG2b
         m/KQ==
X-Gm-Message-State: AOJu0YwlzFZQZqAI/8yfVUzVjlL/kzg6nno2BHOymhvYxh4yaDk8WSZv
	drGCIxXHGjNJJBdJ7qyt6MvkwnPal8Kmp9bGLRwsJzRjAbjxdsWOwGh7JdgjzQ==
X-Gm-Gg: ASbGncso3t/nQ1dBz3aBBRXXvsq3eBxYwwmT1IsP2ZltWFjuZV1EJPq7+vbNv4HkMsb
	vRN7h+SSdx+OHyw7MLlYBb5ml+rNkoKh+838XyAF+whh5gIBdIeKJFT9pfdAc2uFGx/GleWbyiW
	mXaMN+Iyxt2jUX9K0eoXkTK6UGg4nDiT+H3ic4Di0PjDGts0GjwVSi/c1qgfcVpcVwbTdgC42zE
	ZQyy2C6FOLi19NfyCGt504uZYbWFwxZ2wVLjgGft9wKeTKvW13NQw8fsgUDp+t9d0+T8Zbz4BcU
	Y6iOD9UtsdevJsidrmp9kOFdyGeeyMi73wYWwKAArfrxjJIKkbcCYZeob4Xkxg4zP17dil42euz
	MMHKgDDkjakzftz4rdZpyjAnq5J0ZYtomSAOVbGT1xG11
X-Google-Smtp-Source: AGHT+IG9IIHhxCdwgkL4Vj+KtCZWf090fAaZfvT77/ZaXHEbUH+q8xaLAHrjK8Du9FXPXxLqgm+FeQ==
X-Received: by 2002:a05:6402:1256:b0:639:6ecb:9846 with SMTP id 4fb4d7f45d1cf-639d5c75cd9mr5615580a12.34.1760019617497;
        Thu, 09 Oct 2025 07:20:17 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f40db780sm2468362a12.35.2025.10.09.07.20.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:20:17 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v2] cargo_common.bbclass: use source replacement instead of dependency patching
Date: Thu,  9 Oct 2025 16:20:16 +0200
Message-ID: <20251009142016.3244170-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 14:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224614

Cargo.toml files usually contain a list of dependencies in one of two forms:
either a crate name that can be fetched from some registry (like crates.io), or
as a source crate, which is most often fetched from a git repository.

Normally cargo handles fetching the crates from both the registry and from git,
however with Yocto this task is taken over by Bitbake.

After fetching these crates, they are made available to cargo by adding the location
to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
that can be found in the SRC_URI is added as one source crate.

This works most of the time, as long as the repository really contains one crate only.

However in case the repository is a cargo workspace, it contains multiple crates in
different subfolders, and in order to allow cargo to process them, they need to be
listed separately. This is not happening with the current implementation of cargo_common.

This change introduces the following:
- instead of patching the dependencies, use source replacement (the primary motivation for
  this was that maturin seems to ignore source crate patches from config.toml)
- the above also allows to keep the original Cargo.lock untouched (the original implementation
  deleted git repository lines from it)
- it adds a new folder, tentatively called ${UNPACKDIR}/yocto-vendored-source-crates. During processing
  the separate crate folders are copied into this folder, and it is used as the central
  vendoring folder. This is needed for source replacements: the folder that is used for
  vendoring needs to contain the crates separately, one crate in one folder. Each folder
  has the name of the crate that it contains. Workspaces are not included here (unless the
  given manifest is a workspace AND a package at once)
- previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
  to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
  Having destsuffix is still mandatory though.

The change does not handle nested workspaces, only the top level Cargo.toml is processed.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2:
- removed tomllib, because it was added to Python in 3.11, and it doesn't exist in 3.9 yet
- added purpose-specific, minimal TOML parser functions instead
  (extract_git_repos_from_lockfile, extract_ws_members, 
  extract_package_name, is_package, is_workspace)
- workspace member paths can contain wildcards. This wasn't handled
  in v1. Now the path is first resolved with glob.
- Add the new folder to the cleandirs of do_configure
- When trying to create the new vendoring folder, don't fail if the folder
  exists already.
- Fix a bug that failed the build in case there was no Cargo.lock present in 
  the main project.
- added some logs

v1: https://lore.kernel.org/openembedded-core/469.1760012328302936344@lists.openembedded.org/T/


 meta/classes-recipe/cargo_common.bbclass | 232 ++++++++++++++++++-----
 1 file changed, 184 insertions(+), 48 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index c9eb2d09a5..6056248cfd 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -127,8 +127,112 @@ cargo_common_do_configure () {
 }
 
 python cargo_common_do_patch_paths() {
+    import glob
     import shutil
 
+    def is_workspace_or_package(f, workspace_or_package):
+        """
+        Checks if the manifest contains [workspace] or [package] header
+        f is a file-like cargo manifest, workspace_or_package is a string,
+        either 'workspace' or 'package'
+        """
+
+        f.seek(0)
+        for line in f.readlines():
+            if line.strip() == '[%s]' % workspace_or_package:
+                return True
+        return False
+
+    def is_package(f):
+        return is_workspace_or_package(f, 'package')
+
+    def is_workspace(f):
+        return is_workspace_or_package(f, 'workspace')
+
+    def extract_package_name(f):
+        """Extract crate name"""
+        f.seek(0)
+        found_package_header = False
+        for line in f.readlines():
+            if not found_package_header and line.strip() == '[package]':
+                found_package_header = True
+                continue
+            if found_package_header and line.strip().startswith('name ='):
+                return line.split('=')[1].strip().strip('"')
+
+    def extract_ws_members(f):
+        """
+        Find the [workspace] header in the file, and then find the 'members' key. Then
+        extract all the elements from the corresponding array, unless it's a comment.
+        f should a file-like object of the Cargo manifest.
+        """
+
+        import re
+        f.seek(0)
+        found_ws_header = False
+        found_members_start = False
+        ws_members = []
+        # regex to extract something from between two double-quotes
+        member_regex = r'\"([^\"]+)\"'
+
+        for line in f.readlines():
+            if not found_ws_header and line.strip() == '[workspace]':
+                found_ws_header = True
+                continue
+            if found_ws_header and not found_members_start and line.strip().startswith('members'):
+                found_members_start = True
+            if found_members_start and not line.strip().startswith('#'):
+                matches = re.findall(member_regex, line)
+                ws_members.extend(matches)
+                # the end of the member list
+                if ']' in line:
+                    break
+        bb.note("Extracted workspace members: %s" % ws_members)
+        return ws_members
+
+    def extract_git_repos_from_lockfile(f):
+        """Return a list of repositories that start with 'git+' protocol from Cargo.lock"""
+        f.seek(0)
+        repos = []
+        for line in f.readlines():
+            if line.startswith('source = "git+'):
+                repos.append(line.split('"')[1])
+        bb.note("Extracted git repos: %s" % repos)
+        return repos
+
+    def is_rust_crate_folder(path):
+        cargo_toml_path = os.path.join(path, 'Cargo.toml')
+        return os.path.exists(cargo_toml_path)
+
+    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
+        for lf_repo in lockfile_repos.keys():
+            if repo in lf_repo and lf_repo.endswith(revision):
+                lockfile_repos[lf_repo] = True
+                return lf_repo.split("#")[0]
+        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
+
+    def create_cargo_checksum(folder_path):
+        bb.note("Creating cargo checksum for %s" % folder_path)
+        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
+        if os.path.exists(checksum_path):
+            return
+
+        import hashlib, json
+
+        checksum = {'files': {}}
+        for root, _, files in os.walk(folder_path):
+            for f in files:
+                full_path = os.path.join(root, f)
+                relative_path = os.path.relpath(full_path, folder_path)
+                if relative_path.startswith(".git/"):
+                    continue
+                with open(full_path, 'rb') as f2:
+                    file_sha = hashlib.sha256(f2.read()).hexdigest()
+                checksum["files"][relative_path] = file_sha
+
+        with open(checksum_path, 'w') as f:
+            json.dump(checksum, f)
+
     cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
     if not os.path.exists(cargo_config):
         return
@@ -137,66 +241,98 @@ python cargo_common_do_patch_paths() {
     if len(src_uri) == 0:
         return
 
-    patches = dict()
+    sources = dict()
     workdir = d.getVar('UNPACKDIR')
     fetcher = bb.fetch2.Fetch(src_uri, d)
-    for url in fetcher.urls:
-        ud = fetcher.ud[url]
-        if ud.type == 'git' or ud.type == 'gitsm':
-            name = ud.parm.get('name')
-            destsuffix = ud.parm.get('destsuffix')
-            if name is not None and destsuffix is not None:
-                if ud.user:
-                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
-                else:
-                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
-                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
-                patches.setdefault(repo, []).append(path)
 
-    with open(cargo_config, "a+") as config:
-        for k, v in patches.items():
-            print('\n[patch."%s"]' % k, file=config)
-            for name in v:
-                print(name, file=config)
+    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
 
-    if not patches:
-        return
+    os.makedirs(vendor_folder, exist_ok=True)
 
-    # Cargo.lock file is needed for to be sure that artifacts
-    # downloaded by the fetch steps are those expected by the
-    # project and that the possible patches are correctly applied.
-    # Moreover since we do not want any modification
-    # of this file (for reproducibility purpose), we prevent it by
-    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
-    # here is better than letting cargo tell (in case the file is missing)
-    # "Cargo.lock should be modified but --frozen was given"
+    for url in fetcher.urls:
+        ud = fetcher.ud[url]
+        if ud.type != 'git' and ud.type != 'gitsm':
+            continue
+
+        destsuffix = ud.parm.get('destsuffix')
+        crate_folder = os.path.join(workdir, destsuffix)
+
+        if destsuffix is None or not is_rust_crate_folder(crate_folder):
+            continue
+
+        if ud.user:
+            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
+        else:
+            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
+
+        sources[destsuffix] = (repo, ud.revision, crate_folder)
+
+        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
+        cargo_toml_file = open(cargo_toml_path, 'r')
+
+        if is_workspace(cargo_toml_file):
+            bb.note("%s is a workspace" % cargo_toml_path)
+            members = extract_ws_members(cargo_toml_file)
+            for member in members:
+                # "member" is a relative path, and can contain wildcards
+                unglobbed_member_crate_folder = os.path.join(workdir, destsuffix, member)
+                for member_crate_folder in glob.glob(unglobbed_member_crate_folder):
+                    bb.note("Processing member: %s" % member_crate_folder)
+                    if not is_rust_crate_folder(member_crate_folder):
+                        bb.note("%s has no Cargo.toml, skipping" % member_crate_folder)
+                        continue
+
+                    member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
+                    with open(member_crate_cargo_toml) as mcct:
+                        member_crate_name = extract_package_name(mcct)
+                    shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
+
+        if is_package(cargo_toml_file):
+            bb.note("%s is a package" % cargo_toml_path)
+            crate_folder = os.path.join(workdir, destsuffix)
+            crate_name = extract_package_name(cargo_toml_file)
+            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
+
+        cargo_toml_file.close()
+
+    if len(sources) == 0:
+        return
 
     lockfile = d.getVar("CARGO_LOCK_PATH")
     if not os.path.exists(lockfile):
         bb.fatal(f"{lockfile} file doesn't exist")
 
-    # There are patched files and so Cargo.lock should be modified but we use
-    # --frozen so let's handle that modifications here.
-    #
-    # Note that a "better" (more elegant ?) would have been to use cargo update for
-    # patched packages:
-    #  cargo update --offline -p package_1 -p package_2
-    # But this is not possible since it requires that cargo local git db
-    # to be populated and this is not the case as we fetch git repo ourself.
-
-    lockfile_orig = lockfile + ".orig"
-    if not os.path.exists(lockfile_orig):
-        shutil.copy(lockfile, lockfile_orig)
-
-    newlines = []
-    with open(lockfile_orig, "r") as f:
-        for line in f.readlines():
-            if not line.startswith("source = \"git"):
-                newlines.append(line)
+    # key is the repo url, value is a boolean, which is used later
+    # to indicate if there is a matching repository in SRC_URI also
+    lockfile_git_repos = {}
+    with open(lockfile, 'r') as lf:
+        lockfile_git_repos = {repo_url: False for repo_url in extract_git_repos_from_lockfile(lf)}
+
+    for d in os.scandir(vendor_folder):
+        if d.is_dir():
+            create_cargo_checksum(d.path)
+
+
+    with open(cargo_config, "a+") as config:
+        print('\n[source."yocto-vendored-sources"]', file=config)
+        print('directory = "%s"' % vendor_folder, file=config)
+
+        for destsuffix, (repo, revision, repo_path) in sources.items():
+            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
+            print('\n[source."%s"]' % lockfile_repo, file=config)
+            print('git = "%s"' % repo, file=config)
+            print('rev = "%s"' % revision, file=config)
+            print('replace-with = "yocto-vendored-sources"', file=config)
+
+    # check if there are any git repos in the lock file that were not visited
+    # in the previous loop, when the source replacement was created, and warn about it
+    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
+        if not found_in_src_uri:
+            bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
 
-    with open(lockfile, "w") as f:
-        f.writelines(newlines)
 }
+
+do_configure[cleandirs] += "${UNPACKDIR}/yocto-vendored-source-crates"
 do_configure[postfuncs] += "cargo_common_do_patch_paths"
 
 do_compile:prepend () {

