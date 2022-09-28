Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C60C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 09:40:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5908.1664358004534769293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 02:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RDlSO68v;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=627041d894=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28S7AqQX032177
	for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 02:40:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=4F0Q5INH1BJ3LQxyzU78BkkN0doLVAyIU02zp5PFDQ0=;
 b=RDlSO68v2S8e5NlyV7DxZu4JqOSUUi+V3timtCw+TBXBAdaDm9AwqveifibRoCHLCY16
 QB7APq6TJparzkDw18a2WyP0dl4dWfEpV7ZaxtNrBX5aSL2dkm3Wu6fddsF5YPQBvImt
 hkUNriAQfbJAFqZf3inLRWW1gjuhsYzq36S/moW/hqGjZvpP7mygyabSMOYNdXUX/KVF
 GfA0XAxTSqZeJ0EwpPgxKJAbhDOBKLFWd6Ckix92f8p5ghPjL0HFtwWAx8YOtJWCWMUk
 jYCxufiN/1FoGaiHh7IftIQPYKIpxFxIdBStHgAkAcrR0M3ny6jsObFshNS2Y98XYO9g kA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dkb3f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 02:40:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD+ITygPcw0AL0eWWHqHTFIujBvKHi7W1z/3qtl1VlrDitPpb8YWBY4ZrD0/H/toODYPaY7duWw2ptOHCF1zjNAKYA0kW3e7IMOaNn/vV911rbTBVjgW0FyhLiXuqgkb5WJz89CMX8EeUd1+GlUAdo/8vRF4uAD9Q1btvF918cryn2ZJSN4DA5/6BV09uq/AAUZ2hCUhlO9+br2wsuzTFa7juG+xds3hdPWS9fwVqqa42u0Wk/p2Op1F2/OCK/JyPPLQqHbBKCkHvhGlhExfmY2HNrbD5oQ4fKLQIJAmeGojJJQ12ME8ygCPViEDb7ttKyA6txsmz3TXtZ/FrIRe9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4F0Q5INH1BJ3LQxyzU78BkkN0doLVAyIU02zp5PFDQ0=;
 b=Ub19cXxOLAt0oxpALgh5xqkh5/OnFbzTd7dDIuRwYtq6GK4uLLevVGiUZKUia7jfqGeMpQ+GeEVimMaylaEg1/UJj8xUslOSe2O1GSp0Pi3rEzL+cnMpPnn6BG7WjgSnBs+aH6Y47wkgOE0CY/DhDnQIYBxAg/zZebbqvgF6p9HdVPaMrCnsUZHK3oBgwJ4+grkrMlQIdyGyq0tp4yeH9zmP2tHSIqVlSa1WGn0hlbVPeaToWvFc17tLEM0bE3GzhRDgmRRB/NrintsCJ2fpm1nmFHq4aAyKMkP8Zqhr32qgTwWzsuwyvC6ICQCda5L5mXY8LFTWdz34ddYeMRa2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by CY5PR11MB6115.namprd11.prod.outlook.com (2603:10b6:930:2c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 09:40:01 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2572:6bb3:3214:81f8%11]) with mapi id 15.20.5676.017; Wed, 28 Sep
 2022 09:40:01 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] stress-cpu: disable float128 math on
 powerpc64 to avoid SIGILL
