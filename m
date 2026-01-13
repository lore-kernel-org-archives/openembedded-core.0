Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B957D2D0E5
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 12:15:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57569.1768306508227461507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 04:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=gnomb6k4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54738b4d4e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5INPV329510
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 12:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PP2G4PBJxwLvwc0u4/i1spYIycZ008Wr9Ylml3s/Nkw=; b=
	gnomb6k4Hw4oBcposJejJRWLEitg7xFkfht++h+ekngJ+dHzpMpmaPAdRHWh6BIL
	7gOgK2kPE3Y1Y5BMH3XZiAB1zpw3L3tyOHNt69rUt1XSnp71+Av9gEgJPm+qRc1i
	nTWr53wPVl3wkdumDz20NMo9FzwFrMO63fO76X54SnprZfxM+CsknafN/XlZyJkF
	0WHu0Bzdf0fTr1xlKWn1Rs4taWvGugifAw5nCjpfY6cW5e1dmTJgUqEDpBnN48Iw
	yOe1FM051hW3T4eNgBD+FI9fqxnw5Q9sjsGYbX/n4vjk/h2eE49YLZeBlrxqvqtZ
	2IpipE6eFMrW8CXwj0fK7w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2k1jj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 12:15:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGwxvoDzyxOEqIrP7S8H+mWBO0tbewEDViW8lQs/8jOgKlS7WDMLsX0ZvjUE5eRkcB5vxYEDXLfHiNHwYsnY2Dc5LmyFvjVxUuFBkPR5/gRjeDumrfeBYrKChbgTGEiKcuKYAUjS45+jYA/B976/5PC995c4G1+ytIofTuMmsJ9UmhgNt5JxgKYuEzqBGzJ75rtF5xGwM//AYgpNHZrewFdlc+eym9+DN5N4LXEIFasGWO274XhAddO/6S4lVxhlHrcKndlFNdSX346Div+9WnG8uNS6bbXYjYdTAnUGQf/in1h232OLMjl/+M6j52g6DkKHqZHY9bCM+eE5JAtN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP2G4PBJxwLvwc0u4/i1spYIycZ008Wr9Ylml3s/Nkw=;
 b=AHxEDAxf1zIBY4c7ad/cEf7M6jXO07BC7V1QZJWK16mb40ui+c5C1rZSiFe8sNWXLqslDpJ0irmypuNMeyJ82bC6TXY98MsMcCzml6GkMB/HgOVQ9TvhmdLzQMSTRlLfeCAHUIA+M27vm/5nZ9hsMMDcVBLc6vcmhqfHTSHNBEAK2Ei/vcy3zRJfG82Q8NhyJ4CZDWyfRwwj+KghpFgxvuJkZvEU8D1ESj4dI4hZFUUVUzXPvoj+ns0mXdoo0vYp8Chuy3hY2EDDhBSAfebQEYmWIoE+VzGB3/13GvlrGwf1zqZXzaX62A7ioRtTIcyvleBcgxrIczN7+enfXPsB/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 12:15:03 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 12:15:03 +0000
Message-ID: <cc2aee73-4c37-4434-8a2a-fbf967d18ae7@windriver.com>
Date: Tue, 13 Jan 2026 17:44:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 03/15] rust: install Rust library sources for
 'make rustavailable' support
