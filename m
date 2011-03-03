Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvHMA-0005dM-CF
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 23:50:50 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2011 14:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,260,1297065600"; d="scan'208";a="893570450"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2011 14:49:19 -0800
Message-Id: <11232999d1a6f775f7c12961847b6fd6ff6ac832.1299192495.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299192495.git.sgw@linux.intel.com>
References: <cover.1299192495.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 19:54:09 +0800
Date: Thu, 03 Mar 2011 14:49:19 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 04/10] gstreamer: install the sound card driver of es1370
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2011 22:50:50 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

When append "audio" to poky-qemu, emulated sound card like es1370 is
exported to guest. This patch install the kernel driver in the
poky-image-qemux86/x86_64 to use them.

[BUGID #751]

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../gstreamer/gstreamer_0.10.31.bb                 |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb
index f489e83..96c45eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.31.bb
@@ -27,6 +27,9 @@ EXTRA_OECONF = "--disable-docs-build --disable-dependency-tracking --with-check=
 #	mv ${WORKDIR}/gstregistrybinary.[ch] ${S}/gst/
 #}
 
+RRECOMMENDS_${PN}_qemux86    += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+
 FILES_${PN} += " ${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dev += " ${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
 FILES_${PN}-dbg += " ${libdir}/gstreamer-0.10/.debug/"
-- 
1.7.1.1



