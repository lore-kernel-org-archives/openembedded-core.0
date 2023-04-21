Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220D1C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 12:30:42 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.10225.1682080233162407218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 05:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfCoA/w9ml0B7tNTvV+zT6pIpaNg2/EWOMGgTZKISrykLFsuodNQyGD2Fd50ULBwXPkwh/J+Q32esPVZ4Elrd1OjJctwvN4TbKWorBOwA3gHnVdzynEcu1HBpQ9RlUpANc1hRUnMrVwVEN/hhk3GrLpe2JVHD8mXOshbzAsLh4wV4psw4gZPfURaI88eEes5TDvwuq8bhaisXUfcGGBRZVuY5t0WPhI4Qa08ioPOjJ/QVvFonV4w5cYHI7y/UApVn8jldYtrjuduHGOcIdh++wZasSYNQMln7pDem/lbA+nonzNl6+QeomlAP+q7Zd1Aa8gCUZS4Kkp8e3HgA6aAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpnnluTEKUjEBrtc5a755fYg8s5HTaXCuzYPbrntd4o=;
 b=VF5/s0XZkNNgbKBP6VQl41xk+X5JpsMvXC3RxONEwYhEwMKWVehbCcmdurHnsBuiOG+FflkhWe/FOV0DLl23srPupFZAWoX44byhPW19hbtl09IH4hEXDT/zFJEutYtAshcuNjNDy+/ikhd+JUlY4MV6/xK+g8Eunap/x9AlJlvYCW3KA9XbOc5J9fs32PQsPB1eRCa6ky9Z281NK7/c7d428b1OCsXBpKQo6WNkfUMc/U7DfFA6nYIjPB66/lKguOxxaHGg6h25R0th4LEjgNc2Wl17JkN+iQxxZwof0pd7+H/kgXRK2hN0fLczq4fzxxGs9QzRFkcgZSXVmiLE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpnnluTEKUjEBrtc5a755fYg8s5HTaXCuzYPbrntd4o=;
 b=XN8zSO305hs/kTulhZ2AFdBS/C1zfB6QO6VV/gtnvyJeboE+tVKCiZz8ilLztwn5UgclpJx6LttgmC88O4Ft2b0oT1UG+p2eq2B8dphSuvQOquKuftiWR6XtxKTkoAiKofjYdUtVvUmInGX50tNHsj0oezEkLKM8gBcqPCuaEQU=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: Nathan Rossi <nathan@nathanrossi.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of dts
 files to build
Thread-Topic: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of dts
 files to build
Thread-Index: AQHZdC0REvWm4ySVhUO4rhmfRk4UCq81pMeAgAAIOuo=
Date: Fri, 21 Apr 2023 12:30:28 +0000
Message-ID: <DB4PR02MB10030A06B7DBE76E6892847EBE2609@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230421084052.2675963-1-kubiznak@2n.com>
 <CA+aJhH16TxvXisfH=E4LMQJz3UzcqVdAcDpFCVxEZUe5HoKhAg@mail.gmail.com>
