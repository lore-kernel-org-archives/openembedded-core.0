Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6923C719CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 22:09:47 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id v84so63338389oie.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 14:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=r8KBHrE/xRYZgOLHUXMtjAT7QZXo8s91EZFC8HuAov8=;
	b=Cr8B4BboLtSHtfmo07ZL8FK6cweOh/6LGePlfCi/MMHD8LUEi4mg9T3MVXAE4YyFbz
	af9t33fYi8vC5ojbgTwaFdlylMyPDT/Homo8Wp2nRveq7XENOs1rLDoYdKP35PXK1uqE
	VxJ/s2vodWP6tQDTEgiLI+TBtmIOSUj7OHLAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=r8KBHrE/xRYZgOLHUXMtjAT7QZXo8s91EZFC8HuAov8=;
	b=Pt1LzFQYdQ1/QDOlUWf0zmy2Pj7F0C02z+lYHsEV9X/rTncGVdse4+pfT9AijjpqtT
	0YjjRd57KPvfeeht4e7KpQTq4cQ0Xg7FINUhUTnYRYdRZKCD1KwqC7gzuNZkqFHM1J5m
	wtz5VqcbB37FfnjcYl8v+AocqveQj+B5bSpICMuJP4/rs+LGfkx27XIKMACXqx+8bMYv
	YZ+qXsCRBXDP+yv/0UOhM0+BjqU9foVZo6x6lud4MTKcBi4uDuMNH40jriiO9FMhstaE
	GpGWdG7Wn6RDPHAVl2bHnBdWrRpoPpN8m9dfH1AGHLv35HKLz1cuerE5DWCYnUz/vAq1
	Wf2A==
X-Gm-Message-State: AKaTC03E9kh9TwgGUFQowuj+YwVQgRlhSzkz1h75P6nwajYHK9Jmjc/1umTq35e1LuIbpVnr
X-Received: by 10.157.21.112 with SMTP id z45mr3165272otz.70.1480025388250;
	Thu, 24 Nov 2016 14:09:48 -0800 (PST)
Received: from aura.cortijodelrio.net
	(CableLink64-18.telefonia.InterCable.net. [201.172.64.18])
	by smtp.googlemail.com with ESMTPSA id
	p48sm12300640ota.18.2016.11.24.14.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 14:09:47 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 16:09:31 -0600
Message-Id: <1480025371-5354-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][morty] weston: Add no-input-device patch to 1.11.0.
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
X-List-Received-Date: Thu, 24 Nov 2016 22:09:47 -0000
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
 ...on-1.11-config-option-for-no-input-device.patch | 123 +++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.11.0.bb     |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/weston-1.11-config-option-for-no-input-device.patch

diff --git a/meta/recipes-graphics/wayland/weston/weston-1.11-config-option-for-no-input-device.patch b/meta/recipes-graphics/wayland/weston/weston-1.11-config-option-for-no-input-device.patch
new file mode 100644
index 0000000..6f5ad66
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/weston-1.11-config-option-for-no-input-device.patch
@@ -0,0 +1,123 @@
+From bbf2e6ebbd9c051775f43e1e3c3a2f41322342e8 Mon Sep 17 00:00:00 2001
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
+index d7c4a6f..c7d0f01 100644
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
+index 0bbf458..476b650 100644
+--- a/src/compositor.h
++++ b/src/compositor.h
+@@ -803,6 +803,10 @@ struct weston_compositor {
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
+index 8ce0ee0..e1fdcf0 100644
+--- a/src/libinput-seat.c
++++ b/src/libinput-seat.c
+@@ -255,6 +255,12 @@ udev_input_enable(struct udev_input *input)
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
+index 3279ac6..09905ea 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -1298,6 +1298,7 @@ int main(int argc, char *argv[])
+ 	struct wl_client *primary_client;
+ 	struct wl_listener primary_client_destroyed;
+ 	struct weston_seat *seat;
++	int require_input;
+ 
+ 	const struct weston_option core_options[] = {
+ 		{ WESTON_OPTION_STRING, "backend", 'B', &backend },
+@@ -1373,6 +1374,10 @@ int main(int argc, char *argv[])
+ 	if (weston_compositor_init_config(ec, config) < 0)
+ 		goto out;
+ 
++	weston_config_section_get_bool(section, "require-input",
++				       &require_input, true);
++	ec->require_input = require_input;
++
+ 	if (load_backend(ec, backend, &argc, argv, config) < 0) {
+ 		weston_log("fatal: failed to create compositor backend\n");
+ 		goto out;
+diff --git a/weston.ini.in b/weston.ini.in
+index 14a4c0c..d837fb5 100644
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
diff --git a/meta/recipes-graphics/wayland/weston_1.11.0.bb b/meta/recipes-graphics/wayland/weston_1.11.0.bb
index 3ad309d..9740ce9 100644
--- a/meta/recipes-graphics/wayland/weston_1.11.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.11.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://xwayland.weston-start \
            file://make-weston-launch-exit-for-unrecognized-option.patch \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
+           file://weston-1.11-config-option-for-no-input-device.patch \
 "
 SRC_URI[md5sum] = "bc6f90a2039163804aecfa663b69c4c2"
 SRC_URI[sha256sum] = "05e086e9f186a06843b9f7a5e1abf19347b1a6e4be26d7e74927abc17b6b7125"
-- 
1.9.1


