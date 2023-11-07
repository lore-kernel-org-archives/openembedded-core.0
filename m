Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0D8C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 10:59:03 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.7610.1699354736499180992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 02:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HrTgOmMN;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c54c8934abso78122331fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 02:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699354734; x=1699959534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TVs3/0Xu8d1z6xAeumGNhfzhQnalttZoR4HxoZZVbrM=;
        b=HrTgOmMNqbnsn2IK0+ChMcr9szNvNpBR4TUML/WN3OtChFtgwNi0Fmpd4hpxJeLiHZ
         Ng1SfN2AUIfRBln5gsKIdwx5JsV4uHlgXIxfw8+flNAGsCXEKvr5YLJ5R2O0xGCwFcxb
         wv46qcrm+pwGXMedU+d34ZPVBfMD4rdR1LxCokICYLGch+65YUg/rSEU0FTC03tw8ePZ
         vqDn7j7xDQpVWOlXB8sZm3Bb3QQDLdluj3wRr1BprG3kuq42w3f+L04ZC+vBx/FSu/0P
         Me9BhPTZr44nfL3wzpOW6A3jroQ5wdfyrUhUNfqD2uh4GF/p6qttM9Or7rR+Kk9g+KfY
         koSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354734; x=1699959534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVs3/0Xu8d1z6xAeumGNhfzhQnalttZoR4HxoZZVbrM=;
        b=S/BGv3SaiSm62eG2SGA2ZlUplSPzyeOQ+QRVSmIGyaYh3tewNO1HFji3bz42Q6RsFA
         Hgb/sx7FsAlfkvus+YnVdKcxlXEhrdx3hAroKBBGwJYFbj+B7KZJt8smqNx4/R+XgbLU
         GNzjdVEFUWweM8KoVCrfO1HQzeGsEPgzwSSw8Pbk4PGHq0GS+I3Zbst1k6JKiggrXq2G
         BQDZfPZm9HqBKCb82w1sSgr1h7mMqvUD8wLarwc8BHyNZ3XIY7a54QsCe5vIwXb+rlZO
         a6DqMirHNm8kt+yY5tJ4xLOnTEQAn+y7keXkvudTanXx7Ti4iBTZ/6mRnNyQhMDmJ3cX
         jWIA==
X-Gm-Message-State: AOJu0YwjSIF41pgvhb5o/QTC1Mo2IPe3HAIVIVDwQ+hgsMWIbIY0OS10
	zn6gBrJV55iJuGtnNE0+g7hKb8908AE=
X-Google-Smtp-Source: AGHT+IE/QzqhFPlSyMNI57d8D+izo6i0feoarELJgWoce5m1PSo8ymb2Joq8Hf011pMNE7z8IuBm2Q==
X-Received: by 2002:a05:651c:2db:b0:2c0:52e:eafa with SMTP id f27-20020a05651c02db00b002c0052eeafamr23411973ljo.29.1699354734021;
        Tue, 07 Nov 2023 02:58:54 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c191300b004090ca6d785sm15446987wmq.2.2023.11.07.02.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:58:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH] scripts/oe-replicate-build: add a script that packages and replicates a yocto build elsewhere
Date: Tue,  7 Nov 2023 11:58:44 +0100
Message-Id: <20231107105844.712846-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 10:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190264

This scripts takes an existing, active yocto build, and puts pieces of it
into a bundle directory, which is then placed in a tarball, and a
self-extracting shell archive. This allows moving the bundle to another
machine, or placing it on a network server for downloads.

The bundle includes:
- a json/script to restore the layers at the correct revisions from the network
- build configuration as a template in a special layer private to the bundle
- (this is the best bit) all the sstate needed for the specified target,
but *only* that sstate and not a complete copy of the local cache.

When someone runs the self-extracting shell archive, everything
should 'just work': the layers are restored, and the build
set up to use them, the bundle sstate cache, and the template configuration.

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

- this, in turn, enables 'binary Yocto distro' implemented with
sstate, if there's a higher level tool that creates bundles in a systematic,
structured fashion, and another tool that iterates over available bundles, and
lets users pick them for building locally.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/files/replica-shar-extract.sh | 56 ++++++++++++++++++++++++++++++
 scripts/oe-replicate-build         | 56 ++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 meta/files/replica-shar-extract.sh
 create mode 100755 scripts/oe-replicate-build

