Return-Path: <avery.brian@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 438B573167
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 00:54:08 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id ts6so9077387pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 17:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y7NkE+B02ZnMxmFEk6kmPWpWLccy2ZXzs6YFwzYVVA8=;
	b=HxJiEiVn1l1VBmj6ALEAIrhFgVRlR0nDalraKCaywBlKJF0torCAnk6e2zCxKebWNX
	uBowaSQkRmnWRhineRGzYr/D9a8eTxaNkNyFAJKcBCStbNPGijiD3Bhbvk8ZH83dPNqS
	R4W/aEOAA7ZfvaUGulQIponOpxMeh4riNuzr+hMyC3LIpZuOH3V50vE9D6568ove1sCi
	YhLr3A70SRvfNxMFK+hAESuK2nEppKd2mQF6Wxxpv1UkZeORDLPo2PodrSID6vpwG/sl
	eOtOT0w27DrMQ6hwGoSDex6GoBqjK6njFdCg9M3FrpAP75BDa8sFy0Fdx/WSOudXkvl+
	O66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y7NkE+B02ZnMxmFEk6kmPWpWLccy2ZXzs6YFwzYVVA8=;
	b=EjqCxs3LUHggI6TUGg1IZbALiB8FEpUfvvzXp5jGF89V3CLKhTkUsJFKirAsEsvN8P
	UZQQLP4m2YMbOMHbk8x4PjU6kpZgwZqdJj2WTV+2xtQHmmUnE3DqIOZVexsGatyHM9kk
	i1vdIZ/PpY3BATzonbxgLwtWvd540ocxy+RUqr4Llj7W6dGeTxtfkq3dDxjU4YMSdvyE
	UfPHAdjiYi/TwGpspUwLvGRETYNw13gi6OLcTBwgnsJVKndSzUnpJi++i26DnBtylixK
	HjSbV21VoIpK56tQQs87Fo3Lu1j+gopxqLvx4wbNAihBdwohySbqU/JS9bXbpCsZO6G0
	g3JA==
X-Gm-Message-State: ALyK8tIfVImKtXu3MWXicWoQInc2QNO6jGRx3EAKiJCXcX6+XOr9VA+5vjWS2V4h0f+hyQ==
X-Received: by 10.67.15.72 with SMTP id fm8mr14535710pad.50.1468025649201;
	Fri, 08 Jul 2016 17:54:09 -0700 (PDT)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id
	w194sm7264675pfd.58.2016.07.08.17.54.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jul 2016 17:54:08 -0700 (PDT)
From: brian avery <avery.brian@gmail.com>
X-Google-Original-From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2016 17:54:07 -0700
Message-Id: <76596eff591a9c1dcbadf71eeab724aabe316983.1468023361.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1468023361.git.brian.avery@intel.com>
References: <cover.1468023361.git.brian.avery@intel.com>
Subject: [PATCH 1/1] toaster.bbclass: remove directory scan logic for detecting artifacts
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
X-List-Received-Date: Sat, 09 Jul 2016 00:54:08 -0000

From: Elliot Smith <elliot.smith@intel.com>

toaster.bbclass does a scan of the image deploy and SDK directories
when a build finishes. However, this brings no benefit and could be
better managed and made easier to modify if moved to toasterui and
carried out when the BuildCompleted event occurs.

Remove the image scan code from toaster.bbclass, prior to moving it
to toasterui and buildinfohelper.

Also remove the license manifest update code, as this can also be
done from toasterui.

The postfuncs for do_populate_sdk are retained, but no longer
do the directory scan for SDK artifacts. Instead, they fire
an event with the value of the TOOLCHAIN_OUTPUTNAME variable,
as this is only accessible at the point when the do_populate_sdk
and do_populate_sdk_ext tasks are run. The value of this can then
be used by buildinfohelper to find the SDK artifacts produced by a
target.

