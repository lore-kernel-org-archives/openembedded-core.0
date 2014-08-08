Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A92D570A8E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2014 15:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="585500745"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2014 15:06:15 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:31 -0500
Message-Id: <d3f119ba34c8504017304a6ea4468f68c06cf751.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 06/35] wic: Remove rt_util
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:40 -0000

More package-related stuff we don't need.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/rt_util.py | 223 ---------------------------------------------
 1 file changed, 223 deletions(-)
 delete mode 100644 scripts/lib/mic/rt_util.py

diff --git a/scripts/lib/mic/rt_util.py b/scripts/lib/mic/rt_util.py
deleted file mode 100644
index 2a31f4a..0000000
--- a/scripts/lib/mic/rt_util.py
+++ /dev/null
@@ -1,223 +0,0 @@
-#!/usr/bin/python -tt
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
-from __future__ import with_statement
-import os
-import sys
-import glob
-import re
-import shutil
-import subprocess
-
-from mic import bootstrap, msger
-from mic.conf import configmgr
-from mic.utils import errors, proxy
-from mic.utils.fs_related import find_binary_path, makedirs
-from mic.chroot import setup_chrootenv, cleanup_chrootenv
-
-expath = lambda p: os.path.abspath(os.path.expanduser(p))
-
-def bootstrap_mic(argv=None):
-
-
-    def mychroot():
-        os.chroot(rootdir)
-        os.chdir(cwd)
-
-    # by default, sys.argv is used to run mic in bootstrap
-    if not argv:
-        argv = sys.argv
-    if argv[0] not in ('/usr/bin/mic', 'mic'):
-        argv[0] = '/usr/bin/mic'
-
-    cropts = configmgr.create
-    bsopts = configmgr.bootstrap
-    distro = bsopts['distro_name'].lower()
-
-    rootdir = bsopts['rootdir']
-    pkglist = bsopts['packages']
-    cwd = os.getcwd()
-
-    # create bootstrap and run mic in bootstrap
-    bsenv = bootstrap.Bootstrap(rootdir, distro, cropts['arch'])
-    bsenv.logfile = cropts['logfile']
-    # rootdir is regenerated as a temp dir
-    rootdir = bsenv.rootdir
-
-    if 'optional' in bsopts:
-        optlist = bsopts['optional']
-    else:
-        optlist = []
-
-    try:
-        msger.info("Creating %s bootstrap ..." % distro)
-        bsenv.create(cropts['repomd'], pkglist, optlist)
-
-        # bootstrap is relocated under "bootstrap"
-        if os.path.exists(os.path.join(rootdir, "bootstrap")):
-            rootdir = os.path.join(rootdir, "bootstrap")
-
-        bsenv.dirsetup(rootdir)
-        sync_mic(rootdir)
-
-        #FIXME: sync the ks file to bootstrap
-        if "/" == os.path.dirname(os.path.abspath(configmgr._ksconf)):
-            safecopy(configmgr._ksconf, rootdir)
-
-        msger.info("Start mic in bootstrap: %s\n" % rootdir)
-        bindmounts = get_bindmounts(cropts)
-        ret = bsenv.run(argv, cwd, rootdir, bindmounts)
-
-    except errors.BootstrapError, err:
-        msger.warning('\n%s' % err)
-        if msger.ask("Switch to native mode and continue?"):
-            return
-        raise
-    except RuntimeError, err:
-        #change exception type but keep the trace back
-        value, tb = sys.exc_info()[1:]
-        raise errors.BootstrapError, value, tb
-    else:
-        sys.exit(ret)
-    finally:
-        bsenv.cleanup()
-
-def get_bindmounts(cropts):
-    binddirs =  [
-                  os.getcwd(),
-                  cropts['tmpdir'],
-                  cropts['cachedir'],
-                  cropts['outdir'],
-                  cropts['local_pkgs_path'],
-                ]
-    bindfiles = [
-                  cropts['logfile'],
-                  configmgr._ksconf,
-                ]
-
-    for lrepo in cropts['localrepos']:
-        binddirs.append(lrepo)
-
-    bindlist = map(expath, filter(None, binddirs))
-    bindlist += map(os.path.dirname, map(expath, filter(None, bindfiles)))
-    bindlist = sorted(set(bindlist))
-    bindmounts = ';'.join(bindlist)
-    return bindmounts
-
-
-def get_mic_binpath():
-    fp = None
-    try:
-        import pkg_resources # depends on 'setuptools'
-    except ImportError:
-        pass
-    else:
-        dist = pkg_resources.get_distribution('mic')
-        # the real script is under EGG_INFO/scripts
-        if dist.has_metadata('scripts/mic'):
-            fp = os.path.join(dist.egg_info, "scripts/mic")
-
-    if fp:
-        return fp
-
-    # not found script if 'flat' egg installed
-    try:
-        return find_binary_path('mic')
-    except errors.CreatorError:
-        raise errors.BootstrapError("Can't find mic binary in host OS")
-
-
-def get_mic_modpath():
-    try:
-        import mic
-    except ImportError:
-        raise errors.BootstrapError("Can't find mic module in host OS")
-    path = os.path.abspath(mic.__file__)
-    return os.path.dirname(path)
-
-def get_mic_libpath():
-    # TBD: so far mic lib path is hard coded
-    return "/usr/lib/mic"
-
-# the hard code path is prepared for bootstrap
-def sync_mic(bootstrap, binpth = '/usr/bin/mic',
-             libpth='/usr/lib',
-             pylib = '/usr/lib/python2.7/site-packages',
-             conf = '/etc/mic/mic.conf'):
-    _path = lambda p: os.path.join(bootstrap, p.lstrip('/'))
-
-    micpaths = {
-                 'binpth': get_mic_binpath(),
-                 'libpth': get_mic_libpath(),
-                 'pylib': get_mic_modpath(),
-                 'conf': '/etc/mic/mic.conf',
-               }
-
-    if not os.path.exists(_path(pylib)):
-        pyptn = '/usr/lib/python?.?/site-packages'
-        pylibs = glob.glob(_path(pyptn))
-        if pylibs:
-            pylib = pylibs[0].replace(bootstrap, '')
-        else:
-            raise errors.BootstrapError("Can't find python site dir in: %s" %
-                                        bootstrap)
-
-    for key, value in micpaths.items():
-        try:
-            safecopy(value, _path(eval(key)), False, ["*.pyc", "*.pyo"])
-        except (OSError, IOError), err:
-            raise errors.BootstrapError(err)
-
-    # auto select backend
-    conf_str = file(_path(conf)).read()
-    conf_str = re.sub("pkgmgr\s*=\s*.*", "pkgmgr=auto", conf_str)
-    with open(_path(conf), 'w') as wf:
-        wf.write(conf_str)
-
-    # chmod +x /usr/bin/mic
-    os.chmod(_path(binpth), 0777)
-
-    # correct python interpreter
-    mic_cont = file(_path(binpth)).read()
-    mic_cont = "#!/usr/bin/python\n" + mic_cont
-    with open(_path(binpth), 'w') as wf:
-        wf.write(mic_cont)
-
-
-def safecopy(src, dst, symlinks=False, ignore_ptns=()):
-    if os.path.isdir(src):
-        if os.path.isdir(dst):
-            dst = os.path.join(dst, os.path.basename(src))
-        if os.path.exists(dst):
-            shutil.rmtree(dst, ignore_errors=True)
-
-        src = src.rstrip('/')
-        # check common prefix to ignore copying itself
-        if dst.startswith(src + '/'):
-            ignore_ptns = list(ignore_ptns) + [ os.path.basename(src) ]
-
-        ignores = shutil.ignore_patterns(*ignore_ptns)
-        try:
-            shutil.copytree(src, dst, symlinks, ignores)
-        except (OSError, IOError):
-            shutil.rmtree(dst, ignore_errors=True)
-            raise
-    else:
-        if not os.path.isdir(dst):
-            makedirs(os.path.dirname(dst))
-
-        shutil.copy2(src, dst)
-- 
1.8.3.1


