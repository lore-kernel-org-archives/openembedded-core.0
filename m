Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 005356B1F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 11:04:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r71B4BaM026491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Aug 2013 04:04:11 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 1 Aug 2013 04:04:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Aug 2013 19:04:05 +0800
Message-ID: <2339c72ba0e5afb7379f065ad403e3209b334956.1375354695.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375354695.git.hongxu.jia@windriver.com>
References: <cover.1375354695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] list-packageconfig-flag.py: add a script to list all PACKAGECONFIG's flags
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
X-List-Received-Date: Thu, 01 Aug 2013 11:04:11 -0000
Content-Type: text/plain

list-packageconfig-flag.py will walk the METADIR and collect recipes which
have PACKAGECONFIG's flags.

The default display is to list recipes which have PACKAGECONFIG's flags in
METADIR. If option '-f' is used, it will list PACKAGECONFIG's flags and all
affected recipes in METADIR

EXAMPLE:
list-packageconfig-flag.py poky/meta poky/meta-yocto
RECIPE NAME          PACKAGECONFIG's flag
=========================================
libarchive_2.8.5.bb  acl xattr largefile zlib bz2 xz openssl libxml2 expat
strace_4.8.bb        libaio acl
connman.inc          wifi bluetooth 3g tist openvpn vpnc l2tp pptp wispr

list-packageconfig-flag.py -f poky/meta poky/meta-yocto
PACKAGECONFIG's flag     RECIPE NAME
====================================
speex                    gstreamer1.0-plugins-good.inc
keyutils                 rpm_5.4.9.bb
gallium-egl              mesa.inc

