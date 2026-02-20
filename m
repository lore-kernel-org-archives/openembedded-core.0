Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5FEC55184
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 10:02:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35491.1771581749209481119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 02:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=n2V+wzsc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6511fbdeb3=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K8r2GL2345525
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 02:02:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pG3CRv680DDOfEjE59oatpbAGpd5L3e2HmhritGPnPo=; b=
	n2V+wzscAJT5oKIOKdGF6d9nvA8E3mia2JEwKHqXHbx/xlJrnBelpLxOnYLMZzH6
	gRKrNj7f0Nw9BkhJHzWIcvl+qRTMI6EM8PzbWNJwUohBOqogYON1bhJnP1f4tl/p
	giKN5PLaVUUKIubcrU7D6NRkDswiVCDrxWZwP/jVSgHkwws7e1jXjL4X7G3PFoi/
	Q0sKlrr0Cv3p68Qe/CZRPjTcBxBsNt7SZtBU6iZX5I9OnYlJ3PCcJnWEWHOlvdGG
	SzuOyp4uDJ7g9FmblbmV1pgrJeixggXzctxkP+HzY73TVLSfgSJHQE++K2+zFZwQ
	UK73YexikRu1O70SYDkM2Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuahjqc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 02:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHB8oSg4QnAP5CMJxTcIrF5k5KZ+DwgetMP2LmGL5r4TIVz/mPw1xYF4hZ/sha9DtWb9BNC2/K14hxI9Z9Tx70R2nEjrDoLGD35S8+UcX6G9VvYIrilrvfVIA0NhKhAmS4CAbkMFCwef0eEWY2WDPFmWbUrznpEOLqJDZ8c8p9rK3meXiWmmz8TDUqf9btaXFpujHXnmlmzNQTwc/RHVYv5Nlx4w8N1oUUBLi1cFMXGi7d535T5KS9kirZHLO/oFMKPqM39+HoB42AVVjCYuu1AM4DaOI9lm6lzxQd87IbXBp8FUPKzffj6SvLr+gQ5y2YM/75SwS62xOP2sW2++mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pG3CRv680DDOfEjE59oatpbAGpd5L3e2HmhritGPnPo=;
 b=xH5UpXWruFjUqCg/XOC0R1WD/waiItFMCAu1Sv6MVaOBY5MA2klYZXQLlyo1ihmOgKzkZxYxG4b0Iqiq0h8dxUIW4MN7IGVMQphRcBPLTuJA8lronyC8IMqgL+znZ7kNjYOsvFQaR7suQVQyFHwyoAlVs1zUTJeirMt+vTefKj+LPDoS0GjTudlsCmTmuUV4nNj7UsFhXV4hbpcxB5CeJo7IDoqzJME0mF0ein9hadpuZgtPdiliqsmw0lJBfe7g7irquEfbFyU81aa6YIQ6SiaKVSH3Tn/OpNf7ZHYZ5C8k5TwH8pUZpqfPKCapji+puAJLPalCwyg2t69NIPj9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 10:02:25 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 10:02:25 +0000
Message-ID: <285a5816-bf09-46f3-9470-98fbd27dc86b@windriver.com>
Date: Fri, 20 Feb 2026 12:02:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH] wic/engine: fix copying directories
 into wic image with ext* partition
To: Yoann Congal <yoann.congal@smile.fr>, Steve Sakoman <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251001163457.49114-1-daniel.dragomir@windriver.com>
 <CAOSpxdas1e33jheu0ELXgQQf9e9+8ccwbFTkffhPPYObAnjJRA@mail.gmail.com>
 <BY1PR11MB79813ED8D397932BA1178D36F7E4A@BY1PR11MB7981.namprd11.prod.outlook.com>
 <CAOSpxdZwfQG_8JUbmvqnpGg=0oTimNv2q=XOc4iW71rX8G04zA@mail.gmail.com>
 <ab832338-75c4-44e7-b649-ba6251045a86@windriver.com>
 <2e67e180-73b9-49c1-b3fc-99ce82ad6c38@windriver.com>
 <DGJOVNF1UK81.79JKSE6L6FWI@smile.fr>
