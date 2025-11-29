Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE447CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 14:24:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15149.1764426262362938953
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 06:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D9H4p8wg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATDdWf61577171
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 06:24:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=rqoYxwN9dW92J532gdR1TZ3d9LAEcE4hxfM2lji+v0E=; b=
	D9H4p8wgwfH1XbjrkXTlKPq1oOt4FOxuda1GME1bDoHqh/7xufyvELdbHO/MGHhg
	eW+1AW4BJ9aMRddeoAeFB1F8re6lL6JjOCwHhymVSimQWoHF4L3AmphoeYNR9RNm
	5AfWiHasVLxvxwxtaMW7lLVzRJWx1Od/0dhYaWXj3cDahJLW/71ykPPM9pkN4Hso
	aux8Nza2IlYskBi+gQG7wrXLmK2Su2Pm8mvJuyoRK938SlD7lsxQQbFeJTd3wkYn
	5QecDPfS9YU9rtpZgFibv14CeQm8RcCG6m2wU31tbri9h8f7Wj/bqSLiRjVToZkS
	3P155X8P6y4T+GPEfgGCdg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013014.outbound.protection.outlook.com [40.93.196.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05g5bm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 29 Nov 2025 06:24:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8ZQUCgMhdVk5y7GxdKPj7QFLBBVW7AOYjTtZPkfaeo0hVi1MjQt8VAPzCtDUzZ0epVk+8A2LXBAKF3nx0dEWbvlakNLOIcF7FYHvIPEK1n9CF3teSjH8yPTruniu9e8EbTpYSARk7dSfe4mMNlPyJ+urYELozqW2xStDvhU0mUC16ArQwJ12T/kEKRzJcOzrkjl+v7PSPuSWE/VsE9al9ddVnOblXMFJAWcPPPwrT8+HB1JBhrkOx8sLikF3dIrC67G6n2uWUMRophzjFOUewUJZ1fnwCO96IL0l5wpSNivQIEdKLNWpLI7QOMaqpONqmenBeDEmsnVS0J0WYKViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqoYxwN9dW92J532gdR1TZ3d9LAEcE4hxfM2lji+v0E=;
 b=AKAJs2ZDeEGuNXxQahXpdYRhBqP5ZbgSyyeifryQPidZGRBEz0a//Z1dcykr0ueOpL4M2kVywfNBOmHf3Q27YUo7SaTWTg/mVf5D/qXgtAVYJf41PmIVZu1OxHu4S2BznQyAC0C8DjcVEu5KMGajDdUSSMXTC6tk01RV9tCiGC0991WBCS9FP8yhFc5VRomD6VFiWnkJmaAaLbIHbXE4FbErHGv771UleBTpAcG4duudLzZhOzQGx4lB0t7IUuCl3Sj17t/9JcYPPe4PXD7nzVZueo3XN7XTl+gC8IlJrHspq+HJ5s3vGpePTxU5BZI6vTJJN+rxZ93D0V7g82cA8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 14:24:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 14:24:18 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "alex@linutronix.de"
	<alex@linutronix.de>
Subject: RE: [OE-core][PATCH V2 2/2] rootfs-postcommands.bbclass: remove the
 '\n' in 'no password' banner
Thread-Topic: [OE-core][PATCH V2 2/2] rootfs-postcommands.bbclass: remove the
 '\n' in 'no password' banner
Thread-Index: AQHcYOPysEXtuIk/2Eard+6GvobY6rUJo9gAgAALtGA=
Date: Sat, 29 Nov 2025 14:24:18 +0000
Message-ID: 
 <CO6PR11MB5602BEEA50CA8BD7C8854249EDDDA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251129035436.249679-1-Qi.Chen@windriver.com>
 <20251129035436.249679-2-Qi.Chen@windriver.com>
 <CANNYZj83Sda+1Ycoiwdzxdw1y17zK=AiuxQ5a89H9RUqK+OMew@mail.gmail.com>
In-Reply-To: 
 <CANNYZj83Sda+1Ycoiwdzxdw1y17zK=AiuxQ5a89H9RUqK+OMew@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=03e28db1-27cc-469e-97ce-0025734088f3;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-29T14:01:31Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SA0PR11MB4735:EE_
x-ms-office365-filtering-correlation-id: 2478168d-823e-48dd-6b98-08de2f52fb66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?4oh91ZAgF9aPBKiB0nX/5wO2LfqTcoFeqVQ1gIU822WTjZFL+cjdMraXVLEz?=
 =?us-ascii?Q?UGHACgRHdDQJ1vUQaCT0A8tTDmyrvyMmC4/hNw3mS2GXiXidfKpPmz35Gez1?=
 =?us-ascii?Q?OuoqmeNLaWnmcetplfALvw3qwxCqymBFmaSMFhynhsiUKhPLOFM0GKhuHzES?=
 =?us-ascii?Q?GnikpTkoZaT9PaDVD+l+yJSY1Nk1dyx2v5PGQBRVq3PoPvhFZpX9J6fs2SpU?=
 =?us-ascii?Q?gtKP29Y89e6uVqpEcstptCwyrlD3+/q0z0GMHQ+e9j8LgtJZg3f2oN1a3x8N?=
 =?us-ascii?Q?o0QJBE8/dFoOq7EzMnPYgoOzTSq0l7aQS3zogPRxrJJKyFwGg2InG236NriI?=
 =?us-ascii?Q?qjAPA8roTyCXUEIIUvV6yxFqowbiamnAiZy2Qx6bmyv4VaAU9awJK9ppist+?=
 =?us-ascii?Q?h2wfOVnv0A76BdPehy8ZienqVOOPtGEoj8AqwMvnIXar7XWqN0OcNIij8Ktw?=
 =?us-ascii?Q?MIDKBVpKSZyffyheu/Rva9joSMUin90+3n8fwhUJG9LiCObJmUvgYkC7X5G8?=
 =?us-ascii?Q?BGNUsHjyFhkGJJA33nygseysWZRADLGrHsyvNINDrwadw9hev1YE/6C1+TC+?=
 =?us-ascii?Q?Op70Fn/yQ7NFnxg6b6kOjcpk6FqzY974EaYXg9BA4+CtFb8xh3ZX01Uj7eXA?=
 =?us-ascii?Q?mbTipjVDMt/nr3JTjx5gVa9ZP5VynxTU7LVp1ao7C1Ez0xwLt3h9GdfTvX2q?=
 =?us-ascii?Q?iwL/C2VnjpLEj0OLRSnSm8zydsbJqansBeUvbhjd0blKRdwqSShNKSlhr5A1?=
 =?us-ascii?Q?35lS/o5PDeugOPFUVzLBrVbMfJykJBYTQHDjGOeJ7FTPZM++fsvGk1T9A2pk?=
 =?us-ascii?Q?R4PVpGoXUKDLMiIOjljRHGjwJoiYtqB/p5Y2fiTk3jeD7PIPoc3pRe7FwdYp?=
 =?us-ascii?Q?/EebYv8JsAoI111hxMcR7Wf5Rcg0QCA1nBtxzT3ZukIZKXtNFsl85sMD6ZD2?=
 =?us-ascii?Q?0bRXhn3IYJW6lbLzeOYUi0HcuVUusnoFncwr9W1VKd8AP9HLRCXCRLEqj4SJ?=
 =?us-ascii?Q?i8sYpNGWojvQlwSmYRZYigy6SqvcVmali1FPNcWgK/50X7V0tBxzGUy3W/N3?=
 =?us-ascii?Q?2rtm2Bkij6kin+m7F1k+2QAJWM3QDyi82sjt6QKkJ5zJKq0ueFBpYzPacp5m?=
 =?us-ascii?Q?/DtF4HdwPm7TjFI5SpMsQuYG7bGqWbva6RQG435HslVspRE3Xad8s6d8zjBm?=
 =?us-ascii?Q?WylW07kfdBS1V2xa9m17WX5VglMnQ1lFofw8EKUGPUGkSkDvGxxmu7rY5Uzr?=
 =?us-ascii?Q?+sV6rssfTOiOPyNopnJsoXGYJ5AicRkLpcercCBFqIzIpJGXnFMrAfUqEyWo?=
 =?us-ascii?Q?Qkn8YN3gABnYpEUmLRH2svtQfN5YnvLs3ijPKOHUEFv4rlqf9rzmIRwcXVdu?=
 =?us-ascii?Q?Ouas2i/PbaxBIx+1LgrRhRw1cXBN4WHNtl9QCXliQerjqwlXYOsrWU+86rl5?=
 =?us-ascii?Q?eStFq4mTSM73QefcHREuG2WkI5azzTxeA6PXjHgMVU1Sj6oH22EdBFp5G/Dj?=
 =?us-ascii?Q?57b8y7JzBbf6Kmx1cqlQ5Jy0JjZlI4asodCP?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bNRVZxkWL7unaX8mUZSfBOZEEJ59ohhiWPZmv48SvDPS8jDCfEmjv6oJAWWr?=
 =?us-ascii?Q?bZZFOrpRlijIrvPf/RrDv+vRs692Q8NotoqirnCiJ2EQ6okbUSs6CZPSUYs5?=
 =?us-ascii?Q?vLbBr2sthvEEHsGte2ZyBIvkfRf138zg1iIb4o+71cQV1MZxA304UlBwCN/X?=
 =?us-ascii?Q?jFE22mpajXRocoQnnRR1bM9qeQkVJ5cm5DQkxgLiOUqeRXq8k0Sek165fab9?=
 =?us-ascii?Q?y7Cj5lJsksLQ+v/5bBhCyUgW0Rx8j1+CDig0M/729yo7o+GPFLsZ3ay9FcEg?=
 =?us-ascii?Q?uQz/WDzlIDyIlLcHaon8+XazLBAqCW4GrkQD7JSwyHlvt4ySY0+dH0DNsQjd?=
 =?us-ascii?Q?m4/hvYqgnnBHQk2SLbKNOW9tgc2exFdZ+uCvfR1Qw2DHo/ozOudqleOFPyrh?=
 =?us-ascii?Q?O6ImkxbbS0xFPiLbgU2jHm4DRlVbDVzYC0bdRPVvDQ7DaVF5QbORlIPu92q+?=
 =?us-ascii?Q?aQ7zADvA8xVarzj29JZ1MgJR3Bx68vVFryHL3PX90xnMG4L4mX4XGbzJnobP?=
 =?us-ascii?Q?cFHEkSudERnpEpeVJOZDxvFFWhQEGBFGnrcFACRbnzes7jHopNrhVjHp/D1q?=
 =?us-ascii?Q?mxMFfS+NFQkO8M/8cXvFMGCqD15N13kIseMykZk4Y2sDqpGVPTbkhsqURcSl?=
 =?us-ascii?Q?o+WpwRntTlEeW+VAiSFi+OkGxsfWYCFB/OuOUni+FMKl7+tarvICl46kYE2n?=
 =?us-ascii?Q?FZH9TDCrMW+Zg2sM5csgf4B10bZDT3T1BURTFg2BBRZHTdYZH9dkucWAZCwf?=
 =?us-ascii?Q?V9PS/RLJLVenv7hDIpQHoA1NvvXNPt6w+vf9eCe2ePtLDDMdriJyJxl/A8bs?=
 =?us-ascii?Q?n2Us00gGAL2U4UB54KHyqx5XV0SJGV3DqBBrZ+jKlkYLyTuFcUVqOkbq+S8j?=
 =?us-ascii?Q?0Gbo5hpScijsahXLm7uDFnycT3isfeu7CE5tHYpRGOy0TTns4z+3TJN4C2y3?=
 =?us-ascii?Q?CvBQl+HHM+nFgE+a5Ru7BM7f/PfVWP/qb52PnN3js3+jLKg4BIZogd+dx0ws?=
 =?us-ascii?Q?EfvzeFiq/qaVr59zVpk/L0UJKpDcwTn9HUai4hBb/0AKhc9GBx9hffC6vVF6?=
 =?us-ascii?Q?NPDddfRvQH1LLb2Qc7qyRLRii3RpOtvlRgnqr36vZpybb2hYHm83lE6GBw+C?=
 =?us-ascii?Q?kh+oV4siPRPVpHpXL1QiFOunb3uCHo9btHlU7k3U86dQC2irqV5dfQT94Qrm?=
 =?us-ascii?Q?FhvR1gQAYmjCNhom8KY03T3BZywoGZ/kBxhybCmbyuV8Rpb4JBC+XL+tDojc?=
 =?us-ascii?Q?qIJwE/dArhIC7aJiF7aleH01gSvAAmKRV+Gxm1u60oG3m8pATaZUKWekqwjc?=
 =?us-ascii?Q?JXLpOMOzGHE+zoz9dNocNWVcVwWDndXjoGjBVyGUOcpffxViZf/Wv6Sg+7Ps?=
 =?us-ascii?Q?EdW9+EGG9viJUb33bRAa/YHPBjsFnFfilhflYH/fG9dCt2UTc0q0tyxUK3hk?=
 =?us-ascii?Q?oQJkXKa/26QmJPtbRvjocZyPdIvuF3KgVlcdISgHeq2EbHyHZJruNOlddxLU?=
 =?us-ascii?Q?9/C/DydzrtZZ4Sc+hhFyIWHgxc7dMOdgmX3wrmopWgfbGvfY+dVv1IKLx3QQ?=
 =?us-ascii?Q?iGEg/FaKyU8xysWwo0iUpc8wlO8ZuuqqtgVTMmWX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2478168d-823e-48dd-6b98-08de2f52fb66
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2025 14:24:18.4164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 55Lh+jheUWFgkFQzajviUCDnkk/++/bz3k+FPvBWILsp6RbJM/X+zODhZSBw14Rqfb/6sXdxk+Bt4kfi5beHbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: VBnjnCdKix3zubpEwKtnGoJoPJdWHo_T
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692b0215 cx=c_pps
 a=hwAR686YzpmZ7aH69gEPcA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=MYMFPvXvy_jvEBAOtIcA:9 a=CjuIK1q_8ugA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: vYNFPu93gz8vgso20etFFrT1lHvvThiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExNiBTYWx0ZWRfX880iYCZ2sf50
 NnCteqiGo+qgMXgYAT2j+xp3BmRWHblL++bKbKHGrsYYXOLh4Vjilen8mq60FRuVmSzwtoVlbkE
 3Iwc/frMntNns/a76GFTWzDSXThqtd8LKARCVPLGvViA2H//MK1CmtbKZ4qq2g3PZBSOiig7zRL
 lXH63pyCwwztH+hgu/u+LFliL1/XzIZf3vewAlHAEAzJByXEUMChvcTg3ka4OIT9nim0JRq2nJO
 5sz7PA+YX7d341O2cCk5c1JhmlJrqG5uzDy26gbdl0JPOVX0IaqU/DA/OuLhC5eNchIM/RBBTmh
 NJ089KegwtbdXIfoYHhIHZ19iMIZlCmoCBV+irHnTHBbl3fkNOziiu1A1d8Kxk9lyz3xzwJwkyi
 H/dERUiy38sPVIbSNyM1NupAfntY8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 14:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226938

Hi Alex,

Without this patch:

In build directory:
$ cat tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/rootfs/etc=
/issue
Poky (Yocto Project Reference Distro) 5.2.99+snapshot-0cd922ad0f9cf59226660=
c30b1db07e23c09460c \n \l

Type 'root' to login with superuser privileges (no password will be asked).=
\n

On target:
Poky (Yocto Project Reference Distro) 5.2.99+snapshot-0cd922ad0f9cf59226660=
c30b1db07e23c09460c qemux86-64 ttyS0

Type 'root' to login with superuser privileges (no password will be asked).=
qemux86-64

Regards,
Qi


-----Original Message-----
From: Alexander Kanavin <alex.kanavin@gmail.com>=20
Sent: Saturday, November 29, 2025 9:20 PM
To: Chen, Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org; alex@linutronix.de
Subject: Re: [OE-core][PATCH V2 2/2] rootfs-postcommands.bbclass: remove th=
e '\n' in 'no password' banner

On Sat, 29 Nov 2025 at 04:54, Chen Qi via lists.openembedded.org <Qi.Chen=
=3Dwindriver.com@lists.openembedded.org> wrote:
> The '\n' means hostname instead of new line in /etc/issues.
> -               echo "Type 'root' to login with superuser privileges (no =
password will be asked).\n" >> ${IMAGE_ROOTFS}/etc/issue
> +               echo "Type 'root' to login with superuser privileges=20
> + (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue

\n does not actually make it into /etc/issue and does get converted to a ne=
wline (as intended) somewhere on the way:

alex@Zen2:/srv/storage/alex/yocto/build-64$ cat tmp/work/qemux86_64-poky-li=
nux/core-image-minimal/1.0/rootfs/etc/issue
Poky (Yocto Project Reference Distro)
5.2.99+snapshot-449cd68248749daedc9990c4094ef5577907ea3d \n \l

Type 'root' to login with superuser privileges (no password will be asked).

alex@Zen2:/srv/storage/alex/yocto/build-64$

Is that not the case in your build?

Alex

