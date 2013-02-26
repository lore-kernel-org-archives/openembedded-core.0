Received: from mail-ia0-f181.google.com ([209.85.210.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAEYQ-0004Tg-DQ
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 08:02:32 +0100
Received: by mail-ia0-f181.google.com with SMTP id w33so2063842iag.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 22:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=nR8NTNGDHLRKtQUJdipojkCm786FFVuqOQW7SHitAs0=;
	b=CZgbCqkx1uR3nItkTLM7uXmApwzoj5qDkA/VBhPvo9lEK24glrnyxJQqE3DFNh/9AC
	AFNln3Fmj0s3xCidQKZ2LLsFJAtG4NFoKXx88ZzpqML7e9xR9PIf3PNcsh2riIRtfnMX
	nrlQf1bvHa70NKMXsBISMTrfWuaq9I/v/sSuKLZn5CZ0v8DNq1Nq1q1Mq8ROtpFDY57m
	vyfm12TpcEIHaz9w/TbHkpmDoc+IdysU6ZJhtcJrH7tM/rwib+y/IJ7SKLVyDCbNrojZ
	7OeOom7QFig8F+v0jsQzehWEjLf7qUY1qCngE+RM5fhqiWhRK4QT0B9+ZP4cabtBB/N5
	2aQg==
X-Received: by 10.50.184.226 with SMTP id ex2mr5067804igc.24.1361861159139;
	Mon, 25 Feb 2013 22:45:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Mon, 25 Feb 2013 22:45:29 -0800 (PST)
In-Reply-To: <E79C80CE9122499B9C7D2D855CDF6319@intel.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
	<E79C80CE9122499B9C7D2D855CDF6319@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2013 22:45:29 -0800
Message-ID: <CAMKF1sqke6HuWosvNqgXGtMqL3cyPGG2w6=rFD2buvH6dOmvmQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFE: make the init manager an image feature (again)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2013 07:02:38 -0000
X-List-Received-Date: Tue, 26 Feb 2013 07:02:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 24, 2013 at 2:37 AM, Ross Burton <ross.burton@intel.com> wrote:
> Hi,
>
> Just brainstorming out loud, but here's a suggestion that might just plea=
se everyone:
>
> A virtual provider for the init manager, which can be overridden per-imag=
e (for main / rescue images).

Yes I was thinking about it too but it has to be made one off case.
Since we wont be able to support all combinations


>
> DISTRO_FEATURES contains the init script *style* that you want: sysvinit =
or systemd.  These are not mutually exclusive so specifying both will get y=
ou both directly in packages that support both.  I'm still not convinced we=
 need to split these out into separate packages, the size impact is practic=
ally negligible and the dependencies are effectively redundant as you'll ha=
ve trouble booting without an init system.  Instead the postinsts should wr=
ap the initscript fragments in checks.

systemd lives fine with initscripts. In some cases the adhoc unit
files just call these initscripts so in a way systemd does
expect the initscripts to be around. So systemd is sort of addon and
thats why ${PN}-systemd worked well. So we can have
a perfect sysvinit based system and then we replace it with systemd
and add the ${PN}-systemd packages into image and it becomes
a systemd based image. I think as porting happens this case of
wrapping initscripts into systemd service files will continue
unless individual packages get their own unit files which are
rewritten and do not use initscripts anymore.

>
> Those distro features will also be used to enable/disable features in the=
 source, so enabling systemd may well lead to libsystemd-* libraries sneaki=
ng into your rescue image.  The systemd libraries will have to be reviewed =
to verify that installing one of them doesn't pull in systemd itself.
>
> Here's the fun bit - we can't have two builds of udev in the same distro,=
 and that's what could happen, so I think we'll need to cut down to one ude=
v instead of two.

well we can make a udev recipe which uses exact sources used by systemd.

>
> I'm not entirely convinced this is a good plan yet myself though=E2=80=A6
>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


