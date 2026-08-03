Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FE2C5516F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 04:18:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36426.1785730683885379643
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 21:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rgvwISvf;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=267553595e=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6734DCoe455874
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Aug 2026 21:18:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pD47tWxsLYuRs5smGShBhL+SMvTFNSEJIrMbKT0tzP8=; b=
	rgvwISvfwNUhtwa6BzSQOMdqnHi2jvoYeP3GbQxxgMke4CtxH/sdTul4sM/8oAKl
	Gqm7vgIDjHmhPkhG4B7HGSCY+N7PcTjefGZvd1JFRuXxCdj7X/RP0XngHCWVBbk6
	6205+Tg59Y2kDqssR9U54nTGyGNzQO0HmIOChm3S+1CblYP4eA0gJLPUdUhkmUxc
	dcZ04uFyBzfr7w4+gekRFiCG7iTHVv/CNngc3BN+uEp1AHRjFYa03lRGUP1c3ljv
	Vahz+uLxoO77yYUa55BguLCzeuWNVSwFtxoTBD6kjGgCDvDJOcjg3fwCYG0P8rzT
	Hb4bekik8lg1W6O1GXq8eQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013038.outbound.protection.outlook.com [40.93.196.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgah1hjr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7VFtZIvSj8awbxn5KlfUsQ60S9OXF2ejxLYic64SIydhc3soXIZ9F7+opyCPwq7C5RF+Z2C1I54SxL6x00Z3Yny2w/DJ4NTrqv3K2SKDNphVObn84E3tnRuJboV+9iVlsfKgvgP/cSQ8J8ISVGZUcUR7ev0dBQ2xUzs7tk3/4Gp75m+/kKYeUugk8epuU3AIF6M3vHKt+fe6Ahn2ZKbEC9oUOrtc93Ngqdkd6r9mFo+FrFJa9zue2BmNoGo3VV+WlaYDEsjyG74Q188xrNtcUaGqUuzKdXUdgCqHk5LAvTn3maOwjezhUfwiQInbveCDWumFAGGpi75HJAR61U/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD47tWxsLYuRs5smGShBhL+SMvTFNSEJIrMbKT0tzP8=;
 b=YFq2ZOhyW6rRqngkf9+3dCgm5M/GASjsRq1Gu7Zex7hJRpwgWcJssWHW6cNecO8pJCAIsp+bARk/rhq1ljjJlvqmruOSx8qoUEFRX9KbcZN5wCz7CDphE1qw36ecuZ0w4/wZ7ST0ZKYrbkcYMGmRxBobX341PCogSxP1N/QzXrQ01YM3cxqfYbQBmjcwEqGK6z01YjL62SLUHAmHVlATyNtl26T99h4tSNN/bLqpvAXuVHFfpncGN9TaVa7MJhZi8uSO7YzAkLi78lJuZkwQ6EcID1ThJXz/PjTffxk4Knr1vnBb5BvkHcOqJTlrcSBWJ/cBWXZG5niyTK9Qzl6hfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Mon, 3 Aug
 2026 04:18:02 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 04:18:01 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 2/3] clang: Enable cmake flags for llvm, clang, lld tests
