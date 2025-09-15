Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D442BCAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 03:30:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.24241.1757907022681911201
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 20:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=avWYRyLN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1353ff102b=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F2UY0V3015131
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 03:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=FBAKd/xKWeectuAsOisN
	sUEwyfymxyF9NMc6jrlsAVc=; b=avWYRyLN29vBK4h6qjlKxXjdO7w69bPgxegW
	8PRta9x9KkgoITgRmmqLpaRhNUfuBk8VzijDojNL+ojI/RMn8rnlfMU7rEh7EHk8
	j8RmsYC/xq+LqI7tQznsXTbmle7TdPVHx59E+OttuE9GeowyQwNEaYhv3dtQvBiS
	sIICN6lTGTgJMbHYQBYz/yYvCw5+HdyOi6kLezzcVejf+76RjJ+GnontIXj6++iA
	wlDtXlANtsyaZaQSlv6agXlYl6b/qgYQSkbb7PM/3taWaz47E0pxjbFrCvE9f42r
	kzYK/58rQNi/f4ZYqeZQ88BQMF9fZIb0ObLLyPcfwdLA44+/4A==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494yk79kpq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 03:30:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhpUmFtiKMxxHuTKe3k5z6CmaTgOFspvpP+ceZXv0R0Rv52JK7iaIuUGQxEO5HviaYp923zlN8532kXtIzwXUbllqR8e0xE0IJdSImI/l7yd2wmU77RZ7SNUvih0g4xmrpvOgwNqPaUggHJrn/rTQ9oi2jGVsStQ6v/mQFu9LAY/VGrQPOb2gDkiMQFAGAD2788A7fdoaf9ZoiUE6gONqZxzpngXIz8CWWMjQPT+uUSj3BBqUgec47ZlfQhP63Fjx5aj/Kbygn41tKErmH1hCoGbc1DivYOF6EZO3JQHvw0aXs+g8HpczAkMhb1Ms9zgYROF66zZq6gjLlsU0WiI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBAKd/xKWeectuAsOisNsUEwyfymxyF9NMc6jrlsAVc=;
 b=l+S52sF9QBBBOg6IspomUZhhOc9cvdOOyLiXTEXZp+lTs2L4uYjx+hk00PWsbOLRH1PQgW/kI4UshdapqQolZr49rKo/ihyA6xYUzqAfztRD4prwZNiqk56cqEwhnifnusn0+mWgZ5jphhQuLkqaAVV5HXyGvf+TH0EVtyLwLWpKQ6cBvDou/x6+fc+fGBqwZzrf+KxyqpOMgUgtdZW+bZlireEpX50oVytcv86E6kf3S8ncDPDa1gErtoSySVfeOETUcczPk10RRRDB+M6TP03fizq9cHqzehFqD+VTFqvwsvASkwE5kN519LTR95wxnSlnmM1YG/zWov4sett3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 03:30:19 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%3]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 03:30:19 +0000
