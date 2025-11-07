Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B578CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 14:35:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13026.1762526140839307687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 06:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=pbhTFvwg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=340611a041=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7AtvrZ659967
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Nov 2025 14:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=8sjzpEEV+2nUOYuLfQDPUQ
	b9bI5ph3EmuSDl+Fb2phU=; b=pbhTFvwgYBkLWV5EcLXeKxqJCeBjOx0hEw4CgA
	LhtMbT+ikSsRIBOQD2xyY4gQLAJtiMrrulac20eEurSQWhXsZD3RKV3SGfvw0v+P
	q09zQujvS6NLO3R4ewKCldEViCG7UwlJYjg+DAns9SiYYWOmHfyCY4KQTQFaECnH
	/LoZtYu3GX4+4qAP/Ljv5szzpm6kds3zgzIn3I4nXiuzgkVjq2ajVK3s1gUOtU8O
	SfmFjTEt0mHskH2/dTp9CTSJtI6sG+2eHRSMdoXa/p0nkmhiEKvtKiPp+tAjmVVq
	n8x0wk963cKf86rlV1Dlriy0nhvXykygrSaT0dauvY03/bLg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a96y98nfq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 14:35:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSqSxpmOhXLKbqwNuKCB5gOlWtjp1ljLIz+uPtRQ6F5l0nOuMeZG/S/LeOcW9+s5TVa/L9ns03Rw25qv3ioJ6ZZW+CkV+UZp6jnaRyNnZAC39YR6d75vuNIiWvvRdYiEqh9ZcK23w0Cejo7HBQY+IFLRJVQtv6suH4h3ntfIKE3hjXzm4JQ1Y6JAvtONOk2o3DJnq2lzxUJ1dxLjbIZzcfef/Y8iB6k5BKZu0FNUqGsHcQWCWUAtkY/pKTpzkG17q+ukePYR7VXgfGhq0W+EGcvs7gHGl0oSBVWnv8o4InkArNTW9lmEUYTXXJmW+L/D87c8hZT7OMkEBlPj48I0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sjzpEEV+2nUOYuLfQDPUQb9bI5ph3EmuSDl+Fb2phU=;
 b=IuAE5awWb7uzlLYdKTD66L9esUEcdmjQu4PgtuZH2+S/EZk0R0dLsx7XstQIOhA+9vtWzU7Z7/pPAeom2os6ODI3NzfN7ccOzVCFeWtnbOLPr53iuETyEzR052zbrDhhVmRs8JHZLRNDloD6eeJ4YzkzKjCtuqa3BV7mQafSfOtl+TDQVCZwyL0O4PmRe+izXrJsgR+84RGvvMmJeqlYGSg/EIWkkFzEL4hhKi2yPUexOv4hYmrgqjH7RBeH6QBjva1TNMaovkw5lRD9R1TMTWZseaHgP4SoCpCxb31G3z+iVLnO9pCt9/CTloEpR7MWQIoq7eqB8zi8HFVwvmdoug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MN0PR11MB6058.namprd11.prod.outlook.com (2603:10b6:208:376::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 14:35:35 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 14:35:35 +0000
Content-Type: multipart/alternative;
 boundary="------------7U73D9LbX63ROo3MEgkn3Kng"
Message-ID: <ac2bc7c1-4e23-40a4-bfd9-c800873159d3@windriver.com>
Date: Fri, 7 Nov 2025 09:35:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] package_manager/oe-pkgdata-util: fix
 complementary package installation