Date: Wed, 28 Sep 2022 17:39:46 +0800
Message-Id: <20220928093946.2360743-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|CY5PR11MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 89fc731d-0496-406d-1019-08daa1356a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YIWEMyde0Wr0sJfLJvorhssvJVjG2ZZwoNuAhhd1gV+cjHsx6q7t2KgNC/qXIMZuMPzLPuPT7DiRh+RnjSJvTLuSo1WOivgXwNyAuL75DOqtknnAiK5/ENrYy0oceP3dY/tk3rfOTPU6WrSRXwGUHtT9RwkC4Y/1K1mTS4cPgfxOyz1HAt/wJ1YwAavFUdwZgTgBixv4jlNXbQF52YHZtiPjxyoGSRrxgVTAfqTP1IMV7+ww8EMJlwsgZV2ABaSqDd2HOnpzXIGAmRso+42GxkruucNU7P+z6R8gGgabSS+FUUXAAFoQwKoOSIV4LgGCybmxGeeUBj8LH3DoA1Z6pgoSD5jaTjX/0UsFyzVC6QlBmz8BjdUX7L31wm24gcMPvVp7D6zrYN7swQox/95/bFyH9ifjDXyUqmUjFgzPeiX9zhhEysQHwZuFgoOZNXqbAz/aNn8FvtFI+fJHlyEbioOFdzdwjfGSJDEuB1P7WQWJQosc3SKsR4CUQst+LIA/6NpuFsmoyYVzQqolGq8h7GGFwtOce2Fq8Lq3+6/8zUfPQxOX8jDqCIlaC7fGMlYWG+zrogYGF37dk0udOFl0pA2rdqol68SppaMmlbEgvUn6DluybC0CoHEiV9WgUpES5atSkZdPSUnv+kt3PhXYBYq9+VurDOF52LdOismMgRRtTi4BWBhNuY4zdg57bT1Unll6K/wfhtnA5WTRQ3VHcZfYy88DkVyCM1bxhFfeT1SOBok2iPqB6C0FpGFV0Gtp5WtJpw5sNQxptipDG/7rgvbjJWsZts0QcqJwrUWfm1aifu3bYFB2/0BmiczF9xydpV9uGb3FGoyiQRNYRwROVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(39850400004)(396003)(346002)(451199015)(83380400001)(2616005)(186003)(1076003)(38100700002)(38350700002)(8936002)(5660300002)(41300700001)(2906002)(478600001)(6666004)(966005)(6486002)(26005)(6512007)(6506007)(66476007)(66556008)(66946007)(52116002)(8676002)(316002)(6916009)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l8V/bjr2WY3/3p9utRh9w28LrbL8pM9hl6V9cgUKBBb845IWgpetKL5FjFjf?=
 =?us-ascii?Q?kDbBxFw3ONz/hCp0zYcal7MpRDNpRa780fJtkY2VYFnv2wJxl3wQX5Y3rzeg?=
 =?us-ascii?Q?SSkPzllTRvu8Afz5sAx6nGosIuZ6ksY2+GjgVHemm2QK1ZTescxvo2tjRB09?=
 =?us-ascii?Q?3UbB8F3q07tCrdGScTLUQUgECy1Q/pGbWKxgPE32gy0fyCMK7oyr7pgmzq2J?=
 =?us-ascii?Q?NZ4qxKhXSEAzKxYqTC7ascWQJ2yhDRcozuNMYN5gxZp6njbc8VeK28UWtIyy?=
 =?us-ascii?Q?ast25qMawKsK4GQ+C4NdAdmU+7rhDlf+TEXb3e7JO+lROlBxRhGxaRHx811J?=
 =?us-ascii?Q?N07R7q/MbwFshWfE9wCcJNwTraXrOe/NdaUA+uL+r2VOBb+rZytyacCGbGa3?=
 =?us-ascii?Q?mZ5ECapii2y1alb9r5G1Ns97ktB9l0RRevibP1UCFqdDyYYshhXLl3ubqHvu?=
 =?us-ascii?Q?bbKun4221QZMipMvjZZZ04Ad9Ny/FfL1gfjuGrtgErhe1AkhtQyi5bN7PLVI?=
 =?us-ascii?Q?arC9j9awBu8SlmYCYoJd/d9S92YHr3wmlvEsAp279+4Z5KBrp+jMVj8dK46R?=
 =?us-ascii?Q?Fei9hVR8e1tEQyCSFfhpJqDTivVrkAL7QyRpGfkjn+h4w07dhnI9/VSHprgr?=
 =?us-ascii?Q?KVCj5CQpVQk/JaBcuaS9vzvmlaJAtWusxE8F2r4ydfcPlMgNgzpFi2IJwUY3?=
 =?us-ascii?Q?RM7N6ECCKmuRuTt/OWe6MDbeFLzKs3+EkYCkm6f+saSXSu+35Y23bWjF3w6T?=
 =?us-ascii?Q?ZAefCPedEy7iOwTLifNoT0xG59hwg1mLs7anM4EQzG04Ezz1xPjDJRPBQed1?=
 =?us-ascii?Q?RSVxFm0YY7MAsRQdbum7bFBtVNT4JcMJQtEn0P1q9P/W9lTyjYaj3DcnKcJ2?=
 =?us-ascii?Q?nr9NDkG5pM8uY9SCwgJ2BujVCYJSSf1tv1n7yLT2nzdTzFC+ZaHAhoxDd8Un?=
 =?us-ascii?Q?PXfsuXnqFq96NcjzJCYEYBlTmXqbrDmOFLnQf30haIMYUnoRsB831OGWIkK1?=
 =?us-ascii?Q?HrCYkuxx9IRDJ7yCfv7oWYJ8REgdoRKllh4d0ICkbaGJeke/gaP8usIDj/VU?=
 =?us-ascii?Q?LVJkObTnc/4jUPsp6FFNz2O726GKq5nt6pvjPYXWcBkmjLvrftV0FUiHG1Dy?=
 =?us-ascii?Q?HG0eyWs9xfscLvy6LutOeYXPRe3mHoPGAXFzD3zHQIn6N/zAx88+HdcrVub3?=
 =?us-ascii?Q?sfUGTO+kl14vsj0X/qWvyitLyUfhP1rKAhNlugEJhdhO/7UbGMpNHdtbkeQZ?=
 =?us-ascii?Q?mDqiftWW0ccCQqihruVtTJLxnaTQVIePjSWjkUeHJNbLcRVEGuqZTj0ajKON?=
 =?us-ascii?Q?y+SAuRxYC9K+eVD5wj70izCwlhfEvWEzo2Q9LjJNQAUG9bfSnyuIcpEZ44Bs?=
 =?us-ascii?Q?Knz81e8dPEAotCgwtnC3bWDTDKLjyoBv0jwt+zA/DGphcq8GYeNL3kObCYhP?=
 =?us-ascii?Q?F5PSkg9fD/NBCY4ZQLoM4tRqbesci3jOmXigTv2UARdnUrXrmSUEnFh7aGNN?=
 =?us-ascii?Q?tcKng5nZK6mXScVSirG61pmDZnYJMk/bOmzZpFc1qNZL2AABgkgZW0FngwtW?=
 =?us-ascii?Q?nDPaLoiOQtGjrYNiOjWLcZO9z4cey+b5OULtHuS6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89fc731d-0496-406d-1019-08daa1356a44
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 09:40:01.6717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hdAQ3ynwz/Z8E4vuXztSmB14DhXPOPOXgaswr6xeH2g3szfrjA4WSUuPThff/RGUrDnpF8eBi5ugl1BWWlYa+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6115
X-Proofpoint-GUID: qy8Pk1pfBXZF_T9qQ7pO8ihAM9y2GsXW
X-Proofpoint-ORIG-GUID: qy8Pk1pfBXZF_T9qQ7pO8ihAM9y2GsXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=770 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 09:40:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171142

