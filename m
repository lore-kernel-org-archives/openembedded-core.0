Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A468FF885A
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 06:01:08 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8454.1777615263562776316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 23:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=p6AE/6Ct;
 dkim=pass header.i=@Emerson.com header.s=selector1 header.b=slQwp7nj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=65811d1aec=rajendra.desai@emerson.com)
Received: from pps.filterd (m0484883.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UKvs8N2366974
	for <openembedded-core@lists.openembedded.org>; Fri, 1 May 2026 06:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=email; bh=uWt3Ub01p0LP2t/EUdp/dt5mFp
	A2BIok4q1Iz3lq5S8=; b=p6AE/6CtJS46H+XBivjEGm9bDjCNBdUcrk0GQ43Qu+
	ZtCPh7W/x8Mlqz5wZjY6etiLrMijzGTq3xAkl8+bOYeilZmy6Hgjh/IugVFDrmop
	iLkZd1EnM3WIGpjxex8xxjre/dPouy6trkGwAJ2GwdpNqD/JD6rqtayQPinu1A+i
	s8U6HWqsX4JX86lUBObSxTcBpY0H/IQ5Teo6lwNjzsAfnDoRYX0lPSH4Yrbkyuu4
	I43oDsgs8XBXryPRS297xGbTw3vYkbpjX0a8kKUqTjUpv1tftkmG9my2Y+9Veo5T
	ZvolBqkFu2joPhEGHV2ud6Fzv71iQslz+JVWGEjyMt5w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012066.outbound.protection.outlook.com [52.101.43.66])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 4duxq5jc3w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 06:01:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0u3aVlZ9z+SbtpagoNMcl8aeBVXvtaGU6nDOh50whBKD6JzAXSVT++PUFneAra2RTtQR0Jyx4KzDWyxj+xy6B8zBQgQvT8Ok1h6KAXevMhrojIMGLkfzcoOmuPlNOA3AC8gH7eQMdh+xOxh2JXbzk0KSOM42/GL4zxF9BnU/mQ5Rsts5zBXJGE+HlT/AK6yQvv5RWTGk/5bNjjaMV2xny4sHgVxWZhZIJ84WQ/fVjACA6fODPidOfd1rQKi2hYKCvl1uXtqOTiqwjhnO0ZhnYqA+EhSm0tIjfEIbiyixfX7fUYFKZHHLCZBBr6bcQoXi856ZFHe9ZWK1wcxAhaOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWt3Ub01p0LP2t/EUdp/dt5mFpA2BIok4q1Iz3lq5S8=;
 b=YBBpetWSqHwCy5FcBIfMyMTyAakeBLYfjA2nYomysUST4ad33PC4Zk7kUhZWHI/mAgdIxqgP9Sa5dZQNTGsY2dK9MQW9F82Tvn7ESfMCyI8pEcyFI+08fxGQ1u+eo6LvckF+Rctn8BAYJc547kRbWfekSosbdlb35ephFNFaOe3kPeNq++YFor2ihuWdGC5FGJXmgcATO4gXXL6ql/vuWJEwEjsW44y1cYwcI0W8Wtv79qsgFIT91eZrX996CwbJKBnGWyK/zG0fF7OLxQBOSOFhmS7uBGbuut6b2CuDVZ4vpDwzV8Yo5+Fyd2hvelfQkXywOFR6zcqo1ld6Fm1q8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emerson.com; dmarc=pass action=none header.from=emerson.com;
 dkim=pass header.d=emerson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Emerson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWt3Ub01p0LP2t/EUdp/dt5mFpA2BIok4q1Iz3lq5S8=;
 b=slQwp7njGT8UQxAexHK+eLgx12KF4yX3byIgLjMp51z+vIw8wnHoLSawr52/rPqK/cDoobK057rbDgYAq/5Ln/bLddCLUmprl6B7m9SOJ4IAhDqE7kINipA6Ujh4bWGLtDouJhvzESgAOBIXHRRhNjN0CbWPycLHP3bOlcgZ+RF/BiEqoxgrqb2vj7i7/S0bnC1rumNIBn3ZRx14695763HYo2684DGCzJwO0qGfc0xKU0ITEyhOkYpzYPnWnh6GlYSeUls2rH8RWWHAGV03gVqR4ipjhIoqryy6t+2zAGMzQqTXCUHRL79cGjPaTdfZd0w709XuhcbLnCSKscWtjQ==
