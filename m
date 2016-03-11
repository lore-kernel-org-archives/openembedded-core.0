Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8E02673232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 15:10:56 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id m184so149183021iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 07:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KAqVpdERJwSbMsUQCbgRyEgDzCh0c7Cl0NyTRd5xhM4=;
	b=x97eKHiJjRWr1yj1N1IPJkXNoQE6ucYuoa3bthD+iQluTebs40rNBlvFfRYaZvBJvZ
	USSlAAlMFt9nVB9WqCWydhILKsjdrkVuJ7lAno/1Ypogi+r2+kfOF8WNSpvVJ3yz5Q2a
	cDibNRdm6sPNs+BWd9iBEGlw2Ctr201u/BXjDHgVjm1kFtbUVEFZWbJAPWgaeGmt4UAc
	LRdv7Ph0O7/vaM4zNjBSvG9Rx/EmK6DHZgWHGmb1GQdoVdtb9VRSTjYvU8010MbuKgkH
	fze3gLpjAJVUBjA5DBe+5IIswvlznjyXEE7pa/9Gt0wgp4nmcoFmRA82rLJGK3OP0bNX
	PFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KAqVpdERJwSbMsUQCbgRyEgDzCh0c7Cl0NyTRd5xhM4=;
	b=kie3hniKUF9Yjsj5w+A142ArB7d/BqRO+hTIg1gmagBDD6mNzlQTkQ9eyve92Cq/2H
	df9UUr8EZKifFiB8N6/UmCRWZy+xR0XoGYgFcJ2lZWQ2jVQel1jr5AOwp/pcaapFZqCY
	a4MFCIRiiRVy1BX5MSiq/ZclqXT7/5AU56y6kzOjr4qud8RdVFiRuqLKLqAXWFe6agkI
	Gi1VDBreS6DI2Cu2KgZNwwLnVnQO1ifMavInpLG9NRW26cAnvy2z1UDW65QEIVbPoxzG
	XLZsx+warZiVdzTYZn1aTq14rGeJ4yCqWH1liZiUlnX2k4NeOJTGVG80ngTeJNrbAZru
	BC7g==
X-Gm-Message-State: AD7BkJKvm1lEAGBCpHa+0/jE9mVPTaeeaTf5MUgthMr4BH7C/wYwRjasLKRIMXaZ1zhnBoCl
X-Received: by 10.107.14.196 with SMTP id 187mr10856644ioo.134.1457709057305; 
	Fri, 11 Mar 2016 07:10:57 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C5D0.dip0.t-ipconnect.de.
	[93.232.197.208])
	by smtp.gmail.com with ESMTPSA id k2sm3612355ioe.19.2016.03.11.07.10.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Mar 2016 07:10:56 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 16:10:53 +0100
Message-Id: <1457709053-1023-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457708746-733-1-git-send-email-patrick.ohly@intel.com>
References: <1457708746-733-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH v2] image-buildinfo.bbclass: fix performance problems
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
X-List-Received-Date: Fri, 11 Mar 2016 15:10:58 -0000

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

[Revision 2 of the change with some dead code removed]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image-buildinfo.bbclass | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 5b738ae..197b242 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -26,12 +26,17 @@ def image_buildinfo_outputvars(vars, listvars, d):
 
 # Gets git branch's status (clean or dirty)
 def get_layer_git_status(path):
-    f = os.popen("cd %s; git diff --stat 2>&1 | tail -n 1" % path)
-    data = f.read()
-    if f.close() is None:
-        if len(data) != 0:
-            return "-- modified"
-    return ""
+    import subprocess
+    try:
+        subprocess.check_output("cd %s; PSEUDO_UNLOAD=1 git diff --quiet --no-ext-diff" % path,
+                                shell=True,
+                                stderr=subprocess.STDOUT)
+        return ""
+    except subprocess.CalledProcessError, ex:
+        # Silently treat errors as "modified", without checking for the
+        # (expected) return code 1 in a modified git repo. For example, we get
+        # output and a 129 return code when a layer isn't a git repo at all.
+        return "-- modified"
 
 # Returns layer revisions along with their respective status
 def get_layer_revs(d):
@@ -53,17 +58,21 @@ def buildinfo_target(d):
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


