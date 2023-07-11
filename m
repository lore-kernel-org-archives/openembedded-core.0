Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA03EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 23:34:18 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web11.1443.1689118455984829785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 16:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.22.43, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atIzNRY2GVYfjuTQeTfMzEvzZEZayqe2RDhaziGT6DiVojqMiSqM6MboIHkm2swZBn3sd/Dz8tPYQzpT630RYN61or1MrtZWg9/XwKHfniVANYq2qprrBCSaBAB9tW/u/BUaaBZ0GFTO0EdvNDnHmJrhbOiSshxJeYyLm5CZzfCHc2ptq4c0W3R2x3hQXEmWgjacOfwCHRMQiErZLgT85gBJvCBALIullqHGll3ysMOaLoC/DaP6AxCAoC2rKAX6UMkKdY5xl15vlakrFvxgyKn9v7gpxmM08apbZ0emdi9IR62BQFWmcpCEynZNVp/KwbuO0VoyfdWFvXmKq1nBBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vr6qno86oy7w4UkTUAr1ApzYWT+THUer34exPmrpCqw=;
 b=Wlotbrr8N76tYGOPKUsMtLjvgyNm45ELDejkkqfotrPDSKcWT9KTQyVsUxeHiTXX1q2t6t5i602jXGMYUVJnqAbQ+zTC/14hffmVMkjcfkASVebqmC419qmhvgAAe9ftSH4xpwaZWvX1LZ9TRy79y1cKs4XQ6LI+j6epwRsJGRzNNlsVPUD1UKyNDu9PRDwzIZ+TipbRr+5eJDCczGh25kW8Uo4kI9vzkCKqlSlqmFTsWP2WENBISz9HegjaVIEIqcfZFlBKnn4tBb0U3MMaGg993lcqL/uZEvGolMjalhkO0ojPJ0jXOGzXl7njvDMd521Qgaana6nhqzoXa+tsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr6qno86oy7w4UkTUAr1ApzYWT+THUer34exPmrpCqw=;
 b=kVjoe4/2i+TsWfkxRf4aSJ6/RAEdqicEMhS04cofTSAisMIcPWEusnU0pevva9GF+R9NNOgV5rj2YsNAvIz/2CYffyZJ0nlIp0l1zDXA1hXol0P/19ufqgUp1CuqtnJJuyp4H9NJIFV7eNd+urV4FZUtIsaMxqtnCIjpbpfTyac=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 23:34:12 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 23:34:12 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZsxUxLTW0Sb4E3Uu/U3gcvSoAYK+y5quAgAGB4caAANEvYg==
Date: Tue, 11 Jul 2023 23:34:12 +0000
Message-ID: 
 <VI1PR04MB5373030AD56257CE45EB8DBF9131A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
 <7CE572D5-CA4B-4B29-B727-BB22D8E4D931@arm.com>
 <VI1PR04MB53739E01C427B6EE1D35961A9131A@VI1PR04MB5373.eurprd04.prod.outlook.com>
In-Reply-To: 
 <VI1PR04MB53739E01C427B6EE1D35961A9131A@VI1PR04MB5373.eurprd04.prod.outlook.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DU2PR04MB9132:EE_
