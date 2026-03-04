Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88468EFCE33
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24360.1772646262709818269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qiXKvzEv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CSVkr567927
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 17:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zOjyfpIjgwLFuih8/IzUxm9SFCXlTYPiFyGYzqJrQD8=; b=
	qiXKvzEvEl/BFqbwa0FwqKxonSqlPqZCcuJKGwpK1issw88AadUvbX8wr4MQq2Sw
	eSvN220F84/lI3huegxAK5PTDwpl/eXOC85gE7VWcP2OT18LNtrU+AX9S6uzU4qN
	FeYidP5O17WDgkkEYZrsocoRDfhuamm61tAyKhlL0QgiNqqPpUcD1S745opnpF3x
	EYDmWcUUHOINNWiJ8/FdrAtY8DeTJjvJw/9XfRCZA3AihJW0Y/haCbhBpQULuyT4
	f9VXxQhsvsrJd48Md465sLw6knb9uwVKM/SqVFz7Z6MWrMQBkDHJUEuWPR1Vhprf
	bMyOYXSecyzLI1LhP/INVg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012032.outbound.protection.outlook.com [52.101.48.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4ne62-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:44:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6w2/pjplpsasZUs3jUt0iDQzMx7UE1s4mADKu9GHMv5m/UjYhUgv930Cx5qeookzahMmYlbKo1s9ApT/aFd2rn7Dy8nDFEteZC/+ufD+uKwFWb7QMV2CL+nCznYSmyvQ6na1ufNTpQLD7wfz0WpzEr1XMtaZbK1FC2s9OiLiXh58n6Ra5p3VeuKqs9oNJTrq+El6HX5+T+0qlBgreE9qVP+Mpm//UXyXa7TANG4wUuGMbyvGaN/Nisu2p3qOlEKhXUo02gOz0gphou7w0AEKtrsDRYMRXNSo6cvKBnsyFGS6sHuINXo/U3XtZQgfWDqYMF1a7IVzEHK53tNcRTCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOjyfpIjgwLFuih8/IzUxm9SFCXlTYPiFyGYzqJrQD8=;
 b=ykDxHCG2aHQETxsfJ1gpTN499jCMxgoPXkSLMY+/fj0jwoLo2oPSs7gh7IwSXwqQhXhh8cT5dEa04f5nX5EZeKdprH4x1R6gcnPwkU+6YYvnGPzmLH3BCT3fTGXXoeE7j+S1QsV9San1C+QDxm1ogzWMY6dVMSABx57Ij+Ff+LrcGWfNJWu7ImXzAV7VOnbdN+vtc+xcVdRMCUxPUH9n2wAPlBRhxGdc1es/rI04r9D4srPU1m8nHJEiWRYZ+8/2IHDn1WypuR+fs/MTZlNgw5jsGu2tRNnnyXzHQHFns/zO2i7CwtTIpwUBd4W9JCJOs0A1a6okuqagR19jNbFo/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA4PR11MB9396.namprd11.prod.outlook.com (2603:10b6:208:56a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 4 Mar
 2026 17:44:18 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:18 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 10/14] kernel.bbclass: Copy include/config/auto.conf in STAGING_KERNEL_BUILDDIR
Date: Wed,  4 Mar 2026 09:43:20 -0800
Message-ID: <20260304174324.1186644-11-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA4PR11MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2fd1e7-9cac-4c85-0259-08de7a15a945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|7142099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	s+j4HBCfNKExYAC81J6c0/WaKwXcmOmVzE77HlYOH3NaNsJzZyD0LA58KaFnifNYvv2Jl+LOF8PVda7ha7Fiv7zDqaOZPahis+lScAnnIAT0hPGIr8Df6hMO3YB61SFfOlkWPJaVZxFAIv0awcnFZy1hWOlxrz6dlL3nUen+mUeRY4uuR2Q+1GJjNRP2Rr6TnqqeZgq0E8/w6w8Ddh6ggIU7IxakBiA5l6ZGWFRlD1M753fr/QGRdKcTCZcwzGZnCoWqTOm3dk3mzUX+9T14a6JNBjXESIvqlpAcERadBjJaTUE8V279dn6DGbbV0QopayvpitpyXpOQyF5le3kx2M1nrUUxx5ssAAfPReal/DeCSSw/rh8cG8LNSzfp3cLHR2VZ5YEzOfY4vOKsJtuwJvoFxzePdJSHhtyY3Jlm+4H7HJ/vzu35eyqCzfcxuseuTITUk/SGCFb7GV+eQ03HCpyqwztPCQJYBgkLJCOOYEMd1kzrwv/n6M3qKxpZJMQuCk7/1N4rxjNeZBS6gs/1LDID+51BEpaTKfDG0JRvgueBmHxZtfdgKpxd5CPilOPUTEstL/erRSxEPw9eyKXZ1hFMk9zlBY8i9pluzEcfTqDufSyF1HsRAktDUINhdhrc+KKVMBH/w+0uthV0Rv0xaD26wVP9+VNUjDEx4fJT5ikQATfp8M3y2HLafSRkZ782iQBIYZmUeNyvkhfUdJvQFoOga+JDsPFd2TTPuXKhcfxjcErjo5OilPloDMYj0Zzrn00Ham4bGioxAlVMdVa+sO/w2JcqmmBepCQ78XXXRa4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(7142099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fjcibGVq1+YABQV5IYhaT0pBYldeYumKzVb/aCwVNNK1Ox1K0dDdb+czO9sY?=
 =?us-ascii?Q?WMcNwH9k1mNmi7cfTsA0NyMOBig4+fwwTdcMg8/kUN+dXQLdpd7K3n26Be4Y?=
 =?us-ascii?Q?gH/KhPxjb0wqDZaV1nblwfc5jjXDeeKvugzadkOWaKTxmG/Oo6q3iajZj0ap?=
 =?us-ascii?Q?G9DBUCUf7/d2qlHWQst7deTOXlzqbOwFUjgaujn91kuHdDQDI2hyS+josd0v?=
 =?us-ascii?Q?Y0yAeC4rwBdWhmm/HbOKKGaQX2TXo7evEmay2njEB+XsSvk255KLU0cuTwXz?=
 =?us-ascii?Q?2Ek8RNVZrROuLXE9GGZCnE9AQdJz6DcXgRyQjT5vlf4jIhNHdMzGM9sg6CS8?=
 =?us-ascii?Q?yX8TRZ063HXFjawQV+I9vnMEnQnhCCuXREs74Mt/EIk8CYZAKb/5LjrHaHGf?=
 =?us-ascii?Q?3Ilg9IWvBtE2E1Do4TzS1HBrNtiUcvqK2mc+U4uYWq7f610gXIp7ROKQay0i?=
 =?us-ascii?Q?1ilBsCUUH+OyRcYx6FoLE4xXyyaABxsMdNWUZ2K/OAXezGd56vQ9Bagc57ME?=
 =?us-ascii?Q?9qkkpRXe8dTbn1wydmwnNKOKNHzBGSG+0lW0mIkk52bjtUBj9VB3pomwOLUH?=
 =?us-ascii?Q?X5zWseJZDsao+YE/tjxJf44VUzhWnh38nw0/6pDRn1Q3mjZr1sCKEiVPpy4A?=
 =?us-ascii?Q?F0IhS+4iB3eQyUpYLarqw1nxFdQqD60S7xDDiL6Gse2Wml7TZ6TEVae3wqBs?=
 =?us-ascii?Q?1zkE+bztgi+OjrQME56y2OOnN0mdPtvmk5AJDGysEMGAnHKoBIPZoNm4drM0?=
 =?us-ascii?Q?dqop2rXiaUBIFNgJ6z1SiBQe3SYhcCxt5Q6HUdqXb8czwv5MqBvUHVgnJfxD?=
 =?us-ascii?Q?wcTJkkc6AkqHsWUIxapeULPgY4Hx9SNf89IWNkgsR4vWJL62hYte07/G+Vzx?=
 =?us-ascii?Q?e0iZ2w9AvqcjC4Ax9tWayyWSXtVvNOE+XW/nRaXqHyyrfEe3/uSdNsyuCqw8?=
 =?us-ascii?Q?Eqc7FhNTChOHHkUzZkYFqDXp1HhMP22ZU0kmP6q7ZbmFhgpveIewcAyL4MyI?=
 =?us-ascii?Q?/eptT4IaUvNxUCRxaY8B1OxggHgUNYT7BS5IrvXJrGongET47KwbSUqqHeEx?=
 =?us-ascii?Q?zf8bRtimY2vrAU+r6Rhnq8ab063T0A/LqDjFR5qOwThUBkTjQqKOC1uVNmE+?=
 =?us-ascii?Q?6f1aBvyo/3Y+lpHxgmjziYi5zGGjq+0bdRhCpOaPDnWIiBmwn032pF8u4Sn9?=
 =?us-ascii?Q?DUHRaT9SJ4ZnzVRai18+9Jgunqb+cDrGat+5syskXinF+m1+0XiF79qjrIoD?=
 =?us-ascii?Q?sFqZX8+xvZt5wxnxNAYLjMJ0kiVkzBbixNPAlwlS/O8ZLd6CkmxihCA/6w8m?=
 =?us-ascii?Q?uRLBzWRUkdomtHuyakbeNU5+S1TDlyYVHDRW4wgRR5z0nlhtLh5efkIHudYO?=
 =?us-ascii?Q?nUUzVfIZyIEU1PEPOfKmJVMHqELM7fTqTlejrxY3t8CA5k4wTMz4tmI7Dkk5?=
 =?us-ascii?Q?ade6MB7qaHecXNYZMd68xmzW/z+Oy7VkoqJy9aRS2FmKX6k6vxXj0IlGNUvA?=
 =?us-ascii?Q?K865AiR3+esF+qerbcmSq1cDv48lEIhtAW4iGI4NrGQGE6IlMlnsvWKgV1zC?=
 =?us-ascii?Q?3Po4F8wwACUNOz1dcv3UrVcAhBDnaIV9AJpOaANop431Bb/qN8x2WOE8P7Pa?=
 =?us-ascii?Q?yURejSiUovIC3UCHmSBJI5BGfj5f0jAjiShoyB7bWZMLHmUFbHrHIaTKNCvG?=
 =?us-ascii?Q?l9NQ8+cOAUykuhWV316manaIoL13BJpfs5FbT+0UnbQ7IXTHo6DgIIPBkuDz?=
 =?us-ascii?Q?g6GYdCmAf2B6qaUdW0OGtd+GU4HIrjw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2fd1e7-9cac-4c85-0259-08de7a15a945
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:18.6749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7TC7+gPw7W+kYtu2HAmUmtyRCDvEhIt9wlc5XpgUKhUMgYBbHibkzoi4fpaVtkkgsHymy31D/d7BfeQ1MVubDJQCCyRG5g6YtIEKSj6pec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9396
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a86f75 cx=c_pps
 a=NeHo0b9PnFRHZsaa1SN7PQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=TeJiQh7uZb9NdfcNB-sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: R2TF6Qtq_eT4NX3PZmXPDDVjOnNrr5B3
X-Proofpoint-ORIG-GUID: UXeC0tllYtlJXQvhjV7wArTqD_Ky3rBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX6YuzbCIGzk76
 jb4mfi8CmuXbg55mAYIty2SJbGONzrsEJtUrZ8nZnaciFMrbQq3ZdhDQ42yT0TDFPyO+RWucNR3
 R+01TOPB/Uo9YiVn5v3CPyWmmwvQ0UmVnOv/2ifhZXYeM5flf8TTmOpgo/XyuPgoXvPgPzQiZ1o
 B2ahOW0lXQZP74x/iETy/1XA2rQvHPjB4QypMInoXcG8AISOcB2FgxsNzlnNI+Nq4zFL4qU3Ir8
 AU0ZNouzpc8uZluF9CqdDyYrqN9g26nrVyEsnJZpjr0/Z183TzP29xCZfFSTWDU+CupQRdut9MI
 +iImtmtrrtWQwKxGtKVTyFbp+1HxlCYA/sZZe0Wt6jqSWfvCRFSxKWApzc7QM2aMvqfDx8qHTQZ
 8NPb5AG4N0TJiTKKAoSnfAy1xzjdq4QJtt5Eti78Znk7zxhkSlTH8tKooVNyrlHXo1/xulJ+isx
 UH+KF4Nib5KcGWlibfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232426

From: Yoann Congal <yoann.congal@smile.fr>

Linux commit aaed5c7739be ("kbuild: slim down package for building
external modules")[0] states that include/config/auto.conf is also a
file needed for out-of-tree build.

This avoids this error when building an out-of-tree Rust kernel module:
| make -C .../tmp/work-shared/qemux86-64/kernel-source M=$PWD
| make[1]: Entering directory '.../tmp/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory '.../tmp/work/qemux86_64-poky-linux/rust-out-of-tree-module/git/sources/rust-out-of-tree-module-git'
| .../tmp/work-shared/qemux86-64/kernel-source/Makefile:779: .../tmp/work-shared/qemux86-64/kernel-build-artifacts/include/config/auto.conf: No such file or directory

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaed5c7739be81ebdd6008aedc8befd98c88e67a

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 22568d6e9c..5c457ef5e6 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -563,6 +563,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf      $kerneldir/include/config/auto.conf
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
-- 
2.49.0


