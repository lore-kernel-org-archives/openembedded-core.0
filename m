Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UE5pQ-0003Jk-6L for Openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 23:31:53 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r28MNPrU031141; Fri, 8 Mar 2013 22:23:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UXaySozPU5do; Fri,  8 Mar 2013 22:23:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r28MNI4r030994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 8 Mar 2013 22:23:21 GMT
Message-ID: <1362780900.9443.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 08 Mar 2013 22:15:00 +0000
In-Reply-To: <6A439775-3C47-4E34-949C-83FC024875A4@gmail.com>
References: <1362780455-31958-1-git-send-email-rich.dubielzig@windriver.com>
	<6A439775-3C47-4E34-949C-83FC024875A4@gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Rich Dubielzig <rich.dubielzig@windriver.com>,
	Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Handle QA warnings in nativesdk (denzil)
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
X-List-Received-Date: Fri, 08 Mar 2013 22:31:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-03-08 at 14:11 -0800, Khem Raj wrote:
> On Mar 8, 2013, at 2:07 PM, Rich Dubielzig <rich.dubielzig@windriver.com> wrote:
> 
> > /var/db/Makefile and /opt/(sdk path)/etc/ld.so.conf were not
> > being properly handled by the do_package task in
> > eglibc-nativesdk.  /var/db is now deleted and /etc/ld.so.conf
> > is being included in the -utils subpackage.
> > 
> > Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
> > ---
> > meta/recipes-core/eglibc/eglibc-package.inc |    3 ++-
> > meta/recipes-core/eglibc/eglibc_2.15.bb     |    2 +-
> > 2 files changed, 3 insertions(+), 2 deletions(-)
> 
> Could you rebase it on master please ?
> 
> > 
> > diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> > index 3298dea..d51d943 100644
> > --- a/meta/recipes-core/eglibc/eglibc-package.inc
> > +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> > @@ -50,7 +50,7 @@ FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
> > FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
> > FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
> > FILES_${PN}-mtrace = "${bindir}/mtrace"
> > -FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
> > +FILES_${PN}-utils = "${bindir}/* ${sbindir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
> > FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
> > FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
> > RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
> > @@ -121,5 +121,6 @@ PACKAGE_PREPROCESS_FUNCS += "eglibc_package_preprocess"
> > eglibc_package_preprocess () {
> > 	rm -rf ${PKGD}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
> > 	rm -rf ${PKGD}/${libdir}/locale
> > +	rm -rf ${PKGD}/var

Isn't this ${localstatesir} ?

And as Khem said, fixes need to be considered for master first, or at
least mention this is fixed in master if it is...

Cheers,

Richard