From: libo.chen.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] runqemu: fix special characters bug
Date: Mon, 15 Sep 2025 11:30:31 +0800
Message-Id: <20250915033031.93711-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:d10:24::16) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|IA1PR11MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: ccaf5e8f-d3c8-4d6c-67bb-08ddf4083213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vhyJ3bk+7O3xXEDkZZBwSYplIDwGRuiYenSWuX2imKNKPtLjIscqlQAa/sbq?=
 =?us-ascii?Q?z988voExD52tjmiYtpRqCiCWki+74e+AnkzK5krQ5o/zl86WS8Wre9A7cVKX?=
 =?us-ascii?Q?nzIlvilpEoaudw+ZeKifaq6IdI/ugGwXVFX7EXUv+FvImK/MGoGovevN76dY?=
 =?us-ascii?Q?8Hv1GGMxcMvhAsH45E+0yhhBeWhfEhABjYtB2rEKJ4anCUiCaZATbn3yufCi?=
 =?us-ascii?Q?un+UbDDjEnGF3YR9HgRsxILMYa5xHV2v6nHj0ZGbx4wbolHtMQspYG+ypHoh?=
 =?us-ascii?Q?4SaJ1Xtcv9txbxnwLFha6tTxR81kwV+QEPds8QKpEhKW5dnZDtUzC4xiOJkn?=
 =?us-ascii?Q?N/rh/4tyGjYHtUkwkIgf/nEHyAx6PePGHqLhzVtzayYprH5uiZt+6sSMV8Uw?=
 =?us-ascii?Q?Ynpp8VmmZqHq9/YhU24RxA1Xp6HDjKmrs83xI5/kH4HBqHx6SWgrKgtibKsZ?=
 =?us-ascii?Q?w5gv/EPulqhSaGzHn9tcH4qFdP2VE//ZkWrCrlK0OB9wsqyOEMvjIAYrGVxQ?=
 =?us-ascii?Q?glwUKoVIeIflw9KsLJBbtfvwia7hM9WaO2QNMrj5IP4tsC+WRCoNL0SYcRrv?=
 =?us-ascii?Q?SpivJfrC/mdTbDGafvO39vzAbOdgeszIzyoE1BTGM7h2SaK++RkKvivpq1u3?=
 =?us-ascii?Q?WDi41W5nD+Sl61FnEE2ZE3wyeJwJ4VWbpfmdFwNsBUn/MKjaBJROi6EBPN1w?=
 =?us-ascii?Q?4JWV7XXmwlPBF7uSY8sMa1UfGuDW8XYCKwyLbsBCVUPemvWMsgJfe2rLcAru?=
 =?us-ascii?Q?rX1JKOqacaBDAMSPTlhi/JX9q6NlMjiN8QfS3GUwv7Q+xGY77nWb3Qct4kLI?=
 =?us-ascii?Q?RDRu6UbnYPV0NdIhdeH6EyO2b6Dno5p9yYE2cl6bhEJgzRaQqSI1Vb5bqsMB?=
 =?us-ascii?Q?3OhyJnWVwBqqAfIscdoOPt2j9WyJ+4IewaG42ONHHDunolDETjAo+Uqkx4Dg?=
 =?us-ascii?Q?Ypb7mLWOzw/wH6qdpsuu2ONbxHg+8fa8L7PJtTqUQsGP8hFRAU28Zz5p/Q5c?=
 =?us-ascii?Q?ce9VcjlxNJl1iklkbXJTtiyzAS9lkDEIK44J9U7vFUxQUYK8xCcMnNb0DhtP?=
 =?us-ascii?Q?bAZSHMKVDFfCO3dToxUiFy6Gc2xXBBF5ZpaHa22sM3AwudZojesy+7tE287q?=
 =?us-ascii?Q?QpDrrSvGM650vv641BsLKZQd0CfiT9Piv1qBsDq1KjjwLfqVlxLsBAnxuuao?=
 =?us-ascii?Q?g+n1PO8xcLQh06y7pfMFG+HS92mr7qt7J+do9hq5JAaHnJvnjsGImBwVEjEl?=
 =?us-ascii?Q?CbeY37X4DwUrT0V8ugn9C6gLu0Ml/a8Iv7velJdPtgCkRIiWqlW80pm+k1Uv?=
 =?us-ascii?Q?4nFSKfkb02s1D3S9EpoKPNVca73kbNXXWUTDmKtJzfMTVSAbuSxrnhBGBClk?=
 =?us-ascii?Q?IsGYWRhmPc9iBw7eWfvYyG3Nq2+Ib6jE877xnNxPlQxqy4huWzNlFNtUDWd3?=
 =?us-ascii?Q?Tn6bZcTMPGk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lgsbvmx/1jnmw4IOcClvOhuxvQXcIWAbLZ01C+icMaSyEteghbTRIThsEyx1?=
 =?us-ascii?Q?/ytgIz+BUgrqQf2+5AecAHl0JYP1hQLezS915vvl0qiodpJmpRWI237TTUyh?=
 =?us-ascii?Q?EFazKawTmhIkzmaxvF3K8W9h507kKL7Y1z108a3d2dcGPO17L59XWdBIIRNF?=
 =?us-ascii?Q?NRkPHmXsX8HOZc7XJGORkiSQXEfRK380zfiXhLmB+t0Xf9hSE2dMaXsWdq4c?=
 =?us-ascii?Q?SZyJGxHq0WlTJ5gKtqPJTFUrrsgfjUtMrnJeRhHr/g4qn9NAM3D+bVDo6Uun?=
 =?us-ascii?Q?or+uUmEvJ9Mh8qE6rqIRgrazEieziCLXwHI+jaKyYJ7ppB00z7IFUGvlIurd?=
 =?us-ascii?Q?3IiLJgo09xIFVLM/jnyizdO4XK8LAbStbs8j5SkgrMonorpPP3P0hluwj1rG?=
 =?us-ascii?Q?bf2fx9uTwZALYZHZh+//0zcGH5RGGgri3sRsb9m+yctymOHIWGmL4R87i2M3?=
 =?us-ascii?Q?QxGlkeARu6wMyC+MbvjyyCDNuKug37fySqf350M+0xDltRcLNACfTC1hPGU3?=
 =?us-ascii?Q?5rlIZS9KFYRJ0PSfpHaq2Sl5M3muZ8tSsHfj8qik2Rz7s+EcKuVu2647Z4pr?=
 =?us-ascii?Q?kSB7C90+tzd1EJxjOXPt/kOtcPPCA6jVndnsoBox2hHzJfckXgYxE2jxvo58?=
 =?us-ascii?Q?ggPwvH61ejvR2i8U+9tKBRj0wSYWB5H3ndMw1TGFmQ2HdUlQs2ZuZM8M5Qhl?=
 =?us-ascii?Q?405dN2ZPOdL1VKb3PCtKbu0zGiUqfLZVAhLTwHQ0eRj1MFS/l6RCAkmUgcd0?=
 =?us-ascii?Q?nLQ6In3tjHxsGOAp8fzUw3OeWhPmhl5q7eyWf8FIC0p/sfEoyD/QxZ88tZhy?=
 =?us-ascii?Q?QgbhYOVlUP041/pidJGGupGkAOUwINX8Ap6DeDn1PCZEOqa9Ue+Xo1ot0VXR?=
 =?us-ascii?Q?5azpRLG5i6E1WZZgJoJYwFr/XALkfo34VY0Z87CwjUaGXBNtygksBP2aSe9o?=
 =?us-ascii?Q?f07TNJvnnanPAAsgAxHyfFF281VXwd2yk2ft2uEbcS8fxBVcCL50eDf4Gtdq?=
 =?us-ascii?Q?xIOE/97ouGqrGE6HKYtheWGoXuzG+tJo/pbJzzyY1teSyTqVlv4OLjeGOoah?=
 =?us-ascii?Q?F7NL8S5TOASs8/4+gyK7L7PyMjBS9ZRDkXifGgk6vOIkycyZj8qajGQohf39?=
 =?us-ascii?Q?ktTJoQ+jLKoNdYRbolyMcuENYKMb6NCMY1Oq1fAgKmKzhc70m91dxVOHqp9F?=
 =?us-ascii?Q?plAXKXghMRd8mEXeofX+py3zgkQ1u+sx1bV/gD6LSuWnX7UgFhXd/oCAh9yS?=
 =?us-ascii?Q?nDa2YijFl0nksrJd+9piUSGXXUnSZMDKdL+MPy706iDlZeyvdf8nA/i2AWsl?=
 =?us-ascii?Q?Qokt9Eds8J2Lhgq1X41GSQhEfS3CgkRskJ/+cJwlZRzczneJe7naHQU2LlF/?=
 =?us-ascii?Q?/my2+X5+rPfdjS2Q1r606J6nf0tvnXvi2n2wMZ1gZRShQgAHhGVVF1Sa7NHw?=
 =?us-ascii?Q?Q7AQrEubk9+6x1eL0CiwowDpop51YUEbl7Z+oIHi9gEvIWpXBBNSwa1Qxvhm?=
 =?us-ascii?Q?qhpn7AomJsuWfDvdKHlOlVJjIpsr8AvDR0/L4iPINw8uHMd9Ji+9J0sOHFEY?=
 =?us-ascii?Q?tffHp6JTsIX2UHhHW4uabEAEOlADeI3vpMIw1m/CdM1y4cX/FbIPovuudPYw?=
 =?us-ascii?Q?Dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccaf5e8f-d3c8-4d6c-67bb-08ddf4083213
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 03:30:19.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu78PU9OEX2BfDzstS1vUqqZw3khLkiPcfl5cy3ZHAyOygOH1imykg6oJHqObgHXgYOKhBsCmui7ol6Mzh9BH7jh8NdfA/p+QqvebcD620A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
X-Authority-Analysis: v=2.4 cv=GZYXnRXL c=1 sm=1 tr=0 ts=68c7884d cx=c_pps
 a=k3z6I4pdfs0t3+GLVInSVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=ag1SF4gXAAAA:8 a=nQNCM_iwqSZUGIDYJeAA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: QnQNqvMn25FkNtoF6xJss26ao7qZ5IE-
