Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EE4C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 06:23:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41349.1718864598441172299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 23:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=69014dff4d=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K6MB0g024812
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 06:23:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujbdsbjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 06:23:17 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45K6NGMS026050
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 06:23:17 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujbdsbjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 06:23:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkCBMuWbQGOiADLUEstiAxLFNszFAR9YOSuvERcmsI+C/v/f5lhamJ7Rc7BIRbBiQSNyf4iQOEd92e6NC7F62Biej/WH59wUImJM8RMn83Wu+OEbAQPPW0f/fRctgD6TPhg2b/5ODhgza7B9jLqgOinDpgE7MBI5fb2mC0Otcq3O6PxqVrBjLqvwB5pwiAOkiCsRUDuVcjPXeOatIhdSDN+JAL0KHfma+xyiupXtwA+e6JUTvliD/bHi57YIKs39zn5ThUWGV+DIKJYb6AeGOyXkUYulga9J9gZy02OQ7dCzf8JoNBCUX53k6BVye1ij0FJ/p0IuPfCxuCd6XbqqqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0nP74wNO2lKhf2+TykjdbFcSYuCj3fzA2SooLIrH44=;
 b=Hg4f+gRgmnNjEZF1adzbT5gmhgdXu8OOEZkbmzq572hPriZe0cyihDO5LHCqVeMllSZax9kp0VduWJMlukZ9NmDJ/2ZTuTBZ0aUmf6sRiIjA5lL3NEJMllAkNB3EkhGE+FOB9LyCwB6wvTACI/cRoFhbreQUDZkPCSw4Ll/JNr4B6saCLbTbfI2ab/d/MqFmksUflzvB+CfInUD2A2gy1Oi2drn3IhmB4D2KNPn+oDl2A49jlW/5TOFLqKnNv12q7dSr/3pzvUqgoJYMqxU4b6lQAlGUiWCOi2GJ666Og8Odx//PxaIvSO3F+3T08zkkaN+ZlYU8UjZM5m7dq33CDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by IA0PR11MB8333.namprd11.prod.outlook.com (2603:10b6:208:491::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 06:23:11 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%5]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 06:23:09 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com,
        raj.khem@gmail.com
