Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVcCY-0001kx-QP
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jun 2011 06:23:07 +0200
Received: by mail-pz0-f50.google.com with SMTP id 2so1743305pzk.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 21:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=hxv7LTtUtXV1tJjHDgyEux/o0dwZb7lQjiMg9pCmL38=;
	b=aqoNdGZc79Fv3Smjzj2T1XO39ZSHcbT4smXxYr9kpyd8jCIA3S1L4Zi/aF9CWgGOhC
	MPA7EfWrHlWGJ7nqXKXSWJ1LCNlegxbXdPzo4IMMD5Xjvv4hCrBe5aSTg1PlMFqAZ4Aw
	x7FXuShKEW3MQ4p8PO+/HcXzCz/BdUOOONsxc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sIDNIHj+nlhf4pFgUu6Hd22hHGEju4e+fcToIrtJL44YTFWCBM7foPjh7o9YXqo9cm
	KsDLBh2eMBIYLonzUCvdctqAUVklHNb9DCopruIgiMykOkLmQP1/9lJ0Tesr+VV1j0qJ
	goHxYu5GTmSlNFvMj03TRGnlyyzwtop5OmsoM=
Received: by 10.142.248.29 with SMTP id v29mr621765wfh.81.1307852375133;
	Sat, 11 Jun 2011 21:19:35 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x1sm3579520pbb.18.2011.06.11.21.19.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 21:19:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 21:19:04 -0700
Message-Id: <ced1300307866a726edb97475d07e4f2cc9cb306.1307852182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
References: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
In-Reply-To: <cover.1307852182.git.raj.khem@gmail.com>
References: <cover.1307852182.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] gettext_0.18.1.1.bb: Fix build on uclibc
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
X-List-Received-Date: Sun, 12 Jun 2011 04:23:07 -0000

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



