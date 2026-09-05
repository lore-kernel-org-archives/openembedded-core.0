Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EC4C624DB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 09:06:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4598.1788599201673057162
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 02:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BwJd+iYR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-484374f54d0so1097236f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788599200; x=1789204000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9hYYNbglzoF9JqmvyOSPI5azWUhuNFmLgFgpcem8PgY=;
        b=BwJd+iYRX4nkOfgrdFMZRegl9Z3gIYKxBc4sgElovTQ2ywOmwrlN4jruAI3OqOjkTF
         i3jISeCTjejrGac8AY1vGY5JQgSxnbD7mwP2+s4TSjiQ4bqSo1HSbRoHrW8si2/uJmjm
         xouEPQ2OXz8tC9v31BbqKmPNNQUDBVAmbsIic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788599200; x=1789204000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9hYYNbglzoF9JqmvyOSPI5azWUhuNFmLgFgpcem8PgY=;
        b=ioHoTy/cY72xQFMcIMePuKawXvbu+G8K7GIPUMTCbl6MM9PSE9OF8M+XmJSFiatUEh
         vJT5KVU4sz1Ts6InEjMkOhFvE03qtIo4S1vMUld/KNSEz6/hVQX+7+MUDOC0/ir+MvYq
         5Ng5lotIel1BhjopEyV9d1fI7UB9PVerBxpI+O8SdwcCKrPe0x/BSUmextjGV43LLrtX
         RGZieRh6Drgm3myVCsd28u3MI1kIzD4qUu0jX0HUWxiTVFf7/S/GI7cmPyHDnl+kiRVp
         d3BBc1prhUhk+tqRKvK2Vnl2vHFY0eyZR1bQx+nSMQG7mqXo5lkmyaSgoRnXOGv0abPS
         5KtQ==
X-Gm-Message-State: AFuF++naDKVBzEeAF69GOk4kkyUatwxjfn0VtWcS6UYyVwhBqgKmSpBH
	j7kUfClTmc4pOPts+sQryWery/a3bPNYQRyRQ9VjvUd+wlIzcLp6JkgiqJTjID2V5F2dDyJVdT1
	YVnTrjPw=
X-Gm-Gg: AYBFou2uIC+GSn8zc+RFNVHkXBFw69A5Sh31VKz2tZSKsJz22Qne742pzUjvFEgwgQ8
	cdSWy2yFEeiFKx6xsCgF6drppyZo1GbzImsLSd5ClCzgJ1onltm+6KiXsFTeowaK4vW8jBH+Ufa
	UlJu6E+rH+kAmgd6u6DhQ+PKou30WaMLzgpW2h4P1gSj5L4usxZNEXXRXF5wBxV7t2owKNVMXhy
	L/iR4t/llbTwz6IKGRN6j/+mhA6X1drRH3GhsadOM0BmL7Rg+Qr6TosVQKWZwN33Age4cHHGuxU
	IJNKDto2A5r1rnG/rN1FunFPKixNCGv+54O5e/yRYGESJV5WJ69HD30oqFs+AF8qLhKuh0oTj+E
	PcMTWsV2j7AcF8Z9KHQSOGoQspGWbIWfiz1B6gV0sJiptWXlOMLFkSIz+0swOYoU8j61KT4pQ1G
	wWvxeX+JMW51rOB+anNPsbKt1G2BDhmsgdPQIp4BMNhMrtn3eoz6/EQQXeFdJhyNb6ulAUtEDmW
	Zwu53/t1pCFol8E
X-Received: by 2002:a05:6000:2585:b0:485:8e72:93ad with SMTP id ffacd0b85a97d-4858e729492mr12768271f8f.0.1788599199505;
        Sat, 05 Sep 2026 02:06:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:98f:90b6:41a8:38d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm12613729f8f.30.2026.09.05.02.06.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:06:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta/lib: Clean up python library imports
