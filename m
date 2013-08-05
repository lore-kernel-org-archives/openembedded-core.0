Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 485E96B41A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 11:42:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r75BgErv004444
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Aug 2013 04:42:14 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 5 Aug 2013 04:42:12 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Aug 2013 19:42:09 +0800
Message-ID: <45031ec1c7ac38a3d3ba468c665daace24cb85dd.1375702232.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375702232.git.hongxu.jia@windriver.com>
References: <cover.1375702232.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] list-packageconfig-flags.py: add a script to list all PACKAGECONFIG flags
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
X-List-Received-Date: Mon, 05 Aug 2013 11:42:12 -0000
Content-Type: text/plain

- This script will list available pkgs which have PACKAGECONFIG flags.
- If option '-f' is used, it will list available PACKAGECONFIG flags
  and all affected pkgs.
- If option '-a' is used, it will list all pkgs and PACKAGECONFIG
  information
- If option '-p' is used, it means list the pkgs with preferred version

EXAMPLE:
list-packageconfig-flags.py
PACKAGE NAME                               PACKAGECONFIG FLAGS
==============================================================
alsa-tools-1.0.26.1                        defaultval gtk+
avahi-ui-0.6.31                            defaultval python
bluez4-4.101                               alsa defaultval pie

list-packageconfig-flags.py -f
PACKAGECONFIG FLAG     PACKAGE NAMES
====================================
3g                     connman-1.16
avahi                  cups-1.6.3  pulseaudio-4.0
beecrypt               rpm-5.4.9  rpm-native-5.4.9

list-packageconfig-flags.py -a
==================================================
gtk+-2.24.18
/home/jiahongxu/yocto/poky/meta/recipes-gnome/gtk+/gtk+_2.24.18.bb
PACKAGECONFIG x11
PACKAGECONFIG[x11] --with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}

xf86-video-intel-2.21.9
/home/jiahongxu/yocto/poky/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb
PACKAGECONFIG None
PACKAGECONFIG[xvmc] --enable-xvmc,--disable-xvmc,libxvmc
PACKAGECONFIG[sna] --enable-sna,--disable-sna

