Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVHnA-000367-3D
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 08:07:51 +0100
Received: by bkbzs2 with SMTP id zs2so8947887bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 23:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6OHq3LQQDOJJs+DAvM2KhRGuWsg6l3IsKLPhXMaViYU=;
	b=b/1d9vWzefabSQakkrTFz7wt858vrqsRUNny48VIIhjuDAUuhuiWHOuIuIh0Oqn2w+
	MLzSox9ZaUmg1950nDBIFIfB3P93u96LBps14tSZ1y3UYSK3A+nWhfN2sSefTCuZpygZ
	88u0sFWtYtaNKzXM4CuclnKR+aYnpAfHJyWd0=
Received: by 10.204.41.66 with SMTP id n2mr49524972bke.77.1322550069348;
	Mon, 28 Nov 2011 23:01:09 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q6sm34992075bka.6.2011.11.28.23.01.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 23:01:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 08:00:51 +0100
Message-Id: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
Subject: [oe-core 01/10] tinylogin: use u-a for getty so we can provide /sbin/getty from util-linux-agetty too
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
X-List-Received-Date: Tue, 29 Nov 2011 07:07:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/tinylogin/tinylogin_1.4.bb |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tinylogin/tinylogin_1.4.bb b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
index bad918c..478f69b 100644
--- a/meta/recipes-core/tinylogin/tinylogin_1.4.bb
+++ b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
@@ -7,7 +7,9 @@ and groups on an embedded system."
 HOMEPAGE = "http://tinylogin.busybox.net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM="file://LICENSE;md5=f1060fa3a366f098b5b1d8c2077ba269"
-PR = "r7"
+PR = "r8"
+
+inherit update-alternatives
 
 SRC_URI = "http://www.angstrom-distribution.org/unstable/sources/tinylogin-${PV}.tar.bz2 \
 	file://cvs-20040608.patch \
@@ -35,3 +37,12 @@ do_install () {
 		ln -sf /bin/tinylogin ${D}$i
 	done
 }
+
+do_install_append () {
+        mv ${D}${base_sbindir}/getty ${D}${base_sbindir}/getty.${PN}
+}
+
+ALTERNATIVE_NAME = "getty"
+ALTERNATIVE_LINK = "${base_sbindir}/getty"
+ALTERNATIVE_PATH = "${base_sbindir}/getty.${PN}"
+ALTERNATIVE_PRIORITY = "80"
-- 
1.7.8.rc3



