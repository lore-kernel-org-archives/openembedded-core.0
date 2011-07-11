Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1QgFRF-0002Nh-72
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 14:18:19 +0200
Received: from [192.168.1.100] (188-220-141-241.zone11.bethere.co.uk
	[188.220.141.241])
	(using SSLv3 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPSA id BB31CA6206C;
	Mon, 11 Jul 2011 13:14:16 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: Phil Blundell <pb@pbcl.net>
In-Reply-To: <1310374822.6337.150.camel@phil-desktop>
References: <1309432228.7987.14.camel@desktop.home>
	<4E0D0333.8080706@linux.intel.com>	<1309511209.7987.42.camel@desktop.home>
	<1309512008.2633.14.camel@phil-desktop>
	<4E14E0C7.6040604@linux.intel.com>
	<1310374426.10512.3.camel@desktop.home>
	<1310374822.6337.150.camel@phil-desktop>
Date: Mon, 11 Jul 2011 13:14:15 +0100
Message-Id: <1310386455.10512.185.camel@desktop.home>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 (2.26.3-1.fc11) 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for BAD_RECOMMENDATIONS to rootfs_ipk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: celston@katalix.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 11 Jul 2011 12:18:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 10:00 +0100, Phil Blundell wrote:
> On Mon, 2011-07-11 at 09:53 +0100, Chris Elston wrote:
> > +       STATUS=${IMAGE_ROOTFS}${opkglibdir}/status
> > +       mkdir -p `dirname ${STATUS}`
> 
> Not that it's a massive deal, but this call to "dirname" is redundant
> since dirname ${STATUS} is ${IMAGE_ROOTFS}${opkglibdir} by definition.
> 
> > +       # prime the status file with bits that we don't want
> > +       for i in ${BAD_RECOMMENDATIONS}; do
> > +               infln="`opkg-cl ${IPKG_ARGS} info $i | grep -e
> > '^Package:' -e '^Architecture:' -e '^Version:'`"
> > +               if [ ! -z "$infln" ]; then
> > +                       echo "$infln" >> $STATUS
> 
> Reading this again I wonder what would happen if one of the packages
> named in BAD_RECOMMENDATIONS doesn't actually exist.  Can you verify
> that this code does something sensible in that case?

You were right, Phil - it did fail in the case that a BAD_RECOMMENDATION didn't exist.
Patch updated to take account of that case, and also removed the dirname call.

Saul, resubmission below.

Cheers,

Chris.

---

As discussed on IRC on 30/06/11, this patch adds support for
BAD_RECOMMENDATIONS to rootfs_ipk, which is a list of packages NOT to
install if suggested or recommended by a recipe.  Taken from
http://thread.gmane.org/gmane.comp.handhelds.openembedded/30417.  

Note that current support for this in oe.dev may also be broken,
depending on the version of opkg in use.

Signed-off-by: Chris Elston <celston@katalix.com>

---
 meta/classes/rootfs_ipk.bbclass |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index edd84fb..1540432 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -20,6 +20,9 @@ OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris"
 
 opkglibdir = "${localstatedir}/lib/opkg"
 
+# Which packages to not install on the basis of a recommendation
+BAD_RECOMMENDATIONS ?= ""
+
 fakeroot rootfs_ipk_do_rootfs () {
 	set -x
 
@@ -29,6 +32,23 @@ fakeroot rootfs_ipk_do_rootfs () {
 	${OPKG_PREPROCESS_COMMANDS}
 
 	mkdir -p ${T}/
+ 
+	STATUS=${IMAGE_ROOTFS}${opkglibdir}/status
+	mkdir -p ${IMAGE_ROOTFS}${opkglibdir}
+
+	opkg-cl ${IPKG_ARGS} update
+
+	# prime the status file with bits that we don't want
+	for i in ${BAD_RECOMMENDATIONS}; do
+		pkginfo="`opkg-cl ${IPKG_ARGS} info $i`"
+		if [ ! -z "$pkginfo" ]; then
+			echo "$pkginfo" | grep -e '^Package:' -e '^Architecture:' -e '^Version:' >> $STATUS
+			echo "Status: deinstall ok not-installed" >> $STATUS
+			echo >> $STATUS
+		else
+			echo "Requested ignored recommendation $i is not a package"
+		fi
+	done
 
 	#install
 	export INSTALL_PACKAGES_ATTEMPTONLY_IPK="${PACKAGE_INSTALL_ATTEMPTONLY}"
-- 
1.6.2.5



