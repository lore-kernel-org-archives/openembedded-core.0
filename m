Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684BDC3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 07:28:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9927.1746689312943015352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 00:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7223a9f982=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548702lV013434
	for <openembedded-core@lists.openembedded.org>; Thu, 8 May 2025 07:28:32 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430mvxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 07:28:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWODWhQ2FPB3ThtQv8WfuGmkgDfuBXUplzARXccKLtD4de7KIRyGKpgJARSQZ/l5ynKHJnQq8hIJzYyyTRakQMMzhAZyvq9ELXwxslVzzstL3Az4OnUI+jek7inGhV4pILfipyTpbiVky1Z4PTVDMKENUuzAA/hMLgag04AcKpF39wJrH6xJ/i9n1vGm0NyPItz0VZqcfKKOl5Pljh58wiDCEQJFL+xzKl3gLoMqNHBHlqJBDIPBAHY/EE2wgk6PBkrIHi/uGVWj50kqbQcYWW17+OA1TTNkCoOquRoRAyZJAFDIe/RxisizC00tmBZX5GHezbkR9W/ICn8OQ9MxhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlltfCmsldEdjx57T/9JwbeLaxWxcvlK5JLIGYVGW70=;
 b=iXhYz/2m1AbW+zFQhLre2OSkojPw6kJcnMtSlsEOPrgQtmjBPr6nY983B4rSjLRtga3sFXwXLlSKHsBmkwL0VOEu6DuZCvz+CzktLtGsQr0gFDoPT7R2Y219f5vo6dWmIqKATD8OIFnLvyFExwY+ajYOpwitcMfXC9S+NglcfPlvy0wfvdFNZ7BjDXNr7Zg2A60QtNbG0XL9Fm8W58iSugIohoOVfr1oQ0HMJ9uCIwuA8U3vlX81GncXgxUhhxMJTDS83OqrOtbBN1Dq/j5OqdfJMO7j0KmGvn/wY4pqOUinlmaTCLoUHm1WZYoTs6pPWTRp08tgwGswCztXzkdYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6653.namprd11.prod.outlook.com (2603:10b6:806:26f::11)
 by SA2PR11MB4873.namprd11.prod.outlook.com (2603:10b6:806:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 07:28:29 +0000
Received: from SN7PR11MB6653.namprd11.prod.outlook.com
 ([fe80::d322:da3e:6319:55a]) by SN7PR11MB6653.namprd11.prod.outlook.com
 ([fe80::d322:da3e:6319:55a%3]) with mapi id 15.20.8655.038; Thu, 8 May 2025
 07:28:29 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] coreutils: fix help-version.sh ptest with 'single-binary' enabled
