Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q1jmz-0008Du-6F
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 19:25:13 +0100
Received: by mail-iw0-f175.google.com with SMTP id 10so6839001iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=UQ7Mo6z4FqZVFZX1v8sxwdjb5RmWIibWYZWOH18pK+E=;
	b=WyWQ3tOiIPd3LWGPZQzZohJU7IfySDAXCNdL4Fn1QSoQPcBtSlGsGqmH7Dkgi2JQZ7
	3uiW9pPQe96uEePkcvrGvdNcmtybqEIP0EhKnM5RnC8X+Y6N8YsBwUxXlT4pXyl1ayNU
	XRtmwtSk+mdhdPOwJG4hUHplRYV4vmkLaVmcc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=WN6skST1sq2CWeVIZgDFdL4DqAqZZ/A2z0BZ9TdKDzxsbc2EVF+EmHWdXd2zRi7SQA
	bcNzImxlUqmNnQTVbANiSwY+jEt0ZhDFa4E22WChuC+E6mzEm99Og/SD3Ol4NnLg4J/7
	0ZZNzqG4ulet9miomgvWKuTO5bFQmQ5g/ztKA=
Received: by 10.43.65.65 with SMTP id xl1mr7458798icb.35.1300731806179;
	Mon, 21 Mar 2011 11:23:26 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c4sm4102929ict.7.2011.03.21.11.23.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2011 11:23:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2011 11:23:20 -0700
Message-Id: <c9c4958668d457bef286c0c1e4038db23fc099c2.1300731672.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300731672.git.raj.khem@gmail.com>
References: <cover.1300731672.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] perl-native_5.12.2.bb: Fix compliation on ubuntu 11.04-alpha
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
X-List-Received-Date: Mon, 21 Mar 2011 18:25:13 -0000

Ubuntu has moved eglibc to /usr/lib/${arch}-linux-gnu and
/lib/${arch}-linux-gnu so we need that to be added to glibpth in
Configure.

Currently we set LD=ld in environment for recipes inheriting native
class. This overrides the LD settings in the Makefiles of perl and
it tries to link by calling ld which does not work since its using
-l<x> on commandline and ubuntu linker seems not to look into
the new location for these libraries. Its better to use gcc for linking
here anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../perl/files/Configure-multilib.patch            |   10 +++++++---
 meta/recipes-devtools/perl/perl-native_5.12.2.bb   |    4 +++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/perl/files/Configure-multilib.patch b/meta/recipes-devtools/perl/files/Configure-multilib.patch
index d3948a9..b561b6a 100644
--- a/meta/recipes-devtools/perl/files/Configure-multilib.patch
+++ b/meta/recipes-devtools/perl/files/Configure-multilib.patch
@@ -1,11 +1,15 @@
---- perl-5.8.7/Configure.orig	2006-01-30 10:50:04.000000000 +0000
-+++ perl-5.8.7/Configure	2006-01-30 10:51:18.000000000 +0000
-@@ -1240,7 +1240,7 @@
+Index: perl-5.12.2/Configure
+===================================================================
+--- perl-5.12.2.orig/Configure
++++ perl-5.12.2/Configure
+@@ -1316,8 +1316,9 @@ loclibpth="/usr/local/lib /opt/local/lib
  loclibpth="$loclibpth /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib"
  
  : general looking path for locating libraries
 -glibpth="/lib /usr/lib $xlibpth"
 +glibpth="/lib /usr/lib /lib64 /usr/lib64 $xlibpth"
  glibpth="$glibpth /usr/ccs/lib /usr/ucblib /usr/local/lib"
++test -f /usr/lib/`uname -m`-linux-gnu/libc.so && glibpth="/usr/lib/`uname -m`-linux-gnu $glibpth"
  test -f /usr/shlib/libc.so && glibpth="/usr/shlib $glibpth"
  test -f /shlib/libc.so     && glibpth="/shlib $glibpth"
+ test -d /usr/lib64         && glibpth="$glibpth /lib64 /usr/lib64 /usr/local/lib64"
diff --git a/meta/recipes-devtools/perl/perl-native_5.12.2.bb b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
index 9af7b06..6776aed 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
-PR = "r7"
+PR = "r8"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
@@ -28,6 +28,8 @@ S = "${WORKDIR}/perl-${PV}"
 
 inherit native
 
+export LD="${CC}"
+
 do_configure () {
 	./Configure \
 		-Dcc="${CC}" \
-- 
1.7.4.1



