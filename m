Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFyO7-0004QJ-Us
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 04:27:11 +0200
Received: by eaad12 with SMTP id d12so1380044eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Sep 2012 19:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=nCkQzVqgMmjb9b7DIr3CnmVnSQIvxpYmC8uwi0+9zng=;
	b=a0GO2zdLG2RzSi3ot5AsTuKiRZmtloGcLMHY0Acp+H6ahyEa6dITnOE9AZGHkX936Y
	p3YG28c7aie4neLmTKuCfaBJg5/A/hXOfj/RYVQwuOIqwPlitfOUs3YJ7u3yt+28iJar
	zR2KyHCsLR7kJkegRRGAmdRz/X+RISiYoy6zajIqm78c1/qnWzItky2A4ASEdk91YfgY
	We8d6EwpJUt2pAKMhMKrFLhIsiy3sR1hoky+7FDyXIrOcQMHDbv6H6vzAVndIrXpGdzM
	cmIb55KK1YPHxFS5spYeHQdkJlx4ou6isAO7sENlEil9O7N4CUBzQC1qoFze/a1RVlDN
	4BkQ==
Received: by 10.14.202.131 with SMTP id d3mr13168075eeo.32.1348452864976; Sun,
	23 Sep 2012 19:14:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Sun, 23 Sep 2012 19:13:54 -0700 (PDT)
In-Reply-To: <1348237405.10108.81.camel@ted>
References: <1348237405.10108.81.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Sep 2012 19:13:54 -0700
Message-ID: <CAMKF1sqX9K66=gw5K8_s2cWTxc3wS6k5+Ey9sWYwbbanbZRNwg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] bitbake.conf/sanity: Separate versions and PN stamp components into separate directories
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
X-List-Received-Date: Mon, 24 Sep 2012 02:27:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2012 at 7:23 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>
> I haven't made my mind up about this layout change idea yet. I thought
> I'd put it out there for feedback. It would make the STAMPCLEAN function
> more accurate/easier. I'll follow this email with the WORKDIR
> counterpart we could consider which would make some of the cleanup
> scripts easier.
>


agreed looks ok my clean build went fine.

> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 385d733..1b7125d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -540,6 +540,8 @@ def check_sanity(sanity_data):
>              f.write(current_abi)
>          elif abi =3D=3D "7" and current_abi =3D=3D "8":
>              messages =3D messages + "Your configuration is using stamp f=
iles including the sstate hash but your build directory was built with stam=
p files that do not include this.\nTo continue, either rebuild or switch ba=
ck to the OEBasic signature handler with BB_SIGNATURE_HANDLER =3D 'OEBasic'=
.\n"
> +        elif (abi !=3D current_abi and current_abi =3D=3D "9"):
> +            messages =3D messages + "The layout of the TMPDIR STAMPS dir=
ectory has changed. Please clean out TMPDIR and rebuild (sstate will be sti=
ll be valid and reused)\n"
>          elif (abi !=3D current_abi):
>              # Code to convert from one ABI to another could go here if p=
ossible.
>              messages =3D messages + "Error, TMPDIR has changed its layou=
t version number (%s to %s) and you need to either rebuild, revert or adjus=
t it at your own risk.\n" % (abi, current_abi)
> diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
> index 83b668a..e8cf9a3 100644
> --- a/meta/conf/abi_version.conf
> +++ b/meta/conf/abi_version.conf
> @@ -4,4 +4,4 @@
>  # that breaks the format and have been previously discussed on the maili=
ng list
>  # with general agreement from the core team.
>  #
> -OELAYOUT_ABI =3D "8"
> +OELAYOUT_ABI =3D "9"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9b41749..4b6fdb7 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -332,8 +332,8 @@ GITDIR =3D "${CO_DIR}/git2"
>  BZRDIR =3D "${CO_DIR}/bzr"
>  HGDIR =3D "${CO_DIR}/hg"
>
> -STAMP =3D "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}-${EXTENDPE}${P=
V}-${PR}"
> -STAMPCLEAN =3D "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}-[0-9]*-*"
> +STAMP =3D "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${P=
V}-${PR}"
> +STAMPCLEAN =3D "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
>  WORKDIR =3D "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}"
>  T =3D "${WORKDIR}/temp"
>  D =3D "${WORKDIR}/image"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


