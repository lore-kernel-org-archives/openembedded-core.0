Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9473DC07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 01:13:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5889.1664241218584049042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 18:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=Got4Gd9P;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6269537461=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28R0sjm9005002
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 18:13:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=3aKiFwkgn/TJgb9KBrEUQXahC9KF+wdiW+0QH+lw6bM=;
 b=Got4Gd9Pp7BIyNEamluWpUt3XoGkEkfuaNT7NtAaQFyeFf8stLM8HJlBAMjeu+dzHzjV
 +YKCSl+yL+tSaaS0S3Wc+lasSXk0sfksH04O/CQGT/fIEed7YMiAQEX6prr7SgvsvGXS
 Uh0zZz4zTzaeZuObYbK5bhr8M/7ApVndtbaEa+0wQopYyRlcd+A7EiiBUMgv7Q+OsNvT
 TPns2KBbfe3fYut8KoEitVJPI9ql61MptF9oZgaNu/YUZfInNXcaDEMvLG2e9pX8/1fL
 VBYAKI0AKYVTqyGyoHvnIBERh4Acw41MGmlwwpJMqP/7IG1lNXcqBMeMG5NsqOXhfW/u Ug==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsw65hy1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 18:13:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTEGmR90GdZ9Axgn/h+LC8Gyk3Qanbbm02rlnL4k0/pYUDu0XaSVKjq0tKohwCzgHG11v/qiY3U5tbVkqj+LmJOjNCncTJI/SUmmW8TBEsudFHrKqtsCarEr0KIN3HP+7iOc4ej17THpPMutZmK/twZK3WdoIdY6GSabgXgzaFEuMxEjsIZg/eG0PxW7g+vhzR5xIC9/bmSe4abo4n+HBfMJsgN/kHOj/PAtq+uKHw3tXTu//suU6WG0DOiGeHiMhDC9p1HLeHgtEFqiEVEoAsZ8s+xe4659hXJ+ber7F9tJqCCAWuJ4MI/wvQl0xcgcdRtQWgouH38upLKEZXsfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aKiFwkgn/TJgb9KBrEUQXahC9KF+wdiW+0QH+lw6bM=;
 b=cKHVpYGWTVLgY0PZuLnFEDchxd+BURTf+kaIC7NkPWv4p7+BXANYZqxRzG+YJzBD9m8ipsR/ufbn4a3wvwxQ848Zhm/Nv0fET9hKAfsuc5vfCmcKHYNGyLXVJRmiKKxsiZZKpoiGRWk/aguw9oXYLTiSVZa1yYJVmrWKu84B2X9HdkAA8G9HVO8mTTFQo2aISCoD7T9lVKz0YWCBzN7M4CHHRY7vrvSReF3DZh2iHehtt070AXUYg4JCkc7Weigc5PVB4E3WvsrCsTftOxgbMDbtRZFJ50NU9Lhe54RMTNJTick0SAvstI7Cd1XTh2JMlh+R0Xc7QsY7TQxHCO+ZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 01:13:32 +0000
Received: from IA1PR11MB6218.namprd11.prod.outlook.com
 ([fe80::31e2:9f90:e4ad:3370]) by IA1PR11MB6218.namprd11.prod.outlook.com
 ([fe80::31e2:9f90:e4ad:3370%9]) with mapi id 15.20.5588.018; Tue, 27 Sep 2022
 01:13:32 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH] babeltrace: Handle negative time and offset from
 Epoch
