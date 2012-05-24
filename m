Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SXfAT-00040L-LM
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:01:57 +0200
Received: by wgbdr1 with SMTP id dr1so171481wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 13:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sM0PcEXDTqE0ieyeowbOgQbJAT0zqzaVw4pvbjGnW8o=;
	b=LSYu/mzE4nFtxUe27GDgxGLZ+2A80gioZN865RcEGvreA4orksQIh7uTMpwfJm0xZ2
	GG5IXqPgx3M6oytVD1WWi2j/XfJzJkWzaH/lFBtM8+eF5awHMNlrDuya1YVSAopChNhT
	p7kKvai6vD23S5fcQvf+/q9UG3HuBdBBtULUhHB6yZwwPygU0L6zEXt1MdU8VMHGeL0o
	rMmRKnIc4I2SEyRXGXCqmpYDwLC/hDO/om/xG1YStu39iun5Ej1nzlUuu9Ka4olcThT/
	h5qncpZon3opuyMyIEsVRE1K0qzp8x4d18LSEn6qgFTCkmLD+o0lqDwu7G8vcZJXoC4k
	Iczw==
Received: by 10.180.88.194 with SMTP id bi2mr1606385wib.20.1337892706319;
	Thu, 24 May 2012 13:51:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gv4sm11983905wib.8.2012.05.24.13.51.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 13:51:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 22:51:37 +0200
Message-Id: <1337892697-5489-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] wpa-supplicant: don't let postinst fail when dbus-1 reload fails
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
X-List-Received-Date: Thu, 24 May 2012 21:01:57 -0000

* e.g. when upgrading in chroot
  Configuring wpa-supplicant.
  Reloading system message bus config: Failed to open connection to system message bus: Failed to connect to socket /var/run/dbus/system_bus_socket: Connection refused
  but that shouldn't be fatal

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    2 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
index efd1a66..6c84202 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -74,6 +74,6 @@ pkg_postinst_wpa-supplicant () {
 	DBUSPID=`pidof dbus-daemon`
 
 	if [ "x$DBUSPID" != "x" ]; then
-		/etc/init.d/dbus-1 reload
+		/etc/init.d/dbus-1 reload || true
 	fi
 }
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
index 7bbb8c0..6f6378b 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-0.7.inc
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
 SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"
-- 
1.7.8.6



