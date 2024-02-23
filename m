Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFA5C54E50
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:01:56 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.8985.1708689710244015321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 04:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iPZqK5l9;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3e706f50beso94807266b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 04:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708689709; x=1709294509; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LO02WLe4Qp122fJFeCxZrC8MHySBci5Vsgg3LB+XIQ=;
        b=iPZqK5l9k8N8HfrfXHm7Pn08c6Vx9BlZw4G+F1ewwq4UsQa37TRrqw19Iyk3AM8oL2
         Pq3G+dH44r2BbxA8t/2d+i5pQ/3ClceOylVWPDl9yP4vH2xmWOpJeMKSJ/yXG598TrTP
         w35ImJb4UFsKLQ9mH+qYvambi56BQPs/6pNnHDR3u6rZ9OvGMb6VwKRCqm7rZvPWE+BZ
         7mrwmiJb94Wv+FCVm2QibcKBVXWBja13mj1y6jHYR7KcvSnj5M4DUCHqRpjEVYjUXokw
         d23FMMd/4JKnV7IMDlHfENzZ9N8iIO4M+udPpC0u/bjANALK1J/h1XS0yJXTuTImisi6
         mI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689709; x=1709294509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LO02WLe4Qp122fJFeCxZrC8MHySBci5Vsgg3LB+XIQ=;
        b=gHbA0OkQkGTIKgWToAtHX/2URB2y3C8XBqTqDJH1oZp81jF2umwYXjA0j9GhC9FSAe
         6M41PGQeDUR6OOe9VsjhhMMyfaAUY49ZsHk/hfTGBozdYCKzLfzyb6DQK943wOSk1WG+
         BgQRz+l4MckK5wrh66GrpOgFj5rdahErKb89fp2Rolm7A6zTl6P5GEIHrsP+xz/VHI76
         pa+iud7fP/4kxbh/mr9rWKW8/eRvJkUbeAHUqgO12tU8J5w0qaltYIIgO2MAhawEEOm3
         eXEhob4G6Xko25o4Vbabm+qMPzhS1WOec1XRrBfkUzjPHz14NHrD+ZewkalSwFDfpqrW
         CyWQ==
X-Gm-Message-State: AOJu0YzthlzBO4GsbRT8K7oTZfM7RtR9RFd4FYJf0Z3kPVwPIjFlCDI3
	HDcyL7r94J/k4X/DNrkNsU0E9kzAU+NRwl3mnSbAdpwTfNSCFwRO0EF5epRf
X-Google-Smtp-Source: AGHT+IEbD5XCG+0tBDadfmUvSjK2aARD5W2wpZfD3IoP8i11ixK/nZstvuuNtpVlvZvMqyKUjIBPcw==
X-Received: by 2002:a17:906:7192:b0:a3e:a951:4087 with SMTP id h18-20020a170906719200b00a3ea9514087mr1100764ejk.76.1708689708620;
        Fri, 23 Feb 2024 04:01:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906345100b00a3d125b9c0asm220330ejb.81.2024.02.23.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:01:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 10/10] scripts/oe-replicate-build: add a script that packages and replicates a yocto build elsewhere
Date: Fri, 23 Feb 2024 13:01:34 +0100
Message-Id: <20240223120134.3713127-10-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223120134.3713127-1-alex@linutronix.de>
References: <20240223120134.3713127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196070

This scripts takes an existing, active yocto build, and puts pieces of it
into a bundle directory, which is then placed in a tarball, and that goes
into a self-extracting shell archive. This allows moving the bundle to another
machine, or placing it on a network server for downloads. It's like esdk
bundles, except inside there is a regular, plain, direct yocto build.

The bundle includes:
- copies of all layers used in a build, with their git histories
- build configuration as a template in a special layer private to the bundle
- (this is the best bit) all the sstate needed for the specified target,
but *only* that sstate and not a complete copy of the local cache.

When someone runs the self-extracting shell archive, everything
should 'just work': the layers are restored, and the build
set up to use them, the bundled sstate cache, and the template configuration.

Alternatively, it's possible to not include the cache, and presumably it will come
from a configured sstate mirror.

This enables at least two*scratch*three interesting use cases:

- moving builds around in single-step fashion: run the script, and give
the artifact to someone else via file sharing or usb sticks.

