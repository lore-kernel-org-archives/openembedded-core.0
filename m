Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCVeO-0008Nd-GO
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 14:41:57 +0100
Received: by mail-da0-f43.google.com with SMTP id u36so2568007dak.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 05:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=cKaHD+kVjzSoqf6LajTVWJ67jLUiU6dvykLXdHG/7Pc=;
	b=Bvhs2pKFtD+yAwOObJ5uFkqlx7Jm2fHtaNW7laKhDdGsxkl0kwz8BrooznBAk/MNIi
	gpjx6xwSPzf7Js785IkdjAE6W3+uq93sa+xFj0eA16EX2UQAmZJ+sHUYWPzCqFEF40Ig
	O9WO1CAAP758VIVQ4npM0I85usRggBpbOfxrOb+33IHQrvk9/EUb8DnAeo15rS1rbXC4
	VvFMdSOkRO2UXeHTIUkqLgT3h4AxnnxzyNbhKeZI39f81vvPV5+pB4IfM79dMxQJgXn7
	f1LT6zgsUcwusUEaxChsvHsXsV3lGpBY7nNxUfDLElXz/0n3cnhMxuaaJd4GpV6DCjEi
	IIQQ==
X-Received: by 10.68.4.97 with SMTP id j1mr27908224pbj.157.1362403527962;
	Mon, 04 Mar 2013 05:25:27 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id is1sm16616632pbc.15.2013.03.04.05.25.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 05:25:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2013 14:25:14 +0100
Message-Id: <1362403514-10122-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] avahi: move systemd support where it belongs
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
X-List-Received-Date: Mon, 04 Mar 2013 13:41:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi.inc       | 6 +-----
 meta/recipes-connectivity/avahi/avahi_0.6.31.bb | 6 ++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 3a4547c..51cbe38 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -37,11 +37,7 @@ USERADD_PARAM_avahi-autoipd = "--system --home /var/run/avahi-autoipd \
                               -c \"Avahi autoip daemon\" \
                               avahi-autoipd"
 
-inherit autotools pkgconfig update-rc.d gettext systemd useradd
-
-SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
-SYSTEMD_SERVICE_avahi-daemon = "avahi-daemon.service"
-SYSTEMD_SERVICE_avahi-dnsconfd = "avahi-dnsconfd.service"
+inherit autotools pkgconfig update-rc.d gettext useradd
 
 EXTRA_OECONF = "--disable-introspection \
              --with-avahi-priv-access-group=adm \
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
index cff0974..22731f9 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
@@ -1,5 +1,11 @@
 require avahi.inc
 
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
+SYSTEMD_SERVICE_avahi-daemon = "avahi-daemon.service"
+SYSTEMD_SERVICE_avahi-dnsconfd = "avahi-dnsconfd.service"
+
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
                     file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
-- 
1.8.1.5



