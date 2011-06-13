Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QW7h0-0004xa-A0
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 16:00:38 +0200
Received: by ywg8 with SMTP id 8so2171704ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 06:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=s5757C741uVraA8TfkFDI9ypp1mbhywF+k7tzJ+lIH8=;
	b=WhUIgjgKY4oxRIOMTx8GEnxHs8xIiSj/E6Hcql42KJqJnZRt1JXda4P4lxpCsNQ4+U
	CvIy1ehok7St64siCKNRj8iKzZ7MbJlc8Rv+veRo1tnaXgqMpf5cwiy3XwIzYTid6pw8
	iEWRsW86MKRMPLmk6bKY1796HOqXxAh7qsSEs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TpyxCuRMpkMME5J0sAINhRvGrtwtPuMhaGtvy0d0hR3MG2g+HDgVArbZmN2zSmt7G0
	eRp8KC9KvHR8hintJQkinv54CVI+EaLhom5Ns607UyKXWYmAWRKVdKBG4QnvfRnXQx8q
	2yehU9AXod4ELiTjzlgYdeQkmP+SMCdlsrNi4=
MIME-Version: 1.0
Received: by 10.91.72.1 with SMTP id z1mr6187230agk.78.1307973430578; Mon, 13
	Jun 2011 06:57:10 -0700 (PDT)
Received: by 10.90.96.1 with HTTP; Mon, 13 Jun 2011 06:57:10 -0700 (PDT)
In-Reply-To: <3486EC57-81AC-4105-AC78-2721DF62E4FF@dominion.thruhere.net>
References: <8DD6CF6F-60B5-4DC0-95BC-3E47550A46FB@dominion.thruhere.net>
	<BANLkTimOnk0XvkfEqP25aOWK0_C7swHvzQ@mail.gmail.com>
	<3486EC57-81AC-4105-AC78-2721DF62E4FF@dominion.thruhere.net>
Date: Mon, 13 Jun 2011 09:57:10 -0400
Message-ID: <BANLkTi=ws6VEaWRBkDZ8-G5MWgRohNS=Kg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] qemu* kernel configs
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
X-List-Received-Date: Mon, 13 Jun 2011 14:00:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2011 at 9:27 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 13 jun 2011, om 14:54 heeft Bruce Ashfield het volgende geschreven:
>
>> On Mon, Jun 13, 2011 at 8:10 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>> Hi,
>>>
>>> After finding the bug Scott was running into with systemd-image (no DEV=
TMPFS support) I have a closer look at the qemarm kernel config and it look=
s dated to me. If we want to have tools like udev, powertop, iotop, latency=
top working we need to revisit the config. From a quick look I found the fo=
llowing items missing/incomplete:
>>>
>>> * devtmpfs + devtmpfs automounting. Recent udev versions require it
>>> * cgroups, systemd requires it
>>> * process accounting, *top uses it
>>> * fuse, gvfs requires it
>>> * autofs4, systemd works a lot better with it
>>>
>>> So what are people's thoughts on enabling the items that weren't set be=
fore and moving modules to built-in were > needed? And if it's wanted, does=
 anyone have a quickstart on how these changes should be done properly? My =
5 > minutes of google and 30 minutes of staring at the meta/ subdir didn't =
yield results.
>>
>> Hi Koen,
>>
>> The base configuration for the qemu* machines is kept as minimal as
>> possible by design. It is supposed to be used as a building block, not
>> cater to all the different image types we can throw at them by default.
>
> It sounds we need to remove the qemu machines from OE-core and replace th=
em with more useful ones if we
> want people to actually test images with the machine present in OE-core. =
The current kernel config blocks me
> from merging a recent udev and systemd into oe-core since it can't be tes=
ted with only oe-core in bblayers.conf.

I don't think we need to go this far. The configuration as it currently sta=
nds
is not a golden standard, and in fact is already scheduled for some improve=
ments
in the yocto 1.1 timeframe.

I'd consider this a suggestion for some new feature groups.

I wouldn't considering enabling groups of functionality that the community =
needs
for common higher level functional testing being extra or the kitchen
sink. If we
come up with feature groups, and name those groups, it is possible to
disable them
as well as enable them conditionally.

> I've found minimalistic kernel configs a huge pain since you need to know=
 the mapping between "userspace error
> X" and "CONFIG_SOMETHING=3Dy", which most people don't know or want to kn=
ow. With superset configs
> customers (and users) can tweak it till it breaks, instead of tweaking ti=
ll it works.

There's definitely two sides to this. Keeping the configuration tight
and minimal is
the embedded roots of these configurations. The problem with large
configurations
is the test matrix, which is something that we try to take seriously.
If there's an
explicitly enabled configuration, there's a known test for it and core
functionality that
can enable it (and for the record, I won't claim that this is 100%
followed, but that's
something we aim to improve).

Having named groups (where they names are the high level functionality) tha=
t
provide optional configuration that can be enabled, tends to hit the
middle ground
between these two issues. Users can see the name and grab onto the
functionality,
while the core set of configs stays clean and small.

>
> I'm not saying the qemu kernel configs needs to have everything enabled, =
since they are emulated machines
> which simply cannot have various extras (PCI cards) or have a hard time u=
sing them (USB devices are a pain in
> qemu). But having 'basic' things like devtmpfs disabled is counterproduct=
ive as Scott and I found out.

Agreed. This goes back to the functionality to enable common use cases and
requirements. If you want to send suggestions via patches (config fragments
and SRC_URI updates) or just send lists of missing functionality and a mapp=
ing
to the higher level requirement, we can work together to enable what we nee=
d and
move the rest to optional features or other layers.

Cheers,

Bruce

>
> regards,
>
> Koen
>
> PS: RP won't like making kernel builds take an hour, so from that POV min=
imal configs are a feature ;)
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


