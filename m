Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41E5D3517A
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 12:08:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11520.1775045288239488591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 05:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Fu23CoIh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8551b4ea6b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6315KPYM879862
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Apr 2026 05:08:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=WR9tYsfq1
	/uyxxDXcL1n4E7Xfw8Y920xrVk/nV6mZxo=; b=Fu23CoIhedRp+mh9iJaFcqj2C
	UpTbEnppBHTRbxie9xAFZr3pPLjQnAYWO2IYmuE6Wr6slsgHrMkT13FYrIlb1A48
	tza1wwXnXckhwQZ2btfySHNj8k+FUetTXzBBhaPg/eqsj+aMTxR3+yl5pZ+Ac+Rr
	3BjfiyoYkj1YOux4hlv5iIyVV7PYInAv0y2tQkODgPju0p9fb8eRmH11xc71TLRO
	WB4HSjUYMc3RKovnKvSIM7TqfNrM36pZNb53fDJagDanOtbrn4qKVsVhhhqhiw/V
	taNioVHnvH6zLifZ0FsV5Wrkrcdrpd8by1tTNJgJwrDrnxbneHwAxvlX6wC/w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6a8vdamw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 05:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bci1yS8jtsZicZljnA5YACGG4PIGZ+gPe6isqWzNVpN8ugzxW8K3QHW2r/VLJtdXw5DRQVEZu3y6NkzkDRGcO6I0wlXlwgFDCAALUvpBlJAryVlwGKQZYaDCHwWiICCtHJGf4twUf2LDhd4dN+v0IOHtE12aeEPbOKzXQstmUlXSkq6LuqRjY3VhLyJYC64lOlflFVYyZXger8CZhBIfwq61Famtqn3FYIG/qb4qfapeMiZGzODQKSF3stJPSYQOu9rUszW0kQcQAZ4W0eJhiibNH67Z6RBNL8lZbAPE0qbLpodkDRhj2CFS9AnF7x2wKKXbpNnicCd/KP9VBP4fiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR9tYsfq1/uyxxDXcL1n4E7Xfw8Y920xrVk/nV6mZxo=;
 b=eQ8wE4NUMAZvYXesi9TncLS+2t06PAvRtaNhQQKXdM23xQZNSg4UPrCOBhfYO5g7lznWO2TvuN+ntSgVJl/Ea2n/Q0Zio5VRAbhSreLjbi+EjMYwWcOlCMtBZ+fWsnMSos2DdcA2Z3mNiAB6HlLDdB0dDioQlG4L1zRFWk6xuPcpLsqhIpVcfGAPMAr1HH5AwPP4J8ZykCSGupgs4/WzSX+NfHn3Z+03bpGEwg1/FZihBxqcO8UqZ9p4IULp/1byoXXvXL5JcFfgyzYQmlRP0hdXmvQ7xABsruvDZ7BjGslXGeJ8yhyAhOgAflYhywDD/uSPYIBKpmO2njHjHtePew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by CH8PR11MB9505.namprd11.prod.outlook.com (2603:10b6:610:2bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 12:08:05 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 12:08:05 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] clang: Drop 0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch
Date: Wed,  1 Apr 2026 05:07:45 -0700
Message-ID: <20260401120745.2047538-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|CH8PR11MB9505:EE_
X-MS-Office365-Filtering-Correlation-Id: a4337d5f-ef2f-458f-bc56-08de8fe7548c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|18002099003|56012099003|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	n88vu9XFr+xmQSSzzDfsS3a3PVeWlbrsh4dV2KjPVvhVlaDcNt/TDxTbRzQK5apTo2YgnocGgGFglDa3N3CieM2BpDHqdtMuHOPoVYxfoIxk3yPEczwhSabTtcndDXLnXW56AUjXJYyV3qVBK4o8/GvaV0txPk/de5NQbpXZV/IYewT7gKwNEv43WLIt7UjH6rp8rWjYNAwwEubG4icA0w4JUNTOa9TA3W4/VRm8HWBxYo5uxc3Oe4aEZmuDRYWwSvdoKh7gZvGLjC10iEkEqRBiFtLaZiXGiX4CHCa2H6fbrJQi4I+drDzviOdSgA5VDhDzRRkizMu7ZAVrNqVDlGtml7qpApTEujAjNbj7nhdvqhb2hQk7LuECWgpXs/tVhsq7Vu2nf+UFf6ob1dHRlE5fNtjkC4mIP9b+7Bjkjt51nxctGlXvCTb3FLtQtxMqzHtZuPZISRKto8cK5BHZSqnu4AwyCvY09KidPO5Wa3OhmdGfuV+5Iqk0lsNzNNuSzqj5OayuCIEoo0gvNwaL0GmwBtPHRZ88vJvUDVfAPpXg+Z5JdB12x1VbglQFnqgj/m3INciI6MYxwO4r0co8IVF/oj2iSd9iDVfD9dWi7nXFIs0wB9wdAj9dV8J+5+KgGFQ1OMkaoz/8qqCcPUdJf+xM0sIfwQR+95sNtUO6UAmeynAb5B4CYPDcIsRWqK0sZ+zofq8X+uMIysRB7jwlI78q9gumyZE22bgD/Ghes3rFynU0+4Om4ta0dBsmcDQifi6wykrVBrS4O+IiApvAk84P/gVolBzLE3iJMLHOxvo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(18002099003)(56012099003)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DMLPsXs9Fb6n3QYB2Vnu4I0pdoLrq2uDggrGMPsuqmJNATMPVJaDpFw8cOzW?=
 =?us-ascii?Q?gL6I60wAoWSJNZyuo1RmbhqoB3M7Pxqn2wLgyqGrsxW1rjcT1/J/4Jkp2UfO?=
 =?us-ascii?Q?/GsIv7QW/uzxj1dbYqMnJThZBNJgjgCp596Bl4KZ+R+gClNfIPfuf0fbZQXi?=
 =?us-ascii?Q?yZpQjF+5RKK7ERC0Y4zGXu4mFBrjP9T5NwqByrzXATSWMWNJjbO15FZxGTfi?=
 =?us-ascii?Q?m6Kckx4QBxjboKb9C7BjkMHZrMVhB0vcAuHKQgUvqlAJ7Qrm486GHXvxBLBI?=
 =?us-ascii?Q?OyKGoQ60LgkGAsLoxiv5CkuDsFIi0KsLyhWimE0PGC85mo5LEqAxwl3wk4rq?=
 =?us-ascii?Q?G5KzugxzdfMS/OeFZ960O2M4TikggV8xqu2nFXlV2nEL3NtqSU/lC155cY/g?=
 =?us-ascii?Q?H4RDETesAhjTqiqesgBiE/outG+FFCP1VTdAg1v4tsRhu0iVlLNC21CrqGBJ?=
 =?us-ascii?Q?WlvssJ+nAIbFkZG489HTaV1piYKa90HExw+MUjuj651dViir+02LeUbupFU9?=
 =?us-ascii?Q?T7Mb3UhH2qw6BA3sIiLTCl23xnxKrt7tueAk8KMUKoMhFMpJC82v2/7AMrZj?=
 =?us-ascii?Q?xNSyYzcUsc98yrp86R3rTcoUUst13Iw4XCgQHS4KXSiaVUHKHPdMNDhKrz4x?=
 =?us-ascii?Q?lx7wxIwftRWlVNKzQY6q0RnTi3O/l0rGwaOklRt2R8K1izV52ub6S//BQYb+?=
 =?us-ascii?Q?5+diaVBjamuuhQ1wCnGnBaITf3KBYyOfUNp5OlWTCFwyOmNGwy/5xHvES0/r?=
 =?us-ascii?Q?Tq6pndVyfAbmigaDYcr4YgT4pRoDxOjKHMyd3zcH9aemyeU+Rm47oQPfgva6?=
 =?us-ascii?Q?h7zFTxMNV3qG9CF5QsPILQXiASnrxxx/bXxf0z5jDp3C/sM/Yr4HEFVx9fef?=
 =?us-ascii?Q?6hAfD6FmKfdks12XSXm9ViC9o4K2cRD43zdtveMrd1/IS/Ttsvqn+d691IyI?=
 =?us-ascii?Q?xNE7xNWvr3M6fG7B7S7oVItPm/0rxYuTbgKNxwLkwcYOQxAsj1tLNGIe9mzS?=
 =?us-ascii?Q?I/glZf3/d+lfJGHfvbxfKxo3469RMHT7LH3ZkAXXG4wYCQfSxJCsj+PvW+3r?=
 =?us-ascii?Q?CLtoVWFOpK0KkdQ5UWpdDASZICBiKg6SrtxZ/MSr9J3kysRIg1YYRx4mTzwE?=
 =?us-ascii?Q?ubWv+VobD8nKaYifk0oRpA5u4uRj4if7ThfI5koWnfhX+1WkwuC92TEIqa7+?=
 =?us-ascii?Q?Wb0YX8K5cCer9fGVY1sPynFCrowFL5sQM9mQoYuQpP5clG3dRL4yW85gSQVt?=
 =?us-ascii?Q?V+BVZ6kCXAHtKfn2fpeKAlG1mdcnPA32P1l8dMTjFIi3E9/PQNQjXQZGWsaN?=
 =?us-ascii?Q?YlBQLQEj6OH+e3bDH5CbOdwW9Bqq74ZZImHetPvVuL5NC7qOqgAHPf2T1Bqo?=
 =?us-ascii?Q?ARBv835DLb2ghkGRdNqOT+EPldcLrUurbzxu4p8kiHt9OfnL9fvpCZielVY4?=
 =?us-ascii?Q?c1iiL7T+C/pxToIe5Lh2UIg5a2EDKrI31VLM/cvqdNnmNhS0vthn9YnBQKVn?=
 =?us-ascii?Q?eoMcfrRqJwGPh/WcEiNwvRcbOVuQzZoWOpJ1ldYHYvNicqImUDMqOEb7rkg7?=
 =?us-ascii?Q?G8jxQX92DocOAyezsZx1wetrCArClzz40ZlWunHbDRN+bh/x+9wD0y1zt1B/?=
 =?us-ascii?Q?H9k/NNhNuP+Q8+suqkcTzzTrZvoUkeATnaWf/Wxde8KBXabiEC5po/f6gz3T?=
 =?us-ascii?Q?tFlYS39T07BbiYIZtyryYBXM4+wU6y+8UvIQmIW/q7DnYLJFXo8GixQGPYRT?=
 =?us-ascii?Q?qgd22g6ATUSBsl7YAz/Rr7c37bDpX7C/2q2fpSdvNUXWjcEbCehO?=