float128 requires instructions of xsmaddqp and xsmsubqp which are added to
qemu since v7.0 by the following commit.
https://github.com/qemu/qemu/commit/3bb1aed246d7b59ceee625a82628f7369d492a8f

While kirkstone is still at v6.2 and thus experiences SIGILL as follow
root@qemuppc64:~# stress-ng --cpu 2 --timeout 30s
stress-ng: info: [972] setting to a 30 second run per stressor
stress-ng: info: [972] dispatching hogs: 2 cpu
stress-ng: info: [973] stressor terminated with unexpected signal signal 4 'SIGILL'
<snip>

This is specific to kirkstone since qemu on master branch has upgraded to v7.1.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...le-float128-math-on-powerpc64-to-avo.patch | 43 +++++++++++++++++++
 .../stress-ng/stress-ng_0.13.12.bb            |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch
new file mode 100644
index 0000000000..bb35b3030a
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch
@@ -0,0 +1,43 @@
+From ea9ee4dd64ee88e03a959b2c694aa8feb53c7e78 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Wed, 28 Sep 2022 16:47:24 +0800
+Subject: [PATCH] stress-cpu: disable float128 math on powerpc64 to avoid
+ SIGILL
+
+float128 requires instructions of xsmaddqp and xsmsubqp which are added to
+qemu since v7.0 by the following commit.
+https://github.com/qemu/qemu/commit/3bb1aed246d7b59ceee625a82628f7369d492a8f
+
+While kirkstone is still at v6.2 and thus experiences SIGILL as follow
+root@qemuppc64:~# stress-ng --cpu 2 --timeout 30s
+stress-ng: info: [972] setting to a 30 second run per stressor
+stress-ng: info: [972] dispatching hogs: 2 cpu
+stress-ng: info: [973] stressor terminated with unexpected signal signal 4 'SIGILL'
+<snip>
+
+Upstream-Status: Inappropriate [This is specific to kirkstone since qemu on
+master branch has upgraded to v7.1.]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ stress-cpu.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/stress-cpu.c b/stress-cpu.c
+index 0a08f1d1..2849e715 100644
+--- a/stress-cpu.c
++++ b/stress-cpu.c
+@@ -41,6 +41,10 @@
+ #undef HAVE_FLOAT_DECIMAL128
+ #endif
+ 
++#if defined(STRESS_ARCH_PPC64)
++#undef HAVE_FLOAT128
++#endif
++
+ #define GAMMA 		(0.57721566490153286060651209008240243104215933593992L)
+ #define OMEGA		(0.56714329040978387299996866221035554975381578718651L)
+ #define PSI		(3.35988566624317755317201130291892717968890513373197L)
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
index fe177a4de0..807ecd3466 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
@@ -5,7 +5,9 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
+           file://0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch \
+          "
 SRCREV = "f59bcb2fe1e25042e77d5e4942f72bfa026fa305"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


