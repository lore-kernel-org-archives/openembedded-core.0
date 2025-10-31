Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA31CCF9EE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 06:52:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9015.1761893568473788047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 23:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jrUjes9j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=33992ecfb6=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V5KFLs3027044
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 06:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PYvmIgginyHe0wTvcvR51pvIeioVj32i3tlM5U7tzvo=; b=
	jrUjes9jCBthBhDSHdVnm1IXki0hTd0HtXLf8pcjNZjtLPsZSbgk7vBqcHNrrib5
	uqle/7Ok4WEzctHAT1Y63ywDo8nO28hfDMqrMvGYCoVCoqCqODISYU1HpOCe5U7j
	Pm9D+uH8pOcH6B7ecd7/qH3tFbV2953qnRyMteXDad39IcUpcayePNvJqD2tVL1h
	nbQhDySv5dE1AIqtqRrVWvEWujIDSkiq6r6sOusgXn8rNR91uiwGNUAxIlWz9DLt
	fkdKp7JODv204I7WfwZIuymcLU0rOEBAHiWZPVSmNDxSdQvJTRiPCCzUO5U6ewmi
	qogK3CO3tJHtLoG8Ro/4Lw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3w7hhh80-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Oct 2025 06:52:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwROFXOZIS473j5aItPIVIVl0cGd6qeHyeD67UZ4o/NGR/HozUol9EblyBqDNkZb3mz8AbHAgwkv96edHbtvehFjonICSJyrCzGZ7zsqfHEelUReQH/nRDXyKzgK+JiBK6UCFudd527Hsf1KkXFbJn+VeJDthatn3klVi3kshTB2lZuAZDuGEMG8Ujsv59Mxu6TjktVrVVKRpOMltl5cgZ4gjq7jPj3tthipXnkVwAJawvktpEQTnuy4n8ULhiW4hZ+dncMr7brHRq529WaXZVPEyPeKMtghEccqbmi+DBlvyosshDM84Rv+OT84ypq20R0WP3w0s2HOyumFNCaEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYvmIgginyHe0wTvcvR51pvIeioVj32i3tlM5U7tzvo=;
 b=oT6+Qua9V1miNIFosixbu3iKQhdSZFAbWrSrm+1/CVKJIOj09nRLSrDgUS3OteWSMPzrCUZ6DM7rW/CNSRY68LIR+R/ESwj21LtPZDCSHYSvKt4jKB+mRtZk3mqyHTs6MRjc/a0igwN5H6/5PVQw4J/xIMWNAtccsMez7+Cfrftwr1mjDY4xrMbkTi+9YAfRBPLK05Y02j1SJ0KggSlwXjCRIfAyu4G9xWHdCxTVjbrDveFvwpdLCMjj+G7yctjBRPoJxf1I5cdFjoeqbDBQ1QaTlqruaeAmnANRMTdrnhtDJ4i4Ffh/YcIMqFEx75QLWOphb7DM2C+k1a8Wum1/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 06:52:43 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 06:52:43 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] icu: use automake ptest output format
Thread-Topic: [OE-core] [PATCH] icu: use automake ptest output format
Thread-Index: AQHcRNmgNEciZdVGmEmnc1AuLq5dJ7Tb2iLg
Date: Fri, 31 Oct 2025 06:52:43 +0000
Message-ID: 
 <IA4PR11MB9420158D822A1132E6E8EFE3B8F8A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20251024072750.2756709-1-jiaying.song.cn@windriver.com>
 <CANNYZj_8wwBWhU5Aogn+cZ=ShtprSn-Faajkj+xJ8rD16AqX5A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_8wwBWhU5Aogn+cZ=ShtprSn-Faajkj+xJ8rD16AqX5A@mail.gmail.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=71a81773-7320-4e30-92f1-ec39497564ea;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-10-31T06:45:16Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|MN6PR11MB8244:EE_
