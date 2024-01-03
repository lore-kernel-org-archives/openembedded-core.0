Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D479BC46CD2
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 02:47:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5725.1704250039919612752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 18:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=H11F0QAn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17322eae69=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4032VD7e005561
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jan 2024 18:47:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=3dhLTH9eYtrEhxrBjrybI+m85C7aEjJf0FAz9n7g+kM=; b=
	H11F0QAnnsGsvvsO/+vnQswXukJoNO95v7yYOp23sX6TePeX1FfwzPIh7oJdRYMy
	04cTMf5NSUqgdpsHT5hufagRvjyEoO0lwGQOoicE3JmiI2HtWWNMxv8+Sptd8jlR
	YNvb8dcnCpbvdfDMUvjm0yIS3lYPnZZQK0f1g9R2/a4MntVR00weiw9hICWvwCIY
	mNK0pYVyCvzWh/CS/ZqNKe8KubiVAav9N+SSVMuuPFR/GmKTwt5Nt9TGw/JbXEGH
	+0WHy7WDyKeNb28CF//4J0zS57HuaKxLyhsFD5dXPSoH3+s6wjs4aJyUVad+ULrj
	Svi7sTlldM2bOFrDvMPotA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vakkku6b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 18:47:18 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4032lIEZ022482;
	Tue, 2 Jan 2024 18:47:18 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vakkku6b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 18:47:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l39WLrGg7wmh8bAY12ZLfaDbGC9QNdAbM9zWckdWG5i7cCZubb+FkTBWciPLfY/srMd/RAJGp4gMFYgrhgJk7OZFbFyL8OJtXLcVzzW1+OPX5NXtGu551S4G3eazYFGV9H4aRbLmdGJni74uu61Sim3LCFjvmHI35FympSIBiPHyPP2OyIqek3p1MZ59XWKaCNBcFfqLbiSSbqbjCusbixiOeDN4WyGrfbypBzCuGnwcTufnKFj7aCtRo5AWLRil/4XgXC0zMMfgh1VWwdxq4IVbfkM8prPYCPuk0NgZIC0/6W1wuRieN7HzZq4PcuMs3jM0OdChkW6Fyy1XUy0zVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dhLTH9eYtrEhxrBjrybI+m85C7aEjJf0FAz9n7g+kM=;
 b=Z3olR+Th9Gxhsb+FM/zDjUvfId3x9wBs4UO9EqRWbNEf5zWgYUpeKYxVCmHV+FndJtvdMB4lcWqvk3vROqk/YKAY3yxCvka66el288amc0FYxXBtOjXHFsHJDJ9HzhEjGodq1w3TaH2JjwPSrmpWmGT60weHXUeQYgO+fci5ohzsuWzLdAOMVomvmRa6g9sm8VjQC7flFkuYYjc5LBmXkQdVbLapdFCdleF0trcACcAjHl5UYlW0f/q545rS1cQA81b8evz+xAxxZsWsarlignX+sdis1/N1pXysdhvhl7DyCz0iHc30zfxc2/pZVii2DYqlzIe3k/bTfhpMHidDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 02:47:13 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 02:47:13 +0000
