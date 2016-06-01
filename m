Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 036B377358
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZslQ006905; Wed, 1 Jun 2016 13:35:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ksCyQ1SgAJeE; Wed,  1 Jun 2016 13:35:56 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZptt006882
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000lA-DH; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:32 +0100
Message-Id: <1464784540-2786-14-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 14/22] scripts: Rename ConfigParser -> configparser for python3
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
X-List-Received-Date: Wed, 01 Jun 2016 12:36:01 -0000

From: Ed Bartosh <ed.bartosh@linux.intel.com>

The ConfigParser API was renamed to configparser in python 3.
Renamed ConfigParser -> configparser in scripts/ to make the
code working in python 3.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/combo-layer                             | 6 +++---
 scripts/contrib/python/generate-manifest-3.5.py | 2 +-
 scripts/devtool                                 | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 52367f0..234d9e4 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -26,7 +26,7 @@ import optparse
 import logging
 import subprocess
 import tempfile
-import ConfigParser
+import configparser
 import re
 import copy
 import pipes
@@ -87,7 +87,7 @@ class Configuration(object):
                     self.commit_msg_template = value
 
         logger.debug("Loading config file %s" % self.conffile)
-        self.parser = ConfigParser.ConfigParser()
+        self.parser = configparser.ConfigParser()
         with open(self.conffile) as f:
             self.parser.readfp(f)
 
@@ -116,7 +116,7 @@ class Configuration(object):
 
                 self.localconffile = lcfile
                 logger.debug("Loading local config file %s" % self.localconffile)
-                self.localparser = ConfigParser.ConfigParser()
+                self.localparser = configparser.ConfigParser()
                 with open(self.localconffile) as f:
                     self.localparser.readfp(f)
 
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 41f209b..e04da1d 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -167,7 +167,7 @@ if __name__ == "__main__":
     #
 
     m.addPackage( "${PN}-core", "Python interpreter and core modules", "${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${PN}-io ${PN}-math",
-    "__future__.* _abcoll.* abc.* ast.* copy.* copyreg.* ConfigParser.* " +
+    "__future__.* _abcoll.* abc.* ast.* copy.* copyreg.* configparser.* " +
     "genericpath.* getopt.* linecache.* new.* " +
     "os.* posixpath.* struct.* " +
     "warnings.* site.* stat.* " +
diff --git a/scripts/devtool b/scripts/devtool
index 9ac6e79..4dbb527 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -22,7 +22,7 @@ import os
 import argparse
 import glob
 import re
-import ConfigParser
+import configparser
 import subprocess
 import logging
 
@@ -51,12 +51,12 @@ class ConfigHandler(object):
 
     def __init__(self, filename):
         self.config_file = filename
-        self.config_obj = ConfigParser.SafeConfigParser()
+        self.config_obj = configparser.SafeConfigParser()
 
     def get(self, section, option, default=None):
         try:
             ret = self.config_obj.get(section, option)
-        except (ConfigParser.NoOptionError, ConfigParser.NoSectionError):
+        except (configparser.NoOptionError, configparser.NoSectionError):
             if default != None:
                 ret = default
             else:
-- 
2.5.0


