Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C481CD98CE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 03:46:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.122133.1781495165059990510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 20:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=EuiLeawA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0626b6bd61=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F3SXEB4108357
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 03:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=EThzVnMR14TY38xaC1cDoiYON7vtJ/vdXN+GVaPhXfs=; b=
	EuiLeawAEY16tEL7V/UOQPQfrMKg2bO3+VHm+d9Ogmh33QJ7iB+cXKnAoehywB5E
	iPKrAaBvQgKixYgB+ARibhOH45ATIVkeMx22pOqN/1jBmg3I95TvN8Dcx1eJxByb
	Dy3nPGIey7CCPuVrph7aEyqGnIw4UMXxKqPCCqnCLGvQVKXdSa0W123RNew1j/iu
	tgPOdeeqEgsbnlxcsoZWTNyVbWTQBBsY1XTzOvOR3g5Lda/9AYafjPCregbszLhq
	xkN/BwN0x0akqBLAoq4CrDkAd5IE0i6fhOBOTMgwl62TP6o7mApSBp1Q+380TxTi
	0Dh4bT6P/GTAJowr7L9DmQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ervkp27mn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 03:46:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJ6YaowWS1zYrmPPS1f7R3MDvubE0FdRVUJeE20EpfmRogIzprIXzAKm46l42Z7c2TLe+fiW9aVIEEq8y0TSoOr/J32WoimcADTLxcPV+WnPaCjwk3vmbE9wRK2TE2TVNlrOkb1ttYOsv7kGZdBB3t3iW9oX59d/3zXR023Lh3JVl55CBfWo6bEqFKKi1hCruXRwccLSUEwr1tTgn7kUVFPZ9ylGVUud2FH+SUm0k8rzMksx1S6B4nv+mDxJBQobXgFcrjhTJ0+ML+GbOVEM9+Jlcz6KM5xZG/JIOJewPsNUyQh8NpmlYaAum7lwiO2lkELW5Yt3a2iGNO7DxsqQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EThzVnMR14TY38xaC1cDoiYON7vtJ/vdXN+GVaPhXfs=;
 b=uhuTMf3JRiFjRRKMN2j/+3dqcDDmpQXfykCWbC4cr570KQdGbhmIPe+E7hiSuztFFxfEBLrARRTWygftCVSTJjHXUi+iew54UzwgE/zapYvvodMIbAuSi2BPbGr74OJF8soSr8EpxIFIsads4QNFb4sJVPXS793fNErqKrMtPsbbhnmL+2jG2RwFL8Cbnyxa0fiB/Yw/a/E1d5JfRZPwA1ntCpgfDwtuZRgosUJ6+VKsEZXKp/OFkmqzmz6dSFKPR6a9X0URBB3U68sZQwIsGdYmH0NdiCR+yuK4AgOT+qMwrzxp6/OM5C6T1pK4BJa3WSnx1/p4yJchGWnWQBTCGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ5PPF66B2E927F.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::830) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 03:46:00 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 03:45:59 +0000
