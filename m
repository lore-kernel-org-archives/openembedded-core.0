Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B35CD4F26
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6012.1781960425858671223
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xCItrJ+9;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso41652585e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960424; x=1782565224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7htf1sVVWOXKk73LMzjlMnw7HY+BihHdGNTdDuN0HQ=;
        b=xCItrJ+9+rEtmojuTvv4sCaTczRXjaI4ty3EvC9P6L5nbyffudJGiRGJl+1esDtVPR
         lcwSBSh1x8SMAbc0+LA7k5OB95GKsQroaqOR8eRkWc9bvMrnLPH1UlsgiAnYRXLeglmL
         uPgdUhVqxwg/kK2OuGZpn2MXG+vD/OvaXJX1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960424; x=1782565224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a7htf1sVVWOXKk73LMzjlMnw7HY+BihHdGNTdDuN0HQ=;
        b=R58Xml2MoDXhkZpgy82S6obcVTtvz6Or+oSzegQ9i2dF986v/9XLAfpaF6te6kifBY
         Nh7v4+FkO5tE1WX/Oh8CVy+qyC9OS4vjvy4hAHln0NaWiscBNzAkhyQ9jDZA61WlWCpK
         GsHu7KJqcL3nfWxhg4ZjBkb19DMM+Lc6D8/yAHMlGc1Oqyep2+S2hWHpzEo1hwBg01En
         PZFgtBMRwr/mWK6qHkfxrBtbKUTdLKLcWb54KtR438GZDalyK2swsZ7eOwnR6o5wUQny
         /K2VmNdF4A9wSoNklSNpiPaHC2d49qZbvnfx+F8lWY/7+auhu15eTpnAyJG+ZLRHz6Zd
         3scg==
X-Gm-Message-State: AOJu0Yx69e5p0IZXkOJLECgv5fnxhRobCMiLf7cckedLHcNg4hWeVPYL
	Qg6E7o0RK1+VNYete7lTQpTbjwMjVVXjsDjX+pR89FvkSv5s/K0E8ykTcIca32lUZGdFJyEYg32
	8Wvhz
X-Gm-Gg: AfdE7cmUlEotTw17yeKvwW52vkEWQBVV0kSSngPcfNwuiV5d5FdRtAsNu2lnwpCnJ+U
	rUlKGIqO7PT/o58wnoKzucVSi+570N5id+QLk2H24VNMgxQdjdb6+haVDDPT0bsGCmjYvBa+hsK
	8VIfttNO3ciZeKNd3M9FvlWoA0bpvSMHR8T6nPIkhaJV4ADuR0g7h9a2Hzs78Ajfl1oGeSXrWWm
	XsKVAfqajo70r4ngDGNHpyudTWD7BOaNlaNyjVQ25a1PBkO2BhBq/uboSP+8OsWXyRCf2kt+pUc
	74orr1LGfWZQn6muSCBVxD3wRTAyptlUcD+JFhBhd33P97BfKoe2UYC/oun1fabWXqGsKZMA4g3
	ANVzQ6Loje+eguHJUxDF1iNSLBnf+N8mQy2TBjCjmK7M+ggXF1WlD+gf+Kav7+Aln9k34GPr12t
	N/ZsRX7bbGGLJWOQP/fjJmiGxXm56S4qgDS5QpEjX5zH1QBn3ca9rDRA7OM7q1dvtJdn/v3MWcS
	ZqYczZjC3qSKuH1WghRfxp6O2g=
X-Received: by 2002:a05:600c:3b15:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-4923ef47e73mr158715515e9.3.1781960424013;
        Sat, 20 Jun 2026 06:00:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/36] libinput: fix CVE-2026-50292
Date: Sat, 20 Jun 2026 14:59:37 +0200
Message-ID: <e10ea8dd48c884b7f766c5ba7c8b1f2fd9d1c4b7.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239231

