Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A699C0218C
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 16:41:34 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web11.20145.1737477684738113103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 08:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=PMkpflrn;
 spf=pass (domain: siemens.com, ip: 40.107.21.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMTjPq3m+9IjRj2oX//USsI8icnpg/sDMRxHjjFzyk/MHutHPv8NNbr/Im+iyzBi+2NRirpSvi1vhTDRkPnrlfQ2ZMVxzSliV8qSDtyK2Zrz8J7+MXcM8sW7B19Bq9LNKfzKNjTAqb3PEXZN2YDFY3D0cSWL9i/eisQlVf1Xem901uIAKx78vLyZMd/drHf5zRjJEkqHy3phPd95LAobMlYrZMOaJCbXclvf21R1NhE6Z5DWvLVq8fMx7wNIvoILFqzIlqeOLYU6S3dyqnmoXjNFCaLBWIqusGWXil2IPc4B1HNoDbtTmIP65yqVutEMb1/mDN69eAAswieQzs5K8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAq/wsPcY4e1T3Zr5R7mJ6sx5+f5CYi0WA44+3+ivMI=;
 b=GISTftZNVk1TxNzFEafITVK+9aJVdisAoJz0uVOcWfePoqlCt9WWJdMQJDCC/y43Aqzq3xd1HE7mrAL0n2qMq6xOykffk2AmxxW0ZFRqm+29Pf2QN7N06tag0QGrzrQVZgLm7whT8aqMf5NDBJNuEvWyFTjHzaLjjmVUGCUJyp2aRvZnZFBomMSRyv3ihAwkyL2nG6GgGfkXxTZ9OGwskdAeNn2hJfr2xkz629BGiZ00nYYrrfekxxxMpULnXfSFZ4s6iSEUp8DeuDGBEzFMuO7Wp/BkQ8kuIslsox6Bbq3clxnETbjT0BdeRxxJeLe0Zp4q5HWDLseXc9v6oKuRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAq/wsPcY4e1T3Zr5R7mJ6sx5+f5CYi0WA44+3+ivMI=;
 b=PMkpflrnxkJt8OC34XTjqPYpSbBbNhFQA1/33EhB7317R0NkyYYwlGmMAxOsE6iOctFRlwMRXwAEUbPdPIEUGQinfgJZ3OOGMrMRPSgqgtcb1baIEd2dSkjSQiromH9hALCrANPKmfA07RLOx47SbS6eJTOtpS4DWzVHQk5gEd7I/eTGq3E0OMGutTn1o+e46se/w1f+dmmSKc+EtMBfAuLcEsuWFuPsdpVni5e7+Nv15UkivWKEC92c/i2Cjp1irSMqy/JH2cVYDjeF3EILdp44pTzWDW44E4lHPVLHOPzPBY7B6TfN1fx8M/JzqZeCJFcdqsD9MRL4YA3fx5ktSw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM0PR10MB3537.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.12; Tue, 21 Jan
 2025 16:41:21 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8377.009; Tue, 21 Jan 2025
 16:41:21 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH 1/1] wpa-supplicant: Add CVE id to
 CVE-2024-3596_00.patch
Thread-Topic: [OE-core] [scarthgap][PATCH 1/1] wpa-supplicant: Add CVE id to
 CVE-2024-3596_00.patch
Thread-Index: AQHbawCrgG+kVuXXg0GB1bn1vk+qwbMhcIoA
Date: Tue, 21 Jan 2025 16:41:21 +0000
Message-ID: 
 <AS1PR10MB569799A22EA3F64E73F632B0FDE62@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1737352688.git.liezhi.yang@windriver.com>
 <93ea4608b9ed81e9cd3d34030fb74895598d06a1.1737352688.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <93ea4608b9ed81e9cd3d34030fb74895598d06a1.1737352688.git.liezhi.yang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9a40cb78-0879-4a49-af36-c2d160ce1990;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-21T16:41:09Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM0PR10MB3537:EE_
