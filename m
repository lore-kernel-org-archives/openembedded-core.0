Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RFndw-0007dc-Mf
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 15:54:16 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RFnYM-0007wE-CH
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 15:48:30 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 17 Oct 2011 14:48:29 +0100
In-Reply-To: <1318855942-8677-1-git-send-email-Martin.Jansa@gmail.com>
References: <1318855942-8677-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1318859310.22985.114.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [RFC] bitbake.conf: include only ${libdir}/${BPN}/*${SOLIBS} not whole ${libdir}/${BPN}/* in FILES_${PN}-dev
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
X-List-Received-Date: Mon, 17 Oct 2011 13:54:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-17 at 14:52 +0200, Martin Jansa wrote:
> * ie syslog-ng has a lot of .so and .la files in ${libdir}/${BPN}/ and
>   fails with this QA check:
> | ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: syslog-ng path
> '/work/i586-oe-linux/syslog-ng-3.2.2-r6.1/packages-split/syslog-ng/usr/lib/syslog-ng/libafsocket.so'
> * I haven't tried to rebuild from scratch to check if this changes is
>   creating more QA issues about unpackaged files then what is trying to
>   fix (ie in syslog-ng), that's why it's RFC
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

The subject line of this patch doesn't seem to match what it's actually
doing.  

If there are .la or .so files in ${libdir}/${PN} that are causing a
problem then it does seem reasonable to add them to FILES_${PN}-dev.
But I don't think that restricting the scope of FILES_${PN} is
desirable, or ought to be necessary.

p.

> ---
>  meta/conf/bitbake.conf |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e2c1b6f..772c09e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -262,7 +262,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
>              ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>              ${base_bindir}/* ${base_sbindir}/* \
>              ${base_libdir}/*${SOLIBS} \
> -            ${datadir}/${BPN} ${libdir}/${BPN}/* \
> +            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
>              ${datadir}/pixmaps ${datadir}/applications \
>              ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
>              ${libdir}/bonobo/servers"
> @@ -271,7 +271,7 @@ FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
>              ${datadir}/gnome/help"
>  SECTION_${PN}-doc = "doc"
>  
> -FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
> +FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*${SOLIBSDEV} ${libdir}/*.la \
>                  ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
>                  ${datadir}/aclocal ${base_libdir}/*.o"
>  SECTION_${PN}-dev = "devel"




