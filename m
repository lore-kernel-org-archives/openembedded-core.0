Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by mail.openembedded.org (Postfix) with ESMTP id CB148606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 16:44:24 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6K007NR6HBNP60@vms173009.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 02 May 2016 11:44:09 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kj9zAlcOel0A:10 a=yrkiwgmsf1kA:10	a=QyXUC8HyAAAA:8
	a=7Sujhc0DbYmt3mHnXHUA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 428133c5; Mon, 02 May 2016 16:44:09 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 09277161FD5; Mon,
	2 May 2016 12:43:59 -0400 (EDT)
Date: Mon, 02 May 2016 12:43:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20160502164357.GB27602@denix.org>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=U6jUg7+nLPVz_=cEodqRNcK=zHvu3yJBOvg+b9V0XXWA@mail.gmail.com>
	<1454314457.20696.16.camel@intel.com>
	<CAMKF1srg=gT+SNznGFoLG2p_gHdwf4FW0UQk_5DqxKTB_A_k4Q@mail.gmail.com>
	<1454425253.22914.5.camel@intel.com>
	<1454426983.27087.81.camel@linuxfoundation.org>
MIME-version: 1.0
In-reply-to: <1454426983.27087.81.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 02 May 2016 16:44:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 02, 2016 at 03:29:43PM +0000, Richard Purdie wrote:
> On Tue, 2016-02-02 at 16:00 +0100, Patrick Ohly wrote:
> > On Mon, 2016-02-01 at 08:57 -0800, Khem Raj wrote:
> > > On Mon, Feb 1, 2016 at 12:14 AM, Patrick Ohly <
> > > patrick.ohly@intel.com> wrote:
> > > > On Mon, 2016-01-25 at 11:39 -0800, Andre McCurdy wrote:
> > > > > > +        if grep "CONFIG_INIT=y" ${B}/.config; then
> > > > > > +                install -D -m 0777 ${WORKDIR}/rcS
> > > > > ${D}${sysconfdir}/init.d/rcS
> > > > > > +                install -D -m 0777 ${WORKDIR}/rcK
> > > > > ${D}${sysconfdir}/init.d/rcK
> > > > > > +                install -D -m 0755 ${WORKDIR}/runlevel
> > > > > ${D}${base_sbindir}/runlevel
> > > > > > +                if grep "CONFIG_FEATURE_USE_INITTAB=y"
> > > > > ${B}/.config; then
> > > > > > +                        install -D -m 0777
> > > > > > ${WORKDIR}/inittab
> > > > > ${D}${sysconfdir}/inittab
> > > > > > +                        tmp="${SERIAL_CONSOLES}"
> > > > > > +                        for i in $tmp
> > > > > > +                        do
> > > > > > +                                j=`echo ${i} | sed s/\;/\
> > > > > > /g`
> > > > > > +                                label=`echo ${i} | sed -e
> > > > > > 's/tty//'
> > > > > -e 's/^.*;//' -e 's/;.*//'`
> > > > > > +                                echo "tty$label::respawn:
> > > > > ${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> > > > > > +                        done
> > > > > > +                fi
> > > > > > +        fi
> > > > 
> > > > SERIAL_CONSOLES is typically set differently for different
> > > > machines. But
> > > > busybox is not machine-specific, therefore using SERIAL_CONSOLE
> > > > like
> > > > this prevents sstate/package reuse or worse, causes package
> > > > versioning
> > > > problems.
> > > 
> > > when busybox is used as init system then it becomes machine
> > > specific and we have
> > > a choice to do so which is disabled by default.
> > 
> > In my case, busybox is not the init system and the recipe is
> > therefore
> > not machine specific. But the code above is active and thus
> > introduces a
> > sstate dependency on the machine-specific SERIAL_CONSOLES anyway,
> > even
> > though the code is dead (if check never reaches it).
> > 
> > The code would have to be added conditionally, and only when it is
> > okay
> > to reference ${SERIAL_CONSOLES}.
> 
> I think we should split this init piece out into a separate recipe,
> which busybox can depend on if/as/when needed.

What is the status of this request? Currently busybox is wreaking havoc in our 
multi-machine builds due to SERIAL_CONSOLE reference...

-- 
Denys