To: Alistair Francis <alistair23@gmail.com>, randy.macleod@windriver.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        bruce.ashfield@gmail.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        openembedded-core@lists.openembedded.org
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
 <20251230141540.1974380-4-Harish.Sadineni@windriver.com>
 <eb3a975606e2cf27a04c999158a9d39f2cb7a007.camel@linuxfoundation.org>
 <ad562934-8523-4071-801a-8dd5709c0868@windriver.com>
 <6baec353-7ac4-4801-8e13-225e4d9432f2@windriver.com>
 <663fe060-072a-43a4-b0f9-20e172007c47@windriver.com>
 <980e869b-15e4-4b6a-a2ac-3e13ecb43b00@windriver.com>
 <CAKmqyKO68-STJkpC1=EO7xC-TGiM6xyzZj6gFEZB60kfeTKnpw@mail.gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <CAKmqyKO68-STJkpC1=EO7xC-TGiM6xyzZj6gFEZB60kfeTKnpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::16) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: a933067b-75b8-477c-344e-08de529d6028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|4022899009|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlB6Rjc5WVFFZytaL2phK1lIM1RObGU1OTFQZDUyeEg3eTJkcDlQMGxuNkYy?=
 =?utf-8?B?UG1ZdVBTWnA1S1ltWXZHVGRUME5PMkNIRzFvTzRZSFpHaGJKZkV4akUySTh1?=
 =?utf-8?B?MlZhbjNjcGUxOTNhWUdtOHJLUHB3ZVdxUHhUT3FFNlJkWDk0WERlSzdKUit6?=
 =?utf-8?B?RWllVlBoaERKQmlpRk1OWWduUTVKM0RkUDc1Sm1lVTFCMFJPTU5XdEYwSVJD?=
 =?utf-8?B?Nm1NV2JhL01Ib2h0RGRnZ3l4MklKYWhhdk5ERUNKa1FWNjFTcmZHZjlDU2lK?=
 =?utf-8?B?SHRMbll2NWFCVkVGS2VXSis4K2pDYjRqejBLbFhQdWN5Q01wVkJQd3pRRUpx?=
 =?utf-8?B?Zm9OT2VlaDkzZm04TWJJRXc2QVpRRFgyaVhzclpPZXRvOTJUMmV2cENINnFk?=
 =?utf-8?B?enl4TTIvYUJvT1pBbmpZL0VoZzJuay9yaVljR1Q3cGs0OXZtQ1lPbDVjcTFw?=
 =?utf-8?B?VGk4TkdtdHdwWkdFbXV5a2psUi9MYkRnK21pWXpkUkJJYzRtTHFIM1JHTXc3?=
 =?utf-8?B?dldxVEVoU2lndE8rZDVHMDJLQ2ZuTzcrZVJsWGpTcUJhZVdIdDRkTnJNa3pI?=
 =?utf-8?B?dTg0ZCtnNWZDRUEwaDdKaGFndG13djRsbWFUVUFlMnU3cklMSll5VWU5NGZt?=
 =?utf-8?B?VU5rYXVhbWt1KzFrMWxYaUVhRFVJMG5IcHljN2cvYzZpZTZTQ2puVHJIK2xC?=
 =?utf-8?B?N1lCYU5EajVxZCtFREtoK2tKVkcrNTJqZC9CYmFKRzBheDFOeExnYitrbWxW?=
 =?utf-8?B?VkVMV1VHOGZxcEVCT290Nkl4Z1ZqNFg0eEtOenY0RXBkOThrejBtVXdUNmVz?=
 =?utf-8?B?ZFNyaGgwa09hek5NZkZZNXVVVmN6MHhqbVFBdlhYS0psK0sxRS9FZGNMeWsr?=
 =?utf-8?B?Qmw3VFlYVm52Qy84RkkyOGVwWkFBaDkrS0dNcEx1Qk1Lc0RaOFhlaCt0Qytu?=
 =?utf-8?B?MFhjc2ZmRURqY3FOS21IR296ZnpnWkdyeXJBZktsT2gvb29lZUlLU0VibWxQ?=
 =?utf-8?B?MHRyTnRuVHBlTE1NTk12YnQrdTlUZnZlQ2tZRDJ1emc3dk51M2NkWGxFeFY2?=
 =?utf-8?B?V0FHV3FDdCt5QkR2M29la1ppbGQzSXRNTjlTYWRpZ0dXdHo3ZUtucUg3SGU4?=
 =?utf-8?B?K1BySm9OZm1NRDg1YldmcTV4MG15WU1HaWRnWG00RVE2YmdrN09uUGtIdyta?=
 =?utf-8?B?T2dCUllFL3VaY3g1UlVNZ09yUnFsQlZ0RFhKTm55TmxuVlkrTU1TRm1jdHJw?=
 =?utf-8?B?VE9WZ1IxNlZ5bTFvTVd0Y21ndE1Pb0IxRzdZMVdrQ3hPTTE4WThBUXNQTTRv?=
 =?utf-8?B?dldHdVo5REZUSjV4RGthU3BuYWhmREszOHZZR0FDVUZGUDlkU1pwN0s3bkZl?=
 =?utf-8?B?NU16bkhFTXo0d3FEVVRXa2piTkF3Y2ZTUUVrdTAvMUVST1Yzb1lhUHhiVnIx?=
 =?utf-8?B?QlFiK0hMMVpBTXp4cW5jN2VNSXBYU0dERnpRanpTYWhWSTRZWURiL1lrb3ZF?=
 =?utf-8?B?czlkaFlPaGkwbDBad3lUQzZqeE5PY0tOWkJvNXBITU5ZaVR6bUdLWjhuN010?=
 =?utf-8?B?M01ybGtPVys5TnFjR1Bka1FxQ0s2RjNiMmNnYUN3U25pU3Q5YkI3ZHRaOW4x?=
 =?utf-8?B?eHcxL3ZDVUhHWlpjcm9nNmRKdThqRFRMdXdUOHBUSjJkYUZwL2o1d04wVzdG?=
 =?utf-8?B?K3BsRXhxcFhPcTJmKzlON3pzMlcrZkcyZ01KcFh4elF4VnZzd2F0OHZoVzAz?=
 =?utf-8?B?UFdEME5LTnNTRVVUd0dsOXNYUW1mRDZpbHZ4eGg2bGdCU05TZURaS2crMGxR?=
 =?utf-8?B?K1Z0a0pVNjVFOEZsM3VhTWhERjhqWFdycUVDRUtMMnBEZjcveDQvWVY0T0Zk?=
 =?utf-8?B?bzR1a3RXY2QwbHEwZGc3R1JhRmJFQmhTdFFLZnp1TEpDM3ZkUUxxWCtkMGo3?=
 =?utf-8?B?VjBzNDl1R0ZtYzZiTFZzVzB1VXR4UVAxV2M0c1o0YnovbWlyQjdTdTd4OElV?=
 =?utf-8?B?Q0ROdmo2WGlxbG8rajJtZnVSVldCdkt5aEg5Z09QZ1ZteTF6L1NXN3RRdlkx?=
 =?utf-8?B?V0pSOHM5VUxuU2RRMHNRdXQ1dzNaQUUwRDlTQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(4022899009)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnpTMm5qbTlJVzlYaHRMS3NHUlRYRWgvcG50VGd5SXduOG1XVXRZcmVYaGU2?=
 =?utf-8?B?UURGeEpGSncreDFDK1U4ZzdEY1lEN2lIRTBYY1VjYVRCSldIVWNsanpxL3dY?=
 =?utf-8?B?MW5teGdFSW1aNU01cEQxN1owd0dJRHBEZlRGSEFjVGNQRi9tYmhqZ1RRdUh5?=
 =?utf-8?B?NFBjRkZWTWw3WHBMaktuRUxKU0ltbzJSRnNPQkdEMFFraDJVQmxrajJCbzNo?=
 =?utf-8?B?b0JRRktEYUVQbWNlaG1hZElSUzVUVS9jVXI4c2ZSRGhBcXFtKzFRcWNnY0NT?=
 =?utf-8?B?bU1CRkhoSjJXRTNwaXpUbzMxdHVoc1FEZTBkWlJiTFQxTExxNHRDQXh3UnZ5?=
 =?utf-8?B?cGpnTFluS0M3RTNBa2ZUaUlIVkZoL1QrK3MvSzcwQTJudTF5QUtPMW9UZmho?=
 =?utf-8?B?ajlKV2NOUUZJQ3BiMEtSc3hQKzNHNGJ4Z29iZVJHMVpuVFhzZmxZYnJBbW5W?=
 =?utf-8?B?ZjZ4QzlMVHlydUNhOXMzN0Fkbnl3MkJuUUVPWlVFc1dyRVN4eTlsdzIvY1ZT?=
 =?utf-8?B?R2U2THFKQ1ZPK3dKanhSaXdwYlNMZjNJWlBZZjB0NWFoNHVOSkZEM09ZSTln?=
 =?utf-8?B?MXo3QmJ0V0FCbytmT3RmZXVUNHNubHlFeDRHR2gwRW9ydVhJOHdzKzRyNW1O?=
 =?utf-8?B?dkdBeEtyS3NiOUo1L0t2bHpCbHB0aHlkQXFlM2txMnptWFBsbXZUNnMrN0px?=
 =?utf-8?B?eGZQYWowZm5CS3l0YWZ2OFNFWCszdVlycERqVDVxMjhUR0NFZVhaWEFyWW44?=
 =?utf-8?B?bjlVbDJ6MllSRUFnTW1CcjNCVjRDTjNOWEczMkNCZUdUVVRkdXY1WmRYeGVF?=
 =?utf-8?B?eFdiODZmRWxjcDJreXNaeHNzazRNbmRyeE9LeDRoQ1BaczFlcFg1V3RQRUZK?=
 =?utf-8?B?ODh6S1dpRm0zRUZtWFZUNklLek12bXNXUlhFKzVqVWFHNWxmd3F6ZUdsWHQz?=
 =?utf-8?B?ZjJzWXJnbFdHTmJrM1BoaTZNTlE5VlFQTjl2eUwzaHpxNTRRYTNCVjQ4eTlD?=
 =?utf-8?B?VUZqUDI4V25aNHo3Y1ltUHV6T28rekxaYWJkM0V5TTZCUmlGTmNSNHBKNmdK?=
 =?utf-8?B?L2ZOUU5qeW90MmtXN2FQelJ5Qzl0eXpEdEZYTjF4VjEyQkp4N3YvazE1OWpk?=
 =?utf-8?B?KzBkME9NY1VadFJjVVlDWXZnZzB6SXh0UjJId204V3kxcDNpSGo2R05SYmhT?=
 =?utf-8?B?ampzektPYUIvZTlmSTlSZGJRcGxVM0NrUy93ZnVkR2JyeTh4MmtyeHRIUytu?=
 =?utf-8?B?QnpOYS9qQ2c0RjIyL2JGdHRORzhOOEtSVjdleFB0RmFYSFgrSUdrZTZiVVJu?=
 =?utf-8?B?Zy9HbWdzSUN0M1c1SXFneVhyUjI3Uk8xd040dzBmeDAzaTNsejBIK1d1SDFm?=
 =?utf-8?B?eDFVYTJTVGJWUWw3cEpiRlpOYmdQcEtMN3pMUzc4UGdaUzZzYWZPZGRvNXYv?=
 =?utf-8?B?YnRtV1lCVEdXZzExdEtRVGpVeUdzYVl4Ukl2bGtxSzdiYS9kWFZNRnVmeHB3?=
 =?utf-8?B?YlF1NTJGTzc4aGV2WUdGSENYT1F3YjdVdGhiOFZTVlhiVjgvMUlCWlkxUE1T?=
 =?utf-8?B?a05YVENtSlBZYlRVSjl4Unc4NzRyc1daanBWYnYvWlBNdlpxb2tlUkd4WmJO?=
 =?utf-8?B?SXo1T2cybkRDVkthbEZicjhoTnBRMDN4NXIvWGlTZmRhaTdtY0lra1RHck5W?=
 =?utf-8?B?K3FRbnJRWHZ6cE8xRHJLT241YkZWKzRtNWp1UVJ0KzdIUEZ6djRGaExOaUNS?=
 =?utf-8?B?QmdSL1owZWZBVTFzU0diYlo1cWdvNlNOOHJoVzRWUzB1a3QydmxLVnBPL05S?=
 =?utf-8?B?MW16azhGVXhQT2dabE05aURDZUNBOWpBZForZ1R1NTUvMFhnazByRVljS0Jx?=
 =?utf-8?B?MXJwQXR4eXllMmwvL09vckppRFRGcjVLWVJ5TCtydlVSVmlDYWlUdWlGajU4?=
 =?utf-8?B?a0Y5SEJzM0FubEVhSlYrY2NEYkR5dkxyZkozOWZhWXo1WjJQYmFjNDBRTzdK?=
 =?utf-8?B?NFRyTS93RUVjbkQ0R2N5dXliSE1rTTNxbHZ6NVY1M0J2VWhvZ09ZK1hybmVi?=
 =?utf-8?B?SC9iNVRQMnhvN25iNkduMGc2OGhKVlM5SnZkSDRVL3hLUGpSYnd6TGxEOGN4?=
 =?utf-8?B?dDlwSGhvMGY0VUVvWUxRaEkxbmpLby9WL1h2Z0VRaVgwQW8rSTluS0czbks2?=
 =?utf-8?B?YVVMcDVGdW1IOEl2bm84ZStLd055NFE0WnVtMlVJa1lmUWNOVDRWbFdmOVNL?=
 =?utf-8?B?RHVpY3I2QWlRQXd5cHd1WERtZXhaT2NmZ1QzYTk3L0VOT0p4R1pCUiszTnJZ?=
 =?utf-8?B?VndlV2NjbHpWT2FvVVp4RWR0Mkw3MGIzTnduV2RkNXZETCtNQTdmaWRzOFZN?=
 =?utf-8?Q?86VME/ei+FcDXJ1A=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a933067b-75b8-477c-344e-08de529d6028
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:15:03.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gy6A7Xmbg94zpeFuAghHmvAP8xrzzeoLDmIJVAsDqfbPyHka+zxHk3GzxA0x9V1DgJUHrF6Ljh7iHJlNk8No3/hlQB+J9DTrp9yvPYe57Hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: L9C16ZSQg7gciRRYGvTScoXerhCq86Sn
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=6966374b cx=c_pps
 a=CQGnQshk6KQL3sGkhxSvaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7v163440qiPkZoA1lt8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nYS2Dekn5F3yVF76VNZBEt_yqPHTi6hP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEwMyBTYWx0ZWRfX/ubeh/TJd94Q
 EPBQuPTGzCBpYREGy+WzBuQbRXo0OrC9/lDQ/Nbokh9f7hr4pv/yGsC38C+Bw6dXdFDYXO/wi+W
 M6wHPYVkBlYMBEGct7z9wpbEKwX8KAj5j3QhJ5THyMgJf83vovPev6Pt2F3w513WR6mXngK6Yjd
 hc5/3pvmX0ZO14lswIg7vgX7ylGANxe+jc8ke0BSM0uWOAc0qvtsMb8p8lJnacixmp9DLjcDuF3
 ouIbKMpEgScw+SEm2n6CdLX99WhOq/I2+/9uqIxtc/EKGzVE5KhEAlZsWdRgjVHW0z6rLBCO/Z7
 xRCK3YjBxclZvDy+4l3rcfvHGqTDVgQIuLYFmLJ2hAqfZqak1jUROqJaTg9YzxEsNntGSQBDyDb
 oUZ/uA6WnlkuB5ZmYe874U+zU+8ZnP9X6gZF+teq49St+SasveeKIJKTricUUOGGKoBdmhjnLf2
 e7G6Q+7F65fVsoals9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130103
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60D5INPV329510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 12:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229261


