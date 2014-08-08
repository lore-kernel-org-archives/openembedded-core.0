Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7524F6FE7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2014 15:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="573937490"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2014 15:06:03 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:27 -0500
Message-Id: <af5357c6c9ebd6e5d016356f48d84fe6e1d30c9c.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 02/35] wic: Remove unused custom commands
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:06 -0000

installer, repo, desktop-related stuff

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/kickstart/__init__.py              |   6 +-
 .../lib/mic/kickstart/custom_commands/__init__.py  |   7 --
 .../lib/mic/kickstart/custom_commands/desktop.py   |  95 ---------------
 .../mic/kickstart/custom_commands/installerfw.py   |  63 ----------
 .../lib/mic/kickstart/custom_commands/micrepo.py   | 127 ---------------------
 5 files changed, 1 insertion(+), 297 deletions(-)
 delete mode 100644 scripts/lib/mic/kickstart/custom_commands/desktop.py
 delete mode 100644 scripts/lib/mic/kickstart/custom_commands/installerfw.py
 delete mode 100644 scripts/lib/mic/kickstart/custom_commands/micrepo.py

diff --git a/scripts/lib/mic/kickstart/__init__.py b/scripts/lib/mic/kickstart/__init__.py
index 72f3ca6..11cdf63 100644
--- a/scripts/lib/mic/kickstart/__init__.py
+++ b/scripts/lib/mic/kickstart/__init__.py
@@ -32,7 +32,7 @@ from pykickstart.handlers.control import dataMap
 
 from mic import msger
 from mic.utils import errors, misc, runner, fs_related as fs
-from custom_commands import desktop, micrepo, wicboot, partition, installerfw
+from custom_commands import wicboot, partition
 
 
 AUTH_URL_PTN = r"(?P<scheme>.*)://(?P<username>.*)(:?P<password>.*)?@(?P<url>.*)"
@@ -96,13 +96,9 @@ def read_kickstart(path):
     #ks = ksparser.KickstartParser(version)
 
     using_version = ksversion.DEVEL
-    commandMap[using_version]["desktop"] = desktop.Mic_Desktop
-    commandMap[using_version]["repo"] = micrepo.Mic_Repo
     commandMap[using_version]["bootloader"] = wicboot.Wic_Bootloader
     commandMap[using_version]["part"] = partition.Wic_Partition
     commandMap[using_version]["partition"] = partition.Wic_Partition
-    commandMap[using_version]["installerfw"] = installerfw.Mic_installerfw
-    dataMap[using_version]["RepoData"] = micrepo.Mic_RepoData
     dataMap[using_version]["PartData"] = partition.Wic_PartData
     superclass = ksversion.returnClassForVersion(version=using_version)
 
diff --git a/scripts/lib/mic/kickstart/custom_commands/__init__.py b/scripts/lib/mic/kickstart/custom_commands/__init__.py
index 6aed0ff..f84c6d9 100644
--- a/scripts/lib/mic/kickstart/custom_commands/__init__.py
+++ b/scripts/lib/mic/kickstart/custom_commands/__init__.py
@@ -1,17 +1,10 @@
-from desktop import Mic_Desktop
-from micrepo import Mic_Repo, Mic_RepoData
 from micpartition import Mic_Partition
 from micpartition import Mic_PartData
-from installerfw import Mic_installerfw
 from partition import Wic_Partition
 
 __all__ = (
-    "Mic_Desktop",
-    "Mic_Repo",
-    "Mic_RepoData",
     "Mic_Partition",
     "Mic_PartData",
-    "Mic_installerfw",
     "Wic_Partition",
     "Wic_PartData",
 )
