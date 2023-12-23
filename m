Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68043C3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 14:25:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.7192.1703341545505136181
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Dec 2023 06:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z5HkueCH;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d490a1936so13965115e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 06:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703341544; x=1703946344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A7kb3VjIRLOh9y2cKMTMW+i7SwMHdjE9JRabHLYLXDM=;
        b=Z5HkueCHnYAq/DXL7qSb7L+sqvl8is8wQ9dtWjSUXWy4xJtGkZjgHnY28BrmpgePOD
         XRQKQrIXtDKyh2g+0Kuf6xdTT2koLfh5I8tirvWk6Zs2EJiTqa0kCj8cdtcE28jAYk6q
         VNi1+4l9XoECIDyrgBm4/5cvIDScaKdarVGL9oeBmXissMqqFPblWRGjDUc/DDJhmwqP
         4lNjHxcgp/r5HjJ/uPcouTNiNnLsy6niJsusVmGCb41eRs2NOgylkSbcXSL1ghH3+oQy
         vAwROuAHbH16e4MzcRWxdzIUxnbloxjBbeSvwg+/7XZKBHZPa/nXkoDMUgHCS+XnDvf1
         oEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703341544; x=1703946344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7kb3VjIRLOh9y2cKMTMW+i7SwMHdjE9JRabHLYLXDM=;
        b=aeAF9fFwIN7F6jmf/B423k3W55oPpnNLeSWrStxRdReXXqnqtV3+W5syWR1QnnI0IT
         M7jhr0WXuVv/Y34ORYidYHn477c37vO9nZNeJqRfDhcrIKEFuDdV+oa4vnoj+xG6iJ7B
         DivRb3hWonx/6Gbdwitjk3jJdP8O1eHiCsuj0MaBPYsHMp7nq4xWbHVxuYcGYMO+b2vz
         lP8414d2P/t8bdcUCQJmaQ+SWDqcHovtNIdcc66YG8EMZD4bKFZGle5zH8MItpDGFI3d
         T06F4dj41jeNOrh0JEdCCpZxdenf5BixPI3Fmy9xhUPg4ELmTmbp6rZSJcK2uxiJsEVd
         LcCQ==
X-Gm-Message-State: AOJu0YzuvT7cD2AKwct1oZBQC1r6agZyzIBdhzU9kIij4BSNJoN7dFe4
	2NDsCPOYOxCp3cEtmZ4CsnbB1xJLSmY=
X-Google-Smtp-Source: AGHT+IEruosMG6UxH7QLdCT40nX7SsKoTUjb/aMAEq3PPwwwEyiTBdHVeaHs/4Dd8AGFxKA0vbrfEA==
X-Received: by 2002:a05:600c:5197:b0:40d:3b17:2db6 with SMTP id fa23-20020a05600c519700b0040d3b172db6mr803414wmb.273.1703341543260;
        Sat, 23 Dec 2023 06:25:43 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:d9e2:102b:56b1:9620])
        by smtp.gmail.com with ESMTPSA id fl25-20020a05600c0b9900b0040b3e26872dsm18658484wmb.8.2023.12.23.06.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 06:25:42 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH] sstate-cache-management: Rewrite in python
Date: Sat, 23 Dec 2023 14:25:40 +0000
Message-Id: <20231223142540.29847-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 14:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192883

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

 scripts/sstate-cache-management.py | 329 +++++++++++++++++++++++++++++
 1 file changed, 329 insertions(+)
 create mode 100755 scripts/sstate-cache-management.py

diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-management.py
new file mode 100755
index 000000000000..3ae3a7fa0515
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
+        for path in remove:
+            remove.unlink()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.39.0