- publishing builds on the network, perhaps right next to the sstate
cache that can fulfil them. This allows an alternative, much smoother
entry point into 'doing yocto', as this guarantees availability of
needed cache items, and so builds will be a lot faster than the typical
'compile everything from scratch' yocto experience. Sstate is guaranteed
to be available, as there's a record of needed items in each bundle, and
that record can be used to prevent pruning of still-needed cache items.

- this, in turn, can enable 'binary Yocto distro' implemented with
sstate, if there's a higher level tool that creates bundles in a systematic,
structured fashion, and another tool that iterates over available bundles, and
lets users pick them for building locally.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/bundle-shar-extract.sh           | 55 +++++++++++++++
 meta/lib/oeqa/selftest/cases/sstatetests.py | 13 ++++
 scripts/oe-replicate-build                  | 75 +++++++++++++++++++++
 3 files changed, 143 insertions(+)
 create mode 100644 meta/files/bundle-shar-extract.sh
 create mode 100755 scripts/oe-replicate-build

diff --git a/meta/files/bundle-shar-extract.sh b/meta/files/bundle-shar-extract.sh
new file mode 100644
index 00000000000..ae10dbaf065
--- /dev/null
+++ b/meta/files/bundle-shar-extract.sh
@@ -0,0 +1,55 @@
+#!/bin/bash
+
+verbose=0
+listcontents=0
+prepare_buildsystem="yes"
+while getopts "Dln" OPT; do
+        case $OPT in
+        D)
+                verbose=1
+                ;;
+        l)
+                listcontents=1
+                ;;
+        n)
+                prepare_buildsystem="no"
+                ;;
+        *)
+                echo "Usage: $(basename "$0") [-D] [-l] [-n]"
+                echo "  -D         Use set -x to see what is going on"
+                echo "  -l         list files that will be extracted"
+                echo "  -n         Extract files but do not prepare the build system"
+                exit 1
+                ;;
+        esac
+done
+
+if [ $verbose = 1 ] ; then
+        set -x
+fi
+
+payload_offset=$(($(grep -na -m1 "^MARKER:$" "$0"|cut -d':' -f1) + 1))
+
+if [ "$listcontents" = "1" ] ; then
+    tail -n +$payload_offset "$0"| tar tv || exit 1
+    exit
+fi
+
+
+tail -n +$payload_offset "$0"| tar mx --zstd --checkpoint=.2500 || exit 1
+
+if [ $prepare_buildsystem = "no" ] ; then
+        exit
+fi
+
+target_dir=$(basename "$0" .sh)
+pushd $target_dir
+layers/setup-build setup -c build-config-default -b build --no-shell > setup-build.log
+popd
+
+echo "Each time you wish to use this build in a new shell session, you need to source the environment setup script:"
+echo " \$ . $target_dir/build/init-build-env"
+
+exit 0
+
+MARKER:
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index bb2a1a2fb8c..d5e9ed099f8 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -976,3 +976,16 @@ MACHINE = "{}"
     def test_local_cache_qemuarm64(self):
         exceptions = []
         self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, check_cdn = False)