To: Qi.Chen@windriver.com,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250924084233.3429501-1-Qi.Chen@windriver.com>
 <CO6PR11MB560294040AD5A59501524E32EDE9A@CO6PR11MB5602.namprd11.prod.outlook.com>
 <DDJUY91C0269.2QMM9NMD7SA2G@bootlin.com>
 <4f933821-481c-4cfe-adc0-b734792fc006@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <4f933821-481c-4cfe-adc0-b734792fc006@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MN0PR11MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: f18662a9-3ffb-43df-792c-08de1e0ae9cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a24wR1ExcDdVUDN0MjRXRUpjMVpqOEtHai9ZZElkc1d4aXJWTFd0aURpaHMz?=
 =?utf-8?B?UEV2TkZIODdaVWg2UHJPa1pCeGpRTXgvcjlHVTdJbmxYdjUyWFhkYWI0RWs4?=
 =?utf-8?B?WjViUmJZZUJWeXlla2UxVzIyblFWdnFBbUR5RXYxR28rM25pSlhkeElzaGxV?=
 =?utf-8?B?c29nWFlhUkpHcHF4ODY2cTlaRmlRcnJLd2plaklqQ214U3N3U2E2Z25md3ZC?=
 =?utf-8?B?U1pIUHpPbUt3ZHdwUkc5OTcyN0Z0ZGpmKzcycm9sVk54aGxFYUdZbEtmSmJF?=
 =?utf-8?B?dDhNS3pETDlRSVFaMk83QitmOFhweFZiUitpY09kWkNIcDlHTzFkbENWRjJq?=
 =?utf-8?B?QUdKV0xKbXpDUGZ1NU00MVJPaVpaTVdFaFByZTFrcWZDa0tDU3FUbWRMWFlp?=
 =?utf-8?B?U3JOMnNLcFd3YmJkcnZlNEtwSUFTTVpGVVBxaUNsWjNwcUVmZEltNTVMV1p3?=
 =?utf-8?B?RjNFQzhxZkloOE04ZUZmZmdwZXBLMEJ1dmgveFNaZW1tSHliekQ3aDRxT2d1?=
 =?utf-8?B?RG1IMHJJaHh6TFBYQkw3citTRUNlQktoaGhtT0doRy9aN2dVWVo2ZnBrUW8v?=
 =?utf-8?B?Ui9uRnI2MXdFOGhsbE43b1NLRzFlaEtzNmZUdUlQbVFxc1Z2WmdwVkVVKytL?=
 =?utf-8?B?cHVhbGl6dSs3YXdNOGF0VWREbXpHNHovZCtCcGMxOVJGRDB5YXYwNHRSNFlh?=
 =?utf-8?B?RUR4NE1xK0JGczgzakhGd0x3OHp3dHJzZUk0eTBNdGdpdFllbEVZQWhKc1FJ?=
 =?utf-8?B?azhNMDhWUnQ3RjI1akdpMVViemhDWnRmWUF3YmgveHBSQndPeDZNaXo4SzNt?=
 =?utf-8?B?ZU1WeEhONDJwUm9ZTzZUa1VmQlBOcmxHMnVDQjFaYnJrc3hQd0VCa3V0UEp2?=
 =?utf-8?B?bkJZZUMrZFFJZGcxUmJhMlMyQnBUaS9NSGU1aUZWMDIwK2Z6cXhJNUF5RVZ1?=
 =?utf-8?B?RG1FVnFhNnVoQStERmdRWGtIdzEraE1MYnVLMXljb09iV1lGQXFUNEc4WXFW?=
 =?utf-8?B?d2V2bXBMbGNnUDJhd1FPMzl0ZllhM0s1ZDlRVTR0dCtDTFd5WitYZFBMQnlo?=
 =?utf-8?B?TkNuRys5aDlMM2kxby9LbytsdHJFNnF2aThxWlJ0WHpzcUFVbGx2L3BjL1U1?=
 =?utf-8?B?MUVTdHFBenZ0dVBMcjhNa0pXbW9wMXd5WVBTVFVJcGcveEozZE0rZ1VXQ3ZQ?=
 =?utf-8?B?VzJxZDJVOTBQU0Y3Ull2RkxFdUdVcFNnS3JQeENVbTVXcWM2L0x5NksyeVA4?=
 =?utf-8?B?WnZudHg2TDlMYXl6TVUrRnhyVFVUQS9VQmZILzJXRUpxVDdqb21BMERzQ3Nv?=
 =?utf-8?B?TXlDVmcwNUpZNC9uUmdraHZuZUwraGZuY1IyZlBINTR5V3FvR1lOQnF4MnU3?=
 =?utf-8?B?T2xUaTZ0REl6aW5iWGowVHAzTmpsMGtlOC8yVUJKWnFxMExKTWJSYmZqM3Vx?=
 =?utf-8?B?N2NKMXN3bFptbE1pUXBnWWV4ZDRjUE5Ra0dDKzRFRW5KanVnRTFBZFAwcWx1?=
 =?utf-8?B?dTBkcmFHbVdPQ3owSlpXK04yYytMdTBLaTd2Y1ZOVE1VZGt6RTU3VGM5SnhM?=
 =?utf-8?B?TGJSZXVhWFo3K3lpMGVJZklkOUhWRXppMTVYY0xwcjVXK25LMHlJTm9wZXk0?=
 =?utf-8?B?d2RqY0pKMXcyUFpMVTdMR0IxRDRaZHM1aVV4NzdNODNNVzNhMEVYeWhqRzgr?=
 =?utf-8?B?Lys4clh1YytCTFIxMUFhcXZxM3dpRElwajRIWHFJcmFNT1kzWGZyak1aQWtD?=
 =?utf-8?B?Q0NwSzg5b2ZNVjk2UUNwZUwxNC9UdE1VYUMrUE1VY24rRFdpTTBlMytETXhV?=
 =?utf-8?B?V1pZN05MNWVtUFh2c2xSVGdHa081WmNDWHhpU1FOUzFUbytMQWtPWW1IUHF5?=
 =?utf-8?B?cUJTalQvKzR5VW1jTjFjeXhJZGVPc2tta3pxNDJRQjdQNm5lUGhnWlBsT3Vu?=
 =?utf-8?B?WDMrQWVVSEtDeU9rL3JMN1dyRU9mK3Iwb1R2N0tFSFBtTW1QM2JNdG10NEs4?=
 =?utf-8?B?SG5Pb0l5TXN3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmtuOHFHK3V5MEZROTlnWVZLbTQ4Q1J5NTZvOGlES1BGZDFrMHRoc0didlVs?=
 =?utf-8?B?WUJnS1JIN1B5WmtPa3BRWlIwdEhYMHJhL3ZvRU9VNUZMUU5EeWlaWTFic0Nh?=
 =?utf-8?B?bjZBa2pOSnhpNFhoNzZMc3Y0eDhGbkZjWUZUOFlvQjhtVVFoYjVieDVISzc0?=
 =?utf-8?B?aGtKbVhldGY5WDhZVmhYNEwxUEdzeE5xRmFBdzZ1VmN1TXF3eGFVNXdpVkpn?=
 =?utf-8?B?M1NpbmRkWStMaEF3NkxXeUZnQmNmK2sraGppNkVKUW5rQVg4WmpBc2RiRmVl?=
 =?utf-8?B?VjY0Mzg1YmxmVnFGM0ZnU2FFUWZvcUhsT0VDc2lqUTZmMjhYNVA5SHIxVktT?=
 =?utf-8?B?WWtWdmQ5Y0M5aCtVMlBkb3VwSktLWml4MEJNc0IxY1p4NFc3bTdPWXQ1eHR2?=
 =?utf-8?B?NGI5RC9yYS90YjR4OFR0bHpPYWpvZTJiMlpYaDl1RkpsWTVZSzF5OCtpVW5m?=
 =?utf-8?B?R2ptWGNGS1RvT2NGdzRoRE1ZRGJEV0tOelpEelhFRU9lcXJ3bUxrY0lNcWI0?=
 =?utf-8?B?TEZua25pa1E5VkNYeG1scHY5RUJ3dGttSEpSY1NlNDJUSHNHMHptTXpSeWsv?=
 =?utf-8?B?VmxlbDR5YVo1ejZMbnBXWFJlRjJYM0R2czgzaCtiVVZFZzhxZjBnTFVLUkNo?=
 =?utf-8?B?OU5CbUZ6WG9RL3h6V0JHRWpQNDdPYnRsejhENWdxRkhiMXZkdm01Mjg1ZWpV?=
 =?utf-8?B?a3hWQTR0QklaUUh4Umh5WXY0TW1GN2NDNk12ZXc0SHNkTG5rM09qZ2IrTi93?=
 =?utf-8?B?K2s0UE85c0ZsS2RBbFBGSlBFMkdhTUFQcG5TRE51dm56WkVpZjczRHFBVmpm?=
 =?utf-8?B?Y0pDYlNSUDNEdGdRYkRoZVFQQ0o2TktuZHJlNStlM1hXczZXUnBYL3p1OUEr?=
 =?utf-8?B?bXVRdk5KU0FtZFI1YzRXOFoyK3oyR0tsd09VN3NERTFCQkMvc2I2VVdYbFR2?=
 =?utf-8?B?enIwZ0RlRU16eGRVV0VWODFhakdDaGtkM2ZOVWUxaU5xdXYxRjRxNlp4WjRE?=
 =?utf-8?B?ZmQ0MHdtZmNzYXRsVnIyR01WVzMzTDdwcC8wUnFTalFrKzVSYitCbDNjTjQ0?=
 =?utf-8?B?T0JsQTFWU1RpZkcvODQyVFg5N3NQdFBPR0xyaUhrNi9waHhQWEUvS1hDVzI2?=
 =?utf-8?B?ZVZldVR6c0YzdjRsaUFOblZtRjB6a1hrVXU2WmxYZFBUWHVwc2ljUDJlSk1S?=
 =?utf-8?B?UVovWlE4NmQ5STlzaWJNYnIxNFFaNUpTb29OMUd6MjUzdHZpR3I2OEprZ0pr?=
 =?utf-8?B?dk9iS0pRT0ZscExFUnZOc0lqK1lPNjNvQithOHQ4TDZsRzBpNWZhSEhJZDV5?=
 =?utf-8?B?YzJjemR0TWlVR3FQL1RaQk1pNUNXdnkzQWVMNnpQaHBZL2lSdHF6R0RGWGVs?=
 =?utf-8?B?T3lIMjFjUG4zbUtINEhjR2plakx2UCtFNFdObGo4S2FKVmxocFFiQ0plR2ZB?=
 =?utf-8?B?RFdLdG5Cd1I2QTBiL0pxam5qVW4zVk5yZnEySTNPSFczdXBpSkxGNUJwekRy?=
 =?utf-8?B?bG1VNWNoNUZTVDRLaWd3aVR2R2FsRnI2ZytmM2wwN0VPdjh5aSt1c2lQc0Iv?=
 =?utf-8?B?UDZRcFNmdzlCOVJDOHpEQWxlNmdNRThSVHZKblNUUXdTSkE5ZWsxZW5WN01s?=
 =?utf-8?B?OUpxVXZrMjNjNlhlVGhKQWZXRWs3L0tka1dERkdEL3p6eUMyVkpHc0tEOU9N?=
 =?utf-8?B?L1lxTEowZkd0c0NUakhnZmxTMzFKRmNNQU9TVUVqR2J0eVZWMjYwZ2ZIWnhC?=
 =?utf-8?B?NUd5Q0s4d21nTnpGSzdVZUd3a0NPWVdzY2cxZlh2T05icFhDRHlZNGRmTDFo?=
 =?utf-8?B?UnRnVllUQXJZWk1iLzdJczFOWk1WS2kxK0NtQ05MOU45dlFqWmxlWThLbGZ3?=
 =?utf-8?B?dmNiZHViRWlPYTNjUXl5WEZ0amxpdWlxdGdpdndLdEpNUnRmZTRzR3A3aUFp?=
 =?utf-8?B?YjlCeU9YOWJWWE9ZeEs0cG5MQlZjc2xid29udXJyQUZmREpUeUZKUG4veC9u?=
 =?utf-8?B?NG1NY0pneitHYks1TUxoWGs0bnltZlRaV0tRd0d2U0hHd1plM2taRW94eW9u?=
 =?utf-8?B?M2FTQmtZUXRpcFJ4S3VWcU52bmtseEw3ckpUbE5MeVFrdjRQcWRsaGdob0E2?=
 =?utf-8?B?V0FZdzBxQzhSTitvQkY5ODVmTXlVaTJoZ281Ty9hbEZsRmV6S2dDK0pRa2FD?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18662a9-3ffb-43df-792c-08de1e0ae9cb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:35:35.6887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1cekmZe65o7L8Boyj7tzrmc5UXrx/1gDeu+xCwC9jJ7y+qLt669Rdu2GtqJGW4gBk2ruenR0IdXlUO3a1xzD+t8ygaF/AjAXM5Cu6/b1qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6058
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 0olwwNFFpY0H1U_QUqz9Uj5-C2XOsLBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEyMCBTYWx0ZWRfX4PiWJJUBrIJB
 ACohVjEEs7p893a3qT5T1yP1Yzd3W20EJmNRcv43PaC6SUOn48mxkjr+FQD6e/qO+hWAgIzSEO3
 zZg9aCy9ZF+ezeLAN+zWEnZBt4Qma9gE8JHDg9rCxJJZFxaJBpR6eioGNrF7zQBodLyJmx8iYCL
 CTPLR2P8hRJ73w6DYntjxnujW92JiVYYSFvMVAXl2rMjDztC468TGsf0Mmmc0cSbpqKf0SXHZ2l
 rF+P87TvPGLqdu7Rma+E0THQOHK2nSQrG/gkMdZ8hplH4i5ZwWz5kPreQcFYak5UL2AtiDXRnsf
 ukZW++vgOxt5UI0H/gPYrmQEyyHk4PsZd2laN3bme0UAVT8z6uMYUXa100LKlhVy5Z+SHnJ49J5
 vahuTwxWtrbvccB4Z7ebWS56EJ7URw==
