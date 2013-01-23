Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stashluk@gmail.com>) id 1Ty7Tt-0004XD-8g
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 22:03:48 +0100
Received: by mail-vc0-f180.google.com with SMTP id fo13so3264432vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 12:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=uWV8eUBEITjh5l9FGt7saE9AmVjA8LiZyz6n3s2QvEk=;
	b=Vf7Llnw7wgdHvD8X902jvFt3/fK05vtqNqlZqY7s85XE6PID6YGoOvarJoC7LCeYLh
	RkA+ULRnCfxO5ZNQ+lEq72fLej34Fd8KyPwTLHdcmpro+z90lCeuSeQqLolReZnpBR+C
	Z0rTsHqMHscp6gginIc6EIsnPBFQadUi8Ik0xalxP4O/0+pxt8hXtVUd8ujf/rh5pCJ2
	WH16FkXI+Lh2pb4M+57OLiKaBLM47PB4taMPaiJZ8uJOx5txnEaABFuU9BUWsttFjdRy
	11Szz3NGYxSm1MZPV1WPCHMr7r73MByNz05ctl1z92AgTf7qS7vIyZ76WSkWkWX1+Nnv
	E8fg==
X-Received: by 10.52.72.129 with SMTP id d1mr2610031vdv.109.1358974085008;
	Wed, 23 Jan 2013 12:48:05 -0800 (PST)
Received: from jstashluk2.deka.local ([208.65.175.197])
	by mx.google.com with ESMTPS id mj8sm11923954veb.8.2013.01.23.12.48.04
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Jan 2013 12:48:04 -0800 (PST)
From: Jeremy Stashluk <stashluk@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2013 15:47:56 -0500
Message-Id: <1358974076-25725-1-git-send-email-jstashluk@dekaresearch.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Jeremy Stashluk <jstashluk@dekaresearch.com>
Subject: [PATCH] gst-plugins-gl: add package recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 21:03:49 -0000

---
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb

diff --git a/meta-oe/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta-oe/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
new file mode 100644
index 0000000..37368f7
--- /dev/null
+++ b/meta-oe/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -0,0 +1,30 @@
+require recipes-multimedia/gstreamer/gst-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+PR = "r2"
+
+DEPENDS += "gst-plugins-base"
+
+SRCREV_main = "RELEASE-0.10.3"
+SRCREV_common = "0.10"
+
+SRC_URI = " \
+   git://anongit.freedesktop.org/gstreamer/gst-plugins-gl;name=main \
+   git://anongit.freedesktop.org/gstreamer/common;name=common;destsuffix=git/common \
+   "
+
+S = "${WORKDIR}/git"
+
+inherit gettext gconf
+
+EXTRA_OECONF += "--x-includes= --x-libraries= NM=nm"
+
+ARM_INSTRUCTION_SET = "arm"
+
+do_configure_prepend() {
+   autopoint || touch config.rpath
+}
+
+FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
-- 
1.7.9.5



