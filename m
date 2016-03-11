Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 44CC5731DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 15:05:53 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id z8so13226858ige.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 07:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=k1j6NoHEn0WW8vCcaW27r1NIsql5zdfEaD3QT8m3RYw=;
	b=oOqtwLh33VI+tIc5qiu7T0hjxnUs/PpJ5t++pdyyN3YPVUNTnDKHEScg4L6fZIEpOA
	wE1dnS4TAG7dqPnZ0HnR6UkITFWNIBhXO2ZDqWPfSqdPXFLK45xDumHFQ5sspALDYKsm
	q1BziEwP2m9/2Osd1K7zVCAYeMZTl1YFu9xiaMrNlQXvaNxsgmiD9N7g4IXgpTl951yA
	1cAPsgsivH/dsHLB+d2wTVX6Dziu+SrFW13I6nwZ2mNIMwJ/OU0/RVZyz47hxxwkqLAF
	qGQb8CFMc1TLZKaGMGyed7ccVweCatXQbGxMdIyzmtY5pckK9tvOXbXSKa4h39GZalwq
	UADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k1j6NoHEn0WW8vCcaW27r1NIsql5zdfEaD3QT8m3RYw=;
	b=fbtxOYuKLJAR5kzzhkJm/Iyz87Uv+Fr0rLP5OIjnvyp9ZsOSMIdMK0idEkjoLj3kMu
	iNAXgnZCH9Dc8EkwkiQtIp+QSG9vHcKtuTsjqSDh68YsLjOcGn7yleQWiOWvaCfd7ZtQ
	r710+p4FUFaX3VavD9TszH59OIewNpWwxnFi4PrNbMiGdzZuQ5oH6PbUVhXujXt4n++v
	iLWiKrPR8QbmY4YBLCH+fCAuHZ54UWoQ9lj+7H80Hz3hZNcXks6gXBlje9CAOWrcThn4
	9+mGgUMrH+ohD1WTs7mBJCIRoLf5JGB1zVPtuIvNnmWggJ0DVEAfpqzTIVpo02r284WO
	mVCA==
X-Gm-Message-State: AD7BkJLzrXV1HTkZaK74QDGUsKEbzxNAVA0+USL2MPuuwDKOkcColbfolafH2TAJlK496fY+
X-Received: by 10.50.28.19 with SMTP id x19mr3924003igg.19.1457708754551;
	Fri, 11 Mar 2016 07:05:54 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C5D0.dip0.t-ipconnect.de.
	[93.232.197.208]) by smtp.gmail.com with ESMTPSA id
	s101sm3614908ioe.24.2016.03.11.07.05.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Mar 2016 07:05:53 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 16:05:46 +0100
Message-Id: <1457708746-733-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image-buildinfo.bbclass: fix performance problems
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
X-List-Received-Date: Fri, 11 Mar 2016 15:05:54 -0000

Inheriting image-buildinfo.bbclass primarily slowed down image
building for two reasons:
1. The content of the shell command "buildinfo" gets expanded
   multiple times, each time again checking the state of all
   layers.
2. When expanded as part of the actual image creation, git
   is invoked under pseudo, which makes the check quite a bit
   slower (from a few seconds to a minute with many layers).

To fix this, buildinfo now is a Python method which calls the checks
only when really executed. Pseudo is told to unload itself when
starting git.

In addition, "git diff" is invoked with "--quiet", which avoids
producing output that is just getting thrown away. As before, any kind
of problem or output causes the layer to be marked as "modified".

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image-buildinfo.bbclass | 39 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 5b738ae..408b5b8 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -26,12 +26,21 @@ def image_buildinfo_outputvars(vars, listvars, d):
 
 # Gets git branch's status (clean or dirty)
 def get_layer_git_status(path):
-    f = os.popen("cd %s; git diff --stat 2>&1 | tail -n 1" % path)
-    data = f.read()
-    if f.close() is None:
-        if len(data) != 0:
-            return "-- modified"
-    return ""
+    import subprocess
+    import copy
+    import os
+    try:
+        env = copy.deepcopy(os.environ)
+        subprocess.check_output("cd %s; PSEUDO_UNLOAD=1 git diff --quiet --no-ext-diff" % path,
+                                shell=True,
+                                stderr=subprocess.STDOUT,
+                                env=env)
+        return ""
+    except subprocess.CalledProcessError, ex:
+        # Silently treat errors as "modified", without checking for the
+        # (expected) return code 1 in a modified git repo. For example, we get
+        # output and a 129 return code when a layer isn't a git repo at all.
+        return "-- modified"
 
 # Returns layer revisions along with their respective status
 def get_layer_revs(d):
@@ -53,17 +62,21 @@ def buildinfo_target(d):
         return image_buildinfo_outputvars(vars, listvars, d)
 
 # Write build information to target filesystem
-buildinfo () {
-cat > ${IMAGE_ROOTFS}${sysconfdir}/build << END
------------------------
+python buildinfo () {
+    with open(d.expand('${IMAGE_ROOTFS}${sysconfdir}/build'), 'w') as build:
+        build.writelines((
+            '''-----------------------
 Build Configuration:  |
 -----------------------
-${@buildinfo_target(d)}
+''',
+            buildinfo_target(d),
+            '''
 -----------------------
-Layer Revisions:      |   
+Layer Revisions:      |
 -----------------------
-${@get_layer_revs(d)}
-END
+''',
+            get_layer_revs(d)
+       ))
 }
 
 IMAGE_PREPROCESS_COMMAND += "buildinfo;"
-- 
2.1.4


