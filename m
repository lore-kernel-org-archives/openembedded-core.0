Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE9CD31A14
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 06:51:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4915.1768373505488539287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 22:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=rlpud7Zv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5474771f1a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E4SaHa2659084
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 06:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pfa0pD4bPUI3LrQuAAreQ0shKLHQTqQXXxwogkRfFbo=; b=
	rlpud7ZvIuCucqC6K6yK9Covg/Tjww1dmWa2L1DyvFyHlPU1QMq5TeP+0+Buayhu
	O8P9fAkr3nwjhSgi3/G5d2GpCZt85NxnHP/57IbMW8iKZMSSIn4qnLDOlHecnsuw
	bCNc4kFTh3chuBwIED3BOD4nEEZ2T0EznR1n+kZb2kOWMunyTpFFAdYDsWF/gTb+
	FbW6wr1HwnXkm1bu3qDn7eZdQrN8GEoNC4lZ6jMSlAyO5eI6XjxtAEy8CrtxsaQ5
	m0IAglxTPcDZA1NUpUWzWGeVietliAE5KDzpNoNqi2hwShgBSWWcNSp0bG46kEBD
	aCaMD4BTYITzjfeqVPgEGA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2m3s3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 06:51:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htIpUOcMSOnZUCkAta2mpobFbPZjC9feMLUfs28mHOT+o/jNlvbHDiS7f9Ca4TA5RVHONtXkzDz9eatv4cWyP3OM5fvj1bAD6xxoJQmxt4OXpYqwBKKm8f1Ztl6uJD/7L0PaRPxnsalaaTimogbKXUZiEW4EInCJuxVxwPkXqb+RyeOfrPI223306Yo/USTthyynQiGN1dMLOfzvduh0qDJ2DeK7Mp5A7UsSxUMLXa0tCRsCf5D5dI1RVosuwMs/YfG51fTqx+Uxy0nOa0q8c7PgpWml9OP+4dEE8wFyaz7XspXNV8TA+1wCRDuEfUohSSYHOs2pUSiq1cnkBrstYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfa0pD4bPUI3LrQuAAreQ0shKLHQTqQXXxwogkRfFbo=;
 b=UFJqhJw45yj/wA/DhVyY3Rg7bc9I6XcYdP7G2PdDLULi1nAZGfegqIiNubDoN4jWZdTLfuXNhkez0Hl8hhBXwMYYZiSCT3wnmZrLcuBULr4h5A1DsydbhR+hfxu5ddAgPAlmDD9g9TJEY+lkgGbxem1FMIqCjCRbsTo1xZq5q1GurQGyR5MOoUjcW7Qq1zAQWeJwfjBYJiER4ykOdliipaCwyzrC8eBPpraz9iQnYoY/pKvIR9QAR2oXhovVz2i4G0FxhCuW3MqiSvgbrL5fIJhPGFlquJO7fQXGrdyQM06FU9WVkUAak9DEUcmWmDhRqsym6Ll5BKHhKtV6Vek8hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 06:51:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 06:51:41 +0000