Content-Language: en-US
From: Daniel Dragomir <daniel.dragomir@windriver.com>
In-Reply-To: <DGJOVNF1UK81.79JKSE6L6FWI@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VE1PR03CA0020.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::32) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|SA2PR11MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf73895-6441-44e9-d3a1-08de7067256e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlhRL0h3MWZRME1XR3N5Y21mb0ZYQlQwREYvR3A3bUV0NTZpYUZyS0x0ZlU0?=
 =?utf-8?B?bGsvbDJqTXEwSThBSjJNUVM5VGhycmI0QTBUZmc4VnBWdnpOMUg4OS9sVTM5?=
 =?utf-8?B?ZXJxejZwajJUVGJNWk16OCtCWWI1WDE4N1poRlFWTW1HVDhZSkJKTG4zdzFp?=
 =?utf-8?B?dUhOOTZMYVBrTDhkaCtYclVldUNBSmdxL0s1Unp3UHcvaWt6V0RXcW56Y2ZQ?=
 =?utf-8?B?OVphRU9MeVlmeDl0OFhjR1N1U0tVNnFsSENNdGpEMU1OSEt6aUdtL200THlW?=
 =?utf-8?B?Sm5BSjc5OXJFMlFwTzdoWFA1WkY4Z3FnWFVTdzN1dlROMkx5UVhxLzJlSlUz?=
 =?utf-8?B?aTNIeVZpdnRoUmdVRGlmUGV1YS9UWDltL0lqd1YvM0c4bG5VUlhFQnhqY0h4?=
 =?utf-8?B?SGN3V0dWMmx0cUpXWFZ6OVhiemc2NGM3NHdaM2J6Sm1Jb1d2VXEzaTFzOFEw?=
 =?utf-8?B?MVBtNHoybkRoTlU5bEdxMDBKS1BhZi9kcHEvSVV1clh5TGRTaDR5UDZnOFkz?=
 =?utf-8?B?TDZ3dUx2cmdDMmlpdUltR3pXVFZRZmVwRWROTjh1SXBaZ0xTeTh5YkFyWk5C?=
 =?utf-8?B?VEV5NHA2VE9RVHZCYW9WYkprUmN0bmprRFpQL29VbXEvb1BSbG84NDBSNEtS?=
 =?utf-8?B?VHRkdXdWOHpXcG5MNWI1RmF5TjBvUHNXZVozRzlxM2U5aUpBL0NHVm90dE42?=
 =?utf-8?B?RVFUaWRVM0FEZmpKYnQ0eUttbS83ZWN0Q1M3MFlaVS83TVF2Y3FKcFQ5ZnV6?=
 =?utf-8?B?RDF2cFNobnZuQTBxU0FwZGk1R2ZHN0VyTVJ0ejRSNXFlRmJxVGhlSnR0MDkv?=
 =?utf-8?B?Zng0OHRhNG9WVkhvZEN2bm1qM0ZaclVtdjJWWld0L1lUZGlsTklTY1J4cTV3?=
 =?utf-8?B?WDZNRlJBUTQvWHREOHY0eE1icFcyWDZBS0dMUEdSN1ZRQ1hreWRLZXFPMzVV?=
 =?utf-8?B?WWJ2Y09adTR4TXNSQkdzNDZsbFpaLzU0Ky9HMlhISkxHYkxScEVqN2NJdHRj?=
 =?utf-8?B?a2t6VmtSY0l6dWpQRVhLdXl5c3BFaGwycjhvZ3JJTklXNmJhMUxkb1ZGU0hq?=
 =?utf-8?B?Y2hZVWIycEd1Q1pwYUhYUnI4RHhtQ0Vwb2xLdlpQU2pLd3ByT0dEU25xY1gx?=
 =?utf-8?B?OXZKY3Y2V0VHOHcvTWlGbnl1NU9TT0srb0xwQlpmUEdHWUVpKzFZbEpiVHA1?=
 =?utf-8?B?ZTlKZDgxbkxyelZ6Z240OEpPWGx3V05SejhDZkZ0dGg4STRXakZkanpVNnhl?=
 =?utf-8?B?bVdUa3RoZ00vZUdHUVMvS0NvN0tyanpWK0hDNDljV2dEOXJ6ckgzOTdMQ0cz?=
 =?utf-8?B?SXBnTml1d3FGN0s4QWxBQkdNMXdzVldKSUlOVzVZRmpsK3NxSllFQ2hhZkZP?=
 =?utf-8?B?TW5mb0xKV01YUXhFRTM0ODNLSVhjbENJTEd3UWF5NkNHN0tFZUZhTFdzZ0RF?=
 =?utf-8?B?d1ZTSXNaSmI1SlBjSlJ3Q1Vxd3JuVjlLK0RPRmF4ckd2U3RzbWROMkFTWTBx?=
 =?utf-8?B?UU9CK08wR3pDeFc1N1N2ZVNrbmtXbThxMmMzNUlNQ1FUQ3kvV2NUMDBhdlM0?=
 =?utf-8?B?b3RPWkcwZHNTWVVraXdZUk9yeUttU2s2czQvVHFRR0JzRVhLZm1XVmJvOGVP?=
 =?utf-8?B?dFprc0xnWDZycGdyOHRuT0dVZTVkZk1RMDJnc2Z1ZkhTb3A2RjIvY2pRSUFl?=
 =?utf-8?B?alVqL29VbmlFbG8xRXJGR0ZKUms2TTdoVzArUURtMUg2dEgxY1ZXTkRYYzFU?=
 =?utf-8?B?NEhWN3BnUkVvaUNaZlJ2SEp5K2p3QVFXK0xFYXpxSjVzRFpUZVN4TnN2NkVn?=
 =?utf-8?B?UEtWRzczeGhrUWQ2amtkU3dIeTA5ckRsdEZzOGU2V2Jja1ZxcTYxQkdRemdE?=
 =?utf-8?B?eXlqOWJSdGo2NXJsNnZGajVFOE0zSEVZUXZzNlFvNnMwNFJERGs4Q05Keno4?=
 =?utf-8?B?MGhkcDc5eGlHd01MVkd1blErai9hbkZ1amtEKzFsT2l4dEQ4WEN2NWJYN054?=
 =?utf-8?B?OGhnV1cwWkp3YUU1UVdDNFdsSEJyaUExZmFtczdVWEpHdmo4cW1vNlpCN2xo?=
 =?utf-8?B?NEZRWWNHMWFBbVA3SXlYQTZkaWRqK0gvVWNIWGIraDBUK3dOQ0hxK21hdVB6?=
 =?utf-8?Q?V9iM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UzhUSE5wYjhkb2FZSTZ4NTZNMlIrNGtUVzdKMFNQcHBTaGFFcHh5U0pwK0ZC?=
 =?utf-8?B?ZGs2QmthU2psZ2lrNVVMc25XUG9Ud2JJTzNOQ2ptQzNwUWFzWi9SbmZiR3pF?=
 =?utf-8?B?b3RvQmttSFhKcE9xK1h6RzJ2eHpybXRXUWhxbzVYYWNFeUVaa3EvalRzb3Fa?=
 =?utf-8?B?UXFUZmtFNzBFNURtK0VEVGYwU3lSUmdVTnhKV3NENkNuaTg3QVZXUkd2Zm5Z?=
 =?utf-8?B?NWFRUmNoU3d6b3o4d3pGT3VRZFQ0VlBHRHNQWUhJajRrelA3Y2sxcW5PWXdl?=
 =?utf-8?B?SS8xVU5OOUJCY3kvZEdKNzRXUzRJQmoxbFJSelRMblcwSWQwU1ZmM1Nxdysz?=
 =?utf-8?B?NFZYU1hOL1ZnM2lzUUJYOURXZ1pMQTA5WTF0QXA1YXVXY3VqSWsvOGtvVTR5?=
 =?utf-8?B?VUFkOVhMZnBHNWxDRmdWblN4bmJMQWR2cmlEOEZZT2RJUlpmbWdIZGlqME5w?=
 =?utf-8?B?djBTdzQyemNaNmtJRzRRcW44MDI5SkxpMHc1ZXlYQ0tNM1RlWGdDQVA1b2J2?=
 =?utf-8?B?MmcwVDl1bkJoRFdjUjFqVjYrYjZPTjVCbmVVS0VZQ21BT3FTQUFFQ2lYUlg0?=
 =?utf-8?B?YVFOOEI2ajE1OEVJcEhMdHhjNmhEQ1lNWXlLY3Z4RkJaUnUyQWRSWEh2aFBm?=
 =?utf-8?B?QkkwckxPdWIrOFJBUHFSZ0NRTEtJSk9uZW1XaXFXWkxwMUl0eG11YTU5M2Jt?=
 =?utf-8?B?RzFYa0pxNkVVbUF1SWdMK2o1VmF2TXJJSFB4M1FlQTRZS3RBZ09xMmlIR0R0?=
 =?utf-8?B?Nk1zSUc4akFFS2JhRmthNlNnMGZjTkxQWEJXWjJOU1BTZU93aU1jeTdZWGxt?=
 =?utf-8?B?WEdJN3BWSGMwL2x3UmlJWEptSEZuTkl4N2VPV1ZQeHRyM3hEYmU4S1hsQXFu?=
 =?utf-8?B?U0NTczFuU2YxcEZGd3RFcTVTN1JIalNLTEkycCtMblBOamphS2ZUYlQ1VTFG?=
 =?utf-8?B?ZWRzWUY3OUN6WmpxQVdpbWF4UVZWZnFwaURMU3hhQjhPTklHb1l3ZEpKR2lQ?=
 =?utf-8?B?S2J1MWM3Y1RtR0NVUktIakllS1pWWEg3UGhITlgwYXUwQzBUR3FTTmV6RVFU?=
 =?utf-8?B?UkhBN2NoR3NlT3E4Um5CMmdZYm5UbkxBQzlkVmtsVEVlcUMxbGpLMnFZM2Y2?=
 =?utf-8?B?RVFsdVhDalh2bllCOWNXT1RCRyt1RnVSZ3dhL3ZLUmhIT1Z1QU5tWW01R3BP?=
 =?utf-8?B?QU9EUnRTb3NEUTFkWStaK3F3UUc5N0lCTTN0ZkplTUtFL1ZiVTR1TUVCNjQ0?=
 =?utf-8?B?MzAyc3Q4WW1xYm1MY1NEVlZacFRjVmVoNEU2UkJWcGh0UG1TZVVNemRZREd6?=
 =?utf-8?B?b1c0TTNQcUcwaFd6ZWhTVjZBMERFZXJQVjcxUlBPeFBtd1NVYlNLajFWSVBW?=
 =?utf-8?B?ZU8ybzZ1bEdORG9FRGhMMUdUNkticWxEWXdsMkRZN0t4UmtzcmhjVUxLQ3d0?=
 =?utf-8?B?Z1doVEZaLzVCcFZLNjNnVG11dU1melE4N3haWnlHN2RoRVVmbnp2UFBKcVlx?=
 =?utf-8?B?QWNCV2M4RGxVb1BqY1hvSlZOM1QxZ0djbFhHNUFYZXhLa3o2ZnJDelhPRHNu?=
 =?utf-8?B?aEtONmFpbU11d2ZNRTFRRFRoZ1VZVDBYNm1YaTJNM203bkhWRXFWd1pvNnpJ?=
 =?utf-8?B?cVBzaVBEN3JxNXA2a2VUaTNxdDVyajVHb3M1YWpRYUNqcWxjWHJkM09EeUV2?=
 =?utf-8?B?ZGRRaGFqVDZ6cnZKUi8yaEllU1pnemVJSG1BMWF5TFQ4UmgwbzdTK0pXRmcr?=
 =?utf-8?B?QXpYV0xhcWtkZ3JnRjJTK21DSkZBTldBTThWVmtveFZvOFZFclRPTHcrVnlC?=
 =?utf-8?B?ZDdjbWFDZnNORHFGVXE3ZUJocUpCMEJVcU1YMnpJYXZLSUx0VnpPRll4Sm92?=
 =?utf-8?B?VlVBNmxwNzRCOWZxRWpjc040Q2FpQjlENTk4WVlWSnBsQlRrVnYreVU2KzR5?=
 =?utf-8?B?cHdpSWdXT0o2NHVqSzVFRGc1SGQ5MXJBZW9US3BSc0l6a0VvR2VZcHJ0Nnl4?=
 =?utf-8?B?T0daVWs1UklHRUV5STFxVXBjb0Y2NHd2RGd2YkxMQ0JJY09vNUwvamN1SmhP?=
 =?utf-8?B?M1o5bXNJRTIxbkJ3MW43RTVsb0tLT2h2b3hCTCtlMmVETjJwdVQyYWFOZzdE?=
 =?utf-8?B?Rzl3SG1QN0dBOEllQU4zVjdYcFovdEQ3RE85cDJHUDJjVFpCekp1VzQ2c04z?=
 =?utf-8?B?b0hSalV5ZHJEWWxzUnJhZk92SnQ0bFREa1lzSjFWOWRhWFNINWxEa3Jxc1Vv?=
 =?utf-8?B?Ylp4YjNmVlRycXpHUVVyejRtbitIRWhVYURwMlIrbDN4YkRLT3pLNU5qbEo2?=
 =?utf-8?B?VG5aMDJmU2VHT0JLNFYzWkdnSVUwS3dSSnVyeDEvaldJQmhKWkQ1blBHandt?=
 =?utf-8?Q?KMcuHbnNvRaKspJE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf73895-6441-44e9-d3a1-08de7067256e
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 10:02:24.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ryat94EEygZ17z0q/HyFwMDla24+6GwYIueTsLxzaJ7YwR17XeUDVCpkyru2VX++vxUdLxmfCtxdZFfZ1Qr82Agq1/gzJjmmA5cZHX+1sZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=69983134 cx=c_pps
 a=tYtg4CXWOAG754Cl0Lh34g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=GGg0yx5jKIpHePSD8U8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-GUID: O5MTtabi26vlQMldRXhhj9I9OH6z_yP-
