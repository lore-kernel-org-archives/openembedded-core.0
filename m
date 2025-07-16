Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F2EC83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 07:21:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16105.1752650503125096380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 00:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9292a11c7f=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G5txLZ1986884
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 00:21:42 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0skjr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 00:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPUF7gIbPB/HuPbNXP3qQxpngUadgwsVRA/pYxAOHND0L61t1r63Oae9BhXMY4RxuM43iwc+TxD9KObsPKXteUDCnIf5oeV4xa/K6tqcVlmHwHiww/OJ1OH8ELC5zyV86kQq5YysChEPhFy3XP6Gajxj/pl6XT9IEc0GtA6UIDgWOV9uC4ZuW/YLeCEQmRK/qmDmnma8BIDIKHV3g4WWd/H9NS5MA0QKhD3/Zqqwe7qiwplkyKLViJ8hyS6a4b1aVVEE19Sutomm3TvSZBgbW/djUj0yeXMdiq6+gj9A4IlQ138jTXc7tcLiaUqyuyZX74Xjo5UyJjL+wa2vyAzSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOFbcNq8MbNOGhvCiTtkoJm635SVLM7ougVu1+BwD6M=;
 b=s2bjv86YrN4UKeNfz5KFhRDTi3MN6e5I3t+RKgcWPQ6O/TcpcAUZIhmQj58K8ObBaO45uOkDeQtaFKUc9uzPOqKGs49B1qZqxhu3c+Q7e2AJi7DsnrZaFABRAdhEBTaG04Rb6vJs1seZ1jVFCH/Vyyyb0s1szRjKAIhu2ExenM9GVy5HoVSd/EI+LRRxcpA7YDetGxr1Vt4whAdWnznaWSJe8/+hz0ZAKL/mkLiidrF0tNkzPAtOJ+yXzaYZ0XcjMhVwuXnMyA+qTdFjoEx+tOneF3vTUINyBRFt+RF0j4Q/6YhXXmWReGyGOE4TOeZSZgXJyExWj+4tmaUvIKCr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ5PPF2E3E6CCA8.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::81b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 07:21:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 07:21:39 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kernel-devsrc: copy arch/powerpc/tools contents
