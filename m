Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE59D3E78C
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 03:32:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.308.1765423919664819897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 19:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j3BqrHAf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4440b3d018=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB3O94B764251
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 03:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=nVZciGfi8DDFPJdw5qe2v6JvxVTUrNWH8KYesZKzVBE=; b=j3BqrHAfy6Q0
	aWotn8RRQ/6byVle/BPHVToIIz0zPJFqlHb3/4N1hnC0PgpYa/wV0nnw8YuBF881
	UBfnynDOfnNp3ssfOzPUfi5wQD6Gv+5Dh7BrwUBzYUm0HIgJdXqYrhA4EZWHlnhE
	dFZpT/FVPPMHyGHXsSuD2+IXTwQtuJV7++04ciAVRFYsyMtC8zFgbdTZDFryh6Rt
	vCDc/fXvFVHG7yiG5/bL6JsKUpC3PVQZ3Ar43r97fpeA+AvWvvFT/R5qP8oi6fMz
	UIEaqm3X8RKMBLczcA4/YjH2cdXxlJ/fTVYKO8L/RZ5WWDfViWF8Xqbbt4RlSYD5
	TJdNPtj2vw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay01nhgjs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 03:31:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yw9ZY2Ww2XDh4JEEL9gMQv/cnLH4pER5O+lXSI1Gzfa1K3kZKqJxprHOYtT8fZrM9qd/CpNRqeDMo2LL5Ljo/EZus03s2HuxAtyO3Tbanmpo+EHZ8zeW+i5/YBbBZKFzCIXE8h29doHXBDsiFyGSPnAq6nNDcawGGeIdyA5RDWqbFyUua1iR/uSiBgzQ9nlIi6f11LRbE/v+eN03UNsrioTQUvA3HV1eat3DRdkFbVhDMr1MSfixxQXpk6j1So3/G+smbz1f4U+K5Rw8RhN/Uc5OZSgzQ/NufzJYXy+BVCeO5Ko8ce76+FrOPNKrrvDAx/8M4LVXWd2GhGkIQ/Sh0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVZciGfi8DDFPJdw5qe2v6JvxVTUrNWH8KYesZKzVBE=;
 b=FTLxvp+g1QkmYjcDalojx9yoGpxSO05I+HWzrGuBQQXQJjNNeYAzIuP6jfzgG+8VSi4QWnvzKkbiNaMMejVfLoBPbSDYi4ICLLfg3Elgu14MqhYQn1DpTKGo8yE5HVXpwDkDhAqM5MhmIS/qZjQCvCwBnmegSIXkyESxPRbkz5s23KU6lsqjmUJUcGYaBhoxSoNteFjSQeWI7UAGOHsR1NKdj6tBuabFKy4JGqI5gN3K+ytbD1hhz603ENaRV/3O18za72JB+euou8LvV0E/N1PZZn9sVFG6W3BXr5Xi2oKfeSyF4YQqHCJK0xyMCZRqMQgctbt9V1GTdM4flMo6zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by SA2PR11MB4810.namprd11.prod.outlook.com (2603:10b6:806:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 03:31:55 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 03:31:55 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [oe-core][walnascar][PATCH V2 1/1] python3-xmltodict: fix
 CVE-2025-9375
Thread-Topic: [oe-core][walnascar][PATCH V2 1/1] python3-xmltodict: fix
 CVE-2025-9375
Thread-Index: AQHcPDbqVHSQ9VYMPkOhawnOIDUI2LUcJMcQ
Date: Thu, 11 Dec 2025 03:31:54 +0000
Message-ID: 
 <IA4PR11MB9420D69D8EC831A52ED9951FB8A1A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: 
 <20251013114454.2265433-1-saravanan.kadambathursubramaniyam@windriver.com>
In-Reply-To: 
 <20251013114454.2265433-1-saravanan.kadambathursubramaniyam@windriver.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=fbd7c000-81a9-4e64-953b-d65e43e2120a;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-11T03:31:14Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|SA2PR11MB4810:EE_
x-ms-office365-filtering-correlation-id: 268dd084-36a6-47a9-9c38-08de3865d50d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?wuAJi9b8yU7PoTBnZ8Yk+sy3Rs4chuUJoIdBMl2Ffx73kOs4VnwThcPGUmxJ?=
 =?us-ascii?Q?9wt9vZGy4gji7tH7KZfRV0O2wGlW9W/ie4M5O37UokhjlN+WvKj9TLDjgWvz?=
 =?us-ascii?Q?RQfns28jWPsdUvsvfZrts4ThIqz2DRWm2Fax7v1EpKj186Bt5jFcrwHD3a+C?=
 =?us-ascii?Q?QaWF4e6ZI35GMN1YKeX92RRNjFhYMhn5KaWWEa5IHZC9RLYkSTClubafllBD?=
 =?us-ascii?Q?b04J1VHBXoQSofU8Tz6cxKIHPPmlj3O3FyH7+3bLGXv3grhFradPWyYqMS4K?=
 =?us-ascii?Q?YjL9iQUvqx1fBGaHn40TaKf7toiSWEOhQ55MS9O2LsMA+5BmWSCR16wQu5eg?=
 =?us-ascii?Q?/m8jNyZA1pWEEeIru/+PU3alN8A9Og4X043uuHupzSWRKSCPN7x8HaYQ0VZ+?=
 =?us-ascii?Q?ZvfTij5KeoEwLaApzUMUmvCOiWrz3/kZJUu1hU2nWnkOuCMwerhT+dl6o6al?=
 =?us-ascii?Q?gwserKy+tbgvdfa10VRMbL+7JNdUPXl7ygz88pO0ZzUnKsBadsymfdYpcPiR?=
 =?us-ascii?Q?6/HaX9n5RH3QBmy5M96OGBTL2xQPsK1vIWVqGEGHLI+3CzGix4M+Th2zkzJ7?=
 =?us-ascii?Q?8XbinuMtW/e6i8+QtEggpW0H/dV5rGuctfDlFTd8XzVC33HXMrARH3kLOSIr?=
 =?us-ascii?Q?GLIXYcxyqFG58zqUk0qETofX2ESkinkymoN8zskvQx9/ihzLtWR1y9AYsyf1?=
 =?us-ascii?Q?u8PQJMZVKpB7Snaoo/AIrzM7nfwCC3Q6krN1EXOAAGJHBLNfxUpAe1V1ihaQ?=
 =?us-ascii?Q?YSOoIwqZz2MY59JBEm1/Qsydx9osQkPD+JCEk4YhSSjrzD/eprd+FVoEEXoT?=
 =?us-ascii?Q?wQ+R/KonxZ/dfS4k9GaD+DrCEX+O1oisIQzezRBNHxAWsMMkJQXyRiv54I5j?=
 =?us-ascii?Q?v3Rf/Dirk7aqGS6ArJNnUPeJGMx1ogA90j08w0we1/tAgmFJOiVO6nZLZk+T?=
 =?us-ascii?Q?WJr7VlRhSkL3lirq2cl/VehVFFUkezzI/Hslq+/Kd0mOoceZ9skzC1wPqwhz?=
 =?us-ascii?Q?2AiSXoYbR+0OIm02i7/gifLY521zjxjHHrXydC5yKtKFUpGpvbs+jdlZjojh?=
 =?us-ascii?Q?dgzIKmuslR1eyIXDoNRtaWJKQ9FqxmUAfeJYMgytUQ2SL5FK+SK+uisR4pE/?=
 =?us-ascii?Q?PJl1S4AKOd3rLQnS2zQQjjBLgm4bpHnDK9CNDmNULdrlddoZ1gt03f07Z7zP?=
 =?us-ascii?Q?pJlUzVUPMsn2nXZ68gk2PeNOflFBltT9SG8e2lp9q+ftvGLUrCPsvKuQJ2Jh?=
 =?us-ascii?Q?bqM0fo+VGMi3JND0cWk9kjHFaelg6Nrwv3/h77xaJDSLsnDTZuftG1+vb1oC?=
 =?us-ascii?Q?Q3rRgAlYCeqZbKzHk+cc5jkV1+xYR6gr22ykSo+K/XzmIC6q443mGvLZVp6p?=
 =?us-ascii?Q?3oA+g1saZOctimlSnXyGsnnwCJyX1t/HaJRCHG2RjBErHFGDJZFEtIc44ROX?=
 =?us-ascii?Q?vrAPDzFKZMG6nCwIf/nmxfJsWX72b86AgoMjQdBNm1KxgqaJJheoKw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?m5Iy2DMNhcKzpPFa3OWbr/y2hB5Fi0kN5XJzxS6RCM9FnvghnWVyow31scVA?=
 =?us-ascii?Q?srDHsIImXczoiCE6L+/ioH2Uf8Bukb12Q9/3rt56iFDQvacMcn2wJp1lbmVl?=
 =?us-ascii?Q?TjwTKvqp9ALnhocp99nx5fDEZEIChKbHwt87XXsV9UxPXR4vS/nOarvsHgI0?=
 =?us-ascii?Q?RjD8438FxOmfpSsNdW/YVtI8cYp/IHM8Ad8qJipekiIcSOqmPY1lg/Jq8IPZ?=
 =?us-ascii?Q?I/H0yzEhw0smGFi2Y0veIwXvPLfEudq8gYHWJNBhz323SaEZTcybaIWKwja+?=
 =?us-ascii?Q?w0mHZOoxc7TMqcueXYT2RvIrpaSheBOF8Or+/OTb5mjOKsJG+lbJVDeLbM4J?=
 =?us-ascii?Q?PSxtc8VSR2LZo3sJL9KM3dCRi/UzE1txUCKDZJZ9LGyTi6uCKZ2KlItAAimE?=
 =?us-ascii?Q?pqnf2mUQyTEDCTLjfl0RKuwmyPU5P+QCUwALWqb0CrCUke1oS1Mb/aB2AxBN?=
 =?us-ascii?Q?ch/iZaIeiCj1Kmn6qooVoEohSRphrnefAV2kbBzIoSye6EAK2UEjbjxAQrfT?=
 =?us-ascii?Q?rvVLtzcGGI0dHafc/shCSCGllf1UmgnRCH1STAeFAmMN7Axl1XPmb0EkxGGq?=
 =?us-ascii?Q?a7Rp9vw0cynGA4Z/9drlU0G/KQYbTqiVn7T0Rcys7syM+CYscpZB9jGGPWK2?=
 =?us-ascii?Q?cqIO6ARmi0+hOyYf+tLSduVQHauzQqmzEcxId2HGiZbkzyG4XZzxO3kvnC3V?=
 =?us-ascii?Q?bJzXQYJ57a1NYH4pLSVu1HOdEFnXS8PlS1Q17Pal0wm5Ckz1tJIt6DJlbAYh?=
 =?us-ascii?Q?Xd/7c5w4JbQOYDIWsZ4hmTiz10/ZeHhjVgfHb8YsvET+ThmvG0Em4v2/WyER?=
 =?us-ascii?Q?6L90eXDf4THTV5CyLhvSBRXcyJH0C1aeDfcR3r5/WQjX2eQFrof6C6gAfkkB?=
 =?us-ascii?Q?xTxG8MkGUcGeh4wnFZgzNitsSOYMpOEiZFN84CX/OkOX5Kjv2Kn1rGYiWXIu?=
 =?us-ascii?Q?GFG990QK4KrGZFOfGXcueWWr751pc4onaKBlLSvc21ReLeYTcbY0Kv0O3M7I?=
 =?us-ascii?Q?sMTdtVhb5TGfKO1sodqv32F6ZidCpCok3h9W18/8o/Dpux5q8WrNe2t6eENr?=
 =?us-ascii?Q?T21aV+mgAhz90qjodFS5/qJd9oH1GjALoutPD6tgJrrOVrzhLIlixIcT35W+?=
 =?us-ascii?Q?/eCYSINZmxQrvcuj8+enGOSpUuzd+R8YXATuAzyoBCXv6bJE/MLpOrasEi9o?=
 =?us-ascii?Q?sgXddmo1KPJBfiOFyL28nbTnNTkHohXXUXIclH8jki4NPJ9qiQJauPXiC5Dc?=
 =?us-ascii?Q?wPLf85TR+JqreW8hpIyV2h9MGConNSHqWRORye9Io4xBYup0qS8pMaKurdsb?=
 =?us-ascii?Q?Q7boBHq2PA1ekXGgS7vWbaBqV0cRvm9OLTSg062kWgo2ySQIZ3B8Oi6pZfOk?=
 =?us-ascii?Q?fsjmOpXudTt9EXXTK3pUTYOgLO80pCNXMRI6X4K0GMHcMp5wqVrn3kiViKQR?=
 =?us-ascii?Q?G2QHQ0oBRSa3ZDYOXoSuPqryzriP5RGSNqekA7ZlcWvwh3G+ktQjCxtM11LE?=
 =?us-ascii?Q?Na5McwSTZJfEIeeAwFHvMNCVj2Rxj9SSPCKKbZQUCWb4HX9t3n8fWT569ieL?=
 =?us-ascii?Q?LJDNX18X8AQTdT8+V8EIuqTx4QEz7TXqn3q7YyyQFW79TJYg1QKuZeDd6cwt?=
 =?us-ascii?Q?/g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268dd084-36a6-47a9-9c38-08de3865d50d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 03:31:55.0355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ELkndmnTCYoobCoFYwRjMQEmghdKZ6vhHPLz88xP0t7nREsfTAWHbrE0tpR76Q9q086nPCmCZnX9ioEOGQjtDr/9F5kz2AeL4YEhXm+o6ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4810
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=693a3b2e cx=c_pps
 a=YvyvOXr+GU2iduXSFDI6sw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8
 a=NEAV23lmAAAA:8 a=yEquWHxyAAAA:8 a=A1X0JdhQAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=tIz6uIG67LviHY3KV-8A:9 a=CjuIK1q_8ugA:10 a=s5zKW874KtQA:10
 a=_j3XSMEICZ-j_p4bQif0:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NGSCQvOxsBH0ykVI4E2S3mA7BMaAwfYq
X-Proofpoint-ORIG-GUID: NGSCQvOxsBH0ykVI4E2S3mA7BMaAwfYq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAyMCBTYWx0ZWRfX9HprIa0ba8/2
 9zj5gO/aevj6aepU7DlC3de+2B3FJJKqfN2jowOl0maNqJPUk//OjllWKBpAseQ1qnaANnp7xxh
 QdKi6JzMFWvcN+pl5CuooW1+x7QfOcOtXxJgKRE4QiJ6tBwL8uT0fc6vYG7q/X1JnN0U3uBuY0H
 2XUg9KOn104SJ7fH/JnkcaBHDdfx8G2LcLUELxBp/heT2Gzs6f8YmpRG+ogwOZKPcnwLrPtSYAh
 ok2HfoOJkJkaer97/6+IHxhEctpwR02ggLaAesEnQwn3WBuOAmi7BKiK8fAqCh30pfRebleSPeS
 3Etvr+z2HngEj9i8BzCPZirG5ZTix1apmoFudRwBmmUl7+/4acx4ZP4uLH5HRKQhEDPduG5JeHk
 v/wLjGxM+HnQUzMCthwX7C1f4DYVhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 03:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227512


kindly ping for walnascar branch

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Kadambathur Subramaniyam, Saravanan via lists.o=
penembedded.org
Sent: Monday, October 13, 2025 7:45 PM
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][walnascar][PATCH V2 1/1] python3-xmltodict: fix CVE-2025=
-9375