X-Proofpoint-ORIG-GUID: aIKhVZvazINBGvTE4idtwmdvN7TmgRYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NyBTYWx0ZWRfX+u6pwvt73xl+
 nD5ytlpPAX6CVMElY9ud3dOH36FWlWswHGUa/jWvm2cjWVnOyQq82Wr5EZSdLueekkBKnfD61xW
 4xBnWjs/Ae1Ft6YzlkJhjHtRdFGZroeHoXAXuQHr5yCpNtR3Kw6VrJY66195kn7srrGjDFOZTH4
 0A88DKgZXnNdBXabBJ+ES6CqAsGtWDZxNXy+Ae1m6uGXxhCygEppojXNyrW3fEvfiOInsZHuUu7
 bf1deijPzQXdoojlNFPvkJGYKWX0daXFAkSzUPD1DjAyUUH61pZffJKPGFVRMfB8lOtMKpPyxh9
 Jmdkva+MFyqJKVgBjtRVNTQ1+ImaWh7nl3t7uPdO2T7qIh5OaESkZKQ8TsbuWtBf3WAaPhuMe+q
 aJTVUBSFthk7aeuEWdqpf5mPsjDHpPRlvOpZee8q2hhO+Xs7f4MRYCufs7iB8kaum7QszsQyNpJ
 eE5slNmx1HRSweNv4aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602200087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61K8r2GL2345525
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 10:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231503



