Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541DAC3DA7E
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 12:15:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15953.1722341735374193164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 05:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89412454c0=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U4pfK0026147
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 05:15:35 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40mv61apm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 05:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ec+QiNAQlnd8dOcBGCeCrYBux1bTBUlK0m2KVR3o5CBlWZydHI0orXTZ7KEYJaXuimNnSX2j3LGe46Ginhe8orPlgClJopi/MuG1DjX7p5B5P5h2G8AINj1p+/ZLHzr/EoHIwEGY2tFvLJa2cXCnpCH1aSS2ZROl9lFWzRMDmO8ZfAtI0fhd6M0RDMaXxgsVWVGc0vrIvA1bz8XGjjzUCpCOrdZgaqPcHSK7c6lNVkMScaGXcWwSI0d0pwCaSBb9umMx0JNuQFnla4xFRmQbODn5yb/Il3QrdUWlKa5fZ9lzWxpPEGW6K+5pJrOPddSeUFTi/+/sqjmzU3Gas47gQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+2fWefaTTGpKLfW4YLkQni1j+vpueWPiRH14xeVsHg=;
 b=m3At+yNBILzernogyi2R8/pVlyyVp7aumv3RF+Aqj/nCQLiMJSelNmLD4C0M/43UEEMZNxf3TwKIM9wKqfd5sZDHwiRjBtaj51xa8CJJSH6jdqfGRfXAX1YW5a9YFtse6WdhaDbjGiO96xDl3FtlXV0r5Is8EzmL7zt2qCiwKfkjuTTYAX6bEU/IARN2bvUk1w3nCiJov6hSsBzq8kqWo3h4ZYrd9x1ENWIc6M1/TAbacPa3HkeIfA5a6MLyQ+NPfpJy0T+4r5YHR4oQVJEOWf2Bqvjh+T4+JQpDjGJgKCZZUPLqhrF0o93+MntbdDDZ/HQn2V7TZDu9ioPGmXvRrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by DS0PR11MB7735.namprd11.prod.outlook.com (2603:10b6:8:dd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.30; Tue, 30 Jul 2024 12:15:30 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 12:15:30 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] llvm: Fix CVE-2024-31852
