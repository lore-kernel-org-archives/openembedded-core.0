Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id CC6E27728E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:41:45 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82484404pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DLyKKC23YlUaWUn7K2Mwhg3ZB2+wzqE9bs1EP/GdBU0=;
	b=QZevBwBT/QU9rikp2/fmssJCKg9iIxBiI8+WOKaV4Rfny6ychs8K6jJQbrPzxdmehQ
	Y8gQx22uivUlLZiH6rQ3SYk/IkddA4AQxbyYfhmbKqme3KVJhLGBbBAeK/rP2NtgtZgx
	uOyTce+e0fs8wutAZLPyhphGsNJ7K2Nf1epvy6aVTu56sAy7rCv/syqyonLP4ED6aV8t
	70Quc1XOhOCkRAJKIv7RLEVSszrDv4Z+QAGe765OQrzJkRxcWYGHXSe78OQPk9arJzmK
	o0ImP58IRp62A9UAuywWGR4s1XhuazhzslTUvQpmM7RaRwpJP3wa4hOliB2CQ+jjUMco
	/TRA==
X-Received: by 10.68.57.169 with SMTP id j9mr26779077pbq.2.1447371705921;
	Thu, 12 Nov 2015 15:41:45 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	it10sm16733638pbc.14.2015.11.12.15.41.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:41:44 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:41:29 -0700
Message-Id: <1cb0662447098b5f24ec3e02e471a3e288a69a04.1447371049.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
References: <130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371049.git.chris_larson@mentor.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] opkg-utils: add update-alternatives PACKAGECONFIG
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
X-List-Received-Date: Thu, 12 Nov 2015 23:41:45 -0000

From: Christopher Larson <chris_larson@mentor.com>

This lets someone use a different update-alternatives-native provider. Without
this available, they'll step on one another in the sysroot unconditionally,
since we need to build opkg-utils-native for ipk based builds regardless.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 5f518d2..b242d1f 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://code.google.com/p/opkg/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
-PROVIDES += "virtual/update-alternatives"
+PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtual/update-alternatives', '', d)}"
 
 SRCREV = "53274f087565fd45d8452c5367997ba6a682a37a"
 PV = "0.1.8+git${SRCPV}"
@@ -21,15 +21,21 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 PYTHONRDEPS = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
 PYTHONRDEPS_class-native = ""
 
-PACKAGECONFIG = "python"
+PACKAGECONFIG = "python update-alternatives"
 PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
+PACKAGECONFIG[update-alternatives] = ",,,"
 
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+	if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'true', 'false', d)}; then
+		rm -f "${D}${bindir}/update-alternatives"
+	fi
 }
 
 do_install_append_class-target() {
-	sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${libdir},g'
+	if [ -e "${D}${bindir}/update-alternatives" ]; then
+		sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${libdir},g'
+	fi
 }
 
 PACKAGES =+ "update-alternatives-opkg"
-- 
2.2.1


