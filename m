Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7CFC00144
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 02:02:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1520.1659405772656899306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 19:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EzfWUnTR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5213cf310d=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2721qSQ8015241
	for <openembedded-core@lists.openembedded.org>;
 Mon, 1 Aug 2022 19:02:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=B/U7GRE0kXLqeNr9FQnIMDOoC+8TaW682MaAglILylU=;
 b=EzfWUnTRdQiymrAZtlTrm/WXy/zWuV92oarNLXaERugri11dxzOiAOsKyfG5L1wKAw4u
 uLCqgVmvIrFTIZojYRBtS7SwqTHUeQYkGlhC1+VGHPHM06frqONYLbBNoCeuFCGJInp+
 W2EOg/AHwqGrNSd5f3z3MMCzOQJqGuzFt4F7yX2ZM1VGBNskTsPfAvY27PRvzaH8BUS3
 DaLBkIWrLBeG6Z/YG+Q+96U3nnx52nrRyb2ylgUPB2wRio79/cViu5Qypd/J8GMHpoGB
 frRFTb+bsgceNdeQwFLo4Oqmo4cA5ebIvSWu6uc5ttFNxaYDZvEzgimmrKxiD7yWxLsz zA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hn45jsrjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 19:02:52 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27222pVg004420
	for <openembedded-core@lists.openembedded.org>;
 Mon, 1 Aug 2022 19:02:51 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hn45jsrjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 19:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7us17aimidhdp5B4VxGCFSY7zasxAsNuDVDmmlIeu+zwflfI+5w+MtT2g4ThL5zhcqBRrJN7kmPq5MeZ007LpC3LslGYNL+PsmpZmDuWr51u3cji2mrQ3D7X75I5P9iTm90HaRb7bGRDsX3uMTUankWqpFC9mK8JTHvL+SRe9IrPvovxXQd15tlE8r/KBdkuPkZ5gh5W4TbusZBYWQxxfGez4NblSMLB+b1PsXbC40oWIHDrc7QGBAbHM9joMlKLWdakMbqvl/y01gwfxW25is4VTF+HwihgGtreMunOjX+z+VyLOH9CP58okMNJZk0LJHasJ4YkwH67eGko/RRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/U7GRE0kXLqeNr9FQnIMDOoC+8TaW682MaAglILylU=;
 b=XeiuHi33kUP3rEjOjzPXwaX+EwcMRvpXXC8SYnYIDAhiVoknhadEvdbVuRdWm0q2/G1PWN/eBR116nF8atlzjigwy7xG6TYXTrWzymPMxwnYs5kI+TzWHosSpcK7pDZeveNrJ+OFDdI4bKT+Wwds1gPmGS3lwOEw2bQTk78Eo4L8PSd5+F4n0N+djXg6AxqaFPfBjZT1ZTB0l/U03lfekS8o+I+uSdkQ/vkNNsyLWJBbUJuI2PxYORQhIp26HMURzweGaNvFfMXBdUZUTeOTgEsqIUlD3IMlnOrcyGtpYurxlElFyel8aV6JgPqhtVmSenvfgd7tteSQl03oN667Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by CY4PR11MB1592.namprd11.prod.outlook.com (2603:10b6:910:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Tue, 2 Aug
 2022 02:02:48 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::e962:2a9c:c503:db56]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::e962:2a9c:c503:db56%11]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 02:02:48 +0000
Message-ID: <79db00af-f331-78e6-68e2-84fb6c3c157b@windriver.com>
Date: Tue, 2 Aug 2022 10:02:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core][PATCH] lttng-modules: Fix build failure for kernel
 v5.15.58
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220801085136.38110-1-zhe.he@windriver.com>
 <20220801150401.28861502@booty>
