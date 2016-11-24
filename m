Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5C060268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 22:08:50 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id y198so63554286oia.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 14:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nne/LHDGuT+B8CPzVDeoVrET2MCVnSOVYfLCANCEZow=;
	b=AVnnXj6phOOQOTIBUnHpaWAoMI3e48xgFaiz0kQet/aM36vluZtCVPdi1ZNOfkQMiX
	yoD60sPMIfeTyGjo0LG0yEXxflVjsjsrj1jHWsrEhlNyZbxeQIiBkVKutvabUDEBBeSQ
	0e34MqEOE2rkYXp42PCpidM0zCbV7VPTzcGZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nne/LHDGuT+B8CPzVDeoVrET2MCVnSOVYfLCANCEZow=;
	b=MhnT71GBHSZA1W6nhZ3vtipVAM2eEoNd3XcIy8/36Tt1N5axFVDwE/102tgdQY3IiA
	9zlEn1Z3vkzhbPXZ32clUhw6xCCHyQpE1WNbZRaLdGHims2OFjIy8OsgXVyF9ORfEAA7
	rcr4yxNaos83aaqwiLEThj9UoEfZ6QBocHTsuZEVM0zAIPTWoWixcIvXuCM7RpE0Od8t
	U1YU8j1ZMcXJl6U0y+N14F1wrBx/QoznfVHCuE6/QI7Bh+25MO/l0TR+sdENjlgCljBK
	ondAmx5+dMipOBVB1HZpZ6Q9ZqfDjZV2/96ZgnrMertfIwlBbR4NL6Eox4+bcSmqL16h
	4PNQ==
X-Gm-Message-State: AKaTC01zF/QyiITj7CyaHIfj+sWVzfiOrDDSdEBbENiFp9aOtzXtgwgIHXSfJP7O/Zgu5/p2
X-Received: by 10.202.3.139 with SMTP id 133mr2668581oid.31.1480025331066;
	Thu, 24 Nov 2016 14:08:51 -0800 (PST)
Received: from aura.cortijodelrio.net
	(CableLink64-18.telefonia.InterCable.net. [201.172.64.18])
	by smtp.googlemail.com with ESMTPSA id
	c8sm12362055oia.14.2016.11.24.14.08.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 14:08:50 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 16:08:27 -0600
Message-Id: <1480025307-13256-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2][krogoth] weston: Add no-input-device patch to 1.9.0.
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
X-List-Received-Date: Thu, 24 Nov 2016 22:08:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The included patch, backported from Weston master (and OE-Core
master since Weston 1.11.1, b6864b1), allows it to run without
any input device at launch. An ini option is introduced for
this purpose, so there is no behavioral change.

Related change in weston.ini:
  [core]
  require-input=true

Default is true; setting it false allows Weston to run
without a keyboard or mouse, which is handy for automated
environments.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
v2: Reposted now that the patch made it to OE-Core master.

 ...ton-1.9-config-option-for-no-input-device.patch | 123 +++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.9.0.bb      |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/weston-1.9-config-option-for-no-input-device.patch

