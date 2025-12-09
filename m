Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E822D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:51:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4104.1765273852849341668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SVaGQ4LC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4438aff1f5=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B96oCw53280303
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 01:50:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=rfSt2nFHf0FyzI5v6SP05q
	1pTTBBmUvlTorkC18Rmes=; b=SVaGQ4LCgZPAiHEtt58NrEMKqbxu1P82g8kxIy
	5HRFr8NcQIV34eF9KE8VOkATcGJ9Yv68N0AWlmwPoRYNnLkSicD3kQWm8Rqoou4j
	9KOEm9JPf8ARcyfDE1BF0xyNUZas9/OTUZMng5oXFGvK2gxjShCevRYNf6SIUwKb
	DWMSRnCu79enzLvsjK5ZINTXYvB99gtNJbXO2HGozLBqa/LaWZyLvuEcJrdJaxOt
	8PRY+BTodDQm5T+gA72N5tFKHy6AZ3FEfDJmIQQjVpzwCAtdbLArAgeg9e7goQ2V
	2/n3MJ+9U6PsICmbD2MUaRGH3JDG6YtLeF+hA58d14DaK0gw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012013.outbound.protection.outlook.com [40.107.200.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avmvhaj15-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 01:50:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjW12oPZ5XNwhQC5O9kyZdMfMGEmJBLeAHH4IcIBlBS6WLTL3lg0PgRleFxQQdcqren63RUfONqk/yxOoAgKTpNonVHJyibm03Mmrjp1GjnHumk8tCPefH31MYacwFdZ1Ywg0jQ9DJjVC20Q7CeA4v3dvySvvYcBiGMj3nkTAxePi1isMf+4jzzaM1U5ZG1YyV1fO3FOWdYI9nGgC2Yxzg9L1cdSm8OAFx08biyrz5m/0DSOInJQ9h6pR/Rby5yI8SNL1enctdlHUcZTgNZONYWndj5JEhh8N+iavmT8hAg3UB2EaohRbmWqWSPRz7xVHUR1No0EEYHtx9oUzzO4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfSt2nFHf0FyzI5v6SP05q1pTTBBmUvlTorkC18Rmes=;
 b=mkRB9bjqFgAC7mGFkFO6BA14oFPNkbbnxtBNK6EnEZrV0egmn36yOp7nNJsVDpNrpCJLQuHSDFIF8bwLzaz69hgmOCYS+oKxE3D46k9FJlgNjk9vDcqBxl76C6XSMdagUDs2mo5I0JdD4klP/Ido6rlaZDOTz8gwLi22EzWAyVs+2eykmfgdWJ1vLJw+sL/1jPlgJIrKRLHI5Uyxo8ATuvfEW64O0KPkWj0aqt0Dj4Hdu+omygGmR8zhizqbKNVun3U5o9r9BbMTZaCFDQXjqBG6ge3agvU/x0MrPdaCSBr7Xr0rIE8ojBN6tWybwVhjsxzaAQ2PPozOj6g1DSS6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Tue, 9 Dec
 2025 09:49:23 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 09:49:23 +0000
Content-Type: multipart/alternative;
 boundary="------------3mhSY7e7qYtVGzTZjQrsj0H1"
Message-ID: <d49e5d5c-eafb-441c-946e-e361d23f3aab@windriver.com>
Date: Tue, 9 Dec 2025 17:49:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] go.bbclass: change GOTMPDIR to improve
 reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <187F32821D48D4AA.919836@lists.openembedded.org>
 <a9ad5699-2bfb-431c-84b5-a72907ba4bb5@windriver.com>
 <CANNYZj_dF96XaooeJP90LMDCk5XMuw3swcyZtEBW46sS+3mfUQ@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj_dF96XaooeJP90LMDCk5XMuw3swcyZtEBW46sS+3mfUQ@mail.gmail.com>
