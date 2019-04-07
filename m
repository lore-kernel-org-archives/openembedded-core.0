Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4F27D565
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2019 17:16:16 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id n187so8660200oih.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Mi4YaD+ArotAJlNeh/xOGMsKSsc83Ad0CwZUPkNudlU=;
	b=LdsulA6QLbv+i6hDFmYAFXPc3PhGrpL6v/h30yjTdVklLD+HNm3t35PstqG66DPsVY
	V0EJwQekTItpwcXR/r0slKDeP86Fg0uAB7Prwd852Mvv9ltSd9fSlVk56SZTwzwm7an9
	vtOExb+q6Qdl2Tcpl5LZDhpCpomco55rBoYI2FnpttrYWw/AyChlohiAofVH2dqxstYb
	8FAptk5pEhFMKw5KUkDfWHsv7FtzCyMqs+ec4ZdBYFKjRA+FGyF7dyS3R242MLJaGd5r
	r3ZuwBtjGwgF4j6UKcGthfCgKDFMx8fIZUd7D81EcuUjQfDbQ0jSpHW2xUl23RpUIZUm
	NG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Mi4YaD+ArotAJlNeh/xOGMsKSsc83Ad0CwZUPkNudlU=;
	b=IDOV+znAJvj+Oa1BJIKU5e9nl1OKGO99IQPixd+8xf83Hn4OSdU0KQwbN/pGLh8C64
	8LTuk2SP9fusNeh+IDUginLImTkQ5d+TvqeYrh2mlnzv1jAl/Ys4M0b3KLBt8SJBhjdf
	4GhLnkLRxxDC8D57qThc6nzMj1to6KhzvA8jnftucY0jCXvNO56cZzDsH8QAiQZDv2Mq
	zz+J81ctOCKQzFk6VOB5SpUCEl49GbavQAcrniUBEkU4UZMWEPhn5Gg4Rul+oEENcUUq
	g6DT4zEHziPGsOkXb3Xxoir81VZd/pdhCPQKsnXG5SChJ/Lpx938CKkatWn7/0qujP+t
	RygQ==
X-Gm-Message-State: APjAAAUBN6n/dw+3Uk07QwW7995fEWlg/Hzbg8tLAKGa+fkDShn3KouI
	gRzhC42MbHgfPSPXCfdB+58ZUwSG
X-Google-Smtp-Source: APXvYqzrnV7pKU1FjWlVwjyyXugJy26eEU88ATMbDkKUicj2qoYs88VNByXEGFybPGPhu+6PkbzgiA==
X-Received: by 2002:aca:df55:: with SMTP id w82mr14048444oig.113.1554657376990;
	Sun, 07 Apr 2019 10:16:16 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	d70sm14952535oih.18.2019.04.07.10.16.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 10:16:16 -0700 (PDT)
From: Mariano Lopez <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Apr 2019 12:15:57 -0500
Message-Id: <694f59ce48ac5931431cd76f12d7bbe23d279fbd.1554656203.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <cover.1554656203.git.just.another.mariano@gmail.com>
References: <cover.1554656203.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/4] update-alternatives.bbclass: Add function to get metadata
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
X-List-Received-Date: Sun, 07 Apr 2019 17:16:16 -0000
Content-Transfer-Encoding: 8bit

This adds update_alternatives_alt_targets function to get the metadata
for a package. This is for code reuse because the metadata would help
other classes that needs to be aware of how update-alternatives modify
the final package.

[YOCTO #12597]
[YOCTO #13238]

Signed-off-by: Mariano Lopez <just.another.mariano@gmail.com>
---
 meta/classes/update-alternatives.bbclass | 74 +++++++++++++++---------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 537e85d9a3..bc19373348 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -216,44 +216,64 @@ python apply_update_alternative_renames () {
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
-            alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
-            alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
+        updates = update_alternatives_alt_targets(d, pkg)
+        for alt_name, alt_link, alt_target, alt_priority in updates:
+           alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
+           alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
 
         if alt_setup_links:
             # RDEPENDS setup
-- 
2.19.2