Reference:
	https://nvd.nist.gov/vuln/detail/CVE-2025-9375
	https://security-tracker.debian.org/tracker/CVE-2025-9375

Upstream-patch:
	https://github.com/martinblech/xmltodict/commit/ecd456ab88d379514b116ef929=
3318b74e5ed3ee
	https://github.com/martinblech/xmltodict/commit/f98c90f071228ed73df9978072=
98e1df4f790c33

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../python3-xmltodict/CVE-2025-9375-01.patch  | 113 +++++++++++  .../pytho=
n3-xmltodict/CVE-2025-9375-02.patch  | 178 ++++++++++++++++++
 .../python/python3-xmltodict_0.14.2.bb        |   4 +
 3 files changed, 295 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict/CVE-2025=
-9375-01.patch
 create mode 100644 meta/recipes-devtools/python/python3-xmltodict/CVE-2025=
-9375-02.patch

diff --git a/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-0=
1.patch b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-01.p=
atch
new file mode 100644
index 0000000000..7835dc9f51
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-01.pa
+++ tch
@@ -0,0 +1,113 @@
+From ecd456ab88d379514b116ef9293318b74e5ed3ee Mon Sep 17 00:00:00 2001
+From: Martin Blech <78768+martinblech@users.noreply.github.com>
+Date: Thu, 4 Sep 2025 17:25:39 -0700
+Subject: [PATCH] Prevent XML injection: reject '<'/'>' in element/attr=20
+names  (incl. @xmlns)
+
+* Add tests for tag names, attribute names, and @xmlns prefixes; confirm a=
ttr values are escaped.
+
+CVE: CVE-2025-9375
+
+Upstream-Status: Backport
+https://github.com/martinblech/xmltodict/commit/ecd456ab88d379514b116ef
+9293318b74e5ed3ee
+
+Signed-off-by: Saravanan=20
+<saravanan.kadambathursubramaniyam@windriver.com>
+
+---
+ tests/test_dicttoxml.py | 32 ++++++++++++++++++++++++++++++++
+ xmltodict.py            | 20 +++++++++++++++++++-
+ 2 files changed, 51 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test_dicttoxml.py b/tests/test_dicttoxml.py index=20
+470aca9..67e3a88 100644
+--- a/tests/test_dicttoxml.py
++++ b/tests/test_dicttoxml.py
+@@ -231,3 +231,35 @@ xmlns:b=3D"http://b.com/"><x a:attr=3D"val">1</x><a:y=
>2</a:y><b:z>3</b:z></root>'''
+         expected_xml =3D '<?xml version=3D"1.0" encoding=3D"utf-8"?>\n<x>=
false</x>'
+         xml =3D unparse(dict(x=3DFalse))
+         self.assertEqual(xml, expected_xml)
++
++    def test_rejects_tag_name_with_angle_brackets(self):
++        # Minimal guard: disallow '<' or '>' to prevent breaking tag cont=
ext
++        with self.assertRaises(ValueError):
++            unparse({"m><tag>content</tag": "unsafe"},=20
++ full_document=3DFalse)
++
++    def test_rejects_attribute_name_with_angle_brackets(self):
++        # Now we expect bad attribute names to be rejected
++        with self.assertRaises(ValueError):
++            unparse(
++                {"a": {"@m><tag>content</tag": "unsafe", "#text": "x"}},
++                full_document=3DFalse,
++            )
++
++    def test_rejects_malicious_xmlns_prefix(self):
++        # xmlns prefixes go under @xmlns mapping; reject angle brackets i=
n prefix
++        with self.assertRaises(ValueError):
++            unparse(
++                {
++                    "a": {
++                        "@xmlns": {"m><bad": "http://example.com/"},
++                        "#text": "x",
++                    }
++                },
++                full_document=3DFalse,
++            )
++
++    def test_attribute_values_with_angle_brackets_are_escaped(self):
++        # Attribute values should be escaped by XMLGenerator
++        xml =3D unparse({"a": {"@attr": "1<middle>2", "#text": "x"}}, ful=
l_document=3DFalse)
++        # The generated XML should contain escaped '<' and '>' within the=
 attribute value
++        self.assertIn('attr=3D"1&lt;middle&gt;2"', xml)
+diff --git a/xmltodict.py b/xmltodict.py index 098f627..9fb249d 100755
+--- a/xmltodict.py
++++ b/xmltodict.py
+@@ -360,6 +360,14 @@ def parse(xml_input, encoding=3DNone, expat=3Dexpat, =
process_namespaces=3DFalse,
+     return handler.item
+=20
+=20
++def _has_angle_brackets(value):
++    """Return True if value (a str) contains '<' or '>'.
++
++    Non-string values return False. Uses fast substring checks implemente=
d in C.
++    """
++    return isinstance(value, str) and ("<" in value or ">" in value)
++
++
+ def _process_namespace(name, namespaces, ns_sep=3D':', attr_prefix=3D'@')=
:
+     if not namespaces:
+         return name
+@@ -393,6 +401,9 @@ def _emit(key, value, content_handler,
+         if result is None:
+             return
+         key, value =3D result
++    # Minimal validation to avoid breaking out of tag context
++    if _has_angle_brackets(key):
++        raise ValueError('Invalid element name: "<" or ">" not=20
++ allowed')
+     if not hasattr(value, '__iter__') or isinstance(value, (str, dict)):
+         value =3D [value]
+     for index, v in enumerate(value):
+@@ -421,12 +432,19 @@ def _emit(key, value, content_handler,
+                                         attr_prefix)
+                 if ik =3D=3D '@xmlns' and isinstance(iv, dict):
+                     for k, v in iv.items():
++                        if _has_angle_brackets(k):
++                            raise ValueError(
++                                'Invalid attribute name: "<" or ">" not a=
llowed'
++                            )
+                         attr =3D 'xmlns{}'.format(f':{k}' if k else '')
+                         attrs[attr] =3D str(v)
+                     continue
+                 if not isinstance(iv, str):
+                     iv =3D str(iv)
+-                attrs[ik[len(attr_prefix):]] =3D iv
++                attr_name =3D ik[len(attr_prefix) :]
++                if _has_angle_brackets(attr_name):
++                    raise ValueError('Invalid attribute name: "<" or ">" =
not allowed')
++                attrs[attr_name] =3D iv
+                 continue
+             children.append((ik, iv))
+         if isinstance(indent, int):
+--
+2.40.0
+
diff --git a/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-0=
2.patch b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-02.p=
atch
new file mode 100644
index 0000000000..d8cd83469a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-xmltodict/CVE-2025-9375-02.pa
+++ tch
@@ -0,0 +1,178 @@
+From f98c90f071228ed73df997807298e1df4f790c33 Mon Sep 17 00:00:00 2001
+From: Martin Blech <78768+martinblech@users.noreply.github.com>
+Date: Mon, 8 Sep 2025 11:18:33 -0700
+Subject: [PATCH] Enhance unparse() XML name validation with stricter=20
+rules and  tests
+
+Extend existing validation (previously only for "<" and ">") to also=20
+reject element, attribute, and xmlns prefix names that are non-string,=20
+start with "?" or "!", or contain "/", spaces, tabs, or newlines.
+Update _emit and namespace handling to use _validate_name. Add tests=20
+covering these new invalid name cases.
+
+CVE: CVE-2025-9375
+
+Upstream-Status: Backport
+https://github.com/martinblech/xmltodict/commit/f98c90f071228ed73df9978
+07298e1df4f790c33
+
+Signed-off-by: Saravanan=20
+<saravanan.kadambathursubramaniyam@windriver.com>
+---
+ tests/test_dicttoxml.py | 60 +++++++++++++++++++++++++++++++++++++++++
+ xmltodict.py            | 48 ++++++++++++++++++++++++++-------
+ 2 files changed, 99 insertions(+), 9 deletions(-)
+
+diff --git a/tests/test_dicttoxml.py b/tests/test_dicttoxml.py index=20
+67e3a88..180d767 100644
+--- a/tests/test_dicttoxml.py
++++ b/tests/test_dicttoxml.py
+@@ -263,3 +263,63 @@ xmlns:b=3D"http://b.com/"><x a:attr=3D"val">1</x><a:y=
>2</a:y><b:z>3</b:z></root>'''
+         xml =3D unparse({"a": {"@attr": "1<middle>2", "#text": "x"}}, ful=
l_document=3DFalse)
+         # The generated XML should contain escaped '<' and '>' within the=
 attribute value
