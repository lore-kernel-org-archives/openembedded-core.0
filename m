Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95033F531F8
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 06:38:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12941.1776148693139926642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 23:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pKKypMpE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85643df1cc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4JCdf1736977
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=NN24K5cCa
	CMmQ8alWMv2E9ZtZGtcpfja51LGJj1hyNI=; b=pKKypMpEyKgXv2GRe9WU0NAC1
	1ibFQ/BpZgAhjHtLUDxFPjICSfRc8gcNohmUPIOAJeZu+SvQFZGcQtT6Lom5S28W
	UNJHV+1XCFcV1pQnurqh0nMIRDRqjzk5+MxgDJg9h/TFO8okz4zUElawnoFS1LoU
	Mo+jqBerGxGu85SuvNtr0Tlo3vH6pyRfYt8qYogYktQQ2w7n0UhfmNMpXwyvfF8L
	xOT63BbQ/iCBuDF+3OVAU1ie4JGxdqSWTyFXFVR2C6IM9OGGP6bn4XBgbq9ZwYQx
	tiiXm8Ufh2/J1HpFN+EVGXeZ9XLThBj06Bi9lxAVOP5/5u5NVaaBfGM/W7Yxw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877gceg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DO7Q5ne1Gj6twys4WtK9IyF5TYE+FEZZT3SYtKrkxVmaIvBAGlMJt1Yy92QTLz9cLPc2AAGD6YqvGyd1uzdNz6NQ62cnEQRC/GI2jpoNzZjpmQiYzHWxIhiusRlUoo9EXc5ef+Y4HCqgTUI4R8Snvl5dAr6L5eyR//Usk6GLy8my4ASsaS6HeQ5v/OVnd+fEvCF+4QW2bsa6QWJZVOlXBO58BUHLADno5Ljhh+lWvT6qH5MoVqPXZe6rtkcLGDSPx68Q4I5T4caIoQCaI3BkOJ9qEdmR6qHNiDkxG4mAtEsbI220wF8+5XO6eFFKdjZm4uD1rBfw2RwzllnxCXB7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN24K5cCaCMmQ8alWMv2E9ZtZGtcpfja51LGJj1hyNI=;
 b=ADZ5GbWbR3moaEiysV8pkk5pfs4SPFut/CZHw8LWeSAJ2blO69AXic35s/vLHz65WrJ3QSEw4M0g01rlrt1tgNqF4LXVcYbj4mqWAOEFTKlmKnajtKsH1ZBOBqoUnFV9kMqZ/l4MkkLC/D+XWGupLn0pSAh/RGVdeuC4eNSX1E5He4ricxkGTJ99m2GH3Ud0NW6MXc99Z8Zf6pc663dcf6zZZ2b+SfBxGN3hltnv7I/urNaadN3fQEzmH0PewP+EEWeaLAQqJLRaTdGwJa+u6LB5bTq3s/e0O6kVdNXIhWSy1vla/ShQkQoW263Eow2vM5hgDx4nOIlFRe0jrPUqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 06:38:08 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 06:38:08 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 0/5 v4]  Oe-selftest for Clang, LLVM, LLD