+
+class SStateBundles(SStateCheckObjectPresence):
+    def test_minimal_bundle(self):
+        targets = "core-image-minimal"
+        machine = get_bb_var('MACHINE')
+        bitbake("--runall build {}".format(targets))
+        runCmd("oe-replicate-build --targets {}".format(targets))
+        extractedbundledir = tempfile.mkdtemp(prefix='bundle-extracted-', dir=self.topdir)
+        runCmd("../build-bundle.sh", cwd=extractedbundledir)
+        result = runCmd(". build-bundle/build/init-build-env && MACHINE={} bitbake -DD -n {}".format(machine,targets), cwd=extractedbundledir, shell=True, executable='/bin/bash')
+
+        exceptions = []
+        self.check_bb_output(result.output, targets, exceptions, check_cdn=False)
diff --git a/scripts/oe-replicate-build b/scripts/oe-replicate-build
new file mode 100755
index 00000000000..bb465f0372d
--- /dev/null
+++ b/scripts/oe-replicate-build
@@ -0,0 +1,75 @@
+#!/usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import argparse
+import json
+import os
+import subprocess
+import shutil
+
+def _do_bundle(args):
+    bundledir = args.output_prefix or "build-bundle"
+    print("Making a self-extracting bundle archive in {}.sh ...".format(bundledir))
+    os.mkdir(bundledir)
+
+    subprocess.check_output("bitbake -S outdir={} -S lockedsigs {}".format(os.path.abspath(bundledir),args.targets), shell=True)
+    sstate_dir = subprocess.check_output("bitbake-getvar --value SSTATE_DIR", shell=True).decode().strip()
+    nativelsbstring = subprocess.check_output("bitbake-getvar --value NATIVELSBSTRING", shell=True).decode().strip()
+    if not args.no_sstate:
+        subprocess.check_output("gen-lockedsig-cache {} {} {} {}".format("locked-sigs.inc", sstate_dir, "build/sstate-cache", nativelsbstring), shell=True, cwd=bundledir)
+    cachedir = bundledir + "/build/cache"
+    os.mkdir(cachedir)
+    subprocess.check_output("bitbake -S outdir={} -S unihash-cache-copy {}".format(os.path.abspath(cachedir),args.targets), shell=True)
+
+    layerdir = "meta-build-config"
+    subprocess.check_output("bitbake-layers create-layer --add-layer {}".format(layerdir), shell=True, cwd=bundledir)
+    subprocess.check_output("bitbake-layers save-build-conf {} default".format(layerdir), shell=True, cwd=bundledir)
+    shutil.copy(os.path.join(os.environ["BUILDDIR"],'conf',"conf-summary.txt"), os.path.join(bundledir,layerdir,'conf/templates/default'))
+    shutil.copy(os.path.join(os.environ["BUILDDIR"],'conf',"conf-notes.txt"), os.path.join(bundledir,layerdir,'conf/templates/default'))
+    subprocess.check_output("bitbake-layers remove-layer {}".format(layerdir), shell=True, cwd=bundledir)
+
+    # meta-build-config is then in bblayers.conf.sample, and should be removed from it as it wasn't in the actual build
+    bblayers = os.path.join(bundledir, layerdir, 'conf/templates/default/bblayers.conf.sample')
+    with open(bblayers) as f:
+        lines = f.readlines()
+        lines = [l for l in lines if os.path.join(bundledir, layerdir) not in l]
+    with open(bblayers,'w') as f:
+        f.write(''.join(lines))
+
+    subprocess.check_output("bitbake-layers create-layers-setup --writer oe-local-copy {}".format(bundledir), shell=True)
+
+    # meta-build-config should however be present in .oe-layers.json, as otherwise oe-setup-build won't be able to discover
+    # the config template in it
+    oelayers = os.path.join(bundledir, 'layers', '.oe-layers.json')
+    with open(oelayers) as f:
+        json_f = json.load(f)
+    json_f["layers"].append("../meta-build-config")
+    with open(oelayers,'w') as f:
+        json.dump(json_f, f, sort_keys=True, indent=4)
+
+    subprocess.check_output("tar caf {}.tar.zst {}".format(bundledir, bundledir), shell=True)
+
+    corebase = subprocess.check_output("bitbake-getvar --value COREBASE", shell=True).decode().strip()
+    subprocess.check_output("cp {}/meta/files/bundle-shar-extract.sh {}.sh".format(corebase, bundledir), shell=True)
+    subprocess.check_output("cat {}.tar.zst >> {}.sh".format(bundledir, bundledir), shell=True)
+    subprocess.check_output("chmod +x {}.sh".format(bundledir), shell=True)
+
+    if not args.keep_tmp:
+        shutil.rmtree(bundledir)
+        os.remove("{}.tar.zst".format(bundledir))
+
+parser = argparse.ArgumentParser(description="A script that bundles up everything needed to replicate a yocto build elsewhere (including appropriate portions of sstate cache) into a self-contained shell archive.")
+
+parser.add_argument('--targets', required=True, help="Bitbake targets that the bundle should be made for.")
+parser.add_argument('--output-prefix', help='File name prefix for the output files, if the default (build-bundle) is undesirable.')
+parser.add_argument('--no-sstate', action='store_true', help='Do not include sstate cache into the bundle.')
+parser.add_argument('--keep-tmp', action='store_true', help='Keep intermediate output: unpacked bundle directory, and compressed tarball (in addition to the final self-extracting shell archuve.')
+
+args = parser.parse_args()
+
+_do_bundle(args)
+
-- 
2.39.2


