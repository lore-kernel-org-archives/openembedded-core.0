Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F26BCA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 05:13:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14281.1757049176539708663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 22:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=pRDfGxkB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1343256814=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5854ait9220791
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Sep 2025 22:12:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=EbejZApepl1G3KMcNRQQKl4bPJsb+LGty3peSt5b/+Y=; b=
	pRDfGxkBhyz8b8DjGqu/HSgKuJ3i/qrTsyy1hAu0ViQu1TjJ7n4Wwx04+azWHZkH
	tE0M0kUGyOTim5khTNxC4B5O/lBYM5f70515SfcGTRTkSB8kipg3BHF8RTcmVABM
	3j5hNwiEhV1UgSi9B2SkJe+IUVGabH2be0hdqE1BXCLyPcdL4pjCk76LTdNopGsC
	LFpe6LIL9OguJFZF/HA85v9QIQZoQ7c5QOG0SjTJm9c0jRsmEi0DbhbGJPE30t8F
	jqV0pHDJU0CqXZrarTjxORFjgrkxJIonoY8BFZpX/ZXMp3taXcdPLOv1DGZ1mM3J
	Nmh9+8FVHO8s0imH7wNUCA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7sb1bvg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 22:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofk11uaznYVlGCYcC5e6r7ioCfLV7fSpX3/2N8zgXlovxwB7X/xScDrL1i3Cd5B/HZwD/1nghEl2ZITX/7tgLAa0rLY3XtnW7p9q0smJ480KVSlNDR7Ws5lFhMLfYLD/Q+bLMIkwVmGBvwCYnh9jB7cv/GhWT/na8nXPySd7UuwiZHH6AuhVOPdruf9j1Mhc8lo+m13H/zR+FFTlypNLVm/MO2u2NmnF7qdvRdku2RUWu74lA6nqG19i0nUikMp8Ys1c3P5CuCKupGPdlV+M+3OKD79zVSVmflV349oz+oBiyGPmUrV6OPYofkuhBqPhDcLrQC4og5blrImp9nc4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbejZApepl1G3KMcNRQQKl4bPJsb+LGty3peSt5b/+Y=;
 b=OiWjxenf2FTT38VlDOF7x6eoFvsNnkZem7bxF9agwkPb9t2rgYmCP9MD5F0yv5Qg9ObtI1Dh7HLvCmYZi4BeaitrJKs3xGnLAjJ7kI0+13WCZTNHD7utUcNIo/VziFHnmCdNyH4IS5mf0mJy7ASufg0kajCbR/5pVIIJBSIBRL+Afmlhg9aRhXvWB//CideXe/1yWOwmfA6SSZXUWDe1kzGBBejpLWdkN+xsh1IOb7DodsXAg58qDYLmu8FsBVKkz4L4LPkr5qBDYYFTYCtGb9hGo8ycTSnTBHB2s9PT5t9PtrURI3M1Xvo41cIpSNcpQ/CJfRtyI6VEm4I+DLYTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 05:12:53 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 05:12:52 +0000
