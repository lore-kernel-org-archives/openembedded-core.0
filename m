Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA72C001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 20:26:11 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.2885.1690835164381419671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 13:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=L+z/fYcG;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9db1de50cso34713741fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 13:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690835162; x=1691439962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia6KxlLCQ9nNc2QIuMt45QHfXNtNKpObdTQPhCcEBtQ=;
        b=L+z/fYcGIAL4t5LHihUasVZ1txjVTpf/dAJhW6+ls84lBIc8v/aKAwQIZ+FNnZsNJy
         xs05MRMywH/xN9M5xtb1AM2GcF37R++CojYsyvQYLR/+ip1ndbFUw/sbEp0FrNbrPvZX
         fd7l8I63eIIrpjmXR6bWVqVuYzUi19k6WuuY5Cu/NW6hIzmvTQtR5Rei8GLn1pVKzOn7
         TExh2YjScTiyGh8ZkWmSqLngbXf1AWBZtGSYsw3iVEr8jHefaeJ4hM/1xupqdWgYChEG
         bgRm4qVZb1IU/9pUBjtZRoleQJsDH1hflhTles8fDvR51WGWMbyFik5OY5Ac23+dFV1N
         5v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690835162; x=1691439962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ia6KxlLCQ9nNc2QIuMt45QHfXNtNKpObdTQPhCcEBtQ=;
        b=c53bHR1Be4uvQgMX8LRSXKQ3Y8/7j+RZS9/1ShnCSiQvvY5Tuu4eug6KQhlSAAB0ZI
         iy180mPj7FgkWOzdN/BjmvNGQBapvO1qjyIBYLrqqnvcB+95xO4Er71tedp2zo6a1NaK
         Mw30YBcd17yzSAiCy+8QQKWbpOhsXIRpJpN5eIBsTXeAmi1fobEwC1E3TxZld2K5FvxW
         Bw8AAetgu4i6rLZaVig1IAw/GykYASTBkqtB7Y0/qubxulGlVYj9TKBzgk+aoPTsZ8tu
         ojcMC2soANnhP8Je21UuD9T0YIvpVhJ6iNeD51UIhVfNJ7JWC0pDbWFG/CipeOfwlN+e
         S60A==
X-Gm-Message-State: ABy/qLajzIe2kBZa2+JysoZQU5VwyNUhK8doaBRrYUZ6EUpZ9g7oR5B8
	yK4NyP3WtiGJrE9eRu/GyZow0tsFYcJQ3xo8M1VZSrHg
X-Google-Smtp-Source: APBJJlGYu541q6JjHPL99wRorkj7qliQLmnegal9mBi1zUa4rm+sLK3cCs6KT0K2/PsdGo6pbSzaQ0XVVodD5B2Cydc=
X-Received: by 2002:a2e:8396:0:b0:2b9:f0c0:5985 with SMTP id
 x22-20020a2e8396000000b002b9f0c05985mr608827ljg.53.1690835162120; Mon, 31 Jul
 2023 13:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230727141809d2150cbd@mail.local> <17762A3A069807A3.31298@lists.openembedded.org>
 <VI1PR04MB537349F74CD4C3E13B272B879105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <VI1PR04MB5373AB9F0C887CF659E739439105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5373AB9F0C887CF659E739439105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 31 Jul 2023 14:25:50 -0600
Message-ID: <CAJdd5GYifrOT_9-fct6TT95sw6tDe0L7etLxOcaEgTTGvWFPJg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alex Stewart <alex.stewart@ni.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 20:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185168

On Mon, Jul 31, 2023 at 1:10=E2=80=AFPM Piotr =C5=81obacz <p.lobacz@welotec=
.com> wrote:
>
> I=E2=80=99m sorry for splitting this message but it has happend by accide=
nt=E2=80=A6
>
> Returning to the topic my assumption is that for some reason in reproduci=
bleA, these miliseconds are cutted and in case of reproducibleB they are no=
t.
>
> This was obviously working for opkg-build in case of gnu format which is =
cutting it also but for posix format it stores and thus error occurs.
>
> My question is where can I find the code responsible for moving/coping da=
ta into these packages-split directories?

