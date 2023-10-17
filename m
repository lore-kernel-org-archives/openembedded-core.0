Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7479C46CA1
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:30:58 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.215019.1697549458410150411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YLCQywiR;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-53b32dca0bfso11856570a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697549457; x=1698154257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcKAnDyVRCIBxuqzcaZImLHZq8MMpRqvw3lyrSKNkhM=;
        b=YLCQywiRV+0RRJ5zOXneIlhbuXgvGGbPXzvhXryHDUVtsCz2h+8sqwz4rydI4tOiMw
         WvXmjv6OtxRtsCO66CfjKHyvdk5osd9PRITEPSbw7/ppQ2RDAb5a7IGdZCa7LjkUFnu2
         Wr0SL2TNWhVdnhuePRRBh5Q3bgWkJmvBEKnUzuwoGOS13D2WGDSEETZO3+MZ7+cvry2L
         HYp/zpEGcYIaKAfuOBiQOyLUy/LLe9hh93U01yczRI5IYGuFJzbkgHlSWaGbUojXulpf
         O4k+rnApZDKKJLhNeVrfosW/nvoX+lbGRTdUahwFNC0TlWeVin730lHR8YALW2KP4wQC
         YSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697549457; x=1698154257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcKAnDyVRCIBxuqzcaZImLHZq8MMpRqvw3lyrSKNkhM=;
        b=R8BnuDw0O8ac9KMr9zFCeuIF5/4Nz7O0X6+wWUsT0mU6AFJhmGPXKmpKDcHk/npU53
         tQK+Mv4rYz1o+Ns51bsGJvr79pixFVSF8f33ShaXvgQmkq9WRLUdrcY6/ETOeh5AKGAn
         JGrro5YehgzbvhIjk9lVGNrzR4mPpcZ7//KUBNsoxYTT0S+dc56jvRdxpWHzzaZcOWNU
         YNZ+IFbhDMlkiXs6E5Hpf5RMFxPwY9/Ej1UZdiIPE9YKKuJGYuIl+5ZoBDiIP8gPT2qV
         e22gHynw+8RINy1hz9KcRQSUdozsx4VtUdWeeK5jI/EQyJgRK/bG4YqbEZ7E1Z+gzH+X
         JT1g==
X-Gm-Message-State: AOJu0YwTlMPi3KfxSHuYBCbcPpGs6g6M+cuEKniT8kqbmEQIc5hgfUVm
	PH3E4pI0THXZJy4ylUDWYXUpt08ovhk=
X-Google-Smtp-Source: AGHT+IHv9CrkO3ZPWAQjr1vNY9aO1UpOqM72eoiaErEW1r3ZFkVMinB7QhReKShU0DCRug0FQSiumQ==
X-Received: by 2002:a50:9996:0:b0:523:2e23:a0bf with SMTP id m22-20020a509996000000b005232e23a0bfmr1710197edb.11.1697549456702;
        Tue, 17 Oct 2023 06:30:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s22-20020a50ab16000000b0053e589016a7sm956576edc.16.2023.10.17.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:30:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] scripts/bitbake-whatchanged: remove
Date: Tue, 17 Oct 2023 15:30:50 +0200
Message-Id: <20231017133050.147000-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017133050.147000-1-alex@linutronix.de>
References: <20231017133050.147000-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189333

This is not documented or tested, and indeed hasn't been producing useful reports
for some time.

The script works by redirecting STAMPS_DIR into a separate location,
then running bitbake -S none, then comparing the two sets of stamp
filenames with regexes:

 Match the stamp's filename
 group(1): PE_PV (may no PE)
 group(2): PR
 group(3): TASK
 group(4): HASH
stamp_re = re.compile("(?P<pv>.*)-(?P<pr>r\d+)\.(?P<task>do_\w+)\.(?P<hash>[^\.]*)")

Then there's some code that finds out what changed in the above between the two sets.

Messing about with STAMPS_DIR like that isn't supported, and will either do nothing,
or remove the original stamps. Also stamp filenames aren't really a 'public API'.

