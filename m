Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 40D546A9C4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 08:53:40 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id p61so3097287wes.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 01:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dI1jZ+fmHF2KiWL8RGUYbNvyYtMdUbrRkIPZts394UY=;
	b=Za1sqNAgm0USJViJLN+7vkGVAR5MSb3pvo69FZG1OefGiXMrNZrhtUogHFCbSFHzZw
	yT3CQgWxFCeC9G10K9/UiU5rOkXWJkHvtDDYu8ZzdrbO7PbV59Q/tWJKRN7e4O6Ht4mo
	BEH6IcxVxe6/4g7xi2vKj+oFpYgSIY1IXbMMnCFWvXEIZcnMl9P0jimSc+UTXX43rjE+
	4kYiiyKk9gb5mJgJdXmg04AEzkF5UhB03gqmx8h9xLU1GjpBbNeGeSoy7v8tltW20er2
	EMzuK7sFAzV7GgBMa3teOXmPia5JQ8AFPzJ35cQsgGDMTzXGmBLK38WrR86pkpecwBDK
	/8zQ==
X-Gm-Message-State: ALoCoQm6QKL3nrtFpvCkZKgc2ARE3506HMqNnrGldc3Er6TyNB/HdGZjRSfVt5a4d7Kbb7VlojJ9
X-Received: by 10.180.87.233 with SMTP id bb9mr2784277wib.10.1396601620443;
	Fri, 04 Apr 2014 01:53:40 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	w12sm18056563eez.36.2014.04.04.01.53.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Apr 2014 01:53:39 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 10:53:37 +0200
Message-Id: <1396601617-29638-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [RFC][PATCH] dbus: split dbus-launch out into its own package (again)
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
X-List-Received-Date: Fri, 04 Apr 2014 08:53:43 -0000

When installing 'dbus-1' it will drag in X11 libs due to ${bindir}/dbus-launch being in ${PN}. Move it to a seperate package to be able to generate a small filesystem (e.g. initrd) without X11 libs without needed a seperate DISTRO.conf.

There will be no functional changes for existing image and packagegroup recipes since ${PN} has 'dbus-launch' in RRECOMMENDS. So to filter out dbus-launch you need to add it to BAD_RECOMMENDATIONS in the image recipe.

This is in essence a revert of:

	commit c02364f36e228835ea5d7fd4e1d347fd451f8544
	Author: Radu Moisan <radu.moisan@intel.com>
	Date:   Tue Jul 31 09:23:23 2012 +0300

	    dbus: include dbus-launch in the main dbus package

But as pointed out above, ${bindir}/dbus-launch will end up in the rootfs as before, so the issue behind c02364f36e228835ea5d7fd4e1d347fd451f8544 of a missing ${bindir}/dbus-launch won't suddenly pop up.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---

I've boot tested this both with BAD_RECOMMENDATIONS and without and it seems to work as intended. The big question is how to address the dbus-x11 (R)PROVIDE entries. I feel 'dbus-launch' is a much better name than 'dbus-x11', but I don't mind respinning this patch with 'dbus-x11'.


 meta/recipes-core/dbus/dbus.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 677ff78..28074be 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -37,7 +37,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib"
+PACKAGES =+ "${PN}-lib dbus-launch"
 
 OLDPKGNAME = "dbus-x11"
 OLDPKGNAME_class-nativesdk = ""
@@ -51,15 +51,20 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${bindir}/dbus-cleanup-sockets \
                ${bindir}/dbus-send \
                ${bindir}/dbus-monitor \
-               ${bindir}/dbus-launch \
                ${libexecdir}/dbus* \
                ${sysconfdir} \
                ${localstatedir} \
                ${datadir}/dbus-1/services \
                ${datadir}/dbus-1/system-services \
                ${systemd_unitdir}/system/"
+
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
+
+FILES_dbus-launch = "${bindir}/dbus-launch"
+RDEPENDS__dbus-launch = "${PN}"
+RRECOMMENDS_${PN} += "dbus-launch"
+
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 
 pkg_postinst_dbus() {
-- 
1.9.0


