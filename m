Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5BACAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 18:32:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21792.1758738722668492560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 11:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZrEZbGUr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1362cf21c6=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58OHDVoH1019336
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 18:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=/qe8e44KdW0iJbK1ApzTZu
	oRRX6t/u4Doi2ZA65AfPk=; b=ZrEZbGUroL4ZkeizR0+PIk8/XA69tfS1HPAU/U
	DeMH5ooXgoS84BDrBGurkd1kZvp6bXd6rGr53Kpn0u2E2ZZ/ZzMpRNDtwz9YEjkv
	bVLStEG+hEFDw3L4w+jFcJY1mSgsZdWsZEHd+94hPcGi5qYmBVhhc1vfULErH6g6
	x+r8Wt+oSqdPVMowcvpb+WysHy2V6IKJGLrxFQ3au7e9/My0oIl0V//kZV+M2AQY
	0RB387WWVkV23SP6Qswdat/slIYuW9dECW+LeVh6JZlbSpoPE1RFQlXA2eyUIazs
	n1eqAUxATbj6IH//64OhZz1Yz9p9w+jiNEOOx4iNUSGPN5KQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89daa7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 18:32:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCiVY8GVd3CLwF9+8d6Y/9gbvuPlpU0iyUQ4kX+jQLpaUamhFaeGuBO+0YxzV32HcyA1hdAwR2pI2mlTGD5OC3xef7wQl09+zLPtAYZvr7CMncGS3WfacGOC8kqwdWQzJ6IioNIE6CeSCHf6uMBgKiQWkNyNX6w7hzRuwqQT4NayhD5y/Lt9m5O3hoH7UaeTUfjiUtRnFuFKROzvCw2XBUnDJ2cklpHEE8i0CuWBUsP/MqSGL9vmSAuoa9Eg0xYiVAr7/ZBmfXe9XRa2Cv3QCSalb45dPj0JdTIEEDZxV/63AnNkL7H3GNEEhVQaSwqWoanhWrU6uOWqFZ81YUJLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qe8e44KdW0iJbK1ApzTZuoRRX6t/u4Doi2ZA65AfPk=;
 b=dDo0fdQDwXhMqpmpHWeT+t1KDoFsSIz/Qd/MFxu3pYJjCNqaArDVvi4kJLe5T1TcW0PtI4WWzRDlrftxnRvLj0vTqGa31/GF7SJOJxiFCzTh/vUn1QAe2+jDQM6MXkGMI120rB61oehQDgJm0KHO7NtmAiQ0S/t8CkZW3J7QFreIZUvzY5FqJEqF/eme3b1FvcFbwDxA6XMJn8R/649QxCipXoERyX0/3TDLfwf0yNh7i7svWvmlVMgrPAeCEo1uhu7qBvWLt28LQG2XUSe9hH5pIxaLleGovAtqu7ADLtu3xBufrDxkDv43Xj5QHZWqM2c6u+9mkWkpMYJYLm42vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.21; Wed, 24 Sep
 2025 18:31:58 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 18:31:58 +0000
Content-Type: multipart/alternative;
 boundary="------------JnESZXYjo0sdEi3EoFtbtmxY"