Date: Sun,  2 Aug 2026 21:17:40 -0700
Message-ID: <20260803041741.790019-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
References: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::12) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b7b685-6f01-407d-eb3e-08def1163538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ybLR1Z+maC9cnQZXLTMQ7I2YpNQXaW+O6lOt/5r1iPMhYzSMlTQTC6aOI8SWx7DXKLtBm8OPcCRjxuBjYZVG/nQpzOEyk8rYhAA378Skfcem266mrNjjEYUdCxCkTwDRkZ5MhfNF9zQAY2cQRcRD8nZy7NHNBdNJ1pYucDLqPiMOiOYZMAJUxTC14tUD9IFb7iOXAHAmo0YYsZIx7zNlZ7IUMtw5tanUS55B9qaZIjwUpqpnTs3sXCUHEAtriIQ6pKB7FFW+cNMCYrnIM/ulvpe4CVfX1llsGQ8TZrDlQkB2ZLs5GOtIgjPrqFVF8QnkWrTx3cOdI0dQrSCcbHqpOe9Nr+meZO24FD4PXmcfLkSMrLk4UGuuLSqpRiDtGoGIcUCmdE7Ps0LRQAWKFgKXetKmekahWcrIV305Kuzt1MT7/948DJSMSCotkQ2QzJk/f/89EqGxfxA8rpUBxmjw/4q8rQnOwuUUVT1yCliY0/yYd9SllFKrF3jIG5FAnZTke5Jp2ZaHkf9U1WWJuvSCQsLT51vMh5aiMK2mhd2syVE0FlKam/1anJuwIU8K3JDY71gFipln75LnufeY5yC177A3VBuN0p6GG/IN0WoQZS8JXWttSBrbNiXGkzUC3yvspuXP8/ghK0mEIcXbygYMSjyd2o+YMI+X4Q0dIdEiCOWdQHN1PC2m8A7y+zjm5QK2ec1SR3F8he2jY1K9zuUmwep9qGGn190rHuJn1wFLZDo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KrY9CTxS5yXAI0GHJYT+IUUONIc+t3tJJG1UwxhxRtwIU5NaYU06kZaQqUIW?=
 =?us-ascii?Q?dJRS18+QY0TdcpgjLPPeHdlRfwb2Kbptw+iVLpIXXsD/fJmCetiuxilmdnIr?=
 =?us-ascii?Q?Fb8e4patrA2UF1pz1QZCzXmv80ACzyRIInWRCkR/pG0t/ZCf+/NwNs6ANUXm?=
 =?us-ascii?Q?VPSnAUsbxWjQfGL5cLeBuI+J5dNPjAEz1sSSnPp7TNH2BfWS8Npz2T3YFt9Y?=
 =?us-ascii?Q?QUxaP5NYVXa4wxSx/i+N3y6SaGScqI4n9SR3T0lMPLMlbyVIiLvxIwHw0dhs?=
 =?us-ascii?Q?44Z2EB4LdHKjWSUGsJggzEShUAKY3VrVIV3+BeJ4KllcJgWRhOAvDIwMUD/z?=
 =?us-ascii?Q?AaOIdXDZ9g2DN69lb+IJEBuoGX8cvaQtI1YfoGg2VAnzTBL6Ik03UBuuDsTm?=
 =?us-ascii?Q?nXYO3dZFo+SBgsY2o6O+v7eq6TW1JKKTx++pPAOAWqlKXoswwNym/hb5YNPs?=
 =?us-ascii?Q?jFz5YaFFAa5DksXdi2Un01iEvz9NGqw+LixdOPJ05oLI6EhNUZRnQ3UQxrzI?=
 =?us-ascii?Q?C4GROwcMu6fyfpg54Gh6Z3xyO8+KL1pqU2EUIkLWOuOPI/OMyvtNo82wXiFl?=
 =?us-ascii?Q?mEUb8RVNx7uBI9WTVBMvmnEGAqxULJEEvnjlhPRN4uvTLspjUVCcUjPL8v7l?=
 =?us-ascii?Q?0xEX7H/2Z8I/utR1AQjAwl35C94ccAKDzGaBkF97JbX/umdRq77v4QUmv/hN?=
 =?us-ascii?Q?6s7lsBFNWyQDK+Sblv9M+yGsRubk9Qo6AcIqubJCGLJJ1Xf/jjs0XD1Cy/Su?=
 =?us-ascii?Q?owNdRiJE6sZyj3adeGZNi9KppiaQMfigENiFxofUuFtUpq7taViX0wUAXrYz?=
 =?us-ascii?Q?viLKi1EY/3EB9zGz628xtsoYFQmPBmMPltANRvca9hcgoh9rEpeL/0qQimej?=
 =?us-ascii?Q?MBymk0+oCt57tLyoTr7eCe2OU14rgqsGexmXAl+1LhFykY+9mg2p9q8SZ0h3?=
 =?us-ascii?Q?I+vA1jqXOWWKLjO81ItLdM4lusT4l0zK2XbRdWu5w3FQJycoKaTEXqaRQ9nT?=
 =?us-ascii?Q?J3uFiuTJWfRWb4winK53B/mpMkdKgtDmz19clWI9F44XgJoa3k9U8Dj9ZEt+?=
 =?us-ascii?Q?IZeqUCctM13HFOKYEp3FMhc8O7+E5WuPv1Y6Ol7RYwTUSXquAy6pZr9RG90Z?=
 =?us-ascii?Q?PpV9l1ezobUoUjkO58k1J4KBq3Wirp8LZo+q92ve2C0ejXM/X1OUdmQ6aokE?=
 =?us-ascii?Q?LaG/A6wTsqPlttofxNApSY15o19Ryqrn49dOuPQDRrCzEAsv16iVwhDoYH6Y?=
 =?us-ascii?Q?SEWyNZnUsSdgXbnJoNuLRp9XO1PqgKfnwbn7DGweS/oOW7IwmoNEUKgGpxqk?=
 =?us-ascii?Q?Sggy198Lm0FFtLkuw1sWw5VxlDMbz7tSqgolffyirYMFdDcmSB++zG8ZuEYr?=
 =?us-ascii?Q?IwY/7+8w4FRhnsZbGHY/WngTuYtkGgnDTRUAX4ee6kfJFfhpfmb7vdeHQiuj?=
 =?us-ascii?Q?f4FRvvSc4UDDdqVwWsQeUJsbvczGCYUtKWc98GeTdiPNdX4iRMejZVMW94vA?=
 =?us-ascii?Q?WZNG8nYAZeXLhadT3iyV1sNZgkwByYWwJAilkONtBv7uRzrr5cIk1723by0G?=
 =?us-ascii?Q?SFCqK8VWzrAEeRG9dDWcBIa6Mq6Bs3SuWhNNabMK+VvW5XpW2Ujy7/NBcwrq?=
 =?us-ascii?Q?EmvSaDQXFWlEQ4RqjXvhI8jaEiWBU9gLck3mbZo/NDVwpN8llNdVMFMWm2xD?=
 =?us-ascii?Q?DAbw0MB0HRC5SuohRvUm7xd60DHfrO4maMUoMZY/mohPKl7CnJVivjreTQ5V?=
 =?us-ascii?Q?INSVvfYLii6DhcgMkz9kjTpxYmMvTPjkdrXvMCVw9LKhyCGyNuSf?=
