Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97BF677CF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 09:40:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q124so754139wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ySQZ5d+kvNutoiju/W+T9xVsXUF1N/xO7mM00KU0/qI=;
	b=AzmjSgKPqaMno6mAhvMD+aERAsS52jczy8NxP11h0RWZGsWduZ+bQ5ruJGQrxMGa92
	wf9KMw9O3YcyeI7MIleVs74PeTAzuae6VgBw+w/M1xpCSMKaovNaKVJ5zIQAhlDPtTcj
	ws2b23aOAmbbw9r7ZnLFriLBmtjy5ksa6RAFh/VIYsedtreWtNnLejH+gNCwNWDvif8u
	HG6bU5FIGa+WuGV36zk0NKR2oknSK+BOBU8A46ux/DteWutj6k74U8XpK1GR8INClTVX
	D5kaMAPT24GYWXQGzWfbkfKhF01owD7jRkRqB6jv2TNi7mApRgBx3OZK1LRY9DResZfW
	V+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ySQZ5d+kvNutoiju/W+T9xVsXUF1N/xO7mM00KU0/qI=;
	b=e8QdIwbTMyyQ3VMoONxkOgPUN1kC5nD9FapM0DOnt1LG4jGFN4L0EzVFPwWnGzU+yg
	C3AEF37BYTdUZze79yTWoioRyHjWOYLQ8yeucpzNymRconNe+bwHrl5F9ckk6fl+CONc
	5V8riaoaXlup9Ev3KIEDSgZvn5eEt7oedI+ytuDMzosRRTI3vf5mPo69P/du5Ve52eeO
	Clt8kPnkoXNciPfG4oxLs2mgQVnnIs6Gy9Q2GBGfabWyonGoQWuIcOtpx4SeMHUJgb+1
	SPy/+NEGJ73G+jmJGwCh+eLD6LXgkchbpOqnkTpCYVdDBJJqpfhq5+Z4P1UoL6zIP6FP
	LAwQ==
X-Gm-Message-State: AHPjjUi7F6b8NC1zhfgTxGBUTKWgGWRGKyx+4GyBciPwIGggIcZ7RIhE
	vLT2Dd8GE8rqJMvXEyd5ASELlwIY
X-Google-Smtp-Source: AOwi7QB4N9Fvp0f8JMtPoBns/WwgDDCWvbXcwbRoz5AJhE3IgEWpRbqcwzlhlJ41qtVz3LzIPmlN0Q==
X-Received: by 10.80.182.206 with SMTP id f14mr1260860ede.110.1506505221028;
	Wed, 27 Sep 2017 02:40:21 -0700 (PDT)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id b8sm6712890eda.35.2017.09.27.02.40.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Sep 2017 02:40:20 -0700 (PDT)
From: andreas.kling@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 11:40:14 +0200
Message-Id: <20170927094014.2666-1-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170926171708.19010-1-andreas.kling@gmail.com>
References: <20170926171708.19010-1-andreas.kling@gmail.com>
Subject: [PATCH v3] systemd: add runtime dependencies to pam plugins.
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
X-List-Received-Date: Wed, 27 Sep 2017 09:40:21 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  This ensures pam plugins required by /etc/pam.d/systemd-user
  to open a user session are installed.

  systemd[1]: Starting User Manager for UID 994...
  systemd[6493]: PAM unable to dlopen(/lib/security/pam_keyinit.so)

  Drop package systemd-pam to prevent confusion.
  It is unused for a long time now.

  v2: improve commit message
  v3: drop systemd-pam

Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
---
 meta/recipes-core/systemd/systemd_234.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 881896bfb5..acc4c4623b 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -31,6 +31,12 @@ SRC_URI += " \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
+PAM_PLUGINS = " \
+    pam-plugin-unix \
+    pam-plugin-loginuid \
+    pam-plugin-keyinit \
+"
+
 PACKAGECONFIG ??= "xz \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux ldconfig usrmerge', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
@@ -100,7 +106,7 @@ PACKAGECONFIG[importd] = "--enable-importd,--disable-importd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
 # Verify keymaps on locale change
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 # Update NAT firewall rules
@@ -295,7 +301,6 @@ PACKAGES =+ "\
     ${PN}-kernel-install \
     ${PN}-rpm-macros \
     ${PN}-binfmt \
-    ${PN}-pam \
     ${PN}-zsh-completion \
     ${PN}-xorg-xinitrc \
     ${PN}-container \
-- 
2.14.1


