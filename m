Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 89495605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 19:31:40 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r15-v6so15874610wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3R/75cVc1BkFWkvtTUTwQqVtoBXObac+frF2zhXnqYQ=;
	b=YVuXQOB7RKTjIidn69KB11PsI8936YO25ZZJ48eOyI0vMYEmaKp7j1jkZShWYKGxk9
	WUrjTIsL0vzA9NYsQgGQ+9q4Ft7Ul4/bXV44JRmUN9K6hzoypfVbs9T0Hv2AsanxwZPK
	X1z8n/CJ7T94PVayk1wtjcER7Z4LuNHY7Re+zY9d4SZ6fCXyytIxST7lWVFNNkZD1k8I
	LuYYyW/5PK4IOF6YgUMZ18C0WO1ECO/e8Oa3SGGRm3IPUZ9P7Q6LI7Xe8nEm34/RdYfs
	b9uewb07ax2vLMhM7h+JZ+YM9tqrZUCQ2FVN6gIhzoNSh8VbdBNxEqscyjrMw0ModNu/
	T/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3R/75cVc1BkFWkvtTUTwQqVtoBXObac+frF2zhXnqYQ=;
	b=PYPr6QV9jFOWaJSjL27OHGU2ipho/jD5+5o8duH5hkrx99Hq6vY+gkQTL0jXn0nMdc
	MU4jS8fjbBXfnQcb7lk2p50OXwR27yho1pRqy+iVRNeZ6F2fo5F4AIUkM8ZjfNzrR5p0
	4MnQfUKmUItee29TO+7+VGrDSQd0W8RLD7lz3i75Vfj5Prek6Fb6CfHdbG3cWD1MEfNO
	Il29/EyxxBibVI1T4eBAHcH/rfg8dqlWB3dCJqdnobgMEzP+5if5lw3s6FOQIGlx6pub
	g+WB3UFoeQZCacVQmNfyCUvzQxuufP7cQv7ah0jmfFsKjuWnqJiz/+cUqp8O0Ahx7KGK
	ze0Q==
X-Gm-Message-State: ALKqPwdA34pis4/pTkEYBrMqHr8JvAStT1GYftRyKA+1DeEuhex473qA
	523+DRdM02wxO+RGbYbdPF9zeQ==
X-Google-Smtp-Source: ADUXVKJBAXx9C7w95sWBMPx3zbDlgJLX1FM9iZ6i3HIQ5xr0ooIYugPuu3r0YSAi360PuuROdKvzSQ==
X-Received: by 2002:a50:a5b5:: with SMTP id
	a50-v6mr171782edc.289.1527622300532; 
	Tue, 29 May 2018 12:31:40 -0700 (PDT)
