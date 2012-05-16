Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SUT9o-0007OX-SC
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 03:36:05 +0200
Received: by obhx4 with SMTP id x4so340844obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 18:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7QKtk4wtph4lVivCLGkh4Yyc0rArCpcwyWED1cLEIMY=;
	b=D6dhZ+GwP1LATliJuALbCnwlCnC03VmwT7s8+ssaDikJTOvBINLMY8BapGJTeIWu1A
	xqdyGU42pLDq/Jr7blOmVlGUI6QsC5bLNQNq/Z8VHyHWecMQ+SKyBKS4uuy588VtW8kc
	L45O2gNDvEfgY/fF42o91GyaSLJZdF78k44f9MQmPiw7UX6yVPtF3rDUEyOGBJlWNnuO
	RnxC1Th8zFgoMgBJS17HgbTjKjdkteys39J9PQG+xJo6ue+FTNYEZo+USCMw3qEeHpmv
	XmoDE9N1kfMyp1KxkBQ2eWl5NL8xq850kcR7p48jzj5N39TtuQiWcM9VLAnlEXriXn+1
	3zuA==
Received: by 10.182.111.7 with SMTP id ie7mr1081699obb.14.1337131563707;
	Tue, 15 May 2012 18:26:03 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id r8sm770835oer.6.2012.05.15.18.26.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 18:26:02 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2012 20:26:25 -0500
Message-Id: <1337131585-8741-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] oe.types: give the regex type more sane semantics
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
X-List-Received-Date: Wed, 16 May 2012 01:36:05 -0000

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
1.7.7