diff --git a/meta/recipes-graphics/wayland/weston/weston-1.9-config-option-for-no-input-device.patch b/meta/recipes-graphics/wayland/weston/weston-1.9-config-option-for-no-input-device.patch
new file mode 100644
index 0000000..61a54fd
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/weston-1.9-config-option-for-no-input-device.patch
@@ -0,0 +1,123 @@
+From 6c89292024cc08d4499916dc153c354175bd81c4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
+Date: Fri, 21 Oct 2016 14:03:13 -0500
+Subject: [PATCH] Add configuration option for no input device.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[Backported from master, 75b7197.]
+
+As it has been discussed in the past [1], running Weston
+without any input device at launch might be beneficial for
+some use cases.
+
+Certainly, it's best for the vast majority of users (and
+the project) to require an input device to be present, as
+to avoid frustration and hassle, but for those brave souls
+that so prefer, this patch lets them run without any input
+device at all.
+
+This introduces a simple configuration in weston.ini:
+  [core]
+  require-input=true
+
+True is the default, so no behavioral change is introduced.
+
+[1] https://lists.freedesktop.org/archives/wayland-devel/2015-November/025193.html
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+---
+ man/weston.ini.man  | 5 +++++
+ src/compositor.h    | 4 ++++
+ src/libinput-seat.c | 6 ++++++
+ src/main.c          | 5 +++++
+ weston.ini.in       | 1 +
+ 5 files changed, 21 insertions(+)
+
+diff --git a/man/weston.ini.man b/man/weston.ini.man
+index a9b6026..668b16f 100644
+--- a/man/weston.ini.man
++++ b/man/weston.ini.man
+@@ -169,6 +169,11 @@ time, the one specified in the command-line will be used. On the other
+ hand, if none of these sets the value, default idle timeout will be
+ set to 300 seconds.
+ .RS
++.PP
++.RE
++.TP 7
++.BI "require-input=" true
++require an input device for launch
+ 
+ .SH "LIBINPUT SECTION"
+ The
+diff --git a/src/compositor.h b/src/compositor.h
+index c4c81f0..292a412 100644
+--- a/src/compositor.h
++++ b/src/compositor.h
+@@ -701,6 +701,10 @@ struct weston_compositor {
+ 
+ 	void *user_data;
+ 	void (*exit)(struct weston_compositor *c);
++
++	/* Whether to let the compositor run without any input device. */
++	bool require_input;
++
+ };
+ 
+ struct weston_buffer {
+diff --git a/src/libinput-seat.c b/src/libinput-seat.c
+index c9f9ed2..1c4c358 100644
+--- a/src/libinput-seat.c
++++ b/src/libinput-seat.c
+@@ -250,6 +250,12 @@ udev_input_enable(struct udev_input *input)
+ 			devices_found = 1;
+ 	}
+ 
++	if (devices_found == 0 && !c->require_input) {
++		weston_log("warning: no input devices found, but none required "
++			   "as per configuration.\n");
++		return 0;
++	}
++
+ 	if (devices_found == 0) {
+ 		weston_log(
+ 			"warning: no input devices on entering Weston. "
+diff --git a/src/main.c b/src/main.c
+index a98570e..b8632e9 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -658,6 +658,7 @@ int main(int argc, char *argv[])
+ 	struct wl_client *primary_client;
+ 	struct wl_listener primary_client_destroyed;
+ 	struct weston_seat *seat;
++	int require_input;
+ 
+ 	const struct weston_option core_options[] = {
+ 		{ WESTON_OPTION_STRING, "backend", 'B', &backend },
+@@ -737,6 +738,10 @@ int main(int argc, char *argv[])
+ 	if (weston_compositor_init_config(ec, config) < 0)
+ 		goto out_signals;
+ 
++	weston_config_section_get_bool(section, "require-input",
++				       &require_input, true);
++	ec->require_input = require_input;
++
+ 	if (backend_init(ec, &argc, argv, config) < 0) {
+ 		weston_log("fatal: failed to create compositor backend\n");
+ 		goto out_signals;
+diff --git a/weston.ini.in b/weston.ini.in
+index 06b51df..e9ef992 100644
+--- a/weston.ini.in
++++ b/weston.ini.in
+@@ -2,6 +2,7 @@
+ #modules=xwayland.so,cms-colord.so
+ #shell=desktop-shell.so
+ #gbm-format=xrgb2101010
++#require-input=true
+ 
+ [shell]
+ background-image=/usr/share/backgrounds/gnome/Aqua.jpg
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index 16a788d..be8c0b7 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-make-error-portable.patch \
            file://libsystemd.patch \
            file://explicit-enable-disable-systemd.patch \
+           file://weston-1.9-config-option-for-no-input-device.patch \
 "
 SRC_URI[md5sum] = "66bbba12f546570b4d97f676bc79a28e"
 SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf"
-- 
1.9.1


