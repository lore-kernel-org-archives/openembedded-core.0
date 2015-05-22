Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE8970A7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 14:16:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 22 May 2015 07:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="497061941"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com) ([10.252.3.49])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 07:16:05 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 17:15:48 +0300
Message-Id: <02a3ba4a4392338beb2b3304c337b97719ba6e08.1432303757.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <bbc0c5d2ae38edbfb1c0a5e0542a8f4ff99a256b.1432303757.git.tanu.kaskinen@linux.intel.com>
References: <bbc0c5d2ae38edbfb1c0a5e0542a8f4ff99a256b.1432303757.git.tanu.kaskinen@linux.intel.com>
In-Reply-To: <cover.1432303757.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432303757.git.tanu.kaskinen@linux.intel.com>
Subject: [PATCH v2 4/5] pulseaudio-client-conf-sato: initial recipe
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
X-List-Received-Date: Fri, 22 May 2015 14:16:04 -0000

This recipe is related to enabling PulseAudio in Sato images. We will
rely on PulseAudio's autospawn feature to automatically start the
daemon. The graphical session in Sato runs under root, however, and
PulseAudio disables autospawning for root by default. We provide a
client.conf fragment in Sato to change that default setting.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 .../pulseaudio-client-conf-sato/50-sato.conf            |  7 +++++++
 .../pulseaudio-sato/pulseaudio-client-conf-sato_1.bb    | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/50-sato.conf
 create mode 100644 meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb

diff --git a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/50-sato.conf b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/50-sato.conf
new file mode 100644
index 0000000..97492e7
--- /dev/null
+++ b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/50-sato.conf
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
index 0000000..e27339f
--- /dev/null
+++ b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "/etc/pulse/client.conf tailored for Sato"
+SECTION = "multimedia"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://50-sato.conf"
+S = "${WORKDIR}"
+
+inherit allarch
+
+do_install() {
+	install -d ${D}${sysconfdir}/pulse/client.conf.d
+	install -m 0644 ${S}/50-sato.conf ${D}${sysconfdir}/pulse/client.conf.d/50-sato.conf
+}
+
+FILES_${PN} = "${sysconfdir}/pulse/client.conf.d/50-sato.conf"
+CONFFILES_${PN} = "${sysconfdir}/pulse/client.conf.d/50-sato.conf"
-- 
1.9.3


