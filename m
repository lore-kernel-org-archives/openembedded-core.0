Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 2480E7732C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 20:35:29 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161219203524083_0684;
	Mon, 19 Dec 2016 20:35:24 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=53336 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cJ4eT-0001EB-6T; Mon, 19 Dec 2016 15:35:17 -0500
Date: Mon, 19 Dec 2016 15:33:55 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANnkk64RWAw4vHVc92QXQmuaBXD9yK0x95u2fw=SOh7jUQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1612191528260.12491@localhost.localdomain>
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
X-List-Received-Date: Mon, 19 Dec 2016 20:35:30 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-125966310-1482179637=:12491"

--8323328-125966310-1482179637=:12491
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 19 Dec 2016, Christopher Larson wrote:

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

  i can see both sides, but my concern (as it always is) is
consistency. when beginners are starting out, it's tempting to RTFS to
see how things are done, and if you see more than one style, there's
the potential for confusion as the poor reader thinks, "is there a
*reason* the same thing is being done two different ways? is there
something magical about those parentheses that the documentation
doesn't explain?"

  i realize that (as with perl) there's more than one way to do
things. doesn't mean we need to.

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
> Absolutely agreed. For this regex specifically, an argument could be
> made that a lack of a trailing $ is almost certainly a bug. I could
> argue that it should either be implicit, though that would be
> limiting, or failing to include it could trigger a warning unless
> you explicitly state you know what you’re doing :) Hmm..

  well, regardless of any tweaking, i think the docs need to be far
more clear on the processing of COMPATIBLE_MACHINE.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-125966310-1482179637=:12491--
