Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3D8EFCE4F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 22:40:16 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31227.1772664012621791161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 14:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=awVpllvl;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a12cc20e71so88330e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 14:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772664011; cv=none;
        d=google.com; s=arc-20240605;
        b=Bkeq5zhRiwNRMdECUFw1sO6Bd2zlxE6kjw/8erqbEHrmiwKusN1E1vz4/dxZ8rDNI9
         x8roKvoid8X/8t/Wgy5euN9406uEOPXRnZbYuBVe9XO8B72a2zUt5rvkhQeqcUSRxeOI
         ESC/MtBYV1eCHaYprLj5UKkpvOQXDrFX7XH5ALgTBYjJkw82E5th5WU+TnD7JWMWxR5G
         Njjpx5Z21tRVZXxDfyWeI/YrIMGShOcXaVKBRwpouQ7n1Ys02fLIlQ4VFYzzbU576NWe
         xWFbEO94PMGu88Ik7E2kk2meb19PgU6QJnjUukLWqlvEub5S3fI331OaFw9Mp5y63mQz
         Az5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qfb5YzqwE3x4GmdJu2VGIIRr39qM4/ISr2fPeWe+nGA=;
        fh=+R+0AGhbSj0D/rV4JoRdGaTqyEMr6ZTcxU9gt3N8c+I=;
        b=N8JjmQjvqeGbCNNoXtbWnxoTg8HSY54H0GOibsJhnLHY6Jw0Jr1vbyB2drvMqygD79
         dVouhHYtu06UJSr7yPf32Pe/wje3DlqEJamK6F6PJ7BHGIdGz4itUuu1QdnOohK2E+zY
         thEaf4SCSOHDCdD/qN/ZI9Mlg3kZa3n73H4JBqr7IQNbsN2xwJdceYcgC++eTq5sHJCk
         pMsE3NhhLY/wkoUOg1ysA0a/wMf8qV6y4ihXt9Bc+rIor5m1TUYF4/auFEaPJ9gAPTXc
         a/qw7is3xvItBSwNGtKVs0vgc15dBYeXUmhuqc9VB9Kdv0zQUkbSgUEBRdlLJEmheDxe
         nEmQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772664011; x=1773268811; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfb5YzqwE3x4GmdJu2VGIIRr39qM4/ISr2fPeWe+nGA=;
        b=awVpllvlvt0ihUOSS1tvWQez10LVhso1aFRkCEMpBcxQfZWfMBCRuk5SCQvn6BOawX
         juCWN7sFZbwQSXpaHNeZy3rQC6QQ6bcKHaktuQ+BMGgppty6iAfdizf4O8H2w7Iaj8jH
         wgjVuwYP/v3+NBy01IjAs588Iy5Lgk8XFVTSGvJ0Z5+NVRtUkwYbxCuZumPUlJARjS0v
         q+GWimDzo0v0gkluoJJU8l/g9v3GkSCY8O+ZGgNf88tP4486AbpxSSQsb+MW+A9C4IIQ
         U9gZrF0NYM29df0X6ZDqbwl5VfL5tmkQG8imZUiBS9Eg05BTfsAPQges8OHtbzScVfqE
         obdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772664011; x=1773268811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfb5YzqwE3x4GmdJu2VGIIRr39qM4/ISr2fPeWe+nGA=;
        b=IV/gb+dkFFEXL19iQ+tY70TLTqJB7xvhYLRgU0ilzyj73K/L+LdFIM25EzClXgH9T1
         GjvteBiQbTrOf1Vc4JydGSI55oks30FnJN+GogW9kDiQmOr2GoCpW3vgb+BcJj2M8xH2
         ngLgoycm7L9KDm07EliStiGS07MYozzFQuN/pjQlLE8I5yWpxi7Pg938S2omUL3fFR3a
         UhbCAZAPAbNRylYYj0TKQXH2OBw8su4aKby3AU00b5FUsya0hfFP6R39c5ZmARldRdpW
         21AVQHtJU74Cf2ciN2/04v90lZVByNC+clWOnK72Aw1og+SodSztzNuW0Rt1+qSMAHGo
         QHYg==
X-Gm-Message-State: AOJu0Yxz6rYPEyj48Ov8k/yRCBE6jICzHkqOG4e6Rg07zDMaf3YtXJYH
	+1W+NRLJUOaV9Km5ce4/+1D44HGQ6lQCXGv0NYq2dKxgCz4dEGUp5TxXsjgHoiAIr+IxIhOBB6d
	RPo4UK7CxDzXidFr/jXmULOOSUQGEK+k=
X-Gm-Gg: ATEYQzyAQwvn0eTsQgYkyj8Yjb7VJO0cYqH1OGgG1yDcuK++6/P4eht4L5jO6qTeInL
	/zqbTeymLMIXRXB3fTwyrMXY7DCqcnO/VZudbIa8wcwru23JRIS4eIOzH5HB7PadANsualhTvfP
	aWCpPAR+dXB8TvwtOniHsUPwnndQWH3SkHu4fTQl1EZt8eMfZOQuNM9UWiYN1D63BN2A8x/KJxp
	LYASH6PzaioYYSs1egAOTgw3U7EyuyXj3FUYQIhUuyoEL/bv7kvFaSOeMeOwVVwgIDEFX6nXAXS
	g4cSiEcpTg==
