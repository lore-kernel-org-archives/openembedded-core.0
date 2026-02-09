Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E35EE81BD9
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 15:16:40 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49548.1770650108930339330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 07:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aerodyne.com header.s=selector1 header.b=P5s83tXd;
 spf=pass (domain: aerodyne.com, ip: 52.101.53.72, mailfrom: bacon@aerodyne.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INgUP9CMi0727OTnIsWGxHrNuFcq+8seun2KsAG9+yPdwtr6zhozdyELuSTpQ8zIpBW6+1VwFylZmrt5fu6V1inim10dAC4FY4Ow5fI9Jd+Nw8Z0RE5RszscdxZ7COi6FpOVBZczUIka+vMoFsIMKS+8bkpO0ilvpEMvMSDFDxAotcxz2dCuYH+tze+++mvS2Wqibj7EgJEvdWfhBEuaeWQpetlegrUlYVcAMHpatK+vJQH2IC+Qmf7CutVTLrRJegHFodyf2EyzL5MaSRXJZhkaE+iy+jQ+J61y2FNCuXfSjXBiPNZc+m0TagXYmq6aC4e3757AXdXc58dlhIB6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocmWoYKY2qn2c3y1PqxqQdUyK9HEaQzuLzrBpuK8Q3A=;
 b=J1QyFekr7kTPyaGekMWiHe3fieiD60XENmNTCXAoLO6YliD0Ieo7HcPqvBNscKwYKR461wae4CxPoBbnZW0jxY5zhRsnrQeLkn1Wm84xmEYEHbyhlGERU3vwhwm1C/P5sV9PFKXyBo6rZgF88fjhcbMQcYBLqY75Etw2xBlYoBEZF3m2m+GRTESgSv7t8hg58rdthE1j8IvDHRdusZaD1BhTSuWl/MatD+VUiBZQ2f+oxeQGsLd8agA/LH0X1SAKQ5I2M+1vs7ROkLQGhlqhY0SomcClADIvrq8dNkwmkIN+uu77zqt1keUlnDKljyDAI/n2Hy+AoYoCQY3Kz4oZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerodyne.com; dmarc=pass action=none header.from=aerodyne.com;
 dkim=pass header.d=aerodyne.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aerodyne.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocmWoYKY2qn2c3y1PqxqQdUyK9HEaQzuLzrBpuK8Q3A=;
 b=P5s83tXdybIjmLaN6Rstg2DKwA6NHYcYuJJmwM/6cXOtC11mh+4hbGc0U4HYtqd8ZbYJ+jYDsgFtHimOKMhm8kSE7EE6ovptHzSyr+FvzLtiINY9OAnZ2beXc6wJFcmnjzhKu4mdP2IgNLqzhkRZhiOpHpG6OW8bLzdDi81EOgI=
Received: from DS0PR17MB7558.namprd17.prod.outlook.com (2603:10b6:8:316::18)
 by SJ0PR17MB5479.namprd17.prod.outlook.com (2603:10b6:a03:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:59:43 +0000
Received: from DS0PR17MB7558.namprd17.prod.outlook.com
 ([fe80::e0f:ee4e:93e:4ae7]) by DS0PR17MB7558.namprd17.prod.outlook.com
 ([fe80::e0f:ee4e:93e:4ae7%3]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 14:59:42 +0000
From: Fred Bacon <bacon@aerodyne.com>
To: Yoann Congal <yoann.congal@smile.fr>, "fred.w.bacon@gmail.com"
	<fred.w.bacon@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 1/1] lighttpd: Fix trailing slash on files in mod_dirlisting
Thread-Topic: [OE-core] [scarthgap][PATCH 1/1] lighttpd: Fix trailing slash on
 files in mod_dirlisting
Thread-Index: AQHciiWOdW/Q3pZjYE6om8vMjEbk5rV5hs6AgAEOGBQ=
Date: Mon, 9 Feb 2026 14:59:42 +0000
Message-ID: 
 <DS0PR17MB755870729CFD41A735A0EDA6DB65A@DS0PR17MB7558.namprd17.prod.outlook.com>
References: <20260120155748.32482-1-fred.w.bacon@gmail.com>
 <20260120155748.32482-2-fred.w.bacon@gmail.com>
 <DG9Y66TJR6U3.290J0DTI0OT6Z@smile.fr>
In-Reply-To: <DG9Y66TJR6U3.290J0DTI0OT6Z@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aerodyne.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR17MB7558:EE_|SJ0PR17MB5479:EE_
x-ms-office365-filtering-correlation-id: e988cb02-bc62-4a72-c367-08de67ebdb67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|8096899003|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ussXSM7chHcIswdhpkUDaRshWnrB6wgI+rksh+lwMO7Hqhgcww2Pjd2LOkk9?=
 =?us-ascii?Q?n1vqIy+GIgzlaSb/jm6UMqeVHoIxhIqGJ+RVSUMCKu/ovoDdcyuGAgzf+z38?=
 =?us-ascii?Q?cEgsaECr1UH/E7yZROeAberNRfHujL7jWFhLWTfzXFhHnyTJQWUKSIHzz5SU?=
 =?us-ascii?Q?0bV7mzC1jZO388HUaRkHEEF6oO86LwGK56/CStYCkkauEDQAspEaHFA7M5a0?=
 =?us-ascii?Q?PmmuOG/l1KP7mMVQz8TebHLz2PLdbP6LlvjOafcQ5mwDfBvI8SbrouQHRn6H?=
 =?us-ascii?Q?4N0P6HQRChiWsWYbCGH80ccTXlX28eB1Y5kdEQgsuxRLgy3Y+P8Y+5msLWeC?=
 =?us-ascii?Q?L0HiBm/VcC8E8wKt+iUDu0TTkMR5dmB8zcEto78AqF9diDw0rnjPqCYqiYlX?=
 =?us-ascii?Q?17wz2WV/ywJfb00kB6j8h6V1GBMdbNK++T/EVoASr4U1rj7WwXVacALZ7OZl?=
 =?us-ascii?Q?eMsC8UhMaVhXAdl6wBuWpBFXR/BN+hreX+7Bj3WllsMcgh60CJ0OZUf4O4hY?=
 =?us-ascii?Q?9294DeD4bYlBTndNplXwLqziMdReU/g4lozdEagGEPkhzDcn/2PbjR61Tb7u?=
 =?us-ascii?Q?Sl3zP5ZDnCzlP0Z1PEU10xU7jXDtLhhKDbnUs/l90X8cBQVUyLu729C1MIKM?=
 =?us-ascii?Q?l05clgnzKX8VCWS0wiRtcbj918/TSlH+ZOafltZ9rj/Bh5Fr5nmm2C19DVkD?=
 =?us-ascii?Q?UK/a9t6oJ8WUJdLNVpdSu6jRIIQLokd9wlRBPss4XJ9rf9c3U7/tm/+ztE0F?=
 =?us-ascii?Q?Wc+eYWA5i/wVCmQLtrSjazHA/y+52oABDqXWRyr9AX/gXwxpMynwdCPuWxD4?=
 =?us-ascii?Q?nks8qYLheaGz9sSOWOcqutg3uw7yWeRJL69Dy+gPVBQct+BB1YIe8J502K9I?=
 =?us-ascii?Q?a7YzT//jcXkzAVPutjokSrW7a93icBL7bhwdvMOLJxS3pFtWVzDLGDqHXuMu?=
 =?us-ascii?Q?ocwNPFDglx6esT0wFQHeA9sCY79/OAp2UeiM3lwMoDiio7xPU5tpJZADzon2?=
 =?us-ascii?Q?D6wkO2Zv85EamRNs8nYMfv+dza6HnzVoxbCcmJa5WfpB3JhzBKryV07uCjzO?=
 =?us-ascii?Q?Cq7rc+7IdiPjQvvrwtpJtmpEtwlViDfeNwxXGMglKHSYMKkJb6mbgEFZGtNb?=
 =?us-ascii?Q?I0ukBpUL6V0BicffA3WyIplMVudqOmiyoDgN3NxbcSaKv/qejuep3r1NwQTM?=
 =?us-ascii?Q?SkVaZYwUiz+ecXMK3Ax4dr+nBywPLhjqHT5SEQhTGN1D4ngQrwqI1wXK3GM5?=
 =?us-ascii?Q?CeYTlJFtwj7cidgG7+98nFanTTlpxUC7hRwYhJhxzijhWTKsrzNuLaiOTvLP?=
 =?us-ascii?Q?ZPH9eB/Z262rNH0YVNKT2ylHcX8TTSK1WUO2k624olkmGHfiowiUjx6vrzWl?=
 =?us-ascii?Q?qTVYUloEwqwjBMIfAme8exptuZZhXPkSVICWnXhA7uX4lGQkjbQl7ZORoTlN?=
 =?us-ascii?Q?LzSJh8m21QTzV/JgHaKJ1AGC303aNkDNTJtXaJaEbgrGUUOixo7kblWPTwVf?=
 =?us-ascii?Q?Wq1VC6fD0okKlQYsoT9GmfjCx/WpEJRUuBehkU1CJiVJmokhK89of4UBvzdw?=
 =?us-ascii?Q?cTgzwBwg5HNrLw53v1k=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR17MB7558.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003)(7053199007)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?M0hVzbh2YClsw+ebhRYM8K5lZ0Sg6q9yYRc2ZX3+QWJc6UuiyZq0q0SY/fZH?=
 =?us-ascii?Q?GogA3mXfAnNUquNmwz4wtQJi+VZoSYaxPBf4fCMfg7dYcTltQjsOQvLUr9En?=
 =?us-ascii?Q?qsTg5RVRsVvEsJe4kvLbV5CSJP/PvG6Q1HzK7eXlLQRM6uw3J8aa7o927quK?=
 =?us-ascii?Q?3h91LnamqC5dhqe4LcS2jDZOrZhJ1Mtn0wdwhMEsqNl4p9ZH5FXuSA+MAgf3?=
 =?us-ascii?Q?pd75Yi7sG2rV2QfaXyaYiAYVo8XJzcumlRD2Jn3MySUZB6uxBLyq+jAKZ1ZQ?=
 =?us-ascii?Q?XzW5TTWNnddbL/ffTWIKhRu/HK9+vLoqOx2s4VEEscmCaizkAl77m/GEaitM?=
 =?us-ascii?Q?q61KOovqv2FnQld5lp9/SY7RclU8ycEHL64YlNVsEDpTZCkXAB5KDpHK3VFs?=
 =?us-ascii?Q?qatAMQMOaDIEF7h0m+lyQp1OwGhdoBZApdrxX8qdsAcw0qUbEOKXf7ZP+pAg?=
 =?us-ascii?Q?MLYg7n6h8E1feemiwMq29LUlCnrved/QEOTsHYP/we6Og33rpItLqMobDmP8?=
 =?us-ascii?Q?OPDHqbQDTd1ShM/4+NavApeAzMGX4YslPNCo4P2zGe5sMgC27Xm2Efzj/7us?=
 =?us-ascii?Q?mu14+Q3XsmJv+pBt22hSpNgQbsxj50xrNgJcXk9JFbiaaKMzm8iJD63XU3ui?=
 =?us-ascii?Q?jBK5+3zoQJ9t19XrA9f4Vfyswdu2pevm3FeRhNNw+tYzvD0fd6TfAro0oeU8?=
 =?us-ascii?Q?Rn9NuhJmfLu/Rho1Xn7fJl40Xvrv0EUICNyaFTWDcy/zumcUD5VloHxQfFw8?=
 =?us-ascii?Q?E6OKVIsy8lILzDI+6qR9pF6xxd1N4GhdzsHwToc60bedGx2mOHI2FMm+3W8R?=
 =?us-ascii?Q?ArYAHFh3N1wtpEC45Z1tJX+Ck8VZ9U637ZQwPxE4xNF0W0plIdCMsNocahqC?=
 =?us-ascii?Q?nk65GS8K857wCA2/lnVxfV43MtUl/+WTyHCzmYcQypX7ejdawfTeVH/zYD9E?=
 =?us-ascii?Q?3TNMs243HcCWRlMwUVD9JLeawTs3BttEFa8NmHDyGJvjFwp7iimLeT8PqO5x?=
 =?us-ascii?Q?HG5ONkr+r0hSnpB0rv/hlnwgl3Ox4xalpZxSgFvJkBcxgdRjeKD2hcgtz6Dz?=
 =?us-ascii?Q?98O91EIUa16VBHmNVIDlJpVhTO9NQIEGBwKLpEVWM65XOVJuhT65YociGeq3?=
 =?us-ascii?Q?I4mrImgw8OlUKNLqqq4GN4kXHWsf94ST/lyAKoGNmHveq4CCcLMexTHN72ge?=
 =?us-ascii?Q?UrDSLg1OEI38gbq6CVcaf1u72w3eR9fNETHHF7mXXNskwfqYw1Js3yPrgG8y?=
 =?us-ascii?Q?TV0Obva009K/2G57B+/WxcpbKwsN5ZnaQ1d1lOqIK82fXwhmXpNGBF1rco+9?=
 =?us-ascii?Q?auWcI+1fXnnJpI28Gf+Bd1j4lSOs1DlV+8EEeOkUV3rHnBqAPWOaTFod7tmv?=
 =?us-ascii?Q?i9KaSBSJpge/ZnsafjzuNd4OLAuIFmTJSibVBaNx3M3i4e7ZHqxjMY/Cv/ou?=
 =?us-ascii?Q?wUEpy4f0GqeFNjvQMKmiCu6DmZ9a96eiDvWql9UofQ69IRvL0fiN7s9v1t1/?=
 =?us-ascii?Q?bojpuObkxzeaUpGT8NbVkrqD1I9eFHMfYoL+G3SelNE27w6XET4cdGWcOxaL?=
 =?us-ascii?Q?4wTlpormHpkDlMdUUmqBl58lGkNPynZJEebhtmqU64IZ7P3j9tgY718wzp+T?=
 =?us-ascii?Q?kxwl/Fpbl/iRSD/dLPcAyBKG+CRAoR+6g09fuVlu5VCad0ZAPn0jer7RN7uE?=
 =?us-ascii?Q?qzzLoEVCFFSiIgNIvX3MfrXCfuA2ixEb0cetP7KM/E1EzPFM?=
MIME-Version: 1.0
X-OriginatorOrg: aerodyne.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR17MB7558.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e988cb02-bc62-4a72-c367-08de67ebdb67
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 14:59:42.8902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 763766d9-a44c-43ef-9c4d-d95c9454f58b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l6gn78ybMW9PaqQPeXiOVST7+N07o1pbWobiJXFEuNNYwvT3OvLIh52EO+uMbEzEgr+hAG14X5TGLyYOVUJuAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB5479
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DS0PR17MB755870729CFD41A735A0EDA6DB65ADS0PR17MB7558namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 15:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230808

--_000_DS0PR17MB755870729CFD41A735A0EDA6DB65ADS0PR17MB7558namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. I'll keep this information in mind if I ever need =
to submit something else.

Fred
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Sunday, February 8, 2026 5:52 PM
To: fred.w.bacon@gmail.com <fred.w.bacon@gmail.com>; openembedded-core@list=
s.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Fred Bacon <bacon@aerodyne.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/1] lighttpd: Fix trailing slash =
on files in mod_dirlisting

