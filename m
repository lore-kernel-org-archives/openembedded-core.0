Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C4B496F6CB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 12:00:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s33C0LMt024481; Thu, 3 Apr 2014 13:00:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WrYdwNaoWFDH; Thu,  3 Apr 2014 13:00:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s33C0EGS024475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 3 Apr 2014 13:00:16 +0100
Message-ID: <1396526409.2910.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <Kai.Kang@windriver.com>
Date: Thu, 03 Apr 2014 13:00:09 +0100
In-Reply-To: <533B7788.7000301@windriver.com>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
	<1396275649-32352-2-git-send-email-kai.kang@windriver.com>
	<533B7788.7000301@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Apr 2014 12:00:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2014-04-02 at 10:35 +0800, Kang Kai wrote:
> On 2014年03月31日 22:20, Kai Kang wrote:
> > From: Roy Li <rongqing.li@windriver.com>
> >
> > When native package is built, use the uname to return the kernel version.
> >
> > When target is built, read kernel version from ${STAGING_KERNEL_DIR}/kernel-abiversion
> > to avoid to use the hardcode kernel version.
> >
> > Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >   meta/recipes-support/nss/nss.inc | 15 +++++++++++++--
> >   1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
> > index 404decc..f24da68 100644
> > --- a/meta/recipes-support/nss/nss.inc
> > +++ b/meta/recipes-support/nss/nss.inc
> > @@ -26,6 +26,7 @@ SRC_URI_append_class-target = "\
> >   inherit siteinfo
> >   PR = "r0"
> >   DEPENDS = "sqlite3 nspr zlib nss-native"
> > +DEPENDS_append_class-target += "virtual/kernel"
> >   DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
> >   RDEPENDS_${PN} = "perl"
> >   
> > @@ -37,12 +38,24 @@ TARGET_CC_ARCH += "${LDFLAGS}"
> >   do_compile_prepend_class-native() {
> >       export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
> >       export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
> > +    export OS_RELEASE=`uname -r`
> >   }
> >   
> >   do_compile_prepend_class-nativesdk() {
> >       export LDFLAGS=""
> >   }
> >   
> > +do_compile_prepend_class-target() {
> > +    export OS_RELEASE=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion|sed 's/-.*//'`
> > +}
> > +
> > +do_install_prepend_class-native() {
> > +    export OS_RELEASE=`uname -r`
> > +}
> > +
> > +do_install_prepend_class-target() {
> > +    export OS_RELEASE=`cat ${STAGING_KERNEL_DIR}/kernel-abiversion|sed 's/-.*//'`
> > +}
> >   do_compile() {
> >       export CROSS_COMPILE=1
> >       export NATIVE_CC="gcc"
> > @@ -57,7 +70,6 @@ do_compile() {
> >       export NSS_USE_SYSTEM_SQLITE=1
> >       export NSS_ENABLE_ECC=1
> >   
> > -    export OS_RELEASE=3.4
> 
> How about use var LINUXLIBCVERSION:
> 
> export OS_RELEASE="${@d.getVar('LINUXLIBCVERSION', True)}"
> 
> it should be the same value with kernel version, right?

As others have replied, that is usually much more recent than the oldest
kernel we support. What does nss do with this value? Is it about the
header versions? Would something run on an older kernel with a newer
value for OS_RELEASE?

We also have the OLDEST_KERNEL variable (currently at 2.6.16) FWIW.

Cheers,

Richard


