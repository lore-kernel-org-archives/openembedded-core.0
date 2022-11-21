Return-Path: <tomasz.dziendzielski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C17C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 11:11:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.35798.1669029071155575142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 03:11:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aHK/ld/A;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id s5so2110918wru.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 03:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KaGiKQMeJo9F2RD6TjViFrDMg3+YZk7xmkGcUOSoA4g=;
        b=aHK/ld/AFwNWeh3/Lldz8Z33lyIgV86ULjp5JBLVUmhRKq0M968i8dLOQTIooIG5Iw
         KoA8RB61jKsznBB7c9F5KkgobplrBH8/CNu2aoxxV3FupTlOMzEOESDB9ELGgSddnk31
         abbMiLKPFk/IAoQG8hb/Kret6EUgAwgOnagF7T/w1y9UH+BSSL8G1AICHHnkjWY0yBBD
         1dsDlKh3/fXA6HONq+yBQ967K7tpCpwPMtjJwE7OzlnpHbzllARgnc5tI8anT6MNXU6L
         6h9SwHv7mc7d8JmD1ZxSxNV6QlKHMxWdYCvRlgRgUWIyswgo//3h5NuFinczrMKWuwft
         H/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaGiKQMeJo9F2RD6TjViFrDMg3+YZk7xmkGcUOSoA4g=;
        b=KDzuPV7pg2WK8TIaO7jAWsWw72svRF6WlcQ+Wq6STi3gJS388zWf5CdIf3FRrDN5IA
         YIVxVmUBK3EVYnsqGNTts1+ZDCbaTzR8UIrvut03H2q9ybN9KAaka9EtUklx8UalQmnJ
         S6v8rgHG8ccpOsAV8jPja8fxFjg5w5DLt7yYzF43jLDu3SsbplVVchP1lRcrHPdT7twY
         02NUYyeoDOjFtKJNkuEZ6Pq/GsU9QVtd/zbYvr+DRol10eChq5HBbyK8nuDheCVS6EqU
         Qa3+qk66+ikFBiPCepoBgkn8ku1/4BKF9yIuGsWDL2m0Us2O3uiN3CXOnkVxkkE4rony
         64WQ==
X-Gm-Message-State: ANoB5pl7G1uC4ZHfJlEoy89BbyDjY10YeNA6HZ0yCcUCi846W32TBm8m
	Bmrom117GImXr9Ihy4w3G9pEYZhbCP8SySxEl/C11A==
X-Google-Smtp-Source: AA0mqf4Il3MoQp+nWNLV7pNYMsfYLRXAfhnWuN/1DJvQaO2zDrmWQRHc2URMOcZMQaE2ngzryNMH2g==
X-Received: by 2002:a5d:69c4:0:b0:236:c206:b2b1 with SMTP id s4-20020a5d69c4000000b00236c206b2b1mr10624774wrw.624.1669029069107;
        Mon, 21 Nov 2022 03:11:09 -0800 (PST)
Received: from localhost.localdomain ([188.95.55.61])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d45cd000000b002258235bda3sm10950490wrs.61.2022.11.21.03.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 03:11:08 -0800 (PST)
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mikolaj Lasota <mikolaj.lasota@protonmail.com>,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] sstate-cache-cleaner.py: Add a script for sstate cache cleaning
Date: Mon, 21 Nov 2022 12:11:02 +0100
Message-Id: <20221121111102.5556-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 11:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173649

From: Mikolaj Lasota <mikolaj.lasota@protonmail.com>

Bash script used at the moment takes too much time to calculate obsolete
sstate cache files. Let's try to rewrite necessary logic in python and
store intermediate data in memory rather than temporary files.

Signed-off-by: Mikolaj Lasota <mikolaj.lasota@protonmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 scripts/sstate-cache-cleaner.py | 166 ++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100755 scripts/sstate-cache-cleaner.py

