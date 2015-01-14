Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13FB172AE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8liK2022123
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:44 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:29 -0800
Message-ID: <28f30ea3409d2ed46e6dbf7c058deb60a2cf3b8d.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 18/27] alsa-utils: fix B != S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:48 -0000
Content-Type: text/plain

And bump the PR to avoid:
configure: error: source directory already configured; run "make distclean" there first

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../alsa/alsa-utils-alsaconf_1.0.28.bb             |    2 +-
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb  |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.28.bb
index 968c81e..2d49cc5 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.28.bb
@@ -13,5 +13,5 @@ S = "${WORKDIR}/alsa-utils-${PV}"
 
 do_install() {
 	install -d ${D}${sbindir}
-	install -m 0755 ${S}/alsaconf/alsaconf ${D}${sbindir}/
+	install -m 0755 ${B}/alsaconf/alsaconf ${D}${sbindir}/
 }
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
index 5f35d76..ac5512a 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
@@ -25,7 +25,9 @@ SRC_URI[sha256sum] = "f3ff4c89b0125a7797b1b13cd094cc92276e655458274967386e812d03
 #
 EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
 
-inherit autotools-brokensep gettext pkgconfig
+PR = "r1"
+
+inherit autotools gettext pkgconfig
 
 # This are all packages that we need to make. Also, the now empty alsa-utils
 # ipk depends on them.
-- 
1.7.9.5