X-Received: by 2002:a05:6512:124a:b0:59e:65ff:e57e with SMTP id
 2adb3069b0e04-5a12c2f2261mr87531e87.12.1772664010262; Wed, 04 Mar 2026
 14:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20260303234247.8034-1-martin.jansa@gmail.com> <DB5PR02MB1021312EEFBBA6D4E70FB8184EF7CA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021312EEFBBA6D4E70FB8184EF7CA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Mar 2026 23:39:56 +0100
X-Gm-Features: AaiRm50soIkyncV77i9PVsBrLQfQscFRP3AbbyB_C3ZFOG-FnW0xoPVvfGekFWc
Message-ID: <CA+chaQd+2NyacTnB8Lbnku302Ay60=q+fqMAazqUGzM5hNu-UQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] license_image.bbclass: report all packages with
 incompatible license
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 22:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232440

I don't mind changing it like that, I've kept it in one line, because
then it's easier to see them all when grepping for ERROR:, will send
v2 tomorrow.

On Wed, Mar 4, 2026 at 11:26=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Martin Jansa via lists.openembedded.org
> > Sent: den 4 mars 2026 00:43
> > To: openembedded-core@lists.openembedded.org
> > Cc: Martin Jansa <martin.jansa@gmail.com>
> > Subject: [OE-core] [PATCH] license_image.bbclass: report all packages w=
ith incompatible license
> >
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > When multiple packages cannot be installed it shows only first one it
> > finds, because of bb.fatal use. It might require many iterations to fin=
d
> > all packages to avoid.
> >
> > e.g. with ptest enabled and GPL-3.0-or-later, GPL-3.0-only set as
> > incompatible licenses you might get list like this for relatively small
> > image:
> >
> > Some packages cannot be installed into the image because they have inco=
mpatible licenses: bzip2-ptest (GPL-3.0-or-later), coreutils (GPL-3.0-or-la=
ter), coreutils-stdbuf (GPL-3.0-or-later), diffutils (GPL-3.0-or-later), fi=
ndutils (GPL-3.0-or-later), gawk (GPL-3.0-or-later), gnutls-openssl (GPL-3.=
0-or-later), gnutls-ptest (GPL-3.0-or-later), grep (GPL-3.0-only), make (GP=
L-3.0-only), mpfr (LGPL-3.0-or-later), python3-dbusmock (GPL-3.0-only), rea=
dline (GPL-3.0-or-later), sed (GPL-3.0-or-later)
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  meta/classes-recipe/license_image.bbclass | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-r=
ecipe/license_image.bbclass
> > index 8332905da5..252754727b 100644
> > --- a/meta/classes-recipe/license_image.bbclass
> > +++ b/meta/classes-recipe/license_image.bbclass
> > @@ -116,6 +116,7 @@ def write_license_files(d, license_manifest, pkg_di=
c,
> > rootfs):
> >      bad_licenses =3D oe.license.expand_wildcard_licenses(d, bad_licens=
es)
> >      pkgarchs =3D d.getVar("SSTATE_ARCHS").split()
> >      pkgarchs.reverse()
> > +    incompatible_packages =3D []
> >
> >      exceptions =3D (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "")=
.split()
> >      with open(license_manifest, "w") as license_file:
> > @@ -123,7 +124,7 @@ def write_license_files(d, license_manifest, pkg_di=
c, rootfs):
> >              remaining_bad_licenses =3D oe.license.apply_pkg_license_ex=
ception(pkg, bad_licenses, exceptions)
> >              incompatible_licenses =3D oe.license.incompatible_pkg_lice=
nse(d, remaining_bad_licenses, pkg_dic[pkg]["LICENSE"])
> >              if incompatible_licenses:
> > -                bb.fatal("Package %s cannot be installed into the imag=
e because it has incompatible license(s): %s" %(pkg, ' '.join(incompatible_=
licenses)))
> > +                incompatible_packages.append("%s (%s)" % (pkg, ' '.joi=
n(incompatible_licenses)))
> >              else:
> >                  incompatible_licenses =3D oe.license.incompatible_pkg_=
license(d, bad_licenses, pkg_dic[pkg]["LICENSE"])
> >                  if incompatible_licenses:
> > @@ -171,6 +172,9 @@ def write_license_files(d, license_manifest, pkg_di=
c, rootfs):
> >                                         "The license listed %s was not =
in the "\
> >                                         "licenses collected for recipe =
%s"
> >                                         % (lic, pkg_dic[pkg]["PN"]), d)
> > +    if incompatible_packages:
> > +        bb.fatal("Some packages cannot be installed into the image bec=
ause they have incompatible licenses: %s" % (', '.join(incompatible_package=
s)))
>
> May I suggest to use "\n\t" as separator instead. Especially if you expec=
t
> a lot of packages to be shown, having them all on one line becomes messy
> very quickly. E.g.:
>
>         bb.fatal("Some packages cannot be installed into the image becaus=
e they have incompatible licenses:\n\t%s" % ("\n\t".join(incompatible_packa=
ges)))
>
> > +
> >      oe.qa.exit_if_errors(d)
> >
> >      # Two options here:
>
> //Peter
>

