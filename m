Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C796BD63934
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 12:20:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12008.1732105225961833396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 04:20:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1054da9f2c=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKAM10g006399
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 12:20:25 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xgm0m9a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 12:20:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHQM0wOvIAzKAFG0jAraGFnZOK9s+DDB7sb3YYJjOnA2D5pJOVcEgqogdZ4fawdLHQoyzJMUjnOmXBO0P/CcAdAH3KzQMpE8GFh/wPsf3FjhajnUWXVQ64H0DTgINv1C+XZja7JfSJ4v+1J7A1SGGg49IVMTMXQ99w22pUTa/plSR3v8uVHS/ydwFAI8v2ELpjj6t10yUTFZSs7eX/BKBagLu+NY8qSmMEqfnR6s9GKk6dve7LlkPZQRuei7nRaybX49yn0/tUcPAnqVy1P7bbXWOkxGGsprA3I3IfArFur9x+2Fg7rSwSMb/NrKhko5mb+B/oweClUmCPqWkDYHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egaIK8VRadC+dTwGZLweHagfO99qrMQeMu3cJiQPXGI=;
 b=oEXU/34nmHNoUcVnL0Sr2w6sP75zDV/c/QVXpyz4kqwgtNddhKRRaai2Fq/Ay2WaTQx8+zSG/I5RDN7yLL8pstHKbjJlR/BgyQsTlMViKg9RztL4qYko82N6H5Dxyg+ObSGhqTKRQ4DMrq6W0coYkeW/D8hYC2BrTyjBYzgLGe2v+lLpUjUVSsEX0fyJwOnws+dEJxWPmSPaJqmOM86f232cM2sEXv7ocZqAfo3xdK66bHZvqoEWo3kim6L1GBQW3zhbYOZgN2z4E3soKz5kCLwVgcf37mpmIrM3cWH0j/fqAD3hqhYesCaf9k5LPUw9GVtD60o8rBKysJKeMQhASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB6379.namprd11.prod.outlook.com (2603:10b6:510:1f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 12:20:19 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 12:20:19 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2] linux: Modify kernel configuration to fix runqlat issue
