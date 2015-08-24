Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id B9A7776C0B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:57 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so106448503pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TxuZYy6+Z+uSSF+UiaD0YLIXYEbYgGNIoHx6XZGEjwc=;
	b=NFqTIVoO0C+CP5i8v7MbKtf710vvLhBbvX+wshDixz8xgdfDYkWRBvlv31iMgvVoDz
	YUqoEc3G2/K22etSzS89A3U1RtILSlHf2nr60mzvXfMk9mU2UZ1ccUjleIgyeegYFcOk
	iYwnPuGuid+EXOqDZBv2h8udCY9+//PXjRLlWs8bgZVoIk5lMvAAxP2dzON8/AmR45qH
	+bjAjNkEYyvkIMh2uTfXJTDxE0vFdt7/Sl0HFkMVXZ2vIBejxC2Xz4liW53BR8+ENq/y
	yJcTB+cTlEq0NcIuvzObpUNfBrEnjGzKcSAY+E+Agz/cFBx2SknNHDuNJWn/5PjHo4VK
	JVmg==
X-Received: by 10.66.131.10 with SMTP id oi10mr1896707pab.87.1440454798307;
	Mon, 24 Aug 2015 15:19:58 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	u10sm18537623pdp.85.2015.08.24.15.19.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:57 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:19:47 -0700
Message-Id: <b22733643db015ebedf00241ab7ef40a0ee50a7b.1440454579.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
References: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454579.git.chris_larson@mentor.com>
References: <cover.1440454579.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/5] pulseaudio: add 'autospawn-for-root' PACKAGECONFIG
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:58 -0000

From: Christopher Larson <chris_larson@mentor.com>

Since many embedded systems don't have non-root users, it's useful to be able
to use pulseaudio autospawn for root as well.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 6199dcd..70009d0 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -47,6 +47,11 @@ PACKAGECONFIG[systemd] = "--enable-systemd-daemon --enable-systemd-login --enabl
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
+# Since many embedded systems don't have non-root users, it's useful to be
+# able to use pulseaudio autospawn for root as well. Autospawn will only be
+# used if the systemd packageconfig is not enabled, otherwise it will rely on
+# systemd's user services to spawn it.
+PACKAGECONFIG[autospawn-for-root] = ",,,"
 
 EXTRA_OECONF_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
 EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
@@ -59,6 +64,19 @@ export TARGET_PFPU = "${TARGET_FPU}"
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