Subject: [PATCH] binutils: stable 2.42 branch updates
Date: Wed, 19 Jun 2024 23:22:44 -0700
Message-ID: <20240620062244.3853363-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0153.namprd05.prod.outlook.com
 (2603:10b6:a03:339::8) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|IA0PR11MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5e955c-f4b4-4806-9f4c-08dc90f17417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|376011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PrhOPNCMJJZRdLDcXqR51frVasLbbh46V/U8WWXn4IAzpph1sz3hcbcN3o9D?=
 =?us-ascii?Q?hRvejQEvh4JtVNU+8ne5e6e+Iwc6flwj7/tNpmR91807Jq+6xYbgdl3nHrzj?=
 =?us-ascii?Q?6Hnu0IZyXtJoi45He3DHI1GDfikgPQQMAfAzZGIqGLHTSpwQmqVjHQn4gzCf?=
 =?us-ascii?Q?QFtw177tyH4o3MrGxZvBuU9B/O2LSzwnf1b+aUScZ9rNXYPxkjTm0D0KZcrY?=
 =?us-ascii?Q?gN3TYcZfQQOnUW+gM7ZVCMNKd7lqxUCwkkxT8QwFptU0aDCyPD0CGR/sLYvO?=
 =?us-ascii?Q?FN2kLq7zb7cYPAbZL5D1dHOyGFujo0Y3j0KKMXKsR6EdfEknzZcKAZxqc0GE?=
 =?us-ascii?Q?5GHa/VIL5YCsPiXKRlUzBjx6HFmtqCGQ6UassQUF6rToW4PQXM8GTgOyWOB+?=
 =?us-ascii?Q?FNN9Um2ad2gAw/i1KrzpmB05DFsERn+zUjzhY61oHmw2b5T+3jrN9DvThaXj?=
 =?us-ascii?Q?yZ7g4prML7TsIQ+EPW82JWACE46JitcclL5/4zs9US7HK3DO/EuM1cqsux7E?=
 =?us-ascii?Q?a861/28A5/QHkUNE7tTllHixODclNgtzwsm/ccOSPPToWvN2tSqpLuSYkAMB?=
 =?us-ascii?Q?aTCEI1F4ofheOYQJi5Yyh5gxyATs1I+eQ0nGrQYZX+35Ix+SyTXGkWsW/Bt3?=
 =?us-ascii?Q?1Wsn7mmo50+lMG2hxXVgQBetGG7oLeGLQwPUtEOw0GaJD8tyAJ/CWtDgMyvo?=
 =?us-ascii?Q?7+6K0idWa/u2DC2upSlBxaNiYd0ZntQ29uchgKi0xnWb1lJuOgSkw1BR5Fyq?=
 =?us-ascii?Q?nQd8BPTAfm3VZeGnKyzy+baSfFto5D7m6PkNdt92UT/EhKTZMzLaJDCaxTGf?=
 =?us-ascii?Q?BfJ6xpX8ES/LreQD2ivBiPujmbqd2jY+iZdv9CXV804UOpRpp/UzmTJzhEZG?=
 =?us-ascii?Q?ln/tITrfOg1H3fxp50QTfPviDDFSDN804Ow4hVhYQw/B76idyANwzrnOnU5S?=
 =?us-ascii?Q?hP2Ic+CrFfoY5LVJyeCWydlBXOf8A9/MJy1tEt77urg5Ti6aN0qEDPVcLZAT?=
 =?us-ascii?Q?++MT7ftFqe+SKxiOXfdCngRdrmynZy77gJVEWnw3OhKW9nvOZQa57+9U1Q+A?=
 =?us-ascii?Q?RqA+oDdjPZxaWocVLbGqhjq837KF8IOY4qUU5wf/wFFsemh3c7wI275x9zZ9?=
 =?us-ascii?Q?X6QWdmrxhWt155E5xvCPeTM8/IiFz8lcOJrk5PVkZtwVKMX2LLN/pHgdDYOW?=
 =?us-ascii?Q?mRi59fjBEX7A8dUq74OETjBMGnpX3Ak23EwZdFUdEiOs/YvneFi4FKW5xHwi?=
 =?us-ascii?Q?jXS94cEa8jY7FsXJthSPk8Oi31Hk+XflU7H1nch4Is/wy8MPbM5dzFp1I8nk?=
 =?us-ascii?Q?v5I8aXlLwQsWHhljnleD5I81?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(376011)(1800799021)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fu3rq+7ztlzrwHvxDg1dq0ellwM97KE3iGz1k0WX42eCOuDg1D1KME+Nt9TI?=
 =?us-ascii?Q?lSyRIrf/2E567IyWHbU3hG+vLUjsLdjvtFjGK6/k7MjlLOVuspKS9exej8YN?=
 =?us-ascii?Q?3Fs8+KkD8fE6rwh28MmsJkKyO1eca6thQRH554Qu/tNkqiZx+bdmqGmhkLpN?=
 =?us-ascii?Q?5g2PlSe/rgY8uNPnGEn5E431/7KDsTuMkK0bI5phggCeWy4SS041/kJ4rAC0?=
 =?us-ascii?Q?JQ//eMr223H70gKKGm2qSxMMRv0y/MiB2GZqGnX09xWGT21J3GvuZ7D5/ChR?=
 =?us-ascii?Q?UB01J0oPSuDVz58mNKUbcS2D+11aKqth80ogdInvwkuBiJLDgNLU6cvj/SjT?=
 =?us-ascii?Q?SokF43Ei1SrPImiKeY+4fkv13rs6i4WeM0rvxiC35Vc1w7Yo9mjXZOssdfGq?=
 =?us-ascii?Q?saforx2wvrPYc3TMtF0hhcl/S8rtpV1Uuq60so14wzl8cRk9dEg0Qc48xXCM?=
 =?us-ascii?Q?Jvr3uc+V2drS8m3yRor/Z1RWHwJI2cb3NQuNIWYegoEIOr3POV/nIV4AxlZK?=
 =?us-ascii?Q?AvNdDzl/SicKc4CioOQAunXT1jqQ2qwZA7s3byaet+g9789YlGc1D7RKAskM?=
 =?us-ascii?Q?iNJhalupztBUCcTB5a0VZ4G98ucRPzG707wbzqlOy7zZg3JrycbGhdmrl2EM?=
 =?us-ascii?Q?HpxlPLNlFDYssEw5Y4VeKD8bPVIJJFIUjfYInsRQzjduUUX9HWCkmlCB3FnY?=
 =?us-ascii?Q?dTu28wLLFgFU5y24lPLqDiwi/aWMgxMHERFAXlj0iAIj7AnQ0Hi6/f/LgUdV?=
 =?us-ascii?Q?Etst1uowFLgR1tsTwJVYp9u+i5z57h9rUuHrIKFMxiqGbsfOMe4wE5xfbNO7?=
 =?us-ascii?Q?5ElM3I8Rg2D5vJ6RUrQemAPMLf2nn4ijBTXhUb4WZ6lsyXb0NP4iq0/+p6a+?=
 =?us-ascii?Q?v2zdwn6MSw8dVmlyZ5cEFtheYvHFrIvEU9dVgHzGZeSKCUUs55Sg6oWQ/UdX?=
 =?us-ascii?Q?guALcewccRgz3qjW/sGTpjNu/zX7OeE8iXrbRm6l+9RBvCy+HyQNYhdNJEfM?=
 =?us-ascii?Q?/npKNxPYys28dLel1N3H5qnxF+0LxrS/pQSqXTwE2+8I+nezzcHe7wDv6V+l?=
 =?us-ascii?Q?EBVbPAmIyz+P62Y4+piLBDsik2qAUaJAXnJ51pln9RMmpyN1/T/XBJgUXBOI?=
 =?us-ascii?Q?ZF/ALZfKFCUSFFHOyYLQhrrdQn4stC1H0+6DJmSYs2oR8KocTB8SwPxYwCX6?=
 =?us-ascii?Q?J0vYK9pGKdPBTP7FpOiorLlctbJy6hrixfjZ15Ek2vsTvhiNbPeewh172RsP?=
 =?us-ascii?Q?5bYyh2MthaD92KrPg9HyRbWkZ5ok9fNmj38PznxLGO26gUNjmcprPjuzXTGC?=
 =?us-ascii?Q?db83k9RA1j3Raao8Me0RxjZIQ0YBnN02sxce9mjblTTffGzbwO5II5DYnECP?=
 =?us-ascii?Q?6S/V5zSfkz8SmTWzBBf/G06jekgcMqbo7qOD6YMLZWxzVNMwfUb9ZnNyTYWu?=
 =?us-ascii?Q?lOtaq+OhzcZim7qs0xQ/xPu6d9trojvrfhLvWcsPO0YVR0vR9n50aajJ09+J?=
 =?us-ascii?Q?jGRmul4uGgAqSc6yJrxC3VU2NvPz0TMbAZSnAlXRHCeIhdvFmV+zv8rQN1uY?=
 =?us-ascii?Q?PZU0WzCTnzzXRe6MwwQb7HPpQemVb1+EoqlU4gV7KY7CW32fp9ERn669+flo?=
 =?us-ascii?Q?0vqjNv4v7FDbWzOB6oNXf6Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5e955c-f4b4-4806-9f4c-08dc90f17417
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 06:23:09.0636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zY6D7B/PVDeDWkaG+JTlWdDUnUsy+nnPkyqQAcA9qT8uNpuQmyWO0S58EwQgZ/Au+NY1ndUbn0SJaq/7kwwxrJJpHqoA0t3hMHwMkJ/cNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8333
X-Proofpoint-ORIG-GUID: LWXzNrfC5h0qrtmcvF_muC1C9tm7ZJpK
X-Proofpoint-GUID: aPaEQtPegzsPBOzC9l1W9OfOi_28gMrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_03,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406200045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 06:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200939

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on binutils-2.42 stable branch are updated.