Date: Mon, 13 Apr 2026 23:37:45 -0700
Message-ID: <20260414063750.2315189-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: d0496a2a-23db-49d4-16f4-08de99f06422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	ciP0mELtF3oM0U5W3dxLQAMg5X6qGg8ADo8/9aafVgAV9wtRR9jMLbUbxnbyeUH9opOwu1xgsDPAYbuxZRk38r8Vbd0D7ZTvind65jT1cLJOQX5vtXLNlILaPEHBaVnEzGI0cC5TGH6WYrfJY1bj6zSOzIaROyT6YQS23eUFxaImBvsG0qYacEGT6GjyWuQFf3XT+ae9zk65t3ZR76aN4w6dWCvPc9/SJbFsYvHrEtc+wa70f93kx7K7biqxJXhIm/yETju/mR/Y9+r/OCCtEiQj2am9k10iXrHmVg6j4A65xcFzbw/wwBWiJEH/m1+tiu9KM9vHisvwDda9iDy66+2gyBY3NyxzkXUeHk27CXNoT9KfqOofIRXVbSdTKAo2v51MvhqgKwwU2jdYMc3zyGxzQxExNYjATsMpbM1XppxqaYdor8Xs7oLL1oDF6kLhNwCiZi91tqJ9FuIAqz759MXu93Q1ClXU4XS82obpftBfLDN3cyA+KhA55u+LAmI+BtJacQWfayyLB3Q8fhDdQxpGjsCE+CVULkz6q9/rx8oNrOlvpz5a6MqgrMGBHcl3jSXb/TCEMdPtjBYuhvtdpoSF0Gq6ASBBdzrazra5Q7DlJqLQo1wtrWTpWLiFb7yWFklUQOkENUs+FGWJvOR/CQBPqwGy5Je5PxZZvSF4aeU8bLpfdKH9+v7ZG/KQ/SB6oYFNmn4nr2HR0zbW3j2srWaw799WJbfb4DTpoFS1wnlpGuaQs6f54ew9BnlGVTMbZfViteFSNU2jknWKiM3+OOSCzbxPviCvXGymMWDfuKI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oDq9uQXwuk8ZpCa6s3vHjIXv00VGsbwck2EO+6l10N/42nLasMbxY+Z2FQQV?=
 =?us-ascii?Q?OKsQOMGPWThT2o5DJq2ljX82ocLGQeBVaRevtFkescv4Vni9xdXrSLyxJEC7?=
 =?us-ascii?Q?jyUF+oC3CiDzfDKVAABWk/J5eqYMS1SmH00YK7Y3D4SDlUD3bqiL6KztYLK5?=
 =?us-ascii?Q?Os/+s9rfrRYX8ACnhVBt5pB5Fn1KIVVeI9nMSm04R4zXwiFl1XJ7knon7/Qf?=
 =?us-ascii?Q?I1x/UNKq9gZ7dNOQMOaTkLcPrdOL3Vxb7el1BzNtznizUMG+io4XEkIhsbch?=
 =?us-ascii?Q?C9eD9aj/spa0uFFdtrjpkg2O7nVnKAdT3Px33kh4YnUdueGQxxPCAPnsHGVF?=
 =?us-ascii?Q?vynNz6iqlPKemhvwh5sCQtqjPYLxi+pMZJr+cO/VOfx7jl/KntmGdN9YnmfY?=
 =?us-ascii?Q?vvunqbDUbnlgXZ05Jkuz1c3gZ6oC9URVBq0tW1oyOK2yROTh1jSsTeKPPWAv?=
 =?us-ascii?Q?AjDcikz8h12sCD4bJLBo70YOZt0KPAIMXlvmSohJTJZpiY42Tfo+ILO4VHei?=
 =?us-ascii?Q?Upm47My48DGaDV+F6dPIrBpdpzVHLufB/yI5f2XBhLriawcHXmGHXZiXY3Nn?=
 =?us-ascii?Q?vHbXur8IlxLYsEJjvqxwGcQMQwjv1UOSUso2k9hZ5kYUapVtAqGr6J81EtZ7?=
 =?us-ascii?Q?MUotpNkbqK57RP3SZfYI9cQJlvB1Ewo0hlaoRRFw51FofxWrCSfQdC0bj7A4?=
 =?us-ascii?Q?1Al5+7Xos41jpFCJ8Bc0IdGyDmYkBO+xlqJzjfKFTG5HFnX2vmqyRFgZSfqL?=
 =?us-ascii?Q?zRQ+flWRTgk30bdxSvQLa5DC/ZE6FYYO2NoY2Wn72xYhN3O+t4nUS+rj8VOT?=
 =?us-ascii?Q?x3cqO4T7nnSCq5vTSi3uUAi+igvWmEZoRkFfvMi1NzFGJnIM4+vgLFGOOzLl?=
 =?us-ascii?Q?wkGMdhRa4tq5+Xn3dryiBNQuiM+ssgrvfjhqoLOvBkBapxwPUQPO3yLiPlzO?=
 =?us-ascii?Q?XtT1lA+b5CnkTONPHiTwuHydeQbEzyoLVDEsOKtE3WNbRn/0GjEbPMRRhasT?=
 =?us-ascii?Q?8dKrYWe8DQJFDgWzGDiQxCVkriDjS2JaIPDEoXcx6Ta1qOHwL87BvdIXwMQR?=
 =?us-ascii?Q?TZgfBaReOUJxS4AvMixZbPp/bV3FBvSrapr7Wl/TvoGcESzBWo3Jfx6KSJQA?=
 =?us-ascii?Q?f/1RNsJlJqen8vu7y0a76A4CiMngEDbdEBAhSuwlHwcshb5c5slspNtfEAl8?=
 =?us-ascii?Q?HinhlwvjtkfsvBI6lNZW4mPF4lYC1n5RGrWU0olaqHgWMFbjrvDAHEgYDNnE?=
 =?us-ascii?Q?pfKhTzZPg90q3dLEKx3vcx5hSc22GGyUyXrLMZiWVrrF+MOqHK1piSn3B/qA?=
 =?us-ascii?Q?1XrWW2PII3QY5NwHZzE4haC1uVNpw4tWJs+fkl94bPN2iyfgC++1YJTj6jVq?=
 =?us-ascii?Q?8OhS2YX5Xw+MSFO7aKfHb/hvzdKGIWwgqslkszwr3HkPP9L4lxQtZNyZGh0e?=
 =?us-ascii?Q?ahskrEE2/x+RFV0sQAPmAcau9ppn5ZKi5s1dAeEmn7LXURotTkS8ga7Om7es?=
 =?us-ascii?Q?YpWo/UPRc6+EP4QQWSx86nV8uc5z/O+Q4Zm9gzMUL2wLldXlSbDvktgOZrfB?=
 =?us-ascii?Q?Rrh1QD8X6P9OMVIVTfX01QyyouPIhO0n/fdrJoyvBKqO0QFYukYgRAnPF+ua?=
 =?us-ascii?Q?YGk26qSS9Dcy5tvIeuF5ZQnyuSG3nNTyDVNVlgmbE5dV7OIM1b9fWik4EqNh?=
 =?us-ascii?Q?22ZXWbn52C6VTxTrriBL5kMpKyImwHWlfz0W9noMU6tD5uIYuAvK73lBqg96?=
 =?us-ascii?Q?xs2WKmqm8d8/ZiL1B500lvUm/moUaPBWoXsGKlXhVi8nrPJWmZGW?=
