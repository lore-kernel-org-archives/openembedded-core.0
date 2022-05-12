Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEEDC433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 00:51:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.1640.1652316647474797593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 17:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hPQrkH8M;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=2131f5a579=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24C0XgCr019269
	for <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 00:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=B911KotCg1TmsAOugQUbNTtZUhbtOcpFQ9ixZEM8DcU=;
 b=hPQrkH8M2mhQ9j7dBgbPzTG3u+xMbxpgrioDOfuJ+tDIznn7+2eZCcpbxlOppGTFi9mu
 bxWgxCJ5mqFgv1eA5XJfFu3aHMSjJvH7A3ByQXuUHiKh8NRKBGfPlINBHt6Y3ZMHwVAx
 EQ/YiySapmloCruYcZS330CLctn0pcuqoSmf644WcxkCoDfFW5A0jIaNeTA4KEks0qh/
 VEi8jLtM0e//lh7F729EW/ogSLydxL14PmQVYQ+8tmc5pV2/LJGnaP4Ok9gFOHae03v+
 0G4hvXTIAYIOQ76IgQITB4aGxepCvMaLtFus5u7GV59O8b9D/PJIr0z+jEkTAjvXGT36 9A==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwfr8bhtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 00:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nASoEvCMj/X7x0shLvmy4teIxsW8tArp2k6+k2tF86N+7mFxMGv1d6qyzu3p+vPkta1k3D6db7tUgiWbYezTX7SAYTSyFcJp0nnnCAgJMsUThWkVSnKWsrumhrqixm+AOw6yD3kWr1cpGUYw1w8AXAKx9OwIyqog1lRe3uq2PH7edROYWhcclxdWw6tkJAxmZIj+/YGbgGfUwmzfaeYMB/TWTDYxexvFqFXHtufFK7/r7Qm5e6f1hiIT22LvKKMsQBxz2enMUP2cNJsNqbazViL+N6FM4LgQun0X2rM6SYGwh00i/IBnppo6fKqqTMs2Ia16DAzoeGiNGCgFAfY6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B911KotCg1TmsAOugQUbNTtZUhbtOcpFQ9ixZEM8DcU=;
 b=H7XVldkQ0Xk4z5/h8BjlKgyAXeK4tHT02CDhij8hvf4skvZKzin2e4VxIDLE8TbwT70sQrAGz44TtzKhY09DhV5WMMHEZeHKGiUCuMAW3VC7o6HBOWic7TE3sXT2+VrvNAosfkjYiz1szuZkOz4zXlOUvv9EdiH2P7PGyF3y3vFecq0J4m6XEvplWqOGr8F/S3QFc8BE5E5oqwHXxj0VE7NO91HOIemAWT5VR9f6yQ5KvWL5c6VfEkLj0GcKqgcrOT9fQBkaeodEZcaf5V2mgTyxe5Jbz/MowL1tWQyLY1ejtuTfHcAtVoFPBt52ftzHDgQK+l3eZ78fXe8iZx5wnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BYAPR11MB2727.namprd11.prod.outlook.com (2603:10b6:a02:c7::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 00:50:43 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a996:ba9f:332:de3]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a996:ba9f:332:de3%7]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 00:50:42 +0000
