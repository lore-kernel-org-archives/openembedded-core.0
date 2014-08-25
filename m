Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7E370F5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 22:57:59 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id rd3so22094003pab.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 15:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/ZumF0ilPZVNL0Xxtq8680Xx/nb40Olx3yXjp5kwJ7I=;
	b=dNWEU07EqKG2UnJ3ZdWquIG0T3+0keT0IpnzP/dp11hHOvDuxhhMDts4/+9d9T/ag+
	sg9zB2Nt+CB1jcepRC/K/T9vurXHE9b5NSnrrba6nUysa16ezRX37NwyUuO9d9/jgxm2
	trcRQN9a9VhIWuB2/7morFmWMUK0l4p5yvwXZ9xkgFidQBCLNQ79jYmfr4SP4xUzbOEh
	tqzniaKcS7hVFfY2Vp+u9FYjA/LqckkA4x0ftldWA++rZEi3L/4jawHGH0ulRNy/iL9V
	9k67XM060/ILgYuLzGEpHGFUui8tLX4ucBJQ0lPuJTGu4duynBX5pZ3cXbHMbaGPZZbT
	st4Q==
X-Received: by 10.68.65.36 with SMTP id u4mr15282297pbs.127.1409007480981;
	Mon, 25 Aug 2014 15:58:00 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id bv5sm922487pbc.20.2014.08.25.15.57.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 15:57:59 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 15:57:44 -0700
Message-Id: <8fa6adaaa363a88c888f2afab2f0117b199a54c0.1409007366.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409007366.git.chris_larson@mentor.com>
References: <cover.1409007366.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409007366.git.chris_larson@mentor.com>
References: <cover.1409007366.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 3/3] sanity: refactor mirrors checks to be more pythonic
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
X-List-Received-Date: Mon, 25 Aug 2014 22:58:00 -0000

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