Date: Wed, 20 Nov 2024 04:19:23 -0800
Message-ID: <20241120121923.3675835-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd080cd-02f2-4e40-28bf-08dd095db2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NjaQK3CFqsEnu1Dt1kdhIOkwiinqNli6TLDmMWuhvW0K40FH7dnh869YE0pE?=
 =?us-ascii?Q?rb14zjD1szmZ+q/6ZXRGJjRfz3+mRsrskn/oasR9rvffJIpGNLnuJKFNXHkP?=
 =?us-ascii?Q?vUiFOxG5Ox2NwL+ylmK8GdhgSNHqTljV/BjGn5rnn+Qm8g95swxyYNmCgg/8?=
 =?us-ascii?Q?si77gN/JMOGQtjiDvszZjidvV2O74JbPqX0ASwuEZ1esR2vrGnMxllJ1rdE5?=
 =?us-ascii?Q?Von8x1GI1/13LbHJRydxp2+jtjMfsLeDvC/sj7T1YlVdV6NUlXU0g9HGls0g?=
 =?us-ascii?Q?yMRXBQUnwMYBs3fKCeqQ+YPNC0/VjGulj2IkYJdriQ4c3ry9P2ahMAtHdnk7?=
 =?us-ascii?Q?lA6Le08vTauu3IEzPvNsEGK/PcmO1ANsGtzBcUC6mEgHESXcBlYx+HTdK3zs?=
 =?us-ascii?Q?RCEf/L7S/qzyzRXSNsSaUQCQSh/QWdvSeLmfs7tdIa4H/O8hoQj0UIrvH8Yz?=
 =?us-ascii?Q?lHnDki6PFltbwJFCYTMgxxUGz3JO1IeabcM4UX5+ITu/zClveyyTaJ+HyxJx?=
 =?us-ascii?Q?4Hfqc/Q2v2KpKkiEIsKEgX0+OuwxpkBer1NgIpaoxbJx2CsD49eHpf9tMSCl?=
 =?us-ascii?Q?0ZEKZtLO7IR2e7SIejolVEw2IzSq1QITYlXkIJYUni9CkYp+d/bZpDWdxf15?=
 =?us-ascii?Q?/ldG3Cj2uMNsH50/7hRCV6t75y6NpwtuapxBY8/nX9u0Y7dQpzCgCqqDijxc?=
 =?us-ascii?Q?LaxSgVoH0TgkbfEiVcFJ+qQMM2QBxuTuehv2EkLkkWDMHmT67z7yYy8FVF3I?=
 =?us-ascii?Q?zF1Dy0hzTh46u51HHu6WTneHk2cLgO0SHjnIzkCp1gu3RVcnxaguPQD7tJZM?=
 =?us-ascii?Q?AIkgdQNkpfbBDbDBHMPRalCUkx8LSEePWNpghOgUC6oggahb8wuFrB2itswO?=
 =?us-ascii?Q?k/IvNuDu6uTryBdOhJEntNUba2YDcQdx7UfRAmRCcR2zMduygac6bB7H9T12?=
 =?us-ascii?Q?5WantYKkgQKBbeyXJ8vUZvvC3h1wCsjX08rFezGd7L1h7/IfnZFIs3inauDu?=
 =?us-ascii?Q?RnGEk/EgX30qhgWbDnBIbICFjLYD1EBVPJXUXkAIG+Eh7meBZT1Ufp25IOp3?=
 =?us-ascii?Q?pMt5e6VBstmW6ob7J2mQ1i3qr67gL7WmCxZKa0eq+WJoeJBUufZzU+BVwdr5?=
 =?us-ascii?Q?s7i6Kly3u3m/JGiPJ0NQ89gsWIFYpJKTapr8MjbiwtkyEg0OE2ssuby4pC0i?=
 =?us-ascii?Q?Xi+6E1n898sT1rosfDp0I9I5B/eG+RoXDmoKICVRappn+YaOVcOrXK9mnraC?=
 =?us-ascii?Q?3UUiTe3NjgBBuwKFZyOTYmB9uxzCbnkij7cFihLIZYOX1mQ+sfQyk47d3NNW?=
 =?us-ascii?Q?ja7mNm61HsK2VK6XraEpQOBa0mFOpyjg58jatvVj1AgJWg1r6+q8NV/O1zfh?=
 =?us-ascii?Q?j4Se7VM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aiWJ0zqMNS5ukWeCfzCXCGQ4yajRebm+xsrDt7f4n9zWfVqOs91Id9HzG/yW?=
 =?us-ascii?Q?bnuwfClmHgnB8BRxwnNJNvfFTTgvhLbJv+OBIIcdE8gHpdbLVwHQ8Uza6wT1?=
 =?us-ascii?Q?7qO7AjAZ/XCqSmWPNsRog9eOm6Ssf0mjhr7BkgacEB5R+Aq8UVklgPlcRUJr?=
 =?us-ascii?Q?oGYUsGk7PCxWHqzlLuGf7XdlH+ZyNxVjDqzgui59Fk6zUQgo04y/AJ+Jrhrz?=
 =?us-ascii?Q?jmAg9ztzev9qQkM3AkDB3yWo4J+mQC4AWhCwU8FxHT2a+A2zjRFfRFc9ZTJp?=
 =?us-ascii?Q?m1eNY74zDIeXh8rSZwlO1Qp13ddtJjkM70mXT8OLM2N6LEt3Ua+lKTq65Gxq?=
 =?us-ascii?Q?CGAVKUSOWWtJj6C/pvDehiTtoo6Zh8JtF4kPOvpC5Whk+TJvn97dJMw/piQv?=
 =?us-ascii?Q?6hkuUJOiOHfk8A7f433yj3Xcxgh5MECCD0easX9AWiqjtO43RTe7DTnJEhiG?=
 =?us-ascii?Q?4B7W+oTIv6h4a3DJIs3iUa3ZKBn18XIGQCmm81cqeE5u19A6598RRTmjwt7o?=
 =?us-ascii?Q?XR4YHSrer41ktRNQG+LSMOcyqLHu1XeT0//zoZGXn11ThcHUfDpyHudf3Sno?=
 =?us-ascii?Q?nIwQ9U7WwzNF/Tk0iWJeJ6MtkYUtPxX14w24hj2MdpB5BULHbANotAOOhi6s?=
 =?us-ascii?Q?xLC0qx5gIg7zLtquUQB6bIlkWec3oZYmkE5lq+24HctRwhdtKozarXKhHpfL?=
 =?us-ascii?Q?9REtEuxx02hixoUJ1syX+xqL/RaJPhEyRH1+JPvfWMfluq7xCn1nuqsu5wwk?=
 =?us-ascii?Q?GST00DL0u1ZOiH0LAV3MOL+mhL9O53khysJV1f/b0Qw+zFa+0B/cIVz/N+x2?=
 =?us-ascii?Q?LJYUT1GcOsE3ZdEQRqIIKYvbOR1muxWJVg3e/HuvmanZeJ7CWcnvCcFu4zOv?=
 =?us-ascii?Q?+UzOi80Y2CKiYhev4Obq6b6raTjJjqoDhcRsDqHvUbFv4OuE4HHPhYluoTg6?=
 =?us-ascii?Q?MQUa17UxyLVpmGpHNdS7jjQYCWtrTqIfLqtobhOULlHQnd0L7bE75tq9vP55?=
 =?us-ascii?Q?gik5l2fn1zXj1fyhCKnM+h/3L3aOAog8vyA8mYeWIxuvDNVW0txJ5zVNUzZi?=
 =?us-ascii?Q?tjpDoDqYTdCGXvx9VNqID4GUepaLtHLggbN9+baAUmZj96KrSPm1z9JZb+kb?=
 =?us-ascii?Q?KBGGFFv7R0JKJds8wZh1VbxhWv9sKPcihLawH7glDYpeYlap91hwfdHbIyHl?=
 =?us-ascii?Q?EijPHCZQPYJhUOrvVveC2e3FsK/q1IzC4117EKgsNquZxX5ASbXMo8Ju3ejz?=
 =?us-ascii?Q?IuRZMNgZfvwlk3ljiRviQgAWojqGpFPB9pjx93wMl9jqMOCmRsQ+P/fF9e0p?=
 =?us-ascii?Q?Z79AttLOqPWgvZE443Oz2Imqla4fRflrBAacktuvon6AqX/wkgADXpQlawYv?=
 =?us-ascii?Q?+4gRpCMndHvFqRDizRd3W42hseE5SltuxeGPx1hKJLmfyLhPRuWPfAPlZKa3?=
 =?us-ascii?Q?O3ReFDK+asS+FLEiIfOfoYAeIQSwBMPRgoMucinKM30+swypdCFP5vDXYcyI?=
 =?us-ascii?Q?nYPZvY7Wk0HFXbe8ASEVfJujMZj5od4nuDXis9ctM1ID4zsdwJmMuAZlztd6?=
 =?us-ascii?Q?sBmRyKL3rvJuyyelojV4jyOQ6sxkocgk+0LazqiAKcQ6RhKq+aOdH9jTwn0e?=
 =?us-ascii?Q?qI5wxSlvEoBaUOVXXGuh6lk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd080cd-02f2-4e40-28bf-08dd095db2c3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 12:20:19.3228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRa+8ZlyNp8O+zBCBouF0UW4awLw+qQAwAuh0/eW++1xmprgY+4rF+4c1Advz3KEMg5RT7DqgKGw7NFwcz0HlnjN3kJgOQhFDnWRueIbqwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6379
