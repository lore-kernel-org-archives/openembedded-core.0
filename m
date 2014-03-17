Return-Path: <alexandru.damian@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id C51786F799
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 15:04:13 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hr14so2293952wib.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 08:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6uj9soTza/tQ1nj1VAeLGiU/KZWO+6+dL8zUFbUSQZQ=;
	b=RIDLtI95DxeB+2qQkLbMKpATj+RC+bH5rwX1Dq4hilZFNsVzuUrF7/tewucb29AeNh
	D4KDGTFSpFoqKEvlOE11xE92KuhBkL4EKtsEa5UdFFdMVn7sIYyUOi+QRRYVTJpHiKgg
	OG99W43uH19pnivvhf6KGivZKfUhZ/mYymVFjOuSF4LpL17H/c42NDEkuCXrAB/W4g62
	6i0M0eOcGYGEZyM+k9cAbrPXF8Hnnf6q56JFG2nog1ElSCQfLBr2LC0xnov2Wg7vfRwd
	ShLiwCpRSYK5ZWIYgw2mfWStOgAydo1NZyiOXnJauiyQtqT3OAAxn7uDJgWwk+Xkm0f3
	Sl9Q==
X-Gm-Message-State: ALoCoQlFdZMd0+AKz1loknCJdYgrq8TSiPxOusphzFvqAAnQV87D2+5jqKnuW3xMKaMBYzhic2R8
X-Received: by 10.194.202.230 with SMTP id kl6mr19361729wjc.9.1395068654239;
	Mon, 17 Mar 2014 08:04:14 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id
	ff9sm24985583wib.11.2014.03.17.08.04.12 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Mar 2014 08:04:13 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 81F56560863; Mon, 17 Mar 2014 15:04:11 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2014 15:04:08 +0000
Message-Id: <b01b97b0f8a67d3aeae9ed01e24c5e6bace8e43b.1395068545.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1395068545.git.alexandru.damian@intel.com>
References: <cover.1395068545.git.alexandru.damian@intel.com>
Subject: [PATCH 1/3] toaster.bbclass: read the data needed for license manifest path
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
X-List-Received-Date: Mon, 17 Mar 2014 15:04:14 -0000

From: Cristiana Voicu <cristiana.voicu@intel.com>

The license.manifest file is located in DEPLOY_DIR_IMAGE/licenses/
IMAGE_NAME dir. The data needed is collected after rootfs task.

[YOCTO #5649]
Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/classes/toaster.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index ddfceb5..563b1f7 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -296,6 +296,17 @@ python toaster_buildhistory_dump() {
 
 }
 
+# dump information related to license manifest path
+
+python toaster_licensemanifest_dump() {
+    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE', True);
+    image_name = d.getVar('IMAGE_NAME', True);
+
+    data = { 'deploy_dir_image' : deploy_dir_image, 'image_name' : image_name }
+
+    bb.event.fire(bb.event.MetadataEvent("LicenseManifestPath", data), d)
+}
+
 # set event handlers
 addhandler toaster_layerinfo_dumpdata
 toaster_layerinfo_dumpdata[eventmask] = "bb.event.TreeDataPreparationCompleted"
@@ -308,3 +319,4 @@ toaster_buildhistory_dump[eventmask] = "bb.event.BuildCompleted"
 do_package[postfuncs] += "toaster_package_dumpdata "
 
 do_rootfs[postfuncs] += "toaster_image_dumpdata "
+do_rootfs[postfuncs] += "toaster_licensemanifest_dump "
-- 
1.8.3.2