On 2/20/26 11:41, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Fri Feb 20, 2026 at 10:19 AM CET, Daniel via lists.openembedded.org =
Dragomir wrote:
>>
>>
>> On 1/23/26 00:48, Daniel Dragomir wrote:
>>>
>>>
>>> On 10/3/25 19:43, Steve Sakoman wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the send=
er
>>>> and know the content is safe.
>>>>
>>>> On Fri, Oct 3, 2025 at 12:13=E2=80=AFAM Dragomir, Daniel
>>>> <Daniel.Dragomir@windriver.com> wrote:
>>>>>
>>>>> Yes, this is an issue on master/master-next too.
>>>>> I tested and the same patch can be applied fine on both master and
>>>>> scarthgap branches.
>>>>
>>>> Thanks for checking.
>>>>
>>>> Please submit the patch for the master branch.  It would be helpful =
if
>>>> you would then ping me when you see that it has been accepted.  I'll
>>>> try to remember to watch for it, but a ping would ensure I don't mis=
s
>>>> it :-)
>>>
>>> Hi Steve,
>>>
>>> Those changes were accepted in master branch. I created also a selfte=
st
>>> for this scenario.
>>> Could you please back-port the commits to scarthgap branch? I tried
>>> locally and there is a minor merge conflict on one of the commits. If
>>> you want me to send again a scarthgap version of the commits on the
>>> mailing list, let me know.
>>>
>>> Commits from master branch are:
>>> 6de3d2602f oeqa/selftest/wic: test recursive dir copy on ext partitio=
ns
>>> 1ed38aff5f wic/engine: fix copying directories into wic image with ex=
t*
>>> partition
>>>
>>
>> Hi Steve and Yoann,
>=20
> Hello,
>=20
>> Can you please help with a back-port on scarthgap for the commits bell=
ow
>> which were accepted in master?
>>
>> 6de3d2602f oeqa/selftest/wic: test recursive dir copy on ext partition=
s
>> 1ed38aff5f wic/engine: fix copying directories into wic image with ext=
*
>> partition
> I reviewed those 2 and they will be in my next series.
>=20
>> cb536737be wic/engine: error on old host debugfs for standalone direct=
ory copy
> For this one, can you send backport patches to scarthgap and whinlatter=
?
>=20

