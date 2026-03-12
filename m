Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA87A103E2FB
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 01:05:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11942.1773277546061627571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 18:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=DEWfh+wN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753101834c=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BNtqQE647251
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 18:05:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=f8kPyvyYuN2JtsnbSTiePAHgXsZdD5YVAq61+QQFvqs=; b=
	DEWfh+wN3vP94NW6WxSkEExgAhP0CmqHHzb7m0+Zc1i8bRTvc2xsFk4889kdWrJF
	319Dfxf2EcPE59zPBmqKveyrapVcm/7iwj+lGPVGSQB4y68vMliLDaolcjDMJXAj
	o0VOqTSxCFAwnlaARXYradG7ZqmV/dyaony8OI53jNx/0vLRJhobEq9VVHmCLdLJ
	T7DI6HrtLHag8X4lHQXvj34zEslJhRQfJR7YcrTF4F/RpI7vSGZbud7K1e1cw97b
	EQidx8T23GE7obSNYZEMuSYePHV+wcJy/TtlDw2RObllR7Tdb/nxeRKGnzDZzsoM
	uRbaGPf7lDrTffYoJ/M4JQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012041.outbound.protection.outlook.com [40.93.195.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6t83y2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 18:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8gT2IrmFveVofmVd/VRrJlIsK6pGw+lvoza6vbiIlevUgFehQv3sNJzDjV8HBDuujZDz3AejkMDHnG/JsfgJzg2E1Ob/o/pIUGun7Wjcwnr42rDOoExTCP7h1ScpSzduxsAksVBa22j5wpkxm0BdYmXBfZsIA9/RhgmEQiLMfJ4Rh4PWsymnDeL1r6glLSIORGsBNRPc/vJiWnWWTOU1683XLUwiiAujKYDvQ8Tr5rtR0bMUtcWN86sOpUOKQapOga3SuVLVOHELi82TIYW1I2itCqCIQUdkWGN+alnR8hTyz6Y23+FBT+c/nOabszmAq6qhnc2DAJDHnng+GaoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8kPyvyYuN2JtsnbSTiePAHgXsZdD5YVAq61+QQFvqs=;
 b=vIZWOFV5Cj6rmq3aHFqVHOUiLP008OSXnGpdN7bpVbZo9sBuq9J5NhDDvfe+7OnQQwHvxPw8b9nftoXdx6nVjys/F9YItDjO1ZEO5VWgSUglxSum6sBkXlGGHY2huRVESHrw6xZHsddpu15UUNFsWaOSOAhX5PoBZGTC2pbLaIHfn5gS7RXTc+jF5sPFesb3J5dPtByBuwDLCTcvOt1ainO1iA/LbwvJ8gRht6EJJz7DtqKeVkHY6OtftXyS8M8VSTx4K3C5PManTTp4yZ1exhws0e0f09jgbAHfjj7iILjZjYeOwi/M6zf9P6GWY0CdniVwyZJMHUoq2JmMjC5QJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MN6PR11MB8169.namprd11.prod.outlook.com (2603:10b6:208:47d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 01:05:40 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 01:05:40 +0000
Message-ID: <165ebb9c-7b39-4c96-b180-cb2e131312fc@windriver.com>
Date: Thu, 12 Mar 2026 09:05:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa-tools-native: fix do_compile failure
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260311082523.711109-1-changqing.li@windriver.com>
 <CANNYZj-8T7fs-mnfXCA9AGZdt2J_uRrFQE0o9_szrXes5bez=w@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-8T7fs-mnfXCA9AGZdt2J_uRrFQE0o9_szrXes5bez=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MN6PR11MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: e88f3e29-841c-4da1-fcdf-08de7fd37a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	46oUEUDQIZqrfW9vF7QxIUMRHobfnKZcq02j60I1a5G98M1gNpWZwjeKDj5vg5VolHpvqrq2d388jsfRHVoXcjn/N+I+D2+dSF3zU93s2o16DIRjLMo5XPhNLIO/tJPmG5tSn0WbTAIvgNQl92fYILLWa9gQz7MfAjatYQZcEQiHhKYrd5yhdNGaV7UCvX7PmLcJgtesrLWd93hUnv4lflAAH1JlVGq0TFyBE2jTsEmGqpa+VRLKKK+r3+Jy2eJYJV8XYH/C+yFaPMBrkeZH5RM3i6lG2KACJ8yxsE6st0Lq95LmzPWHDb74mDTrvuSlnwDh5VaENT5Bdz2r+EyNlLBbH4KeZJECEC/g8kn8WYKKIeYZrdmsEW70zZ7qwu6oiXOJK7rlLH4LJVu/TsFMsdI7HZHO2/YSpunFf8wX2DbczFLlAy/rLyWNT5TO01xePPDuH3GJ/wt4ZBB/USJImXGUzjJ+D7IOu3hJ5XjWWliNi5lsekS1rjWyS7ANZBy5n0YVzIsfIofjdj4Q55Yc3IsEk3K3gsmyalXqtEl5qpWTtmFsc6fbO7QQPwpAeCScBYeRhzxu2jY2c6hb3wzdorLykAPxJGmAj/F0UWbOA0y8yxXkEoLLQIWX0qPrAMzOO/8DtoogwztosRY1m215J0z+LscKCn8RJCwUj1QIquOj/g3ccvRRF7+3srVy9Ly2pbLIQHhak3SMGONugjznwH/QdNr3kTB0cSAb78sOTAQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azNxMTBNMjg3UzRVL2lkYi9ZZ2o2TXFuK1craW40N2NmS01jaHJNMW9LOUo3?=
 =?utf-8?B?NExZS05jUFEzcGozcjEzK0JzRlJ0emhuZ01DcmJtNUtkdDhUYndjR1RvRktl?=
 =?utf-8?B?L1JWMit3SHBmaDhKR3N4MmprbmtQNlVQRnVWdUVhc2wvN2srSDJEUEpnandh?=
 =?utf-8?B?bU51YmJhL1VIcWk4Y2RBaUo1RW9ueUhlWDh1dUJoN1h3U2lCUENqaVpjaEI3?=
 =?utf-8?B?aVFBVE5teUMrclVUSWY2cjlqRjQwSmU4ZmYwWTZJaksyNVN2VkZRNHJReDNR?=
 =?utf-8?B?b3ZXSm54TjNSWjBTWHQwemFpNWZQY0FJZzd4dDBrWDZ4dURUbXRlS3hBU0dK?=
 =?utf-8?B?THMzSVl5YXFWcmluMG96WE9kR2U2b2R6L3BZNjVsQ2J0RC9iZkdhY0FzYlNm?=
 =?utf-8?B?aWh5Z2VSWFlRM2pLbkN0YlBpQkQ1M3NhQzl6TktqQ25LTmRHbVBTNWpVR3pk?=
 =?utf-8?B?dFcwaytwanRjKzVDMUZPZzZlS2xhbWxJcWVUeUt4aGRoU2tHQ2ZSenFhd3dE?=
 =?utf-8?B?THJBcWwxMENCQUxFdjNWbTZ4N00vTm5NbWRLS3VHa2Zxd3ZxQThQOC9KUEdZ?=
 =?utf-8?B?RS9yTkdSNmh1blY5L1FFaUhHb25JOG5MNm1KUFh0bjhINmtXbkpIdTgwN05K?=
 =?utf-8?B?d3BVY0FLUUJ4TTlYU2MyT0NLRktwNEhKVStCZFVsdTh6Q3NrZzJReU8xVEtH?=
 =?utf-8?B?czVLNXowRnhWSFlLMjJ6VzI0OWlHaHdyelc2cHA0Y0Y3Y0JEN2hlSUJrZVF1?=
 =?utf-8?B?VkFua0VzT0pMYW9VTzRSVkJsVm9tMnRrcWltZGpFRG9oN0NrWjVNQ2dZRyt6?=
 =?utf-8?B?Zm1Lbmp4SzVzNmRlWVJWdW8rSGQzM0NSN2pZWFY2RUdVS2VQVklBWXBYdWNI?=
 =?utf-8?B?SXc2UG9USSsyOUpLUGhIazlxSnpNNDVSMGlKYmtXRTJIbG5ycEpOaXJ5Wmdu?=
 =?utf-8?B?NUZ5NUtxaWFkYVhBelVMYkFMaGhINmZvSjN6YmVjenNZSWN2dXNTeWh4UWRB?=
 =?utf-8?B?N3VUTjRxelMwZWIwZk92UjBNMjA1aVNOU2puWmZyZC80cHIwTUhDZ0ZBRTVr?=
 =?utf-8?B?R2gvRW9pSjdkdGJ1L1BGY3pTMkZvQkM4dThQdXhpTWdFcC9nNjdESTNoK1du?=
 =?utf-8?B?cVgwUWp3QTFBOS9YSWNwTURubTdQZXRNNHliYjVLNURBcmFVWWVuallUT3Y5?=
 =?utf-8?B?VTE4a0o1V1ZrV0VKbEFmWk5HR21PYUhZTitXcUQ1b1E1K2VzbVRCK1hydGZm?=
 =?utf-8?B?V3dHd0xnZU9RUXlxY2xjK3NyQm1HRjIwVm1wbnpITWxtMkRSY2c2RHp5d2JL?=
 =?utf-8?B?VnQ4YUM5QTdrVmxBa0FHbHNiSmM3L1VSRVVxWHRIby9ZMDU4UkxWc3JTbDlY?=
 =?utf-8?B?UVRNbUU3cldOZ2tZZTNJQ05TcEYwWUZId2VFOHk5eUlIdXdtRDZRaXdUNjBN?=
 =?utf-8?B?Y2JxdHVnQSsyNlNxQ1M5SmM5Y0hkZVlUWCtlekswQ0hBcG42WndhSzlLa1Jk?=
 =?utf-8?B?NVp5N1FkUW1Jb3hHVit3VVpXNU9yZXRKS0RKeXYyRWVrTUUwTFprNnNnMnkw?=
 =?utf-8?B?dUR5RGh6S3J4c2xpZlNPd1hVK3RIR01SQkd6c2FsQ1FNWGF5SXMzdGppZXpZ?=
 =?utf-8?B?UWNnTlZJb3Jqc0xScnE4RXdKcmtmWWhRZnp3OEMzRVRGS0U5VzRaeW5XUWtH?=
 =?utf-8?B?UVExdWpDSFFRU1pOQmNySmIvYlBHd3RIOVdOekVnUFhLTnBwM2h0TnFPVUU1?=
 =?utf-8?B?UkdERGQ5ejZWQlZsQ1JGbXkzN000VDM0NUxRZnB5VlNBYys2OHkxODczVWZl?=
 =?utf-8?B?SGRqWC9QOHIvU3JiaEFpRHVNV21QWXVmWWlhb0RQS3haS2MweEQvNnozRVZz?=
 =?utf-8?B?TERoMmMxRTQ2OGl5S2ZwT3l3dTUyQW84OUg4TExiMHl4eXIwZzFLMXF6MFQr?=
 =?utf-8?B?Z1RrK1FhbnBCVEIyU0pacFkzSFg4Qi9ncUg0WVdHM0ZpcjQ4Skh1SDVRSitM?=
 =?utf-8?B?TmJUNFNoVjhjRnlkbTBmNmpWQko5S2loTXlTR0FrazlndVJLNXNpeWd3Zk1z?=
 =?utf-8?B?SHZCTmFsRXcyYllLcWJvcmYzb2wyY0FwaE91RDFFejB5ZzNxVGhBN3FoQVJs?=
 =?utf-8?B?aGFCTkxwTVowOVNSUHY0WWlSREpUYU9DMVJRUjVTMm5aUlh4RmtoVkJKUUNi?=
 =?utf-8?B?djVuV3NidUFBZURzM2o1MWtJdUdPejRLSEhKZnlRcTZ0bHQ2Y0wweUFWNG16?=
 =?utf-8?B?V1hBVytCMDUzUjhaTDZaS2NOS2NTTWtLRFk3YWhCWVlSSU1keG9SQXVibWNh?=
 =?utf-8?B?bXhKLzZYNFl0VmY1cCtVbjlySnl6T3M2TVZCUDFvUlVlN2s3WWtxYXBKNXkw?=
 =?utf-8?Q?z5P2N1mL9q9VxvwM=3D?=
X-Exchange-RoutingPolicyChecked: 
	bGPmNDbOLmf4b6HcqGYIpPrIjd0c6Phcyawq+Rvf+HqoApRt6nmYIH45Aocww6YrM1cGCv0DD9lPH493bJscUPv5QYmDsckCd5RIYskFz0WWsQ+pwffkEDNfnBlgIvG4DIWJOSrq7z0A1V0P2lM5Mr+uTzzCPleomo4wmP8ty8ylZ01Fy96H24MsVhjkU/PdAyF6xjJ3QR2mLwuNdvgnt9W5BN2jItnHu+sC4rZiiWWWamiDDxz4RQfQ9rpiMy064bqJpnt1mqecKUAb3MhrrYDhCA0rkZccemlbUHry77fJ2JfY0jh7fN7qD6ur7a81e57GcEvdvWV+X7UsDvYNWg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e88f3e29-841c-4da1-fcdf-08de7fd37a35
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 01:05:40.0708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0xGoe9dAudD+5/qJhGyo9xAIoh44seD2YLrnUNjli5QvHBKACKRkUIMlKpcLwbfCtw7tYEoiZpBigjNdSWgefhjFcxo8YlLb1pXGEmWagw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8169
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: EsbKp7dlYB6bi3FgmAXgK4v24lwc6wmr
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b21169 cx=c_pps
 a=9jlK8eo7xmF8zH0m+f/LEA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=lHHXf6PLlG-nyFmv7K4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 3HxouyNcfgvN9Z10qLch8iJpLl5eYqhK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAwNyBTYWx0ZWRfX4ERSGE3R4tWk
 KrZckKEVcMD0vaOmjVVRCCd5e2UUu5C9YC4FNA2Dx/WV4AkOzJLieMo8pQ8+KwC/fKpMSaTO64Y
 9c7SnEkAWMF7Ni3a3fpZjgfl8GBASPl9nzFLUjLJ4cJLtFw8hDy8XcxMq1DNSWNAB+fsfB7CUWW
 yQIxwh4MH7lO/Q0g1LiENJU2WQyuPt7cxkT2Dv6lP7Rg7nXr8Jm7nBxUYMI/RRBnhNnYcdFxyxc
 /4YpcEG52OkgCyMKHI3xlAvt+e0ayjDgbDDgJq+iCOipiWj2c39Slvc5nBHuu7ob6wwJiQYPD+8
 KVX6aUAEMywG5jplqMdrgPh2kpONIZYnCby1gWbM4XHtk2H2XMA1tSoiQ2N47LHLjSy0XJFZt30
 gsH69pJ5OwEgiKNf9AqWBSSsa6u4O1LDfOdVzAhthmuIlQMOlSrHet9NkHrag/FdGbjnBVKj5xs
 ZSb8XRhbsCZwE9X60ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120007
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62BNtqQE647251
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 01:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232920


On 3/11/26 17:15, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, 11 Mar 2026 at 09:25, Changqing Li via lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> Fix do_compile failure:
>> ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal er=
ror: xf86drm.h: No such file or directory
>> -DEPENDS +=3D "libclc-native spirv-tools-native spirv-llvm-translator-=
native"
>> +DEPENDS +=3D "libclc-native spirv-tools-native spirv-llvm-translator-=
native libdrm-native"
> This is not seen on the autobuilder, so what is the configuration that
> triggers it?

It is triggered when DISTRO_FEATURES contains opengl, but not contains=20
"x11 wayland".=C2=A0 Now,=C2=A0 poky enable opengl x11 wayland by default.

//Changqing

> Alex