Date: Sat,  5 Sep 2026 10:06:37 +0100
Message-ID: <20260905090637.2747518-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 09:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245146

There are a number of places os isn't imported as in class code, bitbake
has always handled this. Some external usages of the modules are triggering
exceptions from missing imports after bitbake's own imports were cleaned up.

Add the easily identified missing import os calls and move other imports
to the start of the files whilst there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/bootfiles.py        | 11 ++++++-----
 meta/lib/oe/buildstats.py       |  1 +
 meta/lib/oe/copy_buildsystem.py |  8 +++-----
 meta/lib/oe/distro_check.py     |  5 +++--
 meta/lib/oe/kernel.py           |  1 +
 meta/lib/oe/license.py          |  1 +
 meta/lib/oe/npm_registry.py     |  1 +
 meta/lib/oe/path.py             |  1 +
 meta/lib/oe/sanity.py           |  1 +
 meta/lib/oe/spdx_common.py      |  1 +
 meta/lib/oe/sstatesig.py        |  1 +
 meta/lib/oe/terminal.py         |  1 +
 meta/lib/oe/utils.py            |  1 +
 meta/lib/oeqa/utils/__init__.py | 10 +++++-----
 meta/lib/oeqa/utils/metadata.py |  2 ++
 15 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/bootfiles.py b/meta/lib/oe/bootfiles.py
index 7ee148c4e25..c69db1ad582 100644
--- a/meta/lib/oe/bootfiles.py
+++ b/meta/lib/oe/bootfiles.py
@@ -12,11 +12,12 @@
 #
 # Heavily inspired of bootimg_partition.py
 #
-def get_boot_files(deploy_dir, boot_files):
-    import re
-    import os
-    from glob import glob
 
+import os
+import re
+import glob
+
+def get_boot_files(deploy_dir, boot_files):
     if boot_files is None:
         return None
 
@@ -45,7 +46,7 @@ def get_boot_files(deploy_dir, boot_files):
                                 os.path.join(dst,
                                              os.path.basename(name))
 
-            srcs = glob(os.path.join(deploy_dir, src))
+            srcs = glob.glob(os.path.join(deploy_dir, src))
 
             for entry in srcs:
                 src = os.path.relpath(entry, deploy_dir)
diff --git a/meta/lib/oe/buildstats.py b/meta/lib/oe/buildstats.py
index 2700245ec69..db3d26afb8b 100644
--- a/meta/lib/oe/buildstats.py
+++ b/meta/lib/oe/buildstats.py
@@ -7,6 +7,7 @@
 # Because it is a real Python module, it can hold persistent state,
 # like open log files and the time of the last sampling.
 
+import os
 import time
 import re
 import bb.event
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index ced751b8356..73b868ff2ec 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -12,11 +12,13 @@
 #                              e.g.: ".*-downloads closed-.*"
 #
 
+import os
+import re
 import stat
 import shutil
+import subprocess
 
 def _smart_copy(src, dest):
-    import subprocess
     # smart_copy will choose the correct function depending on whether the
     # source is a file or a directory.
     mode = os.stat(src).st_mode
@@ -38,7 +40,6 @@ class BuildSystem(object):
         self.layers_exclude_pattern = d.getVar('SDK_LAYERS_EXCLUDE_PATTERN')
 
     def copy_bitbake_and_layers(self, destdir, workspace_name=None):
-        import re
         # Copy in all metadata layers + bitbake (as repositories)
         copied_corebase = None
         layers_copied = []
@@ -261,7 +262,6 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
         write_sigs_file(merged_output, arch_order, merged)
 
 def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cache, d, fixedlsbstring="", filterfile=None):
-    import shutil
     bb.note('Generating sstate-cache...')
 
     nativelsbstring = d.getVar('NATIVELSBSTRING')
@@ -282,8 +282,6 @@ def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cac
                         shutil.move(src, dest)
 
 def check_sstate_task_list(d, targets, filteroutfile, cmdprefix='', cwd=None, logfile=None):
