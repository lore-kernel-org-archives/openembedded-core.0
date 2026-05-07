Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCB0CD37A9
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:32:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1567.1778175166407295048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 10:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OEpdP/iw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9587ffd4f1=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64768fGn1048655
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 17:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q0PvPsfSeoj+1CzpiYx7CxzeXYg5X7NUj4Nm9LrnP/Y=; b=
	OEpdP/iw1UememzYf4P1d9WHUoxR2/t83KnNJXvyTyn757fbbdYgD47iESSvexjE
	Jg3RpW1KKDT08GICmxt84Dp2QweiGGW8aw7MKecP/qrJ+gOuxHmkNKedGTI1sjgG
	N/7NnzanhevFa80Z3xyqjCTSoJupbPDBhhflWujmxWzyvRfdKwfnN3jOjHWjfwZ8
	28q1XNReGt3vYlqFIlJTEFcrEs4nEuhMSxrTxQIhYgQifPrY9QKCFEcr/M/+ntfg
	2lKetPRBjza8v2LWAE+I5LNBDEfk4E92swO3tdKT0um5S/AOpKRDS7Yykf/AwZPs
	CM/MhGgeEu9AbHMFoA5n3A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8t5xw12-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 17:32:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgmVlSXAD8mMGjzYdcMMQwqz7acie4l85do5577Uzc+o1RmdeoTCrBl5u01mb6xTrzthkQSdA0SBwZmtThyJh/WTL1NG+tO8x8KZi4IFLCG/U7SCUJbj6tN0jWWJ6bXJry86+wa3mM5/hS8Jaa2aNQOVZm/ya5eqww/+gZ7Znv+SPTiHHEi0OpxpTLkkotyuxe79PRHhrKpf7O9ZHY548PPOjp9P7ycmB8TucgjRYZCRYfW9EbfTR8x83cZqZUWPqc3uU+41CiN2NyQ/43vzxraDgvJM9/gO7xzj7sifhBpIjF+JvtgSE0vLYA5RZ9vk8L2VgIhESrqA8bzunlELJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0PvPsfSeoj+1CzpiYx7CxzeXYg5X7NUj4Nm9LrnP/Y=;
 b=bbAS+tEnxE6kxyMVOcN813MB2XjtTcxTTils+U1I5S5DrBjnx6mC+Idlq+40hALgCnDFpsBXNcHUPbCRxHFgOWmUv+aO3tv4sLvCTvIQ+mRNuhyZmSJ+EeyUSZkFSjOK26GJEG+JJx78ap8yHxQh1qUXR8NVcTW9LFO0zb+WXXd7FSVjrOnuUem3Zy4Bncb2LsiozOtNq2IgRe/nctXeSc8qC24rjTlxmmzhvK6DKZnGlaFjGc+STEJLNZqNMD+y2SnNTumwSg3SF0ENF/M17Ms9zPlKOB9WMegb2ReGaXAfapEhTvTOGNOGAHu5Oosngv27N73a58dFVN+Bt/D93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DM4PR11MB6288.namprd11.prod.outlook.com (2603:10b6:8:a5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Thu, 7 May 2026 17:32:42 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9891.019; Thu, 7 May 2026
 17:32:41 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        khem.raj@gmail.com
Subject: [PATCH 7/7] gcc-runtime: avoid passing MULTIBUILDTOP to libatomic
Date: Thu,  7 May 2026 10:32:11 -0700
Message-ID: <20260507173211.672855-8-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
References: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0462.namprd03.prod.outlook.com
 (2603:10b6:408:139::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DM4PR11MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: aef86594-4663-4449-4adb-08deac5ea3f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	kKBtGrS6NXPSpqdvyF0XsbtJYh+PUf7l8KC2zXHywd+lPFnTd3IohI3LKxUMrKNgy6qAWaQIsnwQPLXytbvLW05fJHorezRZcri+jslCQbaP7BA6lIXANhtI2N2BdOxenox3Mg2PMbzuun9TaMaU7A7OA4zYB+fvi2Pn/K0+/EQqKbX4lpaVfKGtL+/Q1xizFC2GUuOuGvZP2ZRqdTrUh9PiSJ5KU2z4v46OwbUlAQ+JHbSdXxAv3GrCVHpef+G+VdtVQ3NXc246Dejc9TABli1EUIdsssBrHrMcUPOxEg0vzbGiEc192/76SS6Wdnbw2cyf6v6w5lnZhk82IqmsDoVQRnialNNkcFRxv+HVkixoPjVh4BjLCSaKv2sigE+HTGWKKZsHauegOIxpNf0SC8E1dlPBiR9rDCLF8lwBiaSzocv4twItLBsXy6GLoYssbVqJoxo9uIZ8uu1Axd/tTqyFeh9AtxGL7s1HYN8qf7NmTo2v7flPsqZAXLYPi5/yhxW7dK2MZsohyn0JXfmehtIRvSEoj2xQ7fUTAqJPRHSaMeXFnT3xocsu/43Dmbdrv0lpmSaZ9EIlCCE2+6dzN1stMxagZFhpQf5sbAtGDYa09IRrjF3qpknlHYKmB1PWRseT1tSaPBc2oiC00ag6NjzCD2yh5waUALs7JApPLEdiQslhVkzzYtIxMiO1GR/iZBCmIjciiEaqFtbYszTCdNzOqr0CPUHNuK/XhUa9EFVIhlBxdKzkXQ+anLfwDcty
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rgimuaTzKzzuc9X8gDPlsWzgY4T5MKC3TG4r68m8x4SCU115VXW6qCQtPUMx?=
 =?us-ascii?Q?KQ4r4QeEMIeggkAC6gcG0Yq2McYk31jDn8oTy4OPmmjU/NegCatoQ64cX1SM?=
 =?us-ascii?Q?jYNGI5+0NmGd/W63P1X+qngz4TRSRIHV7OOHsrtPdFg9xShb3doll10Uk84I?=
 =?us-ascii?Q?r/OLxMsZ4MbuXx9NZfuI84y7DJkpXdeA1wP/kUyDkjNpbdtwCoHcFkNzNNGE?=
 =?us-ascii?Q?enX0Ev6V5MtrZGgCO31ForvJ77X3Up6COEX8aFAFAPGLUxr/AIw1GLDSENwy?=
 =?us-ascii?Q?G4tCUKSIS2bfAWzAnOmY6EXIGgrF5FS3MzTqhm0p7rlMc6PWVh2QOwghhw8R?=
 =?us-ascii?Q?AUYNyslTNqHR936VtXIxHU5XdbRtTqJMlP4UpOzFjbyHPgqA+HZ6297c4la7?=
 =?us-ascii?Q?ca6s+Y94iNJJqgbR2I1jV3iZyUBu41SG6naSnjX7YzVqS5HO9CY4wPseWvxr?=
 =?us-ascii?Q?2rLUXAzAsChkoS87/7yJWT6MhaQ42iXotpdiIJLcKcETo8DcLglAh8eOv/aI?=
 =?us-ascii?Q?6SXX6YJiCo0+5MIjUjo8SyW9olp6PGgaVFriCgz8XHHG+FRBG5nAuRr5cAkY?=
 =?us-ascii?Q?RFev2Bdp7pgws0GvfI78RGLy4WnRzKdMrT7zC4ndtmxQyWSl8mlYP71IJRMV?=
 =?us-ascii?Q?6MIkK4iH3UIh3KTYjW7FpyyekOjktFOfWZVMSLkvUssNZJ6Yv0oDzUe4r2TD?=
 =?us-ascii?Q?z6O1VOhdpv8NjUY3FCWn5rcEJwecOok1C2zq0CpeXff3KreuFDD+yWV6Pqho?=
 =?us-ascii?Q?afCH0l7jswQLjRbKwTccjklcZ3oS8p7cHeNCpJL4fLNiIjFurpE6QoHDRyaV?=
 =?us-ascii?Q?ROzhUbapDKIQSyrdDi/bVriqIUyRF1iMM2wnLdLlh5Zb2uUDKK/7PwVlPp3z?=
 =?us-ascii?Q?+2tiXVoqzZsppt/EgkTAEX9Uv+C9OsYm6ZAQpeFj/gWb259f0piUPzElvsgz?=
 =?us-ascii?Q?bfLscmFwmfieCJPh/BPFeJpH5ZL59+AUFlKjSCHUEfeG0eLCwQPanXewRIFh?=
 =?us-ascii?Q?bLgPTd+gXhxamjoBtU7ePppLiKvnYRTzk+pzuvUJJf6NXh4P+mZnQwyMLO6w?=
 =?us-ascii?Q?5pE4t8tcCt4rquqBejAD34lvuy6XnpSe4t04JKzexr5ma9e+3dbCxbOj99UL?=
 =?us-ascii?Q?8n51LfjZKEibPTz+tRTd6/4KiCKpWKb3LJDu6N6dGsSI4UgX3F1i6cV17D8D?=
 =?us-ascii?Q?pvirb/04Z4e/nF0iy2dA6ScEib72OI6qIybYSToiGw920F2WGAv07mXxsa1E?=
 =?us-ascii?Q?vIgTYw+jUTlObiBpNKtDFnB1RaFPq+zSNx7UIYSmsNZk/TKrjUse6znilXVi?=
 =?us-ascii?Q?A91K85Q3Zya3RYnYpoP3hKGwrmR7ZMYBNH5Z5pkTrfv4a12Dy5dn9enPA2MJ?=
 =?us-ascii?Q?Q3JMDNhRBe9BzdvmxtIRsfyILy3t6DKF/oQDSqdfd06tv0fFM5PETICMa1xx?=
 =?us-ascii?Q?uVPSyMDIqEr9zzW7OpvUhV4aPCSfwR5rAF3y1NyB5CBEsp/GY3OKkEldIEXx?=
 =?us-ascii?Q?0kAaZxSbip4wCjTitELEk4jRnJ/cSRLmy8s397Ba1uL7Uy2bMIMkivn7FxXv?=
 =?us-ascii?Q?3UyYhS3pqdRtZM6+A10DRLaxqYD3oiJmCyUKp8oLk7jROWfAVAkou8YHagui?=
 =?us-ascii?Q?f0Opi5NFH+aaHIG7emnxRrk1kmNNTVKYIpigbGV6VOwL4Qr4/+sqRaG5hrK7?=
 =?us-ascii?Q?zfMbU0VjCP7i5iRQWwBXyOtRScNUaHBFMLgOO63SKx/iNkjR3kk4eH5PWzaR?=
 =?us-ascii?Q?kNYdK8iwmQLrwlttDrQ9IXGloIQvxfc=3D?=
X-Exchange-RoutingPolicyChecked: 
	bHO8gZ1xqi6O6ikZV6tkRjHj/p6trZaad1SY3rUXLSj9hTqCtGMJVxV4aN2RhstnXh0kaGFFmICoQq0MiW3IHkV1FHtmOBfhL58rsSFwr00v9eNPIljB88qhTSCNzJ61fktXn0Mo4eBT10cEGHG9xbnceAfTm6uJlBEsl9YB/XiWlQOcg/T0MWSS/1jgURE96bEKJS8eZKdSEipZJ85QEDFyljKQg1dH+5xk1ygxGhAevy09LcrLb6rNeczDFHKaWvNZGMALIPHn9Yn4T8AocAlIrcssNUL57B0Scrj7KRH4hC4CY4CeLxWdP1eaybT4ZUNJOe844U5G0QIoyqK0tQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef86594-4663-4449-4adb-08deac5ea3f2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:32:41.2066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0yHgLTuXZYheJZ2EDAUCRqDeCoM0GqsVI0q0FCiR8vR1u+6Q4WL7tCCY2PeOnSrlA0Lo+kkqAapu13gySLjOUaTS1qchhC6riYiklY4qdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6288
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3NyBTYWx0ZWRfX53M11gIg69Op
 zOX03OlUbOzTaVCzNNZVLfegmirIGeA/1yUSk0Q14ZGfoMC6XRsQrJHEl8Y1/KrC8hHkxRdj3vX
 ePNgy8SxigSoTt1zzgcETOsarZRk1QndEm9HFefQdc4sEOsfexxmUoWx1+I/670Ym4QmDyU2pn3
 I7+z0XS6Tp6fOEJKZjASr39cFUOM42uvwUj28otkepe3oRHSGeRF5FoUC2hqAIvV3osfA853kkx
 HS3xGAEzijtqaEw7x8qjMeqYyNEeLFHACGsuwZ4iKH0LcjGKhDIxxnxBYOwctvHMgyblCqPQcuu
 akSnDCXrc4d6BQQxq4N+rC/kKwEniUl6i1+Y7qc1tH49IEIYmyEXC1kXxZfnJJeGCUb6S68Vm9S
 WubnOBaZmMu+A1Wd9rPruXKzwjNG49VT+NLqEBxtqaMbbN1UVjeSPoOMFdA+74ZiOWw6mP26waQ
 zQH3OJx66fbmN9Zjs9g==
X-Proofpoint-ORIG-GUID: wUdHkcgl-wHx8jn7s1HjR1WiK-Z3P08y
X-Proofpoint-GUID: WeMDsyi8zs35LGFoe-aslMcFQ2KDiInq
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=69fcccbd cx=c_pps
 a=5tz+rB/kfTqQMEo17N6B4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ggAbHpMFlleW2AOwp04A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 17:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236614

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

libatomic constructs gcc_objdir using `pwd` and assumes
MULTIBUILDTOP is relative. Passing an absolute MULTIBUILDTOP
from OE results in malformed paths during libtool install
operations in both compile and install stages.

Avoid passing MULTIBUILDTOP for libatomic and use the upstream
default handling instead.

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 30b2832c82..e305180c64 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -83,14 +83,22 @@ do_configure[depends] += "${COMPILERDEP}"
 do_compile () {
 	for d in libgcc ${RUNTIMETARGET}; do
 		cd ${B}/${TARGET_SYS}/$d/
-		oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
+		if [ "$d" = "libatomic" ]; then
+			oe_runmake
+		else
+			oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
+		fi
 	done
 }
 
 do_install () {
 	for d in ${RUNTIMETARGET}; do
 		cd ${B}/${TARGET_SYS}/$d/
-		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
+		if [ "$d" = "libatomic" ]; then
+			oe_runmake 'DESTDIR=${D}' install
+		else
+			oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
+		fi
 	done
 	install -d ${D}${datadir}/gdb/auto-load/${libdir}
 	mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/gdb/auto-load/${libdir}
-- 
2.49.0