X-Exchange-RoutingPolicyChecked: 
	uyuG1KyljqxO7Fhhp8P5unlZN5YCur9ktFsvZzikBuvmVL1oy3HcZESs6S55wzylnOQmLMz/1o0bEpsHetpk2eVoWUBOBp4MdRl8LX0W+a+Z38+xrdGol3GTzQqVaRr3/WlGBHzQVttI83gMdn/Oy9OZevNMSNATeXPheAOFlH4HvbZDzCTuB2LLJ4wCTt8nlkvlojpwY1Ybp0a5yf0sGF/FAVh6eKLUJNLmCIhMVevL2dLjXD+2d9rH4OF0BUiswjbcurnAyyLaEpBrGjDQCvG1KSCj//kj77AWlmt4ryyBNGVQvAr+mq9m+V6ziylKUS5FBrH2T417rUT+mRRQ5A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4337d5f-ef2f-458f-bc56-08de8fe7548c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 12:08:05.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAr4NGySOL4rRubOJTNshY8KO306BTg3FSjmSvnONA/Fwx/TzRlhWIGxPjdjj7sqVPg5/rExRiYpxZMQ1V6QO7UAltI1u7aOojKx5D9ro8+Yhb863Vy0i42tKuW3DQvJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9505
X-Proofpoint-GUID: Bc_c_B2xBLBCNYdqbD1CtsoUIdiD20b-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExMSBTYWx0ZWRfX2thxQCMlFVtW
 4UQ0hakFM6+Fx0hsQkSnwIw57rL6USjJ8k7uo/+X8aWIpt8mvQtmrJiJoxvU4H8aF41pMpy2osm
 YOYBRA+aw+6L0Ys3/d8fhgKGgoVaNDHN0JMSMVEiwNEnQJK7bvLwBAyEmClcXA4uZKpk60oLUq6
 obj00UWNa7sDJ+hxTqK/P11IUDsHu1VJNcfqvwW2PtjAUVYBp6HPG2yxSPYF4t+tgoCgD3KDLCK
 DhCEoIsk/fUJHB9+QWWc8tvu+iH5nSfN6DgidLwG2LGZXtK6iNxIrP+A5QRJioxySMm1QMdVz60
 SY4lToi64fptNRIVEAwUe6t0jsyG0RYNeFQC87lxRt0G4THWmNugMdY8eyrSVU8FJF699dwvrvK
 PO0++eKjIdxNqxZETZoJvRWMvD4oRtOF2ameambt66LYEgBav0wi/9QoOCIgVl60DRQxj+8Nxxk
 biDFcCKoMTelx92bQ1A==
X-Proofpoint-ORIG-GUID: Bc_c_B2xBLBCNYdqbD1CtsoUIdiD20b-
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=69cd0aa7 cx=c_pps
 a=A0DLv2vQdyrz0cYTEbm3ig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=yhDHILZwwnGhGAbmfAQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 12:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234344

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Backport the equivalent upstream commit and remove the local patch.

https://github.com/llvm/llvm-project/commit/5bc3d1966b2d0b300c338d85bb38e356f0d12a8c

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...loadArch-UNUSED-to-UNUSED_-to-avoid-.patch | 128 --------
 ...UNKNOWN-elements-of-OffloadArch-enum.patch | 274 ++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |   2 +-
 3 files changed, 275 insertions(+), 129 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch

