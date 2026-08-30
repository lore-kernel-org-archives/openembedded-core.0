Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514D4C61DB9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8087.1788094774059485452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LsOkLAKl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCnB9W1367518
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 05:59:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=hM47/F6VfJTmSBnlexBJ1Lu5TJtk1hPOVXe3cQJ12OM=; b=
	LsOkLAKlTpdTi20d5KzWq8H+xKcC5pXATlUaPzye9clsYI1Tz+HP4W1zI+N261Fs
	LsErp3cr9HfjEst/YlhwERnUjy0/93wU5vPxQ4ggRkb7tFiM5LtUi4rNz/pspth1
	co1ouqFEdxlMltavjjipcEBeBPF9087xNDjdlF1Wte8LIaMK6YDLvgfCO6ScEWZA
	gDqQjh3k9kcXFFI6mnQ3JT+n0YtFPopN5PCJ8HI0wmEpLnknXxYsrfoHnB/1RnEY
	SmAJ3QOcavtdL11Y38C1+IyjO4k7g5Zde3bxTeCC9i7SnfE5OwiQOGjpFgen/Ko9
	D4KHsuHXk3l5bxA9TEJjRQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021133.outbound.protection.outlook.com [52.101.57.133])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxe8wc4-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 05:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGdMR64Xxlw7FgDY0j+q6mcHQVQY30Yg3R4cCOVnHmND9lqv6ol2LeuyKh+BlGcyjezyE6FC3RdEdeOPNfeq83jqICjTqfvJZCvpU4j0WoW/umhWnusUXW7lkP26fit3V6KrIOSr4tQfIYpgwqps9VvP87sMYRYnL71hOu/cn05EmlJXk6RyV7bavLsy+RKTQhH4n5NTZOmwZphzJBdiUG8kOTXle4o7hGp8LYDxa4kZHF1fap0SDb5n/BSx2o1aNGvjzevCWQSvSG5IXszJ+JYcZj0LXKtKgSVVc54XHOJs8Mb4woFZTA5akJet/LYvDTyOP1Ld8ISOBdR48tjIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM47/F6VfJTmSBnlexBJ1Lu5TJtk1hPOVXe3cQJ12OM=;
 b=qja2APEN4+KG0HwfYRtdgjWhFQ7s90rfA8prlJljAsI+QZsT2oP+jOUdiTh0Gs61S7Zv7WT4Ocgt8ONRlFvM4vnH/eHHC6YmA0IGQ4sKnK+cTE0BjcxPzstheXAIPEaT6+ESphD40kemQNiZTD2MDn89q9k9pO7j4F+kFiOoZZuEBFimoS6vqxVRZsjGPIc6xfP7Bl3L0xWeN3m6tJwnFlwWtnU0nIL83yKB/Y6EwpYUEaLC26GimtWawKrk2uplAa9ozeNwoYfe68/QPyiqKHZ1KZFvJnUEgqCedtA6DtOCBDsFLbXIYXFshwtMszZKPvqY5/Lq72crzcYUJ5AhZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:31 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:31 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 06/11] clang: Disable clangd's decision-forest completion model on powerpc