Message-ID: <d9b18d9c-3a33-4bf3-996f-5d620dcf36bc@windriver.com>
Date: Wed, 24 Sep 2025 14:31:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
To: liezhi.yang@windriver.com, Alexander Kanavin <alex.kanavin@gmail.com>,
        Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1758250424.git.liezhi.yang@windriver.com>
 <c33930b39db477506067200c5c4f19cec0079b95.1758250424.git.liezhi.yang@windriver.com>
 <CANNYZj8_iTg7ukB=Zhimh5cDuUKs520AojDta3UyM7jDHFscNQ@mail.gmail.com>
 <61af5d98-8e79-47c8-92c1-ea93fb221838@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <61af5d98-8e79-47c8-92c1-ea93fb221838@windriver.com>
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: 892bf278-e77a-4aef-9b72-08ddfb98a522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QStXUE9SdjVlYkYxeGo5QWJDNjNqTngzQ05ySVNTNkFsMHIzZVU0dThROXVJ?=
 =?utf-8?B?L2hVWkRmSjhsOGJmc2tKV0g2cThkNGU5S2ZBTmVoSFo1SjR4YjRGclNCZWtq?=
 =?utf-8?B?bkdaekFkWlJsZmJoMzlCRTJLMHg3Y1J4aHJoSkE0ZDN4ZEJEUFNja0QvSWl5?=
 =?utf-8?B?cldqcWtCU2w5aW5XQktLMjdjaEtZZ0ZscFIxNVc4RGpLUnVGTVpOQkJsczJS?=
 =?utf-8?B?ZmEzVmljMHBBQ1Vkc3djL0d5VGI5UXpJRGdFNTdFaGR0SFNpM1l0Tk0rOHBG?=
 =?utf-8?B?WUM5WmZ3UWNWS2Jja2l4UC82YVVYeDZORGEwdUQ2QlhJc1V3TlI2QmlVN3ll?=
 =?utf-8?B?OElaeUpRY3hxN1o4TmQxT3VEQWduejFaYldId3I1UUdWcldUczhjZnJXL01Z?=
 =?utf-8?B?V09Hd29SMUV1YU9FQm9OR0E5MWhudXVHaXl5b3YrZlIwVkxQbEV3YU91QnVm?=
 =?utf-8?B?NGVaOVlpcFN0QlpoR0JyVHcwTVQ5K1B2SVZuZGxYSWd1b1o0ZkZHTElEbUJr?=
 =?utf-8?B?TEtHRGg5Q3BmMzJEeHQrYzNHa1lWSkRTYU5RUEVOcXlQRkIxU25CWUs1RlM5?=
 =?utf-8?B?UU0vcEV0TVYwcC9meUxROFlSVzQ3VE5NZHh2WEhyTEx5VWhTWTUyNkxwWlZm?=
 =?utf-8?B?eEE3SDJNazQ3V0ZWUGxxVGN1RkYyM1B2V1V5WmIvZ1FKU3QyUTI3V3F4VWFD?=
 =?utf-8?B?cndFNGJ5bVBRTjJFWFV6NFoyMldqdkRkeVh0NnJpa1FyT3FMbVBHMjhhaTF4?=
 =?utf-8?B?cjQvZ2ttN1dVejVGY2Y5N0JzektFTUphWjM3b2ZwdXFjbmU4WWZ6SFhjUUVj?=
 =?utf-8?B?V1JjMGlBMFFMWHQ0RDhEeDhuUWFiOHloTlJ5TGN4OU5qMldtdnpiTERWYWs3?=
 =?utf-8?B?VVNjK1NCQXJna1VkVXAwRHNvTW96Q3M3OVJFdktwOGhiNm81TWhHQU9QTjIy?=
 =?utf-8?B?WEp1L3hrRS9uUXdUM0h0MTVUYStWdm5udVIxangyeVhHeWtBSlgzYk84U0J6?=
 =?utf-8?B?QzVCaEV4amgwWEl0OENVc0lJT1p1YUtuT1ZaSm4zY3IzWm9OQXF6NFFhcklh?=
 =?utf-8?B?bkFkeFVUY0VOSHBUbVRVTFF3QTdVQXdBT0U3Wm03MW9ZV1dLYU9KTEhNZlp3?=
 =?utf-8?B?TFduVFBGc0Q3elFWN2F6WnNnUUdTVFYwWUtFQytUdGZidU9wdE9sOXdZY3N4?=
 =?utf-8?B?RjY0YmNlOUplcnk5ZW9raVRFY2hIc05kTnZBK1MwQ3kxQSsvaGxCWjNhUTZs?=
 =?utf-8?B?cFg1QlBaSjJCSmZUVzdWSGJmdGJkcTJVRk1SMHZWOXZiT0ZaVVY1b1g1Q2M4?=
 =?utf-8?B?dEx6enhFbm9paFpsMEZQYnhXMGwra1JyM2dUeFc0NjQ3REl0eStNR1oyM1VP?=
 =?utf-8?B?TWxRZG9VRFRaYmdXN3ZGaWg5Q0FiTGFCck5MUjZBSEhQaU90VXNhWlJ4UUZp?=
 =?utf-8?B?RStZcUM3TTN5ckVCODBHRHlHb3V1cXVWRy9QL3lmR1lkakVZTzJTUTd2WHB6?=
 =?utf-8?B?UGhwRXhqQkxDUE9sTXFVbHY1RW1NVDdOTnVwRUtleXlZYytUVzYwaks0TU1k?=
 =?utf-8?B?U1plNlFLbERTU2VuL0t6WkRzTGNhRVRrZnNvUDVJOGRSSlVpdTdGRFhCTytw?=
 =?utf-8?B?K3B3UnB2UFloMW9TQ0JBUXJueFhVTGtiMzFnY25uNHJYSTdIRi92bVp1Y1Vt?=
 =?utf-8?B?WkxhWklIOVNiVEI4SG1VZkFSakFmUUR2U1lScWxOeTkyTFcrdGgyNUVPYVM2?=
 =?utf-8?B?NVlscjZhRlp0WVQ2Wm1hTEtkRXpxeXBobjEwRVhrb2hmK3hmSnpiTnJUM1lE?=
 =?utf-8?B?eWNITmh1eWtnV2Q5bVVvY1FySTNGN2dzWHd2aVIvL2U0UG0xMFMwRHBDeWM3?=
 =?utf-8?Q?Zy8RtOq/7dDSi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzZ4S1NtT290bFIxalErNW4vR1R3NU9jc3EzUGZKaHJncnUvenZtMGJSMGh3?=
 =?utf-8?B?aE13SnBWRHA0elNCdm1uVitpZmNVcjZvRnJ6YnIzOEVuWmJDMEdCRng5UVZi?=
 =?utf-8?B?S09pY09ndzZIaCtrR041NGN6V012dTc1d3RTL3hrejJ2MVg2RkUvdzQ3VjAv?=
 =?utf-8?B?SlZ6Q05pVlV6UnZTbmRpaTB3WWs3bzZ0UDF1SHJMYk9UWGlRZ0pzTTNKVDRF?=
 =?utf-8?B?NTFLU2Ntbm1SNGRWb3p4RVZrc3RTVlZ2SmFtbTZhU1dUcjZ4ODdvZDMvaTg3?=
 =?utf-8?B?WkxCQzhtZVlIRmg3RW54Wk94aVNiVUwxRFVUdXlZT1h5WHZ3ZVZpT1gwcFpG?=
 =?utf-8?B?amZLUkxxQitIM0dCeFhuNzNaNjlCTkNhWmdWcWpIdjNKMG9aNGJDaWNuaUxm?=
 =?utf-8?B?TnM3VXUvZTY5T05vVUlVaDVZcE1kenRmYzNSMWZrOEFzemZpRFBvRUF4ZVA0?=
 =?utf-8?B?N2psZ2NIK3NidFUvbGQrczNaSGE5L1ZnTWF3K3BZMlFaU0dYQzVEMlEwQjd0?=
 =?utf-8?B?L3ArdGh6cVhNQ0RETC96YXp4QzdqT1N2eURyZSs1US9QRHBKblNWSXM3V3Nz?=
 =?utf-8?B?dXlydmZYam5DWUFkTWpPelEySkRJY1FvZ2dMRTNRQm1ZREN5bnVzWU1Bdk5v?=
 =?utf-8?B?QUpweHFSbk5VS1cyWWN0VG1UdDgvQVlSK2JVQjgzNFF4a1EwYjd2elZjVGNK?=
 =?utf-8?B?VGd5OVNBWVJLa3l6bUhjYzd2eEtFSDVFNFBPOEZRWUJQbWQ2eEpFbFVhRnZ2?=
 =?utf-8?B?azVmL0pndnlPV1dBK2Q1MTN2ZU4zZUFlUDlPV0RSeWdOUXNRMzF0N1hBNTJw?=
 =?utf-8?B?TnlWMzVndHVra2xpdEs4VzJjZ0V1RGRvQWVaeHpsWlFSQ2dyeDFidjk1ZTJE?=
 =?utf-8?B?RXV0QWVzR1IyMkhPMmgyVUZBM0ZBTU85aHdUS3pXTWhFV2xWVm5UTllMc2JE?=
 =?utf-8?B?bVlYSUxyakxmSENvMnMzSUIrMVN4Y2JpL2tIQkdHUjRBN3J2M0NacDZCR0hJ?=
 =?utf-8?B?SFBVUXk3NFRYRDREMSt3SGlVK0hOWGdscFhxVkxrampZdHJBN2N5UXZpZGdn?=
 =?utf-8?B?SWpTYkUyOFpFRmVBZk5jVlFnVGZuTUdyTS92SEhTUm5OOVo4VGlvVEEveVBW?=
 =?utf-8?B?WVUyZVIzRXZ5bzV6SCtMUDA3OVdtbVVjYzFsdXJPNXl5OUcxUDQxT2VKVXFH?=
 =?utf-8?B?NmlmaUgwWEhORkpnTGJFWTMyOEl6Y2NXZHFDM1VBQ3JxZnJBV2VkV2lQc2x1?=
 =?utf-8?B?c2diSUplSW0wMFFadVFPQ1JrTWthdXBmYWw5elJ3UW1BRURHSW1IY2xJci9D?=
 =?utf-8?B?dURiNkRBVndEd1hXVG1mT3YzMHdyOGd3UU5ON0VJSmVlOTJiK1RrVEc5OW52?=
 =?utf-8?B?RmZjYUNoSXYzbEJUR01mb0pGMlRmWjR2VEZlUEM2L0VzNy9qK2FTb2g1cEpG?=
 =?utf-8?B?YXgxaG11MWFERU9aYVU3VEJNZ2RKZmlGVW1VNUtmNkIreTNTUmI1YlVYL3NR?=
 =?utf-8?B?TWVIdGtQcUMvQWpYcFNsWEQxY2JwazBZNldlb0RUNlNVYng4L05JaksrQzdl?=
 =?utf-8?B?Rm5TU2hBQzV5OGY3VCt4OWxCR3JnVjErUE8yNDMvRzEyRGc0bk01SVlDYUZw?=
 =?utf-8?B?OHo1TFlMUm5qbnlCYzVYMjdiQ09VcHNFbFlUODl1MGV0Y0lXSjhFcTJkWlh6?=
 =?utf-8?B?UUhVTTRNUGdOUkxzYWkyZ3lMZEQxb2xaYythMGxmL2N4ZGVoUWQyUVBWZlQ1?=
 =?utf-8?B?YlNyaDJ2RG1DTHZDTFBxWDNZVnlqMUNiUjlvWHFvSlkyeGtSYkhyZ0JGd0c1?=
 =?utf-8?B?bDRzYXBzTFRhb0oraksvWCtWOVFvSWZmdU1UbjBUYnJXeUwwOW5GUkN6S1pS?=
 =?utf-8?B?L0dwNzcyNzB1VUtSR0o3ckV2c3JqS0I3dDFaWVBMdGp3WmsyQVN2Rk1ITUNs?=
 =?utf-8?B?YU1NV1lCdDVMdTIvc204aWJrTVIxL0xQMjNzRlVITlpjUHpNSG13VnNkaTVi?=
 =?utf-8?B?VTdtcERRZWQ3Q1JHL1BxcG1UTHRDbTdwMWRWdE15Ni9md0RNSzBkRmpDcEsy?=
 =?utf-8?B?YmlYTTMrUXl0a0cxZ3hRN01zR2xSTFhZZnRleXdYRnZQZ3dMb1YvRU1uOFUy?=
 =?utf-8?B?YzhiUFc2SUFSNGIrVERMZGoxVHBEdlhiVE1rcjROZXZscERCZEZielF3OW9G?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892bf278-e77a-4aef-9b72-08ddfb98a522
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 18:31:58.3482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nq3oueBqOSdc4PyyU6xpZZEndacAz6wuEU7y7rELPsWbYPkr9J9Q5x73wAB6bnhHyewmM7BEK8K2Gbr4SJKTKJEV47VBR3VhoglDTehBHA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDE2MCBTYWx0ZWRfX44lhFuACFrNy
 qQ9EUKwIo6aOq+N9K4GOtiu/x6Roykgoz2HautYYcxUALXvqX9AnUShHnDwgIwsf8xiq/lUUr1L
 rkZLVrdAyJzhbPRiMI+wB4QrGzbd9qnWrpaY8W1hs4aV4XCuwvgkLYPrI06gs0aN2nUQyBV2G+E
 /RKL46nflALdaAxS4RSn6ysaUxwVFc6lu0TLcSI1XU0gRW4EkDf/t/2yS8EBuzffk4BpwNyQmhL
 p2VUts0ZagcJ0OkHT/gdsIExTHiMtdrgcNh8fDKXLS6skPevW6JL6XSXj5gWW5iaSsRgC/cYlZ+
 MYkd8fqxzLWFj2IU/7sb21LrWyaaCHtznVYWMF0pvaYXt87TsfQCU+1auIsmtI=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d43921 cx=c_pps
 a=klJJBKWT8dzIbr5yswcz1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=ywDPTYs_32i-kb-tk6IA:9 a=QEXdDO2ut3YA:10 a=v8c1N9J6V01OJpLDv4EA:9
 a=zeh4vtGf3HkR9Lmp:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EWL7tjTETK4Cl3VwnWKuaPo-6lu8s0sp
