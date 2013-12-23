Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A6E5C60D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 15:10:15 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bz8so6302319wib.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 07:10:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rPT3+XAldm70fKFU1JFdL/skGJqw7MbeTJrgkO6PmL4=;
	b=Uqir2vhaL+dfsgTNLZJJ3q+vsU4tIOX8JdXP0RDri7DLV1Z9ugRYqzu3UagnjUuorY
	34fOrJDY9HiHKopAMTq8gc0nxWHQ0X9LSluB1ONAhwof8UQPCP7EuQxdOz4omw3Eobcm
	YXOkIrMZhTRpa8jqV5D5d3Z78J18hH6lFW+ncfTKNfTvTIbtqTlTn8PbBDFA5CUDU4jF
	CpNwDkALuxuP0l3FuBXuycqf+Ov5zembywAlS2Rs7VQf3uN72pXJ9GNBpZkcp1X5UTn/
	7+iJH9Zs6mPpkLigQMqUWsXWEkXjANWgqQgbQ5yHGq823GGKnuGCWxa93Gx+mm8vi86j
	eklg==
X-Gm-Message-State: ALoCoQl3LTZEsDjRicDaQDCyL7jwLJ3qlmA00qFOcIUj8pGfHrjahNA4UswiOpDLop6Uxv9Ok9Z2
X-Received: by 10.194.174.36 with SMTP id bp4mr18934785wjc.7.1387811416354;
	Mon, 23 Dec 2013 07:10:16 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	cy10sm10159573wjb.6.2013.12.23.07.10.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Dec 2013 07:10:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 15:10:10 +0000
Message-Id: <1387811410-6832-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1387811410-6832-1-git-send-email-ross.burton@intel.com>
References: <1387811410-6832-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] libxcb: don't hard-code package splitting
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
X-List-Received-Date: Mon, 23 Dec 2013 15:10:16 -0000

Instead of having a log PACKAGES list and a correspondingly long FILES_ list,
just use do_split_packages.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxcb.inc |   35 +++++------------------------
 1 file changed, 5 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb.inc b/meta/recipes-graphics/xorg-lib/libxcb.inc
index d75b26b..75a43a5 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb.inc
+++ b/meta/recipes-graphics/xorg-lib/libxcb.inc
@@ -15,37 +15,12 @@ DEPENDS = "xcb-proto xproto libxau libxslt-native xcb-proto-native libpthread-st
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
            file://xcbincludedir.patch"
 
-PACKAGES =+ "libxcb-composite libxcb-damage libxcb-dpms libxcb-glx \
-             libxcb-randr libxcb-record libxcb-render libxcb-res \
-             libxcb-screensaver libxcb-shape libxcb-shm libxcb-sync \
-             libxcb-xevie libxcb-xf86dri libxcb-xfixes libxcb-xlib \
-             libxcb-xprint libxcb-xtest libxcb-xv libxcb-xvmc \
-             libxcb-dri2 libxcb-dri3 libxcb-present"
+PACKAGES_DYNAMIC = "^libxcb-.*"
 
 FILES_${PN} = "${libdir}/libxcb.so.*"
-FILES_libxcb-dri2 = "${libdir}/libxcb-dri2.so.*"
-FILES_libxcb-dri3 = "${libdir}/libxcb-dri3.so.*"
-FILES_libxcb-composite = "${libdir}/libxcb-composite.so.*"
-FILES_libxcb-damage = "${libdir}/libxcb-damage.so.*"
-FILES_libxcb-dpms = "${libdir}/libxcb-dpms.so.*"
-FILES_libxcb-glx = "${libdir}/libxcb-glx.so.*"
-FILES_libxcb-randr = "${libdir}/libxcb-randr.so.*"
-FILES_libxcb-record = "${libdir}/libxcb-record.so.*"
-FILES_libxcb-render = "${libdir}/libxcb-render.so.*"
-FILES_libxcb-res = "${libdir}/libxcb-res.so.*"
-FILES_libxcb-screensaver = "${libdir}/libxcb-screensaver.so.*"
-FILES_libxcb-shape = "${libdir}/libxcb-shape.so.*"
-FILES_libxcb-shm = "${libdir}/libxcb-shm.so.*"
-FILES_libxcb-sync = "${libdir}/libxcb-sync.so.*"
-FILES_libxcb-xevie = "${libdir}/libxcb-xevie.so.*"
-FILES_libxcb-xf86dri = "${libdir}/libxcb-xf86dri.so.*"
-FILES_libxcb-xfixes = "${libdir}/libxcb-xfixes.so.*"
-FILES_libxcb-xinerama = "${libdir}/libxcb-xinerama.so.*"
-FILES_libxcb-xlib = "${libdir}/libxcb-xlib.so.*"
-FILES_libxcb-xprint = "${libdir}/libxcb-xprint.so.*"
-FILES_libxcb-xtest = "${libdir}/libxcb-xtest.so.*"
-FILES_libxcb-xv = "${libdir}/libxcb-xv.so.*"
-FILES_libxcb-xvmc = "${libdir}/libxcb-xvmc.so.*"
-FILES_libxcb-present = "${libdir}/libxcb-present.so.*"
 
 inherit autotools pkgconfig pythonnative
+
+python populate_packages_prepend () {
+    do_split_packages(d, '${libdir}', '^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
+}
-- 
1.7.10.4