From: He Zhe <zhe.he@windriver.com>
In-Reply-To: <20220801150401.28861502@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fac71813-4f8b-4b96-fb87-08da742b1946
X-MS-TrafficTypeDiagnostic: CY4PR11MB1592:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JLkVZDiV0zwzzuTpMoj9zjaBNjV+QM9a7z0Wa2XDLGWdxRQ9nZMeZWn4hcKOtwO6NbXC4S81tGtAi+Pg+S8gEe6eKGuAzz3Aloqh/FpeQHtJDDglh7Gaeo/dhQuUblstIzEIEnUAa1Wi+vmbxfz4lwUs4O0Ox72CfRAEnbVGjovFQj8xSLpOpfpjAEmISBsLq4QAE17Ix7ez2e5fNzHu2qaxzG58I5iWcZ2wf0ZBaJdA/4bWp2GOImvhihTEA4K4zzxvy00KKs+2G/j+eZubVi8GyTiWgCBVLbORnIh5HBiCx7+N/F/GbqabPvmy47KjsvKsuoZYkLxX2seE0BtdNACEnXta2UGsBfY+fBWCozNrDsgnF4cRdkhZe1RXPRqshI8Hct0lh3+bfl/VXZDVjgWFrfN48QsmfOFliZyHq7iyQ+qpU5+LVMghoLrxCfq+ypLw92S0lBbiZcz/qg3254kYyySzpG5DXqiq25x4YXo5D2BjstJQIaQyjRo1+A061M+v87911JJEdoA30fkKY2IWL1uV+TH6NlXXCfmZkqI4jI5h6PlSjxZkh7oJ3nVk6/Zc2Mifpv+M7+oGjJA4tnZFbxck1bugrTZtqMLuNc138k8ZuCRA/PD4hhlshHC4d8O2PNAYB04E6KpJI00YVirkG2SvNbxlb20nuy0LW0/Lc8ZweKhuhmuebmZ4R9PVbjHCAc2FgeDrsjAYUzKEx6JDWbUhX0ro0NAvoIa7bnycF+BDRQNsQqEk30CV3kyYS5TS6q6mTGYuGAbypUj8SoRpF6lo5wvL66HNvms8ts+nKCVqrXqHuDYR8sqgkzjCyE5Ao34j1xxQcg+e+DgEMLwKPtKx3z/UcoBvbu0St/MYOiEhZN+9JpBp7+uBVw98
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(6666004)(41300700001)(478600001)(5660300002)(2906002)(6916009)(6486002)(316002)(8936002)(38350700002)(38100700002)(2616005)(66946007)(66556008)(66476007)(31696002)(86362001)(53546011)(52116002)(186003)(36756003)(8676002)(26005)(6512007)(31686004)(4326008)(6506007)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDlBL3o0WXpRUnB5NWY5cmpjUDNNcXN1TEdFRVZ1RXpFVjNIZWZ3dndUY0k0?=
 =?utf-8?B?WThuYnhvTEJZOS85SE40NkpWQW1nNFpDT2J2MTNEMi83TDNxc1hGeWxJMitH?=
 =?utf-8?B?c290NFMvb010TS9tblRrNlpMQStmMXh2US9hS3VVQ014OGFKZkttaGZQU2d6?=
 =?utf-8?B?NmxvcWdTZUlMazVINzFkbjFmMjdSUmlrT1I4dFNwRkRVOUNJd2ZBUjA3Ui9U?=
 =?utf-8?B?NEpkRG5PN0FodkQ4ZkNPbW1DUmkxK3dFZjAxODl6blYvZ3hNQ0FXRHpmTkdY?=
 =?utf-8?B?dysvRzJ0dzNyWFpqRHhZT3V2OWx1YWR2QmRReEpoZ01ZTjAwUUl3aDd6RUVV?=
 =?utf-8?B?NTJrOXZwT1p4d1I2QUNGUGJ3SThOdmx1K3d6NGlIbUQ2Y2NDd2JQWGNmRDVw?=
 =?utf-8?B?dFF5MXY0Ynh0SlNFcmR3R0NZbDVxT1J1aktKODMrejhhU1V3a08xbmdsbCt2?=
 =?utf-8?B?eGkrNmJ3YnFnWThscTFUclBtcWN2UURDUU5PRmovVEpuZlF3OUw2aFVOOXlT?=
 =?utf-8?B?MjlxLzBybFBwUG5xbmtnVEZhSkErdnpBVmhGTVYrRlQxeE81MjJhWDNaNXgx?=
 =?utf-8?B?eWhpRktKR0VYczBYM3JkZUxZSjZvS1g2SlNLK2pxNWtsWWtsY0RJQW96a1dQ?=
 =?utf-8?B?TjlyenhPbWllNjZMY3V6T0E0cVRTanFvSC9xR3NMWnZIMENpSmFySVFycmo3?=
 =?utf-8?B?MlNublY3aTdGQzZZN0VFWXNiY1U0U2x4NlJQcHFWUitwYzRCWnlOT0RMcloy?=
 =?utf-8?B?bnU0NFJ0WnpheFkzRmJJTE1Sd3RIeGgyRW0yUkkrKzM5aGY4Qy9tMlZsbHlY?=
 =?utf-8?B?RnZ0Q3pWS0hGb1RmSDFubDhlcFdEUkI0VEs5L0V3bDg4T3Z1UUVCTlV2WVMy?=
 =?utf-8?B?Q0RIOU54SXdudkFpVStqNXFQKzJaU3kva2xLMm5oZ1o2M2I4aUhFNFZjOTR4?=
 =?utf-8?B?ek4zZXoxRWEwaEVCQzBvcU5TNFl2Rk9pcnJNY1dOQjZNLzVqWGUrbzgvc2NH?=
 =?utf-8?B?b1Y2Titobmp5SnIyQWV6N2hwZjJqcGpucGxtaVREVS91VituMTJaSnJHZkJk?=
 =?utf-8?B?eGxpbnQwVjBvKzBITUM2S1VkUmIwSFRiODhDbDBGV3BSMzJVUVoydGZlVXNY?=
 =?utf-8?B?WDFGUmZuODRsV200SzFqU3hMMUdjU21idmxUb0dZV0k1R3JCWFM4UmdQRmJH?=
 =?utf-8?B?ekJSS3dVUUVDcE5CMkZjOXppdGdLTzhlWGV1cG91NlhFQ2JsOHl6bm5TcWVF?=
 =?utf-8?B?MDNkWXhLZ1gyZ2p3bzdiVW9YeGYxUnpwY0Zra3NqTnNnZ1R3aUVNaXF0U3E1?=
 =?utf-8?B?SFZNRlcrbFVxWlBEZ244dFQxM2N1K3NwVjR5dU5DY0VQeU05ZzNQdkhYM0pE?=
 =?utf-8?B?amxxQlZJcGRYSUlDWWNvRGZnRzNJVlJtN3BaVDhPcVlEeTBBakE4Y0VIZllP?=
 =?utf-8?B?Wlk4OWo0WDd0VmNhN3ZtQU4wRDErNGlENTF2U2F6YlJ3d0Q0cjg4TEZsOEtx?=
 =?utf-8?B?VExsakxPTjZaeFpMZGNuc0FxOGV1UzBVcGQ0djVKRTdvUVVuR2ZhTEVPNFI3?=
 =?utf-8?B?M0dqdWdKSnVVVU5MRW90ZUVaS05GVHFicFdFajlpR2tqaDhPeVRzMmo1Tno4?=
 =?utf-8?B?MVpMUXFuWmxzeENmYm1OTHNjREJaWloxV0VTbldzTHdlSnVGeUhUYTZzNDFz?=
 =?utf-8?B?ckNrU2Qzd2tWa0V5T2dOd3RCdlJDcUp0VzBkOWRtdG1BR0tBQnM5VndjNkRE?=
 =?utf-8?B?eVB0cDJBNENvcm9QWGNxb21mNnZ4MDhueXdiWExuNjNPOGQ5dTNQUGgxT3pS?=
 =?utf-8?B?OW9jNnd5b3JBMi9zWHF1TUhXOFJPTCtXZDF1dUduc0VPcXZlWjV2YW55bG12?=
 =?utf-8?B?RGlxb0I4UFo3cXd4eHlOSWxoWDFyc3dodkdvcG90aDVtT0RsbUJmdjM1bGN1?=
 =?utf-8?B?S0dpb0xKWENpUGFaeXF4bkNSSjZCSEdObEQ3aUpOUVpkYko1eldzdVQvcnhE?=
 =?utf-8?B?aUZndWpGK3hMZ2IzdytoWTZFYjNQekxwWXliTTBRRy9ualJCSjdrWXZuY0xm?=
 =?utf-8?B?MERUVm5tdk1tR0szTVNZbDFXN29NemdENk5PdFJOZC9mb3JDRERhMWZoYUdm?=
 =?utf-8?Q?JJpNjNFYMOU97brH+jRDb3hLS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fac71813-4f8b-4b96-fb87-08da742b1946
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 02:02:48.6594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Y/eQP1CKchSsTPLDmbkuAJCHDWhfKoCiwjVAV5p7LlqJhD5zNGgwdxEQkvOtJD/qoLg7FVnjU+IQpoKzyhotLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1592
X-Proofpoint-GUID: RrkqUCepwtxwF6WQLHCbtwFKMtQOXUjz
X-Proofpoint-ORIG-GUID: y2hHjnvKeH1nAtMjHjbrxRLHIrRmwoiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_12,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=973
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208020008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 02:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168763