x-ms-office365-filtering-correlation-id: d27e8b97-bf4e-4110-24f7-08db82675539
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 63bfmo0pfQNlL0QnoJ00H+Pv7XPPK+t93l1uLCzTw9Nt8pEsvdYoBrsRNfG1vsSNQDbI2VAWORjK2VQDEM0FKSERyS2TDLzs55/Sl/+7SLNxrT5NBVO5tIWwX4FbvFVWukcN/ajuB2Y03berzLxG4L7ow8iGON4dYl8EJslKvzTSbwtD71iLCUyB/rWEEwQkhqXnkE+6GS8na1dSSBPDtKiY4bGSaco7lHCZ5HyfD9UpqggQbMgIx82qH95onz13B4vPKvqUqEwJH4LG64CUhattsQkFEmnwfLr/lxXtOn8yaZF45ZHouRmMp7tviptMXsCetjG8Zvw7TIYhqBp4qRfqHsIi+UJwW3cTPY19NrjoeKNJgVH6+OReGv8Is2GylS8X825suk4oo+8n79TTnBJY69U+wH5RnhZxyUfCf1GG4q3kdBHNV5pMRseoj8FLq8vq06gcej9Wm9sPhgs8yGb6c01DOWQfzE9Wvx0uszPuN1WudyI8FIEuHwLn92y9ky7OrY9kLShchHKFYE+IMEtS27X70taK08wVzH0l/1ZbNc6RETk1e3kA2CmUgVjfSKNLvWZX40+TFqpq0JY7GdN2LwngLELejWEnac5cW74=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(396003)(346002)(376002)(136003)(366004)(451199021)(19627405001)(38100700002)(38070700005)(86362001)(66899021)(55016003)(7696005)(71200400001)(66946007)(76116006)(91956017)(33656002)(122000001)(166002)(6506007)(26005)(186003)(9686003)(966005)(53546011)(2940100002)(5660300002)(52536014)(66476007)(2906002)(66556008)(6916009)(478600001)(66446008)(45080400002)(4326008)(8676002)(8936002)(64756008)(83380400001)(66574015)(316002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?TKKyjQWW146fTeWWuo37nQzQdrU+CAHCi6fpe9srJyDMdhh+RRyxiHjv?=
 =?windows-1250?Q?GgUJ9aWA/1wsAAAbmhEsdkkU4pz8o+kPPtG/JavPwmPMjVhvA5hRk1aa?=
 =?windows-1250?Q?XxDlgsOea4FmDZmjx/QUlMRhwIh+8RyqC41f2ifw4zevNXtBZTdQ8gu0?=
 =?windows-1250?Q?JTfFwHQ8BYM8aJXvZGttB5/+8sSXW939sAF5JkdecJS2x+eV47B7Mysn?=
 =?windows-1250?Q?Fph+LdjTXu4ASOdL9E0fCgZgH+5h0o5BjT2NpMMawBaNUL/+XKmVF4yA?=
 =?windows-1250?Q?EHyfZSgIbSRI3rHiY6AQ+b/YfPYhjax1DDlkQGNrKEB2asjOGgKNg/vx?=
 =?windows-1250?Q?nQ+KzJQnkyPjYfvnk9BALgTiqGs3rnI8ZwTlbGxrxgeFg/a1P9KU4Y8V?=
 =?windows-1250?Q?DYJk6jWl8VictZ/Q3v+cLPDPDQ7y/BRohDB01XPr3V24y3WmP7ZWLNrr?=
 =?windows-1250?Q?BoXUVcF5FRG2yI/+t44P4w9Xpvz5qV3U2Dyo6AV+rbFYEwPi/+vAxsb+?=
 =?windows-1250?Q?f6dLm0ox9eDNEUlP7xk6Iw2atycyk0CkBrlRrzRhYFXLRJbdVxF6mgiC?=
 =?windows-1250?Q?v95DPqUFwhjXlr3UaexH47xKfVaGHlVxWrkHBRqJ87PkoD5CK6+P0TR0?=
 =?windows-1250?Q?gBfBESE8u6q4ey962fbu0zQYNMlmhwz+E4+OlQf5dggx55Gr4apBxMvE?=
 =?windows-1250?Q?dgFdgULLn1EOudvMzDZmjFkOKSr/Tsl6H/E9+pwU5HtZruf+x95RZbK/?=
 =?windows-1250?Q?5NOkH2V0pU7CQPjCXNSU/9EW4dZxgBvk8aivw3Oo8TAk18LqDm4MapUi?=
 =?windows-1250?Q?pyhq10ICOEpEH8gHoWAQG3ASJ48ho8cNs+Yt1Z1g3WWGCh/7+Jj0CGAX?=
 =?windows-1250?Q?28iaOES7g/z9bcfZIHGhxbA++tuHthANl7rWzzL4tR+aQboMCjE7TO5U?=
 =?windows-1250?Q?clBmcmfbt8zWV47Yr7/X+6zqxekMS+ROJvHSXUERTMeoOqFL9Q0LpYOj?=
 =?windows-1250?Q?38SLRhPbIY0tMiz+FFyBIB7Qxhy/yk/sVkhWZC9xBWuRLDPbuPurD29W?=
 =?windows-1250?Q?yXliNzPPkTk8mP5A989dRFRhpoyq//L+NbfYbMM98uhKiawk908/L16n?=
 =?windows-1250?Q?JYL2r5A01ZQdHISaRX39dvK3MH1PFxhERn0Q3iaUmUPnyaHAfbGxxRqm?=
 =?windows-1250?Q?h6IOwyHXzGo4Um+MUjAGCNgu9h06phY0a/W9NEOYwphJdavIQ74aGmB/?=
 =?windows-1250?Q?eNLN8gSVkBBbgRtuH0fBEbUbxnPZTUdha976tkh/ihk6hIUqYrvX3hMm?=
 =?windows-1250?Q?2zgrRTuIMEhscE2XyQsiWs654bgwacTAFhDUeO8RyP3rcM9wTiKEOsYJ?=
 =?windows-1250?Q?C+s06m6+MhZs63sEKGEHBxQDY6O+xnuuQl7oOZ4feoNSa4Jqq9XMMVkf?=
 =?windows-1250?Q?X6BSByw2nBEvx5zW0YLIIFfgNb3UbeRi3KLDcST42dTjUdBizvF3zC+Y?=
 =?windows-1250?Q?G33xcCipJlvkoroqAHFGF4DpDD/j8/ooafgGlBJ1dvgwVb+chHvlbMJZ?=
 =?windows-1250?Q?DjZbXYFFw3H5W6J4S8tvZTGqlutL9eh7pKLew/V5Kw3ID1LVS2doaQxF?=
 =?windows-1250?Q?ejvFlpueUnzT1s4PJkZ5jDd0ItjF4KBJCvmWkjBtWhf9bLSrHQt0/nVw?=
 =?windows-1250?Q?nxJ3XAMrYnc=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373030AD56257CE45EB8DBF9131AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27e8b97-bf4e-4110-24f7-08db82675539
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 23:34:12.5871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HBMeVC7gPAshps7YdCLhwavofeibjuxI4Tzgd7UB+sVUenPRCf3reZa4wDmuNuLTUCeI6U5/tpHfeFU3e/fDqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 23:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184162

--_000_VI1PR04MB5373030AD56257CE45EB8DBF9131AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Hi Ross,
I have added patches to oe-core for opkg-utils and opkg. On opkg-devel Alex=
 has also mentioned to do that as he will apply these patches to the newest=
 versions of opkg and opkg-utils.

BR
Piotr
________________________________
Od: Piotr =A3obacz <p.lobacz@welotec.com>
Wys=B3ane: wtorek, 11 lipca 2023 13:07
Do: Ross Burton <Ross.Burton@arm.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro nati=
ve features support

Hi Ross,
Alex has written that he will take care of it today, but ofcourse I can add=
itionally apply paches in oe-core layer as well today evening.

Regarding additional tests we need to apply them ASAP.

BR
Piotr
________________________________
Od: Ross Burton <Ross.Burton@arm.com>
Wys=B3ane: Monday, July 10, 2023 2:02:37 PM
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro nati=
ve features support

Hi Piotr,

This is a great patchset, thanks for chasing all the loose ends.

Until the patches for opkg have landed we can apply them to our recipes, so=
 feel free to send a patch to the opkg/opkg-utils recipes to do that.

Also some form of test would be essential.  Something along the lines of ad=
ding to an image a test recipe which has both ACLs and arbitrary xattrs set=
, and then boot the image and verify that the attrs actually exist.

Although I guess you could just build an ext4 of the image and then use deb=
ug2fs to probe it.  That would be a little more complex to write, but doesn=
=92t mean booting the image.

Ross

> On 10 Jul 2023, at 10:57, Piotr =A3obacz via lists.openembedded.org <p.lo=
bacz=3Dwelotec.com@lists.openembedded.org> wrote:
>
> Include support for ACLs and extended file attributes for native
> builds, depending on which distro target features has been turned
> on.
>
> Signed-off-by: Piotr =A3obacz <p.lobacz@welotec.com>
> ---
> meta/conf/bitbake.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9625a6fef4..da01e9b66f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>
> # Native distro features (will always be used for -native, even if they
> # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 ${@bb.utils.filter('DISTRO_FEATURE=
S', 'acl xattr', d)}"
> DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>
> # Normally target distro features will not be applied to native builds:
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184063): https://eur04.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fme=
ssage%2F184063&data=3D05%7C01%7Cp.lobacz%40welotec.com%7Cac1be1ea95524118ab=
5d08db813d9725%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638245873753484=
720%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DjtcQryE1wD6%2BpF4edaxZEP3YOr%2F=
LcaFuR4%2Bt9xvfMek%3D&reserved=3D0<https://lists.openembedded.org/g/openemb=
edded-core/message/184063>
> Mute This Topic: https://eur04.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F100054733%2F6875888&data=3D05%7C0=
1%7Cp.lobacz%40welotec.com%7Cac1be1ea95524118ab5d08db813d9725%7C25111a7f1d5=
a4c51a4ca7f8e44011b39%7C0%7C0%7C638245873753484720%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3DHS5OslF4It9P5Uj04GLdM%2FvdVGxqCT96Hv0%2F9Mic4BI%3D&reserved=
=3D0<https://lists.openembedded.org/mt/100054733/6875888>
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7Cac1be1ea95524118ab5d08db813d9725%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638245873753484720%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&sdata=3DsHpcO%2BPtu2dsAtPk9p0lQuU0PoIIG%2FW9bMbIMu9y%2Fw4%3D&reser=
ved=3D0<https://lists.openembedded.org/g/openembedded-core/unsub> [ross.bur=
ton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_VI1PR04MB5373030AD56257CE45EB8DBF9131AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Ross,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I have added patches to oe-core for opkg-utils and opkg. On opkg-devel Alex=
 has also mentioned to do that as he will apply these patches to the newest=
 versions of opkg and opkg-utils.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
