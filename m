Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYRhK-0006uv-LD for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 01:18:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB80C1Ps021314
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 00:12:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20748-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 00:11:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB80BqUx021308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 00:11:53 GMT
Message-ID: <1323303124.971.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 00:12:04 +0000
In-Reply-To: <20111207211956.GA6351@sakrah.homelinux.org>
References: <CA+chaQfBfNs57Be9N-T1QzfZ=aXzDMN7QjKeKV8ZGnULORZjng@mail.gmail.com>
	<1323174430-24886-1-git-send-email-Martin.Jansa@gmail.com>
	<20111207211956.GA6351@sakrah.homelinux.org>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] ppl: fix libgmp paths
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
X-List-Received-Date: Thu, 08 Dec 2011 00:18:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 13:19 -0800, Khem Raj wrote:
> On (06/12/11 13:27), Martin Jansa wrote:
> > configure:10654: checking how to link with libgmpxx
> > configure:11127: result: /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libgmpxx.so /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libgmp.so -Wl,-rpath -Wl,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib -Wl,-rpath -Wl,/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-support/ppl/ppl_0.11.2.bb |    6 +++++-
> >  1 files changed, 5 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/recipes-support/ppl/ppl_0.11.2.bb b/meta/recipes-support/ppl/ppl_0.11.2.bb
> > index 7536364..b31fc4d 100644
> > --- a/meta/recipes-support/ppl/ppl_0.11.2.bb
> > +++ b/meta/recipes-support/ppl/ppl_0.11.2.bb
> > @@ -11,6 +11,10 @@ SRC_URI[sha256sum] = "e3fbd1c19ef44c6f020951807cdb6fc6a8153cd3a5c53b0ab9cf4c4f6e
> >  S = "${WORKDIR}/ppl-${PV}"
> >  BBCLASSEXTEND = "native nativesdk"
> >  
> > -EXTRA_OECONF = "--enable-watchdog --disable-debugging --disable-assertions --disable-ppl_lcdd --disable-ppl_lpsol --disable-ppl_pips --enable-interfaces='c cxx'"
> > +# do we have something shorter then this? or can native.bbclass overwrite STAGING_DIR_HOST like nativesdk does?
> > +GMP_PREFIX = "${STAGING_DIR_HOST}"
> > +GMP_PREFIX_virtclass-native = "${STAGING_DIR_NATIVE}"
> > +
> 
> I think we should override STAGING_DIR_HOST in native class as well.
> Since we do install native packages into local sysroot before populating
> the global native sysroot. The comment in class code seems that since
> we installed the native packages in position it was needed to be unset
> that may not be the case now.
> 
> RP thoughts ?

native.bbclass already sets STAGING_DIR_HOST correctly to be empty. It
looks wrong but its correct when you think about it since the installed
binaries are at their final location where we intent to execute them (in
${prefix}).

Cheers,

Richard





