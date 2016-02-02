Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E64B2771D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12FTl4x011651; Tue, 2 Feb 2016 15:29:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id drLo0pXA7_hX; Tue,  2 Feb 2016 15:29:46 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12FThgX011648
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 2 Feb 2016 15:29:44 GMT
Message-ID: <1454426983.27087.81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 02 Feb 2016 15:29:43 +0000
In-Reply-To: <1454425253.22914.5.camel@intel.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=U6jUg7+nLPVz_=cEodqRNcK=zHvu3yJBOvg+b9V0XXWA@mail.gmail.com>
	<1454314457.20696.16.camel@intel.com>
	<CAMKF1srg=gT+SNznGFoLG2p_gHdwf4FW0UQk_5DqxKTB_A_k4Q@mail.gmail.com>
	<1454425253.22914.5.camel@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 02 Feb 2016 15:29:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-02 at 16:00 +0100, Patrick Ohly wrote:
> On Mon, 2016-02-01 at 08:57 -0800, Khem Raj wrote:
> > On Mon, Feb 1, 2016 at 12:14 AM, Patrick Ohly <
> > patrick.ohly@intel.com> wrote:
> > > On Mon, 2016-01-25 at 11:39 -0800, Andre McCurdy wrote:
> > > > > +        if grep "CONFIG_INIT=y" ${B}/.config; then
> > > > > +                install -D -m 0777 ${WORKDIR}/rcS
> > > > ${D}${sysconfdir}/init.d/rcS
> > > > > +                install -D -m 0777 ${WORKDIR}/rcK
> > > > ${D}${sysconfdir}/init.d/rcK
> > > > > +                install -D -m 0755 ${WORKDIR}/runlevel
> > > > ${D}${base_sbindir}/runlevel
> > > > > +                if grep "CONFIG_FEATURE_USE_INITTAB=y"
> > > > ${B}/.config; then
> > > > > +                        install -D -m 0777
> > > > > ${WORKDIR}/inittab
> > > > ${D}${sysconfdir}/inittab
> > > > > +                        tmp="${SERIAL_CONSOLES}"
> > > > > +                        for i in $tmp
> > > > > +                        do
> > > > > +                                j=`echo ${i} | sed s/\;/\
> > > > > /g`
> > > > > +                                label=`echo ${i} | sed -e
> > > > > 's/tty//'
> > > > -e 's/^.*;//' -e 's/;.*//'`
> > > > > +                                echo "tty$label::respawn:
> > > > ${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> > > > > +                        done
> > > > > +                fi
> > > > > +        fi
> > > 
> > > SERIAL_CONSOLES is typically set differently for different
> > > machines. But
> > > busybox is not machine-specific, therefore using SERIAL_CONSOLE
> > > like
> > > this prevents sstate/package reuse or worse, causes package
> > > versioning
> > > problems.
> > 
> > when busybox is used as init system then it becomes machine
> > specific and we have
> > a choice to do so which is disabled by default.
> 
> In my case, busybox is not the init system and the recipe is
> therefore
> not machine specific. But the code above is active and thus
> introduces a
> sstate dependency on the machine-specific SERIAL_CONSOLES anyway,
> even
> though the code is dead (if check never reaches it).
> 
> The code would have to be added conditionally, and only when it is
> okay
> to reference ${SERIAL_CONSOLES}.

I think we should split this init piece out into a separate recipe,
which busybox can depend on if/as/when needed.

Cheers,

Richard