Date: Tue, 30 Jul 2024 05:15:13 -0700
Message-ID: <20240730121513.1801546-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|DS0PR11MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: c06e30cc-5ab3-4230-6e5b-08dcb0914def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0r5VC5SCS0mvXqKyK5YmIfKmKDdcfhKS2makuuBIc+5Coh4cWxzUk//o+KEb?=
 =?us-ascii?Q?+FiYU4f1xe3mZ+w2nEIGos6MDdQLO7k1f5ynUCMENALuCPcuRhTJ6/b/FXHq?=
 =?us-ascii?Q?v58D+oo+AVWxo9v+RrS0H+m45f83IxqJOkhMqie2Ad4qxjYK7g8Gub0R2gIm?=
 =?us-ascii?Q?cx+Za2pMkFoTclvG3oL81aDzRoonJ67/P7Q6j1nGSbqtXV1wZMYKsURdfctB?=
 =?us-ascii?Q?7k/B+po5mDma5zP62jyHdBuj7XL94Rq+zjz+etcmYSK4am3f4c77zPt0Psr7?=
 =?us-ascii?Q?U70gqD1/FIlifWV+rXV6vyN12eIcUywwjp+k0S6lXc7bspHItNiqUBOlr3wa?=
 =?us-ascii?Q?aP3m/Wec5rVbSmQwWT11JObQDqMuZ7AoM9osyzHiejb5Q2m/DJBG3yebUX/j?=
 =?us-ascii?Q?lCDlVzpOmfdG3LurL8IYPjhKC1QnEBc8B6WVACZqYJ4lW3058iJYSZmmNLoS?=
 =?us-ascii?Q?9eg/inIt6EXzcnmR1CaCJNamdF31PCfzNTsccdwfLtEjvw0+QDwqhlzeA+ne?=
 =?us-ascii?Q?UZIJwlPp+2I/LxDbIYqoaWOK2H3tcqONDbN+0WX9J0X91/U31sJ0bNT0Dzmt?=
 =?us-ascii?Q?zRCJINgcHfRYtcA7+rLSPHI6y3XlYOBRvuHlX2VKB1Utu5c4Yss6OxuyHhol?=
 =?us-ascii?Q?93FnNC3Aa/Ciwsl1EdvoicaXnkYQeVWWRIqvHsEYVPewmxKwTgnCKvmKbWpL?=
 =?us-ascii?Q?VDo8WyS6ttxhifEMNKLyo2nBsdG68rwy7PP0DO9phD6UdlL6D7Y+B15TVI2b?=
 =?us-ascii?Q?esjTom8geBG+ClvpRS/GwVs7XOLZirdsCgQz2jHRH3A/5wr4foUuiSly4LYA?=
 =?us-ascii?Q?Wc48d3yH0b7rKfLo6QZjqu42ztzNEvsKFbAZfBSej2+v0VyBvMyq1A/2TZ0C?=
 =?us-ascii?Q?kzfRFZJBgBz/s3hcJiaxmsoZNzBhyOtjW17G5ZuGGyLd7AmeqUdld6x7NEAy?=
 =?us-ascii?Q?E4R0C4Zw93dJyG/zEsSA1mUkE4lLUcrm+Ps3AHHHVDla7vlctarrSD75zwCT?=
 =?us-ascii?Q?2hR+7ru3biIBT+TCH//RdZebNNETnp7PY4h2A6Jgk2XeeWoooqLpLrL7UYw4?=
 =?us-ascii?Q?NEUbPpLBzUNgIp6KPP3noGUDvAloP2bR2bpbCPMz+Cy9H07vephIQixA6/8e?=
 =?us-ascii?Q?PFZ7JDn8qET4WPG6arq9IRc8yiQ5+WwKjvvIU//W7drUFzjBCQP12Cb/Ol0W?=
 =?us-ascii?Q?936NmjYA/dPiZSX9etqPSxi8s/jrxXWWuKD6ObdMFD5RF9Xeu25lE227vrH1?=
 =?us-ascii?Q?9HeAY/vVEaALv4lOHdvzn+eKtVFYCa0s9NCipb1JnhpLeT/EKvfvj/6pS4Fc?=
 =?us-ascii?Q?NliO5L7mfq62Urh75/fJBmI3cAaBVxIdWbk4/42zu4gftIeqOhOAoEOeTEHw?=
 =?us-ascii?Q?dDDNHa8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GUJG5/Qv7amZyEaAIwLCEhM6M/k2Oye1Qncr3kSl0JxvSVgG8q7+jRI9iGZP?=
 =?us-ascii?Q?m16sD4MQjjvG411KwbFqmtCpbtQs+qZFKCFZfk0MEJdC56fsf9nzj7T5u4tg?=
 =?us-ascii?Q?qfpF5u+xfNuUYJxYe5vDsITyorLp4dWyt+k46XooOSUy5T1t9bRTiFimNn4f?=
 =?us-ascii?Q?LfgmoKIVlLajDq4IgRjmEVgxOrzXhAyUXtZLcwcdEGYPCb2AQ/wJ9xaF76YZ?=
 =?us-ascii?Q?VK4vAJ/2fYxDmFg35nXy6QJ2l8hJIq5jwt5j7AkqVGDOvLFuLHZI5h9MXTJw?=
 =?us-ascii?Q?eRnI9oxs1QhTW43CzgG3SqTy33WJt7fHfavlkr2ETe+Oa3jF5YZdQOynnNuG?=
 =?us-ascii?Q?APi92rjZ1YP9pK3Yl3ZG10n9z9c/vkBk8VOh+IS41PmlAJ4mJM8/Nl8u1BN1?=
 =?us-ascii?Q?YquOgbTCk9AzCDfO0rcS9NT0dAvwknfdcnmb1/tj5fV4COsMh/ZudxYTCm6H?=
 =?us-ascii?Q?3Kha7NeEa1pWBbX0pFjuNuYzUOG3XLM6xp+wQSocMeN39E+U6z5WK72jsEcJ?=
 =?us-ascii?Q?8mUQMc0h268Az4AMzB/XCEXosfiFNtPaja6WDGx4VsN+SR5Fo+WMz2Fm1S7+?=
 =?us-ascii?Q?lGds+3oVkhl3W+uL8OQ80iq/vGQnycS5smENUrwjvvX8vvny+eOUmpyoQM3V?=
 =?us-ascii?Q?jTuZaUUP7teCIO75rByLuZDxfKLzwUmXMcf+6HL2ip4eL781oKqYxkP/0YBX?=
 =?us-ascii?Q?Uu1+A3aM3Rez+LRbi7EvWtiEJ4d0K+gTLyxT8uZWCQeIuN+rywTAHEQpn5Pg?=
 =?us-ascii?Q?1y4113CxBxFs9D8h6Pn/Sv3HvWyT7rpwYybW1lmH8o1smr/cMboe7ZF/f8Iz?=
 =?us-ascii?Q?HO4IVKYzcmhAfwIHDLdxekFfDAXl5wNtGlQdTdMjmx9zinqqc93gZaYW/s/L?=
 =?us-ascii?Q?QVSIW3relopJPL75l0bPDspHq8q0tjd37kpLYZ8g8ByrlIf6vDm0e8PEYOxq?=
 =?us-ascii?Q?9luPpdpeB9vNeB1oNb0xZN60lbInqj8RJOs3SUrfUFIHPjiTdgwGg+0+/LJX?=
 =?us-ascii?Q?yCDr8RZGj8FLVeFC4Tmt3qtg68NRssGkOkanStOcweP8AtZgkBxzFr1KpUTl?=
 =?us-ascii?Q?w5mfhe9CVnPgpBL6ynOjeJCf5XVH6sMH2heoRmbxWOTVPbnO3jzOe6j68yRN?=
 =?us-ascii?Q?HVdC2MuMHIpmVZ8TsGug1HPZIbP7WfRe0s+KQtYzX4zX/olMhFFRSHHvd+IF?=
 =?us-ascii?Q?7rAmCFG7BJoqf+d1bWno+sa0aS5Rw8BvPe40sVOrLsCnZoM5PLOr1k4ZC7db?=
 =?us-ascii?Q?cyesCt0QkEObBxyJi2tGGynhWQwA1id1WGMKmn5gUlnJu7S+daEAvRgMLOHa?=
 =?us-ascii?Q?z6ZUCJgzTnG+cVV2AbUqqkWxVs4yqQBBK7CX1bq7ZwXnG7Fcq2iWYAlwWfbn?=
 =?us-ascii?Q?CFSLyo7a+55DGpXXRcUQ04J+B8Fw1LG4tRpc2S9jLSXG7wXIgZLUu48gwE1J?=
 =?us-ascii?Q?ncW0nxv430+t28xy+ETyOKa2UxXLbjBWZPNFsYNMMwnXwfJjJVjSB2z68cFc?=
 =?us-ascii?Q?rEyg8oc2em/9yXZEaNqOcaXMNESpyH5phBnk6h8o7yTDzDT0kQRt3LdbADzi?=
 =?us-ascii?Q?0JQP8/o44wZOD+uqqlE7D2tXBreEPRH6ofXXPs3jSYh09vYlQ2jr+C4li/Iz?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06e30cc-5ab3-4230-6e5b-08dcb0914def
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 12:15:30.5168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYNKUJCUENKIKmVSuZCec2MBWkkOEH1F1ddz7ua1VbMmW31L0V7zu3rP4oLS5bnyZR88MMbZUnR0TbYFtXMzlUzZgt0E6FxWPzLwjC7wngg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7735
X-Proofpoint-GUID: pLogBdEeZqEe8e9MAY2CbBRQnCZHSXQO
X-Proofpoint-ORIG-GUID: pLogBdEeZqEe8e9MAY2CbBRQnCZHSXQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407300086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 12:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202674

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../llvm/0008-llvm-Fix-CVE-2024-31852-1.patch |  85 +++++++++++++
 .../llvm/0009-llvm-Fix-CVE-2024-31852-2.patch | 117 ++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |   2 +
 3 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0008-llvm-Fix-CVE-2024-31852-1.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0009-llvm-Fix-CVE-2024-31852-2.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0008-llvm-Fix-CVE-2024-31852-1.patch b/meta/recipes-devtools/llvm/llvm/0008-llvm-Fix-CVE-2024-31852-1.patch
