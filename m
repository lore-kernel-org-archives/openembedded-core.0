Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8308C5DF6A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 23:49:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8365.1786578565724311282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 16:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CcQR0yP9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNgGpU3893031
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 16:49:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4ntQPVOd48AJ5abFxC2AGkFC59Olg5pau4BaGvPLcKk=; b=
	CcQR0yP9VSg0SL7GcikZa9/k3Rgf/h8tJPFc4qZKxxxkzOFL1U9xQ0jOnKXTw3a6
	ZNG4xCM8g0DJIeW41rb/RGjdThuKDDG0qSJJltDpjblDw8neJ16U2nDTYg++YrQO
	MD9E2v/XzxiEeBR6l8yNBU7VYhGH/wB3xMguW5gE4EZ7TN53LxD8Y80WW5n+Jqoo
	iSWIVIa/zXBp/XziBhayfQGa/Smb9uL2g75tKVBXJ9mE3KWuAJ5WGQOp9SE2Xexm
	RuErF5f0PL3Oq8/1grEvFdiKc1fF5G8PuqFrWIqRlyU1rGhNeom5BgI2HFhQO16A
	3aOwpBYVUfpfLHSyKg5UzQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021142.outbound.protection.outlook.com [52.101.57.142])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysggc4e4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 16:49:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCsBz4XEGUEvxiWnmLxEPtyY1r2XfhuxZypzoiS+M8HfomyplmSuOkeSZdjYp0GgESLDdE+PWTkfbMAG8thHyiwpG1ovwcylMEyEDFqxj35S4i3B47xPxsH/V/BZBGqFW+faTNHcC4fSjZRHWyJ2HVVcdQHMFnKLdYr0yGom39qUIKhCNVi4H0k76tMGRh6KJz442vUOCCfU+JJTMKPyYRRdmfIaKV6IM52/FJLtmJQboSzYmP3l5u05FVdyykGw17CAcDNO5rElzc208FBB3RCNxUYyfKUSsLUBi/13qnnKPt8oLqb5OEYzfXaX9a2S5KLXMA91k2P2Ee4tunwpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ntQPVOd48AJ5abFxC2AGkFC59Olg5pau4BaGvPLcKk=;
 b=fG65tNt5c1xfirSXNmddDybvcoyUZnksZaBhIWl+DQcbvPjn+awF0RsEj+6b+nxPy4OEEuMX+6oqH3qkHwnF6euwjcjWF6V8rT1/rw8JSJUMph+HxkjbphSQoRcP1Krx7fFKD/KJ+IJqdNN12wWfZOhdC3+KxWyTFaZ3ThGjyF1yBGZ2qOVanI5tWTVVXTgwNlG/e/1HQ1h3WHeQxSypBaUrv0jsxJMIMGnfGkzpREwKPsYTj4792wxm7VCgfVHt54aj9kq2qwkVWYnZZuQ5jtSa6QtkrVgx508l38168ExLZBgfm597enY5jAaONZhM6/csdYE7hl36x+CC8r0YvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 23:49:22 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 23:49:22 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v14 04/10] lib/oe/package.py: Don't redirect stderr
