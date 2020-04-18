Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.5326.1587240637733729448
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 13:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:51770 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jPtnP-003xrY-LF; Sat, 18 Apr 2020 16:10:36 -0400
Date: Sat, 18 Apr 2020 16:10:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
cc: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
    Richard Purdie <richard.purdie@linuxfoundation.org>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
In-Reply-To: <fc3149fc55b34156baee2c375002a2a6@XBOX03.axis.com>
Message-ID: <alpine.LFD.2.21.2004181605480.8183@localhost.localdomain>
References: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain> <e610ad1ecb7cd084ab61fe4bcf56b01568c5edc7.camel@linuxfoundation.org> <alpine.LFD.2.21.2004181235160.1301461@localhost.localdomain> <DM5PR12MB24711A9EF9D90BB86E95EDAA8BD60@DM5PR12MB2471.namprd12.prod.outlook.com>
 <alpine.LFD.2.21.2004181320230.1304434@localhost.localdomain> <fc3149fc55b34156baee2c375002a2a6@XBOX03.axis.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=1.3
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Sat, 18 Apr 2020, Peter Kjellerstedt wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Robert P. J. Day
> > Sent: den 18 april 2020 19:24
> > To: chris.laplante@agilent.com
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; OE Core mailing
> > list <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] why does oe-buildenv-internal check for -z
> > "$BDIR"?
> >
> > On Sat, 18 Apr 2020, chris.laplante@agilent.com wrote:
> >
> > > >   i know that -- in fact, it's the only way i use it -- the question
> > > > is the purpose for checking if $BDIR is zero length first. that is,
> > > > under what circumstances could it *not* be? even invoking the way you
> > > > demonstrate, that variable is empty when tested, and i see nothing
> > > > that could cause it to have a value before that test.
> > >
> > > FWIW I was curious/bored and looked to see if 'BDIR' was ever used
> > > in poky (outside of the script of course), and I found no results.
> > >
> > > git rev-list --all | xargs git grep -w BDIR -- './*' ':!scripts/oe-
> > buildenv-internal'
> >
> >   that's kind of the point i was making ... that variable appeared out
> > of nowhere, clearly seemed like a local variable, and is even "unset"
> > after it's used in that script. i poked around, trying to figure if
> > there was some other flow of control that got you into that script
> > from another direction, but i didn't find one.
> >
> >   and, yes, it seems trivial to obsess over it, but it's just those
> > sorts of things that make me wonder, "hmmmmm ... maybe i *don't*
> > really understand how this script can be used."
> >
> >   anyway, moving on ...
> >
> > rday
>
> When it comes to understanding why the code looks like it does in a
> case like this, it is often better to look at the history than the
> current state.
>
> If you go back to when the test was introduced (commit
> 5d5fab77cf9616bf62023c202b38f309f8bbf189 in Poky), you will see that
> BDIR could be set in a script called poky-autobuild at that time.
> The poky-autobuild script was removed 12 years ago, but the test in
> oe-buildenv-internal remained.

  additional observation, but same script also contains:

    if [ -n "$2" ]; then
        BITBAKEDIR="$2"
    fi

clearly implying a second argument pointing at bitbake directory,
which is nowhere documented, and is followed by:

 if [ -z "$BITBAKEDIR" ]; then
    BITBAKEDIR="$OEROOT/bitbake$BBEXTRA"
    test -d "$BITBAKEDIR" || BITBAKEDIR="$OEROOT/../bitbake$BBEXTRA"
 fi

this also seems out of date, but i won't flog it any further.

rday

p.s. no mention in ref manual of "BBEXTRA" variable ... i'll leave it
to those higher up the food chain to decide what's worth cleaning.
