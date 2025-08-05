Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A5CC87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 07:41:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16415.1754379683891107388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 00:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0312acd637=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5755o3N54028324
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Aug 2025 07:41:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4899n62duj-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 07:41:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aG57deLWPRnnnEIMMKl/1cRTzLoq00kr29+1jmPRUdymswt8jlFwA5UQpvQLURO1O7QHlpZPfKZvSh2xFYJbvgRt/XC0PCZWn7ESxDiDMiC8QyR3hcntbRQt88/nCsbrrQ66ExcV5sBR8gn/ERwDOT7Q+WB9gSklHbhBh6ZzUIGoLA6l3ifEhMHiWWzjMqFuvwT/HZpFV+/aWy8P1c7w0UwFFsuZsjmA44kOuoVQBy60mBhc4OL54HE+gWxAtpMchh91zq2kK+rNLxNw90QCYgfuatUDIYucxanDFJNapDR1eHJuSZMFv8emywhx6hJHBzil5aho1Xt/YuJDVEKBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAF61DaIFh1wurQrVsXKidBs+H9nwkSq+riWNxo/+0E=;
 b=BZQ/INk1TXH7h8bO5KX4jxvS73qAeSJw/Y2Yyqki/aByWn8ENpFhkf0Wihumhr1Kbu8PVN2g44spTsZIyVnKCdTQd1eA4D5T9AHmuvYzQ4PbSUc6IikOSfqMUDSYXR8zbbS5QPqrGmkQIBSudfGB+rKgVMIBvSQgmCdbAiwTqwohRKMa++nV9uUSJg8EWjowWLdEeiwLT+x7QnI640gSFDXAFiNgYyQENGBIhDnPSAjgHW/OsR6tPSEYbjl9ssD2xdjODqI2X7xKIDb8RQfrKgJl2YFx37azSDqqI6YYt13A+xKnXNYBi111VP+uyx56HBH3yxD5n0rov0cNHnLbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Tue, 5 Aug 2025 07:41:18 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 07:41:18 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gnu-efi: upgrade 4.0.1 -> 4.0.2
