Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0E82070CF8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 16:55:28 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so1069384wib.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 09:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KsZBXTaNTihNQD8ZBbV0IfwM1BzyOBv5AjaPcBAwQSo=;
	b=dcRjVTXDhRWjU+2o7NID/KmWaHftMziar6pZ70j7Njgi0X/9rbR55Sm0U8rMRCfzEQ
	z8gK4A1kF8/Ns3Q8G+AJPC3vUt3BWrq94YtmhacepxIYqP2UY7CsdpDILgQgbKAOsPJa
	fuxS0PiRuf6KPrJiI9wL4prYPeKMWsqKpO86Bi5zhHUl+sEw0VnwsvjnlKdrbz8oMTYV
	EosgOS8cAGhIa7yN2EWSBPEyD+75FPtOYzN6QFn0RqToZiev6OxomR3qhPcRsmlfwwwD
	PC4SGBwpr0gb+GitebbscFDhUdQoJ1VPRzfedMJ7H7GnpRWMLkaSghYJwmXFqEGMcbiI
	iNGQ==
X-Gm-Message-State: ALoCoQnjOAV3kEE+SndzME+5L3nOObOW7MGaqOffbifqyCYHyp8vZRz8orHM/Wq1Z8vL6EqDJMAH
X-Received: by 10.180.99.4 with SMTP id em4mr21872205wib.8.1408121728602;
	Fri, 15 Aug 2014 09:55:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ge8sm8393779wib.4.2014.08.15.09.55.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 09:55:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Aug 2014 17:55:22 +0100
Message-Id: <1408121722-20308-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] avahi: unset FILES_avahi to avoid packaging files there
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
X-List-Received-Date: Fri, 15 Aug 2014 16:55:38 -0000

The main avahi recipe doesn't package anything into ${PN}.  If a library is
enabled but not put into a separate package it ends up in ${PN} and all the
packages are renamed using it's soname - ie libdns-sd-daemon.

Avoid this by clearing FILES_avahi so extra files are unpackaged instead of
creating a new package.  Also actually remove /var as the comments claim so the
avahi package is truly empty.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 3318f40..b97c4c5 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -73,6 +73,9 @@ do_configure_prepend() {
 
 PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
 
+# As avahi doesn't put any files into PN, clear the files list to avoid problems
+# if extra libraries appear.
+FILES_avahi = ""
 FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/avahi/avahi-autoipd.action \
                        ${sysconfdir}/dhcp/*/avahi-autoipd \
@@ -122,7 +125,8 @@ do_install() {
 	# don't install /var/run when populating rootfs. Do it through volatile
 	# /var/run of current version is empty, so just remove it.
 	# if /var/run become non-empty in the future, need to install it via volatile
-	rm -rf ${D}/var/run
+	rm -rf ${D}${localstatedir}/run
+	rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
 	rm -rf ${D}${datadir}/dbus-1/interfaces
 	rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
-- 
1.7.10.4