Sure! Will send for both branches.
Thanks Yoann!

>=20
>>
>> Thank you!
>> Daniel
>>
>>> Regards,
>>> Daniel
>>>
>>>>
>>>> Steve
>>>>
>>>>>
>>>>> Regards,
>>>>> Daniel
>>>>>
>>>>> ________________________________
>>>>> From: Steve Sakoman <steve@sakoman.com>
>>>>> Sent: Thursday, October 2, 2025 5:55 PM
>>>>> To: Dragomir, Daniel <Daniel.Dragomir@windriver.com>
>>>>> Cc: openembedded-core@lists.openembedded.org
>>>>> <openembedded-core@lists.openembedded.org>
>>>>> Subject: Re: [OE-core][scarthgap][PATCH] wic/engine: fix copying
>>>>> directories into wic image with ext* partition
>>>>>
>>>>> Is this also an issue on master?  If so, you will need to submit th=
is
>>>>> patch for master before I can take it for scarthgap.  If not, can y=
ou
>>>>> explain why it isn't needed there?
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Steve
>>>>>
>>>>> On Wed, Oct 1, 2025 at 2:25=E2=80=AFPM Dragomir, Daniel via
>>>>> lists.openembedded.org
>>>>> <daniel.dragomir=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>>>
>>>>>> wic uses debugfs to write on ext* partitions, but debugfs can only
>>>>>> write to the current working directory and it cannot copy complete
>>>>>> directory trees. Running 'wic ls' on a copied directory show this:
>>>>>>       -l: Ext2 inode is not a directory
>>>>>>
>>>>>> Fix this by creating a command list for debugfs (-f parameter) whe=
n
>>>>>> recursive parsing the host directory in order to create a similar
>>>>>> directory structure (mkdir) and copy files (write) on each level
>>>>>> into the destination directory from the wic's ext* partition.
>>>>>>
>>>>>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
>>>>>> ---
>>>>>>    scripts/lib/wic/engine.py | 63
>>>>>> ++++++++++++++++++++++++++++++---------
>>>>>>    1 file changed, 49 insertions(+), 14 deletions(-)
>>>>>>
>>>>>> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
>>>>>> index b9e60cbe4e..9d596be3a7 100644
>>>>>> --- a/scripts/lib/wic/engine.py
>>>>>> +++ b/scripts/lib/wic/engine.py
>>>>>> @@ -345,29 +345,64 @@ class Disk:
>>>>>>                                                       path))
>>>>>>
>>>>>>        def copy(self, src, dest):
>>>>>> -        """Copy partition image into wic image."""
>>>>>> -        pnum =3D  dest.part if isinstance(src, str) else src.part
>>>>>> +        """Copy files or directories to/from the vfat or ext*
>>>>>> partition."""
>>>>>> +        pnum =3D dest.part if isinstance(src, str) else src.part
>>>>>> +        partimg =3D self._get_part_image(pnum)
>>>>>>
>>>>>>            if self.partitions[pnum].fstype.startswith('ext'):
>>>>>> -            if isinstance(src, str):
>>>>>> -                cmd =3D "printf 'cd {}\nwrite {} {}\n' | {} -w {}=
".\
>>>>>> -                      format(os.path.dirname(dest.path), src,
>>>>>> os.path.basename(src),
>>>>>> -                             self.debugfs, self._get_part_image(p=
num))
>>>>>> -            else: # copy from wic
>>>>>> -                # run both dump and rdump to support both files a=
nd
>>>>>> directory
>>>>>> +            if isinstance(src, str): # host to image case
>>>>>> +                if os.path.isdir(src):
>>>>>> +                    base =3D os.path.abspath(src)
>>>>>> +                    base_parent =3D os.path.dirname(base)
>>>>>> +                    cmds =3D []
>>>>>> +                    made =3D set()
>>>>>> +
>>>>>> +                    for root, dirs, files in os.walk(base):
>>>>>> +                        for fname in files:
>>>>>> +                            host_file =3D os.path.join(root, fnam=
e)
>>>>>> +                            rel =3D os.path.relpath(host_file,
>>>>>> base_parent)
>>>>>> +                            dest_file =3D os.path.join(dest.path,=
 rel)