X-Proofpoint-ORIG-GUID: QnQNqvMn25FkNtoF6xJss26ao7qZ5IE-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDAzMCBTYWx0ZWRfXwBMG0RyHbH6L
 IYPAXNuEQoGLrIOtKC0RLmaPdRmXv/9xZx7A+IcufXJzMSil8mdHXJspMyBpBRV4GsjsnkhcDP6
 xzQKzkkUclGYYf2G685822Bu24KWt3Ddgba5vKiNwPNeSLzpoU1ckUhQlg+yJ8uRwjDfPYmlgRf
 UidN7YQdMaO5GEqPZ3ohjUdhnXyM5Nu2LtseYXh0GdbqaIBTvOjVJPFz5DjtjwkTQH7XUf/WxkL
 4TS6dKkOgBw4YQyTSLPBNMYcBTwz3WNsGqH1JxQBkJCihO5tEURrJ3En0LVTOh7rrIc2wnC0C3z
 NaAUNkw5jwGXsKdKUCIRMAK3MlCKNdWkxd96F9/cXpGaI5eChkM+Cz29C6nWTQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 03:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223371

From: Libo Chen <libo.chen.cn@windriver.com>

Fix the bug in runqemu that happens when the file path contains
the specific words such as 'vmlinux', e.g. /home/frank/vmlinux.

runqemu - ERROR - wic doesn't need kernel

Upstream-patch:
https://git.openembedded.org/openembedded-core/commit/?id=3c186fe7741adecb0887e36c8a9164a58fc16437

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2ab36fd03d..f189dbfb60 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -368,12 +368,13 @@ class BaseConfig(object):
         - Check whether it is an NFS dir
         - Check whether it is an OVMF flash file
         """
+        n = os.path.basename(p)
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
-             re.search('zImage', p) or re.search('vmlinux', p) or \
-             re.search('fitImage', p) or re.search('uImage', p):
+        elif re.search('\\.bin$', n) or re.search('bzImage', n) or \
+             re.search('zImage', n) or re.search('vmlinux', n) or \
+             re.search('fitImage', n) or re.search('uImage', n):
             self.kernel =  p
         elif os.path.isfile(p) and ('-image-' in os.path.basename(p) or '.rootfs.' in os.path.basename(p)):
             self.rootfs = p
-- 
2.34.1