X-Exchange-RoutingPolicyChecked: 
	GuZiLJb4xubyI2gPLF98Y1RF2KABt7DOIBP7iPgwFEwFYCGpo1/1d5OpwR61VHGkTawapisqYt8f3/X7GaW2cr4+tPeUOgM0aCxWgsd4M4GvCwsYlYjbIXyRu6E9tYKlCnYjRDptGLIgCwJZialRPWgg4TrBUf9+2YdWhSw23C+XxO/fwRPlzl8LPL9EwAPOZ8ZAhZ2njqicz+IGomMm+g+/HAYtpKxJ6aJ3dyWBtG3borR+zE9lbG5OFfLKkmvNHxJIJ0+5TOEmY9Yhk979c0TjQsYnH76iNOEIEQuzitpRr2W6osdlVY7OekOPWACwPBicBxg+hoXn1lb/izgSbg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0496a2a-23db-49d4-16f4-08de99f06422
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:38:08.5644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcI91LrPt5HP6tYxzbdUuLnQLyEHjouj8t2pNqjk9r0ndyNlK5LWB0pdklxIKeJm+GhxVRpDmOO+TML/mBn29x0aRGQbCUoOk+bg5VW4/+Rc0ZygqLGgpRTOGLo+sH1t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
X-Proofpoint-ORIG-GUID: 5kgNU1vRgy7-EATi4JWOYZrx6HVkTRb5
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69dde0d3 cx=c_pps
 a=htKwazZePKloe4WR6Wq9JA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=3eaxciRzc6-884s-MfwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5kgNU1vRgy7-EATi4JWOYZrx6HVkTRb5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MCBTYWx0ZWRfXyKVDYrOc57kE
 HTHNM8VQzK8OCVEFSviliXd/mhRe/pJAAKXSVR0mw++yGvtvKhKicOdoMYiCLMPr53lb8JV5Rpe
 OehmxP0ba0ga+TPMyIS9ozLTdjRIU33fQBEFWj9cs6CBc5a7YBKpoz4S5pNWTQXr0f56uj1igbi
 E/geiHjFD1Y/yTVVdfpl0Uvpb4uVaUBVo5tiSZXO8qs6ZXSWrEH9xiDuE5lNhgy63R8WSordVjl
 Omboa6Uo6b431a7V7laTxa0UKAtEGBfOLRTKaOpsP+dRlAbzU1H1dsE+H4QUzA4Veq2NyZLQhPn
 YMVEgRFb3JMlFPBTWgyoqNmytDC7+I8I1daBsrr8wR7jP6vPPr0rNi70bGpJHdzlAqum5DrvXMY
 xcHuhL9i5uweSAfdg6nBQmAuAZOEDN42cjHGnbLiuN31smjT9xqUueR6xa5Mo+4D+Nc0cSVbZnL
 +p1H8Wckb4QNMVznQlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235136

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch series introduces a test framework to run selftests for
target builds of Clang, LLVM, and LLD.

v4 changes:
- Fix intermittent failures.

v3 changes:
- llvm_sysroot_preprocess_testsuite function needs be added to 
  llvm:class-target not llvm:class-nativesdk.

v2 changes:
- Enable required CMake flags only when running the testsuite.
- Ensure default build time and package sizes remain unaffected.

Summary of changes:
-Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
          detect the llvm-bcanalyzer target.
-Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
          when CLANG_ENABLE_TESTSUITE is set to "1".
-Patch 3: Set CLANG_ENABLE_TESTSUITE = "1" while running testsuite.
-Patch 4: Selftest script for Clang, LLVM, and LLD including exclude list
-Patch 5: Fix rust build failure by replacing target llvm-config with native

