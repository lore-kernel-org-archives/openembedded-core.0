Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QlksP-00010e-D0
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 18:53:01 +0200
Received: by pzk1 with SMTP id 1so1142264pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=I/zcEXC5pE4mjTx3+twE0rjHXIy/c/Zhol2ibRJjYds=;
	b=XCfg0Ulu3211DJMalrTu2h77Mej/U+jsBynqzXiOu/HEFRjjxHUOt3vfolmNRUu+Sj
	Nn0J/jZncCRT0DPMBuNvcX9zFx3xJjQK40L7dB+eStfdpRJrv+mYfLfRR5Jt5JibMvws
	M4/PU2uLXlnQNTghqESWpcUWC3Y6qiFty3Hak=
Received: by 10.68.46.38 with SMTP id s6mr11195953pbm.10.1311698927220; Tue,
	26 Jul 2011 09:48:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Tue, 26 Jul 2011 09:48:16 -0700 (PDT)
In-Reply-To: <1311386389-9819-1-git-send-email-raj.khem@gmail.com>
References: <1311386389-9819-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jul 2011 09:48:16 -0700
Message-ID: <CAMKF1spH8MKhC458LkDaXZBFurg7J=9W76wp8YDFXYc4PKRm9Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] siteinfo: Rework the siteinfo for powerpc to fix uclibc fallout
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
X-List-Received-Date: Tue, 26 Jul 2011 16:53:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ping ? ppc/uclibc is broken in oe-core w/o this atm.

On Fri, Jul 22, 2011 at 6:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I believe that powerpc-linux is now a common file across 32bit/64bit
> linux for powerpc be it uclibc or glibc. I compared the differences
> between powerpc-linux-uclibc and powerpc-linux files and it
> powerpc-linux was more uptodate and all the new stuff it had was needed
> for uclibc anyway so we do not need to keep exact copy of powerpc-linux
> as powerpc-linux-uclibc instead we use powerpc-linux for powerpc/uclibc
> targets.
>
> Secondly linux specific files were added in archinfo dictionary
> which I think logically belongs to targetinfo dictionary therefore
> moved them to targetinfo
>
> now uclibc/powerpc is buildable again
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/classes/siteinfo.bbclass =C2=A0| =C2=A0 16 ++++++++++------
> =C2=A01 files changed, 10 insertions(+), 6 deletions(-)
> =C2=A0delete mode 100644 meta/site/powerpc-linux-uclibc
>
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclas=
s
> index c5308b3..056c519 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -33,11 +33,11 @@ def siteinfo_data(d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "mips64": "endian-big bit-64 mips64-common",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "mips64el": "endian-little bit-64 mips64-comm=
on",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "mipsel": "endian-little bit-32 mips-common",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc": "endian-big bit-32 powerpc-common=
 powerpc32-linux",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc": "endian-big bit-32 powerpc-common=
",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "nios2": "endian-little bit-32 nios2-common",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc64": "endian-big bit-64 powerpc-comm=
on powerpc-linux powerpc64-linux",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0"ppc": "endian-big bit-32 powerpc-common pow=
erpc32-linux",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0"ppc64": "endian-big bit-64 powerpc-common p=
owerpc-linux powerpc64-linux",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc64": "endian-big bit-64 powerpc-comm=
on",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"ppc": "endian-big bit-32 powerpc-common",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"ppc64": "endian-big bit-64 powerpc-common",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "sh3": "endian-little bit-32 sh-common",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "sh4": "endian-little bit-32 sh-common",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "sparc": "endian-big bit-32",
> @@ -62,8 +62,12 @@ def siteinfo_data(d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "arm-linux-uclibceabi": "arm-linux-uclibc",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "armeb-linux-gnueabi": "armeb-linux",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "armeb-linux-uclibceabi": "armeb-linux-uclibc=
",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc-linux-gnuspe": "powerpc-linux",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc-linux-uclibcspe": "powerpc-linux-uc=
libc",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc-linux": "powerpc32-linux",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc-linux-uclibc": "powerpc-linux power=
pc32-linux",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc-linux-gnuspe": "powerpc-linux power=
pc32-linux",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc-linux-uclibcspe": "powerpc-linux po=
werpc32-linux powerpc-linux-uclibc",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc64-linux-gnuspe": "powerpc-linux pow=
erpc64-linux",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0"powerpc64-linux": "powerpc-linux",
> =C2=A0 =C2=A0 }
>
> =C2=A0 =C2=A0 hostarch =3D d.getVar("HOST_ARCH", True)
> diff --git a/meta/site/powerpc-linux-uclibc b/meta/site/powerpc-linux-ucl=
ibc
> deleted file mode 100644
> index e69de29..0000000
> --
> 1.7.4.1
>
>