[YOCTO #9002]

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
Signed-off-by: brian avery <brian.avery@intel.com>
---
 classes/toaster.bbclass | 74 ++++++-------------------------------------------
 1 file changed, 8 insertions(+), 66 deletions(-)

diff --git a/classes/toaster.bbclass b/classes/toaster.bbclass
index 1878fe0..90ea563 100644
--- a/classes/toaster.bbclass
+++ b/classes/toaster.bbclass
@@ -136,60 +136,16 @@ python toaster_package_dumpdata() {

 # 2. Dump output image files information

-python toaster_image_dumpdata() {
-    """
-    Image filename for output images is not standardized.
-    image_types.bbclass will spell out IMAGE_CMD_xxx variables that actually
-    have hardcoded ways to create image file names in them.
-    So we look for files starting with the set name.
-
-    We also look for other files in the images/ directory which don't
-    match IMAGE_NAME, such as the kernel bzImage, modules tarball etc.
-    """
-
-    dir_to_walk = d.getVar('DEPLOY_DIR_IMAGE', True);
-    image_name = d.getVar('IMAGE_NAME', True);
-    image_info_data = {}
-    artifact_info_data = {}
-
-    # collect all images and artifacts in the images directory
-    for dirpath, dirnames, filenames in os.walk(dir_to_walk):
-        for filename in filenames:
-            full_path = os.path.join(dirpath, filename)
-            try:
-                if filename.startswith(image_name):
-                    # image
-                    image_info_data[full_path] = os.stat(full_path).st_size
-                else:
-                    # other non-image artifact
-                    if not os.path.islink(full_path):
-                        artifact_info_data[full_path] = os.stat(full_path).st_size
-            except OSError as e:
-                bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
-
-    bb.event.fire(bb.event.MetadataEvent("ImageFileSize", image_info_data), d)
-    bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize", artifact_info_data), d)
-}
-
 python toaster_artifact_dumpdata() {
     """
-    Dump data about artifacts in the SDK_DEPLOY directory
+    Dump data about SDK variables
     """

-    dir_to_walk = d.getVar("SDK_DEPLOY", True)
-    artifact_info_data = {}
-
-    # collect all artifacts in the sdk directory
-    for dirpath, dirnames, filenames in os.walk(dir_to_walk):
-        for filename in filenames:
-            full_path = os.path.join(dirpath, filename)
-            try:
-                if not os.path.islink(full_path):
-                    artifact_info_data[full_path] = os.stat(full_path).st_size
-            except OSError as e:
-                bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
+    event_data = {
+      "TOOLCHAIN_OUTPUTNAME": d.getVar("TOOLCHAIN_OUTPUTNAME", True)
+    }

-    bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize", artifact_info_data), d)
+    bb.event.fire(bb.event.MetadataEvent("SDKArtifactInfo", event_data), d)
 }

 # collect list of buildstats files based on fired events; when the build completes, collect all stats and fire an event with collected data
@@ -361,17 +317,6 @@ python toaster_buildhistory_dump() {

 }

-# dump information related to license manifest path
-
-python toaster_licensemanifest_dump() {
-    deploy_dir = d.getVar('DEPLOY_DIR', True);
-    image_name = d.getVar('IMAGE_NAME', True);
-
-    data = { 'deploy_dir' : deploy_dir, 'image_name' : image_name }
-
-    bb.event.fire(bb.event.MetadataEvent("LicenseManifestPath", data), d)
-}
-
 # set event handlers
 addhandler toaster_layerinfo_dumpdata
 toaster_layerinfo_dumpdata[eventmask] = "bb.event.TreeDataPreparationCompleted"
@@ -388,11 +333,8 @@ do_packagedata_setscene[vardepsexclude] += "toaster_package_dumpdata "
 do_package[postfuncs] += "toaster_package_dumpdata "
 do_package[vardepsexclude] += "toaster_package_dumpdata "

-do_image_complete[postfuncs] += "toaster_image_dumpdata "
-do_image_complete[vardepsexclude] += "toaster_image_dumpdata "
-
-do_rootfs[postfuncs] += "toaster_licensemanifest_dump "
-do_rootfs[vardepsexclude] += "toaster_licensemanifest_dump "
-
 do_populate_sdk[postfuncs] += "toaster_artifact_dumpdata "
 do_populate_sdk[vardepsexclude] += "toaster_artifact_dumpdata "
+
+do_populate_sdk_ext[postfuncs] += "toaster_artifact_dumpdata "
+do_populate_sdk_ext[vardepsexclude] += "toaster_artifact_dumpdata "
\ No newline at end of file
--
1.9.1