On 8/1/22 21:04, Luca Ceresoli wrote:
> Hello He,
>
> On Mon,  1 Aug 2022 16:51:36 +0800
> "He Zhe" <zhe.he@windriver.com> wrote:
>
>> Backport from upstream d8254360c7f2ff9b3f945e9668d89c0b56b9bd91
>> ("fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)")
>>
>> tmp-glibc/work/qemuarm-wrs-linux-gnueabi/lttng-modules/2.13.3-r0/
>> lttng-modules-2.13.3/src/probes/../../include/lttng/
>> tracepoint-event-impl.h:133:6:
>> error: conflicting types for 'trace_kfree_skb'; have 'void(struct sk_buff *, void *)'
>>   133 | void trace_##_name(_proto);
>>       |      ^~~~~~
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch | 51 +++++++++++++++++++
>>  .../lttng/lttng-modules_2.13.4.bb             |  1 +
>>  2 files changed, 52 insertions(+)
>>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
>> new file mode 100644
>> index 0000000000..0140c4b989
>> --- /dev/null
>> +++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
>> @@ -0,0 +1,51 @@
>> +From d8254360c7f2ff9b3f945e9668d89c0b56b9bd91 Mon Sep 17 00:00:00 2001
>> +From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>> +Date: Fri, 29 Jul 2022 15:37:43 -0400
>> +Subject: [PATCH] fix: net: skb: introduce kfree_skb_reason() (v5.15.58..v5.16)
>> +
>> +See upstream commit :
>> +
>> +  commit c504e5c2f9648a1e5c2be01e8c3f59d394192bd3
>> +  Author: Menglong Dong <imagedong@tencent.com>
>> +  Date:   Sun Jan 9 14:36:26 2022 +0800
>> +
>> +    net: skb: introduce kfree_skb_reason()
>> +
>> +    Introduce the interface kfree_skb_reason(), which is able to pass
>> +    the reason why the skb is dropped to 'kfree_skb' tracepoint.
>> +
>> +    Add the 'reason' field to 'trace_kfree_skb', therefor user can get
>> +    more detail information about abnormal skb with 'drop_monitor' or
>> +    eBPF.
>> +
>> +    All drop reasons are defined in the enum 'skb_drop_reason', and
>> +    they will be print as string in 'kfree_skb' tracepoint in format
>> +    of 'reason: XXX'.
>> +
>> +    ( Maybe the reasons should be defined in a uapi header file, so that
>> +    user space can use them? )
>> +
>> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>> +Change-Id: Ib3c039207739dad10f097cf76474e0822e351273
> Missing Upstream-status tag here.

Thanks. resent.

Zhe

>