X-ClientProxiedBy: KUZPR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:d10:30::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 5423675b-5d76-44c9-4aa8-08de37083b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OU1MQ2Rnb2dPVGIyalBuUkV1N3MrN0xLSXppbzM4aWl3bk9iWVMwcVR1ZXBD?=
 =?utf-8?B?YStEWHJnUTVKVzZvSTZBUXlCcjVvaWlzL3ZwZXdsSTl3ZlFNZG5pbDNGdUVy?=
 =?utf-8?B?SXZ4NUk3T3BiQlJMdCs1MCtqbmlBMUgrMzQyVGJnZWo1YzN3SG1xa1ZCTTYw?=
 =?utf-8?B?SVlpUUNMSTVyRTg4TGI5OGliSWg1bzJ2R2xDZDc4NS9MeXFUbXRSWHhvZWRv?=
 =?utf-8?B?Um1Cc0RLZ1FORm9Eenl4WWJ6SlNIZlBFQWJ1ejhFOU5TK21kMXlwNkxMYjlm?=
 =?utf-8?B?RjBTc0FOUzRZSkxKY25Ic3AvNlM5bUhTeDdLbEFWZWViK0JUVXhCdWxSbDAz?=
 =?utf-8?B?WTdwQXkzUHBObmxOSUk5Njg3T21JcFo4Z0tsL1p3UDRseTlzNDFVYnNHOTZS?=
 =?utf-8?B?UjdPRWw3RzB3Q2NWNS9WTjBmU0hRVnVjZjhweDRBWitoc2d5M2xodkQ3RTdK?=
 =?utf-8?B?SlpPVEVKdEsxNE83QzgramcydmJBbGRiZm5OamV1UlNBdXFaN0trRUg0akxR?=
 =?utf-8?B?RTBBZUUzaFpQS3hWNDE5Z2JRWWNSeWZocXBXTDkrSmlraUlCUTRFRE11SXVw?=
 =?utf-8?B?Y1EvUXpLVDFzdTB3MERNWUpGME5Vd2NSR21Wb3FmandvVU9wMzdIMFplY0p4?=
 =?utf-8?B?K0pRZVozZCs3MlJQcGRmdWU0OXRrQ3EzSWZyWHpjWWFRdkcySFBJZWJHb21v?=
 =?utf-8?B?Vmx3Y05QZVlLZUdjdzVrWlkwVnl5SThuemhoMjdLdENDcmE2YTl3NWcwa3F4?=
 =?utf-8?B?VUJ4cFlTMW1NTVdydzJFTzF0ZEZGUjZRZXlpNFg0MUlqdjI5TDFYNUFOT0dW?=
 =?utf-8?B?VHRzT2NPR0dEWXE1c2tobUZHYXlBcUc0RlhjeFEvdGVoUllQZnJLT1RPQkNT?=
 =?utf-8?B?MXU5aHpwTy9JOUVmT3ZzcUhYNDlkRzM4dHVsWG91Vk5Ma2kzWTFyTyt5Njl1?=
 =?utf-8?B?eFhuazBEaFMyRGVSTEg3SnQreHRESU05S20xTFNDM2Jtakg1aGtHL3ZaWVVr?=
 =?utf-8?B?a1NmSURqbytlWWVCSlVIUTlXKzhlM2p0VUMzazVGYlg4MWhUN3Y3MGhJMEcv?=
 =?utf-8?B?TEZuaGdRSXdkOWtTZFliZy9KRTdhTXlyNFpTYUNGUVQxNThGdUNaUGlwd25D?=
 =?utf-8?B?UktIRzg0V3RJcHBzdlloMUw0dGJJN2J2TGxMT2pBOFVESEcvaTE1V01uK3Iw?=
 =?utf-8?B?NStncWk2b0F3SVJ5K1Uwb2laU1hJTEJjNTZJTmNLeG9QWlNIV0FhSnVDelRL?=
 =?utf-8?B?eTlHOVBXb3FwRXkyakc2aDVJZFJqRUtHajJlUkVFVFNLZXlGa3dYS3Z0Q2s3?=
 =?utf-8?B?Rm51TUlFc2hzaXhVVytIUVlLQVBmZlhxM09kekc3WlFlZE8wdS9wRXlOZjlm?=
 =?utf-8?B?Ym1FVGVMQlFZejk3b1pwMm55c1p5Vm5tbTRoYlE2MmdyRHdTY0sxaFlwZ0Vz?=
 =?utf-8?B?cC9VYlBSc2cyS2FSYTBuRVMvbVh6dWZ6RWFYVG5hb25TVWthL09Rc3ZGUXZW?=
 =?utf-8?B?Z2tUQkk1T2FDbzl5ZlgwOEgzRUZJc3hiYkd3d3NJbzF3dWt0U1ByeERmdStJ?=
 =?utf-8?B?OW1ZMkVtWlZDK3pSUjVNQ2o2b3o1MStXZGZRa25IWHNORG14Y250M3VDYWpw?=
 =?utf-8?B?QXFORXdLWUZUZU8zTWk2MVorOUdvdCtjMDVWakhkSnhoRFJCWHZtZzRqTHR1?=
 =?utf-8?B?Yk9uRWFYdHpteFNRNzZ3ektldllLMVZDb2I0ZjhWOXZFZ2tUc09RSzZFODRR?=
 =?utf-8?B?eHZIVkR2dXppMzY4dHd1TFVaOUJ2L3RGMlhaVTNwMXVEY1RsSFNvSTNjWkhM?=
 =?utf-8?B?U2xZVndoUzhLWDh6VlJMSFc2Q3NXZTZtLytPVllTdzI4NkFKbWlQTGpVem9O?=
 =?utf-8?B?eTBEVlp1SmJDN2E0R0cvd2RzSE9PZGZKNElLTm41ajR3b1hwMjFXYnhaSHlh?=
 =?utf-8?B?UytadThhUE8xVmVUQnluMXVtZTJxYWVBZk8wMldTcXZGQW8xYVRBR2lObk1p?=
 =?utf-8?B?WFErN3pvNUZRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TXZuMTExRGNUZWlsT25yaXdJUHk0VGxmN00xQWxCUnFicDBjd2xkcjZJUGxs?=
 =?utf-8?B?UncySmgvTnNScGNNMlQxSHQ1Z3JCSmVIVCtCQnc2bkZqcFVjTzd6QkJ5WGZx?=
 =?utf-8?B?bndkYTJlVFlkQk81TlN5Nm5PcFo1SzlKcXFxZ0N5N2dxcGVPNC9hbzB3eGFU?=
 =?utf-8?B?UFNmeGdaRUhDYW1TSjhMMm1oQlhFRHJCUUF0VmFSdGJqc3hnWnhDOGdIM0V0?=
 =?utf-8?B?OXVyLzNXa0lveHdlSEdCWDFrRjdyRFkvcFJzdDZSMDc4Nk83eWJLVis4YXdn?=
 =?utf-8?B?MUh0R3ExOFJVa2V1SEZLaWhFNzM1QUlIWmhnNWg3WHc1b1pBck5CRU1jOU9S?=
 =?utf-8?B?TS83WnFhWmwwcmIvcVVySjEyWUhSSW9jdm5Ca21DMnVXT0NVNERYbmt4VG9I?=
 =?utf-8?B?NFlSRllSWWFpVUhxeENnYVlqWXNEa29JaENNWHJFeVRtdGhudDVDTTE5WTJn?=
 =?utf-8?B?Y3I3aGdaYzJpN0NTRzlOdTFZNk41K3BUVXNpS2ZNaUE1bmdQVG1EV09OMjdv?=
 =?utf-8?B?RUJ1TmdHTFZhNStKejVWcVp3N3RINVJ6NklvbTMxNXdnZzRJVzIvWmo2QU9N?=
 =?utf-8?B?Qko0R29BamJlSElkdEhlZ2ZUa1VUOVZROElWZFErV2xPV0xZS1VsUDJGQnkw?=
 =?utf-8?B?QnF2SGVOWnJubUFKZDdHV2kvOEZ3cllFOXAyZ05YSFRBOTMvL2hiTXFmS1Ba?=
 =?utf-8?B?dkpzYkxhdnEzWmNES0hKU255N1V2cmNsejdURW1PbXVQWnU3Mk1XQ0txTDlO?=
 =?utf-8?B?elZNeWUvLzBWMTJPVVNhNjRIZnorL09jdlR3ZFlBS1Y5N3FGaVF4QkFuTTQ4?=
 =?utf-8?B?UVVjNjd5YVF6TjI1QWZqN2VUYzFNbWI5dURzQ2NlaFp2ZzNyeUJpd3Z6VWhC?=
 =?utf-8?B?OHFIZUprVFdSWjZ0OFkrZWhsWHBpQVlCd2tUMFZqd0pIeHpMcS9tR093bzhP?=
 =?utf-8?B?NitJZzY4WVM1ajZORVRjMHduMms3QlhLZXRLdjFFWXRvRG10V1Q1OWZYU0sv?=
 =?utf-8?B?UWRRRklKM2V4WjZNVDVSM25pU2poSTh4S1hNYnZNaWR0L2lLSnlhTWd6SkRo?=
 =?utf-8?B?Y01SNHdtaGJZb2liemhPQ1J0NWlaV0FGZDMxaGloWEoxdUU4dFpJaUpld0Uw?=
 =?utf-8?B?RHhLWGttcUFrdDIzWTg4cXhRNVRiRzErdGgxYXd5MWZPdUNvNHFkS1pYUU5G?=
 =?utf-8?B?YmJiRzFVWkltSk5kVElRMnA5MVFXYzl2NVdDVEhnM050WXhKVUczVzY1QllQ?=
 =?utf-8?B?QzFzTjd1VC9SL09uZ0ovZUdKeG1UZ3pwa1V5MGFYaGFFRHIrMTJmOENQVkM2?=
 =?utf-8?B?ek9XbWhrUU05UGFqTjVkZGZnVFM2dEF5RGdvYWVudjM5OUZjdXpwVS8vdEZV?=
 =?utf-8?B?d1h3ekM1bkcyYWoyNjcya2xkZ1hpYUxtM3QrS1R5bkx6VFQzWGZzNDBwWGdE?=
 =?utf-8?B?ZmpXRDlZa21YSjZKNVBPcFF4TnRyRGVRckpBV3Z4L2dIeVg4eFVoS3RUaHdx?=
 =?utf-8?B?Y1pCWmJjK0l2N3czSXpQWUJMd2h1N1JJK3Q5dE54OWhFNXlsRXFkWDV0R1BM?=
 =?utf-8?B?eCswak5XSXpjZVNjd2tTTXF4M0RBYnNuczM1T1d6QVhKazBUd2ZzQjFaRHVP?=
 =?utf-8?B?VEc4YVFRMnJIVXpra1ZFYmpkZHQrRmc1cFZyZXNHZzdmMjI0U01iT3VldDBm?=
 =?utf-8?B?dURRUURtWHJTVDFYT1NjMU5hVENneHpnN2E5Q3RvYkljOGwxVysycHd1bHIw?=
 =?utf-8?B?Wk1JVHdLT0d4Q0NkYVYyN2MvRUordWcrMjhBdlVKYzUwWjUwRW41YzZISHg0?=
 =?utf-8?B?N1MyYXpQT1RBWCtzZVQ2dUo4RkJEcjRYVlVKWWdyTUdiNXM0N3J4bVg1YTVz?=
 =?utf-8?B?NkZpZG9IRmJ5ZHNsZGFQMlJ0Rno1QnQzUS9vaGlGN1RoWGpQRTdFYzFxYm9z?=
 =?utf-8?B?M1pLZ1hPRFRGTVlYbVBCb1B4a3p0S2RsYUYxemRNN3l0YlBRdzhqTVJlRWZW?=
 =?utf-8?B?SmgzeGtUYnlqVmRvREtSd0NCMCtoWFBneENXWE5TejYwdTFLbGo4ekpXcmRp?=
 =?utf-8?B?K2tBZHVFenNrODlET2JhMGpPd1g5VldBTEN6V21za2NwSkFWdVlFRGpnV3pp?=
 =?utf-8?B?ZHo0VEVhUDlnM3QyRFZNRUw2T2REMkhpY1NBQm9sbHcyYmpnM0h4bngzN2s2?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5423675b-5d76-44c9-4aa8-08de37083b8f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 09:49:23.5515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83ZNV+HMPnqgBPIVgRS/G4vk4elWIukYKpAFYFMovgHoXpzlS6FKBlH6hTVBUR8kdH78XsDEF35yt123B1ALpcMr12Hb15lvs3di2bEwTEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: EHPI-n50EOzKGfLqk20vRbDtIvEbodpK
