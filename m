Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF83EC021AA
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:00:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5006.1739426422914450756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4139e44f67=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D5OBt0022595
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:00:22 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6jkp8-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:00:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMooAa9WzCbZkqx3Dfl80WiBSdMebYBTCNM1cBAPDRcU2J4uueQLIQ3rnqLdT1Fe+T8g7D7qG+/ZCDFMiLwogK4bA3+sLT5cKYMdC/m04mA240GQWml6ac6MqVq540T8R6hCpRQMvYJ34kzmPUxD19Nfs+ku1nqE3tWzdhJecxNYbAPrmezjv2iC5URYat/aqFEE708vtb2m/94r4lDsaqAZ5rJrOoSwqLAma5u/TrZ1aqF8aZS71BrqkYQCfim3YUN27qTyuTDssQSrZdmi9tqY31WhVX0xKsDPeKhQn5eIXGWppKMRacN41XFIDR6ERemQXeLb36nO2fbdwFng7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiGLaGUNShGUufsFiLq47OpQcRbb4UOXj0XxFZuYt1o=;
 b=D7bQxFtj5P2dmx8VkSPfwiVXEr6iQfGI/b4o+vLra5RMhJ06NDGbWxukI2QTw2r1vsCtbZGNpTqBELfST+SHAkApjL7SZ+runq7ndnTVv4gnnqJ/Cj/Vl60U40ALcQ6DuKAW5AFNc7+mmLQdFwDX1913hxmu8pKRxClaTvyo9PVCgjQTmhfefYS3gNdB+m1Hsb24ZhYacfpK0mCYTX0JT4OH2MyD9AkAvPXQ45dRSFPXkTBOMQ5ZdTue4JJ1/BezjbVbiupe7y+zMxM5mt2HR4b2t3w3auCy/ofZsAGFnLh0WnO9KjsON82jHpkkGVPesbAxpmhGqS8NcKnFCxx4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Thu, 13 Feb
 2025 06:00:14 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 06:00:14 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/5] util-linux/util-linux-libuuid: upgrade from 2.40.2 to 2.40.4
