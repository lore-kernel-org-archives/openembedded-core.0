Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B75C35FF1
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 04:56:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.99])
 by mx.groups.io with SMTP id smtpd.web11.969.1742360161667165842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 21:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=O1GfbAiX;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.99, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NH4anz405Ua8Racj2zPSx6qgCyevmjVwswFVxerIjo7/SJxYlmB89wXw/lfcHlg+o7/RUffG8EUB8pi+IZpuDvQyE8UUUIJHtNBBZsg/Ih/XJdviJWjYv8H6/5KCnYv5pnHt4K85jYMGy8+n4+f1Tf8DCCU1apfQ2IjUq6NhJJFC2221FdJtvNM9QOFcuk+utMN2i2M5ozS/y81kKhc4oA4oO7LSCfLpFsBOU57zrh9rMuN9kZ3HRx/uhG4FAplKHLOQyywt0lQEiuOmPzv/tKyaet/gYA9hyrHsB26Oyv+Sw6vDHAKSbIG5dNw5DbqX86QywMPag8gUEmqGpb/G6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHLDWkCyLry0//58xl5Vh0Bl3ApuVQcyCT1hWA64wgA=;
 b=okOxowtjpgBd0eT03IeOlbhEaidoUCzPOIcnxCMI/VxxZBLntDmA/3XDoo+LJ22gs2xQLJ5/l2srpnAW6FbkQOG6UOJwo2f0YDOolu9HI0sy8j0pLeJSyVcr4V5+uz7kCmom8iF9EE5JiDiTC7HXjLzTvhT2QDozImvD4z3Fg5SEQ1ZwTuXEl3CQF3ZLhRNFy0R8cY6pKGn4sZZs4AkHsaHM8L9WlFhTS6BQmoAiTm5rlt+8buF4s0a15tzGe0FsEjUn2n+5NF1SOn8zGzFP97OT5w/o919oCmti/6KOvM3fNygmM+vF5hHR4upL5z5MulfB9wUjRNBm/Ll+6qnJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHLDWkCyLry0//58xl5Vh0Bl3ApuVQcyCT1hWA64wgA=;
 b=O1GfbAiXZL9uWnLivIQSc0fvUmbZJhDl8o49ZiCmEir3K5xjtn/GD54Bk9SQeYDQBCzZUghoQUR+6+lzv1KHDMYEhYXZBSFO/6jUb1GpoucQVVpLDOHX0+dKDLcVK5SRO6lMiCGPRg+01Xvkp+Lfoo3j10ESNmhkf8Sex39aPHF6ei5S3MBjLCHUL/O83irajTZ2sxz2bBDJ/b1YfTQa4KBmm/XouuK03kLF26KCMPuafQMt5smAq/SdEQuTtyGgn58Z/vt4x7ib5Zp4+EEJV4cAvPEnIVNwyMhZd2URfs8bZhz9HvI4z3u9vHmKB6Umj+MevA7i4nH5QB/zYbY8Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI0PR06MB9391.eurprd06.prod.outlook.com (2603:10a6:800:23c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 04:55:56 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 04:55:56 +0000
Message-ID: <6719c62a-ce76-4dcf-85ef-2cb355d8336e@vaisala.com>
Date: Wed, 19 Mar 2025 06:55:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Issue: /var/tmp does not persist due to /var/volatile
 being tmpfs in fstab #scarthgap
To: vs.yocto@outlook.com, openembedded-core@lists.openembedded.org
References: <PH0PR11MB561183431E26C593148B543AEDDE2@PH0PR11MB5611.namprd11.prod.outlook.com>
 <2962.1742314292470649522@lists.openembedded.org>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <2962.1742314292470649522@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000045AD.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::40a) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI0PR06MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9a907f-fdf2-43da-a020-08dd66a2559a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?LzdFV2ZpSUdwb3dJY0F0VXQ1WTVQOEZSZERWT21EZklYUmRlWlNaaGJnZEdR?=
 =?utf-8?B?VVZlMUJ3bEwrVW51bGplWjVFSWxBUTNGeXBRd0tnZVM0eWZDVDI4dENZQVVi?=
 =?utf-8?B?UThMOW5UclM0anduNTAwWE5HY05mR1hLVllYRWtQdTk1MzNXc0pRVjJsUm95?=
 =?utf-8?B?RGoydjA0VFVWbmZoRmNUU0ZJeS95ZmJIMmE3OFBuUjF0RVU3MXI2UlRld2RT?=
 =?utf-8?B?WkR1VVNpUHB2R0hveEFidmNzYW9ZV1d0R0NFWGJSSkUycWgreDZjeWJaU0dU?=
 =?utf-8?B?WUUzKzhwK0tBR2RDdUwxdE9TSW5mbW5HbWhiU3R0MzJLM0k4T3RadVltMWZh?=
 =?utf-8?B?UzlTV2gxSlVLd3F3R2FsZjFkdm9tV1BablRTVmtOcVgxRFNjWnZOSGt5QVg3?=
 =?utf-8?B?L2cvcWovNWFDZUM3SndocGQ0cWdPTmNsNHYweDJXOFg5VXpKWmV5U3U0SjdT?=
 =?utf-8?B?bXBvZ2dYQWhDWFBELzdhajl0T3ZNZjlud1pyUEU5MDNBMm03cGpnbzJjNEFO?=
 =?utf-8?B?aDlYQTMzWTFraEU2YkYyR25OQmk2eEhWM3ZpU2thcGhDUmRycm1oMXpzeno3?=
 =?utf-8?B?empnSGMzSG94d1hmZFB4MUJhL1dicElhRkNwY3JHa0ZkRXRXTnZRZFhDRFpJ?=
 =?utf-8?B?OWJ3bVVwdWtUanQ0Qy82MW1KR2hPUmhNV1hUc2hZZnp0YkdJWVo2Mk5WZXRr?=
 =?utf-8?B?clNTVnJwQ3ppcDF4MytPNGxERkpKM2hnbU9RSFpveU9Gc2RlR0FWczdqUUw2?=
 =?utf-8?B?TlRMcDZCa2xSU1l6enlrbXBPQmtwTnl2WFFsWFg3YmhaYy9ERUF5clF6UUgz?=
 =?utf-8?B?MHA5NC9kdG50a3hHOEcvby9ZWm9tRENDQ2RiWktncVJ6dXZjZ0lDeDJaaGcz?=
 =?utf-8?B?dE1XWkNUWWswb1ZzMHJFenhNYWE4MXovRmc1RWZYK2piQjdPK3NCTlZvME1J?=
 =?utf-8?B?RGEwVmV4VG1KVFpDd09WbHRPR1BwaXVBMm5rRkhDazgxSUpyYWQrTXdjOUJD?=
 =?utf-8?B?dUkvR3BKK2hJVWRMbWVpVXFmMUpsUFdYNzgrMHFMRjV3OC8vVGRYY3FzNzAx?=
 =?utf-8?B?S0MyQTVidVJhOGdVTDk0ajhaNHBIS1QyNmNZdWxuTjhyeWd2K284TzdDcjBZ?=
 =?utf-8?B?bEhpL29OaCtYLzJTMmU1QU1Ua3pHOEhoZkhIcjFIZHpuSnhNRTczdmFYdFlR?=
 =?utf-8?B?VFJhOFk5VDU4WDQwOHFUSE83bWMzV2dQR3preVpRaGthYmVVbXpKVG8xY21L?=
 =?utf-8?B?MXRCa2UvMDZydVJ6dThkTDRBbENicE84YkRCSWVxMzBySVI2OUtDUHlvU0JE?=
 =?utf-8?B?K3FoQmN3UzZXSkxHQ3FPdDIrTW9tU0tONkZoWkNERFBrWlpFaGJ2MWVRdWhl?=
 =?utf-8?B?ODMwQVlndkhFVDN1bjF0OUFHOVRiL1o1SzF4WGlkSlovNnM3NkJkcVUzd0Rr?=
 =?utf-8?B?b3hGUlp5NHM5Ry9RWkZ2QXVKVzR3SUtFZjI5YndkKzNLOHFTWjhxYUFjbHoz?=
 =?utf-8?B?WU1zcGhLRVJPUHJvYTFHamF2RzNpZmhwMkZMVm0yVkJZWDJEdTVpYnRRREE1?=
 =?utf-8?B?VEg5OElMdlVkQnFPcW1QeEp1SUozdkM3ckdvMGJBK1BiYlZsTDQvOVlkK0dD?=
 =?utf-8?B?S01GYk5JQzlCanlNMjBWdzlUK0szOHNwelBrUkh0YVE2d3NrVzlUS1pHZENE?=
 =?utf-8?B?ZkFtcEUzc011ZXU3WU1saWtzWEk4UFJNU2dMNlBsblJzTW1USkpYRmdsREVW?=
 =?utf-8?B?NksvS0E1WElTNk5JNm1CUGFlMGI3REl1U1N0T1lBcHVTZDNxeVZlNXpTcWdw?=
 =?utf-8?B?WmVzT3NRemhETU1ldGxvUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXYvNExPY3ZUTnRkRENrNWRIYmdhN3JwSlRoNGNVZ1VSZm1MYWVUUVpGZjlE?=
 =?utf-8?B?WWpWSTNKdE16dHZrNm5OMDlKOWk1Nkp6SitxVURFeS9TZXBkT3JaNTBMS2J5?=
 =?utf-8?B?MWllVnlxTDN2aThFeU9iaXNLSjZkcFpMbFpzWlhRR21VR3lXL2Nib1kzY2Nl?=
 =?utf-8?B?VUxFRVFNUmVxVEtQaWw3c2JBWVVjL00rY1pHbEY2R050WXNZbjk2Z3gzOEFj?=
 =?utf-8?B?Rm0yZVVLa1VpeFlXdEhYSVNQcmI5WEtFajBPM1BSSG10N2wxWmpoMzNpV09r?=
 =?utf-8?B?bjdRSVQ3MDJZbmQrTStwTGZ0bnRQUG4vbmpWOE5CeWw1M2hJOXpPYjg3c2I4?=
 =?utf-8?B?cklBSDdBWjdDbWJ2b1MyZnFpOGg4Y2JjajZHcUI2WWZpVlNXVGI2OGg1bk5s?=
 =?utf-8?B?VHVPSUFKdWEvTVRLdC9SOFFYalZ6T3BqSnFUMEhPY1pIN3VDRTJXeGFHV3Iz?=
 =?utf-8?B?a0loNUduYmpvYkh5d3o1eHY5dnMyVVhQL2ZZc0tRWENaaU1PSGovKzJYUFEz?=
 =?utf-8?B?Q3pncU0xRWl5bE12UzNvQ21ITVdhbFZqcGtIMjBzWVo3TXlWVldSN25ZSWZy?=
 =?utf-8?B?RjIxUGFVMm1MblVOUDRzcERCUHJNNjlZVGpNZUZjdGhUWXdVK1lIMnhBL2to?=
 =?utf-8?B?Z2pmQitLYU1laDNtOU1xNnc5aUFNYTZpNE1yakJEdG9TMEo4dVNjbFV2UndR?=
 =?utf-8?B?RXc3Q1N4andlajJrNUs2d21hVEh0ZEdhZ0hTUkRFTlZtUTVpanhLSnBZR2lh?=
 =?utf-8?B?U3k0Y2RGV3RPOVhFTWJvMDhXZVJkVlpyMFpWMkJYK1c3M0hwUk1HK3BMVVNJ?=
 =?utf-8?B?d2QwK2NwazgwTWpmVUpPWXl5eHZ3SFJ0K1YvU2Q0ODZyc05mTUt5N25GUEtX?=
 =?utf-8?B?TCtqeGZCbGRwRi9LWVExSzg1ZTFBZ3lSbXQwQTNoMCszUk52L1lBcENOZzlP?=
 =?utf-8?B?d1YwR1NybytpNTBTTS8raDE2b2ZTL1Z2cFhsTUViUURadU5yaUJyZEs3Q1hV?=
 =?utf-8?B?SmZyVHFPd2loaG5zVzVsTURlK0dPcEhwQmVYTzlYZlhreFZtU1R1UTdIODB3?=
 =?utf-8?B?dDQwdk1HU0dSUG9oTExEcm5wRW1aVjJRWXh2RkNNazZleFVlblU2TVJEMWpp?=
 =?utf-8?B?b29wRHJKSmNlb3dBOEZlRU1XaC9yVDYvalpZdjEvek5jSkZabGp0UkNLUXVi?=
 =?utf-8?B?RERoL3d1UTlnVC8yRnlkTUtTOTdsZUdWZlhoTXRzU1hQN1lDNnhSTEYzK2FD?=
 =?utf-8?B?T29VNkNlV1AwbHJtWmZZVzNZSENtcElEUHBkcnlrOFY5ZDgrZE1nMUtBVEo2?=
 =?utf-8?B?d3UrSitESTNVSlF5OGpDalBQSUluQVBaMzFQeEZDRVdiclhlYWZBUWVOTU1V?=
 =?utf-8?B?TFlyZDZxOTlSc24vUTQzT25zcDZIajNGWVF5anloMEdlemIxcS82aERmRS95?=
 =?utf-8?B?WGtOMEpLYlV1bFlZNFpVNkwrb0dIaGtXdTBzNXlHclJqUy9zckJmQ09BTUlk?=
 =?utf-8?B?bnZvWlFYZlQ0dXRsUzNOekFCMmZPcUVmQkV6bzJxeWtJNmw5SWJIUXY1ZzRC?=
 =?utf-8?B?akNTTlQrY09RQW1ianljemFOMjVFZCtjVmJFbmx6eldCOVZKekNNL2JnZVdW?=
 =?utf-8?B?ekN3OGVkZXVaTkErMDlBR3NqMXRvdkdwVEFHT1U4cXd2YkNHRmQrbXRjS1k1?=
 =?utf-8?B?Y3VqMk1uZDRuMjl3REE0SW9sK1d1bklqalNQQXV2VjYveWx0cGFqejlYSm1H?=
 =?utf-8?B?OS81R2FWY2N4ZDJLbE44RjVlMktUcE5taDY5Tk9QNGJFOTIveXJxOWFGaWh1?=
 =?utf-8?B?MTBOQ2w0M2ZBdlFTbDNDVHI3a0NSRnVMWDN0RkNQUGRTOUFMM29CUys2Tlg1?=
 =?utf-8?B?Y0U5U3NXOVpwc2kwRXRuV3cwRG1iZ2hLV1F1QWxsMnY4Q3hoSTJqckJ1MFBO?=
 =?utf-8?B?Y3pFNHRyaXBpMFhxWG1qV002Vnc4Vy9tWWRyNUh4YlFxNE1oS1VnRmh3bjJU?=
 =?utf-8?B?UnNnZVV0NWZtWkNhQ1pUd0owZTlrSXBaclI0b2lHRHVDSWZOU0lnREJ0RmhM?=
 =?utf-8?B?aXpXUGxDWWxKeExaRDhtK0JmcDZhb2pnWk5CaWRzSDNMNXV1S21pUEJrNDVG?=
 =?utf-8?B?T2tGRU82S20zYTdzWCtPaUFGekhzcHBvSTNINlR3eU5HbTQ0TUovcGROVWJO?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9a907f-fdf2-43da-a020-08dd66a2559a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 04:55:56.4602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j51uOHMcQn5kpBOWXPwER96AkSWLSuVoGKuegfyspi7D4UWgjs4bw08GD4Bm+z7njfGET3cBAetC4TK2MjHJQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 04:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213262