Message-ID: <61bf8000-46de-4c76-b76f-9701f0fae4e8@windriver.com>
Date: Mon, 15 Jun 2026 09:15:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] llvm/mesa/rust: simplify llvm-config handling
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260612034643.3215188-1-Deepesh.Varatharajan@windriver.com>
 <81d9b55d8be3f08a199c0ed82cc5a68a3e083cdd.camel@linuxfoundation.org>
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <81d9b55d8be3f08a199c0ed82cc5a68a3e083cdd.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::8) To PH8PR11MB6682.namprd11.prod.outlook.com
 (2603:10b6:510:1c5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SJ5PPF66B2E927F:EE_
X-MS-Office365-Filtering-Correlation-Id: 3817668b-bad7-4f57-0fa6-08deca909cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	WErdmSZiio9pUYruZpNj2AZyD8HfMC3R0Z3i+cpQIbmtt1qCyIMmTZalhJ9zKrAnBFUnRs0a/da2ImLdAkxkX4eaQIA9XlUYjLd74IdHHrcoMi0Kb9SEWxvCHrRTAmtXwhGtCBYxeku0oZpqVeSmCHVr/dOn2p7p283/cbMrEoEte1A0dIgqkaTkz13oyJ8e77DlfteSRweUpCo9bKyZayMM+Sc4+VxlZ3Or4XBZO03tyM31i2702tdyO3iTr4X15NsF0smaO6avyGS/gLVgEuibDdnk61O+e5z5yrXyLR2Ay8CeJdwMcDg5L3nTLWWvyCoR7kIo1EC+cqRyItY76WOQmotgkVOnIqOrxsRna4kCaJLtTftQ9JLCYLCLJ2d5CCbwHFkDwP93DvzwcE2gY1fX7AZ7LQr8NGLkCPqYTYwJuluc3D91uPHlfwuda04OAefp17A8sH8oYv7Emx5E+XjQVjv2mIClsLbklg9RNTNqQEV4kehnvinujd9JtB6z8uUGhzX6Co9RAj48N79HMh5HU20gst32MmpOyJrrA7KbHZbVLNPFSSAdSRf18y7dUS6gFduO9KF0juHVuPwf+VvVUYY2U97AnaeQpXaitAIxkG8/GWqwEp9LRXNEx4RHKg8eGSEiEVwr9o6zM8g9Kz0tTOZyuYlF9gMccSpLNh0BGUD5CPH7lz2J3EekQzdz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S29ZdFlTMmQzNG43WkM3cEtySHBoeXBlcWJrQVFFaVkwVmN0RkJOcXc4R05L?=
 =?utf-8?B?ZE9CcE1mT2ZXYVZ5MGN1QWhDQVREWEVOWVYzUUQ4SzB6OEViOFZJOFlXT2x3?=
 =?utf-8?B?R2VyV1BGMTFhQUZBTjNURXZRbDY5ZWlsRWhPMzBpQnlnQmhGcFU0Y2ZCbGhV?=
 =?utf-8?B?TE9WelphalBGUkFmbk5kSjF2VjV0aEJXdklJNEIxN0wzOEo3b3NHVHJhSkpL?=
 =?utf-8?B?cHpTY1ZMU3NOY28zNXhIVFczU3lXbzJLQnZhUzl3cTdWa25EUU81NjJDcUFR?=
 =?utf-8?B?RzJCMkUxMUZXOThTc2E4amxWUnU0cVRzQkkvTVYwY01tYnhCZ2o4MFZ5OXgw?=
 =?utf-8?B?a1p0K2ZMc0hkSHdGQm1KSzNoYm5jbGN4UzE0akk5VUpMbXQxM3NTeHZ0MmlD?=
 =?utf-8?B?Z2JMNldVOS9ZclU4K1hoaWJRRWRKVEIwdVAzZHpuQjJNOUhSN3Q3Z1QrQi9L?=
 =?utf-8?B?UGs5Nll3TnFsb3U4REJHS3ZDL1N0b25VZjBGK3NCeU01bmJEc1hJWURFQ1Yw?=
 =?utf-8?B?RWZvVUVzTkhCbmhTZC9QUEpJd0gzQXQ0ZlZPSTh5ODJtSDkyVVJhT1o5VnJX?=
 =?utf-8?B?WE5aOEpzeFZLKzhBZGZadDFkQVZmeG5MSi95TWdkbmFWUm42YXJheDVId3Jp?=
 =?utf-8?B?SUJxT2YzTU84MTkrZ2FqaTJBMjdQako3aVM5TEs4WWtoaEJabVVoN2xHYmZV?=
 =?utf-8?B?WEdJallLc1d4NTFBTmJiWnNVSG1vR3J4NkErTE9JbjBBSlRaU3hRUDdUR01F?=
 =?utf-8?B?Yngyc1A4alBVeUtJZkp4VGpnNEZDMmJsYXpMRjRRVldISWI3empQdVVVaG9N?=
 =?utf-8?B?c2ErSE5DTHRvLzJKaHArTnNnMDVDbEsvbi96VUcxakdrSlllSklRTFJwVHlK?=
 =?utf-8?B?VDJRVFdPN1JmUWtTUEliZGRHb3UrQWx2V2JLZWdQSUFEU3NxYzcvSmhiODUz?=
 =?utf-8?B?RE1XdmIzVnFWYXJhVXh2YWZSR2RMS2pKZUJZcXpuMnlFUk5vZVBmZjFhOU5m?=
 =?utf-8?B?bitGRmlua0QybFg4ZEJ4UXFYbzdFUTA1UmZkcUdWKzgraUdQRThwdysxM1Bm?=
 =?utf-8?B?RFZKeVg5b1dXNjBtRVovSTV3WmFrRHRSbjZxcVlXN3pvaGtaSzZTQzRJUm5s?=
 =?utf-8?B?ZlM3bDlaQmtOVWNaYVRGVzNvd0xpa1NTZnhNYXJQWEZnWTk5UG5MRGJZTUM5?=
 =?utf-8?B?Q2VkKzRJNFhIMmlIaUUrMm0xejhKYnpCVkxreHBrUFZpZ2dMVUJCZFZrNEhR?=
 =?utf-8?B?WkxLMHEwWTJpMW9ydlVpTU1ad1VxUWc1VkNCK2tHaElTY1hEemZSbHlxd2Zn?=
 =?utf-8?B?NEw3bmR2TWdHRkN1azMxaDVWcGN0NFdUVUlBMGtzNjlvNzlBbjNuZmI4Qm5O?=
 =?utf-8?B?eWl1Nmp0OHhIVzdvZ3VJVE12RFhKekY4QjNPbGN5WWlzSWRIZGNVL3laa1dX?=
 =?utf-8?B?c1BMaFBERDBnQTJ1OEhxcHRIV3RDQS9SRytMUTF2eUp2Ly9peDQyUmwvb0N3?=
 =?utf-8?B?cmVWZjljeHYwQ2tzZTBBMU5HYUFxcEY0MWZxRTdrUXR4Q0YzYThjQnJURjlw?=
 =?utf-8?B?bTFRYUxZbmRKS083dHhDQVEzazhlNkRCWGp4K3U1QmtoZ1p2TFVsV3NUeENS?=
 =?utf-8?B?OGdEVllMWVE0cTM2Q1hreE05ZVJzajBQTjE1QXZJbzc1aXhhVzE5SzMwaHBB?=
 =?utf-8?B?SEsyV2tUODY0L1BvTEJZdVcybGJ5czlvdjBYaW4xUVI2TEozdjBBZ2ZqZ2tp?=
 =?utf-8?B?bFBMT2VLU0Nrd1lQYjRvSUVORlJXVlRFaWJBYUt4Qm9NQmlHSUJkbkpDTXlk?=
 =?utf-8?B?ZU1valdVZG1UUG14V21vZUkzYjVXYnhkaDlpYzFSNkU2VG5IeWRRWmszUW9h?=
 =?utf-8?B?WGU2TUtyb3E1N3FBYnNHc1FsVlNmaDg4Z0p4aXdvTytqNjJWQWhIM2VmMGY2?=
 =?utf-8?B?VHo4dG9SUlBreWRTZlFVeTFCelQ5MHBldjA2VG9NY1pNQlQ2LzVGbEt1dlFt?=
 =?utf-8?B?V1pxbVhJdFlmclFNeDNiU3JmZlJicVh6RkgvdUJCTXBnVFdkRklGUkpjOVYy?=
 =?utf-8?B?dGFDSXI3MU5tL0JPS2xSODNSa0pSMmgzaFhrWFFDSVpqWXQwZW5JZ2lVZTM1?=
 =?utf-8?B?R24zaVhJVy9HN1lldHJHN3dZeU1OWnhHM3BxYWFrMFpDVlZ5akQ5L1k0cVhn?=
 =?utf-8?B?TVl0dm51dmFoMUlxWGhFdU9ZNUxreElEWUlWVmcrcnpZcXNnYWtSZjVUNUVu?=
 =?utf-8?B?VWxmeTNZV0k1b0l0SmZmdHlaU3hTTnJ6M2t4dkhhUmx1UUs0akN1amN2U01q?=
 =?utf-8?B?eEV0NVZ4ODNkMzlRc0h5SU5sSjJ1VkViV28xSUM0Qnp5MStoK0RtWXVvNmtt?=
 =?utf-8?Q?lEaEcBxxXcyoUtRLVwZrnQXVi81z5z4y+NQlE?=
X-Exchange-RoutingPolicyChecked: 
	YYc07WS6RqOaNGIuK0uYZ52s5kJusckoSyOwtBTl3HlBJADEO+6bOo74rqFJgSpUYJQ62290kfjgg4n834GnZftlqHNbs3xsEjKWvqJPqeo7HrIwLAxDFScGsoYItMeYdFX/J+13BU5MXUQP3vFg1k/kvihmYAvloUcMwSoIGQuBMNCyGHB1rIl20MyB0jcfq7JZq4BeNCsc40gbfIcVi9iA/WcZ5ojMzm3ohp/VvvM/cTlnnsNYCH2+osNupozZEKOsdxwsODAf5NUWP6doouDHKmR9ltdSSdk3QAk5NNOWjT3kQBhZdV4BtQ1ycerb+rh/0PD6fYdk8Z5jzb2eNw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3817668b-bad7-4f57-0fa6-08deca909cc5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:45:59.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xcz7w8QaDrm+P6orfj6DVzzF8iHaXjEK0BvG1HULcXJjMElf/pM7wsI8PqBAKOXMA24ge/5zrX83mL9JAzNTulaIRfkwqZDzjQHxKgBr5HP/68vLSOMp11TQQ5VMHMvO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF66B2E927F
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDAzNSBTYWx0ZWRfXyYnmIEhl+Xy2
 elTmWkuHrcEZ7X+7uEwcuFy/rpGB5v72+YLl/5Z+Ro4kyj177zLVyUZ7RppM5Bnp6iJUCtJ3qwW
 1LIOTuyCkLasrTUKdZMGQqAYxydsP0w7Af8IzuzD2ia+8kaEGLO+sl1r0cBYeOTcr901bN5TS3k
 YvRI8xeUxuQs7itcXMFtMXlO4LknM8PlkUaMiYaByZNkeJAezfYD4KB5uO3eVTiuJwQVca9baui
 g9ULfy7Kf0Os3Ov3+Lf5NrvS0Bwbw2eMvkYWubdTHFgCyfI2diHI5o/Uqq7Z4oYNR/cNYeETexn
 gsU/QhCv5xrdiRWdOGmGoT1HizfMcRimKrY3tJKtroCon1rLlYCRXDHgrMCoKPluZCyB64KGwve
 2CaCJBVeX09qYXEiEdGLzbXFgroV9O7IMrwQ/HhGf1ZpUT/vwWHFnZS0n2HlAXmADiuBNen9P4A
 AgQE0V3n0J9uIVoMdew==
X-Authority-Analysis: v=2.4 cv=BK+DalQG c=1 sm=1 tr=0 ts=6a2f757b cx=c_pps
 a=EaWthEyNNaJ7GkMLLYePaw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Bb9Qc7gJrE1Dt5ra6IQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDAzNSBTYWx0ZWRfX6+pNyCXgPcBz
 Ukw03Fs+6czY+6Q8bymDnL/I5HHt/skpYUXx6Tpj8kteejK9yhXSeMCJq8H63uRw1JKKO+JxRkw
 CjUIUaPOorEBEw3IznHzJbWg34dWDy4xcTGMuVGsmQJPBnG5TFo9
X-Proofpoint-GUID: FUFZiFJbigAAUEAOLzVzkdO4Oq_0vaFM
X-Proofpoint-ORIG-GUID: agWTr1FH_pbHNpKOpjehxWR4YnT87x2C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150035
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65F3SXEB4108357
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 03:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238802


On 12-06-2026 14:09, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, 2026-06-11 at 20:46 -0700, Deepesh.Varatharajan@windriver.com w=
rote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Replace PATH-based llvm-config discovery with explicit sysroot-native
>> resolution and simplify the target llvm-config wrapper to act as a pur=
e
>> pass-through while preserving Yocto alternate path handling.
>>
>> The previous implementation relied on:
>>
>> * `which -a llvm-config | sed -n 2p`
>>     which is unreliable in cross-build environments because it only
>>     searches executables present in $PATH. Native sysroot tools
>>     (e.g. recipe-sysroot-native llvm-config) are not guaranteed to be
>>     exposed via PATH, so they may not be discovered at all.
> We always configure PATH to contain the cross scripts and native
> sysroot. Is there something which is reconfiguring PATH to skip the
> native sysroot?

After running bitbake rust -c devshell, I checked echo $PATH and seen nat=
ive
sysroot path present there.

In this case, since we already know the exact location from which=20
llvm-config should
be used, would it make sense to reference that path directly instead of=20
recursively
searching for llvm-config from the current directory?

>
>> * `echo $base_libdir | sed -n '/lib64/p'`
>>     which depends on a BitBake variable that may be empty or unset
>>     in certain build contexts, leading to incorrect libdir selection.
>>
>> Update the wrapper to:
>>
>> * Use an @LLVM_CONFIG_PATH@ placeholder that is replaced during the
>>    build with the appropriate native llvm-config path.
>> * Detect libdir using filesystem inspection rather than variable
>>    parsing.
>> * Preserve `YOCTO_ALTERNATE_EXE_PATH` and
>>    `YOCTO_ALTERNATE_LIBDIR` handling.
>> * Delegate all arguments directly to the native llvm-config.
>>
>> Update rust and mesa recipes to replace the placeholder with the nativ=
e
>> llvm-config path during target and nativesdk builds.
>>
>> Also remove the native llvm-config copy logic and lib/lib64 symlink
>> workarounds, relying instead on explicit native tool resolution.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   ...unwind.pc.in-and-llvm-config-scripts.patch | 52 +++--------------=
--
>>   meta/recipes-devtools/rust/rust_1.96.0.bb     | 52 ++++++-----------=
--
>>   meta/recipes-graphics/mesa/mesa.inc           | 16 ++++++
>>   3 files changed, 39 insertions(+), 81 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind=
.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/=
0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
>> index eeb802732b..72ffdc6c1f 100644
>> --- a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-=
and-llvm-config-scripts.patch
>> +++ b/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-=
and-llvm-config-scripts.patch
>> @@ -8,6 +8,7 @@ These are added by OE project
>>   Upstream-Status: Inappropriate [ OE-Specific ]
>>
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.c=
om>
>>   ---
>>    libunwind/libunwind.pc.in          |=C2=A0 9 ++++++
>>    llvm/tools/llvm-config/llvm-config | 52 +++++++++++++++++++++++++++=
+++
>> @@ -35,56 +36,19 @@ new file mode 100644
>>   index 000000000000..6a0dd54b8eab
>>   --- /dev/null
>>   +++ b/llvm/tools/llvm-config/llvm-config
>> -@@ -0,0 +1,52 @@
>> +@@ -0,0 +1,15 @@
>>   +#!/bin/bash
>>   +#
>> -+# Wrapper script for llvm-config. Supplies the right environment var=
iables
>> -+# for the target and delegates to the native llvm-config for anythin=
g else. This
>> -+# is needed because arguments like --ldflags, --cxxflags, etc. are s=
et by the
>> -+# native compile rather than the target compile.
>> ++# The llvm-config wrapper will act as a pure pass-through to the nat=
ive llvm-config
>> ++# while preserving Yocto-specific environment variables used for alt=
ernate executable
>> ++# and library path resolution.
>>   +#
>>   +SCRIPT_DIR=3D"$(dirname "$(readlink -f "$0")")"
>> -+NEXT_LLVM_CONFIG=3D"$(which -a llvm-config | sed -n 2p)"
>> ++NEXT_LLVM_CONFIG=3D"@LLVM_CONFIG_PATH@"
> As I understand it, this is always being configured to point at the
> llvm-config in the native sysroot?
yes
>
> I think this script is only ever installed into STAGING_BINDIR_CROSS?
yes
>
> If that is the case, could we just set this to a relative path to
> SCRIPT_DIR, which would then always point at the right places without
> needing to be adjusted each time?
This script is used in both target and nativesdk builds, and the=20
directory layout differs between them.
For example:

target : "../recipe-sysroot/usr/bin/crossscripts"
nativesdk :=20
"../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-o=
esdk-linux/usr/bin/crossscripts"

Because the relative location of native llvm-config with respect to=20
SCRIPT_DIR is not the same in these two environments,
a single path relative from SCRIPT_DIR would not resolve correctly in=20
both cases. Therefore, the path cannot be expressed
as one fixed relative path and still work for both target and nativesdk=20
builds.
>
>>   +export YOCTO_ALTERNATE_EXE_PATH=3D"${YOCTO_ALTERNATE_EXE_PATH:=3D"$=
(readlink -f "$SCRIPT_DIR/../llvm-config")"}"
>> -+if [ -n "$( echo $base_libdir | sed -n '/lib64/p')" ]; then
>> ++if [ -d "$(readlink -f "$SCRIPT_DIR/../../lib64")" ]; then
>>   +    export YOCTO_ALTERNATE_LIBDIR=3D"${YOCTO_ALTERNATE_LIBDIR:=3D"/=
lib64"}"
>>   +else
>>   +    export YOCTO_ALTERNATE_LIBDIR=3D"${YOCTO_ALTERNATE_LIBDIR:=3D"/=
lib"}"
>>   +fi
>> -+if [[ $# =3D=3D 0 ]]; then
>> -+  exec "$NEXT_LLVM_CONFIG"
>> -+fi
>> -+
>> -+remain=3D""
>> -+output=3D""
>> -+for arg in "$@"; do
>> -+  case "$arg" in
>> -+    --cppflags)
>> -+      output=3D"${output} ${CPPFLAGS}"
>> -+      ;;
>> -+    --cflags)
>> -+      output=3D"${output} ${CFLAGS}"
>> -+      ;;
> Can you remind me, how does the native llvm-config provide the target
> cflags? Is that triggered by setting the YOCTO_ALTERNATE_LIBDIR above?
Yes.
>
> Cheers,
>
> Richard

