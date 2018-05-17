Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 850167480F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 08:57:06 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id y72-v6so7605145lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jspwMnpF1LBP2sGsl0fAt3Kf97UahIUxQQAjfjZb9kI=;
	b=X3Za4Ozrr/KnCM++Mi2fmTOExgXOHVnnZoB7DDUdqxRa9gnaU9/tbgpwnfvbpTaHUb
	wJi2z0/XKgM0cok4NUV1ry+BhdZtte9jAmAM4g2ZrrsLG2pC7M8MQ8De+TEEdpPpNiPN
	cfzfoHhTjp7b1dWDZ88IT2WWzffnh1509fZBp6nbH4/VzRpXmgKOlOqeLYjeN3jlzY86
	XbQq7LVvF1WyFXZMEgBxLRcyUqQrXGi7v3ulqInZu+GClgJf8k6G9xgadDNWwq6we21O
	QhfZ11JTB8vBe/kV6/9GsZBWxdY9okitdApN7Wg79c4axFTbLlS/5WPLg3igHxVxSpG3
	Fp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jspwMnpF1LBP2sGsl0fAt3Kf97UahIUxQQAjfjZb9kI=;
	b=gqdjroOWuFW9aoHjoF3XCD20XvzkOoChcooSpobtKOuRozHILjRSBfwSIT70SXryvi
	dQ9OtExyPYce1eQy0t8gMooJCqF52xeWNTUKsjOuBbTS/y5V+Z8DXosvCwm+bOmjdh5Q
	e5fNmwtXCI/n5p0OZRf3wHpdk1+D3PWjyowpyOUGpZozt0PRHhBWnA15liLxUAgCGW1v
	wP+XHCwRuyFPTf9wnuxbQvawoJ7OKIWGsfgO9xVgD7shsO/67v+iuHX2mEbHIIBXU54V
	/Bhl7nvkiFo0YRQTz9UO65wvPv5umo3bthl9uaYGxZYP3S1V1fSvKyGMUl9VLR32iJhU
	LVTg==
X-Gm-Message-State: ALKqPwds2cEXk2Bsy41uB0KfBZprpY3QNOdiCve2/cDdyRyV9GYyk/v4
	tzYtHSqB8KyJv5DMpL9+gQF30k1o
X-Google-Smtp-Source: AB8JxZry2M3YWCl0O49IH8MD4wkmSgchh0n7dWYQb53alh7SgpT4p4ubkeJPUHGunRVSL9sQLGe30g==
X-Received: by 2002:a2e:85d4:: with SMTP id
	h20-v6mr2523347ljj.82.1526547426526; 
	Thu, 17 May 2018 01:57:06 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z24-v6sm1099395lfg.56.2018.05.17.01.57.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 01:57:05 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	anibal.limon@linux.intel.com
Date: Thu, 17 May 2018 10:57:04 +0200
Message-Id: <20180517085704.28799-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH v2] apt: Port apt-file to busybox readlink
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
X-List-Received-Date: Thu, 17 May 2018 08:57:07 -0000

Redlink from busybox and coreutils behave differently on missing files.
This leads to apt-key miss-behaving and also segure apt-get

root@qt5122:~# apt-key exportall
touch: : No such file or directory

W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://release.qtec.com:5022/qtec/europa/deb/qt5122 ./ Release: At least one invalid signature was encountered.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
v2: Add missing signed-off-by

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


