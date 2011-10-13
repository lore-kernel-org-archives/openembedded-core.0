Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJna-0004pI-Fk
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:50:06 +0200
Received: by bkat8 with SMTP id t8so449764bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=p+9/TcHeQHNTnK2D7y1nVkgUbTjbMK2xW6EnAZnjCUo=;
	b=t1c9ooJsbRE5O/q9oMK5Ji5owziG/XwfjnZIEgaAax/eX7K3yW2z0g6XpdEzXHn75m
	jKL6SPdwi5caPR6TyXZ18+jO+rnnYY9QfTTMRKuMNzqsP8GVW/SGJtIPjSi4QRPQ36uu
	411WTcYtDYqfW8ubWjS5CbQ36j7MrHtmPrYco=
Received: by 10.204.155.90 with SMTP id r26mr2519720bkw.7.1318506262506;
	Thu, 13 Oct 2011 04:44:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm3320579bkw.5.2011.10.13.04.44.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:44:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:44:13 +0200
Message-Id: <1318506253-31111-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <CA+chaQerLbLcFTuuHZs_KimTQmqOHkhyFUCx-7FzTZfKHFkMgQ@mail.gmail.com>
References: <CA+chaQerLbLcFTuuHZs_KimTQmqOHkhyFUCx-7FzTZfKHFkMgQ@mail.gmail.com>
Subject: [PATCH] nfs-utils: separate nfs-utils-client and nfs-utils-stats
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
X-List-Received-Date: Thu, 13 Oct 2011 11:50:06 -0000

* move python runtime dependency only to nfs-utils-stats

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
index e8b0490..d047940 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 # util-linux for libblkid
 DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
-RDEPENDS_${PN} = "portmap python"
+RDEPENDS_${PN} = "portmap"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
            file://nfs-utils-1.0.6-uclibc.patch \
@@ -45,6 +45,11 @@ EXTRA_OECONF = "--with-statduser=nobody \
 
 INHIBIT_AUTO_STAGE = "1"
 
+PACKAGES =+ "${PN}-client ${PN}-stats"
+FILES_${PN}-client = "${base_sbindir}/*mount.nfs*"
+FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
+RDEPENDS_${PN}-stats = "python"
+
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
-- 
1.7.7



