Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA03C7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 04:22:36 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.1875.1682137355173809877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 21:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@nathanrossi.com header.s=google header.b=N311c+ui;
 spf=pass (domain: nathanrossi.com, ip: 209.85.218.49, mailfrom: nathan@nathanrossi.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-956ff2399b1so342541966b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 21:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google; t=1682137353; x=1684729353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGXES+l38RunUFDQVayQLIzeOri8nK0+H9BZ9xZOS+o=;
        b=N311c+uixOSgPnooGtHQVezinMXn0rNs+1UWd0jNaOOaRXFMxNiiXAB7qfbMioO+qn
         IjL/quSkJBXgSefhukTdAEWLdvoiQwPstqu6l1Bp8ablEUm9i3aBFueJUDZge2OFu9bi
         niu2C/rvDB+4gT7zpHo+wdmddwfZ0ilrSCC2iTM45BbVaMAoVChu8lrz/YISw3WmDnsR
         EycIci0xD95aZE4alPn0W20zddpX04n9+w6n6ZEJIHavXZwjxLWpcukXUqhwNT2eg1fw
         rD1wTMzx9VUl6UQj6SMBESEuicdhe8I4ap0+8KRy2hGYFw+krMmOZTjQ62giNIqB54B9
         vh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682137353; x=1684729353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGXES+l38RunUFDQVayQLIzeOri8nK0+H9BZ9xZOS+o=;
        b=aDiHIFjDwzYvtOSG9dCHfN4x28BdCSUcwfbUiH8XZYR3j9VVWaGUQWfJBm33ml/oHB
         RIftRA4rUlpZKVyUzzyuDvumQtXrn9LkqrI4a7t40Csh0OsSlBYCqQmh9v1z7Zn0Ggsc
         e/uYS08NmXlbBo89VWcR018E7kDJbjYGuRuKJ7AC/SAq4qNbsvmFyGIs/LIGg6FR36oa
         yD0xNJ8JgVaNrgXrsMnI1qCLJ88Es9KKWBcFaMuTcoIB82xjGWmdNKI32SwI5uLu4M2t
         gKGpYMLn7JbAC6Vct3DBlmvkpOiAlQqYUnNMzQ7029hMgCiMtJ8IO/ijmpvrJLX9nk+Y
         T3wg==
X-Gm-Message-State: AAQBX9fXlgnRd5UR9Bwy35MyiOOwkMqyMX3pVwwaWt6rCxI2SCDDSKQW
	JJNuCdriJw4LpyRNh/yBvKg0p07+TvG6Q4qy/8hlDw==
X-Google-Smtp-Source: AKy350ZinJGVar5eRiEbowGNghpdwKifRbAssU6VGr7mPqOQJ0OsylQf59UvzViwvRexgndfn5rDsl6/8+Pfx6PpwS0=
X-Received: by 2002:a17:906:697:b0:94e:d84e:d4d0 with SMTP id
 u23-20020a170906069700b0094ed84ed4d0mr4010073ejb.18.1682137353377; Fri, 21
 Apr 2023 21:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230421084052.2675963-1-kubiznak@2n.com> <CA+aJhH16TxvXisfH=E4LMQJz3UzcqVdAcDpFCVxEZUe5HoKhAg@mail.gmail.com>
 <DB4PR02MB10030A06B7DBE76E6892847EBE2609@DB4PR02MB10030.eurprd02.prod.outlook.com>
 <DB4PR02MB10030AB1EDBA33EA8FC8E82DCE2609@DB4PR02MB10030.eurprd02.prod.outlook.com>
In-Reply-To: <DB4PR02MB10030AB1EDBA33EA8FC8E82DCE2609@DB4PR02MB10030.eurprd02.prod.outlook.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Sat, 22 Apr 2023 14:22:22 +1000
Message-ID: <CA+aJhH0VRr6s9whH12xHLDUNe0LNcfXKhEvQs_SD-d10d939QQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of dts
 files to build
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6FrIC0gMk4=?= <Kubiznak@2n.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 04:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180300

On Fri, 21 Apr 2023 at 22:47, Petr Kubiz=C5=88=C3=A1k - 2N <Kubiznak@2n.com=
> wrote:
>
> > kernel-devicetree.bbclass does the same translation dtb->dts
>
> I mean dts->dtb, of course. The point is dtb's are expected on the input.
>
> Petr
>
> ________________________________________
> From: Petr Kubiz=C5=88=C3=A1k - 2N <Kubiznak@2n.com>
> Sent: Friday, April 21, 2023 2:30 PM
> To: Nathan Rossi
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of d=
ts files to build
>
> Hi Nathan,
>
> Thank you for great suggestions. All of them are valid and I will update =
the patch once we discuss the .dtb -> .dts mapping.
>
> > I am also curious why you need to handle this mapping of .dtb -> .dts.
> > Do you have an example recipe that is using this class in this way?
> > Because the ".dtb" in KERNEL_DEVICETREE is specifically because the
> > KERNEL_DEVICETREE variable is pointing at kernel makefile targets.
>
> I don't have an example of a particular recipe, but how about EXTERNAL_KE=
RNEL_DEVICETREE variable, used in kernel-fitimage.bbclass? Albeit I don't u=
se this variable in my recipes, I believe it could be used for both classes=
 now with simple assignment DT_FILES =3D EXTERNAL_KERNEL_DEVICETREE.
>
> And if for whatever reason someone uses a custom variable (like me), they=
 would still expect dtb's rather than dts's. I didn't find any example of u=
sing lists of dts files. Contrary, kernel-devicetree.bbclass does the same =
translation dtb->dts and it even warns about dts being provided (see normal=
ize_dtb()). I didn't want to be that strict here (if someone has a list of =
dts files, while not to use it directly) but in general, I expect a list of=
 dtb files will be much more common.

