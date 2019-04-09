Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1381E7D485
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 05:44:27 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id e5so12573293oii.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 22:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BqIJCauV0xIdBK5Pop6DQUCezDx4z5AsDi3uOKHMgoU=;
	b=hrOcPitY7zVm7jIzWLpAWjGTnRpJ82ifY51Sclj9+lwzkiAkzEVAp9o+RlgQhOwQ9+
	ED1WjwPoUhIdoxq0JIMF4AaCVmN6BPcVXJ7Czc4bGsDXUgfarBQUwX/YBfRnTXukNSOX
	rzIid7B+ZW2yctLR+LJ8RoBqMx2QBBAhvcg3XIlvJQGvodtI6WLFOTBAfm9AfdZ2qDqJ
	gKdjPJn1+cAr0hyxxgwMkvA3kiyIsfNNPcS4HfnD02DIVIPegoktA6IuqK4AMGb+dC5A
	+83pbDS8wqfC57j8P+4aN+nzR26SD496EPj3eB8yHAX6irHNaoBR6/H31lbPbvlsvYGk
	rnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BqIJCauV0xIdBK5Pop6DQUCezDx4z5AsDi3uOKHMgoU=;
	b=TzAhThbfKqpi9IOiyYkFTdWnbhp5GNs1Pc8tCxCyJFKOa0jYDNvYt/muSsXByj7fIR
	mpkn01UCWQ1aEkwWzUQHdCSGG/0ScFLEypbd1j5ckLdmufjFeGXkzLNA0/9d9zhID+Ft
	isxokiW/gsS/U/lb6pv4ZdKSaMjztq8hoF6dbEagHfSl0YNxuYeK5180SPuMXigZVF1O
	WEQp/od1q2KAmDbXTRs+JIXgfES/0vNFAxN19rCKby7DYds+AmUFsw0xbJTU+9URCsdm
	Q2GI1DEPTNfd5SfbwMcuRE3D44ybV8hE2M00VB4AgVp4xwu/moSkd5E9z+z00xZlReLi
	8MfA==
X-Gm-Message-State: APjAAAV1YK++BnWPq0GtJl+QSnPOcDsWv0xLoRPVTHNxd1Pav3SnL2q4
	/Y2siia8PpZLpv5TYHvA9BNHnzhD
X-Google-Smtp-Source: APXvYqxcn7Y1qT5VEILtT9kH2DXHC0RGzH4SlPJcj+dgg1NZe7UOZWb7fQsYNv1qlg9O61/sFPzYDw==
X-Received: by 2002:aca:bb88:: with SMTP id
	l130mr17665408oif.124.1554788669030; 
	Mon, 08 Apr 2019 22:44:29 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	n16sm11787705oic.7.2019.04.08.22.44.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 22:44:28 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 00:44:12 -0500
Message-Id: <30b90189f08b7edd9f46e36da8116c6f278395eb.1554787765.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554787765.git.just.another.mariano@gmail.com>
References: <cover.1554787765.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v4 1/4] update-alternatives.bbclass: Add function to get metadata
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
X-List-Received-Date: Tue, 09 Apr 2019 05:44:28 -0000
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


