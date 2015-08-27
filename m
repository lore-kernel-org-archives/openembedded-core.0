Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1A68176536
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 18:47:38 +0000 (UTC)
Received: by wicgk12 with SMTP id gk12so835262wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZsYbe0/ZlcuiCnbfHgIpmZp+9zoSutbc//LcoBpTe3Y=;
	b=pZ8zwXfkJrcw9UuVpOfXZUlo6vfOZ+NMc0Xxqepd3CQvcZXSGpl8gRKUCkBhbCq5na
	IZexDQyChENR42XzuRYEGMZUI+uob8XaxZ0fW4czTpY1OE8wPvdHgds5OQQiaUlEPvoe
	GGP7tPhYsCWo66nxhuwYNrNdqWuySIeTqJAZWdwIx/gH7dH/DDkGuULu1KMK/9jbeQc2
	Ug26ObdBSDe3KrBAjD1Uaxb3DZjjF23pwognd94NRnCDGuS7Ous7RdZri9y6vLTAb7yP
	lomnZQ+T4oqEQU5f5vUBMNJpgWKoyt0/M0nRI+wkTpnG8y0vm0MZAZiavMqila8Sp8wK
	wY6g==
X-Received: by 10.194.83.101 with SMTP id p5mr61363wjy.19.1440701258468;
	Thu, 27 Aug 2015 11:47:38 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ul1sm4326362wjc.30.2015.08.27.11.47.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 11:47:36 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 11:48:24 -0700
Message-Id: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1440700983.git.chris_larson@mentor.com>
References: <cover.1440700983.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/5] iw: add recipe from meta-networking
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
X-List-Received-Date: Thu, 27 Aug 2015 18:47:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

iw uses cfg80211/nl80211, which is the way of the future. wireless-tools uses
WEXT, which uses ioctl, which is in deep maintenance mode. See
http://wireless.kernel.org/en/developers/Documentation/Wireless-Extensions.
Also https://wireless.wiki.kernel.org/en/users/Documentation/iw indicates "The
old tool iwconfing, which uses Wireless Extensions interface, is deprecated
and it's strongly recommended to switch to iw and nl80211."

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 ....sh-don-t-use-git-describe-for-versioning.patch | 43 ++++++++++++++++++++++
 meta/recipes-connectivity/iw/iw_4.1.bb             | 23 ++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
 create mode 100644 meta/recipes-connectivity/iw/iw_4.1.bb

diff --git a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
new file mode 100644
index 0000000..e64dd0a
--- /dev/null
+++ b/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
@@ -0,0 +1,43 @@
+From 5310abba864cfe3a8b65af130729447604190b29 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 29 Nov 2011 17:03:27 +0100
+Subject: [PATCH] iw: version.sh: don't use git describe for versioning
+
+It will detect top-level git repositories like the Angstrom setup-scripts and break.
+
+Upstream-Status: Unknown
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ version.sh | 16 +---------------
+ 1 file changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/version.sh b/version.sh
+index 11d124b..5d423c4 100755
+--- a/version.sh
++++ b/version.sh
+@@ -3,21 +3,7 @@
+ VERSION="3.15"
+ OUT="$1"
+ 
+-if [ -d .git ] && head=`git rev-parse --verify HEAD 2>/dev/null`; then
+-	git update-index --refresh --unmerged > /dev/null
+-	descr=$(git describe)
+-
+-	# on git builds check that the version number above
+-	# is correct...
+-	[ "${descr%%-*}" = "v$VERSION" ] || exit 2
+-
+-	v="${descr#v}"
+-	if git diff-index --name-only HEAD | read dummy ; then
+-		v="$v"-dirty
+-	fi
+-else
+-	v="$VERSION"
+-fi
++v="$VERSION"
+ 
+ echo '#include "iw.h"' > "$OUT"
+ echo "const char iw_version[] = \"$v\";" >> "$OUT"
+-- 
+1.7.7.3
diff --git a/meta/recipes-connectivity/iw/iw_4.1.bb b/meta/recipes-connectivity/iw/iw_4.1.bb
new file mode 100644
index 0000000..e1e7c12e
--- /dev/null
+++ b/meta/recipes-connectivity/iw/iw_4.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "nl80211 based CLI configuration utility for wireless devices"
+DESCRIPTION = "iw is a new nl80211 based CLI configuration utility for \
+wireless devices. It supports almost all new drivers that have been added \
+to the kernel recently. "
+HOMEPAGE = "http://wireless.kernel.org/en/users/Documentation/iw"
+SECTION = "base"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
+
+DEPENDS = "libnl pkgconfig"
+
+SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
+           file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
+"
+
+SRC_URI[md5sum] = "68c282285c71c956069957e9ca10a6a7"
+SRC_URI[sha256sum] = "14bfc627b37f7f607e4ffa63a70ded15fa2ea85177f703cb17d7fe36f9c8f33d"
+
+EXTRA_OEMAKE = ""
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
-- 
2.2.1


