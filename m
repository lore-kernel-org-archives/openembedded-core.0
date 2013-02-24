Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U9cTs-00070m-5k
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Feb 2013 15:23:08 +0100
Received: by mail-ob0-f170.google.com with SMTP id wc20so2001082obb.15
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2013 06:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=d/4kmBwlmW603Z30zBf9RW14VzchioTasMB7tJCVqSE=;
	b=XlwJomSh2u6JtOAj+5BdR8mqkxlcHgJEHsXed/HQBIT75rw6v5MExCSDfw/LmniJPw
	mcv4SkdWmZB8zwttmrVeTMuahQJGfYfabfVvLCp1B8OyTZbzfXP+a0fxCFX1mLn60v/e
	9KXipXj/1XE07blg6J+kFVBOOrO1Fnl6ZqV8ZaM4iSpwi/tVd1dv3KXC4m7735Q16jVx
	Vuu+lCb45dfN5YJ9aPrFFcundKIk42nogeaIErC8UuVJRxrBdcc0Qb08CkajVL0zDcmy
	rIHXDf4HifCQ20UC1xsnlfEC1qGTr7WG7A8vkD5OCSO1OTDgu/vSOKJrSSY4hMt88DHk
	81tQ==
MIME-Version: 1.0
X-Received: by 10.60.8.40 with SMTP id o8mr4637441oea.112.1361714811222; Sun,
	24 Feb 2013 06:06:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Sun, 24 Feb 2013 06:06:50 -0800 (PST)
In-Reply-To: <E79C80CE9122499B9C7D2D855CDF6319@intel.com>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LYo_FLTkZ_OiFf6Tt_oYO6NoUAUB74s__2UcKv7ccdxaA@mail.gmail.com>
	<E79C80CE9122499B9C7D2D855CDF6319@intel.com>
Date: Sun, 24 Feb 2013 11:06:50 -0300
X-Google-Sender-Auth: vrwN6gydVa36EB9HHdCY9EAi8SU
Message-ID: <CAP9ODKphcmassr66cE_=M5R20gEYVwbVLwyoZu5NnKi6W0T5Kg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 24 Feb 2013 14:23:08 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 24, 2013 at 7:37 AM, Ross Burton <ross.burton@intel.com> wrote:
> Hi,
>
> Just brainstorming out loud, but here's a suggestion that might just plea=
se everyone:
>
> A virtual provider for the init manager, which can be overridden per-imag=
e (for main / rescue images).
>
> DISTRO_FEATURES contains the init script *style* that you want: sysvinit =
or systemd.  These are not mutually exclusive so specifying both will get y=
ou both directly in packages that support both.  I'm still not convinced we=
 need to split these out into separate packages, the size impact is practic=
ally negligible and the dependencies are effectively redundant as you'll ha=
ve trouble booting without an init system.  Instead the postinsts should wr=
ap the initscript fragments in checks.

The size impact it not negligible; specially for initramfs images but
what concerns me even more is the upgrade path from previous users of
meta-oe systemd.

> Those distro features will also be used to enable/disable features in the=
 source, so enabling systemd may well lead to libsystemd-* libraries sneaki=
ng into your rescue image.  The systemd libraries will have to be reviewed =
to verify that installing one of them doesn't pull in systemd itself.
>
> Here's the fun bit - we can't have two builds of udev in the same distro,=
 and that's what could happen, so I think we'll need to cut down to one ude=
v instead of two.

And add init scripts to this udev as well

> I'm not entirely convinced this is a good plan yet myself though=85

I'd like to have an upgrade path.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


