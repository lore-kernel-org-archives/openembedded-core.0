Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id B27E66ACBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 22:47:10 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id r10so21250756pdi.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 15:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/ZumF0ilPZVNL0Xxtq8680Xx/nb40Olx3yXjp5kwJ7I=;
	b=s2CTgU8Amcad0U2RHX22aykF8+7EKXoOa7D8BgMoOMbL+1y+rsFnF29xkkXB4cFwkX
	s5dJBzloM0TXjtgiLOY4WgK3SR6IgXCiWw4xY60SS7hkFF/D1xMKsyEsUePbNs/6rFtE
	qI5F7ooYArj/ZtyfJ8kcKFVHo0+RWxMb11S9GJOFHt5VG9e/JGjtiLUiFnVqwc+2PvT2
	pukuChtqgdgaG3j4qq9UVT6EpRILEh7ApfKxN/laes/JXv1f5N8Csp7ppilF/JIWur/8
	M6FDu0v7Xn2qOPDAilAufsh28hX/rO7d5rhJZh/fePX+Bjux5ZP6wyzQgfLzXhnt2Loh
	3hLw==
X-Received: by 10.68.189.137 with SMTP id gi9mr31777172pbc.87.1409006831829;
	Mon, 25 Aug 2014 15:47:11 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id j5sm1513440pdp.9.2014.08.25.15.47.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 15:47:10 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 15:46:58 -0700
Message-Id: <47b5636f4c87979aecfbcb743235a9e010bedd23.1409006757.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409006757.git.chris_larson@mentor.com>
References: <cover.1409006757.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409006757.git.chris_larson@mentor.com>
References: <cover.1409006757.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] sanity: refactor mirrors checks to be more pythonic
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
X-List-Received-Date: Mon, 25 Aug 2014 22:47:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

- Use clearer variable names
- Use variable unpacking to reference elements by name rather than index
- Sacrifice a small amount of time (iterate over protocols twice per entry
  rather than once) for clarity: use readable generator expressions with any()
  rather than maintaining state.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/sanity.bbclass | 73 ++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 38 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index f655d8b..5be5efb 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -755,44 +755,41 @@ def check_sanity_everybuild(status, d):
 
     # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
     import re
-    mir_types = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
-    protocols = ['http://', 'ftp://', 'file://', 'https://', \
-        'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', 'svn://', \
-        'bzr://', 'cvs://']
-    for mir_type in mir_types:
-        mirros = (d.getVar(mir_type, True) or '').replace('\\n', '\n').split('\n')
-        for mir in mirros:
-            mir_list = mir.split()
-            # Should be two members.
-            if len(mir_list) not in [0, 2]:
-                bb.warn('Invalid %s: %s, should be 2 members, but found %s.' \
-                    % (mir_type, mir.strip(), len(mir_list)))
-            elif len(mir_list) == 2:
-                decoded = bb.fetch2.decodeurl(mir_list[0])
-                try:
-                    pattern_scheme = re.compile(decoded[0])
-                except re.error as exc:
-                    bb.warn('Invalid scheme regex (%s) in %s: %s' % (decoded[0], mir_type, mir.strip()))
-                    continue
-
-                # Each member should start with protocols
-                valid_protocol_0 = False
-                valid_protocol_1 = False
-                file_absolute = True
-                for protocol in protocols:
-                    if not valid_protocol_0 and pattern_scheme.match(protocol[:-3]):
-                        valid_protocol_0 = True
-                    if not valid_protocol_1 and mir_list[1].startswith(protocol):
-                        valid_protocol_1 = True
-                        # The file:// must be an absolute path.
-                        if protocol == 'file://' and not mir_list[1].startswith('file:///'):
-                            file_absolute = False
-                    if valid_protocol_0 and valid_protocol_1:
-                        break
-                if not (valid_protocol_0 and valid_protocol_1):
-                    bb.warn('Invalid protocol in %s: %s' % (mir_type, mir.strip()))
-                if not file_absolute:
-                    bb.warn('Invalid file url in %s: %s, must be absolute path (file:///)' % (mir_type, mir.strip()))
+    mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
+    protocols = ['http', 'ftp', 'file', 'https', \
+                 'git', 'gitsm', 'hg', 'osc', 'p4', 'svk', 'svn', \
+                 'bzr', 'cvs']
+    for mirror_var in mirror_vars:
+        mirrors = (d.getVar(mirror_var, True) or '').replace('\\n', '\n').split('\n')
+        for mirror_entry in mirrors:
+            mirror_entry = mirror_entry.strip()
+            if not mirror_entry:
+                # ignore blank lines
+                continue
+
+            try:
+                pattern, mirror = mirror_entry.split()
+            except ValueError:
+                bb.warn('Invalid %s: %s, should be 2 members.' % (mirror_var, mirror_entry.strip()))
+                continue
+
+            decoded = bb.fetch2.decodeurl(pattern)
+            try:
+                pattern_scheme = re.compile(decoded[0])
+            except re.error as exc:
+                bb.warn('Invalid scheme regex (%s) in %s; %s' % (pattern, mirror_var, mirror_entry))
+                continue
+
+            if not any(pattern_scheme.match(protocol) for protocol in protocols):
+                bb.warn('Invalid protocol (%s) in %s: %s' % (decoded[0], mirror_var, mirror_entry))
+                continue
+
+            if not any(mirror.startswith(protocol + '://') for protocol in protocols):
+                bb.warn('Invalid protocol in %s: %s' % (mirror_var, mirror_entry))
+                continue
+
+            if mirror.startswith('file://') and not mirror.startswith('file:///'):
+                bb.warn('Invalid file url in %s: %s, must be absolute path (file:///)' % (mirror_var, mirror_entry))
 
     # Check that TMPDIR hasn't changed location since the last time we were run
     tmpdir = d.getVar('TMPDIR', True)
-- 
1.8.3.4