Date: Wed, 12 Feb 2025 22:00:00 -0800
Message-Id: <20250213060000.1092285-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213060000.1092285-1-Qi.Chen@windriver.com>
References: <20250213060000.1092285-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bd42e9-0ee8-40f6-5252-08dd4bf3ae61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bbNAec7YihDyR9uDsBvLrxhUn1sTDXX+GQ/KN1Gu1Gce/Fx/cqXJ7CAx/2k+?=
 =?us-ascii?Q?WyU01dMPbBz686j57fHmCbSdljrhRlU+jD5VuVsfPnAMwL2avD8IVA6OaHnj?=
 =?us-ascii?Q?O5SWpi4/JiOycWkjvZgZe9m0jOjeuwTSBE0zu9AGQbMCeEWs1JXXJQlGxfGJ?=
 =?us-ascii?Q?bkfddYl8sPgku6rEBKiAG9zfKc4ZZWE8cb40edrA7FDu9KEro5IXMLlSnkat?=
 =?us-ascii?Q?lSBi+Ys33G1AW8I+LzjU7NOgaLC4uGMgSc/S6UCoRbMNDa18OmLUshCxUM1X?=
 =?us-ascii?Q?q7EQE5o/Y8pha+PGLMlTpfCrQSckEigTp/9/6wWGKPkVL2Eg7dXbXxHplZTU?=
 =?us-ascii?Q?VRkFfbqsyGYjOC2m/nQmPmDNTDbZ6rsUoqGNQZE5s4yIoarDHT2A2jPX8BI0?=
 =?us-ascii?Q?Mz+wJW+8eKKeUn/R63LCinBLwS7zPKtPneE1jCkDzw0Kd3JqEXgRfMqv9wfW?=
 =?us-ascii?Q?4LrWqxBokXnePgw6xe7nFQXkeF8AAhj1mwJK7Us+4Wh9a0aT6zQxJNF2Nxcp?=
 =?us-ascii?Q?d3Kp5zzg722z2rdrwBxT9dm1xgl+1ZuS+WYrQfU0WthDY2eeccNc1AVJkbqh?=
 =?us-ascii?Q?JN7PWoUwp4n07+Cjmk/DjgfBl54qAApHIJjidtAyIAll4tow/WNQ//B8te8F?=
 =?us-ascii?Q?Y/Qotkdein6/WkQ+zB/W1/BZeFLZoD0cjlcIKQ4kS02ik+17nXrUTjMs5vs+?=
 =?us-ascii?Q?ubS/RQKY33HKfmNRj35dfhneA5/e7L6qqiEvKnMMonZ3myENbz1MJDVk+Bpn?=
 =?us-ascii?Q?iMgnUpHy2um2O8MIAyaUhZ8EVPewsPmBZvWjp08iRMuAWj0SZjlz8nB6+ejX?=
 =?us-ascii?Q?eNW0wCelQ6xefHjwjbR6/RQCHno7e0x7L3RLqyBNZiTQrOl2XQQ2iThwrsw8?=
 =?us-ascii?Q?Cw/48QU/uoWQybAGFAvzrdMCLoABoiPMyyy3OImZL4DffVOyOEhjRmRHBE40?=
 =?us-ascii?Q?sNW77dJwc+ByGMI/RnMnnlchf5wR7rKECO/XHl8Z6wlgSi0LBexGoRoBiAjN?=
 =?us-ascii?Q?EGp2jqIARZA2SMfnn9RLhjeVVQUSokdrJ8mt9AGRpmjjmXpAXdZ0b4zSCWfR?=
 =?us-ascii?Q?KCSffXHmQcF0nCV98uk3xEV0hvQer27xVIl3eu+NFhkWEU3ggJ0irdVA3hEv?=
 =?us-ascii?Q?kP4D857FjaJOzXwrV2LbqPNj8HCCTxATSR/IR7XrZjnrOY6IrEi4vtEh4sgP?=
 =?us-ascii?Q?M7+ZjRXCRMbO1ft3+yQLe/+NsW3s3zXxkjUDQCGz9teRZcibuYKlSQmhskB8?=
 =?us-ascii?Q?SmmwIY89gp0DgMFkTYJchlU2702GpcZOs9ozlSSfytxpiwi3Sb4rhlU5nxbc?=
 =?us-ascii?Q?mDUpQd3uug4THgzExn3dS9PnOSViUqBpumyP2u4k7LBisxc2xHSvwFpAGCSe?=
 =?us-ascii?Q?btx4PzTnk2LQy3LcV36jEvIObOzZ08zvjL6TS7WjMJu3w+WKIwppDsRIMsQX?=
 =?us-ascii?Q?iYGZmCn1L7MNAX3JoDFILpMsrdAx5nnV3DxPZfQrxVfAHuGkh0hilQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kaKBkLArHsbtaH0iybaK5TG1WMpLlluNxCE7rQRejXe5WDuk3i4inXNe1TPL?=
 =?us-ascii?Q?kq45HeYDZJh9QdBH+uCK2ObnHXgHopGBoxpf7YzoYn+OIQUOvZPZc8Ql4oQo?=
 =?us-ascii?Q?Tyw2V2mIsTu0QWDIF8QkiKZInTIRxWIgH8iu/l41u2MS5M0fmI+Do7TfWwEJ?=
 =?us-ascii?Q?dhdZCaUEIA7w99N8UwCSoKWsOgDV58XC0WP5hYs53t6zrG6P15wfIdg3jypG?=
 =?us-ascii?Q?hBEf3BIZa/28MzvF6uIG4gI5K/v5Lto5On36FLl3Fgatr7JfpugGpn2h1FFN?=
 =?us-ascii?Q?JO63pUjrd8t2vsbenCYrbbtcIir20UypiRGrafocRPFUfa4F5ZL5yr3XnRpM?=
 =?us-ascii?Q?JO56/vmiJkPlpDrklkypIZCFr2/e4AGCiyOM6olpAu185zDXP/2/Xml3bQ0D?=
 =?us-ascii?Q?2/BALa/WCAHkoGSAOoQeyJBVdM115j1GAFKtT6FLlRw8EIC4vak5gxJcRIpl?=
 =?us-ascii?Q?OXm0ZPHtkRrrup+u8+poooTVzn0RWKDP/L1GrDtwbAqdY1OpZ/n5FjpqT/bx?=
 =?us-ascii?Q?f3oYhrZts1Vug7iDiJdyKFEpLCCFalZlDeVXoQFjdYaAUQACbFWgGAHF9eei?=
 =?us-ascii?Q?Qt6ZP2JILn3K8FLqoizc/faW6RwcVPqdlk9Ax7qo/W/+4S3MEfWl6gmRGn1T?=
 =?us-ascii?Q?iGgTrnezKqRY90XTIGfBtTQAloitM/B8oi0aeD4gi6VTji9vvxYOLED1p3Fk?=
 =?us-ascii?Q?/sWcSNDz/76zr332hKOSm8GiaWuEEnwzTRHMfP3UxFcoQbNb948RFflJ/SUB?=
 =?us-ascii?Q?XylFMwdp46FqDIDjhAvxCwQHO70z5et7ZdhKHuZYwGgSJWDQRbErRb3E23wh?=
 =?us-ascii?Q?m7SZiN4zQajZgsKkGRIf7jvjk2uQ0/7cM5qPT4DaWpT930urcR46Su2kZyZ6?=
 =?us-ascii?Q?kY1sEGxP+umaCja6fhfrISOwjaCs4Lf4RwzT6SeNeIPjodwkpvJ2gsUg/6hG?=
 =?us-ascii?Q?yrLIb1bhOWaCWnd3nzj0cZE4LT3qWB/e36K5SMBrsGiFFXKveok3Ns8AB0Rk?=
 =?us-ascii?Q?veH7Tvk7KBXlh1HPsbeX0wBxvsBWqLv3tnS75J1doGkunu5oqP2XRO/DHGhz?=
 =?us-ascii?Q?Kt7AIUlJe2sPOI4s8JK2R304Bsay1tyK/hkPModHK7592TWZtNmWdfNFF9NK?=
 =?us-ascii?Q?NLjeDujPvsKkpwC7meooQmnrU2kC3iDGHFB+WyWpxmBKQyQKQXbhZgUO4Ty7?=
 =?us-ascii?Q?H6WHsv9OYlihRbRxoG69sdQ+HKBM3UluRskJX6GmfcRJHJKzDIoSQX1DqUPS?=
 =?us-ascii?Q?LnVXLKYu9/KbRYXwlbgRPJqFTPj83RuGVfBSf59eiiQZ6ezY985tXDE76DRu?=
 =?us-ascii?Q?09+axz6Xf3otw6QQYCb90Yco3mD4vqnPfHlwJSb1fvZTq3YQ7pOuzqjS6XLN?=
 =?us-ascii?Q?24Pt6DUga6lcDztlkEWWtBURKmLmraQxe9qpyo87IgJD2S6ntsF7EiQ/9PeO?=
 =?us-ascii?Q?qNzx/LaIJ9CIGr8JKPvif3jezqw5ln03QJ0r8lbOrkiirz9Jtol6vZRpyeCk?=
 =?us-ascii?Q?XZcPrrKaXs82wEk/rTZCjZ93lS/duyqWOvJuMYWy+ObAZoRk/riyugWlRRG8?=
 =?us-ascii?Q?Weo7pGxkjnkHm9taA5Qh87WKO8Vlw8G5hnW5CH2SFYRcMzO0KQRS8hCv12Nb?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bd42e9-0ee8-40f6-5252-08dd4bf3ae61
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 06:00:13.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Y4gAoMN+HIJWFOTCg8f6JWWneD83zPFoU0a9kR7S4KQvIDEIMSoGU4c99qO1+tiQddFyQSIVxEhXhMR8ecLAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-Proofpoint-GUID: qb5JdqigWsZl9dcLPhCXIJc-iU7eVjzA
X-Proofpoint-ORIG-GUID: qb5JdqigWsZl9dcLPhCXIJc-iU7eVjzA
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67ad8a76 cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=VuMbcV8avwfUX5I3y60A:9 a=QKlJ0ufG8nPqEJJU:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211299