Date: Tue,  5 Aug 2025 15:41:16 +0800
Message-Id: <20250805074117.515426-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: ea008178-1feb-4b58-6a24-08ddd3f376fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rP9MelYWTEpzBSrGR4QeCkoFUL7jTGoAUwETk7tBQ3QKUPzMeF0KVfZ3zDKY?=
 =?us-ascii?Q?qqYHH01PrqS6XGiD5PjcAon6JfhyqjRFAhHUwnh9NiD+TA/07y+LvQD/yiSz?=
 =?us-ascii?Q?JIeXp2Ez8eNeonnoJR4ooY/eIz3+s+USVw6KIlHnZWJVgWWXm4G9aR8E15jJ?=
 =?us-ascii?Q?Wg7UbjBslrNQc3o6FYDPk/+5e1zyyU2BYQakZsQy0bBfTm7l154OVJmPbUxC?=
 =?us-ascii?Q?67RRYsqZZu8Z7FvkR+yAIGfZviwO08AFxYCtP5WDHCnihOrlRm4O2o6gx62X?=
 =?us-ascii?Q?FzaYysR0xo92MIiSEoBAg2uuKk0neX7j1DY98Md5a9vPT0st/TtK8TBPl5yn?=
 =?us-ascii?Q?KbJMxkjLPINs11uSPcwts44TcBJikOw4PQk6ff3jTE+FzuspcXWgfmUQmjBS?=
 =?us-ascii?Q?mAINkRbk/DtFL8DiT9A+4aj0H91lSrdDK0XECdZQaPDKPXRTjHaoO1Q0Tcyp?=
 =?us-ascii?Q?d0QKPXzNl/wCJteH1jIdFnQ5VY1oEUAFReiGJij3u/9IiqrjKlWzNRSmk8oL?=
 =?us-ascii?Q?u3HNrwni+NzlwDaeocjFcVKD1wnG0Q8PUKy6iEO2isfal+K8OCYwuEHhGZQk?=
 =?us-ascii?Q?wee5QqwHTMaGVXw2PS9BErZsQKSHLrUu/+cEqxJcRXEQ86jT7jyyluU/hvJQ?=
 =?us-ascii?Q?VAnizdGMpcJl7uTyS7JvQYh9KX7+dVBn98P7UibBthJ86cRFHHhY/+5Szfl9?=
 =?us-ascii?Q?4I2Iv4zoYzTfjVuhYd/+Qt21YNEcYP0FjpPPr7ek6tO0Se9KeOWKDoU41WPe?=
 =?us-ascii?Q?mVGHSoM+svbiQmDtx6l7z4BYxAYHd0x9yy4BUurXyvboa3+llXWqTrolBtYO?=
 =?us-ascii?Q?xPT44NJsUHOLe6xwIEVtZUm8ZpjJVzf+zOEj5//ajhGNwJ/fgmFfsmYJtOv9?=
 =?us-ascii?Q?jl8+VvmMSVra9yrPXBaFr/5vLu++1axCP+Kvm/vXgtsgCojxT1HKld1X5u0n?=
 =?us-ascii?Q?9zi8uzlzzUZTWOIdft3kXfgjKmy+Ss14CxIKazjxKsNQPafth2esJUZ/rWVJ?=
 =?us-ascii?Q?1zn9yhwWqLpwL4vrZMpNunc0NHg/0JuuRbM98C0Qh6aWTt0W0Oh2dGmZpt6D?=
 =?us-ascii?Q?CbwAcUuTt5ObQgHZ2PNY1K5DD2WFN/rzpNzpdwnphhdoOhD3qmwgDlZThC0Z?=
 =?us-ascii?Q?zrBc6DPL985T8feQZdcWvWND39hPDUHVbosHUQ4q7iEApLXvAy3QykwcFWpJ?=
 =?us-ascii?Q?q0amy65ym6rvqU91+hdM6cqKJwpUODfpZFkm4N8VtqKDYIrJIhJt7I/cUdRv?=
 =?us-ascii?Q?TGFzQFbyqgE+TZVi3WuytRswGenlO0cLiqqpgSgY+oftLv3Z905XgBASDQyO?=
 =?us-ascii?Q?9WK9inp8CnlqzTOXO8H3tD/UivVeIkexMuW5OSYxBI4P5HbOwFXT+h1A44KC?=
 =?us-ascii?Q?K8MitJm7LVLV5ujVGL9MEXmdp+rYEuK/nFV5J2T0qr1Rb9Rzg8ImFutk0ATG?=
 =?us-ascii?Q?HMhHTkr95yDf8Kzf8QsIfC3NjfMz+12BqeOjJAT/4fAMluH/6lGm8adJNOMT?=
 =?us-ascii?Q?xJWtvit2hrxgvfc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lx+R8LudMamKQ+z9HGc9WHQtm0g8S+RaEI4xSGl0Lf//pzm+YWKDBYDAJhOF?=
 =?us-ascii?Q?ptZC5T2JbSEXbh273iD2/TUaXhI33s8S1WCTRsselVkoNfMX9gqiIbNPBZPL?=
 =?us-ascii?Q?0G3yfIUMNk+2TJv1oy0TnOMcDohXMQ4bZRVnTm/n4CRBCbui78yjAxV7fpji?=
 =?us-ascii?Q?QaIOux0BWVFQ5M47gk/gblXUWp92Mh6w26cJfekE1MyT2ubu+Gba0loEHEFp?=
 =?us-ascii?Q?JbcF+3P+Czc+KvLyxv7xzkNlOEMvgLmqPRN57NhRv2kbAkRqVZN6Ta4gDPAd?=
 =?us-ascii?Q?u5/tNwLTOesYltJJ55LVxg8Gt2Heo3b4PPjKw+Hw31Y4Pnu4QHvqkIfyXvUX?=
 =?us-ascii?Q?r1HumMc4D8SlfSeGusZXu8xcReUmzsRlaVoHajN44iRtNcs6Tkqb/GVIV2QN?=
 =?us-ascii?Q?FofRie1+Niup4BRziirRYORAzvqTNxWPKBZoq0XHf99oNejpyYrAYD6md+fc?=
 =?us-ascii?Q?cQRt5p+VLHKVuTA9DljZHKaHWh1OUw/QTR2dNf5Et+2WuWzV/OxrtzV9dXHI?=
 =?us-ascii?Q?e/LquHcjEqGOTfBrODJAVU4+Ns94zVfikH7MwLnVGQRMglMyRwLakQ663TGF?=
 =?us-ascii?Q?FHgn/TIg+VcSSJtGaWDDJcx5TaAVNE4aVXz9Bz4/RdUa2zzbXxz/39WJBoRt?=
 =?us-ascii?Q?PXNnP1DiwGTYLQGgppfRvoS5flOdbtNG7v2PzWAFNUo8R55OGF4X1VDDaQ7R?=
 =?us-ascii?Q?2ZnFmQJEzFzfDsG7veej+FJSNYiE4F2VzYfO/FE63+25qYyhhnESCeYMFeOb?=
 =?us-ascii?Q?UpLOgjDVU14bVQ8ymnjq0GKhwRKY9rUTG0uRMlzcTmT0eEa5j1c/zqzw7qIJ?=
 =?us-ascii?Q?UyAk29lX5NB97w3LRp4Y/lHwM6JYb2KTsj5tBOt2ilmZYh+CxqAepFKByHec?=
 =?us-ascii?Q?um2Q/HjrSN6/VZR1lbmqsGB1Yv1K6MF4yZ1oqRt86J/nRDSghTqWD/GJ8jbH?=
 =?us-ascii?Q?PUOh5ilML/z5hMHj9M8LDjgjag9kPtiaYaxZJk+XCbsk+rOCKj5KiaG/g6Yy?=
 =?us-ascii?Q?HVTf4DV4jSKRLJe5g8UGBtFFS33vT9vA1wIIcuTgSkE5dgd6XvkyVN2Sbzko?=
 =?us-ascii?Q?Kld+sCZdjIfUdzVPlaaSEbSlgJIqXiGrVaTN5m36lUse9k8FGxpQF2TFseB/?=
 =?us-ascii?Q?quH02hVRdSYqO9C3ofSj6jMEbHfolQ9q4jWK69HcH2PYCGwS/D9PKxcJ36bT?=
 =?us-ascii?Q?s+n/I8NeBcl2/LVfSXumy/DPRH9STBUq9ZupL/EaJvZNnaeQU5XjhyAnV0U1?=
 =?us-ascii?Q?KBLxwFost2ljVXtApixL8P4YVUiXsnlbtbcLMqlQgzSXSjP/LsReeoJGdapO?=
 =?us-ascii?Q?NN6bys0EljxV9BOaOlDWvdOKw3ihzZIFccFma3LTtsDog37NDJxfZOT1d6rX?=
 =?us-ascii?Q?TdfDZGRXhXpbC2UwQy+g2gq7cxy4atIJnxlAOX64T567h/BGsCemuCZbKZxJ?=
 =?us-ascii?Q?LHbFiMd8nNLlfT4zQjim4m+jOa5jjz0Yda/9cdv0SrNPTZyb4gt/x6casqDt?=
 =?us-ascii?Q?t9AivDGw3HPOFQe84ZLD2VOYUaSRsqZ0/6AsN8ueHvTTIevr1q7jwmoXdKgt?=
 =?us-ascii?Q?/f5lmJ+lQy1mpfbw0EjbvM/3Hp9ShufM5SzEvsVl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea008178-1feb-4b58-6a24-08ddd3f376fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 07:41:18.5104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+ShQWViWT5/3FVTdcZW8GC0oU/wODLZdeWTrH+aEizdKqsnQXzLPFcdthTgBwXrIjE/OyY/gopPxBxAb24v5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
