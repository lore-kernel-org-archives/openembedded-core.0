Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3wwo-0002Gy-Gw
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 00:01:34 +0100
Received: by mail-wi0-f182.google.com with SMTP id hi18so1413456wib.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 14:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=kJAJI+gqldItVOecDwrhJD3VL305aq6oeRFou4Qv8mE=;
	b=EjLXXprHaa8PFc5WhVORapXzaIGmm/tUCdhu/EXcFHRxdyj9CnNw0ARgddwRiofip9
	UA90evdV2VBA8ohN5CJ7AJn1Zkr4GA6BnrV0dHXX/1Jj91Bke76hf0HrWrqkZ/rDXdlt
	ZJwcRET0w3XZQ55uw+mcwhCQVaFiUkvJtoAGJDwetPEptkkOD+YDmvyMhZ6M72Drle4m
	hcqHI4oyUSIQqhXsbkz4omuZ/mJG9pAv1Y1N2ysI9JIzN7amTS86jNbQJPIMhO4w6gzC
	aGtG6AibiTI+SFDpTuVapu0KrZbZimAS9LAj39kk01lAgfz2HhIlu60CCxA1STZi/D9z
	EGJA==
X-Received: by 10.194.78.207 with SMTP id d15mr12512266wjx.52.1360363540439;
	Fri, 08 Feb 2013 14:45:40 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id e6sm18190386wiz.1.2013.02.08.14.45.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 14:45:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 22:43:18 +0000
Message-Id: <bfbf42a76a2eb023091b5e3f47fbb8a920909175.1360360346.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm2Uc6Ki0Mx0sSe4zNa8KGz+6oml9y7wnADOAiHUnbH1BmQLj1kfGdN5ZsS5x/1ci3VmZrd
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] avahi: Enabling with systemd
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
X-List-Received-Date: Fri, 08 Feb 2013 23:01:41 -0000

From: Radu Moisan <radu.moisan@intel.com>

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |   21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 185207b..3a4547c 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -37,10 +37,13 @@ USERADD_PARAM_avahi-autoipd = "--system --home /var/run/avahi-autoipd \
                               -c \"Avahi autoip daemon\" \
                               avahi-autoipd"
 
-inherit autotools pkgconfig update-rc.d gettext useradd
+inherit autotools pkgconfig update-rc.d gettext systemd useradd
 
-EXTRA_OECONF = "--with-distro=debian \
-             --disable-introspection \
+SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
+SYSTEMD_SERVICE_avahi-daemon = "avahi-daemon.service"
+SYSTEMD_SERVICE_avahi-dnsconfd = "avahi-dnsconfd.service"
+
+EXTRA_OECONF = "--disable-introspection \
              --with-avahi-priv-access-group=adm \
              --disable-stack-protector \
              --disable-gdbm \
@@ -50,10 +53,15 @@ EXTRA_OECONF = "--with-distro=debian \
              --disable-qt4 \
              --disable-python \
              --disable-doxygen-doc \
-             --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
+             ${EXTRA_OECONF_SYSVINIT} \
+             ${EXTRA_OECONF_SYSTEMD} \
              ${AVAHI_GTK} \
            "
 
+# The distro choice determines what init scripts are installed
+EXTRA_OECONF_SYSVINIT = "${@base_contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
+EXTRA_OECONF_SYSTEMD = "${@base_contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','',d)}"
+
 AVAHI_GTK ?= "--disable-gtk --disable-gtk3"
 
 LDFLAGS_append_libc-uclibc = " -lintl"
@@ -64,9 +72,8 @@ do_configure_prepend() {
 }
 
 
-PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
+PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
 
-FILES_avahi-systemd = "${systemd_unitdir}"
 FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/avahi/avahi-autoipd.action \
                        ${sysconfdir}/dhcp/*/avahi-autoipd \
@@ -94,8 +101,6 @@ FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
 FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
 FILES_avahi-utils = "${bindir}/avahi-*"
 
-RDEPENDS_avahi-systemd = "avahi-daemon"
-
 RDEPENDS_avahi-daemon = "sysvinit-pidof"
 
 # uclibc has no nss
-- 
1.7.10.4