x-ms-office365-filtering-correlation-id: 75b61e54-6dbe-4c3d-1f0d-08de184a17a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZmdCWnpIRVlGM0w0cGJjVVNoQ2FXdGRvQUVHc1BteitSVDk2bEtldURLdUpj?=
 =?utf-8?B?aG0yK0tjdXBneC9FR2U2dElveTNPZE1YNGJuKy9tS3hEdHE2aGZCeE9GYWRE?=
 =?utf-8?B?bkp4KytFdmU0YWVzT0ZjOWs5dVhVNFJtY2NTUVc2cGc2REM0VzRjUCthRlNV?=
 =?utf-8?B?ZjFEOEhYSjNjdDRXa0VPY1NFSVZrbWFnNk9JNU51KzgwYjIrdjlQNE1VTEdQ?=
 =?utf-8?B?d0FjU1VBalN5djJOOGw2SmpxK0Nhbml3VVFySXBEWkkzWW5MQllna3BuY3Zv?=
 =?utf-8?B?dGNRbUh1VnVsV2VqTUxueHBSUytTYURuY1FiVGF0N1FocmlxbE10MjIwMFBH?=
 =?utf-8?B?S1pNU1gyQ2VpcVl5M2wvQW1HQmtWblJ5TWZwNjRHR2IwVnpGRU9ZS3lma0hM?=
 =?utf-8?B?eTlHSVRLdWtybG9BNmp6ZzZwTVFuWGsvbEdjRTZ3NjgzeFA3UnN1d0dMckdB?=
 =?utf-8?B?V003d3h6TFd3TW91RjFkaVM4RHk0OU1ST292QnBaeGcvd0l6dEQrZFZRSXBh?=
 =?utf-8?B?aVo0Z2ZwMm9UZ2xRZmtKK2h3WmVUeFIrc0M0U3MxS2YxdGc0dm8xb0hNOFNO?=
 =?utf-8?B?RXV2d0ZJdDFJT2RIVlVtb1hhdlhLcy9vTTVFbDNhcFlqYnBoRjV6TkwzTGRN?=
 =?utf-8?B?UTcxNGxlZDZtdVRRazl3dFQwdEs4cngxbWloaVl6Mkd0U21ZQWg0c1E1aDZi?=
 =?utf-8?B?OTE0ZEZkK0JDak45UUExZ2JHelJqalA1bXBXZlpPQ2NYVThtRUZRL0o2Vkxx?=
 =?utf-8?B?NlhYQ0dXU09YQm5iTE5tbUVuOTVEd0MwcTUzZmZKZElNaDI2NDJLRG05TWxF?=
 =?utf-8?B?OWJpN096VDRhZkpPcHBFVkRHcHNQeWFFQWRlVFBqbkR3MWhpcVgzZXdjdHRD?=
 =?utf-8?B?dmVXSkZmNU8rTlZnSkU4TTFGaWNndmV4M3ZaTEVSb1pBMEE4L2xyK24xSkh5?=
 =?utf-8?B?TGgrRE9MUmVBYnF3d0RhcmhyTVpHT0FQblJFN0E4d1VtOHdGemdLaDRycWFF?=
 =?utf-8?B?RVpDYkxPK0o1N0JZQXBQaXJMNFNYKzQ0UDFiQm9weFJOVlZEaE5ZNHNyS2RR?=
 =?utf-8?B?Y1FjbkxJZnkzSmlxUE1tZnA3MGxXdWlzNW1rQ05yanVrRmZ4dU5vRFJMREoy?=
 =?utf-8?B?UkFRYXBPYWxmQ2FFdkxReWVHWjlWMExFUTRSczVLc1VaSmwwcFVxTno2Wm1q?=
 =?utf-8?B?cVllckdqd2w1ZWxwTnllenpZM0w1VnN6UVA2T3RISndaUW9SUTBnazkzd2oz?=
 =?utf-8?B?QzZkZS9tYUdWTEZmNkhyWGRraU82ZTJjQjYyZm9YWUcrMnNhUkxBeXMvRlZO?=
 =?utf-8?B?SzJETXN3cHplVmsybDJTdU5oVWlXcmVFb05ON0tBTm1jamNXYWZ4MVh1a3o2?=
 =?utf-8?B?Y25WWjJVZFljVnJzMUxLUndJZGF4Qk1sVmVnZU9XU1VxSldueW90S3pKMmRt?=
 =?utf-8?B?a2RWUkw1d0hSSXg5NFk0SElFVytRN3hFYmtoVEpYOVZWZENyMmN5YVZlQ2xj?=
 =?utf-8?B?MXlTR1dvTHFhVGo5M2RrRzVRQWdqWGwwNml3eVFBa2VFbDF5VkltbXdBZ1hZ?=
 =?utf-8?B?Yk9NTW5iM240NGhNUXJUQS9LMkNBVnE0NFZRWUliWkgxSVF4Z0w3ejZONEN1?=
 =?utf-8?B?TmNDb0ZNMTJOQi9XWXZTVURPUnhWa1pKOFB5SWpWeTNZMUFuQTZvTUk4dGhk?=
 =?utf-8?B?ZHJPSFhyODdQT1d3Q3N0VklHT3VWMCtIcmd0N2hDWGExYTR6VndEb1Y2R1RP?=
 =?utf-8?B?K3FNdUJkSzI0b2NUNFQ2ZjVjdytEeUFPVWI4S2RDS04wU3B1OEQ1YmpNT1dV?=
 =?utf-8?B?WWlmNUhkM2YvUDV4RHhKQkl1dEx4MUJGOHN4SUQyaXdBTFlRYjFMbFM4ZVgz?=
 =?utf-8?B?ZnZYcjVkRjhlNjQ0S25PUDJ3MWpRVFM1QmZQd2JvdUs4eWhsblp3VHR4L2p0?=
 =?utf-8?B?OXczZkJoWnoyUXA5MU9wSks3NmdaaThRd2Z2SzQrbzBKQ1BqdncxVWJmWlZk?=
 =?utf-8?B?U2EyZEpELzVFS0V6d2w1WnpyUVB5bnVSWXFqZ1EwWTBGM2VYRkcxdUJsenBZ?=
 =?utf-8?Q?FRO3BL?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L3FXR3JwUDRqa3NFclFLS1d5V3o0emFBb0VlN1ByV1hyWTYwL2FvMUpJbXJl?=
 =?utf-8?B?NVBqbGlYNG9iYkJzRFh2VVQvK0pSZ0VaNUlPOVlRT2VkYS9TeDZUUHNabG9a?=
 =?utf-8?B?S1RwQ2s3cnVvblJqRjRWbEJjYTNwRUU4M1A4N0o5YVBXeHJkYjhrSzE2T0F5?=
 =?utf-8?B?RnhLT21iV2pXcHVnOGRPQ2FCdlVva2w1bTRiUkdoWXdtbGpqUFpiejZGMFRk?=
 =?utf-8?B?U1hPaWxuQlA5bFZ6S3pCeTJVY1hDbTVyY3NDa2JhK2pIUHQyOGRoVStHQnhR?=
 =?utf-8?B?SGZuRkhZVkZpdFhhbjN5VDVMSjVJeTFsWjJYak85NEJpOCtuVkxDUkRpcC9F?=
 =?utf-8?B?VUUya2MySTJJOXlpV3BWMWdhc0QxajlkS2pSL2hLV2RudjhQSGdYZkt2dEJV?=
 =?utf-8?B?U2tjYmhYemhIeXh0dVpiUjEreFh3elhLNWUwS3dtVXV6ZHhUWnhaUzZ0K1Bi?=
 =?utf-8?B?ekJOMlZvZ1BBbXV5WUNIMFBueU4razFmZ0pXN0lNdGQyeU5Sd3VPaFFZOUho?=
 =?utf-8?B?a2lILzB2RXV3eTZlRGxoL2FJa0pxd1haSE1MZklZbVpqQk9lWjBuTkVaZ29P?=
 =?utf-8?B?YjZvalhhamdyUE9xUXV5NW5mNFlTRnpQbThhK0hZWk92MFJjRnNhRkJxWlpq?=
 =?utf-8?B?RHBJRytCWklHUHVsdTNwMWF1OVBsUDN3dmgvUWFucnVPaWJMY3dsZXRTaGRK?=
 =?utf-8?B?bitoYUZXV2hGWGJHZE9JZldLV0lHRnVqTGl5TGJNMlZucjhzRVRBeUl2QUZo?=
 =?utf-8?B?cnU4U1draDVodUladnBFdmxwcGtscWF6N3F4QldXeEpvK3hSZHdicGpmb2Jk?=
 =?utf-8?B?b2RDRU16a3Rwc0xrZ2dMTXg4ak9xV2s0elZqZUR4TDcrY2tZbHZ3Snc1SWpK?=
 =?utf-8?B?MmVObUlzWlpON3VTNmpxMzZvUVdzQjBNaUtocUdaT0tCS0ROdzNLNTJBdGdl?=
 =?utf-8?B?a1Bkbko0Z2NUb3N2c3c5QmtYNVU0RUJ4NkZZaHFLVW43OFdyYmc4MHpTMXJ2?=
 =?utf-8?B?eDlNV051N2pzdHZMWUhaeW9wNSt2Z1BGUUpuRW0wMFdnNzYraXprUy9sbnZR?=
 =?utf-8?B?TkdieTZiUXl2eVhoRTVwcWpCYWFNWlA0NTRQN2ZWZXNJNXp5VUY0N091OUJF?=
 =?utf-8?B?bzJwQXRSdG10SzBLZ09oOXdDQlNJVkVFQ0gvUEswazhiem1PTEVRY1RHdVVy?=
 =?utf-8?B?eS83ZEtpMi9kSTZpdUEvYkVhbUhVUHQvRm1XSTBuR3NRWUhhOXlhTHZDSENl?=
 =?utf-8?B?NWVSMzA2aG1KUVVCZklJV1pOckhVbTN2REhMU1cyN0JzbVhCSGF0MFNUd2RN?=
 =?utf-8?B?Zk9IWHZQRFhTRHI4MUZzYXhaZ3BvcS8vbW9HaERHc2hjdk9PeHB1Q0NWTmVV?=
 =?utf-8?B?MHBpbEdUTXl5ak1QRHk5N1dTWDhsUENsOVlpdE1tdnd5Q0h0N29VbjVGdUd1?=
 =?utf-8?B?WGs2ZjEwdUtBajNiV0tjeDlDeVJLZHFLL3dHMnQvQTZmWlZRcWxURzlrdW5x?=
 =?utf-8?B?d3dmMWVhc1k1ZmlVQ2liSEhjb0swSElzTzZxc3dobTJVVmNvVkE3U2R1emF0?=
 =?utf-8?B?NE1ORitVWGhzQzdzSkpJYXFrYWF4Y3dnUDVnYzNjRmR2KzBWYzQwSnF5SVRP?=
 =?utf-8?B?SG5QUlN0V2RHL1pSbytxWmRFVGYxQnMvNGl4QVR0amFSZzdQVkhEd1dCa000?=
 =?utf-8?B?RVdNVW1IazZ5K3gzQWlubVp2ZmFpVU44R0pLT3pUY3BmU2JIK2dSS3YrSFEw?=
 =?utf-8?B?UVVDdm8xVnNzT212MWFsZHEyN3BDUWVQTmoyakpIR3VsUXJKNHVmMDNRRlhW?=
 =?utf-8?B?WG5kVzRHSEVIaDBSUkl2a2R1MzRheXZJWnBxd0RCTEFCaWRqc1RnQnBaNVd6?=
 =?utf-8?B?WVdsdWFxenA1RWFYOW1hVnNBakdWdXRqYnp1dFhESG53ZDlzaERIb05NVzRD?=
 =?utf-8?B?Nm5xdEhrdjlMdk5wemJCcEk4MFk5Mk1SUmU4MkszVkNVZS9TY3FSVm5JOTkz?=
 =?utf-8?B?T0lTTUdwVUdKMmJWNE1WRlVlOTBPK0FiTEJsMWxhZW1hQWg3bEJXMUNyMVVt?=
 =?utf-8?B?MitFc2dua1JHK1FER3hGMW80UTgvU0RWY3pncmViK01oL2lHWUphczAvY1Vi?=
 =?utf-8?B?bCtZNmx5ZWZNVFo5a3ZuVmxCQWw4dWRWRHoxaHRyYkdKRkJPYS9NN0tEdlB0?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b61e54-6dbe-4c3d-1f0d-08de184a17a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 06:52:43.6168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0jnUZw9c7zd+wepSnmiUSiF3tJQP7LgZm8tR0euznwCnmwp/wY8GG7JpBhw9b0EiAtJGXvbVO1SMeqchrezzR+F32WILjWFUSQM2FLrHpLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA2MSBTYWx0ZWRfX+YS+YsKbk3Xh
 Whfgrub2z3xef8dq5gB1U/FWIvfGeq+++PAot2FeeECpBJ7Ptfbnj8Z497Vc+LMXOxx6bhGKcGu
 H0a6Jl4FEkknwg0WFkdQnznJ/oD44gFDhyE3MQtmQoZ0MHHoQfGa4qq7+lFyKJtQKTKIfMfOOVy
 eYPRBRR4sTzTz5I5nEtD7vn1qPyhvnCiAgkH7NEi6WlH3hwFIxoAmJgvTZ8n3yXpOeDx4LcEUIY
 d1R37Vv6p09j1lVmXUdo0cGHKnUIzYnPN3QGh/FSPl8AvjaeeGCRDEVgWD+t03SovFiGXINMvo+
 uEZKPlsH7pNpvnCMR+US+2joLQoMVlXaN1pqn2LXS4t19Au69M3Cy9jNlfCAfZ30hpMOCdvVAeo
 +YKoLdseOv/15Bhi8O1Li/9txBT9JQ==
