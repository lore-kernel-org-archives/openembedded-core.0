Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SmNx7-0008KK-BX for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 13:41:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64BTxr7022968
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 12:29:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20900-09 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2012 12:29:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64BTpaq022962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 12:29:52 +0100
Message-ID: <1341401390.3906.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jul 2012 12:29:50 +0100
In-Reply-To: <alpine.DEB.2.02.1207040615500.23821@oneiric>
References: <alpine.DEB.2.02.1207032219210.21877@oneiric>
	<CAMKF1sqWn-S=Hc_eMw-JU3ZP6ox-vfNSidiQbF_oLPhg9tO71g@mail.gmail.com>
	<4FF4151A.7050400@opendreambox.org>
	<alpine.DEB.2.02.1207040615500.23821@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: why would a recipe have both do_install() and do_install_append()?
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
X-List-Received-Date: Wed, 04 Jul 2012 11:41:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-04 at 06:16 -0400, Robert P. J. Day wrote:
> On Wed, 4 Jul 2012, Andreas Oberritter wrote:
> 
> > On 04.07.2012 08:32, Khem Raj wrote:
> > > On Tue, Jul 3, 2012 at 7:22 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >>
> > >>   i'm probably just misreading something, but what is the point of a
> > >> recipe having both a do_install() and do_install_append() function?
> > >> for example, here's part of e2fsprogs_1.42.1.bb:
> > >>
> > >> do_install () {
> > >>         oe_runmake 'DESTDIR=${D}' install
> > >>         oe_runmake 'DESTDIR=${D}' install-libs
> > >>         # We use blkid from util-linux now so remove from here
> > >>         rm -f ${D}${base_libdir}/libblkid*
> > >>         rm -rf ${D}${includedir}/blkid
> > >>         rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
> > >> }
> > >>
> > >> do_install_append () {
> > >>         # e2initrd_helper and the pkgconfig files belong in libdir
> > >>         if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> > >>                 install -d ${D}${libdir}
> > >>                 mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
> > >>                 mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
> > >>         fi
> > >> }
> > >>
> > >>   how does that differ from simply defining a single do_install()
> > >> routine?  i'm willing for this to be a dumb question.
> > >
> > > it does not. I think it could be arguably done in same do_install
> >
> > Yes.
> >
> > > but it does have some logical separation where the append operation is
> > > moving files from /lib to /usr/lib
> >
> > It would be better to just use a comment and/or empty line for logical
> > separation.
> >
> > > in theory another use of it is that you can override do_install_append
> > > in a .bbappend file
> > > and still reuse the do_install.
> >
> > AFAICT, you can't override an append. Both appends, the original and the
> > bbappended, would get executed.
> 
>   ok, now i *definitely* want to know whether this would work or not
> since there are a few recipes that define both do_install() and
> do_install_append().

Andreas is correct, you can't override a do_install_append (), both
would just get appended.

Cheers,

Richard



