Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D5BCA1016
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 17:12:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.627.1757092325308574706
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 10:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ClhK1sN3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: kamel.bouhara@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7FFE43A57;
	Fri,  5 Sep 2025 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1757092324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B0alte0ZPClTFsr9N1nYMwJXKEirhMlpI6LfvMOA7Cg=;
	b=ClhK1sN3qkqMibsc5YUeuhgZVKXfm7s/bfnJTeJsLJahW+tGnBRckw+ZqJPBFcM6dsuNPW
	+tR1CXlbDdcXYshH9WcqJxLnz7wT6vw4x47UewGET8SEEdCmDQ8jKCSwCz2duw9QQNfu3m
	2tFOFeJWnddaza5LOi1B2gCpTNi1j19PB6AfJlkZ/8oBN3Q50uy9ChzCSlLpqsYidT/pJs
	FDGE7k8vYjzeR7Es6pkBDf9x0CYxSzc3hK2BzUD2Skf7d19PgxJq4f5N8gwhPYdxsAJ48R
	d3Geth1lAlwRN0rp58j5bHbWSpIbrRqgiRE/osRoFwsCayGzjkId4gSmTcJShw==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [PATCH 6/6] classes-recipe/image: Add image file manifest
Date: Fri,  5 Sep 2025 19:11:54 +0200
Message-ID: <20250905171154.182825-7-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
References: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmrghmvghluceuohhuhhgrrhgruceokhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuddukeekfeetgfeltdfgieeugeeggeejieejheekueevhffgffegkefgffeukedvnecukfhppeekkedrudeitddrvddvvddrvddvleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeekkedrudeitddrvddvvddrvddvledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepkhgrmhgvlhdrsghouhhhrghrrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeflrffghghhrggtkhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhto
 hepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehprghstggrlhdrvggsvghrhhgrrhgusehsvgdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: kamel.bouhara@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 17:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223031

From: Joshua Watt <JPEWhacker@gmail.com>

Downstream tasks may want to know what image files were written by the
do_image family of tasks (e.g. SPDX) so have each task write out a
manifest file that describes the files it produced, then aggregate them
in do_image_complete

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5e55ed4c5b9d5af3c96b82805af34af1512fc3d1)
Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.com>
---
 meta/classes-recipe/image.bbclass | 58 +++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 1f0ee1861e..00f1d58f23 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -88,6 +88,11 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 
 IMGDEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"
 
+IMGMANIFESTDIR = "${WORKDIR}/image-task-manifest"
+
+IMAGE_OUTPUT_MANIFEST_DIR = "${WORKDIR}/deploy-image-output-manifest"
+IMAGE_OUTPUT_MANIFEST = "${IMAGE_OUTPUT_MANIFEST_DIR}/manifest.json"
+
 # Images are generally built explicitly, do not need to be part of world.
 EXCLUDE_FROM_WORLD = "1"
 
@@ -277,14 +282,28 @@ fakeroot python do_image () {
     execute_pre_post_process(d, pre_process_cmds)
 }
 do_image[dirs] = "${TOPDIR}"
+do_image[cleandirs] += "${IMGMANIFESTDIR}"
 addtask do_image after do_rootfs
 
 fakeroot python do_image_complete () {
     from oe.utils import execute_pre_post_process
+    from pathlib import Path
+    import json
 
     post_process_cmds = d.getVar("IMAGE_POSTPROCESS_COMMAND")
 
     execute_pre_post_process(d, post_process_cmds)
+
+    image_manifest_dir = Path(d.getVar('IMGMANIFESTDIR'))
+
+    data = []
+
+    for manifest_path in image_manifest_dir.glob("*.json"):
+        with manifest_path.open("r") as f:
+            data.extend(json.load(f))
+
+    with open(d.getVar("IMAGE_OUTPUT_MANIFEST"), "w") as f:
+        json.dump(data, f)
 }
 do_image_complete[dirs] = "${TOPDIR}"
 SSTATETASKS += "do_image_complete"
@@ -292,6 +311,8 @@ SSTATE_SKIP_CREATION:task-image-complete = '1'
 do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
 do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_image_complete[stamp-extra-info] = "${MACHINE_ARCH}"
+do_image_complete[sstate-plaindirs] += "${IMAGE_OUTPUT_MANIFEST_DIR}"
+do_image_complete[dirs] += "${IMAGE_OUTPUT_MANIFEST_DIR}"
 addtask do_image_complete after do_image before do_build
 python do_image_complete_setscene () {
     sstate_setscene(d)
@@ -501,12 +522,14 @@ python () {
         d.setVar(task, '\n'.join(cmds))
         d.setVarFlag(task, 'func', '1')
         d.setVarFlag(task, 'fakeroot', '1')
+        d.setVarFlag(task, 'imagetype', t)
 
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
         d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.join(vardepsexclude))
+        d.appendVarFlag(task, 'postfuncs', ' write_image_output_manifest')
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
@@ -604,6 +627,41 @@ python create_symlinks() {
             bb.note("Skipping symlink, source does not exist: %s -> %s" % (dst, src))
 }
 
+python write_image_output_manifest() {
+    import json
+    from pathlib import Path
+
+    taskname = d.getVar("BB_CURRENTTASK")
+    image_deploy_dir = Path(d.getVar('IMGDEPLOYDIR'))
+    image_manifest_dir = Path(d.getVar('IMGMANIFESTDIR'))
+    manifest_path = image_manifest_dir / ("do_" + d.getVar("BB_CURRENTTASK") + ".json")
+
+    image_name = d.getVar("IMAGE_NAME")
+    image_basename = d.getVar("IMAGE_BASENAME")
+    machine = d.getVar("MACHINE")
+
+    subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
+    imagetype = d.getVarFlag("do_" + taskname, 'imagetype', False)
+
+    data = {
+        "taskname": taskname,
+        "imagetype": imagetype,
+        "images": []
+    }
+
+    for type in subimages:
+        image_filename = image_name + "." + type
+        image_path = image_deploy_dir / image_filename
+        if not image_path.exists():
+            continue
+        data["images"].append({
+            "filename": image_filename,
+        })
+
+    with manifest_path.open("w") as f:
+        json.dump([data], f)
+}
+
 MULTILIBRE_ALLOW_REP += "${base_bindir} ${base_sbindir} ${bindir} ${sbindir} ${libexecdir} ${sysconfdir} ${nonarch_base_libdir}/udev /lib/modules/[^/]*/modules.*"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
-- 
2.43.0


