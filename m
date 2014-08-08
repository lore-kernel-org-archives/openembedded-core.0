Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DFAE86FECD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2014 15:06:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="582200262"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2014 15:06:23 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:35 -0500
Message-Id: <8a900ffeee2f0a3a2d7895faf61a4e8b69e86d24.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 10/35] wic: Remove grabber implementation
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:23 -0000

wic doesn't need to grab any urls, so remove it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/grabber.py | 97 ----------------------------------------
 1 file changed, 97 deletions(-)
 delete mode 100644 scripts/lib/mic/utils/grabber.py

diff --git a/scripts/lib/mic/utils/grabber.py b/scripts/lib/mic/utils/grabber.py
deleted file mode 100644
index 45e30b4..0000000
--- a/scripts/lib/mic/utils/grabber.py
+++ /dev/null
@@ -1,97 +0,0 @@
-#!/usr/bin/python
-
-import os
-import sys
-import rpm
-import fcntl
-import struct
-import termios
-
-from mic import msger
-from mic.utils import runner
-from mic.utils.errors import CreatorError
-
-from urlgrabber import grabber
-from urlgrabber import __version__ as grabber_version
-
-if rpm.labelCompare(grabber_version.split('.'), '3.9.0'.split('.')) == -1:
-    msger.warning("Version of python-urlgrabber is %s, lower than '3.9.0', "
-                  "you may encounter some network issues" % grabber_version)
-
-def myurlgrab(url, filename, proxies, progress_obj = None):
-    g = grabber.URLGrabber()
-    if progress_obj is None:
-        progress_obj = TextProgress()
-
-    if url.startswith("file:/"):
-        filepath = "/%s" % url.replace("file:", "").lstrip('/')
-        if not os.path.exists(filepath):
-            raise CreatorError("URLGrabber error: can't find file %s" % url)
-        if url.endswith('.rpm'):
-            return filepath
-        else:
-            # untouch repometadata in source path
-            runner.show(['cp', '-f', filepath, filename])
-
-    else:
-        try:
-            filename = g.urlgrab(url=str(url),
-                                 filename=filename,
-                                 ssl_verify_host=False,
-                                 ssl_verify_peer=False,
-                                 proxies=proxies,
-                                 http_headers=(('Pragma', 'no-cache'),),
-                                 quote=0,
-                                 progress_obj=progress_obj)
-        except grabber.URLGrabError, err:
-            msg = str(err)
-            if msg.find(url) < 0:
-                msg += ' on %s' % url
-            raise CreatorError(msg)
-
-    return filename
-
-def terminal_width(fd=1):
-    """ Get the real terminal width """
-    try:
-        buf = 'abcdefgh'
-        buf = fcntl.ioctl(fd, termios.TIOCGWINSZ, buf)
-        return struct.unpack('hhhh', buf)[1]
-    except: # IOError
-        return 80
-
-def truncate_url(url, width):
-    return os.path.basename(url)[0:width]
-
-class TextProgress(object):
-    # make the class as singleton
-    _instance = None
-    def __new__(cls, *args, **kwargs):
-        if not cls._instance:
-            cls._instance = super(TextProgress, cls).__new__(cls, *args, **kwargs)
-
-        return cls._instance
-
-    def __init__(self, totalnum = None):
-        self.total = totalnum
-        self.counter = 1
-
-    def start(self, filename, url, *args, **kwargs):
-        self.url = url
-        self.termwidth = terminal_width()
-        msger.info("\r%-*s" % (self.termwidth, " "))
-        if self.total is None:
-            msger.info("\rRetrieving %s ..." % truncate_url(self.url, self.termwidth - 15))
-        else:
-            msger.info("\rRetrieving %s [%d/%d] ..." % (truncate_url(self.url, self.termwidth - 25), self.counter, self.total))
-
-    def update(self, *args):
-        pass
-
-    def end(self, *args):
-        if self.counter == self.total:
-            msger.raw("\n")
-
-        if self.total is not None:
-            self.counter += 1
-
-- 
1.8.3.1


