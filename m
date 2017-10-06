Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id BB9D9780F9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:19 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id m72so2558163wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EYH9JvmaSb8zMzKisnKss61iEjleXevTB3URCm1ByYw=;
	b=jSIUGvZYmslxF6y1DNvE0Hy+HHgSKne6zwBDvlf30IUsQX04gXhKmXQTKLnOSV16zK
	NC06H+JR91JJwuzjUXlkKxu0q+pZLcWnBWnyOXK2WHm1qlP4+KRq4nPoNJJvPqjbf4XG
	kw4ESLN0TIQrfe9oRu8xo7WOPQG56ql1CAFut7zq1W1x8/2XDTbUMEa2fEP6CaCYRoiG
	+pMCQuTb3faz/55vWvM3dFsl0IkzGtsIeJVv80g/7LYnCz/ilj0zg9nQjI8Wa1W49W8b
	BjA6C6vhwKTVljHKhO/2KOYAjUUic0ohCRrPm1Opiw49wmHN02OoiPicLa+VD0fK0Itl
	1tTA==
X-Gm-Message-State: AMCzsaUR9fDeaSH5S27wd9w/p+D1NlcchTRRd+OInDSxsEUAMMyrVI1L
	rKSXjJseftjE9e6qGhfgO++/1GBN
X-Google-Smtp-Source: AOwi7QBiPeZ1awtR++g//AWl57qvyYY1Rj2y/X3Y77katEI2gnHLj1Vz87Rn6MVAKZ+/lXbn+P9bMg==
X-Received: by 10.28.100.212 with SMTP id y203mr1567457wmb.64.1507292000301;
	Fri, 06 Oct 2017 05:13:20 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:19 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:51 +0100
Message-Id: <20171006121259.5817-10-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 09/17] ca-certificates: Fix postinst dependency issues
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We were relying on running ca-certificates from the -native version. This
meant the host and target path layouts had to match which might not be true,
it certainly isn't true for the sdk builds.

There was a dependency on run-parts which wasn't represented (we can get it
from busybox or debianutils).

Since this is an allarch script, call the script directly, making sure debianutils
and openssl are available as postinst rootfs time to resolve the issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit d9575e05f2cb8bf293534c036ddc0d0336701256)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 .../ca-certificates/ca-certificates_20161130.bb               | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
index 42088b9899..c282ace264 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
@@ -8,10 +8,11 @@ LICENSE = "GPL-2.0+ & MPL-2.0"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7358b9541ccf3029e9705ed8de57968"
 
 # This is needed to ensure we can run the postinst at image creation time
-DEPENDS = "ca-certificates-native"
+DEPENDS = ""
 DEPENDS_class-native = "openssl-native"
-DEPENDS_class-nativesdk = "ca-certificates-native openssl-native"
-PACKAGE_WRITE_DEPS += "ca-certificates-native"
+DEPENDS_class-nativesdk = "openssl-native"
+# Need c_rehash from openssl and run-parts from debianutils
+PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
 SRCREV = "61b70a1007dc269d56881a0d480fc841daacc77c"
 
@@ -63,7 +64,7 @@ do_install_append_class-target () {
 }
 
 pkg_postinst_${PN} () {
-    SYSROOT="$D" update-ca-certificates
+    SYSROOT="$D" $D${sbindir}/update-ca-certificates
 }
 
 CONFFILES_${PN} += "${sysconfdir}/ca-certificates.conf"
@@ -71,7 +72,7 @@ CONFFILES_${PN} += "${sysconfdir}/ca-certificates.conf"
 # Postinsts don't seem to be run for nativesdk packages when populating SDKs.
 CONFFILES_${PN}_append_class-nativesdk = " ${sysconfdir}/ssl/certs/ca-certificates.crt"
 do_install_append_class-nativesdk () {
-    SYSROOT="${D}${SDKPATHNATIVE}" update-ca-certificates
+    SYSROOT="${D}${SDKPATHNATIVE}" ${D}${sbindir}/update-ca-certificates
 }
 
 do_install_append_class-native () {
-- 
2.14.2


