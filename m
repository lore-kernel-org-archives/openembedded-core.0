Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F436C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 22:57:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.549.1648681033442038945
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 15:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=becvqu9Y;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=10884e0209=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22UMn64H030595
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 22:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=wzI2njCYyexyo2jbE8u9DcZ9/u5g7ltzIuQBMx6ucQQ=;
 b=becvqu9YsPF6aDkauUVur/Xyj09PDo9DFB79xymUWU0ECD084j0AF2+SKCJXWAFJMWIj
 wzO+JkIYCEmbIucLdtNWZEByF+mhQsJx6eYk3hWyUOJVS5UER78+itbW+WdDjR/sQaG5
 aqrVWOHdK+6/nBM3MXCbBmEF6VN8aUPiEuOh4GcMjq07T14Js28Sx6RrO1qiD6jAy4sN
 w+wqLBlx9i1NU9aBJ7rTHsWt2KnnBWkbdrMVm5EGDu5V/2nfjv7lcdi23S5FW4YoMlTb
 qfv+/DtKKVsdt+66jzQRQRYvabwLgLvpMgwX1OYirrRRDIAuyt+QiRqNV94L/eaAgk13 QQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1st83vtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 22:57:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWUfsHArf4lfVtU4GkGERlCrzcvm9rcbM2sBF/CVK+we3goIJtqTpB3vtS3TizS9axfD8Gc8m7+SE2Fdci4hLCK/1sGJXJLWWl3FxDZ0ihGIFeBdEal2+stdj3P1kbIKjLA4/B52MRiHo91d85W9BeaHGH0Dl992tBQHI40V7dzken4zB9/xsHAVjSi1n/E6SLWu6v4kZCm7mJfTXBk+/wriK6LGaqdiPcu0/Tg0G3e2IWrjRcVUdVI1JnN2PnqFfa3nJwcoQwk+/Ht15otHuQQ66MYeKxb+VbOLyr6t16uoqDu6M5Ek0CGuy2Rz+dlOn28fQ/VqG9Lp7aNyUdtrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzI2njCYyexyo2jbE8u9DcZ9/u5g7ltzIuQBMx6ucQQ=;
 b=h6zHFtkA8ZZFLGPWghL3KmsMCjeiJAmiUMPOCOlHEF21tJ/emH+0/eLU5q7jpWkGoOBiH8a13sxfkHXBJxktdnHh/PyjvmXyutzWfzorn/vfLtBdZZKX/DTIbZ0AAAqCofrNSnhf8sNg5Mssy6lL82WR9Gw9LsK4cow09I4wIMJUUjZetWWNbAbUGCYhlWpoz9MVEiMjE2cl4hXrUBEfKe+CbXtRgcUkx+1dxN32UazP0D+6eJXnGfk3DVMPRsjwgTDveI0+A7l954XwReSffK1nesSBELn6hV5kvoEN7j9Q+jZrPkLrBk7yshZJUIl+vvUha8+zh0/RHUA7UGwUGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB2061.namprd11.prod.outlook.com (2603:10b6:300:28::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Wed, 30 Mar
 2022 22:57:10 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5102.025; Wed, 30 Mar 2022
 22:57:10 +0000
Message-ID: <8177958e-2506-dadc-6d68-20627b7ca353@windriver.com>
Date: Wed, 30 Mar 2022 15:57:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH 1/2] kmod: Add an exclude directive to depmod
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <16E148345AFF19CA.29516@lists.openembedded.org>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: <16E148345AFF19CA.29516@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:303:8f::10) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e3c62fd-5cb3-4cb4-9f7c-08da12a09f49
X-MS-TrafficTypeDiagnostic: MWHPR11MB2061:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2061C1F4CEC9F154E52DFB9FEE1F9@MWHPR11MB2061.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i5V2KgskgOueZSnaRQiSDrhBaoSXjBlIW50C+m+xIajRlTE52QP4y9W2NXjo86jGH3Fw1plLt+7zDNbJXZ2ZXvOTPjU64Fpzr9BmIguWhCqmuttkyCZn8oAXnqsaLMD0M8B/BvhOoOwv+WFOpAdJq4zRGIxEsKFU+nnnoPQ8F3Uvn/A8VJmXVb2B+DNraSU/MP2F1j5yFaYqodwnXFer1gcHhPWT2UCFiHz1mD0knFHHzTr17Oo5JgA+snGUB/XLXQL77V7QMrH1ixDs0R2CB3bz6rm2zuvV+dyFeEVouGT7sL47wk+tJp+6TiH/ilibjuNDT9AbPvf7rR4YkLbLZdQzsQciR3ml9ZzKyu7NzmFqrE16BGGatLwdrdLYZY2Vv6SU1wEPjxgQKUIrmqb7ixtxO2nfDqv6OhbV81R2RC9N2c4Kr7gU9pjEjl0BdmOqDGLgPUM+83444zp1G3F0hn16+xXXZos44kWxk6IeTvE+7gGn7ZHamrCXUwmaSlSAorGbRI8YQcvOmr4XXrQn5+fesRq1ZLVNkVnr0GMeQwPPbsiuvCug9H907GL2kjGTQQlqR+JWCCiIw5OcKF7rVbTp7sGfMw+PD1mZ5ICts9zQtTqucKdmCDnIaJ4Lm5PtL5C1+JFSHEAM9/M16n6ACD+cWlLjpdnipdyGlBmBBKBMqXFR9TfH9KtyejibhzNRasJ+UYTGEpRUzhKSceQ3uWeuo6P2OVtv4hEVjgHgRc8gg84/sLe/FBgmp62TSqt5v9uZxoyWj6Y1uiMlnZHPDblGSfc5n15I4umnAB1LN0Ke66Zd2puzsF/7CsvmbvEIFIs1v0fAmndcN7E5tz+w35nCwkTtUIUx51VjNLnqM978mJIotAdfEAriBbe4jYp3R0E9muzzzPv7d6AvB6NZ+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(31696002)(83380400001)(8676002)(36756003)(66476007)(6486002)(66946007)(966005)(66556008)(316002)(31686004)(6916009)(38350700002)(8936002)(2616005)(508600001)(5660300002)(6512007)(26005)(38100700002)(186003)(6506007)(52116002)(2906002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0FOb3VHdzh4c3RtVnJrMktUd0I4RGFNTnZ3ak4zU2xyVU9pYkNGYmdPdW5H?=
 =?utf-8?B?ZjlxTjl3ZjRBb01SNDZtcXBXZG9yR2o0cVdad3ZxbG8wSlRxVXhFUEJ2RFBn?=
 =?utf-8?B?RXhsaVh5bW1HWGIzc0ZpeVpxU0lHakJGT1NGTkVKZVBkYVNWUWRETW5SQmps?=
 =?utf-8?B?Mk44d3hLQldnNit6VkorcW42K2svSDU2NjhqOE9zK1B2VnJPNWtOUTJJTkYv?=
 =?utf-8?B?dE5tb1NES1BpOTFSQkZYelh5TU9Nd3hCajJMZVVJVXFQUVBkNlRzZVJ6WEtO?=
 =?utf-8?B?MGNDWXQxaHpvZmNqQTVlNEQ2WnNudnc5QjB6RUxWTEV3dzVlSGszbEl3UHR0?=
 =?utf-8?B?YzhmZGhLeUFMM2ZyUDQ3TVZiT2hsRXBGVFZkLzBHL3JqMTh0cG9DUjdMV1lL?=
 =?utf-8?B?SEM0OWtmd3JMYm1FSTVTSHZFdDAwRDFUZFFUNGQramtPY1B3bTh6NVFtb2Rx?=
 =?utf-8?B?RXhUTFpxOGZDZmdOQ2Z2YzIxOXJRRGgxNFlXNDdLaHVQa3dCR3U0bUpFY2hM?=
 =?utf-8?B?OWplTEQ2ZnRwbzQxQnMwWVJ6eXlhS3FBSFU0M3duOHlXREUzZG92a3Q1aW9l?=
 =?utf-8?B?M2ZLY08rQUQ3WVFrZkJOQVM1WkFBSXRPUmdLQ3R6dyswdWcyd01FeFQ2aEZV?=
 =?utf-8?B?WGRoSzcrODZiR0FkSWdSZnNFVytocCtWZzdKQmo4c1Z5QmNDUWFvbkRCQ1Ro?=
 =?utf-8?B?aE1Vcy95VVNiWlh2K2xRbHdOaXhXd0F5TTUrVjd0VW1HODRQTDMveWd0RDcr?=
 =?utf-8?B?aE9XWThYeFlWdStKRndpQnpFWERkcnZPdzJWSG1PRDlWMHd1TnhObVpaZG85?=
 =?utf-8?B?alJKWkNucFB6OUN4MFZFWlJLcGFtay9LeEhyd1ZBVTYrSnlkbGUxd210Nk1G?=
 =?utf-8?B?MlV6eWlnR2ZlOEJiZ0c4NS9qakg3MlN4NmNONTNGV1BYUm9YV0dkdTF3SGYx?=
 =?utf-8?B?ZmNCRE1IeFM5M0NXZmxRdVhpVkEzbDJZNXVUNXdLcnJQODNxOHphWjZQcWQ5?=
 =?utf-8?B?QXdTTHBiRERxNURja1N0S0tYbkRqdFVnZUlkeDhqRHN0aHQwT25Pekw3bS9r?=
 =?utf-8?B?Vi9QWTdJeGw0UTgybU8vS1N0VXl5eWpTV0RoUWRxZkFnV3VWSzYxZkNzN3pZ?=
 =?utf-8?B?WDVHR3IxaktEUXBzVDNiN0NVb09UbWc4VDlBRmZOV29pRjlJV3YyeDRYdEt1?=
 =?utf-8?B?TVdBWURaMkp6TEcvL1dqSm5LcVJUTC94MTMzTWRXOFZweEx6UUhuMUN6TWRj?=
 =?utf-8?B?Qm5XSGUwaXA3S2hSUVBiTDh6eXlvbjhEbGpvYWpCVnJ3WHlIZXRtczVDZG5D?=
 =?utf-8?B?aFVSTkQ4VGtXVjFaMDlIelNOVVZLaURLMHZlY0N4YjBCaDJUSTZPUElqcmxL?=
 =?utf-8?B?M2swYjhOVVpJMjQyVzU0ZXZwU3NqZHgvVUlWOUdYenFIUWVBRTdCbzhjeWJ4?=
 =?utf-8?B?M2FUMFVMcFdUam9sZHVNOG5VTW9VMzVBZ2VGbm5aRjIvMEpCT2cyc0FuMVdk?=
 =?utf-8?B?ajVCNEUwbjA2b2U0T2FzWkwrMGtDRlQzeGZUd2JoY0lacm5mNGNVaFlzTXlh?=
 =?utf-8?B?SFo2UXZKcElUbUtlRlRTTnUwSDJzb0tJZGU1Um96TUJlZ2NTazN3Z3NYOEFv?=
 =?utf-8?B?dUtEd0Y3WWlCYityODRXM2tlazQ3NkhVUTRZdFk0S29XOFVsTHh2K1BFcWFr?=
 =?utf-8?B?UDdMb2tPR25abzhoVDdscGwzakJZUmdPM0gyUFRQZDVlbklSbm1VNEJ5ektM?=
 =?utf-8?B?QTFabWFGYysrcFhHb3c2ZHVReXczNDlDaTZWM3BBbUhCT0RjVVdDSXZHRWFw?=
 =?utf-8?B?YUd1SHFiQVdmZHk0dkhJSjRVdng0QzdLa09TT3luaHp4RnB6YUZWK3BxdEU2?=
 =?utf-8?B?Q01XMWF1UGdVVDJEZUtSR29CaGdCVTVMckM3TWVkTWNLb00ybkdkRU40MUdB?=
 =?utf-8?B?S0Y0S0g3TjliUkVva0laVE5GcHhqQkgxSDh1V0JWWXNTSXdvMzVYc0NmcXNN?=
 =?utf-8?B?Nm9yUEJtYWl4Umljd21GYk9VbW5oQmJRZ2x4cHRHOWtodGd4TFVTdSt5cStm?=
 =?utf-8?B?ZFpQTkFvNkV1ZXg3SkxoaVA1L0VJR040TG0xQzdxQ2hwKzRkSkYvRGVFa2h5?=
 =?utf-8?B?dmFURUZMVm9JZW84ZmUxUG44c0RqL25xSkF6Z0dXdVVVaXRRNEJUWThDcFZ0?=
 =?utf-8?B?YjIwTEgyUlB5OUZqTTU5SHExblliVkdFRXZENU40Um5aVmFueTl3bytvMnBa?=
 =?utf-8?B?NkRudzBpRFhyWURUakxmb2RjRFNhZHk5RjR5L2RGWjZXRGtSc0VLMkFOOHpI?=
 =?utf-8?B?Z3VlVzBJVHFPME90Ums4VEpGWXVyVkhtQ2d3YUZjb1JtNHFCQjczTGM0SXky?=
 =?utf-8?Q?6y1PweycW/5GKVNA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e3c62fd-5cb3-4cb4-9f7c-08da12a09f49
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 22:57:10.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NlphGQxUBPQvanXDZCZKNtzKLXBApbQunzuod7Y3S4lGRDz6qtOOQl9WcH8EaxiB2kOSWbaWv2XTFS0ll3syww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2061
X-Proofpoint-GUID: 9UZoAwnQkue4XqdwuAAREzMqiO4tw4WJ
X-Proofpoint-ORIG-GUID: 9UZoAwnQkue4XqdwuAAREzMqiO4tw4WJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_06,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 clxscore=1015 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 22:57:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163797

I got some feedback from the kmod upstream, a v2 will be coming soon.

Sau!


On 3/30/22 15:11, Saul Wold wrote:
> This adds a new configuration directive to depmod that causes
> depmod to exclude a give path entry like .debug.
> 
> kernel-dbg provides the modules .debug/<module>.ko files and
> when installed either directly or when dbg-pkgs are selected
> this can cause depmod to fail.
> 
> This patch will be submitted to upstream kmod.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   .../kmod/depmodwrapper-cross_1.0.bb           |   3 +
>   ...dd-support-for-excluding-a-directory.patch | 158 ++++++++++++++++++
>   meta/recipes-kernel/kmod/kmod_29.bb           |   4 +
>   3 files changed, 165 insertions(+)
>   create mode 100644 meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
> 
> diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> index 04fc14a6d21..aa23ba41276 100644
> --- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> +++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
> @@ -16,6 +16,9 @@ do_populate_sysroot[depends] = ""
>   
>   do_install() {
>   	install -d ${D}${bindir_crossscripts}/
> +	install -d ${D}${sysconfdir}/depmod.d/
> +
> +	echo "exclude .debug" > ${D}${sysconfdir}/depmod.d/exclude.conf
>   
>   	cat > ${D}${bindir_crossscripts}/depmodwrapper << EOF
>   #!/bin/sh
> diff --git a/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
> new file mode 100644
> index 00000000000..3f16cdf0574
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod/0001-depmod-Add-support-for-excluding-a-directory.patch
> @@ -0,0 +1,158 @@
> +From 8bc07c3ba3a412bd6bb94ad8bad0d76801ec2c9f Mon Sep 17 00:00:00 2001
> +From: Saul Wold <saul.wold@windriver.com>
> +Date: Tue, 22 Mar 2022 12:11:45 -0700
> +Subject: [PATCH] depmod: Add support for excluding a directory
> +
> +This adds support to depmod to enable a new exclude directive in
> +the depmod.d/exclude.conf configuration file. Currently depmod
> +already excludes directories named source or build. This change
> +will allow additional directories like .debug to be excluded also
> +via a new exclude directive.
> +
> +depmod.d/exclude.conf example:
> +exclude	.debug
> +
> +Upstream-Status: Submitted
> +
> +Signed-off-by: Saul Wold <saul.wold@windriver.com>
> +
> +%% original patch: 0001-depmod-Add-support-for-excluding-a-directory.patch
> +---
> + man/depmod.d.xml | 14 +++++++++++++
> + tools/depmod.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 68 insertions(+)
> +
> +diff --git a/man/depmod.d.xml b/man/depmod.d.xml
> +index b315e93..9ab790a 100644
> +--- a/man/depmod.d.xml
> ++++ b/man/depmod.d.xml
> +@@ -131,6 +131,20 @@
> +           </para>
> +         </listitem>
> +       </varlistentry>
> ++      <varlistentry>
> ++        <term>external <replaceable>excludedir</replaceable>
> ++        </term>
> ++        <listitem>
> ++          <para>
> ++            This specifies the trailing directories that will be excluded
> ++            during the search for kernel modules.
> ++          </para>
> ++          <para>
> ++	    The <replaceable>excludedir</replaceable> the trailing directory
> ++	    to exclude
> ++          </para>
> ++        </listitem>
> ++      </varlistentry>
> +     </variablelist>
> +   </refsect1>
> +
> +diff --git a/tools/depmod.c b/tools/depmod.c
> +index eb810b8..8b19ab6 100644
> +--- a/tools/depmod.c
> ++++ b/tools/depmod.c
> +@@ -458,6 +458,12 @@ struct cfg_external {
> + 	char path[];
> + };
> +
> ++struct cfg_exclude {
> ++	struct cfg_exclude *next;
> ++	size_t len;
> ++	char exclude_dir[];
> ++};
> ++
> + struct cfg {
> + 	const char *kversion;
> + 	char dirname[PATH_MAX];
> +@@ -469,6 +475,7 @@ struct cfg {
> + 	struct cfg_override *overrides;
> + 	struct cfg_search *searches;
> + 	struct cfg_external *externals;
> ++	struct cfg_exclude *excludes;
> + };
> +
> + static enum search_type cfg_define_search_type(const char *path)
> +@@ -580,6 +587,31 @@ static void cfg_external_free(struct cfg_external *ext)
> + 	free(ext);
> + }
> +
> ++static int cfg_exclude_add(struct cfg *cfg, const char *path)
> ++{
> ++	struct cfg_exclude *exc;
> ++	size_t len = strlen(path);
> ++
> ++	exc = malloc(sizeof(struct cfg_exclude) + len);
> ++	if (exc == NULL) {
> ++		ERR("exclude add: out of memory\n");
> ++		return -ENOMEM;
> ++	}
> ++	exc->len = len;
> ++	memcpy(exc->exclude_dir, path, len);
> ++
> ++	DBG("exclude add: %s\n", path);
> ++
> ++	exc->next = cfg->excludes;
> ++	cfg->excludes = exc;
> ++	return 0;
> ++}
> ++
> ++static void cfg_exclude_free(struct cfg_exclude *exc)
> ++{
> ++	free(exc);
> ++}
> ++
> + static int cfg_kernel_matches(const struct cfg *cfg, const char *pattern)
> + {
> + 	regex_t re;
> +@@ -657,6 +689,11 @@ static int cfg_file_parse(struct cfg *cfg, const char *filename)
> + 			}
> +
> + 			cfg_external_add(cfg, dir);
> ++		} else if (streq(cmd, "exclude")) {
> ++			const char *sp;
> ++			while ((sp = strtok_r(NULL, "\t ", &saveptr)) != NULL) {
> ++				cfg_exclude_add(cfg, sp);
> ++			}
> + 		} else if (streq(cmd, "include")
> + 				|| streq(cmd, "make_map_files")) {
> + 			INF("%s:%u: command %s not implemented yet\n",
> +@@ -857,6 +894,12 @@ static void cfg_free(struct cfg *cfg)
> + 		cfg->externals = cfg->externals->next;
> + 		cfg_external_free(tmp);
> + 	}
> ++
> ++	while (cfg->excludes) {
> ++		struct cfg_exclude *tmp = cfg->excludes;
> ++		cfg->excludes = cfg->excludes->next;
> ++		cfg_exclude_free(tmp);
> ++	}
> + }
> +
> +
> +@@ -1239,12 +1282,23 @@ static int depmod_modules_search_dir(struct depmod *depmod, DIR *d, size_t basel
> + 		const char *name = de->d_name;
> + 		size_t namelen;
> + 		uint8_t is_dir;
> ++	        struct cfg_exclude *exc;
> ++		int exclude = 0;
> +
> + 		if (name[0] == '.' && (name[1] == '\0' ||
> + 				       (name[1] == '.' && name[2] == '\0')))
> + 			continue;
> + 		if (streq(name, "build") || streq(name, "source"))
> + 			continue;
> ++
> ++	        for (exc = depmod->cfg->excludes; exc != NULL; exc = exc->next) {
> ++			if (streq(name, exc->exclude_dir)) {
> ++				exclude = 1;
> ++			}
> ++		}
> ++		if (exclude)
> ++			continue;
> ++
> + 		namelen = strlen(name);
> + 		if (scratchbuf_alloc(s_path, baselen + namelen + 2) < 0) {
> + 			err = -ENOMEM;
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-kernel/kmod/kmod_29.bb b/meta/recipes-kernel/kmod/kmod_29.bb
> index 91951edde16..9b663490666 100644
> --- a/meta/recipes-kernel/kmod/kmod_29.bb
> +++ b/meta/recipes-kernel/kmod/kmod_29.bb
> @@ -20,6 +20,7 @@ SRCREV = "b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1"
>   SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master \
>              file://depmod-search.conf \
>              file://avoid_parallel_tests.patch \
> +           file://0001-depmod-Add-support-for-excluding-a-directory.patch \
>              "
>   
>   S = "${WORKDIR}/git"
> @@ -64,6 +65,9 @@ do_install:append () {
>   
>           # install depmod.d file for search/ dir
>           install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${nonarch_base_libdir}/depmod.d/search.conf"
> +
> +        # Add .debug to the exclude path for depmod
> +        echo "exclude .debug" > ${D}${nonarch_base_libdir}/depmod.d/exclude.conf
>   }
>   
>   ALTERNATIVE_PRIORITY = "70"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163795): https://lists.openembedded.org/g/openembedded-core/message/163795
> Mute This Topic: https://lists.openembedded.org/mt/90143170/4950653
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Saul.Wold@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Sau!

