Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rkg5B-0006Xh-Gq for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:06:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0AHwX6e012854
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 17:58:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12415-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 17:58:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0AHwMGO012847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 17:58:23 GMT
Message-ID: <1326218304.23315.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2012 17:58:24 +0000
In-Reply-To: <1326193275.12160.65.camel@phil-desktop>
References: <cover.1326174744.git.sgw@linux.intel.com>
	<b93626c9cd63c844f1836dc7baed7254dc171e74.1326174744.git.sgw@linux.intel.com>
	<1326193275.12160.65.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 14/22] default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc
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
X-List-Received-Date: Tue, 10 Jan 2012 18:06:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-10 at 11:01 +0000, Phil Blundell wrote:
> On Mon, 2012-01-09 at 21:54 -0800, Saul Wold wrote:
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> > index e1594f3..0b515e5 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -10,6 +10,8 @@ LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
> >  ENABLE_BINARY_LOCALE_GENERATION ?= "1"
> >  LOCALE_UTF8_ONLY ?= "0"
> >  
> > +DISTRO_FEATURES_LIBC_libc-uclibc ?= "ipv4 ipv6 largefile libc-posix-clang-wchar"
> > +
> >  DISTRO_FEATURES_LIBC ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> >  					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> >  					libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
> 
> This looks like a bad idea to me.  I think that override will cause
> potentially surprising behaviour for folks who are trying to set
> DISTRO_FEATURES_LIBC by hand.  And, as far as I can tell, this patch
> won't make any functional difference since uclibc will just ignore the
> features it doesn't understand.

Agreed. If this really is an issue we could do something like:

DEFAULTLIBFEATURES = "xxx"
DEFAULTLIBFEATURES_libc-uclibc = "yyy"
DISTRO_FEATURES_LIBC ?= "${DEFAULTLIBCFEATURES}"

Cheers,

Richard