X-Authority-Analysis: v=2.4 cv=be9mkePB c=1 sm=1 tr=0 ts=6937f0fb cx=c_pps
 a=qiA9p8iyC6UfobZpVQ7+mQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=-w6XO9WydnKAedrXGBEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pGLkceISAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=A2TIbix7xvl1SvOi:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: q9QW4YrBfueqbYI8qcXk-yDiV9f8yfZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2OSBTYWx0ZWRfX0IAIOyBuF3iA
 5b8VkfPCeTUTRLSmSaf/vIR9m334Dyjk7slJz22gIfNI6QyyG1Wz4PonBHa2cVHo1i4D5iREQXv
 cU2i+chkUyjwj1RbO/VS5/zCHO8JKadXjScOjQlDqed0BhwZd0CpYzR32c68eN+QroSFt0JsDVI
 inlnwoB5e23SjSsOZhkVAlQffcMh1onDDIiG+xBSV8TTNK0Wv6clr52YHF1u4oC/K6TLRpJiOJD
 CT5K2tuim1zkpbSLATXoQx55Onw0Sotz/x7uf8J9KATAqbSKZNYm+oqNqiUJbvPeCCo/z4vzlD5
 4yylsjYqYQ9subpxzPSKLw5YgXiDj/D4Ql0o+ZhoW9bdYXI0uTLYGLsrdLUpZCuZwbKlfew7Qns
 G9JQMqcjvBw9b1BY6tQyrOz7LiY/Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 09:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227419