Message-ID: <97376677-0d73-40c6-8400-0c3c71ece42d@windriver.com>
Date: Wed, 14 Jan 2026 14:51:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] go.bbclass: set buildid to empty string to
 improve reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20260108060842.3340603-1-changqing.li@windriver.com>
 <CANNYZj9YA+FNmcn4RiwK1CEvK909uDbgZcHYiHd+yZo00ciejQ@mail.gmail.com>
 <fc5d529f-0ca3-49e7-a050-62593305b128@windriver.com>
 <CANNYZj9Yo19XZTpEdNER9ud5EUSq1fu8PLgRbLgRGHmfK4MX8w@mail.gmail.com>
 <188A268E92558804.2902090@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <188A268E92558804.2902090@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: adcbc2ad-e1ca-4f98-7f74-08de53395f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXFVTnhDVmtXdFBUcTFJQVhpY245NmN0OEt0K2JIOThZY0tRM1ZqbFFGWFc3?=
 =?utf-8?B?VmhwYmNjeXl6aG94MC8yaE1hb2tjY0pITkpvdzBOT2FyY2JMY1I4bHJKSnk0?=
 =?utf-8?B?SHE2U2V4SnRqRmREWlpPSGtCc2YzZVhyaVpDRnZ6WjJONTl4MXJEaVJtYVU0?=
 =?utf-8?B?alRTMkZHWDVxaldnSkNuMXU2ZmIyYmdHRVlTbUViWVBEZkxRSzBQS3RRSmFv?=
 =?utf-8?B?ZEF0cVd6ejFmbVJDQU1LaHJQRlpIM2Z3QUtlb2lvSUF6RVl0eVRQcExRSmh0?=
 =?utf-8?B?V0Fud2xOWGZIVGdmUFpHQkpCYkdqQ21vcW1JNTRtSTR5NzVSbnNmUWZWektS?=
 =?utf-8?B?Y1pROENkL0xqdVAvYzdPYTB2c0ZMQjdwTFFnWWI3WDZtR2Q0MzVHT094Z1Fu?=
 =?utf-8?B?MnJpb21YQjZTV21aSk55UXZVbWwwakhiR1hUZ3VWUlRtNHg2RmpRMUFuQkpk?=
 =?utf-8?B?NkZqd3BCVFRQTGR1MUlTV09qN1doVE4vdUdKand5d3VhS2JtOUJLSkM5SC9N?=
 =?utf-8?B?cjU1MlhGNTRlZXZDSVByYlF6Z1dYUHRNZTV0T1orVXgzMllhOE5XbG1YNGlq?=
 =?utf-8?B?NElZQ2g1b0xrVkNqWUIrZkhHVlFUQW9kcnA1MWlFWWEwNTVwUlJPZXlRMEJJ?=
 =?utf-8?B?b0hsSjFrN1NzWEhSNldmTDVRcktwNWdudzExYW1xV0xodzVsblYyM3BaVXNn?=
 =?utf-8?B?TTMrMkRxNjFjZENGQi9ucnE4ZkFKMlRlVndFcEdqV2tGdmxMcHdrWlV2UmFJ?=
 =?utf-8?B?QW1WVCtMN2p1NjF2L2FoNlhBaGdvNjVZWTdtTVpWYWYwODZDamRHYmFUb1R3?=
 =?utf-8?B?NWpZTGpDelRnOTh1MW5ubC8zeTd5ZnhZMHZTZDlqYlJSVUphcjlZTjdnbjlN?=
 =?utf-8?B?UVRoc3liQzNLZEpPeEE2dTZtNVF2Ym43NzlNRVl1bFV4eXJkZ0thVi9FaFkw?=
 =?utf-8?B?NUhqejJ0QytybTdUN0FRKzE5TGx0Mlc1SmppTVZWMTZBZzdEeXozMmRkak5t?=
 =?utf-8?B?Y0tVVzYvT0lzb3VOeFNRMkxPQ052aVg4UUkwajdXN3pLTVArTXc5bnJJak0x?=
 =?utf-8?B?Yk1HZFRxOXpwUGF2QmJQTUpJMUdKNVJUbEN2M3JNalRnbnIzU21LZ3BqSG9B?=
 =?utf-8?B?MlNaVTdZRkZtSkZ0NWQ4NlFkQUdyQXZqNlVyb2lsd2pOQy9MbGZWZ2drOUww?=
 =?utf-8?B?ek1ObEpvRCtBSmgzYnc1ZC9FZE51VHVmYnRjQ1d2WS9JUXhvU0plOEZrQXZt?=
 =?utf-8?B?azdjMVgrLzBFUTcwdmRyYXIyOC9ycGNWU3RPcThlUm9vQkJIQTFsNDNDbXVw?=
 =?utf-8?B?NHZ5VEhpamtMTGNyRnRQencxYkJQNTg0aEkvVnBWb0c5RFJvZHk2c0o1RkI0?=
 =?utf-8?B?aE8yMGMyT29yeTlpbmFMODlNNCsxbFdWMWNoVURxbElVeXNWRUhZbkFSR3BW?=
 =?utf-8?B?SUt1VE1Qd1dXdVFFa05MQksvYVRPcGg5Uy9IOFRPRUxoNGE5NGRuSEdIcE1L?=
 =?utf-8?B?Y2RXZHp0WEx6NTdpY3JXU21MZjcxK1owWVVUNXdTU0dzdnEvVENpa0s1azUy?=
 =?utf-8?B?eU95cGVad0RzOEZtNk10OTVhVjMwRVpPTnpDU3BaS2trUGJGU0lQU1hUaUVU?=
 =?utf-8?B?empJRlpPdk4zMmt1Q2o1ZEgyTG5pQVdVNmZha0R2Y1Y3OVgrWW1jTmFqVjRt?=
 =?utf-8?B?NXVSelNyNUk0NGllRDJkbzdLTjhMVDNub2V3TGtyWDFGdk1LVFhkWGY3T1ds?=
 =?utf-8?B?cmFvVGRadUg1WUtGNWc2UU93Ung5eWNPdlphUUQ1RmlRWU5SYUVsMTQzM0o5?=
 =?utf-8?B?aGxxSnpZUVBKMHZwNlNFWXdTRUhORmdrQm9sSkw1RitIK2ZDRTA4eGpCT0ZQ?=
 =?utf-8?B?bzNDUnVsT0RDdWxwcG16bmkzMmkzaTdjRXcrVFEwRnloVTkwd0lodTZOUXVm?=
 =?utf-8?B?NW05aXpINmxJc0VER1NaTXJNL1BhMk1IT3hKV0d0UjFXbTI1QjFkaGU4QUUr?=
 =?utf-8?B?cXVpWDVKcTNRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N0dGbjNvbjJxNXI2cW90TXlZSlpBbm1iZXlaWXg2K0ZGWEFpeENXQ0JNdXU5?=
 =?utf-8?B?V3QvRFQ0eWZpb2VseUVCbkJzclgyNkVQSXdISVhIakpJejU3VGplc0VHWlZC?=
 =?utf-8?B?SHIwZDVmeWdYUmpOLzdDdkRGcHJ3Wkk2bWF4VEkwTmluU3FhZGxvU3V5Q0k2?=
 =?utf-8?B?NmNCNEMrVzRVeldob3M1a0QvczJoOE01MmE2VlcrZlBWbkhLNWxLNzJpak5u?=
 =?utf-8?B?VEVQWXgzSDRMdnYzZXlrYUZVanYzRzhiQi9mK1kremUzSS9NNFJ3cTlBVzFO?=
 =?utf-8?B?eVV5VkEyNWhvdVRNV2Q3eUN0VS90U0VhV1ViS2N1Z1FJRVRWUHlLbzlSUk5H?=
 =?utf-8?B?dnlReVU4Q01LY1UvK2JJN2NRak5GdFdrSVVEeXVNL1haREJPdHNYdVVjU0hO?=
 =?utf-8?B?a2tsKzl4N0ZrTjVxTXYwNndDTlo5dUJaUjVCUmk2eHpWRUZ0T28xdXk1cXlK?=
 =?utf-8?B?aks4ZHRhK2FQVkoyTUc1L2lHTjZXUG9Za0lueUZ4Z2FYMVVZS0Q3b05sNTZy?=
 =?utf-8?B?aS9XR1EwSlFMTk9uNXJTWmp2THZrUWoxLzdUeFRJNVNsK2NNU0UxVUxjRC9v?=
 =?utf-8?B?ODJSeVhuaVdOajN5N25JMktoVTJzQWZPaTNDQytPemtTWFZhaU53SlJhM203?=
 =?utf-8?B?bGZSTFlBOEU2UGwzZHp0N3ZqT0FDMm1aZ3RlMUo3NnExUG5kbjFySDM1akpO?=
 =?utf-8?B?eVdSQVJTam90dm44MkNDVEZ2UXpPWUVuVlhVendoM0wwYjRXL1RZZmc4WE9y?=
 =?utf-8?B?TkMxZHd5ek0vckNuT2pvZjhacVUvUDZmc3ArVU1xVGNhTTJIWUorc0ZvcjhJ?=
 =?utf-8?B?cEs5djlrcUdrNEtUSUxla2pnMjNhM0RMY21LcUg5a3RCMkdaeC83aUZic25W?=
 =?utf-8?B?RWNHZHRDdFd5MnQ2MFBmZDg2emNRZ3RCQUM2NStHS1pMUm52Ni92eTM1QnYr?=
 =?utf-8?B?aU0vb3FHOVJhSVAxajJxZnJ0ZTN5MmdjSjcyaWt3eFFaLzIwVE11emdpZzJU?=
 =?utf-8?B?Z0loS013MlQrV0x6U2xJUmZlSmFpYk0vNFhNbVlHc3BWeEhTSnppWVZBTnlY?=
 =?utf-8?B?dXFIOGhpUnkrdmNHT2dicXpucVVPbnFHTVJ4TGxJb0xWZm5pOVpWWUViZFZM?=
 =?utf-8?B?emJ5VmRoTE9tUXlwRnhhWVZ6VEVuM3BIZU9OMW84b2o2eHYzU2MvLzlaVGpO?=
 =?utf-8?B?blRUTzVLQnNRT01SN210eUdmd1NpNThHWFd0NkhtSUdyRzIraDRFdS9qMHF1?=
 =?utf-8?B?a0MyUm8rUS8zYlQvR0VMME9mSHpkNDJQMS9rZWlzTlovSmlBRVVVQWRQMXJI?=
 =?utf-8?B?dUY0ZW5jRGFWaUllVVFKSjNHUmZpY0lLN2FacWtFU1R6bkFRL2VuUGx2a0Y1?=
 =?utf-8?B?ejJqRFRwTFkxT1ZyZ0RyWnoydHFtMXpNWDJkU1djWVdwV0N2VHJtQ0ZCdDI4?=
 =?utf-8?B?MStpZ1B0RGVFSFRtdUR2eDlBa3NzZjhldUhxZ0dwbEZmOUlCN3VLWHlHTTVk?=
 =?utf-8?B?UEM2SEJiSE5lM09aM2ZPNW80YzBpUGlNUkN0VFdSdGgrSTVKWEtGMnppejBp?=
 =?utf-8?B?L3oxM0tyRS92RkMwNzFVYnhrWWFtdmVkNm1wZmpjQUJJelB2aFd1Y2JhUEhS?=
 =?utf-8?B?UTJUT0puQWdUR3NWVWxNU2JOUm45RXJRL3ZXQStnREdnVVNmOVpwWW9iZ2F3?=
 =?utf-8?B?amc5WVY3TnBTa3U4QkhOZHd2VnV2MGlMTGpYaGV2dk9zOXJtaWNuUmpmbDNx?=
 =?utf-8?B?WVZaQ1NuTk1hWk1EbGxsR0FlRjVNV3FMQitkUGx5Slk3aUthUE84SGplaFJ3?=
 =?utf-8?B?YitBQkcxQjNNM0xNOGZaOG5ja1FuMjhqMm03OGszemRzcGtQVFVTQ21HNVpN?=
 =?utf-8?B?bGdFQWxnUXd4TjRuTFl1YVBTUTZkTjI2VFlKMlMrQ29lVHpNK2l4MkJyR1Vi?=
 =?utf-8?B?WG84TlMyVFFJS3Jka240S1huVEJpMFJua2ZlSnF1VHd1K2RqdjdISmFOQVNp?=
 =?utf-8?B?YjVzdGNSUGVrTW5xZkY4SldpSTljVGhhalhNa3AwVElRa09haEgzL2hKWHpr?=
 =?utf-8?B?bVl1RVVVa2FabkFWbzlmQ1gvSC9ndnhndHk5NW5jYjJJSitQcUtxZzdZbUp5?=
 =?utf-8?B?cEtYNzNOckJVN1N6ekZRMGVYakJhdXl0ajVlOEd6K05XeG1Ed1Nod0Z0SnRk?=
 =?utf-8?B?UlQ1NFR4Vk1ONTFUdldqZ24zdVZNSURXa2ZEUWZuLzd6ckJuN25jLzdBT1Qz?=
 =?utf-8?B?NXBYQzlsWGRpeTE5L0I3WkI0QVA4bU5EK3Q1Z2xNTzEvUllLWDdzZGZqd3Bv?=
 =?utf-8?B?WG1NNEpPa1JrT1lCemZmY1lWWDlHbm5sNVdSMWM0TU5qMFNZcURhWnZaN1RQ?=
 =?utf-8?Q?QdQyaGUeX0vC6ij4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcbc2ad-e1ca-4f98-7f74-08de53395f64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 06:51:41.3797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fR5vTrJntUb7dslEIM+7KpXGxVECojw8ClZxMBCuyd5fqFjqKMEN7Wfqag+sfEeosCUFGa/JGh2hbe0sPNJrbgyUm4PhyxRAUSlIGiKBUrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: YtoyCzDiOEL_PDb4PbQmIpQSToqYKnPS
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=69673d00 cx=c_pps
 a=fNyNANDL+C7JeK/y+7sGAg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=n0EJvW4DrmCS9BOSgxoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Mu2jasDnmVtMfpAoXQYDUc6xe8G_4nWn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1MiBTYWx0ZWRfX6kX7mjoXrJbt
 /k77IlCHKoUXOVvcQNc7iA+XfTJdcrvEhYbX/Rl4DrICLH2Bmci1rf28gBklrFOf7YfOFRqetS2
 tZFvmNvfqm+ap3ywdpgNEj4hi+ObnftEA7zG8fKwGwSVpVQWyUcBsDiNEzQzH2K4Bgs3IJw1HWk
 Fz+OVheMleZtx1dKbOKTL5wyGs060ttO5G7+BXw3CqNhf9B5Cp7c3joDWk+qQjcz7/sK0fa0dq9
 KcOYdfmQGMFQqApVCooYoqGiLbJ0gR+TD8psYK9ccW1DIFPK1aO3XNZCCWvdQtTPh4oym9TYCee
 DLcnERh7elVumx6dp1bQCNKcegPKAuHbZxOQohQrFuiH0QfaVeiKT6+kdiSsPpDI7Lk4FbOCimm
 VdnHu4orBxCEkEeeUub717pzZLBZZvBEmzV7aE5Qb/S025wdE/WHvk60Lwe2biiiwT+3YUbidwe
 +N66QGhaozFRmXYtSuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140052
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60E4SaHa2659084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 06:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229305


