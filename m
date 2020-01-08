Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8C41A7CBDD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 11:25:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so2946738wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 03:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pxvhs4IrSHGvl4q6Y3AAPtUOqtyjDAiph3Ve0FPb8pc=;
	b=KrYqxSNX7UuW1j87uosuSGdyoMAV6dwqeFDi9whutR8PmwzX1ALJYZxnVZexoL3pRl
	pgi0HXZgH7Se9s8fViDx+3W3eD7khgzTF5dzE+eJwX8jx90ocu6myum/M7gECaulUW1o
	5u9CmA+Cm+MMmDJ2vvmSRfNceVcT2m9ZcBk9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pxvhs4IrSHGvl4q6Y3AAPtUOqtyjDAiph3Ve0FPb8pc=;
	b=E1WZ70MkXpklIdQrrqr/JOZxRE/YXKJTrpiB+IvIoqIWHnLFHzotQGSHWXo24V7wp5
	BirvxC8xH8V6TCuCq6ixSfBUSc93tTL0IIInB/lNW0P5+L9tAwp7sPDo2B7KecoANma/
	+YcYDj/7OE5CQOPLKGUVVIyqoLus6iawMstmOiNQaKwh8RcelNRKou4RvRE9kUL3k1wP
	HHM7Zqo4q56YncaQBgXIyPXrZqZ940qexjDWhVhb9WnR398MFE/bjtTKPBh7LfswApSq
	qGez7bwpVpuojsz5Aevtn2hOG6RZZGBQ9taCGAos5nOXmO0J7E4Wv2B7Q7xYqVFOahV7
	bgdQ==
X-Gm-Message-State: APjAAAXMTUPu7bowpZuA6RpSdO9Pr33c7SWNZURvUzKneLhW32rEhjMb
	DCWvwV98/C6935NB3jcU4uiTxBTHYk6WblFE
X-Google-Smtp-Source: APXvYqxn094SGz/+ziC/T6CNlijuY3NyWIVaKFM5cVK/WxFLmj8LB+hm2u42iU69H9Ko97Fy+3xFtQ==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr3903642wrs.303.1578482750956; 
	Wed, 08 Jan 2020 03:25:50 -0800 (PST)
Received: from arch0.home.b5net.uk ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	g21sm3978213wrb.48.2020.01.08.03.25.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 03:25:50 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 11:25:45 +0000
Message-Id: <20200108112546.8571-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/2] wic: Preserve intermediate files
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
X-List-Received-Date: Wed, 08 Jan 2020 11:25:50 -0000
Content-Transfer-Encoding: 8bit

When debugging issues or trying to add new features in wic it's useful
to examine the intermediate files created by the tool such as images of
the individual partitions. Previously these files were created in a
subdirectory of IMGDEPLOYDIR and, deleted by wic itself and then the
working subdirectory completely removed at the end of IMAGE_CMD_wic.
Instead we should work in a staging directory named build-wic and leave
behind intermediate files for analysis if necessary.

This has the added benefit of allowing individual partition images to
be preserved by adding commands to IMAGE_CMD_wic_append() in an image
recipe if needed. This is useful where an update system requires exact
sized and pre-formatted partition images for deployment.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/image_types_wic.bbclass     | 7 ++++---
 scripts/lib/wic/plugins/imager/direct.py | 4 +---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 7d5ebe1cb0..fc9b106a9a 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -27,16 +27,17 @@ WIC_CREATE_EXTRA_ARGS ?= ""
 
 IMAGE_CMD_wic () {
 	out="${IMGDEPLOYDIR}/${IMAGE_NAME}"
+	build_wic="${WORKDIR}/build-wic"
 	wks="${WKS_FULL_PATH}"
 	if [ -z "$wks" ]; then
 		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 	fi
 
-	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/" ${WIC_CREATE_EXTRA_ARGS}
-	mv "$out/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
-	rm -rf "$out/"
+	BUILDDIR="${TOPDIR}" wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" ${WIC_CREATE_EXTRA_ARGS}
+	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
+do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
 
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 2441cc33ad..c50645ff76 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -580,9 +580,7 @@ class PartitionedImage():
                                 self.native_sysroot)
 
     def cleanup(self):
-        # remove partition images
-        for image in set(self.partimages):
-            os.remove(image)
+        pass
 
     def assemble(self):
         logger.debug("Installing partitions")
-- 
2.24.1


