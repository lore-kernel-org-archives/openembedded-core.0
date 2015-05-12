Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D007973EFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 02:13:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4C2DtC4024664
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 19:13:55 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 19:13:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 19:13:53 -0700
Message-ID: <ca5a7eca9f9930928d14e1eaf0af9a1d57a9169f.1431396786.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431396786.git.liezhi.yang@windriver.com>
References: <cover.1431396786.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bind: separate B and S
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
X-List-Received-Date: Tue, 12 May 2015 02:13:55 -0000
Content-Type: text/plain

Fix B != S and separate them.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/bind/bind_9.10.2.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.2.bb b/meta/recipes-connectivity/bind/bind_9.10.2.bb
index 539f63e..1dc15a9 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2.bb
@@ -31,7 +31,9 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_LIBDIR}/.. \
                "
-inherit autotools-brokensep update-rc.d systemd useradd pkgconfig
+inherit autotools update-rc.d systemd useradd pkgconfig
+
+PR = "r1"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
@@ -58,7 +60,7 @@ do_install_prepend() {
 	# clean host path in isc-config.sh before the hardlink created
 	# by "make install":
 	#   bind9-config -> isc-config.sh
-	sed -i -e "s,${STAGING_LIBDIR},${libdir}," ${S}/isc-config.sh
+	sed -i -e "s,${STAGING_LIBDIR},${libdir}," ${B}/isc-config.sh
 }
 
 do_install_append() {
-- 
1.7.9.5


