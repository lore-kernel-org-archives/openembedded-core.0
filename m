Return-Path: <paul.betafive@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 98FC770A61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 13:51:17 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id bm13so1932535qab.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 05:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ky8PhxGNAOa+AsnHlhUfxQmIGP8VXPPcCVU5OhL9Pvw=;
	b=uZkST65igBak4J8lF1iesCv7ALZ9J9BAl6h/g2pjpN1oV9lqgPAY0TCKz2YIB2Ye/P
	2jTBDxRXJP3TrmqgK5Mml4ULSfzqC/xKgnkPPxAXuNpMK+8A7l1adeuuB1fs76zaVQvk
	9MHjO1YJod7EumGQDOqu+SM9rG8GW9tpgmexlcwaiEAe+ZIFB083OoQke1usdH/GQAY4
	V/cp07CC7vnPDPhiAFPizcBlFmGuhoBS/UwO6wgzOzAdDlP8goKVUcDggE8v6grhoFKL
	ltARwHd9uR8du7jAlETPN+rvVM/OpOnIf3m5wlmjqQd8linE68Vt4mYky69ZZBo1nY1n
	FCeQ==
X-Received: by 10.229.104.3 with SMTP id m3mr45690209qco.0.1417009878555; Wed,
	26 Nov 2014 05:51:18 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Wed, 26 Nov 2014 05:50:38 -0800 (PST)
In-Reply-To: <1417004047.12520.10.camel@linuxfoundation.org>
References: <CANyK_8eZHwtww6AL7L5f34R5Nc7mhSQALaez1NCnHvmUpHWcXw@mail.gmail.com>
	<1417004047.12520.10.camel@linuxfoundation.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 26 Nov 2014 13:50:38 +0000
X-Google-Sender-Auth: 7FTKK0kSd_k-6MZOOqsBSH6ppqQ
Message-ID: <CANyK_8dxvZU8wnqFQGWL=DgFxOdgdq-yaaOkOJrR60w7_M6pfg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg, opkg-config-base and opkg-collateral
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
X-List-Received-Date: Wed, 26 Nov 2014 13:51:23 -0000
Content-Type: text/plain; charset=UTF-8

On 26 November 2014 at 12:14, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2014-11-25 at 20:27 +0000, Paul Barker wrote:
> > Hi all,
> >
> > Does anyone know why the configuration files for opkg are split into
> > opkg-config-base (containing just '/etc/opkg/arch.conf') and
> > opkg-collateral (containing just '/etc/opkg/opkg.conf')? It looks like
> > the split dates back to openembedded classic.
> >
> > If there isn't a good reason for this perhaps now would be a good time
> > to merge all this back into the 'opkg' recipe and package. I'm happy
> > to put the patch together, just checking if it sounds like a good idea
> > before I do the work.
>
> I think at least one of the above was intended to allow distro specific
> package feeds to be preconfigured as as such belonged as a standalone
> config file.

That would probably be opkg-collateral as it pulls in a 'src' file
which is empty in oe-core.

However there's also the poky-feed-config-opkg recipe which provides
feed configurations in /etc/opkg/base-feeds.conf. It also fills in
/etc/opkg/arch.conf which means it would not be installable alongside
opkg-config-base.

I suggest the config settings are merged back into the opkg recipe,
removing opkg-collateral completely. We can then improve
poky-feed-config-opkg and rename it to something like opkg-feed-config
so that it's clear it's usable by distros other than poky. This
improved recipe would just contain /etc/opkg/feeds.conf (the 'base-'
filename prefix is unnecessary).

In terms of improving the feed config for opkg, by default I suggest
we just setup feeds for 'all', ${ALL_MULTILIB_PACKAGE_ARCHS} and
${MACHINE_ARCH}. This should avoid creating feed entries for
architectures which the target system supports but for which we never
create packages (for example, qemux86 lists 'all', 'any', 'noarch',
'x85', 'i586' and 'qemux86' as supported architectures but we only
ever create packages for 'all', 'i586' and 'qemux86'). By using a
bbappend a layer should be able to add to these defaults. The URI for
each package feed would be prefixed with ${OPKG_FEED_PREFIX} which
must be set in the distro config or local.conf. If OPKG_FEED_PREFIX is
not set, the recipe would create an empty base-feeds.conf file.

It would be possible with a bit of scripting to set the hold flag on
the opkg-feed-config package when it is installed so that even if a
new version of the package is compiled, the feeds for a target board
will not be automatically upgraded with 'opkg upgrade'. We could then
create a dist-upgrade script which removes the hold flag, upgrades
opkg-feed-config, and re-sets the hold flag. So to provide a new
version of a distro which users could upgrade to but are not
automatically upgraded to, you'd build a new version of
opkg-feed-config (probably by changing OPKG_FEED_PREFIX) and run the
dist-upgrade script on the target.

I'll put together RFC patches to show what I mean, I think that's a
pretty good explanation for now though.

>
> The architecture file is also machine specific, we wouldn't want opkg
> itself rebuilding for every machine so that is probably why its
> separate.
>

I didn't spot this but it does make sense. Perhaps opkg-config-base
should be renamed to opkg-arch-config to avoid future confusion.

> Three different things on the other hand seems excessive. We probably
> could survive with some merhing with opkg and the remainder being
> machine specific.
>

I'd keep three, but refactor them as I've described above:
- opkg: Includes '/etc/opkg/opkg.conf'
- opkg-arch-config: Includes '/etc/opkg/arch.conf', machine specific
- opkg-feed-config: Includes '/etc/opkg/feeds.conf', distro and
possibly machine specific

> Cheers,
>
> Richard
>

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