Received: from DS0PR10MB7954.namprd10.prod.outlook.com (2603:10b6:8:192::7) by
 DS4PPF3689F8B17.namprd10.prod.outlook.com (2603:10b6:f:fc00::d12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Fri, 1 May
 2026 06:00:59 +0000
Received: from DS0PR10MB7954.namprd10.prod.outlook.com
 ([fe80::3e55:1025:c0:e811]) by DS0PR10MB7954.namprd10.prod.outlook.com
 ([fe80::3e55:1025:c0:e811%3]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 06:00:59 +0000
From: "Desai, Rajendra" <rajendra.desai@emerson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Vadrevu, Chaitanya" <chaitanya.vadrevu@emerson.com>
Subject: Best practice for including bootscript.txt in FIT image recipes
Thread-Topic: Best practice for including bootscript.txt in FIT image recipes
Thread-Index: AdzZLt4Ja2uvtL2fRxmHMfjv4aFmtg==
Date: Fri, 1 May 2026 06:00:59 +0000
Message-ID: 
 <DS0PR10MB7954F61DA74A9B73FC8758AD89322@DS0PR10MB7954.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_ActionId=998db47e-753c-4fe9-9ac8-d6b9bee32610;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_ContentBits=0;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Enabled=true;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Method=Standard;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Name=Internal
 - No
 Label;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_SetDate=2026-05-01T05:47:30Z;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_SiteId=eb06985d-06ca-4a17-81da-629ab99f6505;MSIP_Label_d38901aa-f724-46bf-bb4f-aef09392934b_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR10MB7954:EE_|DS4PPF3689F8B17:EE_
x-ms-office365-filtering-correlation-id: 20488f32-80c1-4071-9c45-08dea74704a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: 
 WcVADAbbBreCdkZ5pCqJ/9uUNKMkj4/cCbKJRPMeBP2rtcBafd9Y0RCYTTERttJodrRlOkSoM74zL6wkglWuTglfsRPXk/eufmMYFb7EXDRmzvfqX8bNIwcAF4kBp5o3zH/4puFd2zaPDSPlSXIIyUyCqm5Gr+9yWmMJyDjPldA7QNgrod41mTlt8gTX2LFVxG7OVTGQL6Bl9lQujc109A/JK8y8fubBcmBFD7FNrF/7VTGY3nHi/jeWm9RqxJqRC3QbUJMYB6enI0FS30fukbURtbSZv7c3B8VYRg+m+d9oSGPLQ8+PG60RK9+/NXI5pIM1+8kbXo0lyyXt2ted262sgNzhWy7qDwYEh0fz9mCxG37yOp2anzNm1CDsgfCDxKv8nY/Ef+tXLCjm506zh85+8I+epN8Mdf2O0NNo4IXz9mbY1cXzDp0sWgqWM/nj5t8bmJPQUYUvyIgtPDpAFwYP9K3gkDee+et3qNlkLXlueOkxvI1EXPdzJpbhHh9ZHBNZ71D3PeYXeGwlZcg6y/AmdVhLx6fUG+82KfuBLqr9iS6lk2HQfcmEn1Omq7lerQavh2ApEdnDG5u5l9WjgKPkQE17mSDfSfm5c8iY7zTe9Z2J8wYoNHxFCQBpYrARV2pk7NczZCr6j6ix8JgocFWPTkYm8lySOntZCvFax3tI+NQDJzytkh1uqjxQRQJIdwTE4MYOyq8q4kfRGzU2DhfO9gqLxfzjB0zNSRxvLAIZbQhe7dEdJ0zJi2rzUIZ+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7954.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jGWwAjg3HcnAJByTh/kxfvYRaBv7yLbxlTuqtTgtlmsIkGoyYxOMloKAJjmH?=
 =?us-ascii?Q?V8maXPVsv2cBx6gjIGQ7fzlR0kSfs/+faUucq9QZL8DoL16HN8qJ3BX9JBfa?=
 =?us-ascii?Q?w7lu5uftiSt/RbwpGBL0dQ28ABmZhI34juDbtt0dqh9INcLpwI/2Xxyc+UtC?=
 =?us-ascii?Q?1qy9CPXocV680TPzNU6Ghxnooe6Sy1LWu8ukZ8FR1vH+zH80CtGFLkRHb/jb?=
 =?us-ascii?Q?LS+oZ1K4+1KnwEgRRnaW+qmYn+W+NZ/RRyTvI7R3g9JHXiL8ew0jgPqrfbLu?=
 =?us-ascii?Q?Rr5boGKyCmG4eLr1j+s6quI5nT87RiPvqoziFS5f/0nnRc2z5hMlJ7vb+Y+G?=
 =?us-ascii?Q?BIrNR9aet+QK6vROSjVh6Rj/FNvCpG+2uNDelaFc74asx1WQt+PFqU52aZvD?=
 =?us-ascii?Q?GWjQ7e+DyvBfllt6r8B3Cbk8ra4sjWV/Q93HMurJuqqJzGejTBaTEdQr8vZn?=
 =?us-ascii?Q?TtJ8ioFf3RZxCugeknozB2/8SWB49SNRMljGqRHp3CzWsrq0YTymy143QwP7?=
 =?us-ascii?Q?FaYr7GAgImuhDwaFmrWikZCdrxaZ7Jmv3PdnoTPnvmcGybxljZNITLNe6s0U?=
 =?us-ascii?Q?3q72X+tgPHq5KmlcRVea2Sa4lUn+pngIM9zNC6aTTiDiLgFtqc43zlKs3i3+?=
 =?us-ascii?Q?yOvxuBYmQF9oARXRvv6zUE7jIkME5/dqtn1v02+WaTIFyink5918YKrAxuxy?=
 =?us-ascii?Q?oUPkxzeLpeyWs6QDqtr6fU5DvQUZBrx1mJ2fgWJyph2s+E7oBMvz6HWuadmj?=
 =?us-ascii?Q?qAaGuZu3jLyElZPauaDIR+gwxAEzfjNjSh+M7STyqURqIygKGbqSKojQKO8J?=
 =?us-ascii?Q?SRDF/kYOB2vhv5SHq2iimNJ8qjAImsXkx0Dopuhm28MUwsCXrWOSzNaj9HLh?=
 =?us-ascii?Q?4hdgoMocFAwAdYyPkMxsvNsFBNkj4XD31z2Acewh0xfj/uDFu6x0txkV0LtK?=
 =?us-ascii?Q?BrevpRq0liZNfRFx+KHrcMDTMOHX+yivwEZUilLvf7FVSkmaGIRCfUDkjBT0?=
 =?us-ascii?Q?QbxJ1gsTRDG5pywrIguvX/duDGy1zSHFwp3KRKmzHqhaq91PdUTcBSZ5/NMj?=
 =?us-ascii?Q?Z9Uo8inh41AyT4LfA2NW/Au0I1S+fMQTxbeC2+UTFhzSY9O9ZmCgNbNm7CYf?=
 =?us-ascii?Q?N+7S6JLfS9H8F9tVGDgXuwTspzM5D7ecKBwmrdxIj6nAB/+O5UCpBYU5gZgL?=
 =?us-ascii?Q?yqhrfZylFL4JXuVOo5j2/zH4ohTPbuyWv2L+fOJg6pNR4Kna6VEgYiKhkHOP?=
 =?us-ascii?Q?I6dKk4NsfRNlXF3hhykB7BeLtkhHK7jL2z/8G121GjKckF6YadBikZDYAaBX?=
 =?us-ascii?Q?k06WvdNGfjVkgdo0QUJcqSyE7C1xChPy6V1cmRE/w79vu0FuzO6nupUxY6ER?=
 =?us-ascii?Q?OA1MgGA3fb0j4t1dJMIQdhGV1ANYITeI6PVVzVI4QLxgOhrFuSVy8nDstwfW?=
 =?us-ascii?Q?4AJZZ1+6yb3LDQiDJwO5HwloLAQO62TUOBXXsIFk2AlEk96JIbPdHa9AkvXL?=
 =?us-ascii?Q?VVMo6IaDm63qgtdxfTMUrXITdhNnpK82KLe+i0h4rVtpUah/bWcZqu7JOrBR?=
 =?us-ascii?Q?oL06TanTKoEFqORoXu4rDojnuZ032kbolA5MUfupMXRmfXuJoQYvyXV/4t+6?=
 =?us-ascii?Q?3jSVF3zqys+RGQbhGwiHNTG8vpuVebznnWVwym2lrcARed1+DrLFXQv2yT/w?=
 =?us-ascii?Q?nUgHeDqwB8UMH+f4vbHZjKaBnCMXGJxkriowxv5YA2sT1oMS07JlkFCveEOZ?=
 =?us-ascii?Q?vQVF/XEJSkdlo6hxw0dymxy16KSTUPIMTP9i4Fu6xrIF11gQGLY/zuAaU0MT?=
x-ms-exchange-antispam-messagedata-1: 9MlVYY0jty5o7w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	awXVEUcIjle+9K+dTHP3bdZtCxi5uLyAwSTM/W2phVzQguLaI8vefQW+VXK2X0MFxjIiao+1NVtJxruWl+3oMkJKH8JVweEU4y74XDcGMy3DF80hw3iNChm/mJfsAiFX2J65OtY1v5IfctuuNVVahnAfqjw9nyrcEndSPhfAcNhmuAZPfuG/pg30+19BFDfYYNJnHNc7KxcLxmFB80Kr9HQEzQPI8q7BO852DjfR8NE50Aq9ZLhpTfLnETXrbz2gCKswCwh6+aQp7sm5gwWGTSMBuNsOZcMGrCoQCIfjvqcjdcR0eZtm9JoQz5TKJ0TtQ6ktdMxBItbQoGZzC0Lw9w==
X-OriginatorOrg: Emerson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7954.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20488f32-80c1-4071-9c45-08dea74704a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2026 06:00:59.5693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb06985d-06ca-4a17-81da-629ab99f6505
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0fCIxfZ8Kk76qaUE4KpwC/Vef3CQShNRrTph5sTQjKyRnbj79abgz5zHvI7QSxSffgna1VoTRiXZDtwevpm0C9288yaLj6xMKQHlvHzIV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3689F8B17
X-Proofpoint-GUID: AunRPukpj-8Kx1CWVN_GP406htdz_hDW
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=69f4419e cx=c_pps
 a=yPbt1s1ZvotafXW9/QH5sA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=ZPWZ4rD8_x8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Ps6gwBxKFAOpZu8f3VnT:22 a=jc4ReFxjGE7M9gBl7wju:22 a=CA6yh1v1YCdukwVMJz4A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: AunRPukpj-8Kx1CWVN_GP406htdz_hDW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDA1NCBTYWx0ZWRfX1C0kxgKG72lQ
 wI8Cbx08GsikdsaxdfCYy5umGpCivYV2I5R6gonq/sze6CrSlPI3D23WSMFYOt+fBi/vZt5fXve
 ll7IX+QgdXXDHfdVh5xGvK6+A8DhIaKJsq05C6E2GqnWxfygKxHtCKIyt5UvkB2XzzXwnXsJWaq
 rn9jlX0Ntxm6MlLW6yS1p3godj3qJ3HcvOs5VXx+vmoTgE7RWWf0GxtqnUYL9pkPP3zDzfsrAu5
 29GhoamHTbhzCC7/4d1yx8EIO8XDhaQprItBO2gljuWzvsuyv7qFBx885QZF8A7up4ja1l2JcRi
 +E86Y49hyceS2oznotqdPuyoShOFnQ/seHeZFzzgg/ax65lWrlj8EvovnvWEkIJSbG10mobNLtG
 WKb65B1AxgW5roj+VKGiXeIpX23Aa03cCcrNz/UHicrtb5Lp4u4MsUZlk0u1NxY4A3Us9kNgmOM
 EDIpqPVmoSERGwOYvKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605010054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 06:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236192

Hi,

Docs say that to add a u-boot script as text file to a FIT image, FIT_UBOOT=
_ENV should be used. What is the reason FIT_UBOOT_ENV was introduced instea=
d of having kernel-fit-image.bbclass consume UBOOT_ENV_BINARY which is docu=
mented to support both .txt and .scr (as opposed to FIT_UBOOT_ENV which onl=
y supports .txt)?

Also, docs indicate that if UBOOT_ENV_SUFFIX is set to txt, UBOOT_ENV_BINAR=
Y would get installed to /boot and DEPLOYDIR verbatim but that doesn't happ=
en as u-boot.inc:do_compile only copies UBOOT_ENV_BINARY to ${B} if UBOOT_E=
NV_SUFFIX is "scr" - is this a bug?

Thanks & Regards,
Rajendra Desai


