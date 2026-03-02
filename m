Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB22D58E6C
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 06:50:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154921.1772434203499472022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 22:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ipGXuQ94;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6224HAae1201972
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 06:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MhbTFU63Dq6v3AGMKjgBvJH1l07fdyQiPRcq1h6H42A=; b=
	ipGXuQ94vJsp6W1VAcLg9dTS3PTHSCQYZ9tSMak2CO6OYqlC3Vao3MY6Ak/hGzQn
	ae32Q1sFMtFXD5UryxS7Pea/BjtXBlAhamo/fFhbmJJMnv3XZ5C/GA8mn1YXnyHj
	MoifxQo9IkNuZpIBqF/EnGue0V2CkzYM5c6mAU9gqzvtxn+2TDLhnE+hFxONP10q
	2+O++6opIxY0qDGpyGFVqTBk7iJaOh952SJv+BGgwtYzIRBqC/nGw/J1VbbplgAB
	Hl9DOYQDlS6GcQb9JMtkkQX3AN/0yJWYE/7xeZtm8p/5SXLDH/kNnLD856WgVISl
	cBrXRgkEILnST4EP+Pjjzw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvj2js-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:50:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VP+dUotyqILkNBC1d3lOH1S9zKAllNR+jigVjiLewGKLPuWpEDEsOqtUlV/Z3e8bJs1WKJ7TG4xLlDk4bjT1N+PrEEBJrXr2vdBErt2DWIdXWEwe4Nxi8+dC6OKU+hIKW+7ptARoWErxIn2EiyKHRelMOJahdR+fpEsBTe+/lQzOB7eQks88Hz3IRlfsvfOOaQMqyq2s2jy1PedbUjLaCEpilviC5QehwtuuukO2KClaexvJlpUUKFEuGz31Dj5Pyo7zHyDhKlGu6NnfMpPVZPBBZAphgYdiwkvYu56a+aY7Qgp9KaB+b4vY/SiZ53ehmBa3Y0dZd7fKiidVV6bWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhbTFU63Dq6v3AGMKjgBvJH1l07fdyQiPRcq1h6H42A=;
 b=OJxBl9phzyOQ7RbmZDqpVBvkjhylmaVHPJVuyQHP5XzcspMQLrZCgDYj/o/Mc6sb5xc9hkoLtSBRvpYOWZ1SpEFbvEWrDznyUi8+ngTHCKSCTxvPFJpaV8hgyhAb4tieVqnhSRjOZFoPzDnmAVxI9BiXHe9bQlmcmYHQsQEmLFWY6JvIxx7hfMZiMj9tS17OgMwbMOQzwYxbW7CFstibHe7NdSdE9IDPjTgPOLhZNE0X4yxakAPqbLTvad+T0p2k7/KFg+kUXdNRhVDRG9epPEEa2vExRkaLf7u0pm8DLURH66g/viF9z6YeU7kjLptXBAhYrikbLBkSjwEcg/qUJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 06:50:00 +0000