+         self.assertIn('attr=3D"1&lt;middle&gt;2"', xml)
++
++    def test_rejects_tag_name_starting_with_question(self):
++        with self.assertRaises(ValueError):
++            unparse({"?pi": "data"}, full_document=3DFalse)
++
++    def test_rejects_tag_name_starting_with_bang(self):
++        with self.assertRaises(ValueError):
++            unparse({"!decl": "data"}, full_document=3DFalse)
++
++    def test_rejects_attribute_name_starting_with_question(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@?weird": "x"}}, full_document=3DFalse)
++
++    def test_rejects_attribute_name_starting_with_bang(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@!weird": "x"}}, full_document=3DFalse)
++
++    def test_rejects_xmlns_prefix_starting_with_question_or_bang(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"?p": "http://e/"}}}, full_document=
=3DFalse)
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"!p": "http://e/"}}},=20
++ full_document=3DFalse)
++
++    def test_rejects_non_string_names(self):
++        class Weird:
++            def __str__(self):
++                return "bad>name"
++
++        # Non-string element key
++        with self.assertRaises(ValueError):
++            unparse({Weird(): "x"}, full_document=3DFalse)
++        # Non-string attribute key
++        with self.assertRaises(ValueError):
++            unparse({"a": {Weird(): "x"}}, full_document=3DFalse)
++
++    def test_rejects_tag_name_with_slash(self):
++        with self.assertRaises(ValueError):
++            unparse({"bad/name": "x"}, full_document=3DFalse)
++
++    def test_rejects_tag_name_with_whitespace(self):
++        for name in ["bad name", "bad\tname", "bad\nname"]:
++            with self.assertRaises(ValueError):
++                unparse({name: "x"}, full_document=3DFalse)
++
++    def test_rejects_attribute_name_with_slash(self):
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@bad/name": "x"}}, full_document=3DFalse)
++
++    def test_rejects_attribute_name_with_whitespace(self):
++        for name in ["@bad name", "@bad\tname", "@bad\nname"]:
++            with self.assertRaises(ValueError):
++                unparse({"a": {name: "x"}}, full_document=3DFalse)
++
++    def test_rejects_xmlns_prefix_with_slash_or_whitespace(self):
++        # Slash
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"bad/prefix": "http://e/"}}}, full_=
document=3DFalse)
++        # Whitespace
++        with self.assertRaises(ValueError):
++            unparse({"a": {"@xmlns": {"bad prefix": "http://e/"}}},=20
++ full_document=3DFalse)
+diff --git a/xmltodict.py b/xmltodict.py index c8491b3..7b7f8a8 100755
+--- a/xmltodict.py
++++ b/xmltodict.py
+@@ -368,7 +368,42 @@ def _has_angle_brackets(value):
+     return isinstance(value, str) and ("<" in value or ">" in value)
+=20
+=20
++def _has_invalid_name_chars(value):
++    """Return True if value (a str) contains any disallowed name characte=
rs.
++
++    Disallowed: '<', '>', '/', or any whitespace character.
++    Non-string values return False.
++    """
++    if not isinstance(value, str):
++        return False
++    if "<" in value or ">" in value or "/" in value:
++        return True
++    # Check for any whitespace (spaces, tabs, newlines, etc.)
++    return any(ch.isspace() for ch in value)
++
++
++def _validate_name(value, kind):
++    """Validate an element/attribute name for XML safety.
++
++    Raises ValueError with a specific reason when invalid.
++
++    kind: 'element' or 'attribute' (used in error messages)
++    """
++    if not isinstance(value, str):
++        raise ValueError(f"{kind} name must be a string")
++    if value.startswith("?") or value.startswith("!"):
++        raise ValueError(f'Invalid {kind} name: cannot start with "?" or =
"!"')
++    if "<" in value or ">" in value:
++        raise ValueError(f'Invalid {kind} name: "<" or ">" not allowed')
++    if "/" in value:
++        raise ValueError(f'Invalid {kind} name: "/" not allowed')
++    if any(ch.isspace() for ch in value):
++        raise ValueError(f"Invalid {kind} name: whitespace not=20
++ allowed")
++
++
+ def _process_namespace(name, namespaces, ns_sep=3D':', attr_prefix=3D'@')=
:
++    if not isinstance(name, str):
++        return name
+     if not namespaces:
+         return name
+     try:
+@@ -402,8 +437,7 @@ def _emit(key, value, content_handler,
+             return
+         key, value =3D result
+     # Minimal validation to avoid breaking out of tag context
+-    if _has_angle_brackets(key):
+-        raise ValueError('Invalid element name: "<" or ">" not allowed')
++    _validate_name(key, "element")
+     if not hasattr(value, '__iter__') or isinstance(value, (str, dict)):
+         value =3D [value]
+     for index, v in enumerate(value):
+@@ -427,23 +461,19 @@ def _emit(key, value, content_handler,
+             if ik =3D=3D cdata_key:
+                 cdata =3D iv
+                 continue
+-            if ik.startswith(attr_prefix):
++            if isinstance(ik, str) and ik.startswith(attr_prefix):
+                 ik =3D _process_namespace(ik, namespaces, namespace_separ=
ator,
+                                         attr_prefix)
+                 if ik =3D=3D '@xmlns' and isinstance(iv, dict):
+                     for k, v in iv.items():
+-                        if _has_angle_brackets(k):
+-                            raise ValueError(
+-                                'Invalid attribute name: "<" or ">" not a=
llowed'
+-                            )
++                        _validate_name(k, "attribute")
+                         attr =3D 'xmlns{}'.format(f':{k}' if k else '')
+                         attrs[attr] =3D str(v)
+                     continue
+                 if not isinstance(iv, str):
+                     iv =3D str(iv)
+                 attr_name =3D ik[len(attr_prefix) :]
+-                if _has_angle_brackets(attr_name):
+-                    raise ValueError('Invalid attribute name: "<" or ">" =
not allowed')
++                _validate_name(attr_name, "attribute")
+                 attrs[attr_name] =3D iv
+                 continue
+             children.append((ik, iv))
+--
+2.40.0
+
diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb b/met=
a/recipes-devtools/python/python3-xmltodict_0.14.2.bb
index 56cdf6ff4a..3cacb72f26 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D01441d50dc74476=
db58a41ac10cb9fa2"
=20
 SRC_URI[sha256sum] =3D "201e7c28bb210e374999d1dde6382923ab0ed1a8a5faeece48=
ab525b7810a553"
=20
+SRC_URI +=3D " \
+	file://CVE-2025-9375-01.patch \
+	file://CVE-2025-9375-02.patch"
+
 PYPI_PACKAGE =3D "xmltodict"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--
2.49.1


