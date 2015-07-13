Return-Path: <pespin.shar@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5F52B607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 10:23:26 +0000 (UTC)
Received: by laem6 with SMTP id m6so6375038lae.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mUp6tJ31kr2HDsDbyISuRpfFkMa4WJyL5o1tU4QXTXI=;
	b=bcEhtKxJbCkoBq7oPA+1v0XHNtJrSmlvgIEvF0vSK+7c13E+iQ6RlIFax+UDfqkuW4
	QveV9CPlMA2MyW0J45Xxa/WZipsnySOlNZx6XFEgZCLg2frW1OsMt6/KPUUO49gZzcyL
	CiGkqi79BnjwiMYQVL0YJM4QBcWWPF/Ii+ol8IwfqHsTvd8LVY5BDP/IK0vY3jBfSD5s
	wrMEWpIz7E7Heg23tCAO2sYFDaV0JN93eHtT8m+t89FwOlOP0xz6OjFTkUmdF75nV7pC
	bLBJKWp9Vq1bTQfy3vrxP7JxXY6IxI8Yda1m/Xu87exuiLlfxg9dFrB6cYYE6sSyYnxd
	b18Q==
MIME-Version: 1.0
X-Received: by 10.112.198.74 with SMTP id ja10mr31664839lbc.19.1436783005897; 
	Mon, 13 Jul 2015 03:23:25 -0700 (PDT)
Received: by 10.25.3.10 with HTTP; Mon, 13 Jul 2015 03:23:25 -0700 (PDT)
In-Reply-To: <CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
	<CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
Date: Mon, 13 Jul 2015 12:23:25 +0200
Message-ID: <CAEGpDuYVEB0Y5T+SqybCfagCkO1rA1A66toZdYz_EMWGEc87aw@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Pau Espin Pedrol <pau.espin@aweurope.be>
Subject: Re: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 13 Jul 2015 10:23:29 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I am not sure which is the behavior with those paths right now and how
it should be.

I just checked this:
http://www.freedesktop.org/software/systemd/man/systemd.unit.html#Unit%20Load%20Path

So, it seems according to documentation that system services should be
installed under /usr/lib/systemd/system, but currently they are
installed in /lib/systemd/system in my generated image. Is that a
expected behaviour? Shouldn't we try to follow documentation? I see
that sometimes /lib/systemd/system path is appended to the dirs in
systemdsystemunitpath, but it's not stated in the documentation,
that's a bit strange.

For user services, /usr/lib/systemd/user is already being used as
stated in docs.

Now, when multilib comes in, I get lost. If I understand correctly,
with multilib enabled we have too /lib64 and /usr/lib64. Are then
systemd service files suppoused to be installed in /usr/lib/systemd/
or in /usr/lib64/systemd/ ? If I undersood correctly your comment you
meant they should still be going into /usr/lib/systemd right?

Now, talking about bitbake.conf. I see there's already a line with the
following:
export systemd_unitdir = "/lib/systemd"

So, apart from your nonarch issue, I think it would also be a good
idea to split systemd_unitdir into system and user, as done by
provided pc in systemd (src/core/systemd.pc.in):
1- If still want system services to be in /lib and user services to be
in /usr/lib:
export nonarch_libdir = "${prefix}/lib"

export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
or
export systemd_system_unitdir = "${nonarch_base_libdir}/systemd"
export systemd_user_unitdir = "${nonarch_libdir}/systemd"


2- If you want both in /usr/lib:
export nonarch_libdir = "${prefix}/lib"

export systemd_system_unitdir = "${nonarch_libdir}/systemd/system"
export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
or
export systemd_system_unitdir = "${nonarch_libdir}/systemd"
export systemd_user_unitdir = "${nonarch_libdir}/systemd"


Pau


2015-07-11 0:36 GMT+02:00 Burton, Ross <ross.burton@intel.com>:
>
> On 10 July 2015 at 15:04, Pau Espin Pedrol <pau.espin@aweurope.be> wrote:
>>
>> +FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-*
>> ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules
>> ${libdir}/systemd/user/*"
>
>
> That's going to break in multiarch builds, ie systemd units go into
> $prefix/lib even if $libdir is $prefix/lib64.
>
> (looks like we should add nonarch_libdir to bitbake.conf to codify this)
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