X-Proofpoint-ORIG-GUID: fSsEOyg5carp_ITF_0JQPtSL2KCvXWNh
X-Proofpoint-GUID: fSsEOyg5carp_ITF_0JQPtSL2KCvXWNh
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673dd408 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=Jf6Y3I3nT7eEx8tqo4YA:9 a=VcHDoJ6ZNalb842AFEep:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_09,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411200082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 12:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207423

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In Qemu Running "/usr/share/bcc/tools/runqlat 1 5" gives following error:-

libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
libbpf: failed to find valid kernel BTF
modprobe: FATAL: Module kheaders not found in directory /lib/modules/6.10.14-yocto-standard
Unable to find kernel headers. Try rebuilding kernel with CONFIG_IKHEADERS=m (module) or installing
the kernel development package for your running kernel version.
chdir(/lib/modules/6.10.14-yocto-standard/build): No such file or directory
Traceback (most recent call last):
  File "/usr/share/bcc/tools/./runqlat", line 293, in <module>
    b = BPF(text=bpf_text)
  File "/usr/lib/python3.13/site-packages/bcc/__init__.py", line 479, in __init__
    raise Exception("Failed to compile BPF module %s" % (src_file or "<text>"))

the following patch fixes the error.

BCC test summary for x86_64:

Before applying the patch:
 TOTAL: 95
 PASS: 29
 FAIL: 66
After applying the patch:
 TOTAL: 95
 PASS: 79
 FAIL: 16

50 new test cases passed

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 9b2334afd0..d678bce254 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -64,6 +64,7 @@ KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains("KERNEL_DEBUG", "True", " features/reproducibility/reproducibility.scc features/debug/debug-btf.scc", "", d)}"
 # libteam ptests from meta-oe needs it
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/net/team/team.scc", "", d)}"
 # openl2tp tests from meta-networking needs it
-- 
2.43.0


