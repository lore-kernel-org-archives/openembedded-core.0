Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U4w8B-0004oZ-V2
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 17:21:24 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so3327066wib.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 08:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=s5yk4WSeSUvejO+meZl7FQsg7nxivhCkGR48PDAdjno=;
	b=dC+21asSV23Lq0d35Vi6j7UhB5E0KEXhujzwjwVC81xBKWCCq+8CvSg9v8ASmo4Q8u
	IkYD/W0w1MYy0HGHAia37kr+RnzmznLOBGfZieoIIznVJn/ESXcvf/VZim3HGuKxAP9y
	gTYfh2/wI0apMMx11tZ0w1wQDn2kGRKLKY7VFDUDSFo9uB98JDF+GjRaXHKR6V8aVj2x
	exDp7Pnrp8rwhEdw4MO6RAiQVrl63edrRVWox/uZJC3JjwVfE179zyz9SbvWi1rhUBTI
	8xnhcBB1N0JG+JE7qY8HDTrdVGg94GdUTcTj5d+vISaBQ1nBLMvJcouGz6XOKH18bfIE
	+ZUw==
X-Received: by 10.180.79.65 with SMTP id h1mr17212660wix.15.1360598725588;
	Mon, 11 Feb 2013 08:05:25 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q13sm32487856wie.0.2013.02.11.08.05.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 08:05:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 16:03:10 +0000
Message-Id: <123eb7971da069cbee5729fa368c6c9d8c0f1401.1360598515.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360598515.git.ross.burton@intel.com>
References: <cover.1360598515.git.ross.burton@intel.com>
In-Reply-To: <cover.1360598515.git.ross.burton@intel.com>
References: <cover.1360598515.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmzl5pRbJ0KsNC4abN4VoUylNeaQQJ5WewsdhqYtGRnY1lS/W868yvPluoONqwLS6Un6kVU
Subject: [PATCH 2/3] fontconfig: drop explicit -native recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2013 16:21:24 -0000

Instead, use BBCLASSEXTEND=native in fontconfig.

We can drop the installation of fc-lang/fc-glyphname, they are not used by
fontconfig's build anymore as it ships the generated files in the tarball.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../fontconfig/fontconfig-native_2.10.2.bb               |   14 --------------
 meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb    |    2 ++
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig-native_2.10.2.bb

diff --git a/meta/recipes-graphics/fontconfig/fontconfig-native_2.10.2.bb b/meta/recipes-graphics/fontconfig/fontconfig-native_2.10.2.bb
deleted file mode 100644
index cee94de..0000000
--- a/meta/recipes-graphics/fontconfig/fontconfig-native_2.10.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require fontconfig_${PV}.bb
-inherit native
-DEPENDS = "freetype-native expat-native zlib-native"
-
-EXTRA_OEMAKE = ""
-EXTRA_OECONF = "${@[' --disable-docs',' --disable-docs --with-freetype-config=%s/freetype-config' % d.getVar('STAGING_BINDIR', True)][os.path.isfile('%s/freetype-config' % d.getVar('STAGING_BINDIR', True))]}"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}-${PV}:"
-
-do_install_append () {
-	install -d ${D}${bindir}/
-	install fc-lang/fc-lang ${D}${bindir}/
-	install fc-glyphname/fc-glyphname ${D}${bindir}/
-}
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb
index 6f2456d..45631ed 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb
@@ -42,3 +42,5 @@ DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts"
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4