diff --git a/meta/recipes-devtools/clang/clang/0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch b/meta/recipes-devtools/clang/clang/0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch
deleted file mode 100644
index 2cf0df9aaa..0000000000
--- a/meta/recipes-devtools/clang/clang/0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 4a3e452a3834f3ccb7cbda522f10eadd647de0e0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 5 Jan 2026 18:30:54 -0800
-Subject: [PATCH] [Clang] Rename OffloadArch::UNUSED to UNUSED_ to avoid macro
- collisions
-
-OffloadArch uses an enumerator named `UNUSED`, which is a very common macro name
-in external codebases (e.g. Mesa defines UNUSED as an attribute helper). If such
-a macro is visible when including clang/Basic/OffloadArch.h, the preprocessor
-expands the token inside the enum and breaks compilation of the installed Clang
-headers.
-
-Rename the enumerator to `UNUSED_` and update all in-tree references. This is a
-spelling-only change (no behavioral impact) and mirrors the existing approach
-used for SM_32_ to avoid macro clashes.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- clang/include/clang/Basic/OffloadArch.h  | 2 +-
- clang/lib/Basic/OffloadArch.cpp          | 2 +-
- clang/lib/Basic/Targets/NVPTX.cpp        | 3 ++-
- clang/lib/Basic/Targets/NVPTX.h          | 2 +-
- clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp | 2 +-
- clang/lib/Driver/Driver.cpp              | 6 +++---
- 6 files changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/clang/include/clang/Basic/OffloadArch.h b/clang/include/clang/Basic/OffloadArch.h
-index ea665b1f49e0..b7d6e00f628e 100644
---- a/clang/include/clang/Basic/OffloadArch.h
-+++ b/clang/include/clang/Basic/OffloadArch.h
-@@ -16,7 +16,7 @@ class StringRef;
- namespace clang {
- 
- enum class OffloadArch {
--  UNUSED,
-+  UNUSED_,
-   UNKNOWN,
-   // TODO: Deprecate and remove GPU architectures older than sm_52.
-   SM_20,
-diff --git a/clang/lib/Basic/OffloadArch.cpp b/clang/lib/Basic/OffloadArch.cpp
-index 05177f1c5803..6a743c73473e 100644
---- a/clang/lib/Basic/OffloadArch.cpp
-+++ b/clang/lib/Basic/OffloadArch.cpp
-@@ -17,7 +17,7 @@ struct OffloadArchToStringMap {
- #define GFX(gpu) {OffloadArch::GFX##gpu, "gfx" #gpu, "compute_amdgcn"}
- static const OffloadArchToStringMap ArchNames[] = {
-     // clang-format off
--    {OffloadArch::UNUSED, "", ""},
-+    {OffloadArch::UNUSED_, "", ""},
-     SM(20), {OffloadArch::SM_21, "sm_21", "compute_20"}, // Fermi
-     SM(30), {OffloadArch::SM_32_, "sm_32", "compute_32"}, SM(35), SM(37),  // Kepler
-     SM(50), SM(52), SM(53),          // Maxwell
-diff --git a/clang/lib/Basic/Targets/NVPTX.cpp b/clang/lib/Basic/Targets/NVPTX.cpp
-index 6526eeff3d71..cf2d4bd6f746 100644
---- a/clang/lib/Basic/Targets/NVPTX.cpp
-+++ b/clang/lib/Basic/Targets/NVPTX.cpp
-@@ -64,7 +64,7 @@ NVPTXTargetInfo::NVPTXTargetInfo(const llvm::Triple &Triple,
-   // Define available target features
-   // These must be defined in sorted order!
-   NoAsmVariants = true;
--  GPU = OffloadArch::UNUSED;
-+  GPU = OffloadArch::UNUSED_;
- 
-   // PTX supports f16 as a fundamental type.
-   HasFastHalfType = true;
-@@ -177,6 +177,7 @@ void NVPTXTargetInfo::getTargetDefines(const LangOptions &Opts,
- 
-   // Skip setting architecture dependent macros if undefined.
-   if (!IsNVIDIAOffloadArch(GPU))
-+  if (GPU == OffloadArch::UNUSED_ && !HostTarget)
-     return;
- 
-   if (Opts.CUDAIsDevice || Opts.OpenMPIsTargetDevice || !HostTarget) {
-diff --git a/clang/lib/Basic/Targets/NVPTX.h b/clang/lib/Basic/Targets/NVPTX.h
-index 9bd0cc36d12b..337864ac5c1a 100644
---- a/clang/lib/Basic/Targets/NVPTX.h
-+++ b/clang/lib/Basic/Targets/NVPTX.h
-@@ -87,7 +87,7 @@ public:
-   initFeatureMap(llvm::StringMap<bool> &Features, DiagnosticsEngine &Diags,
-                  StringRef CPU,
-                  const std::vector<std::string> &FeaturesVec) const override {
--    if (GPU != OffloadArch::UNUSED)
-+    if (GPU != OffloadArch::UNUSED_)
-       Features[OffloadArchToString(GPU)] = true;
-     // Only add PTX feature if explicitly requested. Otherwise, let the backend
-     // use the minimum required PTX version for the target SM.
-diff --git a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
-index db0d56d6b18c..6df0b3b3574d 100644
---- a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
-+++ b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
-@@ -2382,7 +2382,7 @@ void CGOpenMPRuntimeGPU::processRequiresDirective(const OMPRequiresDecl *D) {
-       case OffloadArch::Generic:
-       case OffloadArch::GRANITERAPIDS:
-       case OffloadArch::BMG_G21:
--      case OffloadArch::UNUSED:
-+      case OffloadArch::UNUSED_:
-       case OffloadArch::UNKNOWN:
-         break;
-       case OffloadArch::LAST:
-diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
-index eb3f9cbea284..f4760e80788c 100644
---- a/clang/lib/Driver/Driver.cpp
-+++ b/clang/lib/Driver/Driver.cpp
-@@ -961,12 +961,12 @@ inferOffloadToolchains(Compilation &C, Action::OffloadKind Kind) {
-       return llvm::DenseSet<llvm::StringRef>();
-     }
-     if (Kind == Action::OFK_OpenMP &&
--        (ID == OffloadArch::UNKNOWN || ID == OffloadArch::UNUSED)) {
-+        (ID == OffloadArch::UNKNOWN || ID == OffloadArch::UNUSED_)) {
-       C.getDriver().Diag(clang::diag::err_drv_failed_to_deduce_target_from_arch)
-           << Arch;
-       return llvm::DenseSet<llvm::StringRef>();
-     }
--    if (ID == OffloadArch::UNKNOWN || ID == OffloadArch::UNUSED) {
-+    if (ID == OffloadArch::UNKNOWN || ID == OffloadArch::UNUSED_) {
-       C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
-           << "offload" << Arch;
-       return llvm::DenseSet<llvm::StringRef>();
-@@ -3407,7 +3407,7 @@ class OffloadingActionBuilder final {
- 
-       // If we have a fat binary, add it to the list.
-       if (CudaFatBinary) {
--        AddTopLevel(CudaFatBinary, OffloadArch::UNUSED);
-+        AddTopLevel(CudaFatBinary, OffloadArch::UNUSED_);
-         CudaDeviceActions.clear();
-         CudaFatBinary = nullptr;
-         return;
diff --git a/meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch b/meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch
new file mode 100644
index 0000000000..493948acef
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch
@@ -0,0 +1,274 @@
+From 82f18b02d9fec1bcc225a92251466ffee82f56b5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Mar 2026 14:22:17 -0700
+Subject: [PATCH] [Clang] Rename UNUSED and UNKNOWN elements of OffloadArch enum to avoid 
+ macro collisions
+
+OffloadArch uses enumerator named `UNUSED` `UNKNOWN`, which are common macro name
+in external codebases (e.g. Mesa defines UNUSED as an attribute helper). If such
+a macro is visible when including clang/Basic/OffloadArch.h, the preprocessor
+expands the token inside the enum and breaks compilation of the installed Clang
+headers.
+
+Rename the enumerator to `Unused` and `Unknown` and update all in-tree references. This is a
+spelling-only change (no behavioral impact) and mirrors the existing approach
+used for SM_32_ to avoid macro clashes.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/5bc3d1966b2d0b300c338d85bb38e356f0d12a8c]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/clang/include/clang/Basic/OffloadArch.h b/clang/include/clang/Basic/OffloadArch.h
+index ea665b1..970487c 100644
+--- a/clang/include/clang/Basic/OffloadArch.h
++++ b/clang/include/clang/Basic/OffloadArch.h
+@@ -16,8 +16,8 @@ class StringRef;
+ namespace clang {
+
+ enum class OffloadArch {
+-  UNUSED,
+-  UNKNOWN,
++  Unused,
++  Unknown,
+   // TODO: Deprecate and remove GPU architectures older than sm_52.
+   SM_20,
+   SM_21,
+@@ -145,7 +145,7 @@ const char *OffloadArchToString(OffloadArch A);
+ const char *OffloadArchToVirtualArchString(OffloadArch A);
+
+ // Convert a string to an OffloadArch enum value. Returns
+-// OffloadArch::UNKNOWN if the string is not recognized.
++// OffloadArch::Unknown if the string is not recognized.
+ OffloadArch StringToOffloadArch(llvm::StringRef S);
+
+ } // namespace clang
+diff --git a/clang/lib/Basic/Cuda.cpp b/clang/lib/Basic/Cuda.cpp
+index 514fa2f..7884910 100644
+--- a/clang/lib/Basic/Cuda.cpp
++++ b/clang/lib/Basic/Cuda.cpp
+@@ -75,7 +75,7 @@ CudaVersion ToCudaVersion(llvm::VersionTuple Version) {
+ }
+
+ CudaVersion MinVersionForOffloadArch(OffloadArch A) {
+-  if (A == OffloadArch::UNKNOWN)
++  if (A == OffloadArch::Unknown)
+     return CudaVersion::UNKNOWN;
+
+   // AMD GPUs do not depend on CUDA versions.
+@@ -141,7 +141,7 @@ CudaVersion MaxVersionForOffloadArch(OffloadArch A) {
+     return CudaVersion::NEW;
+
+   switch (A) {
+-  case OffloadArch::UNKNOWN:
++  case OffloadArch::Unknown:
+     return CudaVersion::UNKNOWN;
+   case OffloadArch::SM_20:
+   case OffloadArch::SM_21:
+diff --git a/clang/lib/Basic/OffloadArch.cpp b/clang/lib/Basic/OffloadArch.cpp
+index 05177f1..f3bbe64 100644
+--- a/clang/lib/Basic/OffloadArch.cpp
++++ b/clang/lib/Basic/OffloadArch.cpp
+@@ -17,7 +17,7 @@ struct OffloadArchToStringMap {
+ #define GFX(gpu) {OffloadArch::GFX##gpu, "gfx" #gpu, "compute_amdgcn"}
+ static const OffloadArchToStringMap ArchNames[] = {
+     // clang-format off
+-    {OffloadArch::UNUSED, "", ""},
++    {OffloadArch::Unused, "", ""},
+     SM(20), {OffloadArch::SM_21, "sm_21", "compute_20"}, // Fermi
+     SM(30), {OffloadArch::SM_32_, "sm_32", "compute_32"}, SM(35), SM(37),  // Kepler
+     SM(50), SM(52), SM(53),          // Maxwell
+@@ -132,7 +132,7 @@ OffloadArch StringToOffloadArch(llvm::StringRef S) {
+         return S == Map.ArchName;
+       });
+   if (Result == std::end(ArchNames))
+-    return OffloadArch::UNKNOWN;
++    return OffloadArch::Unknown;
+   return Result->Arch;
+ }
+
+diff --git a/clang/lib/Basic/Targets/NVPTX.cpp b/clang/lib/Basic/Targets/NVPTX.cpp
+index 6526eef..9584f8a 100644
+--- a/clang/lib/Basic/Targets/NVPTX.cpp
++++ b/clang/lib/Basic/Targets/NVPTX.cpp
+@@ -64,7 +64,7 @@ NVPTXTargetInfo::NVPTXTargetInfo(const llvm::Triple &Triple,
+   // Define available target features
+   // These must be defined in sorted order!
+   NoAsmVariants = true;
+-  GPU = OffloadArch::UNUSED;
++  GPU = OffloadArch::Unused;
+
+   // PTX supports f16 as a fundamental type.
+   HasFastHalfType = true;
+diff --git a/clang/lib/Basic/Targets/NVPTX.h b/clang/lib/Basic/Targets/NVPTX.h
+index 9bd0cc3..eeffb0e 100644
+--- a/clang/lib/Basic/Targets/NVPTX.h
++++ b/clang/lib/Basic/Targets/NVPTX.h
+@@ -87,7 +87,7 @@ public:
+   initFeatureMap(llvm::StringMap<bool> &Features, DiagnosticsEngine &Diags,
+                  StringRef CPU,
+                  const std::vector<std::string> &FeaturesVec) const override {
+-    if (GPU != OffloadArch::UNUSED)
++    if (GPU != OffloadArch::Unused)
+       Features[OffloadArchToString(GPU)] = true;
+     // Only add PTX feature if explicitly requested. Otherwise, let the backend
+     // use the minimum required PTX version for the target SM.
+@@ -146,7 +146,7 @@ public:
+   }
+
+   bool isValidCPUName(StringRef Name) const override {
+-    return StringToOffloadArch(Name) != OffloadArch::UNKNOWN;
++    return StringToOffloadArch(Name) != OffloadArch::Unknown;
+   }
+
+   void fillValidCPUList(SmallVectorImpl<StringRef> &Values) const override {
+@@ -157,7 +157,7 @@ public:
+
+   bool setCPU(const std::string &Name) override {
+     GPU = StringToOffloadArch(Name);
+-    return GPU != OffloadArch::UNKNOWN;
++    return GPU != OffloadArch::Unknown;
+   }
+
+   void setSupportedOpenCLOpts() override {
+diff --git a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
+index db0d56d..f78047d 100644
+--- a/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
++++ b/clang/lib/CodeGen/CGOpenMPRuntimeGPU.cpp
+@@ -2266,15 +2266,15 @@ bool CGOpenMPRuntimeGPU::hasAllocateAttributeForGlobalVar(const VarDecl *VD,
+ // Get current OffloadArch and ignore any unknown values
+ static OffloadArch getOffloadArch(CodeGenModule &CGM) {
+   if (!CGM.getTarget().hasFeature("ptx"))
+-    return OffloadArch::UNKNOWN;
++    return OffloadArch::Unknown;
+   for (const auto &Feature : CGM.getTarget().getTargetOpts().FeatureMap) {
+     if (Feature.getValue()) {
+       OffloadArch Arch = StringToOffloadArch(Feature.getKey());
+-      if (Arch != OffloadArch::UNKNOWN)
++      if (Arch != OffloadArch::Unknown)
+         return Arch;
+     }
+   }
+-  return OffloadArch::UNKNOWN;
++  return OffloadArch::Unknown;
+ }
+
+ /// Check to see if target architecture supports unified addressing which is
+@@ -2382,8 +2382,8 @@ void CGOpenMPRuntimeGPU::processRequiresDirective(const OMPRequiresDecl *D) {
+       case OffloadArch::Generic:
+       case OffloadArch::GRANITERAPIDS:
+       case OffloadArch::BMG_G21:
+-      case OffloadArch::UNUSED:
+-      case OffloadArch::UNKNOWN:
++      case OffloadArch::Unused:
++      case OffloadArch::Unknown:
+         break;
+       case OffloadArch::LAST:
+         llvm_unreachable("Unexpected GPU arch.");
+diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
+index eb3f9cb..c8894a1 100644
+--- a/clang/lib/Driver/Driver.cpp
++++ b/clang/lib/Driver/Driver.cpp
+@@ -946,7 +946,7 @@ inferOffloadToolchains(Compilation &C, Action::OffloadKind Kind) {
+   llvm::DenseSet<llvm::StringRef> Triples;
+   for (llvm::StringRef Arch : Archs) {
+     OffloadArch ID = StringToOffloadArch(Arch);
+-    if (ID == OffloadArch::UNKNOWN)
++    if (ID == OffloadArch::Unknown)
+       ID = StringToOffloadArch(
+           getProcessorFromTargetID(llvm::Triple("amdgcn-amd-amdhsa"), Arch));
+
+@@ -961,12 +961,12 @@ inferOffloadToolchains(Compilation &C, Action::OffloadKind Kind) {
+       return llvm::DenseSet<llvm::StringRef>();
+     }
+     if (Kind == Action::OFK_OpenMP &&
+-        (ID == OffloadArch::UNKNOWN || ID == OffloadArch::UNUSED)) {
++        (ID == OffloadArch::Unknown || ID == OffloadArch::Unused)) {
+       C.getDriver().Diag(clang::diag::err_drv_failed_to_deduce_target_from_arch)
+           << Arch;
+       return llvm::DenseSet<llvm::StringRef>();
+     }
+-    if (ID == OffloadArch::UNKNOWN || ID == OffloadArch::UNUSED) {
++    if (ID == OffloadArch::Unknown || ID == OffloadArch::Unused) {
+       C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
+           << "offload" << Arch;
+       return llvm::DenseSet<llvm::StringRef>();
+@@ -3305,7 +3305,7 @@ class OffloadingActionBuilder final {
+     bool Relocatable = false;
+
+     /// Default GPU architecture if there's no one specified.
+-    OffloadArch DefaultOffloadArch = OffloadArch::UNKNOWN;
++    OffloadArch DefaultOffloadArch = OffloadArch::Unknown;
+
+     /// Compilation unit ID specified by option '-fuse-cuid=' or'-cuid='.
+     const CUIDOptions &CUIDOpts;
+@@ -3407,7 +3407,7 @@ class OffloadingActionBuilder final {
+
+       // If we have a fat binary, add it to the list.
+       if (CudaFatBinary) {
+-        AddTopLevel(CudaFatBinary, OffloadArch::UNUSED);
++        AddTopLevel(CudaFatBinary, OffloadArch::Unused);
+         CudaDeviceActions.clear();
+         CudaFatBinary = nullptr;
+         return;
+@@ -4669,12 +4669,12 @@ static StringRef getCanonicalArchString(Compilation &C,
+   OffloadArch Arch =
+       StringToOffloadArch(getProcessorFromTargetID(Triple, ArchStr));
+   if (Triple.isNVPTX() &&
+-      (Arch == OffloadArch::UNKNOWN || !IsNVIDIAOffloadArch(Arch))) {
++      (Arch == OffloadArch::Unknown || !IsNVIDIAOffloadArch(Arch))) {
+     C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
+         << "CUDA" << ArchStr;
+     return StringRef();
+   } else if (Triple.isAMDGPU() &&
+-             (Arch == OffloadArch::UNKNOWN || !IsAMDOffloadArch(Arch))) {
++             (Arch == OffloadArch::Unknown || !IsAMDOffloadArch(Arch))) {
+     C.getDriver().Diag(clang::diag::err_drv_offload_bad_gpu_arch)
+         << "HIP" << ArchStr;
+     return StringRef();
+diff --git a/clang/lib/Driver/OffloadBundler.cpp b/clang/lib/Driver/OffloadBundler.cpp
+index f69ac41..6d446f2 100644
+--- a/clang/lib/Driver/OffloadBundler.cpp
++++ b/clang/lib/Driver/OffloadBundler.cpp
+@@ -95,7 +95,7 @@ OffloadTargetInfo::OffloadTargetInfo(const StringRef Target,
+       Components.size() == 6 ? Components.back() : "";
+   StringRef TargetId = TargetIdWithFeature.split(':').first;
+   if (!TargetId.empty() &&
+-      clang::StringToOffloadArch(TargetId) != clang::OffloadArch::UNKNOWN)
++      clang::StringToOffloadArch(TargetId) != clang::OffloadArch::Unknown)
+     this->TargetID = TargetIdWithFeature;
+   else
+     this->TargetID = "";
+diff --git a/clang/lib/Driver/ToolChains/Cuda.cpp b/clang/lib/Driver/ToolChains/Cuda.cpp
+index 6cc73ff..d97b926 100644
+--- a/clang/lib/Driver/ToolChains/Cuda.cpp
++++ b/clang/lib/Driver/ToolChains/Cuda.cpp
+@@ -319,7 +319,7 @@ void CudaInstallationDetector::AddCudaIncludeArgs(
+
+ void CudaInstallationDetector::CheckCudaVersionSupportsArch(
+     OffloadArch Arch) const {
+-  if (Arch == OffloadArch::UNKNOWN || Version == CudaVersion::UNKNOWN ||
++  if (Arch == OffloadArch::Unknown || Version == CudaVersion::UNKNOWN ||
+       ArchsWithBadVersion[(int)Arch])
+     return;
+
+@@ -408,7 +408,7 @@ void NVPTX::Assembler::ConstructJob(Compilation &C, const JobAction &JA,
+
+   // Obtain architecture from the action.
+   OffloadArch gpu_arch = StringToOffloadArch(GPUArchName);
+-  assert(gpu_arch != OffloadArch::UNKNOWN &&
++  assert(gpu_arch != OffloadArch::Unknown &&
+          "Device action expected to have an architecture.");
+
+   // Check that our installation's ptxas supports gpu_arch.
+diff --git a/clang/lib/Sema/SemaDeclAttr.cpp b/clang/lib/Sema/SemaDeclAttr.cpp
+index 3f0ea5c..e6d3516 100644
+--- a/clang/lib/Sema/SemaDeclAttr.cpp
++++ b/clang/lib/Sema/SemaDeclAttr.cpp
+@@ -5732,7 +5732,7 @@ Sema::CreateLaunchBoundsAttr(const AttributeCommonInfo &CI, Expr *MaxThreads,
+   if (MaxBlocks) {
+     // '.maxclusterrank' ptx directive requires .target sm_90 or higher.
+     auto SM = getOffloadArch(Context.getTargetInfo());
+-    if (SM == OffloadArch::UNKNOWN || SM < OffloadArch::SM_90) {
++    if (SM == OffloadArch::Unknown || SM < OffloadArch::SM_90) {
+       Diag(MaxBlocks->getBeginLoc(), diag::warn_cuda_maxclusterrank_sm_90)
+           << OffloadArchToString(SM) << CI << MaxBlocks->getSourceRange();
+       // Ignore it by setting MaxBlocks to null;
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 3b1070ef93..5b28aeb3eb 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -59,7 +59,7 @@ SRC_URI = "\
     file://0036-Don-t-expose-LLVM_HAVE_OPT_VIEWER_MODULES-externally.patch \
     file://0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.patch \
     file://0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
-    file://0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch \
+    file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.patch \
     file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch \
 "
 # Fallback to no-PIE if not set
-- 
2.49.1


