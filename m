Received: from mail-we0-f169.google.com ([74.125.82.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3wwn-0002Gt-4O
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 00:01:33 +0100
Received: by mail-we0-f169.google.com with SMTP id t11so3495913wey.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 14:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=86g/M/gq4INz7OlneYLaPuLYbekESEjl8PWBWkWlsU0=;
	b=H3SIGE4D1rxpSsuy47eutI9C9SU4afebHXmNMRIPxQwgAqv7CdZBa9rPvTwJkiNHjr
	FdaIAvbBOSaIyBSBlZdMB1eyNMEYWW+DQ87PDa+gZwHmCnaas+4qLhA//2PIfU42XgCg
	oyF9GmgzwL4udUeEg8Pxv5nS7aCtieFhNp9tFo5Ot28hIwGxWvZ9rK4RCyUmlO2ipePK
	/IQjJv28wilte9Ls7ij0eLFLOrUi9FAi5rKXl9zrGwsAVZYDNFrC89pyuLkuU7/gS8zP
	/h9MO/SLq1gf9owmdloBwJkRFqW8MeDq24O6Ew4CLAOWAgwjNEtSC4gNZUfJSAtrb784
	UTug==
X-Received: by 10.180.81.164 with SMTP id b4mr5187205wiy.34.1360363539046;
	Fri, 08 Feb 2013 14:45:39 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id e6sm18190386wiz.1.2013.02.08.14.45.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 14:45:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 22:43:17 +0000
Message-Id: <b7c38841f2ced94a9a5924916c66f667051e7012.1360360346.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlXN4TqYWIANWjc9bdw9a3He/9dzF9IW248IWeLdhQWZAUOxV3DkQrG79UYfjSElRUuAwJ/
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] connman: Enabling with systemd
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
X-List-Received-Date: Fri, 08 Feb 2013 23:01:34 -0000

From: Radu Moisan <radu.moisan@intel.com>

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 5c9aa6d..b61e2af 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -40,11 +40,14 @@ EXTRA_OECONF += "\
     --disable-polkit \
     --disable-client \
     --enable-fake \
+    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '', d)} \
 "
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
+SYSTEMD_SERVICE_${PN} = "connman.service"
+
 # IMPORTANT: because xuser is shared with rootless X, please make sure the
 # USERADD_PARAM is in sync with the one in xserver-nodm-init.bb
 USERADD_PACKAGES = "${PN}"
@@ -52,7 +55,7 @@ USERADD_PARAM_${PN} = "--create-home \
                        --groups video,tty,audio \
                        --user-group xuser"
 
-inherit autotools gtk-doc pkgconfig update-rc.d useradd
+inherit autotools gtk-doc pkgconfig systemd update-rc.d useradd
 
 # This allows *everyone* to access ConnMan over DBus, without any access
 # control.  Really the at_console flag should work, which would mean that
@@ -62,8 +65,10 @@ do_compile_append() {
 }
 
 do_install_append() {
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
+	if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
+	fi
 
 	install -d ${D}${bindir}
 	install -m 0755 ${S}/tools/*-test ${D}${bindir}
-- 
1.7.10.4