--------------3mhSY7e7qYtVGzTZjQrsj0H1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B96oCw53280303


On 12/8/25 18:39, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, 8 Dec 2025 at 10:18, Changqing Li via lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> In the following patch, you said "Additionally, the top level build di=
rectory cannot be named 'go-something'."=20
>> https://git.openembedded.org/openembedded-core/commit/?id=3D9985b17a30=
bb9b9f1bc82a44662687db5cead66e=20
>> Can you help to explain why it cannot be named 'go-something'? "go-bui=
ld-tmp" works well in my env.  if it cannot be named
>>
>> as "go-something",  how about "gobuild-tmp"?
> This was 4 years ago and honestly I don't remember anything about the
> patch, other than it was a pain to find the particular settings that
> work. You can probably set up a yocto build from the revision just
> before the patch and apply parts of it to see why 'go-something'
> didn't work at that point.
>
> We should be careful with further tweaks.

Understand,=C2=A0 thanks.=C2=A0 I tried with kirkstone branch,=C2=A0 and =
set GOTMPDIR=20
to go-tmp,=C2=A0 then bitbake buildah,=C2=A0 build successfully.

But maybe I should set it to "tmp-go-build"=C2=A0 to avoid possible regre=
ssion.

//Changqing

>
> Alex
--------------3mhSY7e7qYtVGzTZjQrsj0H1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/8/25 18:39, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_dF96XaooeJP90LMDCk5XMuw3swcyZtEBW46sS+3mfUQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon, 8 Dec 2025 at 10:18, Changqing Li via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=windriver.com@lists.openembedded.org">&lt;changqing.li=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">In the following patch, you said &quot;Additionally, the top level build directory cannot be named 'go-something'.<a class="moz-txt-link-rfc2396E" href="https://git.openembedded.org/openembedded-core/commit/?id=9985b17a30bb9b9f1bc82a44662687db5cead66eCanyouhelptoexplainwhyitcannotbenamed'go-something'?">&quot;

https://git.openembedded.org/openembedded-core/commit/?id=9985b17a30bb9b9f1bc82a44662687db5cead66e

Can you help to explain why it cannot be named 'go-something'?  &quot;</a>go-build-tmp&quot; works well in my env.  if it cannot be named

as &quot;go-something&quot;,  how about &quot;gobuild-tmp&quot;?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This was 4 years ago and honestly I don't remember anything about the
patch, other than it was a pain to find the particular settings that
work. You can probably set up a yocto build from the revision just
before the patch and apply parts of it to see why 'go-something'
didn't work at that point.

We should be careful with further tweaks.</pre>
    </blockquote>
    <br>
    <p>Understand,&nbsp; thanks.&nbsp; I tried with kirkstone branch,&nbsp; and set
      GOTMPDIR to go-tmp,&nbsp; then bitbake buildah,&nbsp; build successfully.</p>
    <p>But maybe I should set it to &quot;tmp-go-build&quot;&nbsp; to avoid possible
      regression.<br>
    </p>
    <p>//Changqing</p>
    <blockquote type="cite" cite="mid:CANNYZj_dF96XaooeJP90LMDCk5XMuw3swcyZtEBW46sS+3mfUQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------3mhSY7e7qYtVGzTZjQrsj0H1--