Received: from PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de]) by PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de%5]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 06:50:00 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 4/4 V2] rust: Fix rust build failure
Date: Sun,  1 Mar 2026 22:49:38 -0800
Message-ID: <20260302064938.2052450-5-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
References: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To PH8PR11MB6682.namprd11.prod.outlook.com
 (2603:10b6:510:1c5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6682:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b249d3-3315-42ed-b2e6-08de7827eceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	/xI5v91j3+dXL7Y9CeWTcNRzXN+5T7kiteKNZwJSxYD3+KUcKrK+k+3Z3qNaCIsilY38zWJhOwonDHBtWWYQ4zShctUhp1CD1/jIooIdxi8ETcb2pqg7YEM/IJhg/t3EJCSVy3xWlndW6tYkvzozphEOjfiuowQuTxj4rBZXKjXQFBlbU0slTZloIMygn49aaTKFdBD8W9ZMuRw+zqT4A3WKueACCE/zMfjfJ1E6T1n0QKd6/PRHJQCFVBgd+9oPErq5Fb0w+vodAOfxwxeQEH5oXiG1f/qXx2phJSlIkEX4kQEgSX2RjqbszjT4M1npZmMWran1psqogTFQ0mmL6d3IECYw6SpIun2PwT07wJLT5Z/AB3QFdr1igVPL+CVi3FKNCivuSr0nktzsjivgW0d1fvy6HD/sLE0KFYpPOspujB18y4dCR7jjhDGsZmVGgD7QUTk1vtAfELBTGq+Pgb99q/XMD7kIvgJ9v6hWAOeWl2+c3KA01GukI8hOJx55lGEv78+eIWb1Z94OtOKvKEyB9bJ0BPPWUO36e80yyixyfl8gJ4lAE6MHR1wz0bIA2X+JMbD3uzXGYugCdFUpVWUE2FIl7ivTdfCMmi9sqQyTY2ljSMXhxGept5bnl27RoIH7su6vJ3BOSFFzL2a9v9xI3Zq9VQBLHuZD5TRoGhMdofRva8OY/xJ86L+6iGZb9u6Wj1+oFaBo7IlEPITLt3TSXglqBnh8XsWUXtdg/Hf0BhG96oo92DfvmLUCh/K6ge3T+I5ymX6B6iHAb1whsQqEZMwoCOMxXKTbKeA+JJg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iimN9lUWugetn0k06AvymYPc9dNr+dkKmH92EKFJuNUshRamFczhIPajBpUK?=
 =?us-ascii?Q?B7UJ/y79orHbJ4cJGyd29Swk3p27sgDbEt6OKljyO4f1rSma9uSEeO/XifMC?=
 =?us-ascii?Q?1S6dERsvPKKzAZG5tR1FN8SUBahYeuNiO2l49wwgNxJuJMeHKTDAEZy94VjI?=
 =?us-ascii?Q?iTxEfawhBB9s+xTcUO3vI4mbJEE5/srRU7SNLRjCN7E7qZAIMpDxHzn4u14C?=
 =?us-ascii?Q?f260qwZ8FT7AP4EFvFi1/wkxzLDZymCFd1MWhXXQb/KGMUyUMA+lJgPn/YlU?=
 =?us-ascii?Q?vt8BUOW67tYDGh3p93eB25z02KHGl5M98943KyQsS5OFgdao20Jrh8tzRceO?=
 =?us-ascii?Q?P2gWZzXOJzFVzsDzIfu1zLpcbEO0rAChP5ryHXh96qgCGFVKuKafWaYZSmth?=
 =?us-ascii?Q?k7f80Yl9g9KKKme8UOEMREVEWQ4VgtNBr2OmCHWBHuPhDmfnn0FpCsRuA1qa?=
 =?us-ascii?Q?PWd1YEkSRtwaQgO0LfVZ6/ogGLZ3QDI4a6yQPh8nzHB2NjTqa0UxedL0TVcT?=
 =?us-ascii?Q?4CvVc6oNXnbcmLLO+bBowrTLzQPbPUu25aekIDc96vc0dI1gtgtO8NXWHRnQ?=
 =?us-ascii?Q?VVI4hu+kx1CAONnEwTNxvkrSiIvXpTNlas6VyCkYZBJENjRAZAg/1qNNSxX/?=
 =?us-ascii?Q?RTL36dEuvNoCLl4Bv3PNebeNQOVqpKsT81hK0hWhO3w8toSRrFBdFu54DEc/?=
 =?us-ascii?Q?kQqs3TNuy+rUq5mm7KNJAPkLA8t2IF/zDIOnXrOSd7Yk9UCeKBbTmrNIpISK?=
 =?us-ascii?Q?tA/VkiIAuEVQdoKbR2lTgL0wpecyl/jKZZxO/roVQz2y2WQa5iWhM82cRaqN?=
 =?us-ascii?Q?Yio0tpUppq9vh63lC7F4IyJrYmtOqVXW/e9vmQoghSUwBVrUyZoYQ6/UzIaQ?=
 =?us-ascii?Q?3ovVb9euJMnrgRZ1Gzco/3dLncc8++noIDXtOEoFenYW8+42KmUkFcU5Nog1?=
 =?us-ascii?Q?cobD1m1XAtbSISsbNmrFcc5BpgkczkTQCQFIIrJGLMAWbW9HFfaV7UHMsKxJ?=
 =?us-ascii?Q?+FvVNusD4wBlioQ2kGDKm/pf3Hk2mv9V8Wd10vPI5qwwO8pzcun/5Hwdbp3E?=
 =?us-ascii?Q?m4FJ3dHtJLiTvuU6Q9OivNNtVvuarOLV7XMVdnCN8tFRrvx+HeUr8kztDVCo?=
 =?us-ascii?Q?ruJRGEFkKy4TTTxBHYibOTcIkLsMWvK6eGLMlP6C1OKa2K4vT8VySsimEMiV?=
 =?us-ascii?Q?n0mJZe1gLHRfmvf9Gp8nRn6x66HBiMlX6WVKV4HzYVjIl6V0DJVQDBwzRp+R?=
 =?us-ascii?Q?NbBJtAsiPq/qUgSQJNxrV7TQ/OH8XWFUDZa993ss4bQFjoyxI042c/9wRzH2?=
 =?us-ascii?Q?jvBGcoI+JR1ygwIdXPDQDHvsxl06vg0HZQv+mew6Skj1Je9wldP5cMWaOj70?=
 =?us-ascii?Q?rFw4Bv61wNQ/IzHUxYLgB67murRyeb5n2LNAcjGnx68GSqKDltg/1YQMknBF?=
 =?us-ascii?Q?V058K8pa1zMNaSkZIx3RmrtmYqTVmIMjpvle7IPHPqwe49sUVDrl20pNAjJY?=
 =?us-ascii?Q?GhWPrGoe2SpbjWax3zqj4GB9+wDES6p3lfwzd3nVg/TSV0OwXHlmEMTj+kAQ?=
 =?us-ascii?Q?eZ8Y6Dj+gKiSUoqL2nTbhkq0ZtZlSm2Wz5y2UtDAr0ulAH9TCBZWAVFUBu0C?=
 =?us-ascii?Q?0mX3stybqrC1/oFkzw5SbvYuMql70nj0OvSWln1gzDUd2tLZrGn748lj1Y17?=
 =?us-ascii?Q?HOjciDSZCs5jsAljG7PjBZ/VsSDQzOLji5y5qu4K+vTJdneVyMYwEVfZOdwT?=
 =?us-ascii?Q?EQvV+52pK617G7DFGlfvZnFPrP33vH16YKsTAKdXX9SD/aZy/c/Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b249d3-3315-42ed-b2e6-08de7827eceb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:50:00.8115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTvvnUZitrpsrtrf1ULvwTVnVGD5E9JakYgpOXo6e7VIHYxKoybUc9GW4llrHaP7g2vYU4wNhYuJ5IA6IpZvXxiuS76Z2tIM1om9bux6Ms8QeO+I+UiQfgYgvL0YJmq2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-Proofpoint-GUID: 8CKc_KDZYYPYSJ6veT_bPtHrO2SWviK_
X-Proofpoint-ORIG-GUID: 8CKc_KDZYYPYSJ6veT_bPtHrO2SWviK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA1OCBTYWx0ZWRfXzvV4nvDaCXeT
 odLrYHaQD1mvleiXdFsMcODlygFaUUmiX5nBVUywvtx+VQf5CnjE+BOFlO0zwWmFA7/3QTCmFNN
 CylLz5eOoOvNbGFmSMQAxQguJEYg+8TcTXrcyT+kcFXMz0+ox7PcbbLJu6KqethYtNxj5NkS6sR
 DI6Dsbyrun55WlPpv7sj2p/V23iSIEP5a2DIzkeBo350+4mOxHpdBOAxpmtOATVORz9bo/FoBfX
 Ylz0K/QVfNrISp/GbwL7UcnD3LQ539HvKj3QzBOZpPGSIRzsLdfBSMNLayZnFMNiVlqMBs0LBJT
 7cWPSUazdd3Rwv5eTW42ogtGpyTdP6virHuj5TmGZXSkx9bpE2XshHV/nD3VUzi/WoiV3irQg9m
 nGxYFyKXRN/EdyWtZ62DDhFOfuY4JGtdQa3loGc6q/ojpHXVT24MMZE/glqjM/+10r9fkVmP5bR
 hnwK12h8hw+gIhekAiw==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a5331a cx=c_pps
 a=/dw4gKU6pt/qT5+OabM4uA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=_AV8jFXD_HeXAK5xdaoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232177

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Target LLVM tools are installed in the sysroot because they are needed
for llvm-lit to run tests. However, this leads Rust to pick up a target
llvm-config that cannot run on the host. Overwrite it with the native
llvm-config so Rust can execute it correctly.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.93.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index 2be0bd8d89..86da4f99d4 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -236,9 +236,10 @@ rust_runx () {
 
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
-    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
+    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
-        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
+        rm -f ${RUST_ALTERNATE_EXE_PATH}
+        cp -f ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
         patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
     fi
 
-- 
2.49.0