From: Omkar Patil <OmkarAbaji.Patil@windriver.com>

In libinput before 1.30.4 and 1.31.x before 1.31.3,
libinput-device-group unescaped phys output can inject
udev properties leading to arbitrary root code execution

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2026-50292]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8dea5c76f9a0386050345e9638a282fe4ec4bfe)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wayland/libinput/CVE-2026-50292.patch     | 79 +++++++++++++++++++
 .../wayland/libinput_1.30.2.bb                |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292.patch

diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-50292.patch b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292.patch
new file mode 100644
index 00000000000..d2421aab105
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292.patch
@@ -0,0 +1,79 @@
+From 76f0d8a7f57e2868882864b4611281f12f704b55 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 10:48:24 +1000
+Subject: [PATCH] libinput-device-group: sanitize phys before printing it
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
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1487>
+
+CVE: CVE-2026-50292
+Upstream-Status: Backport [https://gitlab.freedesktop.org/libinput/libinput/-/commit/76f0d8a7f57e2868882864b4611281f12f704b55]
+
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ udev/libinput-device-group.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/udev/libinput-device-group.c b/udev/libinput-device-group.c
+index cdb38c0b..f9188406 100644
+--- a/udev/libinput-device-group.c
++++ b/udev/libinput-device-group.c
+@@ -107,7 +107,8 @@ wacom_handle_ekr(struct udev_device *device,
+ 
+ 	udev_list_entry_foreach(entry, udev_enumerate_get_list_entry(e)) {
+ 		struct udev_device *d;
+-		const char *path, *phys;
++		_autofree_ char *phys = NULL;
++		const char *path;
+ 		const char *pidstr, *vidstr;
+ 		int pid, vid, dist;
+ 
+@@ -122,7 +123,7 @@ wacom_handle_ekr(struct udev_device *device,
+ 
+ 		vidstr = udev_device_get_property_value(d, "ID_VENDOR_ID");
+ 		pidstr = udev_device_get_property_value(d, "ID_MODEL_ID");
+-		phys = udev_device_get_sysattr_value(d, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(d, "phys"));
+ 
+ 		if (vidstr && pidstr && phys && safe_atoi_base(vidstr, &vid, 16) &&
+ 		    safe_atoi_base(pidstr, &pid, 16) && vid == VENDOR_ID_WACOM &&
+@@ -134,7 +135,7 @@ wacom_handle_ekr(struct udev_device *device,
+ 				best_dist = dist;
+ 
+ 				free(*phys_attr);
+-				*phys_attr = safe_strdup(phys);
++				*phys_attr = steal(&phys);
+ 			}
+ 		}
+ 
+@@ -151,7 +152,8 @@ main(int argc, char **argv)
+ 	int rc = 1;
+ 	struct udev *udev = NULL;
+ 	struct udev_device *device = NULL;
+-	const char *syspath, *phys = NULL;
++	_autofree_ char *phys = NULL;
++	const char *syspath = NULL;
+ 	const char *product;
+ 	int bustype, vendor_id, product_id, version;
+ 	char group[1024];
+@@ -175,8 +177,7 @@ main(int argc, char **argv)
+ 	 * bit and use the remainder as device group identifier */
+ 	while (device != NULL) {
+ 		struct udev_device *parent;
+-
+-		phys = udev_device_get_sysattr_value(device, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(device, "phys"));
+ 		if (phys)
+ 			break;
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/wayland/libinput_1.30.2.bb b/meta/recipes-graphics/wayland/libinput_1.30.2.bb
index efd51809d8e..96531e8c54e 100644
--- a/meta/recipes-graphics/wayland/libinput_1.30.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.30.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;bra
            file://CVE-2026-35093.patch \
            file://CVE-2026-35094.patch \
            file://run-ptest \
+           file://CVE-2026-50292.patch \
            "
 SRCREV = "042c5e6fd9cc910307027a1522453794b29f2c72"
 

