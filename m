Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B11D16B12B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 07:28:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r11-v6so2314756wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 23:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6rpMrfktfGiKSds9g9MZty7uZv9e5qMTnzts+K+ZSnM=;
	b=qkfuXUga82rwnMBrqrrP/ucWQZYjRENFAbU4wi0tjKCOaTTHOO4hhi8aqHPIAzemIT
	1Uev5UperJjzORXiYsEsO7xuFpV2RgdZk+R3lRy63jEp+brZY7zFBZZ9Cv8FU9WooUQH
	ne9Wt5+E8XMqARra3FAqzkSKJm4yySw25mV2s5wJxUSnvCT8LB6VHreYh3UPupJ1rxSn
	235deIcVcg/JbYVVUoH3y1zk/nfRYcLtBczt6IFd+B5U+guCWkTs3QvFmwk+Rwq5PZuh
	NF34GdRIJQENph3kTsqle7wXc9CoWsxwlY4vv/9zO+E76GVoRjqs4oB0hkaPx4husaPL
	ahVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6rpMrfktfGiKSds9g9MZty7uZv9e5qMTnzts+K+ZSnM=;
	b=rk7p1VlEADThxVIIAU2FyMtmlWoB5XloVpFRyDVBa9pSKjRMsH6f5pIj1tXfkAWjcV
	la6tzVTsJDlhb2Xiq78fbaKZGqdxfOTddOau/K5AXH6g2QPJ/mCakkgXUk3lM3yC61mV
	9e3PsiCkrQD5YCQhOsfgJvrbkqaB8gTIcQe8/UoVSsu+p7IsXVU8FlJC3g0AgLh+qZSb
	NedMArHTCBiZCO6+c9XaocMnpWq51Wid1Lo0NUDIahTBvjGqS8KUxmII8DZDFFik0+1y
	zctfb/zGzPNm80sQHnSqx9n2URkJVRSyeqy+f582n0bioJpmW40YaVTgEup4g+2A9TzM
	j9BA==
X-Gm-Message-State: AGRZ1gKOtt2JKinaz1xLhoQup+lnLH0U6JTBM7D5DI/1EmRaKVDucpSQ
	YhcoBE9gXW/swIOx1vJ+qO1H4dLv
X-Google-Smtp-Source: AJdET5dRLnpSVEHnr91ubKuLW5xJslKaj7YsZ1/vDw10Z2K9331RnLFIB8hOM1rw3I74JV5GoKBM3g==
X-Received: by 2002:a1c:7ec9:: with SMTP id
	z192-v6mr3314079wmc.43.1542526110786; 
	Sat, 17 Nov 2018 23:28:30 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	k73sm2230441wmd.36.2018.11.17.23.28.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Nov 2018 23:28:30 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2018 07:28:20 +0000
Message-Id: <1542526100-28961-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] systemd: backport fix to stop enabling ECN
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
X-List-Received-Date: Sun, 18 Nov 2018 07:28:31 -0000

From upstream:

  Turning on ECN still causes slow or broken network on linux. Our tcp
  is not yet ready for wide spread use of ECN.

https://github.com/systemd/systemd/issues/9748

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
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


