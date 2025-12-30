Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB78BE95A95
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:02:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64537.1767103314243053662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AZeUDSi/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUD02fi2545569
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=; b=
	AZeUDSi/FoBftSkaWx4EZ+9UgFWoS3PGOiSQhQ+0IOx1WN7vC8+TKZav+lDxAu3+
	+X0VmRsu81gZHYb5QSmOjtVcb8dCITP8cbwaRiFbNqIHv31M8OSfeXztDgO9nanm
	bT06y7nEQHJVlwm4vauqy/yKN3cwGON0gFSBKJc5PTC91Emphm/2pIKZo1qMiffv
	wDpfb9XLvn5o6J1TmZow7/SPL4zMTVKkfJb8ATbjp5D9dP8U++Vkp3a2n/rCbGqu
	53IAdgEtsxKUcaQLNK8sy7D/aX/xTvaKBtNb9Nx6h+WsqsH5e/BHujlQSSW5YRiO
	ckL3F8NLksBDLScy53W8oQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxtx99-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:01:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN65+Uqywr7TUfTYCl/o0xW6ltw7bGqB9wMWP6gGxJalpVKB5EXUcBJj+mhRTxOfIYM3DuuE47IQR+jWpRCWISDJMDLeYANG/qT5MRrgcv4UmYqB3C2LoblmWGbamgy+z6BD7/qfFPtwE7d131GZPcLClNmBB/cY67KvaFFRResug7xkrRjmzKwI3ntkiJaONhkuC7foW39Kco/PEPFHBh/36r/x3Ih2LDBR5w+V2839AwDt4nm8jzAwYctylR8QaEH2Q3KdzYfdsB2/9c2TdXZWKKUquyQG/RPO3CDtyglAI8lWD0plUQ7YDq1s94Ozljb1/w9Rgw1JNgfSwjHZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfulRwytJfi9vWAecnMqzcC79bviZ/lLbO8BEB8uLKg=;
 b=V1sP7uuMCl+Hzf4yQ4y0/TnADEDfwXKSVtN7hyHNDXwZMIvdpq4qwHLi2j3c2qmSr8G/Xdo84nmnoGzn2N9PIYriu9A/9MBIRGyx2X0cP4zDgHZ18IZX4USNaNFlN3GwMVF0p1XyBQe7ra5Uvr1p9i15HV/PT7aMJt1B0JWMtLqjJu4yUGW25gGRQBbWvDzL/STmqJj+VLS5eFg+2iKpSbyUeV/BHCnrb3oysY173QTb0z0kHHD/q0yq4BbPjTSckUWfyxLoB1LdThF4lkAPdHDBU4XQCXBTMXYtbmfEzlSsaN8kp+4pFQleLL+dGuDD0E1f4cPTkJRsPYi+4+wznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:01:49 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:01:48 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 01/15] bindgen-cli: extend BBCLASSEXTEND to include nativesdk
