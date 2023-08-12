Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304C2C001B0
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 13:39:30 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.88])
 by mx.groups.io with SMTP id smtpd.web11.65121.1691847564755580747
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Aug 2023 06:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=ekL5JGqS;
 spf=pass (domain: welotec.com, ip: 40.107.15.88, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVG1EYB7SGoZUFuc/7MwBwPvzk5l7+pi7dZ0/J5VW+MU6vXVECnvEtlIlilLYitSaTgP4r3K1yqO0KJfWfADZ9Opb/WAVX+NU0J9g/josLOnIagKiSbE4Oi8FPXFhk7biwRrn8UtX5gjUXmDIfaWjEp7nfQV41+Rmlnjd+nxHTMUwN306koE9Isd2XwRngMKf8PVMECfQWDtMq/+IAwN2bU5ZUfQnGjEVXVAiuuQzaBA0KacO5NT6RJqqcBZVH1OQSBbstR0vxlZGuouUdjP6ezASIXHggr6Tj7wM6LTbDyaM+3c2s+nsdXMvr4gLOezpAkRmCDl7JHXEP3OpNpUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umC79cbDWg62d0DEsLLRDHFmbr1zN3WRHF56YnlA9y8=;
 b=T0q40yHkxup3Uh7T2c/cdjelgviH1Hv8irwdmZ5Q4MgaAtWrXuIbYfFz3f/zGKJsv8BgZCxcGVgnzAOfH5zknA2YozdvqqJJADNsDpXBvJnAQQfE7Y7ehAe6CWIKBpf6uAyO6ikYzx5ubN7yUT/9kiP1xVOMODTNFlJltZSoRH7FuwEJROJs8cuvP7okMStO9DoDqXUgqid7fVxz9/dvu2LNxalQjHbIY6wGzSNBGFH5rn+VbVz9TnIVsLaWZlMTjBvVsI6EcmovM/ksAFeByaIHVprhsqrduXE8dZQN5SQ27yklLGdj5283kYDKBqBYypI9RGSM+hXWTas1XmX/0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umC79cbDWg62d0DEsLLRDHFmbr1zN3WRHF56YnlA9y8=;
 b=ekL5JGqSljE66d3JDgY6wXNBqGj27uKa8oCsBSugsNaYGXvU74/WXdyfSW5Qd5YVhX/8rHE3/a9vWYdvVAzz8iKt28EVRV4CAOFVJbwMS2RUcpoCtVG+UavlGSVD+RCVv22yxLmR8mWvMyIjGin5+s5J+GR1cNohDXeysMB1rIHAyI5Lzp7kTH6BU0xj2tY0/gxmqQiQXGnxSWDAanYgL58Y8iA6DCzQDHNpPJTEnZyrCFhdhQx5wtNy1n3eZFlkRZYqGgGKkPsbn4TlfQozg4A9Jmu/eHOU/ZfJEfFwkR4LaVZ+yN9lPec9TXh97P7+smApYkroGWD7Up2ZlrAl0A==
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by VI1PR04MB7103.eurprd04.prod.outlook.com (2603:10a6:800:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.23; Sat, 12 Aug
 2023 13:39:20 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6652.029; Sat, 12 Aug 2023
 13:39:19 +0000
From: =?iso-8859-2?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v12 1/7] path.py: add support for ACLs and all
 additional attributes
Thread-Topic: [OE-Core][PATCH v12 1/7] path.py: add support for ACLs and all
 additional attributes
Thread-Index: AQHZxq/4yomck7DpJEm9qpMHFkJ0e6/mrYQAgAAFCm8=
Date: Sat, 12 Aug 2023 13:39:19 +0000
Message-ID: 
 <VI1PR04MB5373895614372C6A9CDFF9569111A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
 <202308121303547b05aa57@mail.local>
In-Reply-To: <202308121303547b05aa57@mail.local>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|VI1PR04MB7103:EE_
x-ms-office365-filtering-correlation-id: cf14410a-86e2-46b9-8363-08db9b3987b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Edt8wNWzGRON5o5BwDoZJKKj8wG57nF7+P87/w8yXHgYX60hAKwlWw/dpsZBlAO1CWPAg9fWVVKg1wyOboQ74klWi/qqcd6P/RYoZVrUWL+kTVp+Ad6ezSiMmwhSDEbj2kK6ItwblMoKlXC71OeR6mzBJKHcyOYLmHGXJy4IPvH/ebRuC9opvT1nZeQwOdmBpTZpt2p7OdsHSN/QSoHlPvcea/pBrEcxye0g/1DmkOF1vJu+XjuhmnWNCUE4tO21NFaxj/0fD++eFaRzCCq2dAlPnA2dx4wicc1hlVgfGc8WJs1dI9nENqu/BGD0gzSzTAJTNzPywpRd8aesx3J3JmRrQAp5W+LSV4oQciTe9OKzcAP9LQ3vFwPOkudXokEM0Yw6o26huWRFl3cqBeE6JVN6cI3x2xRmNBazYQRNSm6AMCr2rGDgrzn8Ee4rhgZ15NufS93jn0aiOlVBzHqnDLCURo2LqLu4Aa6AmAe6rXZmR7MWQKOdiKeNcUtWf8vp+lDkr9bvNN87RBqL1LZ3pTBj7FOyBvLmLuFSn8CBCfoPT/H5dkztls1sdTg0fdaWZETDFB4FMg4ZPzqAsUedCwtKFhqoGmYfY8SwlLK/dg4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(366004)(39830400003)(376002)(186006)(1800799006)(451199021)(4326008)(8676002)(8936002)(9686003)(33656002)(966005)(478600001)(7696005)(6506007)(64756008)(76116006)(66446008)(66476007)(66946007)(66556008)(71200400001)(316002)(6916009)(41300700001)(86362001)(52536014)(5660300002)(26005)(45080400002)(66899021)(122000001)(2906002)(83380400001)(66574015)(38070700005)(38100700002)(166002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-2?Q?rZZ7+Ngeg2qgEGved3rViuFU5HuJ6U42LHzee3SPwrMHA/0/WNfJOkxnkA?=
 =?iso-8859-2?Q?iO2zxd7V0faAotyBxLKVJc1C0MuEZk6Zwbxel4bgwy6XzqLlvYvoOIbgv0?=
 =?iso-8859-2?Q?khstbrZ8JOrMuw5hsxVF7QViyaowCSBzJ8pZh519apaSvWWjuAK5oad3yn?=
 =?iso-8859-2?Q?cq+bxUprs4bMvzTcpfX1Wn9skz8gmozl8gREWCC5qOdXwRd/l9q31/z/Fy?=
 =?iso-8859-2?Q?iQo0r/IFLGIP7/MQ58H9JjIuvAcrupSbgPeCNqEqJ1/UyrynAJuyuZGVNk?=
 =?iso-8859-2?Q?Cjt/zZ3zRl0bMQg2bMvuCYNtqCjlsE7+smiN6LxzvkvpIrmfo48Mgi1kHH?=
 =?iso-8859-2?Q?K2PSiiVjHq7xlVLxpjTbSZ4H1nSo/OUwhitMX7cerX+BU9GzjC6l2/b1L6?=
 =?iso-8859-2?Q?7bgcmwh1D6x4UQKZhTRWtzVMV1qP1MwA6j2uj29JPgZeMxGf8XQkkkRIAn?=
 =?iso-8859-2?Q?Ut8vsdGlhrcQVI3TZUcpBUq5EOV2Kz81e5WkFAFDcYV6WILo7Yg6Lnpecw?=
 =?iso-8859-2?Q?iOYk1xjmnKRorw2U7KU+40sRzvLR75ZVwSeLW/QmidEz1uGMubNJVKHM46?=
 =?iso-8859-2?Q?3tXWOH9pJEKHEHzkBWCct+h6CPoJrvHW9ExCLkFZfpPaPdFsSVY0gGoN5z?=
 =?iso-8859-2?Q?w1IrjGBiYOIBOR8pSfyZ1JQmR4AW4A4LHy8ThGak32BC8VqSCWA3RfEiy7?=
 =?iso-8859-2?Q?dGGaqY1edIgs0p2I5KMLp1ZSXdgm0WU6NTYc71/E6xOaeioJYyJijpmwL9?=
 =?iso-8859-2?Q?+QgR8gvwTfkRdcxyVm3x335IxQefa0dgBPo1ZVNYj42ClrwJwM8oxgovYM?=
 =?iso-8859-2?Q?bKipltAF+R4qbNmk0k0lIdzFNn61Gpeo4y/UXFaedVHVM0GXzCznUoC0j5?=
 =?iso-8859-2?Q?zLcsOLx5d1l0gUB0o3HKIxG3pKmr1bdt3cJduktNlSaHa+JP7KT6uSknj+?=
 =?iso-8859-2?Q?JkxL8ARKCKxXCH/OQtC3W3/pa+0mniiaVnmLQ7Z6pQtpyWdvV6TXihAubE?=
 =?iso-8859-2?Q?fYFyLZPI/TqzxOqtTMErYnCXUc6618GRXXNgvsB/y6nB1pQu4xiG0U/xEi?=
 =?iso-8859-2?Q?UstB6epDLUelCrb1ZeCzHNhHc8k9S1KIJFYVee3EgYPny8B7nlUZDS40Eq?=
 =?iso-8859-2?Q?IOBGSn6U8UrQymb5oAInaM5RrdVlMzoDMhUk860IXSOZhyLNAn+jueKLEx?=
 =?iso-8859-2?Q?JwWSyqZqXYKTvdaSwqdArtjqyt7CY9c9vONSOidbAuloy+hlAX+eLQ0+VR?=
 =?iso-8859-2?Q?gZlfSyEMqeTgS7FLlsDGpJKWVZ6JG1Y8nyB17gw6WNwMbzoaXCxJnTivtT?=
 =?iso-8859-2?Q?F5ao3t7YrDRlyYCI+zLt6by0bSB7mqsEc45dAcuts0CzqE7EB8V3y2t3uu?=
 =?iso-8859-2?Q?CRa738NFJsuHITAttVZ2wFQdnXXM++Ouh8jtFxdWRDtAOTBn6IkvEo8bG0?=
 =?iso-8859-2?Q?VnjRWG/94m+hw5DiTaFyEgxN/dZS0dO0AK+mDhGdQ2XLAbnoPQkLhF5No3?=
 =?iso-8859-2?Q?SSqnALUCtyyVS+zrfqONbcu0Vjuu65+nfPQ5KTLol8ENYX6o4P5tGvJV+w?=
 =?iso-8859-2?Q?5bpq7Avc2ygHq9E7GeXIcFfv3bMd17DmRcvK8+NS0nXGm5xlYAQ6VFrIa2?=
 =?iso-8859-2?Q?3g4EGxYC7KPpvp/w7OgBr7ihkwISavKgRUVse7WMTqz7jbShZM3j+/nQ?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373895614372C6A9CDFF9569111AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf14410a-86e2-46b9-8363-08db9b3987b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2023 13:39:19.4805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JStx9UJQTxGiRwgOdDJUIslRHznpTq+oZrkctnx/1QGKsDILGo+ClhLBrpnWLxjOQ2D5Mf0jLuK7c6FURZdbfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 13:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185856

--_000_VI1PR04MB5373895614372C6A9CDFF9569111AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,
Again some stupid difference between gnu and posix...

Can you leave me this revision so i will test it?

BR
Piotr

Wysy=B3ane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
________________________________
Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
Wys=B3ane: Saturday, August 12, 2023 3:03:54 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH v12 1/7] path.py: add support for ACLs and all a=
dditional attributes

Hello,

This went through the autobuilder fine until yesterday:

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F117%2Fbuilds%2F3349%2Fst=
eps%2F12%2Flogs%2Fstdio&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Ce8f1fc340=
a14425d3ef208db9b3495e3%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638274=
422388079435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DN8x%2FfNthi1Uk30IwKIvq=
dnGFZBxl9VXJGvMBDdojWa8%3D&reserved=3D0<https://autobuilder.yoctoproject.or=
g/typhoon/#/builders/117/builds/3349/steps/12/logs/stdio>

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautobui=
lder.yocto.io%2Fpub%2Frepro-fail%2Foe-reproducible-20230811-vwiija9k%2Fpack=
ages%2Fdiff-html%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Ce8f1fc340a144=
25d3ef208db9b3495e3%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C6382744223=
88079435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D19uU%2FEieeXc6pztLj3zzxrF3=
eUgxCZgb0fjfqyiJe80%3D&reserved=3D0<https://autobuilder.yocto.io/pub/repro-=
fail/oe-reproducible-20230811-vwiija9k/packages/diff-html/>

On 04/08/2023 10:43:09+0200, Piotr =A3obacz wrote:
> Extend `tar` command inside copytree() and copyhardlinktree() functions,
> with additional parameters, in order to support ACLs and xattr. The posix
> format doesn't need to be set in here, as GNU tar switches to it whenewer
> is uses --acls and/or --xattrs parameters.
>
> Additionaly change preservation of additional attributes for `cp` command
> to all (meaning mode, ownership, timestamps etc.) not only xattrs, which
> were previously.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
>  meta/lib/oe/path.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> index 0dc8f172d5..56e8e214ac 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -92,7 +92,7 @@ def copytree(src, dst):
>      # This way we also preserve hardlinks between files in the tree.
>
>      bb.utils.mkdirhier(dst)
> -    cmd =3D "tar --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p . | t=
ar --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
> +    cmd =3D "tar --acls --xattrs --xattrs-include=3D'*' -cf - -S -C %s -=
p . | tar --acls --xattrs --xattrs-include=3D'*' -xf - -C %s" % (src, dst)
>      subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOU=
T)
>
>  def copyhardlinktree(src, dst):
> @@ -119,7 +119,7 @@ def copyhardlinktree(src, dst):
>      if (canhard):
>          # Need to copy directories only with tar first since cp will err=
or if two
>          # writers try and create a directory at the same time
> -        cmd =3D "cd %s; find . -type d -print | tar --xattrs --xattrs-in=
clude=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs =
--xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
> +        cmd =3D "cd %s; find . -type d -print | tar --acls --xattrs --xa=
ttrs-include=3D'*' -cf - -S -C %s -p --no-recursion --files-from - | tar --=
acls --xattrs --xattrs-include=3D'*' -xhf - -C %s" % (src, src, dst)
>          subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.S=
TDOUT)
>          source =3D ''
>          if os.path.isdir(src):
> @@ -130,7 +130,7 @@ def copyhardlinktree(src, dst):
>          else:
>              source =3D src
>              s_dir =3D os.getcwd()
> -        cmd =3D 'cp -afl --preserve=3Dxattr %s %s' % (source, os.path.re=
alpath(dst))
> +        cmd =3D 'cp -afl --preserve=3Dall %s %s' % (source, os.path.real=
path(dst))
>          subprocess.check_output(cmd, shell=3DTrue, cwd=3Ds_dir, stderr=
=3Dsubprocess.STDOUT)
>      else:
>          copytree(src, dst)
> --
> 2.34.1
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185512): https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F185512&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Ce8f1fc340a14425d3e=
f208db9b3495e3%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638274422388079=
435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dtz%2B%2FMtfHio%2Frn19by0T0So7lR=
RShaWRzndmqbpPuvwM%3D&reserved=3D0<https://lists.openembedded.org/g/openemb=
edded-core/message/185512>
> Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F100542715%2F3617179&data=3D05%7C0=
1%7Cp.lobacz%40welotec.com%7Ce8f1fc340a14425d3ef208db9b3495e3%7C25111a7f1d5=
a4c51a4ca7f8e44011b39%7C0%7C0%7C638274422388079435%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3D2cSMjyWWkd0B8neBuDBgRIJHPGHLSgXDpsllbMXKlng%3D&reserved=3D0=
<https://lists.openembedded.org/mt/100542715/3617179>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7Ce8f1fc340a14425d3ef208db9b3495e3%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638274422388079435%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&sdata=3DiGIqTNuFlHGWxfBg%2BoqwdeZnvun7tuJpAZ642M4Gt2k%3D&reserved=
=3D0<https://lists.openembedded.org/g/openembedded-core/unsub> [alexandre.b=
elloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Ce8f1fc340a14425d3ef208db9=
b3495e3%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638274422388079435%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DHkAEqLZj4x0KBFqFNI0N4Eq%2BiGVOdb6hVK93=
DW2Ev1U%3D&reserved=3D0<https://bootlin.com/>

