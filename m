Return-Path: <BhavikkumarGirishbhai.Ronvelia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BC9C9833F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 10:36:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54481.1790591772952704690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 03:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pxVMOlzY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4731acdd28=bhavikkumargirishbhai.ronvelia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SA6NA43334419
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Lpd7gKkbeBdFbGPFlMOHIY
	wfoJGM3ltON3Tztb1fwXE=; b=pxVMOlzYQgObvqLPoazr97cOojNOISUqIX0jvJ
	VlJomRhyieWjDjUPOo7ALWFYQ6MI8/YSFA4YhCzQBFY/SuNnkFd3PIhDJGfs4trm
	qsaUknJTFXbbrfH8i92jHbGFntPIj5NlorRxJM+bPfQqeGFf7K/Lnhpd9Ey+qp7G
	3SQ7mUWh5tszwKxv7YYrzthv4ewwHCgyU1ugwiXm3TgKaed6Ww7yoiE//DDUDcVX
	RCpWBhQsm0czwkZQgCcKxT5HGXlt/dt6G6JNB5qvko5M4jM2f8OmffmJKSkYErts
	cc4o9DksuQcvkANyVKPWHeJchyZD1w4odnitsnK7n9SzMvAw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021085.outbound.protection.outlook.com [40.93.194.85])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515ad3f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 10:36:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsEIkVeSwQMOfPxZwGOePLsjb2/AI0L4fmpfN0O30+0k2qAUMJXPPjMufcooG1dqW/ghyi8LAAzEqD4hAk5NU0PtGMQ7CTv9fDB3MzKN0p+YLDfy74/4He99GWwcsFrG1kXEXf3VLckhzoPYtm0AKhQS8aWcYtusc4F6uGvPwO7VEjUylERr0wyfWlb8HPmRxljYO0GlqA7Z/xJFI9BViIJJccZzG8B9L7a8FtdcVujmth0uMslqgbquJlHgryr7UtRbmH+a9G/zL8afc1T00j3ixHF2+hAbWGy2pVCl4HnvXgwc10x/JAnUiRWLdBUBNppqsDlfYdJA8zO3OQTwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpd7gKkbeBdFbGPFlMOHIYwfoJGM3ltON3Tztb1fwXE=;
 b=r6tvxBksXtXlRWfq6H+gxZPC0MRP5pTbzmKzpdOML/sbeBNt4viUVO5rLoWmElTulr31cynJI8SJXI8eiEFY7usVl5PEcb5XZ5voeZhVUz1ws1aTeg+hW2lb7R30LmEHX5HTk7ZYAq/+78+qi5/yP2lsKrGQ2SIbAtXgMFPSxbQx7SVq/61LE4U18x89+Soufl+i9yk45rojqVm8e4Y68FAXxm8NpT7cKIFeaYOdToPIJWDrOK/zsfevEMBA9X5dV2uHS+yT/IKnJdid5Q4VksQRGPcHL7VO29LZFqCgyybM+Ueh6KR1a0i4xq7SeKlAH+YyQEgt+HrINIpEpXiKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 by SA0PR11MB4624.namprd11.prod.outlook.com (2603:10b6:806:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:36:08 +0000
Received: from SJ0PR11MB6816.namprd11.prod.outlook.com
 ([fe80::db81:db0a:7818:3113]) by SJ0PR11MB6816.namprd11.prod.outlook.com
 ([fe80::db81:db0a:7818:3113%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:36:08 +0000
From: "Ronvelia, Bhavikkumar Girishbhai"
	<BhavikkumarGirishbhai.Ronvelia@windriver.com>
To: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] libpcre2-ptest: add testoutput3C for locale
 variant
Thread-Topic: [OE-core][PATCH] libpcre2-ptest: add testoutput3C for locale
 variant
Thread-Index: AQHdTZ8BkrblCW8J20OQaxpwOoeE4rbg26WAgALzL4k=
Date: Mon, 28 Sep 2026 10:36:08 +0000
Message-ID: 
 <SJ0PR11MB68165DABEB3B78505CD35DBA828D2@SJ0PR11MB6816.namprd11.prod.outlook.com>
References: 
 <20260926100814.2640444-1-BhavikkumarGirishbhai.Ronvelia@windriver.com>
 <361c6ebcea7d245860adc042073ff99c397262a0.camel@pbarker.dev>
In-Reply-To: <361c6ebcea7d245860adc042073ff99c397262a0.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-09-28T10:36:47.342Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6816:EE_|SA0PR11MB4624:EE_
x-ms-office365-filtering-correlation-id: d7318ee3-8baf-4a8f-d478-08df1d4c4e82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|38070700021|4143699003|10067099003|56012099006|11063799006|22082099003|8096899003|18002099003|3023799007;
x-microsoft-antispam-message-info: 
 MiZwqIMS9izAwE4WfoZu4waifN5G1IA5CvFUiiuYlmTAEXb6Fc65f96XRdpJzi6htCo/GfwOLzdezxk5li3lsWfOzsA8/QWBHPUBuiPcMcF8N53kCdVGQR5qR9lpz/CnJkcWRB9brHOrqysAKuMDzRDYH4FISFHrI+t2QzAGc0+wR/MGNvu1SILuYktHg5ObB4pFkANoA3a6uaMi1CrO1WxHutgRplzXnbeLE/9/5wDCg1j66UHXzhiagQ77pndLMUYl2n3F5frXhFNAbWTKnvD7h9y2RNDFMSf53D/WxRDzKBfJOFdartZDAZGv4gm5526j440+62/JMuvXqwCzfHOvoqqmkZBdZJsMI9IXI/6jnXJIX//w/P5ai6/RC9EdRv1x64WXWlVTYpQ9zNA8aNLwnsAvvfhZfW7MnGIiIPGPrqW0KzAZ2J2M/3E8Q5rCzfVrJ4In+1/YfHhCXFXGFSPlAIOj1xBhyUZx0u4gTnDp/Sbs19GvvdZDAEDx9FIvjPcrAlA/ZzbDZS/LMeshyFerWBb++YGNgdfxdUwjhIlzfqWW7L09VPSEGtJ9li9y2O5VqlaxLFBQP3vPdzUW/ilmXAAyykiHQQ5g6QyJuw8jz0rfgU952nnWFhAGMVvM3OWRV9RIIKMEXf3kiJcAVJ8TjjGQx0AU7dv9LaINjJ4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6816.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(8096899003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?O+m+4BbpAL8Xh+Ub5TTWNblxWlHb5gogx7zN0jUwUqAiN6FUobEfpipA?=
 =?Windows-1252?Q?jcykwcP3XgqDMKpqypXToXPDnyHl4PDe4QJtokuSWjDGieYwCmvDRn+e?=
 =?Windows-1252?Q?/SmJ+qYoT5WN4AYLssUjlaPM/YSfJrtPpsiIy9b4vkwBzQOlrSGF33mT?=
 =?Windows-1252?Q?XO/bK397mCFF3ycnCuNzHIdN6tHFuYEejBzi94hPYz55DWigjQ7ljDYb?=
 =?Windows-1252?Q?k9tpgLFSiUcIeEqaWB2yS/PTOogil0AJpp1QnKIH2WH6R2/8cmN936wu?=
 =?Windows-1252?Q?3JM1y5ycW4hKzQER7QFJ62/vAVvQ336I8Q7cAuh8LZS4rRCONlxsCrkc?=
 =?Windows-1252?Q?sfFGppeHG5fiTsMFBDICrxfby1rr14BNdkMoThhxfzFdI7aFpDkVpUNL?=
 =?Windows-1252?Q?h/Q6pvAifgI0lejLTjYSm9dZxkTWgKmRqCWpbD9jnInwrYicshHvQwNO?=
 =?Windows-1252?Q?eEywfhxk61rC2So83HJc1O0O8U5YFb1dIwKtdZchogHamKNB+ekH50q4?=
 =?Windows-1252?Q?dcjL8uenW3b7EkHOgqcmsQWCeFRWBxBF90HwbEN2s5YG7Xaq7YEEyiB7?=
 =?Windows-1252?Q?T0NXUKZuLodpkIgkMz2Bnb/C1qp5t3m8Lk/MkZN3OEGzwFMSHS8oBjYD?=
 =?Windows-1252?Q?kMXz6fiFPqx+Jv98Me9aW8dG5mmnS47QhV91KtybCXYR/GzvmnUiAIqU?=
 =?Windows-1252?Q?D9aV0dWZhzIoDEyqfAIcRx9FgmWD8udXji10MD+/ZVBxPWZ8I1n3ke4/?=
 =?Windows-1252?Q?FeeoVmBIiYBEvN8JWn1O6eYop8rsH0xqVV+k83eALveYHd4Im+MtaV++?=
 =?Windows-1252?Q?eJh0URzU1EHnL1oMdoOAwvCHOOCPfQo/xZzBomGLjd3XZfueFE99ACuB?=
 =?Windows-1252?Q?IV7vtM9lvcWobz/iWMaDR+REZbRH2pKdgqTptUA3D1KboB/cE3EmC/zj?=
 =?Windows-1252?Q?vUwoBzW+ta7Vu3zrcCUZZK+BoeBHOCdbWvo4NUUNH/MDVskFxFIIZAyQ?=
 =?Windows-1252?Q?uV6LyCzAVn4jWEXpHKtw1l+QOesWPhXpe4PltCpgHeswIJIIHxrOBIiQ?=
 =?Windows-1252?Q?ClRLB1j+5i5rruM1m/rt0897pZXu6tTQs29Y/nKFAQMHT4Cz6j2mzZCc?=
 =?Windows-1252?Q?ZTqL+O/Wh5GBclsFisraNuQ1f+mC+Q+PEFZtNS2qa13vFi3zazjOasvT?=
 =?Windows-1252?Q?W9gWfCWFh9BNJKfuveaNbRZ0GwH1g/A+pFxU1Z/WWEM69ccTl5V1zpXW?=
 =?Windows-1252?Q?/z2TmoHnz6ZFkHZN43O4/ouNkG13Afj00/PJGkiQJGBnjHhVQDhAh/9F?=
 =?Windows-1252?Q?sl/8cBcOiXrn9rhSqUB/LCeziLW4ZnV6kFQIpjlzLwOMZJLb+aBEVMVL?=
 =?Windows-1252?Q?atsz7VssK2PaqchxSV/+NJpq8tce1LPzoMqplJZQn436XznJxxq6OmME?=
 =?Windows-1252?Q?UWV4io3lUUs7YtikY92xz2/NNddvevpm2gsBI8wynIhLFvyRaSAkil94?=
 =?Windows-1252?Q?BJMyjeC6DicAqreXmO4ywXJdlYcmWJP1vmDbru0sxfXNGhDd+57gbWSu?=
 =?Windows-1252?Q?P8I5/t6JqLKVp75pO16TiNrmclFdk3ylbFa+9htTNpbiIoNOstVtp+/g?=
 =?Windows-1252?Q?c9MRkTv9W/ZI5HGiZ/2dMxSzy8PIq9bxgD9V1RLTUVMmrogpN1UT/2eG?=
 =?Windows-1252?Q?JewEawemlmPKhT3QtfkY0g4epWpvnixPG1pd1cyLLtyfUZDxJz04ZDCS?=
 =?Windows-1252?Q?lIp+c4RJOrXgN+2cB/SwO/FFnRhiy+yE1+TYez9h+QrEm9By50unlGD2?=
 =?Windows-1252?Q?Z1xILY9A3sQgdUT6kIgdCGVL3SKJP014ffqGqd/vzmqOY/3cuus+rSR5?=
 =?Windows-1252?Q?BHW6bSbjOJOv2yvYwHrhMq7P6SyUKLAiC6kOjucfRAVXIAMvaRIAOIy2?=
 =?Windows-1252?Q?43FvhrAL?=
x-ms-exchange-antispam-messagedata-1: 
 MkfO+dCc5lBDOjTpKuVa+TsQAi13ghRHd03Zx7I8hdAcR3+bNxcuovc3
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB68165DABEB3B78505CD35DBA828D2SJ0PR11MB6816namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	R+vNz3Osl5jaooLBtTYreH0XDGQhptCeuygUT9qnp37Dk6GA1B/1GnTTZZwACnqfioBJx9fC1c3QAQZIeCME5XVtmEEgplnQAr+F08jr3WJkkGfxr1b7T+0W4fbYfvvGWUol5RdpwihlumWIy8YrmLEbzPtMotioMYg6areDD+XjajG6y+0bZR1pX/UTDzF3h2fU6a0VGCmQidoIDpYA6f/8HFKqQDFMUIstuDOfUFUdfTw3co5s/oDoPSbRQRMGsOLR1Or8Duxae1OFcPadhCqHACd8Y0YmsxGzPIazO2vmwpDiznRqX/dJvlGqda8AMPtxTq36FfozwrDYNkRCxg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6816.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7318ee3-8baf-4a8f-d478-08df1d4c4e82
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 10:36:08.1426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: au+ABTTAbotDY2A7pXaQZSY13QBNmeDPWs4kZks0koCZMOVeTZUdMxRKkLN7axT1Z4zWVPjWRpjNy1Lks1ZHn/cP7Y8wJ6F5W0Lhmktv+o9DY5y1orUpC18q5HSrPCHtyj83JtEbsPO0g/7W23//QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4624
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX9O6r0h3Nhj5W
 WY9or66Ug4ht893NO8e/5MKwNhwCE4dqAdXPJ3m2rMk1oAq6vv9g/1S3oHmRovD3+mN4QJtpTf3
 sF5a2Ckl1ix86wQ9Xw+vPwspBdMC0rctJIg8hI53YdyLh3ltxvXe
X-Proofpoint-ORIG-GUID: 4SuCV8RsuYhYf-Z7vFLY3P2zcnHP7JkM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX57dt24Tm80kr
 zJAgXh389uuAubS1K4Y5k2gX8rKU2dBKzZQ7azQwBprErmYECALRlQ6wOWFefeNeJ8bc+FN1cyA
 85DvhPDP95n48hPjapMENCIeMUyOWXsCTC32TGLENDDSP4A52An34VRMpiNAXpp3FoN0OECWMLu
 AYDO4FPUURJgeRQnAotF+uNeGC9vN6J/s2LvO417tbjJXigKUGtkF9oBF2AhsXvk2mraFk8hm8K
 FyQlbqPkLTIhrGc/m35hBoyLf2CcvgpBNkeASfqC8jbGfcFHKnczNfXRXHPEvEy7TaloREb5dcG
 qTyRe+ERhGmEpa84lX1HvNK6e9AClM8XXj4etDd01/1xHg8Syc3uZPe/HcZKTmDH1cstX9cKXGs
 63SKiIgBvaPbX1vnMoZyNpeG1YMTkly8OwmLPmtbPzCFqpdbWa7ZnzZMkp1NR5ys6nKPQpPAye8
 QCGvqBOp8nTuF2KQ0Og==
X-Proofpoint-GUID: x-SBwdSul4DTBrGXoJUIS-lfq7lp96u0
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6aba431b cx=c_pps
 a=iGL7HXglQbQLghhqflXdXw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=pILNOxqGKmIA:10 a=qmLVfJcrGvWGYuRk:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246747

--_000_SJ0PR11MB68165DABEB3B78505CD35DBA828D2SJ0PR11MB6816namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.
Where is this missing from?
testoutput3C is missing from the upstream PCRE2 10.48 release tarball.
However, it already exists on PCRE2 upstream main branch
(https://github.com/PCRE2Project/pcre2/tree/main/testdata/testoutput3C)
along with testoutput3D, 3E, and 3F =97 added after the 10.48 release.
It will be included in the next PCRE2 release.
This patch carries it until OE bumps to that version.
Also, where does the contents of testoutput3C come from?
testoutput3C was generated by running Test 3 on the target and capturing
the actual output:
./RunTest 3
cp testoutput8/testoutput3 testdata/testoutput3C
The output reflects glibc locale behavior where fr_FR does not classify
extended Latin-1 bytes (0xC9, 0xE9, 0xAA, 0xBA) as alphabetic.
This follows the same pattern as run-ptest, which is also an OE-carried
file not present in the PCRE2 source.
Sending updated v2 with improved commit message.

Regards,
Bhavik
________________________________
From: Paul Barker <paul@pbarker.dev>
Sent: Saturday, September 26, 2026 7:02 PM
To: Ronvelia, Bhavikkumar Girishbhai <BhavikkumarGirishbhai.Ronvelia@windri=
ver.com>; openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org>
Subject: Re: [OE-core][PATCH] libpcre2-ptest: add testoutput3C for locale v=
ariant

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Sat, 2026-09-26 at 10:07 +0000, Bhavikkumar Girishbhai Ronvelia
wrote:
> Test 3 (locale-specific features) fails because testoutput3C is missing.

Where is this missing from? The upstream release tarball? If so, is
there an upstream issue and/or will this be fixed in future releases?

Also, where does the contents of testoutput3C come from? We should
document that.

> The fr_FR locale on current glibc does not classify extended Latin-1
> bytes as alphabetic, producing different output from testoutput3/3A/3B.
> Add testoutput3C matching actual glibc behavior.

Best regards,

--
Paul Barker


--_000_SJ0PR11MB68165DABEB3B78505CD35DBA828D2SJ0PR11MB6816namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks for the review.</div>
<blockquote style=3D"padding-left: 10px; border-left: 3px solid rgb(200, 20=
0, 200); color: rgb(102, 102, 102);">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Where is this missing from?</div>
</blockquote>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
testoutput3C is missing from the upstream PCRE2 10.48 release tarball.</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
However, it already exists on PCRE2 upstream main branch</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
(https://github.com/PCRE2Project/pcre2/tree/main/testdata/testoutput3C)</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
along with testoutput3D, 3E, and 3F =97 added after the 10.48 release.</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
It will be included in the next PCRE2 release.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This patch carries it until OE bumps to that version.</div>
<blockquote style=3D"padding-left: 10px; border-left: 3px solid rgb(200, 20=
0, 200); color: rgb(102, 102, 102);">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Also, where does the contents of testoutput3C come from?</div>
</blockquote>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
testoutput3C was generated by running Test 3 on the target and capturing</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
the actual output:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
./RunTest 3</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
cp testoutput8/testoutput3 testdata/testoutput3C</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
The output reflects glibc locale behavior where fr_FR does not classify</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
extended Latin-1 bytes (0xC9, 0xE9, 0xAA, 0xBA) as alphabetic.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
This follows the same pattern as run-ptest, which is also an OE-carried</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
file not present in the PCRE2 source.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sending updated v2 with improved commit message.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Bhavik</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Paul Barker &lt;paul@=
pbarker.dev&gt;<br>
<b>Sent:</b> Saturday, September 26, 2026 7:02 PM<br>
<b>To:</b> Ronvelia, Bhavikkumar Girishbhai &lt;BhavikkumarGirishbhai.Ronve=
lia@windriver.com&gt;; openembedded-core@lists.openembedded.org &lt;openemb=
edded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] libpcre2-ptest: add testoutput3C for l=
ocale variant</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Sat, 2026-09-26 at 10:07 +0000, Bhavikkumar Girishbhai Ronvelia<br>
wrote:<br>
&gt; Test 3 (locale-specific features) fails because testoutput3C is missin=
g.<br>
<br>
Where is this missing from? The upstream release tarball? If so, is<br>
there an upstream issue and/or will this be fixed in future releases?<br>
<br>
Also, where does the contents of testoutput3C come from? We should<br>
document that.<br>
<br>
&gt; The fr_FR locale on current glibc does not classify extended Latin-1<b=
r>
&gt; bytes as alphabetic, producing different output from testoutput3/3A/3B=
.<br>
&gt; Add testoutput3C matching actual glibc behavior.<br>
<br>
Best regards,<br>
<br>
--<br>
Paul Barker<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR11MB68165DABEB3B78505CD35DBA828D2SJ0PR11MB6816namp_--

