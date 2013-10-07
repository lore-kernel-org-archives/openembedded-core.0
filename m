Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5D35060FAF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 17:49:18 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hj3so5724143wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 10:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/PNizUj10l7bbFv/YxBmmaeo9jTyzqY2xwfxN8bxcRc=;
	b=XAHwiA5VusWo0Vyr4H2/ZP6Tw97YESJOcSjlx3VSIsJA/xSfh9jJifT2fgjRr0uVYg
	M/OmXa+1dGDp+k7yG7nKg4eAzUlCbuEkHoTE4k25G/yzbddpu+eF586Jo3y1OEvufInY
	MmW+r53mUmSmXlv3FKWmjG2Ri59mUSvc8s5WAO4p6GNPdkBQGuZzVcBqRiUkZ2wFIJqo
	Y1yzJIF4RpK1k93f7Fe+mcC/Za/VV+C/b0jM/0eEdt0UVH5SwaIsQVt5U88n2SCX0i/M
	Y7g8Uy/1bXICJr8iIVdX51twSwfulIqfltymCbwoKxcrSOdvT2Ve0GFpOZ4Z5l9PGD01
	dFjw==
X-Gm-Message-State: ALoCoQm/CT6zI5LK6mhLw2u9fquFLcAqBnksvTDtmIWd6oqd4Yvoe4sHFUBEjqxpeAVXEvhreLiP
X-Received: by 10.195.13.164 with SMTP id ez4mr25899262wjd.11.1381168159703;
	Mon, 07 Oct 2013 10:49:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jf2sm41481831wic.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 10:49:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2013 18:49:09 +0100
Message-Id: <1381168150-25518-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
References: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/5] at-spi2-core: upgrade to 2.10.0.
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
X-List-Received-Date: Mon, 07 Oct 2013 17:49:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/at-spi2-core_2.10.0.bb |   17 +++++++++++++++++
 meta/recipes-support/atk/at-spi2-core_2.8.0.bb  |   17 -----------------
 2 files changed, 17 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-support/atk/at-spi2-core_2.10.0.bb
 delete mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb

diff --git a/meta/recipes-support/atk/at-spi2-core_2.10.0.bb b/meta/recipes-support/atk/at-spi2-core_2.10.0.bb
new file mode 100644
index 0000000..a6ff734
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-core_2.10.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "bb3b6f5679ecfc7dabcf76a1b6bfe2db"
+SRC_URI[sha256sum] = "964155c7574220a00e11e1c0d91f2d3017ed603920eb1333ff9cbdb6a22744db"
+
+DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
+
+inherit autotools gtk-doc
+
+EXTRA_OECONF = "--disable-introspection --disable-xevie"
+
+FILES_${PN} += "${datadir}/dbus-1/services/*.service"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
deleted file mode 100644
index 8403d65..0000000
--- a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
-
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "93b57d5d56d15d1222ddf2386e2f869f"
-SRC_URI[sha256sum] = "1861a30fc7f583d5a567a0ba547db67ce9bd294f0d1c9f7403c96a10a481c458"
-
-DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
-
-inherit autotools gtk-doc
-
-EXTRA_OECONF = "--disable-introspection --disable-xevie"
-
-FILES_${PN} += "${datadir}/dbus-1/services/*.service"
-- 
1.7.10.4


