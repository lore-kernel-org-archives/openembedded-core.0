Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D093E7F144
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 22:59:41 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web10.5312.1695769178585856184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 15:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=HCHX2lr7;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=rgSFygZO;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220297.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38QMs63G014988
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=pps1; bh=99KNJ1QeyUDm9nE/9cXbzt8yf98KQpagVyUsmar5RSw=;
 b=HCHX2lr7BUujrlNMZ7j72n/AMUJvf41zbOFg1zTehwL1WI7eb/Kn/M9+lj2A6UTTvPGu
 kVcg+g1TIzhkPG0ya2rxM35+DeAJZWpQ/xcN38kefcm25k05fYlNai11a/ce8NqR1MVk
 nIIoUETgOyJ7MBpwa8BErQmMWC/3zQf57ycUY9HkPtaByt1h8YUZG9/zQNW1azvAmg6R
 Ci1xmgggcQuKxw4vOczSnsH/NUIaay0rNuAovotnSktOVe6O6rJ+wBnLV6DMxxx+peZN
 oZ+sdAlZqRgKS5VL+nMCWXqal0ebJz/9kGWuePh8766L0ENhgMiJ+yTodpJqygwETM6k 9A== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3tbw9hs89s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:59:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAlrYjrb+dBgRffffNrSHldAZTdVvgSk2PpcennHjvc/USKQNYRnEl0p+BcrcwVGP6EoRW7H1YKFrV01a102ibz6w14pqfbwGx8FbguI5i4zQfMDnOqYHJgLcrdNKvDGgBRFOjLdgfNfkOro0e1Elv7FXL+aO6OfKHh2W1c6tIQ+C4ysdsnDy3Qbesu9u9SnQUCFWgZqyqeiH1ovRXQzNyFyF147GYVXdt2sBAEiRRUvrqYCmZIdeSxeyfhJo6wy4UFZRQDXDLGtfT60+EYpgjl+D9muvuSVF+SBJBqsrqgZAkLJyHKbbrt9FWNgfHrj50XOiuxIT8UbUvzTD9MWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99KNJ1QeyUDm9nE/9cXbzt8yf98KQpagVyUsmar5RSw=;
 b=QsUPaT9Cuy/9ZemPq6KBF6XVTOxtlSXkkNdV/Ls+HNnJyMuqF4SXjGbfV9wPfDWRAqzcIBPL2XKmXLyei3IekJIv3UrdQGEiYGNInqnyd3aSJ0hi7FW+g6lQOjPmuz2izVh/UcR7bw/V3M8hOLfhOukVjXupO1sBF9z797D8LhvDKYHg5excpvKf7v9Go0M6gYJK4tO4aMOSotx1qOsBbGi1ODAmU1FLrfX+JTCL3uPWAwcoMeC3/63zgQoLwxMGVaWj1CqQ4NJu0tVOJY+vQX1xvzLm/RYMqgxLnJkgU1XLWt3n/m4MJ1Ziq19lvMfza8MCWOUE6gN/ISnoTgE9Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garmin.com; dmarc=pass action=none header.from=garmin.com;
 dkim=pass header.d=garmin.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99KNJ1QeyUDm9nE/9cXbzt8yf98KQpagVyUsmar5RSw=;
 b=rgSFygZOUqZnounoI7nAKr9pBVDqRFShSmKUoKPJzOsU4hfDvxJCKjLwESCUDa94oO8QDFqbHEuV1dPE4biNsiw30ekBrLnOboSv66XxNSx0mpQIFV8pAQ0Im1BQx9MCYvqOplJPvY12mDLAkXUvg3RYSYFTQ9AIqy0ho91AgZwykIv8DoNOweZouFgc83cBrSPok3q3i5t5kiRvWvxvbwBq8m0dD2KGQcpeJdIxJOXHhI0yexF5L2qByo/MxHA6AYvs/wzqPng50oHsyUmQtyr/Qt9Adqz/SBK59RS+R/B1k6Zf5MRqAOCxbtP0cjBLpZwd6hI9580Hhr9anjB3yg==