Date: Tue, 30 Dec 2025 05:57:20 -0800
Message-ID: <20251230135734.1973083-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
References: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 53aec0ce-2af0-4243-4b9a-08de47abf9b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?raz8PRa/inwd5KGQXF6+urYGBYejyovXfWz3RtcI3BaAGDZl+/wa4eADcbOu?=
 =?us-ascii?Q?/1ceS+g2Gh6r6wNAzuEtzPRogScJUCQqTl36dGSmoGHJ95vGP3b6r07Yr8fZ?=
 =?us-ascii?Q?FLxHG4JLlbWkrfOpVAjbj3AZA/O7RL3T/m3rbqtfyBcS+zn0DLRFpNZK/n0V?=
 =?us-ascii?Q?bG8fOf1zC8YOmEn4SYzCwHL85uTID+w2QoDJGmN1bBKnkj/dpMs/HEvGNWaB?=
 =?us-ascii?Q?gOrGwOLfXJEYqOd6LZJ8s5lGXs2RT+a8qP9bIY3F759Mr4QVqc3b/X+O6UBz?=
 =?us-ascii?Q?2bKF2R/7ocRRg/RF9T+7A8XcmuabYt2aj0RBszgiDO3gr0bV0Mh9yhfbHw5v?=
 =?us-ascii?Q?wbclNBzGOVxNNDqyl8fSnm+/1gm6OoIyMEnrJKLSpokCDZ2xUepv71vxGdQY?=
 =?us-ascii?Q?vWEm3azubzYZW9Ah4DxilfK7dyaBmU5AJiMWI8gZBms8PqSpK+CCi1OwISRT?=
 =?us-ascii?Q?hfZtu0v0jc8IMFw5PdII+A7kVhk8CwgK2Bp5ehC7j/LCyyHDdXgv5rQWgjxQ?=
 =?us-ascii?Q?nhBtam+Sts8GKQoTEs9tnNtrsLKLVuqXQWY0TQtwbw539etsYlndGsSwNsNx?=
 =?us-ascii?Q?m0Eg3bZhjLTNbylpWkdCCUYQfOU/qLBa5UL3ggC005st1bMCyWl8Xm50bfdN?=
 =?us-ascii?Q?xZVkSTZL3OCAHCRfOtmEgCYC7/uidHcIJ+UgnzDvSn68Vz5E+kC0IvBLJ3/u?=
 =?us-ascii?Q?IfE4nq0KPlGFsWRThLuTthSND1lh0hBoeD86lHUbQFbJ645jCyJ/WjzKCtby?=
 =?us-ascii?Q?IJDem15cxww47OBz/uoWOd0WkFEa3flh41u5UnBqUfsMQIX7ucqKAaOWpEb7?=
 =?us-ascii?Q?CpwcVHlMeC5vL9LGXeuCjaA+VW/kwL+1V2M9Gc5pLDSF5rsdKTO2EPjo5LWk?=
 =?us-ascii?Q?q8iaCVWSVTtOgYaCBpF+uPyZDgMKyHQwAJxJ3vgvrivGjy4W+QBJAYgHZP7v?=
 =?us-ascii?Q?HeX+lBjVEGg+Wo3EAaXpe5T44iwf9cDiuHGdk9lp72M0ARoi3rHwJzvPKd6s?=
 =?us-ascii?Q?MavOc96XqqvOIlaB72jGmaAeOQ5NU6EMGskvHip/ho0qe44+58kzrzgbsorD?=
 =?us-ascii?Q?hlSXV6e35aBAG6IdaeWHI8mciE8rUyD8iufy0JsqK1bzgqhpU6dd0dsON0PI?=
 =?us-ascii?Q?dzn5DLGuRtt4jCvhP4S99hbtt73KhQJgTLK9jPop6/5bVOZtEA8gQ+AbhL68?=
 =?us-ascii?Q?aXbdNtzzwKwiXciD6hss4fxOngOQ5yp617AxM8PLZso53qNiaLNJxwpjrl1f?=
 =?us-ascii?Q?K8UTxGEum+o0G0tJ5ISTDfjD8g7xbc824qR5ChOgD7KWGnqJyzLK0Tb4HqE/?=
 =?us-ascii?Q?Icix2pQz16xOccxRENbgGC/qmqw4DCJppZDCDoz+MKOcxWgt/r11Q20di0m6?=
 =?us-ascii?Q?S+sFtCNwhagszqKxxKp3DyrINtyJ477GFQr3zj3EZ157nbVB3oKtj9OSafmQ?=
 =?us-ascii?Q?oFvtGzzuWEPgcVAKylqqK3q15e2HG0YFwWUascyFeF66EAwhh9yozGtMwCeY?=
 =?us-ascii?Q?UzZ3IvReUzgPbguBN7NCAfcCyEAu+XaticlV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wVbgNqkSyBzGO0p0kQ9/8PMGvEyA6k2/zcZgDwEZjMR5ieD+g0Zl2bK9Ssk+?=
 =?us-ascii?Q?aLVvGA8uLC6/x1BpiRn+ZMpJfrLTqeUAX3esmeGBmJxUfQSFBxXBys0EDq/V?=
 =?us-ascii?Q?KCEqtzp8TP8zcLBiDxbIKd/4jz4bvATX8ri3KebHRs0nDxm/02V7UEFe4v5I?=
 =?us-ascii?Q?kLWst8kiyNw1w1EKGlIwIfNkYfUrb5+zvV13Zp1Ofny/XRMLDH4IHsxlqn/a?=
 =?us-ascii?Q?SEAPcDrh3kYtQ1SWOmQ2zlfADoaZVb34NJQYFAYhO0AywiQjtqIMMU7YwCIG?=
 =?us-ascii?Q?05UUShEh/GEJZ6nHOK/RKFGL0dQTQ1FjTg3I8X/dmWEVlVUaNwjdDna3m0b6?=
 =?us-ascii?Q?h7e5pwHuP5irr7ZtfClj4T+LLqydOXRB4nOfnPUQUTkVWwpRU8++BdIOh1la?=
 =?us-ascii?Q?Z+LxHvFpuby+wpLWMYX5tHDkiI0g9PA2ZNPV4QhjX+UrAtIeJfr8Up6hQYel?=
 =?us-ascii?Q?yC/nEEooDzfvbAy49+4nFaETfiDyBphmhuGQxGrSfd8zsMpaJ+DbLVh/iTVc?=
 =?us-ascii?Q?5IZSLLh8/279PPMyrAfhO9L3tdc2Uj3K9MWrlHG6doBRWgN+ln+mgS77SMtH?=
 =?us-ascii?Q?+Ja821uihydeGR4OdafHTk1E898kT5gapLqfgMV1Xsq64scDdds0nmXnaY7g?=
 =?us-ascii?Q?JgEJj0kYVfHiKFQSQ0oBRFJ8HZZcziQpH3DBWRrtBQF7lQwz/lyTjkviGxdK?=
 =?us-ascii?Q?nKntv+ri6iUIOcLWLZ7aiWeze+Js7nUVcPoI8e7wIiWYaTdfBA+16DgdXdaa?=
 =?us-ascii?Q?yM6848cYzNXBlgTP+25pB6/g8JR6I6iUABe1gP8MGm4KQVxi2bG5yz0tLyA+?=
 =?us-ascii?Q?HMalVEKsu4/r2Vis+hdohY14zvwr7Lysb0+1Fntm73jVUsnug7cQLRLrYvMC?=
 =?us-ascii?Q?ANfuT1X7A/278yxwSxpNol0WDx0teHbXrUcab/luFwGJ53tSRvyawheTVx7C?=
 =?us-ascii?Q?mS/pZ8Vqd8VMm9jVyqdluRSpwuDm153TACegKOCvipDOMz2tjsV7s8s6RXaO?=
 =?us-ascii?Q?hlUzbcoWga5AyopnT4yVKxSPJqKlLSyF+qYkZFThreGMz6j9J6ieTwX/eBkm?=
 =?us-ascii?Q?8Efz+Nymtn6Js8lw1Jh6hJRILVnUKyfpufUplKeGxL4SjiJIPMggjMIzltVi?=
 =?us-ascii?Q?BE02/ODWrdImABm8NWVMoowyZ1bbmVWBGH1HP1B60nuCpVo6jrl7SOqBhQo+?=
 =?us-ascii?Q?4fCyO95kIPsGQ4fYADGGppMKpwQeSAHQ44eteR2BQjkJ3mWaxKksScbttZBW?=
 =?us-ascii?Q?oHmmMojCWky66pWsmhQq0a4qpLARWj+MVRcVoffTFe5DjFK3gchYDDLPJmng?=
 =?us-ascii?Q?Ay8X05uJ1XX4qHA+H2n4UXos5t5QhFKvZiOl2u49RWmEGSjgyLnWY714WXwR?=
 =?us-ascii?Q?K7Qyyzajbfkos5P9U2ObjQ6EoSM8MuygoW6Ir2vcMZ3ZE1bXkJz0utBlXXYF?=
 =?us-ascii?Q?rvVa61cFvv+Kxo2J2E+w+q4Tk3dc0GNfCgkN8AfRC6+5RDnyEh04sfveLHuO?=
 =?us-ascii?Q?EENyHYuxZx9yBHcAkn1QoWmhadoJuff/avLHgtWc7ThMHfvRq5lIWHnSWUUy?=
 =?us-ascii?Q?WWROWjEU5RZSDdXJ+ZhgL+sJ09JisSFZXTzZV4WlLbn0+ZqzsBWckIQ24KmS?=
 =?us-ascii?Q?WDHBAwzPaxPv9cs04OnFx51KuJ4Q2tmaRL0Vo/av3NQ0P8J6qn5BpGhX1Une?=
 =?us-ascii?Q?Ev5V2CXs3v91UiPR79oT2hgmif2+J+xT1tIr8L0CRvv4pcvQ3xF1pTImf+qp?=
 =?us-ascii?Q?uINP0W+SNRvHPIKRfII3MNtCZFjypeM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53aec0ce-2af0-4243-4b9a-08de47abf9b3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:01:48.9444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqaFw/sLmcTkZEFYk+7s5BvCW1USSE37YR6kOtfk7TjH12s9OBgp4IqAJ16be2FLh3QjxL3frgnIu0NNQ5dalLLOW490mqlqavkbspyfpaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyNiBTYWx0ZWRfX53m0+gJQL5Un
 WKGb+7QUqpmnwqu0QcL1A/tcbawkWDQOBAZVEVm0cvgvJNw0vbB9IjJZxcUlsoZc6thw7e/Nqo7
 t1UrXKrgi2GLe8E7VIj5ujIn5ssYnM7i/qDCnveKl8eySDDKnGcrtQeOGPSEPOpYmiukMfWi1bz
 6N3K8LsAemm0AC/M46P9JdJoSaxwnSYTgivB58hXPzRl6jNNZ77FvZI4jUjMPqxgFvXAFDuQm8i
 sAWzhrf26eeJhtlmfAIF4sioQZdOh2v5vYra+q5E/Tsxt1cmc+x9mCzBAXLr8rCL81UysNDlRgm
 GqEHk4PS4oqR4A+EjE+vCkklF/AH8wjj8YORL52y0PY19NspaIWuxmgkdrgnDvBw8qHMGT2DavX
 DaNgthBVqijbrchfW8+TWhRyZDsGCbLOrItg+uC54j0IGqKVcqXFxLBcpnNUGAcdYHzsilW2Vpg
 5Ou0mpG7PmCozMlRULw==
X-Proofpoint-GUID: 2Tb4h2rTwBh8wdDTPmAa9AiTKF4ZHj43
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=6953db50 cx=c_pps
 a=F2A7jaVQFOduNxX/8CKReg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=giED5mSNaOMbM826fEsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ieyR4eH7OhWHNh4VPycLAgGZAWK_lGFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228661

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To support building Rust bindings in the SDK environment, bindgen needs to
be available for the `nativesdk` class as well.

This is required as part of making Rust available, where bindgen is a common
dependency for generating Rust FFI bindings from C headers during cross-compilation.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index 2f3ec04e82..72dadfe52f 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -15,4 +15,4 @@ do_install:append:class-native() {
 	create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}"
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


