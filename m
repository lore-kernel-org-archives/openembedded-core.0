Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 9B85F73D27
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 11:07:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 08A373C8869F
Message-ID: <1441364835.3071.9.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 04 Sep 2015 12:07:15 +0100
In-Reply-To: <55E87F08.6020902@windriver.com>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
	<9f749745e56f33bc00d0e08dd4951840b29a557d.1441291646.git.joshua.lock@collabora.co.uk>
	<1441293176.24871.118.camel@linuxfoundation.org>
	<55E87F08.6020902@windriver.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH 3/9] systemd: remove hard-coded paths in FILES entries
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
X-List-Received-Date: Fri, 04 Sep 2015 11:07:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 12:10 -0500, Mark Hatle wrote:
> On 9/3/15 10:12 AM, Richard Purdie wrote:
> > On Thu, 2015-09-03 at 15:58 +0100, Joshua Lock wrote:
> > > Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> > > ---
> > >  meta/recipes-core/systemd/systemd_219.bb | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/meta/recipes-core/systemd/systemd_219.bb
> > > b/meta/recipes-core/systemd/systemd_219.bb
> > > index 4d32fd5..fbd86e8 100644
> > > --- a/meta/recipes-core/systemd/systemd_219.bb
> > > +++ b/meta/recipes-core/systemd/systemd_219.bb
> > > @@ -306,10 +306,10 @@ FILES_${PN} = " ${base_bindir}/* \
> > >                  ${exec_prefix}/lib/sysctl.d \
> > >                  ${exec_prefix}/lib/sysusers.d \
> > >                  ${localstatedir} \
> > > -                /lib/udev/rules.d/70-uaccess.rules \
> > > -                /lib/udev/rules.d/71-seat.rules \
> > > -                /lib/udev/rules.d/73-seat-late.rules \
> > > -                /lib/udev/rules.d/99-systemd.rules \
> > > +                ${base_libdir}/udev/rules.d/70-uaccess.rules \
> > > +                ${base_libdir}/udev/rules.d/71-seat.rules \
> > > +                ${base_libdir}/udev/rules.d/73-seat-late.rules \
> > > +                ${base_libdir}/udev/rules.d/99-systemd.rules \
> > >                 "
> > >  
> > >  FILES_${PN}-dbg += "${rootlibdir}/.debug
> > > ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug
> > > ${base_libdir}/security/.debug/"
> > > @@ -327,7 +327,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty
> > > systemd-vconsole-setup \
> > >  
> > >  PACKAGES =+ "udev-dbg udev udev-hwdb"
> > >  
> > > -FILES_udev-dbg += "/lib/udev/.debug"
> > > +FILES_udev-dbg += "${base_libdir}/udev/.debug"
> > 
> > From what I remember, this is intentional and this change likely
> > breaks
> > multilib. You don't want two sets of rules on a multilib system.
> 
> Correct.. it has to go into /lib or if everything is move to /usr,
> then /usr/lib.

I've prepared a v2 that changes this to nonarch_base_libdir but
systemd+multilib appears to be broken, see:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=8256

Regards,

Joshua 

