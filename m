Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1QcZkA-0004hf-LK
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:10:34 +0200
Received: from [192.168.1.100] (188-220-141-241.zone11.bethere.co.uk
	[188.220.141.241])
	(using SSLv3 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPSA id 239F7A6206F;
	Fri,  1 Jul 2011 10:06:50 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <4E0D0333.8080706@linux.intel.com>
References: <1309432228.7987.14.camel@desktop.home>
	<4E0D0333.8080706@linux.intel.com>
Date: Fri, 01 Jul 2011 10:06:48 +0100
Message-Id: <1309511209.7987.42.camel@desktop.home>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 (2.26.3-1.fc11) 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for BAD_RECOMMENDATIONS to rootfs_ipk
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
X-List-Received-Date: Fri, 01 Jul 2011 09:10:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 16:13 -0700, Saul Wold wrote:
> On 06/30/2011 04:10 AM, Chris Elston wrote:
> > As discussed on IRC on 30/06/11, this patch adds support for
> > BAD_RECOMMENDATIONS to rootfs_ipk, which is a list of packages NOT to
> > install if suggested or recommended by a recipe.  Taken from
> > http://thread.gmane.org/gmane.comp.handhelds.openembedded/30417.
> >
> > Note that current support for this in oe.dev may also be broken,
> > depending on the version of opkg in use.
> >
> This patch does not seem to apply cleanly, could you please rebase and 
> resend.
> 
> Thanks
> 
> Sau!

Saul,

Apologies, mail client formatting issue.  The following should work:

As discussed on IRC on 30/06/11, this patch adds support for
BAD_RECOMMENDATIONS to rootfs_ipk, which is a list of packages NOT to
install if suggested or recommended by a recipe.  Taken from
http://thread.gmane.org/gmane.comp.handhelds.openembedded/30417.  

Note that current support for this in oe.dev may also be broken,
depending on the version of opkg in use.

Signed-off-by: Chris Elston <celston@katalix.com>

---
 meta/classes/rootfs_ipk.bbclass |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index edd84fb..bf15f4c 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -20,6 +20,9 @@ OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris"
 
 opkglibdir = "${localstatedir}/lib/opkg"
 
+# Which packages to not install on the basis of a recommendation
+BAD_RECOMMENDATIONS ?= ""
+
 fakeroot rootfs_ipk_do_rootfs () {
 	set -x
 
@@ -30,6 +33,21 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 	mkdir -p ${T}/
 
+	STATUS=${IMAGE_ROOTFS}/var/lib/opkg/status
+	mkdir -p `dirname ${STATUS}`
+
+	opkg-cl ${IPKG_ARGS} update
+
+	# prime the status file with bits that we don't want
+	for i in ${BAD_RECOMMENDATIONS}; do
+		infln="`opkg-cl ${IPKG_ARGS} info $i | grep -e '^Package:' -e '^Architecture:' -e '^Version:'`"
+		if [ ! -z "$infln" ]; then
+			echo "$infln" >> $STATUS
+			echo "Status: deinstall ok not-installed" >> $STATUS
+			echo >> $STATUS
+		fi
+ 	done
+
 	#install
 	export INSTALL_PACKAGES_ATTEMPTONLY_IPK="${PACKAGE_INSTALL_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_IPK="${LINGUAS_INSTALL}"
-- 
1.6.2.5



