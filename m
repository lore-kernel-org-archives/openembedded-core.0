Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qzuwc-0004FX-Jo
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 20:27:55 +0200
Received: by bkbzu17 with SMTP id zu17so3341488bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Sep 2011 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=miwRSxiCQpynftG3RV24pVIypHx6lX+VUup7gnauUUo=;
	b=Cd7OBbccbG3lwNM6QWNG6xvzDpxmWzqMcmM6aFiNBJ3TyiS/P2HLP2q23b1bMnpMNX
	6DmWAgQcGryzKzzs8uBsHY6UBG1o3toKh7woFp2jo19bxYXgY6ZvvX7Ce5ToZKtToeBN
	UN0ySmyZvGGkdzKdktBG8v/ri0A9+uq4zFwNo=
Received: by 10.204.133.76 with SMTP id e12mr1289253bkt.15.1315074175776;
	Sat, 03 Sep 2011 11:22:55 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id q9sm1082438bkd.8.2011.09.03.11.22.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 11:22:54 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2011 22:22:43 +0400
Message-Id: <1315074165-20137-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 1/3] zaurusd: enable support for collie
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
X-List-Received-Date: Sat, 03 Sep 2011 18:27:55 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../0001-zaurusd-add-support-for-collie.patch      |   50 ++++++++++++++++++++
 meta/recipes-bsp/zaurusd/zaurusd_git.bb            |    3 +-
 2 files changed, 52 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch

diff --git a/meta/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch b/meta/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
new file mode 100644
index 0000000..36ded13
--- /dev/null
+++ b/meta/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch
@@ -0,0 +1,50 @@
+From 85b94bed1feab70bc529a59fb80c26da825b9abe Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+Date: Fri, 5 Aug 2011 16:00:10 +0400
+Subject: [PATCH] zaurusd: add support for collie
+Upstream-Status: Pending
+
+Note: alsa mixer support is disabled, as collie doesn't support sound (yet).
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ config/mach-config/mach-collie-functions |    4 ++++
+ config/mach-config/mach-collie-vars.in   |    3 +++
+ configure.ac                             |    1 +
+ 3 files changed, 8 insertions(+), 0 deletions(-)
+ create mode 100644 config/mach-config/mach-collie-functions
+ create mode 100644 config/mach-config/mach-collie-vars.in
+
+diff --git a/config/mach-config/mach-collie-functions b/config/mach-config/mach-collie-functions
+new file mode 100644
+index 0000000..4d77c53
+--- /dev/null
++++ b/config/mach-config/mach-collie-functions
+@@ -0,0 +1,4 @@
++HAVE_INPUT_SWITCHES=0
++HAVE_TSKEYS=0
++HAVE_ALSA_MIXER=0
++
+diff --git a/config/mach-config/mach-collie-vars.in b/config/mach-config/mach-collie-vars.in
+new file mode 100644
+index 0000000..ec1bfb8
+--- /dev/null
++++ b/config/mach-config/mach-collie-vars.in
+@@ -0,0 +1,3 @@
++MACHINE=collie
++
++ALSA_MIXER_INIT=@appconfdir@/alsa/5500-default.state
+diff --git a/configure.ac b/configure.ac
+index 78ea2ae..5160fab 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -65,6 +65,7 @@ AC_CONFIG_FILES([
+   config/config
+   config/mach-config/mach-akita-vars
+   config/mach-config/mach-borzoi-vars
++  config/mach-config/mach-collie-vars
+   config/mach-config/mach-corgi-vars
+   config/mach-config/mach-husky-vars
+   config/mach-config/mach-poodle-vars
+--
+1.7.2.5
diff --git a/meta/recipes-bsp/zaurusd/zaurusd_git.bb b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
index 3b8cc43..ebc3c66 100644
--- a/meta/recipes-bsp/zaurusd/zaurusd_git.bb
+++ b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -7,9 +7,10 @@ RDEPENDS_${PN} = "xrandr"
 
 SRCREV = "82b30c7865f007fff81372c3cdc71b2ff6843ccc"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+	file://0001-zaurusd-add-support-for-collie.patch \
 	file://fix_makefile.patch"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



