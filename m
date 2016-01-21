Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 64815731AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:09 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id j3so1414203oig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7rHmvDrRvf0GNNh6ktxJN756qbV5D6kjDQZ3MwoQY/Q=;
	b=XBAoAPx60aX3Ub2p29WZOw6KeZtz8RKmE8pmvdWy35fQ98oY/Zp6DqhWC1QtgXjsSc
	e98LZYsCwLUrIihxqKWIoBq6QMqcX7/gtplRtFTZsy4MMYwEnVZx50tGFjvff5ZzEodX
	8SZsCUsAL+QL4xA79tBfNz2gXflgvB02a7OVrhVto4l8aOBUwZ0K7LwF/eUxo3jxQocI
	2UkTgr/p5Dx4h8dbAF1b3DwIoqmgTCvOhE7lJhSEf8aTe6FPtq1nM0lDJQ6h2zJJ2vBP
	dVF7OPKx+QXxExPnWl9ltemTe9MBRrFEwUn2YaUYEy7f/ROc7ulzgDIjn6AAJcUmpLj3
	UOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7rHmvDrRvf0GNNh6ktxJN756qbV5D6kjDQZ3MwoQY/Q=;
	b=ZmSoYhuRQ/LRC7Bd0IH+9e7/h43gIb3oSKvGlVxHzdwUIK52u/rROgrQ3fZpVUX+6m
	88mEDjTzfgien/RuEMpFlwcy/7DDqgReaLhiXhhkJVYIMC1LZDI4/vzUr6IuYdfqv9RL
	OhHABYUwwsDnJYF5nNLZ8C7UWaIefDeEutsEHXUZKCKjM6LNIGHxafGeqot/GdZrQc9H
	ilhkH0n/cEavL9wNhP5dQ4Ye+aowCPQqDvVo5NgzyiAm5lLmrNUb5i6oTMoueji9iLB8
	eAEUOvcOPdWwll9Vr4cj0w0UfD8YoPfLOz/PUZBP8JVHKcxlFEf2S1Ol6EA0WzMhYPgp
	Urag==
X-Gm-Message-State: ALoCoQk5RH7nRQYvbQ1usoXeZ5fz54srofidnEFst2dmXx0ahLO0vm1ep0agtHFmt8chmGlhWN48/R1ZfKs1Lre+TsqHOu0dNg==
X-Received: by 10.202.104.35 with SMTP id d35mr29575509oic.128.1453344249848; 
	Wed, 20 Jan 2016 18:44:09 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:08 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:17 -0800
Message-Id: <1453344203-7118-20-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 19/25] gstreamer1.0-plugins.inc: don't set base SRC_URI via python
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
X-List-Received-Date: Thu, 21 Jan 2016 02:44:11 -0000

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