For finding out the changes between two builds, 'bitbake -s printdiff' is a supported
and tested option. It may be a bit too verbose, but that can be more easily fixed than
rewriting bitbake-whatchanged into a working state.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/bitbake-whatchanged | 318 ------------------------------------
 1 file changed, 318 deletions(-)
 delete mode 100755 scripts/bitbake-whatchanged

diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
deleted file mode 100755
index cdb730dbdb9..00000000000
--- a/scripts/bitbake-whatchanged
+++ /dev/null
@@ -1,318 +0,0 @@
-#!/usr/bin/env python3
-#
-# Copyright (c) 2013 Wind River Systems, Inc.
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-import os
-import sys
-import getopt
-import shutil
-import re
-import warnings
-import subprocess
-import argparse
-
-scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
-lib_path = scripts_path + '/lib'
-sys.path = sys.path + [lib_path]
-
-import scriptpath
-
-# Figure out where is the bitbake/lib/bb since we need bb.siggen and bb.process
-bitbakepath = scriptpath.add_bitbake_lib_path()
-if not bitbakepath:
-    sys.stderr.write("Unable to find bitbake by searching parent directory of this script or PATH\n")
-    sys.exit(1)
-scriptpath.add_oe_lib_path()
-import argparse_oe
-
-import bb.siggen
-import bb.process
-
-# Match the stamp's filename
-# group(1): PE_PV (may no PE)
-# group(2): PR
-# group(3): TASK
-# group(4): HASH
-stamp_re = re.compile("(?P<pv>.*)-(?P<pr>r\d+)\.(?P<task>do_\w+)\.(?P<hash>[^\.]*)")
-sigdata_re = re.compile(".*\.sigdata\..*")
-
-def gen_dict(stamps):
-    """
-    Generate the dict from the stamps dir.
-    The output dict format is:
-    {fake_f: {pn: PN, pv: PV, pr: PR, task: TASK, path: PATH}}
-    Where:
-    fake_f: pv + task + hash
-    path: the path to the stamp file
-    """
-    # The member of the sub dict (A "path" will be appended below)
-    sub_mem = ("pv", "pr", "task")
-    d = {}
-    for dirpath, _, files in os.walk(stamps):
-        for f in files:
-            # The "bitbake -S" would generate ".sigdata", but no "_setscene".
-            fake_f = re.sub('_setscene.', '.', f)
-            fake_f = re.sub('.sigdata', '', fake_f)
-            subdict = {}
-            tmp = stamp_re.match(fake_f)
-            if tmp:
-                for i in sub_mem:
-                    subdict[i] = tmp.group(i)
-                if len(subdict) != 0:
-                    pn = os.path.basename(dirpath)
-                    subdict['pn'] = pn
-                    # The path will be used by os.stat() and bb.siggen
-                    subdict['path'] = dirpath + "/" + f
-                    fake_f = tmp.group('pv') + tmp.group('task') + tmp.group('hash')
-                    d[fake_f] = subdict
-    return d
-
-# Re-construct the dict
-def recon_dict(dict_in):
-    """
-    The output dict format is:
-    {pn_task: {pv: PV, pr: PR, path: PATH}}
-    """
-    dict_out = {}
-    for k in dict_in.keys():
-        subdict = {}
-        # The key
-        pn_task = "%s_%s" % (dict_in.get(k).get('pn'), dict_in.get(k).get('task'))
-        # If more than one stamps are found, use the latest one.
-        if pn_task in dict_out:
-            full_path_pre = dict_out.get(pn_task).get('path')
-            full_path_cur = dict_in.get(k).get('path')
-            if os.stat(full_path_pre).st_mtime > os.stat(full_path_cur).st_mtime:
-                continue
-        subdict['pv'] = dict_in.get(k).get('pv')
-        subdict['pr'] = dict_in.get(k).get('pr')
-        subdict['path'] = dict_in.get(k).get('path')
-        dict_out[pn_task] = subdict
-
-    return dict_out
-
-def split_pntask(s):
-    """
-    Split the pn_task in to (pn, task) and return it
-    """
-    tmp = re.match("(.*)_(do_.*)", s)
-    return (tmp.group(1), tmp.group(2))
-
-
-def print_added(d_new = None, d_old = None):
-    """
-    Print the newly added tasks
-    """
-    added = {}
-    for k in list(d_new.keys()):
-        if k not in d_old:
-            # Add the new one to added dict, and remove it from
-            # d_new, so the remaining ones are the changed ones
-            added[k] = d_new.get(k)
-            del(d_new[k])
-
-    if not added:
-        return 0
-
-    # Format the output, the dict format is:
-    # {pn: task1, task2 ...}
-    added_format = {}
-    counter = 0
-    for k in added.keys():
-        pn, task = split_pntask(k)
-        if pn in added_format:
-            # Append the value
-            added_format[pn] = "%s %s" % (added_format.get(pn), task)
-        else:
-            added_format[pn] = task
-        counter += 1
-    print("=== Newly added tasks: (%s tasks)" % counter)
-    for k in added_format.keys():
-        print("  %s: %s" % (k, added_format.get(k)))
-
-    return counter
-
-def print_vrchanged(d_new = None, d_old = None, vr = None):
-    """
-    Print the pv or pr changed tasks.
-    The arg "vr" is "pv" or "pr"
-    """
-    pvchanged = {}
-    counter = 0
-    for k in list(d_new.keys()):
-        if d_new.get(k).get(vr) != d_old.get(k).get(vr):
-            counter += 1
-            pn, task = split_pntask(k)
-            if pn not in pvchanged:
-                # Format the output, we only print pn (no task) since
-                # all the tasks would be changed when pn or pr changed,
-                # the dict format is:
-                # {pn: pv/pr_old -> pv/pr_new}
-                pvchanged[pn] = "%s -> %s" % (d_old.get(k).get(vr), d_new.get(k).get(vr))
-            del(d_new[k])
-
-    if not pvchanged:
-        return 0
-
-    print("\n=== %s changed: (%s tasks)" % (vr.upper(), counter))
-    for k in pvchanged.keys():
-        print("  %s: %s" % (k, pvchanged.get(k)))
-
-    return counter
-
-def print_depchanged(d_new = None, d_old = None, verbose = False):
-    """
-    Print the dependency changes
-    """
-    depchanged = {}
-    counter = 0
-    for k in d_new.keys():
-        counter += 1
-        pn, task = split_pntask(k)
-        if (verbose):
-            full_path_old = d_old.get(k).get("path")
-            full_path_new = d_new.get(k).get("path")
-            # No counter since it is not ready here
-            if sigdata_re.match(full_path_old) and sigdata_re.match(full_path_new):
-                output = bb.siggen.compare_sigfiles(full_path_old, full_path_new)
-                if output:
-                    print("\n=== The verbose changes of %s.%s:" % (pn, task))
-                    print('\n'.join(output))
-        else:
-            # Format the output, the format is:
-            # {pn: task1, task2, ...}
-            if pn in depchanged:
-                depchanged[pn] = "%s %s" % (depchanged.get(pn), task)
-            else:
-                depchanged[pn] = task
-
-    if len(depchanged) > 0:
-        print("\n=== Dependencies changed: (%s tasks)" % counter)
-        for k in depchanged.keys():
-            print("  %s: %s" % (k, depchanged[k]))
-
-    return counter
-
-
-def main():
-    """
-    Print what will be done between the current and last builds:
-    1) Run "STAMPS_DIR=<path> bitbake -S recipe" to re-generate the stamps
-    2) Figure out what are newly added and changed, can't figure out
-       what are removed since we can't know the previous stamps
-       clearly, for example, if there are several builds, we can't know
-       which stamps the last build has used exactly.
-    3) Use bb.siggen.compare_sigfiles to diff the old and new stamps
-    """
-
-    parser = argparse_oe.ArgumentParser(usage = """%(prog)s [options] [package ...]
-print what will be done between the current and last builds, for example:
-
-    $ bitbake core-image-sato
-    # Edit the recipes
-    $ bitbake-whatchanged core-image-sato
-
-The changes will be printed.
-
-Note:
-    The amount of tasks is not accurate when the task is "do_build" since
-    it usually depends on other tasks.
-    The "nostamp" task is not included.
-"""
-)
-    parser.add_argument("recipe", help="recipe to check")
-    parser.add_argument("-v", "--verbose", help = "print the verbose changes", action = "store_true")
-    args = parser.parse_args()
-
-    # Get the STAMPS_DIR
-    print("Figuring out the STAMPS_DIR ...")
-    cmdline = "bitbake -e | sed -ne 's/^STAMPS_DIR=\"\(.*\)\"/\\1/p'"
-    try:
-        stampsdir, err = bb.process.run(cmdline)
-    except:
-        raise
-    if not stampsdir:
-        print("ERROR: No STAMPS_DIR found for '%s'" % args.recipe, file=sys.stderr)
-        return 2
-    stampsdir = stampsdir.rstrip("\n")
-    if not os.path.isdir(stampsdir):
-        print("ERROR: stamps directory \"%s\" not found!" % stampsdir, file=sys.stderr)
-        return 2
-
-    # The new stamps dir
-    new_stampsdir = stampsdir + ".bbs"
-    if os.path.exists(new_stampsdir):
-        print("ERROR: %s already exists!" % new_stampsdir, file=sys.stderr)
-        return 2
-
-    try:
-        # Generate the new stamps dir
-        print("Generating the new stamps ... (need several minutes)")
-        cmdline = "STAMPS_DIR=%s bitbake -S none %s" % (new_stampsdir, args.recipe)
-        # FIXME
-        # The "bitbake -S" may fail, not fatal error, the stamps will still
-        # be generated, this might be a bug of "bitbake -S".
-        try:
-            bb.process.run(cmdline)
-        except Exception as exc:
-            print(exc)
-
-        # The dict for the new and old stamps.
-        old_dict = gen_dict(stampsdir)
-        new_dict = gen_dict(new_stampsdir)
-
-        # Remove the same one from both stamps.
-        cnt_unchanged = 0
-        for k in list(new_dict.keys()):
-            if k in old_dict:
-                cnt_unchanged += 1
-                del(new_dict[k])
-                del(old_dict[k])
-
-        # Re-construct the dict to easily find out what is added or changed.
-        # The dict format is:
-        # {pn_task: {pv: PV, pr: PR, path: PATH}}
-        new_recon = recon_dict(new_dict)
-        old_recon = recon_dict(old_dict)
-
-        del new_dict
-        del old_dict
-
-        # Figure out what are changed, the new_recon would be changed
-        # by the print_xxx function.
-        # Newly added
-        cnt_added = print_added(new_recon, old_recon)
-
-        # PV (including PE) and PR changed
-        # Let the bb.siggen handle them if verbose
-        cnt_rv = {}
-        if not args.verbose:
-            for i in ('pv', 'pr'):
-               cnt_rv[i] = print_vrchanged(new_recon, old_recon, i)
-
-        # Dependencies changed (use bitbake-diffsigs)
-        cnt_dep = print_depchanged(new_recon, old_recon, args.verbose)
-
-        total_changed = cnt_added + (cnt_rv.get('pv') or 0) + (cnt_rv.get('pr') or 0) + cnt_dep
-
-        print("\n=== Summary: (%s changed, %s unchanged)" % (total_changed, cnt_unchanged))
-        if args.verbose:
-            print("Newly added: %s\nDependencies changed: %s\n" % \
-                (cnt_added, cnt_dep))
-        else:
-            print("Newly added: %s\nPV changed: %s\nPR changed: %s\nDependencies changed: %s\n" % \
-                (cnt_added, cnt_rv.get('pv') or 0, cnt_rv.get('pr') or 0, cnt_dep))
-    except:
-        print("ERROR occurred!")
-        raise
-    finally:
-        # Remove the newly generated stamps dir
-        if os.path.exists(new_stampsdir):
-            print("Removing the newly generated stamps dir ...")
-            shutil.rmtree(new_stampsdir)
-
-if __name__ == "__main__":
-    sys.exit(main())
-- 
2.39.2