x-ms-office365-filtering-correlation-id: 3d49cb22-b07a-4c66-ac2a-08dd3a3a6fa6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?t8fAjEGjEH8K62Lcfgu9WBdrI/0ti03O4xaGrR7iYv8yGtqYTupJYFmkTeN5?=
 =?us-ascii?Q?krVa5CiYP21qDMgrWXvoS4FXazz/wTTbvaM0RpFXhzXEku9BNX6omEDUBuRX?=
 =?us-ascii?Q?lhahFl8jiS67rBBguHL0i1nOUfdvIbS8KrSfmRSkCRsSgepSfMsSehLq5ARI?=
 =?us-ascii?Q?S89o+Aee9D2jA2vKJy7lckVlAWRb6Id2IAkUrZqPBRTosqTIYTOmaXgndNu4?=
 =?us-ascii?Q?uLMSUfq5xw5uSRyychCQ/BoGGlvslMSbN+7xa8kD1CIZYnC7RxhVncCm3KLN?=
 =?us-ascii?Q?fygizPin9z/gu64COpl0EtDXUFV1UKSvk48LKPWGbulFTr0SB41xXL2ZSA4w?=
 =?us-ascii?Q?Od4snpWQPgFSg/jF66NIxmGAg4gGN7OZWbZwEFB5tBO2HC5x/2YDK6vRsUKv?=
 =?us-ascii?Q?omlerx2T0k73yZI0nlyklqn9s0CfWiIc50bMpkPI8yRR6cO4n4dCWyiy5MJI?=
 =?us-ascii?Q?ZFtHVt0+gF/ShWIVoxDaKsqWD6rjVHbxV6HnnTBLTxDd3K82MIBHLTqtiiDd?=
 =?us-ascii?Q?OWG7Tf5fs7p/mPqvW6GIKLvNdHH0BzVjgghhsq42U6P90twOkGuTcxljLPZv?=
 =?us-ascii?Q?2rg2Yvo/Yrh5UpQLHGvzp7x5Mu+jDVIfCUWehiHkygMFyJe6xWOxaHfJiEBZ?=
 =?us-ascii?Q?dNXHmXs9g3U0vJzO7x/3lttXRH0Mwh/Uo/I00Ci0ZRTTWmi8I0rJmsXjfpHt?=
 =?us-ascii?Q?/2z68t6Kl08u48PBhWpMmSuLx+7Tt61ZRg3XlT7TvqHQyCAzf6Ci1eA40HMw?=
 =?us-ascii?Q?PuTuSLHTvOPFfQVq/2iMkhNGbT7I0SEJjTBtqg2y998pVRXOydTBTvUnrS7o?=
 =?us-ascii?Q?lpuNx2GH3fQrgoMa0cU+6tadK75rterNhZbkq/dwmZG7ut8hXJWTKL/bTc5D?=
 =?us-ascii?Q?p8LJO4+riCzrwkyPrTlaogwx7E3pXbAALX0XALI6y73cjD+sk4FU/iKBCGod?=
 =?us-ascii?Q?4w3R0vEUehmxcDhMbI+Jc5/OPr/yT8Pj15nv3hnr09FqzE2ujq8ZwJbltwBs?=
 =?us-ascii?Q?FWmiZM76QMEBIjLNCm25GvIdwWcwRSG+FcJ51jr+BE5hFg5cxc8+DPXQCoBf?=
 =?us-ascii?Q?cjiyNSymjH+GecJS9fbwMp+9sruXMX9Y6o4za8xJigPRN7xQVYsuZ95mTaTB?=
 =?us-ascii?Q?AJ/SdR+zaI3A95fXWKY8pwqSDVE7hmTc5LSF4762CxfpliainPjvvCZEbheA?=
 =?us-ascii?Q?O6RzyNqmzrJG3dChdddJTpKomdv1VofxwMlCqtSrk5LDeeFBbvJ0vqjM5MXw?=
 =?us-ascii?Q?Ijr6pCPg673LvqLOZVIxOrB5qtidU2xhfDnWsMrdzT541hB1t1re3M37uh4h?=
 =?us-ascii?Q?JhY93iiaASW5BzmJGS6/vm8+uX1Lkm6MbbAvfNkpj97cCDTDKAZX8fJInQcr?=
 =?us-ascii?Q?UOPMTo2CouDbjGuU0ZpDdaq+dGY0?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jY99j5eLFw+ZOsn6AIcnLwD2kaSLbGYqdB6ON7UHl7+aKTpFmy0j/+YnO4Q0?=
 =?us-ascii?Q?YZcmHjsCn1jJmhaf29yx/H1+72fVc0jUjEAkSW5iVZ8aLVT0f12MlM4J7Dq7?=
 =?us-ascii?Q?Mwk+hWMsMu5Nhaygs9aXcilVPEG5LI2//xAvqa4O5TtKJHHLXX2VuZDx+z5G?=
 =?us-ascii?Q?afysgz60qZN4qky28V1C+HtsFd0jKKRNafZ5IbwSzKHZmVwNfoX9zI1d/Zud?=
 =?us-ascii?Q?H3m/tuJhVnscA7sl/rSYfIV2uxv+OmsvpwrxUdTqOuNTSGBePxIwzLAHQXEI?=
 =?us-ascii?Q?T6CZZIBfozVP/mqmCP+vAIluKjBcxsEubsVpBAsw1yXR9Z9WYw/vSI+soown?=
 =?us-ascii?Q?xmTaTXFSjobAYt6DD6DQJPn+IRryChc3IVQqhXZWe6fYPTfsQmie77s9GyxC?=
 =?us-ascii?Q?1CO3wMrkH3QqX3s92CBax5i1NYUOhzLcXGLG0YuzczGAXy9DvA5mmG3hSZOX?=
 =?us-ascii?Q?cUimUCmBnYAyXO62v2a1wFsnwvcTMD4/4LgAfYBJilHYh8CUb+dgCdJb5Jtn?=
 =?us-ascii?Q?THJWQxVKFibPM+zZ3Fdbql7/Bn/l3apfL7cXS0zYIhkJkNZPZOqWC7LtU1kY?=
 =?us-ascii?Q?zzUpN/oc0ZJRmr8Ed6nLvaF0/uBl8q3qGWdeVFeO2D1gnzL7Z0sdIoU/0iM1?=
 =?us-ascii?Q?j1pbbNqpcTY8MVLO5ez0hDd7LcWJJ4S7uTVtnTo7cI9Bxpp1+tnkbCJw6Jp2?=
 =?us-ascii?Q?jTUqkWG8f7djdgC+MhsIfvn5hHeSA3/mdkc1ub0pVHp9emVyjpkr0SQQ+vfQ?=
 =?us-ascii?Q?+Nd42uFzipSkyK5xZH03/0MrfWQ92n2PghHSaBraBurpz1KZEiquMr480fGm?=
 =?us-ascii?Q?IZdtoZ5JCsW1Q+Fl6OCb7amoYV7jkst6HuJ+bWYyjgIKujLQmDLkG5ZY6oHe?=
 =?us-ascii?Q?1beG0DuGYYtBMEbgzZckMG1jfGfCMRJO19hlKe16IpVXlduUzawHo+6ZMTS0?=
 =?us-ascii?Q?fFs/ZxMzLoGUPkJ0rToCIpfgRXarH0gwlHKEvFVujx4+8oIzqJ39u9LBOtP9?=
 =?us-ascii?Q?XLHhrjhvK2UWBZUb/O7J66EO69iloCqOueLmrOyqltopj6k4G/0Fm8u/8j7o?=
 =?us-ascii?Q?nsrT/9cG3ky4eE/xVUgxF1fSYSQmIRMc3fYUFXd3kaD4cyZzyC0B0eO6wHFB?=
 =?us-ascii?Q?aTReB0BurGyWRXDXr9q6RYNV7/q8matRxvN51T5yvYT2thN+4CZVO0Lk3Hl6?=
 =?us-ascii?Q?K8pkLH7Hu2Gwx30pjZon9keIoQS5/Fdyb1FpMy9tbWoztTGB36R6kk36at3z?=
 =?us-ascii?Q?o20MCW79Kv9y9PDcgG3awC25Tr+dz5fxbf679n5TjfMM5tdo8yCs2yNkab7N?=
 =?us-ascii?Q?UyubFB9vEMKvAGbMjvpB2vHeJun8AOAmE6Mnwg1RMA1UBfw/PzUYrysbOAmx?=
 =?us-ascii?Q?BWMoc/OPU0TTqFMf+V/OLWYik0BKGOoZgfquypsvoUv3depUq19Mh1QGg14D?=
 =?us-ascii?Q?tTc7VIqiGT0N4mW6IGJfEO31PUGo5pg3e995OovsHOI83LfaqydFIEtjEkZH?=
 =?us-ascii?Q?KGoN3A9uyHFKEduAVza/nomE0botoH+szYH77fqsW3zVIKsutwd2tnryX2F4?=
 =?us-ascii?Q?1812xyhQkB+Vzcw2Vxt8ndp/hkdD3fnX270gLrq1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d49cb22-b07a-4c66-ac2a-08dd3a3a6fa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 16:41:21.2042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ShD6341V+RHmQ/VI63NUmstEsShWQtJpjafJ1OMRoKdqXkII78wbx+txmRCNt/ITIIiVU3qOz/+PE5OzSS+6Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3537
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 16:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210105