--_000_VI1PR04MB5373895614372C6A9CDFF9569111AVI1PR04MB5373eurp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
</head>
<body>
<div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr" style=3D"">Hi Alexandre,</div>
<div dir=3D"ltr" style=3D"">Again some stupid difference between gnu and po=
six...</div>
<div dir=3D"ltr" style=3D""><br>
</div>
<div dir=3D"ltr" style=3D"">Can you leave me this revision so i will test i=
t?</div>
<div dir=3D"ltr" style=3D""><br>
</div>
<div dir=3D"ltr" style=3D"">BR</div>
<div dir=3D"ltr" style=3D"">Piotr</div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Wysy=B3ane z aplikacji <a href=3D"https://aka.ms/o0ukef">Outlook dla system=
u iOS</a></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Alexandre Belloni &lt;a=
lexandre.belloni@bootlin.com&gt;<br>
<b>Wys=B3ane:</b> Saturday, August 12, 2023 3:03:54 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH v12 1/7] path.py: add support for ACLs an=
d all additional attributes</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello,<br>
<br>
This went through the autobuilder fine until yesterday:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/buil=
ds/3349/steps/12/logs/stdio">https://eur04.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fautobuilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilde=
rs%2F117%2Fbuilds%2F3349%2Fsteps%2F12%2Flogs%2Fstdio&amp;data=3D05%7C01%7Cp=
.lobacz%40welotec.com%7Ce8f1fc340a14425d3ef208db9b3495e3%7C25111a7f1d5a4c51=
a4ca7f8e44011b39%7C0%7C0%7C638274422388079435%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%=
7C&amp;sdata=3DN8x%2FfNthi1Uk30IwKIvqdnGFZBxl9VXJGvMBDdojWa8%3D&amp;reserve=
d=3D0</a><br>
<br>
<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2023=
0811-vwiija9k/packages/diff-html/">https://eur04.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Fautobuilder.yocto.io%2Fpub%2Frepro-fail%2Foe-re=
producible-20230811-vwiija9k%2Fpackages%2Fdiff-html%2F&amp;data=3D05%7C01%7=
Cp.lobacz%40welotec.com%7Ce8f1fc340a14425d3ef208db9b3495e3%7C25111a7f1d5a4c=
51a4ca7f8e44011b39%7C0%7C0%7C638274422388079435%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7=
C%7C&amp;sdata=3D19uU%2FEieeXc6pztLj3zzxrF3eUgxCZgb0fjfqyiJe80%3D&amp;reser=
ved=3D0</a><br>
<br>
On 04/08/2023 10:43:09+0200, Piotr =A3obacz wrote:<br>
&gt; Extend `tar` command inside copytree() and copyhardlinktree() function=
s,<br>
&gt; with additional parameters, in order to support ACLs and xattr. The po=
six<br>
&gt; format doesn't need to be set in here, as GNU tar switches to it whene=
wer<br>
&gt; is uses --acls and/or --xattrs parameters.<br>
&gt; <br>
&gt; Additionaly change preservation of additional attributes for `cp` comm=
and<br>
&gt; to all (meaning mode, ownership, timestamps etc.) not only xattrs, whi=
ch<br>
&gt; were previously.<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/lib/oe/path.py | 6 +++---<br>
&gt;&nbsp; 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py<br>
&gt; index 0dc8f172d5..56e8e214ac 100644<br>
&gt; --- a/meta/lib/oe/path.py<br>
&gt; +++ b/meta/lib/oe/path.py<br>
&gt; @@ -92,7 +92,7 @@ def copytree(src, dst):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # This way we also preserve hardlinks be=
tween files in the tree.<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.utils.mkdirhier(dst)<br>
&gt; -&nbsp;&nbsp;&nbsp; cmd =3D &quot;tar --xattrs --xattrs-include=3D'*' =
-cf - -S -C %s -p . | tar --xattrs --xattrs-include=3D'*' -xf - -C %s&quot;=
 % (src, dst)<br>