new file mode 100644
index 0000000000..7cf4a52715
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0008-llvm-Fix-CVE-2024-31852-1.patch
@@ -0,0 +1,85 @@
+commit b1a5ee1febd8a903cec3dfdad61d57900dc3823e
+Author: Florian Hahn <flo@fhahn.com>
+Date:   Wed Dec 20 16:56:15 2023 +0100
+
+    [ARM] Check all terms in emitPopInst when clearing Restored for LR. (#75527)
+    
+    emitPopInst checks a single function exit MBB. If other paths also exit
+    the function and any of there terminators uses LR implicitly, it is not
+    save to clear the Restored bit.
+    
+    Check all terminators for the function before clearing Restored.
+    
+    This fixes a mis-compile in outlined-fn-may-clobber-lr-in-caller.ll
+    where the machine-outliner previously introduced BLs that clobbered LR
+    which in turn is used by the tail call return.
+    
+    Alternative to #73553
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/b1a5ee1febd8a903cec3dfdad61d57900dc3823e]
+CVE: CVE-2024-31852
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.cpp b/llvm/lib/Target/ARM/ARMFrameLowering.cpp
+index 025e43444f9c..a9acf338ebf5 100644
+--- a/llvm/lib/Target/ARM/ARMFrameLowering.cpp
++++ b/llvm/lib/Target/ARM/ARMFrameLowering.cpp
+@@ -1236,9 +1236,6 @@ void ARMFrameLowering::emitPopInst(MachineBasicBlock &MBB,
+         // Fold the return instruction into the LDM.
+         DeleteRet = true;
+         LdmOpc = AFI->isThumbFunction() ? ARM::t2LDMIA_RET : ARM::LDMIA_RET;
+-        // We 'restore' LR into PC so it is not live out of the return block:
+-        // Clear Restored bit.
+-        Info.setRestored(false);
+       }
+ 
+       // If NoGap is true, pop consecutive registers and then leave the rest
+@@ -2292,6 +2289,33 @@ void ARMFrameLowering::determineCalleeSaves(MachineFunction &MF,
+   AFI->setLRIsSpilled(SavedRegs.test(ARM::LR));
+ }
+ 
++void ARMFrameLowering::processFunctionBeforeFrameFinalized(
++    MachineFunction &MF, RegScavenger *RS) const {
++  TargetFrameLowering::processFunctionBeforeFrameFinalized(MF, RS);
++
++  MachineFrameInfo &MFI = MF.getFrameInfo();
++  if (!MFI.isCalleeSavedInfoValid())
++    return;
++
++  // Check if all terminators do not implicitly use LR. Then we can 'restore' LR
++  // into PC so it is not live out of the return block: Clear the Restored bit
++  // in that case.
++  for (CalleeSavedInfo &Info : MFI.getCalleeSavedInfo()) {
++    if (Info.getReg() != ARM::LR)
++      continue;
++    if (all_of(MF, [](const MachineBasicBlock &MBB) {
++          return all_of(MBB.terminators(), [](const MachineInstr &Term) {
++            return !Term.isReturn() || Term.getOpcode() == ARM::LDMIA_RET ||
++                   Term.getOpcode() == ARM::t2LDMIA_RET ||
++                   Term.getOpcode() == ARM::tPOP_RET;
++          });
++        })) {
++      Info.setRestored(false);
++      break;
++    }
++  }
++}
++
+ void ARMFrameLowering::getCalleeSaves(const MachineFunction &MF,
+                                       BitVector &SavedRegs) const {
+   TargetFrameLowering::getCalleeSaves(MF, SavedRegs);
+diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.h b/llvm/lib/Target/ARM/ARMFrameLowering.h
+index 9822e2321bb4..266d642bb97b 100644
+--- a/llvm/lib/Target/ARM/ARMFrameLowering.h
++++ b/llvm/lib/Target/ARM/ARMFrameLowering.h
+@@ -58,6 +58,9 @@ public:
+   void determineCalleeSaves(MachineFunction &MF, BitVector &SavedRegs,
+                             RegScavenger *RS) const override;
+
++  void processFunctionBeforeFrameFinalized(
++                 MachineFunction &MF, RegScavenger *RS = nullptr) const override;
++
+   void adjustForSegmentedStacks(MachineFunction &MF,
+                                 MachineBasicBlock &MBB) const override;
+
+
diff --git a/meta/recipes-devtools/llvm/llvm/0009-llvm-Fix-CVE-2024-31852-2.patch b/meta/recipes-devtools/llvm/llvm/0009-llvm-Fix-CVE-2024-31852-2.patch
new file mode 100644
index 0000000000..b6082b0ef3
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0009-llvm-Fix-CVE-2024-31852-2.patch
@@ -0,0 +1,117 @@
+commit 0e16af8e4cf3a66ad5d078d52744ae2776f9c4b2
+Author: ostannard <oliver.stannard@arm.com>
+Date:   Mon Feb 26 12:23:25 2024 +0000
+
+    [ARM] Update IsRestored for LR based on all returns (#82745)
+    
+    PR #75527 fixed ARMFrameLowering to set the IsRestored flag for LR based
+    on all of the return instructions in the function, not just one.
+    However, there is also code in ARMLoadStoreOptimizer which changes
+    return instructions, but it set IsRestored based on the one instruction
+    it changed, not the whole function.
+    
+    The fix is to factor out the code added in #75527, and also call it from
+    ARMLoadStoreOptimizer if it made a change to return instructions.
+    
+    Fixes #80287.
+    
+    (cherry picked from commit 749384c08e042739342c88b521c8ba5dac1b9276)
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/0e16af8e4cf3a66ad5d078d52744ae2776f9c4b2]
+CVE: CVE-2024-31852
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.cpp b/llvm/lib/Target/ARM/ARMFrameLowering.cpp
+index a9acf338ebf5..13d3cbf650ed 100644
+--- a/llvm/lib/Target/ARM/ARMFrameLowering.cpp
++++ b/llvm/lib/Target/ARM/ARMFrameLowering.cpp
+@@ -2289,10 +2289,7 @@ void ARMFrameLowering::determineCalleeSaves(MachineFunction &MF,
+   AFI->setLRIsSpilled(SavedRegs.test(ARM::LR));
+ }
+ 
+-void ARMFrameLowering::processFunctionBeforeFrameFinalized(
+-    MachineFunction &MF, RegScavenger *RS) const {
+-  TargetFrameLowering::processFunctionBeforeFrameFinalized(MF, RS);
+-
++void ARMFrameLowering::updateLRRestored(MachineFunction &MF) {
+   MachineFrameInfo &MFI = MF.getFrameInfo();
+   if (!MFI.isCalleeSavedInfoValid())
+     return;
+@@ -2316,6 +2313,12 @@ void ARMFrameLowering::processFunctionBeforeFrameFinalized(
+   }
+ }
+ 
++void ARMFrameLowering::processFunctionBeforeFrameFinalized(
++    MachineFunction &MF, RegScavenger *RS) const {
++  TargetFrameLowering::processFunctionBeforeFrameFinalized(MF, RS);
++  updateLRRestored(MF);
++}
++
+ void ARMFrameLowering::getCalleeSaves(const MachineFunction &MF,
+                                       BitVector &SavedRegs) const {
+   TargetFrameLowering::getCalleeSaves(MF, SavedRegs);
+diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.h b/llvm/lib/Target/ARM/ARMFrameLowering.h
+index 67505b61a5e1..b13b76d7086c 100644
+--- a/llvm/lib/Target/ARM/ARMFrameLowering.h
++++ b/llvm/lib/Target/ARM/ARMFrameLowering.h
+@@ -58,6 +58,10 @@ public:
+   void determineCalleeSaves(MachineFunction &MF, BitVector &SavedRegs,
+                             RegScavenger *RS) const override;
+
++  /// Update the IsRestored flag on LR if it is spilled, based on the return
++  /// instructions.
++  static void updateLRRestored(MachineFunction &MF);
++
+   void processFunctionBeforeFrameFinalized(
+                  MachineFunction &MF, RegScavenger *RS = nullptr) const override;
+
+diff --git a/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp b/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp
+index fd06bfdf352c..561c1396190d 100644
+--- a/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp
++++ b/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp
+@@ -2060,17 +2060,6 @@ bool ARMLoadStoreOpt::MergeReturnIntoLDM(MachineBasicBlock &MBB) {
+       MO.setReg(ARM::PC);
+       PrevMI.copyImplicitOps(*MBB.getParent(), *MBBI);
+       MBB.erase(MBBI);
+-      // We now restore LR into PC so it is not live-out of the return block
+-      // anymore: Clear the CSI Restored bit.
+-      MachineFrameInfo &MFI = MBB.getParent()->getFrameInfo();
+-      // CSI should be fixed after PrologEpilog Insertion
+-      assert(MFI.isCalleeSavedInfoValid() && "CSI should be valid");
+-      for (CalleeSavedInfo &Info : MFI.getCalleeSavedInfo()) {
+-        if (Info.getReg() == ARM::LR) {
+-          Info.setRestored(false);
+-          break;
+-        }
+-      }
+       return true;
+     }
+   }
+@@ -2118,16 +2107,24 @@ bool ARMLoadStoreOpt::runOnMachineFunction(MachineFunction &Fn) {
+   isThumb2 = AFI->isThumb2Function();
+   isThumb1 = AFI->isThumbFunction() && !isThumb2;
+
+-  bool Modified = false;
++  bool Modified = false, ModifiedLDMReturn = false;
+   for (MachineFunction::iterator MFI = Fn.begin(), E = Fn.end(); MFI != E;
+        ++MFI) {
+     MachineBasicBlock &MBB = *MFI;
+     Modified |= LoadStoreMultipleOpti(MBB);
+     if (STI->hasV5TOps())
+-      Modified |= MergeReturnIntoLDM(MBB);
++      ModifiedLDMReturn |= MergeReturnIntoLDM(MBB);
+     if (isThumb1)
+       Modified |= CombineMovBx(MBB);
+   }
++  Modified |= ModifiedLDMReturn;
++
++  // If we merged a BX instruction into an LDM, we need to re-calculate whether
++  // LR is restored. This check needs to consider the whole function, not just
++  // the instruction(s) we changed, because there may be other BX returns which
++  // still need LR to be restored.
++  if (ModifiedLDMReturn)
++    ARMFrameLowering::updateLRRestored(Fn);
+
+   Allocator.DestroyAll();
+   return Modified;
+
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index cedbfb138e..d342da649a 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -33,6 +33,8 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=http
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://0001-Support-Add-missing-cstdint-header-to-Signals.h.patch;striplevel=2 \
+           file://0008-llvm-Fix-CVE-2024-31852-1.patch;striplevel=2 \
+           file://0009-llvm-Fix-CVE-2024-31852-2.patch;striplevel=2 \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


