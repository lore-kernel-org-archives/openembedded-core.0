Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9DECA77DCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 09:25:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 02:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,349,1496127600"; d="scan'208";a="1150698702"
Received: from phoongst-mobl2.png.intel.com ([10.221.20.163])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2017 02:25:47 -0700
From: stanley.cheong.kwan.phoong@intel.com
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2017 17:25:45 +0800
Message-Id: <1499851545-18265-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] recipetool: git reformat URI mangling & parameter stripped
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
X-List-Received-Date: Wed, 12 Jul 2017 09:25:48 -0000

From: "Stanley Cheong Kwan, Phoong" <stanley.cheong.kwan.phoong@intel.com>

recipetool seems to be mangling and stripping out the parameters for git
URI. This will fix this issue as well as resolve the conflict of
protocol parameter added by user. If a user adds their own protocol as
an argument, it'll be honored.

[YOCTO #11390]
[YOCTO #11391]

Signed-off-by: Stanley Cheong Kwan, Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 scripts/lib/recipetool/create.py | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 2a5a84c..8e63580 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -26,7 +26,7 @@ import logging
 import scriptutils
 from urllib.parse import urlparse, urldefrag, urlsplit
 import hashlib
-
+import bb.fetch2
 logger = logging.getLogger('recipetool')
 
 tinfoil = None
@@ -373,14 +373,31 @@ def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
     if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://github.com/[^/]+/[^/]+/?$', checkuri):
-        res = re.match('(http|https|ssh)://([^;]+(\.git)?)(;.*)?$', uri)
-        if res:
-            # Need to switch the URI around so that the git fetcher is used
-            return 'git://%s;protocol=%s%s' % (res.group(2), res.group(1), res.group(4) or '')
-        elif '@' in checkuri:
-            # Catch e.g. git@git.example.com:repo.git
-            return 'git://%s;protocol=ssh' % checkuri.replace(':', '/', 1)
-    return uri
+        # Appends scheme if the scheme is missing
+        if not '://' in uri:
+            uri = 'git://' + uri
+        scheme, host, path, user, pswd, parms = bb.fetch2.decodeurl(uri)
+        # Detection mechanism, this is required due to certain URL are formatter with ":" rather than "/"
+        # which causes decodeurl to fail getting the right host and path
+        if len(host.split(':')) > 1:
+            splitslash = host.split(':')
+            host = splitslash[0]
+            path = '/' + splitslash[1] + path
+        #Algorithm:
+        # if user is defined, append protocol=ssh or if a protocol is defined, then honor the user-defined protocol
+        # if no user & password is defined, check for scheme type and append the protocol with the scheme type
+        # finally if protocols or if the url is well-formed, do nothing and rejoin everything back to normal
+        # Need to repackage the arguments for encodeurl, the format is: (scheme, host, path, user, password, OrderedDict([('key', 'value')]))
+        if user:
+            if not 'protocol' in parms:
+                parms.update({('protocol', 'ssh')})
+        elif (scheme == "http" or scheme == 'https' or scheme == 'ssh') and not ('protocol' in parms):
+            parms.update({('protocol', scheme)})
+        # Always append 'git://'
+        fUrl = bb.fetch2.encodeurl(('git', host, path, user, pswd, parms))
+        return fUrl
+    else:
+        return uri
 
 def is_package(url):
     '''Check if a URL points to a package'''
-- 
2.7.4


