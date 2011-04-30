Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGIMC-00024X-9q
	for openembedded-core@lists.openembedded.org;
	Sun, 01 May 2011 00:09:44 +0200
Received: by mail-px0-f172.google.com with SMTP id 6so1467115pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 15:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Gk7PsW+/ABcoaXEvzB2WeulIk1UQpy3AvOJFxdkRTrY=;
	b=RslwPmT33MsnquR7xlkk0JC/VBTMIMxnRdyaFed04pIQOZ94ImdxD8zT482U4Ol6z3
	fvhDnUZVHn8QExTAUr/8Sppw6NuUAnvPcouVhflShxrS0F6+3XSsLNFyWyf7iYzwoCRi
	acJ4kirr8bfx6ZTiJKZMzLkTbTCC7eZNKwAJw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qoESL1j//GkXtJGks4mobP/Oj1oIz3EYYjscK2jhyzl+QfRErpghjxyPkZIUfw19Qm
	qjwWRfML2C+FLpTeVVF4ygIMMeFxhT8WQbYPqep1TzoZ/j0AzhwqM8Vk1jREHzToXNhM
	oYydw872OklO3+pb1oB7saOGux0UGpRDYnBOY=
Received: by 10.68.55.164 with SMTP id t4mr4531323pbp.469.1304201231380;
	Sat, 30 Apr 2011 15:07:11 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i7sm2790010pbs.19.2011.04.30.15.07.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 30 Apr 2011 15:07:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Apr 2011 15:07:01 -0700
Message-Id: <f79ca6085cffcc03b657191214f5a5a301adb2eb.1304200899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304200899.git.raj.khem@gmail.com>
References: <cover.1304200899.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] alsa-utils_1.0.24.2.bb: Fix build for uclibc targets
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
X-List-Received-Date: Sat, 30 Apr 2011 22:09:44 -0000

uclibc does not have exp10() implemented so we obtain
same behaviour using pow()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc-exp10-replacement.patch                 |   21 ++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    4 ++-
 2 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch
new file mode 100644
index 0000000..038c90d
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/uclibc-exp10-replacement.patch
@@ -0,0 +1,21 @@
+uclibc does not have exp10 function which is glibc extension.
+Bur we can get the same behavior by using pow()
+
+Upstream-status: Pending
+
+Khem Raj <raj.khem@gmail.com>
+
+Index: alsa-utils-1.0.24.2/alsamixer/volume_mapping.c
+===================================================================
+--- alsa-utils-1.0.24.2.orig/alsamixer/volume_mapping.c
++++ alsa-utils-1.0.24.2/alsamixer/volume_mapping.c
+@@ -36,6 +36,9 @@
+ #include <math.h>
+ #include <stdbool.h>
+ #include "volume_mapping.h"
++#ifdef __UCLIBC__
++#define exp10(x) (pow(10, (x)))
++#endif /* __UCLIBC__ */
+ 
+ #define MAX_LINEAR_DB_SCALE	24
+ 
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
index c882bfd..4cb31a9 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
@@ -9,7 +9,9 @@ DEPENDS = "alsa-lib ncurses"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://ncursesfix.patch"
+           file://ncursesfix.patch \
+           file://uclibc-exp10-replacement.patch \
+          "
 
 SRC_URI[md5sum] = "8238cd57cb301d1c36bcf0ecb59ce6b2"
 SRC_URI[sha256sum] = "95127f740291086486c06c28118cabca0814bde48fd14dac041a9812a5ac1be2"
-- 
1.7.4.1



