Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5516CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:33:18 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9609.1781677993211509724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 23:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=O47BmWWs;
 spf=pass (domain: mvista.com, ip: 74.125.82.179, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1227519eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 23:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781677992; x=1782282792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHfHKATC2zDBuJYqfvkEYyIV+EUmP2C6J7axfc7tjvs=;
        b=O47BmWWs2bNS7Ex5dPOXf/gyb+cSI2CAN3T38/AdC2PG3x8b1woSpewrqSCDD02Dei
         UStxwKjrxqQS8anAgT1ac389znWFxzW1kieWypqXzMK+CW08niJqPUIXMCUIOqYgTCn2
         NG+I6JbUB4e5JZnDlAl31sMePCORXXqaoM2UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781677992; x=1782282792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHfHKATC2zDBuJYqfvkEYyIV+EUmP2C6J7axfc7tjvs=;
        b=QBHK1vsiFTl9PQW0+yFGOALXwn44VcKh8fiXW6XQX+JCCR/+cQqrQtQnf3SFIL3bja
         Dqib0twYRC7IU+lnsEwSu2GNeGRbI1fBwDZHefgqzfyLsPfAP2AsO+IYCfu6jiFgWdvT
         nn5o7oDpaulfV6CApaIyoXeu6PKT1RFlWRojVTQTNqOC2dAPwHxYg7YGZAjja8Db0YBF
         jLq4v8tEXDoTFhD3WO+X74lIorVf94kVDBUAgak6PZzoIT1XNap/2g1tbt+Q8M19rXof
         gGCWpzlx23co1PoCEfK2xedSWMgluV9XmabOUI2QhZsW4G2bOstuzve8r80mvLMDopbX
         sqKA==
X-Gm-Message-State: AOJu0YxLX9E57+2Lfspnhp4MHPBoOJhnmkA7adjqa3c5+Bu7CARUgoCn
	ttFRvf6wJg0jL92IWr3LuXj8czDMTlvL2i7ITt0zKDgC+OJ2prTdA6hg+K5tw92TuBavgPGa1pI
	eB5Dk
X-Gm-Gg: AfdE7ckD1/8RL+oKhsTqOjWUZbh1lbsajcDHlXuQn3BggmY5MzeZGMsy7VF95lOhYBt
	EyNndMnup9N+qRwqmzMpsGGkhGVfPKg6EkZDe/4EjsdNRxQKr6vkZ4UVNj8GhmuWRGYrF+9fNC+
	k37yQoFyy5sFPHOV4dKztaBTYvyM+FodW737UxDAXpxDBiHu/BIflVV0jdiVE7wKQYJ1KGrGpPW
	sqGcxS/iAhMg03QaQgKaLTbDgd5oRv70quAv8j/4G2BCipza1EkXfYEXmRQfnLjz1H59qg7wJC5
	CLwVQlCVrSKzuNUrf1D7GGd5Jfvvo4YffQUu+fpfTwczrl/enzkTPmsAm10vXQt0gMjMhTwnnOD
	cTn7ajXq7YnxjoIu7D0/jvE/zolkjFS43g/gaH65faavdYOYsrckLY1JQv8kfZjPkhtMaM/rVnm
	OuQwHI6ahkwcU/MUpigsgvRwx5bA==
X-Received: by 2002:a05:7300:430f:b0:30b:9e57:1e6b with SMTP id 5a478bee46e88-30bca066cd9mr1642283eec.17.1781677992427;
        Tue, 16 Jun 2026 23:33:12 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm3816509eec.22.2026.06.16.23.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:33:11 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libinput: fix for CVE-2026-50292
Date: Wed, 17 Jun 2026 12:03:03 +0530
Message-ID: <20260617063303.70266-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 06:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238978

Pick patch from [1] & [2] also mentioned at Debian report in [3].

[1] https://gitlab.freedesktop.org/libinput/libinput/-/commit/fc2262e1c1847021239065e84f39f15492ef05cc
[2] https://gitlab.freedesktop.org/libinput/libinput/-/commit/b2bde9504d42a5976d76e1f27c640dc561fbd99b
[3] https://security-tracker.debian.org/tracker/CVE-2026-50292

More details :
1. https://nvd.nist.gov/vuln/detail/CVE-2026-50292
2. https://www.openwall.com/lists/oss-security/2026/06/04/5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wayland/libinput/CVE-2026-50292-01.patch  | 109 ++++++++++++++++++
 .../wayland/libinput/CVE-2026-50292-02.patch  |  99 ++++++++++++++++
 .../wayland/libinput_1.25.0.bb                |   2 +
 3 files changed, 210 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292-02.patch

diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch
new file mode 100644
index 0000000000..35b2734d7a
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
index 0000000000..f78c9f9066
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
index 894858e361..1a33d16f3a 100644
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
-- 
2.50.1


