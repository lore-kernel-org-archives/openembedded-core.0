Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 34F5F72007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 18:09:51 +0000 (UTC)
Received: by wgha1 with SMTP id a1so7025325wgh.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 10:09:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3LkpksD9oR77VY10LNRdmyyItrAfU2zD8hXlvwfvxuE=;
	b=lGdKpGrtMS5xzOBofpN4GE/UmTuou+U8uzt+KkZrQKPyRNU2rJfBb/LrY5M0EmcFnk
	i3h2WwNtRVK5PKikX+lWYT4RAOm4Ft4i+C2hFPDvfUw/krC7jxjQx+oGyB7F9eqY4RlW
	go4uCHVJ2/OEnZGQdLxGhJIw4rI1mpax3+VvExvEjWNf6trrID8ywb7nCE4EamqAntOk
	znn+cIqC7FIywf+zWTC4N0aOmeT97l9ziQF8s9hGCXCziNKlVfHCmPnhdGc0KJwjWdI7
	mWKyYGKIcxlshp796dYo8bsieaA5S8XSiLV0kWwvZMAHSoxiStL9gexbCloU2hEJuShl
	auBg==
X-Gm-Message-State: ALoCoQm1rHVgH0fyj8AONo20YmOBt+5ZduaPuMSonOncBB1bn+bsSm+LC7xd5WlWhf1domBTu7dV
X-Received: by 10.194.61.100 with SMTP id o4mr35142901wjr.28.1424801392412;
	Tue, 24 Feb 2015 10:09:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id p1sm21568058wib.23.2015.02.24.10.09.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Feb 2015 10:09:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Feb 2015 18:07:25 +0000
Message-Id: <1424801246-16399-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] util-linux: disable systemd
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
X-List-Received-Date: Tue, 24 Feb 2015 18:09:52 -0000

systemd has a build-dependency on util-linux for libmount, and util-linux has an
optional build dependency on systemd.

The features in util-linux that enabling systemd gives you are:
* lslogins can show recent journal entries from the user
* uuidd can use socket activation and has a service file
* fstrim has a service file
* logger can write journal entries

These are not worth the overhead of maintaining two util-linux recipes to
bootstrap the cycle, so disable systemd support in util-linux.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b4f51e9..3d8a4d0 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -48,8 +48,7 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
 
 EXTRA_OECONF = "${SHARED_EXTRA_OECONF} --libdir=${base_libdir}"
 
-PACKAGECONFIG_class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                                ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
+PACKAGECONFIG_class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 
 # Respect the systemd feature for uuidd
@@ -117,7 +116,7 @@ RDEPENDS_${PN}_class-nativesdk = ""
 
 RPROVIDES_${PN}-dev = "util-linux-libblkid-dev util-linux-libmount-dev util-linux-libuuid-dev"
 
-SYSTEMD_PACKAGES = "${PN}-uuidd ${PN}-fstrim"
+#SYSTEMD_PACKAGES = "${PN}-uuidd ${PN}-fstrim"
 SYSTEMD_SERVICE_${PN}-uuidd = "uuidd.socket uuidd.service"
 SYSTEMD_AUTO_ENABLE_${PN}-uuidd = "disable"
 SYSTEMD_SERVICE_${PN}-fstrim = "fstrim.timer fstrim.service"
-- 
1.7.10.4


