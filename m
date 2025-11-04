Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC98CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:37:01 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13428.1762245415070262959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 00:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=tVckDv3s;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.69.82, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5yiS/puhGQlbfck84P5bzN5EB9P/9FjccUGxMTRnnHKWuugEydxwMjTDgBzavXJ2jGlZtHzxZhSk2+GTib0A00mX5iEPQR4a1LMhQoXjHzaPUsiseJi9PbUvs+eudicQtNJll+Dwy8KVPBi/f7ds2pbEyuw35ZINKqQAbg5p4M4TVQ842i6JlWLF8/egmzc4pK0e9lhTCBRgDCHfofXKwP5gpeYhOefbwKXVIwrgUOFlfDPiz5hC/jjkyVNjHdnrR4RmDnxG4F3acA5dpsHMIo7X1TJCFUbFP3+YdoFHjuL92UGx71IPyVBqRw1pXo3DgsvGvhQk9MFW7pTcKOXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRMn8EkwPxCz+CXVu1da4BMtGq3eoE/7LlwRKCx3pbk=;
 b=B5XUnjj8o7BuI4iUfHg8HWleaa3O8qwmhUybnAE+7yW9wcEQcQ/SwhMjq4rYUvpRzA3MrGzPtkFnu3DwlKh5XGe+1a+bUU6dwLyzD6zIRU4qMVEd9+HWnGxt7meGym72tPQ2uXBb5rlJzht4EmalvKwkdxmGKmdU1FzIg5HI/Nop207h834BDdoe+YnPrQDEAdDvdAx2IZZrERJ2hz9TVljmOjah9Bqb0R7WbwwRf/h58yQipY6SgLqj+lOvJNBszxii30WGYg6V/c0cYOhQ+L/gej11X3xH8NoaEWHVzlT6SBPQrecZ6e9XA6HZXNVWt8n1fLmwFlknYX48UeVJzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRMn8EkwPxCz+CXVu1da4BMtGq3eoE/7LlwRKCx3pbk=;
 b=tVckDv3sHsGRcmLKYFi1b2hMlW3yiAeTHaRNAshbbfhwOIVMtcor3Hnsx66bIONEZI3Tvt61TxoEKKtSq7zj8OJuZcyLjGPj5D8DJ0TcEwCw7M1ON6/wfbX+8/U6O9O4noLDwbgV4lJbzwpuJOu3V76bRJl5sfR47v546BHnIJC/Y01HLP080dCqV+yA/N2Q0J4kPO0DH2/cahk9L57OsQbIdTkFRy3ruhpOASYPri8pr8lIia8o1Xcf5T2GCAKYZqpf2HoA7TOEn+24EhCKXj1Y46tbpf2Obhz2pAdTkTVlEUC3H1OD61TL2JmdVEZGS8Zzh2c7NWkt8vMEMXMJ5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by OSKPR06MB10123.eurprd06.prod.outlook.com (2603:10a6:e10:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:36:52 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 08:36:52 +0000
Message-ID: <1ff6167e-a368-491c-9973-4a3e0fd71452@vaisala.com>
Date: Tue, 4 Nov 2025 10:36:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] cve-update: Keep mtime stamp in the database itself
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>,
 "rybczynska@gmail.com" <rybczynska@gmail.com>
