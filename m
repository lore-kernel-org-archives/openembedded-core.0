Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C91637402F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 12:40:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2015 05:40:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731113958"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.29.132])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 05:40:51 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 15:40:42 +0300
Message-Id: <1431952843-25139-5-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
Subject: [PATCH 4/5] pulseaudio-client-conf-sato: initial recipe
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
X-List-Received-Date: Mon, 18 May 2015 12:40:53 -0000

This recipe is related to enabling PulseAudio in Sato images. We will
rely on PulseAudio's autospawn feature to automatically start the
daemon. The graphical session in Sato runs under root, however, and
PulseAudio disables autospawning for root by default. We provide a
custom client.conf in Sato to change that default setting.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 .../pulseaudio-client-conf-sato/client.conf          |  7 +++++++
 .../pulseaudio-sato/pulseaudio-client-conf-sato_1.bb | 20 ++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/client.conf
 create mode 100644 meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb

diff --git a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/client.conf b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/client.conf
new file mode 100644
index 0000000..97492e7
--- /dev/null
+++ b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/client.conf
@@ -0,0 +1,7 @@
+# We rely on PulseAudio's autospawn feature to automatically start the daemon
+# in Sato. The graphical session in Sato runs under root, however, and
+# PulseAudio disables autospawning for root by default. In a normal setup it's
+# not desirable to autospawn for root, because it can easily interfere with
+# other users' PulseAudio instances, but in Sato there are no other users, so
+# it's OK to enable this in Sato.
+allow-autospawn-for-root = yes
diff --git a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
new file mode 100644
index 0000000..c0858f6
--- /dev/null
+++ b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "/etc/pulse/client.conf tailored for Sato"
+SECTION = "multimedia"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://client.conf"
+S = "${WORKDIR}"
+
+do_install() {
+	install -d ${D}${sysconfdir}/pulse
+	install -m 0644 ${S}/client.conf ${D}${sysconfdir}/pulse
+}
+
+RCONFLICTS_${PN} = "pulseaudio-client-conf"
+RPROVIDES_${PN} = "pulseaudio-client-conf"
+RREPLACES_${PN} = "pulseaudio-client-conf"
+
+FILES_${PN} = "${sysconfdir}/pulse/client.conf"
+CONFFILES_${PN} = "${sysconfdir}/pulse/client.conf"
-- 
1.9.3