X-Exchange-RoutingPolicyChecked: 
	kql0X0w3dGvVWB6CBU0fPzA3CfV3/49n55MUtVK3scy0kHgAY2XQAPN8gCje4EhtHHchEU9jtpMOXNy6osnlF/vYs1TZdIsn7zQUr0vazUWtTyCemdja3Apx7Md29rjBGPRyEGhRoOyJILBUlzJSEqRiAcqdvz87RHj8/eMFCjtuiKX7Hyjn6/v6jPM7R27QRDjLz302vrjvhI9wFl4f7WvojVe81RahQ/ViQuYOX23cDkPqoyOZxT25Xl3iA2TyjUaApdZacc/+oqAyNFCS2dYP82CZHJag68t7v/q9u08UHrGr4IluPUvFrU8xZEbKtl5b2qelcf6cLwJkkh7rIA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b7b685-6f01-407d-eb3e-08def1163538
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 04:18:01.8893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLq0HW1NMeL5+Ih/dMDoqKCPdwU1czWZqi3rDsHHtnr3TC00MwHFMiqXF1cMsv6oH0i9ineW/2NOeE37dELLz6SLlk3uVWueekI8hSLoRuvZkTfQcgzB5/3ZnJMVSzjw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a70167b cx=c_pps
 a=iBoLJ+TzW6OYwHE2Vh/RVw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=Q7J_BWS0j0Z7kq5DsWMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAzNCBTYWx0ZWRfX7LWtioeTMvl/
 Zg81LbqWDAX0zBVgwdjMXFMZDRYP06ywt12MOO6GE+3L++/VvN/g8VTTivX2Q6X5/xOJ4F7QArG
 s91Kt3ZnJlgVm/ecHIklxWZpHw38G5nWPaGRoI3F1tKMEOesiKlfK+4UoFdWHWKPJQz2FuWKEbT
 pzRKtrOMy33C6l2XSW28Xi1ng8BG+LOwJcrevq+QJbSHTAhw9MB76t89bcMLjUXfX3AMPg6/dJa
 YDNPann6KtV6dn+E57qDfaXfFF+p+wdMbI1YyJs3MWofl0deqKvyAT0LqBP62Q35cmpz9NaDEkt
 he4ShO+ALP3rRDa1lkicPNz0nK96pOhdtGdAXl/5hm8UAPtALAsVDJjhJWz6b2ZMyOzcvHSWvb5
 yotH4bGTVT/IZYvMc3wywnBvhugE+7ALhaWzgovJSWh0hlprH1b50cR4+Ed6A0cqp9gUBW7KiMD
 MHVdWZ/9jvPNQd2dNpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAzNCBTYWx0ZWRfX17i5z18vk3J6
 +atb2LIk7SiQ5ywNTe1h1qEICCarZ5fQgtW+YP0yrSTk26XIavpXNUMCfek4n1JAPKMnzxulS71
 u0qjuEMPcquNEc5bxGj4MVf9IrpC39mZXlge/TNXyS5Wp4/S0d92
