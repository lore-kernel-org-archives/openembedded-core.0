Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1507F918
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 11:28:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p7so2060189wmp.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 04:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fZGv9E/wnbSCX25Imip5mDM8L2DJ3uF724ehuzjA76k=;
	b=gUepomO6lT+ewuDsH8iuKWx6S9C0mhz0C1tnJWdCwqhCKEAdBiqqy9pM0LNZ5HnjYu
	+hIq1DAdshJEycw5bJ6tlHhistr/JIrWco2FZOMJjzAesCdCAm29aX+/b2W4rtM4Xnrc
	T77AQNmQmVETi+/TvY8GABnzN6ktoA+jJBRfTHG4sulMMpbpOSLnwzYoQwDQcG0r5gdU
	AhEQ7rT7K1dmNnjPzeXdkGBFXTn725G8IYytC2wWsovJMYTU8YsIVt24kgXF/7qrenlm
	ei1Y1xk4+brdnTQTisHMNnb8IILQ/TuhhoZtU+TxatNldCvmAoxFo7A+7JHLB69zv1HX
	FBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fZGv9E/wnbSCX25Imip5mDM8L2DJ3uF724ehuzjA76k=;
	b=Mfkf8GQv2yu7RLdHYQJoeqrSipnY78yrJRJ2cZPZOq88S7dSjWaKO0M3sHRm6mDPkC
	IYh2bO1qWmHYuhkAGcre5+xpRYYM+VkYd++w3WAijuBUV18chJnxC78v9Y1LvlBsZQAa
	lL55ROGDvM7p2eQR5LuwvTy56U8e2CiRUrPhEnSig4OUbjhdbgoxyi54Z59Cwupq+tA4
	PPtZjHUQo0qRnmXzL/meFaZ/ho6Rk6waXu//3kYyxSKs03L7p1M4cD9VvtV+vhtyVwWj
	qmYUcYLrNcm1f+0821MYofP6pC6X2whINx3W8qnCwThQGzHeFT7MziFTgnpTKgiLAKx0
	J3+A==
X-Gm-Message-State: APjAAAWCVCwUEedCOZLjDfWzi1RCdzUqRENRpKqaqq5/qTeVb8SQsjtv
	aIXM5BwRpJllWicbVZwNDv3wh+RiXhg=
X-Google-Smtp-Source: APXvYqw8ysCJ0IM/Q3/clHMEKyiaKeB30oG+eHUxBitiyiGsM8BACaN2ypLXP/PFvMG0ag9vVQYNDw==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr3239667wmg.38.1568978890868; 
	Fri, 20 Sep 2019 04:28:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t13sm3347737wra.70.2019.09.20.04.28.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 04:28:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 12:28:05 +0100
Message-Id: <20190920112805.32622-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190920112805.32622-1-ross.burton@intel.com>
References: <20190920112805.32622-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] distcc: split into client and server packages
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
X-List-Received-Date: Fri, 20 Sep 2019 11:28:10 -0000
Content-Transfer-Encoding: 8bit

Users of distcc are rarely both clients and servers, so split the package.
distcc is the client, the new distcc-server package is the server.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/distcc/distcc_3.3.3.bb | 33 +++++++++-----------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.3.3.bb b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
index d8ad498f2b4..c52f136be8c 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
@@ -12,7 +12,7 @@ PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
 # use system popt by default
 PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
-RRECOMMENDS_${PN} = "avahi-daemon"
+RRECOMMENDS_${PN}-server = "avahi-daemon"
 
 SRC_URI = "git://github.com/distcc/distcc.git \
            file://fix-gnome.patch \
@@ -29,17 +29,20 @@ ASNEEDED = ""
 
 EXTRA_OECONF += "--disable-Werror PYTHON='' --disable-pump-mode"
 
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system \
+PACKAGE_BEFORE_PN = "${PN}-distmon-gnome ${PN}-server"
+
+USERADD_PACKAGES = "${PN}-server"
+USERADD_PARAM_${PN}-server = "--system \
                        --home /dev/null \
                        --no-create-home \
                        --gid nogroup \
                        distcc"
 
+UPDATERCPN = "${PN}-server"
 INITSCRIPT_NAME = "distcc"
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "distcc.service"
+SYSTEMD_PACKAGES = "${PN}-server"
+SYSTEMD_SERVICE_${PN}-server = "distcc.service"
 
 do_install() {
     # Improve reproducibility: compress w/o timestamps
@@ -53,20 +56,12 @@ do_install() {
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
-				${datadir}/applications \
-				${datadir}/pixmaps"
-
+FILES_${PN}-server = "${sysconfdir} \
+                      ${bindir}/distccd \
+                      ${sbindir}"
+FILES_${PN}-distmon-gnome = "${bindir}/distccmon-gnome \
+                             ${datadir}/applications \
+                             ${datadir}/pixmaps"
 
 #
 # distcc upstream dropped the 3.2 branch which we reference in older project releases
-- 
2.20.1