In-Reply-To: <CA+aJhH16TxvXisfH=E4LMQJz3UzcqVdAcDpFCVxEZUe5HoKhAg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|PAXPR02MB7325:EE_
x-ms-office365-filtering-correlation-id: e2578fa5-0284-4fae-3b91-08db426430a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WGP1kCkHITJeMQE84LPdsaeh0KRp343mGi1agCu65jNTm+0/Grj/e1aL4uvB8kP4cspyrTTxa4pkB+SXKgibZu7XeWLxDGfgJp5IGc1U1vm0QsYPYncqpSez3yNJpZEmphQwfYive9603nj3bjSZuK/9BX/RzAxNj1aHpR6AdLDb1aLNLFzJVVoGfIMYDR/7r7mkHZPaKy4VC7+NsJqEL5QTxnjNZ0Tr3k6KnlgNS7Kq01iiFs2Q0sRQdMsCs0abGRPkdo3W3pnaABCWwegOpRE8uaWi4i7xZHWEX+sGKTcIuZgMrUCi5G2quaXQdTzo0wXDJz6A01Sx9NRDuFFkizhrMzRNYLKUTHvwQGBPNUchtuCT294uGnnIOg9VGRnqTZcRFNoivRAAyUITvtp/PhnpxzXD/e18/+VG7lke4C1VYgm0PqijvksYsZkljCI+XYgYcwhxMyE0WI2FOQzPUj6qa+lxqaRcORno5iim3KLyLVk/ONodAHjJjfMhDcOad9n7Gx2WjAN2hTy5NqVL8a5YueZKmiYODHzG8putfnyoJ0QwiT8duRFS4IWvzNnvXnlEHHY/hcqu2q5jLqLAOn8H8Z3U+DV8kUY4b9AHrzU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199021)(478600001)(83380400001)(7696005)(55016003)(26005)(9686003)(6506007)(966005)(71200400001)(76116006)(91956017)(64756008)(66946007)(316002)(122000001)(53546011)(6916009)(66476007)(66446008)(66556008)(4326008)(186003)(5660300002)(52536014)(41300700001)(38070700005)(38100700002)(66899021)(8676002)(2906002)(8936002)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?m8Wbp2yCUBULXe0lDwTOtGj08IVhXAn2Jlkaxp/kR9yoH90nxwpPYgsemW?=
 =?iso-8859-2?Q?vWthgspxxw60qb7c3Z9I6MZu7rR7sKkZ3tKQ4XgvEwLAtLpKQ3hz6DLd3P?=
 =?iso-8859-2?Q?fOnvc74Bcy7ZwqwnZ22QHTsBZd7MtMs10TmwgNSlQGiBj6Pu8Uf+6tivfZ?=
 =?iso-8859-2?Q?xJsQdrMahqo6FBRgLfm/0SmOQcR2/pWq4nHsNPuhDZnAEYpFa93GWxQ07r?=
 =?iso-8859-2?Q?Dyiip1CXTCdIiK50wyQq1yJIFMgxLcZJuuPBiLRzZbvj2BNRbkjP/gs8cA?=
 =?iso-8859-2?Q?fPjqs45cV6VnGDkqWn8I1kSJRGp2yY+8M6TIXMnCo2Yw0185fdK9Sx2bxK?=
 =?iso-8859-2?Q?MeJeH/LgYBJenovsO7K6740B1DdV3ZF1YBTNnljjv1Wkgx1b7zRC7+8TZC?=
 =?iso-8859-2?Q?DuJASn6SzxS//c+pNhx8ylHbX8DiCWZFx3LwYvVp8lGIZvyv+NHB91aSF8?=
 =?iso-8859-2?Q?CZfjAiAfDgfJRwOVR0ixExdQtrTMhrhOg3lAqCa0Z1LkhWAJMKbWIyZReK?=
 =?iso-8859-2?Q?cGf+B0X9gEYtPEKFdfFrZilarHiKY+gTzjjJMvC9ZQDEJtXFpVWTyulRd5?=
 =?iso-8859-2?Q?dnvq6Y6HelxW7Y4Ak35emyAL6g/pejQVWNdvK6op/+pBNlU88sONNBFJs3?=
 =?iso-8859-2?Q?bJZ8iD2qZ46Vx+i6nRcOz4Du+FsZtwMm+M8g0rtUI+9Wvpg5sDAc3SNI6a?=
 =?iso-8859-2?Q?xxeSrNFDKmsLtZucJFENTRcrBpJEtMvpFmnCZJPIKQaizaWySF1uPO9NLY?=
 =?iso-8859-2?Q?RhChVpNmpveMJMs6A7phYPUamyifmAp+QnkEnUyeGwZkIjLOitBME5oVRp?=
 =?iso-8859-2?Q?eevgi/WN0mcKahy1vF4UzYEWDQn13/JXdaBB9stFFtcEnP3vCrbI5EdwBi?=
 =?iso-8859-2?Q?9AFDik85+xF8iJINY1pxdW5ZwUtGzzmgItCW0uHVOQcWJTmNm6oDo/oJ7z?=
 =?iso-8859-2?Q?d8MhqrnYa0rZWRyK+iqny8gVtNK8DN+OoUA6aCgTUhwzgftTE2DPoDuIZi?=
 =?iso-8859-2?Q?eZOqfZ9HQ7TEeeSqNEBy1snMhKa2D8Lk+B+F19663ggGUevRxehO7+4kXL?=
 =?iso-8859-2?Q?IZ1nfUux5gO/UWyoMwKufG3mTgZTpkXSSOuInHIij/IXhebs/fppRiVon+?=
 =?iso-8859-2?Q?bEv8hcb2LDNmHWbH98oHhtKI4zDDKY4Lsyzai5RtvJHAZtp78qFpfLKZ6t?=
 =?iso-8859-2?Q?gxvByWRVeNfOL0nXrIuJhe4GOQqKOeK+iJExGCVZzaB5SscEu1wSewUzsx?=
 =?iso-8859-2?Q?xiAwdCcZ/zQXNGuJpIMatX4EU1aYpgqQJamW66Zect4xYz6RFa1ZprU1R3?=
 =?iso-8859-2?Q?xo1A8n/Zh7b93aTIqUWMmbmDPPpG0Tzjg9lf1AM6xpkCPniTqBLBK8MvQI?=
 =?iso-8859-2?Q?pQy8Pk8y5moanS5Ok0jpzffax4RSWAALTSqR906zlxmz3ITi9Oh2vZpjxR?=
 =?iso-8859-2?Q?LIjv56XKYc4lpWvFlW6U+rXy1s1RHfuuFkePI6KQQqxrienU7d0/yLqK7B?=
 =?iso-8859-2?Q?xPR5KrvNROvs9XKzvBsAblVPnXRUo1utZMKxvScyFn++tHYMDsy2/4q1vz?=
 =?iso-8859-2?Q?PLCd0+yq+X9D597nRSqvnNWr3XgnNcTdoph79znfrspBqc6NY2QSqeqvyz?=
 =?iso-8859-2?Q?1pGi6qYRWEq9A=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2578fa5-0284-4fae-3b91-08db426430a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 12:30:28.3343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XnTMIqAerr1fHsGGyG+RCWPN++ES/9Y7v2+OX1vqIPnt6zMCSr01IB1Aa7ohhC9u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7325
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 12:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180284

