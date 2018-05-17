Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7176B74835
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 08:52:36 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id b18-v6so7545193lfa.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 01:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lu8pkqBXg6OldjI/GN2i3eAgr9j4bx9LxyPC5bLwXqE=;
	b=gzYn9CgEp27v+qb0MVNiaXyLiS6YeVt7jfnm9Pw+PLrovbwhQWise44VojBu4N1uX/
	mEBcdPr/FmiGIMvLMRdl2oKDB9o3L/IPOwtlNf/QXc3TnIrgEGH9N21zjiMVHoL/CUj6
	30N0bAeMD+cyZNfe4hi+3ye1EU4Uh5eYv96EbwBrMvy2eOysVvVshzT2nd9sZ6tAgunl
	t9lCoBh8NIw7agWvYvfiuRBmKZKlYuY98F0St1oddKrhA1r5u5U2MYao4qeYSQ3DaL7x
	ejtvER0rjZdSBN5wvAUd3CpJiogUAiBUk+XXDOYuQMaAHQ90j4wjCeNUopNpLien2IbR
	RVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lu8pkqBXg6OldjI/GN2i3eAgr9j4bx9LxyPC5bLwXqE=;
	b=QAbfZVUJO7lE1Ug9dq+v3YqxqmdMeqnjpO8hlkbCEt88R+XcOpzUSF/10BFOy14H3K
	h2kiF3nh2etsxF+EjB1U6zlPB7zb8+ffemWdinNREuupmebXR81y8qUlL39qS17ALSVT
	cAG7O4f6BPi21c+PrCEXpyD5ivOuyKpHySEazLEHwqFnKFkILNPEKW+Oili70ZcZBzb6
	80VTrZu4KcnLepoYSHcyISbXehk+7UVSzYIP/+H03wb+XFv7IkuJm3VxWt/hONl+zZo1
	wkxjyao0LBCfOj9hLbm12DwpNN8/Oj1afbdK2aBMOVpX8pPeq/2CnT8KczqzQvbvmgl/
	t9Cg==
X-Gm-Message-State: ALKqPweTye7Gf/UnuJA6F8WRHq5xcNOpiXOItqrbZJTBX/I2k4ZpEgsk
	U5K77Smr3FtM8x1VtQdP36gYnW/s
X-Google-Smtp-Source: AB8JxZpxteuxUOdcu2TDE0xgFykD/wsFv3D6lE5oRRwUEdJyQ0xI/5/B0oQSKhVLK+nFDjS9fQkYtw==
X-Received: by 2002:a2e:9949:: with SMTP id r9-v6mr1532279ljj.53.1526547156516;
	Thu, 17 May 2018 01:52:36 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	v3-v6sm1111664lfd.18.2018.05.17.01.52.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 01:52:35 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 10:52:32 +0200
Message-Id: <20180517085232.28498-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] apt: Port apt-file to busybox readlink
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
X-List-Received-Date: Thu, 17 May 2018 08:52:36 -0000

Redlink from busybox and coreutils behave differently on missing files.
This leads to apt-key miss-behaving and also segure apt-get

root@qt5122:~# apt-key exportall
touch: : No such file or directory

W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://release.qtec.com:5022/qtec/europa/deb/qt5122 ./ Release: At least one invalid signature was encountered.
---
 meta/recipes-devtools/apt/apt.inc             |  1 +
 ...t-Fix-apt-file-with-busybox-readlink.patch | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index f1cde3068d..995bfc45ee 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -13,6 +13,7 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.
            file://disable-test.patch \
            file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
            file://0001-apt-1.2.12-Fix-musl-build.patch \
+           file://0001-apt-Fix-apt-file-with-busybox-readlink.patch \
            "
 SRC_URI[md5sum] = "ce8f9ab11f4fd0a08ec73eaffd75c8f0"
 SRC_URI[sha256sum] = "fa1311a9ce00e72379a0a3bc6d240ba30c0968cfbbb3472859e50b99e24e9598"
diff --git a/meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch b/meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch
new file mode 100644
index 0000000000..684e3b1626
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch
@@ -0,0 +1,41 @@
+From 3e0804f7882088186f47ff3c3c9e60998a1d93a0 Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Thu, 17 May 2018 10:42:44 +0200
+Subject: [PATCH] apt: Fix apt-file with busybox readlink
+
+Busybox readlink behaves diferently that coreutils readlink:
+
+root@qt5122:~# touch /tmp/this_file_exist
+root@qt5122:~# busybox readlink -f /tmp/this_file_exist
+/tmp/this_file_exist
+root@qt5122:~# readlink -f /tmp/this_file_exist
+/tmp/this_file_exist
+
+root@qt5122:~# readlink -f /tmp/this_file_does_not_exist
+/tmp/this_file_does_not_exist
+root@qt5122:~# busybox readlink -f /tmp/this_file_does_not_exist
+root@qt5122:~#
+
+This patch make apt-file compatible with busybox readlink
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+---
+ cmdline/apt-key.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cmdline/apt-key.in b/cmdline/apt-key.in
+index eab5805..421c981 100644
+--- a/cmdline/apt-key.in
++++ b/cmdline/apt-key.in
+@@ -313,6 +313,7 @@ merge_all_trusted_keyrings_into_pubring() {
+     # does the same as:
+     # foreach_keyring_do 'import_keys_from_keyring' "${GPGHOMEDIR}/pubring.gpg"
+     # but without using gpg, just cat and find
++    touch "${GPGHOMEDIR}/pubring.gpg"
+     local PUBRING="$(readlink -f "${GPGHOMEDIR}/pubring.gpg")"
+     rm -f "$PUBRING"
+     touch "$PUBRING"
+-- 
+2.17.0
+
-- 
2.17.0