Date: Thu,  8 May 2025 10:28:14 +0300
Message-Id: <20250508072814.106107-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508072814.106107-1-ovidiu.panait@windriver.com>
References: <20250508072814.106107-1-ovidiu.panait@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0223.eurprd07.prod.outlook.com
 (2603:10a6:802:58::26) To SN7PR11MB6653.namprd11.prod.outlook.com
 (2603:10b6:806:26f::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6653:EE_|SA2PR11MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb88d62-d15f-458e-fb04-08dd8e01edaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?o3ikoHv4n1IZDoZM0voJNmwX9DdXHvj38oFrIxyeKreuy+45IVvqVhW3MPTl?=
 =?us-ascii?Q?krIJ4TFdORWpB8YymZ2CPLEwPz74kEEqftlFhB1OBm54kwxvYYLTetSVnSml?=
 =?us-ascii?Q?Z0IPSH8LF+16jWx4+H8jSBjDW6Oi0s7NmlR2BW53QpiamOmEcuxsHumw+/Y2?=
 =?us-ascii?Q?V4JZs7mNRi50ewL7mg01vOkPxBQsWqjeNAmACeNLZxt+5Vz9ao5zFDOHP6mH?=
 =?us-ascii?Q?FuqVGv0uI5JVHY/W2ksqkoKc83VXUWaK6fHQ5JWspVxrEVG0gCwzjAbp6lha?=
 =?us-ascii?Q?BeNIaAvuRYBh0dpXfPRHieuLscCgzxLoqrFO5q5HUDnFk82uBZ8i7DXA5aPk?=
 =?us-ascii?Q?Bxo23uuishb3PnhOYnNTRBVtzkvIS9NGX7y7XbIMbug0mJTmiz3z5sI+Lenr?=
 =?us-ascii?Q?AT0M+2HpQw/ng2c0oMNIANfKsNxoQhyaLfcWknYEF1XGt4zVZITF4VPP7mBU?=
 =?us-ascii?Q?oljYIjlfVtawHCs3/ZAjwFpMRiWI57MymdP4yJlSifl0gDQNrcnLkuS8vVPV?=
 =?us-ascii?Q?ToV9Ol8GCzFcvDpViZvL7JjOuKYBri2UYZEFAHSbUy+TEP1gQ5X+xUEI1TMU?=
 =?us-ascii?Q?D9SiCrUsaoUePOj0wSWS1lCRHMj81ma1/C6lp2qr1GJOjce7Fj51jNe4ruLX?=
 =?us-ascii?Q?hXiIwwd6U/tgCuRo7JYQnnr0dpSHyEccs0EgB5Eao/N1UeubAMJVtPoAA+rg?=
 =?us-ascii?Q?ymtmtD/oXzS931khqVOQZqjo7dLzf/M8hqRcb266hpD4/3Bsm2rzb6eJn6Eh?=
 =?us-ascii?Q?yD24dy3u+Rlf1wxHAXbAxH+lelv7fhruNaBTo1W5MT4lmO2LDp1CDlRE0ylx?=
 =?us-ascii?Q?9bFT+omHRNFFe51hYc361PiUXal0YFxCvxg2XL4uSPFReR4xYlPbmYzy+kJX?=
 =?us-ascii?Q?8ST6hKS+8ekn8pHyJESg/LVTC/+1IYuosk9Oydjn8c/1vYj0NWOFC0DJkdF7?=
 =?us-ascii?Q?jvRIl+KGYgMU+hfPUUf8gV9KQBP1l42fDTFHyLAqwcBgXLkvDu+umt2/nsNx?=
 =?us-ascii?Q?E1SvGV106TUK6dle/XgsBXMCj7qH1NWP+LfYJrAa0jzykSUHjkwLenvIz2M8?=
 =?us-ascii?Q?wCsHRygwot63rTwCc8566UPykSPJw8YIrwoX0M9dTJ8uA/FHHd+wDv918wKE?=
 =?us-ascii?Q?EBKwCFVkRcOqcfQxVJZINskR210olns6O6FHNnDJPwKdFET0iw3v7tYYOKfJ?=
 =?us-ascii?Q?LLBzn0CnjE1eUHHXz7irn+9x6EGKPHClQk8K1FeIP8nhXbb1lvennBpPAKhw?=
 =?us-ascii?Q?DrbhxcrI8PKnhvNe2B6cQs2FNYr8nQE6vHMRl5rLQBdPEcqdPZpoXbA59qGW?=
 =?us-ascii?Q?g+U82JpFEQg+3MgdbFyGjPIHKm9o3xgCYYQImeGcpLaoHWznp9Zq4mN04QoL?=
 =?us-ascii?Q?0avkPCbDvYtwEVRuJyL8eTCjbV94e++B6JET4ImjzdS/vXrRmD9SSsRt0tSY?=
 =?us-ascii?Q?LXFfJxNPqqwa+PTlais2ZLm742AtfKS4UC6xaTHqo2KTEdfg8zmBvw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xomcoA7HoobdwxxxFkISJvlgiG2teXFqVRvf3F44jhbxwrtDYYjyb5lEV2Nz?=
 =?us-ascii?Q?k4ymFZvahSrQPpYExqk92tv3JGTW8MsC8pWVMof9BtXuBlGc2XH7Huoeosn3?=
 =?us-ascii?Q?dH7/4DSVbT2hgAdNAtlzdiruG29ExSOYj5dwn0XUzgQ2qcOPIoH+wnnvjGBm?=
 =?us-ascii?Q?pGuOnRPu8vfIiW30YwaUr0n37YC6DOv1/+GQ+tQL8LkYRQxut6ukNFY/pWGB?=
 =?us-ascii?Q?5NTIM1gDeziQM2MKxzDPNtsvMwPoq8byFsud1rQ1GQvH+Df1ZbPl26/7yyc3?=
 =?us-ascii?Q?bbQ0hbZ8ClwxYNpeaNk2ZYxbwEE2HkVwnj79YfYMH4j629JcXKUKK5LWmcGY?=
 =?us-ascii?Q?tthPTLozwgq8syaqZzYjQv/YyVrlOKgCyVZOqxLjhpddj9OQO5YsnpJk3Bu5?=
 =?us-ascii?Q?fpolljJ7rzTJd7HyBtdc8IqYVJkdlsg1X7xNQEPVmGwv18o0yUzmUeWPh3kG?=
 =?us-ascii?Q?K11BY6JYB6eoxw3pwMLhG34ndVnO0sOe8IPe/OTiUzZT117Tcn69DdFNgkyn?=
 =?us-ascii?Q?uG2B0o7AlFeYKAWZjEUIvxliMxv2lJled3rcE8K2XBOVUEVZmMQa9ITDmrT2?=
 =?us-ascii?Q?gekirg82YmcmFwXwsrDZe05Z/aV/JKrvQIcp4Q8ORoAHL9MOtdKP7uolPcYm?=
 =?us-ascii?Q?UtYKvpajN2a5l4GB6ARfgQNeEs9tLACc6pI2tPdT4gUcMSiSA6FIu4SCJ4LS?=
 =?us-ascii?Q?Xu0vCf90Ux5saQoq3b/IQa/pnCyigWfXUhPAW5Y+9eZtqNUEAE7+vr0+xxLN?=
 =?us-ascii?Q?CqVu38+IjSSoM3uG/2Ou1S/Y05mVl4HyEihUaLQ/DcV0atzBwub9BLag8M5q?=
 =?us-ascii?Q?l31fj4bUS3q/N/3cGZVRKWOWJzzA1Rvs46xxGuI6zJKxZyatRVpN3pRdiWl6?=
 =?us-ascii?Q?35uP70LbMLHlmQg1glf6570eoGTUqv59/x28eTIlboxr7YpCQLX+RNbobbNY?=
 =?us-ascii?Q?Dezcvrc342UVI2sfETAE7PwM9JaLbilZ+LYWFh581CXjDN6zAIdUb0b+DucI?=
 =?us-ascii?Q?JzPiTbclH8ocmy5X9Qx8Qwzip19KVJBKBHRmg6zxH8+UgeFoO0CLDnJQ9QGl?=
 =?us-ascii?Q?oJ3m1+V3h32LTx85dE+Tc7Glv0vrf8dtpyM7tyr7tebgyYbVyw8/WcFGeHMF?=
 =?us-ascii?Q?oBob78EDsk2ZkM7KfrKp3domNS2WEkGEfwOoh9s9bEMZ1SUP+uxKbwO/UME9?=
 =?us-ascii?Q?0hSoSxZtD97osKgvYG9cPNOdPQNeh3U6qFnS7RzR0VvwABJvDILOUnZyczb2?=
 =?us-ascii?Q?9fHDbZ3yjv8zaDNPYT6xgTr1b9+ItOXpiS7lf/pcZ18mhV3m2mM0hYJ0o29/?=
 =?us-ascii?Q?V5f+LNQMLHDAwL4wDsMB5Sdm8/t2+r4J8R7ypucz8D01SNwfJY+UQf1dUpYQ?=
 =?us-ascii?Q?XWQOUaOOcrmWxC3N4hAfZMyQ0AP6rXEtTixOBbpf6AR3dHZ3wYbiwnoQON7C?=
 =?us-ascii?Q?YZqn8m9bA31ySurosWFpAc3U43Hqjaoyj5EZNzsGu5HDx6CDrUAfda1DP+mi?=
 =?us-ascii?Q?1R4tEkKcxf6Ahcz8IQXtGQ92DktNAtTC6PB93G8lPjpzuheY2KTvxcz6rGPP?=
 =?us-ascii?Q?tzj9EcxFQhUETT5FDlZUMN0ZmlGa9Sgy2Z9BfdbnIK/G+p+LV4KCRe1bMroD?=
 =?us-ascii?Q?pw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb88d62-d15f-458e-fb04-08dd8e01edaa
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 07:28:29.2582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rPPojCffKSZj9L1yEa6yaYTj5wdFTen4dGsf/SrVkDXUN4mPE1xZRpiDoup+N3tBf0hE4d14uaSm6HYff3OZ96owkLqpKD9+tRrK4DLYog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4873
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=681c5d1f cx=c_pps a=yneE0G6ieORTwLKR6pgPXw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=uMbn3sPTPbe_AwAnJY4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fLRsxtcV0cF1WjZtBezAlivOP2ILeYOP
X-Proofpoint-ORIG-GUID: fLRsxtcV0cF1WjZtBezAlivOP2ILeYOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA2NCBTYWx0ZWRfX8tWCAk4ZEsMp E1wdmS3o91eDVOqNfczYnWuFCNr0/UKvBE0zdfacccAzmnYgRnSsTKRQDod5AQJVbkA5xYGkqUq PaME/mf9cLq/zsv04OEig1VNkYnMP3Udd5A687Gy1+mK1qM3GGQAvjt18dub0SB7yV+/uGns86x
 bKNJZuCclD/VN4zwwBkJhxvqaAgpZGQbHEzdTmHjNxSNzoJ/u70sdLjuOsO78LoNMrMIEyytAZl O6cUj1Ag74vbqiYSfWRSaJi9kcxAq0XyGEEb+zgUz8i2LdWWHYuQTmr2R8sl9122Erou501IDPW w96gXPEqFh0ysWrEfEWIzqirrpknTF0l8dHSn7xD22m5i9+qeaVjJe5LeEq3enl2Z6LKGxq2BKE
 COIv/ZQXeYGy3J1IQmAV0RwlH7ojEdC4QNUVIDskf0nvJvwOLj4EEIZWrdc6NnNt0Zuz2X+3
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=856
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505080064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 07:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216143

From: Ovidiu Panait <ovidiu.panait@windriver.com>

If 'single-binary' PACKAGECONFIG is enabled, help-version.sh ptest fails:
FAIL: tests/help/help-version
=============================

ginstall: missing file operand
Try 'ginstall --help' for more information.
FAIL: ginstall
FAIL tests/help/help-version.sh (exit status: 1)

The tescase expects 'single_binary_progs' variable to contain an 'install'
entry, rather than 'ginstall', so update the Makefile in coreutils-ptest to
reflect this. Note that this is already handled in the non single-binary case
with a similar sed command.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_9.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index fe2cf73d40..a95644d22d 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -220,6 +220,8 @@ do_install_ptest () {
         find "${D}${PTEST_PATH}/src" -type f -exec \
             sed -i -e 's:${B}/src/coreutils:/usr/bin/env -S coreutils:g' \
             {} +
+
+        sed -i '/^single_binary_progs/s/ginstall/install/g' ${D}${PTEST_PATH}/Makefile
     fi
 }
 
-- 
2.34.1


