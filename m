Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B28C3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 14:31:31 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.7362.1703341884064348425
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Dec 2023 06:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cx3ZdXgU;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33697caf9a6so716220f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 06:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703341882; x=1703946682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NmdIhk04KbRDf6uqljXBpyx9hpzumtfeFoSeJwIwvCk=;
        b=Cx3ZdXgU9dCptAshwWTGiecRSS06QtbJOclNn1owroCCINXn/9amCfqb5HGYU+aseO
         aFSTegI+n8WcsPhGhKiw4qyesEV5NBGPZ0oPC9RqNYalpgGUfgGQgwZwOXP7wIC8t06w
         /kP0HwF4LdKrwGFi3MgKySlr9Elb2bbNYmI8xRXs/73Jp+k3+65kysBJ6aKjA50OYVOu
         fgHFJRrmwzfQUL0IV8mpwQT/bdcyQ8AaN1sFZWiNW2pO5W+g82n6qxpNKEEOIodQgcfN
         ILkAHLYTUrhnynas3yEugxgUB1cOZw3l1x2BjCY5NX6kXO3fqMGgCwXdKUlolR3v5T4F
         n2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703341882; x=1703946682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmdIhk04KbRDf6uqljXBpyx9hpzumtfeFoSeJwIwvCk=;
        b=PWzx1+O7PtqjoTiaVS8nbFlONikPrKepGT81uoVpLg9re69slRfUXBFEQoS8a5dil+
         TMYNvMagyrrby+yHcjm0r6P0JzzALjmwf9tC8J3odk8kush9bX2w4dM9Osif5H/+WjC1
         CVepLLDAZ5Ohs81LtGbFoPxgN5kbBpfs8E+fJf9K6sKg0TVKggIwKJoPfDQHQe3jb26R
         rM9BnOGr55xoiX3uWJYFXpeGGTO5o1uGDhpmE2mMtzVB24b9e6g1TcteTYWeEXTZ4V9i
         LA8OACXj6oYbgT4XvEdUPtTmJqy+VGbRcKja7S67KC9GErSTzA+hPKFCpGYAHdmVlSbu
         JauQ==
X-Gm-Message-State: AOJu0Yyvt1uhEJd/400T5D1nK8hBnyws7WzCkp9Js6vndAxyP6++5NXD
	m8IaKzYcrM0OgQj6DKp/OYQVzLPLk8I=
X-Google-Smtp-Source: AGHT+IHq1UYbe3IgSR7c+bh90xOFl18Ji1uOEfrDG6cNMuL98vP4RhGw06pdJ/vujGqiipzVfOKPaA==
X-Received: by 2002:adf:e403:0:b0:336:4435:724c with SMTP id g3-20020adfe403000000b003364435724cmr1916840wrm.17.1703341881421;
        Sat, 23 Dec 2023 06:31:21 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:d9e2:102b:56b1:9620])
        by smtp.gmail.com with ESMTPSA id e14-20020a5d530e000000b0033668ac65ddsm6574102wrv.25.2023.12.23.06.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 06:31:21 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v2] sstate-cache-management: Rewrite in python
Date: Sat, 23 Dec 2023 14:31:18 +0000
Message-Id: <20231223143119.30097-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 14:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192884

This (should be) a drop in replacement for sstate-cache-management.sh.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
This is hopefully an option compatible drop in for the existing shell
sstate-cache-management script. It's orders of magnitude faster, for
example removing duplicates, with a warmed cache across a more or less
vanilla poky build:

shell: 24.55s
python: 0.63s

Running on an NFS mount with 1000s of objects the improvement is even
more marked.

There are differences in the lists of things which are removed, but all
examples I've found are things where the shell failed to remove things
it could.

There's an additional option to remove orphan siginfo files, which I
found quite a lot of during testing.

The --extra-archs and --extra-layer options are unimplemented since, as
far as I could work out, they were really implementation artefacts of
the existing script - there's a couple of functions I implemented which
generate this data, but I really couldn't see anywhere I actually needed
it; these want deleting if this goes beyond RFC.

Similary the --follow-symlink option is unimplemented as that appears to
an sstate-cache implementation detail which is no longer used.

The couple of TODOs left are all about more parallelisation, I expect
neither of them is as big a win as parallelising the stat()ing of all
the paths was (especially when running over NFS).

Changes in v2:
- Actually send the right version with working unlink() :|

 scripts/sstate-cache-management.py | 329 +++++++++++++++++++++++++++++
 1 file changed, 329 insertions(+)
 create mode 100755 scripts/sstate-cache-management.py

diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-management.py
new file mode 100755
index 000000000000..09b7aa2aefd8
--- /dev/null
+++ b/scripts/sstate-cache-management.py
@@ -0,0 +1,329 @@
+#!/usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import argparse
+import os
+import re
+import sys
+
+from collections import defaultdict
+from concurrent.futures import ThreadPoolExecutor
+from dataclasses import dataclass
+from pathlib import Path
+
+if sys.version_info < (3, 8, 0):
+    raise RuntimeError("Sorry, python 3.8.0 or later is required for this script.")
+
+SSTATE_PREFIX = "sstate:"
+SSTATE_EXTENSION = ".tar.zst"
+# SSTATE_EXTENSION = ".tgz"
+# .siginfo.done files are mentioned in the original script?
+SSTATE_SUFFIXES = (
+    SSTATE_EXTENSION,
+    f"{SSTATE_EXTENSION}.siginfo",
+    f"{SSTATE_EXTENSION}.done",
+)
+
+RE_SSTATE_PKGSPEC = re.compile(
+    rf"""sstate:(?P<pn>[^:]*):
+         (?P<package_target>[^:]*):
+         (?P<pv>[^:]*):
+         (?P<pr>[^:]*):
+         (?P<sstate_pkgarch>[^:]*):
+         (?P<sstate_version>[^_]*):
+         (?P<bb_unihash>[^_]*)_
+         (?P<bb_task>[^:]*)
+         (?P<ext>({"|".join([re.escape(s) for s in SSTATE_SUFFIXES])}))$""",
+    re.X,
+)
+
+
+# Really we'd like something like a Path subclass which implements a stat
+# cache here, unfortunately there's no good way to do that transparently
+# (yet); see:
+#
+# https://github.com/python/cpython/issues/70219
+# https://discuss.python.org/t/make-pathlib-extensible/3428/77
+@dataclass
+class SstateEntry:
+    """Class for keeping track of an entry in sstate-cache."""
+
+    path: Path
+    match: re.Match
+    stat_result: os.stat_result = None
+
+    def __hash__(self):
+        return self.path.__hash__()
+
+    def __getattr__(self, name):
+        return self.match.group(name)
+
+
+# this is what's in the original script; as far as I can tell, it's an
+# implementation artefact which we don't need?
+def find_archs():
+    # all_archs
+    builder_arch = os.uname().machine
+
+    # FIXME
+    layer_paths = [Path("../..")]
+
+    tune_archs = set()
+    re_tune = re.compile(r'AVAILTUNES .*=.*"(.*)"')
+    for path in layer_paths:
+        for tunefile in [
+            p for p in path.glob("meta*/conf/machine/include/**/*") if p.is_file()
+        ]:
+            with open(tunefile) as f:
+                for line in f:
+                    m = re_tune.match(line)
+                    if m:
+                        tune_archs.update(m.group(1).split())
+
+    # all_machines
+    machine_archs = set()
+    for path in layer_paths:
+        for machine_file in path.glob("meta*/conf/machine/*.conf"):
+            machine_archs.add(machine_file.parts[-1][:-5])
+
+    extra_archs = set()
+    all_archs = (
+        set(
+            arch.replace("-", "_")
+            for arch in machine_archs | tune_archs | set(["allarch", builder_arch])
+        )
+        | extra_archs
+    )
+
+    print(all_archs)
+
+
+# again, not needed?
+def find_tasks():
+    print(set([p.bb_task for p in paths]))
+
+
+def collect_sstate_paths(args):
+    def scandir(path, paths):
+        # Assume everything is a directory; by not checking we avoid needing an
+        # additional stat which is potentially a synchronous roundtrip over NFS
+        try:
+            for p in path.iterdir():
+                filename = p.parts[-1]
+                if filename.startswith(SSTATE_PREFIX):
+                    if filename.endswith(SSTATE_SUFFIXES):
+                        m = RE_SSTATE_PKGSPEC.match(p.parts[-1])
+                        assert m
+                        paths.add(SstateEntry(p, m))
+                    # ignore other things (includes things like lockfiles)
+                else:
+                    scandir(p, paths)
+
+        except NotADirectoryError:
+            pass
+
+    paths = set()
+    # TODO: parellise scandir
+    scandir(Path(args.cache_dir), paths)
+
+    def path_stat(p):
+        p.stat_result = p.path.lstat()
+
+    if args.remove_duplicated:
+        # This is probably slightly performance negative on a local filesystem
+        # when we interact with the GIL; over NFS it's a massive win.
+        with ThreadPoolExecutor(max_workers=args.jobs) as executor:
+            executor.map(path_stat, paths)
+
+    return paths
+
+
+def remove_by_stamps(args, paths):
+    all_sums = set()
+    for stamps_dir in args.stamps_dir:
+        stamps_path = Path(stamps_dir)
+        assert stamps_path.is_dir()
+        re_sigdata = re.compile(r"do_.*.sigdata\.([^.]*)")
+        all_sums |= set(
+            [
+                re_sigdata.search(x.parts[-1]).group(1)
+                for x in stamps_path.glob("*/*/*.do_*.sigdata.*")
+            ]
+        )
+        re_setscene = re.compile(r"do_.*_setscene\.([^.]*)")
+        all_sums |= set(
+            [
+                re_setscene.search(x.parts[-1]).group(1)
+                for x in stamps_path.glob("*/*/*.do_*_setscene.*")
+            ]
+        )
+    return [p for p in paths if p.bb_unihash not in all_sums]
+
+
+def remove_duplicated(args, paths):
+    # Skip populate_lic as it produces duplicates in a normal build
+    #
+    # 9ae16469e707 sstate-cache-management: skip populate_lic archives when removing duplicates
+    valid_paths = [p for p in paths if p.bb_task != "populate_lic"]
+
+    keep = dict()
+    remove = list()
+    for p in valid_paths:
+        sstate_sig = ":".join([p.pn, p.sstate_pkgarch, p.bb_task, p.ext])
+        if sstate_sig not in keep:
+            keep[sstate_sig] = p
+        elif p.stat_result.st_mtime > keep[sstate_sig].stat_result.st_mtime:
+            remove.append(keep[sstate_sig])
+            keep[sstate_sig] = p
+        else:
+            remove.append(p)
+
+    return remove
+
+
+def remove_orphans(args, paths):
+    remove = list()
+    pathsigs = defaultdict(list)
+    for p in paths:
+        sstate_sig = ":".join([p.pn, p.sstate_pkgarch, p.bb_task])
+        pathsigs[sstate_sig].append(p)
+    for k, v in pathsigs.items():
+        if len([p for p in v if p.ext == SSTATE_EXTENSION]) == 0:
+            remove.extend(v)
+    return remove
+
+
+def parse_arguments():
+    parser = argparse.ArgumentParser(description="sstate cache management utility.")
+
+    parser.add_argument(
+        "--cache-dir",
+        default=os.environ.get("SSTATE_CACHE_DIR"),
+        help="""Specify sstate cache directory, will use the environment
+            variable SSTATE_CACHE_DIR if it is not specified.""",
+    )
+
+    # parser.add_argument(
+    #     "--extra-archs",
+    #     help="""Specify list of architectures which should be tested, this list
+    #         will be extended with native arch, allarch and empty arch. The
+    #         script won't be trying to generate list of available archs from
+    #         AVAILTUNES in tune files.""",
+    # )
+
+    # parser.add_argument(
+    #     "--extra-layer",
+    #     help="""Specify the layer which will be used for searching the archs,
+    #         it will search the meta and meta-* layers in the top dir by
+    #         default, and will search meta, meta-*, <layer1>, <layer2>,
+    #         ...<layern> when specified. Use "," as the separator.
+    #
+    #         This is useless for --stamps-dir or when --extra-archs is used.""",
+    # )
+
+    parser.add_argument(
+        "-d",
+        "--remove-duplicated",
+        action="store_true",
+        help="""Remove the duplicated sstate cache files of one package, only
+            the newest one will be kept. The duplicated sstate cache files
+            of one package must have the same arch, which means sstate cache
+            files with multiple archs are not considered duplicate.
+
+            Conflicts with --stamps-dir.""",
+    )
+
+    parser.add_argument(
+        "--remove-orphans",
+        action="store_true",
+        help=f"""Remove orphan siginfo files from the sstate cache, i.e. those
+            where this is no {SSTATE_EXTENSION} file but there are associated
+            tracking files.""",
+    )
+
+    parser.add_argument(
+        "--stamps-dir",
+        action="append",
+        help="""Specify the build directory's stamps directories, the sstate
+            cache file which IS USED by these build diretories will be KEPT,
+            other sstate cache files in cache-dir will be removed. Can be
+            specified multiple times for several directories.
+
+            Conflicts with --remove-duplicated.""",
+    )
+
+    parser.add_argument(
+        "-j", "--jobs", default=8, type=int, help="Run JOBS jobs in parallel."
+    )
+
+    # parser.add_argument(
+    #     "-L",
+    #     "--follow-symlink",
+    #     action="store_true",
+    #     help="Remove both the symbol link and the destination file, default: no.",
+    # )
+
+    parser.add_argument(
+        "-y",
+        "--yes",
+        action="store_true",
+        help="""Automatic yes to prompts; assume "yes" as answer to all prompts
+            and run non-interactively.""",
+    )
+
+    parser.add_argument(
+        "-v", "--verbose", action="store_true", help="Explain what is being done."
+    )
+
+    parser.add_argument(
+        "-D",
+        "--debug",
+        action="count",
+        default=0,
+        help="Show debug info, repeat for more debug info.",
+    )
+
+    args = parser.parse_args()
+    if args.cache_dir is None or (
+        not args.remove_duplicated and not args.stamps_dir and not args.remove_orphans
+    ):
+        parser.print_usage()
+        sys.exit(1)
+
+    return args
+
+
+def main():
+    args = parse_arguments()
+
+    paths = collect_sstate_paths(args)
+    if args.remove_duplicated:
+        remove = remove_duplicated(args, paths)
+    elif args.stamps_dir:
+        remove = remove_by_stamps(args, paths)
+    else:
+        remove = list()
+
+    if args.remove_orphans:
+        remove = set(remove) | set(remove_orphans(args, paths))
+
+    if args.debug >= 1:
+        print("\n".join([str(p.path) for p in remove]))
+    print(f"{len(remove)} out of {len(paths)} files will be removed!")
+    if not args.yes:
+        print("Do you want to continue (y/n)?")
+        confirm = input() in ("y", "Y")
+    else:
+        confirm = True
+    if confirm:
+        # TODO: parallelise remove
+        for p in remove:
+            p.path.unlink()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.39.0


