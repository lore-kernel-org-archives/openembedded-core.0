Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CFAE76C2B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:59:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t3so1882281wrr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 04:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Xcw3S3mmMW5PnFh4wMdPQ4qgTg/KtORg8SbLyKNNyuA=;
	b=NUm7Ak5htEabauh4/V/NpY5wwteP5KwkszU5rDK7fQjHYCXkHMWiNC1z6FTeomfNRR
	I4bKz9zq9eEQn/YEPNxrtATozA7rt9BWnw3r3zRsCTSJ7EcIuC2YfAmEXRoHa7IYyhWc
	UXhib8M+5p/9W98zz1S/BKEWdXPNxSC4qsxzjVc3HVqugjRmpek6wSn07IjA5KfsLvS/
	fWQFTNO8i7XniY5VFQ3C5lrF4RbxPgjmeL7i6EA7zBIALANsJJv9QU20EOII5xWL0C9a
	GaAIj9hEqoj/UNj0G8C7vNBRbU4lqNBh9bVqR+Wqre8h+UpqfiqZRpsm40WVmIXxtQye
	vqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xcw3S3mmMW5PnFh4wMdPQ4qgTg/KtORg8SbLyKNNyuA=;
	b=rQ8o1SO8HvU6OwFwgYaHAFFIwae2LhQN11MPDHiTndx9Z/VIwazPdPRzdCgTWfa7qd
	uIPVJxyMpMzSp2F/c6qXibVMNM64zK+5s8/qxCTOXVc7csvEoMefLHWrrHG49crICMk/
	m0I6FnmNupOPFFl2aIx2FoZi8vHvXn4GhDoOjq9Nzy3Qag7TMl6SY1qddSb6xKJt5gHe
	AIgbMd81qClIIZYtuuIEuN4LV8PjujzFdVYUJLasK4gMlbVaX8vVnQ4hvDRdX54BgQFs
	rJa2Ysy+bwXkJtjk6hEsp5OiU+8u+qJcpXUIbMKheU2vzRlAa9rZMUODWqdl3yZUE6GR
	DKZw==
X-Gm-Message-State: AA+aEWbhdnS4tEZjMuO9AUA0Zlkl987vAXmIxSTfR+Tt/ta4+RC8QkkK
	AfXn3BtAlhAqXkK2N1paIR9KfjFQeD4=
X-Google-Smtp-Source: AFSGD/Uv/oLlfDsliqsx8N8UfZ8148w4I+ZCG5+KKE+lynPBEHzKNIsn68/z1TBuWxCa/u0WJq3dPQ==
X-Received: by 2002:adf:e64d:: with SMTP id b13mr1920665wrn.276.1542718767227; 
	Tue, 20 Nov 2018 04:59:27 -0800 (PST)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	h127sm23270728wmd.31.2018.11.20.04.59.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Nov 2018 04:59:26 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:59:11 +0000
Message-Id: <1542718751-21491-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH] systemd: backport fix to stop enabling ECN
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
X-List-Received-Date: Tue, 20 Nov 2018 12:59:27 -0000

From upstream:

  Turning on ECN still causes slow or broken network on linux. Our tcp
  is not yet ready for wide spread use of ECN.

https://github.com/systemd/systemd/issues/9748

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

 ...tl.d-request-ECN-on-both-in-and-outgoing-.patch | 36 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch b/meta/recipes-core/systemd/systemd/0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch
new file mode 100644
index 000000000000..7fd6d0188e90
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch
@@ -0,0 +1,36 @@
+From 1e190dfd5bb95036f937ef1dc46f43eb0a146612 Mon Sep 17 00:00:00 2001
+From: Thomas Hindoe Paaboel Andersen <phomes@gmail.com>
+Date: Fri, 17 Aug 2018 21:31:05 +0200
+Subject: [PATCH] Revert "sysctl.d: request ECN on both in and outgoing
+ connections"
+
+Turning on ECN still causes slow or broken network on linux. Our tcp
+is not yet ready for wide spread use of ECN.
+
+This reverts commit 919472741dba6ad0a3f6c2b76d390a02d0e2fdc3.
+
+https://github.com/systemd/systemd/issues/9748
+
+Upstream-Status: Backport
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ sysctl.d/50-default.conf | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/sysctl.d/50-default.conf b/sysctl.d/50-default.conf
+index b67ae87ca6b7..e263cf06284a 100644
+--- a/sysctl.d/50-default.conf
++++ b/sysctl.d/50-default.conf
+@@ -33,9 +33,6 @@ net.ipv4.conf.all.promote_secondaries = 1
+ # Fair Queue CoDel packet scheduler to fight bufferbloat
+ net.core.default_qdisc = fq_codel
+ 
+-# Request Explicit Congestion Notification (ECN) on both in and outgoing connections
+-net.ipv4.tcp_ecn = 1
+-
+ # Enable hard and soft link protection
+ fs.protected_hardlinks = 1
+ fs.protected_symlinks = 1
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 3dbeaac3427a..e19a8babced6 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-core-when-deserializing-state-always-use-read_line-L.patch \
            file://0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch \
            file://0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch \
+           file://0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.7.4