Message-ID: <06339c1f-9523-71f0-a6da-0b627ae1d480@windriver.com>
Date: Wed, 3 Jan 2024 10:47:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH] debugedit: add UPSTREAM_CHECK settings
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240102083755.316126-1-Qi.Chen@windriver.com>
 <CANNYZj97wWSw-uyEUEppnkXQZ6XROr3BWoCz0KanmMknUTcF4w@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj97wWSw-uyEUEppnkXQZ6XROr3BWoCz0KanmMknUTcF4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 967ba7c5-5430-4f65-2ee6-08dc0c0649bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LqzAm4kK/PdiTiU+SbPVrlEiZGVA4b2vQ9ssBhCmW+jBCtuppVCsl9Zg4HCvsJzuostv3fWhuJa7P/iZtM3NrSkXv6fTL8rmUIKo+Tw5Xjf40BEkaGp/O9DsurHM7D5Egj62e7Tke+ykb2RT5Yun6+ath0TvxDV+lrYApJAj7FRy6FZAs0sJxjIb/ap1LoXAtyLWzKR/PulzjXxDcfoGPQh+zy48PReNjbPhJk1dgFD0HZ2bJg83Dm2MNZNXLUz0barRWBPwjv0qtQTPMfnpqxWN2uhzVYkFZC3dWzUAduqjsoPHtCsmcBE3PI5Ot1naCV2gJ3NpEF4LKSyArhU/+8Z5Bs4pfkOSx6DqgInZo7JskhBjUILXGgAQfBLcYzv32B/7SIFIABTI5PAQePE11/BzrS0qXW1Crcpb0+oJbG/5PPuzRaZWm6gJsw0NcJ9m+DQjNZTV8ouM7wWjAdm7asL4rkDiAsLVT4qaM4T3NuaoNzcCCf5Lfue31lk9ouAxvurkQ1D5Lx2hyiZLW1DEMHDWGAwnCD2ud2Za+MzydJ/yt+jxKtdHaDS7STShuksAjwWiU4RQSZb+3RLRUakC5D0ib5R2zj9jStWKswmgF2DcDjUm3Iujf4TaqG16w7NVcS3t7C+wRIdoEmuOJ7NNWg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39830400003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(66899024)(26005)(2616005)(38100700002)(8936002)(8676002)(5660300002)(316002)(2906002)(4326008)(41300700001)(6666004)(6916009)(966005)(83380400001)(6486002)(66946007)(6512007)(478600001)(66556008)(6506007)(86362001)(53546011)(66476007)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVcvNDBIOEVrUC9GTTVaTXJna3pGdkxZeEhnZ1psZnkydU9VTi9MOHNsWlNx?=
 =?utf-8?B?bGVNbnFZR2hoN2xFRENoc0IySXNCSmx3cnl3L2xidGdrWmVTdlEybXFwVk1i?=
 =?utf-8?B?NXJSckxNSldLUUF1cm45c2ZYSEpiU0VUNHdUalJDcks1UHQ2WmVDVExGU25z?=
 =?utf-8?B?Q0ExUlk0S1dSMm01VGhDclkrcldNazVSeEdQTGd4TzRhMWkxcXVSN0J3enE2?=
 =?utf-8?B?YWpIMTRtcVdzMnl6c0tYZHFodkNPRzRUUmhzUUFSVlgzczVzbGlrcE1DYlRl?=
 =?utf-8?B?YjgyUE9vNldpejJoQkdVRjlISCtma0ZQcStiUXAyenVsVUNQQU9tR2lEeENx?=
 =?utf-8?B?c3hsRk82NzlUQXZOZEJ3b3lsYzRzRU44YldJcDNWMDkyNmpUWnlyZWFLSzV5?=
 =?utf-8?B?d0N5S0dsaXpNZnBvcHpZY002RXcrMlQ0UlRHV2I0NlhPNmFNS1NOYjNZMmc2?=
 =?utf-8?B?ZW9XaXNqTmttU2hLZnlac04wbjZUNlBFQldJNHZxMWFmSHV3cG0yVExvSkhq?=
 =?utf-8?B?RUphZlFMSEJWSTlkZXA5TWVISmx1YVNWMzdPeDIyOStqQVBxVGtYSmdQdE1r?=
 =?utf-8?B?VlVJSUtQb3MyQjZtV0ZkM2JuYkREMGF4d1UyeWh5MGluS0NkUUFDUzhDT29N?=
 =?utf-8?B?WHhQY1dVa3FPSXdDVVhpRWNLcVJ4RGk2R2s3NmdGRVlzeHk5OGxqbDI4MlMw?=
 =?utf-8?B?bk5hYy84Q3dVS2xRZndoMEQ0RGVRUUtIaUk5U25SVTBnL2c0S3NUYXAxa1BC?=
 =?utf-8?B?K0hZRUt5ZEtQWXJjMURCWGJOd1FBU1R0VFo2aVlHNjZRSUNWK3pjUzVCVk9v?=
 =?utf-8?B?YWJZZWZlNFdyM2FTYzdHZzBDdDUwRkNqK0FpTWVoUFhZNGxpbjZnYjF6WHcx?=
 =?utf-8?B?emwwSmZ0ZENIaW50ZE9UZTkwVTR6NmFNRUZWZVRQYjUxbVRtOEJnVDc5SG1I?=
 =?utf-8?B?SGZMRGdTY3NuTWgremUrV0NIMGxDSUIxaFFmbFk3Uitid2FaQXp5RjlkSUpm?=
 =?utf-8?B?WkMzVVlyZk0rdmJmN0hDaGdwOWFPOENMU054MjlWQ08rQXBSeUN6ZkhidVYv?=
 =?utf-8?B?TXVPTSt2RzVLVTdWNGUyMWQ3ME9mVVJpS2MwcW5XZFBxOXIyYXYraDcrbWcv?=
 =?utf-8?B?d0NFczNzZEV2NWw5N1BuamtERHBqSGxkQVdiaFYwZE43Y2ZwWVpEMWJPeTR0?=
 =?utf-8?B?RFlFdFYwOU5SNVQ4aE5NSGExenBndFFmUldCMEFvTHcyekR4VmdtU0hId0JE?=
 =?utf-8?B?MTNyWFlOd21OdnBaZktrd3FZNHlYU1p6TVI0ZDZLd0ExK0F6bjkyREVlRitK?=
 =?utf-8?B?dUdDY0JBb0ZQQWVRTWlLeHJrVEIvOXdFcmJWdnAxcjhSVmFSUzZYbmRNNm55?=
 =?utf-8?B?OHAvR2pYcTd6QXhvNDMwRmZlQnFXN2hZNm9yNVhxZVBxdnRPUS9MVnVtbndq?=
 =?utf-8?B?U2xaVWJvRnpmQ09leEJuWGFEVnA4N3VqSmROOFdrdjE0WFhkdkNwai9zSTBt?=
 =?utf-8?B?aStjQmJUTTMzSGFQRnllM0JNNkxpUERVamU1OFFJRjRPY25LT0lZeS9ENC8r?=
 =?utf-8?B?MzNFSDBGWkZGMWpKZzFRT0Q3T1VhUWRWNEY2TVpjZCtPVHNaRWc5WUxFRTI4?=
 =?utf-8?B?RUFZTXJJL1d4OS9lRlVyNC9KZC92VXNOaTNGS0lncGtoaFliak5PQStkWFN6?=
 =?utf-8?B?cy9MaXc0a0RpWUVuVUVCWjFUeE9CU0ZsM1NFa2xtaVo2MTBxb3lwZlJrekVC?=
 =?utf-8?B?TnN6c2ZSZU52Y2pVY2VwcGpXV0lKM3gvb2lneVl0ZWZYMlA2K3hwc3hoc2tF?=
 =?utf-8?B?bGt5WDg2U2IwZnFuT09yZVlMaHFQdlMrclllZ2VVYTRQL1dxcjhTYnJmNWRt?=
 =?utf-8?B?Z3ZlbmVQRXBNM244K2g4bGxoWGVWcGlqVk1BZk5wSUtiMkxoMFg2WkpmRzR2?=
 =?utf-8?B?MjBKT0ZLU3I3V0NEVjFpcThNWEw3S2RnV3RlYjR6R3ZybjIzNVg4MWZIZEI1?=
 =?utf-8?B?OEY0cVl2VkF0REhEM1VLc0haUlRQalpJSEFwWllYbnR0UWhxZWR3UUdTRGk0?=
 =?utf-8?B?MWR2WExUTUlRZ2RibkVYQldxa2NUdzZva3Rva0cxNlljMW5TMW5nZXJFZ2hq?=
 =?utf-8?Q?nRL6sxS03z1cVLSQwz7mMc7KY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967ba7c5-5430-4f65-2ee6-08dc0c0649bf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 02:47:12.9711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRDlEY9MaHzSzno5epmgBbRMvH+LyUoHAUTV6Yau3GkV+OvG/V2SEdgtL7bWB347KJGHffJEamILyJsyWaDRyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6451
