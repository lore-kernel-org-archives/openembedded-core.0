Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SV44q-0006K2-OV
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 19:01:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 09:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144478084"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.96])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 09:51:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 19:51:05 +0300
Message-Id: <dc7e4a79d9a1884b4c5705ef3173613958204b50.1337273095.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/12] oe.types: give the regex type more sane semantics
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 17:01:25 -0000

From: Christopher Larson <chris_larson@mentor.com>

Currently, if a variable is unset or has an empty value, the regex type
will return a match object which always matches. Not all variable types
will necessarily have the same behavior for handling defaults. I believe
that returning a match object which matches nothing when a variable is
unset is superior to returning one which matches anything, and the user
can always explicitly request anything via '.*', if that's what they
want.

This constructs a null pattern object which will never match, and uses
it when encountering an unset or empty variable (currently, these two
things are one and the same, as maketype is handling the default. we may
well want to shift that logic into the individual types, giving them
more control over default behavior, but currently the behavior is at
least relatively consistent -- no difference between unset and empty
variables).

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/lib/oe/types.py |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index ea31cf4..ea53df9 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -40,6 +40,31 @@ def choice(value, choices):
                          (value, choices))
     return value
 
+class NoMatch(object):
+    """Stub python regex pattern object which never matches anything"""
+    def findall(self, string, flags=0):
+        return None
+
+    def finditer(self, string, flags=0):
+        return None
+
+    def match(self, flags=0):
+        return None
+
+    def search(self, string, flags=0):
+        return None
+
+    def split(self, string, maxsplit=0):
+        return None
+
+    def sub(pattern, repl, string, count=0):
+        return None
+
+    def subn(pattern, repl, string, count=0):
+        return None
+
+NoMatch = NoMatch()
+
 def regex(value, regexflags=None):
     """OpenEmbedded 'regex' type
 
@@ -59,6 +84,12 @@ def regex(value, regexflags=None):
             except AttributeError:
                 raise ValueError("Invalid regex flag '%s'" % flag)
 
+    if not value:
+        # Let's ensure that the default behavior for an undefined or empty
+        # variable is to match nothing. If the user explicitly wants to match
+        # anything, they can match '.*' instead.
+        return NoMatch
+
     try:
         return re.compile(value, flagval)
     except re.error, exc:
-- 
1.7.7.6



