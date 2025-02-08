Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F5AC0219D
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 10:36:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4912.1738998386336064073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 23:06:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4134853cc3=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5186odtQ008670
	for <openembedded-core@lists.openembedded.org>; Sat, 8 Feb 2025 07:06:25 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44nx88r4vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 07:06:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIZyWsPHnarp+fhAFaX0eA+8tZ1IIEVVSE74HVJC1fKjwn3dGgDBPm8QuxO1lsWgJyxcwhYRhgkA/xZ9URwhdY8bkPQLNPBNKS6EYQPuFcgLkuzVKd3V4hUbfa+kRaqSIkLlPXLcnY+BWPnWA07gBrUIDomaNnXhu4KK2iD9gLWojg4hscf3rmuIZbSYCZIjm1BH8sf4VRyxD9ak5T/HPmayyheaKdbll6GZJGseDFd8q/EIgi9icOC+T70BqWfXbLSopsdNZNAVmJ7uA2ZNqHD+F7EdSjPnxSYKnk3EX9FyRtzlL+iRPebtS7wiCyvriVJnQUUrzh5XscrRoshIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhPP0v2QZ13qly44pzLbjszmEJEL42Avg8sbGuKAoCw=;
 b=XfwbdYnauIWX1SIRGbAIbZwGT3jLFhw+zXwE00OlM/WJNkktioW1+19yBzTKD9I8oOrjhN99YpgN20L6Hu/wmtl5jeEwmiYr1RYKPUjak1ZFW2yEmxeKOrpNjl+mVoSEwqNMLQXtUauFewcfE6EM4ls1n439qG5CiqEFN7zhHZr3Aqxd8J5RlCiydH0jmNAD3qeQmvO03X4qNDb5jXefs9LNx6YbkPYwU9jW5XFDPY01bytaiVZX5TKnTGwt9aypTs04+dMn7hDIBTYU6XdjxU687loga/Vvjrsn0xZtnyQRiPt7cSumv9l46Tm6GxYBeE+M0/LhWcS4366q6IAx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by IA1PR11MB8804.namprd11.prod.outlook.com (2603:10b6:208:597::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sat, 8 Feb
 2025 07:06:22 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%5]) with mapi id 15.20.8422.010; Sat, 8 Feb 2025
 07:06:22 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH 1/1] python3: Treat UID/GID overflow as failure