Date: Wed, 16 Jul 2025 00:21:29 -0700
Message-ID: <20250716072129.1041493-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ5PPF2E3E6CCA8:EE_
X-MS-Office365-Filtering-Correlation-Id: f4790eb8-b734-4d0f-e702-08ddc439683f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MKy02WzBom9ROnpB1J+9My9P/D0QTfzRz2W3PHavYTRNtmYEs8yv20Rs/SFq?=
 =?us-ascii?Q?CjqYr8CoRr6ygG71kklZa+Zim/8JtmUa50uOHvyj7CionmMesYukhAK2S4Fw?=
 =?us-ascii?Q?Mro8xGCsoSUEvsTj30RCG1KuD7ICz1zSHXRAgmrP2uKAxiAOZqtQyrOYWWxf?=
 =?us-ascii?Q?FeR/DQUVX2R8Q4x+dLX1swc/10yEIX3GPs87tcblMxSkpOk3ZQibFlmbJnwu?=
 =?us-ascii?Q?+yFYKDoC5bnRqBl+lNoALsqN1EDWtuEp3LxsE0l5rsGgpWP21mFnmXtYHBwn?=
 =?us-ascii?Q?zJ1v4wa9ySP0IhKRiPBzlVdLevvkXzacI6cficjGcxXa/shhG3hmIwQZYvx5?=
 =?us-ascii?Q?JPe0J7CYQ2U5JqM+obgjJT8UMhZBW9fsvx0Kkil8LfEUfNGVo9qL1/db+TWG?=
 =?us-ascii?Q?JYSN40PQ3+yfzj6/u8LNAWOWmAWiz3MsIr+G8fGj19wm4t4zd4A5ugwUgr3g?=
 =?us-ascii?Q?tGC9bdDCnfc5WKPTCsq49iSgpQvfNqUsWDNQgdvB/U/RTjUmofpCCGYm2ISe?=
 =?us-ascii?Q?siFrMvk7eiU2yq64NNSYJOslPnNxiQb4IceHij/RbMZAe5iz1nieDbSH8Hxw?=
 =?us-ascii?Q?jQxiXT7mzrP2h3dsAuAcC2t683ug1eegiO0qrgEgsTJp7mTnK2AtfgosPlwk?=
 =?us-ascii?Q?etl67og6kZw0M5eXhYj0s9V8xHU9AcTNK2dMbygbPy4gqp5Z0X7hflkfwmsj?=
 =?us-ascii?Q?8C+bn3z07QsE4l8d8GKhDfQpIbeDl3ts56MptZlY2Ybtjy13xLLiH3P+Ie8o?=
 =?us-ascii?Q?XT33WGFkLiWy3TiRVcmOCAPOa2IF+p6w2Sojf0bRA2xiij9ddPlDql2FB+FP?=
 =?us-ascii?Q?JSdI0i1zNhvXFauMrDgv+ezHwZSjifvJNz5Ph3VOZgLH3KWLX1haspdviUPZ?=
 =?us-ascii?Q?LhqaRjA/Vm+UjCBGplzIWAsv6dQRk8oeTNFxlUZwkRs2MDsegaYNjQsuNh89?=
 =?us-ascii?Q?Lu+JdJYIOJ5jfvS3HnU+havPTNKx5CuHf7NvIIIAqiuG6vD3PBeSbS4zujMM?=
 =?us-ascii?Q?dOFPBYWuzcocGk4alvT4QzcUqjValS86ScZMEy9zH7WgoiG5LiQ3Ul4sUXed?=
 =?us-ascii?Q?UNTDHYVc9L/odQBp4HabKgKCDczOPb9Zvk05lTNzjrmy8rbWcGab8LfZIiYY?=
 =?us-ascii?Q?aBoX0WG6rsYtKOwftVJCMmSU2LJtMqmg3aQrw98j4KUjzA7COHIrfW4GAFtx?=
 =?us-ascii?Q?jM+wB7NDfhj9PDlkcikE1Ub26KyRnzbNz+30OZB5I7RSUlzL/fWdp51i4EA7?=
 =?us-ascii?Q?xPc+eUDrqT5/XFLelXnnwUizsYgMFd8kMD82RROue613Ntx8/ejiGkvM90J+?=
 =?us-ascii?Q?CEEY8O2UFTr9a1XXR6Ba+lLeiBnhoXAWSVd5mIg3COBkgQoU/OPZ0yFJ2Ec6?=
 =?us-ascii?Q?icJqn3AVdPdxzCn1ph/jLModgfMLnv80DVhdJijEa7HTixfgz/jLU9Sst9Xl?=
 =?us-ascii?Q?ykdeMLtWfpnP599s1wLFJQFpCCKdSpuq2ybCVFj+ky9BF8o9FJuYBb/7auEr?=
 =?us-ascii?Q?4JtbSbLM4AC55gU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mo1U9EcdezJujpMePRqM/vixDiI1xHz59HLVe6upANyZO27vIxicfA8VHyt/?=
 =?us-ascii?Q?AQGpqYbRHiPn8ddUHiu+RBtZMAq6+cQV85uKElKWiMPRapWD2MIPP57huE6t?=
 =?us-ascii?Q?zyafmGRvQ4Vm5kJpg2QNOMVd3LHvSSihou7nB/ism6rqDSiVRJkMQWJDzSFj?=
 =?us-ascii?Q?czN7g/yhZgvnjTRNu6TjWgCNk0Vs7AcTPYjZyFk/Y6cpErm38dVpNntFTgDH?=
 =?us-ascii?Q?RMqmAlJrboSJcZh5AhsgVX7ULFjr+nG3/gXPoFAyGaNVCNQcexZW/SmKDgql?=
 =?us-ascii?Q?Gk0rcDrJw4gJj93cfggfbXX+b2Xk06vYOrHk1lv7L5DHJJxTUMriNrCHJLP6?=
 =?us-ascii?Q?OZcmZ4FNKsnYAZ4xkT5vp+YMn60mjvQ2MY1tkbA4l/H7fMnWlApFYDievZoX?=
 =?us-ascii?Q?9rOUN2N1ODp4WYfx2qnYSmPhcrd1iZEGNDMFZ6AG5wAiqYKMa1if8o763yH6?=
 =?us-ascii?Q?9uxnKCp9bLHGBz4PAd+Rq0K2AMy1b54LVUCxAxO/8y+rVnGtK5Ejz63/97Y5?=
 =?us-ascii?Q?gBRX9wEjHAV79Gj32cmzpQQecvYLUXjs4OkMbZEv29IUDoXaYMaWk4B9vKoY?=
 =?us-ascii?Q?A3O0mzYxQu3LmKslkPjyBziwdoEqdtd7fDyh8T3lDY52X5I88MpNhdKEVd9X?=
 =?us-ascii?Q?2jJ93eO+wP058qP2aOXDJQD5USwj7+5wVOJ1XiYlXjvwHp+JogaLqJ5Rub3X?=
 =?us-ascii?Q?6fBDGVI3QpPDfYN0u04nZ/QjTIO0zQSj43DL2mwcu6UXxaajECoslk87R2Fz?=
 =?us-ascii?Q?KEHniLlRR6vjw6vSjUDZcQtj8UUbd/aKyehCngBg8hRxHAXleFcAhbp1n6Zc?=
 =?us-ascii?Q?xtqkNd2z+XWw16ocmvCpMTC6yuUqomFCBrLEqnJjv7weXH+y8KutZwVuSCu/?=
 =?us-ascii?Q?OtmMiOhFQ6DW3/OPXjHQb4oifM/tCruzbAB/Srbadyi8MkbsvPi/1tggiAhf?=
 =?us-ascii?Q?allrkgeekAq/p2Y4EuKgowrTyJV51fzdRUNIKIqgiFy7uujLoyYTKdObXlYv?=
 =?us-ascii?Q?L05YmM6ngBe9CrA3veqwJBpjGCjn5fzQg5drsU1hP02xVzEd/laB0jzSjXEX?=
 =?us-ascii?Q?scB5IPH43jEamhfs+wQ9IhHiLCqMJgI5jWVSGr7nrRe4+yDHa2krxJRx3/P1?=
 =?us-ascii?Q?K8DzV9zecn+vQ6UbUp/HtES96jm/qKxnclKVGabufLrDRYvcDdOzPRX4wJtL?=
 =?us-ascii?Q?1LnBlUzbyTkyUIn4C5v9cYst8X24hatputKURW/jsDPSPAQLxAXMpplINB56?=
 =?us-ascii?Q?EhgpduA27XM7CRTyjlf/xqt9ctVbNiEAP8p8RcGvNfz6znjzQFs4yX96C9YN?=
 =?us-ascii?Q?f4u8IgEBExKKX7uTh4e9nm+1tm7T6b3DpB4h3COryv3W7rjNj+jKBiRlMIF4?=
 =?us-ascii?Q?ch3O5nUo9WCZsQ++OOhK+7CfQiJVEEPKTs8DAxCyUdVcMPpRo3tLIQFmKGyt?=
 =?us-ascii?Q?fBuT5LjN4EScMyO6izFAdHbcfQZorIqflSn64UUtHsGoUIoYu36rGAdE+N4M?=
 =?us-ascii?Q?vwByBXYceNZcaBTVn5AzdCTkqEr7v9LzyRkv8WVAieToV9whE4na2hSxGrKX?=
 =?us-ascii?Q?xmbpwvlG64JtuJlyDY9z8wmzt08ljdK/ERi3bqI8WrM68A/Z0QIwlPCqJAIE?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4790eb8-b734-4d0f-e702-08ddc439683f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 07:21:39.8466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4O+sP1rU1K2Bb7wkuTZbIHp4KMCWvGwbaQnzRrdaqJ4N0tO4RRI18aind1pqLzi7uWDmlRZdjjCAuPFtfUH3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2E3E6CCA8