X-Authority-Analysis: v=2.4 cv=EP0G00ZC c=1 sm=1 tr=0 ts=6891b5a2 cx=c_pps
 a=ZMlgkNkj7zZq27zQSNy95g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=Y6DFh-uHDAmcfAJWfI0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sCIq6dfw9ENNviZ4j-3LaYOmafn4NryP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA1NCBTYWx0ZWRfX4x+bKifoWd5r
 ivO5Q0BtYa+CYbFl+pkYO7+Sk3hAbBYaypaqOjTYdvhhm5UOJtY5awSA17WFIgjppEhSrSK4Or1
 50tawfDQoNXGny/cPGGSeAU7wrXXzMCoyi5CSfKYSkinc2IMl6Q3Zf44Das5P61wTYXWaBqRMST
 8TxUbh+iwUQSWa4HNhd/Gm6e2Lrb5fXBQg8tFA3EDEboEICePazerNfxD5JJWX0HSZkfCSrldit
 mStkAzZWB1aK7vf5n8GoYdmdYglG71A0avl2LDOZ6fTpD18ig1vC6BxSc+OTiCqnhEV2Fis6kcU
 kGBOTdekdOgpY0L8vufK82VcBRO/YVj28ZpZdsAE768LJoHCc6CAEUlLGpgOHl0Ji5RAoJEn61O
 O3hBosHO
