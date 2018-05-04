Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id DC25A6E688
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 22:53:00 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id n9-v6so16368789pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 15:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1QqPt1X50oTQfgduhGCWiGOUdfpw2nrO/UKqMKDYSYY=;
	b=MaPr1JleWIcMfVqdRW24CeJvFu8RsNF74BYcQdD4mQ+iXN2kK5ur7iO4J93nth34EE
	sIDWvjZCUNcT3WNj03SO1JFEiuAxMzaMnurFcHTYNOBN9ZJGB35+l01oJCv9kDHFfJN2
	SPAeFguWcpyy367Tzr2Hy1Yo9ezDn21KdZkkQg9sWTTGNr3U1J7bJOrGXV2Ma6vbZxc4
	QFXMXrnmQnPJGI/v+MUt4W8tB4jkhlkWAIpsYwQks7ScbbxkVcRtYiro8tSgzKkWWHS0
	u/KngWfiG103w68GgrQM06LZSXaKquFbjDWYoSlujjSsRlD5xsidQ6tJK4N3tzhaLidS
	pHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1QqPt1X50oTQfgduhGCWiGOUdfpw2nrO/UKqMKDYSYY=;
	b=e7t0RFXP4xooB/tW5sobQHwkS+6yk3JVMIcJUc43orOpXsxsa5B1N4xZ74/RXl9Ka5
	YX5+WS8iKo732r77Vp+UoUBOpT00JkaL61r+enIxzYwl7sMcOHVyAkwQI/ekNK/bWLrE
	wnpt/T/l8fOKjDC9L+t6kJUfuI4N3FwwGoN4y73fhf8HyYFT0QMgWItp4SM57hV/sJWp
	ibvSwt/GwWIa5F1GIpKraqWR3xoxCDz2gCrElVVtPj0uqlYewz9BcxoDri7t04FZnZ4Q
	AdtAnGnsZOOz1dqBM0XmGmFLjSFEfcNOfwzItIV/wtJKfXOHgpcLVjiT4oIiKV2g+geq
	gD2g==
X-Gm-Message-State: ALQs6tDL1yKNP8nAtfkxvbmctc416BEnDoQBwhcf2M/1D4zbMYyJGlKP
	NxlxXqJ8SE6vEam/dB8o2zf8vQ==
X-Google-Smtp-Source: AB8JxZqhj0xJ/OwkYov30xvQBnvMsiVg93zFPMSvZaqU/JItcA4XIKKyjB46PfgHf3hnPbiJkixU4A==
X-Received: by 2002:a17:902:b609:: with SMTP id
	b9-v6mr29013453pls.29.1525474381853; 
	Fri, 04 May 2018 15:53:01 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w26sm41378391pfi.17.2018.05.04.15.53.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 15:53:01 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:52:46 -0700
Message-Id: <1525474370-7913-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
References: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/8] distcc: move ASNEEDED over-ride into the distcc recipe
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
X-List-Received-Date: Fri, 04 May 2018 22:53:01 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Also misc minor recipe cleanup (re-order variables to follow the OE
style guide, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc     |  1 -
 meta/recipes-devtools/distcc/distcc_3.2.bb | 29 ++++++++++++++++++++---------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 91c0762..94f5b90 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -1,7 +1,6 @@
 
 ASNEEDED = "-Wl,--as-needed"
 
-ASNEEDED_pn-distcc = ""
 ASNEEDED_pn-openobex = ""
 ASNEEDED_pn-icu = ""
 ASNEEDED_pn-pciutils = ""
diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
index ff0e22f..9f752ed 100644
--- a/meta/recipes-devtools/distcc/distcc_3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
@@ -7,13 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "avahi binutils"
 
-PACKAGECONFIG ??= "popt"
-PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
-# use system popt by default
-PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
-
-RRECOMMENDS_${PN} = "avahi-daemon"
-
 SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
            file://separatebuilddir.patch \
            file://0001-zeroconf-Include-fcntl.h.patch \
@@ -21,12 +14,26 @@ SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
            file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
+
 SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
+
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
 
-EXTRA_OECONF += "--disable-Werror PYTHON='' --disable-pump-mode"
+PACKAGECONFIG ??= "popt"
+
+PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
+# use system popt by default
+PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
+
+EXTRA_OECONF += " \
+    --disable-pump-mode \
+    --disable-Werror \
+    PYTHON='' \
+"
+
+ASNEEDED = ""
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system \
@@ -50,18 +57,22 @@ do_install_append() {
     sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/distcc.service
     ${DESKTOPINSTALL}
 }
+
 DESKTOPINSTALL = ""
 DESKTOPINSTALL_libc-glibc () {
     install -d ${D}${datadir}/distcc/
     install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/distcc/
 }
+
 PACKAGES += "distcc-distmon-gnome"
 
 FILES_${PN} = " ${sysconfdir} \
 		${bindir}/distcc \
-    ${bindir}/lsdistcc \
+		${bindir}/lsdistcc \
 		${bindir}/distccd \
 		${bindir}/distccmon-text \
 		${systemd_unitdir}/system/distcc.service"
 FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
 				${datadir}/distcc"
+
+RRECOMMENDS_${PN} = "avahi-daemon"
-- 
1.9.1