X-Proofpoint-GUID: R3eLWypDeiQPGkxXZgG-1W0gSIcLog9A
X-Proofpoint-ORIG-GUID: M2KNfZecSctrSMBzHFjAuVzlTaIX28JC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030021
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4032VD7e005561
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 02:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193263

On 1/3/24 00:54, Alexander Kanavin wrote:
> The check already works, at least for me it correctly checks both the
> top level directory and the 'latest' directory:
> ...
> --2024-01-02 16:51:30--  https://sourceware.org/ftp/debugedit/
> ...
> --2024-01-02 16:51:30--  https://sourceware.org/ftp/debugedit/5.0/
> ...
> INFO: debugedit                 5.0             MATCH           Chen
> Qi <Qi.Chen@windriver.com>
>
> What does devtool output for you, without the patch?
>
> Alex

The command and output are as below. Pure poky master. No local patches.

$ devtool check-upgrade-status debugedit
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (18:44:43.533538)
Loading cache: 100%=20
|########################################################################=
###################################################|=20
Time: 0:00:00
Loaded 1848 entries from dependency cache.
--2024-01-02 18:44:46--=C2=A0 https://sourceware.org/ftp/debugedit/
Resolving sourceware.org (sourceware.org)... 8.43.85.97,=20
2620:52:3:1:0:246e:9693:128c
Connecting to sourceware.org (sourceware.org)|8.43.85.97|:443... connecte=
d.
HTTP request sent, awaiting response... 200 OK
Length: 2602 (2.5K) [text/html]
Saving to: =E2=80=98/tmp/wget-index-e1dsj90e/wget-listing-vrofeac4=E2=80=99


