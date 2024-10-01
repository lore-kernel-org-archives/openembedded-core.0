Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9224BCE7D19
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 12:01:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.79844.1727784087866619481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 05:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00048fa3c0=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491A0kSx000678
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Oct 2024 05:01:27 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41xhakk17e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 05:01:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoIP90Wc3bWH0/ocESXBlYYhXxYvSXeQ2lIU8C2FPq32IzNynMKnziFYcBrrRQYDD6Js08BXe8Hzn+NbIqsEyI8bv3TqZEyiqmfOXr+ozOR/Dj3FCiSW8rjTwcBfGEV5tqFeOgMYmmEswpZ2O2fSEG8RSoANR0JdSrmD5AsghTG3TbuJdFeWsc+UZFHDET7yzpnlmlSVEha7IVlzIAL/5/SWwivxw1Y7Y6wct4VGtE/RhtTUW/I14ZQxq354hlip7u2mE4ESGstXjznEiktQLSXKGcIxHEAsOx8C+67R2wL/209P1BHP+UAYzjMIm65s4A2uTD7I8400pxfviMCaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24nXn4S+pqKnh54M8JuTbma6eA9tf4r/M8idwMZWch4=;
 b=gsKMe0h2Ve/kzLlzhVTUJwOjS5sIFqHqjuWeEcXfCii7AYgjMHB9Sj+YCgWdXhhr7FvGw4xFYP+bVGEEjHVedFxeiKMWdl3LVp/dB/T0XtdAGTXqEGEI4n3dTiFS9cPteH09egTYpOOGzYWQyKimX6NQJDdtXUroqPghEZ94WMrmno485sIXbj4Ae/V7F/TVaqkYYy55nWW9SJnp9TUMM8JmxzgnIUnFKNnUGYxZ9lXpu6wNgUvs2J6ie1eQfw/uT/BnHmrr6Vsf69JWxf2fNbpRtiFKJdHLPkDZI/+Vjvk/80IVb+6MIKKWoQrrePcSXZcpSQ26tvymIqAzH2vGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 12:01:24 +0000