Date: Wed, 12 Aug 2026 16:48:54 -0700
Message-ID: <20260812234900.866436-5-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260812234900.866436-1-sumanth.gavini@windriver.com>
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b0df74-ebfe-41f6-0859-08def8cc5523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|56012099006|11063799006|3023799007|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	/s7u9UULEbg5rWKmzXeQrD20UmLGRvmNjL8TaF7njsRvk8Te2yUtWOhoQSFIWODgGWhdyMsHJ5AXSUZ3MwvWYX8H7CihOyGr2taDo3G8JAS1hKTNQyrIhPA2k8vnJm1fYda9EUq23o6Iya31XiPd48XuZ4Yy13Z04QXILdpuJw7zIeQjkQNoQOwuLYb36Wthf9LU8EUtfppyQyOSaENz3ujY1qlNdUosyCI43MVoRGUH/Z8tHvsDKdscIeOI5rOjFRBbrW86uQCRuxrGqI2x13cYBssB/pxArASfrOFtLsDn41kBFL3ai/3uR0RZEL2gyRmW30rykPb74e9HStEIQGm/DtUgKF+LyQ425bQh8W0/p5ujtCQDfeRzGh/eFOjA8xDu3zZmGtkKH5tKAL4m5mrw6IMMPXlbi9dvuU98YbY0ZAEL68q9Es8CNfniTOmWI2tsFDyJy4XV/ysqTb3bm5JqBlc+e+NHHnTYLUXUa0bWF4tijYRbQdFEQJ65OJECyP5shHrs/Fmk9yGIGAEVh2qceIqJ4xY0vjoz0L+ObdoBOpesutv5vHo3Ouh/N8aNwKsZEXyFNHKGeD8YmbXnblYLJqAahBQSq3xRmqo3I7PP0EXaKRkdCCWfSRG+5z4cTCRfxKA5wzNr5yE2EC/rCQ15GHM0SgU3vKtkQ4KhiQKP1IsHiefVVE8ks1pHBu1Ba/hqy97kAW25jNX9AKIS/vYDs165Rhr7giY3553TiB4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UkgLgRggJzReZjCNe8ZN4Bf3XhCFD328X44Sb6yqPTMQrDTCUdpzGGWlBlLi?=
 =?us-ascii?Q?8sFI/aTaEpDxLj2hHi4aODdEaAi8tMsHIO70FqpMGZV9GaWDavPZuBvQS3pX?=
 =?us-ascii?Q?YPM+Aggy/1UVnmqwBF6rCDyIKzk5EyVhf7pJ41JF1Uc54YgO1mwoVo2i6tzc?=
 =?us-ascii?Q?VFKbOn0bL3I5CS47heBvp7hF5FzYujjWp+1GXU/fkhvc6Yt/l580jUTWx+Wm?=
 =?us-ascii?Q?TDoP1oaUcZZZPN+LR2dL/9a/Ik9hFaufcxQoDDpyBK5ge8k7x4zzfzaHhZpa?=
 =?us-ascii?Q?XHcr91k0/bHdhMTxUBhIg1Q1DsSAs3tu3Po2pqIniZ3BieKiPh4+0D3A2UcP?=
 =?us-ascii?Q?zXq9IX9NPLZGK64wXDdE4vH/Tu2b6V2DhUtzcDybHInMSpmcl9zdyPjWRDau?=
 =?us-ascii?Q?RvQ9y8/RW4BuKBcvFE4uV3evvvBmBOmQb8GJuUQrxrCw6crjzwzPNd0tSiLu?=
 =?us-ascii?Q?uootWS3tlNQmKvZs+LoORUUiJ7vDA51LyDfLJtu2C+eqZTMHiTYZWnu2oStF?=
 =?us-ascii?Q?88zQogOmrvoGPc7Xf+DRL0XztSGEiQNjHhr+E5l5E+YmjBfSMFCHQGiWW627?=
 =?us-ascii?Q?Dz21r25W0ZUK7yscA8/zpB5VseKmEZL1grlAcFP7AyNgJofmsMtupVjjcmnH?=
 =?us-ascii?Q?rDYR1bGIHQglsaqIVU9V3hTBbqBp3JLkA+3o7eEjl38AkSmDvkjub4XKHrSE?=
 =?us-ascii?Q?YN8+19OR2eXxyAjR6EHQOWILaqsA288THzNQLH8rpUWJQWmCI8MdU3NJ6buv?=
 =?us-ascii?Q?JItb5kBPjGqVbWPVnOgy6l2XuwoW6b94goGm3IKaO1nXk/ns9CdPsAxKzuNw?=
 =?us-ascii?Q?XidNXWOt7d+p0mIC/LC54kD9+uvRjcl0Xc5LDcGL2/xfNrsVDiFMGJiT4yC1?=
 =?us-ascii?Q?npWgoQQOfRI1z4fT87xcHwcVMNQ6Aa+TYSy+POJOqhA8c6repHXlHU7voacO?=
 =?us-ascii?Q?tCe9DwtAsqP6PywBODgpJXw61PbqRUvZCWW1lJvuuNkJnvCaV2Lr2lCQHtQo?=
 =?us-ascii?Q?xNaLrGO0k0M7L3kYAkok9aMw8G/w/hoxGU/sdbtkih77ooP/uJi6/qH32zEI?=
 =?us-ascii?Q?fFHUI/D0fOjJZuGzSMK/9CyUitX/n4G54qcCKhIovAFF/g4kNvzFnbX/mnhY?=
 =?us-ascii?Q?YOT5MHOQJxHlvKFZV+Bcmh7xIUM2RyLiADhu26zo1EvYfWpKtcAf3P5gGwXR?=
 =?us-ascii?Q?pT8hsnEo5pJN/YEQI7PoYXmFbeXfIWVqYdeauePBJ19VOvyzDrztcTSmfGsb?=
 =?us-ascii?Q?4RxihUWoUxkKBC2MQuTGcxGFA3iYsSnNZByobT94o5rOTA+y4Jy+szRgnsNQ?=
 =?us-ascii?Q?MWYwvm+J2w7hza5jBy7b6U9GmMH7XM1hCGYaQ/CdaM1V7C2XWspCIfXJrJ8i?=
 =?us-ascii?Q?MGIrMEkJlUrs/xZ1kANq671bK0RUUBseCOjS35NWInHsy7MNIGu8ZP5LxGlb?=
 =?us-ascii?Q?4y7oHAb7GmiHgobWO8F8zwLUrRlH7tczBbIoXfftTE2Ir069gheLjq/cX56H?=
 =?us-ascii?Q?KVTvTo/1/MCRVQ1hSJM25UAaJut758UmxlLeviOqMLqlXpF9MMGH/cGbVDjX?=
 =?us-ascii?Q?aK7VBJrkZ/xxbI9JSlVtRiRaS1l7TDxcuuQ8nS5la8yaGNmbKzk9LS1OYDE0?=
 =?us-ascii?Q?ZdD00ZPRYzTzWElDn/UDYBammIzRWvUTdgcMNeGEKV0pFAurseoPW01VwbTi?=
 =?us-ascii?Q?z01uw2JofasSKGaBoU8bv5kjZw9xEWSXYwbEp2WzOa18+k9kiIAcudpsFb7Z?=
 =?us-ascii?Q?T3uOjOL3XyZd+RQc63HqwsxXVZvM4Yc=3D?=
