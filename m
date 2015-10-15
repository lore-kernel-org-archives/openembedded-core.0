Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id A2DF7770C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:43:47 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so70667475pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cUKTQAQfg+SzlNxXYllKMn34lQprbIKWqGiaGhhhinA=;
	b=bZ23fZHoPAVKJlVyCjsEaQ44ZCiMRGjHdtyklhWpt6uytKlcTdtgusKY4PlHHUk5KL
	Fvs3ICbznnRKMPh0dxSi4PMuhZmAVUVWKUrGhujhW/1iy8yM6arQDiJSb8SKit11s7Js
	ch6czV4wXgCLc5fYFlBvE5KvjJGb33ysETJCnDJ64b9kOfwZqCqpm7AqXN5de4zHeAC0
	JlEs20AyYPOxesjbrp0m6+UE4qAriJaXN1+J+Wnq9GvN7Sbb1iFvLoZYij9247OLo+z0
	sfYsXooEpH3ypTbPGB7PlaOlCQqhQ+HEKrs1ui54MqRdOYHnKoEEqT9rS/el8Qz80Dvt
	8EEQ==
X-Received: by 10.68.137.3 with SMTP id qe3mr7213462pbb.26.1444873427541;
	Wed, 14 Oct 2015 18:43:47 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:43:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:15 -0700
Message-Id: <1444873403-21093-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
References: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 03/11] busybox: move common EXTRA_OEMAKE options into busybox.inc
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
X-List-Received-Date: Thu, 15 Oct 2015 01:43:47 -0000

Current EXTRA_OEMAKE options are common to all supported versions of
busybox (1.23.2 and git), so move from version specific recipes into
busybox.inc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       | 1 +
 meta/recipes-core/busybox/busybox_1.23.2.bb | 2 --
 meta/recipes-core/busybox/busybox_git.bb    | 2 --
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 235bda2..949047b 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -19,6 +19,7 @@ export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
 EXTRA_OEMAKE += "'LD=${CCLD}'"
+EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 2559823..554c816 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -44,8 +44,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
 SRC_URI[tarball.sha256sum] = "05a6f9e21aad8c098e388ae77de7b2361941afa7157ef74216703395b14e319a"
 
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-
 do_install_ptest () {
         cp -r ${B}/testsuite ${D}${PTEST_PATH}/
         cp ${B}/.config      ${D}${PTEST_PATH}/
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ed1c0a8..17de8ac 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -44,8 +44,6 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://getopts.cfg \
 "
 
-EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-
 do_install_ptest () {
         cp -r ${B}/testsuite ${D}${PTEST_PATH}/
         cp ${B}/.config      ${D}${PTEST_PATH}/
-- 
1.9.1