Date: Sat,  8 Feb 2025 15:06:05 +0800
Message-Id: <20250208070605.3478960-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|IA1PR11MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: af51b95c-c0d9-4d14-6352-08dd480f1854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gxkDHZkK0gvn1uNWb/nfXFIrytuWGZambRWv3m/WGEJHR4DD3sf877JDPW+Z?=
 =?us-ascii?Q?C6xj3VxYbcroz+moF74bDI4gQ6WyG+i6UhGbv32AG5f9WPzb2Gtr3rixkN8V?=
 =?us-ascii?Q?AT7E1v73zDOrL8lQkBLp3aQPRSi2KvRPmc4VLhIj2uyaC9ooqXhEmFJ1enfm?=
 =?us-ascii?Q?xyRe+6hxImavLj/lrFyA80RTpnQFDZZgLG1XwAnLTu+dTB2QEkN9jO9FP6gn?=
 =?us-ascii?Q?lYs8qqmEVd/oiKgslo96jJUL/5SP7E5cKt4HEi/awqoPo4pCloGTORWo9zfE?=
 =?us-ascii?Q?jBaj/UwTF8LXioC9ltiJukbsuJS+0DWz7LBW0yeN04iNmsgJ8guuWq/eeEZ+?=
 =?us-ascii?Q?a67NDYrgYuFuLSCaXl0LiIpglog9fU6G7FDBYYfXYBxb+SKEDq7+jt/9gC8F?=
 =?us-ascii?Q?OHe7Ne+3AuI1Dqj/uSGaoclFOF5YkiYcD27xKE+vKfAMlFGwSe957l6ZTWxN?=
 =?us-ascii?Q?Nt4EyYgYWKkialFIVQ4eY5berhUaA0qFwCLm3Y80djapHg8u13MFYeQ8Nktv?=
 =?us-ascii?Q?CmE0bAxHn0N6ea6fiWN1UpdmcybYwvhKpRqWLmihhSEYeRdRa5H0POoneJdS?=
 =?us-ascii?Q?SrWx5bAQU+NWZCCCitKuAvzGsVcflGFr7aba+QUWtXkbsWpIRJaKRLqrHU6J?=
 =?us-ascii?Q?yveKVKv0ZdI0id9Gqb3U6lOZuxE2ztK56tEJ8P40GTMh8+lJc3BTtclFL9M2?=
 =?us-ascii?Q?tg2e7LaZ15a6cZiEmELmb/tU7DkGP3R/S40zuyY4KjNmSQmyqikX/OhiGJ+4?=
 =?us-ascii?Q?jddfEkATjbTpev0pcxtL5NljAAUj0FHnGrsI3UYd0xvPU//Et7MUMmN7XtHx?=
 =?us-ascii?Q?LLlg8bWJkhdLLs+j5IxvO3ukRuauRyRpqT2j3N1tFYOXBD24zbvZiIGkcefg?=
 =?us-ascii?Q?JEb4TAiN1xVvN34aq9jzHxpoYYLV6gajXCkcnWtX3QooNcmcm7nZ93VbfThI?=
 =?us-ascii?Q?ZWcLGNBuimI/rzILrCLZpZ40tz0IPKWGasi6gufnNRXSOG4PnBcGHyYxB2q+?=
 =?us-ascii?Q?3DUL2yc6I7ojweC29fjszunNYDq5g2mhQxTh7tC5J84hMVLO/h8jbMBjY3Px?=
 =?us-ascii?Q?WWMkgBpKMiwNjopX4UEe1Qoa7kPaJJwewrXJ0OwFRI/Rllrca+rEoaiTlVF6?=
 =?us-ascii?Q?H0ulMhxunOSJXEHQaxN1IHfQScw6C2KPZ4mIn9ZSowzEIlJGSMW8mJlE75BL?=
 =?us-ascii?Q?+Q6sloFF55cyi1Ah1/nL5ydcIg9FC8pAw89N43bn14SVQr/MTqaG8960A4Rw?=
 =?us-ascii?Q?Qm0qtiLxT768/A4PFtBSxeOExdsqG6nJ6GhRveJceIQNeQ52CLdGphREpyTH?=
 =?us-ascii?Q?dFZ3d0tRlJVvTndON/YU5+NfIb/5gf0TAf7GvyRWpfNSOxyak25SYISIWrG/?=
 =?us-ascii?Q?w6Lfo3Q4TCbyRYFwe23FDpjzJw7Kkgk8Yrh0Tfkr4q+RN9ykWCALUirmTKkT?=
 =?us-ascii?Q?CaEIvWF1+zHYPLkZHZxrOAxTwrDjkc8B?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b3N/NXQyf8K7J1zUiwb/Vu6p16PI8/cdCdF99NFmaWDD+fWTc9etPssLPMTV?=
 =?us-ascii?Q?fVkHm4wOaC98RJw+wfk5hMe6EInaUKyx0/QEhlOfMrkrbma1oGSVCDIL86sU?=
 =?us-ascii?Q?F/Pnvspl/xhawKp8CO36mbY8DJiuqZQc4kV+1JBq7hzXQwSaKwKdoTW6+AmZ?=
 =?us-ascii?Q?lFM/hz5uoh3FwX4gqoWH4jlTNyk+bweZELLpdD4MvY8QDRCB6HmXkgjqIsCp?=
 =?us-ascii?Q?Q51xZO5ENKCrGZxGX2jCTj8tuCXVaBMp+yzAB8f9LmPWmtqdoxPO5mrn6bIU?=
 =?us-ascii?Q?ijJ3QboRccFKWu5m1z1eZxlT1QV54OtLUFfe+3r8c41vZbCEJYIU2QZQmuDj?=
 =?us-ascii?Q?L1B0JrI8ka5rYj1pPIt1vcebWwlZZ/MO81DbsLeqYFtBbGPMJ9qeENnfWDcU?=
 =?us-ascii?Q?cRvPPJIZo+CgiHEC4VFj1x/teG1jpc9mrCND3Mk9o4g3NEic/p+tJ7cxysG+?=
 =?us-ascii?Q?TSg+q51NnADRi66Oqez09iYuLO6Jv+uSn3I6AoW8YMXjQxccZFdzIFz3pYtf?=
 =?us-ascii?Q?WEj4Cep8la+nKfznCSxU2IDWaT6JRNEE/FC2QCcA+t+O+P10QcIrSHeNJd1y?=
 =?us-ascii?Q?FQaFxHkoJpziN5V4riS8WuzMM1b0yiPXYntJVhq5ekCLh/tgsuEcnMLiTAsx?=
 =?us-ascii?Q?g0P/Yc/h+GIsRqwxfUXWrIdv8Mh8k+V7rxT/2RL8djSd/tVSDALqC81iXt8X?=
 =?us-ascii?Q?df4d5gGe5mO267wOoVY297eiYMjs1djQveXUienbC4Q2xBn/63IpLhD3LoTN?=
 =?us-ascii?Q?R5wMXa89vUo/to4tfMWgEFRZc2n0RD4Aeic63hngfE1F6j8Z3B8vY77wtrIl?=
 =?us-ascii?Q?prXKmqZKjRCoCHYW+8PqDpLzfomG1/Je8yoaPlBWcZfxH/ygz+YtnPJh1041?=
 =?us-ascii?Q?6rahb/vThxMxtbzkGPmQAZMBPJo3EPBn5F1VDHg1x2Lh9KqxcgWptfeVAUBh?=
 =?us-ascii?Q?cVDhmg+uOqEq3F/UI2ZDCQwmIQX1XDy/c2DHculNZwm1A+USYHAQ+Ua1bPVO?=
 =?us-ascii?Q?b/NjODLnE0u7vlFfAC7msG7Uf6wR7JDa300QwFDBkzo75WXh/MJ4VLHSY3qL?=
 =?us-ascii?Q?rKp8KM3OuRC3nDGO3L1QpxBaV2Hgy/5POkxQl6DuyBc8czJTbUc3bHovHkbN?=
 =?us-ascii?Q?6L/gP1/KP8hDcSxoCAXM11B+kx1xHQZhop7rhnBWbg6W8r0IVsV3VrXhQrRz?=
 =?us-ascii?Q?Xqy913PgJ1RMnVRuc48TKWlDgQfm+hQPMdn3eaCNjLgW5YQ2HG0eXWo4ZDMY?=
 =?us-ascii?Q?D4QjJj5pGn85RNDjNUKkKhCtliKZSU3iy9nbaT0ifgj/hfxCukIMQyFL+Eu8?=
 =?us-ascii?Q?NpZWC5ODATo2HD8MROM2kM/GQXTNep+GfEioCYcmps3Mr4WQlg4Zjh2KW3xn?=
 =?us-ascii?Q?vhsKSji/FANmQVUG/Jg3/PpHYBJWSJS70gCc7CZU2P21eWH9AkTjeBBHVSpt?=
 =?us-ascii?Q?TDP4NotooHHpnwONgbTs12NIGRVtSJjKavwcDRJjxuIhTJ++2I6GFg6yKVjY?=
 =?us-ascii?Q?UI5k0O0vaUGfTqxsgzdO1BouWs6O62ibeZoKEbEtX+Q4BzxGuhiGXwWDk3Eg?=
 =?us-ascii?Q?qVqM2dTvFumRy1QRQ0xo7wEyvzoMqDnghUQHlctb+BipGzzTMQnrsqN9PUJc?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af51b95c-c0d9-4d14-6352-08dd480f1854
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 07:06:22.8526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bR47Cdg5C/S300ErK2WPPu7BbR6wdcmQr9IfPCGDNPwbUklRdQ6QZpCPc28htn7Ho14ppmWEs5HFtMRm87z8H8TYaKmN+BMOLQ4LDWg3WcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8804
X-Proofpoint-ORIG-GUID: v9OneOd7PnXARPtQrcl4T774EFPZ-iBD
X-Authority-Analysis: v=2.4 cv=VZANPEp9 c=1 sm=1 tr=0 ts=67a70271 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=_Eqp4RXO4fwA:10 a=NEAV23lmAAAA:8
 a=8AHkEIZyAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=EIrPcrtY4r8kBtpbTc4A:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: v9OneOd7PnXARPtQrcl4T774EFPZ-iBD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_02,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=783 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502080056
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 10:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211019

