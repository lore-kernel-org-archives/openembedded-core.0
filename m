Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.16100.1584820718004050363
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 12:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=hLT5Qh2Y;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=daxo=5g=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48lBKS1ktsz4b
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2020 20:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584820716;
	bh=znrezmmBl23czC5DP1UdLtM+GYG2RpslEDyTSF8iojE=;
	h=From:To:Subject:Date:From;
	b=hLT5Qh2Ye49Fla1ZRbOgZEvyHqsoLjuebq2sDBW3TdEjRLEDpMxI8Rm/Xq5PhMqsC
	 cEa4oeUdUruwFazeAbsQliFOJzDMvkxqFDl6pDuq4WQyeNZpN5YCw4Smqi119I4vQp
	 CsD7+wlWDMuSd+/VugAT3o6oY1FRSPPwCrai1DlI8yz3dXTOyi6eVpXQsIHtZ1wb2Q
	 GqyHHfgz27K+uCd+NKCeYWObk3kjJo7PKNyC5Ge35AjFx3j4gvEtMq+pCY0yiajey3
	 MI1CPr6+T9R8Mwdeks/3s+PEHLH03HyuATBuI5nT8ZoX58PbkKIepyhTvyVbZGb3FD
	 nFrdBNc35quaxuvTwn9015MGMLkeMAWE3CfCInCItBYRHNiR4eew390DjcZwnv1QlI
	 jPx9T0YsZGE+3g5rPXK34NVL7lGyPo/p/VoFND2wNtWpVQB5HbjhB/oU4Y2BFr2njp
	 0H0eYwGTRMBGdis3NZNyX1E48Cz52+CWfvD56HQwVSFmxyDdY2ZFyLilBakq95o4Mv
	 J5I/vUKBkRTcxcNJPL5Lj6d1rUuazJB4lB7uuqJ45L5jJ0e2mxxC3BshnY2kwHVgnY
	 4Da25UkSSTpFmjLSdRIO/ksnrx1hsLQP2kcFypbHy5HjsoSz/2asxxenNf4R0oULCL
	 m/RHUe95pQp4WZf8VwFewPYU=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][warrior][PATCH] systemd: Backport the CVE-2019-20386 fix
Date: Sat, 21 Mar 2020 21:58:35 +0200
Message-Id: <20200321195835.22615-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
Already fixed in the upstream version in zeus.
---
 ...sd_event_source-when-udevadm-trigger.patch | 35 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_241.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-bus_open-leak-sd_event_source-when-udevadm-trigger.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-bus_open-leak-sd_event_source-when-udevadm-trigger.patch b/meta/recipes-core/systemd/systemd/0001-bus_open-leak-sd_event_source-when-udevadm-trigger.patch
new file mode 100644
index 0000000000..7864140bd1
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-bus_open-leak-sd_event_source-when-udevadm-trigger.patch
@@ -0,0 +1,35 @@
+From 3e9828454dcdaa6cd19ee7ea3e3db30567f22c9f Mon Sep 17 00:00:00 2001
+From: ven <2988994+hexiaowen@users.noreply.github.com>
+Date: Wed, 22 May 2019 14:24:28 +0800
+Subject: =?UTF-8?q?bus=5Fopen=20leak=20sd=5Fevent=5Fsource=20when=20udevad?=
+ =?UTF-8?q?m=20trigger=E3=80=82?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On my host, when executing the udevadm trigger, I only receive the change event, which causes memleak
+
+CVE: CVE-2019-20386
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ src/login/logind-button.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/login/logind-button.c b/src/login/logind-button.c
+index daffbf0668..1624a31cc3 100644
+--- a/src/login/logind-button.c
++++ b/src/login/logind-button.c
+@@ -341,7 +341,8 @@ int button_open(Button *b) {
+         }
+ 
+         (void) button_set_mask(b);
+-
++        
++        b->io_event_source = sd_event_source_unref(b->io_event_source);
+         r = sd_event_add_io(b->manager->event, &b->io_event_source, b->fd, EPOLLIN, button_dispatch, b);
+         if (r < 0) {
+                 log_error_errno(r, "Failed to add button event: %m");
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index eb3242d624..e0dc936294 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            file://0001-meson-declare-version.h-as-dep-for-various-targets-t.patch \
            file://0001-meson-declare-version.h-as-dependency-for-systemd.patch \
+           file://0001-bus_open-leak-sd_event_source-when-udevadm-trigger.patch \
            "
 
 # patches needed by musl
-- 
2.17.1

