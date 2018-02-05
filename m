Return-Path: <prvs=5674cc8ee=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id EC5C078425
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 12:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=2399; q=dns/txt;
	s=ironport2; t=1517833554; x=1549369554;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=frH5K+ng4ChYAN0XkdDZV6eDZjf4mEzPaideUUPD8/Q=;
	b=s1/RWp94XEcnYolqQFjKezWrO0WnqWqpMZa15ApxfoM8x/fRNK9/p+JB
	DR1+yXwJ/pJutILsUjUssNpJ9EhR3BpfrMfztOCmFH/eDuB8vVCgNiNEk
	xSJeS5robStnQXuTeZyipPQYoGeZkmPxerWLuGZDGbQYPp94E5VCle9aN I=;
X-IronPort-AV: E=Sophos;i="5.46,464,1511823600"; 
   d="scan'208";a="3010609"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2018 13:25:52 +0100
Received: from mnhu.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.3.361.1; Mon, 5 Feb 2018 13:25:51
	+0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Feb 2018 13:25:44 +0100
Message-ID: <20180205122544.27223-2-mnhu@prevas.dk>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180205122544.27223-1-mnhu@prevas.dk>
References: <20180205122544.27223-1-mnhu@prevas.dk>
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH] bind: add packageconfig for python-support
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
X-List-Received-Date: Mon, 05 Feb 2018 12:25:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Break the hard runtime dependency on python3-core by adding a
(default-on) packageconfig option for python.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
 meta/recipes-connectivity/bind/bind_9.10.6.bb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.6.bb
index 8b8835ba80..2ec7ab44f0 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
@@ -38,16 +38,19 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --with-openssl=${STAGING_LIBDIR}/.. \
                "
 
-inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
+inherit autotools update-rc.d systemd useradd pkgconfig
 
 export PYTHON_SITEPACKAGES_DIR
 
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
-PACKAGECONFIG ?= "readline"
+PACKAGECONFIG ?= "readline python"
 PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
 PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
 PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
+PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3-core,python3-core"
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
@@ -60,7 +63,6 @@ SYSTEMD_SERVICE_${PN} = "named.service"
 
 PARALLEL_MAKE = ""
 
-RDEPENDS_${PN} = "python3-core"
 RDEPENDS_${PN}-dev = ""
 
 PACKAGE_BEFORE_PN += "${PN}-utils"
@@ -88,7 +90,11 @@ do_install_append() {
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
 	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
-	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
+
+	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}" ]; then
+		sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
+			${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
+	fi
 
 	# Install systemd related files
 	install -d ${D}${sbindir}
-- 
2.16.1


