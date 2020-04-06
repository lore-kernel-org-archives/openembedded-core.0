Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web10.14842.1586191116186215750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 09:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48wx7F5yb6z5tl9;
	Mon,  6 Apr 2020 18:38:33 +0200 (CEST)
Date: Mon, 6 Apr 2020 18:38:32 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] couple questions on PACKAGECONFIG (for improving docs)
Message-ID: <20200406163831.verkxulxeru3kwsy@qschulz>
References: <alpine.LFD.2.21.2004061153450.16686@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2004061153450.16686@localhost.localdomain>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Mostly bringing nothing more than my "+1" because I've seen a few of
your mails never answered so just wanted to cheer you a little bit :)

On Mon, Apr 06, 2020 at 12:05:15PM -0400, rpjday@crashcourse.ca wrote:
> 
>   wanted to tweak the ref manual entry for PACKAGECONFIG, so a couple
> issues. first, the ref manual entry:
> 
> https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG
> 
> says nothing about the possible *sixth* entry, described in
> base.bbclass as "foo_conflict_packageconfig", so i can add that but
> i'm open to proper wording since i'd probably screw it up.
> (i'd add an actual example from poky/ demonstrating this, such as:
> 
> meta/recipes-support/curl/curl_7.69.1.bb:PACKAGECONFIG[threaded-resolver]
>   = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
> 

https://media.giphy.com/media/puPeyz4SOYEKY/giphy.gif
[minion screaming what]

Didn't know about that one :) So PLEASE, document :)

>   i'd be tempted to show some of the simpler variations of
> PACKAGECONFIG, such as (if i read it correctly) being equivalent to
> simply adding RDEPENDS values (right?):
> 
> meta/recipes-support/boost/boost.inc:PACKAGECONFIG[graph_parallel] =
>   ",,,boost-mpi mpich"
> 

I'm torn about this one. If it really is just for a RDEPENDS and not
used elsewhere... Why not just an RDEPENDS? We would need a proper
exemple for that I guess.

>   finally, i'd toss in explaining this, which might confuse people:
> 
> meta/recipes-multimedia/pulseaudio/pulseaudio.inc:PACKAGECONFIG[autospawn-for-root]
>   = ",,,"
> 
> i'm betting some developers might wonder what that is all about and,
> for every example i've seen for that, it involves *something*
> explicitly checking for that config setting somewhere in the recipe,
> as in the case above:
> 
> do_compile_append () {
>   if ${@bb.utils.contains('PACKAGECONFIG', 'autospawn-for-root', 'true', 'false', d)}; then
>     set_cfg_value src/client.conf allow-autospawn-for-root yes
>   fi
> }
> 

Indeed, not straight-forward use. I saw the use of PACKAGECONFIG values
in wpa-supplicant recipe for example. At the same time, I don't feel
like we would need to explain that? There is nothing specific to
PACKAGECONFIG variable in the example above and I'm afraid we would make
the docs even more verbose than it already is? 

Speaking of that, the wpa-supplicant recipe would benefit from this 6th
option I think (provided openssl and gnutls are antinomic of course, but
seems like from the do_install).
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb#n13

Thanks for your work on the docs, I take great pleasure in reading your
mails and learn new things about every time from the consequent
discussion :)

Quentin
