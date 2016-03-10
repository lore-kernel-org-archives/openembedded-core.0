Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3E50A6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 09:53:39 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id n190so99707181iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 01:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lmrn89CmsjscFFZ/laekU4BRDAJBLpKIbqzq3DGf48c=;
	b=M78T6PDfBuZq/PbkyVJdCqY5NV5+sDWwmSoQD3ePNIBHiuRqYAZBOcx08MKrt66WJe
	FKr3HU3PPRCzIIQnHJokDM2DcGDqsr2C2tzZN3as2JRWR+xkuKASBZAtymROvKz9cK5C
	2azY8JI341GtYVgJsD2xhz9BPPVlZo2hUmdTZcBY5coT8sjyk7/62grkOWqb0oHna3g5
	AncwAfzY0++KWg0COE131DbtXVRQr0Eb/XVIsaAvBi3eNPbcecUZOSSoQ3Age0/MC0QQ
	+T/30ASS+9eluliMpemzuGxbJqrcPTma6l1luazeWaICN5JgEZ05IQQiZbc2RAp2UuqB
	OwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lmrn89CmsjscFFZ/laekU4BRDAJBLpKIbqzq3DGf48c=;
	b=W2kLk0/gNn/uY9oI0AW6sFT1RDi0fYtXbzLJTKj6JLcfJO7azZpUOXgJMkOfONbFBc
	n5fRx+PsdKDXu/LIcKGIBFluMjQ1udeGmmwGnQxkpH8kJ2cBRbtFSQnJw4w+BvoD7ovi
	+nicM377ic/CKNT6r1ruwdifjxGoJB4LQnDnD3uUw3tPqjtIdqZsQqbpBPZhV91TNgCz
	w/EkBNG237syfyFV7vipdcKvPro/QGN+3ZBOxZUOKUMXZp7BkKs2zvuqbgiUXsYrcCtO
	1dmecM3z4zyi1n3aBUnPxegsaErQOwaJ4nXhF/jQxn61aJbbIGQSYB+molhDkY5kED9m
	w1OA==
X-Gm-Message-State: AD7BkJIzbN7V1viMULMkQURk6K6nt9odP//NVLMhEnavLuwYoM9k5Gy5x8gji5+WRfw/RBBG
X-Received: by 10.107.152.142 with SMTP id a136mr2661731ioe.84.1457603620353; 
	Thu, 10 Mar 2016 01:53:40 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8C349.dip0.t-ipconnect.de.
	[93.232.195.73])
	by smtp.gmail.com with ESMTPSA id k5sm1196897igt.2.2016.03.10.01.53.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Mar 2016 01:53:39 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 10:53:21 +0100
Message-Id: <1457603601-28657-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1457517718.9847.28.camel@intel.com>
References: <1457517718.9847.28.camel@intel.com>
Subject: [RFC PATCH] systemd: make systemd-serialgetty optional
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
X-List-Received-Date: Thu, 10 Mar 2016 09:53:40 -0000

Some distros may prefer to use the upstream systemd support for
starting getty on serial ports. This is now possible by adding
"serial-getty-generator" to PACKAGECONFIG.

The default is unchanged, i.e. systemd's own serial-getty@.service
file does not get packaged and instead systemd-serialgetty is pulled
into images via RRECOMMENDS.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/systemd/systemd_229.bb | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index cd48360..3c4d877 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -148,6 +148,11 @@ PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
 
+# Use the upstream systemd serial-getty@.service and rely on
+# systemd-getty-generator instead of using the OE-core specific
+# systemd-serialgetty.bb - not enabled by default.
+PACKAGECONFIG[serial-getty-generator] = ""
+
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
 CACHED_CONFIGUREVARS += "ac_cv_path_QUOTACHECK=${sbindir}/quotacheck"
@@ -201,8 +206,10 @@ do_configure_prepend() {
 do_install() {
 	autotools_do_install
 	install -d ${D}/${base_sbindir}
-	# Provided by a separate recipe
-	rm ${D}${systemd_unitdir}/system/serial-getty* -f
+	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
+		# Provided by a separate recipe
+		rm ${D}${systemd_unitdir}/system/serial-getty* -f
+	fi
 
 	# Provide support for initramfs
 	[ ! -e ${D}/init ] && ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
@@ -439,7 +446,9 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
 RDEPENDS_${PN} += "volatile-binds update-rc.d"
 
-RRECOMMENDS_${PN} += "systemd-serialgetty systemd-vconsole-setup \
+RRECOMMENDS_${PN} += " \
+                      ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)} \
+                      systemd-vconsole-setup \
                       systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
                       util-linux-agetty  util-linux-fsck e2fsprogs-e2fsck \
-- 
2.1.4


