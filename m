Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbWCT-0005Hu-VJ for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 13:11:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SB7ibo022116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 12:07:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21909-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 12:07:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SB7ZbY022110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 12:07:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309252054.21613.329.camel@phil-desktop>
References: <cover.1309163663.git.dongxiao.xu@intel.com>
	<cdd1860f64f84b58d18d1c6bed1805456d8d3e2e.1309163663.git.dongxiao.xu@intel.com>
	<1309165102.21613.234.camel@phil-desktop>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6ADBBD3@shsmsx501.ccr.corp.intel.com>
	<1309252054.21613.329.camel@phil-desktop>
Date: Tue, 28 Jun 2011 12:07:22 +0100
Message-ID: <1309259242.20015.237.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Tue, 28 Jun 2011 11:11:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 10:07 +0100, Phil Blundell wrote:
> On Tue, 2011-06-28 at 08:51 +0800, Xu, Dongxiao wrote:
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > > Phil Blundell
> > > Sent: Monday, June 27, 2011 4:58 PM
> > > To: Patches and discussions about the oe-core layer
> > > Subject: Re: [OE-core] [PATCH 1/1] libc-locale: split locale handling from libc
> > > recipe.
> > > 
> > > On Mon, 2011-06-27 at 16:37 +0800, Dongxiao Xu wrote:
> > > > -PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX}
> > > nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn ${PN}-utils
> > > ${PN}-pic ${PN}-dev eglibc-doc eglibc-locale libmemusage
> > > libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX}
> > > eglibc-pcprofile libsotruss${PKGSUFFIX}"
> > > > -
> > > > -PACKAGES_DYNAMIC = " \
> > > > -		    glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-*
> > > glibc-binary-localedata-* \
> > > > -		    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-*
> > > eglibc-binary-localedata-* \
> > > > -		    locale-base-*${PKGSUFFIX}"
> > > > +PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX}
> > > nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc
> > > libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss
> > > eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
> > > 
> > > You seem to have made a bunch of changes here that are not related to locales.
> > > What are those about?
> > 
> > They are locale related changes.
> > Locale related stuffs in the above PACKAGES and PACKAGES_DYNAMIC are moved to eglibc-locale recipe.
> 
> Is libsotruss${PKGSUFFIX} (for example) really a "locale related stuff"?
> It's not obvious to me what the connection is.

Dongxiao: What Phil is referring to here is that libsotruss${PKGSUFFIX}
disappeared from PACKAGES and that also "${libdir}/audit/.debug"
disappeared from FILES_${PN}-dbg.

Specifically these changes came in as part of:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=77c2dd944db42e40cc8467e6bc5a175fed90c251

which I don't think your patch accounted for.

Since this patch has been around for a while and it otherwise looks
good, I've fixed up these couple of issues and merged it though.

Cheers,

Richard



