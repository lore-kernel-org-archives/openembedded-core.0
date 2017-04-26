Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9A31D77C87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 15:04:23 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id t144so1913519lff.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qf1uxV35cx9tl5fN0hFGEAlqAAJ+MecojB+RmnvP/0M=;
	b=G5mRajBVzONckAIVRX8hyi27R2FAfOrx6T+7Rho8Pb2cxbrpOixVubEcp4OGl6k7pb
	McNk0zc59NXroDUlEItf0owDZVY0dzuh0OaoyjWeeiv2EQPBISdO+TP0scsFXmFBWzlw
	cif5CV7RoXsO5k4/QC/UNT3C3aXt/FGR1jR4ua2Qm0aaor6sQoFmRN7C+5tNRPlDKmMx
	Dg/aOw85lUUFsfcHUDsp9e6BRqczXsjMovkT+NJaSOTQdpzf8F04/wfIYwo5eau7uLT1
	YxJY8pU5+1mWju6xOaL78qiIr2pHTINg4xMUAgtQjhQa7kA6uEG6Y4Lf5rOCxeqnNg8R
	Zbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qf1uxV35cx9tl5fN0hFGEAlqAAJ+MecojB+RmnvP/0M=;
	b=dhTWVqcINXBggo3uD1CLqWlUG/MRqRF7aKYBFcnY5lNz8wf3z7l7W9JMq80ExoBt19
	xDZhowcdSEujlHJF7pWATmSf/tnfU2zFIm6ifyfPwHVH39uzryoLoBdp463xKVYdvdd0
	LlAW+PV1sKYQ8GRXCeHza7pKEzmGbSuRJUtiowCUaPrTn12fDnbP4o0klFNYvqapeqTh
	giv+KCRxJWwGvOnBTvt7Hsbr0KvPygAohU26vPVC/vttjeiyAjeneqdA9y/PNc1bS2Us
	BW+su/hSPRrFh9lDWfOmCN6mrm+m1t5uoT5Dcek3wl3K1r5eWAw68IUH5wofixST+1za
	7RdQ==
X-Gm-Message-State: AN3rC/47VhQ0qlaE1kf5OyzdNCyS1h6wQIazKv8gnA19kT6H6nWpsY+m
	CXSN1TwZAZoqrQ==
X-Received: by 10.46.8.2 with SMTP id 2mr84112lji.121.1493219064028;
	Wed, 26 Apr 2017 08:04:24 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	27sm583571ljb.69.2017.04.26.08.04.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Apr 2017 08:04:23 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Apr 2017 17:03:51 +0200
Message-Id: <1493219031-12843-2-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493219031-12843-1-git-send-email-kristian.amlie@mender.io>
References: <1493219031-12843-1-git-send-email-kristian.amlie@mender.io>
Subject: [PATCH] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 26 Apr 2017 15:04:23 -0000

This is a direct followup from the earlier f6a064d969f414 commit in
wic. It works more or less the same way: The variable specifies a list
of directories relative to the root of the rootfs, and these
directories will be excluded from the resulting rootfs image. If an
entry ends with a slash, only the contents are omitted, not the
directory itself.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 meta/classes/image.bbclass | 73 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 405fd73..a309435 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -496,8 +496,8 @@ python () {
         d.setVar('do_image_%s' % t, '\n'.join(cmds))
         d.setVarFlag('do_image_%s' % t, 'func', '1')
         d.setVarFlag('do_image_%s' % t, 'fakeroot', '1')
-        d.setVarFlag('do_image_%s' % t, 'prefuncs', debug + 'set_image_size')
-        d.setVarFlag('do_image_%s' % t, 'postfuncs', 'create_symlinks')
+        d.setVarFlag('do_image_%s' % t, 'prefuncs', debug + 'set_image_size prepare_excluded_directories')
+        d.setVarFlag('do_image_%s' % t, 'postfuncs', 'create_symlinks cleanup_excluded_directories')
         d.setVarFlag('do_image_%s' % t, 'subimages', ' '.join(subimages))
         d.appendVarFlag('do_image_%s' % t, 'vardeps', ' '.join(vardeps))
         d.appendVarFlag('do_image_%s' % t, 'vardepsexclude', 'DATETIME')
@@ -506,6 +506,75 @@ python () {
         bb.build.addtask('do_image_%s' % t, 'do_image_complete', after, d)
 }
 
+python prepare_excluded_directories() {
+    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
+    if not exclude_var:
+        return
+
+    import shutil
+    from oe.path import copyhardlinktree
+
+    exclude_list = exclude_var.split()
+
+    taskname = d.getVar("BB_CURRENTTASK")
+
+    rootfs_orig = d.getVar('IMAGE_ROOTFS')
+    # We need a new rootfs directory we can delete files from. Copy to
+    # workdir.
+    new_rootfs = os.path.realpath(os.path.join(d.getVar("WORKDIR"), "rootfs.%s" % taskname))
+
+    if os.path.lexists(new_rootfs):
+        shutil.rmtree(os.path.join(new_rootfs))
+
+    copyhardlinktree(rootfs_orig, new_rootfs)
+
+    for orig_path in exclude_list:
+        path = orig_path
+        if os.path.isabs(path):
+            msger.error("IMAGE_ROOTFS_EXCLUDE_PATH: Must be relative: %s" % orig_path)
+
+        full_path = os.path.realpath(os.path.join(new_rootfs, path))
+
+        # Disallow climbing outside of parent directory using '..',
+        # because doing so could be quite disastrous (we will delete the
+        # directory).
+        if not full_path.startswith(new_rootfs):
+            msger.error("'%s' points to a path outside the rootfs" % orig_path)
+
+        if path.endswith(os.sep):
+            # Delete content only.
+            for entry in os.listdir(full_path):
+                full_entry = os.path.join(full_path, entry)
+                if os.path.isdir(full_entry) and not os.path.islink(full_entry):
+                    shutil.rmtree(full_entry)
+                else:
+                    os.remove(full_entry)
+        else:
+            # Delete whole directory.
+            shutil.rmtree(full_path)
+
+    # Save old value for cleanup later.
+    d.setVar('IMAGE_ROOTFS_ORIG', rootfs_orig)
+    d.setVar('IMAGE_ROOTFS', new_rootfs)
+}
+
+python cleanup_excluded_directories() {
+    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
+    if not exclude_var:
+        return
+
+    import shutil
+
+    rootfs_dirs_excluded = d.getVar('IMAGE_ROOTFS')
+    rootfs_orig = d.getVar('IMAGE_ROOTFS_ORIG')
+    # This should never happen, since we should have set it to a different
+    # directory in the prepare function.
+    assert rootfs_dirs_excluded != rootfs_orig
+
+    shutil.rmtree(rootfs_dirs_excluded)
+    d.setVar('IMAGE_ROOTFS', rootfs_orig)
+}
+
 #
 # Compute the rootfs size
 #
-- 
2.7.4


