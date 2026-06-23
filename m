Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EB9CDE001
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20453.1782220479586325354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DghPXFEs;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490ac357c55so60812025e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220478; x=1782825278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+DesP1lolvDkn7SIcZSk0omXQlmPhDeCuLhPxvonv8=;
        b=DghPXFEsL1oC1ohj2ksxtzDfT8KloWzcGXp2Y58C3JSXR0BivAAOCS7CEa8UiRuhmR
         KVI1NygcVEstQOpi3YFTJ1xHwhh3zLxW9qKCQQMdaI56VnrHyYPOhEO+AgRCDusOr3IM
         iVxgtSCf6eyWs/WBseuPGydiYJsPZNcXONLyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220478; x=1782825278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L+DesP1lolvDkn7SIcZSk0omXQlmPhDeCuLhPxvonv8=;
        b=S2HwF2KDB6AV1rgDjlm2srx6Zcov5Zk1H1c5F2iu0tmBLr2FDhoIaBc17bGOSDM1hh
         ApiR5RtELNeLEb6ubqbd2iv8TBYC/+D8dllMHvFenC4S/rF9bzJhcJg8QOa2JnY5XRrh
         IB2KLf4dioxHI3Darfc5jispl+dlwAN3PsQ8nYL5bdU2+RIL8mpvNT8dfeaCXR8tL064
         By7VuabXuty9k2MZmN7JpgGjc/NFLOXowifciF3PWhIKmWanl4InZjc4kt/0p2cPliCB
         iUoAJzXzlBQeRI4itQUL7N9Nj40zzuHzde3owSqudo+sKc1GQoNyB50bhv6fEH6iIimB
         xuaQ==
X-Gm-Message-State: AOJu0YxIYYiGskWFLaIq83GPLAfQnlSNA8iyuxLYBAvuX7SqPgS3dtHf
	CIzOIPpdNHRQ9cS+AQ2pnPb+kXfkkvW6b987fx/p1hBkRyU/4jdkPNWhlX+vwJaMeW9X+2oSwX9
	s2k5b
X-Gm-Gg: AfdE7ckzur/gpAlRYkNyepOjQXahbCGWkdRWNorciZxAhwg1zWsrzRUXKD+2OIrqGrW
	55oZy+YpsxcgbPENClKBCbjQ1qL07WJNOy6dk5wd9Erzb4KEApSMxo99DO5Xkfa3kruHvQ7u1iN
	3uSgm3IuyWJIwG1Z0btXjXjDaTr2OXOtiNmOOqatsO7PlYOZcMCBekLYNxMsrEwRHCCIH4qnkux
	2iRuhAkGMK6SX5lsI+sFpXy/UO2YgXEyjP9XJtqFAj6qa+eLYS+fa+1WO9dIkjRHSoFRrdXLesS
	fqsktBRtFRhDET1YhKAjbkY+Bl7FLcBNjfBYathvWAqbbcIuCJB/qSxdHC80Z9I6sBMesXAjbkC
	bvbscx+s+jVRYTWeaLPs+Mal5AITUfKQLOh/+w9esTSHV0/+tA87j8cdeOhQEdCHsQ8/cAkkQCL
	CGDWMFUOLjz84v9Jijgr7Iidvk/xf2jNkdcBmezXsDSwoPFobcNNfN3U5UkXGjQJi02aK+KcVdY
	rHnk2B39hd3IVG5zw==
X-Received: by 2002:a05:600c:348f:b0:492:4d52:315f with SMTP id 5b1f17b1804b1-4924d52327cmr191563365e9.0.1782220477700;
        Tue, 23 Jun 2026 06:14:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/26] libinput: fix for CVE-2026-50292
Date: Tue, 23 Jun 2026 15:13:57 +0200
Message-ID: <19fc681a3fca99801e2e50d6a9c6c921c66a2ce9.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239382

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] & [2] also mentioned at Debian report in [3].

[1] https://gitlab.freedesktop.org/libinput/libinput/-/commit/fc2262e1c1847021239065e84f39f15492ef05cc
[2] https://gitlab.freedesktop.org/libinput/libinput/-/commit/b2bde9504d42a5976d76e1f27c640dc561fbd99b
[3] https://security-tracker.debian.org/tracker/CVE-2026-50292