X-Proofpoint-ORIG-GUID: qTnH4WTA4e6ykhcmLAarU4WahkGr9FAl
X-Proofpoint-GUID: qTnH4WTA4e6ykhcmLAarU4WahkGr9FAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 04:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242596

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Enable the necessary CMake flags to build and run tests
for LLVM, Clang and LLD. Install the LLVM target tools
needed to run tests via llvm-lit inside QEMU only when
CLANG_ENABLE_TESTSUITE = "1".

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb |  8 ++++++++
 meta/recipes-devtools/clang/lld_git.bb   |  5 +++++
 meta/recipes-devtools/clang/llvm_git.bb  | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index d55c59ffa0..a8c5e8cb2d 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -75,6 +75,14 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DCMAKE_STRIP=${STAGING_BINDIR_NATIVE}/llvm-strip \
 "
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+CLANG_TESTSUITE_FLAGS = "\
+                  -DCLANG_INCLUDE_TESTS=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('CLANG_TESTSUITE_FLAGS'), '', d)}"
+
 DEPENDS = "llvm-tblgen-native llvm-native llvm binutils zlib zstd libffi libxml2 libxml2-native"
 DEPENDS:append:class-target = " ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
 
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtools/clang/lld_git.bb
index ba36942790..8960cac2d3 100644
--- a/meta/recipes-devtools/clang/lld_git.bb
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -19,4 +19,9 @@ OECMAKE_SOURCEPATH = "${S}/lld"
 EXTRA_OECMAKE += "-DLLVM_INCLUDE_TESTS=OFF -DLLVM_USE_SYMLINKS=ON \
                   -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLD_TESTSUITE_FLAGS = "-DLLVM_INCLUDE_TESTS=ON"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLD_TESTSUITE_FLAGS'), '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..e7823154b9 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -80,6 +80,18 @@ PACKAGECONFIG[opt-viewer] = "-DLLVM_TOOL_OPT_VIEWER_BUILD=ON,-DLLVM_TOOL_OPT_VIE
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLVM_TESTSUITE_FLAGS = "\
+                  -DLLVM_BUILD_TESTS=ON \
+                  -DLLVM_INSTALL_GTEST=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON \
+                  -DLLVM_TOOL_OBJ2YAML_BUILD=ON \
+                  -DLLVM_TOOL_YAML2OBJ_BUILD=ON \
+                 "
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLVM_TESTSUITE_FLAGS'), '', d) } "
+
 # LLVM debug symbols are very large (several gigabytes), reduce the debug level
 # so they're just hundreds of megabytes.
 DEBUG_LEVELFLAG = "-g1"
@@ -118,7 +130,7 @@ do_install:append:class-native() {
     rm ${D}${bindir}/*-tblgen
 }
 
-SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', 'llvm_sysroot_preprocess_testsuite', '', d) }"
 SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
@@ -126,6 +138,10 @@ llvm_sysroot_preprocess() {
         install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
 
+llvm_sysroot_preprocess_testsuite() {
+        install -m 0755 ${B}/bin/* ${SYSROOT_DESTDIR}${bindir}/
+}
+
 FILES:${PN}-dev += "${libdir}/llvm-config"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