So just trying to make the DT_FILES somewhat consistent with the
KERNEL_DEVICETREE, seems fine. I was only curious in case you had some
special path handling that might be better solved by overriding the
devicetree_do_compile and calling the associated compile functions
directly.

The v3 patch looks good :).

Thanks,
Nathan


>
> Kind Regards,
> Petr
>
> ________________________________________
> From: Nathan Rossi <nathan@nathanrossi.com>
> Sent: Friday, April 21, 2023 1:44 PM
> To: Petr Kubiz=C5=88=C3=A1k - 2N
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of d=
ts files to build
>
> On Fri, 21 Apr 2023 at 18:41, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> w=
rote:
> >
> > Add DT_FILES variable to allow the user of the class to select specific
> > dts files to build. This is useful for packages featuring dts files
> > for multiple machines.
> >
> > Since many machine configs contain a list of dtb files
> > (e.g. KERNEL_DEVICETREE), DT_FILES works with both dts and dtb files.
> >
> > Signed-off-by: Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com>
> > ---
> >  meta/classes-recipe/devicetree.bbclass | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-reci=
pe/devicetree.bbclass
> > index ed2a92e447..8f348f1370 100644
> > --- a/meta/classes-recipe/devicetree.bbclass
> > +++ b/meta/classes-recipe/devicetree.bbclass
> > @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D " \
> >
> >  DT_INCLUDE[doc] =3D "Search paths to be made available to both the dev=
ice tree compiler and preprocessor for inclusion."
> >  DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> > -DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to s=
elect dts files that are not in source (e.g. generated)."
> > +DT_FILES_PATH[doc] =3D "Path to the directory containing dts files to =
build. Defaults to source directory."
> >  DT_FILES_PATH ?=3D "${S}"
> > +DT_FILES[doc] =3D "Space-separated list of dts or dtb files to build. =
If empty, all dts files are built."
>
> Worth noting in the doc string that DT_FILES paths are relative to
> DT_FILES_PATH.
>
> > +DT_FILES ?=3D ""
> >
> >  DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, use=
d as extra space typically for additional properties during boot."
> >  DT_PADDING_SIZE ??=3D "0x3000"
> > @@ -125,7 +127,10 @@ def devicetree_compile(dtspath, includes, d):
> >      subprocess.run(dtcargs, check =3D True, stdout=3Dsubprocess.PIPE, =
stderr=3Dsubprocess.STDOUT)
> >
> >  python devicetree_do_compile() {
> > +    import re
> >      includes =3D expand_includes("DT_INCLUDE", d)
> > +    dtfiles =3D d.getVar("DT_FILES")
>
> If this populates the variable dtfiles with DT_FILES already split it
> can fall back to os.listdir if empty, this avoids the need for the "if
> filter..." logic within the loop:
>
> dtfiles =3D d.getVar("DT_FILES").split()
> dtfiles =3D [<renaming for dtb> for dtfiles in dtfiles]
> for dts in dtfiles or os.listdir(listpath):
>
> > +    filter =3D [ re.sub("dtbo?", "dts", dtfile) for dtfile in dtfiles.=
split() ]
>
> This regex is a bit problematic, it will substitute any part of the
> filename and not just the extension suffix. E.g. "test-dtbo.dts" ->
> "test-dts.dts". The expression might need to be something similar to
> "\.dtbo?$".
>
> I am also curious why you need to handle this mapping of .dtb -> .dts.
> Do you have an example recipe that is using this class in this way?
> Because the ".dtb" in KERNEL_DEVICETREE is specifically because the
> KERNEL_DEVICETREE variable is pointing at kernel makefile targets.
>
> Regards,
> Nathan
>
> >      listpath =3D d.getVar("DT_FILES_PATH")
> >      for dts in os.listdir(listpath):
> >          dtspath =3D os.path.join(listpath, dts)
> > @@ -134,6 +139,9 @@ python devicetree_do_compile() {
> >                  continue # skip non-.dts files and non-overlay files
> >          except:
> >              continue # skip if can't determine if overlay
> > +        if filter:
> > +            if not(dts in filter):
> > +                continue # skip if dts not in defined filter
> >          devicetree_compile(dtspath, includes, d)
> >  }
> >
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180281): https://lists.openembedded.org/g/openembed=
ded-core/message/180281
> > Mute This Topic: https://lists.openembedded.org/mt/98406619/3616963
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
nathan@nathanrossi.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