References: <20251103143157.315178-1-niko.mauno@vaisala.com>
 <20251103143157.315178-5-niko.mauno@vaisala.com>
 <AS1PR10MB5697FAC4934335CDF4EF7403FDC7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <AS1PR10MB5697FAC4934335CDF4EF7403FDC7A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF00007A8B.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::61b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|OSKPR06MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: ba716798-a39f-41e3-9b75-08de1b7d4d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UlliUzFBWWs5US9xZUFadlZjWmJRejlGTHBVc0FSUDFPMDNJcE1ZdWlXQm16?=
 =?utf-8?B?S0hDMjRSMlZpa0lUSjA1eWxiVDI3M25vVkI0b2ErMUdreDlNYW9ISzNJenRz?=
 =?utf-8?B?Y21LM0xtcVJndG9TWm5PRTdJeU5OSkNEZUx2N2QvdDRwSFlZYWdzNGpveW12?=
 =?utf-8?B?V0loM0pYU3d0MTgwY0E2c0VodzJSamwzZ3Z0U0Q1d2N3WlN1YjNENmZzalI2?=
 =?utf-8?B?ZHN4WWE0OERvT1BOeHlYYnVyRWVtNnJiM1VPZ1NMc1FPL1V3OStkM3ZEd2Vn?=
 =?utf-8?B?cW41RHlBWmsyKzAxdXN4bjU5OEVhVk1EVkNMTUh6NUVUbUVlNEhrZmthT29O?=
 =?utf-8?B?aGhFYzhYVGluTzhYeVFTSmJKRDdyVDNiZ1RzaE94NFpabFYzTytjaXkxdnpq?=
 =?utf-8?B?TG1WWkNZaXc1ek5nZEhuZFNhMHFXd3BLQkZUZFNUakVpbGJaVUtibUlhdDhv?=
 =?utf-8?B?cStSa3IyU3dzUkJlUDA3SmJ5QmprMytUU2hvYnNNK3VaT3hyQTZjUklwMEdi?=
 =?utf-8?B?bk84cUQ5VW9YNHBIN0pGZGJ5VFN0OXdmcDJVVCtxbFZab3g0ZGxVL2RIMkRi?=
 =?utf-8?B?aDRydWZRUGNFTWxsQ2xWK2I0VklGenRzR1F1MEUxYTdoaVhRTTNGYzdBNloz?=
 =?utf-8?B?WG9lbVlhK0ZaRzNBSTV0R1YwRUMvb2s1VmlUd2ViK3FQbHdvZ3ZsSnV4Tjdr?=
 =?utf-8?B?OUdEMFlRbG56cEJINk5xMG1PRUJ4WFZ1UVJxT3hhbFJORHhxWHJXK0dTdGNz?=
 =?utf-8?B?MEF3dmRKMnhEMGRONkxYcVhIYWpKbGZxY0FjYXduNW9CVnZEdXJvc0daVmE2?=
 =?utf-8?B?SFJUWnNwQ0pBdjFDYnZseDZXYnhlMU81dDN6TlpuWDZDNWVINUs1ZHNMN3RH?=
 =?utf-8?B?RWY0d2Vlek14Ty93Zk4wNXk0eEo2L1YzSHVaNTJxNzVmMHgvdUVnd0RFbHZX?=
 =?utf-8?B?MjdZdEgrYlZLdEErd1kzUTZsVXBXSmdNU1VkUE9mcVphek5aSW92c0didE9m?=
 =?utf-8?B?UjJVY00xQmZpYWM0aGRHczF1REdtUGh2VUhYdEdvWHl5eW1Xci9pTnZjWEZi?=
 =?utf-8?B?MTJ4dnVxS0xxaXQ0dFQybk5sSDZNenUwcVNIcDdyZUhuRWxmTEhnOEZUNDEy?=
 =?utf-8?B?UmxFYTdKZEswUWNrL2ZQcGkxRGwvUSs1cjlWc0Z2TlJkcEovMzJTb2l1TjE3?=
 =?utf-8?B?WTZCMEFaNW5uOHg4WVRNTU9vSDRKZFJhZ2RFNThMV0t6N1ErL2dVV09PenVj?=
 =?utf-8?B?SzZjT2dLM2J3RmxVRThMSFBnd0tROGc2Y0VIQmdjeXVBbjhOSENFRmZjN3M4?=
 =?utf-8?B?WkNUY2FUaEc1d0kxSjdiNGtSWEtDQ1dyVU9rS2wxZkhhcS9BUE5mUXBQZHNx?=
 =?utf-8?B?a3ZrTjc1VmlmWUo5WUUyYlJ5TjYrcUtrcXZKWFJ2dEc0ZHJmYk8xMVhLMzFN?=
 =?utf-8?B?Q05lK3RpKzR0enlZaWNQZkswbkJrNkJ3end2d1FsT05qZDd3WTF6eUE5cVpl?=
 =?utf-8?B?c0lKKzRYK2MyTVNYV1JDdjJoZEw1UFlXS2JpMXNTQXBpekNLRG1qMlNQU0Zo?=
 =?utf-8?B?eGVPODZEVERFZEFLVWNWL3htS2RyMU13S2pYYTcxTXVua3FGZjhGOWNrZ2Nm?=
 =?utf-8?B?RGxLVWZUUWprengrSkZnc3pWbWJmZHgzQ1VmdlpRTytIeE9yZXhBNk5yYkRK?=
 =?utf-8?B?d1poMHhJR0NjL0RaTVM5ek1hTVhjSVBGa1E3L2NweUUzRDBuUDFBWnlveHNl?=
 =?utf-8?B?eHp2bWxsZ1lLaUExaUZjUGtoZEFKVWYxaU11WFpXVk9pTXZrNThTeHoxa2Uw?=
 =?utf-8?B?Y21neS80cFRhQi9xdTY0a1FvaHVORUtXeEVwNFRoakdsSHpTMGJIVEhSYkEx?=
 =?utf-8?B?bGxXVzJGVVlncTRVcHNmY0JlaU5aVlJvVlZLRHhLRXJPZUppcjd5S0NKSERo?=
 =?utf-8?Q?rCh+Wp0sUU5nBX40dzCzWiMviWiE0PVv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1hxL2U3L2RSbXl2WXRZVVhvNVFpYTQ4QWZFSnNqdUtaS2d4L0ZKc3lVaXVj?=
 =?utf-8?B?OXFMSVNVTVpQbldROG56QklXR0dsY01qQUsvbHJsNnJmVnM2dEwzbW9pekF2?=
 =?utf-8?B?djFkSEE1NExZVDJCUjAwNWJXYTY3RWJkTXR6ak9qSXJ3bzhWdUU0d2JhaW9q?=
 =?utf-8?B?YytWWFdqTkx0dEh5U2ZXZzB4YnMxN3grd0lDMjNxOHpaN0NlcXlCOGR4aVN4?=
 =?utf-8?B?cXB4RjExZFVzZkRwZ3BXa0dNa1hJRHZjb0RUamZjb1F5ZnRZaC8zSlpIYmNs?=
 =?utf-8?B?YWNjTTJORjJZQjl4TDRleDVWT1RqWlhkdXJIZGoxOXViQk9FaFRndUZldVVR?=
 =?utf-8?B?OEJiTEtUeUIyVEdzWEVLU1MwS2prZ1Z3RFNZNWM1S0Q1NFIxOHl3ZVV2eXA1?=
 =?utf-8?B?UmxsNS9VaFdlQmdIY2dKdVpsVjhtSURlQmM2WkplOXp6SWJJam1YUEk3YjZJ?=
 =?utf-8?B?eDg1aGdlZkN5RFZnRGVjblFMWURkN2lQS1IvRmExSldNSmxud0hEeldYVFMr?=
 =?utf-8?B?Q0tyejNzRWpJWm0wTkVWSXdoYkxZWC8ramF1dmhqZmxHUUVtTmJYelVtdlYz?=
 =?utf-8?B?ZEdpeGFLMW0yQnhqY05xdTRVLzh5elpoN284K3RySmF2c1V2Rnh1SDR1aXdM?=
 =?utf-8?B?RFRQd1E1S0FtTXB3SmZzbERwZmd3QmlyTi9rblg1NGVNM1JPcmxsUFVzcUNq?=
 =?utf-8?B?cTFGeTlJajY3NUJ5cFNXUEVTMThNclJSSVpydWNFdWNYSGl4Wkcxb0o5YVRO?=
 =?utf-8?B?eC80NlpiSVBMaWpLYlZIRTg2a1ZuaEFZSUlyUzBhbmdpc1ZlbjlTRzlwaFEw?=
 =?utf-8?B?WW9NMk9hWHhxeTFOcVc0Qmh2eW9nTXBoZ21wK1pKbFpDcS9hSzAvR0JHQjhK?=
 =?utf-8?B?a1pqUC9ZVHlvcTVIdDdNQzczQkIrblpnWndyazFmMjZhR0pHaExxN2ZyWmJN?=
 =?utf-8?B?RDZKUERObU9NOWk2VUxLYksvVW8wQ2tEbHQxUlFGVW5udVNnOFFNbzVTcFFj?=
 =?utf-8?B?NzBvbUJaOTVidlA4VjZZdFQvVDk3RlpNeTNRL2V6a01GclhXaWl0VGpUd2Ry?=
 =?utf-8?B?Z21MWjdoTFpXZUZ1cFBWb1hmczUrblM1aTVDRGhxdEFFZCtpdElGakpIQ3A2?=
 =?utf-8?B?cUtUUGtPc3lwY09pQ3drbWMxRGFQc1pQOSsxWG02SVV2M2hyUWgrOTlYSDJJ?=
 =?utf-8?B?MnNRMkliUnBITjlIeGN1dDVneUtCOGgyMFdnQmJiOTRFVitJTmdHZ2dycDda?=
 =?utf-8?B?L29HUlp6UnJhL3E5TnBna1hMaHNRV2lWNm9DdTVXcnl6TE9YUVBiSW1mVW1B?=
 =?utf-8?B?dSttWW5EVEYrUStlRlpDU0JHQmltcExJQnFzQ003ZTdRamVZSm53aWVha1FR?=
 =?utf-8?B?NGhieGd5cFA4bXUwZmF3SkJGR2JDT3RyZ1JQVTlTVFRCMCt4T2hteTBlamw3?=
 =?utf-8?B?bDNZcFNBaExITkdCbnV1b2hTL0cvMWhLZ2k0RnR0T3lwaTE2aEQ0QVA5NXR0?=
 =?utf-8?B?d1VXSitHeTFtYnlQMmVOUVBiMXQ2Um9oZ2NjN0oyY21rald4bWZkVWN0L00r?=
 =?utf-8?B?MFZNMmRPNDhFQXRYOWgzRDlyTTVRWDhaSzE0TFExZVlaMWRRN0xXZms3ckp5?=
 =?utf-8?B?R2VyVEwrZWp2R05wdWYwa2drS3hYRWxGOWJVdVM2WlJhU0loM0U2bWpvcW4w?=
 =?utf-8?B?MEZkVGh4MWNJT3kwUHlQRVNMMG13TzFFU0EzVExCVUNNcjM2MHhJU2RwVC9r?=
 =?utf-8?B?UitlU3A3UmRVTHh0a2w1RVNic3IvN3hWU2h4cXdqZDY3azNQVEFwbnViVi9H?=
 =?utf-8?B?VnljWFArM1BsTEtyM2ZwaUFUbkljUzlteHRhODhTOFJWZnBHd2VCZVVRR2Vu?=
 =?utf-8?B?OTFJMElacVNadGtrZ3BwTE03TEhIYW9NM1djZVNJTzh6UE5uS3dFa202MnU4?=
 =?utf-8?B?dVBVTVYzcjJpYkwzU3Q0Qk5oZEczbmxYOGE3VVBGUy9Gd0paM0JhazBYVG5T?=
 =?utf-8?B?aE5HMEs3Q2ljZnFlejZpSlV0ME54R1F5MGg1QXBTTDlYbEJJME5LcWdaTzJV?=
 =?utf-8?B?eER0NXZCM0t3ZHJlY2NRaE1nVm1kZzlTOFdBQ04yNHZaQXhkbEJaeG5US2gv?=
 =?utf-8?B?dDRId1hrdmlxU2Y1eWhLOFhmZW9ITzRsMTFqWmd4OUF6VnhvT3pvV2lzcytH?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba716798-a39f-41e3-9b75-08de1b7d4d92
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:52.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iAiC2Kv3nOaMLmdZZVJ+o03inFzxINak0w3QvyMRRp9g7Dy+l/OoDKdYPifLeTaPL1rEuifWQjWMIsD1hihSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR06MB10123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 08:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225717

On 11/3/25 17:27, Marko, Peter wrote:
>> -----Original Message-----
>> ...
>> +    if os.path.exists(db_file):
>> +        database_time = get_mtime_timestamp_from(db_file)
>> +        if database_time > 0:
> 
> How can we hit the database_time being <= 0?
> Did you plan some try/catch in function get_mtime_timestamp_from?

Indeed you are correct, I had a try/except in get_mtime_timestamp_from (with except path returning zero) which I then removed as redundant.

I've now submitted v2 which includes the conclusion of said try/except removal by removing also the database_time check here.

Thanks a lot for noticing!

-Niko