-    import subprocess
-
     bb.note('Generating sstate task list...')
 
     if not cwd:
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 3494520f40d..1d78348ff3d 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -4,6 +4,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import os
+import shutil
+
 def create_socket(url, d):
     import urllib
     from bb.utils import export_proxies
@@ -150,8 +153,6 @@ def get_latest_released_ubuntu_source_package_list(d):
     return latest, package_names
 
 def create_distro_packages_list(distro_check_dir, d):
-    import shutil
-
     pkglst_dir = os.path.join(distro_check_dir, "package_lists")
     bb.utils.remove(pkglst_dir, True)
     bb.utils.mkdirhier(pkglst_dir)
diff --git a/meta/lib/oe/kernel.py b/meta/lib/oe/kernel.py
index ff88c41b218..624eace10ec 100644
--- a/meta/lib/oe/kernel.py
+++ b/meta/lib/oe/kernel.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
 import re
 
 # Return a value for the ARCH environment variable for kernel compilation (including
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index adcfc827cfc..bd1d85ad5fd 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -6,6 +6,7 @@
 """Code for parsing OpenEmbedded license strings"""
 
 import ast
+import os
 import re
 import oe.qa
 from fnmatch import fnmatchcase as fnmatch
diff --git a/meta/lib/oe/npm_registry.py b/meta/lib/oe/npm_registry.py
index d97ced7cdaf..6d8ad903cfd 100644
--- a/meta/lib/oe/npm_registry.py
+++ b/meta/lib/oe/npm_registry.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
 import bb
 import json
 import subprocess
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 7255d99bc2f..88d256f00b4 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -6,6 +6,7 @@
 
 import errno
 import glob
+import os
 import shutil
 import subprocess
 import os.path
diff --git a/meta/lib/oe/sanity.py b/meta/lib/oe/sanity.py
index 387d745024c..c9149ec974d 100644
--- a/meta/lib/oe/sanity.py
+++ b/meta/lib/oe/sanity.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
 import oe.utils
 
 def bblayers_conf_file(d):
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index f885f1832ae..ad2bc0ffda3 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -8,6 +8,7 @@ import bb
 import collections
 import json
 import oe.packagedata
+import os
 import re
 import shutil
 
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index bd509800726..9928f3af495 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -7,6 +7,7 @@ import bb.parse
 import bb.siggen
 import bb.runqueue
 import oe
+import os
 import netrc
 
 def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index ec65b616ab6..a8d3840153f 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -5,6 +5,7 @@
 #
 import logging
 import oe.classutils
+import os
 import shlex
 from bb.process import Popen, ExecutionError
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index d24f49b875a..66f6323addf 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -7,6 +7,7 @@
 import subprocess
 import traceback
 import errno
+import os
 
 import bb.parse
 from bb import multiprocessing
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index e03f7e33bb0..89e24e6492e 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -3,6 +3,11 @@
 #
 # SPDX-License-Identifier: MIT
 #
+
+import importlib
+import os
+import sys
+
 # Enable other layers to have modules in the same named directory
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
@@ -24,8 +29,6 @@ def avoid_paths_in_environ(paths):
 
         Returns new PATH without avoided PATHs.
     """
-    import os
-
     new_path = ''
     for p in os.environ['PATH'].split(':'):
        avoid = False
@@ -56,9 +59,6 @@ def make_logger_bitbake_compatible(logger):
     return logger
 
 def load_test_components(logger, executor):
-    import sys
-    import os
-    import importlib
 
     from oeqa.core.context import OETestContextExecutor
 
diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index b320df67e0b..e68cb5ce19f 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -5,6 +5,8 @@
 # Functions to get metadata from the testing host used
 # for analytics of test results.
 
+import os
+
 from collections import OrderedDict
 from collections.abc import MutableMapping
 from xml.dom.minidom import parseString