>>>>>> +                            dest_dir =3D os.path.dirname(dest_fil=
e)
>>>>>> +
>>>>>> +                            # create dir structure (mkdir -p)
>>>>>> +                            parts =3D dest_dir.strip('/').split('=
/')
>>>>>> +                            cur =3D ''
>>>>>> +                            for p in parts:
>>>>>> +                                cur =3D cur + '/' + p
>>>>>> +                                if cur not in made:
>>>>>> +                                    cmds.append(f'mkdir "{cur}"')
>>>>>> +                                    made.add(cur)
>>>>>> +
>>>>>> +                            cmds.append(f'write "{host_file}"
>>>>>> "{dest_file}"')
>>>>>> +
>>>>>> +                    # write script to a temp file
>>>>>> +                    with tempfile.NamedTemporaryFile(mode=3D'w',
>>>>>> delete=3DFalse,
>>>>>> +
>>>>>> prefix=3D'wic-debugfs-') as tf:
>>>>>> +                        for line in cmds:
>>>>>> +                            tf.write(line + '\n')
>>>>>> +                        scriptname =3D tf.name
>>>>>> +
>>>>>> +                    cmd =3D f"{self.debugfs} -w -f {scriptname}
>>>>>> {partimg}"
>>>>>> +
>>>>>> +                else: # single file
>>>>>> +                    cmd =3D "printf 'cd {}\nwrite {} {}\n' | {} -=
w {}".\
>>>>>> +                          format(os.path.dirname(dest.path), src,
>>>>>> +                                 os.path.basename(src),
>>>>>> self.debugfs, partimg)
>>>>>> +
>>>>>> +            else: # image to host case
>>>>>>                    cmd =3D "printf 'cd {}\ndump /{} {}\nrdump /{} =
{}\n'
>>>>>> | {} {}".\
>>>>>>                          format(os.path.dirname(src.path), src.pat=
h,
>>>>>> -                             dest, src.path, dest, self.debugfs,
>>>>>> -                             self._get_part_image(pnum))
>>>>>> +                             dest, src.path, dest, self.debugfs,
>>>>>> partimg)
>>>>>> +
>>>>>>            else: # fat
>>>>>>                if isinstance(src, str):
>>>>>>                    cmd =3D "{} -i {} -snop {} ::{}".format(self.mc=
opy,
>>>>>> -
>>>>>> self._get_part_image(pnum),
>>>>>> -                                                  src, dest.path)
>>>>>> +                                                      partimg,
>>>>>> +                                                      src, dest.p=
ath)
>>>>>>                else:
>>>>>>                    cmd =3D "{} -i {} -snop ::{} {}".format(self.mc=
opy,
>>>>>> -
>>>>>> self._get_part_image(pnum),
>>>>>> -                                                  src.path, dest)
>>>>>> +                                                      partimg,
>>>>>> +                                                      src.path, d=
est)
>>>>>>
>>>>>>            exec_cmd(cmd, as_shell=3DTrue)
>>>>>>            self._put_part_image(pnum)
>>>>>> --
>>>>>> 2.39.5
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>=20
>=20
> --
> Yoann Congal
> Smile ECS
>=20

