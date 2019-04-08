Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
	[209.85.167.174])
	by mail.openembedded.org (Postfix) with ESMTP id 70F637D48D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 01:22:26 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id a6so9172423oie.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 18:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BqIJCauV0xIdBK5Pop6DQUCezDx4z5AsDi3uOKHMgoU=;
	b=Pi+sTlSx7jSNbZo6NFQktBDxo2Pm1j9x7wNE261i9SJh+zDOm9jKeJeL1+R0grst3z
	s1eJWNR+zPuiwfyl06e849Q5jcY+u3sHZh2ZPK0/gkVP3aMmKjHgTl5s6oLpV7Hnj/9r
	6hdTmV2WzkZy7K++fGOWwfKKO/SegYdR10h6+LRPGUiorhqFaQx1pZoBmQKj6eQQA9Aq
	ThIHPUr8DpjHDxID+XgrTEasSf2nYplmRvbUnnPFrQf3z+LOkrorHmJ3VjsZm5ug3Wgm
	ZuxSpR5HJE07GQhAU3+27+pt9e+zL1EXxiJzfcMaQIsPrb1NmzeZLzuw9LeWUpgyxB9e
	hLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BqIJCauV0xIdBK5Pop6DQUCezDx4z5AsDi3uOKHMgoU=;
	b=tjirkddCSuje9ZaT+B+rjgMzFNd6e3dJj8ha2kePxwVGXvUrU+qm6GrQy6tLvUNOy+
	IwcgUCtNxQey4nwrJdDINyeb7inxFSNo4AFWLi+lNHVe/OwFvgaXg6xN2C+zh3IvZwwA
	klKTvI2GyucZAoFPZ/sPY3EBele6tzT5J5OvClbPh4jtv2YBIKuuJR0eIl3DktoHWelM
	o/VAb8fXYktC3OsSzVy5Ksb16lnqYSIDVM0erJE0ToC4S5Zg3jilvJp7AUszsYnocV4W
	M15BbXCVlepvlygD8lMEs6bNuRaY0DP6QNRuZZIlAFA2g5QJlxwXxseWUkCY759sY9OT
	+85A==
X-Gm-Message-State: APjAAAWFUY9VApeQQtDToXvnJzq5CXnGhwcKX0UmTvpYrWEg+nstKZk2
	igKR3mARX6K0Ez+8Nd4eeM17MCAY
X-Google-Smtp-Source: APXvYqySTTn+z3r7cC/It2pAB9hyF17RZRR3gMeaD68G8l2wgUghS/vS/wN4QwDPeTS5yQFCjbZvvw==
X-Received: by 2002:aca:53d4:: with SMTP id
	h203mr14518614oib.107.1554686547231; 
	Sun, 07 Apr 2019 18:22:27 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	z2sm16258206ota.56.2019.04.07.18.22.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 18:22:26 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Apr 2019 20:21:55 -0500
Message-Id: <30b90189f08b7edd9f46e36da8116c6f278395eb.1554686123.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554686123.git.just.another.mariano@gmail.com>
References: <cover.1554686123.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3 1/4] update-alternatives.bbclass: Add function to get metadata
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
X-List-Received-Date: Mon, 08 Apr 2019 01:22:26 -0000
Content-Transfer-Encoding: 8bit

This adds update_alternatives_alt_targets function to get the metadata
for a package. This is for code reuse because the metadata would help
other classes that needs to be aware of how update-alternatives modify
the final package.

[YOCTO #12597]
[YOCTO #13238]

Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
---
 meta/classes/update-alternatives.bbclass | 70 +++++++++++++++---------
 1 file changed, 45 insertions(+), 25 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 537e85d9a3..b702e77ee5 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -216,42 +216,62 @@ python apply_update_alternative_renames () {
             update_files(alt_target, alt_target_rename, pkg, d)
 }
 
+def update_alternatives_alt_targets(d, pkg):
+    """
+    Returns the update-alternatives metadata for a package.
+
+    The returned format is a list of tuples where the tuple contains:
+    alt_name:     The binary name
+    alt_link:     The path for the binary (Shared by different packages)
+    alt_target:   The path for the renamed binary (Unique per package)
+    alt_priority: The priority of the alt_target
+
+    All the alt_targets will be installed into the sysroot. The alt_link is
+    a symlink pointing to the alt_target with the highest priority.
+    """
+
+    pn = d.getVar('BPN')
+    pkgdest = d.getVar('PKGD')
+    updates = list()
+    for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
+        alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
+        alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or \
+                       d.getVarFlag('ALTERNATIVE_TARGET', alt_name) or \
+                       d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or \
+                       d.getVar('ALTERNATIVE_TARGET') or \
+                       alt_link
+        alt_priority = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg,  alt_name) or \
+                       d.getVarFlag('ALTERNATIVE_PRIORITY',  alt_name) or \
+                       d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg) or  \
+                       d.getVar('ALTERNATIVE_PRIORITY')
+
+        # This shouldn't trigger, as it should have been resolved earlier!
+        if alt_link == alt_target:
+            bb.note('alt_link == alt_target: %s == %s -- correcting, this should not happen!' % (alt_link, alt_target))
+            alt_target = '%s.%s' % (alt_target, pn)
+
+        if not os.path.lexists('%s/%s' % (pkgdest, alt_target)):
+            bb.warn('%s: NOT adding alternative provide %s: %s does not exist' % (pn, alt_link, alt_target))
+            continue
+
+        alt_target = os.path.normpath(alt_target)
+        updates.append( (alt_name, alt_link, alt_target, alt_priority) )
+
+    return updates
+
 PACKAGESPLITFUNCS_prepend = "populate_packages_updatealternatives "
 
 python populate_packages_updatealternatives () {
     if not update_alternatives_enabled(d):
         return
 
-    pn = d.getVar('BPN')
-
     # Do actual update alternatives processing
-    pkgdest = d.getVar('PKGD')
     for pkg in (d.getVar('PACKAGES') or "").split():
         # Create post install/removal scripts
         alt_setup_links = ""
         alt_remove_links = ""
-        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
-            alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
-            alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name)
-            alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
-            # Sometimes alt_target is specified as relative to the link name.
-            alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
-
-            alt_priority = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg,  alt_name) or d.getVarFlag('ALTERNATIVE_PRIORITY',  alt_name)
-            alt_priority = alt_priority or d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg) or d.getVar('ALTERNATIVE_PRIORITY')
-
-            # This shouldn't trigger, as it should have been resolved earlier!
-            if alt_link == alt_target:
-                bb.note('alt_link == alt_target: %s == %s -- correcting, this should not happen!' % (alt_link, alt_target))
-                alt_target = '%s.%s' % (alt_target, pn)
-
-            if not os.path.lexists('%s/%s' % (pkgdest, alt_target)):
-                bb.warn('%s: NOT adding alternative provide %s: %s does not exist' % (pn, alt_link, alt_target))
-                continue
-
-            # Default to generate shell script.. eventually we may want to change this...
-            alt_target = os.path.normpath(alt_target)
-
+        updates = update_alternatives_alt_targets(d, pkg)
+        for alt_name, alt_link, alt_target, alt_priority in updates:
             alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
             alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
 
-- 
2.19.2


