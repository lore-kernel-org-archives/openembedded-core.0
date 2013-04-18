Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1USt20-0003oj-6p
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 19:54:09 +0200
Received: by mail-wi0-f178.google.com with SMTP id hq17so3366518wib.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 10:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=RdJTFSYprU/+KHpocY1rXDg4sAZBg1lJSYLZK07T+fM=;
	b=iF+Zfr9NL0BcR4p6NmfoDEMzqd1CgdBuBen15G0A9W9rFGNZli8HgY7NBmDYem/9en
	wXMBnxyfeh4WHsqx8ay3v8zpm+469eGnO/9ggrlYNCVv8xNlBzz0TlFt35C56m6dn09Y
	+ftCMev/cggn5hWMIcHDvoracS3n2OifKv+zn8d4pa0NDzL8KnBRQfResBb89NE9FVpP
	1x8XLtRjfKc6t6uf3BtGVLO0x3NvB3nY3yxOtr53SZO7StKfcw0W1ILuoORV4MGswQ4e
	PfrYAQRRhK8TylnRWPQZndt6SAsJ7GmeT/b8d0tYcvHT6fd817Ry5m8mOAekSwMbUlFi
	aVMw==
X-Received: by 10.194.88.138 with SMTP id bg10mr20605493wjb.13.1366306586651; 
	Thu, 18 Apr 2013 10:36:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ge7sm4934999wib.6.2013.04.18.10.36.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 10:36:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 18:33:33 +0100
Message-Id: <1366306413-1336-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQn/G0jmd3zZ6vqrPXRGhouDvbgsUqvqf1MfqvhUPwJJ0MSrygfUsK2p4uAkv1Np7eecN5Kh
Subject: [PATCH] avahi: fix systemd service packaging with multilib
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
X-List-Received-Date: Thu, 18 Apr 2013 17:54:24 -0000

Move the systemd class usage to the .inc, and use ${PN} correctly so that
the files are packaged in multilib configurations.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc       |    6 +++++-
 meta/recipes-connectivity/avahi/avahi_0.6.31.bb |    6 ------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index c302f87..f31b5e5 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -37,7 +37,7 @@ USERADD_PARAM_avahi-autoipd = "--system --home /var/run/avahi-autoipd \
                               -c \"Avahi autoip daemon\" \
                               avahi-autoipd"
 
-inherit autotools pkgconfig update-rc.d gettext useradd
+inherit autotools pkgconfig update-rc.d gettext useradd systemd
 
 EXTRA_OECONF = "--disable-introspection \
              --with-avahi-priv-access-group=adm \
@@ -115,6 +115,10 @@ INITSCRIPT_PARAMS_avahi-daemon = "defaults 21 19"
 INITSCRIPT_NAME_avahi-dnsconfd = "avahi-dnsconfd"
 INITSCRIPT_PARAMS_avahi-dnsconfd = "defaults 22 19"
 
+SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
+SYSTEMD_SERVICE_${PN}-daemon = "avahi-daemon.service"
+SYSTEMD_SERVICE_${PN}-dnsconfd = "avahi-dnsconfd.service"
+
 do_install() {
 	autotools_do_install
 
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
index 22731f9..cff0974 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
@@ -1,11 +1,5 @@
 require avahi.inc
 
-inherit systemd
-
-SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
-SYSTEMD_SERVICE_avahi-daemon = "avahi-daemon.service"
-SYSTEMD_SERVICE_avahi-dnsconfd = "avahi-dnsconfd.service"
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
                     file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
-- 
1.7.10.4