2024-01-02 18:44:46 (330 MB/s) -=20
=E2=80=98/tmp/wget-index-e1dsj90e/wget-listing-vrofeac4=E2=80=99 saved [2=
602/2602]

--2024-01-02 18:44:46--=C2=A0 https://sourceware.org/ftp/debugedit/5.0/
Resolving sourceware.org (sourceware.org)... 8.43.85.97,=20
2620:52:3:1:0:246e:9693:128c
Connecting to sourceware.org (sourceware.org)|8.43.85.97|:443... connecte=
d.
HTTP request sent, awaiting response... 200 OK
Length: 1353 (1.3K) [text/html]
Saving to: =E2=80=98/tmp/wget-index-qwu98rgj/wget-listing-8esd1gn0=E2=80=99


2024-01-02 18:44:47 (179 MB/s) -=20
=E2=80=98/tmp/wget-index-qwu98rgj/wget-listing-8esd1gn0=E2=80=99 saved [1=
353/1353]

--2024-01-02 18:44:47-- https://sourceware.org/ftp/debugedit/sha512/
Resolving sourceware.org (sourceware.org)... 8.43.85.97,=20
2620:52:3:1:0:246e:9693:128c
Connecting to sourceware.org (sourceware.org)|8.43.85.97|:443... connecte=
d.
HTTP request sent, awaiting response... 404 Not Found
2024-01-02 18:44:47 ERROR 404: Not Found.


>
> On Tue, 2 Jan 2024 at 09:38, Chen Qi via lists.openembedded.org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Add UPSTREAM_CHECK_URI(REGEX) to allow for checking new releases
>> for debugedit recipe.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-devtools/debugedit/debugedit_5.0.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/r=
ecipes-devtools/debugedit/debugedit_5.0.bb
>> index 63ad7babd9..3a596f5fea 100644
>> --- a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
>> +++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
>> @@ -9,6 +9,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf336=
59b29e73d4adb9f9f6552 \
>>                       file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17=
206a5b0a1 \
>>                       file://COPYING3;md5=3Dd32239bcb673463ab874e80d47=
fae504"
>>
>> +UPSTREAM_CHECK_URI =3D "https://sourceware.org/ftp/debugedit/"
>> +UPSTREAM_CHECK_REGEX =3D "(?P<pver>(\d\.\d))/"
>> +
>>   SRC_URI =3D "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${=
PV}.tar.xz"
>>
>>   SRC_URI:append:libc-musl =3D "\
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#193220): https://lists.openembedded.org/g/openembe=
dded-core/message/193220
>> Mute This Topic: https://lists.openembedded.org/mt/103478272/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


