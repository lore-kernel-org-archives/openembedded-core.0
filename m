Return-Path: <zertsekel@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E743974E1A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Nov 2018 19:24:57 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p2-v6so6013296wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Nov 2018 11:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a12nS6DIrYZDBxIZ8SycHqkI5YVODGEz4HER5Iq5PFU=;
	b=TDluRgP7k3T9KYkHjvRh0QLpjQ4GDT6uZfT76Z+V3/BVWN1FaoK6RqJ9gPLAf2mB0d
	XNOgfUvDO4D1d61gZwuFBr58XrIvibEzuqEsG+PLI+pIUAy0SjyEs4ElUIteGbUTf9qY
	i0Jow52waUuxE8kt+U5ZmtwjveHCD5iXP31rCRqcGjftQVq2pT6oN0A+9OzNrz0Ey9uz
	2DKV0yq9zg72gFCukpVvHnPcP4yTk59kpVRJNe++O1ZWybywBqfWtrvAUnRm/J0RFC2W
	44UxMyk/OoN2V3PF6lM2fMZzYIQdmRtCLhkxorlgPsrfhyHeHrXWiukHfRRz2VNn9mk8
	Ij2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a12nS6DIrYZDBxIZ8SycHqkI5YVODGEz4HER5Iq5PFU=;
	b=FFg2me0dW/ftQb7OIKsbR+OjcDN4QawrgGWG8fzyspFw4XxjSgXOPkXSaGB46wizsS
	Bvj8glIfb9/1q1ziKiDN4OIqs98TztL27yRQkohtXKZEUDtNOT/1f20STZ3F3L/pKqcL
	dFRV7jczdG7Osn41kpfAI4MvOacHy3uzEmbB4usgnSWqqihLl+Rdx80ADZK+OcLu/j/G
	gBoB7qCq+cEhKjcrhWhlM+HjS8C9F3e+aB1wR1I+6ZuU5xtPJT5Txw3W9tlFwxeoMAEu
	venbobL0QIf1nRzPIkvmHrqABeKiPN4cEojk0KoQtsFx8IEChsbawc9CfbzgX3IGChP8
	ChEw==
X-Gm-Message-State: AGRZ1gKi1h/a3CrskxPeS2fVAIGIQToR4RI6yGkIwwjavsD8n2Ffhg71
	74a3A2SnXwtQU1Ld/n07//sc07or
X-Google-Smtp-Source: AJdET5dwNw+pVkUV/gnvqI49jTOpWZHPuDMR6tOBWRQDSa4VwkguSbhY2dLqckcp4A64sTTra45fKw==
X-Received: by 2002:a7b:c10e:: with SMTP id
	w14-v6mr3957063wmi.20.1541359497793; 
	Sun, 04 Nov 2018 11:24:57 -0800 (PST)
Received: from rnd-server1.yok.int.mrv.com
	(194-90-138-234.bb.netvision.net.il. [194.90.138.234])
	by smtp.gmail.com with ESMTPSA id
	q185-v6sm43937047wmg.45.2018.11.04.11.24.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Nov 2018 11:24:56 -0800 (PST)
From: Kosta Zertsekel <zertsekel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Nov 2018 21:24:46 +0200
Message-Id: <20181104192446.28224-1-zertsekel@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] Fix: chown: Use double colon for OWNER:GROUP
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
X-List-Received-Date: Sun, 04 Nov 2018 19:24:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rationale - excerp from `info chown`
====================================

OWNER‘:’GROUP
     If the OWNER is followed by a colon and a GROUP (a group name or
     numeric group ID), with no spaces between them, the group ownership
     of the files is changed as well (to GROUP).

   Some older scripts may still use ‘.’ in place of the ‘:’ separator.
POSIX 1003.1-2001 (*note Standards conformance::) does not require
support for that, but for backward compatibility GNU ‘chown’ supports
‘.’ so long as no ambiguity results.  New scripts should avoid the use
of ‘.’ because it is not portable, and because it has undesirable
results if the entire OWNER‘.’GROUP happens to identify a user whose
name contains ‘.’.

Signed-off-by: Kosta Zertsekel <zertsekel@gmail.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb    | 6 +++---
 .../initscripts/initscripts-1.0/populate-volatile.sh        | 4 ++--
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb              | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 6abab60d7f..f03ef969ad 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -79,7 +79,7 @@ fakeroot do_populate_poky_src () {
 	echo "# export ALL_PROXY=https://proxy.example.com:8080" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 	echo "# export ALL_PROXY=socks://socks.example.com:1080" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 
-	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/poky
+	chown -R builder:builder ${IMAGE_ROOTFS}/home/builder/poky
 	chmod -R ug+rw ${IMAGE_ROOTFS}/home/builder/poky
 
 	# Assume we will need CDROM to install guest additions
@@ -107,8 +107,8 @@ fakeroot do_populate_poky_src () {
 	   pip3_install_params="${pip3_install_params} --proxy ${http_proxy}"
 	fi
 	pip3 install ${pip3_install_params}
-	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/.local
-	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/.cache
+	chown -R builder:builder ${IMAGE_ROOTFS}/home/builder/.local
+	chown -R builder:builder ${IMAGE_ROOTFS}/home/builder/.cache
 }
 
 IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 824f8f3a6b..6f965a6870 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -37,7 +37,7 @@ create_file() {
 	}
 	EXEC="
 	${EXEC}
-	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
+	chown ${TUSER}:${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
@@ -60,7 +60,7 @@ create_file() {
 mk_dir() {
 	EXEC="
 	mkdir -p \"$1\";
-	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
+	chown ${TUSER}:${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index a21e7e46f7..bfc1283f73 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -105,6 +105,6 @@ do_install () {
 	install -d ${D}${sysconfdir}/default/volatiles
 	install -m 0644 ${WORKDIR}/01_bootlogd ${D}${sysconfdir}/default/volatiles
 
-	chown root.shutdown ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
+	chown root:shutdown ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 	chmod o-x,u+s ${D}${base_sbindir}/halt ${D}${base_sbindir}/shutdown
 }
-- 
2.17.1