BR</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Piotr =A3obacz &lt;p.lo=
bacz@welotec.com&gt;<br>
<b>Wys=B3ane:</b> wtorek, 11 lipca 2023 13:07<br>
<b>Do:</b> Ross Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr dist=
ro native features support</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div></div>
<div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr">Hi Ross,</div>
<div dir=3D"ltr">Alex has written that he will take care of it today, but o=
fcourse I can additionally apply paches in oe-core layer as well today even=
ing.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Regarding additional tests we need to apply them ASAP.</di=
v>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">BR</div>
<div dir=3D"ltr">Piotr</div>
</div>
</div>
<div id=3D"x_ms-outlook-mobile-signature" dir=3D"ltr"></div>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>Od:</b> Ross Burton &lt;Ross.=
Burton@arm.com&gt;<br>
<b>Wys=B3ane:</b> Monday, July 10, 2023 2:02:37 PM<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr dist=
ro native features support</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Hi Piotr,<br>
<br>
This is a great patchset, thanks for chasing all the loose ends.<br>
<br>
Until the patches for opkg have landed we can apply them to our recipes, so=
 feel free to send a patch to the opkg/opkg-utils recipes to do that.<br>
<br>
Also some form of test would be essential.&nbsp; Something along the lines =
of adding to an image a test recipe which has both ACLs and arbitrary xattr=
s set, and then boot the image and verify that the attrs actually exist.<br=
>
<br>
Although I guess you could just build an ext4 of the image and then use deb=
ug2fs to probe it.&nbsp; That would be a little more complex to write, but =
doesn=92t mean booting the image.<br>
<br>
Ross<br>
<br>
&gt; On 10 Jul 2023, at 10:57, Piotr =A3obacz via lists.openembedded.org &l=
t;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt; wrote:<br>
&gt; <br>
&gt; Include support for ACLs and extended file attributes for native<br>
&gt; builds, depending on which distro target features has been turned<br>
&gt; on.<br>
&gt; <br>
&gt; Signed-off-by: Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
&gt; ---<br>
&gt; meta/conf/bitbake.conf | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 9625a6fef4..da01e9b66f 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATURES}&=
quot;<br>
&gt; <br>
&gt; # Native distro features (will always be used for -native, even if the=
y<br>
&gt; # are not enabled for target)<br>
&gt; -DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
&gt; +DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 ${@bb.utils.filter('DISTRO=
_FEATURES', 'acl xattr', d)}&quot;<br>
&gt; DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
&gt; <br>
&gt; # Normally target distro features will not be applied to native builds=
:<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184063): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184063">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F184063&amp;data=3D05%7C=
01%7Cp.lobacz%40welotec.com%7Cac1be1ea95524118ab5d08db813d9725%7C25111a7f1d=
5a4c51a4ca7f8e44011b39%7C0%7C0%7C638245873753484720%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DjtcQryE1wD6%2BpF4edaxZEP3YOr%2FLcaFuR4%2Bt9xvfMek%3D&a=
mp;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10005473=
3/6875888">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F100054733%2F6875888&amp;data=3D05%7C01%7Cp.lobacz%40=
welotec.com%7Cac1be1ea95524118ab5d08db813d9725%7C25111a7f1d5a4c51a4ca7f8e44=
011b39%7C0%7C0%7C638245873753484720%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3DHS5OslF4It9P5Uj04GLdM%2FvdVGxqCT96Hv0%2F9Mic4BI%3D&amp;reserved=3D0</a=
><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7Cp.loba=
cz%40welotec.com%7Cac1be1ea95524118ab5d08db813d9725%7C25111a7f1d5a4c51a4ca7=
f8e44011b39%7C0%7C0%7C638245873753484720%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DsHpcO%2BPtu2dsAtPk9p0lQuU0PoIIG%2FW9bMbIMu9y%2Fw4%3D&amp;reserved=
=3D0</a>
 [ross.burton@arm.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_VI1PR04MB5373030AD56257CE45EB8DBF9131AVI1PR04MB5373eurp_--