Received: from SJ2PR11MB8588.namprd11.prod.outlook.com
 ([fe80::fd88:cd7b:ec17:2e59]) by SJ2PR11MB8588.namprd11.prod.outlook.com
 ([fe80::fd88:cd7b:ec17:2e59%6]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 12:01:24 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gdb: Upgrade 15.1 -> 15.2
Date: Tue,  1 Oct 2024 05:01:07 -0700
Message-ID: <20241001120107.365354-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5P221CA0114.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:1f::34) To SJ2PR11MB8588.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8588:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ce5757-a974-4cbf-add7-08dce210c5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hxxPxtpKtIZyOpLf1w2VD3a4XzWhw17lfgvWzVadY79/4jgfm2YQmrGxM+FX?=
 =?us-ascii?Q?1BDh1xrqZyAsM3Zr6KVqOd23EvHGY22eh2ZRQUpFBEJCos8KVfX04y44CO8d?=
 =?us-ascii?Q?wnUgglRky8dbGjFneU8a21dm9pK+ysvCMHX6BPB+jLI6K/1OR0SGMC9hTSYY?=
 =?us-ascii?Q?stU+zJIb1miVnXZRYGy12SKu8/eLztEYqSe8g2pzBmUt2HWsYkthGqSHmyCs?=
 =?us-ascii?Q?YlSRW3yRRoNtz/ZKaO9Y/GQbsNKXNZsrrOuS64O6bfk6p0BqbrnBciGh9ZVp?=
 =?us-ascii?Q?Rc8R3GeCm+68B/rN3lTV1A7daQT/NmXk0Wx0xH72QdElAcgI2gCJSVbnhkxo?=
 =?us-ascii?Q?KoZxXY4vWmMROIChCGjbDzMdh1LNGT8jBC8jHF51B5YM6gF59EXtr7bGSiy3?=
 =?us-ascii?Q?EPrdRzWW/JFP6u+HfWqkeUtjNIPet24VmurNaCZh+/8lZcRuuKlYn6gK0xaH?=
 =?us-ascii?Q?6oyOkXnl5fvGloAQO2PXr8QKJyAegVukJCuETC4psxBH88aLrM9CIY41EiTP?=
 =?us-ascii?Q?DZVzHsmjxbuFJcSlelvR6CUqdnAeeHh1kxBlmldMsH1B6fFj2WDFVcNLZVn5?=
 =?us-ascii?Q?nOLmroSupblxc0aqO0ZDfMpWuIJOTGho2ERQiUMYSm3OQO9mmytZK9lhb9y5?=
 =?us-ascii?Q?umSOMeVtbO3kGKjAuNNzC0QnrZuKRMytnRu5y0nypa0XqcDM60O4rw0bAipa?=
 =?us-ascii?Q?GW3oA4TZEvlF5XTQAu7lMpDyuwleScpi08L3sEA4QzL0K/2BH26XJfI/tbcJ?=
 =?us-ascii?Q?oNalO9dCuirCYdd2nXgsLPBFJntsgRgirajlh/LYEgcyGqYMKBpXkWoPvqrj?=
 =?us-ascii?Q?W3FUP2gS3t4EPrNJKwR+UyGMDi+WW85LyH1Y6kMpfLBfqOzs8YG2xteshhAH?=
 =?us-ascii?Q?eobeTuyxnJw//04eAjoujgcU2QYsuv55tzKOtUkJQ+cBE0QpYJH0cx9yt8Zb?=
 =?us-ascii?Q?Uirg7uxBzJqBhdEyqFJnYPRDQNUOn59F376gtPu+o9lBFhBhRLEoS8mgXlEa?=
 =?us-ascii?Q?i6JfLEhUEldQXt0N1HFTrs4B4KRg1GXOMJfliZU2/Fo1MO3rR8fUPS9YsMbc?=
 =?us-ascii?Q?BnJ2BFJKygbZJOGwe95GJh/I6GplMe1XBre+iDacujdjSoj7z0V6fp9tlvs3?=
 =?us-ascii?Q?FU4eKeBPRePLsysp863ywazQdd+ogNOsEtC43DrBX1oCp+IBrlzRchLHkT7i?=
 =?us-ascii?Q?yWP3TNq0mbgQqoB9/RdEJn5GDVvF+/Vzdnx/5D48Y4C7Q+EZjq6sllSSnCR6?=
 =?us-ascii?Q?1Xky2ZIQncmByz7Fdk5EGv1v6UfMTEm2QZrrIrKlUU3YNX9yCJ74PLm7Vx+b?=
 =?us-ascii?Q?jMKoZF5xfL68r3cRVjK7z1Pi/eJ3wtgoPdCB4VrxG/j5EDnB3D9UV0ayd/xL?=
 =?us-ascii?Q?h1qkHxn4HQ0f2lhtO8Jw2gB4mFn77Xs2J7znvXox2abebLGnHA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8588.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hsOQhbrKjOTRV03BhgUt4hDFX4nhlPrkPKjPoQVggpj2C8kkxQVeXB/TioN0?=
 =?us-ascii?Q?PgxlP0eS4IXfAyTXVmbJy28qs9SOgHXhblLjqnsvCxM4Qukx6TLvROym+XUR?=
 =?us-ascii?Q?SKs1obn860G+sescHc5pniO50y5OYBQUzWVt5yxHQ9AXTqeMYUE3qfe47qtT?=
 =?us-ascii?Q?ibwnDR7USWGzsUoQ+fzuL2ETdYScunrO3iaga1h7KkwGSvpFvqELPkCmkiPN?=
 =?us-ascii?Q?B94Tc1bheIdjfWUQ9ShBXO4K+DIjPJkkikO1jlMJwmMtEKqCIsJ/tD2TangR?=
 =?us-ascii?Q?Wfc6z+z2fiSI4H471rAiD9p0b0RbAeb5kwFe277ysOJpvMTTzvNKxXJlHbwh?=
 =?us-ascii?Q?//sdkY6ddY3K7s0iyZtvhgzl2AzfYxlPblgsIjrQ81YQaoo7jNtGmh3i7z51?=
 =?us-ascii?Q?Ro35u6T13EOigeyZpyGOLBcZBqYx/KLxS9GwpBWKu8TCW1Cn+VJUm5XxHojJ?=
 =?us-ascii?Q?j1kzNywI0Z9gWtc1E9f/DPvogJnJIYb3OXirxzYDC6QbLeeWfXxYEKlunxx2?=
 =?us-ascii?Q?68/n5HJvW0nFig8Kztd5pAbfaPDTpTlVxn2RiBBrDM9NLSd6cStuGfQ93I4F?=
 =?us-ascii?Q?ULdoN9UHaOA7+Vif56IXCWgReI6dOMlR+VrCCZgBdSgah4gSA8CnkJQVeGcu?=
 =?us-ascii?Q?rX+0srkitqsf7V2Pvk5zoAQi4aFxpSL+2cB6G+vNBrG/wDdb/ZozveAh/CXs?=
 =?us-ascii?Q?0Rz6QmfPUtqLbcFDqvSJcCFleLRybFG7/Hhzf3AvKQYVeAUWlWiPclxIuxzj?=
 =?us-ascii?Q?Vrf2Lfxc1LXrONlWrJpVK9CgYsaQCplbUo4q2p2t/NzlZjntBE/jII/5qSsZ?=
 =?us-ascii?Q?KRwvSRPn/ySKe4SOeSKk8QzKJfxtZexciuDyGs+jxlLDo66yAkLNCx650rtL?=
 =?us-ascii?Q?r2/H3pVENitJO4RY+yo3Viieo3NALA9HoD6/+j4lDFFolHnfD12WcpAJC7ls?=
 =?us-ascii?Q?N5DUbeou417yqBNTk0J67ng+NfxRfl0+U2IvbV0a4BdTMOjlb0maiIBhNWJY?=
 =?us-ascii?Q?aBqZAmFkM5l5WZw3UFnaMvTaMcKIVF5vVq0gCGNgwypU50JH279k5lR80XyO?=
 =?us-ascii?Q?wOhG91EpQ6mBw4cw2XmWOHAqtLIxJYYphkltcC4/UGrCgvMndyBxcXAI0ip0?=
 =?us-ascii?Q?jPEk7I9jE2GBs4SmPSg2BbWy2mVkcYvLtd6p6vvw24peRCvmsn8nLv9kZjGE?=
 =?us-ascii?Q?iWT6grcG5dqkY3jUsYehgABd1lM1Sy5Pb2lksa51/PAwfi6VmRPY701ySKR2?=
 =?us-ascii?Q?Q6l3U2X2u5yUAKPC4F6zwV0Hk6EdHU5lEbXMgLlR7OMwE/PLe0BL0FovqHMZ?=
 =?us-ascii?Q?KQ3X0AR/OJ1tfx4vJprlSkUCpLvd6eW6kcnmMIrWR3XhEmFVpMidGewfJv2Q?=
 =?us-ascii?Q?OK+pZYcETwxV5vwbDDJK3d3wDdX8hJYITiY42xrN3CnGnVCqWrwJKYINe0pN?=
 =?us-ascii?Q?39p+pYQ/7uOZgbZpt8JTp8EkUbQ7aPTx5G1urL/Ih+J2Z9yM9NCDhhFrMYEA?=
 =?us-ascii?Q?cIMOdI0j1yk0DKXid1fwqVYhUQoWd5h9eWNMovFIwAzaCqL46YzC+4E2sBKD?=
 =?us-ascii?Q?ppvfc2ZXLcYDpPt6PiDpFVphQB8Nw95BVeyyCnA+hqPxzBrldTOOBto8i5CW?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ce5757-a974-4cbf-add7-08dce210c5e2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8588.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 12:01:24.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBQqzuFCXCMqRB2snfEe6ZaODaJJuSosT8T5QXMH53hVYYYeEA/6pFuT6NNoW9mcnaRgWVSdsbxDW0s0pyIRzfYLrt5OLPCgy+s1lLEmA94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
