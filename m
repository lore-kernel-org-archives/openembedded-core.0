Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBXI8-0007Ay-JX
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 21:38:09 +0200
Received: by pzd13 with SMTP id 13so5205257pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 12:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2G7FJcQJW8o1mqQ+PO6Iy3v+k0pl7nNikmWYIqI1HRM=;
	b=vjqu2xwGvZQBoLDdEPF3Naiy3iIAQUZl2brzmFyWD4iM+7SF2lGo8fx76JSfNjEGQV
	JDBvXKP8WivE8Ul+2Ilu9j4oLoWymYMbadK933LLHbOamQblM4muo0zXWpyamLcOCw7b
	UtR9PvFn7+bNVs1TYgFIyuVjvi8ubmO9O29E0=
Received: by 10.68.19.196 with SMTP id h4mr21140969pbe.39.1317843152068; Wed,
	05 Oct 2011 12:32:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 5 Oct 2011 12:32:02 -0700 (PDT)
In-Reply-To: <1317819780.14671.144.camel@ted>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted> <20110930164658.GB7364@jama.jama.net>
	<1317402578.12332.218.camel@ted>
	<CAP9ODKqb8RGLi_5-_+uegLmtZ7Wo-70oDJcF_R6yaSJ2q9mGwg@mail.gmail.com>
	<1317765609.14671.118.camel@ted>
	<CAP9ODKrfDeDMomqeJCeyJBWqD_KqdMO=WBvjVY5d_j+btn3DfQ@mail.gmail.com>
	<11F8FF03-4C38-4D33-9250-66B5C180698C@dominion.thruhere.net>
	<CAP9ODKp5+nmtPfm+AabX5K9YoGnY_KVE6E1HxP=DJ2c+H2WdcQ@mail.gmail.com>
	<7F30A97F-D852-4A45-9023-D979D974866A@dominion.thruhere.net>
	<20111005123433.GG19366@jama.jama.net> <1317819780.14671.144.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2011 12:32:02 -0700
Message-ID: <CAMKF1sre-NpRxwJocSYQkCjbq47FmPS7Hw9u3bR=hFJwU1FNgQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Wed, 05 Oct 2011 19:38:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 5, 2011 at 6:02 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-10-05 at 14:34 +0200, Martin Jansa wrote:
>> On Wed, Oct 05, 2011 at 07:29:10AM -0500, Koen Kooi wrote:
>> >
>> >
>> > Op 5 okt. 2011 om 07:27 heeft Otavio Salvador <otavio@ossystems.com.br> het volgende geschreven:
>> >
>> > > On Wed, Oct 5, 2011 at 09:22, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> > >> Op 5 okt. 2011 om 07:10 heeft Otavio Salvador <otavio@ossystems.com.br> het volgende geschreven:
>> > >>> On Tue, Oct 4, 2011 at 19:00, Richard Purdie
>> > >>> <richard.purdie@linuxfoundation.org> wrote:
>> > >>>> Really? hal doesn't really replace udev though, we can just use udev
>> > >>>> directly in place of it for many things now?
>> > >>>
>> > >>> Yes, many moved from hal to udev.
>> > >>>
>> > >>>> Specifically which applications are people using with dependencies on
>> > >>>> hal? As has been pointed out we can fix the xserver and that appears to
>> > >>>> be the only thing remaining in OE-Core?
>> > >>>
>> > >>> OE-Core can be easily hal-less but I just ask for hal to not be
>> > >>> removed from meta data as I and probably others hasn't finish the move
>> > >>> to udev yet.
>> > >>
>> > >> Put it in your own layer if you need it. No point in keeping obsolete stuff in oe-core.
>> > >
>> > > I wouldn't call it obsolete as it is still a valid option to Xorg and
>> > > maybe others. So people might want to use it. I use it.
>> >
>> > So put it in your own layer, it has no place in oe-core anymore.
>>
>> Agreed, that it has no place in oe-core anymore, but not sure if we can
>> keep
>> CONFIG_MANAGER_OPTION +=
>> "${@['--disable-config-hal','--enable-config-hal',''][bb.data.getVar('DISTRO_XORG_CONFIG_MANAGER',d)
>> in ['hal']]}"
>>
>> in xserver-xorg or we'll force averybody with hal in his layer to
>> .bbappend xserver-xorg too.
>
> I don't mind that staying in the xserver recipe config for now, I do
> think hal needs to move somewhere other than oe-core though. A
> deprecated layer in meta-oe might be one idea which would keep a common
> recipe around for now but make it clear its on its way out.

I think if there are more than one usecases then moving it to
meta-retired or some such
would be ok otherwise I am of opinion that it should be part of distro
layer which wants to use it

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


