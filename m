Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T8ojI-0001Im-KQ; Tue, 04 Sep 2012 10:43:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q848V5mP015026;
	Tue, 4 Sep 2012 09:31:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14679-02; Tue,  4 Sep 2012 09:31:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q848UxTY015020
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 09:31:00 +0100
Message-ID: <1346747458.30964.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 04 Sep 2012 09:30:58 +0100
In-Reply-To: <20120904081858.GA3372@jama.jama.net>
References: <20120902125724.B93CA10357@opal>
	<20120904081858.GA3372@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : perl: Fix various nativesdk build issues
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
X-List-Received-Date: Tue, 04 Sep 2012 08:43:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-04 at 10:18 +0200, Martin Jansa wrote:
> >  meta/recipes-devtools/perl/perl_5.14.2.bb |   12 +++++++-----
> >  1 files changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> > index 9db3805..3c1360f 100644
> > --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> > +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
> >  # We need gnugrep (for -I)
> >  DEPENDS = "virtual/db grep-native"
> >  DEPENDS += "gdbm zlib"
> > -PR = "r8"
> > +PR = "r9"
> >  
> >  # 5.10.1 has Module::Build built-in
> >  PROVIDES += "libmodule-build-perl"
> > @@ -90,6 +90,8 @@ export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
> >  # LDFLAGS for shared libraries
> >  export LDDLFLAGS = "${LDFLAGS} -shared"
> >  
> > +LDFLAGS_append = " -fstack-protector"
> > +
> >  # We're almost Debian, aren't we?
> >  CFLAGS += "-DDEBIAN"
> >  
> > @@ -148,10 +150,10 @@ do_configure() {
> >                 -e 's,@ARCH@-thread-multi,,g' \
> >                 -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
> >                 -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
> > -               -e "s%/usr/include%${STAGING_INCDIR}%g" \
> > -	       -e 's,/usr/lib/,${libdir}/,g' \
> > -	       -e 's,/usr/,${exec_prefix}/,g' \
> > -	       -e 's,/perl5,/perl,g' \
> > +               -e "s%\([ \"^\',=]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
> > +	       -e "s%\([ \"^\',=]\+\)/usr/lib/%\1${libdir}/%g" \
> > +	       -e "s%\([ \"^\',=]\+\)/usr/%\1${exec_prefix}/%g" \
> > +	       -e "s%/perl5%/perl%g" \
> >              config.sh-${TARGET_ARCH}-${TARGET_OS}
> >  
> >  	case "${TARGET_ARCH}" in
> 
> Not sure if it's caused by this, 


FWIW we never used to build nativesdk-perl at all. So bugs here are new
and due to the system being more correct about missing dependencies. Of
course nativesdk-perl should build, I just want to be clear this is a
new issue.

> but nativesdk-perl now fails to
> do_install()
> 
> make[1]: Nothing to be done for `install.man'.
> make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/perl-5.14.2'
> ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/bin/perl': No such file or directory
> ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/lib/perl5': No such file or directory
> rmdir: failed to remove '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/lib/perl/site_perl/5.14.2': No such file or directory
> rmdir: failed to remove '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/lib/perl/site_perl': No such file or directory
> mv: cannot stat '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/lib/perl/5.14.2/CORE/libperl.so': No such file or directory
> ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/lib/libperl.so.5': No such file or directory
> ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image//usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/lib/perl/5.14.2/CORE/libperl.so': No such file or directory
> install: cannot create regular file '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/lib/perl': No such file or directory
> ln: failed to create symbolic link '/OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/image/usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/lib/perl/5.14.2/Config_heavy-target.pl': No such file or directory
> 
> And files are all installed in wrong directory (sysroot path repeated twice):
> OE @ ~/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-5.14.2-r9/perl-5.14.2 $ ls /OE/shr-core/tmp-eglibc/work/i686-nativesdk-oesdk-linux/nativesdk-perl-
> 5.14.2-r9/image/usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/local/oecore-i686/sysroots/i686-oesdk-linux/usr/bin/
> a2p          corelist   cpanp           enc2xs     h2xs       libnetcfg   perlbug  perlthanks  pod2latex  pod2usage   prove    ptar      s2p     xsubpp
> c2ph         cpan       cpanp-run-perl  find2perl  instmodsh  perl        perldoc  piconv      pod2man    podchecker  psed     ptardiff  shasum
> config_data  cpan2dist  dprofpp         h2ph       json_pp    perl5.14.2  perlivp  pl2pm       pod2text   podselect   pstruct  ptargrep  splain

This is likely a sign that some sed is happening twice to the perl
config files. You can see my patch above fixes some of them, looks like
there is still another one somewhere in there :(

Cheers,

Richard




