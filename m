Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvF63-0000F2-E9
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 21:26:03 +0100
Received: by fxm8 with SMTP id 8so1511297fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 12:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=DHoFWOSpIUjXI8djPwkmKH4xoXOizgi6GcYshiBgV68=;
	b=jcQMZ3OG/8rr9lgvEXujvd8/IFKQS8SZOa4W0Z3CTSRFEXU+wjHEQAQvvgXKajMDjO
	O2g4t0zd99JC0kfhqvd0Pk7djrDoBxDIvbn1hx8RGrMPjjtnH4zk7Vs9Erks5E2P4ZSo
	Eehdt4LP2F7YVfXDfUgrDe5ZQtgyX5titkgq8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=ewzKWHqCNixngVLS4vpBzFsExZxhvh53p2gctXFqG6TDp6U0PUOh6gHrTu4H68xGkJ
	x9iwYwxYaCEdM6fntfouEcRfj4juerpgh+UzXUwSEZY4Gl6uSvJYqwlaPIQe1oHf5/AD
	ItNP1FVkaI0PzAxhoakXgF+iLWsgS0zOaubds=
Received: by 10.223.87.75 with SMTP id v11mr1972168fal.131.1299183874751; Thu,
	03 Mar 2011 12:24:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Thu, 3 Mar 2011 12:24:12 -0800 (PST)
In-Reply-To: <06ae5cd63b3b42d8dafe953ffbce93c321f11ac3.1299182375.git.sgw@linux.intel.com>
References: <cover.1299182375.git.sgw@linux.intel.com>
	<06ae5cd63b3b42d8dafe953ffbce93c321f11ac3.1299182375.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2011 12:24:12 -0800
Message-ID: <AANLkTi=Nm9RASdFb0EfxP6fDTfUaLsQ0z4eeEbrBUkVk@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 06/10] ADT: Bug fix for Suse Linux
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
X-List-Received-Date: Thu, 03 Mar 2011 20:26:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2011 at 12:02 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Liping Ke <liping.ke@intel.com>
>
> On Suse linux11.2, we found when using sudo, we must add -E opts
> to preserver some network proxy environment settings. Otherwise,
> opkg-cl can't access files behind firewall. [bug #785]
> Also, we need to add absolute path when sourcing files.
> Fix for [bug #786]
>
> Signed-off-by: Liping Ke <liping.ke@intel.com>
> ---
> =C2=A0.../adt-installer/scripts/adt_installer_internal =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A0.../installer/adt-installer/scripts/data_define =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_in=
staller_internal b/meta/recipes-devtools/installer/adt-installer/scripts/ad=
t_installer_internal
> index b5e304d..df142ff 100755
> --- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer=
_internal
> +++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer=
_internal
> @@ -81,7 +81,7 @@ else
> =C2=A0fi
>
> =C2=A0#first update repository
> -OPKG_CMD=3D"sudo $LOCAL_OPKG_LOC/bin/opkg-cl"
> +OPKG_CMD=3D"sudo -E $LOCAL_OPKG_LOC/bin/opkg-cl"
>
> =C2=A0echo_info "Updating opkg..."
> =C2=A0$OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR update &>> $Y=
OCTOADT_INSTALL_LOG_FILE
> diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/data_d=
efine b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
> index 77f8b38..e29cc30 100644
> --- a/meta/recipes-devtools/installer/adt-installer/scripts/data_define
> +++ b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
> @@ -23,7 +23,7 @@
> =C2=A0# THE SOFTWARE.
>
> =C2=A0config_file=3D"adt_installer.conf"
> -source $config_file
> +source `eval echo $PWD`/$config_file

would just using source `pwd`/$config_file work here

>
> =C2=A0LOCAL_OPKG_LOC=3D"./opkg/build/opkg"
> =C2=A0LOCAL_OPKG_FOLDER=3D"./opkg/build"
> --
> 1.7.1.1
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


