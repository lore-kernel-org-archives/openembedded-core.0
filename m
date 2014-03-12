Return-Path: <alexandru.damian@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id F34CE6D759
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 18:30:46 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so64425wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 11:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6uj9soTza/tQ1nj1VAeLGiU/KZWO+6+dL8zUFbUSQZQ=;
	b=FYYmDIfo+vvPr3qeCLFx9C1cQ9LQbN3Eu7aQbueTYAV0PT9oKTBdVWZVzTtRv2TDXR
	iI4F9nFvt63kSwdit+zMlZszpzhwrVzmnwYQWGI4fac4ydlmF8/AJ5bMgtfY+Yfumy/b
	MCF19quGUim6qh1O7rfgO3NRiAyiivRt3B38IWStroRRUF0dSVhZZ45e92dbBse3NA9C
	1k7EC9ooio6VENV2wnXQggRDRS3+7UtUuJP7O/8WcgYyjDclM1gUl7rrDQIg2YKfcIpt
	QSDzD1GR8p7NKz4Zcu5/JOt4M/8PkaUVMCfRu7jepCabaTTlmYE9rof83oopBioFhDek
	znag==
X-Gm-Message-State: ALoCoQmOw2tQJzloGO0ue2FzLVGV9vrmNtAgEZN2v/ENu6YgKusgN0qTSJ90Y9I/+TSDxhZ8VKt+
X-Received: by 10.180.101.166 with SMTP id fh6mr8540984wib.2.1394649046473;
	Wed, 12 Mar 2014 11:30:46 -0700 (PDT)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id jd2sm178624wic.9.2014.03.12.11.30.44
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Mar 2014 11:30:45 -0700 (PDT)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 40F885605BD; Wed, 12 Mar 2014 18:30:46 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Mar 2014 18:30:45 +0000
Message-Id: <1394649045-11815-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 2/6] toaster.bbclass: read the data needed for license manifest path
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
X-List-Received-Date: Wed, 12 Mar 2014 18:30:50 -0000

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