diff --git a/scripts/lib/mic/kickstart/custom_commands/desktop.py b/scripts/lib/mic/kickstart/custom_commands/desktop.py
deleted file mode 100644
index c8bd647..0000000
--- a/scripts/lib/mic/kickstart/custom_commands/desktop.py
+++ /dev/null
@@ -1,95 +0,0 @@
-#!/usr/bin/python -tt
-#
-# Copyright (c) 2008, 2009, 2010 Intel, Inc.
-#
-# Yi Yang <yi.y.yang@intel.com>
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
-from pykickstart.base import *
-from pykickstart.errors import *
-from pykickstart.options import *
-
-class Mic_Desktop(KickstartCommand):
-    def __init__(self, writePriority=0,
-                       defaultdesktop=None,
-                       defaultdm=None,
-                       autologinuser=None,
-                       session=None):
-
-        KickstartCommand.__init__(self, writePriority)
-
-        self.__new_version = False
-        self.op = self._getParser()
-
-        self.defaultdesktop = defaultdesktop
-        self.autologinuser = autologinuser
-        self.defaultdm = defaultdm
-        self.session = session
-
-    def __str__(self):
-        retval = ""
-
-        if self.defaultdesktop != None:
-            retval += " --defaultdesktop=%s" % self.defaultdesktop
-        if self.session != None:
-            retval += " --session=\"%s\"" % self.session
-        if self.autologinuser != None:
-            retval += " --autologinuser=%s" % self.autologinuser
-        if self.defaultdm != None:
-            retval += " --defaultdm=%s" % self.defaultdm
-
-        if retval != "":
-            retval = "# Default Desktop Settings\ndesktop %s\n" % retval
-
-        return retval
-
-    def _getParser(self):
-        try:
-            op = KSOptionParser(lineno=self.lineno)
-        except TypeError:
-            # the latest version has not lineno argument
-            op = KSOptionParser()
-            self.__new_version = True
-
-        op.add_option("--defaultdesktop", dest="defaultdesktop",
-                                          action="store",
-                                          type="string",
-                                          nargs=1)
-        op.add_option("--autologinuser", dest="autologinuser",
-                                         action="store",
-                                         type="string",
-                                         nargs=1)
-        op.add_option("--defaultdm", dest="defaultdm",
-                                     action="store",
-                                     type="string",
-                                     nargs=1)
-        op.add_option("--session", dest="session",
-                                   action="store",
-                                   type="string",
-                                   nargs=1)
-        return op
-
-    def parse(self, args):
-        if self.__new_version:
-            (opts, extra) = self.op.parse_args(args=args, lineno=self.lineno)
-        else:
-            (opts, extra) = self.op.parse_args(args=args)
-
-        if extra:
-            m = _("Unexpected arguments to %(command)s command: %(options)s") \
-                  % {"command": "desktop", "options": extra}
-            raise KickstartValueError, formatErrorMsg(self.lineno, msg=m)
-
-        self._setToSelf(self.op, opts)
diff --git a/scripts/lib/mic/kickstart/custom_commands/installerfw.py b/scripts/lib/mic/kickstart/custom_commands/installerfw.py
deleted file mode 100644
index 2466f1d..0000000
--- a/scripts/lib/mic/kickstart/custom_commands/installerfw.py
+++ /dev/null
@@ -1,63 +0,0 @@
-#!/usr/bin/python -tt
-#
-# Copyright (c) 2013 Intel, Inc.
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
-from pykickstart.base import *
-from pykickstart.options import *
-
-class Mic_installerfw(KickstartCommand):
-    """ This class implements the "installerfw" KS option. The argument
-    of the option is a comman-separated list of MIC features which have to be
-    disabled and instead, will be done in the installer. For example,
-    "installerfw=extlinux" disables all the MIC code which installs extlinux to
-    the target images, and instead, the extlinux or whatever boot-loader will
-    be installed by the installer instead.
-
-    The installer is a tool which is external to MIC, it comes from the
-    installation repositories and can be executed by MIC in order to perform
-    various configuration actions. The main point here is to make sure MIC has
-    no hard-wired knoledge about the target OS configuration. """
-
-    removedKeywords = KickstartCommand.removedKeywords
-    removedAttrs = KickstartCommand.removedAttrs
-
-    def __init__(self, *args, **kwargs):
-        KickstartCommand.__init__(self, *args, **kwargs)
-        self.op = self._getParser()
-        self.features = kwargs.get("installerfw", None)
-
-    def __str__(self):
-        retval = KickstartCommand.__str__(self)
-
-        if self.features:
-            retval += "# Enable installer framework features\ninstallerfw\n"
-
-        return retval
-
-    def _getParser(self):
-        op = KSOptionParser()
-        return op
-
-    def parse(self, args):
-        (_, extra) = self.op.parse_args(args=args, lineno=self.lineno)
-
-        if len(extra) != 1:
-            msg = "Kickstart command \"installerfw\" requires one " \
-                  "argumet - a list of legacy features to disable"
-            raise KickstartValueError, formatErrorMsg(self.lineno, msg = msg)
-
-        self.features = extra[0].split(",")
-        return self
diff --git a/scripts/lib/mic/kickstart/custom_commands/micrepo.py b/scripts/lib/mic/kickstart/custom_commands/micrepo.py
deleted file mode 100644
index b31576e..0000000
--- a/scripts/lib/mic/kickstart/custom_commands/micrepo.py
+++ /dev/null
@@ -1,127 +0,0 @@
-#!/usr/bin/python -tt
-#
-# Copyright (c) 2008, 2009, 2010 Intel, Inc.
-#
-# Yi Yang <yi.y.yang@intel.com>
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
-from pykickstart.base import *
-from pykickstart.errors import *
-from pykickstart.options import *
-from pykickstart.commands.repo import *
-
-class Mic_RepoData(F8_RepoData):
-
-    def __init__(self, baseurl="", mirrorlist=None, name="", priority=None,
-                 includepkgs=(), excludepkgs=(), save=False, proxy=None,
-                 proxy_username=None, proxy_password=None, debuginfo=False,
-                 source=False, gpgkey=None, disable=False, ssl_verify="yes",
-                 nocache=False):
-        kw = {}
-        # F8_RepoData keywords
-        if includepkgs:
-            kw['includepkgs'] = includepkgs
-        if excludepkgs:
-            kw['excludepkgs'] = excludepkgs
-
-        #FC6_RepoData keywords
-        if baseurl:
-            kw['baseurl'] = baseurl
-        if mirrorlist:
-            kw['mirrorlist'] = mirrorlist
-        if name:
-            kw['name'] = name
-
-        F8_RepoData.__init__(self, **kw)
-        self.save = save
-        self.proxy = proxy
-        self.proxy_username = proxy_username
-        self.proxy_password = proxy_password
-        self.debuginfo = debuginfo
-        self.disable = disable
-        self.source = source
-        self.gpgkey = gpgkey
-        self.ssl_verify = ssl_verify.lower()
-        self.priority = priority
-        self.nocache = nocache
-
-    def _getArgsAsStr(self):
-        retval = F8_RepoData._getArgsAsStr(self)
-
-        if self.save:
-            retval += " --save"
-        if self.proxy:
-            retval += " --proxy=%s" % self.proxy
-        if self.proxy_username:
-            retval += " --proxyuser=%s" % self.proxy_username
-        if self.proxy_password:
-            retval += " --proxypasswd=%s" % self.proxy_password
-        if self.debuginfo:
-            retval += " --debuginfo"
-        if self.source:
-            retval += " --source"
-        if self.gpgkey:
-            retval += " --gpgkey=%s" % self.gpgkey
-        if self.disable:
-            retval += " --disable"
-        if self.ssl_verify:
-            retval += " --ssl_verify=%s" % self.ssl_verify
-        if self.priority:
-            retval += " --priority=%s" % self.priority
-        if self.nocache:
-            retval += " --nocache"
-
-        return retval
-
-class Mic_Repo(F8_Repo):
-    def __init__(self, writePriority=0, repoList=None):
-        F8_Repo.__init__(self, writePriority, repoList)
-
-    def __str__(self):
-        retval = ""
-        for repo in self.repoList:
-            retval += repo.__str__()
-
-        return retval
-
-    def _getParser(self):
-        def list_cb (option, opt_str, value, parser):
-            for d in value.split(','):
-                parser.values.ensure_value(option.dest, []).append(d)
-
-        op = F8_Repo._getParser(self)
-        op.add_option("--save", action="store_true", dest="save",
-                      default=False)
-        op.add_option("--proxy", type="string", action="store", dest="proxy",
-                      default=None, nargs=1)
-        op.add_option("--proxyuser", type="string", action="store",
-                      dest="proxy_username", default=None, nargs=1)
-        op.add_option("--proxypasswd", type="string", action="store",
-                      dest="proxy_password", default=None, nargs=1)
-        op.add_option("--debuginfo", action="store_true", dest="debuginfo",
-                      default=False)
-        op.add_option("--source", action="store_true", dest="source",
-                      default=False)
-        op.add_option("--disable", action="store_true", dest="disable",
-                      default=False)
-        op.add_option("--gpgkey", type="string", action="store", dest="gpgkey",
-                      default=None, nargs=1)
-        op.add_option("--ssl_verify", type="string", action="store",
-                      dest="ssl_verify", default="yes")
-        op.add_option("--priority", type="int", action="store", dest="priority",
-                      default=None)
-        op.add_option("--nocache", action="store_true", dest="nocache",
-                      default=False)
-        return op
-- 
1.8.3.1


