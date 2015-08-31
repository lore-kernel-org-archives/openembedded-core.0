Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8A81D76F9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:12:14 +0000 (UTC)
Received: by wicmc4 with SMTP id mc4so9796151wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=teHnTW2QLEBCFKqH/Krlkuyofa9zTIykyf42uRx8W6w=;
	b=R42NyXBYFpiljfgbn7nbOcBIPCjtYiiGVd4C3jbeyaprQkriXeNHRcem8iJMbmdwI5
	Z1nwxtpUFw76n5+C+qm20v6tfMv4R2TW3pBlJG5mNeSjicLy5FUrXuCgooRDOF6NaF/6
	cBwjVEPvq+OjSEVqvw2RwC4NX5hxqed1mhEGbcdPXw7kShG1w+S+8EIsW1y6DdlUAOLz
	RPlBNqchpnPEs8Fx3Sv/GcwL4LnB7aGMqwYqYIWU+tFTxJZoOATakP7zNlqpO2EbgcWQ
	xu82vWUnDYfuXcISRCsF8oX+NQI++JXQqExUkjPRlKpDUxFzKa4mr+zo7ugg/oGB6dEz
	Qjtw==
X-Received: by 10.180.87.230 with SMTP id bb6mr133807wib.26.1441048334222;
	Mon, 31 Aug 2015 12:12:14 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	pu6sm23568430wjc.34.2015.08.31.12.12.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Aug 2015 12:12:13 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 12:12:03 -0700
Message-Id: <00b6da871787d810007054f6a8095fbb44d6cbce.1441048182.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <02054faced424f2d07fb72f8ac92ee93521c519e.1441048182.git.chris_larson@mentor.com>
References: <02054faced424f2d07fb72f8ac92ee93521c519e.1441048182.git.chris_larson@mentor.com>
In-Reply-To: <cover.1441048182.git.chris_larson@mentor.com>
References: <cover.1441048182.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 3/3] pulseaudio: add 'autospawn-for-root' PACKAGECONFIG
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
X-List-Received-Date: Mon, 31 Aug 2015 19:12:15 -0000

From: Christopher Larson <chris_larson@mentor.com>

Since many embedded systems don't have non-root users, it's useful to be able
to use pulseaudio autospawn for root as well.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 6199dcd..bca8e36 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -47,6 +47,9 @@ PACKAGECONFIG[systemd] = "--enable-systemd-daemon --enable-systemd-login --enabl
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
+# Since many embedded systems don't have non-root users, it's useful to be
+# able to use pulseaudio autospawn for root as well.
+PACKAGECONFIG[autospawn-for-root] = ",,,"
 
 EXTRA_OECONF_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
 EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
@@ -59,6 +62,19 @@ export TARGET_PFPU = "${TARGET_FPU}"
 OE_LT_RPATH_ALLOW = "any"
 OE_LT_RPATH_ALLOW[export]="1"
 
+set_cfg_value () {
+	sed -i -e "s/\(; *\)\?$2 =.*/$2 = $3/" "$1"
+	if ! grep -q "^$2 = $3\$" "$1"; then
+		die "Use of sed to set '$2' to '$3' in '$1' failed"
+	fi
+}
+
+do_compile_append () {
+	if ${@bb.utils.contains('PACKAGECONFIG', 'autospawn-for-root', 'true', 'false', d)}; then
+		set_cfg_value src/client.conf allow-autospawn-for-root yes
+	fi
+}
+
 do_install_append() {
 	install -d ${D}${sysconfdir}/default/volatiles
 	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/volatiles.04_pulse
-- 
2.2.1


