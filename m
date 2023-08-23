Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639CEEE49A5
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 01:01:33 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.1851.1692752486391418128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 18:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=frxUAd0z;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-570b6e1a413so2111190eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692752485; x=1693357285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMNdHeQMCw+hob0giVd4jQ9ZlBaVFAVkt56aNLBxKcU=;
        b=frxUAd0zESgSRcW5n9dtzTC+YYwhFFy+hagHshybh6X3pgZHa4rENUOPtBjlh6H7IM
         LljIIFFQpjXNwLG19ji5i0rOLJGbpmyHSQIXAREF3ea2qIWpbAeke8FModWkg5Wo4Azx
         UcUiXSJJ5627MpUAKsgcbGn9uuovUqB+55e/11frIASFDR8RJ1CDBbJ9mFgFknHqvNBn
         MMF0bq7xja/tJcIQ2Ka0HVbG0RP42j16xjuv5y/cj8BKPGNcbR53tNtUblcVpymbpCTL
         KvhHDztoJ4FdwP2+STz++vOEpVzVwTwdi8Jyfv+d7tl5B3rug3FvakzZyO6mkxxyXLxD
         5wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692752485; x=1693357285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMNdHeQMCw+hob0giVd4jQ9ZlBaVFAVkt56aNLBxKcU=;
        b=B1zWrA+rWB3V2NcSLQ/DC0f2V20jDzWDSYeK/H1HtfvQEyB3+X1dSNehKWST2b+QL/
         I5xzPPictPaCg/5HQb9iofbGOwX38Pds9yacsL3GG8FYxx/NbDEb6clbpbak9vO4jzGN
         T89IAES8QOM+8cU5gHtntuN2dgZePp4smAbeWA33l7S+25Pn4xVOvh7WCaLlK6G5y213
         hgcY7F8Lq4dyZKxj/3rKA+aP66P7ITDxIfSzwd5AYT8ZN9Zh10QYWO8Zyc/79SBlFPLq
         NKOCZkr6sMiKeEpkl5y5DBU3Zfx9j+/DTI0+F2o6wziQOFdKz4uQqgSkwB5fBSFutpwy
         pojw==
X-Gm-Message-State: AOJu0YwaeOR1ipg6aZIJgAroVF12Lp31oOEgkQ6rzH620ARxsH0ZlxcX
	/p4yxMKv+myoIcEEpPYxx7loV+K8rHru8GSqWUk=
X-Google-Smtp-Source: AGHT+IHp29P5HJGA/w2Sv4pOsi+8d14ea5NgybVCH693eRBC3hVNKFtkzTKnHx0L+ce+xmWkVxqel1+YLkUh/q1ViAc=
X-Received: by 2002:a4a:654e:0:b0:566:b483:ee00 with SMTP id
 z14-20020a4a654e000000b00566b483ee00mr10904228oog.5.1692752485436; Tue, 22
 Aug 2023 18:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
 <20230817124612.1043464-2-p.lobacz@welotec.com> <CAMKF1so7HY+kgEgg6oEU9j0thdPuv-7qtjk3RvOkDEHT07nHwA@mail.gmail.com>
 <CAMKF1sp0R3i5Tq_3AJ38BnBA8bij7BqTPxv1pDs2=cjOxpNzyg@mail.gmail.com> <a218d04b-47bf-4c3e-a2cb-8dbe13ccb9fe@gmail.com>
In-Reply-To: <a218d04b-47bf-4c3e-a2cb-8dbe13ccb9fe@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2023 18:00:59 -0700
Message-ID: <CAMKF1spB_A8nB31-nMQmW-qKk3Mi=DEOiGvZvibfhKCFW7NCmg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v13 2/8] package_ipk.bbclass: add support for
 ACLs and xattr
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 01:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186543

On Tue, Aug 22, 2023 at 5:25=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> OK I have narrowed down the problem a bit more
>
> It seems to trigger with poky master + this patch series on archlinux
> build host ( it has glibc 2.38 natively ) . It works ok with nodistro (
> I guess its because nodistro does not use uninative but its just a guess =
)
>
> Add following at the end of conf/local.conf
>
> PACKAGE_CLASSES =3D "package_ipk"
>
> then run
>
> bitbake python3

If I just revert the following patch then do_package_write_ipk starts
to work normally.
I think this should be investigated and root caused, I am afraid that
if we accept this
series in its own form then once fedora/ubuntu/debian starts to get
glibc 2.38 this problem
will resurface.Lets hold on to this patch until this issue is resolved

commit 0ecd39717533ae11dc00c0a2e049c657ba41411f
Author: Piotr =C5=81obacz <p.lobacz@welotec.com>
Date:   Thu Aug 17 14:46:10 2023 +0200

   opkg-utils: add acl and xattr support

   Add support for tar archives created with --acls and/or --xattrs options=
,
   PAX header format.

   GNU tar and libarchive already supports ACLs and extended attributes.
   We can now add this support as well to opkg-build script in order to use
   fsetattr or setcap inside do_install command and end up with a file in
   an image with the relevant ACLs and xattrs.

   (From OE-Core rev: f6228716c3ce25cda54c7a2d62df5f7be72765ec)

   Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
   Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>


>
>
> On 8/22/23 10:03, Khem Raj wrote:
> > On Tue, Aug 22, 2023 at 8:58=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> >>
> >> On Thu, Aug 17, 2023 at 5:47=E2=80=AFAM Piotr =C5=81obacz <p.lobacz@we=
lotec.com> wrote:
> >>>
> >>> Extend OPKGBUILDCMD variable, with additional parameters, depending
> >>> on target distro features, in order to support ACLs and xattr.
> >>>
> >>> With fix pushed to the opkg-devel:
> >>> https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
> >>> opkg-build is able to create tar archives with ACLs and xattr.
> >>>
> >>> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> >>> ---
> >>>   meta/classes-global/package_ipk.bbclass | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-g=
lobal/package_ipk.bbclass
> >>> index b4b7bc9ac2..a0f106e4ad 100644
> >>> --- a/meta/classes-global/package_ipk.bbclass
> >>> +++ b/meta/classes-global/package_ipk.bbclass
> >>> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target=
.conf"
> >>>   PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
> >>>
> >>>   # Program to be used to build opkg packages
> >>> -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> >>> +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils=
.contains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DIS=
TRO_FEATURES', 'xattr', '-X', '', d)}'
> >>
> >> I wonder if it should be an append instead, because these are
> >> dependent on DISTRO_FEATURES anyway and it does not work if distro
> >> features are
> >> enabled and these options are removed from opkg-build cmdline. So
> >> these are required if distro features are enabled. It will also help
> >> the distros overriding OPKGBUILDCMD
> >>
> >
> > btw. I am encountering packaging failures in several packages using
> > zstd compression instead of xz e.g.
> > https://snips.sh/f/R42MbTZryH
> >
> >   Here is my OPKGBUILDCMD
> >
> > OPKGBUILDCMD =3D 'opkg-build -Z zstd -a "--threads=3D${ZSTD_THREADS}"
> > ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}
> > ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}'
> >
> >
> >>>
> >>>   OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
> >>>   OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_REC=
OMMENDATIONS") =3D=3D "1"]}"
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#186307): https://lists.openembedded.org/g/openemb=
edded-core/message/186307
> >>> Mute This Topic: https://lists.openembedded.org/mt/100799493/1997914
> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>