6c360d37662 PR31898 bug in processing DW_RLE_startx_endx
bfda03eed33 aarch64: Remove asserts from operand qualifier decoders

Dropped: 0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 .../binutils/binutils-2.42.inc                |   3 +-
 ...sserts-from-operand-qualifier-decode.patch | 382 ------------------
 2 files changed, 1 insertion(+), 384 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index d4e94d0162..c8f526b5c7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "73b22b4481e85635eb978585f405c4433bcc0174"
+SRCREV ?= "cbec9028dd3fa9b49e0204f1a989cea67cae32c6"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -36,6 +36,5 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
-     file://0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch b/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
deleted file mode 100644
index 7b52425a38..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
+++ /dev/null
@@ -1,382 +0,0 @@
-From 5b1c70bfe0d8f84dc28237d6150b7b9d57c791a8 Mon Sep 17 00:00:00 2001
-From: Victor Do Nascimento <victor.donascimento@arm.com>
-Date: Tue, 16 Apr 2024 11:49:15 +0100
-Subject: [PATCH] aarch64: Remove asserts from operand qualifier decoders
- [PR31595]
-
-Given that the disassembler should never abort when decoding
-(potentially random) data, assertion statements in the
-`get_*reg_qualifier_from_value' function family prove problematic.
-
-Consider the random 32-bit word W, encoded in a data segment and
-encountered on execution of `objdump -D <obj_name>'.
-
-If:
-
-  (W & ~opcode_mask) == valid instruction
-
-Then before `print_insn_aarch64_word' has a chance to report the
-instruction as potentially undefined, an attempt will be made to have
-the qualifiers for the instruction's register operands (if any)
-decoded.  If the relevant bits do not map onto a valid qualifier for
-the matched instruction-like word, an abort will be triggered and the
-execution of objdump aborted.
-
-As this scenario is perfectly feasible and, in light of the fact that
-objdump must successfully decode all sections of a given object file,
-it is not appropriate to assert in this family of functions.
-
-Therefore, we add a new pseudo-qualifier `AARCH64_OPND_QLF_ERR' for
-handling invalid qualifier-associated values and re-purpose the
-assertion conditions in qualifier-retrieving functions to be the
-predicate guarding the returning of the calculated qualifier type.
-If the predicate fails, we return this new qualifier and allow the
-caller to handle the error as appropriate.
-
-As these functions are called either from within
-`aarch64_extract_operand' or `do_special_decoding', both of which are
-expected to return non-zero values, it suffices that callers return
-zero upon encountering `AARCH64_OPND_QLF_ERR'.
-
-Ar present the error presented in the hypothetical scenario has been
-encountered in `get_sreg_qualifier_from_value', but the change is made
-to the whole family to keep the interface consistent.
-
-Bug: https://sourceware.org/PR31595
-
-Upstream-Status: Backport [commit 2601b201e95ea0edab89342ee7137c74e88a8a79]
-
-Signed-off-by: Mark Hatle <mark.hatle@amd.com>
----
- .../testsuite/binutils-all/aarch64/illegal.d  |  1 +
- .../testsuite/binutils-all/aarch64/illegal.s  |  3 +
- include/opcode/aarch64.h                      |  3 +
- opcodes/aarch64-dis.c                         | 98 +++++++++++++++----
- 4 files changed, 87 insertions(+), 18 deletions(-)
-
-diff --git a/binutils/testsuite/binutils-all/aarch64/illegal.d b/binutils/testsuite/binutils-all/aarch64/illegal.d
-index 4b90a1d9f39..b69318aec85 100644
---- a/binutils/testsuite/binutils-all/aarch64/illegal.d
-+++ b/binutils/testsuite/binutils-all/aarch64/illegal.d
-@@ -8,5 +8,6 @@ Disassembly of section \.text:
- 
- 0+000 <.*>:
- [ 	]+0:[ 	]+68ea18cc[ 	]+.inst[ 	]+0x68ea18cc ; undefined
-+[ 	]+4:[ 	]+9dc39839[ 	]+.inst[ 	]+0x9dc39839 ; undefined
- #pass
- 
-diff --git a/binutils/testsuite/binutils-all/aarch64/illegal.s b/binutils/testsuite/binutils-all/aarch64/illegal.s
-index 216cbe6f265..43668c6db55 100644
---- a/binutils/testsuite/binutils-all/aarch64/illegal.s
-+++ b/binutils/testsuite/binutils-all/aarch64/illegal.s
-@@ -4,4 +4,7 @@
- 	# ldpsw   x12, x6, [x6],#-8 ; illegal because one of the dest regs is also the address reg
- 	.inst 0x68ea18cc
- 
-+	# illegal, resembles the opcode `ldapur' with invalid qualifier bits
-+	.inst 0x9dc39839
-+
- 	# FIXME: Add more illegal instructions here.
-diff --git a/include/opcode/aarch64.h b/include/opcode/aarch64.h
-index 2fca9528c20..e8fe93ef127 100644
---- a/include/opcode/aarch64.h
-+++ b/include/opcode/aarch64.h
-@@ -894,6 +894,9 @@ enum aarch64_opnd_qualifier
-   /* Special qualifier helping retrieve qualifier information during the
-      decoding time (currently not in use).  */
-   AARCH64_OPND_QLF_RETRIEVE,
-+
-+  /* Special qualifier used for indicating error in qualifier retrieval.  */
-+  AARCH64_OPND_QLF_ERR,
- };
- 
- /* Instruction class.  */
-diff --git a/opcodes/aarch64-dis.c b/opcodes/aarch64-dis.c
-index 96f42ae862a..b70e6da9eb7 100644
---- a/opcodes/aarch64-dis.c
-+++ b/opcodes/aarch64-dis.c
-@@ -219,9 +219,10 @@ static inline enum aarch64_opnd_qualifier
- get_greg_qualifier_from_value (aarch64_insn value)
- {
-   enum aarch64_opnd_qualifier qualifier = AARCH64_OPND_QLF_W + value;
--  assert (value <= 0x1
--	  && aarch64_get_qualifier_standard_value (qualifier) == value);
--  return qualifier;
-+  if (value <= 0x1
-+      && aarch64_get_qualifier_standard_value (qualifier) == value)
-+    return qualifier;
-+  return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Given VALUE, return qualifier for a vector register.  This does not support
-@@ -237,9 +238,10 @@ get_vreg_qualifier_from_value (aarch64_insn value)
-   if (qualifier >= AARCH64_OPND_QLF_V_2H)
-     qualifier += 1;
- 
--  assert (value <= 0x8
--	  && aarch64_get_qualifier_standard_value (qualifier) == value);
--  return qualifier;
-+  if (value <= 0x8
-+      && aarch64_get_qualifier_standard_value (qualifier) == value)
-+    return qualifier;
-+  return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Given VALUE, return qualifier for an FP or AdvSIMD scalar register.  */
-@@ -248,9 +250,10 @@ get_sreg_qualifier_from_value (aarch64_insn value)
- {
-   enum aarch64_opnd_qualifier qualifier = AARCH64_OPND_QLF_S_B + value;
- 
--  assert (value <= 0x4
--	  && aarch64_get_qualifier_standard_value (qualifier) == value);
--  return qualifier;
-+  if (value <= 0x4
-+      && aarch64_get_qualifier_standard_value (qualifier) == value)
-+    return qualifier;
-+  return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Given the instruction in *INST which is probably half way through the
-@@ -263,13 +266,17 @@ get_expected_qualifier (const aarch64_inst *inst, int i)
- {
-   aarch64_opnd_qualifier_seq_t qualifiers;
-   /* Should not be called if the qualifier is known.  */
--  assert (inst->operands[i].qualifier == AARCH64_OPND_QLF_NIL);
--  int invalid_count;
--  if (aarch64_find_best_match (inst, inst->opcode->qualifiers_list,
--			       i, qualifiers, &invalid_count))
--    return qualifiers[i];
-+  if (inst->operands[i].qualifier == AARCH64_OPND_QLF_NIL)
-+    {
-+      int invalid_count;
-+      if (aarch64_find_best_match (inst, inst->opcode->qualifiers_list,
-+				   i, qualifiers, &invalid_count))
-+	return qualifiers[i];
-+      else
-+	return AARCH64_OPND_QLF_NIL;
-+    }
-   else
--    return AARCH64_OPND_QLF_NIL;
-+    return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Operand extractors.  */
-@@ -355,6 +362,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
- 	  aarch64_insn value = extract_field (FLD_imm4_11, code, 0);
- 	  /* Depend on AARCH64_OPND_Ed to determine the qualifier.  */
- 	  info->qualifier = get_expected_qualifier (inst, info->idx);
-+	  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	    return 0;
- 	  shift = get_logsz (aarch64_get_qualifier_esize (info->qualifier));
- 	  info->reglane.index = value >> shift;
- 	}
-@@ -374,6 +383,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
- 	  if (pos > 3)
- 	    return false;
- 	  info->qualifier = get_sreg_qualifier_from_value (pos);
-+	  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	    return 0;
- 	  info->reglane.index = (unsigned) (value >> 1);
- 	}
-     }
-@@ -381,6 +392,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
-     {
-       /* Need information in other operand(s) to help decoding.  */
-       info->qualifier = get_expected_qualifier (inst, info->idx);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       switch (info->qualifier)
- 	{
- 	case AARCH64_OPND_QLF_S_4B:
-@@ -405,6 +418,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
- 
-       /* Need information in other operand(s) to help decoding.  */
-       info->qualifier = get_expected_qualifier (inst, info->idx);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       switch (info->qualifier)
- 	{
- 	case AARCH64_OPND_QLF_S_H:
-@@ -644,9 +659,15 @@ aarch64_ext_advsimd_imm_shift (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 	 1xxx	1	2D  */
-       info->qualifier =
- 	get_vreg_qualifier_from_value ((pos << 1) | (int) Q);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return false;
-     }
-   else
--    info->qualifier = get_sreg_qualifier_from_value (pos);
-+    {
-+      info->qualifier = get_sreg_qualifier_from_value (pos);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-+    }
- 
-   if (info->type == AARCH64_OPND_IMM_VLSR)
-     /* immh	<shift>
-@@ -773,6 +794,8 @@ aarch64_ext_advsimd_imm_modified (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 
-   /* cmode */
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
-   switch (info->qualifier)
-     {
-     case AARCH64_OPND_QLF_NIL:
-@@ -1014,6 +1037,8 @@ aarch64_ext_ft (const aarch64_operand *self ATTRIBUTE_UNUSED,
-       if (value > 0x4)
- 	return false;
-       info->qualifier = get_sreg_qualifier_from_value (value);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
- 
-   return true;
-@@ -1086,6 +1111,8 @@ aarch64_ext_rcpc3_addr_offset (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 			       aarch64_operand_error *errors ATTRIBUTE_UNUSED)
- {
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
- 
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-@@ -1105,6 +1132,8 @@ aarch64_ext_addr_offset (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 			 aarch64_operand_error *errors ATTRIBUTE_UNUSED)
- {
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
- 
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-@@ -1154,6 +1183,8 @@ aarch64_ext_addr_regoff (const aarch64_operand *self ATTRIBUTE_UNUSED,
-       /* Need information in other operand(s) to help achieve the decoding
- 	 from 'S' field.  */
-       info->qualifier = get_expected_qualifier (inst, info->idx);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       /* Get the size of the data element that is accessed, which may be
- 	 different from that of the source register size, e.g. in strb/ldrb.  */
-       size = aarch64_get_qualifier_esize (info->qualifier);
-@@ -1172,6 +1203,8 @@ aarch64_ext_addr_simm (const aarch64_operand *self, aarch64_opnd_info *info,
- {
-   aarch64_insn imm;
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
- 
-   /* Rn */
-   info->addr.base_regno = extract_field (FLD_Rn, code, 0);
-@@ -1210,6 +1243,8 @@ aarch64_ext_addr_uimm12 (const aarch64_operand *self, aarch64_opnd_info *info,
- {
-   int shift;
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
-   shift = get_logsz (aarch64_get_qualifier_esize (info->qualifier));
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-@@ -1228,6 +1263,8 @@ aarch64_ext_addr_simm10 (const aarch64_operand *self, aarch64_opnd_info *info,
-   aarch64_insn imm;
- 
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-   /* simm10 */
-@@ -2467,6 +2504,8 @@ decode_sizeq (aarch64_inst *inst)
-   if (mask == 0x7)
-     {
-       inst->operands[idx].qualifier = get_vreg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       return 1;
-     }
- 
-@@ -2649,6 +2688,8 @@ do_special_decoding (aarch64_inst *inst)
-       idx = select_operand_for_sf_field_coding (inst->opcode);
-       value = extract_field (FLD_sf, inst->value, 0);
-       inst->operands[idx].qualifier = get_greg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       if ((inst->opcode->flags & F_N)
- 	  && extract_field (FLD_N, inst->value, 0) != value)
- 	return 0;
-@@ -2659,6 +2700,8 @@ do_special_decoding (aarch64_inst *inst)
-       idx = select_operand_for_sf_field_coding (inst->opcode);
-       value = extract_field (FLD_lse_sz, inst->value, 0);
-       inst->operands[idx].qualifier = get_greg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
-   /* rcpc3 'size' field.  */
-   if (inst->opcode->flags & F_RCPC3_SIZE)
-@@ -2670,12 +2713,18 @@ do_special_decoding (aarch64_inst *inst)
- 	{
- 	  if (aarch64_operands[inst->operands[i].type].op_class
- 	      == AARCH64_OPND_CLASS_INT_REG)
--	    inst->operands[i].qualifier = get_greg_qualifier_from_value (value & 1);
-+	    {
-+	      inst->operands[i].qualifier = get_greg_qualifier_from_value (value & 1);
-+	      if (inst->operands[i].qualifier == AARCH64_OPND_QLF_ERR)
-+		return 0;
-+	    }
- 	  else if (aarch64_operands[inst->operands[i].type].op_class
- 	      == AARCH64_OPND_CLASS_FP_REG)
- 	    {
- 	      value += (extract_field (FLD_opc1, inst->value, 0) << 2);
- 	      inst->operands[i].qualifier = get_sreg_qualifier_from_value (value);
-+	      if (inst->operands[i].qualifier == AARCH64_OPND_QLF_ERR)
-+		return 0;
- 	    }
- 	}
-     }
-@@ -2709,7 +2758,11 @@ do_special_decoding (aarch64_inst *inst)
-       /* For most related instruciton, the 'size' field is fully available for
- 	 operand encoding.  */
-       if (mask == 0x3)
--	inst->operands[idx].qualifier = get_sreg_qualifier_from_value (value);
-+	{
-+	  inst->operands[idx].qualifier = get_sreg_qualifier_from_value (value);
-+	  if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	    return 0;
-+	}
-       else
- 	{
- 	  get_operand_possible_qualifiers (idx, inst->opcode->qualifiers_list,
-@@ -2744,6 +2797,9 @@ do_special_decoding (aarch64_inst *inst)
-       Q = (unsigned) extract_field (FLD_Q, inst->value, inst->opcode->mask);
-       inst->operands[0].qualifier =
- 	get_vreg_qualifier_from_value ((num << 1) | Q);
-+      if (inst->operands[0].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-+
-     }
- 
-   if ((inst->opcode->flags & F_OPD_SIZE) && inst->opcode->iclass == sve2_urqvs)
-@@ -2753,7 +2809,11 @@ do_special_decoding (aarch64_inst *inst)
- 				       inst->opcode->mask);
-       inst->operands[0].qualifier
- 	= get_vreg_qualifier_from_value (1 + (size << 1));
-+      if (inst->operands[0].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       inst->operands[2].qualifier = get_sreg_qualifier_from_value (size);
-+      if (inst->operands[2].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
- 
-   if (inst->opcode->flags & F_GPRSIZE_IN_Q)
-@@ -2772,6 +2832,8 @@ do_special_decoding (aarch64_inst *inst)
-       assert (idx == 0 || idx == 1);
-       value = extract_field (FLD_Q, inst->value, 0);
-       inst->operands[idx].qualifier = get_greg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
- 
-   if (inst->opcode->flags & F_LDS_SIZE)
--- 
-2.34.1
-
-- 
2.43.0


