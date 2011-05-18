Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMkVj-00062p-RU
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:26:15 +0200
Received: by eye27 with SMTP id 27so541442eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=RRnMOhmAncRdFcNdQuXK6dcR0jnlc0P5clKi83+Hxco=;
	b=YUavHLgwvkn+UvGKpbLf6zCEExpmdISK9Y4/zjkbrsOlaF+Qo8aQuHQyorAQgyQYMg
	Xn/29l/BDpz4h+A7arRFARYCWyJIytczU9kRKTNfuBrppIf2+M9mScTdOGsgHrmhfpP7
	xdZlJxG+92Ba0eAM43pz17Nip6u++jkeTU8pI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=atdx4pZBCW700W8UwhWQ3KAyEsNdySuY0fU18qZ33EfWIryWmstFNgpwy0O7Klo0nl
	7pgLoQWJNQbZwIC8Cg7vHQKLmaq0TYprpQ9DgadFsFQDJ5Re/moSRfTPf3B7/ZOlMaUe
	sV9hz/XXgzAQjMa9uAr53fr4zbN9d+8L7GE1s=
Received: by 10.14.7.198 with SMTP id 46mr792292eep.108.1305737552282; Wed, 18
	May 2011 09:52:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Wed, 18 May 2011 09:52:02 -0700 (PDT)
In-Reply-To: <1305629309-16745-1-git-send-email-koen@dominion.thruhere.net>
References: <1305629309-16745-1-git-send-email-koen@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 May 2011 09:52:02 -0700
Message-ID: <BANLkTim-D6PgyzO5WbybZk+GYL3kpjuhFA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distro/defaultsetup.conf: Append TCLIBC to TMPDIR by default
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
X-List-Received-Date: Wed, 18 May 2011 17:26:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 3:48 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> The current solutions to share uclibc, eglibc and glibc builds in the
> same tree all have various issues associated with them. Appending the
> suffix to TMPDIR seems like the best solution since sstate (which
> defaults to outside TMPDIR) will allow reuse of any components.
>
> This avoids messy changes to the core with other approaches to this
> problem inevitably entail, usually in code where this abstraction isn;'t
> logically best placed.


So far so good. This patch is working ok except a few niggles
I still get TMPDIR w/o tclibc append created ad it has

[kraj@leto ~/work/newoe/build]
$ ls
.   sstate-cache         tmp-angstrom_2010_x-eglibc
..  tmp-angstrom_2010_x  tmp-angstrom_2010_x-uclibc

[kraj@leto ~/work/newoe/build/tmp-angstrom_2010_x]
$ ls
.  ..  abi_version  cache  saved_tmpdir

[kraj@leto ~/work/newoe/build/tmp-angstrom_2010_x/cache]
$ ls
.  ..  bb_codeparser.dat  bb_persist_data.sqlite3


>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0meta/conf/distro/defaultsetup.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 =C2=A04 ++++
> =C2=A0meta/conf/distro/include/tclibc-uclibc.inc | =C2=A0 =C2=A06 ------
> =C2=A02 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaul=
tsetup.conf
> index 8da6c0a..e7636b4 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -14,6 +14,10 @@ require conf/distro/include/tcmode-${TCMODE}.inc
> =C2=A0TCLIBC ?=3D "eglibc"
> =C2=A0require conf/distro/include/tclibc-${TCLIBC}.inc
>
> +# Allow single libc distros to disable this code
> +TCLIBCAPPEND ?=3D "-${TCLIBC}"
> +TMPDIR_append =3D "${TCLIBCAPPEND}"
> +
> =C2=A0CACHE =3D "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(bb.=
data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['=
', '/' + str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKM=
ACHINE', d, 1))]}"
>
> =C2=A0USER_CLASSES ?=3D ""
> diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distr=
o/include/tclibc-uclibc.inc
> index 27f6ec6..83418d6 100644
> --- a/meta/conf/distro/include/tclibc-uclibc.inc
> +++ b/meta/conf/distro/include/tclibc-uclibc.inc
> @@ -20,12 +20,6 @@ CXXFLAGS +=3D "-fvisibility-inlines-hidden"
>
> =C2=A0IMAGE_LINGUAS =3D ""
>
> -DEPLOY_DIR_IMAGE =3D "${TMPDIR}/deploy/images"
> -DEPLOY_DIR_append =3D "-uclibc"
> -STAGING_DIR_TARGET_append =3D "-uclibc"
> -STAGING_DIR_HOST_append =3D "-uclibc"
> -SSTATE_MANIFESTS_append =3D "-uclibc"
> -
> =C2=A0LIBC_DEPENDENCIES =3D "\
> =C2=A0 =C2=A0 uclibc \
> =C2=A0 =C2=A0 uclibc-dbg \
> --
> 1.6.6.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


