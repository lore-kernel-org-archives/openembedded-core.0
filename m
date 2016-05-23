Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 92B1465CBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:34:40 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 67so18638200wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=OZ8NJ635JMpeN47J7yWzIPy2WGs3m5h8eysuiW4MLz8=;
	b=TYewBA4WuaneGAZWMoTz5tyifAr2AATOPcTFUzbSmbtker2lc/B3q3WETdc59qazHg
	+h22GCNvru/ey0hQfWwQJB8R0xMbgZYS9PvecFCv4XUaJB4BHnx/J1+FPuQQBgQJw5uz
	BdVddn/5kjMFqNwnWBXwSl4SRS7+iSfvt9Rt1rh3/Cr4oHxlUTguePYy0ZJfny61Zqtf
	k9b56ZP8PkmEcK5wsqQuTykRmsvQo7+lIHG3hx9cLOZNynzfyJmKBu2pNbokZ5HomDqY
	z+LMFwk1MkIHIyfajHJ3T4tyoystXcwVLLtkkYiTU1D2nxO6DJQnD8P9fY+Ls239QNS4
	77Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OZ8NJ635JMpeN47J7yWzIPy2WGs3m5h8eysuiW4MLz8=;
	b=PkryqiGtF5UCwy4OGvg39LjdJRacjR1bbrdC5eBCGz+v664ry10nI569SgmijmzmQv
	9uAnvEOY9ezlgLZ1RcYC0EYM9FTd27c7WRQbhbFRS++MLD3DCgn5OfO4tKjOkwKQWtz9
	gY8/WiZqRQUD3EAAgQG41FFVspaK8TASCvhuWO+ARPq55m9hJTItJoaCF6ApgwtJUQg1
	lrjx1RL7mCODVJAIxASU/6ezLfqbLDvBUhrL3Vp3epM3z7Olp476/doCH+19oqrHUhyf
	+ktU9i1HbEHvFLA37XG5fxQ5Kvzz/DoTIXoKQFGnXw9CxQGDx3XZd3rnfbk0oWkkqotU
	jE8w==
X-Gm-Message-State: ALyK8tIMYqz1Wi2weBs2lmfSOhV6MxtT2Le7eIqTR0Ey2SD9QYoUmHx1qzY+SoF1dcXpbg==
X-Received: by 10.28.234.221 with SMTP id g90mr5115999wmi.30.1464035680634;
	Mon, 23 May 2016 13:34:40 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	r123sm15532548wmg.20.2016.05.23.13.34.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 May 2016 13:34:39 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 13:34:26 -0700
Message-Id: <c1371045c7b7740a468f44db12ff20a2c881902c.1463769811.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <0b22f46a6e565f757c0fc11aeab27e9f336c5b37.1463769811.git.chris_larson@mentor.com>
References: <0b22f46a6e565f757c0fc11aeab27e9f336c5b37.1463769811.git.chris_larson@mentor.com>
In-Reply-To: <cover.1463769811.git.chris_larson@mentor.com>
References: <cover.1463769811.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] image_types.bbclass: support template .wks.in files for wic
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
X-List-Received-Date: Mon, 23 May 2016 20:34:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

These files are treated as the contents of a bitbake variable, so usual
bitbake variable references are supported. I considered using another
templating mechanism, for example the one used by yocto-layer, but then we'd
end up largely mapping metadata variables to template fields anyway, which is
a pointless indirection. Let bitbake expand the variables directly instead.

This feature lets us, for example, reference ${APPEND} in --append, and avoid
hardcoding the serial console tty in the wks file, and let the user's changes
to APPEND affect wic the way they do the other image construction mechanisms.

The template is read in and set in a variable at parse time, so changes to the
variables referenced by the template will result in rebuilding the image.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image_types.bbclass | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index dc681ae..caf8757 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -206,6 +206,16 @@ IMAGE_CMD_wic () {
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 
+python process_wks_template () {
+    """Write out expanded template contents to WKS_FULL_PATH."""
+    template_body = d.getVar('_WKS_TEMPLATE', True)
+    if template_body:
+        wks_file = d.getVar('WKS_FULL_PATH', True)
+        with open(wks_file, 'w') as f:
+            f.write(template_body)
+}
+do_image_wic[prefuncs] += 'process_wks_template'
+
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
@@ -302,3 +312,28 @@ IMAGE_TYPES_MASKED ?= ""
 # The WICVARS variable is used to define list of bitbake variables used in wic code
 # variables from this list is written to <image>.env file
 WICVARS ?= "BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
+
+python () {
+    """Read in and set up wks file template for wic."""
+    if d.getVar('USING_WIC', True):
+        wks_file_u = d.getVar('WKS_FULL_PATH', False)
+        wks_file = d.expand(wks_file_u)
+        base, ext = os.path.splitext(wks_file)
+        if ext == '.in' and os.path.exists(wks_file):
+            wks_out_file = os.path.join(d.getVar('WORKDIR', True), os.path.basename(base))
+            d.setVar('WKS_FULL_PATH', wks_out_file)
+            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
+            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
+
+            try:
+                with open(wks_file, 'r') as f:
+                    body = f.read()
+            except (IOError, OSError) as exc:
+                pass
+            else:
+                # Previously, I used expandWithRefs to get the dependency list
+                # and add it to WICVARS, but there's no point re-parsing the
+                # file in process_wks_template as well, so just put it in
+                # a variable and let the metadata deal with the deps.
+                d.setVar('_WKS_TEMPLATE', body)
+}
-- 
2.8.0


