Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R1wnu-0001QR-Pe
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 10:51:18 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1R1wj2-00089S-33; Fri, 09 Sep 2011 10:46:16 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Sep 2011 09:46:15 +0100
In-Reply-To: <4E68E2EF.10402@intel.com>
References: <1315427297.4368.4.camel@lenovo.internal.reciva.com>
	<4E683D5E.70103@linux.intel.com>
	<1315464889.4368.6.camel@lenovo.internal.reciva.com>
	<4E68E2EF.10402@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1315557976.2519.88.camel@phil-desktop>
Mime-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH] dbus: fix paths in startup script, use useradd.bbclass for user creation
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
X-List-Received-Date: Fri, 09 Sep 2011 08:51:18 -0000
X-Groupsio-MsgNum: 9268
Content-Type: multipart/mixed; boundary="=-Z60cWwSmf4WJsAa1StfS"

--=-Z60cWwSmf4WJsAa1StfS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-08 at 08:44 -0700, Scott Garman wrote:
> In any case, please submit your patch and I will advocate for its 
> inclusion in our 1.1 release.

As requested.

p.


--=-Z60cWwSmf4WJsAa1StfS
Content-Disposition: attachment; filename="0001-shadow-add-patch-for-useradd-lossage.patch"
Content-Type: text/x-patch; name="0001-shadow-add-patch-for-useradd-lossage.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 6ac00e3ced33a4b8eb43fd83d786a192e6f4f5c1 Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@gnu.org>
Date: Wed, 7 Sep 2011 13:02:10 +0100
Subject: [PATCH] shadow: add patch for useradd lossage

This fixes (or, at least, papers over) a failure in do_install for recipes which 
inherit useradd.bbclass.  Rewinding optind in this way is not entirely portable
but in practice it seems to work on GNU-ish build hosts at least.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-extended/shadow/files/useradd.patch   |   17 +++++++++++++++++
 .../shadow/shadow-native_4.1.4.3.bb                |    5 +++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/useradd.patch

diff --git a/meta/recipes-extended/shadow/files/useradd.patch b/meta/recipes-extended/shadow/files/useradd.patch
new file mode 100644
index 0000000..ff5016c
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/useradd.patch
@@ -0,0 +1,17 @@
+Work around a bug introduced with the --root option which was causing
+all other arguments to be ignored.
+
+Upstream-Status: inappropriate
+Signed-off-by: Phil Blundell <philb@gnu.org>
+
+--- a/src/useradd.c~	2011-09-01 15:36:40.398234861 +0100
++++ b/src/useradd.c	2011-09-01 17:29:00.782004133 +0100
+@@ -1957,6 +1957,8 @@
+ 
+ 	get_defaults ();
+ 
++	optind = 1;
++
+ 	process_flags (argc, argv);
+ 
+ #ifdef ACCT_TOOLS_SETUID
diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
index 485495e..c29e4c1 100644
--- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
@@ -7,13 +7,14 @@ LICENSE = "BSD | Artistic"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://shadow.automake-1.11.patch \
            file://shadow-4.1.3-dots-in-usernames.patch \
            file://shadow-4.1.4.2-env-reset-keep-locale.patch \
-           file://add_root_cmd_options.patch"
+           file://add_root_cmd_options.patch \
+	   file://useradd.patch"
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778" 
-- 
1.7.4.1


--=-Z60cWwSmf4WJsAa1StfS--
