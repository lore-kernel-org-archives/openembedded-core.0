Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id CB39472F8B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 11:37:41 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170226113658932_0486;
	Sun, 26 Feb 2017 11:36:58 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=43806 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1chx8F-0003f8-Rc; Sun, 26 Feb 2017 06:36:51 -0500
Date: Sun, 26 Feb 2017 06:36:49 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANnkk64RWAw4vHVc92QXQmuaBXD9yK0x95u2fw=SOh7jUQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1702260626400.21279@localhost.localdomain>
References: <alpine.LFD.2.20.1612190527590.8267@localhost.localdomain>
	<CABcZANnv7=zxZ7MNT4kDPKxScTYkJa44qAxt5Lvfc-L4=-Kb0A@mail.gmail.com>
	<CABcZAN=X+O23y=utG3iBvsdPNo1g9qM7H2JAT1PUpt-R=AYCBg@mail.gmail.com>
	<alpine.LFD.2.20.1612191246350.4848@localhost.localdomain>
	<CABcZANnkk64RWAw4vHVc92QXQmuaBXD9yK0x95u2fw=SOh7jUQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: a few questions about "COMPATIBLE_MACHINE" variable
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
X-List-Received-Date: Sun, 26 Feb 2017 11:37:42 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-548808278-1488109011=:21279"

--8323328-548808278-1488109011=:21279
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


  (following up on a short discussion from back in december on proper
setting for COMPATIBLE_MACHINE ...)

On Mon, 19 Dec 2016, Christopher Larson wrote:

>
> On Mon, Dec 19, 2016 at 10:56 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       i suspected as much. still, would consistency dictate using
>       parentheses or not? just a style thing.
>
>
> I think it’s largely personal preference. Personally, using a
> capture when we don’t need one is ugly to me, so I’d rather see it
> only used when needed, but that’s just my opinion. The upside to
> always using a capture is it makes it clearer, at a glance, to a new
> user that it’s not just a word or list of words, but a regular
> expression.
>  
>       >       next, if the possibilities in a list are REs, what is the
>       >       point of explicitly listing, say, "qemuarm|qemuarm64"? would
>       >       not the RE "qemuarm" subsume the more explicit "qemuarm64"?
>       >       same for the other architectures. (one could suggest that that
>       >       entire line could be shortened to "... = (^qemu)".)
>       >
>       > Just qemu would potentially match future qemu machines which aren’t
>       > actually supported, so I don’t think that would be appropriate. It’d
>       > match too much.
>
>         i realized that, i was just being technical. :-) in any event, as it
>       is, it would *still* match too much, anything starting with
>       "qemuarm", for example.
>
>
> Good point, yes. 
>
>       >         the above seems pretty clear since the following lines would appear
>       >       to say that *only* the qemux86 is compatible:
>       >
>       >         linux-yocto-tiny_4.1.bb:COMPATIBLE_MACHINE = "(qemux86$)"
>       >         linux-yocto-tiny_4.4.bb:COMPATIBLE_MACHINE = "(qemux86$)"
>       >         linux-yocto-tiny_4.8.bb:COMPATIBLE_MACHINE = "(qemux86$)"
>       >
>       >       which suggests the following passage from the YP kernel dev manual is
>       >       a bit misleading:
>       >
>       >         "You must change it to match a list of the machines that your new
>       >         recipe supports. For example, to support the qemux86 and qemux86-64
>       >         machines, use the following form:
>       >
>       >              COMPATIBLE_MACHINE = "qemux86|qemux86-64"
>       >
>       >       and if all this is true, then if you're introducing a new machine, to
>       >       be magnificently pedantic, one should not use:
>       >
>       >         COMPATIBLE_MACHINE_machinename = "machinename"
>       >
>       >       but
>       >
>       >         COMPATIBLE_MACHINE_machinename = "^machinename$"
>       >
>       >       just to play it safe. am i reading all this correctly?
>       >
>       >
>       > Yes, that’s correct, though we need the trailing $ but not the
>       > leading ^, as it’s using re.match, not re.search — meaning it only
>       > matches at the beginning of the string, it doesn’t search the string
>       > to find a match.
>
>         ah, quite right, i had forgotten that. again, in any event, both the
>       code and documentation could probably be tweaked to make all of this
>       more obvious.
>
>
> Absolutely agreed. For this regex specifically, an argument could be
> made that a lack of a trailing $ is almost certainly a bug. I could
> argue that it should either be implicit, though that would be
> limiting, or failing to include it could trigger a warning unless
> you explicitly state you know what you’re doing :) Hmm..

  i'm following up only because i'm going through the YP kernel-dev
manual, and it contains the following snippet:

    For example, to support the qemux86 and qemux86-64 machines, use
    the following form:

     COMPATIBLE_MACHINE = "qemux86|qemux86-64"

which, as chris explained, because matching uses python's "re.match"
operator, already anchors the search string at the beginning but not
at the end so, technically and pedantically, it could be assigned
equally well with (at least for the moment):

     COMPATIBLE_MACHINE = "qemux86"

or, more precisely:

     COMPATIBLE_MACHINE = "qemux86$|qemux86-64$"

is there a style guide entry for proper use of COMPATIBLE_MACHINE?
having the manuals make suggestions that are potentially confusing
to inexperienced users seems like a bad idea.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-548808278-1488109011=:21279--
