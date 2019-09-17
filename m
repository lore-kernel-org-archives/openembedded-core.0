Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3737F511
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 12:37:04 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v8so3015648wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0gICo9JykwGLf/2Qzb3Z7eWZuu6arILcSjOEIuWcrhE=;
	b=PH2LksB1b4R4Wn+fbvTMBkpnmy7Q0EMgI0p+hnCPx3xLzvh++w1mGXZxROU3GrC1AA
	yuvOqADB6OuCUZjBOII3JvNIiOJDmQWkLoipwS4NBWAxPn2CYzwxg0c9UJl5TyacwJd0
	YldYsTDlS5QcsZLnYdnfwibu6UrW8nmRWnxPVhESalRSSem/8hnQ99XytqvUdmnZBKZ0
	MAO2ELnjdKYSPi5LDJFqnecCRyaqr2wLQZ4IdDdmzJnS7f1i6Khm9IYS3fuXMti4w2y3
	q1KbOWavoT04z6BPqJptCngL3Y9Py4SbWm15NK2/wnPxD5zhxZT1KG8+2GW+KqUVcPUY
	EaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0gICo9JykwGLf/2Qzb3Z7eWZuu6arILcSjOEIuWcrhE=;
	b=OQwHKcPHfNcNQUdp86/WlL0ZBpTdBKQpC8FaO9V8QvBJ8PLX250r2Z/K6iA/MRENT3
	cy41KwfokoUyxJpnNQo3SlHEHgJOi7PJvWTZCUFoKn7w4cWSaEryqNBBldpaw+DocqA1
	nCSGNRVXLhin2S/TYLCqLosml0CxkVItFiynrdq2ZemkrVBMny7tUTNIw6ZXXQI+f/4G
	5DOs+XEbs6FUynC9KMkNwhd75Z13lBmEOoxHUBzpYqC8ECpgkmrr4TJAIxWX5O6f8fGC
	FATJD3N02esFypMSdUfbMlw87LR8F4iLNgYIcpItcPiaEbPnnYk0m9CfK+ILtAZ3PdlQ
	LXEA==
X-Gm-Message-State: APjAAAW7Zzmb40WtYJdvn5bwD7S9zRFsHKxgiDfk/KALknDUQkQGf1Zo
	/BBsu+nfMqUkRPMJFnY5xrw5LYlbxF4=
X-Google-Smtp-Source: APXvYqwpdpoBPOaFUt5fqNOxR6M4UnPp129CvPw3c7e+SomoEC/oR5LYTk44yfhDCowFHrcvPjdfPg==
X-Received: by 2002:a05:6000:82:: with SMTP id
	m2mr2954155wrx.241.1568723824887; 
	Tue, 17 Sep 2019 05:37:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l13sm2412994wmj.25.2019.09.17.05.37.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 05:37:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 13:36:55 +0100
Message-Id: <20190917123655.30315-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917123655.30315-1-ross.burton@intel.com>
References: <20190917123655.30315-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] distcc: split into client and server packages
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
X-List-Received-Date: Tue, 17 Sep 2019 12:37:04 -0000
Content-Transfer-Encoding: 8bit

Users of distcc are rarely both clients and servers, so split the package.
distcc is the client, the new distcc-server package is the server.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/distcc/distcc_3.3.3.bb | 21 +++++++-------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.3.3.bb b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
index d8ad498f2b4..509b74baab2 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
@@ -12,7 +12,7 @@ PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
 # use system popt by default
 PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
-RRECOMMENDS_${PN} = "avahi-daemon"
+RRECOMMENDS_${PN}-server = "avahi-daemon"
 
 SRC_URI = "git://github.com/distcc/distcc.git \
            file://fix-gnome.patch \
@@ -29,6 +29,8 @@ ASNEEDED = ""
 
 EXTRA_OECONF += "--disable-Werror PYTHON='' --disable-pump-mode"
 
+PACKAGE_BEFORE_PN = "${PN}-distmon-gnome ${PN}-server"
+
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system \
                        --home /dev/null \
@@ -38,8 +40,8 @@ USERADD_PARAM_${PN} = "--system \
 
 INITSCRIPT_NAME = "distcc"
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "distcc.service"
+SYSTEMD_PACKAGES = "${PN}-server"
+SYSTEMD_SERVICE_${PN}-server = "distcc.service"
 
 do_install() {
     # Improve reproducibility: compress w/o timestamps
@@ -53,17 +55,8 @@ do_install() {
     sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/distcc.service
 }
 
-PACKAGES += "distcc-distmon-gnome"
-
-FILES_${PN} = " ${sysconfdir} \
-		${bindir}/distcc \
-		${bindir}/lsdistcc \
-		${bindir}/distccd \
-		${bindir}/distccmon-text \
-		${sbindir}/update-distcc-symlinks \
-		${systemd_unitdir}/system/distcc.service"
-
-FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
+FILES_${PN}-server = "${bindir}/distccd ${sysconfdir} ${sbindir}"
+FILES_${PN}-distmon-gnome = "  ${bindir}/distccmon-gnome \
 				${datadir}/applications \
 				${datadir}/pixmaps"
 
-- 
2.20.1


