Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2913E6E4CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 10:42:48 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id r20so973990wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 03:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SxkRUUKImgTpLKhk1B9Y/AS1T5eiB/8sJYH3iS9YPo0=;
	b=j2nfZofQ2N4G3n8JNco3uXhEkrlSB0bF4ZcL6iM9yHWgnfk0Rz7Mr0iBcJVJaCZAoF
	be/Xru9+UsVuarzw9iWakOSA78yYlOp1q1LsvIpUHZ8Q8tCJ+GSWomPxyYGsRyu08nnC
	fUfI+cEJFqzPSgC4g4t8OEMUf6GgZ7t/e9wgElwBhv7B0KMtemIpZGQLivPeUnq01fis
	qQT2RIdHmxUMfAygfOqAo0NFqa086iCKPfF6M0VBmejZBOlXLQ278Cx59MdkFUU9MKJa
	sf9F26+tG88vY5TM/74BT8QEJudNc5Xs5hf4WV8R43Z/j+z/ZdGoQmPYH8tAiI898rRB
	5V5g==
X-Gm-Message-State: ALoCoQlnjac/iDf+w5eDZ9aWSAiKDOeM28RyJJMQPXYttXP0GhWFl6Uv8lD6dF4v0MsRoF5t+Nl1
X-Received: by 10.194.161.168 with SMTP id xt8mr18802742wjb.35.1396608168877; 
	Fri, 04 Apr 2014 03:42:48 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id x3sm18682136eep.17.2014.04.04.03.42.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Apr 2014 03:42:47 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 12:42:46 +0200
Message-Id: <1396608166-4965-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [RFC][PATCHv2] dbus: split dbus-launch out into its own package (again)
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
X-List-Received-Date: Fri, 04 Apr 2014 10:42:52 -0000

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

Changes since v1:
	* extra underscore in RDEPENDS removed
	* Change to ${PN}-launch


 meta/recipes-core/dbus/dbus.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 677ff78..28074be 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -37,7 +37,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
 
 DEBIANNAME_${PN} = "dbus-1"
 
-PACKAGES =+ "${PN}-lib"
+PACKAGES =+ "${PN}-lib ${PN}-launch"
 
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
+FILES_${PN}-launch = "${bindir}/dbus-launch"
+RDEPENDS_${PN}-launch = "${PN}"
+RRECOMMENDS_${PN} += "${PN}-launch"
+
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 
 pkg_postinst_dbus() {
-- 
1.9.0