Date: Sun, 30 Aug 2026 18:28:46 +0530
Message-ID: <20260830125853.1139807-7-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5a33b4-da62-4396-f415-08df06968827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|56012099006|11063799006|38350700014|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	EbqmSDCVwx5ZmirwPDxvvvhzVRtyNDGKo2N0lavGE8W7HcscEQpYSLAJ5wPRpxS7/vrbQJb7fy9vzWxptvOdnGGTtxSIQr1Y+mZpQYat/WspVLbVfSvPT+crfEvgSq+HAEOYD8Mi7XZT2ybgp7lYfaTYqS/dxC7dRgsABI6M3LSfTn4IyHNbdTVzdspKWgNZdtOHJHO2B68T4QBaTE8jkNczrH5xNC5UdUGX3CXcv3PImb22qlQgQ3gFlaJdSFzEVbpPF64C+Qo9aBSGV4dcWZAfyoyAA1Y6Y8rKibZi9TYTJqmkM2wyOgFxFN8IdfNVIhDChWYuQtvgMUtMxGAwvzrGNts2iKpEnDK/bcTxqLkrVUfLz9q4dXvAg4zuojSQPp/cRxDw/OT/xB+bfE0PTqXDFDUiHVWT2Aj2mCs6LRR8ercw2uOaBxUrTrYq1jDUBTF9j3l8KRlPSDAHCUYK4DJUFQ+qwhqGSNEY4Yt5FvN7W/NDG3mOxmqNEbbABtp1BOVo6uQgiPoQ2pCWXaLFOfTtiR68aZ7RYIxyjQaW7OrzKU14qxmdY4VbvzkPRxRueGY7T5HqrRFFTWWPkYkXdHwNzz+Wg+kmWQuXugIaSG6Ps7oWMyArKVcnBh273xppCg2zflzvOFE+JWqKlmT+H0TepJWYSRIPwG/yJFaEmVOBExJJNnMyhfEdwJbA+ODlCII2pKtvT/xBWdpuYDO9mxDmsHRmRbGFejti7egWKig=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jEy3/JYmZoZLe3BYq5R8CIue6UXoxC86lA4VeebARNUmqRu96ohuT71WK6T1?=
 =?us-ascii?Q?KYZru28Nebbw0tq3Hsx7/afbNWJoKlXrIKUslNKgiPIHuK1HqFPj1KIltRLn?=
 =?us-ascii?Q?BVMC3pjVCDpXpLsMf+ICjoPEZNIR58JWqWfFcz7oC2e+SCW6OSql9Rj0Ly0o?=
 =?us-ascii?Q?woQbwUaHQYVtQc/kJdjxvqa/M6yEYAG4cg2F8KqalH9ya0aY0I86xRLcKC7i?=
 =?us-ascii?Q?KLoW/7gmmQ9m0SphwO9D/xT2FH6cdsSaUkKevZze1sk5FAFTaiF+vaiGfQCN?=
 =?us-ascii?Q?ZipJ2DnCQweI5DiNo12NdwRkdk1WRuJJxcC/DtKLU1q9Fx2FeiMdSkstUAHS?=
 =?us-ascii?Q?us6Wet/7JeQp+Hb6xXYy59jrgt+UasCrob0KCeglhxoudIqKTRdCrRLo4ZHJ?=
 =?us-ascii?Q?EDYTU7FRk9rVbehBR09IRZOpFAwGmv1JM4JkkKsfNi6jW4sHcjwpYlHmabnq?=
 =?us-ascii?Q?aPPcfAEB5ULu5e4beOeUYi+Gpz+s4UqCJIOtuya9l2wYQMI4ODY0TJaIsMgC?=
 =?us-ascii?Q?DIybU05rhE5fENBEqunEQ7Y4tGI9V8vXBlXluiIwxmX05cIHx7xOsUeGpC8e?=
 =?us-ascii?Q?lCAfo8XcIsBKLHdBuEZ1ZyQJk4MTPrD8kN3EVtm0JtDxKuAywWr+nQcUs+a4?=
 =?us-ascii?Q?Z2SUkCo/EjZfsQtfqS8LeVY3ZeBThFOBfqlkw2ak0AinOmROmJJVZ3VLpSJ9?=
 =?us-ascii?Q?/oNDVZ6/hIppMJ+L/ph9v7dCtA7CiDzH6ES3abckWzNhLlEaTGNAvvA4GN5C?=
 =?us-ascii?Q?m0HGfyzrlYKidQWu87jmL/ohh6bSNJJ+yTXiCGjvNVjz3oUb1kMh0UaJ8tSH?=
 =?us-ascii?Q?6pmUVlc9Wa0FUvZHfB6EDAfa3Lxt7dPVYuxa+bNI80TVU9qzJjLZcdsyGELd?=
 =?us-ascii?Q?DQB4m9dZDj4e+Q7iioq6KScJBjQS3gI3b3WWFZXVIC0arqhI8yU532AiCVgJ?=
 =?us-ascii?Q?78xgPbFxmhhAlEFmgSVuBiOqxGXRTQvvx3iVEzH6t1awc+rSQTYO4cr/AMY3?=
 =?us-ascii?Q?0PSSJwJ32UI9duAldGlfFOtGn4VKaDsC6HFHehazNzSzKMj4aG0H4kRnFPfG?=
 =?us-ascii?Q?14HNpgAUWo8qW5Sv101mopfW3AVzvPHxnjmfArP35Dmt+MGhlkp2W3IrC4j1?=
 =?us-ascii?Q?MCjAIN3IBiJA3iENZFgml5GzSEyGGlfYTd0N9SZUTfXFbfvHGhKafGHIQDB/?=
 =?us-ascii?Q?nRBBme03d+ohNmjNKOPJFe2tulKLBMp/1MDBlavES0LeDTNiCc2CwdeHu56V?=
 =?us-ascii?Q?jFbwNgctGwhtgd3s9W+smx5P1hOkYBfBULsJkKXYqF0eQD12pdOrFlYWHaVC?=
 =?us-ascii?Q?+ITlHNL6EE928lbr37hVUE7gGSUqDOPIgAERGK9+3agp+lw6SsEgi4kDwRV4?=
 =?us-ascii?Q?JD5K5+ABXvjLNfCYNIJ0VSX2G9ZkTcWRfP5EApCLhTc82yAND+nzZLF+wAoE?=
 =?us-ascii?Q?vDJkzMhIWwNiXcRjwhdDTXTrix4RdVEnAh3y+T8ko13s1QYLQGnzxWv4CIV5?=
 =?us-ascii?Q?kWqhuH1PZaBZvGDn9+FHdbbHDjVWvCmFRmYcT1ch2r+toEZcp47Ed7Ze1Jfv?=
 =?us-ascii?Q?yShhG81AnhlaINukFW8YJJSDdg3K4ZPFW3tiHN9c9YEhw2Q680E4hTxDNOf4?=
 =?us-ascii?Q?fJSVx7NlLs9I//GiS4xqeEyeuuLvhL9KX06q0pwQ1FM2x5NnwpzP713LplpJ?=
 =?us-ascii?Q?p4g5rvS2wHCJ1ADUTpthHhVyLf3nxAQKAKY91htmU/aLRKYILOUYjEi0yTnt?=
 =?us-ascii?Q?gFzjKGHQa+Yz2mQFLMAQxXhxqxEW6Xw=3D?=