Date: Tue, 27 Sep 2022 09:13:15 +0800
Message-Id: <20220927011315.20729-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:3:17::18) To IA1PR11MB6218.namprd11.prod.outlook.com
 (2603:10b6:208:3ea::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34867f6b-2f82-4e91-0a92-08daa0257e4b
X-MS-TrafficTypeDiagnostic: MW3PR11MB4715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fhBnqwPjftvPMuBtLbbGZt9HvRDT0odzEr8hPNTrCD4cE/vQfYqMbXVqI4VM8bzYxG/0mmkMPJ/u5ngYxqm8kPxg9Xm3ObFrYR6I9ym2Ub66+FWciaKFqV3n2juFlcnx8qTY+aadX+Fl7AvDTloJbEgH2ah4yM9oUkFKoU12Nioo6LUZOiEsS/TUIWrmisQBPhULVHncC+2xQ51LmbAQ3XVIHdm4aP/ocYLgrMyYV4c24tqt/eNF9b8dIT9K5ubTZLMhAWlk0Jzz1HO7L5zyRQ39taN+FkCInc8JuaRE6JKT61u0rMFnrLGAXeLf5I/DKAfgT/2Wk1du3slIOiFaRiodkN0wo7yz/0qoELoPOkzs5PNEhKjX7zYadhklmZHbLYLDEZ5VdFEFXqgue5/q/8a4qsrB1CEL6tJZDqCPKag87Ab3ZCGohOimAn0OASbAsR1p+YuWndhMuo7QnFtrAfLSWDyF6wI57k4gYKh/hNQQth3XJuGbuajfDdnybBMdOGqPzXX4avnIL29vvCzWk7PQ0IQewHCGzS4khP6QFiv9UEzzictzLJa0O32RWyH1s7846UYBgka5iHO8nR/oEzQatcRl1Rm5Qgbzq3ME7tFUHsMEP9EdXbmSxCQQxiRyUenRQVOS/YF1LuuVvu31GwBuTuFUC1uQP9X87KRceJ3Es5t+lle1C+5LN30JESGzu9WoogMCrsGZZn7MmffqgsR9gYqqXBiDxpAHgRw7498H2AkPBXgHccDaIlsPzUOo60uAVVVrnzHWFI6n+Og5Nlb3CG/FndpRhFEaMr/zrqE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6218.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39850400004)(366004)(451199015)(2906002)(1076003)(186003)(66574015)(83380400001)(2616005)(38350700002)(38100700002)(36756003)(86362001)(66556008)(66476007)(66946007)(316002)(8676002)(478600001)(6916009)(6486002)(966005)(52116002)(44832011)(30864003)(6512007)(26005)(8936002)(5660300002)(6666004)(6506007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUl2T0xuRHpxa1VzTHc2aSt4TVY3SFp1bGM3dnhUYjEvYk9NK0NUU01WQU41?=
 =?utf-8?B?UmoyZmhPNTNlYlpTZ01KTnc3Njl1K1MyaHpMTmtPQ2dMVFRBQWlGM0hZd2Vv?=
 =?utf-8?B?cm1pY3diMmNZSkZRSjdOclFRZVJhNTRULzIyY0t3RUpwVEFFNlJNZ1cvaUtW?=
 =?utf-8?B?cmlQWW03cHg0MCs5OFZoWEhTVU1xUjhKTGREdDFsZVQzK2MxVVBUZlM4Umtx?=
 =?utf-8?B?d2lVOEhaSWE1RTEvZHhKemlaYWlRL1dDc3hCd0NuRXgySWZUclEvL0N4dmh5?=
 =?utf-8?B?WXRqWnphbEpJTW1XLytYM051ZmdrcU9pTnF5NnBjcDlvMVMwQjJsM3J4M1hP?=
 =?utf-8?B?ZGExeVlWWXo5SzFDcGNqN0N3bjBZS1RoZFVORVhxYW5iZ1VKT3dKMFpWbVZJ?=
 =?utf-8?B?VXhWMEg0aXV2K0pubGhvN2VVZVY0OEhBSWlIL2dpdVZ1MDlxZ0VGenNaaVdP?=
 =?utf-8?B?V01sK0t5aDNKNkJ4NlpIRTg5SVk0Vm9nRGxoVXl4QnNqaENQNEZ5T1RHZHpN?=
 =?utf-8?B?Y1Z0VkpWV01EbnNSeDJXeTlxWTRjaEFtaTIxaTN0NWVtRnJUS3JBK0tHVzh1?=
 =?utf-8?B?dlNIRmtsclpGSmF0V1ozZ2JOOEdMdTFtOG1vREljbHJuVHBxWVIxRTIya09v?=
 =?utf-8?B?ZUExVkZIa2NvMDRLcEpHNEV4OGp3WlY2WGpWSVNLZ1BNV0V5MkpvVW1kZExE?=
 =?utf-8?B?UkFaY1ZOMk9icGtsS2dPMytISkcxYTlpVTFDbWthb014R1o2WmpaZHB4dUI5?=
 =?utf-8?B?WVprOC9FZmJ2OXpQeks3OXVHaU9OcCtrZE81MnRWS09vTkZLSDc2cS85Mk8w?=
 =?utf-8?B?VzltSGJGT0g4aE00aW5ESDE3UFpneHg1VlpWVHg0aSt6enM3RWUrcUl4a1U1?=
 =?utf-8?B?WjFLQXp1N21NUERLc1l6OW5XNXBMUTBiZzJuMG1uVUVBWlRHcWsweGljL21m?=
 =?utf-8?B?MWV5MTk4NW1KWDdkUFZvZEoyZGRVRElqTEhaaHYvTEtSWVhqVWRYVVFmL0tt?=
 =?utf-8?B?MnBYTStjc0JUM2ZjZnQwWm5DLy9rdVVJbnRBUUtqaWZ6a0dvVGkrSmJzNWcy?=
 =?utf-8?B?QUowRVgxYk0rZVAxeHQ3ZzJKOHgzWmcybmEwR245bWxXQXNyanBrcVMvOURu?=
 =?utf-8?B?V1p3VENhczhuMGlYT1lCWkUxWEQ3ZlNWelgyNUtXRENOUjlEa2ZaV052ektm?=
 =?utf-8?B?UStmS1BteEVwNUgwbHIva3pOOGo4RGVWTFVVRE03aWxzR3RtTTlNRXc2ZlMz?=
 =?utf-8?B?cEdHTCt0clBtbkNhd0J3WnAvdjlnRFA2bVhDQU44TDI5ejY3OStQN29GNnhl?=
 =?utf-8?B?ZTErUko5a0RFaG1NS3AwbnpONHNra1p1QSs1ZGtaZ25raW5YdmtmaUo4UW5Y?=
 =?utf-8?B?b29ISFQySmRPQTVWbjltUUVMcDZzSzNOQlNQdnBpM2FnV2V0Mno4V3dpa0lF?=
 =?utf-8?B?OXc5MDE0N2JIV0tmcEh3YlpEQnZDNG1TYWtsOENUQVBid3hSOU1wem00OWFt?=
 =?utf-8?B?VFQ1ZEFnUzVJQkdTVkVPaFdJRWxGZVMwWjVQSG56U21PZ1BxVVBjbUlvRG9n?=
 =?utf-8?B?TGhPWlpHdTFjdDJkWmtFRG1VWVA4ZTFaSUxxd083N25pRURqSnRySnF4eHRh?=
 =?utf-8?B?YXlTYnZuRk9tNTh4cTBRdjBjOE1vVnpJajhyMnRDRG1wcjJjeXBINGFaaE5k?=
 =?utf-8?B?b2lZeHNJdFlnNXZ0dldZT1Z2OTVLNUJQWDJNSy9MTWtPVDIvSFVJWXh5VlJn?=
 =?utf-8?B?MFh3ZVc0M245RWpRVVVTdGR5b1hicmE0bTE1NWJsbGUyQ2puQU85R0JjcTRQ?=
 =?utf-8?B?T1BTdHY5SWFLZFVxR0FDUHUxNWVOSXQrelVzMDZ4NEl5bnR4d0w4OU5wRW5H?=
 =?utf-8?B?ZVZ2QXZwL0JtdGhKSEppMjZtMWhkanVrdlRONms5NXQvTHlkanRONGlNM25n?=
 =?utf-8?B?RUh1QTdCdTdWQlhLaWlGYTFmdTBJaEo4aVhGemVOZWQwS01PcG9zUXVPSCt4?=
 =?utf-8?B?c05CWVgvQ0FEKzdxbGNoNU8wTllnV2pjU0ZuTGNXT1FrSHhQK0N4eFh0WVE3?=
 =?utf-8?B?VEFaRkY0Mkk5OVJyaDljc0Rya0RxdC81ZXdJMEtUTXVLZVQ2SkE2U1JwQ1NG?=
 =?utf-8?B?UjFEL0dtazkvdDJzYVU4M2k3eFJjTHZZbjRKMEZpVzhHWDhoeXRnMnF6dUs0?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34867f6b-2f82-4e91-0a92-08daa0257e4b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6218.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 01:13:32.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P708XB52jLoN7x6v9tVSRPu8J3b53s660VzAV/LyDdGcVJ8qxPBYHW71lpJPmWvyETMZ3al3BBtxxhYOVEXOL/zw5XDwGkg0RY5x1hn7j5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
X-Proofpoint-GUID: gimfxqM24VNAjOLY5R6ztD5lg12OfwQL
X-Proofpoint-ORIG-GUID: gimfxqM24VNAjOLY5R6ztD5lg12OfwQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_11,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209270006
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28R0sjm9005002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 01:13:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171079

Backport patch from upstream to handle negative time and offset from Epoc=
h[1]
and fix the yocto autobuilder ptest failures for both qemux86-64 and qemu=
arm64 when
applied this backport patch[2].

[1] 0001-Handle-negative-time-and-offset-from-Epoch.patch backport from
https://git.efficios.com/?p=3Dbabeltrace.git;a=3Dcommit;h=3D61cf588beae75=
2e5ddfc60b6b5310f769ac9e852

[2] 0002-babeltrace-fix-bug-in-stream-intersection-option.patch
The failures reported at https://lists.openembedded.org/g/openembedded-co=
re/topic/89657972#163126

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...-negative-time-and-offset-from-Epoch.patch | 857 ++++++++++++++++++
 ...ix-bug-in-stream-intersection-option.patch | 114 +++
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb |   2 +
 3 files changed, 973 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Handle-nega=
tive-time-and-offset-from-Epoch.patch
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/0002-babeltrace-=
fix-bug-in-stream-intersection-option.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace/0001-Handle-negative-ti=
me-and-offset-from-Epoch.patch b/meta/recipes-kernel/lttng/babeltrace/000=
1-Handle-negative-time-and-offset-from-Epoch.patch
new file mode 100644
index 0000000000..c7409bcfbb
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace/0001-Handle-negative-time-and-=
offset-from-Epoch.patch
@@ -0,0 +1,857 @@
+From a8305ca6fc9b32b22bedbc96a8f71b14243e9965 Mon Sep 17 00:00:00 2001
+From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Date: Wed, 22 Apr 2020 03:00:02 +0000
+Subject: [PATCH 1/2] Handle negative time and offset from Epoch
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Handle cases where a trace have a negative offset from Epoch.
+If Epoch is arbitrary (e.g. embedded system starting at 0, without any
+network access), the "0" can be used as correlation point between
+various components, and some components could start before the
+correlation point. Therefore, especially in traces where the time is
+meant to be shown in nanoseconds or cycles from the correlation point,
+it also makes sense to have a negative time value.
+
+It introduces API-breaking changes in the C and Python APIs, since we
+need to be able to return negative time values, which were previously
+used as errors (-1ULL).
+
+The --offset and --offset-ns command line parameters can now take
+negative offset (seconds and nanoseconds) values too.
+
+The [sec.ns] format is used as fallback so we don't attempt to pass
+a negative time value to POSIX time-formatting APIs.
+
+This also fixes an inaccurate return value in an error path of
+bt_ctf_event_populate_event_header().
+
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.c=
om>
+
+Upstream-Status: Backport [https://git.efficios.com/?p=3Dbabeltrace.git;=
a=3Dcommit;h=3D61cf588beae752e5ddfc60b6b5310f769ac9e852]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ converter/babeltrace.c                        |   4 +-
+ formats/ctf-text/ctf-text.c                   |   2 +-
+ formats/ctf/ctf.c                             | 115 +++++++++++++-----
+ formats/ctf/events-private.h                  |  10 +-
+ formats/ctf/events.c                          |  11 +-
+ .../metadata/ctf-visitor-generate-io-struct.c |   1 -
+ include/babeltrace/babeltrace-internal.h      |   8 +-
+ include/babeltrace/clock-internal.h           |   2 +-
+ include/babeltrace/ctf-ir/clock-internal.h    |   2 +-
+ include/babeltrace/ctf/events.h               |   8 +-
+ include/babeltrace/ctf/types.h                |   6 +-
+ include/babeltrace/format.h                   |  10 +-
+ include/babeltrace/trace-handle-internal.h    |   8 +-
+ include/babeltrace/trace-handle.h             |  25 ++--
+ lib/context.c                                 |  44 +++++--
+ lib/trace-handle.c                            |  39 +++---
+ tests/lib/test_ctf_writer.c                   |   6 +-
+ tests/lib/test_seek.c                         |  28 ++---
+ 18 files changed, 209 insertions(+), 120 deletions(-)
+
+diff --git a/converter/babeltrace.c b/converter/babeltrace.c
+index ef783ed4..2ac16179 100644
+--- a/converter/babeltrace.c
++++ b/converter/babeltrace.c
+@@ -375,7 +375,7 @@ static int parse_options(int argc, char **argv)
+ 				goto end;
+ 			}
+ 			errno =3D 0;
+-			opt_clock_offset =3D strtoull(str, &endptr, 0);
++			opt_clock_offset =3D strtoll(str, &endptr, 0);
+ 			if (*endptr !=3D '\0' || str =3D=3D endptr || errno !=3D 0) {
+ 				fprintf(stderr, "[error] Incorrect --clock-offset argument: %s\n", =
str);
+ 				ret =3D -EINVAL;
+@@ -400,7 +400,7 @@ static int parse_options(int argc, char **argv)
+ 				goto end;
+ 			}
+ 			errno =3D 0;
+-			opt_clock_offset_ns =3D strtoull(str, &endptr, 0);
++			opt_clock_offset_ns =3D strtoll(str, &endptr, 0);
+ 			if (*endptr !=3D '\0' || str =3D=3D endptr || errno !=3D 0) {
+ 				fprintf(stderr, "[error] Incorrect --clock-offset-ns argument: %s\n=
", str);
+ 				ret =3D -EINVAL;
+diff --git a/formats/ctf-text/ctf-text.c b/formats/ctf-text/ctf-text.c
+index 16f156de..e001a548 100644
+--- a/formats/ctf-text/ctf-text.c
++++ b/formats/ctf-text/ctf-text.c
+@@ -43,7 +43,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+=20
+-#define NSEC_PER_SEC 1000000000ULL
++#define NSEC_PER_SEC 1000000000LL
+=20
+ int opt_all_field_names,
+ 	opt_scope_field_names,
+diff --git a/formats/ctf/ctf.c b/formats/ctf/ctf.c
+index 1ba9017f..3c774188 100644
+--- a/formats/ctf/ctf.c
++++ b/formats/ctf/ctf.c
+@@ -70,7 +70,7 @@
+  */
+ #define WRITE_PACKET_LEN	(getpagesize() * 8 * CHAR_BIT)
+=20
+-#define NSEC_PER_SEC 1000000000ULL
++#define NSEC_PER_SEC 1000000000LL
+=20
+ #define INDEX_PATH "./index/%s.idx"
+=20
+@@ -79,8 +79,8 @@ int opt_clock_cycles,
+ 	opt_clock_date,
+ 	opt_clock_gmt;
+=20
+-uint64_t opt_clock_offset;
+-uint64_t opt_clock_offset_ns;
++int64_t opt_clock_offset;
++int64_t opt_clock_offset_ns;
+=20
+ extern int yydebug;
+ char *opt_debug_info_dir;
+@@ -114,11 +114,13 @@ void ctf_set_handle(struct bt_trace_descriptor *de=
scriptor,
+ static
+ int ctf_close_trace(struct bt_trace_descriptor *descriptor);
+ static
+-uint64_t ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
+-		struct bt_trace_handle *handle, enum bt_clock_type type);
++int ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
++		struct bt_trace_handle *handle, enum bt_clock_type type,=20
++		int64_t *timestamp);
+ static
+-uint64_t ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
+-		struct bt_trace_handle *handle, enum bt_clock_type type);
++int ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
++		struct bt_trace_handle *handle, enum bt_clock_type type,
++		int64_t *timestamp);
+ static
+ int ctf_convert_index_timestamp(struct bt_trace_descriptor *tdp);
+=20
+@@ -167,17 +169,20 @@ void bt_ctf_hook(void)
+ }
+=20
+ static
+-uint64_t ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
+-		struct bt_trace_handle *handle, enum bt_clock_type type)
++int ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
++		struct bt_trace_handle *handle, enum bt_clock_type type,
++		int64_t *timestamp)
+ {
+ 	struct ctf_trace *tin;
+-	uint64_t begin =3D ULLONG_MAX;
+-	int i, j;
++	int64_t begin =3D LLONG_MAX;
++	int i, j, ret;
+=20
+ 	tin =3D container_of(descriptor, struct ctf_trace, parent);
+=20
+-	if (!tin)
++	if (!tin || !timestamp) {
++        	ret =3D -EINVAL;
+ 		goto error;
++        }
+=20
+ 	/* for each stream_class */
+ 	for (i =3D 0; i < tin->streams->len; i++) {
+@@ -198,8 +203,10 @@ uint64_t ctf_timestamp_begin(struct bt_trace_descri=
ptor *descriptor,
+ 					parent);
+ 			stream_pos =3D &cfs->pos;
+=20
+-			if (!stream_pos->packet_index)
++			if (!stream_pos->packet_index) {
++				ret =3D -EINVAL;
+ 				goto error;
++			}
+=20
+ 			if (stream_pos->packet_index->len <=3D 0)
+ 				continue;
+@@ -214,29 +221,38 @@ uint64_t ctf_timestamp_begin(struct bt_trace_descr=
iptor *descriptor,
+ 				if (index->ts_cycles.timestamp_begin < begin)
+ 					begin =3D index->ts_cycles.timestamp_begin;
+ 			} else {
++				ret =3D -EINVAL;
+ 				goto error;
+ 			}
+ 		}
+ 	}
+=20
+-	return begin;
++        if (begin =3D=3D LLONG_MAX) {
++                ret =3D -ENOENT;
++                goto error;
++        }
++        *timestamp =3D begin;
++        return 0;
+=20
+ error:
+-	return -1ULL;
++	return ret;
+ }
+=20
+ static
+-uint64_t ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
+-		struct bt_trace_handle *handle, enum bt_clock_type type)
++int ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
++		struct bt_trace_handle *handle, enum bt_clock_type type,
++		int64_t *timestamp)
+ {
+ 	struct ctf_trace *tin;
+-	uint64_t end =3D 0;
+-	int i, j;
++	int64_t end =3D LLONG_MIN;
++	int i, j, ret;
+=20
+ 	tin =3D container_of(descriptor, struct ctf_trace, parent);
+=20
+-	if (!tin)
++        if (!tin || !timestamp) {
++                ret =3D -EINVAL;
+ 		goto error;
++	}
+=20
+ 	/* for each stream_class */
+ 	for (i =3D 0; i < tin->streams->len; i++) {
+@@ -257,8 +273,10 @@ uint64_t ctf_timestamp_end(struct bt_trace_descript=
or *descriptor,
+ 					parent);
+ 			stream_pos =3D &cfs->pos;
+=20
+-			if (!stream_pos->packet_index)
++			if (!stream_pos->packet_index) {
++				ret =3D -EINVAL;
+ 				goto error;
++			}
+=20
+ 			if (stream_pos->packet_index->len <=3D 0)
+ 				continue;
+@@ -273,15 +291,21 @@ uint64_t ctf_timestamp_end(struct bt_trace_descrip=
tor *descriptor,
+ 				if (index->ts_cycles.timestamp_end > end)
+ 					end =3D index->ts_cycles.timestamp_end;
+ 			} else {
++				ret =3D -EINVAL;
+ 				goto error;
+ 			}
+ 		}
+ 	}
+=20
+-	return end;
++        if (end =3D=3D LLONG_MIN) {
++                ret =3D -ENOENT;
++                goto error;
++        }
++        *timestamp =3D end;
++        return 0;
+=20
+ error:
+-	return -1ULL;
++	return ret;
+ }
+=20
+ /*
+@@ -328,7 +352,9 @@ void ctf_print_timestamp_real(FILE *fp,
+ 			struct ctf_stream_definition *stream,
+ 			uint64_t timestamp)
+ {
+-	uint64_t ts_sec =3D 0, ts_nsec;
++        int64_t ts_sec =3D 0, ts_nsec;
++        uint64_t ts_sec_abs, ts_nsec_abs;
++        bool is_negative;
+=20
+ 	ts_nsec =3D timestamp;
+=20
+@@ -341,9 +367,40 @@ void ctf_print_timestamp_real(FILE *fp,
+ 	ts_sec +=3D ts_nsec / NSEC_PER_SEC;
+ 	ts_nsec =3D ts_nsec % NSEC_PER_SEC;
+=20
++        if (ts_sec >=3D 0 && ts_nsec >=3D 0) {
++                is_negative =3D false;
++                ts_sec_abs =3D ts_sec;
++                ts_nsec_abs =3D ts_nsec;
++        } else if (ts_sec > 0 && ts_nsec < 0) {
++                is_negative =3D false;
++                ts_sec_abs =3D ts_sec - 1;
++                ts_nsec_abs =3D NSEC_PER_SEC + ts_nsec;
++        } else if (ts_sec =3D=3D 0 && ts_nsec < 0) {
++                is_negative =3D true;
++                ts_sec_abs =3D ts_sec;
++                ts_nsec_abs =3D -ts_nsec;
++        } else if (ts_sec < 0 && ts_nsec > 0) {
++                is_negative =3D true;
++                ts_sec_abs =3D -(ts_sec + 1);
++                ts_nsec_abs =3D NSEC_PER_SEC - ts_nsec;
++        } else if (ts_sec < 0 && ts_nsec =3D=3D 0) {
++                is_negative =3D true;
++                ts_sec_abs =3D -ts_sec;
++                ts_nsec_abs =3D ts_nsec;
++        } else {        /* (ts_sec < 0 && ts_nsec < 0) */
++                is_negative =3D true;
++                ts_sec_abs =3D -ts_sec;
++                ts_nsec_abs =3D -ts_nsec;
++        }
++
+ 	if (!opt_clock_seconds) {
+ 		struct tm tm;
+-		time_t time_s =3D (time_t) ts_sec;
++		time_t time_s =3D (time_t) ts_sec_abs;
++
++                if (is_negative) {
++                        fprintf(stderr, "[warning] Fallback to [sec.ns]=
 for printing negative time value. Use --clock-seconds.\n");
++                        goto seconds;
++                }=09
+=20
+ 		if (!opt_clock_gmt) {
+ 			struct tm *res;
+@@ -377,12 +434,12 @@ void ctf_print_timestamp_real(FILE *fp,
+ 		}
+ 		/* Print time in HH:MM:SS.ns */
+ 		fprintf(fp, "%02d:%02d:%02d.%09" PRIu64,
+-			tm.tm_hour, tm.tm_min, tm.tm_sec, ts_nsec);
++			tm.tm_hour, tm.tm_min, tm.tm_sec, ts_nsec_abs);
+ 		goto end;
+ 	}
+ seconds:
+-	fprintf(fp, "%3" PRIu64 ".%09" PRIu64,
+-		ts_sec, ts_nsec);
++        fprintf(fp, "%s%" PRId64 ".%09" PRIu64,
++                is_negative ? "-" : "", ts_sec_abs, ts_nsec_abs);
+=20
+ end:
+ 	return;
+@@ -401,7 +458,7 @@ void ctf_print_timestamp_cycles(FILE *fp,
+=20
+ void ctf_print_timestamp(FILE *fp,
+ 		struct ctf_stream_definition *stream,
+-		uint64_t timestamp)
++		int64_t timestamp)
+ {
+ 	if (opt_clock_cycles) {
+ 		ctf_print_timestamp_cycles(fp, stream, timestamp);
+diff --git a/formats/ctf/events-private.h b/formats/ctf/events-private.h
+index 9bea75d4..c47fd7d8 100644
+--- a/formats/ctf/events-private.h
++++ b/formats/ctf/events-private.h
+@@ -35,20 +35,20 @@
+ #include <babeltrace/clock-internal.h>
+=20
+ static inline
+-uint64_t ctf_get_real_timestamp(struct ctf_stream_definition *stream,
+-			uint64_t timestamp)
++int64_t ctf_get_real_timestamp(struct ctf_stream_definition *stream,
++			uint64_t ts_cycles)
+ {
+-	uint64_t ts_nsec;
++	int64_t ts_nsec;
+ 	struct ctf_trace *trace =3D stream->stream_class->trace;
+ 	struct trace_collection *tc =3D trace->parent.collection;
+-	uint64_t tc_offset;
++	int64_t tc_offset;
+=20
+ 	if (tc->clock_use_offset_avg)
+ 		tc_offset =3D tc->single_clock_offset_avg;
+ 	else
+ 		tc_offset =3D clock_offset_ns(trace->parent.single_clock);
+=20
+-	ts_nsec =3D clock_cycles_to_ns(stream->current_clock, timestamp);
++	ts_nsec =3D clock_cycles_to_ns(stream->current_clock, ts_cycles);
+ 	ts_nsec +=3D tc_offset;	/* Add offset */
+ 	return ts_nsec;
+ }
+diff --git a/formats/ctf/events.c b/formats/ctf/events.c
+index bd195b93..c5aefd82 100644
+--- a/formats/ctf/events.c
++++ b/formats/ctf/events.c
+@@ -315,18 +315,19 @@ int bt_ctf_event_get_handle_id(const struct bt_ctf=
_event *ctf_event)
+ 	return ret;
+ }
+=20
+-uint64_t bt_ctf_get_timestamp(const struct bt_ctf_event *ctf_event)
++int bt_ctf_get_timestamp(const struct bt_ctf_event *ctf_event, int64_t =
*timestamp)
+ {
+ 	const struct ctf_event_definition *event;
+=20
+-	if (!ctf_event)
+-		return -1ULL;
++	if (!ctf_event || !timestamp)
++		return -1;
+=20
+ 	event =3D ctf_event->parent;
+ 	if (event && event->stream->has_timestamp)
+-		return event->stream->real_timestamp;
++		*timestamp =3D event->stream->real_timestamp;
+ 	else
+-		return -1ULL;
++		return -1;
++	return 0;
+ }
+=20
+ uint64_t bt_ctf_get_cycles(const struct bt_ctf_event *ctf_event)
+diff --git a/formats/ctf/metadata/ctf-visitor-generate-io-struct.c b/for=
mats/ctf/metadata/ctf-visitor-generate-io-struct.c
+index 8d348d66..dd8374fc 100644
+--- a/formats/ctf/metadata/ctf-visitor-generate-io-struct.c
++++ b/formats/ctf/metadata/ctf-visitor-generate-io-struct.c
+@@ -219,7 +219,6 @@ int get_unary_signed(struct bt_list_head *head, int6=
4_t *value)
+=20
+ 	bt_list_for_each_entry(node, head, siblings) {
+ 		if (node->type !=3D NODE_UNARY_EXPRESSION
+-				|| node->u.unary_expression.type !=3D UNARY_UNSIGNED_CONSTANT
+ 				|| (node->u.unary_expression.type !=3D UNARY_UNSIGNED_CONSTANT && n=
ode->u.unary_expression.type !=3D UNARY_SIGNED_CONSTANT)
+ 				|| node->u.unary_expression.link !=3D UNARY_LINK_UNKNOWN
+ 				|| i !=3D 0)
+diff --git a/include/babeltrace/babeltrace-internal.h b/include/babeltra=
ce/babeltrace-internal.h
+index 6f8e2006..3e137e4c 100644
+--- a/include/babeltrace/babeltrace-internal.h
++++ b/include/babeltrace/babeltrace-internal.h
+@@ -178,8 +178,8 @@ struct trace_collection {
+ 	GPtrArray *array;	/* struct bt_trace_descriptor */
+ 	GHashTable *clocks;	/* struct ctf_clock */
+=20
+-	uint64_t single_clock_offset_avg;
+-	uint64_t offset_first;
++	int64_t single_clock_offset_avg;
++	int64_t offset_first;
+ 	int64_t delta_offset_first_sum;
+ 	int offset_nr;
+ 	int clock_use_offset_avg;
+@@ -208,8 +208,8 @@ extern int opt_all_field_names,
+ 	opt_clock_force_correlate,
+ 	opt_debug_info_full_path;
+=20
+-extern uint64_t opt_clock_offset;
+-extern uint64_t opt_clock_offset_ns;
++extern int64_t opt_clock_offset;
++extern int64_t opt_clock_offset_ns;
+ extern int babeltrace_ctf_console_output;
+ extern char *opt_debug_info_dir;
+ extern char *opt_debug_info_target_prefix;
+diff --git a/include/babeltrace/clock-internal.h b/include/babeltrace/cl=
ock-internal.h
+index cd6bdbae..86954b78 100644
+--- a/include/babeltrace/clock-internal.h
++++ b/include/babeltrace/clock-internal.h
+@@ -49,7 +49,7 @@ uint64_t clock_cycles_to_ns(struct ctf_clock *clock, u=
int64_t cycles)
+  * mantissa.
+  */
+ static inline
+-uint64_t clock_offset_ns(struct ctf_clock *clock)
++int64_t clock_offset_ns(struct ctf_clock *clock)
+ {
+ 	return clock->offset_s * 1000000000ULL
+ 			+ clock_cycles_to_ns(clock, clock->offset);
+diff --git a/include/babeltrace/ctf-ir/clock-internal.h b/include/babelt=
race/ctf-ir/clock-internal.h
+index 75677707..f1e896b6 100644
+--- a/include/babeltrace/ctf-ir/clock-internal.h
++++ b/include/babeltrace/ctf-ir/clock-internal.h
+@@ -42,7 +42,7 @@ struct bt_ctf_clock {
+ 	uint64_t precision;
+ 	int64_t offset_s;	/* Offset in seconds */
+ 	int64_t offset;		/* Offset in ticks */
+-	uint64_t value;		/* Current clock value */
++	int64_t value;		/* Current clock value */
+ 	uuid_t uuid;
+ 	int uuid_set;
+ 	int absolute;
+diff --git a/include/babeltrace/ctf/events.h b/include/babeltrace/ctf/ev=
ents.h
+index c81d8852..15830a30 100644
+--- a/include/babeltrace/ctf/events.h
++++ b/include/babeltrace/ctf/events.h
+@@ -109,10 +109,12 @@ const char *bt_ctf_event_name(const struct bt_ctf_=
event *event);
+ uint64_t bt_ctf_get_cycles(const struct bt_ctf_event *event);
+=20
+ /*
+- * bt_ctf_get_timestamp: returns the timestamp of the event offsetted
+- * with the system clock source (in ns) or -1ULL on error
++ * bt_ctf_get_timestamp: get the timestamp of the event offsetted
++ * with the system clock source (in ns) in *timestamp.
++ *
++ * Return 0 on success, or -1ULL on error.
+  */
+-uint64_t bt_ctf_get_timestamp(const struct bt_ctf_event *event);
++int bt_ctf_get_timestamp(const struct bt_ctf_event *event, int64_t *tim=
estamp);
+=20
+ /*
+  * bt_ctf_get_field_list: obtain the list of fields for compound type
+diff --git a/include/babeltrace/ctf/types.h b/include/babeltrace/ctf/typ=
es.h
+index 0bc003c8..4b626b39 100644
+--- a/include/babeltrace/ctf/types.h
++++ b/include/babeltrace/ctf/types.h
+@@ -46,8 +46,8 @@
+ struct bt_stream_callbacks;
+=20
+ struct packet_index_time {
+-	uint64_t timestamp_begin;
+-	uint64_t timestamp_end;
++	int64_t timestamp_begin;
++	int64_t timestamp_end;
+ };
+=20
+ struct packet_index {
+@@ -253,7 +253,7 @@ int ctf_pos_get_event(struct ctf_stream_pos *pos)
+ }
+=20
+ void ctf_print_timestamp(FILE *fp, struct ctf_stream_definition *stream=
,
+-			uint64_t timestamp);
++			int64_t timestamp);
+ int ctf_append_trace_metadata(struct bt_trace_descriptor *tdp,
+ 			FILE *metadata_fp);
+ void ctf_print_discarded_lost(FILE *fp, struct ctf_stream_definition *s=
tream);
+diff --git a/include/babeltrace/format.h b/include/babeltrace/format.h
+index dea8e0e5..bf33a239 100644
+--- a/include/babeltrace/format.h
++++ b/include/babeltrace/format.h
+@@ -73,10 +73,12 @@ struct bt_format {
+ 			struct bt_context *ctx);
+ 	void (*set_handle)(struct bt_trace_descriptor *descriptor,
+ 			struct bt_trace_handle *handle);
+-	uint64_t (*timestamp_begin)(struct bt_trace_descriptor *descriptor,
+-			struct bt_trace_handle *handle, enum bt_clock_type type);
+-	uint64_t (*timestamp_end)(struct bt_trace_descriptor *descriptor,
+-			struct bt_trace_handle *handle, enum bt_clock_type type);
++        int (*timestamp_begin)(struct bt_trace_descriptor *descriptor,
++                        struct bt_trace_handle *handle, enum bt_clock_t=
ype type,
++                        int64_t *timestamp);
++        int (*timestamp_end)(struct bt_trace_descriptor *descriptor,
++                        struct bt_trace_handle *handle, enum bt_clock_t=
ype type,
++                        int64_t *timestamp);
+ 	int (*convert_index_timestamp)(struct bt_trace_descriptor *descriptor)=
;
+ };
+=20
+diff --git a/include/babeltrace/trace-handle-internal.h b/include/babelt=
race/trace-handle-internal.h
+index 5e9c1c6a..924c730c 100644
+--- a/include/babeltrace/trace-handle-internal.h
++++ b/include/babeltrace/trace-handle-internal.h
+@@ -46,10 +46,10 @@ struct bt_trace_handle {
+ 	struct bt_trace_descriptor *td;
+ 	struct bt_format *format;
+ 	char path[PATH_MAX];
+-	uint64_t real_timestamp_begin;
+-	uint64_t real_timestamp_end;
+-	uint64_t cycles_timestamp_begin;
+-	uint64_t cycles_timestamp_end;
++	int64_t real_timestamp_begin;
++	int64_t real_timestamp_end;
++	int64_t cycles_timestamp_begin;
++	int64_t cycles_timestamp_end;
+ };
+=20
+ /*
+diff --git a/include/babeltrace/trace-handle.h b/include/babeltrace/trac=
e-handle.h
+index 96e4a81b..55c850f8 100644
+--- a/include/babeltrace/trace-handle.h
++++ b/include/babeltrace/trace-handle.h
+@@ -53,20 +53,25 @@ struct bt_ctf_event;
+ const char *bt_trace_handle_get_path(struct bt_context *ctx, int handle=
_id);
+=20
+ /*
+- * bt_trace_handle_get_timestamp_begin : returns the creation time (in
+- * nanoseconds or cycles depending on type) of the buffers of a trace
+- * or -1ULL on error.
++ * bt_trace_handle_get_timestamp_begin : get the creation time (in
++ * nanoseconds or cycles depending on type) of the buffers of a trace.
++ *
++ * Returns 0 on success, -1 on error.
+  */
+-uint64_t bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
+-		int handle_id, enum bt_clock_type type);
++int bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
++		int handle_id, enum bt_clock_type type,
++		int64_t *timestamp);
+=20
+ /*
+- * bt_trace_handle_get_timestamp_end : returns the destruction timestam=
p
+- * (in nanoseconds or cycles depending on type) of the buffers of a tra=
ce
+- * or -1ULL on error.
++ * bt_trace_handle_get_timestamp_end : get the destruction time
++ * (in nanoseconds or cycles depending on type) of the buffers of a
++ * trace.
++ *
++ * Returns 0 on success, -1 on error.
+  */
+-uint64_t bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
+-		int handle_id, enum bt_clock_type type);
++int bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
++		int handle_id, enum bt_clock_type type,
++		int64_t *timestamp);
+=20
+ /*
+  * bt_ctf_event_get_handle_id : get the handle id associated with an ev=
ent
+diff --git a/lib/context.c b/lib/context.c
+index 87901b3c..34a1bc82 100644
+--- a/lib/context.c
++++ b/lib/context.c
+@@ -139,18 +139,38 @@ int bt_context_add_trace(struct bt_context *ctx, c=
onst char *path,
+ 			goto error_collection_del;
+ 	}
+=20
+-	if (fmt->timestamp_begin)
+-		handle->real_timestamp_begin =3D fmt->timestamp_begin(td,
+-				handle, BT_CLOCK_REAL);
+-	if (fmt->timestamp_end)
+-		handle->real_timestamp_end =3D fmt->timestamp_end(td, handle,
+-				BT_CLOCK_REAL);
+-	if (fmt->timestamp_begin)
+-		handle->cycles_timestamp_begin =3D fmt->timestamp_begin(td,
+-				handle, BT_CLOCK_CYCLES);
+-	if (fmt->timestamp_end)
+-		handle->cycles_timestamp_end =3D fmt->timestamp_end(td, handle,
+-				BT_CLOCK_CYCLES);
++        if (fmt->timestamp_begin) {
++                ret =3D fmt->timestamp_begin(td, handle, BT_CLOCK_REAL,
++                                &handle->real_timestamp_begin);
++                if (ret < 0 && ret !=3D -ENOENT) {
++                        ret =3D -1;
++                        goto error_collection_del;
++                }
++        }
++        if (fmt->timestamp_end) {
++                ret =3D fmt->timestamp_end(td, handle, BT_CLOCK_REAL,
++                                &handle->real_timestamp_end);
++                if (ret < 0 && ret !=3D -ENOENT) {
++                        ret =3D -1;
++                        goto error_collection_del;
++                }
++        }
++        if (fmt->timestamp_begin) {
++                ret =3D fmt->timestamp_begin(td, handle, BT_CLOCK_CYCLE=
S,
++                                &handle->cycles_timestamp_begin);
++                if (ret < 0 && ret !=3D -ENOENT) {
++                        ret =3D -1;
++                        goto error_collection_del;
++                }
++        }
++        if (fmt->timestamp_end) {
++                ret =3D fmt->timestamp_end(td, handle, BT_CLOCK_CYCLES,
++                                &handle->cycles_timestamp_end);
++                if (ret < 0 && ret !=3D -ENOENT) {
++                        ret =3D -1;
++                        goto error_collection_del;
++                }
++        }
+=20
+ 	/* Add new handle to container */
+ 	g_hash_table_insert(ctx->trace_handles,
+diff --git a/lib/trace-handle.c b/lib/trace-handle.c
+index d5b906aa..8f11c7cc 100644
+--- a/lib/trace-handle.c
++++ b/lib/trace-handle.c
+@@ -66,54 +66,57 @@ const char *bt_trace_handle_get_path(struct bt_conte=
xt *ctx, int handle_id)
+ 	return handle->path;
+ }
+=20
+-uint64_t bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
+-		int handle_id, enum bt_clock_type type)
++int bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
++		int handle_id, enum bt_clock_type type,
++		int64_t *timestamp)
+ {
+ 	struct bt_trace_handle *handle;
+-	uint64_t ret;
+=20
+-	if (!ctx)
+-		return -1ULL;
++	int ret =3D 0;
++=09
++        if (!ctx || !timestamp)
++                return -1;
+=20
+ 	handle =3D g_hash_table_lookup(ctx->trace_handles,
+ 			(gpointer) (unsigned long) handle_id);
+ 	if (!handle) {
+-		ret =3D -1ULL;
++		ret =3D -1;
+ 		goto end;
+ 	}
+ 	if (type =3D=3D BT_CLOCK_REAL) {
+-		ret =3D handle->real_timestamp_begin;
++		*timestamp =3D handle->real_timestamp_begin;
+ 	} else if (type =3D=3D BT_CLOCK_CYCLES) {
+-		ret =3D handle->cycles_timestamp_begin;
++		*timestamp =3D handle->cycles_timestamp_begin;
+ 	} else {
+-		ret =3D -1ULL;
++		ret =3D -1;
+ 	}
+=20
+ end:
+ 	return ret;
+ }
+=20
+-uint64_t bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
+-		int handle_id, enum bt_clock_type type)
++int bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
++		int handle_id, enum bt_clock_type type,
++		int64_t *timestamp)
+ {
+ 	struct bt_trace_handle *handle;
+-	uint64_t ret;
++	int ret =3D 0;
+=20
+-	if (!ctx)
+-		return -1ULL;
++	if (!ctx || !timestamp)
++		return -1;
+=20
+ 	handle =3D g_hash_table_lookup(ctx->trace_handles,
+ 			(gpointer) (unsigned long) handle_id);
+ 	if (!handle) {
+-		ret =3D -1ULL;
++		ret =3D -1;
+ 		goto end;
+ 	}
+ 	if (type =3D=3D BT_CLOCK_REAL) {
+-		ret =3D handle->real_timestamp_end;
++		*timestamp =3D handle->real_timestamp_end;
+ 	} else if (type =3D=3D BT_CLOCK_CYCLES) {
+-		ret =3D handle->cycles_timestamp_end;
++		*timestamp =3D handle->cycles_timestamp_end;
+ 	} else {
+-		ret =3D -1ULL;
++		ret =3D -1;
+ 	}
+=20
+ end:
+diff --git a/tests/lib/test_ctf_writer.c b/tests/lib/test_ctf_writer.c
+index 53613c91..29d76df8 100644
+--- a/tests/lib/test_ctf_writer.c
++++ b/tests/lib/test_ctf_writer.c
+@@ -45,7 +45,7 @@
+ #define SEQUENCE_TEST_LENGTH 10
+ #define PACKET_RESIZE_TEST_LENGTH 100000
+=20
+-static uint64_t current_time;
++static int64_t current_time;
+=20
+ void validate_metadata(char *parser_path, char *metadata_path)
+ {
+@@ -695,8 +695,8 @@ int main(int argc, char **argv)
+ 	const char *clock_name =3D "test_clock";
+ 	const char *clock_description =3D "This is a test clock";
+ 	const uint64_t frequency =3D 1000000000;
+-	const uint64_t offset_s =3D 1351530929945824323;
+-	const uint64_t offset =3D 1234567;
++	const int64_t offset_s =3D 1351530929945824323;
++	const int64_t offset =3D 1234567;
+ 	const uint64_t precision =3D 10;
+ 	char *metadata_string;
+ 	struct bt_ctf_writer *writer;
+diff --git a/tests/lib/test_seek.c b/tests/lib/test_seek.c
+index 3c78e8ad..04beaf97 100644
+--- a/tests/lib/test_seek.c
++++ b/tests/lib/test_seek.c
+@@ -33,7 +33,7 @@
+ #include <tap/tap.h>
+ #include "common.h"
+=20
+-#define NR_TESTS	29
++#define NR_TESTS	36
+=20
+ void run_seek_begin(char *path, uint64_t expected_begin)
+ {
+@@ -42,8 +42,8 @@ void run_seek_begin(char *path, uint64_t expected_begi=
n)
+ 	struct bt_ctf_event *event;
+ 	struct bt_iter_pos newpos;
+ 	int ret;
+-	uint64_t timestamp_begin;
+-	uint64_t timestamp_seek_begin;
++	int64_t timestamp_begin;
++	int64_t timestamp_seek_begin;
+ 	unsigned int nr_seek_begin_test;
+=20
+ 	nr_seek_begin_test =3D 5;
+@@ -67,7 +67,7 @@ void run_seek_begin(char *path, uint64_t expected_begi=
n)
+ 	ok(event, "Event valid");
+=20
+ 	/* Validate that the first timestamp is right */
+-	timestamp_begin =3D bt_ctf_get_timestamp(event);
++	ok1(bt_ctf_get_timestamp(event, &timestamp_begin) =3D=3D 0);
+=20
+ 	ok1(timestamp_begin =3D=3D expected_begin);
+=20
+@@ -81,8 +81,8 @@ void run_seek_begin(char *path, uint64_t expected_begi=
n)
+=20
+ 	ok(event, "Event valid");
+=20
+-	timestamp_seek_begin =3D bt_ctf_get_timestamp(event);
+-
++	ok1(bt_ctf_get_timestamp(event, &timestamp_seek_begin) =3D=3D 0);
++=09
+ 	ok1(timestamp_begin =3D=3D timestamp_seek_begin);
+=20
+ 	bt_context_put(ctx);
+@@ -96,7 +96,7 @@ void run_seek_last(char *path, uint64_t expected_last)
+ 	struct bt_ctf_event *event;
+ 	struct bt_iter_pos newpos;
+ 	int ret;
+-	uint64_t timestamp_last;
++	int64_t timestamp_last;
+ 	unsigned int nr_seek_last_tests;
+=20
+ 	nr_seek_last_tests =3D 6;
+@@ -129,7 +129,7 @@ void run_seek_last(char *path, uint64_t expected_las=
t)
+=20
+ 	ok(event, "Event valid at last position");
+=20
+-	timestamp_last =3D bt_ctf_get_timestamp(event);
++	ok1(bt_ctf_get_timestamp(event, &timestamp_last) =3D=3D 0);
+=20
+ 	ok1(timestamp_last =3D=3D expected_last);
+=20
+@@ -152,7 +152,7 @@ void run_seek_time_at_last(char *path, uint64_t expe=
cted_last)
+ 	struct bt_ctf_event *event;
+ 	struct bt_iter_pos newpos;
+ 	int ret;
+-	uint64_t timestamp_last;
++	int64_t timestamp_last;
+ 	unsigned int nr_seek_time_at_last_tests;
+=20
+ 	nr_seek_time_at_last_tests =3D 6;
+@@ -188,7 +188,7 @@ void run_seek_time_at_last(char *path, uint64_t expe=
cted_last)
+=20
+ 	ok(event, "Event valid at last position");
+=20
+-	timestamp_last =3D bt_ctf_get_timestamp(event);
++	ok1(bt_ctf_get_timestamp(event, &timestamp_last) =3D=3D 0);
+=20
+ 	ok1(timestamp_last =3D=3D expected_last);
+=20
+@@ -213,7 +213,7 @@ void run_seek_cycles(char *path,
+ 	struct bt_ctf_event *event;
+ 	struct bt_iter_pos newpos;
+ 	int ret;
+-	uint64_t timestamp;
++	int64_t timestamp;
+=20
+ 	unsigned int nr_seek_cycles_tests;
+=20
+@@ -247,7 +247,7 @@ void run_seek_cycles(char *path,
+=20
+ 	ok(event, "Event valid at last position");
+=20
+-	timestamp =3D bt_ctf_get_timestamp(event);
++	ok1(bt_ctf_get_timestamp(event, &timestamp) =3D=3D 0);
+=20
+ 	ok1(timestamp =3D=3D expected_last);
+=20
+@@ -270,7 +270,7 @@ void run_seek_cycles(char *path,
+=20
+ 	ok(event, "Event valid at first position");
+=20
+-	timestamp =3D bt_ctf_get_timestamp(event);
++	ok1(bt_ctf_get_timestamp(event, &timestamp) =3D=3D 0);
+=20
+ 	ok1(timestamp =3D=3D expected_begin);
+=20
+@@ -284,7 +284,7 @@ void run_seek_cycles(char *path,
+=20
+ 	ok(event, "Event valid at last position");
+=20
+-	timestamp =3D bt_ctf_get_timestamp(event);
++	ok1(bt_ctf_get_timestamp(event, &timestamp) =3D=3D 0);
+=20
+ 	ok1(timestamp =3D=3D expected_last);
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace/0002-babeltrace-fix-bug=
-in-stream-intersection-option.patch b/meta/recipes-kernel/lttng/babeltra=
ce/0002-babeltrace-fix-bug-in-stream-intersection-option.patch
new file mode 100644
index 0000000000..cd06ec517c
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace/0002-babeltrace-fix-bug-in-str=
eam-intersection-option.patch
@@ -0,0 +1,114 @@
+From 04582ee50791df39c34da2a8c81101a64c79a3bd Mon Sep 17 00:00:00 2001
+From: Heng Guo <heng.guo@windriver.com>
+Date: Thu, 17 Mar 2022 12:26:12 +0800
+Subject: [PATCH 2/2] babeltrace: fix bug in --stream-intersection option
+
+If --stream-intersection option is used to filter trace, wrong result
+is got by babeltrace with commit: 61cf588beae752e5ddfc60b6b5310f769ac9e8=
52.
+Fix it using INT64 instead of UINT64 in related codes.
+
+Upstream-Status: Inappropriate
+[https://bugs.lttng.org/attachments/538]
+
+Signed-off-by: Heng Guo <heng.guo@windriver.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ formats/ctf/ctf.c                        | 8 ++++----
+ formats/ctf/iterator.c                   | 2 +-
+ include/babeltrace/ctf/events-internal.h | 2 +-
+ include/babeltrace/iterator.h            | 4 ++--
+ lib/iterator.c                           | 2 +-
+ 5 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/formats/ctf/ctf.c b/formats/ctf/ctf.c
+index 3c774188..86f4e02e 100644
+--- a/formats/ctf/ctf.c
++++ b/formats/ctf/ctf.c
+@@ -973,8 +973,8 @@ int ctf_find_stream_intersection(struct bt_trace_des=
criptor *td_read,
+ 		struct packet_index_time *_cycles)
+ {
+ 	int stream_id, ret =3D 0;
+-	struct packet_index_time real =3D { 0, UINT64_MAX },
+-			cycles =3D { 0, UINT64_MAX };
++	struct packet_index_time real =3D { INT64_MIN, INT64_MAX },
++                        cycles =3D { INT64_MIN, INT64_MAX };
+ 	struct ctf_trace *tin =3D container_of(td_read, struct ctf_trace, pare=
nt);
+=20
+ 	/* At least one of the two return args must be provided. */
+@@ -1050,10 +1050,10 @@ end:
+  * Return a negative value on error.
+  */
+ int ctf_find_tc_stream_packet_intersection_union(struct bt_context *ctx=
,
+-		uint64_t *_ts_begin, uint64_t *_ts_end)
++		int64_t *_ts_begin, int64_t *_ts_end)
+ {
+ 	int ret =3D 0, i;
+-	uint64_t ts_begin =3D UINT64_MAX, ts_end =3D 0;
++	int64_t ts_begin =3D INT64_MAX, ts_end =3D INT64_MIN;
+=20
+ 	if (!ctx || !ctx->tc || !ctx->tc->array || !_ts_begin || !_ts_end) {
+ 		ret =3D -EINVAL;
+diff --git a/formats/ctf/iterator.c b/formats/ctf/iterator.c
+index 7ef3e0b1..31bb30c3 100644
+--- a/formats/ctf/iterator.c
++++ b/formats/ctf/iterator.c
+@@ -68,7 +68,7 @@ struct bt_ctf_iter *bt_ctf_iter_create_intersect(struc=
t bt_context *ctx,
+ 		struct bt_iter_pos **inter_end_pos)
+ {
+ 	int ret;
+-	uint64_t begin, end;
++	int64_t begin, end;
+=20
+ 	/*
+ 	 * The iterator's range is the union of each trace's intersection of
+diff --git a/include/babeltrace/ctf/events-internal.h b/include/babeltra=
ce/ctf/events-internal.h
+index 09786593..b6d9813e 100644
+--- a/include/babeltrace/ctf/events-internal.h
++++ b/include/babeltrace/ctf/events-internal.h
+@@ -85,7 +85,7 @@ void ctf_update_current_packet_index(struct ctf_stream=
_definition *stream,
+ 		struct packet_index *prev_index,
+ 		struct packet_index *cur_index);
+ int ctf_find_tc_stream_packet_intersection_union(struct bt_context *ctx=
,
+-		uint64_t *ts_begin, uint64_t *ts_end);
++		int64_t *ts_begin, int64_t *ts_end);
+ int ctf_tc_set_stream_intersection_mode(struct bt_context *ctx);
+=20
+ #endif /*_BABELTRACE_CTF_EVENTS_INTERNAL_H */
+diff --git a/include/babeltrace/iterator.h b/include/babeltrace/iterator=
.h
+index 5c3939c3..ad9f7edf 100644
+--- a/include/babeltrace/iterator.h
++++ b/include/babeltrace/iterator.h
+@@ -77,7 +77,7 @@ enum bt_iter_pos_type {
+ struct bt_iter_pos {
+ 	enum bt_iter_pos_type type;
+ 	union {
+-		uint64_t seek_time;
++		int64_t seek_time;
+ 		struct bt_saved_pos *restore;
+ 	} u;
+ };
+@@ -124,7 +124,7 @@ int bt_iter_set_pos(struct bt_iter *iter, const stru=
ct bt_iter_pos *pos);
+  * real timestamp.
+  */
+ struct bt_iter_pos *bt_iter_create_time_pos(struct bt_iter *iter,
+-		uint64_t timestamp);
++		int64_t timestamp);
+=20
+ #ifdef __cplusplus
+ }
+diff --git a/lib/iterator.c b/lib/iterator.c
+index 77093217..c73ffa1c 100644
+--- a/lib/iterator.c
++++ b/lib/iterator.c
+@@ -636,7 +636,7 @@ error:
+ }
+=20
+ struct bt_iter_pos *bt_iter_create_time_pos(struct bt_iter *unused,
+-		uint64_t timestamp)
++		int64_t timestamp)
+ {
+ 	struct bt_iter_pos *pos;
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes=
-kernel/lttng/babeltrace_1.5.8.bb
index 19601e7d1b..dc207b544d 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
@@ -9,6 +9,8 @@ DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-n=
ative"
=20
 SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=3Dstable-1.5 \
 	   file://run-ptest \
+	   file://0001-Handle-negative-time-and-offset-from-Epoch.patch \
+	   file://0002-babeltrace-fix-bug-in-stream-intersection-option.patch \
 	  "
 SRCREV =3D "054a54ae10b01a271afc4f19496c041b10fb414c"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>1(\.\d+)+)$"
--=20
2.34.1


