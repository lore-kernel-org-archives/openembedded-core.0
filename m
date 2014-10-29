Return-Path: <martin@hundeboll.net>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 212E0601A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 11:27:23 +0000 (UTC)
Received: from hundeboll.es.aau.dk (192.38.55.25.natpool.es.aau.dk
	[192.38.55.25])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 436301BF2BD;
	Wed, 29 Oct 2014 12:18:49 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 12:18:46 +0100
Message-Id: <1414581527-5448-2-git-send-email-martin@hundeboll.net>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <1414581527-5448-1-git-send-email-martin@hundeboll.net>
References: <1414581527-5448-1-git-send-email-martin@hundeboll.net>
MIME-Version: 1.0
Subject: [RFC 1/2] scripts: use python2 explicitly in shebangs
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
X-List-Received-Date: Wed, 29 Oct 2014 11:27:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As distributions start moving to python3, scripts should explicity
request python2 in the shebang. This patch changes all occurences of
    #!/usr/bin/python and #!/usr/bin/env python
to
    #!/usr/bin/env python2

The change was done using the a massive oneline[1]; followed by some
manual replacements of direct shell calls to 'python and wrong
replacements (e.g. in patches).

This change was tested on Arch Linux, and succeeds in building
core-image-minimal. More extended builds will likely fail due to the use
of python[^23], but should easily be fixed.

To the best of my knowledge, recent versions of Ubuntu ship with
/usr/bin/python2 pointing to python2.7 (see [2]), but users of older
versions might need to create this symlink manually.

Comments and suggestions are welcome!

[1] git grep -l -E "/usr/bin/env python|/usr/bin/python" \
        | xargs sed -Ei '/python3/!s/\/usr\/bin\/env \
        python(.*)/\/usr\/bin\/env \
        python2\1/;/python3/!s/\/usr\/bin\/python(.*)/\
        \/usr\/bin\/env python2\1/'
[2] https://wiki.ubuntu.com/Python/3

Signed-off-by: Martin Hundebøll <martin@hundeboll.net>
---
 bitbake/bin/bitbake                                  |  2 +-
 bitbake/bin/bitbake-diffsigs                         |  2 +-
 bitbake/bin/bitbake-dumpsig                          |  2 +-
 bitbake/bin/bitbake-layers                           |  2 +-
 bitbake/bin/bitbake-prserv                           |  2 +-
 bitbake/bin/bitbake-selftest                         |  2 +-
 bitbake/bin/bitbake-worker                           |  2 +-
 bitbake/bin/bitdoc                                   |  2 +-
 bitbake/bin/image-writer                             |  2 +-
 bitbake/bin/toaster                                  | 14 +++++++-------
 bitbake/contrib/dump_cache.py                        |  2 +-
 bitbake/lib/bb/cooker.py                             |  2 +-
 bitbake/lib/bb/cookerdata.py                         |  2 +-
 bitbake/lib/bb/monitordisk.py                        |  2 +-
 bitbake/lib/bb/namedtuple_with_abc.py                |  2 +-
 bitbake/lib/bb/parse/parse_py/BBHandler.py           |  2 +-
 bitbake/lib/bb/parse/parse_py/ConfHandler.py         |  2 +-
 bitbake/lib/bb/parse/parse_py/__init__.py            |  2 +-
 bitbake/lib/bb/pysh/lsprof.py                        |  2 +-
 bitbake/lib/bb/runqueue.py                           |  2 +-
 bitbake/lib/bb/taskdata.py                           |  2 +-
 bitbake/lib/bb/ui/crumbs/builddetailspage.py         |  2 +-
 bitbake/lib/bb/ui/crumbs/builder.py                  |  2 +-
 bitbake/lib/bb/ui/crumbs/hobpages.py                 |  2 +-
 bitbake/lib/bb/ui/crumbs/imageconfigurationpage.py   |  2 +-
 bitbake/lib/bb/ui/crumbs/imagedetailspage.py         |  2 +-
 bitbake/lib/bb/ui/crumbs/packageselectionpage.py     |  2 +-
 bitbake/lib/bb/ui/crumbs/recipeselectionpage.py      |  2 +-
 bitbake/lib/bb/ui/crumbs/sanitycheckpage.py          |  2 +-
 bitbake/lib/bb/ui/hob.py                             |  2 +-
 bitbake/lib/progressbar.py                           |  2 +-
 bitbake/lib/toaster/manage.py                        |  2 +-
 .../lib/toaster/orm/fixtures/orm_views_testdata.json |  2 +-
 meta/classes/package_rpm.bbclass                     |  2 +-
 meta/lib/oeqa/runexported.py                         |  2 +-
 meta/recipes-connectivity/bind/bind_9.9.5.bb         |  2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb        |  1 +
 meta/recipes-core/glib-2.0/glib.inc                  |  2 +-
 .../pseudo/files/0002-pseudo_force_python2.patch     | 20 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb         |  1 +
 meta/recipes-devtools/python/python-native_2.7.3.bb  |  4 ++--
 meta/recipes-devtools/python/python/cgi_py.patch     |  2 +-
 meta/recipes-devtools/python/python3-native_3.3.3.bb |  2 +-
 meta/recipes-devtools/python/python3/cgi_py.patch    |  4 ++--
 meta/recipes-devtools/qemu/qemu.inc                  |  2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc         |  2 +-
 .../use-usr-bin-env-for-python-in-xml2po.patch       |  4 ++--
 .../libglade/libglade-2.6.4/python_environment.patch |  2 +-
 .../builder/files/please_wait_dialog.py              |  2 +-
 ...001-rt-tests-Allow-for-user-specified-PYLIB.patch |  4 ++--
 ...hon-scripts-should-use-interpreter-from-env.patch |  8 ++++----
 .../createrepo/createrepo/rpm-createsolvedb.py       |  2 +-
 meta/recipes-support/createrepo/createrepo_0.4.11.bb |  4 ++--
 scripts/bitbake-whatchanged                          |  2 +-
 scripts/buildhistory-collect-srcrevs                 |  2 +-
 scripts/buildhistory-diff                            |  2 +-
 scripts/cleanup-workdir                              |  2 +-
 scripts/combo-layer                                  |  2 +-
 scripts/contrib/bbvars.py                            |  2 +-
 scripts/contrib/graph-tool                           |  2 +-
 scripts/contrib/list-packageconfig-flags.py          |  2 +-
 scripts/contrib/python/generate-manifest-2.7.py      |  2 +-
 scripts/contrib/python/generate-manifest-3.3.py      |  2 +-
 scripts/cp-noerror                                   |  2 +-
 scripts/create-recipe                                | 12 ++++++------
 scripts/jhbuild/jhbuild2oe.py                        |  2 +-
 scripts/lib/mic/bootstrap.py                         |  2 +-
 scripts/lib/mic/chroot.py                            |  2 +-
 scripts/lib/mic/conf.py                              |  2 +-
 scripts/lib/mic/creator.py                           |  2 +-
 scripts/lib/mic/imager/baseimager.py                 |  2 +-
 scripts/lib/mic/imager/fs.py                         |  2 +-
 scripts/lib/mic/imager/livecd.py                     |  2 +-
 scripts/lib/mic/imager/liveusb.py                    |  2 +-
 scripts/lib/mic/imager/loop.py                       |  2 +-
 scripts/lib/mic/imager/raw.py                        |  2 +-
 scripts/lib/mic/kickstart/__init__.py                |  2 +-
 scripts/lib/mic/kickstart/custom_commands/desktop.py |  2 +-
 .../lib/mic/kickstart/custom_commands/installerfw.py |  2 +-
 scripts/lib/mic/kickstart/custom_commands/micboot.py |  2 +-
 .../mic/kickstart/custom_commands/micpartition.py    |  2 +-
 scripts/lib/mic/kickstart/custom_commands/micrepo.py |  2 +-
 scripts/lib/mic/msger.py                             |  2 +-
 scripts/lib/mic/plugin.py                            |  2 +-
 scripts/lib/mic/pluginbase.py                        |  2 +-
 scripts/lib/mic/plugins/backend/yumpkgmgr.py         |  2 +-
 scripts/lib/mic/plugins/backend/zypppkgmgr.py        |  2 +-
 scripts/lib/mic/plugins/hook/empty_hook.py           |  2 +-
 scripts/lib/mic/plugins/imager/fs_plugin.py          |  2 +-
 scripts/lib/mic/plugins/imager/livecd_plugin.py      |  2 +-
 scripts/lib/mic/plugins/imager/liveusb_plugin.py     |  2 +-
 scripts/lib/mic/plugins/imager/loop_plugin.py        |  2 +-
 scripts/lib/mic/plugins/imager/raw_plugin.py         |  2 +-
 scripts/lib/mic/rt_util.py                           |  4 ++--
 scripts/lib/mic/utils/cmdln.py                       |  2 +-
 scripts/lib/mic/utils/errors.py                      |  2 +-
 scripts/lib/mic/utils/fs_related.py                  |  2 +-
 scripts/lib/mic/utils/gpt_parser.py                  |  2 +-
 scripts/lib/mic/utils/grabber.py                     |  2 +-
 scripts/lib/mic/utils/misc.py                        |  2 +-
 scripts/lib/mic/utils/partitionedfs.py               |  2 +-
 scripts/lib/mic/utils/proxy.py                       |  2 +-
 scripts/lib/mic/utils/rpmmisc.py                     |  2 +-
 scripts/lib/mic/utils/runner.py                      |  2 +-
 scripts/lnr                                          |  2 +-
 scripts/oe-buildenv-internal                         |  4 ++--
 scripts/oe-pkgdata-util                              |  2 +-
 scripts/oe-selftest                                  |  2 +-
 scripts/oe-trim-schemas                              |  2 +-
 scripts/opkg-query-helper.py                         |  2 +-
 scripts/pybootchartgui/pybootchartgui.py             |  2 +-
 scripts/relocate_sdk.py                              |  2 +-
 scripts/send-error-report                            |  2 +-
 scripts/swabber-strace-attach                        |  2 +-
 scripts/sysroot-relativelinks.py                     |  2 +-
 scripts/tiny/dirsize.py                              |  2 +-
 scripts/tiny/ksize.py                                |  2 +-
 scripts/wic                                          |  2 +-
 scripts/yocto-bsp                                    |  2 +-
 scripts/yocto-kernel                                 |  2 +-
 scripts/yocto-layer                                  |  2 +-
 121 files changed, 161 insertions(+), 139 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-pseudo_force_python2.patch

