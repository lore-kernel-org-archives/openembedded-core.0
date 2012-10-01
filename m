Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TIep7-0004OZ-Ow
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 14:10:09 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 01 Oct 2012 04:57:11 -0700
Received: by weyt44 with SMTP id t44so2863048wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2012 04:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=n6wlCtG3mpEsbWY4AP9knvgwsb5H16vjAt5fZjJnI+E=;
	b=SfoxDdbvgxmIG9kJ2A0pgNLPAV8pewczkF2cxse4zyOdkcvDK17/lrnVHag7wG7LG5
	wSWaEBbnewRioECU8n7DBC5h7+51MuqXuPTTbwmaZJXu45z1jRgFn1jXr//hzQEAV2zo
	KCY9icQQJtBebt4NpypZFnfmNRUu8bZQd05D34qEyrn1SMMaGTiYK1LsF4Flra090z/j
	AMA6Cy+OX/gLXjqasIVDC4Rvs85u/2Y6GvPO6WZarqSJ6iYoVR6Ghq4/VMqusT2gFXQF
	GgytI9O3d6v6XgoJuYIXJNqXdsRBIghiTZJbUlQSK4h2uMKtgcJ2yyk9rCM0gSVwvZGu
	SGWQ==
Received: by 10.180.87.132 with SMTP id ay4mr3645810wib.5.1349092629406;
	Mon, 01 Oct 2012 04:57:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cn6sm18253009wib.9.2012.10.01.04.57.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 04:57:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Oct 2012 12:56:09 +0100
Message-Id: <1349092569-26895-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmN7drj+ykcIvlVrQKDGw/A/drTC1VBQOw2hOEO7WDVCjr5o2TH0e2FjGtfxxqBl28kNQ1b
Subject: [PATCH] libdrm: Remove Cairo dependency
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
X-List-Received-Date: Mon, 01 Oct 2012 12:10:10 -0000

From: Daniel Stone <daniel@fooishbar.org>

This causes a build loop, when DRM depends on Cairo depends on Mesa
depends on DRM.  We can safely remove it as it's only one libdrm example
program which uses Cairo, which we won't be needing.  At least it's not
worth the build loop.

Signed-off-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/drm/libdrm.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index 5ddab85..cc09791 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -9,9 +9,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
 PROVIDES = "drm"
-DEPENDS = "libpthread-stubs udev cairo"
+DEPENDS = "libpthread-stubs udev"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 #libpciaccess is required starting from libdrm 2.4.26
 DEPENDS += " libpciaccess"
-- 
1.7.10