From: Khem Raj <raj.khem@gmail.com>

This fixes ptest failures on 32bit architectures

AssertionError:
Failed ptests:
{'python3': ['test_extractall_none_gid',
             'test_extractall_none_gname',
             'test_extractall_none_mode',
             'test_extractall_none_mtime',
             'test_extractall_none_uid',
             'test_extractall_none_uname',
             'setUpClass',
             'python3']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43104b547cb79693c83df0882773ae8dd74b1d35)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...e-treat-overflow-in-UID-GID-as-failu.patch | 40 +++++++++++++++++++
 .../python/python3_3.10.16.bb                 |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
new file mode 100644
index 000000000000..88b84c602435
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -0,0 +1,40 @@
+From 999d4e74d34afa233ad8ad0c70b989d77a21957f Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Wed, 23 Aug 2023 20:00:07 +0200
+Subject: [PATCH] gh-107811: tarfile: treat overflow in UID/GID as failure to
+ set it (#108369)
+
+Upstream-Status: Backport [https://github.com/python/cpython/pull/108369]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Lib/tarfile.py                                                 | 3 ++-
+ .../Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst     | 3 +++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 3bbbcaa..473167d 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2557,7 +2557,8 @@ class TarFile(object):
+                     os.lchown(targetpath, u, g)
+                 else:
+                     os.chown(targetpath, u, g)
+-            except OSError as e:
++            except (OSError, OverflowError) as e:
++                # OverflowError can be raised if an ID doesn't fit in `id_t`
+                 raise ExtractError("could not change owner") from e
+ 
+     def chmod(self, tarinfo, targetpath):
+diff --git a/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst b/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
+new file mode 100644
+index 0000000..ffca413
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
+@@ -0,0 +1,3 @@
++:mod:`tarfile`: extraction of members with overly large UID or GID (e.g. on
++an OS with 32-bit :c:type:`!id_t`) now fails in the same way as failing to
++set the ID.
+-- 
+2.45.0
+
diff --git a/meta/recipes-devtools/python/python3_3.10.16.bb b/meta/recipes-devtools/python/python3_3.10.16.bb
index 19a85a8770c4..48f845b0891a 100644
--- a/meta/recipes-devtools/python/python3_3.10.16.bb
+++ b/meta/recipes-devtools/python/python3_3.10.16.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
+           file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