diff --git a/bitbake/bin/bitbake b/bitbake/bin/bitbake
index c6e8f01..9a34722 100755
--- a/bitbake/bin/bitbake
+++ b/bitbake/bin/bitbake
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/bitbake/bin/bitbake-diffsigs b/bitbake/bin/bitbake-diffsigs
index 08ae00d..8d20089 100755
--- a/bitbake/bin/bitbake-diffsigs
+++ b/bitbake/bin/bitbake-diffsigs
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # bitbake-diffsigs
 # BitBake task signature data comparison utility
diff --git a/bitbake/bin/bitbake-dumpsig b/bitbake/bin/bitbake-dumpsig
index 656d93a..2d342ec 100755
--- a/bitbake/bin/bitbake-dumpsig
+++ b/bitbake/bin/bitbake-dumpsig
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # bitbake-dumpsig
 # BitBake task signature dump utility
diff --git a/bitbake/bin/bitbake-layers b/bitbake/bin/bitbake-layers
index 2a7f829..fdcb1ee 100755
--- a/bitbake/bin/bitbake-layers
+++ b/bitbake/bin/bitbake-layers
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # This script has subcommands which operate against your bitbake layers, either
 # displaying useful information, or acting against them.
diff --git a/bitbake/bin/bitbake-prserv b/bitbake/bin/bitbake-prserv
index a8d7acb..3382b41 100755
--- a/bitbake/bin/bitbake-prserv
+++ b/bitbake/bin/bitbake-prserv
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 import os
 import sys,logging
 import optparse
diff --git a/bitbake/bin/bitbake-selftest b/bitbake/bin/bitbake-selftest
index 81e4c3c..f13b24b 100755
--- a/bitbake/bin/bitbake-selftest
+++ b/bitbake/bin/bitbake-selftest
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # Copyright (C) 2012 Richard Purdie
 #
diff --git a/bitbake/bin/bitbake-worker b/bitbake/bin/bitbake-worker
index 68e2bf4..ca2b4ca 100755
--- a/bitbake/bin/bitbake-worker
+++ b/bitbake/bin/bitbake-worker
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 import os
 import sys
diff --git a/bitbake/bin/bitdoc b/bitbake/bin/bitdoc
index 576d88b..5da0ed0 100755
--- a/bitbake/bin/bitdoc
+++ b/bitbake/bin/bitdoc
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/bitbake/bin/image-writer b/bitbake/bin/image-writer
index 86c38b5..3a151a8 100755
--- a/bitbake/bin/image-writer
+++ b/bitbake/bin/image-writer
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Copyright (c) 2012 Wind River Systems, Inc.
 #