diff --git a/scripts/sstate-cache-cleaner.py b/scripts/sstate-cache-cleaner.py
new file mode 100755
index 0000000000..f01db35775
--- /dev/null
+++ b/scripts/sstate-cache-cleaner.py
@@ -0,0 +1,166 @@
+#!/usr/bin/env python3
+
+"""
+This script is a python rewrite of poky based scripts/sstate-cache-management.sh
+It has a subset of original script features - namely the ability to filter cache files by stamp files references.
+The output is a list of unreferenced sstate-cache files - which are obsolete and can be removed.
+
+To test the script agains the original one (shell) one might create a small test environment:
+ - create a local sstate-cache directory
+ - run two or more separate builds (different hashes/machines) using above dir (SSTATE_DIR)
+ - run original shell script using stamp dir from one of the above builds and the common cache dir
+ - run this script with the same arguments (same stamp & cache dirs)
+"""
+
+import argparse
+import fnmatch
+import logging
+import os
+import re
+import time
+from functools import reduce
+
+formatter = logging.Formatter('%(asctime)s - %(funcName)s - %(levelname)s - %(message)s')
+logger = logging.getLogger('sstate-cache-cleaner')
+logger.setLevel(logging.DEBUG)
+fh = logging.FileHandler('sstate-cache-cleaner.log', 'w')
+fh.setLevel(logging.DEBUG)
+fh.setFormatter(formatter)
+ch = logging.StreamHandler()
+ch.setLevel(logging.INFO)
+ch.setFormatter(formatter)
+logger.addHandler(fh)
+logger.addHandler(ch)
+
+TIME = time.time()
+ONE_DAY_IN_SECONDS = 86400
+
+def collect_sstate_cache_files(cache_dir):
+    """ Collect all sstate-cache files form cache_dir and figure out accelerated tasks for cleaning. """
+
+    logger.info('Collecting sstate-cache files...')
+
+    sstate_tasks = set()
+    cache_files = dict()
+    cache_file_regex = re.compile(r'sstate.*:([^_]*)_(.*)\.tgz.*')
+    for root, dirs, files in os.walk(cache_dir):
+        for filename in files:
+            if fnmatch.fnmatch(filename, 'sstate*'):
+                match = cache_file_regex.match(filename)
+                if match:
+                    _hash = match.group(1)
+                    _task = match.group(2)
+                    sstate_tasks.add(_task)
+                    f = os.path.join(root, filename)
+                    try:
+                        if os.stat(f).st_ctime < TIME - ONE_DAY_IN_SECONDS:
+                            if _hash in cache_files:
+                                cache_files[_hash].append(f)
+                            else:
+                                cache_files[_hash] = [f]
+                    except FileNotFoundError as err:
+                        logger.error(err)
+
+    num_of_files = reduce(lambda count, element: count + len(element), cache_files.values(), 0)
+    num_of_hashes = len(cache_files)
+    logger.info(f'Found {num_of_files} sstate files ({num_of_hashes} hashes)')
+    return cache_files, sstate_tasks
+
+def collect_stamps(stamps_dirs_list, tasks):
+    """ Collect hashes from the stamp files (only for tasks which were found in sstate-cache) """
+
+    logger.info('Collecting stamps...')
+
+    stamps = set()
+    for stamps_dir in stamps_dirs_list:
+        logger.debug(f'Looking for stamps in {stamps_dir}')
+        for root, dirs, files in os.walk(stamps_dir):
+            for filename in files:
+                for task in tasks:
+                    if fnmatch.fnmatch(filename, f'*.do_{task}_setscene.*'):
+                        match = re.match(rf'.*\.do_{task}_setscene\.([^\.]*).*', filename)
+                        if match:
+                            stamps.add(match.group(1))
+                    elif fnmatch.fnmatch(filename, f'*.do_{task}.*'):
+                        match = re.match(rf'.*do_{task}(\.sigdata)?\.([^\.]*).*', filename)
+                        if match:
+                            stamps.add(match.group(2))
+                    continue
+
+    logger.info(f'Found {len(stamps)} stamps')
+    return stamps
+
+def compute_obsolete_sstate_cache_files(stamps, cache):
+    """ Figure out which cache files are obsolete.
+
+    Check if a cache file is referenced by a stamp file. If yes - it is needed - and therefore should be filtered out
+    from the processed list. The list which is returned is a list of files to be removed.
+    """
+
+    logger.info('Filtering sstate-cache list for unreferenced (obsolete) files...')
+
+    num_stamps = len(stamps) - 1
+    progress = -1
+    for i, stamp in enumerate(stamps):
+        _progress = int(i / num_stamps * 100)
+        if _progress % 5 == 0 and _progress > progress:
+            progress = _progress
+            logger.debug(f'[{progress:3d}%] Cleaning stamp {i}/{num_stamps}')
+        if stamp in cache:
+            del cache[stamp]
+
+    num_of_files = reduce(lambda count, element: count + len(element), cache.values(), 0)
+    logger.info(f'Found {num_of_files} sstate files to be removed')
+    return cache
+
+def parse_arguments():
+    """ Parse arguments for cache & stamp directories and output file name """
+
+    parser = argparse.ArgumentParser(
+                        description='Sstate cache cleanup script. \
+                                     Cache files which are not referenced by stamp files will be listed for removal.',
+                        epilog='This is a python re-write of poky provided sstate-cache-management.sh script. \
+                                Only stamp based cleaning is implemented.')
+    parser.add_argument('--cache-dir', required=True,
+                        help='Specify sstate-cache directory')
+    parser.add_argument('--stamps-dir', required=True, nargs='+',
+                        help='Specify stamps directories')
+    parser.add_argument('--output-file', '-f', required=True,
+                        help='Specify a file for script output - a list of obsolete sstate-cache files.')
+
+    logger.debug('Parsing arguments...')
+    return parser.parse_args()
+
+def main():
+    args = parse_arguments()
+
+    stamps_dirs_list = args.stamps_dir
+    for i, path in enumerate(stamps_dirs_list):
+        abs_path = os.path.abspath(path)
+        if not os.path.isdir(abs_path):
+            raise ValueError(f'Stamps directory doesn\'t exist: {abs_path} !')
+        stamps_dirs_list[i] = abs_path
+
+    cache_dir = os.path.abspath(args.cache_dir)
+    if not os.path.isdir(cache_dir):
+        raise ValueError(f'Cache directory doesn\'t exist: {cache_dir} !')
+
+    output_file_path = os.path.abspath(args.output_file)
+
+    cache, tasks = collect_sstate_cache_files(cache_dir)
+    stamps = collect_stamps(stamps_dirs_list, tasks)
+
+    obsolete_sstate = compute_obsolete_sstate_cache_files(stamps, cache)
+    obsolete_sstate_files = [item for sublist in obsolete_sstate.values() for item in sublist]
+
+    if not os.path.isdir(os.path.dirname(output_file_path)):
+        logger.warning(f'Output directory doesn\'t exist and will be created: {output_file_path}')
+        os.makedirs(os.path.dirname(output_file_path))
+
+    with open(output_file_path, 'w') as out:
+        out.write('\n'.join(obsolete_sstate_files))
+
+    logger.info(f'List of obsolete sstate-cache files saved: {output_file_path}')
+
+if __name__ == "__main__":
+    main()
-- 
2.38.0