Received: from SA2PR04MB7723.namprd04.prod.outlook.com (2603:10b6:806:137::18)
 by DS0PR04MB8652.namprd04.prod.outlook.com (2603:10b6:8:117::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.19; Tue, 26 Sep
 2023 22:59:35 +0000
Received: from SA2PR04MB7723.namprd04.prod.outlook.com
 ([fe80::ff83:ebfd:518b:a6f7]) by SA2PR04MB7723.namprd04.prod.outlook.com
 ([fe80::ff83:ebfd:518b:a6f7%4]) with mapi id 15.20.6813.014; Tue, 26 Sep 2023
 22:59:35 +0000
From: "McAllister, Colin" <Colin.McAllister@garmin.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "McAllister, Colin"
	<Colin.McAllister@garmin.com>
Subject: Re: [OE-core] [PATCH] libwebp: upgrade 1.3.1 -> 1.3.2
Thread-Topic: [OE-core] [PATCH] libwebp: upgrade 1.3.1 -> 1.3.2
Thread-Index: AQHZ8MHVXtiODjhUykeHT8IBI7nJorAtuG9M
Date: Tue, 26 Sep 2023 22:59:35 +0000
Message-ID: 
 <SA2PR04MB7723A34D2B637A68952FDA8BF4C3A@SA2PR04MB7723.namprd04.prod.outlook.com>
References: <178890AAFEA66B5E.25618@lists.openembedded.org>
In-Reply-To: <178890AAFEA66B5E.25618@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=True;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2023-09-26T22:59:34.201Z;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=Confidential;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=0;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR04MB7723:EE_|DS0PR04MB8652:EE_
x-ms-office365-filtering-correlation-id: f0ed4290-7414-4ecd-e0b5-08dbbee440d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KZelwDqNofewHtn6MqGCfy5LAYmvlPW8MOlYs8SEK//h+JURj2rYIwbrVAy8rVCJ52iUzzi5HrVlOx4Few6zPikNVFu9s/pNoJeKTmfx6VzE+lMmk42Xaw6cyP3NBkX68cWbEiJIMkY9NpwVEQWlJTyCZ8CH9A9ti7vGgKrCczJ9NIB9c2meywhqhFYEQSDW54SspQ3pjyCwoqQdI+lyYEozgYQTkqtnHnOZ4Em8WjdxZm9rHVNdEHqjn6XSZE4MW2BSRM0PIb0AMEeVbbTgUFwRv9A/jh2N4PG/Dbd/xba0YAQ5TkswWw76DZhQe8EBBqFBH+zwsPhypXebFDWuAhUd33JMk4wSftOoqcRQaLorq8hQS47dPpzN0LaXhc4PCXJcGetbx6grzoGlschLhgyO8XcVFzzJKN1ara6b9bqK6Yzn0tR/d6yZ/HANWF+hy4xcxDsGP4WV6O/W8A4EWEGoep8hDJ2ryR4v0FkWq9HYOIqupU9R0PscywzueAtO8hlBdywKKiLDx41W2+jDGjtr6tUmMMGE82gk69AKjaKyqBtKzy+CxlVap0Sr9bx4t7e6bOOGRTMLp6nvu1pAvAtZtfFkLfgvJTepUelkMbK/LHb+g+QmlIOTUAW7jgsc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR04MB7723.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(1800799009)(186009)(451199024)(7696005)(316002)(5660300002)(19627405001)(8936002)(8676002)(41300700001)(110136005)(91956017)(66476007)(66446008)(64756008)(66556008)(52536014)(66946007)(76116006)(2906002)(71200400001)(6506007)(55016003)(33656002)(9686003)(38070700005)(478600001)(26005)(38100700002)(86362001)(83380400001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?G7CO+AI38wWIQ0nADT0CqAsLtQFpS1vzL6LG4iYnfIAUsxO5FDH1FpXRVKag?=
 =?us-ascii?Q?y92FJ4NA1/O6lOSJx/ArWVkPKX4qs7hAfGzaSHVN9o2IgtQvndJkuexwMCIv?=
 =?us-ascii?Q?BuiLSuGMkpRQAPvCGcrOf/wcKqmLwOvWGfZAt/7JiHCSHNWyrWmc+8y5fuCJ?=
 =?us-ascii?Q?QRE2MAwkT85ZrlbsOeyvBsIA4Cd2Uc2MKW2qck7vVddNyEtEjovU1NdNx0Gk?=
 =?us-ascii?Q?WCp7Nfq308Hu8f5Oq2EmgXqf388q2x2EEzCvEmlhAWEc93iHQHhXHgkoQb8t?=
 =?us-ascii?Q?MB/EzELUSMvFMDbT/cUm7Rk6Ciawsf8u5wz7w3nnpGWx2NTbJpdjrfdSCoPu?=
 =?us-ascii?Q?koOOg4OwlrLtXXkfTTv0QDXKWNk6XWU0QLNDUytkZhI9tZ2Hx7+eIuMuIGVQ?=
 =?us-ascii?Q?aIYSqRnsM8bexnpJl+GVwIbLV9znNGJAu56PYtdHjNcY+i+mQvlNQ6gga1Ch?=
 =?us-ascii?Q?L3fRu6JsyGe0ec8/uObXv/tqxyS1yZQJWAVzKzM4fdl6NarXG10QCvAsKa3j?=
 =?us-ascii?Q?1EIh+ZjS3xXwpjFAEWEEL8MeUQm6CQnv901KAjf1aYyel/Du1OqzRcoaWfhY?=
 =?us-ascii?Q?J5/Pp0t1vu7giv/FbGIn8YeDAKZl5p+h2+dsI2NSNxFTeGYwBHQlWM1y+gDm?=
 =?us-ascii?Q?p3JFN+DkNnSqD+y+cq1NUql7PxQ6mWfYMBu45/cdetwepNU8of+5UY3hVQa+?=
 =?us-ascii?Q?0vG0/HebB/N4jAIfVfDV5OdHsQlzqmZkWsGOLUcjcF1f3s2ZY0xfyHm7nqbF?=
 =?us-ascii?Q?M6V8OIK1Qo44myvW8lMQL4jBRJJSUngZ9c+7qoBN/pC+95Jgb1ETL9HphMw3?=
 =?us-ascii?Q?07fSHq9Ru6mfosMJuhDW5NGp7+O1JBQxshq883KP7FUAyK0c6nk8w5HbK/Fw?=
 =?us-ascii?Q?Dd9DMQKx7o+zcH2MkpVjRxFV4cCk6TxlZb2PDyGD3IDCcLJKSFc8uU+r5o+V?=
 =?us-ascii?Q?S3UWdBCzT8N+hsI1LB1R/Wjyvun+Aw58j1UlPv2EaPLz3GztcJyAwRv14iwN?=
 =?us-ascii?Q?1Ej8FCKm0tTZmdGE44+nesr+cklicvDa7uTQesy0GId67PYAIW+g2MLCqADv?=
 =?us-ascii?Q?XGNi7SVqdYdmANA4y7JkrwIOtBnF2drAEI7vX6rENjBnyOrh4+7bQCa/d6iD?=
 =?us-ascii?Q?84VmqDJftXM4cClIF1Sxyp1VkF9CkpYpur6PS7g/biMrxi1BhKn+7Jro0iNy?=
 =?us-ascii?Q?sPOaJ1taYNK+Bgca3PoqhB4k/lcudCbCRAO74WTAbrEV+AH/TcwkqYHCGEXL?=
 =?us-ascii?Q?O9gtBGwDzfxcuTonfWa87Okb1bMqbT/bVp8eFAV4iu8uuckCDjOj7tdGWUeS?=
 =?us-ascii?Q?CKEGQIUFA78MR1bvhaY4kiW6nCLWbliPjS8DHLDGCBCJDH6dc7jqRQdFixBs?=
 =?us-ascii?Q?3kmgVrPjJVI+PNZ3D+kES2lomgfdVDaLk5nQHuV+gBvn6vvRDlJCd32WTLyl?=
 =?us-ascii?Q?N0feHBThXbTBh8WMxuXcuj5nyExB4Smtb93hIp9BLoAFrAW4azNLNG3fB5+A?=
 =?us-ascii?Q?QHAwvMjfiJdJkNimPxIZCpy6gYnhJd3D4nK+BRjQbHF3IwE/W35Zc869oJy8?=
 =?us-ascii?Q?NXLkPejQ1boJYrJIhA8VHqecfPyYGBZYYKpxEJqT?=
Content-Type: multipart/alternative;
	boundary="_000_SA2PR04MB7723A34D2B637A68952FDA8BF4C3ASA2PR04MB7723namp_"
MIME-Version: 1.0
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR04MB7723.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ed4290-7414-4ecd-e0b5-08dbbee440d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 22:59:35.2053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJ8LqGHCIp/KkYSHLIniHrg26QgQI50y/WlHJ59PdS/aB/jZNZRVzbvnlmk8yYEtl+LZ5DVf6pjZdqo/hAf3KE+TTGcYG2KrduM5ygvRVWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR04MB8652
X-Proofpoint-ORIG-GUID: S-mzu5ab1dc2e1A03RqM3GnXTpBPZKbw
X-Proofpoint-GUID: S-mzu5ab1dc2e1A03RqM3GnXTpBPZKbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_15,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=813 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309260198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 22:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188282

--_000_SA2PR04MB7723A34D2B637A68952FDA8BF4C3ASA2PR04MB7723namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I must not have gotten enough sleep last night. Please disregard this chang=
e.
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Colin McAllister via lists.openembedded.org <co=
lin.mcallister=3Dgarmin.com@lists.openembedded.org>
Sent: Tuesday, September 26, 2023 16:38
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: McAllister, Colin <Colin.McAllister@garmin.com>
Subject: [OE-core] [PATCH] libwebp: upgrade 1.3.1 -> 1.3.2

CAUTION - EXTERNAL EMAIL: Do not click any links or open any attachments un=
less you trust the sender and know the content is safe.


Upgrades libwebp to the latest version to fix CVE-2023-5129.

Change-Id: I061fcda90c7720bc41a575551b399a6f36dfd534
---
 .../webp/{libwebp_1.3.1.bb =3D> libwebp_1.3.2.bb}                   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.3.1.bb =3D> libwebp_1.3.2.b=
b} (100%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.1.bb b/meta/recipes-m=
ultimedia/webp/libwebp_1.3.2.bb
similarity index 100%
rename from meta/recipes-multimedia/webp/libwebp_1.3.1.bb
rename to meta/recipes-multimedia/webp/libwebp_1.3.2.bb
--
2.42.0


--_000_SA2PR04MB7723A34D2B637A68952FDA8BF4C3ASA2PR04MB7723namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I must not have gotten enough sleep last night. Please disregard this chang=
e.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Colin McAllister via lists.openembedded.org
 &lt;colin.mcallister=3Dgarmin.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, September 26, 2023 16:38<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> McAllister, Colin &lt;Colin.McAllister@garmin.com&gt;<br>
<b>Subject:</b> [OE-core] [PATCH] libwebp: upgrade 1.3.1 -&gt; 1.3.2</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION - EXTERNAL EMAIL: Do not click any links o=
r open any attachments unless you trust the sender and know the content is =
safe.<br>
<br>
<br>
Upgrades libwebp to the latest version to fix CVE-2023-5129.<br>
<br>
Change-Id: I061fcda90c7720bc41a575551b399a6f36dfd534<br>
---<br>
&nbsp;.../webp/{libwebp_1.3.1.bb =3D&gt; libwebp_1.3.2.bb}&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 0<br>
&nbsp;1 file changed, 0 insertions(+), 0 deletions(-)<br>
&nbsp;rename meta/recipes-multimedia/webp/{libwebp_1.3.1.bb =3D&gt; libwebp=
_1.3.2.bb} (100%)<br>
<br>
diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.1.bb b/meta/recipes-m=
ultimedia/webp/libwebp_1.3.2.bb<br>
similarity index 100%<br>
rename from meta/recipes-multimedia/webp/libwebp_1.3.1.bb<br>
rename to meta/recipes-multimedia/webp/libwebp_1.3.2.bb<br>
--<br>
2.42.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SA2PR04MB7723A34D2B637A68952FDA8BF4C3ASA2PR04MB7723namp_--