X-Proofpoint-ORIG-GUID: H9qwjIWCLqDMpWArh1JwhqouJlp7aKun
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=68775306 cx=c_pps
 a=GpWy07DtoBovIBEllz2+IA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=JWDwriL19-fPr1t7ZWIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX7Rywe8gW6RRy
 DWEqpRVSFE97c5BcvystM9pr+laz15GIcACIYbz3v6Jdye0L/K9xUA0v7hNt3IaSqwbYuT7ke/6
 cDoliiVbEyPG/aXLMTy5Vq/EJmuWF7N/CHPCBL0HU20ITtaymOyEFUzsK6HR5yrSp1IFQ46IE4t
 dPuuYiZRKatfiM8OquefI1jTi5nhasR+CmqAz6c0OkFCh1wavgH3wb8twuLHH5kZxHwCwXZu2+t
 G8vAVGnsUWQL6Yk0cNC/gRc/4upH4N+lt+PQi8TmwUWTo0XWX0dUtgXp15SqDg4a7qjgKHuqfOj
 2LS54q885nUqlxA0b2KqGcgXFcOquexUfCWXJk4kRCstnIU4yKGqgTfSJMolTzTMEpQZMURlMgO
 53IJGCK9
X-Proofpoint-GUID: H9qwjIWCLqDMpWArh1JwhqouJlp7aKun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 07:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220434

From: Chen Qi <Qi.Chen@windriver.com>

For now, using qemuppc64 as MACHINE and building things inside SDK,
we'll get the following error:

  ERROR: modpost: "_mcount" undefined

This is because after [1], MPROFILE_KERNEL is using arch/powerpc/tools/
contents to do the check. This in turn affects HAVE_OBJTOOL.
"""
arch/powerpc/Kconfig:   select HAVE_OBJTOOL                     if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
"""

The current MPROFILE_KERNEL for powerpc:
"""
config MPROFILE_KERNEL
            depends on PPC64_ELF_ABI_V2 && FUNCTION_TRACER
            def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mlittle-endian) if CPU_LITTLE_ENDIAN
            def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mbig-endian) if CPU_BIG_ENDIAN
"""

If MPROFILE_KERNEL is disabled, thus HAVE_OBJTOOL being disabled, then
FTRACE_MCOUNT_USE_RECORDMCOUNT will be enabled, causing this error.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=abba759796f9b73eb24df9b734dd063839fc62e0

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 3d2eb3929e..c4b5d0e5a6 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -208,6 +208,10 @@ do_install() {
         fi
 
         if [ "${ARCH}" = "powerpc" ]; then
+            # 4.18+ needs these files for MPROFILE_KERNEL, but don't error if they aren't present in the source
+            # See https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=abba759796f9b73eb24df9b734dd063839fc62e0
+            cp -a --parents arch/powerpc/tools $kerneldir/build/ 2>/dev/null || :
+
             # 5.0 needs these files, but don't error if they aren't present in the source
             cp -a --parents arch/${ARCH}/kernel/syscalls/syscall.tbl $kerneldir/build/ 2>/dev/null || :
             cp -a --parents arch/${ARCH}/kernel/syscalls/syscalltbl.sh $kerneldir/build/ 2>/dev/null || :
-- 
2.49.0