Hi Nathan,=0A=
=0A=
Thank you for great suggestions. All of them are valid and I will update th=
e patch once we discuss the .dtb -> .dts mapping.=0A=
=0A=
> I am also curious why you need to handle this mapping of .dtb -> .dts.=0A=
> Do you have an example recipe that is using this class in this way?=0A=
> Because the ".dtb" in KERNEL_DEVICETREE is specifically because the=0A=
> KERNEL_DEVICETREE variable is pointing at kernel makefile targets.=0A=
=0A=
I don't have an example of a particular recipe, but how about EXTERNAL_KERN=
EL_DEVICETREE variable, used in kernel-fitimage.bbclass? Albeit I don't use=
 this variable in my recipes, I believe it could be used for both classes n=
ow with simple assignment DT_FILES =3D EXTERNAL_KERNEL_DEVICETREE.=0A=
=0A=
And if for whatever reason someone uses a custom variable (like me), they w=
ould still expect dtb's rather than dts's. I didn't find any example of usi=
ng lists of dts files. Contrary, kernel-devicetree.bbclass does the same tr=
anslation dtb->dts and it even warns about dts being provided (see normaliz=
e_dtb()). I didn't want to be that strict here (if someone has a list of dt=
s files, while not to use it directly) but in general, I expect a list of d=
tb files will be much more common.=0A=
=0A=
Kind Regards,=0A=
Petr=0A=
=0A=
________________________________________=0A=
From: Nathan Rossi <nathan@nathanrossi.com>=0A=
Sent: Friday, April 21, 2023 1:44 PM=0A=
To: Petr Kubiz=F2=E1k - 2N=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core][PATCH v2] devicetree.bbclass: Allow selection of dts=
 files to build=0A=
