Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVsK0-0008WC-Oh
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:08:09 +0100
Received: by lagj5 with SMTP id j5so462287lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=29+GMs9WmkR6Pav7HpDx8F+7UyZ1D8KSEU45EWs98ZU=;
	b=ouyMRgYDp9MIHqsgMjtjsj5eUtc/sKcqH18nOfnOSe46eGaOsQNqqf89Uer5ZrORIm
	la89k9mpsErJn4QAR2rfAcCQjg7yHPcMVQbsUiPsrzgfc6kqPn8zzieLga/ybNdxbj8b
	VfUiEbUd/QBlYy8nj8jxIM7jB2us5E2/xz8vQ=
Received: by 10.152.104.206 with SMTP id gg14mr2774406lab.41.1322690478297;
	Wed, 30 Nov 2011 14:01:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 30 Nov 2011 14:00:46 -0800 (PST)
In-Reply-To: <1322569564.3166.1.camel@ted>
References: <1322521031-26849-1-git-send-email-msm@freescale.com>
	<CAEsOVNfRuMJfh3HW-6=0ivjngv+e8Dxk7fKo_ySUSgB4EYDrLg@mail.gmail.com>
	<1322569564.3166.1.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2011 14:00:46 -0800
Message-ID: <CAMKF1srOoaQa2eLg4xkroaYXjJ+gB4dF64X4=zG6Vj-GPFEf2A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] eglibc-initial: Ensure symlinks point to the correct location when built from sstate cache
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
X-List-Received-Date: Wed, 30 Nov 2011 22:08:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 4:26 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If the sstate files are installed into a sysroot from the sstate cache,
> the directory to the main sysroot can change and the symlinks aren't
> adjusted to account for this. This is a problem specific to the toolchain
> bootstrap process. This patch adds up a function to recreate the
> symlinks, hence ensuring they always point at the correct location.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-c=
ore/eglibc/eglibc-initial.inc
> index 448f73a..9062516 100644
> --- a/meta/recipes-core/eglibc/eglibc-initial.inc
> +++ b/meta/recipes-core/eglibc/eglibc-initial.inc
> @@ -60,4 +60,16 @@ do_siteconfig () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0:
> =C2=A0}
>
> +SSTATEPOSTINSTFUNCS +=3D "eglibcinitial_sstate_postinst"
> +eglibcinitial_sstate_postinst() {
> + =C2=A0 =C2=A0 =C2=A0 if [ "${BB_CURRENTTASK}" =3D "populate_sysroot" -o=
 "${BB_CURRENTTASK}" =3D "populate_sysroot_setscene" ]
> + =C2=A0 =C2=A0 =C2=A0 then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Recreate the symlink=
s to ensure they point to the correct location
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in linux asm asm=
-generic; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rm -f ${STAGING_DIR_TCBOOTSTRAP}${includedir}/$t
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${STAGING_DIR_TCBOOTSTRA=
P}${includedir}/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
> + =C2=A0 =C2=A0 =C2=A0 fi
> +}
> +

you could do ln -sf here