&gt; +&nbsp;&nbsp;&nbsp; cmd =3D &quot;tar --acls --xattrs --xattrs-include=
=3D'*' -cf - -S -C %s -p . | tar --acls --xattrs --xattrs-include=3D'*' -xf=
 - -C %s&quot; % (src, dst)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subprocess.check_output(cmd, shell=3DTru=
e, stderr=3Dsubprocess.STDOUT)<br>
&gt;&nbsp; <br>
&gt;&nbsp; def copyhardlinktree(src, dst):<br>
&gt; @@ -119,7 +119,7 @@ def copyhardlinktree(src, dst):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (canhard):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Need to copy d=
irectories only with tar first since cp will error if two
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # writers try an=
d create a directory at the same time<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd =3D &quot;cd %s; find =
. -type d -print | tar --xattrs --xattrs-include=3D'*' -cf - -S -C %s -p --=
no-recursion --files-from - | tar --xattrs --xattrs-include=3D'*' -xhf - -C=
 %s&quot; % (src, src, dst)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd =3D &quot;cd %s; find =
. -type d -print | tar --acls --xattrs --xattrs-include=3D'*' -cf - -S -C %=
s -p --no-recursion --files-from - | tar --acls --xattrs --xattrs-include=
=3D'*' -xhf - -C %s&quot; % (src, src, dst)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subprocess.check=
_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source =3D ''<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if os.path.isdir=
(src):<br>
&gt; @@ -130,7 +130,7 @@ def copyhardlinktree(src, dst):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; source =3D src<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; s_dir =3D os.getcwd()<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd =3D 'cp -afl --preserv=
e=3Dxattr %s %s' % (source, os.path.realpath(dst))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd =3D 'cp -afl --preserv=
e=3Dall %s %s' % (source, os.path.realpath(dst))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subprocess.check=
_output(cmd, shell=3DTrue, cwd=3Ds_dir, stderr=3Dsubprocess.STDOUT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; copytree(src, ds=
t)<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#185512): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/185512">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F185512&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7Ce8f1fc340a14425d3ef208db9b3495e3%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638274422388079435%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3Dtz%2B%2FMtfHio%2Frn19by0T0So7lRRShaWRzndmqbpPuvwM%3D&a=
mp;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10054271=
5/3617179">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100542715%2F3617179&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7Ce8f1fc340a14425d3ef208db9b3495e3%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638274422388079435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3D2cSMjyWWkd0B8neBuDBgRIJHPGHLSgXDpsllbMXKlng%3D&amp;reserved=3D0</a><br=
>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7Ce8f1fc340a14425d3ef208db9b3495e3%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638274422388079435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DiGIqTNuFlHGWxfBg%2BoqwdeZnvun7tuJpAZ642M4Gt2k%3D&amp;reserved=3D0=
</a>
 [alexandre.belloni@bootlin.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com/">https://eur04.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fbootlin.com%2F&amp;data=3D05%7C01%7Cp.lobacz%40we=
lotec.com%7Ce8f1fc340a14425d3ef208db9b3495e3%7C25111a7f1d5a4c51a4ca7f8e4401=
1b39%7C0%7C0%7C638274422388079435%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3DHkAEqLZj4x0KBFqFNI0N4Eq%2BiGVOdb6hVK93DW2Ev1U%3D&amp;reserved=3D0</a><br=
>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373895614372C6A9CDFF9569111AVI1PR04MB5373eurp_--