=0A=
On Fri, 21 Apr 2023 at 18:41, Petr Kubiz=F2=E1k <kubiznak@2n.com> wrote:=0A=
>=0A=
> Add DT_FILES variable to allow the user of the class to select specific=
=0A=
> dts files to build. This is useful for packages featuring dts files=0A=
> for multiple machines.=0A=
>=0A=
> Since many machine configs contain a list of dtb files=0A=
> (e.g. KERNEL_DEVICETREE), DT_FILES works with both dts and dtb files.=0A=
>=0A=
> Signed-off-by: Petr Kubiz=F2=E1k <kubiznak@2n.com>=0A=
> ---=0A=
>  meta/classes-recipe/devicetree.bbclass | 10 +++++++++-=0A=
>  1 file changed, 9 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe=
/devicetree.bbclass=0A=
> index ed2a92e447..8f348f1370 100644=0A=
> --- a/meta/classes-recipe/devicetree.bbclass=0A=
> +++ b/meta/classes-recipe/devicetree.bbclass=0A=
> @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D " \=0A=
>=0A=
>  DT_INCLUDE[doc] =3D "Search paths to be made available to both the devic=
e tree compiler and preprocessor for inclusion."=0A=
>  DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"=0A=
> -DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to sel=
ect dts files that are not in source (e.g. generated)."=0A=
> +DT_FILES_PATH[doc] =3D "Path to the directory containing dts files to bu=
ild. Defaults to source directory."=0A=
>  DT_FILES_PATH ?=3D "${S}"=0A=
> +DT_FILES[doc] =3D "Space-separated list of dts or dtb files to build. If=
 empty, all dts files are built."=0A=
=0A=
Worth noting in the doc string that DT_FILES paths are relative to=0A=
DT_FILES_PATH.=0A=
=0A=
> +DT_FILES ?=3D ""=0A=
>=0A=
>  DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, used =
as extra space typically for additional properties during boot."=0A=
>  DT_PADDING_SIZE ??=3D "0x3000"=0A=
> @@ -125,7 +127,10 @@ def devicetree_compile(dtspath, includes, d):=0A=
>      subprocess.run(dtcargs, check =3D True, stdout=3Dsubprocess.PIPE, st=
derr=3Dsubprocess.STDOUT)=0A=
>=0A=
>  python devicetree_do_compile() {=0A=
> +    import re=0A=
>      includes =3D expand_includes("DT_INCLUDE", d)=0A=
> +    dtfiles =3D d.getVar("DT_FILES")=0A=
=0A=
If this populates the variable dtfiles with DT_FILES already split it=0A=
can fall back to os.listdir if empty, this avoids the need for the "if=0A=
filter..." logic within the loop:=0A=
=0A=
dtfiles =3D d.getVar("DT_FILES").split()=0A=
dtfiles =3D [<renaming for dtb> for dtfiles in dtfiles]=0A=
for dts in dtfiles or os.listdir(listpath):=0A=
=0A=
> +    filter =3D [ re.sub("dtbo?", "dts", dtfile) for dtfile in dtfiles.sp=
lit() ]=0A=
=0A=
This regex is a bit problematic, it will substitute any part of the=0A=
filename and not just the extension suffix. E.g. "test-dtbo.dts" ->=0A=
"test-dts.dts". The expression might need to be something similar to=0A=
"\.dtbo?$".=0A=
=0A=
I am also curious why you need to handle this mapping of .dtb -> .dts.=0A=
Do you have an example recipe that is using this class in this way?=0A=
Because the ".dtb" in KERNEL_DEVICETREE is specifically because the=0A=
KERNEL_DEVICETREE variable is pointing at kernel makefile targets.=0A=
=0A=
Regards,=0A=
Nathan=0A=
=0A=
>      listpath =3D d.getVar("DT_FILES_PATH")=0A=
>      for dts in os.listdir(listpath):=0A=
>          dtspath =3D os.path.join(listpath, dts)=0A=
> @@ -134,6 +139,9 @@ python devicetree_do_compile() {=0A=
>                  continue # skip non-.dts files and non-overlay files=0A=
>          except:=0A=
>              continue # skip if can't determine if overlay=0A=
> +        if filter:=0A=
> +            if not(dts in filter):=0A=
> +                continue # skip if dts not in defined filter=0A=
>          devicetree_compile(dtspath, includes, d)=0A=
>  }=0A=
>=0A=
> --=0A=
> 2.30.2=0A=
>=0A=
>=0A=
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
> Links: You receive all messages sent to this group.=0A=
> View/Reply Online (#180281): https://lists.openembedded.org/g/openembedde=
d-core/message/180281=0A=
> Mute This Topic: https://lists.openembedded.org/mt/98406619/3616963=0A=
> Group Owner: openembedded-core+owner@lists.openembedded.org=0A=
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [na=
than@nathanrossi.com]=0A=
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=0A=
>=0A=