This is not correct.

The patch CVE-2024-3596_00 does not fix any part of that CVE.
As the commit message says, it's a style commit so that real CVE patches ap=
ply cleanly.
If it bothers you that it has CVE in filename but no CVE, maybe rename it i=
nstead adding incorrect tag?

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Robert Yang via
> lists.openembedded.org
> Sent: Monday, January 20, 2025 7:01
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [scarthgap][PATCH 1/1] wpa-supplicant: Add CVE id to C=
VE-
> 2024-3596_00.patch
>=20
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../wpa-supplicant/wpa-supplicant/CVE-2024-3596_00.patch         | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-=
2024-
> 3596_00.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-
> supplicant/CVE-2024-3596_00.patch
> index 7a8197d2b4..58e1327f2b 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-
> 3596_00.patch
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2024-
> 3596_00.patch
> @@ -6,6 +6,7 @@ Subject: [PATCH 1/9] ieee802_11_auth: Coding style cleanu=
p -
> no string
>=20
>  Signed-off-by: Jouni Malinen <j@w1.fi>
>=20
> +CVE: CVE-2024-3596
>  Upstream-Status: Backport
> [https://w1.fi/cgit/hostap/commit/?id=3D945acf3ef06a6c312927da4fa055693db=
ac
> 432d1]
>  Signed-off-by: Peter Marko <peter.marko@siemens.com>
>  ---
> --
> 2.44.1