On 1/13/26 09:36, Changqing Li via lists.openembedded.org wrote:
>
> On 1/12/26 17:33, Alexander Kanavin wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On Mon, 12 Jan 2026 at 08:40, Changqing Li=20
>> <changqing.li@windriver.com> wrote:
>>> There's go-helloworld in oe-core, which is reproducible as it is. How
>>> can the non-reproducibility that this patch is fixing be observed? Ca=
n
>>> we improve our tests for it?
>>>
>>> This moduleindex info only be used when GO111MODULE=3Don,=C2=A0 and t=
he=20
>>> go-helloworld is compiled with
>>>
>>> GO111MODULE=3Doff, so it is reproducible as it is. To improve test, w=
e=20
>>> properly need to enable GO111MODULE
>> Can you do this please, and add the change to the patchset?
>
> OK, I will change this in V4 patch.

I don't=C2=A0 include this patch in V4,=C2=A0 because I am considering ad=
d another=20
example go program, which enable GO111MODULE

and also enable cgo, so we can cover this reproducibility issue and this=20
one:

https://git.openembedded.org/openembedded-core/commit/?id=3D0642d2323072f=
561a4d0eeb9266213387b2997fc

So another patch will be sent later after above example program is ready.

Only change one minor typo issue in V4.

Regards

Changqing

>
> //changqing
>
>>
>> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229221): https://lists.openembedded.org/g/openembed=
ded-core/message/229221
> Mute This Topic: https://lists.openembedded.org/mt/117148599/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

