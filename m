Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1S3YlA-0007SE-Km
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 21:07:24 +0100
Received: by dado14 with SMTP id o14so2085917dad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 11:58:52 -0800 (PST)
Received-SPF: pass (google.com: domain of steve@sakoman.com designates
	10.68.229.67 as permitted sender) client-ip=10.68.229.67; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of steve@sakoman.com
	designates 10.68.229.67 as permitted sender)
	smtp.mail=steve@sakoman.com
Received: from mr.google.com ([10.68.229.67])
	by 10.68.229.67 with SMTP id so3mr20032998pbc.163.1330718332506
	(num_hops = 1); Fri, 02 Mar 2012 11:58:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.229.67 with SMTP id so3mr16692006pbc.163.1330718332435;
	Fri, 02 Mar 2012 11:58:52 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id j3sm5782599pbb.29.2012.03.02.11.58.50
	(version=SSLv3 cipher=OTHER); Fri, 02 Mar 2012 11:58:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2012 11:58:43 -0800
Message-Id: <1330718323-17978-1-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
X-Gm-Message-State: ALoCoQlsj/VHoBpr5r2ZIyhWbu2YqxSkgHr+4Uqjnwzw5SuVDERP1URQ84AZvSP4n8SBITimgGpu
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] wpa-supplicant: fix breakage during rebuild
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
X-List-Received-Date: Fri, 02 Mar 2012 20:07:25 -0000

Install phase currently edits files in $S with sed. This causes breakage
if install is run a second time (due to sstate hash rebuild for example)

The result is hidden build breakage, in particular
/usr/share/dbus-1/system-services/fi.w1.wpa_supplicant1.service now contains:

Exec=/usr/usr/sbin/wpa_supplicant -u

rather than:

Exec=/usr/sbin/wpa_supplicant -u

This patch does the sed edit after the files are copied to $D, which should be safe.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    2 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
index 99317e4..539ab8c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -58,8 +58,8 @@ do_install () {
 	install -d ${D}/${sysconfdir}/dbus-1/system.d
 	install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
 	install -d ${D}/${datadir}/dbus-1/system-services
-	sed -i -e s:${base_sbindir}:${sbindir}:g ${S}/dbus/*.service
 	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
+	sed -i -e s:${base_sbindir}:${sbindir}:g ${D}/${datadir}/dbus-1/system-services/*.service
 
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
index 49f5482..c607fad 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-0.7.inc
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
 SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"
-- 
1.7.1