X-Proofpoint-ORIG-GUID: l1K5RUGxAI_3IyFKf1A_PbBSZj_FC0jk
X-Authority-Analysis: v=2.4 cv=UatciaSN c=1 sm=1 tr=0 ts=69045cbf cx=c_pps
 a=wUQTFLLo3/oASVCpA6ZfNQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: eLd0whqljrL0LlH1G4PvCLAevWvyDB3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 06:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225533

SGkgQWxleCwNCg0KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLkluIHYyIEkgaW1wbGVtZW50ZWQg
dGhlIGNoYW5nZSBieSBtb2RpZnlpbmcgdGhlIElDVSBzb3VyY2UgY29kZSBpdHNlbGYgdG8gcHJv
ZHVjZSBBdXRvbWFrZS1jb21wYXRpYmxlIHB0ZXN0IG91dHB1dCwgaW5zdGVhZCBvZiB1c2luZyBh
IHNlZCBwb3N0LXByb2Nlc3Npbmcgc3RlcC4gVGhlIHVwZGF0ZWQgcGF0Y2ggKHYyKSBoYXMgYmVl
biBzdWJtaXR0ZWQuDQoNCkJlc3QgcmVnYXJkcywNCkppYXlpbmcNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPiANClNlbnQ6IEZyaWRheSwgT2N0b2JlciAyNCwgMjAyNSA3OjMwIFBNDQpUbzogU29uZywg
SmlheWluZyAoQ04pIDxKaWF5aW5nLlNvbmcuQ05Ad2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSF0gaWN1OiB1c2UgYXV0b21ha2UgcHRlc3Qgb3V0cHV0IGZvcm1hdA0KDQpDQVVUSU9O
OiBUaGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0K
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25p
emUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KDQpPbiBGcmksIDI0
IE9jdCAyMDI1IGF0IDA5OjI3LCBTb25nLCBKaWF5aW5nIChDTikgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPEppYXlpbmcuU29uZy5DTj13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiAtICAgICAgIC4vJHQNCj4gLSAgICAgICBpZiBbICIkPyIgPSAiMCIg
XTsgdGhlbg0KPiAtICAgICAgICAgICAgICAgZWNobyAiUEFTUzogJHQiDQo+IC0gICAgICAgZWxz
ZQ0KPiAtICAgICAgICAgICAgICAgZWNobyAiRkFJTDogJHQiDQo+IC0gICAgICAgZmkNCj4gKyAg
ICAuLyIkdCIgMj4mMSB8IHNlZCAtZSAnLy0tLVxbT0tcXS8gcy9eL1BBU1M6IC8nIFwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAtZSAnL30gT0s6LyBzL14vUEFTUzogLycgXA0KPiArICAgICAg
ICAgICAgICAgICAgICAgIC1lICcvLS0tXFtbMC05XSogRVJST1JTIGluIC8gcy9eL0ZBSUw6IC8n
IFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAtZSAnL30gRVJST1JTLyBzL14vRkFJTDogLycg
fCB0ZWUgLWEgIiR7TE9HfSINCg0KVGhpcyBzZWQgZXhwcmVzc2lvbiBpcyBib3RoIGhhcmQgdG8g
cmVhZCBhbmQgYnJpdHRsZTogaWYgdXBzdHJlYW0gc3VidGx5IGNoYW5nZXMgdGhlIG91dHB1dCwg
d2lsbCBpdCBzdGlsbCBjYXB0dXJlIHRoZSByZXN1bHRzIGNvcnJlY3RseT8NCg0KSWYgYW55IG9m
ICR0IGZhaWxzIGJ1dCBwcmludHMgbm90aGluZywgd2lsbCB0aGlzIGJlIHJlcG9ydGVkIGFzIGEg
ZmFpbHVyZT8gVGhpcyBjaGFuZ2VzIHRoZSBsb2dpYyB0aGF0IGlzIGJhc2VkIG9uIHJldHVybiBj
b2RlcyBpbnRvIGxvZ2ljIHRoYXQgcmVsaWVzIG9uIGNvcnJlY3QgYW5kIHVzZWZ1bCBvdXRwdXQg
YnkgYW55IGluZGl2aWR1YWwgdGVzdCwgYW5kIEkgdGhpbmsgdGhlIG5ldyBhcHByb2FjaCBpcyBs
ZXNzIHJlbGlhYmxlLg0KDQpJJ2QgcmF0aGVyIGNoYW5nZSB0aGUgaWN1IGNvZGUgaXRzZWxmIHRv
IHByb2R1Y2UgdGhlIG5lZWRlZCBvdXRwdXQgKHBlcmhhcHMgc3ViamVjdCB0byBhIGNvbW1hbmQg
bGluZSBvcHRpb24pLCBhbmQgb2ZmZXIgdGhhdCBwYXRjaCB1cHN0cmVhbS4NCg0KQWxleA0K

