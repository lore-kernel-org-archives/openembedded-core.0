Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TOycU-0002lL-RS
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 00:31:14 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TOyPc-0003j2-DK; Fri, 19 Oct 2012 00:17:56 +0200
Message-ID: <1350598517.4470.177.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 18 Oct 2012 23:15:17 +0100
In-Reply-To: <1350554547.3259.222.camel@phil-desktop>
References: <1348577801.31293.71.camel@phil-desktop>
	<50785717.8000606@linux.intel.com>
	<1350294414.3259.128.camel@phil-desktop>
	<507E2722.9020904@linux.intel.com>
	<1350514593.4470.175.camel@x121e.pbcl.net>
	<1350554381.2185.169.camel@ted>
	<1350554547.3259.222.camel@phil-desktop>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] eglibc: Move perl- and bash-using scripts to separate recipes
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
X-List-Received-Date: Thu, 18 Oct 2012 22:31:14 -0000
X-Groupsio-MsgNum: 30710
Content-Type: multipart/mixed; boundary="=-eTYlyXN7VDh6tlRiQcdh"

--=-eTYlyXN7VDh6tlRiQcdh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-10-18 at 11:02 +0100, Phil Blundell wrote:
> Ah, right, got it.  Maybe it would be better to declare a dummy
> do_evacuate_scripts() in eglibc-initial.inc instead.  I'll give that a
> try and see what happens.

That seems to work ok in at least the meta-toolchain-gmae case.  See
attached.

p.


--=-eTYlyXN7VDh6tlRiQcdh
Content-Disposition: attachment;
	filename*0=0001-eglibc-Provide-dummy-do_evacuate_scripts-for-all-var.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-eglibc-Provide-dummy-do_evacuate_scripts-for-all-var.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 9a58ce3a332a06d022a4473dd061c52f4540a540 Mon Sep 17 00:00:00 2001
From: Phil Blundell <philb@gnu.org>
Date: Thu, 18 Oct 2012 14:12:25 +0100
Subject: [PATCH] eglibc: Provide dummy do_evacuate_scripts() for all variants
 of eglibc-initial

Otherwise the nativesdk and multilib variants might crash trying to
copy a non-existent mtrace script.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-core/eglibc/eglibc-initial.inc |    5 +++++
 meta/recipes-core/eglibc/eglibc-package.inc |    8 --------
 meta/recipes-core/eglibc/eglibc_2.16.bb     |    2 +-
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index f44db0c..1520efd 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -73,3 +73,8 @@ eglibcinitial_sstate_postinst() {
 }
 
 do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}"
+
+# We don't install any scripts so there is nothing to evacuate
+do_evacuate_scripts () {
+	:
+}
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 58dd898..79c43f1 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -117,14 +117,6 @@ do_evacuate_scripts () {
 	done
 }
 
-do_evacuate_scripts_pn-eglibc-initial () {
-	:
-}
-
-do_evacuate_scripts_pn-nativesdk-eglibc-initial () {
-	:
-}
-
 addtask evacuate_scripts after do_install before do_populate_sysroot do_package
 
 PACKAGE_PREPROCESS_FUNCS += "eglibc_package_preprocess"
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 56a0a38..4d80ff4 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r17"
+PR = "r18"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21224.tar.bz2 \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
-- 
1.7.10.4


--=-eTYlyXN7VDh6tlRiQcdh--