Testing:
1. The test suite has been successfully validated on x86-64, arm64, riscv64
and arm32 for all Clang, LLD & LLVM components.
2. Clang and LLD tests passed successfully on x86. LLVM tests are skipped
on x86 since it's broken. A follow-up bug will be filed and addressed.
3. Clang, LLVM & LLD all together ~80K tests are there and we currently
~250 tests to exclude list which are failing (0.32%).

Impact on build time:
These builds were executed in a controlled environment without poky-sstate
enabled.

Default(without changes):
+-----------+------------+------------+------------+----------------+
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 22m18.441s | 22m31.905s | 22m23.718s |   22m24.688s   |
|   clang   | 30m09.774s | 30m22.680s | 30m15.312s |   30m15.922s   |
|   lld     | 1m26.994s  | 1m30.415s  | 1m29.006s  |   1m28.805s    |
+-----------+------------+------------+------------+----------------+

With the testsuite changes applied:
+-----------+------------+------------+------------+----------------+
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 23m32.104s | 23m45.887s | 23m38.157s |   23m38.716s   |
|   clang   | 30m31.402s | 30m46.198s | 30m39.445s |   30m39.015s   |
|   lld     | 1m29.845s  | 1m34.212s  | 1m31.925s  |   1m31.994s    |
+-----------+------------+------------+------------+----------------+

Comparison:
The additional overhead is minimal and primarily due to enabling
test-related build configurations.
+-----------+-------------+------------------+------------------+
|  Target   | Default Avg | With Changes Avg |     **Diff**     |
| --------- | ----------- | ---------------- | ---------------- |
|   llvm    | 22m24.688s  | 23m38.716s       |   +1m14.028s     |
|   clang   | 30m15.922s  | 30m39.015s       |   +0m23.093s     |
|   lld     | 1m28.805s   | 1m31.994s        |   +0m3.189s      |
+-----------+-------------+------------------+------------------+

Impact on package size and Fix:
The testsuite changes has a negative impact on certain package sizes,
as below:
+---------------------+----------+----------+-----------+------------+
| Package             | Old (MB) | New (MB) | Diff (MB) | Change (%) |
+=====================+==========+==========+===========+============+
| clang/clang-dbg     |    44.99 |    59.79 |    +14.81 |    +32.92% |
| clang/clang-dev     |    30.22 |    30.22 |     -0.00 |     -0.00% |
| clang/clang-tools   |     5.05 |    29.58 |    +24.53 |   +485.87% |
| llvm/llvm-bin       |    16.40 |    71.77 |    +55.36 |   +337.50% |
| llvm/llvm-dbg       |   386.79 |   646.12 |   +259.33 |    +67.05% |
| llvm/llvm-dev       |    32.67 |    33.67 |     +1.00 |     +3.05% |
| llvm/llvm-src       |   387.54 |   389.44 |     +1.90 |     +0.49% |
| llvm/llvm-staticdev |   609.68 |   616.80 |     +7.12 |     +1.17% |
+---------------------+----------+----------+-----------+------------+

FIX:
All testsuite-related changes are now gated by the CLANG_ENABLE_TESTSUITE
variable (default "0"), ensuring:
- Test-specific CMake flags are applied only during test execution.
- Standard builds remain fully unaffected in both build time and package size.

Deepesh Varatharajan (5):
  clang-tools-extra: disable tests
  clang: Enable cmake flags for llvm, clang, lld tests
  clang: Set CLANG_ENABLE_TESTSUITE = "1"
  oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
  rust: Fix rust build failure

 .../recipes-devtools/clang/clang_%.bbappend   |   2 +
 .../recipes-devtools/clang/lld_%.bbappend     |   2 +
 .../recipes-devtools/clang/llvm_%.bbappend    |   2 +
 meta/lib/oeqa/selftest/cases/clang.py         | 324 ++++++++++++++++++
 .../0041-guard-clang-tools-extra-test.patch   |  74 ++++
 meta/recipes-devtools/clang/clang_git.bb      |   8 +
 meta/recipes-devtools/clang/common.inc        |   1 +
 meta/recipes-devtools/clang/lld_git.bb        |   5 +
 meta/recipes-devtools/clang/llvm_git.bb       |  18 +-
 meta/recipes-devtools/rust/rust_1.94.1.bb     |   5 +-
 10 files changed, 438 insertions(+), 3 deletions(-)
 create mode 100644 meta-selftest/recipes-devtools/clang/clang_%.bbappend
 create mode 100644 meta-selftest/recipes-devtools/clang/lld_%.bbappend
 create mode 100644 meta-selftest/recipes-devtools/clang/llvm_%.bbappend
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
 create mode 100644 meta/recipes-devtools/clang/clang/0041-guard-clang-tools-extra-test.patch

-- 
2.49.0


