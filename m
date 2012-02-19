Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RzE4r-0002fx-4O
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Feb 2012 22:13:49 +0100
Received: by eekd41 with SMTP id d41so1733074eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Feb 2012 13:05:32 -0800 (PST)
Received-SPF: pass (google.com: domain of andrei@gherzan.ro designates
	10.213.28.204 as permitted sender) client-ip=10.213.28.204; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrei@gherzan.ro
	designates 10.213.28.204 as permitted sender)
	smtp.mail=andrei@gherzan.ro
Received: from mr.google.com ([10.213.28.204])
	by 10.213.28.204 with SMTP id n12mr1688585ebc.74.1329685532200
	(num_hops = 1); Sun, 19 Feb 2012 13:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=ckx71kW4dRwl3evMhngnodFWmbD8/AqsYeHJZcm1Xz4=;
	b=i3KWerHVyEri4i02aXnfJ3QallC3WYIn+3/rCzRnu3xnR0yYeilVbs7QUAdRfZLW22
	ijlhpUmHvL7j+tEAWHhQ0Ea/TiUqt4KZ6Ax/Tc5NUnVsGlKQBHviNK5kIbhqaveUOBy3
	Qh+IBVlgiM2pgyohIL2YXAxarDihbMJPiGryU=
MIME-Version: 1.0
Received: by 10.213.28.204 with SMTP id n12mr1337038ebc.74.1329685530472;
	Sun, 19 Feb 2012 13:05:30 -0800 (PST)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id c16sm69362437eei.1.2012.02.19.13.05.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Feb 2012 13:05:29 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Feb 2012 23:05:24 +0200
Message-Id: <1329685524-30028-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQkSHy+wxj8V54KKZU8XQblqpALPdE3nQ1alV70NZetcUpMCA+edts3yRTRpvDdUBM+mjt27
Subject: [PATCH] dbus: Remove empty ${lindir}dbus-1.0/test directory as we don't build tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Feb 2012 21:13:49 -0000

This empty directory generates a QA warning of unshippped files/dirs.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/dbus/dbus.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 2a25256..588209f 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -10,7 +10,7 @@ DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X
 DEPENDS_virtclass-native = "expat-native virtual/libintl-native"
 DEPENDS_virtclass-nativesdk = "expat-nativesdk virtual/libintl-nativesdk virtual/libx11"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
@@ -91,6 +91,9 @@ do_install() {
 	# Remove Red Hat initscript
 	rm -rf ${D}${sysconfdir}/rc.d
 
+	# Remove empty testexec directory as we don't build tests
+	rm -rf ${D}${libdir}/dbus-1.0/test
+
 	# disable dbus-1 sysv script on systemd installs
 	# nearly all distros call the initscript plain 'dbus', but OE-core is different
 	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/dbus-1.service
-- 
1.7.5.4



