Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5B096731DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:41 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id x140so1562440oif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7rHmvDrRvf0GNNh6ktxJN756qbV5D6kjDQZ3MwoQY/Q=;
	b=F8XNRTHj6GxP3M3EZYj2AhPOKo9AakGmEawAxVdInzAa1Ujs3UtcuCpOP0PoTKNG2G
	FUatpIRdo11B2aZQj9sfYbrMm20GcHEOSUOfv9fRi4WGDC0re2JFUQo8RWJV3NYRIMQC
	0Y+Y3L9j5IBNQzt2P0Q8dtmJDxMAJ6r1neJFaKlv1lsdtP2HDM4+kJFPP9MHlv3Z7IK9
	5NkYBKz1QVdO6bVes7BfnM5g07Bln1d4V/biqKrRr7rb7H2Etv3HpVtJ2B9RcMC9r2ko
	Yln2CKENdFIf2ClWx0fNd18IPaUC8imx0TJj2fO8kSk7Hh9T0VnAum80xSyagEDBY/Tp
	Y0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7rHmvDrRvf0GNNh6ktxJN756qbV5D6kjDQZ3MwoQY/Q=;
	b=nDWRWbj3xz1Yykf1Gls5xhkV4siCqITiJkGXBWvnGL/fnRMLu/nblhuiClaJO3GUa2
	fIes7R38Ivvpnj1DjjNhhAg0TCxPW0tG9mVv/hwp9yFi2WNyffq7dW9Ye4OLosPpGKSM
	FYrHuATbhvm5h7jgwTQvxtXWpdFRE/co3Fr7FqsSpnS2H+8jNbGp8r7Te9/kU6X89VIG
	LwpxllKV9tT3n/Ixg0nRBYxMzRGRRyPEn9Dst0L3YByuO8d2cYR1/a54XbMOcaix4Uwv
	LBzpgrIjE012stRBaNbiJ0S77LOr73xVh7lYCJhRx5CfVWn4+ApDCN3tK6vGV2YXnFNS
	zygQ==
X-Gm-Message-State: ALoCoQlZxhyudRbFyHD9JnAJLv3OGPrpWzE3na4Dl0GqncLCUgQZvRtbRIzxXfSllTl4lbAowsWm/R83twCDHs/P6bnYejcEeA==
X-Received: by 10.202.88.65 with SMTP id m62mr30774989oib.36.1453354662216;
	Wed, 20 Jan 2016 21:37:42 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:41 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:37 -0800
Message-Id: <1453354610-19218-20-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 19/32] gstreamer1.0-plugins.inc: don't set base SRC_URI via python
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:41 -0000

Setting the SRC_URI via python for the four gstreamer1.0-plugins-XXX
packages adds complexity and breaks consistency with the other
plugins packages and with gstreamer itself (which all also fetch from
freedesktop.org URLs but set SRC_URI conventionally).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  3 ++-
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  2 ++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   | 10 ++++++----
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     |  2 ++
 .../gstreamer/gstreamer1.0-plugins-good_1.6.2.bb   |  5 ++++-
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  2 ++
 .../gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb   |  4 ++++
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     |  2 ++
 .../gstreamer/gstreamer1.0-plugins.inc             | 22 ----------------------
 9 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 004d053..571d15e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
 
-SRC_URI += " \
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
     file://configure-allow-to-disable-libssh2.patch \
     file://0001-glimagesink-Downrank-to-marginal.patch \
 "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 79c1777..654eab0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
 
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-bad"
+
 SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
index d5687a8..e4297cb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
@@ -4,10 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
-SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
-            file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
-            file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
-            file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
+    file://get-caps-from-src-pad-when-query-caps.patch \
+    file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
+    file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
+    file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
 "
 
 SRC_URI[md5sum] = "f530fbbe287edce79c55a37bd1a39fe2"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index f021f98..3d74e85 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-base"
+
 SRCREV = "8d4cb64a4b9d84b10076bf350f80a0d6ea68ec2d"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
index 022cfd2..aae8406 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
@@ -4,7 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch"
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
+    file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
+"
 
 SRC_URI[md5sum] = "ef4f5bc4f31f706832a234b0f603967b"
 SRC_URI[sha256sum] = "876e54dfce93274b98e024f353258d35fa4d49d1f9010069e676c530f6eb6a92"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index d60eaff..fe1a4eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-good"
+
 SRCREV = "fd0123800c8c1cf1468c0fa5d592ad0d0d8b4140"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb
index d935f6d..94241c0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.6.2.bb
@@ -3,6 +3,10 @@ include gstreamer1.0-plugins-ugly.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
+"
+
 SRC_URI[md5sum] = "0f0e30336e3155443cd5bfec5c215d56"
 SRC_URI[sha256sum] = "e7f1b6321c8667fabc0dedce3998a3c6e90ce9ce9dea7186d33dc4359f9e9845"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index e06b5ea..5d710f0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -5,6 +5,8 @@ include gstreamer1.0-plugins-ugly.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly"
+
 SRCREV = "06b8ac10cee85c5c304ca320997aa8f44295a66f"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index f179ce9..fd0d8bd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -32,25 +32,3 @@ oe_runconf_prepend() {
 		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
 	fi
 }
-
-SRC_URI = "${@get_gst_srcuri(d)}"
-
-GSTREAMER_1_0_GIT_BRANCH ?= "master"
-
-def get_gst_srcuri(d):
-    # check if expected prefix is present
-    prefix = "gstreamer1.0-"
-    bpn = d.getVar("BPN", True)
-    if not bpn.startswith(prefix):
-        bb.fatal('Invalid GStreamer 1.0 plugin package name "%s" : must start with "%s"' % (bpn, prefix))
-
-    # replaced prefix with "gst-", which is what is used for the tarball and repository filenames
-    gstpkg_basename = "gst-" + bpn[len(prefix):]
-    pv = d.getVar("PV", True)
-    branch = d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)
-
-    if pv == "git":
-        s = "git://anongit.freedesktop.org/gstreamer/%s;branch=%s" % (gstpkg_basename, branch)
-    else:
-        s = "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv)
-    return s
-- 
1.9.1


