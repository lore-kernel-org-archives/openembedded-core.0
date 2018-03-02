Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 665EF789DF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 21:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 19F1C20AD5;
	Fri,  2 Mar 2018 21:19:40 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id acx6GUy_MGjg; Fri,  2 Mar 2018 21:19:40 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E99672098D;
	Fri,  2 Mar 2018 21:19:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4C35D1632EF; Fri,  2 Mar 2018 16:19:38 -0500 (EST)
Date: Fri, 2 Mar 2018 16:19:38 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180302211938.GS2786@denix.org>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=U6jUg7+nLPVz_=cEodqRNcK=zHvu3yJBOvg+b9V0XXWA@mail.gmail.com>
	<1454314457.20696.16.camel@intel.com>
	<CAMKF1srg=gT+SNznGFoLG2p_gHdwf4FW0UQk_5DqxKTB_A_k4Q@mail.gmail.com>
	<1454425253.22914.5.camel@intel.com>
	<1454426983.27087.81.camel@linuxfoundation.org>
	<20160502164357.GB27602@denix.org>
MIME-Version: 1.0
In-Reply-To: <20160502164357.GB27602@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: Add support for busybox-init
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
X-List-Received-Date: Fri, 02 Mar 2018 21:19:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 02, 2016 at 12:43:58PM -0400, Denys Dmytriyenko wrote:
> On Tue, Feb 02, 2016 at 03:29:43PM +0000, Richard Purdie wrote:
> > On Tue, 2016-02-02 at 16:00 +0100, Patrick Ohly wrote:
> > > On Mon, 2016-02-01 at 08:57 -0800, Khem Raj wrote:
> > > > On Mon, Feb 1, 2016 at 12:14 AM, Patrick Ohly <
> > > > patrick.ohly@intel.com> wrote:
> > > > > On Mon, 2016-01-25 at 11:39 -0800, Andre McCurdy wrote:
> > > > > > > +        if grep "CONFIG_INIT=y" ${B}/.config; then
> > > > > > > +                install -D -m 0777 ${WORKDIR}/rcS
> > > > > > ${D}${sysconfdir}/init.d/rcS
> > > > > > > +                install -D -m 0777 ${WORKDIR}/rcK
> > > > > > ${D}${sysconfdir}/init.d/rcK
> > > > > > > +                install -D -m 0755 ${WORKDIR}/runlevel
> > > > > > ${D}${base_sbindir}/runlevel
> > > > > > > +                if grep "CONFIG_FEATURE_USE_INITTAB=y"
> > > > > > ${B}/.config; then
> > > > > > > +                        install -D -m 0777
> > > > > > > ${WORKDIR}/inittab
> > > > > > ${D}${sysconfdir}/inittab
> > > > > > > +                        tmp="${SERIAL_CONSOLES}"
> > > > > > > +                        for i in $tmp
> > > > > > > +                        do
> > > > > > > +                                j=`echo ${i} | sed s/\;/\
> > > > > > > /g`
> > > > > > > +                                label=`echo ${i} | sed -e
> > > > > > > 's/tty//'
> > > > > > -e 's/^.*;//' -e 's/;.*//'`
> > > > > > > +                                echo "tty$label::respawn:
> > > > > > ${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> > > > > > > +                        done
> > > > > > > +                fi
> > > > > > > +        fi
> > > > > 
> > > > > SERIAL_CONSOLES is typically set differently for different
> > > > > machines. But
> > > > > busybox is not machine-specific, therefore using SERIAL_CONSOLE
> > > > > like
> > > > > this prevents sstate/package reuse or worse, causes package
> > > > > versioning
> > > > > problems.
> > > > 
> > > > when busybox is used as init system then it becomes machine
> > > > specific and we have
> > > > a choice to do so which is disabled by default.
> > > 
> > > In my case, busybox is not the init system and the recipe is
> > > therefore
> > > not machine specific. But the code above is active and thus
> > > introduces a
> > > sstate dependency on the machine-specific SERIAL_CONSOLES anyway,
> > > even
> > > though the code is dead (if check never reaches it).
> > > 
> > > The code would have to be added conditionally, and only when it is
> > > okay
> > > to reference ${SERIAL_CONSOLES}.
> > 
> > I think we should split this init piece out into a separate recipe,
> > which busybox can depend on if/as/when needed.
> 
> What is the status of this request? Currently busybox is wreaking havoc in our 
> multi-machine builds due to SERIAL_CONSOLE reference...

2 years later this is still an issue...

-- 
Denys

