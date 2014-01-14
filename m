Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3A6896E45E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:19:48 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id w62so530447wes.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 07:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=EuwhoBQ3deLiKYiNncYwrd1WlenD4C0RVdU2awSc0+E=;
	b=F/FfU4I/IRhQdRuIk/ZpsBS+hTe35wHXS9zyvDbdfwyhTIKeLkJ0wMt+WIc0eJlFKE
	LJzeyynaqWBFqbtRJOwb/DvP9OVF6oaShC535UG/TBCrxHbVJPmtN09dm9s04ma26uhW
	Sr+iyPJKLGz51gKM9ts4bXLwz+9gAufusCt7UQgpXSCczGya0GIwTbGLiggO64AbfdOo
	TR5gC26VB5Z+Sw2N8p9UduwuAb8UK2nrsDsAczSsJzMyNmaCr9El2+5TpwgwabMAuHGV
	IuLBu648uc6ZyvmVmliSvfSHBhwTrQ5ZZnp8LB/rM9jJFD4sNXt3XAEEvalYE4gMn7YR
	7dWw==
X-Gm-Message-State: ALoCoQnMIKfYpIOyRG9ejVu+x8AmOK1opLPhFQ+q3UxPizqfw4M0X6/otfVl/i+R09TZhwS7tOGc
X-Received: by 10.180.99.39 with SMTP id en7mr16137981wib.10.1389712787818;
	Tue, 14 Jan 2014 07:19:47 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm1923314wij.7.2014.01.14.07.19.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 07:19:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 15:19:30 +0000
Message-Id: <498213eb8bc295b16fe79b11c9962df409f99b5d.1389712683.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
Subject: [PATCH][V3 5/7] waffle: add (from meta-oe)
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
X-List-Received-Date: Tue, 14 Jan 2014 15:19:48 -0000

Waffle is needed for Piglit.  This recipe is based on the recipe in meta-oe,
upgraded to the latest upstream 1.3.0.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/waffle/waffle_1.3.0.bb |   32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/waffle/waffle_1.3.0.bb

diff --git a/meta/recipes-graphics/waffle/waffle_1.3.0.bb b/meta/recipes-graphics/waffle/waffle_1.3.0.bb
new file mode 100644
index 0000000..a6d1acd
--- /dev/null
+++ b/meta/recipes-graphics/waffle/waffle_1.3.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "cross-platform C library to defer selection of GL API and of window system"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
+                    file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
+
+SRC_URI = "http://people.freedesktop.org/~chadversary/waffle/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "5020ecc249096c881e1f59ee961f3d41"
+SRC_URI[sha256sum] = "340ee04172dba878249469018cd7ec9d1ecd41af26b612c741b8b52e713bca8e"
+
+inherit cmake
+
+# This should be overridden per-machine to reflect the capabilities of the GL
+# stack.
+PACKAGECONFIG ??= "glx"
+
+# I say virtual/libgl, actually wants gl.pc
+PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,,virtual/libgl libx11"
+
+# I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
+# DISTRO_FEATURE.
+PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,,virtual/libgl wayland"
+
+# I say virtual/libgl, actually wants gbm.pc egl.pc
+PACKAGECONFIG[gbm] = "-Dwaffle_has_wayland=1,,virtual/libgl udev"
+
+# I say virtual/libgl, actually wants egl.pc
+PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,,virtual/libgl libxcb"
+
+# Take the flags added by PACKAGECONFIG and pass them to cmake.
+EXTRA_OECMAKE = "${EXTRA_OECONF}"
+
+FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake"
-- 
1.7.10.4


