Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QzQTX-0004ri-KO
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 11:55:51 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QzQOn-0006xZ-CQ
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 11:50:57 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Sep 2011 10:50:56 +0100
In-Reply-To: <1314914360.5939.574.camel@rex>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
	<4E5FB8AC.1070007@windriver.com>
	<1314896288.19905.199.camel@phil-desktop>
	<4E5FBFEC.3060406@windriver.com>
	<1314906289.2958.7.camel@lenovo.internal.reciva.com>
	<1314914360.5939.574.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314957057.19905.224.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Fri, 02 Sep 2011 09:55:51 -0000
X-Groupsio-MsgNum: 9036
Content-Type: multipart/mixed; boundary="=-SZY2jo/MKBu3SVsG0uLF"

--=-SZY2jo/MKBu3SVsG0uLF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-01 at 22:59 +0100, Richard Purdie wrote:
> The latter sounds like what we'll need to do. I haven't looked at shadow
> to see what kind of finessing is required though...

Fixing the immediate problem with shadow turned out to be rather
straightforward, see attached.  However, with this done, I now encounter
two new issues.

1. the logic around $D in useradd.bbclass seems to be backwards to me
(and, empirically, isn't working because the supposedly-created users
are not showing up in my rootfs).  Specifically, it does:

        useradd_preinst () {
        OPT=""
        SYSROOT=""
        
        if test "x$D" != "x"; then
        	# Installing into a sysroot
        	SYSROOT="${STAGING_DIR_TARGET}"
        	OPT="--root ${STAGING_DIR_TARGET}"
        
        [...]
        
        useradd_sysroot () {
        	export PSEUDO="${STAGING_DIR_NATIVE}/usr/bin/pseudo"
        	export PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}/var/pseudo"
        
        	# Explicitly set $D since it isn't set to anything
        	# before do_install
        	D=${D}
        	useradd_preinst
        }

It looks to me as though the code in useradd_preinst() should be using
SYSROOT="$D" (and likewise for OPT), and useradd_sysroot() should be
setting D=${STAGING_DIR_TARGET}.  But maybe there is some clever thing
going on here that I'm not properly understanding.

2. during rootfs construction, the script ordering is wrong.  All the
preinsts run before all the postinsts, which has always been a bit wrong
but hasn't caused too much of a problem in the past.  However,
crucially, this means that the useradd_preinst() runs before
base-passwd's postinst and hence /etc/passwd doesn't exist at the point
where useradd tries to modify it.

I can't think of any reasonable fix for (2) other than to teach
rootfs_ipk how to track package dependencies and run the scripts in the
right order.  I guess that wouldn't be impossible by any means but
trying to do it in a shell script is not a prospect that fills me with a
lot of enthusiasm.  Any better suggestions?

p.


--=-SZY2jo/MKBu3SVsG0uLF
Content-Disposition: attachment; filename="shadow.diff"
Content-Type: text/x-patch; name="shadow.diff"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 728b8e5..c5a6848 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
@@ -122,12 +122,13 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 200
 	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 200
 
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi  
-
-	pwconv
-	grpconv
+	if [ -n "$D" ]; then
+		pwconv -R $D
+		grpconv -R $D
+	else
+		pwconv
+		grpconv
+	fi
 }
 
 pkg_prerm_${PN} () {

--=-SZY2jo/MKBu3SVsG0uLF--