diff --git a/bitbake/bin/toaster b/bitbake/bin/toaster
index dea69a4..5e7f219 100755
--- a/bitbake/bin/toaster
+++ b/bitbake/bin/toaster
@@ -39,18 +39,18 @@ function webserverKillAll()
 function webserverStartAll()
 {
         retval=0
-        python $BBBASEDIR/lib/toaster/manage.py syncdb || retval=1
-        python $BBBASEDIR/lib/toaster/manage.py migrate orm || retval=2
+        python2 $BBBASEDIR/lib/toaster/manage.py syncdb || retval=1
+        python2 $BBBASEDIR/lib/toaster/manage.py migrate orm || retval=2
         if [ $retval -eq 1 ]; then
                 echo "Failed db sync, stopping system start" 1>&2
         elif [ $retval -eq 2 ]; then
             echo -e "\nError on migration, trying to recover... \n"
-            python $BBBASEDIR/lib/toaster/manage.py migrate orm 0001_initial --fake
+            python2 $BBBASEDIR/lib/toaster/manage.py migrate orm 0001_initial --fake
             retval=0
-            python $BBBASEDIR/lib/toaster/manage.py migrate orm || retval=1
+            python2 $BBBASEDIR/lib/toaster/manage.py migrate orm || retval=1
         fi
         if [ $retval -eq 0 ]; then
-            python $BBBASEDIR/lib/toaster/manage.py runserver 0.0.0.0:8000 </dev/null >${BUILDDIR}/toaster_web.log 2>&1 & echo $! >${BUILDDIR}/.toastermain.pid
+            python2 $BBBASEDIR/lib/toaster/manage.py runserver 0.0.0.0:8000 </dev/null >${BUILDDIR}/toaster_web.log 2>&1 & echo $! >${BUILDDIR}/.toastermain.pid
             sleep 1
             if ! cat "${BUILDDIR}/.toastermain.pid" | xargs -I{} kill -0 {} ; then
                 retval=1
@@ -120,12 +120,12 @@ BBBASEDIR=`dirname ${BASH_SOURCE}`/..
 
 # Verify prerequisites
 
-if ! echo "import django; print (1,5) == django.VERSION[0:2]" | python 2>/dev/null | grep True >/dev/null; then
+if ! echo "import django; print (1,5) == django.VERSION[0:2]" | python2 2>/dev/null | grep True >/dev/null; then
     echo -e "This program needs Django 1.5. Please install with\n\nsudo pip install django==1.5"
     return 2
 fi
 
-if ! echo "import south; print [0,8,4] ==  map(int,south.__version__.split(\".\"))" | python 2>/dev/null | grep True >/dev/null; then
+if ! echo "import south; print [0,8,4] ==  map(int,south.__version__.split(\".\"))" | python2 2>/dev/null | grep True >/dev/null; then
     echo -e "This program needs South 0.8.4. Please install with\n\nsudo pip install south==0.8.4"
     return 2
 fi
diff --git a/bitbake/contrib/dump_cache.py b/bitbake/contrib/dump_cache.py
index e1f2309..15c1c84 100755
--- a/bitbake/contrib/dump_cache.py
+++ b/bitbake/contrib/dump_cache.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index f44a088..1573178 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/bitbake/lib/bb/cookerdata.py b/bitbake/lib/bb/cookerdata.py
index b9b9e16..0d52c6f 100644
--- a/bitbake/lib/bb/cookerdata.py
+++ b/bitbake/lib/bb/cookerdata.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/bitbake/lib/bb/monitordisk.py b/bitbake/lib/bb/monitordisk.py
index fca43ee..3299e66 100644
--- a/bitbake/lib/bb/monitordisk.py
+++ b/bitbake/lib/bb/monitordisk.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/bitbake/lib/bb/namedtuple_with_abc.py b/bitbake/lib/bb/namedtuple_with_abc.py
index f5e0a3f..54afe6b 100644
--- a/bitbake/lib/bb/namedtuple_with_abc.py
+++ b/bitbake/lib/bb/namedtuple_with_abc.py
@@ -1,5 +1,5 @@
 # http://code.activestate.com/recipes/577629-namedtupleabc-abstract-base-class-mix-in-for-named/
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # Copyright (c) 2011 Jan Kaliszewski (zuo). Available under the MIT License.
 
 """
diff --git a/bitbake/lib/bb/parse/parse_py/BBHandler.py b/bitbake/lib/bb/parse/parse_py/BBHandler.py
index 408890e..d4daac6 100644
--- a/bitbake/lib/bb/parse/parse_py/BBHandler.py
+++ b/bitbake/lib/bb/parse/parse_py/BBHandler.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 """
diff --git a/bitbake/lib/bb/parse/parse_py/ConfHandler.py b/bitbake/lib/bb/parse/parse_py/ConfHandler.py
index 978ebe4..d3b2d57 100644
--- a/bitbake/lib/bb/parse/parse_py/ConfHandler.py
+++ b/bitbake/lib/bb/parse/parse_py/ConfHandler.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 """
diff --git a/bitbake/lib/bb/parse/parse_py/__init__.py b/bitbake/lib/bb/parse/parse_py/__init__.py
index 3e658d0..48873da 100644
--- a/bitbake/lib/bb/parse/parse_py/__init__.py
+++ b/bitbake/lib/bb/parse/parse_py/__init__.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 """
diff --git a/bitbake/lib/bb/pysh/lsprof.py b/bitbake/lib/bb/pysh/lsprof.py
index b1831c2..e6a9c22 100644
--- a/bitbake/lib/bb/pysh/lsprof.py
+++ b/bitbake/lib/bb/pysh/lsprof.py
@@ -1,4 +1,4 @@
-#! /usr/bin/env python
+#! /usr/bin/env python2
 
 import sys
 from _lsprof import Profiler, profiler_entry
diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 6ca693d..068d0f5 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 """
diff --git a/bitbake/lib/bb/taskdata.py b/bitbake/lib/bb/taskdata.py
index af72a1f..ebe46a4 100644
--- a/bitbake/lib/bb/taskdata.py
+++ b/bitbake/lib/bb/taskdata.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 """
diff --git a/bitbake/lib/bb/ui/crumbs/builddetailspage.py b/bitbake/lib/bb/ui/crumbs/builddetailspage.py
index 7fc690e..8095f47 100755
--- a/bitbake/lib/bb/ui/crumbs/builddetailspage.py
+++ b/bitbake/lib/bb/ui/crumbs/builddetailspage.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # BitBake Graphical GTK User Interface
 #
diff --git a/bitbake/lib/bb/ui/crumbs/builder.py b/bitbake/lib/bb/ui/crumbs/builder.py
index 455af32..879e704 100755
--- a/bitbake/lib/bb/ui/crumbs/builder.py
+++ b/bitbake/lib/bb/ui/crumbs/builder.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # BitBake Graphical GTK User Interface
 #
diff --git a/bitbake/lib/bb/ui/crumbs/hobpages.py b/bitbake/lib/bb/ui/crumbs/hobpages.py
index 0fd3598..2c6e69f 100755
--- a/bitbake/lib/bb/ui/crumbs/hobpages.py
+++ b/bitbake/lib/bb/ui/crumbs/hobpages.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # BitBake Graphical GTK User Interface
 #
diff --git a/bitbake/lib/bb/ui/crumbs/imageconfigurationpage.py b/bitbake/lib/bb/ui/crumbs/imageconfigurationpage.py
index 2766bea..a793b28 100644
--- a/bitbake/lib/bb/ui/crumbs/imageconfigurationpage.py
+++ b/bitbake/lib/bb/ui/crumbs/imageconfigurationpage.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # BitBake Graphical GTK User Interface
 #
diff --git a/bitbake/lib/bb/ui/crumbs/imagedetailspage.py b/bitbake/lib/bb/ui/crumbs/imagedetailspage.py
index 352e948..b8d2cc4 100755
--- a/bitbake/lib/bb/ui/crumbs/imagedetailspage.py
+++ b/bitbake/lib/bb/ui/crumbs/imagedetailspage.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # BitBake Graphical GTK User Interface
 #
diff --git a/bitbake/lib/bb/ui/crumbs/packageselectionpage.py b/bitbake/lib/bb/ui/crumbs/packageselectionpage.py
index 7c62b36e..9b06d12 100755
--- a/bitbake/lib/bb/ui/crumbs/packageselectionpage.py
+++ b/bitbake/lib/bb/ui/crumbs/packageselectionpage.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # BitBake Graphical GTK User Interface
 #
diff --git a/bitbake/lib/bb/ui/crumbs/recipeselectionpage.py b/bitbake/lib/bb/ui/crumbs/recipeselectionpage.py
index 58db43f..c2852cd 100755
--- a/bitbake/lib/bb/ui/crumbs/recipeselectionpage.py
+++ b/bitbake/lib/bb/ui/crumbs/recipeselectionpage.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # BitBake Graphical GTK User Interface
 #
diff --git a/bitbake/lib/bb/ui/crumbs/sanitycheckpage.py b/bitbake/lib/bb/ui/crumbs/sanitycheckpage.py
index 76ce2ec..1b2482b 100644
--- a/bitbake/lib/bb/ui/crumbs/sanitycheckpage.py
+++ b/bitbake/lib/bb/ui/crumbs/sanitycheckpage.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # BitBake Graphical GTK User Interface
 #
diff --git a/bitbake/lib/bb/ui/hob.py b/bitbake/lib/bb/ui/hob.py
index da5b411..057401f 100755
--- a/bitbake/lib/bb/ui/hob.py
+++ b/bitbake/lib/bb/ui/hob.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # BitBake Graphical GTK User Interface
 #
diff --git a/bitbake/lib/progressbar.py b/bitbake/lib/progressbar.py
index b668647..3455132 100644
--- a/bitbake/lib/progressbar.py
+++ b/bitbake/lib/progressbar.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python2
 # -*- coding: iso-8859-1 -*-
 #
 # progressbar  - Text progressbar library for python.
diff --git a/bitbake/lib/toaster/manage.py b/bitbake/lib/toaster/manage.py
index ceaa11b..8d6acf0 100755
--- a/bitbake/lib/toaster/manage.py
+++ b/bitbake/lib/toaster/manage.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 import os
 import sys
 
diff --git a/bitbake/lib/toaster/orm/fixtures/orm_views_testdata.json b/bitbake/lib/toaster/orm/fixtures/orm_views_testdata.json
index be01318..bed0c35 100644
--- a/bitbake/lib/toaster/orm/fixtures/orm_views_testdata.json
+++ b/bitbake/lib/toaster/orm/fixtures/orm_views_testdata.json
@@ -122094,7 +122094,7 @@
     "fields": {
         "changed": false,
         "description": "",
-        "variable_value": "/usr/bin/python",
+        "variable_value": "/usr/bin/env python2",
         "human_readable_name": "",
         "build": 1,
         "variable_name": "PYTHON"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1ff2b36..b0c111e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -18,7 +18,7 @@ def write_rpm_perfiledata(srcname, d):
     pkgd = d.getVar('PKGD', True)
 
     def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python\n\n")
+        outfile.write("#!/usr/bin/env python2\n\n")
         outfile.write("# Dependency table\n")
         outfile.write('deps = {\n')
         for pkg in packages.split():
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index e1b6642..d52734e 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 
 # Copyright (C) 2013 Intel Corporation
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index a190956..73b8dfd 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -51,7 +51,7 @@ do_install_append() {
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
 	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
-	sed -i -e '1s,#!.*python,#! /usr/bin/env python,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
+	sed -i -e '1s,#!.*python,#! /usr/bin/env python2,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
 }
 
 CONFFILES_${PN} = " \
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
index 4052950..dd9de04 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.38.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://gtest-skip-fixes.patch \
            file://gio-test-race.patch \
            file://uclibc.patch \
+           file://force-python2.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 66bf290..993320b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -58,7 +58,7 @@ ARM_INSTRUCTION_SET = "arm"
 USE_NLS = "yes"
 
 do_install_append () {
-	sed ${D}${bindir}/gtester-report -i -e '1s|^#!.*|#!/usr/bin/env python|'
+	sed ${D}${bindir}/gtester-report -i -e '1s|^#!.*|#!/usr/bin/env python2|'
 
 	# Remove some unpackaged files
 	rm -f ${D}${datadir}/glib-2.0/codegen/*.pyc
diff --git a/meta/recipes-devtools/pseudo/files/0002-pseudo_force_python2.patch b/meta/recipes-devtools/pseudo/files/0002-pseudo_force_python2.patch
new file mode 100644
index 0000000..7546e40
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0002-pseudo_force_python2.patch
@@ -0,0 +1,20 @@
+diff --git a/maketables b/maketables
+index b32312e..b61248d 100755
+--- a/maketables
++++ b/maketables
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python2
+ #
+ # Copyright (c) 2008-2010, 2013 Wind River Systems, Inc.
+ #
+diff --git a/makewrappers b/makewrappers
+index 46aeb44..73e92a9 100755
+--- a/makewrappers
++++ b/makewrappers
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python2
+ #
+ # Copyright (c) 2008-2011,2013 Wind River Systems, Inc.
+ #
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
index 215cdb8..0479ffe 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     file://0001-pseudo_has_unload-add-function.patch \
     file://shutdownping.patch \
     file://pseudo-1.5.1-install-directory-mode.patch \
+    file://0002-pseudo_force_python2.patch \
 "
 
 SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index 0e6a8cd..909f446 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -47,9 +47,9 @@ do_install() {
 	install -d ${D}${bindir}/${PN}
 	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
 
-	# Make sure we use /usr/bin/env python
+	# Make sure we use /usr/bin/env python2
 	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
-		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python2|' $PYTHSCRIPT
 	done
 
 	# Add a symlink to the native Python so that scripts can just invoke
diff --git a/meta/recipes-devtools/python/python/cgi_py.patch b/meta/recipes-devtools/python/python/cgi_py.patch
index de504f9..d08fd97 100644
--- a/meta/recipes-devtools/python/python/cgi_py.patch
+++ b/meta/recipes-devtools/python/python/cgi_py.patch
@@ -17,7 +17,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 -# binary installations by Linux vendors often install Python in
 -# /usr/bin.  So let those vendors patch cgi.py to match their choice
 -# of installation.
-+#! /usr/bin/env python
++#! /usr/bin/env python2
  
  """Support module for CGI (Common Gateway Interface) scripts.
  
diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/recipes-devtools/python/python3-native_3.3.3.bb
index 9ae2a0b..0c3b7a6 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
@@ -70,7 +70,7 @@ do_install() {
 	install -d ${D}${bindir}/${PN}
 	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
 
-	# Make sure we use /usr/bin/env python
+	# Make sure we use /usr/bin/env python2
 	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
 		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
 	done
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/recipes-devtools/python/python3/cgi_py.patch
index de504f9..23b860d 100644
--- a/meta/recipes-devtools/python/python3/cgi_py.patch
+++ b/meta/recipes-devtools/python/python3/cgi_py.patch
@@ -10,14 +10,14 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 -#! /usr/local/bin/python
 -
 -# NOTE: the above "/usr/local/bin/python" is NOT a mistake.  It is
--# intentionally NOT "/usr/bin/env python".  On many systems
+-# intentionally NOT "/usr/bin/env python2".  On many systems
 -# (e.g. Solaris), /usr/local/bin is not in $PATH as passed to CGI
 -# scripts, and /usr/local/bin is the default directory where Python is
 -# installed, so /usr/bin/env would be unable to find python.  Granted,
 -# binary installations by Linux vendors often install Python in
 -# /usr/bin.  So let those vendors patch cgi.py to match their choice
 -# of installation.
-+#! /usr/bin/env python
++#! /usr/bin/env python2
  
  """Support module for CGI (Common Gateway Interface) scripts.
  
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 472988d..5d205c6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -52,7 +52,7 @@ do_configure() {
        KVMOPTS="--enable-kvm"
     fi
 
-    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --localstatedir=${localstatedir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
+    ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --libexecdir=${libexecdir} --localstatedir=${localstatedir} --disable-strip --python=python2 ${EXTRA_OECONF} $KVMOPTS
     test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x ${S}/target-i386/beginend_funcs.sh
 }
 
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index e148ce3..b24871d 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -20,7 +20,7 @@ do_install_append() {
 }
 
 do_install_append_class-native () {
-	sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' ${D}${bindir}/xml2po
+	sed -i -e 's|^#!.*/usr/bin/env python2|#! /usr/bin/env nativepython|' ${D}${bindir}/xml2po
 }
 
 FILES_${PN} += "${datadir}/xml* ${PYTHON_SITEPACKAGES_DIR}/*"
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch b/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
index 0e196c0..8ad5804 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
@@ -23,8 +23,8 @@ Index: gnome-doc-utils-0.20.10/xml2po/xml2po/xml2po.py.in
 --- gnome-doc-utils-0.20.10.orig/xml2po/xml2po/xml2po.py.in
 +++ gnome-doc-utils-0.20.10/xml2po/xml2po/xml2po.py.in
 @@ -1,4 +1,4 @@
--#!/usr/bin/python -u
-+#!/usr/bin/env python
+-#!/usr/bin/env python2 -u
++#!/usr/bin/env python2
  # -*- encoding: utf-8 -*-
  # Copyright (c) 2004, 2005, 2006 Danilo Šegan <danilo@gnome.org>.
  # Copyright (c) 2009 Claude Paroz <claude@2xlibre.net>.
diff --git a/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch b/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
index b5b2ec4..3f6d316 100644
--- a/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
+++ b/meta/recipes-gnome/libglade/libglade-2.6.4/python_environment.patch
@@ -8,7 +8,7 @@ diff -ruN libglade-2.6.4-orig//libglade-convert.in libglade-2.6.4/libglade-conve
 +++ libglade-2.6.4/libglade-convert.in	2011-09-22 10:18:55.431164003 +0800
 @@ -1,4 +1,4 @@
 -#!@PYTHON@
-+#!/usr/bin/env python
++#!/usr/bin/env python2
  # -*- mode: python -*-
  
  # yes, this requires python 2.x and an XML parser module (eg. PyExpat)
diff --git a/meta/recipes-graphics/builder/files/please_wait_dialog.py b/meta/recipes-graphics/builder/files/please_wait_dialog.py
index fd2381b..48cf605 100644
--- a/meta/recipes-graphics/builder/files/please_wait_dialog.py
+++ b/meta/recipes-graphics/builder/files/please_wait_dialog.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 import glib
 import gtk
  
diff --git a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
index 8b493eb..0142bba 100644
--- a/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-rt-tests-Allow-for-user-specified-PYLIB.patch
@@ -25,8 +25,8 @@ index 3a82407..61e2f9f 100644
  CFLAGS ?= -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
  LDFLAGS ?=
  
--PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
-+PYLIB  ?= $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
+-PYLIB  := $(shell python2 -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
++PYLIB  ?= $(shell python2 -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
  
  ifndef DEBUG
  	CFLAGS	+= -O2
diff --git a/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch b/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
index 80205a1..3d43fbf 100644
--- a/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
+++ b/meta/recipes-support/createrepo/createrepo/python-scripts-should-use-interpreter-from-env.patch
@@ -11,7 +11,7 @@ Index: createrepo-0.4.11/genpkgmetadata.py
 +++ createrepo-0.4.11/genpkgmetadata.py	2012-04-10 17:14:22.290648886 +0300
 @@ -1,4 +1,4 @@
 -#!/usr/bin/python -t
-+#! /usr/bin/env python
++#! /usr/bin/env python2
  # primary functions and glue for generating the repository metadata
  #
  
@@ -21,7 +21,7 @@ Index: createrepo-0.4.11/modifyrepo.py
 +++ createrepo-0.4.11/modifyrepo.py	2012-04-10 17:14:27.818648725 +0300
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#! /usr/bin/env python
++#! /usr/bin/env python2
  # $Id$
  #
  # This tools is used to insert arbitrary metadata into an RPM repository.
@@ -31,7 +31,7 @@ Index: createrepo-0.4.11/dumpMetadata.py
 +++ createrepo-0.4.11/dumpMetadata.py	2012-04-10 17:19:34.502639756 +0300
 @@ -1,4 +1,4 @@
 -#!/usr/bin/python -t
-+#! /usr/bin/env python
++#! /usr/bin/env python2
  # base classes and functions for dumping out package Metadata
  #
  # This program is free software; you can redistribute it and/or modify
@@ -41,7 +41,7 @@ Index: createrepo-0.4.11/readMetadata.py
 +++ createrepo-0.4.11/readMetadata.py	2012-04-10 17:19:40.198639590 +0300
 @@ -1,4 +1,4 @@
 -#!/usr/bin/python -t
-+#! /usr/bin/env python
++#! /usr/bin/env python2
  
  # This program is free software; you can redistribute it and/or modify
  # it under the terms of the GNU General Public License as published by
diff --git a/meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py b/meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py
index a5b61ba..2939cdc 100755
--- a/meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py
+++ b/meta/recipes-support/createrepo/createrepo/rpm-createsolvedb.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # This script generates a solution database for a directory containing rpm packages
 # but tries to be efficient about this, only doing so when the packages have changed
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 159a6c4..ea91168 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -27,7 +27,7 @@ do_install () {
 }
 
 # Wrap the python script since the native python is
-# ${bindir}/python-native/python, and the "#! /usr/bin/env python" can't
+# ${bindir}/python-native/python, and the "#! /usr/bin/env python2" can't
 # find it since it is not in PATH.
 do_install_append_class-native () {
 	# Not all the python scripts should be wrapped since some of
@@ -35,7 +35,7 @@ do_install_append_class-native () {
 	for i in ${D}${datadir}/createrepo/genpkgmetadata.py \
 		 ${D}${datadir}/createrepo/modifyrepo.py \
 		 ${D}${bindir}/rpm-createsolvedb.py ; do
-		sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' $i
+		sed -i -e 's|^#!.*/usr/bin/env python2|#! /usr/bin/env nativepython|' $i
 	done
 
 	create_wrapper ${D}/${bindir}/createrepo \
diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index e4497e0..fd32e0e 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 
diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index 58a2708..b397571 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # Collects the recorded SRCREV values from buildhistory and reports on them
 #
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index ad50414..9fec302 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Report significant differences in the buildhistory repository since a specific revision
 #
diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index 25fef97..cc7dffe 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Copyright (c) 2012 Wind River Systems, Inc.
 #
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 19d64e6..a80794a 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index 0896d64..d033d33 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
diff --git a/scripts/contrib/graph-tool b/scripts/contrib/graph-tool
index 6dc7d33..7e6a31b 100755
--- a/scripts/contrib/graph-tool
+++ b/scripts/contrib/graph-tool
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Simple graph query utility
 # useful for getting answers from .dot files produced by bitbake -g
diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 371033a..884deeb 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 4356ad0..81fbfd9 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # generate Python Manifest for the OpenEmbedded build system
 # (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
diff --git a/scripts/contrib/python/generate-manifest-3.3.py b/scripts/contrib/python/generate-manifest-3.3.py
index 1586c46..d5c49f7 100755
--- a/scripts/contrib/python/generate-manifest-3.3.py
+++ b/scripts/contrib/python/generate-manifest-3.3.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # generate Python Manifest for the OpenEmbedded build system
 # (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
diff --git a/scripts/cp-noerror b/scripts/cp-noerror
index 28eb90d..a3bb26b 100755
--- a/scripts/cp-noerror
+++ b/scripts/cp-noerror
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # Allow copying of $1 to $2 but if files in $1 disappear during the copy operation,
 # don't error.
diff --git a/scripts/create-recipe b/scripts/create-recipe
index b192990..32c6a58 100755
--- a/scripts/create-recipe
+++ b/scripts/create-recipe
@@ -1894,18 +1894,18 @@ if ( -e "$dir/setup.py" ) {
 	    push(@inherits, "distutils");
 	}	
 
-	$templic = `cd $dir; python setup.py --license;`;
+	$templic = `cd $dir; python2 setup.py --license;`;
 	$templic =~ s/[\r\n]+//g;
 	push(@license, $templic);
-	$summary = `cd $dir; python setup.py --name`;
+	$summary = `cd $dir; python2 setup.py --name`;
 	$summary =~ s/[\r\n]+//g;
-	$description = `cd $dir; python setup.py --description`;
+	$description = `cd $dir; python2 setup.py --description`;
 	$description =~ s/[\r\n]+//g;
-	$homepage = `cd $dir; python setup.py --url`;
+	$homepage = `cd $dir; python2 setup.py --url`;
 	$homepage =~ s/[\r\n]+//g;
-	$pversion = `cd $dir; python setup.py -V`;
+	$pversion = `cd $dir; python2 setup.py -V`;
 	$pversion =~ s/[\r\n]+//g;
-#	$findoutput = `cd $dir; python setup.py --requires`;
+#	$findoutput = `cd $dir; python2 setup.py --requires`;
 #	if (length($findoutput) < 3) {
 	$findoutput = `find $dir/*.egg-info/ -name "requires.txt" 2>/dev/null`;
 #	}
diff --git a/scripts/jhbuild/jhbuild2oe.py b/scripts/jhbuild/jhbuild2oe.py
index 9b31caf..dcd9d13 100755
--- a/scripts/jhbuild/jhbuild2oe.py
+++ b/scripts/jhbuild/jhbuild2oe.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # Available modulesets:
 #
 # bootstrap.modules
diff --git a/scripts/lib/mic/bootstrap.py b/scripts/lib/mic/bootstrap.py
index 66c291b..755f33a 100644
--- a/scripts/lib/mic/bootstrap.py
+++ b/scripts/lib/mic/bootstrap.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/chroot.py b/scripts/lib/mic/chroot.py
index 99fb9a2..33e48cd 100644
--- a/scripts/lib/mic/chroot.py
+++ b/scripts/lib/mic/chroot.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/conf.py b/scripts/lib/mic/conf.py
index b850d80..f90338c 100644
--- a/scripts/lib/mic/conf.py
+++ b/scripts/lib/mic/conf.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/creator.py b/scripts/lib/mic/creator.py
index 267928f..0b7c4fe 100644
--- a/scripts/lib/mic/creator.py
+++ b/scripts/lib/mic/creator.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/imager/baseimager.py b/scripts/lib/mic/imager/baseimager.py
index b721249..082683b 100644
--- a/scripts/lib/mic/imager/baseimager.py
+++ b/scripts/lib/mic/imager/baseimager.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2007 Red Hat  Inc.
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
diff --git a/scripts/lib/mic/imager/fs.py b/scripts/lib/mic/imager/fs.py
index d53b29c..c0de553 100644
--- a/scripts/lib/mic/imager/fs.py
+++ b/scripts/lib/mic/imager/fs.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/imager/livecd.py b/scripts/lib/mic/imager/livecd.py
index e36f4a7..0d78a18 100644
--- a/scripts/lib/mic/imager/livecd.py
+++ b/scripts/lib/mic/imager/livecd.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/imager/liveusb.py b/scripts/lib/mic/imager/liveusb.py
index a909928..3338944 100644
--- a/scripts/lib/mic/imager/liveusb.py
+++ b/scripts/lib/mic/imager/liveusb.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/imager/loop.py b/scripts/lib/mic/imager/loop.py
index 4d05ef2..f5898f9 100644
--- a/scripts/lib/mic/imager/loop.py
+++ b/scripts/lib/mic/imager/loop.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/imager/raw.py b/scripts/lib/mic/imager/raw.py
index 838191a..c826e7f 100644
--- a/scripts/lib/mic/imager/raw.py
+++ b/scripts/lib/mic/imager/raw.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/kickstart/__init__.py b/scripts/lib/mic/kickstart/__init__.py
index 72f3ca6..142ce4c 100644
--- a/scripts/lib/mic/kickstart/__init__.py
+++ b/scripts/lib/mic/kickstart/__init__.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2007 Red Hat, Inc.
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
diff --git a/scripts/lib/mic/kickstart/custom_commands/desktop.py b/scripts/lib/mic/kickstart/custom_commands/desktop.py
index c8bd647..3be5bc7 100644
--- a/scripts/lib/mic/kickstart/custom_commands/desktop.py
+++ b/scripts/lib/mic/kickstart/custom_commands/desktop.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2008, 2009, 2010 Intel, Inc.
 #
diff --git a/scripts/lib/mic/kickstart/custom_commands/installerfw.py b/scripts/lib/mic/kickstart/custom_commands/installerfw.py
index 2466f1d..3f0a736 100644
--- a/scripts/lib/mic/kickstart/custom_commands/installerfw.py
+++ b/scripts/lib/mic/kickstart/custom_commands/installerfw.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2013 Intel, Inc.
 #
diff --git a/scripts/lib/mic/kickstart/custom_commands/micboot.py b/scripts/lib/mic/kickstart/custom_commands/micboot.py
index 66d1678..b6cb08b 100644
--- a/scripts/lib/mic/kickstart/custom_commands/micboot.py
+++ b/scripts/lib/mic/kickstart/custom_commands/micboot.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2008, 2009, 2010 Intel, Inc.
 #
diff --git a/scripts/lib/mic/kickstart/custom_commands/micpartition.py b/scripts/lib/mic/kickstart/custom_commands/micpartition.py
index 59a87fb..ee45042 100644
--- a/scripts/lib/mic/kickstart/custom_commands/micpartition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/micpartition.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Marko Saukko <marko.saukko@cybercom.com>
 #
diff --git a/scripts/lib/mic/kickstart/custom_commands/micrepo.py b/scripts/lib/mic/kickstart/custom_commands/micrepo.py
index b31576e..6d1e052 100644
--- a/scripts/lib/mic/kickstart/custom_commands/micrepo.py
+++ b/scripts/lib/mic/kickstart/custom_commands/micrepo.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2008, 2009, 2010 Intel, Inc.
 #
diff --git a/scripts/lib/mic/msger.py b/scripts/lib/mic/msger.py
index 9afc85b..fff6887 100644
--- a/scripts/lib/mic/msger.py
+++ b/scripts/lib/mic/msger.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 # vim: ai ts=4 sts=4 et sw=4
 #
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
diff --git a/scripts/lib/mic/plugin.py b/scripts/lib/mic/plugin.py
index df03c15..d493705 100644
--- a/scripts/lib/mic/plugin.py
+++ b/scripts/lib/mic/plugin.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/pluginbase.py b/scripts/lib/mic/pluginbase.py
index 9cf4c62..1f5b398 100644
--- a/scripts/lib/mic/pluginbase.py
+++ b/scripts/lib/mic/pluginbase.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/plugins/backend/yumpkgmgr.py b/scripts/lib/mic/plugins/backend/yumpkgmgr.py
index 955f813..b8f3a3a 100644
--- a/scripts/lib/mic/plugins/backend/yumpkgmgr.py
+++ b/scripts/lib/mic/plugins/backend/yumpkgmgr.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2007 Red Hat  Inc.
 # Copyright (c) 2010, 2011 Intel, Inc.
diff --git a/scripts/lib/mic/plugins/backend/zypppkgmgr.py b/scripts/lib/mic/plugins/backend/zypppkgmgr.py
index c760859..de3acaf 100755
--- a/scripts/lib/mic/plugins/backend/zypppkgmgr.py
+++ b/scripts/lib/mic/plugins/backend/zypppkgmgr.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2010, 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/plugins/hook/empty_hook.py b/scripts/lib/mic/plugins/hook/empty_hook.py
index 397585d..e496cd7 100644
--- a/scripts/lib/mic/plugins/hook/empty_hook.py
+++ b/scripts/lib/mic/plugins/hook/empty_hook.py
@@ -1,3 +1,3 @@
-#!/usr/bin/python
+#!/usr/bin/env python2
 
 # TODO: plugin base for hooks
diff --git a/scripts/lib/mic/plugins/imager/fs_plugin.py b/scripts/lib/mic/plugins/imager/fs_plugin.py
index 6bcaf00..c75c1cd 100644
--- a/scripts/lib/mic/plugins/imager/fs_plugin.py
+++ b/scripts/lib/mic/plugins/imager/fs_plugin.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/plugins/imager/livecd_plugin.py b/scripts/lib/mic/plugins/imager/livecd_plugin.py
index 82cb1af..f6c7a37 100644
--- a/scripts/lib/mic/plugins/imager/livecd_plugin.py
+++ b/scripts/lib/mic/plugins/imager/livecd_plugin.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/plugins/imager/liveusb_plugin.py b/scripts/lib/mic/plugins/imager/liveusb_plugin.py
index 3d53c84..13b1587 100644
--- a/scripts/lib/mic/plugins/imager/liveusb_plugin.py
+++ b/scripts/lib/mic/plugins/imager/liveusb_plugin.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/plugins/imager/loop_plugin.py b/scripts/lib/mic/plugins/imager/loop_plugin.py
index 2a05b3c..0970bac 100644
--- a/scripts/lib/mic/plugins/imager/loop_plugin.py
+++ b/scripts/lib/mic/plugins/imager/loop_plugin.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/plugins/imager/raw_plugin.py b/scripts/lib/mic/plugins/imager/raw_plugin.py
index f9625b8..68d6a96 100644
--- a/scripts/lib/mic/plugins/imager/raw_plugin.py
+++ b/scripts/lib/mic/plugins/imager/raw_plugin.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/rt_util.py b/scripts/lib/mic/rt_util.py
index 2a31f4a..8161cb2 100644
--- a/scripts/lib/mic/rt_util.py
+++ b/scripts/lib/mic/rt_util.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
 #
@@ -193,7 +193,7 @@ def sync_mic(bootstrap, binpth = '/usr/bin/mic',
 
     # correct python interpreter
     mic_cont = file(_path(binpth)).read()
-    mic_cont = "#!/usr/bin/python\n" + mic_cont
+    mic_cont = "#!/usr/bin/env python2\n" + mic_cont
     with open(_path(binpth), 'w') as wf:
         wf.write(mic_cont)
 
diff --git a/scripts/lib/mic/utils/cmdln.py b/scripts/lib/mic/utils/cmdln.py
index b099473..418afd6 100644
--- a/scripts/lib/mic/utils/cmdln.py
+++ b/scripts/lib/mic/utils/cmdln.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # Copyright (c) 2002-2007 ActiveState Software Inc.
 # License: MIT (see LICENSE.txt for license details)
 # Author:  Trent Mick
diff --git a/scripts/lib/mic/utils/errors.py b/scripts/lib/mic/utils/errors.py
index 8d720f9..c61239a 100644
--- a/scripts/lib/mic/utils/errors.py
+++ b/scripts/lib/mic/utils/errors.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2007 Red Hat, Inc.
 # Copyright (c) 2011 Intel, Inc.
diff --git a/scripts/lib/mic/utils/fs_related.py b/scripts/lib/mic/utils/fs_related.py
index dd420e8..7924dbc 100644
--- a/scripts/lib/mic/utils/fs_related.py
+++ b/scripts/lib/mic/utils/fs_related.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2007, Red Hat, Inc.
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
diff --git a/scripts/lib/mic/utils/gpt_parser.py b/scripts/lib/mic/utils/gpt_parser.py
index 5d43b70..91456c5 100644
--- a/scripts/lib/mic/utils/gpt_parser.py
+++ b/scripts/lib/mic/utils/gpt_parser.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2013 Intel, Inc.
 #
diff --git a/scripts/lib/mic/utils/grabber.py b/scripts/lib/mic/utils/grabber.py
index 45e30b4..02b6bd7 100644
--- a/scripts/lib/mic/utils/grabber.py
+++ b/scripts/lib/mic/utils/grabber.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python2
 
 import os
 import sys
diff --git a/scripts/lib/mic/utils/misc.py b/scripts/lib/mic/utils/misc.py
index 95241d7..cef96ea 100644
--- a/scripts/lib/mic/utils/misc.py
+++ b/scripts/lib/mic/utils/misc.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2010, 2011 Intel Inc.
 #
diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index 6607466..7cc12d2 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
 # Copyright (c) 2007, 2008 Red Hat, Inc.
diff --git a/scripts/lib/mic/utils/proxy.py b/scripts/lib/mic/utils/proxy.py
index 91451a2..b00f98a 100644
--- a/scripts/lib/mic/utils/proxy.py
+++ b/scripts/lib/mic/utils/proxy.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2010, 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/utils/rpmmisc.py b/scripts/lib/mic/utils/rpmmisc.py
index af15763..a743986 100644
--- a/scripts/lib/mic/utils/rpmmisc.py
+++ b/scripts/lib/mic/utils/rpmmisc.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2008, 2009, 2010, 2011 Intel, Inc.
 #
diff --git a/scripts/lib/mic/utils/runner.py b/scripts/lib/mic/utils/runner.py
index fded3c9..0f70394 100644
--- a/scripts/lib/mic/utils/runner.py
+++ b/scripts/lib/mic/utils/runner.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python2 -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lnr b/scripts/lnr
index 9dacebe..8572270 100755
--- a/scripts/lnr
+++ b/scripts/lnr
@@ -1,4 +1,4 @@
-#! /usr/bin/env python
+#! /usr/bin/env python2
 
 # Create a *relative* symlink, just like ln --relative does but without needing
 # coreutils 8.16.
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index bba6f8f..b514aa5 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -33,7 +33,7 @@ fi
 # sanity.bbclass because bitbake's source code doesn't even pass
 # parsing stage when used with python v3, so we catch it here so we
 # can offer a meaningful error message.
-py_v3_check=`/usr/bin/env python --version 2>&1 | grep "Python 3"`
+py_v3_check=`/usr/bin/env python2 --version 2>&1 | grep "Python 3"`
 if [ "$py_v3_check" != "" ]; then
 	echo >&2 "Bitbake is not compatible with python v3"
 	echo >&2 "Please set up python v2 as your default python interpreter"
@@ -43,7 +43,7 @@ fi
 # Similarly, we now have code that doesn't parse correctly with older
 # versions of Python, and rather than fixing that and being eternally
 # vigilant for any other new feature use, just check the version here.
-py_v26_check=`python -c 'import sys; print sys.version_info >= (2,7,3)'`
+py_v26_check=`python2 -c 'import sys; print sys.version_info >= (2,7,3)'`
 if [ "$py_v26_check" != "True" ]; then
 	echo >&2 "BitBake requires Python 2.7.3 or later"
 	return 1
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index a373116..4a9a65c 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # OpenEmbedded pkgdata utility
 #
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 8c4ea92..c1377cd 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Copyright (c) 2013 Intel Corporation
 #
diff --git a/scripts/oe-trim-schemas b/scripts/oe-trim-schemas
index 29fb3a1..f254a11 100755
--- a/scripts/oe-trim-schemas
+++ b/scripts/oe-trim-schemas
@@ -1,4 +1,4 @@
-#! /usr/bin/env python
+#! /usr/bin/env python2
 
 import sys
 try:
diff --git a/scripts/opkg-query-helper.py b/scripts/opkg-query-helper.py
index 2fb1a78..93d9517 100755
--- a/scripts/opkg-query-helper.py
+++ b/scripts/opkg-query-helper.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # OpenEmbedded opkg query helper utility
 #
diff --git a/scripts/pybootchartgui/pybootchartgui.py b/scripts/pybootchartgui/pybootchartgui.py
index 947ce10..40c69fb 100755
--- a/scripts/pybootchartgui/pybootchartgui.py
+++ b/scripts/pybootchartgui/pybootchartgui.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python2
 #
 #  This file is part of pybootchartgui.
 
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 05d9fd6..ee0872b 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # Copyright (c) 2012 Intel Corporation
 #
diff --git a/scripts/send-error-report b/scripts/send-error-report
index 48d983b..dc66598 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 
 # Sends an error report (if the report-error class was enabled) to a remote server.
 #
diff --git a/scripts/swabber-strace-attach b/scripts/swabber-strace-attach
index bb0391a..0588ca2 100755
--- a/scripts/swabber-strace-attach
+++ b/scripts/swabber-strace-attach
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 import os
 import sys
 import subprocess
diff --git a/scripts/sysroot-relativelinks.py b/scripts/sysroot-relativelinks.py
index ac26367..957d50c 100755
--- a/scripts/sysroot-relativelinks.py
+++ b/scripts/sysroot-relativelinks.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 import sys
 import os
 
diff --git a/scripts/tiny/dirsize.py b/scripts/tiny/dirsize.py
index 40ff4ab..10a4459 100755
--- a/scripts/tiny/dirsize.py
+++ b/scripts/tiny/dirsize.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # Copyright (c) 2011, Intel Corporation.
 # All rights reserved.
diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index 4006f2f..cb666e3 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 #
 # Copyright (c) 2011, Intel Corporation.
 # All rights reserved.
diff --git a/scripts/wic b/scripts/wic
index 4423340..24dcf85 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/scripts/yocto-bsp b/scripts/yocto-bsp
index d269861..516e9d1 100755
--- a/scripts/yocto-bsp
+++ b/scripts/yocto-bsp
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/scripts/yocto-kernel b/scripts/yocto-kernel
index c9b2821..d6d9057 100755
--- a/scripts/yocto-kernel
+++ b/scripts/yocto-kernel
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
diff --git a/scripts/yocto-layer b/scripts/yocto-layer
index 53d2aab..6bfecd8 100755
--- a/scripts/yocto-layer
+++ b/scripts/yocto-layer
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python2
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
-- 
2.1.2


