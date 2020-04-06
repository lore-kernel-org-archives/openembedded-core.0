Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.154.1586195890880873197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 10:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:45014 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jLW0e-00Eeqw-Tg; Mon, 06 Apr 2020 13:58:09 -0400
Date: Mon, 6 Apr 2020 13:58:06 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] couple questions on PACKAGECONFIG (for improving docs)
In-Reply-To: <20200406163831.verkxulxeru3kwsy@qschulz>
Message-ID: <alpine.LFD.2.21.2004061318090.20608@localhost.localdomain>
References: <alpine.LFD.2.21.2004061153450.16686@localhost.localdomain> <20200406163831.verkxulxeru3kwsy@qschulz>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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

On Mon, 6 Apr 2020, Quentin Schulz wrote:

> On Mon, Apr 06, 2020 at 12:05:15PM -0400, rpjday@crashcourse.ca wrote:
> >
> >   wanted to tweak the ref manual entry for PACKAGECONFIG, so a couple
> > issues. first, the ref manual entry:
> >
> > https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG
> >
> > says nothing about the possible *sixth* entry, described in
> > base.bbclass as "foo_conflict_packageconfig", so i can add that but
> > i'm open to proper wording since i'd probably screw it up.
> > (i'd add an actual example from poky/ demonstrating this, such as:
> >
> > meta/recipes-support/curl/curl_7.69.1.bb:PACKAGECONFIG[threaded-resolver]
> >   = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
>
> https://media.giphy.com/media/puPeyz4SOYEKY/giphy.gif
> [minion screaming what]
>
> Didn't know about that one :) So PLEASE, document :)

  yeah, that was one of those cases where i just wanted to match
examples against the actual processing in base.bbclass, and went,
"whoa, what the heck is *that*?" then went looking for examples. in
fact, curl is a nice example, as it contains:

# 'ares' and 'threaded-resolver' are mutually exclusive
PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
... snip ...
PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"

so that's the obvious example to demonstrate that. i'd never noticed
that before.

> >   i'd be tempted to show some of the simpler variations of
> > PACKAGECONFIG, such as (if i read it correctly) being equivalent
> > to simply adding RDEPENDS values (right?):
> >
> > meta/recipes-support/boost/boost.inc:PACKAGECONFIG[graph_parallel] =
> >   ",,,boost-mpi mpich"
>
> I'm torn about this one. If it really is just for a RDEPENDS and not
> used elsewhere... Why not just an RDEPENDS? We would need a proper
> exemple for that I guess.

there are a small number of these in oe-core including:

meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb:PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
meta/recipes-extended/sudo/sudo.inc:PACKAGECONFIG[pam-wheel] = ",,,pam-plugin-wheel"
meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb:PACKAGECONFIG[hwmixvolume] = ",,,python-core python-pygobject pyalsa"

it appears that this is slightly more general than a regular RDEPENDS
in the sense that a single PACKAGECONFIG setting can pull in an
arbitrary number of RDEPENDS values. so it appears to be a convenience
shortcut.

> >   finally, i'd toss in explaining this, which might confuse people:
> >
> > meta/recipes-multimedia/pulseaudio/pulseaudio.inc:PACKAGECONFIG[autospawn-for-root]
> >   = ",,,"
> >
> > i'm betting some developers might wonder what that is all about and,
> > for every example i've seen for that, it involves *something*
> > explicitly checking for that config setting somewhere in the recipe,
> > as in the case above:
> >
> > do_compile_append () {
> >   if ${@bb.utils.contains('PACKAGECONFIG', 'autospawn-for-root', 'true', 'false', d)}; then
> >     set_cfg_value src/client.conf allow-autospawn-for-root yes
> >   fi
> > }
> >
>
> Indeed, not straight-forward use. I saw the use of PACKAGECONFIG
> values in wpa-supplicant recipe for example. At the same time, I
> don't feel like we would need to explain that? There is nothing
> specific to PACKAGECONFIG variable in the example above and I'm
> afraid we would make the docs even more verbose than it already is?

  that is always a risk.

> Speaking of that, the wpa-supplicant recipe would benefit from this
> 6th option I think (provided openssl and gnutls are antinomic of
> course, but seems like from the do_install).
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb#n13

  i don't think that's what the wpa-supplicant recipe is suggesting. i
think the do_install step in that recipe file is simply saying that
choosing openssl takes precedence over choosing gnutls, nothing more.
i see nothing to suggest that only one of those PACKAGECONFIG settings
can be selected but, as always, i am willing to be corrected.

rday
