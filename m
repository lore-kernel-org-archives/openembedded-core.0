Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 58E17731FA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 04 May 2016 08:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="972537009"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2016 08:27:32 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id D40AA6A4008
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:20 +0300
Message-Id: <b6e73f08882d8796e574af9ddadc2957a70a0bd5.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 07/14] wic: remove unused functions
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
X-List-Received-Date: Wed, 04 May 2016 15:27:41 -0000

Removed 'raw', 'ask', 'choice' and 'pause' functions from
msger.py as they're not used in wic code and some of them
use raw_input, which is not present in Python 3.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/msger.py | 69 +-----------------------------------------------
 1 file changed, 1 insertion(+), 68 deletions(-)

diff --git a/scripts/lib/wic/msger.py b/scripts/lib/wic/msger.py
index b737554..2340ac2 100644
--- a/scripts/lib/wic/msger.py
+++ b/scripts/lib/wic/msger.py
@@ -21,18 +21,14 @@ import sys
 import re
 import time
 
-__ALL__ = ['set_mode',
-           'get_loglevel',
+__ALL__ = ['get_loglevel',
            'set_loglevel',
            'set_logfile',
-           'raw',
            'debug',
            'verbose',
            'info',
            'warning',
            'error',
-           'ask',
-           'pause',
           ]
 
 # COLORs in ANSI
@@ -182,9 +178,6 @@ def log(msg=''):
     if msg:
         LOG_CONTENT += msg
 
-def raw(msg=''):
-    _general_print('', NO_COLOR, msg)
-
 def info(msg):
     head, msg = _split_msg('Info', msg)
     _general_print(head, INFO_COLOR, msg)
@@ -206,66 +199,6 @@ def error(msg):
     _color_perror(head, ERR_COLOR, msg)
     sys.exit(1)
 
-def ask(msg, default=True):
-    _general_print('\rQ', ASK_COLOR, '')
-    try:
-        if default:
-            msg += '(Y/n) '
-        else:
-            msg += '(y/N) '
-        if INTERACTIVE:
-            while True:
-                repl = raw_input(msg)
-                if repl.lower() == 'y':
-                    return True
-                elif repl.lower() == 'n':
-                    return False
-                elif not repl.strip():
-                    # <Enter>
-                    return default
-
-                # else loop
-        else:
-            if default:
-                msg += ' Y'
-            else:
-                msg += ' N'
-            _general_print('', NO_COLOR, msg)
-
-            return default
-    except KeyboardInterrupt:
-        sys.stdout.write('\n')
-        sys.exit(2)
-
-def choice(msg, choices, default=0):
-    if default >= len(choices):
-        return None
-    _general_print('\rQ', ASK_COLOR, '')
-    try:
-        msg += " [%s] " % '/'.join(choices)
-        if INTERACTIVE:
-            while True:
-                repl = raw_input(msg)
-                if repl in choices:
-                    return repl
-                elif not repl.strip():
-                    return choices[default]
-        else:
-            msg += choices[default]
-            _general_print('', NO_COLOR, msg)
-
-            return choices[default]
-    except KeyboardInterrupt:
-        sys.stdout.write('\n')
-        sys.exit(2)
-
-def pause(msg=None):
-    if INTERACTIVE:
-        _general_print('\rQ', ASK_COLOR, '')
-        if msg is None:
-            msg = 'press <ENTER> to continue ...'
-        raw_input(msg)
-
 def set_logfile(fpath):
     global LOG_FILE_FP
 
-- 
2.1.4