diff --git a/meta/files/replica-shar-extract.sh b/meta/files/replica-shar-extract.sh
new file mode 100644
index 00000000000..78bb6a524ff
--- /dev/null
+++ b/meta/files/replica-shar-extract.sh
@@ -0,0 +1,56 @@
+#!/bin/bash
+
+verbose=0
+listcontents=0
+prepare_buildsystem="yes"
+while getopts "Dl" OPT; do
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
+tail -n +$payload_offset "$0"| tar mx --checkpoint=.2500 || exit 1
+
+if [ $prepare_buildsystem = "no" ] ; then
+        exit
+fi
+
+target_dir=$(basename "$0" .sh)
+pushd $target_dir
+./setup-layers --destdir layers
+TEMPLATECONF=$(pwd)/meta-build-config/conf/templates/replica . layers/poky/oe-init-build-env
+popd
+
+echo "Each time you wish to use build in a new shell session, you need to source the environment setup script e.g."
+echo " \$ . $target_dir/layers/poky/oe-init-build-env $target_dir/build"
+
+exit 0
+
+MARKER:
diff --git a/scripts/oe-replicate-build b/scripts/oe-replicate-build
new file mode 100755
index 00000000000..96e69c0c92e
--- /dev/null
+++ b/scripts/oe-replicate-build
@@ -0,0 +1,56 @@
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
+
+def _do_replica(args):
+    replicadir = args.output_prefix or "build-replica"
+    print("Preparing items for the bundle in {}/ ...".format(replicadir))
+    os.mkdir(replicadir)
+
+    subprocess.check_output("bitbake -S lockedsigs {}".format(args.targets), shell=True, cwd=replicadir)
+    sstate_dir = subprocess.check_output("bitbake-getvar --value SSTATE_DIR", shell=True).decode().strip()
+    if not args.no_sstate:
+        subprocess.check_output("gen-lockedsig-cache {} {} {} {}".format("locked-sigs.inc", sstate_dir, "build/sstate-cache", "''"), shell=True, cwd=replicadir)
+
+    layerdir = "meta-build-config"
+    subprocess.check_output("bitbake-layers create-layer --add-layer {}".format(layerdir), shell=True, cwd=replicadir)
+    subprocess.check_output("bitbake-layers save-build-conf {} replica".format(layerdir), shell=True, cwd=replicadir)
+    subprocess.check_output("bitbake-layers remove-layer {}".format(layerdir), shell=True, cwd=replicadir)
+
+    # meta-build-config is then in bblayers.conf.sample, and should be removed from it as it wasn't in the actual build
+    bblayers = os.path.join(replicadir, layerdir, 'conf/templates/replica/bblayers.conf.sample')
+    with open(bblayers) as f:
+        lines = f.readlines()
+        lines = [l for l in lines if os.path.join(replicadir, layerdir) not in l]
+    with open(bblayers,'w') as f:
+        f.write(''.join(lines))
+
+    subprocess.check_output("bitbake-layers create-layers-setup {}".format(replicadir), shell=True)
+
+    print("Making a bundle tarball in {}.tar ...".format(replicadir))
+    subprocess.check_output("tar cf {}.tar {}".format(replicadir, replicadir), shell=True)
+
+    print("Making a self-extracting bundle archive in {}.sh ...".format(replicadir))
+    corebase = subprocess.check_output("bitbake-getvar --value COREBASE", shell=True).decode().strip()
+    subprocess.check_output("cp {}/meta/files/replica-shar-extract.sh {}.sh".format(corebase, replicadir), shell=True)
+    subprocess.check_output("cat {}.tar >> {}.sh".format(replicadir, replicadir), shell=True)
+    subprocess.check_output("chmod +x {}.sh".format(replicadir), shell=True)
+
+parser = argparse.ArgumentParser(description="A script that bundles up everything needed to replicate a yocto build elsewhere (including appropriate portions of sstate cache) into a self-contained shell archive.")
+
+parser.add_argument('--targets', help="Bitbake targets that the replica bundle should be made for.")
+parser.add_argument('--output-prefix', help='File name prefix for the output files, if the default (build-replica) is undesirable.')
+parser.add_argument('--no-sstate', action='store_true', help='Do not include sstate cache into the replica bundle.')
+
+args = parser.parse_args()
+
+_do_replica(args)
+
-- 
2.39.2