More details :
1. https://nvd.nist.gov/vuln/detail/CVE-2026-50292
2. https://www.openwall.com/lists/oss-security/2026/06/04/5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wayland/libinput/CVE-2026-50292-01.patch  | 109 ++++++++++++++++++
 .../wayland/libinput/CVE-2026-50292-02.patch  |  99 ++++++++++++++++
 .../wayland/libinput_1.25.0.bb                |   2 +
 3 files changed, 210 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292-02.patch

diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch
new file mode 100644
index 00000000000..35b2734d7a5
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch
@@ -0,0 +1,109 @@
+From fc2262e1c1847021239065e84f39f15492ef05cc Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 10:12:29 +1000
+Subject: [PATCH] util: sanitize control characters in str_sanitize()
+
+str_sanitize() only escaped '%' characters for format string safety.
+Device names from uinput devices can contain arbitrary bytes including
+ANSI escape sequences (ESC, 0x1b) and other control characters. When
+these strings are included in log messages and printed to a terminal,
+the escape sequences are interpreted by the terminal emulator. This
+could allow an attacker to manipulate terminal output (change colors,
+set window title, clear screen) when an administrator views libinput
+logs.
+
+Replace all control characters (0x00-0x1f and 0x7f) with '?' in
+addition to the existing '%' escaping. This prevents terminal escape
+sequence injection through device names in log output.
+
+Assisted-by: Claude:claude-opus-4-6
+(cherry picked from commit 71a2c5cae2a80a1e3bb29e3f3a07ccc3f3de5acb)
+
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1489>
+
+CVE: CVE-2026-50292
+Upstream-Status: Backport [https://gitlab.freedesktop.org/libinput/libinput/-/commit/fc2262e1c1847021239065e84f39f15492ef05cc]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/util-strings.h | 30 +++++++++++++++++++++++-------
+ test/test-utils.c  | 10 ++++++++++
+ 2 files changed, 33 insertions(+), 7 deletions(-)
+
+diff --git a/src/util-strings.h b/src/util-strings.h
+index b0916815..3429ec9c 100644
+--- a/src/util-strings.h
++++ b/src/util-strings.h
+@@ -456,26 +456,42 @@ trunkname(const char *filename);
+ 
+ /**
+  * Return a copy of str with all % converted to %% to make the string
+- * acceptable as printf format.
++ * acceptable as printf format, and all non-NUL control characters
++ * (bytes 0x01-0x1f, 0x7f) replaced with '?' to prevent terminal
++ * escape sequence injection. NUL bytes are excluded implicitly
++ * because the string is null-terminated.
+  */
+ static inline char *
+ str_sanitize(const char *str)
+ {
+ 	if (!str)
+ 		return NULL;
++	size_t slen = strlen(str);
++	slen = min(slen, 512);
+ 
+-	if (!strchr(str, '%'))
++	bool needs_sanitization = false;
++	for (size_t i = 0; i < slen; i++) {
++		unsigned char c = str[i];
++		if (c == '%' || c < 0x20 || c == 0x7f) {
++			needs_sanitization = true;
++			break;
++		}
++	}
++	if (!needs_sanitization)
+ 		return strdup(str);
+-
+-	size_t slen = min(strlen(str), 512);
+ 	char *sanitized = zalloc(2 * slen + 1);
+ 	const char *src = str;
+ 	char *dst = sanitized;
+-
+ 	for (size_t i = 0; i < slen; i++) {
+-		if (*src == '%')
++		unsigned char c = *src++;
++		if (c == '%') {
+ 			*dst++ = '%';
+-		*dst++ = *src++;
++			*dst++ = '%';
++		} else if (c < 0x20 || c == 0x7f) {
++			*dst++ = '?';
++		} else {
++			*dst++ = c;
++		}
+ 	}
+ 	*dst = '\0';
+ 
+diff --git a/test/test-utils.c b/test/test-utils.c
+index fa307031..88aede23 100644
+--- a/test/test-utils.c
++++ b/test/test-utils.c
+@@ -1388,6 +1388,16 @@ START_TEST(strsanitize_test)
+ 		{ "x %", "x %%" },
+ 		{ "%sx", "%%sx" },
+ 		{ "%s%s", "%%s%%s" },
++		{ "\t", "?" },
++		{ "\n", "?" },
++		{ "\r", "?" },
++		{ "\x1b[31m", "?[31m" },
++		{ "foo\tbar", "foo?bar" },
++		{ "foo\nbar", "foo?bar" },
++		{ "\x01\x1f\x7f", "???" },
++		{ "clean", "clean" },
++		{ "a\x1b[0mb", "a?[0mb" },
++		{ "%\n", "%%?" },
+ 		{ NULL, NULL },
+ 	};
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-02.patch b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-02.patch
new file mode 100644
index 00000000000..f78c9f90663
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-02.patch
@@ -0,0 +1,99 @@
+From b2bde9504d42a5976d76e1f27c640dc561fbd99b Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 10:48:24 +1000
+Subject: [PATCH] libinput-device-group: sanitize phys before printing it
+
+Bug: https://gitlab.freedesktop.org/libinput/libinput/-/work_items/1296
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-50292
+
+A malicious uinput device could set the phys value (via UI_SET_PHYS)
+to contain a '\n'. When the value is printed as part of the device group
+the udev rules will interpret it as separate property.
+
+Depending on the property this can cause local privilege escalation.
+
+Closes #1296
+
+Found-by: Csome
+(cherry picked from commit 76f0d8a7f57e2868882864b4611281f12f704b55)
+
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1489>
+
+CVE: CVE-2026-50292
+Upstream-Status: Backport [https://gitlab.freedesktop.org/libinput/libinput/-/commit/b2bde9504d42a5976d76e1f27c640dc561fbd99b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ udev/libinput-device-group.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/udev/libinput-device-group.c b/udev/libinput-device-group.c
+index 3da904e0..d0522685 100644
+--- a/udev/libinput-device-group.c
++++ b/udev/libinput-device-group.c
+@@ -109,7 +109,8 @@ wacom_handle_ekr(struct udev_device *device,
+ 
+ 	udev_list_entry_foreach(entry, udev_enumerate_get_list_entry(e)) {
+ 		struct udev_device *d;
+-		const char *path, *phys;
++		char *phys = NULL;
++		const char *path;
+ 		const char *pidstr, *vidstr;
+ 		int pid, vid, dist;
+ 
+@@ -124,7 +125,7 @@ wacom_handle_ekr(struct udev_device *device,
+ 
+ 		vidstr = udev_device_get_property_value(d, "ID_VENDOR_ID");
+ 		pidstr = udev_device_get_property_value(d, "ID_MODEL_ID");
+-		phys = udev_device_get_sysattr_value(d, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(d, "phys"));
+ 
+ 		if (vidstr && pidstr && phys &&
+ 		    safe_atoi_base(vidstr, &vid, 16) &&
+@@ -138,11 +139,13 @@ wacom_handle_ekr(struct udev_device *device,
+ 				best_dist = dist;
+ 
+ 				free(*phys_attr);
+-				*phys_attr = safe_strdup(phys);
++				*phys_attr = phys;
++				phys = NULL;
+ 			}
+ 		}
+ 
+ 		udev_device_unref(d);
++		free(phys);
+ 	}
+ 
+ 	udev_enumerate_unref(e);
+@@ -154,8 +157,8 @@ int main(int argc, char **argv)
+ 	int rc = 1;
+ 	struct udev *udev = NULL;
+ 	struct udev_device *device = NULL;
+-	const char *syspath,
+-	           *phys = NULL;
++	char *phys = NULL;
++	const char *syspath = NULL;
+ 	const char *product;
+ 	int bustype, vendor_id, product_id, version;
+ 	char group[1024];
+@@ -179,8 +182,7 @@ int main(int argc, char **argv)
+ 	 * bit and use the remainder as device group identifier */
+ 	while (device != NULL) {
+ 		struct udev_device *parent;
+-
+-		phys = udev_device_get_sysattr_value(device, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(device, "phys"));
+ 		if (phys)
+ 			break;
+ 
+@@ -249,6 +251,8 @@ int main(int argc, char **argv)
+ 
+ 	printf("LIBINPUT_DEVICE_GROUP=%s\n", group);
+ 
++	free(phys);
++
+ 	rc = 0;
+ out:
+ 	if (device)
+-- 
+2.50.1
+
diff --git a/meta/recipes-graphics/wayland/libinput_1.25.0.bb b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
index 894858e3617..1a33d16f3a6 100644
--- a/meta/recipes-graphics/wayland/libinput_1.25.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
@@ -14,6 +14,8 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
+           file://CVE-2026-50292-01.patch \
+           file://CVE-2026-50292-02.patch \
            "
 SRCREV = "3fd38d89276b679ac3565efd7c2150fd047902cb"
 S = "${WORKDIR}/git"

