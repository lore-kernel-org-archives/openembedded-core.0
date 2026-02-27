Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF4FFD9E29
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 00:10:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84502.1772151015884138187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 16:10:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iR4hyjXt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65185c03f3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QDc4gu2362031
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 00:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=MAVOTsuBoUGPdFKl0te6
	moviw01uveXvvUoAwkhxzSM=; b=iR4hyjXtBDzxej4GBXeOZ+h0uUo10QKYRxI9
	P0wJLHTD3PbNbc3Scms2eJjDHYjQK7C8Pe67fa++X7D27peVh5nmYrblgt4gkg6J
	vnD2O62gVeU+WrsvimWvXw7otJy9etDIDvCc0Jj/bl8nYUdHkxTPt4BLu5CTxn+i
	c14t8N0Y1rjKRP4IiVQ1Dc5cXppqxxU06WW3D81NYcCOGFcBTgo3wNUnf24PA9m8
	Cn/YKX5EOjMOBkxJtDzW/KbXLhXKcBVSYDACOi+GOkEx80hPguL2KUoyLAPXvtYN
	u6TOMsHx0zaQN/fty+kzgQCN9kBwc8Kn0mKPZZJeuAs1nK4a4Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdvds97a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 00:10:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYCjqUuNDje2VLk42KY0vb+zNuOg0mSOPQQTROP6H/S/VCMj2H2GHN57EAdZcaWMtNEG/hug9x2rFaN00sAwTlPpvHFTFBXSmAgRu9JbAOMAWJL+updiJxFDwxv+jQWyeFCmsiAMzDka+CukOWdLVu9gPj5FKrx5472QBHi4yA9unxvGZqLIYXppxdfiUwzPGGHke/lVT5O7V8FTezjdD3sUFbGI//iNw05JrhxlLlJh2kPJbbzbdS3WzU9UDKLG/icHSP8yBZzw/eSuCXWCf0oi3JYxuC5mH0IUtlOb7FegTW2qtabBhd6k+KUvXZNxQS2cZlcrhs7yQaptS15IQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAVOTsuBoUGPdFKl0te6moviw01uveXvvUoAwkhxzSM=;
 b=cq2O2Fcj45fXDp5M7h5Q7mHyqu/TEJePmkG/nhi76D3TW9bGKEHHl3auhef9pMbEp1kBPvJi/zFHQolXzJh75tlv1LWGRVGTEB72Ixn+Qu33Ttb8fokdlxxWYCpbSrtCpSWQ5/lnMhfsQ8J5GlETYbKNHGYSvRG5Kpnj+5HLVIhMn/piK3b4DUkPvXWEcyE3NImdcU1Hh4TFbAoTHnkD89+osQQP0x0pc8ZwVr+yV4cJqJ2campnG3Kie/23VDa3/V4owAkyWe6jHkphvL0NOD9cWlx2Novge6W6D0q9aSBwsG8JaLzbbtqjCCL5e1Tr4iDp/+CrDCVaWLa3i02Fjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH3PPF76AA2D882.namprd11.prod.outlook.com (2603:10b6:518:1::d30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Fri, 27 Feb
 2026 00:10:11 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 00:10:10 +0000
From: Randy.MacLeod@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gawk: upgrade from 5.3.2 -> 5.4.0
Date: Thu, 26 Feb 2026 19:09:58 -0500
Message-Id: <20260227000958.2000909-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH3PPF76AA2D882:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dda0484-5eb3-485d-24b9-08de7594924d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	wAMNzIjJsLz5PpA2EtvtMu0Mm/R0uiCjGG459b7506Q6ht5xWhZpH8wKs2oanwMumVhykOxuPZh3tJ96u6ki3oQcOwix9X2zZlj5k6kjRu8y2sqIBoi1WfptibbncJwBeZaqEm+ZW1jsR2nV7oY1KB+wSX57Buux8GqyqFqheBKiHMNA6GMghbs3rv0QoSGnXpF/AyOUJ0ITFKAojqxp1k0G/C5n7FSg7eo//nEGLNzQ/HEbZReEB4507Npo5zbIz4rE6SJM9JZmDwxO/DYxM3XWK3uv4skyPlJZvKM1qMLTK0hNrnAvigSZN5CJINWrL/p3QGuE+7prg6ivEQJ5VraRTXYw2oZZQHH6RB9HZ9v9pzfzvg7ZO6kuKus470RjIHun4aAYYqUtVTw7FQNVACNu7Z1VwRpXGbTKWjrvpKh2AhASWlbBWnQFPnGK8tu5AsUXm9V1NqR+5bcEm1dxZElNUBpGD/LSygLNKs/1dGUUXqQs0hgx/iahUWT2xcuz2XAy0JJid6vdpO5wl7Os+xKp8YjtObgY75JBMSl85mIb1Ay+DFFSa3sJbn8PjrkwuXJ00nhtqydKEAJspCT02mcr+b7xsNCM6XEToZaEDlNGg593ORt0S1eUY6PkVxPasdNvgrRnnNubCl1EWeHn8V+D5tpRa0ivw+xK+r86PmEPh4w9RqLw0DZxT1NAzlpqKcWGj1qrBARO5dMozjRmEykdevl/PthLrk+nTKSRwjkfx8dbXN2tTluLU28TBpX4E2jvwLaOvy14jYzS0K960mDk90asyC756PiAb0eFyvpGQhYyhtNV+SzRFnPzuZDH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N8SS322GMDaqOl81u/DLoO8hcPV3t+NCBljurov4gKx3bNk+Y5ceEWOFt/eU?=
 =?us-ascii?Q?LjFikabGHs2roxixVzkisypepesjBP1RrBgi2pZakJi+0Hxnx3xx5dzwZ+pz?=
 =?us-ascii?Q?8CE4y3gDxXQKgY+pVvqf99uQ7nnjaKUAA3uEcuOIgrQ1bo44vU3McZUxswKb?=
 =?us-ascii?Q?wpgnAI6BCnVepLXLLgdkB5vcMip47CFL1urM0EESBDk2I2YKQxj9KzSEDkPQ?=
 =?us-ascii?Q?60JYvUwF4JqhomkB9b/9KvziSY1t4QCJcMTJ91sCIGCJelS0BS2scC0mMz8N?=
 =?us-ascii?Q?oiG33DN3/Eo4Fy1pBqf96x8NFa5elnzPk/WpwxL6RnqnR7JCh5WW9jdQlH/X?=
 =?us-ascii?Q?zEy/H/a37+IKRIEavP575bl9PdgGc8EBdxSuJlgtGerqxGR0AdyMwZRiEYFv?=
 =?us-ascii?Q?u+ICmGrsx9h2/4jkOcnasY9phnVUI05k+fRI71xU5hljfrO7GHBJ5iPHYSyI?=
 =?us-ascii?Q?QNfyKCpceuKpWxugtS8SokAX8XAzAe/NIA3dyZwI8cjIZLQYKoVFopHvzgGy?=
 =?us-ascii?Q?eQH9+ywt3tIdiwGmeX4UZTY5Njh0KOtnBJOa9vXU1dITXjI0YgP93Y6PWr74?=
 =?us-ascii?Q?ZMdIdt4pWpZJJ7HaYvp/lApsJOwbDSDB6qmpsmiipyggb/3yfxQVjGL0MBbS?=
 =?us-ascii?Q?KXLgSEkuw+dPmDjoK+o6FGc4DVzua2tTCQ1iheGeQjsy3jjaKGELWdYWaUFF?=
 =?us-ascii?Q?C4aeeO7EA1LWHSIHTQ9TydL5kJe/LEpa5RrWnbuhz7m2H9nvL5wbsnD+TnNQ?=
 =?us-ascii?Q?wmChipgpz6a/zhjacJ2I80XH/s62Jd5Ie/yeTjEtDGjzl91/qii3ZHgGgKXU?=
 =?us-ascii?Q?4DfqkbR32zOg5vSzJvRn5v09T58rjYvPo1lR6NokobPFMdVFCG/6x+kQuHQy?=
 =?us-ascii?Q?o/vDEAj2M3Rt7AmjXwbjY/faWRFMTBsF0YDwcrAtt3f8f+0MxvfzxvwC2Mby?=
 =?us-ascii?Q?lGBKzEoVK18IrsQJv9H+yw4zEzXtDODKVXcQewe+vMKw+CINt598FWtnOs+n?=
 =?us-ascii?Q?AlQjeg6aUoel2n7AKIRVDYAJ3sJ+lYDNLOa4OdfrFpEB/MIesRnbfyuPqszI?=
 =?us-ascii?Q?bPsRZ+9mZW6DVYZMhKObHlpJFHk7Y05xFMSJUzhJEQpzVw1cZm1evaysXeB2?=
 =?us-ascii?Q?690EihGCSvvAF4qvgQ+kBMTgdtMRA2d6ZYSJ+UI24uRZ0n82CArgiYLsaT4T?=
 =?us-ascii?Q?c2da3NLgYtVJe2bnxBf04zzLf3u2vOy+1+pZnwl/xpFj2xOKUME5JSaJcR9P?=
 =?us-ascii?Q?DvzhG+C4qEEAP8Q06FClKHlk3uHfYGQ5ljSlTBZCZe3ABqzuOD1wGkghX7h5?=
 =?us-ascii?Q?y2VNeLoTKzmyoxW/TvsOtoKmkdkckPsOFAE2v2wCzrs2Mua1OOzOpDGHmh2y?=
 =?us-ascii?Q?5uavZzSD3qK3erygYyNN1xaLeE42M7QByoXSVZ0TcSbsKQakrsROA41wnMcC?=
 =?us-ascii?Q?9exRoCN96BCeVzqWzrfPLYWlJHekJbVskkU6DNJEsxUlO1RNUKLvIh5DOnMB?=
 =?us-ascii?Q?z7PrH5HuHFy0Bs+U2yKPF23ez+j0fR6vkR2esMQ0yP68cdG6OVQVC6L7Rzw3?=
 =?us-ascii?Q?8GcD7Q08fEUxOBremZhXbL2RrLBShQpca6JVgMBv4ymGqTbQHaUazEAzBgyH?=
 =?us-ascii?Q?ztFYzEIZ0g3aCqp41uACr3vV5XoNGsbepDN3OElqyKV1+GUkxcR0V5vKslVf?=
 =?us-ascii?Q?D/Gnodwi8mO213UbrUx4JCcnGj5iRkk410/XZ6awQuTsNMh50XN92YZGht4I?=
 =?us-ascii?Q?0Enxtm+CnQzN0ODqq4Z0Z9nNZBb+Quw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dda0484-5eb3-485d-24b9-08de7594924d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 00:10:10.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IRLV6h2PBkE5Yg/KOaYkKe4yNq+FvinHYm70O7jtQGFvepS7yoeUbp817IaYrixNnvPMeU/vn58NQsgDgv2+yVPobCt/RlpCw3IaCYfRTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF76AA2D882
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDIyMSBTYWx0ZWRfX2F6dhDxMYPYE
 eTSo0BczbdNmSdreTCDB/AcaNIpR1RXXClg3MFTTOQJ8TOKaOPTD/eonUnW4DXn9GVp//+vNpaL
 HPU+Jsx5Y9WS3K0WtpnZp9kezWILP4irGhGeL1bmRl8ZX8Zl1GEO1BWR8YwmGFZpNhk1e6gwW4L
 5nscew6+3MG+H0oEzBs+eY5ohcMCpzq9uqZsUrLIJB6cbZ0glif7xNA504ohZvodFqUDfftLnxb
 +9RZR9P+YnKPP/gX1FlWVVPHMVO/H1ronGDNgLbn8lVDpVSkpql5GQaBf/VjTpT3mY3eZrLadaI
 L4TGQBLhBfmnoaTbSK/PhN/EpDR0NNlYQxVQQ3RRGIUT6E/2j+FTOd5sm2oGhfl6QFCxvysBLMc
 8rjok6LIyW8aAJf3yRQMvL3kLt36fiSmG0yrVIoqSpHuZkx2Voa7NjykfhICHHWODuWzV9XKpgB
 QO1zCAlz4ZYuoTvCo/g==
X-Proofpoint-GUID: wKjx8xudLoIjfH4yRu62HNjjpI2FBEGs
X-Authority-Analysis: v=2.4 cv=UKzQ3Sfy c=1 sm=1 tr=0 ts=69a0e0e6 cx=c_pps
 a=Eo0YKKWWvGv/UpXdOuOi/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=IKb5KSiBKAE5zuUBvlsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wKjx8xudLoIjfH4yRu62HNjjpI2FBEGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_03,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260221
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 00:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232071

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Changes:
  https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00011.html

A notable change is:
   1. This release now uses Mike Haertel's MinRX regular expression matcher
      as the default regexp engine. The old regex and dfa engines are still
      available.
The former regex matcher is selectable at run-time by setting the environemnt
variable:
   GAWK_GNU_MATCHERS
More details are available here:
   https://cgit.git.savannah.gnu.org/cgit/gawk.git/tree/README_d/README.matchers?h=gawk-5.4-stable
Switch the tarball from .gz to .xz to reduce size by ~3MB.

No ptests errors for x86-64 for glibc/musl.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-extended/gawk/{gawk_5.3.2.bb => gawk_5.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_5.3.2.bb => gawk_5.4.0.bb} (96%)

diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
similarity index 96%
rename from meta/recipes-extended/gawk/gawk_5.3.2.bb
rename to meta/recipes-extended/gawk/gawk_5.4.0.bb
index 324f2c463a..d7211f28f3 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -25,12 +25,12 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 # Note that PMA works only for 64-bit targets and is automatically disabled at configure time otherwise.
 PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
 
-SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
            "
 
-SRC_URI[sha256sum] = "8639a1a88fb411a1be02663739d03e902a6d313b5c6fe024d0bfeb3341a19a11"
+SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.34.1