X-Exchange-RoutingPolicyChecked: 
	LO66a60z0tX/36ImrqzmN0qOkdmruHhxtSMPQgS7pWZ9t/jiQw3iNVuUSEAJaboVKBq19OwFZ5C29yfluC56F7ScFtKe9brA6sdmkmuS0XpCdPoneKKJ18zbsvqPs/laiiOB4lhGMtE9mSzmYhTThBEOx3CtM7EaLs7GvEkwC6X8JaVpo7vHynQ8lkZoM5ttlbC1np0o2Tpu9x6QyNdgXv+eeoWZXCvUu/4WRXh8EscLqIXkmle6dSI3wdpmEGx/6jSqRY62x+K37gqE2/ljPad7JSHRMo6akDnJDMikBSuYCbA3B6v3OQS/hYKU15PECOe72eI0tENPAyxigXiptQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b0df74-ebfe-41f6-0859-08def8cc5523
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:49:22.0701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ya5QirEULo7FvstBdmfTPmZQbJBT+ZfG/MhN+PwBQxUCDF9u7o6YpoBZxjwWoVvbuubjy34HSxLggv2PRdcrxqzH8jjUJstjoxRgVAh8Ekk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 0swdGktp0NoMOmg1qs-2ctmZX1S_ARZ2
X-Authority-Analysis: v=2.4 cv=fr3sol4f c=1 sm=1 tr=0 ts=6a7d0684 cx=c_pps
 a=a1KkbayPxhvfYlTdgkZZag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=gZyeYKPtWqWysoXHKEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfXzYddgIbL2VAm
 W8WSBpsRuLqDalV/xkngEhVLm9FizbqEq04nFyxdwfMRP2wNrRp04VyLpGu9yH5MTYP1WkI38lh
 02CYo0PmrSCw9/mBQFtlEwnzH7Wp0P+duE2eUNCdxrhkKWuBd4yaHABTEINzMpXspWRc9kEYZ7l
 S6V6wg5Nopoy/ScfXosDdT7rQln4xK7rgY+AddckkHuRDUUPiQ6u3vlaErGhr1AoKEV1w3629sH
 QSb6oo/kkEkok+kE1sqfXMDOG2hxxTLuUNGQAUmJk6/Lxcps1VQUhYcsL21Pf+ZrxWUob/DGy2v
 MIUYPA51/0aVLp+GPQOZAM2YEOV3qcjsrtdIxPcc30amVkw2rUp2S1foFoINR3R2Q4JS2hAy1T7
 NByU8Qust59qqmX8oMr8FRkPAhKHbvZb0lWI8lNQQ6WIKU2E+bLxZrJZ4PXssGifgaDCtL509Wb
 LjHcxk4PX7T8hse5atA==
X-Proofpoint-ORIG-GUID: bY-6E9NT31TDIifs8_8CeYjsjKFvrqIC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfXyD9xpaCReAgx
 RZmtqRukryJvMxY9122io1sYUiUNQNFxY1r/xcebXU5EwJ5xlci8rb2hCyfossdvOkX63gHtjWd
 5XAVbmmn9l6S9dGQEj85EMK6QQB7ASGYzWeCrIiIchggU37EdDpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243313

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8ccd89a190..d8862ae92d 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -277,7 +277,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)

