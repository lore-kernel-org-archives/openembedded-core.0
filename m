Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id CF32F61577
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 15:02:19 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hj3so3597717wib.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pf5TgyiE7g6c3BrRQQo03EeSKovZgKWaEtL3EIYCQ08=;
	b=RqTfGkTE2v9PHABlco3rGv8gUFfp7EIc36MmeeA/Z2puuCpjHEhkew7a2SboDae16e
	z2+zC1f5UK+OixuwPxAzO7QFpWZlZXzyQ4Fi+TNKJNuCPKllVwkzAYMFhkWZV/S0soNU
	rbekQRC9c/UrP+Vye1zGM2J3wgEefTCY0oD7bl7KlHcli4G6AouMSXBbq57mSyfI0TBs
	8ZTIXX29JsQcNXg0NdZbFfsHn21w43NuU5AXOe/5DGBw8flCLPjYXPJdWRjfgzpnseQz
	Do9zIgfbpkjoRdf0YnFBp4a0SS+2HYhTlYJijtqvPaiV2VhVxVWHVUXk+yUofOI9V7nm
	rA8g==
X-Gm-Message-State: ALoCoQkGHB6Ok6sMSfnyVKv/wnjuFkFcpXyd0dccbrKoJR7S9pFdjC+OfhZxqAM3CRg1Z6dzQi6B
X-Received: by 10.180.231.6 with SMTP id tc6mr13894621wic.59.1379343740275;
	Mon, 16 Sep 2013 08:02:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	mz14sm24198374wic.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 08:02:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 16:02:08 +0100
Message-Id: <1379343731-7492-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/4] mesa-gl: add GL-only Mesa recipe
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
X-List-Received-Date: Mon, 16 Sep 2013 15:02:20 -0000

Some machines have hardware-specific GL drivers that do EGL and GLES (many ARM
boards).  Others have their own EGL/GLES drivers and provide a Mesa DRI driver
(EMGD).  Previously adding Mesa, for software GL/GLX rendering in the first case
and hardware GLX in the second, involved bbappends and changing Mesa to be
machine-specific.

By adding a just-GL Mesa the machine definition can combine it with the hardware
drivers cleanly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/security_flags.inc   |    1 +
 meta/conf/distro/include/seperatebuilddir.inc |    1 +
 meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb   |    9 +++++++++
 3 files changed, 11 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 2858e46..e313be6 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -28,6 +28,7 @@ SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libpcre = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-mesa = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-opensp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-ppp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 5bd0ab4..21d828f 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -442,6 +442,7 @@ B_pn-menu-cache = "${SEPB}"
 B_pn-mesa-demos = "${SEPB}"
 # src/mapi/mapi/stub.c:51:39: error: 'MAPI_TABLE_NUM_DYNAMIC' undeclared here (not in a function)
 B_pn-mesa = "${SEPB}"
+B_pn-mesa-gl = "${SEPB}"
 B_pn-minicom = "${SEPB}"
 # Not automake, no external tree support
 #B_pn-mkelfimage = "${SEPB}"
diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
new file mode 100644
index 0000000..0938a40
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
@@ -0,0 +1,9 @@
+require mesa_${PV}.bb
+
+SUMMARY += " (OpenGL only, no EGL/GLES)"
+
+FILESPATH = "${FILE_DIRNAME}/mesa-${PV}:${FILE_DIRNAME}/mesa"
+
+PACKAGECONFIG ??= "dri ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
1.7.10.4