X-Proofpoint-GUID: sCIq6dfw9ENNviZ4j-3LaYOmafn4NryP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 07:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221461

ChangeLog:
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.2
* Fix syslinux issue + user CFLAGS/LDFLAGS
* Shim 16 updates + IsZeroGuid

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-Do-not-treat-warnings-as-errors.patch      | 13 ++++++++-----
 .../gnu-efi/{gnu-efi_4.0.1.bb => gnu-efi_4.0.2.bb}  |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_4.0.1.bb => gnu-efi_4.0.2.bb} (98%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch
index 0c10e66a12..2909420933 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Do-not-treat-warnings-as-errors.patch
@@ -1,4 +1,4 @@
-From 80e17bcdf45dcf40b8f356cf68389612407b9f7b Mon Sep 17 00:00:00 2001
+From 2f70be61679933805e1d2fef4fefcaf041cbd8db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 May 2024 21:38:32 +0800
 Subject: [PATCH] Do not treat warnings as errors
@@ -15,15 +15,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Make.defaults b/Make.defaults
-index 6d3cf51..23b9383 100755
+index 777a638..bf98939 100755
 --- a/Make.defaults
 +++ b/Make.defaults
-@@ -267,7 +267,7 @@ CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
+@@ -275,7 +275,7 @@ EFI_CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
             -fno-strict-aliasing \
             -ffreestanding -fno-stack-protector
  else
--CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
-+CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra \
+-EFI_CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra -Werror \
++EFI_CFLAGS  += $(ARCH3264) -g -O2 -Wall -Wextra \
             -fno-strict-aliasing \
             -ffreestanding -fno-stack-protector \
             $(if $(findstring 0,$(USING_CLANG)),-fno-merge-all-constants,)
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.2.bb
similarity index 98%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_4.0.2.bb
index 10a4ab6800..5ce5ceb884 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.1.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_4.0.2.bb
@@ -18,7 +18,7 @@ COMPATIBLE_HOST:armv4 = 'null'
 SRC_URI = "git://github.com/ncroxon/gnu-efi;protocol=https;branch=master \
            file://0001-Do-not-treat-warnings-as-errors.patch \
            "
-SRCREV = "00cdfa66e923ab2f6683bb52cab0d0d1a9083b16"
+SRCREV = "1fee8ab566ce91b9cbab9f2c85db96566d79063b"
 
 # llvm-objcopy fails
 # arm-poky-linux-gnueabi-llvm-objcopy: error: 't8.so': section '.dynstr' cannot be removed because it is referenced by the section '.dynamic'
-- 
2.34.1