Message-ID: <b65b45b1-2138-b1de-3d7e-55ae6a52a172@windriver.com>
Date: Wed, 11 May 2022 20:50:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [hardknott][oe-core][PATCH 1/1] util-linux: fix two CVEs
Content-Language: en-CA
To: Joe Slater <joe.slater@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20220511220550.20068-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220511220550.20068-1-joe.slater@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:254::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da9933e1-a74f-4429-cfd2-08da33b1712f
X-MS-TrafficTypeDiagnostic: BYAPR11MB2727:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2727E65E666088669B0B5635F8CB9@BYAPR11MB2727.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5M1tLX/L/GJQa2vLt1hisn0jO8F03AIqYAfURExB8cY/POj0xsSAH/7inuL1pL1odAVKeT4/OSpndagxt9FgGi7HUPKQSC1vYvYnwK+jCwzdFtfTXKExx+Uun1EVUC3Bm2DyA4rBhPHntjzK+qi/dSkx+gZxEVPG57vrKx3GeA4G103mpYwF/IZkfFK9/KXFdC/oqBnBJ0Gd1ZYBh0lsGMf5Ke5vP0gm6Cb89/zLDUSwF2u4KUVMJrXzXwpk6pHhxi8I9NAckKJtvAF+tJwIv5cr6aXdWB2u9H7+7oXMTTqP6tImxioTyb505oiLKo/sYGi4UUGud0RMmFXSyJduHyh6AuY/Mu+l6Bm8o8jWBmFmRHYWBwMVRmYpnQt3hvlBN7jQdpXIHkxHa+3c3rRd8ykhgJvb6jvqQGrajPvICo1OInWHCUazfWSOMSqNAjAyaZCUl93P2mraJnUbkZgqhL9DCL3nTIA3KCNpJh+18koxdrCcbaYRdGlKz9wsCGZGXsrwZSoD7G8pFHLgkA5MrV6A5xPdMkAne1s32BJLKflgjKUxIefc95vrp4Mn03WP+3metoSFLPIKgR5vi8sIB1juIZBpfha4V+qJ0YuMTxD7zGxQeoLlpUeC4aIhUQV8iStX7heU3HwJXnavZW8X18S3Zoz3cTOZ5aO2as6eO8xrCEqoX6fvBQxaqFKjiK/eX5J4zt1N6IAjDdfcEttBYAVrY6GW8sDZIJYzomD77UJ14ilaQVkg/+NzQb+3ojiYon649p+7wRyuG4PXezpj5VmHVLJmrWREnlcadduYugydd/ZPibwV1s+1zJpOFxF1q83prKhOBN/ysX5kzCubrEmXj8ql+NKYmCYMPk/j/AY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(2906002)(8936002)(86362001)(966005)(6486002)(508600001)(5660300002)(6506007)(53546011)(31696002)(52116002)(83380400001)(38350700002)(6512007)(26005)(2616005)(38100700002)(186003)(316002)(8676002)(36756003)(66556008)(66946007)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WWt4cy9MWGtCSXV6TmtOVktHMlJXQTlobDEwNHQ3OUk4S3dJUURYYitxRlBE?=
 =?utf-8?B?a2xYSXZxSWw2RHlZdUxUeTByY0t1cnNrMkExZktzNTBKNzFUOUNBM0pSbTQr?=
 =?utf-8?B?dUNjeG1EVDBLc3U0YUdEOWpiVkc0dkprZmJ3Qko2ZTgxNW1ZOWFvek5nWTFY?=
 =?utf-8?B?bWNSSEcxMFpSUkw4eldNeFV2ZXNXMGhEbVJXanlGS05RWXlVd1RBK2VtWFph?=
 =?utf-8?B?aHZGRnNsckxEajhxdmZyZnhocCs1bXE2akZyVml3NGc3NE80b1BvR25LaXBF?=
 =?utf-8?B?UjNtOHQ2MzZqY2pBc2hsRmlRd3ZFaXIyZFZ4Nzh5UCtUdmovQ0RHWVE3WXpV?=
 =?utf-8?B?bzYwbUZtV2xSQWpaMk1lNGRDRmtMQnMxUUVVNlBLTUxmVC9HTFhXUVZXbTNB?=
 =?utf-8?B?Rm9xRDZtREdDM2JmWFRpa2ZFaGZlZWY1UDF5djZ5UFoxem5CQUVhMkxTR05X?=
 =?utf-8?B?ZTlFZlB4U3J0K09zL0NJS2VOYzNkYXV0WFpDU0tra0JGQmpETjIya2JjSk93?=
 =?utf-8?B?aUdEQW9ib3dZUndEa2dXZGR5bEpzYndVR0hPeGQrU0dtTUdOdHpRdmh1Z2Nl?=
 =?utf-8?B?MU1ON0JZelBkZS9WeFo4QUlWOVBZT3MvTW5BWVVPWk5zViszS29EWG50ZlRx?=
 =?utf-8?B?OEFMeDFlUTlBNitORWMvVkRsdHZZN3cvSjNOYmUxWFduTHlXcUxXbXBxbW9E?=
 =?utf-8?B?dWF1OHZNMnZtR2dTWXJvWGlOYVBybVdEQkU0WXFIWS9LajZmSFhlYXAzdXZJ?=
 =?utf-8?B?MjVyZlFRM2ZhajFUMzRBSjFMdE03dEFqNjJDVXFPK3p0a25vSzRMcHFseVJo?=
 =?utf-8?B?TmVTbXhGemJGbENCME56ZGU0cHNkWU1YYlNyVG1GSjM2ZUFnNzRqYUNlQ2Q4?=
 =?utf-8?B?UUU1dnVwYXI5Y0V5RjFOUHhDNWd5Z1ZncFlBUHlvRVlBTk1MUVphSG16RUt5?=
 =?utf-8?B?Z3JFQ1J2ZHE4cHFPRVdNQWRSbDRBZWF6bE9kVFAyV2hEdDI3ZVdZb3dHVVdp?=
 =?utf-8?B?U2RuaHdhdGxuelliWFZZMm1tbUtqZkdhaEsrSlJCZ3k2VzY3NzM4Z1hNNEND?=
 =?utf-8?B?RjFybmU1NVVBWlRXYXVOakplQ3JrcHcvTVdVRTF5dWJROTFkenYydU1rZnpx?=
 =?utf-8?B?QjBtVkRzZHJsOHNEMElkNlFGQVNrbVNyRE5IRU1aOGdERVE5RlZHR0Yvc3ls?=
 =?utf-8?B?M1JSU0ZLaW9EYi9GMHJMSWltYWJSbk1XWjZqb3dQelZPejNiUSs0Uy9mRWxC?=
 =?utf-8?B?OTNSTHFnMDgySDZ1TnZ2TURldGJNZ3V6Skx3anlOZStIaVFFNytGOUZFQUZ2?=
 =?utf-8?B?VWFNSGVONEJxaW9Cc01EZzd3WDBXRGd5dElOODg3RWs4aHJIQUZjYkxJdzlI?=
 =?utf-8?B?alBNTjkyVWVvOXVBeDM5SWV1MHZHeUk1VE9KSW5HV3pyVzVSUUtOWGtaVUFz?=
 =?utf-8?B?dllGM2Y0SFBqRG5Db0lZYzBaRkdSRnFMTHU4SURFNVFKREk4WHJOV0U0aTdL?=
 =?utf-8?B?Y2hOK3JMNGtOVElNMXZXNGRLU2ZMZUZMSW5QSG1SKzZTVCsvWGlVSHlxL1Ey?=
 =?utf-8?B?RE03a3NOZGJKcUpqWFk4TFM0TjkrQUVyQ3FlVnFkS0J1cW0rL1dPS242Y3g5?=
 =?utf-8?B?a296OHEwa1Z3K256WXh5U2hoM2VIc0lIa2o1di9kZ2NadG1iK1QvVTVkOUZW?=
 =?utf-8?B?VTBJYXJFYUxPaldBNG9iMmtwb05XbjRpajAzZ0FqTG9FY0tkdjhVUnlieis3?=
 =?utf-8?B?K0dRL3pUT016L254MWlSNmN2WGtHWmdoM3BIUHlZazkyWWtSRmdOcWpsQVZX?=
 =?utf-8?B?b0NHSjEyWFJSQTQwVHdFQWh2cEg4MHhoUGw3L1JsUG5xcXpXMDdLV1EydFVZ?=
 =?utf-8?B?ZXdZWk5vQ09SbUh6V2VhZDV2UlMyL0dLNTBBWVprZXhyRStVL2liMkZaSTlE?=
 =?utf-8?B?YWFwMENqaVExVzk0dXdmamltK0JUdlBzZkJ2a241OWZMZXJZZUlwWGFTbFE0?=
 =?utf-8?B?RGprZXZtM1NhNWNIcWQ2RWxKUDZLTzZiTzdEV1NtV2hwMDY5TEhDeWU3VHBs?=
 =?utf-8?B?M3Y0cUtpZWVjZFY3QkNKMnR1b29NVGRyL2k3NjJ3ak1HZDkxSE10MlkxWHRH?=
 =?utf-8?B?TThoMUREWlE3R3M5SzFmNU1rOVRjYWxQQktjWjc4cXdDdFlNcVJpNHIzeVNi?=
 =?utf-8?B?N0h3UVJMaE1uWVp5VThlZm1QVnVHT0ZiUWE3eVl2NUZMSFQ5aWNyUXoyZXI4?=
 =?utf-8?B?WnliOUhuYXRPMnVCZEx6bTNiRjg1dlZBTVNoNWxkNTdHZDc3M24vVXVEZ3dy?=
 =?utf-8?B?em9DZVA1TkJ1Rk5UbXl2MVR2UE1LN3NieEpCdjBGcXlkckZXaGwzelo2WXNU?=
 =?utf-8?Q?JBbMbwbQv2Zn96XAfMXIfqD9bqZsA1TqhUaN7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da9933e1-a74f-4429-cfd2-08da33b1712f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 00:50:42.9251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0yfZ8HyLUJaHfQr3xRkps/oaTDiTOT12DsoaWgxpR+Ur4+pXDYQ1Rh8xgJgO/OdmRxfk6jgmndY4A+r8TRzR+/VpTtwEp4XeEoh8mHwfNUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2727