Received: from localhost.localdomain (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	m12-v6sm299681edd.86.2018.05.29.12.31.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 12:31:39 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 21:31:00 +0200
Message-Id: <20180529193101.43396-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [poky][PATCH 1/2] devtool sdk-update: Support Basic Auth
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
X-List-Received-Date: Tue, 29 May 2018 19:31:40 -0000

Support HTTP Basic Auth for plain HTTP downloads as well as for
downloads performed by git. If the server returns a 401 error
and Basic Auth is supported by the server, the user is asked for
credentials.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 scripts/lib/devtool/sdk.py | 105 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 97 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 4616753797..fbf69264e6 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -21,13 +21,93 @@ import logging
 import glob
 import shutil
 import errno
-import sys
 import tempfile
 import re
+import urllib.request
+import base64
+import getpass
+
 from devtool import exec_build_env_command, setup_tinfoil, parse_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
+
+class SdkUpdateHelper(object):
+    """Chache the basic auth credentials of an http connection for http file and git downloads.
+    """
+    def __init__(self, user_name=None):
+        self.__user_name = user_name
+        self.__user_password = None
+        self.__ba_credentials = None
+
+    def ask_ba_credentials(self, user_name=None):
+        '''Ask user for Basic Auth Credentials'''
+        if not self.__user_name:
+            self.__user_name = input("User Name: ")
+        self.__user_password = getpass.getpass()
+
+        credentials = ('%s:%s' % (self.__user_name, self.__user_password))
+        b64_credentials = base64.b64encode(credentials.encode('ascii'))
+        self.__ba_credentials = 'Basic %s' % b64_credentials.decode("ascii")
+
+    def download(self, dl_url, out_file_name):
+        """If the HTTP server returns a 401 error code, a second trial with credentials is started.
+        Currently only basic auth is supported.
+        The implementation does not use pythons advanced authentication and password features since
+        the credentials are used by git as well.
+        git_ functions use credentials if the credentials are prepared by this http download function.
+
+        return 0 = success, 1 = failed
+        """
+        logger.debug("Downloading: %s to %s" % (dl_url, out_file_name))
+        http_con_trials = 2
+        while http_con_trials > 0:
+            req = urllib.request.Request(dl_url)
+            if self.__ba_credentials:
+                req.add_header('Authorization', self.__ba_credentials)
+            try:
+                with urllib.request.urlopen(req) as response, open(out_file_name, 'wb') as out_file:
+                    data = response.read()
+                    out_file.write(data)
+                    return 0  # success
+            except urllib.error.HTTPError as hexp:
+                if hexp.code == 401:
+                    hdrs_lower = {k.lower():v for k,v in hexp.hdrs.items()}
+                    try:
+                        auth_type = hdrs_lower['www-authenticate']
+                        logger.debug("auth_type: %s", auth_type)
+                        if auth_type.lower().startswith('basic'):
+                            self.ask_ba_credentials()  # re-try with credentials
+                        else:
+                            logger.error("HTTP download permission denied, no supported authentication type (%s)" % auth_type)
+                            return 1
+                    except KeyError:
+                        logger.error("HTTP download permission denied, authentication is not supported by the server.")
+                        return 1
+                else:
+                    print(str(hexp.code))
+                    print(str(hexp.msg))
+                    print(str(hexp.hdrs))
+                    return 1
+            http_con_trials -= 1
+        return 1
+
+    def _git_http_command(self, command, updateserver="", cwd=None):
+        git_ba_header = ""
+        if self.__ba_credentials:
+            git_ba_header = "-c http.extraheader=\"Authorization: %s\" " % self.__ba_credentials
+
+        git_cmd = "git %s %s %s" % (git_ba_header, command, updateserver)
+        logger.debug("Running: %s", git_cmd)
+        return subprocess.call(git_cmd, shell=True, cwd=cwd)
+
+    def git_clone(self, updateserver="", cwd=None):
+        return self._git_http_command("clone", updateserver, cwd)
+
+    def git_fetch_all(self, cwd=None):
+        return self._git_http_command("fetch --all", cwd=cwd)
+
+
 def parse_locked_sigs(sigfile_path):
     """Return <pn:task>:<hash> dictionary"""
     sig_dict = {}
@@ -138,13 +218,16 @@ def sdk_update(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
 
+    sdk_update_helper = SdkUpdateHelper()
     tmpsdk_dir = tempfile.mkdtemp()
     try:
         os.makedirs(os.path.join(tmpsdk_dir, 'conf'))
         new_locked_sig_file_path = os.path.join(tmpsdk_dir, 'conf', 'locked-sigs.inc')
         # Fetch manifest from server
-        tmpmanifest = os.path.join(tmpsdk_dir, 'conf', 'sdk-conf-manifest')
-        ret = subprocess.call("wget -q -O %s %s/conf/sdk-conf-manifest" % (tmpmanifest, updateserver), shell=True)
+        sdk_conf_mf = 'sdk-conf-manifest'
+        tmpmanifest = os.path.join(tmpsdk_dir, 'conf', sdk_conf_mf)
+        tmpmanifest_url = "%s/conf/sdk-conf-manifest" % updateserver
+        ret = sdk_update_helper.download(tmpmanifest_url, tmpmanifest)
         if ret != 0:
             logger.error("Cannot dowload files from %s" % updateserver)
             return ret
@@ -155,10 +238,14 @@ def sdk_update(args, config, basepath, workspace):
         # Update metadata
         logger.debug("Updating metadata via git ...")
         #Check for the status before doing a fetch and reset
-        if os.path.exists(os.path.join(basepath, 'layers/.git')):
+        if os.path.exists(os.path.join(layers_dir, '.git')):
             out = subprocess.check_output("git status --porcelain", shell=True, cwd=layers_dir)
             if not out:
-                ret = subprocess.call("git fetch --all; git reset --hard @{u}", shell=True, cwd=layers_dir)
+                ret = sdk_update_helper.git_fetch_all(layers_dir)
+                if ret == 0:
+                    git_cmd = "git reset --hard @{u}"
+                    logger.debug("Running: %s", git_cmd)
+                    ret = subprocess.call(git_cmd, shell=True, cwd=layers_dir)
             else:
                 logger.error("Failed to update metadata as there have been changes made to it. Aborting.");
                 logger.error("Changed files:\n%s" % out);
@@ -166,13 +253,15 @@ def sdk_update(args, config, basepath, workspace):
         else:
             ret = -1
         if ret != 0:
-            ret = subprocess.call("git clone %s/layers/.git" % updateserver, shell=True, cwd=tmpsdk_dir)
+            ret = sdk_update_helper.git_clone("%s/layers/.git" % updateserver, tmpsdk_dir)
             if ret != 0:
                 logger.error("Updating metadata via git failed")
                 return ret
         logger.debug("Updating conf files ...")
         for changedfile in changedfiles:
-            ret = subprocess.call("wget -q -O %s %s/%s" % (changedfile, updateserver, changedfile), shell=True, cwd=tmpsdk_dir)
+            changedfile_url = "%s/%s" % (updateserver, changedfile)
+            logger.debug("Downloading %s from %s", changedfile, changedfile_url)
+            ret = sdk_update_helper.download(changedfile_url, os.path.join(tmpsdk_dir, changedfile))
             if ret != 0:
                 logger.error("Updating %s failed" % changedfile)
                 return ret
@@ -197,7 +286,7 @@ def sdk_update(args, config, basepath, workspace):
                 for buildarch, chksum in newsums:
                     uninative_file = os.path.join('downloads', 'uninative', chksum, '%s-nativesdk-libc.tar.bz2' % buildarch)
                     mkdir(os.path.join(tmpsdk_dir, os.path.dirname(uninative_file)))
-                    ret = subprocess.call("wget -q -O %s %s/%s" % (uninative_file, updateserver, uninative_file), shell=True, cwd=tmpsdk_dir)
+                    ret = sdk_update_helper.download("%s/%s" % (updateserver, uninative_file), os.path.join(tmpsdk_dir, uninative_file))
 
         # Ok, all is well at this point - move everything over
         tmplayers_dir = os.path.join(tmpsdk_dir, 'layers')
-- 
2.14.1