Message-ID: <e038f529-1c06-408a-8d28-b2ec6bc6d17f@windriver.com>
Date: Fri, 5 Sep 2025 13:12:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH 1/1] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250903081113.3182850-1-haixiao.yan.cn@windriver.com>
 <CANNYZj9Qr7uy-bZGGEt23MWXHkX-fU3TYQc3WYoX3KEtTC9NtA@mail.gmail.com>
 <108f0edd-3a59-4b2f-86a0-7afc439c884f@windriver.com>
 <CANNYZj_z3UwqgYqmvUYBG+c2iANjib9=6CZYapi1zCjycN_4cA@mail.gmail.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <CANNYZj_z3UwqgYqmvUYBG+c2iANjib9=6CZYapi1zCjycN_4cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|LV8PR11MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 197ac850-e35f-4298-6482-08ddec3add6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWVPYm1qUE5wSm9pK0ZwVDNmRVpRbXNweGRodnlOcVhjRlpkQTROdHBsTG9a?=
 =?utf-8?B?RWF3a1luUGxkR0oxRkgwWFU1c21NS0MwZXV0MXdiQ0o3SWliZElvVG5Ba3NZ?=
 =?utf-8?B?WkZTUnNVT1FzS2tybzZWU1IrT0VIQnBQNjlpd3lDa3dVRlkweDh3V3A3bXlW?=
 =?utf-8?B?S21ZMWVpVkxweWpNcEw3Yk9neDlqM0U2d3Qzc2g5d25YbkdxdHczMGFrSjlt?=
 =?utf-8?B?dzZmMTB2ZExoYmxCTVgwU0ZPN0E1dVNZMGFOZ3oxc3hYdCtlSXU1c2lscFlh?=
 =?utf-8?B?bzNEbktkV29XYUxXbUdUb2plUk4rZmF4V25ZTlI5aEpGTmZZeHdmNDJyQitF?=
 =?utf-8?B?YkNYVzE3Wk1JQzFHK0lybmdWM0NEWjYxaXk0cWNkQTFKM3Iwa3FZbm5ETlZY?=
 =?utf-8?B?elErOVJGY25sM0FzYy9KVVpkeDBKQTlKeXNGa050ZmVlajdyQzNmWTMwYmo0?=
 =?utf-8?B?SVY5NnRLbnNQbjBZanBNdzRRRzBaQ3lCc2tXTVoxRDRRVkJOVFlOMmc5Z2xR?=
 =?utf-8?B?aUEwakYxb0tlSGtoRDY5UG1oQVdiSTh4TzlSRGlMMlJ3aXJzbWV4YmRBcWx2?=
 =?utf-8?B?bGdjVG0rY045ZEgzLzRBazlSMG5rSE1XWmFyMENORGtzNWhPWllBWTU4bjRi?=
 =?utf-8?B?RHFyNmlic0VFWVlyWk1FbUk2eEJ6SkhvMlVhdzBtSzZmdm0rNXlWcFlwWTZV?=
 =?utf-8?B?RnBYQnBMa1NsOXdoVUpwZTZLTytYL2hQVGxxT2Q1a05aZG0rOUpubjYwV24y?=
 =?utf-8?B?YjNzUm1PVFZMOVcwUklHNDh3ZHRyNjhPcGJGbTc4ZmhqWjZscjZVTi9TZklj?=
 =?utf-8?B?YXRkMVhJMUJnU2NrWDFIQ1ZrS0pZd25pTHlNSm1JK1NZTFhpdGIwUTNTWE8z?=
 =?utf-8?B?TzUxQkZCUmZNWjNpN3E1US9FNHp2MWFNbG4vcmtIN1dhQzdHaEZjQmtnWWl1?=
 =?utf-8?B?dFRDY1BEcXQrTEVtcjczQzdsMWtsUXkrZUdhSzI1VU4vNXREbUNWblUvb01v?=
 =?utf-8?B?Qm9leVpiYk8yYkNZNHFkSnNRc3NtbjJkem5jT0JQeFlSamt5elVJSjFEVmJW?=
 =?utf-8?B?M0NsaWRtaXZHWmhWQ1oyckEyS1FkUUVXS2FFZFBRZ0N2a1VIc2c1Q0xCYnRN?=
 =?utf-8?B?NE10SHA0aGErZ05iL0k2N1pYRTNDaEoyalI2WHhvR1puNlRHQzhPakJpRm8z?=
 =?utf-8?B?R2dKS1p6NUE3R1o2UDZqWHJkV2lrN05FUnhiKzRqN1J6Q1hseHRQWkk1ZXNk?=
 =?utf-8?B?dUNYdU90cWRzS0tnRmYzL1B3UzVjVnc4UDNib2orYzhwWnNUWEhQYUVEV3JM?=
 =?utf-8?B?bUcxd20zTUp0NzlxOXRaT3pBN3hId3I1RlI0Q0luY0FjeTNOZzNxWnYzZjVX?=
 =?utf-8?B?SnZiSVlJVVZUNWZCeE5XMHlKVmNmVnVUZnVOVXpCbEVna2ZmbW5TU0xiUCs4?=
 =?utf-8?B?UkFERG4zbEN0SVUxellsdGtNdTBKYXlFb095d1hGWjFZc3RjWDFrOTVVMWJJ?=
 =?utf-8?B?bjlpZGN3K28yUkdqelpHeTUvaGJIWXpqRDRvcmlNTlBkZ1lWeGxrNXN4eVhI?=
 =?utf-8?B?UGNLNkZ6YU5kVy9mMDcwZ0RzSkNZc00rZVFoaW1FRTNYY0xBNk1qalplUE5w?=
 =?utf-8?B?K3BLcHlBQ1V6RUcyQmxxMjU2eXMzZnRhWXJrak5kWkFmODIwN3hmN0FyTU40?=
 =?utf-8?B?ZERJWWM3U2tnNnZ3OVBYZENJZy9CbFBGZStrYmk0WnlJSThQN044NXp4bkRH?=
 =?utf-8?B?NVdpdG84Y0lrQkZSajlXN3g3NUF6TXV1d0VUdG9vTW9FQko4WWt3VnFwWTlH?=
 =?utf-8?Q?P6FoWZajEQQkf1ATmfajYSfvB9ElLvrft6LS0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHVWTUNYa05DZXZFMVU1OTBCMVpnSk1VZjN6YkNYaGRoa2JXYnhjT2s4OWZm?=
 =?utf-8?B?eUpQang1NHRWdmlueVk5dTJwZStHdzY0TTBQQXpab0xwTzloUlZTYUI4OU54?=
 =?utf-8?B?VFdRSlZVeE92OHJZeUZoU0lOZWFpNGVUYTdZYmU2c3Q3ZGpwNU1rd0VOdnI5?=
 =?utf-8?B?Q0dOWTFydkxQYmk4S2VpQnI2NkI0eUYxbVpJRndzQ3EwTm1XdG9CeFlOd1RI?=
 =?utf-8?B?NWlrTSt3aFBPZTA1cndwZ042VUdZQTVURkFoLzlLNHJEK3MwZm5jZGlMcG5h?=
 =?utf-8?B?TERBc0dPVzZtVWJZVGtFeUE2RURVRndNMUF1OHpHQlg4WFlMMEIxdnlqRjNO?=
 =?utf-8?B?OEY5VTMrdjZndXllNEc5dnppZGEvTHRRSVJGUkdTSUpCUUZVdXlUZUhMaUIw?=
 =?utf-8?B?Rlc3SWZZZ3FuSkJXNU1DN1RCZjR1SnZZQjVwcXZHQ0RHaWd4UDNKYW1PZ2l5?=
 =?utf-8?B?SUxyK0V1MTdrZ2I2U0JpbzhkYWpPQUs2TjVZYWNDemh6a3QzUGNLVG56UlZa?=
 =?utf-8?B?SG1oRXpkNjFlVkFQdUQyeXNOcDJiMlJYZ3I4cHlyTzVxVXZVdG1XeE5WdnFa?=
 =?utf-8?B?Nms0aUhSRWYzMDJ1Z0kxN21XTnZ0c3hFS08yTFhuTy9JSTBKTUlpU0tXbW55?=
 =?utf-8?B?dGg4VzhVSUxpcWlIMlAycGQ3RjVybnFyMUU2MG9LdmxJaGN6blBLeWxRdFBT?=
 =?utf-8?B?clc3dDRuSUY1RDlpOFJvYXBYNEFVdDluQm05eUhxajFNMG9sUkNkM1ZzdzVv?=
 =?utf-8?B?WHlZK2FaQzN3RFVPc0FNOVFMaEhXWVpGc2tUTnM5cUxQc21BYkVIeHJlM0F4?=
 =?utf-8?B?OFR3dllyRTZCZlhVakJQMllpb3NNNTFhZWZ1RXMyaHVxN1Z0emJ5MTduN29R?=
 =?utf-8?B?dmF3WnowY0N2WGVMTUI4R0VyVld6S0htaTdpUGkwdXp1RTRySGdoRHAwdVNr?=
 =?utf-8?B?bk5nMFAxZFR2YnFZOG12Y1FSbldoWE5jdlJiQkIzSE1tMXkxTlZBcXJqa1Q1?=
 =?utf-8?B?c2Rzc3F2QWpKZE5YYXRhaTQra1JrdG1YWWt3dFcybVgrQjNqZHRHeFpsd05J?=
 =?utf-8?B?bnFrbWlGeXE2MjVpc0tWY3JzdFFuUDBHVVE0MWJZMkpsWFQ1Qk91U2trOUJH?=
 =?utf-8?B?SjhCcnBUcE56Rjk4d2ZFY2RrMVRNc3I1eG5RS1pnendnRnMxRmhkUnNYZ3BE?=
 =?utf-8?B?elFQelltUWFyRW5vTmJyaUg4Y3l2L1hLQXBsY003UFhISmcrSS8yRXMyMm9X?=
 =?utf-8?B?cmNrcW9qWEpNV1Rrekx1UzY5dXhrUEJ1ZXd0ZWNvQmE0akgxRGoxUFZGcDNY?=
 =?utf-8?B?REZ5cjZoSmFHWTRpNmVBYnYrejEvTnpJL1BqSFdlaFNBODlSREMxcG1PMlNI?=
 =?utf-8?B?aSt4RG1hb3Y3aXpDVlNLbVRrb1hGYUVRZlhFWUdyczJoSlQzS0lJWXh6K3hR?=
 =?utf-8?B?NzgyTnJ5RjFyWlF0eUEydVYxblgxa2k3V0hzSThsU042SjRNeFhKOEE3M3hL?=
 =?utf-8?B?YzV4MkQ2YUQ5bGo1U1IrV0lpc3JMaVE5blVnVk1YV0ZxRHpsb1RXNm9qSHdB?=
 =?utf-8?B?bzcyOTFWS1ZuVGtmcHVPR01PSlhtL3QvNFRlekJlT3c4d2o4ZVgxT21aN1Av?=
 =?utf-8?B?ZVVVOUxZNWNMejhid0JKMjRCU2lLYjlUMWRQajNMU2o3bUwzMEJXWHR3L09U?=
 =?utf-8?B?RlRVOU5KTlYyR2lGSEJJTm5PVDkxZjdYV2wvbkQ1Myt0dHl3MTNUUTcxdkkz?=
 =?utf-8?B?WFpuT3dONC9wUndFN0tIaWszcDZ3eUlTdGF1aHh5OFFxOFNCV3JwVW5DMEQw?=
 =?utf-8?B?SUU4YzhoRm9sZ3NsMWhyZHgvRjBUdkJnUlN6dXFpT1NGOUx5Q1IxdG1EUTU2?=
 =?utf-8?B?R1l3NFZYaXFYWFZCRmVzZnY4bmVrendnYUFrelhEVm9YOE8wZ0FZcHVWblln?=
 =?utf-8?B?UWRSSXhGME5lRis3ZUdidk1sSDlRYUY0OE1mRzI1RUVNL2VIcHVwUk4yMW9k?=
 =?utf-8?B?dHU2MDNkWi9TM0xTbUpzc3BWQlN1UGErcmZ0MTRrV0MzVkRzNTVrU3EyRFdQ?=
 =?utf-8?B?ZGlYT3VoSmdnWkdpSGtEZ0xnUm1PQzlzcm9Rb29TaS9jNFUxbDVFTTNrVzgv?=
 =?utf-8?B?M1VVYmtDNEhRbzZBMTFtQXoyTDJYVmUvYkllN3M0eTVFYW8rZk9QWkZJdm1v?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197ac850-e35f-4298-6482-08ddec3add6c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 05:12:52.7700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1NLdoUBwjnJBxknGZaAsMiNva7sbw5ZmhJ6gTbYMB6+RB5OUpoIGA0hoRjNXqL1o6cE/xBV+NGyvMK3IKJPnSl3vIoG9sDdjKRSS25pzag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA0OCBTYWx0ZWRfXzy1udr1pF5dt
 s3R+Hzom+SXv+DjG4AgYaVxps3t0eaV+ZsVqIiM3OJX7pilTOTEsYyL7IinRjiDjRKHbF8AcuDN
 Jc/Rmd6vCwUeuq+rUuHOHh+W83joyJ2ISpYR9zZeLqcyXKkHZBlUGUGKnUo4p2HRaeqxPltWuaW
 gPPQidtc68WNa106ktV4I4y/3JtUK0JGGt69AU/uoK0sKIkAMfTp1SAvhObE25mBo5F5JADb4+O
 WZX7mskPRK/N5rqrwGBzAZZDfpHsJ5JgN5GjGLIIB/QXI3y+KGhbZZYJ8T2ZnhO7DVSh3TehTcg
 4Hca1Db0p89xmiA+H74cRcuoZer0jMUIbogk7oreEn/U1aw8Yzd20SYa9mzGvU=