X-Exchange-RoutingPolicyChecked: 
	LItuHkLXxtrP5ySZImk2U7QEf6yxKOi4Uwwzqb1OZcPM0KWs94/AdUke49etmcyiLi9ilsIyGJ3L6RS6N6sJcU26rqRoMIPEc92VxSpNzgj+3Lt7bU3r2Yccpt19V6CtNbGKtgeDrIzVUtNLzH547P0b7454p3RXKU2VqMua0CLjb9YAZe0ZfRFf5RRpFQtZjQsFTjHf00vkIuVKZC/FPIRt1Sg7y1tUDfRPWjHfbIGFZmxJMvSCGJqcFOETY739RflpgNSGlHpzOUf8pM33E8j/+ywCN1iMrbD30yfaEbMVivfsJYFpS4FlC0PySD4smOoJ7+rjJ2hAofFylWClnA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5a33b4-da62-4396-f415-08df06968827
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:31.2318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcpP6MITHdLwbADmlCVbVYkBB6O96NowZmO3/0QVboNmfBoUtfndLxffBXenFDfFO70f+/9GQkLfVA4g1w3TnCCZxcdDY5GLAY7ryyIagsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfXxf4D6uMrSmka
 T/eFUfd8IN2ciOkU/0M+Uy7oahVS1ppwZkKcidlABg8tCdu9sFjRV3X4YMePGfIpUraiK0Yns6d
 kNxfIeAL0Kk9z+Z5/UOxly+il0RyMDgEJAu1A4R+p7AIJ7+j1Z7X5t8Qv3kC9tPCOMCUEeT6K5s
 h8pJcekXZ2kob2QjZZFEhU6HGwS32QG8N+pHdJWWRTtlCpwZHv90PweCjoc9NjoSVgaRwk3Eb0o
 P5thBTWONB5VOKKYNIoDAPMtXrM6JvePMptVLH8JjhocG9VfSUT6lDfaCs2FtKzGVjyj8eWc3HS
 YF93F28dMLCE/JTex+nnBd7zWU75cu2qWc18nLt5TlCTdPOE1Fjy3cVm6E4UvAFYJKhtccCxDwW
 nLBLv3JGb+46FsIUlWN0ZILzYE4bZ/0tqaIdCrZP2xOEa2F6lz4sLG9wb54b5fJSyfZAZ9SPw2C
 AoLK/LuPEdxJGuy1dJA==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a942935 cx=c_pps
 a=EJv/EIs7sVlNY2qgxPh4EQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=d5IADi5cyizmRnjw4eoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX5Rp3EN85n5Sa
 PNsQp1oMUSSTuqLOMrWpw698YNrSEx4+MUCf86gyVXzO0RlY3Wh/gR/dE5Rf9Rvh7F5hgT7LRhQ
 3zWyFYtGnFHjbll1UJKjsn93y7gFxsaNlcwuEXfBbj4gS8ehl9Dx
X-Proofpoint-ORIG-GUID: aq-_h1R2d_REme9WXOmQMJ4opjyp_2uA
X-Proofpoint-GUID: 2e_sLc4VWaDRmTY8ramo_l6iQhdvpDFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244648

From: Sunil Dora <sunilkumar.dora@windriver.com>

The generated CompletionModel.cpp overflows 16-bit branch displacements
on ppc32 and the assembler rejects it with thousands of

  {standard input}:177591: Error: operand out of range (0x81f8 is not
  between 0xffffffffffff8000 and 0x7fff)

Build clangd with -DCLANGD_DECISION_FOREST=OFF on powerpc, which falls
back to the heuristic completion ranking.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index a8c5e8cb2d..c54a49b618 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -75,6 +75,10 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DCMAKE_STRIP=${STAGING_BINDIR_NATIVE}/llvm-strip \
 "
 
+# The generated completion model overflows ppc32's 16-bit branch range
+# ("operand out of range" from gas); use the heuristic ranking instead.
+EXTRA_OECMAKE:append:powerpc = " -DCLANGD_DECISION_FOREST=OFF"
+
 CLANG_ENABLE_TESTSUITE ??= "0"
 CLANG_TESTSUITE_FLAGS = "\
                   -DCLANG_INCLUDE_TESTS=ON \
-- 
2.43.0