From: Chen Qi <Qi.Chen@windriver.com>

The following two patches are dropped because they are in the new version:
- 0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
- util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...2.40.2.bb => util-linux-libuuid_2.40.4.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   4 +-
 ...x-securedir-and-pam_lastlog2-install.patch |  82 ------
 ...-and-sfdisk-sector-size-improvements.patch | 252 ------------------
 ...l-linux_2.40.2.bb => util-linux_2.40.4.bb} |   0
 5 files changed, 1 insertion(+), 337 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.40.2.bb => util-linux-libuuid_2.40.4.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
 rename meta/recipes-core/util-linux/{util-linux_2.40.2.bb => util-linux_2.40.4.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 580ff488e4..7ae1665c76 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,10 +38,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://fcntl-lock.c \
-           file://0001-autotools-fix-securedir-and-pam_lastlog2-install.patch \
-           file://libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch \
            "
 
-SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
+SRC_URI[sha256sum] = "5c1daf733b04e9859afdc3bd87cc481180ee0f88b5c0946b16fdec931975fb79"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch b/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
deleted file mode 100644
index 272e574a77..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From f912fb1bbb0ff5af2736d154347a3b9fc40476eb Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 27 Aug 2024 12:00:21 +0200
-Subject: [PATCH] autotools: fix securedir and pam_lastlog2 install
-
-Addresses: https://github.com/util-linux/util-linux/pull/3173
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/util-linux/util-linux/commit/9c787eaac43f5f01146f792b0239f587e4b81202]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- Makefile.am                    | 6 +++---
- configure.ac                   | 6 +++---
- pam_lastlog2/src/Makemodule.am | 2 +-
- 3 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ee2d553..a5dcaea 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -56,7 +56,7 @@ usrsbin_exec_PROGRAMS =
- man_MANS =
- pkgconfig_DATA =
- usrlib_exec_LTLIBRARIES =
--usrsecurelib_exec_LTLIBRARIES =
-+securelib_exec_LTLIBRARIES =
- bin_PROGRAMS =
- sbin_PROGRAMS =
- dist_usrbin_exec_SCRIPTS =
-@@ -155,11 +155,11 @@ EXTRA_DIST += \
- # pylibmountexec module must be installed after usrlib_exec libraries,
- # otherwise the libtool relink step will fail to find libmount.la and
- # will try -lmount which is possibly not available.
--# The same for usrsecurelib_exec and liblastlog2.la
-+# The same for securelib_exec and liblastlog2.la
- #
- # So introduce this dependency rule:
- # install-pylibmountexecLTLIBRARIES: install-usrlib_execLTLIBRARIES
--# install-usrsecurelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
-+# install-securelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
- @verbatim_extra_dependency@
- 
- #
-diff --git a/configure.ac b/configure.ac
-index 0375d29..134cf38 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -123,8 +123,8 @@ AS_CASE([$libdir],
- )
- AC_SUBST([usrlib_execdir])
- 
--usrsecurelib_execdir='${usrlib_execdir}/security'
--AC_SUBST([usrsecurelib_execdir])
-+securelib_execdir='${libdir}/security'
-+AC_SUBST([securelib_execdir])
- 
- # static configuration maintaned by packages (e.g. /usr/lib)
- AC_ARG_VAR([SYSCONFSTATICDIR],
-@@ -2767,7 +2767,7 @@ verbatim_extra_dependency='
- # otherwise the libtool relink step will fail to find libmount.la and
- # will try -lmount which is possibly not available.
- install-pylibmountexecLTLIBRARIES: install-usrlib_execLTLIBRARIES
--install-usrsecurelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
-+install-securelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
- 
- '
- AC_SUBST([verbatim_extra_dependency])
-diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemodule.am
-index 6d23653..a2becac 100644
---- a/pam_lastlog2/src/Makemodule.am
-+++ b/pam_lastlog2/src/Makemodule.am
-@@ -1,4 +1,4 @@
--usrsecurelib_exec_LTLIBRARIES += pam_lastlog2.la
-+securelib_exec_LTLIBRARIES += pam_lastlog2.la
- 
- pam_lastlog2_la_SOURCES = \
- 	pam_lastlog2/src/pam_lastlog2.c
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch b/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
deleted file mode 100644
index 356194a8ba..0000000000
--- a/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
+++ /dev/null
@@ -1,252 +0,0 @@
-From 7ada6547fcd1f649fadaa8021ff21e3e0f431459 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 11:45:32 +0200
-Subject: [PATCH 1/4] libfdisk: make sure libblkid uses the same sector size
-
-Libfdisk uses libblkid to check for filesystems on the device. It
-makes sense for both libraries to share the logical sector size
-setting, as this setting can be modified by using the fdisk command
-line.
-
-We do not see this as an issue, as filesystem detection rarely depends
-on sector size (with the exception of some RAIDs). Additionally,
-libblkid is usually intelligent enough to check multiple locations
-independently of the current device's sector size setting.
-
-Addresses: https://github.com/util-linux/util-linux/pull/3235
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3237]
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- libfdisk/src/wipe.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libfdisk/src/wipe.c b/libfdisk/src/wipe.c
-index bb5f1bb38bf..f389ed4194a 100644
---- a/libfdisk/src/wipe.c
-+++ b/libfdisk/src/wipe.c
-@@ -133,6 +133,7 @@ int fdisk_do_wipe(struct fdisk_context *cxt)
- 			DBG(WIPE, ul_debugobj(wp, "blkid_probe_set_device() failed [rc=%d]", rc));
- 			return rc;
- 		}
-+		blkid_probe_set_sectorsize(pr, cxt->sector_size);
- 
- 		DBG(WIPE, ul_debugobj(wp, " wiping..."));
- 		blkid_wipe_all(pr);
-@@ -176,6 +177,8 @@ int fdisk_check_collisions(struct fdisk_context *cxt)
- 	free(cxt->collision);
- 	cxt->collision = NULL;
- 
-+	blkid_probe_set_sectorsize(pr, cxt->sector_size);
-+
- 	blkid_probe_enable_superblocks(pr, 1);
- 	blkid_probe_set_superblocks_flags(pr, BLKID_SUBLKS_TYPE |
- 			                      BLKID_SUBLKS_BADCSUM);
-
-From 54f9a79301dcf492cab8e07134f96a921d367aa0 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:47:03 +0200
-Subject: [PATCH 2/4] fdisk: (man) improve --sector-size description
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/fdisk.8.adoc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/disk-utils/fdisk.8.adoc b/disk-utils/fdisk.8.adoc
-index cb72b4a3ea5..5941aa34968 100644
---- a/disk-utils/fdisk.8.adoc
-+++ b/disk-utils/fdisk.8.adoc
-@@ -40,7 +40,7 @@ Note that *partx*(8) provides a rich interface for scripts to print disk layouts
- == OPTIONS
- 
- *-b*, *--sector-size* _sectorsize_::
--Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. (Recent kernels know the sector size. Use this option only on old kernels or to override the kernel's ideas.) Since util-linux-2.17, *fdisk* differentiates between logical and physical sector size. This option changes both sector sizes to _sectorsize_.
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
- 
- *-B*, *--protect-boot*::
- Don't erase the beginning of the first disk sector when creating a new disk label. This feature is supported for GPT and MBR.
-
-From fd38ee2274f7a30393d3839dfce556260355c3fa Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:48:46 +0200
-Subject: [PATCH 3/4] cfdisk: add --sector-size commanand line option
-
-* improves compatibility with fdisk
-* add ability to work with disk images where libfdisk defaults to 512
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/cfdisk.8.adoc |  3 +++
- disk-utils/cfdisk.c      | 15 ++++++++++++++-
- 2 files changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/disk-utils/cfdisk.8.adoc b/disk-utils/cfdisk.8.adoc
-index 97fad621d12..759f39f0e1a 100644
---- a/disk-utils/cfdisk.8.adoc
-+++ b/disk-utils/cfdisk.8.adoc
-@@ -55,6 +55,9 @@ Use exclusive BSD lock for device or file it operates. The optional argument _mo
- *-r*, *--read-only*::
- Forced open in read-only mode.
- 
-+*-b*, *--sector-size* _sectorsize_::
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
-+
- *-z*, *--zero*::
- Start with an in-memory zeroed partition table. This option does not zero the partition table on the disk; rather, it simply starts the program without reading the existing partition table. This option allows you to create a new partition table from scratch or from an *sfdisk*(8)-compatible script.
- 
-diff --git a/disk-utils/cfdisk.c b/disk-utils/cfdisk.c
-index 2e0aada474a..bc1c87d83e4 100644
---- a/disk-utils/cfdisk.c
-+++ b/disk-utils/cfdisk.c
-@@ -2731,6 +2731,8 @@ static void __attribute__((__noreturn__)) usage(void)
- 	      _("     --lock[=<mode>]      use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
- 	fputs(_(" -r, --read-only          forced open cfdisk in read-only mode\n"), out);
- 
-+	fputs(_(" -b, --sector-size <size> physical and logical sector size\n"), out);
-+
- 	fputs(USAGE_SEPARATOR, out);
- 	fprintf(out, USAGE_HELP_OPTIONS(26));
- 
-@@ -2743,6 +2745,7 @@ int main(int argc, char *argv[])
- 	const char *diskpath = NULL, *lockmode = NULL;
- 	int rc, c, colormode = UL_COLORMODE_UNDEF;
- 	int read_only = 0;
-+	size_t user_ss = 0;
- 	struct cfdisk _cf = { .lines_idx = 0 },
- 		      *cf = &_cf;
- 	enum {
-@@ -2752,6 +2755,7 @@ int main(int argc, char *argv[])
- 		{ "color",   optional_argument, NULL, 'L' },
- 		{ "lock",    optional_argument, NULL, OPT_LOCK },
- 		{ "help",    no_argument,       NULL, 'h' },
-+		{ "sector-size", required_argument, NULL, 'b' },
- 		{ "version", no_argument,       NULL, 'V' },
- 		{ "zero",    no_argument,	NULL, 'z' },
- 		{ "read-only", no_argument,     NULL, 'r' },
-@@ -2763,8 +2767,15 @@ int main(int argc, char *argv[])
- 	textdomain(PACKAGE);
- 	close_stdout_atexit();
- 
--	while((c = getopt_long(argc, argv, "L::hVzr", longopts, NULL)) != -1) {
-+	while((c = getopt_long(argc, argv, "b:L::hVzr", longopts, NULL)) != -1) {
- 		switch(c) {
-+		case 'b':
-+			user_ss = strtou32_or_err(optarg,
-+					_("invalid sector size argument"));
-+			if (user_ss != 512 && user_ss != 1024 &&
-+			    user_ss != 2048 && user_ss != 4096)
-+				errx(EXIT_FAILURE, _("invalid sector size argument"));
-+			break;
- 		case 'h':
- 			usage();
- 			break;
-@@ -2803,6 +2814,8 @@ int main(int argc, char *argv[])
- 	cf->cxt = fdisk_new_context();
- 	if (!cf->cxt)
- 		err(EXIT_FAILURE, _("failed to allocate libfdisk context"));
-+	if (user_ss)
-+		fdisk_save_user_sector_size(cf->cxt, user_ss, user_ss);
- 
- 	fdisk_set_ask(cf->cxt, ask_callback, (void *) cf);
- 
-
-From ef7b76baa17ddb5414691fa8f49d61415c30871c Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:50:40 +0200
-Subject: [PATCH 4/4] sfdisk: add --sector-size commanand line option
-
-* improves compatibility with fdisk
-* add ability to work with disk images where libfdisk defaults to 512
-
-Addresses: https://github.com/util-linux/util-linux/pull/3235
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/sfdisk.8.adoc |  5 ++++-
- disk-utils/sfdisk.c      | 14 ++++++++++++++
- 2 files changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/disk-utils/sfdisk.8.adoc b/disk-utils/sfdisk.8.adoc
-index 26ccad5a3b2..ce9e97b7682 100644
---- a/disk-utils/sfdisk.8.adoc
-+++ b/disk-utils/sfdisk.8.adoc
-@@ -208,6 +208,9 @@ The default list of columns may be extended if _list_ is specified in the format
- *-q*, *--quiet*::
- Suppress extra info messages.
- 
-+*--sector-size* _sectorsize_::
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
-+
- *-u*, *--unit S*::
- Deprecated option. Only the sector unit is supported. This option is not supported when using the *--show-size* command.
- 
-@@ -256,7 +259,7 @@ Specify the maximal number of GPT partitions.
- *grain*::
- Specify minimal size in bytes used to calculate partitions alignment. The default is 1MiB and it's strongly recommended to use the default. Do not modify this variable if you're not sure.
- *sector-size*::
--Specify sector size. *sfdisk* always uses device sector size. Since version 2.39 *sfdisk* recalculates sizes from dump if the script and device sector size differ.
-+Specifies the sector size used in the input. *sfdisk* always internally uses the device sector size provided by the kernel for the block device, or as specified by the user on the command line (see *--sector-size*). Starting with version 2.39, *sfdisk* recalculates sizes from the input if the *sector-size* header and device sector size are different.
- 
- Note that it is only possible to use header lines before the first partition is specified in the input.
- 
-diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
-index cf402007b51..5e7c1d926e4 100644
---- a/disk-utils/sfdisk.c
-+++ b/disk-utils/sfdisk.c
-@@ -2155,6 +2155,8 @@ static void __attribute__((__noreturn__)) usage(void)
- 	      _("     --color[=<when>]      colorize output (%s, %s or %s)\n"), "auto", "always", "never");
- 	fprintf(out,
- 	        "                             %s\n", USAGE_COLORS_DEFAULT);
-+	fputs(_("     --sector-size <size>  physical and logical sector size\n"), out);
-+
- 	fprintf(out,
- 	      _("     --lock[=<mode>]       use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
- 	fputs(_(" -N, --partno <num>        specify partition number\n"), out);
-@@ -2191,6 +2193,7 @@ int main(int argc, char *argv[])
- 	const char *outarg = NULL;
- 	int rc = -EINVAL, c, longidx = -1, bytes = 0;
- 	int colormode = UL_COLORMODE_UNDEF;
-+	size_t user_ss = 0;
- 	struct sfdisk _sf = {
- 		.partno = -1,
- 		.wipemode = WIPEMODE_AUTO,
-@@ -2217,6 +2220,7 @@ int main(int argc, char *argv[])
- 		OPT_NOTELL,
- 		OPT_RELOCATE,
- 		OPT_LOCK,
-+		OPT_SECTORSIZE
- 	};
- 
- 	static const struct option longopts[] = {
-@@ -2246,6 +2250,7 @@ int main(int argc, char *argv[])
- 		{ "output",  required_argument, NULL, 'o' },
- 		{ "partno",  required_argument, NULL, 'N' },
- 		{ "reorder", no_argument,       NULL, 'r' },
-+		{ "sector-size", required_argument, NULL, OPT_SECTORSIZE },
- 		{ "show-geometry", no_argument, NULL, 'g' },
- 		{ "quiet",   no_argument,       NULL, 'q' },
- 		{ "verify",  no_argument,       NULL, 'V' },
-@@ -2450,6 +2455,13 @@ int main(int argc, char *argv[])
- 				sf->lockmode = optarg;
- 			}
- 			break;
-+		case OPT_SECTORSIZE:
-+			user_ss = strtou32_or_err(optarg,
-+					_("invalid sector size argument"));
-+			if (user_ss != 512 && user_ss != 1024 &&
-+			    user_ss != 2048 && user_ss != 4096)
-+				errx(EXIT_FAILURE, _("invalid sector size argument"));
-+			break;
- 		default:
- 			errtryhelp(EXIT_FAILURE);
- 		}
-@@ -2460,6 +2472,8 @@ int main(int argc, char *argv[])
- 	sfdisk_init(sf);
- 	if (bytes)
- 		fdisk_set_size_unit(sf->cxt, FDISK_SIZEUNIT_BYTES);
-+	if (user_ss)
-+		fdisk_save_user_sector_size(sf->cxt, user_ss, user_ss);
- 
- 	if (outarg)
- 		init_fields(NULL, outarg, NULL);
diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recipes-core/util-linux/util-linux_2.40.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.40.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.40.4.bb
-- 
2.25.1