X-Proofpoint-ORIG-GUID: 1UloeveW0f_KXH8AOcRrL0ctRGWZwciJ
X-Proofpoint-GUID: 1UloeveW0f_KXH8AOcRrL0ctRGWZwciJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1011 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205120002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 00:51:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165532

On 2022-05-11 18:05, Joe Slater wrote:
> Advance to 2.38 to fix CVE-2021-3995 and CVE-2021-3996
> by pulling that recipe from master.  The first version
> on master to fix these was 2.37.4.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   ...d_2.36.2.bb => util-linux-libuuid_2.38.bb} |   2 +-
>   meta/recipes-core/util-linux/util-linux.inc   |  18 ++-
>   ...-tags-add-use-system-commands-option.patch |  35 -----
>   ...RA_LTLIBRARIES-instead-of-noinst_LTL.patch |  49 -------
>   .../util-linux/CVE-2021-37600.patch           |  38 -----
>   .../util-linux/avoid_parallel_tests.patch     |  27 ++--
>   .../util-linux/util-linux/ptest.patch         |  15 +-
>   .../util-linux/util-linux/run-ptest           |  24 +---
>   ...til-linux_2.36.2.bb => util-linux_2.38.bb} | 130 ++++++++----------
>   9 files changed, 98 insertions(+), 240 deletions(-)
>   rename meta/recipes-core/util-linux/{util-linux-libuuid_2.36.2.bb => util-linux-libuuid_2.38.bb} (95%)
>   delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-tabfiles-tags-add-use-system-commands-option.patch
>   delete mode 100644 meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
>   delete mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
>   rename meta/recipes-core/util-linux/{util-linux_2.36.2.bb => util-linux_2.38.bb} (77%)
>
> ...

Joe,

Hardknott is EOL so we'll do this in WR Linux only.

https://wiki.yoctoproject.org/wiki/Releases

-- 
# Randy MacLeod
# Wind River Linux


