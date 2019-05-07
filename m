Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9F9F77D57B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 23:53:48 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 10so9479914pfo.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 16:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iCjFGRPbrTYjPQS4oXdKrAyiyeSan9ybvTxFJzx9igs=;
	b=TDg7PC9ZRXdOqBFGlABAyid7njIn0pKvVEzWa4/CqU7/eYp5hejPS+q9Ua5TQTKB70
	m6His0IIvnYLQSs4Y1pCKPy2UrY6HItCeGoUtyywAOGN0nIxZkypyzDPqJoh4V5GUOPR
	APsUczAstdvLPePvISWNPlytGENqhJTEuBCdkwFM5SIzyHoHj1wASc0bkhmqSpNOxk/h
	/v+G90e1A6UH5gEKbzmV3PWQheRkVhy6NLKJQa+0Nt24NEEsuzc09/BrYXO3GOJ+6Usz
	LhPP/eHR8jxiuYt07S/ATGjn9JVn0toKAk6b6HicfJn2bXgHuVdhhgEGRoD0YoWyq/ur
	p0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iCjFGRPbrTYjPQS4oXdKrAyiyeSan9ybvTxFJzx9igs=;
	b=Kh2DWAHZhMTvuiWFU76JMwm1xoVQc4CWRRpULpOtQe8vdkuBYfqIX0otCeeS2DVAnp
	UyPwg6U0KuTxpCujcaBzxHHMM+nlokFXpi1tJ4i4eMSzXVPLb4EgrR0FJHU9yj9re+Eh
	cJAyfpOBgMQxTNNlIkdfl1bVJUo121AWGLBBMKLiMK+D6EfXhUWS764htkqJoQyfL+JU
	jgL3P8p9TqlxQtC4vxTrOekJnozS8xlxD3IhLYUujmi7oehAHBTW5IIJfbwQLG7mHWYG
	NIL1Jym8DWVSdS/1nfyrWqcwN3yBezsUL3h7aMGQ7xjeflKgu9PkRUGPD5AMd2r5Rs0q
	UTVg==
X-Gm-Message-State: APjAAAVVkwXBn/aWMgkR1PgqtRDC2vzqOLtR4e/bYjCNwvMPlDwi6c+i
	fGx+ND00jCSWOAWfJfKaAy7zwt2QzkY=
X-Google-Smtp-Source: APXvYqxvGNW5/SjPu2zC2/XwVxrBUJj/pvairERRz/bJU/IByTxjg7Ii5C0ysid93Rq6Udt7tlB50w==
X-Received: by 2002:a62:87c6:: with SMTP id i189mr21775899pfe.65.1557273227908;
	Tue, 07 May 2019 16:53:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::592a])
	by smtp.gmail.com with ESMTPSA id
	o6sm29118021pfh.97.2019.05.07.16.53.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 16:53:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 16:53:39 -0700
Message-Id: <20190507235339.19123-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] systemd: Backport patch to fix build with gcc9
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
X-List-Received-Date: Tue, 07 May 2019 23:53:48 -0000
Content-Transfer-Encoding: 8bit

Do not disable the warning as error for overflow, which was a workaround
until the real fix came in.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...remove-redunant-link-name-in-message.patch | 41 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_242.bb      |  3 +-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0006-network-remove-redunant-link-name-in-message.patch

diff --git a/meta/recipes-core/systemd/systemd/0006-network-remove-redunant-link-name-in-message.patch b/meta/recipes-core/systemd/systemd/0006-network-remove-redunant-link-name-in-message.patch
new file mode 100644
index 0000000000..33f482ae9b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0006-network-remove-redunant-link-name-in-message.patch
@@ -0,0 +1,41 @@
+From 9e6940858c7dbdd56b297bdf49f58d623e3430b7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 7 May 2019 13:46:55 +0200
+Subject: [PATCH] network: remove redunant link name in message
+
+Fixes #12454.
+
+gcc was complaining that the link->ifname argument is NULL. Adding
+assert(link->ifname) right before the call has no effect. It seems that
+gcc is confused by the fact that log_link_warning_errno() internally
+calls log_object(), with link->ifname passed as the object. log_object()
+is also a macro and is does a check whether the passed object is NULL.
+So we have a check if something is NULL right next an unconditional use
+of it where it cannot be NULL. I think it's a bug in gcc.
+
+Anyway, we don't need to use link->ifname here. log_object() already prepends
+the object name to the message.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: backport [https://github.com/systemd/systemd/commit/c98b3545008d8e984ab456dcf79787418fcbfe13]
+---
+ src/network/networkd-link.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index 3e334c8d29..a158c01bbd 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -321,8 +321,7 @@ static int link_enable_ipv6(Link *link) {
+ 
+         r = sysctl_write_ip_property_boolean(AF_INET6, link->ifname, "disable_ipv6", disabled);
+         if (r < 0)
+-                log_link_warning_errno(link, r, "Cannot %s IPv6 for interface %s: %m",
+-                                       enable_disable(!disabled), link->ifname);
++                log_link_warning_errno(link, r, "Cannot %s IPv6: %m", enable_disable(!disabled));
+         else
+                 log_link_info(link, "IPv6 successfully %sd", enable_disable(!disabled));
+ 
+-- 
+2.21.0
+
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 69b1f7ed0e..3012f20b11 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0004-rules-whitelist-hd-devices.patch \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
+           file://0006-network-remove-redunant-link-name-in-message.patch \
            file://99-default.preset \
            "
 
@@ -204,8 +205,6 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
                   -Dsulogin-path=${base_sbindir}/sulogin \
                   -Dumount-path=${base_bindir}/umount"
 
-CFLAGS += "-Wno-error=format-overflow"
-
 do_install() {
 	meson_do_install
 	install -d ${D}/${base_sbindir}
-- 
2.21.0