On 3/18/25 18:11, Vish via lists.openembedded.org wrote:
> Can we know the reasons for original changes here?
> https://git.yoctoproject.org/poky/commit/meta/recipes-core/systemd/ 
> systemd/00-create-volatile.conf? 
> h=scarthgap&id=3cc8c3520cedb66500757f843f757646da69ab30 <https:// 
> git.yoctoproject.org/poky/commit/meta/recipes-core/systemd/systemd/00- 
> create-volatile.conf? 
> h=scarthgap&id=3cc8c3520cedb66500757f843f757646da69ab30>
> I reviewed commit message but not giving much details. Considering 
> default base-files and as persistence is required, this newer approach 
> seems be an issue.

Hi Vish, that commit should only have the effect to avoid seeing an 
associated error line in systemd journal ("/var/tmp" already exists and 
is not a directory). The error line was stemming from the fact that in 
Yocto Scarthgap base-files creates /var/tmp as symlink to 
/var/volatile/tmp 
(https://git.yoctoproject.org/poky/tree/meta/recipes-core/base-files/base-files_3.0.14.bb?h=scarthgap#n87) 
which contradicts systemd's default runtime expectations.

The base-files provided /var/tmp -> /var/volatile/tmp symlink has been 
prevalent convention in Yocto for a very long time. (If you want to have 
/var/tmp as directory instead in Scarthgap I believe you can e.g. append 
base-files do_install() task to remove the symlink and replace it with 
directory.)

BR, Niko

