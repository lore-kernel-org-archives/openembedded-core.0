Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Top49-00076S-38
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Dec 2012 06:34:38 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so5039175dak.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 21:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=pn0jBIC1kZdV8ZM8/kWw2RyWrUXwdbd9u2Q5b4dutho=;
	b=ruyXsMK68unoDUQsYMtsW/4m6O0eA9+gZuheSe6IIIrVujg7pdrjPdOhBOt4fYE6Sz
	SNOv/tKRHD5yQ5veUDzhE/KZkqCwGfkmdlmZlhWZm0tdYMNu/EgqC8LATHeBlqsCAf0Q
	0oqD89geNFx1FDYrxV/BJuGJ6adBEC+hEUBv6o0SSPeVa7xbc4Z6uc2nV1uF8S4TiUZU
	tlVjDd+eRdM0TRyBJ4ZVI6l69nNckdE3Gji1d3GwfrlJaqUpqlLxKnxZBh+IWpIhgCoc
	GytD3SV/TdvIgsY8aPVW29US73c3Jz0AkOgMhPS5iD6jR7XcqYYLH6OnFGqfQqQFSQF1
	60EA==
X-Received: by 10.68.212.106 with SMTP id nj10mr110601512pbc.101.1356758380089;
	Fri, 28 Dec 2012 21:19:40 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs3sm20848581pbc.61.2012.12.28.21.19.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Dec 2012 21:19:38 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 22:19:24 -0700
Message-Id: <c2dfb02a29338d1d5acf16185f882df8435cc9ac.1356758000.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/6] opkg-native: obey virtual/update-alternatives-native
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
X-List-Received-Date: Sat, 29 Dec 2012 05:34:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/opkg/opkg.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index f157188..47458ff 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/opkg-cl.c;beginline=1;endline=20;md5=321f658c3f6b6c832e25c8850b5dffba"
 
 PE = "1"
-INC_PR = "r11"
+INC_PR = "r12"
 
 # Werror gives all kinds bounds issuses with gcc 4.3.3
 do_configure_prepend() {
@@ -43,11 +43,17 @@ FILES_libopkg-dev = "${libdir}/*.la ${libdir}/*.so"
 FILES_libopkg-staticdev = "${libdir}/*.a"
 FILES_libopkg = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
 
-# We need to create the lock directory
 do_install_append() {
+	# We need to create the lock directory
 	install -d ${D}${localstatedir}/lib/opkg
 }
 
+do_install_append_class-native() {
+	if [ "${PREFERRED_PROVIDER_virtual/update-alternatives-native}" != "${PN}" ]; then
+		rm ${D}${bindir}/update-alternatives
+	fi
+}
+
 pkg_postinst_${PN} () {
 #!/bin/sh
 if [ "x$D" != "x" ]; then
-- 
1.8.0



