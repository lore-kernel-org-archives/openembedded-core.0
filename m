Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1268E713C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:13 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id k14so600525wgh.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ROZ5vVZ8TICciG2r/JlwbtxIGREivMH4FzB1J2qu8TA=;
	b=XGpvgsSnGEpaeeEpFx4S9RDKPvJyRBscFQ2TFtpo0wLgKcs8tNSsmxLcpfQ+uv84jx
	k7JcoG4RYOp1kP+8EW/LYCUu3zWVT1cWyGiRquho2zWhKW5xaRArpSZlzJMFLmC0/K5k
	omWAH6nNXYFMcRnB7DyIFaDQSZWrDNNrAbwpnfbWAn8aln01qp1O7m5gUavuyR8q/jUJ
	feQ/kzh/jQoQNVR6XEvHT5LMnShbjTfAQsHSieoW23j/3jYTkK50O+XK3C1wfhPyRTOc
	2fvGECYtIne8SdQ7g5OzxWa0t7UeLB0PT/3RryFV/VmACCgUV8TwxwYUu9G/IhsgCtuP
	H75g==
X-Gm-Message-State: ALoCoQm+e5BIpOVhVDpoXcAcNL1wJ4AoFgp0iO1XVE9+F3ZoSnx2v2gkGmhNYcRknkhILseT5bdx
X-Received: by 10.195.11.234 with SMTP id el10mr34619799wjd.95.1410177554326; 
	Mon, 08 Sep 2014 04:59:14 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:36 +0100
Message-Id: <9d9358a28e8327402ca31698c7afc3024f4e7ce9.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 18/27] os-release: Adding a new recipe for operating system identification
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:20 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

The /etc/os-release will have the operating system identification data.
Tested on target with systemd enabled. Here is the sample file looks
in the file:

ID=poky-ivi-systemd
NAME=Yocto GENIVI Baseline (Poky/meta-ivi)
VERSION=6.0+snapshot-20140721 (daisy)
VERSION_ID=6.0+snapshot-20140721
PRETTY_NAME=Yocto GENIVI Baseline (Poky/meta-ivi) 6.0+snapshot-20140721 (daisy)

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/os-release/os-release.bb |   36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/os-release/os-release.bb

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
new file mode 100644
index 0000000..33e9581
--- /dev/null
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -0,0 +1,36 @@
+inherit allarch
+
+SUMMARY = "Operating system identification"
+DESCRIPTION = "The /etc/os-release file contains operating system identification data."
+LICENSE = "MIT"
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+
+# Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
+#                     HOME_URL SUPPORT_URL BUG_REPORT_URL
+OS_RELEASE_FIELDS = "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME"
+
+ID = "${DISTRO}"
+NAME = "${DISTRO_NAME}"
+VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in d else ''}"
+VERSION_ID = "${DISTRO_VERSION}"
+PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
+BUILD_ID ?= "${DATETIME}"
+
+python do_compile () {
+    with open(d.expand('${B}/os-release'), 'w') as f:
+        for field in d.getVar('OS_RELEASE_FIELDS', True).split():
+            value = d.getVar(field, True)
+            if value:
+                f.write('{0}={1}\n'.format(field, value))
+}
+do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
+
+do_install () {
+    install -d ${D}${sysconfdir}
+    install -m 0644 os-release ${D}${sysconfdir}/
+}
-- 
1.7.10.4


