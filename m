Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAfut-0001MI-23
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:10:51 +0100
Received: by wgbdr12 with SMTP id dr12so1103418wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ZUL9OY2P7i5lRIHhS9cMg4MPXsOunVuyGOzMphF6uIc=;
	b=qIfyY+fKpgPQ7PsjIi1w87NOgw+S/MBjSsslL9ftETgAW5dXbnw+Jud96e8s2tkS6i
	MatX0KPsL657KGuwc/u8YKGgXgZuk/ZmLO5I/jkXqVEmeAjMn8k6EBsgVRx3Xy++tDoV
	5yza1A6GO1MsQwSEnm36/DlLwPewGP31Gj1n0CoUmGfROz9XKUe9O0jJBIpGFSJltx9p
	az1vB1Zv4G41LbYKQRtGpilEPANbB0HSpXV+ATCVc9gWMVLEGZhV3ssOr28qgiB6cKJx
	yYOeE5GQ0einezC/XDvDCgZd0UYe8b1YKsckKiWDqMsClEJpdgwwWToInSHGyEjCPNtD
	louQ==
Received: by 10.216.52.14 with SMTP id d14mr4228734wec.35.1332414116455;
	Thu, 22 Mar 2012 04:01:56 -0700 (PDT)
Received: from localhost.localdomain (p5B0A13EE.dip.t-dialin.net.
	[91.10.19.238])
	by mx.google.com with ESMTPS id fn2sm7546875wib.0.2012.03.22.04.01.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 04:01:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 12:05:59 +0100
Message-Id: <1332414362-6406-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] ofono: use systemd_unitdir
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
X-List-Received-Date: Thu, 22 Mar 2012 11:10:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-connectivity/ofono/ofono.inc    |    2 +-
 meta/recipes-connectivity/ofono/ofono_1.5.bb |    2 +-
 meta/recipes-connectivity/ofono/ofono_git.bb |    4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index f6cd895..f4b2317 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -19,6 +19,6 @@ do_install_append() {
 
 PACKAGES =+ "${PN}-tests"
 
-FILES_${PN} += "${base_libdir}/udev ${base_libdir}/systemd"
+FILES_${PN} += "${base_libdir}/udev ${systemd_unitdir}"
 FILES_${PN}-tests = "${libdir}/ofono"
 RDEPENDS_${PN}-tests = "python"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.5.bb b/meta/recipes-connectivity/ofono/ofono_1.5.bb
index d0f273b..dad813f 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.5.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.5.bb
@@ -1,6 +1,6 @@
 require ofono.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.bz2 \
 	          file://ofono"
diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
index 966d315..a44b411 100644
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ b/meta/recipes-connectivity/ofono/ofono_git.bb
@@ -1,11 +1,9 @@
 require ofono.inc
 
-PR = "r2"
-
 S	 = "${WORKDIR}/git"
 SRCREV = "14544d5996836f628613c2ce544380ee6fc8f514"
 PV	 = "0.12-git${SRCPV}"
-PR = "r1"
+PR = "r3"
 
 SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git;protocol=git \
 	    file://ofono"
-- 
1.7.4.4



