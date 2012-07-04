Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SmMoC-0007NE-NI
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 12:27:46 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:45006 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SmMdV-0005Tj-Qp for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 06:16:41 -0400
Date: Wed, 4 Jul 2012 06:16:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4FF4151A.7050400@opendreambox.org>
Message-ID: <alpine.DEB.2.02.1207040615500.23821@oneiric>
References: <alpine.DEB.2.02.1207032219210.21877@oneiric>
	<CAMKF1sqWn-S=Hc_eMw-JU3ZP6ox-vfNSidiQbF_oLPhg9tO71g@mail.gmail.com>
	<4FF4151A.7050400@opendreambox.org>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Wed, 04 Jul 2012 10:27:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 4 Jul 2012, Andreas Oberritter wrote:

> On 04.07.2012 08:32, Khem Raj wrote:
> > On Tue, Jul 3, 2012 at 7:22 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >>
> >>   i'm probably just misreading something, but what is the point of a
> >> recipe having both a do_install() and do_install_append() function?
> >> for example, here's part of e2fsprogs_1.42.1.bb:
> >>
> >> do_install () {
> >>         oe_runmake 'DESTDIR=${D}' install
> >>         oe_runmake 'DESTDIR=${D}' install-libs
> >>         # We use blkid from util-linux now so remove from here
> >>         rm -f ${D}${base_libdir}/libblkid*
> >>         rm -rf ${D}${includedir}/blkid
> >>         rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
> >> }
> >>
> >> do_install_append () {
> >>         # e2initrd_helper and the pkgconfig files belong in libdir
> >>         if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> >>                 install -d ${D}${libdir}
> >>                 mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
> >>                 mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
> >>         fi
> >> }
> >>
> >>   how does that differ from simply defining a single do_install()
> >> routine?  i'm willing for this to be a dumb question.
> >
> > it does not. I think it could be arguably done in same do_install
>
> Yes.
>
> > but it does have some logical separation where the append operation is
> > moving files from /lib to /usr/lib
>
> It would be better to just use a comment and/or empty line for logical
> separation.
>
> > in theory another use of it is that you can override do_install_append
> > in a .bbappend file
> > and still reuse the do_install.
>
> AFAICT, you can't override an append. Both appends, the original and the
> bbappended, would get executed.

  ok, now i *definitely* want to know whether this would work or not
since there are a few recipes that define both do_install() and
do_install_append().

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


