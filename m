Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 657EE7D0FB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 17:51:43 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id z26so7157230pfg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9yVjfFDv+uCbhxafIHG5t3LrTWEnU1DXIqhreRyr17w=;
	b=kJg8aHJ/Hpa6oBZrFNd9kvRFDo5Cenl64LzYd5G5cl0/T6pd23ISrIkm5nxR/+AjuN
	3Cw8xZAA0mgJj2jyx8NEE/UqLVy1vcQVlrcgea9d9bgwE6GTp457L5X7EaEdYA1EDM9R
	mn/73tBGhZG27idPCKDS/b7d9GpPurBmCxazX5eURYAzDWrG5o3EUcHzev3vS7p9MGPg
	OBVpM6urf7U2VY12fuDEo4wWx2jFnb+rTHGbl2YFi0n7v9me8lbGCJnGbCb7gBSKy4DG
	R34WRYI/dBZxlG4KngBfLSZp9LkPFGH04qoVrPY9PfVxTS/WC1H9rg/JogDelMA5Q1DW
	kRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9yVjfFDv+uCbhxafIHG5t3LrTWEnU1DXIqhreRyr17w=;
	b=g9YHZ5J2aQTdDV/3eUGzy/uz8Wxt1UXzhqXfkdons5OK4XPJFOA9vG1U6+jc7dTHJR
	9cie/+LS3J2OxaJkvt6KjjH1U4y+iFnikj8HCROZVcp0Q7qn0acjWom1fVLgG65hf4vR
	eQbG/4qO/DdKzqe7e2tlg5ruao6oa+fQ/SqoAils/gd3VRZh0r3YMdgZS7kjzwPuxU4a
	g2Co7q88Jq8y138BecD0QXRmEoAZgim/rwJaxIGrioHz0wFzFfMWOQSNE1toKwTEPuYC
	vc/ZlBe4kpj5QmNwwIOvgdDLIOR4mlGiQ6qa9noanJ7woB7xLZ9DUFJuYKgnZyAOtbqc
	lSpQ==
X-Gm-Message-State: APjAAAXGjm/VpF9HkBuRyn6Quz9Wj9PMimgWyJrlwB7qF3Ut/L+F9iPz
	Dddeg1RAQSYlHvHSfrCyHtSE/VOJYzs=
X-Google-Smtp-Source: APXvYqzyuvtIEyfGo+vpiuyi1tXh1w0a02AyF/AWad816TKlGUF/RmSbX3HI8Hzaf/BTB1XEMcN3Ow==
X-Received: by 2002:a62:582:: with SMTP id 124mr20237909pff.209.1557165103599; 
	Mon, 06 May 2019 10:51:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::592a])
	by smtp.gmail.com with ESMTPSA id
	n7sm14764022pff.45.2019.05.06.10.51.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 10:51:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 May 2019 10:51:35 -0700
Message-Id: <20190506175136.7594-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/2] systemd: Fix build with gcc9
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
X-List-Received-Date: Mon, 06 May 2019 17:51:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gcc9 throws additional warnings about format string overflow

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-format-overflow-warnings-with-gcc-9.patch | 41 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_242.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0006-Fix-format-overflow-warnings-with-gcc-9.patch

diff --git a/meta/recipes-core/systemd/systemd/0006-Fix-format-overflow-warnings-with-gcc-9.patch b/meta/recipes-core/systemd/systemd/0006-Fix-format-overflow-warnings-with-gcc-9.patch
new file mode 100644
index 0000000000..510ac22150
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0006-Fix-format-overflow-warnings-with-gcc-9.patch
@@ -0,0 +1,41 @@
+From c8050da8b7b0e59e4d1d0e15a92b9ecad299dbbb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 May 2019 10:41:15 -0700
+Subject: [PATCH] Fix format-overflow warnings with gcc-9
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+gcc-9 has become a bit stricter and can check all kind of formatted
+input/output functions which causes additional warnings when compiling
+networkd
+
+/src/basic/log.h:104:9: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
+         log_internal_realm(LOG_REALM_PLUS_LEVEL(LOG_REALM, (level)), __VA_ARGS__)
+
+see https://github.com/systemd/systemd/issues/12454
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/network/networkd-link.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index 533193ac93..976cbbeaaa 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -339,7 +339,8 @@ static int link_enable_ipv6(Link *link) {
+         r = sysctl_write_ip_property_boolean(AF_INET6, link->ifname, "disable_ipv6", disabled);
+         if (r < 0)
+                 log_link_warning_errno(link, r, "Cannot %s IPv6 for interface %s: %m",
+-                                       enable_disable(!disabled), link->ifname);
++                                       enable_disable(!disabled),
++                                       (link->ifname) ? link->ifname : "<null>");
+         else
+                 log_link_info(link, "IPv6 successfully %sd", enable_disable(!disabled));
+ 
+-- 
+2.21.0
+
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index a6b39d57e8..93c4472bab 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0004-rules-whitelist-hd-devices.patch \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
+           file://0006-Fix-format-overflow-warnings-with-gcc-9.patch \
            file://99-default.preset \
            "
 
-- 
2.21.0