X-Proofpoint-ORIG-GUID: o5QA5KiBAeH9hnL-ulvXvg3JvtTqxAg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 18:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223979

--------------JnESZXYjo0sdEi3EoFtbtmxY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-21 11:15 a.m., Robert Yang via lists.openembedded.org wrote:
> Hi Alex,
>
> On 9/19/25 18:21, Alexander Kanavin wrote:
>> On Fri, 19 Sept 2025 at 04:55, Robert Yang via lists.openembedded.org
>> <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>>> The benefit of OpenSSL 3.5 is that it is an LTS supported to 2030, 
>>> which can
>>> save the maintenance time in the long run.
>>
>> Yes, and it also add new features, breaking the promise the project
>> makes to its users.
>>
>> This update cannot be done without TSC approval. You need to get that 
>> first.
>
> This has been talked on TSC, but not approved yet, so I sent the patch 
> out.
>
>
Hi Robert,


Richard was saying that the TSC needs a formal email proposal
with pros, cons and some data about testing in order to discuss this idea.

Can you gather that and send an email to:
tsc@lists.openembedded.org ?
I think that Adrian, who I've CCed, is also interested so maybe he can help
to review the email? Just send a draft here to the list if you like.

../Randy



>
> // Robert
>
>>
>> Alex
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223800):https://lists.openembedded.org/g/openembedded-core/message/223800
> Mute This Topic:https://lists.openembedded.org/mt/115322467/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------JnESZXYjo0sdEi3EoFtbtmxY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-09-21 11:15 a.m., Robert Yang
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:61af5d98-8e79-47c8-92c1-ea93fb221838@windriver.com">Hi
      Alex,
      <br>
      <br>
      On 9/19/25 18:21, Alexander Kanavin wrote:
      <br>
      <blockquote type="cite">On Fri, 19 Sept 2025 at 04:55, Robert Yang
        via lists.openembedded.org
        <br>
        <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang=windriver.com@lists.openembedded.org">&lt;liezhi.yang=windriver.com@lists.openembedded.org&gt;</a> wrote:
        <br>
        <blockquote type="cite">The benefit of OpenSSL 3.5 is that it is
          an LTS supported to 2030, which can
          <br>
          save the maintenance time in the long run.
          <br>
        </blockquote>
        <br>
        Yes, and it also add new features, breaking the promise the
        project
        <br>
        makes to its users.
        <br>
        <br>
        This update cannot be done without TSC approval. You need to get
        that first.
        <br>
      </blockquote>
      <br>
      This has been talked on TSC, but not approved yet, so I sent the
      patch out.
      <br>
      <br>
      <br>
    </blockquote>
    <p>Hi Robert,</p>
    <p><br>
    </p>
    <p>Richard was saying that the TSC needs a formal email proposal <br>
      with pros, cons and some data about testing in order to discuss
      this idea.<br>
      <br>
      Can you gather that and send an email to:<br>
      &nbsp; <a class="moz-txt-link-abbreviated" href="mailto:tsc@lists.openembedded.org">tsc@lists.openembedded.org</a> ?<br>
      I think that Adrian, who I've CCed, is also interested so maybe he
      can help<br>
      to review the email? Just send a draft here to the list if you
      like.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:61af5d98-8e79-47c8-92c1-ea93fb221838@windriver.com">
      <br>
      // Robert
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Alex
        <br>
      </blockquote>
      <br>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#223800): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/223800">https://lists.openembedded.org/g/openembedded-core/message/223800</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115322467/3616765">https://lists.openembedded.org/mt/115322467/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------JnESZXYjo0sdEi3EoFtbtmxY--