[YOCTO #4368]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/contrib/list-packageconfig-flag.py | 180 +++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100755 scripts/contrib/list-packageconfig-flag.py

diff --git a/scripts/contrib/list-packageconfig-flag.py b/scripts/contrib/list-packageconfig-flag.py
new file mode 100755
index 0000000..7a5568f
--- /dev/null
+++ b/scripts/contrib/list-packageconfig-flag.py
@@ -0,0 +1,180 @@
+#!/usr/bin/env python
+
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software Foundation.
+#
+# Copyright (C) 2013 Wind River Systems, Inc.
+#
+# list recipes which have PACKAGECONFIG's flags in METADIR
+# list PACKAGECONFIG's flags and all affected recipes in METADIR
+#
+
+import sys
+import getopt
+import os
+import re
+
+usage_body = '''  list recipes which have PACKAGECONFIG's flags in METADIR
+
+OPTION:
+  -h, --help  display this help and exit
+  -f, --flag  list PACKAGECONFIG's flags and all affected recipes in METADIR
+
+EXAMPLE:
+list-packageconfig-flag.py poky/meta poky/meta-yocto
+list-packageconfig-flag.py -f poky/meta poky/meta-yocto
+'''
+
+def usage():
+    print 'Usage: %s [OPTION] [METADIR]...' % os.path.basename(sys.argv[0])
+    print usage_body
+
+def parse_recipe(recipe):
+    ''' Parse a recipe to collect PACKAGECONFIG's flags '''
+    prog = re.compile(r' *PACKAGECONFIG\[(?P<flag>.*)\] *=.*')
+    try:
+        r = open(recipe)
+    except IOError as (errno, strerror):
+        print >> sys.stderr, 'WARNING: Failed to open recipe', recipe
+
+    flaglist = []
+    for line in r:
+        # Strip any comments from the line
+        line = line.rsplit('#')[0]
+        m = prog.match(line)
+        if m:
+            flaglist.append(m.group('flag'))
+    r.close()
+
+    return flaglist
+
+def process_recipes(metadir):
+    ''' Collect recipes which have PACKAGECONFIG's flags in METADIR '''
+    # recipesdict = {'recipe': ['flag1', 'flag2',...]}
+    recipesdict = {}
+    for root,dirs,files in os.walk(metadir):
+        for name in files:
+            if name.find(".bb") >= 0 or name.find(".inc") >= 0:
+                flaglist = parse_recipe(os.path.join(root,name))
+                if flaglist:
+                    recipesdict[name] = flaglist
+
+    return recipesdict
+
+def collect_flags(recipesdict):
+    ''' Collect PACKAGECONFIG's flags and all affected recipes in recipesdict '''
+    # flagsdict = {'flag': ['recipe1', 'recipe2',...]}
+    flagsdict = {}
+    for recipename,flaglist in recipesdict.iteritems():
+        for flag in flaglist:
+            if flag in flagsdict:
+                flagsdict[flag].append(recipename)
+            else:
+                flagsdict[flag] = [recipename]
+
+    return flagsdict
+
+def display_recipes(recipesdict):
+    ''' Display recipes which have PACKAGECONFIG's flags in recipesdict '''
+    recipename_len = len("RECIPE NAME") + 1
+    for recipename in recipesdict:
+        if recipename_len < len(recipename):
+            recipename_len = len(recipename)
+    recipename_len += 1
+
+    header = '%-*s%s' % (recipename_len, str("RECIPE NAME"), str("PACKAGECONFIG's flag"))
+    print header
+    print str("").ljust(len(header), '=')
+    for recipename, flaglist in recipesdict.iteritems():
+        print('%-*s%s' % (recipename_len, recipename, ' '.join(flaglist)))
+
+
+def display_flags(flagsdict):
+    ''' Display PACKAGECONFIG's flags and all affected recipes in flagsdict '''
+    flag_len = len("PACKAGECONFIG's flag") + 5
+
+    header = '%-*s%s' % (flag_len, str("PACKAGECONFIG's flag"), str("RECIPE NAME"))
+    print header
+    print str("").ljust(len(header), '=')
+
+    for flag in flagsdict:
+        print('%-*s%s' % (flag_len, flag, '  '.join(flagsdict[flag])))
+
+def filter_subdirs(dirlist):
+    '''Filter out subdirs in dirlist'''
+    def dir_is_subdir(dir, dirlist):
+        for curdir in dirlist:
+            dirs = dir.split('/')
+            curdirs = curdir.split('/')
+            curdirsdepth = len(curdirs)
+            if curdirsdepth < len(dirs):
+                if dirs[:curdirsdepth] == curdirs[:curdirsdepth]:
+                    return True
+        return False
+
+    for curdir in dirlist[:]:
+        if dir_is_subdir(curdir, dirlist):
+            dirlist.remove(curdir)
+
+def main():
+    metadirs = []
+    listtype = 'recipes'
+    recipesdict = {}
+    flagsdict = {}
+
+    # Collect and validate input
+    try:
+        opts, args = getopt.getopt(sys.argv[1:], "hf", ["help", "flag"])
+    except getopt.GetoptError, err:
+        print >> sys.stderr,'%s' % str(err)
+        usage()
+        sys.exit(2)
+    for opt, value in opts:
+        if opt in ('-h', '--help'):
+            usage()
+            sys.exit(0)
+        elif opt in ('-f', '--flag'):
+            listtype = 'flags'
+        else:
+            assert False, "unhandled option"
+
+    for metadir in args:
+        if os.path.isdir(metadir):
+            metadir = os.path.abspath(metadir)
+            if metadir not in metadirs:
+                metadirs.append(metadir)
+        else:
+            print >> sys.stderr, 'ERROR: meta directory \'%s\' is not a directory' % (metadir)
+            sys.exit(3)
+
+    if len(metadirs) == 0:
+        print >> sys.stderr, 'ERROR: no metadir specified'
+        usage()
+        sys.exit(4)
+    else:
+        # Filter out subdirs to save time
+        filter_subdirs(metadirs)
+
+    # Collect recipes which have PACKAGECONFIG's flags in metadirs
+    for metadir in metadirs:
+        recipesdict.update(process_recipes(metadir))
+
+    if listtype == 'flags':
+        # Collect PACKAGECONFIG's flags and all affected recipes in recipesdict
+        flagsdict = collect_flags(recipesdict)
+        display_flags(flagsdict)
+    elif listtype == 'recipes':
+        display_recipes(recipesdict)
+
+if __name__ == "__main__":
+    main()
-- 
1.8.1.2


