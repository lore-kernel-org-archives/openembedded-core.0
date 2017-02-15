Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6DEF0731AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:01:56 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 01:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="64920354"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 15 Feb 2017 01:01:57 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E0CA76A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:00:54 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:28 +0200
Message-Id: <c56afe1117db0fab2b004400fb1363b5e11c5fdf.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 05/11] wic: remove msger module
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2017 09:01:58 -0000

Removed custom logger module msger as it's replaced
by wic logger.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py |   4 -
 scripts/lib/wic/msger.py  | 209 ----------------------------------------------
 2 files changed, 213 deletions(-)
 delete mode 100644 scripts/lib/wic/msger.py

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index b64714c..2ccd510 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -32,7 +32,6 @@ import logging
 import os
 import sys
 
-from wic import msger
 from wic.plugin import pluginmgr
 from wic.utils.misc import get_bitbake_var
 
@@ -184,9 +183,6 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
         logger.error("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
         sys.exit(1)
 
-    if options.debug:
-        msger.set_loglevel('debug')
-
     if not os.path.exists(options.outdir):
         os.makedirs(options.outdir)
 
diff --git a/scripts/lib/wic/msger.py b/scripts/lib/wic/msger.py
deleted file mode 100644
index dc9b734..0000000
--- a/scripts/lib/wic/msger.py
+++ /dev/null
@@ -1,209 +0,0 @@
-#!/usr/bin/env python -tt
-# vim: ai ts=4 sts=4 et sw=4
-#
-# Copyright (c) 2009, 2010, 2011 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-import os
-import sys
-import re
-import time
-
-__ALL__ = ['get_loglevel',
-           'set_loglevel',
-           'set_logfile',
-           'debug',
-           'verbose',
-           'info',
-           'warning',
-           'error',
-          ]
-
-# COLORs in ANSI
-INFO_COLOR = 32 # green
-WARN_COLOR = 33 # yellow
-ERR_COLOR = 31 # red
-ASK_COLOR = 34 # blue
-NO_COLOR = 0
-
-PREFIX_RE = re.compile('^<(.*?)>\s*(.*)', re.S)
-
-INTERACTIVE = True
-
-LOG_LEVEL = 1
-LOG_LEVELS = {
-    'quiet': 0,
-    'normal': 1,
-    'verbose': 2,
-    'debug': 3,
-    'never': 4,
-}
-
-LOG_FILE_FP = None
-LOG_CONTENT = ''
-CATCHERR_BUFFILE_FD = -1
-CATCHERR_BUFFILE_PATH = None
-CATCHERR_SAVED_2 = -1
-
-def _general_print(head, color, msg=None, stream=None, level='normal'):
-    global LOG_CONTENT
-    if not stream:
-        stream = sys.stdout
-
-    if LOG_LEVELS[level] > LOG_LEVEL:
-        # skip
-        return
-
-    errormsg = ''
-    if CATCHERR_BUFFILE_FD > 0:
-        size = os.lseek(CATCHERR_BUFFILE_FD, 0, os.SEEK_END)
-        os.lseek(CATCHERR_BUFFILE_FD, 0, os.SEEK_SET)
-        errormsg = os.read(CATCHERR_BUFFILE_FD, size)
-        os.ftruncate(CATCHERR_BUFFILE_FD, 0)
-
-    # append error msg to LOG
-    if errormsg:
-        LOG_CONTENT += errormsg
-
-    # append normal msg to LOG
-    save_msg = msg.strip() if msg else None
-    if save_msg:
-        timestr = time.strftime("[%m/%d %H:%M:%S %Z] ", time.localtime())
-        LOG_CONTENT += timestr + save_msg + '\n'
-
-    if errormsg:
-        _color_print('', NO_COLOR, errormsg, stream, level)
-
-    _color_print(head, color, msg, stream, level)
-
-def _color_print(head, color, msg, stream, level):
-    colored = True
-    if color == NO_COLOR or \
-       not stream.isatty() or \
-       os.getenv('ANSI_COLORS_DISABLED') is not None:
-        colored = False
-
-    if head.startswith('\r'):
-        # need not \n at last
-        newline = False
-    else:
-        newline = True
-
-    if colored:
-        head = '\033[%dm%s:\033[0m ' %(color, head)
-        if not newline:
-            # ESC cmd to clear line
-            head = '\033[2K' + head
-    else:
-        if head:
-            head += ': '
-            if head.startswith('\r'):
-                head = head.lstrip()
-                newline = True
-
-    if msg is not None:
-        stream.write('%s%s' % (head, msg))
-        if newline:
-            stream.write('\n')
-
-    stream.flush()
-
-def _color_perror(head, color, msg, level='normal'):
-    if CATCHERR_BUFFILE_FD > 0:
-        _general_print(head, color, msg, sys.stdout, level)
-    else:
-        _general_print(head, color, msg, sys.stderr, level)
-
-def _split_msg(head, msg):
-    if isinstance(msg, list):
-        msg = '\n'.join(map(str, msg))
-
-    if msg.startswith('\n'):
-        # means print \n at first
-        msg = msg.lstrip()
-        head = '\n' + head
-
-    elif msg.startswith('\r'):
-        # means print \r at first
-        msg = msg.lstrip()
-        head = '\r' + head
-
-    match = PREFIX_RE.match(msg)
-    if match:
-        head += ' <%s>' % match.group(1)
-        msg = match.group(2)
-
-    return head, msg
-
-def get_loglevel():
-    return next((k for k, v in LOG_LEVELS.items() if v == LOG_LEVEL))
-
-def set_loglevel(level):
-    global LOG_LEVEL
-    if level not in LOG_LEVELS:
-        # no effect
-        return
-
-    LOG_LEVEL = LOG_LEVELS[level]
-
-def set_interactive(mode=True):
-    global INTERACTIVE
-    if mode:
-        INTERACTIVE = True
-    else:
-        INTERACTIVE = False
-
-def log(msg=''):
-    # log msg to LOG_CONTENT then save to logfile
-    global LOG_CONTENT
-    if msg:
-        LOG_CONTENT += msg
-
-def info(msg):
-    head, msg = _split_msg('Info', msg)
-    _general_print(head, INFO_COLOR, msg)
-
-def verbose(msg):
-    head, msg = _split_msg('Verbose', msg)
-    _general_print(head, INFO_COLOR, msg, level='verbose')
-
-def warning(msg):
-    head, msg = _split_msg('Warning', msg)
-    _color_perror(head, WARN_COLOR, msg)
-
-def debug(msg):
-    head, msg = _split_msg('Debug', msg)
-    _color_perror(head, ERR_COLOR, msg, level='debug')
-
-def error(msg):
-    head, msg = _split_msg('Error', msg)
-    _color_perror(head, ERR_COLOR, msg)
-    sys.exit(1)
-
-def set_logfile(fpath):
-    global LOG_FILE_FP
-
-    def _savelogf():
-        if LOG_FILE_FP:
-            with open(LOG_FILE_FP, 'w') as log:
-                log.write(LOG_CONTENT)
-
-    if LOG_FILE_FP is not None:
-        warning('duplicate log file configuration')
-
-    LOG_FILE_FP = fpath
-
-    import atexit
-    atexit.register(_savelogf)
-- 
2.1.4