Hello,

Thanks for the patch, it looks good!
Just 2 notes that I fixed:

On Tue Jan 20, 2026 at 4:57 PM CET, Fred Bacon via lists.openembedded.org w=
rote:
> From: Fred Bacon <fred.w.bacon@gmail.com>
>
> Fixes [YOCTO #16128]
>
> Backport of upstream bug fix from lighttpd-1.4.75. Version 1.4.74 introdu=
ced a bug that
> would append a trailing slash to files in a directory listing. When the u=
ser attempts to
> download one of these files, the web browser could not save the file with=
 a trailing
> slash. As a consequence, every web browser tested would generate a random=
 character string
> for the saved file name.
>
> Upstream-Status: Backport [1.4.75]

That line in the commit message is useless, I removed it.

> Signed-off-by: Fred Bacon <bacon@aerodyne.com>
> ---
>  .../lighttpd/0001-mod_dirlisting.patch        | 48 +++++++++++++++++++
>  .../lighttpd/lighttpd_1.4.74.bb               |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirl=
isting.patch
>
> diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.=
patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch
> new file mode 100644
> index 0000000000..8afdc1ecd0
> --- /dev/null
> +++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patch
> @@ -0,0 +1,48 @@
> +From 3d400ce06dcb950a61363f87330324db244f4bac Mon Sep 17 00:00:00 2001
> +From: Glenn Strauss <gstrauss@gluelogic.com>
> +Date: Thu, 29 Feb 2024 20:59:57 -0500
> +Subject: [PATCH] [mod_dirlisting] fix suffix display of '/' on file (fix=
es
> + #3242)
> +
> +fix incorrect suffix display of '/' on files
> +
> +(regression in lighttpd 1.4.74)
> +
> +(thx guy)
> +
> +Upstream-Status: Backport [1.4.75]

We usually use the specific commit URL in patch. I replaced by:
Upstream-Status: Backport [https://us-east-2.protection.sophos.com?d=3Dgith=
ub.com&u=3DaHR0cHM6Ly9naXRodWIuY29tL2xpZ2h0dHBkL2xpZ2h0dHBkMS40L2NvbW1pdC8z=
ZDQwMGNlMDZkY2I5NTBhNjEzNjNmODczMzAzMjRkYjI0NGY0YmFj&i=3DNWZlMzY0NmMyMDVjNj=
QwZTE1YzFlYTMy&t=3DcWQ0MFJiMld1WWhnN0M5TDJMSXVIcGNlWmRNWFkxM2R0SHFLRnUyQWxO=
dz0=3D&h=3D61b32fbd7bc247d290e51fb0840c81da&s=3DAVNPUEhUT0NFTkNSWVBUSVagGCZ=
nv_3_2OOO_hLXi6h9pyzgZd-ebE3V8DGhWahvpQ]
> +
> +References:
> +[1] https://us-east-2.protection.sophos.com?d=3Dlighttpd.net&u=3DaHR0cHM=
6Ly9yZWRtaW5lLmxpZ2h0dHBkLm5ldC9pc3N1ZXMvMzI0Mg=3D=3D&i=3DNWZlMzY0NmMyMDVjN=
jQwZTE1YzFlYTMy&t=3DWWlheW1sd0pPN0JJN3dnUCtwdzRFNU03Ny84ejJuV1JUWEJJTS8zWDJ=
BRT0=3D&h=3D61b32fbd7bc247d290e51fb0840c81da&s=3DAVNPUEhUT0NFTkNSWVBUSVagGC=
Znv_3_2OOO_hLXi6h9pyzgZd-ebE3V8DGhWahvpQ
> +
> +Signed-off-by: Glenn Strauss <gstrauss@gluelogic.com>
> +---
> + src/mod_dirlisting.c | 11 ++++++++++-
> + 1 file changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/mod_dirlisting.c b/src/mod_dirlisting.c
> +index a3432211..2686cd3e 100644
> +--- a/src/mod_dirlisting.c
> ++++ b/src/mod_dirlisting.c
> +@@ -1022,10 +1022,19 @@ static void http_list_directory_dirname(buffer *=
 const out, const dirls_entry_t
> +     buffer_append_string_len(out, CONST_STR_LEN("</td><td class=3D\"s\"=
>- &nbsp;</td><td class=3D\"t\">Directory</td></tr>\n"));
> + }
> +
> ++static void http_list_file_ent(buffer * const out, const dirls_entry_t =
* const ent, const char * const name) {
> ++    buffer_append_string_encoded(out, name, ent->namelen, ENCODING_REL_=
URI_PART);
> ++    buffer_append_string_len(out, CONST_STR_LEN("\">"));
> ++    buffer_append_string_encoded(out, name, ent->namelen, ENCODING_MINI=
MAL_XML);
> ++    buffer_append_string_len(out, CONST_STR_LEN("</a></td><td class=3D\=
"m\">"));
> ++
> ++    http_list_directory_mtime(out, ent);
> ++}
> ++
> + static void http_list_directory_filename(buffer * const out, const dirl=
s_entry_t * const ent, const char * const name, handler_ctx * const hctx) {
> +     buffer_append_string_len(out, CONST_STR_LEN("<tr><td class=3D\"n\">=
<a href=3D\""));
> +
> +-    http_list_directory_ent(out, ent, name);
> ++    http_list_file_ent(out, ent, name);
> +
> +     const buffer *content_type;
> +   #if defined(HAVE_XATTR) || defined(HAVE_EXTATTR) /*(pass full path)*/
> +
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb b/meta/rec=
ipes-extended/lighttpd/lighttpd_1.4.74.bb
> index 7460d3d716..e48fd16514 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "https://us-east-2.protection.sophos.com?d=
=3Dlighttpd.net&u=3DaHR0cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWx=
lYXNlcy0xLjQueC9saWdodHRwZC0ke1BWfS50&i=3DNWZlMzY0NmMyMDVjNjQwZTE1YzFlYTMy&=
t=3DdHlnZy81SyszMXNrclVhaVZaWTFFN3VndkVVWGllenM0ZStiVHYvNHY1VT0=3D&h=3D61b3=
2fbd7bc247d290e51fb0840c81da&s=3DAVNPUEhUT0NFTkNSWVBUSVagGCZnv_3_2OOO_hLXi6=
h9pyzgZd-ebE3V8DGhWahvpQ
>             file://index.html.lighttpd \
>             file://lighttpd.conf \
>             file://lighttpd \
> +           file://0001-mod_dirlisting.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "5c08736e83088f7e019797159f306e88ec729abe976dc98f=
b3bed71b9d3e53b5"

--
Yoann Congal
Smile ECS

Caution:This message originated from outside of Aerodyne. Do not follow lin=
ks or open files unless you are confident that this message is legitimate.

--_000_DS0PR17MB755870729CFD41A735A0EDA6DB65ADS0PR17MB7558namp_
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
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the feedback. I'll keep this information in mind if I ever need =
to submit something else.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Fred</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Sunday, February 8, 2026 5:52 PM<br>
<b>To:</b> fred.w.bacon@gmail.com &lt;fred.w.bacon@gmail.com&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;<br>
<b>Cc:</b> Fred Bacon &lt;bacon@aerodyne.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH 1/1] lighttpd: Fix trailing=
 slash on files in mod_dirlisting</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello,<br>
<br>
Thanks for the patch, it looks good!<br>
Just 2 notes that I fixed:<br>
<br>
On Tue Jan 20, 2026 at 4:57 PM CET, Fred Bacon via lists.openembedded.org w=
rote:<br>
&gt; From: Fred Bacon &lt;fred.w.bacon@gmail.com&gt;<br>
&gt;<br>
&gt; Fixes [YOCTO #16128]<br>
&gt;<br>
&gt; Backport of upstream bug fix from lighttpd-1.4.75. Version 1.4.74 intr=
oduced a bug that<br>
&gt; would append a trailing slash to files in a directory listing. When th=
e user attempts to<br>
&gt; download one of these files, the web browser could not save the file w=
ith a trailing<br>
&gt; slash. As a consequence, every web browser tested would generate a ran=
dom character string<br>
&gt; for the saved file name.<br>
&gt;<br>
&gt; Upstream-Status: Backport [1.4.75]<br>
<br>
That line in the commit message is useless, I removed it.<br>
<br>
&gt; Signed-off-by: Fred Bacon &lt;bacon@aerodyne.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../lighttpd/0001-mod_dirlisting.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 48 +++++++++++++++++++<br>
&gt;&nbsp; .../lighttpd/lighttpd_1.4.74.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 49 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-=
mod_dirlisting.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisti=
ng.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8afdc1ecd0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirlisting.patc=
h<br>
&gt; @@ -0,0 +1,48 @@<br>
&gt; +From 3d400ce06dcb950a61363f87330324db244f4bac Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Glenn Strauss &lt;gstrauss@gluelogic.com&gt;<br>
&gt; +Date: Thu, 29 Feb 2024 20:59:57 -0500<br>
&gt; +Subject: [PATCH] [mod_dirlisting] fix suffix display of '/' on file (=
fixes<br>
&gt; + #3242)<br>
&gt; +<br>
&gt; +fix incorrect suffix display of '/' on files<br>
&gt; +<br>
&gt; +(regression in lighttpd 1.4.74)<br>
&gt; +<br>
&gt; +(thx guy)<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [1.4.75]<br>
<br>
We usually use the specific commit URL in patch. I replaced by:<br>
Upstream-Status: Backport [<a href=3D"https://us-east-2.protection.sophos.c=
om?d=3Dgithub.com&amp;u=3DaHR0cHM6Ly9naXRodWIuY29tL2xpZ2h0dHBkL2xpZ2h0dHBkM=
S40L2NvbW1pdC8zZDQwMGNlMDZkY2I5NTBhNjEzNjNmODczMzAzMjRkYjI0NGY0YmFj&amp;i=
=3DNWZlMzY0NmMyMDVjNjQwZTE1YzFlYTMy&amp;t=3DcWQ0MFJiMld1WWhnN0M5TDJMSXVIcGN=
lWmRNWFkxM2R0SHFLRnUyQWxOdz0=3D&amp;h=3D61b32fbd7bc247d290e51fb0840c81da&am=
p;s=3DAVNPUEhUT0NFTkNSWVBUSVagGCZnv_3_2OOO_hLXi6h9pyzgZd-ebE3V8DGhWahvpQ">h=
ttps://us-east-2.protection.sophos.com?d=3Dgithub.com&amp;u=3DaHR0cHM6Ly9na=
XRodWIuY29tL2xpZ2h0dHBkL2xpZ2h0dHBkMS40L2NvbW1pdC8zZDQwMGNlMDZkY2I5NTBhNjEz=
NjNmODczMzAzMjRkYjI0NGY0YmFj&amp;i=3DNWZlMzY0NmMyMDVjNjQwZTE1YzFlYTMy&amp;t=
=3DcWQ0MFJiMld1WWhnN0M5TDJMSXVIcGNlWmRNWFkxM2R0SHFLRnUyQWxOdz0=3D&amp;h=3D6=
1b32fbd7bc247d290e51fb0840c81da&amp;s=3DAVNPUEhUT0NFTkNSWVBUSVagGCZnv_3_2OO=
O_hLXi6h9pyzgZd-ebE3V8DGhWahvpQ</a>]<br>
&gt; +<br>
&gt; +References:<br>
&gt; +[1] <a href=3D"https://us-east-2.protection.sophos.com?d=3Dlighttpd.n=
et&amp;u=3DaHR0cHM6Ly9yZWRtaW5lLmxpZ2h0dHBkLm5ldC9pc3N1ZXMvMzI0Mg=3D=3D&amp=
;i=3DNWZlMzY0NmMyMDVjNjQwZTE1YzFlYTMy&amp;t=3DWWlheW1sd0pPN0JJN3dnUCtwdzRFN=
U03Ny84ejJuV1JUWEJJTS8zWDJBRT0=3D&amp;h=3D61b32fbd7bc247d290e51fb0840c81da&=
amp;s=3DAVNPUEhUT0NFTkNSWVBUSVagGCZnv_3_2OOO_hLXi6h9pyzgZd-ebE3V8DGhWahvpQ"=
>
https://us-east-2.protection.sophos.com?d=3Dlighttpd.net&amp;u=3DaHR0cHM6Ly=
9yZWRtaW5lLmxpZ2h0dHBkLm5ldC9pc3N1ZXMvMzI0Mg=3D=3D&amp;i=3DNWZlMzY0NmMyMDVj=
NjQwZTE1YzFlYTMy&amp;t=3DWWlheW1sd0pPN0JJN3dnUCtwdzRFNU03Ny84ejJuV1JUWEJJTS=
8zWDJBRT0=3D&amp;h=3D61b32fbd7bc247d290e51fb0840c81da&amp;s=3DAVNPUEhUT0NFT=
kNSWVBUSVagGCZnv_3_2OOO_hLXi6h9pyzgZd-ebE3V8DGhWahvpQ</a><br>
&gt; +<br>
&gt; +Signed-off-by: Glenn Strauss &lt;gstrauss@gluelogic.com&gt;<br>
&gt; +---<br>
&gt; + src/mod_dirlisting.c | 11 ++++++++++-<br>
&gt; + 1 file changed, 10 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/mod_dirlisting.c b/src/mod_dirlisting.c<br>
&gt; +index a3432211..2686cd3e 100644<br>
&gt; +--- a/src/mod_dirlisting.c<br>
&gt; ++++ b/src/mod_dirlisting.c<br>
&gt; +@@ -1022,10 +1022,19 @@ static void http_list_directory_dirname(buffe=
r * const out, const dirls_entry_t<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; buffer_append_string_len(out, CONST_STR_LEN(=
&quot;&lt;/td&gt;&lt;td class=3D\&quot;s\&quot;&gt;- &amp;nbsp;&lt;/td&gt;&=
lt;td class=3D\&quot;t\&quot;&gt;Directory&lt;/td&gt;&lt;/tr&gt;\n&quot;));=
<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static void http_list_file_ent(buffer * const out, const dirls_entry=
_t * const ent, const char * const name) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; buffer_append_string_encoded(out, name, ent-&gt;n=
amelen, ENCODING_REL_URI_PART);<br>
&gt; ++&nbsp;&nbsp;&nbsp; buffer_append_string_len(out, CONST_STR_LEN(&quot=
;\&quot;&gt;&quot;));<br>
&gt; ++&nbsp;&nbsp;&nbsp; buffer_append_string_encoded(out, name, ent-&gt;n=
amelen, ENCODING_MINIMAL_XML);<br>
&gt; ++&nbsp;&nbsp;&nbsp; buffer_append_string_len(out, CONST_STR_LEN(&quot=
;&lt;/a&gt;&lt;/td&gt;&lt;td class=3D\&quot;m\&quot;&gt;&quot;));<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; http_list_directory_mtime(out, ent);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static void http_list_directory_filename(buffer * const out, const d=
irls_entry_t * const ent, const char * const name, handler_ctx * const hctx=
) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; buffer_append_string_len(out, CONST_STR_LEN(=
&quot;&lt;tr&gt;&lt;td class=3D\&quot;n\&quot;&gt;&lt;a href=3D\&quot;&quot=
;));<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; http_list_directory_ent(out, ent, name);<br>
&gt; ++&nbsp;&nbsp;&nbsp; http_list_file_ent(out, ent, name);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const buffer *content_type;<br>
&gt; +&nbsp;&nbsp; #if defined(HAVE_XATTR) || defined(HAVE_EXTATTR) /*(pass=
 full path)*/<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb b/meta/=
recipes-extended/lighttpd/lighttpd_1.4.74.bb<br>
&gt; index 7460d3d716..e48fd16514 100644<br>
&gt; --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb<br>
&gt; +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.74.bb<br>
&gt; @@ -14,6 +14,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://us-east-2=
.protection.sophos.com?d=3Dlighttpd.net&amp;u=3DaHR0cDovL2Rvd25sb2FkLmxpZ2h=
0dHBkLm5ldC9saWdodHRwZC9yZWxlYXNlcy0xLjQueC9saWdodHRwZC0ke1BWfS50&amp;i=3DN=
WZlMzY0NmMyMDVjNjQwZTE1YzFlYTMy&amp;t=3DdHlnZy81SyszMXNrclVhaVZaWTFFN3VndkV=
VWGllenM0ZStiVHYvNHY1VT0=3D&amp;h=3D61b32fbd7bc247d290e51fb0840c81da&amp;s=
=3DAVNPUEhUT0NFTkNSWVBUSVagGCZnv_3_2OOO_hLXi6h9pyzgZd-ebE3V8DGhWahvpQ<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://index.html.lighttpd">file://index.html.lighttpd</a> \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://lighttpd.conf">file://lighttpd.conf</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://lighttpd">file://lighttpd</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-mod_dirlisting.patch">file://0001-mod_dirlisting.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;5c08736e83088f7e019797159f306e88ec7=
29abe976dc98fb3bed71b9d3e53b5&quot;<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
Caution:This message originated from outside of Aerodyne. Do not follow lin=
ks or open files unless you are confident that this message is legitimate.<=
br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR17MB755870729CFD41A735A0EDA6DB65ADS0PR17MB7558namp_--

