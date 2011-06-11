Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVJyH-0001m6-OS
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 10:55:10 +0200
Received: by pzk36 with SMTP id 36so1634204pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 01:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=hxv7LTtUtXV1tJjHDgyEux/o0dwZb7lQjiMg9pCmL38=;
	b=nmp85iPFjUmaT2/q1wC2D50uxFlt+ao+aV2ZbDnK/nfMf5KYiM1en3PIoDuBXLnSyf
	Hr87lWIryWUWYmnGAItzdFRNxVgsFWH7oAyPIhj63vyCax/XGUHR+hXc9R8opmwKEr2p
	yv8nvDafiQvvKTtb0xObLOmmw6U8Bm13OfOK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jAxxjg79WKqEdJ7ShXJaD1WyT0TmVIGAehUAVokxQaZzJ2/1BSh+wQ4eklA3yOy11x
	eQ7YG+NaNgzpDZ4vHSzjWx2LgCkzRM0q6vcZWZmK9U33MDdLGDSV6AzEqd5sr9bX20Ag
	Twj5WHFkIhySBjvr9iMfDVhOR3PdgMO6EyHNA=
Received: by 10.142.150.17 with SMTP id x17mr510186wfd.102.1307782299496;
	Sat, 11 Jun 2011 01:51:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm3006882pbk.4.2011.06.11.01.51.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 01:51:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 01:51:12 -0700
Message-Id: <1307782272-6002-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1307782272-6002-1-git-send-email-raj.khem@gmail.com>
References: <1307782272-6002-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/3] gettext_0.18.1.1.bb: Fix build on uclibc
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
X-List-Received-Date: Sat, 11 Jun 2011 08:55:10 -0000

Use libc-uclibc override to seprate out uclibc bits
instead of using TARGET_OS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnulib-uclibc-sched_param-def.patch            |   21 ++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    7 +++--
 2 files changed, 25 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch

diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch
new file mode 100644
index 0000000..d8d10db
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch
@@ -0,0 +1,21 @@
+uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
+and is not needed too per standard. gnulib attempts to use it but we have to account
+for it because in this case uclibc does not behave like glibc.
+
+-Khem
+
+Upstream-Status: Pending
+
+Index: gettext-0.18.1.1/gettext-tools/gnulib-lib/spawn.in.h
+===================================================================
+--- gettext-0.18.1.1.orig/gettext-tools/gnulib-lib/spawn.in.h
++++ gettext-0.18.1.1/gettext-tools/gnulib-lib/spawn.in.h
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if !defined __GLIBC__ || defined __UCLIBC__
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 5f5f164..f54c111 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -12,11 +12,12 @@ PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_virtclass-native = ""
 CONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
-           file://wchar-uclibc.patch \
           "
 
-SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch;patch=1"
-SRC_URI_append_linux-uclibceabi = " file://gettext-error_print_progname.patch;patch=1"
+SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
+                               file://gettext-error_print_progname.patch \
+                               file://gnulib-uclibc-sched_param-def.patch \
+                             "
 
 SRC_URI[md5sum] = "3dd55b952826d2b32f51308f2f91aa89"
 SRC_URI[sha256sum] = "93ac71a7afa5b70c1b1032516663658c51e653087f42a3fc8044752c026443e9"
-- 
1.7.4.1