X-Authority-Analysis: v=2.4 cv=YOLNygGx c=1 sm=1 tr=0 ts=66fbe497 cx=c_pps a=9T78G36u1E64A7MtQSounQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=ey4LLFx0yQt3p8_HPfYA:9
 a=HLtdJeG4OWNjQwUm:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: neGTU06E8cCNGb3atbVcJbFDSsTvhL6b
X-Proofpoint-ORIG-GUID: neGTU06E8cCNGb3atbVcJbFDSsTvhL6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_07,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=961 clxscore=1015 suspectscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2410010077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 12:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205160

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

GDB 15.2 brings the following fixes:
 * PR gdb/31727 (-exec-next fails in mingw (infrun.c:2794: internal-error: resume_1: Assertion `pc_in_thread_step_range (pc, tp)' failed))
 * PR c++/31900 (libstdc++-prettyprinters/debug.cc print redirected fails since gdb-14-branchpoint-2123-g4e417d7bb1c)
 * PR python/31946 (sys.exit from Python no longer exits the GDB process)
 * PR record/31971 (Loading a saved record file asserts if we try to execute the inferior)
 * PR gdb/32005 (frv_current_sos doesn't set solib::lm_info)
 * PR exp/32015 (GDB crashes while printing large D array)
 * PR gdb/32025 (Fatal error when the disassemble command is interrupted with SIGINT)
 * PR gdb/32143 ([15 Regression] arch/amd64.c:71: internal-error: amd64_create_target_description: Assertion `!is_x32' failed)
 * PR symtab/32158 ([gdb/symtab] enum class enumerator has incorrect parent in cooked index)
 * PR symtab/32160 ([gdb/symtab] Parent map: die parent or scope parent?)

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/conf/distro/include/time64.inc                             | 2 +-
 .../{gdb-cross-canadian_15.1.bb => gdb-cross-canadian_15.2.bb}  | 0
 .../gdb/{gdb-cross_15.1.bb => gdb-cross_15.2.bb}                | 0
 meta/recipes-devtools/gdb/gdb.inc                               | 2 +-
 meta/recipes-devtools/gdb/{gdb_15.1.bb => gdb_15.2.bb}          | 0
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_15.1.bb => gdb-cross-canadian_15.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_15.1.bb => gdb-cross_15.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_15.1.bb => gdb_15.2.bb} (100%)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 9d556bac16..f939f9b7c7 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -49,5 +49,5 @@ INSANE_SKIP:append:pn-strace = " 32bit-time"
 INSANE_SKIP:append:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = " 32bit-time"
 #gcc-cross-canadian-arm-14.1.0-r0 do_package_qa: QA Issue: xxx/x86_64-oesdk-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/14.1.0/plugin/gengtype uses 32-bit api 'ctime'
 INSANE_SKIP:append:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = " 32bit-time"
-#gdb-cross-canadian-arm-15.1-r0 do_package_qa: QA Issue: xxx/x86_64-oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gdb uses 32-bit api 'lstat'
+#gdb-cross-canadian-arm-15.2-r0 do_package_qa: QA Issue: xxx/x86_64-oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-gdb uses 32-bit api 'lstat'
 INSANE_SKIP:append:pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = " 32bit-time"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_15.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_15.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_15.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_15.1.bb b/meta/recipes-devtools/gdb/gdb-cross_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_15.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_15.2.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 6aa9dced86..ff0db68da7 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -14,4 +14,4 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0001-Fix-Wenum-constexpr-conversion-in-enum-flags.h.patch \
            "
-SRC_URI[sha256sum] = "38254eacd4572134bca9c5a5aa4d4ca564cbbd30c369d881f733fb6b903354f2"
+SRC_URI[sha256sum] = "83350ccd35b5b5a0cba6b334c41294ea968158c573940904f00b92f76345314d"
diff --git a/meta/recipes-devtools/gdb/gdb_15.1.bb b/meta/recipes-devtools/gdb/gdb_15.2.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_15.1.bb
rename to meta/recipes-devtools/gdb/gdb_15.2.bb
-- 
2.43.0