[YOCTO #4368]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 scripts/contrib/list-packageconfig-flags.py | 191 ++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100755 scripts/contrib/list-packageconfig-flags.py

diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
new file mode 100755
index 0000000..149922d
--- /dev/null
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -0,0 +1,191 @@
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
+# - list available pkgs which have PACKAGECONFIG flags
+# - list available PACKAGECONFIG flags and all affected pkgs
+# - list all pkgs and PACKAGECONFIG information
+
+import sys
+import getopt
+import os
+
+# For importing the following modules
+sys.path.insert(0, os.path.join(os.path.abspath(os.path.dirname(sys.argv[0])), '../../bitbake/lib'))
+import bb.cache
+import bb.cooker
+import bb.providers
+import bb.tinfoil
+
+usage_body = '''  list available pkgs which have PACKAGECONFIG flags
+
+OPTION:
+  -h, --help    display this help and exit
+  -f, --flag    list available PACKAGECONFIG flags and all affected pkgs
+  -a, --all     list all pkgs and PACKAGECONFIG information
+  -p, --prefer  list pkgs with preferred version
+
+EXAMPLE:
+list-packageconfig-flags.py poky/meta poky/meta-yocto
+list-packageconfig-flags.py -f poky/meta poky/meta-yocto
+list-packageconfig-flags.py -a poky/meta poky/meta-yocto
+list-packageconfig-flags.py -p poky/meta poky/meta-yocto
+list-packageconfig-flags.py -f -p poky/meta poky/meta-yocto
+list-packageconfig-flags.py -a -p poky/meta poky/meta-yocto
+'''
+
+def usage():
+    print 'Usage: %s [-f|-a] [-p]' % os.path.basename(sys.argv[0])
+    print usage_body
+
+def get_fnlist(bbhandler, pkg_pn, preferred):
+    ''' Get all recipe file names '''
+    if preferred:
+        (latest_versions, preferred_versions) = bb.providers.findProviders(bbhandler.config_data, bbhandler.cooker.recipecache, pkg_pn)
+
+    fn_list = []
+    for pn in sorted(pkg_pn):
+        if preferred:
+            fn_list.append(preferred_versions[pn][1])
+        else:
+            fn_list.extend(pkg_pn[pn])
+
+    return fn_list
+
+def get_recipesdata(bbhandler, preferred):
+    ''' Get data of all available recipes which have PACKAGECONFIG flags '''
+    pkg_pn = bbhandler.cooker.recipecache.pkg_pn
+
+    data_dict = {}
+    for fn in get_fnlist(bbhandler, pkg_pn, preferred):
+        data = bb.cache.Cache.loadDataFull(fn, bbhandler.cooker.collection.get_file_appends(fn), bbhandler.config_data)
+        if data.getVarFlags("PACKAGECONFIG"):
+            data_dict[fn] = data
+
+    return data_dict
+
+def collect_pkgs(data_dict):
+    ''' Collect available pkgs in which have PACKAGECONFIG flags '''
+    # pkg_dict = {'pkg1': ['flag1', 'flag2',...]}
+    pkg_dict = {}
+    for fn in data_dict:
+        pkgconfigflags = data_dict[fn].getVarFlags("PACKAGECONFIG")
+        pkgname = data_dict[fn].getVar("P", True)
+        pkg_dict[pkgname] = sorted(pkgconfigflags.keys())
+
+    return pkg_dict
+
+def collect_flags(pkg_dict):
+    ''' Collect available PACKAGECONFIG flags and all affected pkgs '''
+    # flag_dict = {'flag': ['pkg1', 'pkg2',...]}
+    flag_dict = {}
+    for pkgname, flaglist in pkg_dict.iteritems():
+        for flag in flaglist:
+            if flag == "defaultval":
+                continue
+
+            if flag in flag_dict:
+                flag_dict[flag].append(pkgname)
+            else:
+                flag_dict[flag] = [pkgname]
+
+    return flag_dict
+
+def display_pkgs(pkg_dict):
+    ''' Display available pkgs which have PACKAGECONFIG flags '''
+    pkgname_len = len("PACKAGE NAME") + 1
+    for pkgname in pkg_dict:
+        if pkgname_len < len(pkgname):
+            pkgname_len = len(pkgname)
+    pkgname_len += 1
+
+    header = '%-*s%s' % (pkgname_len, str("PACKAGE NAME"), str("PACKAGECONFIG FLAGS"))
+    print header
+    print str("").ljust(len(header), '=')
+    for pkgname in sorted(pkg_dict):
+        print('%-*s%s' % (pkgname_len, pkgname, ' '.join(pkg_dict[pkgname])))
+
+
+def display_flags(flag_dict):
+    ''' Display available PACKAGECONFIG flags and all affected pkgs '''
+    flag_len = len("PACKAGECONFIG FLAG") + 5
+
+    header = '%-*s%s' % (flag_len, str("PACKAGECONFIG FLAG"), str("PACKAGE NAMES"))
+    print header
+    print str("").ljust(len(header), '=')
+
+    for flag in sorted(flag_dict):
+        print('%-*s%s' % (flag_len, flag, '  '.join(sorted(flag_dict[flag]))))
+
+def display_all(data_dict):
+    ''' Display all pkgs and PACKAGECONFIG information '''
+    print str("").ljust(50, '=')
+    for fn in data_dict:
+        print('%s' % data_dict[fn].getVar("P", True))
+        print fn
+        packageconfig = data_dict[fn].getVar("PACKAGECONFIG", True) or ''
+        if packageconfig.strip() == '':
+            packageconfig = 'None'
+        print('PACKAGECONFIG %s' % packageconfig)
+
+        for flag,flag_val in data_dict[fn].getVarFlags("PACKAGECONFIG").iteritems():
+            if flag == "defaultval":
+                continue
+            print('PACKAGECONFIG[%s] %s' % (flag, flag_val))
+        print ''
+
+def main():
+    listtype = 'pkgs'
+    preferred = False
+    pkg_dict = {}
+    flag_dict = {}
+
+    # Collect and validate input
+    try:
+        opts, args = getopt.getopt(sys.argv[1:], "hfap", ["help", "flag", "all", "prefer"])
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
+        elif opt in ('-a', '--all'):
+            listtype = 'all'
+        elif opt in ('-p', '--prefer'):
+            preferred = True
+        else:
+            assert False, "unhandled option"
+
+    bbhandler = bb.tinfoil.Tinfoil()
+    bbhandler.prepare()
+    data_dict = get_recipesdata(bbhandler, preferred)
+
+    if listtype == 'flags':
+        pkg_dict = collect_pkgs(data_dict)
+        flag_dict = collect_flags(pkg_dict)
+        display_flags(flag_dict)
+    elif listtype == 'pkgs':
+        pkg_dict = collect_pkgs(data_dict)
+        display_pkgs(pkg_dict)
+    elif listtype == 'all':
+        display_all(data_dict)
+
+if __name__ == "__main__":
+    main()
-- 
1.8.1.2