X-Proofpoint-GUID: pxNlULaw9reDgIryh-AA5nXm7BmzqXoV
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=690e03bb cx=c_pps
 a=LWr4lAA3g636x20Wckjs+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=MedOLF-68HpDj6L9NOoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=i21gLc5L_NAsOsI2MMEA:9 a=_JKP7m-NyAXTge0N:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 14:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226056

--------------7U73D9LbX63ROo3MEgkn3Kng
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5A7AtvrZ659967

On 2025-10-16 10:44 p.m., Chen Qi via lists.openembedded.org wrote:
> On 10/16/25 23:39, Mathieu Dubois-Briand wrote:
>> On Thu Oct 16, 2025 at 10:35 AM CEST, Chen Qi via=20
>> lists.openembedded.org wrote:
>>> ping
>>>
>> Hi Chen,
>>
>> I confirm this patch is still in the master-next branch. It is still
>> considered to be merged, but this is a non-trivial change and nobody h=
ad
>> the bandwidth to review it so far.
>>
> Got it. Thanks.


FYI: This patch is still in the same state.

The patch doesnt' seem to be critical/urgent for 5.3 and it's a big=20
enough=C2=A0 change to take some time to review.

Stay tuned and/or resubmit once master branches and people recharge...

../Randy


>
> Regards,
> Qi
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224988):https://lists.openembedded.org/g/openembedd=
ed-core/message/224988
> Mute This Topic:https://lists.openembedded.org/mt/115408639/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------7U73D9LbX63ROo3MEgkn3Kng
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-10-16 10:44 p.m., Chen Qi via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:4f933821-481c-4cfe-adc0-b734792fc006@windriver.com">On
      10/16/25 23:39, Mathieu Dubois-Briand wrote:
      <br>
      <blockquote type="cite">On Thu Oct 16, 2025 at 10:35 AM CEST, Chen
        Qi via lists.openembedded.org wrote:
        <br>
        <blockquote type="cite">ping
          <br>
          <br>
        </blockquote>
        Hi Chen,
        <br>
        <br>
        I confirm this patch is still in the master-next branch. It is
        still
        <br>
        considered to be merged, but this is a non-trivial change and
        nobody had
        <br>
        the bandwidth to review it so far.
        <br>
        <br>
      </blockquote>
      Got it. Thanks.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>FYI: This patch is still in the same state.</p>
    <p>The patch doesnt' seem to be critical/urgent for 5.3 and it's a
      big enough&nbsp; change to take some time to review.<br>
      <br>
      Stay tuned and/or resubmit once master branches and people
      recharge...<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:4f933821-481c-4cfe-adc0-b734792fc006@windriver.com">
      <br>
      Regards,
      <br>
      Qi
      <br>
      <br>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#224988): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/224988">https://lists.openembedded.org/g/openembedded-core/message/224988</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115408639/3616765">https://lists.openembedded.org/mt/115408639/3616765</a>
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

--------------7U73D9LbX63ROo3MEgkn3Kng--

