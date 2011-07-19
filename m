Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4Z-000258-1P
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:22:03 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so3528794iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UZXtu678+LuHngBVxJX7cYYDvCTG+mzmMTup5a/jAQE=;
	b=lF5tU/mW2mGNAUYCROHf7ZMaFKjlE2S6/kNUMVwwhufROZzag01w2v73Si81WJNw7F
	NT2ufvSAGPZMrw/+1SNHGV1V4pT4KmptjSHcLcJ9Hkw9J2AJWDLPaueaRwOWIypDPWiF
	rWdAL9KncxodM3P7mPUhk6mIpOAURdOspssv0=
Received: by 10.42.172.130 with SMTP id n2mr7716052icz.43.1311034680555;
	Mon, 18 Jul 2011 17:18:00 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:18:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:33 -0700
Message-Id: <d12eac7e3b3d9c368f99e4163fb297858e577d00.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 14/16] clutter-box2d: Replace use of finite macro with C99 compliant isfinite()
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
X-List-Received-Date: Tue, 19 Jul 2011 00:22:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clutter/clutter-box2d/isfinite.patch           |   19 +++++++++++++++++++
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    6 ++++--
 2 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch

diff --git a/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
new file mode 100644
index 0000000..fd2bf74
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-box2d/isfinite.patch
@@ -0,0 +1,19 @@
+_finite is obsoleted and C99 has isfinite instead so we should use it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h
+===================================================================
+--- clutter-box2d-0.10.0.orig/box2d/Source/Common/b2Math.h	2008-12-16 06:42:10.000000000 -0800
++++ clutter-box2d-0.10.0/box2d/Source/Common/b2Math.h	2011-07-17 02:10:29.833825198 -0700
+@@ -60,7 +60,7 @@
+ #ifdef _MSC_VER
+ 	return _finite(x) != 0;
+ #else
+-	return finite(x) != 0;
++	return std::isfinite(x) != 0;
+ #endif
+ }
+ 
diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
index bfd46b2..06f5fa2 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -4,9 +4,11 @@ LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6
 
 SRCREV = "4799ac10ae8cb7da936a2b999aba58fe62eb1ee3"
 PV = "0.10.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "git://git.gnome.org/clutter-box2d.git"
+SRC_URI = "git://git.gnome.org/clutter-box2d.git \
+           file://isfinite.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1