On 1/12/2026 6:12 AM, Alistair Francis wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Jan 8, 2026 at 4:22=E2=80=AFAM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>> On 2026-01-07 11:34 a.m., Harish Sadineni wrote:
>>
>>
>> On 1/7/2026 12:29 AM, Randy MacLeod wrote:
>>
>> On 2026-01-05 11:24 a.m., Harish Sadineni wrote:
>>
>>
>> On 12/30/2025 9:28 PM, Richard Purdie wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Tue, 2025-12-30 at 06:15 -0800, Sadineni, Harish via lists.openembe=
dded.org wrote:
>>
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> The `make rustavailable` process (1) expects the Rust standard library=
 source files (e.g., `lib.rs`)
>> to be present in the `library/` directory under `rustlib/src/rust/`.
>>
>> This patch ensures the required sources are available by:
>> - Copying the `library/` directory from the Rust source tree into `${T=
MPDIR}/work-shared/rust`
>>     during the snapshot setup.
>> - Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/r=
ustlib/src/rust` for the
>>     `nativesdk` class, making them available in them available in sdk
>>
>> 1) See the kernel tree for Documentation/rust/quick-start.rst in the s=
ection: Requirements: Building
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/rust/quick-start.rst#n145
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>    meta/recipes-devtools/rust/rust_1.91.1.bb | 17 +++++++++++++++++
>>    1 file changed, 17 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb b/meta/recipes-=
devtools/rust/rust_1.91.1.bb
>> index a25f65f674..7644ecf2d2 100644
>> --- a/meta/recipes-devtools/rust/rust_1.91.1.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
>> @@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
>>            done
>>        fi
>>    }
>> +
>> +do_rust_setup_snapshot:append:class-native () {
>> +   if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', =
'false', d)}; then
>> +         if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
>> +                mkdir -p ${TMPDIR}/work-shared/rust
>> +                cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
>> +         fi
>> +   fi
>> +}
> Note you can just use the Rust bootstrap tool to install the source,
> see my patch here:
> https://lists.openembedded.org/g/openembedded-core/topic/patch_1_2_rust=
_install_the/117170671
>
> That way you don't need to manually copy the files
Yes, that works. However, when using the above method to install the=20
sources, 'bitbake make-mod-scripts' fails with the following error:

HOSTRUSTC scripts/generate_rust_target
error: Unrecognized option: 'i'

This issue occurs because CFLAGS are being passed to HOSTRUSTC. I have=20
updated the flags in the make-mod-scripts recipe to align with the flags=20
used by linux-yocto.
In addition, I fixed some build path issues and packaged the Rust=20
library sources separately.

We are currently testing the changes and will send v3 within the next=20
couple of days.

Thanks,
Harish
>
>> +
>>    addtask rust_setup_snapshot after do_unpack before do_configure
>>    addtask do_test_compile after do_configure do_rust_gen_targets
>>    do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
>> @@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
>>         export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NAT=
IVE_SYSROOT/lib/${SDKLOADER}"
>>         export CC_$RUST_HOST_CC=3D"${CCACHE}${HOST_PREFIX}gcc"
>>         EOF
>> +
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true',=
 'false', d)}; then
>> +           if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ];=
 then
>> +                mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rus=
t
>> +                cp -r --no-preserve=3Downership  ${S}/library ${D}${S=
DKPATHNATIVE}/usr/lib/rustlib/src/rust/
>> +           fi
>> +    fi
>>    }
>>
>>    FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
>>
>> The commit message should mention the size of these files.
>>
>> Ok sure, I will add file size in v3.
>>
>> Does this make sense as a distro feature or should we just do this all=
 the time?
>>
>> This is suggestion from Bruce that we take it as distro feature.
>> https://lists.openembedded.org/g/openembedded-core/message/225256
>>
>>
>>
>> Richard mentioned this thread in today's tech call when I asked for co=
mmentson the rust-kernel PR.
>>
>> Yes, the high level requirement is to have a DISTRO_FEATURE but common=
, infrastructure parts
>> such as this code that just copies a hopefully small number of files a=
round,
>> and is part of the rust recipe, could and likely be done regardless of=
 the rust-kernel DISTRO_FEATURE.
>>
>>
>> Ok sure, We will remove the dependency on DISTRO_FEATURE  for copying =
the library directory from rust recipe.
>>
>>
>> Hold on, I said "small number of files...". See below.
>>
>>
>>
>> We don't want the rust recipe to change based on a kernel config unles=
s we *really* have to
>> since that essentially doubles the testing that should be done or leav=
es a gap in testing of the
>> rust builds. If you do that for the kernel first, then another recipe =
later, soon you have a maintenance mess.
>>
>> Also if the kernel needs these files, then it's likely that other soft=
ware will need it as well.
>> You should analyze why the kernel needs these files and why other reci=
pes do not. Perhaps any
>> kernel-like image will have the same requirement. Is there a baremetal=
 image  using rust anywhere
>> that you can use to check on that? I looked but all I found was:
>> https://github.com/ahcbb6/baremetal-helloqemu-rust
>> Anyway, let's focus on the linux kernel's requirements for now.
> The kernel needs the Rust core souce as the kernel is cross compiling
> the Rust source in it's build system.
>
> It seems unlikely that other software will do the same. It's a bit of
> a niche Linux kernel thing to want to do.
>
>>
>> So, how many files are needed and how much FS space do they use?
>>
>>
>> The file size of the library directory is around 50MB.
>>
>>
>> I've been around since the 1990s, 50 MB doesn't seem small to me but
>> let's see what other people think.
>>
>> Also, how may files is that?
>>
>> What's the content?  ls -lR if the list isn't too long.
>>
>> Does the kernel build need each and every file ? How did you check?
>> Can we automate the generation of the list of required files by scrapi=
ng the data from the kernel perhaps?
> It's the core Rust library. Even if the kernel only uses a select
> number of files, those files will pull in other files and modules.
> Copying a subset of files would require editing the files to remove
> imports to the missing files and seems very prone to breakage.
>
> I agree 50MB isn't great, but it allows the rust-native package to
> build the kernel without rebuliding rust-native, which seems like a
> win.
>
>>
>>
>>
>> What are other build systems (gentoo for example) doing with their Rus=
t builds to satisfy the kernel's rust requirements?
>>
>>
>> I will check and update on this.
>>
>>
>> Thanks.
>>
>>
>>
>>
>> In future when rust is default in kernel we can change this, But till =
then it is good to have it as a distro feature.
>>
>> Do the nativesdk components get packaged separately? If they were, we
>> could then make that an SDK feature instead.
>>
>> No, We are not packaging it separately.
>>
>>
>>
>> The questions seems to be whether we should create a separate packagin=
g rule.
>>
>>
>> Now by default it is getting packaged with nativesdk-rust, Do we need =
a separate packaging for libraries/files that being installed for rust in=
 kernel support?
> The Rust tooling actually does this (it's called rust-src) so maybe a
> rust-src-native package would be the way to go
>
> Alistair
>
>>
>>
>> What happens for on target kernel module development? Shouldn't there =
be a target package too?
>>
>> Yes, I have made the necessary changes to include Rust library for tar=
get as well and have tested Rust-based kernel module development on the t=
arget.
>> I will send updated patches with v3.
>>
>>
>>
>> Before you spend time on polishing v3 please explain what your workflo=
w is, step by step,
>> so we can be sure that things makes sense from a high level.
>>
>> We will update the rust recipe to copy the required libs to target ima=
ge and then the below steps to be followed :
>>
>>
>> This part we're still trying to work out...
>>
>> - Build the image by adding the required tools via IMAGE_INSTALL:appen=
d ( e.g kernel-devsrc, gcc, rust, cargo, bindgen-cli etc..).
>>
>> We could create / extend a packagegroup or use:
>>     meta/recipes-extended/images/core-image-kernel-dev.bb
>>
>> Bruce, what approach do you use / prefer ?
>>
>>
>> - In /usr/src/kernel, run "make rustavailable" to verify Rust support =
(This step will check all supporting tools are available for rust support=
 in kernel).
>> - Run "make menuconfig" and enable "CONFIG_RUST".
>> - Run "make scripts" and "make prepare".
>> - Write a kernel module in Rust & build the module using "make", which=
 generates the "module_name.ko" file.
>> - Load the module using "insmod module_name.ko".
>>
>>
>> The rest seems sensible to a non-kernel guy like me.
>>
>> Thanks,
>>
>> ../Randy
>>
>>
>> Thanks,
>> Harish
>>
>> ../Randy
>>
>>
>>
>> Thanks,
>> Harish
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#229026): https://lists.openembedded.org/g/openembe=
dded-core/message/229026
>> Mute This Topic: https://lists.openembedded.org/mt/116997864/3619028
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alistair23@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

