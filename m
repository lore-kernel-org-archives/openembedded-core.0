Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rzysw-00055Y-PX
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 00:12:38 +0100
Received: by eaal10 with SMTP id l10so2376395eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 15:04:19 -0800 (PST)
Received-SPF: pass (google.com: domain of andrei@gherzan.ro designates
	10.213.13.13 as permitted sender) client-ip=10.213.13.13; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrei@gherzan.ro
	designates 10.213.13.13 as permitted sender)
	smtp.mail=andrei@gherzan.ro
Received: from mr.google.com ([10.213.13.13])
	by 10.213.13.13 with SMTP id z13mr4111393ebz.146.1329865459600
	(num_hops = 1); Tue, 21 Feb 2012 15:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=DpOLtS1RtWsstmGSkQJhDqa8EcDY7QcSaGBEmCG7KIM=;
	b=Aay84iqg0AAwLlO22KOGdyCWsZ5Omra9FHRtO1ykMv3Z8T75fkRokTD3w5tT9eVGDD
	Y7IqqmJSqdKg/WHU8gO6QjH/yWUHMVEpopFEowUHzvsNMRdDZ29ezSS5WBHMYKaXBxAA
	Ku8nySNNvSvX+2A9nrezu7pOicx/M59pjZVEk=
MIME-Version: 1.0
Received: by 10.213.13.13 with SMTP id z13mr3261452ebz.146.1329865458558;
	Tue, 21 Feb 2012 15:04:18 -0800 (PST)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id o49sm95287997eeb.7.2012.02.21.15.04.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 15:04:18 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 01:03:55 +0200
Message-Id: <1329865435-5734-2-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1329865435-5734-1-git-send-email-andrei@gherzan.ro>
References: <1329865435-5734-1-git-send-email-andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQllpuw27cK5g3YcLyLnwOuxGydvOjt7lXNr0uhXiFGvxSNdpybxWlXRRH9oN85zmPlDEKJ1
Subject: [PATCH v2 1/1] openssl: Move libcrypto to base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2012 23:12:38 -0000

This fix is for dhclient. It needs libcrypto at runtime and if
libcrypto is in libdir, it's path can be inaccessible on systems
where /usr is on nfs for example or dhclient is needed before
/usr is mounted.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-connectivity/openssl/openssl.inc      |   10 +++++++++-
 .../recipes-connectivity/openssl/openssl_1.0.0g.bb |    2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 771f146..eb6c5ea 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -36,10 +36,11 @@ export AS = "${CC} -c"
 inherit pkgconfig siteinfo
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc"
-FILES_libcrypto = "${libdir}/libcrypto.so.*"
+FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl.so.*"
 FILES_${PN} =+ " ${libdir}/ssl/*"
 FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
+FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
 
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
@@ -132,6 +133,13 @@ do_install () {
 	oe_libinstall -so libcrypto ${D}${libdir}
 	oe_libinstall -so libssl ${D}${libdir}
 
+	# Moving libcrypto to /usr
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+		mkdir -p ${D}/${base_libdir}/
+		mv ${D}${libdir}/libcrypto* ${D}${base_libdir}/
+		sed -i s#libdir=\$\{exec_prefix\}\/lib#libdir=${base_libdir}# ${D}/${libdir}/pkgconfig/libcrypto.pc
+	fi
+
 	install -d ${D}${includedir}
 	cp --dereference -R include/openssl ${D}${includedir}
 	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
index 80dfcb3..8ffe931 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-- 
1.7.5.4