I suspect this is because reproducibleA is allowed to restore from
sstate where the milliseconds are not preserved, while reproducibleB
doesn't restore from sstate.

I'm not sure how you would store the milliseconds in sstate and make
sure it was consistent, but that is probably where you need to look.
Start in sstate.bbclass

>
> BR
> Piotr
> ________________________________
> Od: Piotr =C5=81obacz <p.lobacz@welotec.com>
> Wys=C5=82ano: poniedzia=C5=82ek, lipca 31, 2023 9:03 PM
> Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; Alex Stewart <alex.stewart@ni.com>
> Temat: Re: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add=
 support for ACLs and xattr
>
> OK, I have finally discovered the root cause. First of all there is anoth=
er bug in yocto, for all these 19 packages.
>
> I have compared the full timestamps with 'ls =E2=80=94full-time=E2=80=99 =
command in both directories (meaning reproducibleA and reproducibleB) of pa=
ckages-split/acpid-src and they differ even just before packages creation=
=E2=80=A6
>
> Wysy=C5=82ane z aplikacji Outlook dla systemu iOS
> ________________________________
> Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> w imieniu u=C5=BCytkownika Piotr =C5=81obacz via lists.opene=
mbedded.org <p.lobacz=3Dwelotec.com@lists.openembedded.org>
> Wys=C5=82ane: Saturday, July 29, 2023 12:58:51 AM
> Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; Alex Stewart <alex.stewart@ni.com>
> Temat: ODP: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclas=
s: add support for ACLs and xattr
>
> Hello again,
> Funny thing, I have run the same revision as you in here https://autobuil=
der.yoctoproject.org/typhoon/#/builders/117/builds/3263
> and I have different failures, but I have them:
>
>
> File "/media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/me=
ta/lib/oeqa/selftest/cases/reproducible.py", line 327, in test_reproducible=
_builds
>     self.fail('\n'.join(fails))
> AssertionError: The following ipk packages are different and not in exclu=
sion list:
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/acpid-src_2.0.34-r0_core2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/avahi-src_0.8-r0_core2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/bind-src_9.18.16-r0_core2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/debugedit-src_5.0-r0_core2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/flac-src_1.4.3-r0_core2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/libjson-glib-1.0-dev_1.6.6-r0_core=
2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/libjson-glib-1.0-ptest_1.6.6-r0_co=
re2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/libjson-glib-1.0-src_1.6.6-r0_core=
2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/libmnl-src_1.0.5-r0_core2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/libuuid-src_2.38.1-r0_core2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/log4cplus-src_2.1.0-r0_core2-64.ip=
k
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/lttng-tools-src_2.13.9-r0_core2-64=
.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/python3-numpy-src_1.25.1-r0_core2-=
64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/python3-pygobject-dev_3.44.1-r0_co=
re2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/python3-pygobject-src_3.44.1-r0_co=
re2-64.ipk
> /media/plobacz/9582beb9-8774-4d4d-976f-63a6f1c87c13/poky-contrib/build-st=
/reproducibleB/tmp/deploy/ipk/./core2-64/python3-pygobject_3.44.1-r0_core2-=
64.ipk
>
> 2023-07-29 00:18:31,843 - oe-selftest - INFO - --------------------------=
--------------------------------------------
> 2023-07-29 00:18:31,843 - oe-selftest - INFO - Ran 2 tests in 51978.070s
> 2023-07-29 00:18:31,843 - oe-selftest - INFO - FAILED
> 2023-07-29 00:18:31,843 - oe-selftest - INFO -  (failures=3D1)
> 2023-07-29 00:18:35,545 - oe-selftest - INFO - RESULTS:
> 2023-07-29 00:18:35,546 - oe-selftest - INFO - RESULTS - reproducible.Dif=
foscopeTests.test_diffoscope: PASSED (35.32s)
> 2023-07-29 00:18:35,546 - oe-selftest - INFO - RESULTS - reproducible.Rep=
roducibleTests.test_reproducible_builds: FAILED (51940.60s)
> 2023-07-29 00:18:35,948 - oe-selftest - INFO - SUMMARY:
> 2023-07-29 00:18:35,949 - oe-selftest - INFO - oe-selftest () - Ran 2 tes=
ts in 51978.070s
> 2023-07-29 00:18:35,949 - oe-selftest - INFO - oe-selftest - FAIL - Requi=
red tests failed (successes=3D1, skipped=3D0, failures=3D1, errors=3D0)
>
> due to this tests result difference, my suspicion at the moment is only t=
he possibility of changing the format between gnu and posix depending on DI=
STRO_FEATURES having acl and/or xattr.
>
> I will force now tar format to have only posix format and run another tes=
t. We will be in touch.
>
> BR
> Piotr
>
> ________________________________
> Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Wys=C5=82ane: czwartek, 27 lipca 2023 16:18
> Do: Piotr =C5=81obacz <p.lobacz@welotec.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; Alex Stewart <alex.stewart@ni.com>
> Temat: Re: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass=
: add support for ACLs and xattr
>
> Hello,
>
> I sent this to the autobuilders and I got the same reproducibility
> failure as earlier:
>
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautob=
uilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F117%2Fbuilds%2F3263%2F=
steps%2F13%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C8fb759c=
0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382=
60643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DC6mYlLwOmYosyl1ZIS8v=
KQf2ailFqMqBXeamF%2FnSE7E%3D&reserved=3D0
>
> I'm not sure why you wouldn't see those.
>
> On 26/07/2023 09:27:53+0000, Piotr =C5=81obacz wrote:
> >
> > Hi Alexandre, Alex,
> > Thx for supporting me, I have finally discovered the issue regarding th=
is packages differences.
> > It occurred that I was badly comparing two strings for tarformat compar=
ison. Now it is fixed and should finally work.
> >
> > This has been additionally tested with oe-selftest -r reproducible.
> >
> > BR
> > Piotr
> >
> > Od: Piotr =C5=81obacz <p.lobacz@welotec.com>
> > Wys=C5=82ane: =C5=9Broda, 26 lipca 2023 11:22
> > Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org>
> > DW: Piotr =C5=81obacz <p.lobacz@welotec.com>
> > Temat: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add s=
upport for ACLs and xattr
> >
> > Extend OPKGBUILDCMD variable, with additional parameters, depending
> > on target distro features, in order to support ACLs and xattr.
> >
> > With fix pushed to the opkg-devel:
> > https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgro=
ups.google.com%2Fg%2Fopkg-devel%2Fc%2FdYNHrLjDwg8&data=3D05%7C01%7Cp.lobacz=
%40welotec.com%7C8fb759c0e1ab49b0c69408db8eac5547%7C25111a7f1d5a4c51a4ca7f8=
e44011b39%7C0%7C0%7C638260643038719160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat=
a=3DaZziODWaDuhvajNYsPmX47BT2z2CLK8NpgFeF80X1Jg%3D&reserved=3D0
> > opkg-build is able to create tar archives with ACLs and xattr.
> >
> > Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> > ---
> >  meta/classes-global/package_ipk.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-glo=
bal/package_ipk.bbclass
> > index b4b7bc9ac2..a0f106e4ad 100644
> > --- a/meta/classes-global/package_ipk.bbclass
> > +++ b/meta/classes-global/package_ipk.bbclass
> > @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.c=
onf"
> >  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
> >
> >  # Program to be used to build opkg packages
> > -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> > +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.c=
ontains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTR=
O_FEATURES', 'xattr', '-X', '', d)}'
> >
> >  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
> >  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMM=
ENDATIONS") =3D=3D "1"]}"
> > --
> > 2.34.1
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C8fb759c0e1ab49b0c69408d=
b8eac5547%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638260643038719160%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DQdR%2FSw2mI6zSaDoLdARAe4Q9CTcPPR5Jaz=
o1mllODi4%3D&reserved=3D0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185163): https://lists.openembedded.org/g/openembedde=
d-core/message/185163
> Mute This Topic: https://lists.openembedded.org/mt/100468421/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

