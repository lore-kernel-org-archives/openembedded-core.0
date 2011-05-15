Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLhsu-0002y9-Sp
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 22:25:52 +0200
Received: by eye27 with SMTP id 27so1140154eye.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 13:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=EtLXQPJKfalvO/Ray6cpuT9oLj7LDCIaTN6UWypmzUM=;
	b=mBx8+cC/luD4IyoXgitZ8HQiaGC54s0lHNtR64owjGE/upTt5+4bFk1rr1vkusnHmK
	oIaOTofdX40lefpWo89aItR7Q06rg0REufdbofgqHwDLlvjKvXx8x2WmjffvZESU+BqY
	L8cnXSsZFjISQyy+B9Szu3Jmh7r9x4zWt2TaM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=dS/+S9uISsivkE5Y6TjB/t4Ro78Zlk9WcOlkplfXgCgGyr0RJXU8AiWKzi9GrtK2d6
	Pt+7y2QzzXy9ZqOLxHqcswjMaIuPjXw17XciczrKaT5/MiTNL08k/w7EgKqqbdpuhY+8
	EGp5B2meL2kYZKRdwWaM5CaueZ/jRp7liSVPs=
Received: by 10.14.7.198 with SMTP id 46mr1487607eep.108.1305490981143; Sun,
	15 May 2011 13:23:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Sun, 15 May 2011 13:22:31 -0700 (PDT)
In-Reply-To: <1305107117.30391.325.camel@rex>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<4B81AF14-3B09-4B77-884C-AAF3BE237FA9@dominion.thruhere.net>
	<1305107117.30391.325.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 May 2011 13:22:31 -0700
Message-ID: <BANLkTimX6d0r_Jz2VwJO4m7C9-4qL8RvWQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Sun, 15 May 2011 20:25:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 11, 2011 at 2:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-05-10 at 17:58 +0200, Koen Kooi wrote:
>> Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende geschreven:
>>
>> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >
>> > As discussed, we want to make OE-Core usable with no distro set. This patch series
>> > makes some big steps towards that goal. I'd be interested in feedback on whether it
>> > does the right things and would be usable by others.
>> >
>> > The key is the inclusion of a distro/defaultsetup.conf file by bitbake.conf and
>> > in turn this pulls in a variety of other common include files which can likely be
>> > shared. Any point of this cycle can be overridden by another layer so its totally
>> > customisable. I'd encourage users to use the pieces they can where possible so we
>> > all share best practises but obviously people have choice.
>> >
>> > I did dump a load of "default" variables into default-distrovars.inc, I'm not
>> > calling that file finished, I just had to draw the line somewhere and start a
>> > discussion about this :)
>>
>> For angstrom we had to change a few things, have a look at
>> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/conf/distro/include/angstrom-core-tweaks.inc , specifically lines 12-18 and 53-54
>
> I don't understand what TOOLCHAIN_PATH and TOOLCHAIN_SYSPATH do, I can't
> find any reference to them in OECore. For the uclibc bits, I'm proposing
> to add:
>
> +DEPLOY_DIR_append = "-uclibc"
> +STAGING_DIR_TARGET_append = "-uclibc"
> +STAGING_DIR_HOST_append = "-uclibc"
> +SSTATE_MANIFESTS_append = "-uclibc"
>

this wont work. Since virtclasses empty out some of these vars e.g. native
resets STAGING_DIR_HOST but this will still append -uclibc to it since append
happens at the end


> to tclibc-uclibc.inc.
>
> For the SDK/TOOLCHAIN bits, I need to have a close look at the SDK and
> figure out what the implications are there as I want to ensure that they
> can all be parallel installed as well as being in separate tarballs but
> its something we need to look at.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