X-Proofpoint-GUID: vp893jJQuWIuhUkEMGi3pFYLU_6crDyA
X-Authority-Analysis: v=2.4 cv=M5BNKzws c=1 sm=1 tr=0 ts=68ba7157 cx=c_pps
 a=L/hALDhYQ2kaG+m2YXDVcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=uozys0KKT3IGCxxCT38A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3uzuA2UL56CDhj5qc_RUTCNrWh2-sPr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5854ait9220791
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 05:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222970


On 9/4/2025 6:38 PM, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, 4 Sept 2025 at 04:59, Haixiao Yan <haixiao.yan.cn@windriver.com=
> wrote:
>>> <Haixiao.Yan.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>>>> Note: environment.d-curl.sh, environment.d-python3-requests.sh,
>>>> and environment.d-git.sh have the same issue and should be fixed
>>>> similarly.
>>> Which means we either have to fix everything (and somehow ensure it
>>> won't regress), or just have a requirement that 'set -u' is not used.
>>> I don't think it's right to fix such issues halfway.
>> This patch addresses all the affected files introduced by the commit
>> https://git.openembedded.org/openembedded-core/commit/meta?id=3D8a7ec5=
2e9b35654bee48cd948c6c34c63db3e265.
>>
>>
>> Could you please clarify what you mean by "fix everything"?
> There are a lot of scripts in oe-core itself, and in the content
> produced by recipes, and I can imagine most of them are going to have
> the same issue with set -u, because generally shell code is not
> written with the guards for it.
>
> I would like to understand what makes these particular scripts
> special. Why are they causing problems for you but not anything else
> written in shell? It's difficult to believe that nothing else hits the
> same problem.
>
> Please describe how, and why you use set -u.
1.Generate the SDK =E2=80=94 bitbake -c=C2=A0 populate_sdk imageRecipeNam=
e
2.Install the SDK using the .sh script
3.Open a fresh bash shell - IMPORTANT
4.set -eu
5.source the SDK

It was working properly before the commit
https://git.openembedded.org/openembedded-core/commit/meta?id=3D8a7ec52e9=
b35654bee48cd948c6c34c63db3e265.=20


Therefore, it appears that this may be a regression issue.

Thanks,

Haixiao

>
> Alex

