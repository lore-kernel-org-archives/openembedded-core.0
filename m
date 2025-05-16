Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F51C2D0CD
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 02:18:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3976.1747361911960575455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 19:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=723171ed67=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G1KSMH029354
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 19:18:31 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbca3nyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 19:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gk17RBj4FYq7jiZUwKaXAe5258uy0IM17Vbxpi03DGTJ+qA5kddv3N7FENp9fz3mY9yKGI8Vvf2OIm6FAkRKvpBKp1bAFbE/oa8AQZFzuH8KPu+m9UbZG7sUtzIxETOGtdjQv+cBD+9pvIh1lHXtQOa87UxXBjNludf5s98nCAn7623Np486oZWiFualB+h7FNhXOEuLQ4LZtkbGX1EW7HVvJOwmfp/jZjiPSXutABFXB29h1UEtiffx2bFYBJnR1km48do6c5FaBi9A2/KIOAK9UU5B+B3Syb18f93UVsXtTWUIAigFd9i9a09yFzRVTpXS2annR1hTNe37UdTDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4MAhn/H3e6vZIKeFJAJ7CnGfKm3lNqGuUxGY+zhLpI=;
 b=G1loaNEpHOBBDSYgWxeCxIn9Vxuk0wi+yrOGVzSVsi8hQrUSiPPphnZ90B2yj7YeerZwj5j/rPMqQQDxhLBH06soWPT8KjCP5J7J4h6cjHen4gNCNNL/MuXP2cRKL99Z4EflTqF9mXPX3RTZowOrQ9mbGZui9gEbbB81FIfz/LrQXOkFD3SDqmqRrLHZKOi4sd5yjH/TZ6i9ugbAyK9LMbEU1w7QcAmOoxBgiXlOEA/4IbiikjqxaFBYEAIFPwoCR1BOKDomfHU6WK1f3QO5wTMnK4ubUULCgOZrktf3siiDmEGlkvmzkDvV8wQ8Rn5nR+1g6xpW98vi+MAwG+ahVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 02:18:25 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:18:25 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [walnascar][PATCH] iputils: Security fix for CVE-2025-47268
Date: Fri, 16 May 2025 10:18:09 +0800
Message-Id: <20250516021809.3669935-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0195.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB4814:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed96e46-21de-4b0a-03ee-08dd941ff00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kRWLumJa27zMQcUBY51/lHAx/57X/lQPsgqjDyOfFs9p8QsfNIMYFCsyJOvU?=
 =?us-ascii?Q?yFAx3O5BppRWWmE3RboyuzCvYxfzHmbmYqK+ZL150duGeSBrxSXyYyP4USLJ?=
 =?us-ascii?Q?7MBDkXFfB/FRZ1MW7FgP2JV0PF28I6o+A8tB3c9IufFFrl24O0YheaFruqTC?=
 =?us-ascii?Q?l6vBHa+2lIPF+e29F3Vu4o3sF3Yz1jjyTUFv7nO712ludnL4uoSSUWWyt5rc?=
 =?us-ascii?Q?5CJSpPzIvV2JaprfltTeVErrxMfCiRUjaRP6Q1k1UjytGXvPaCDVw+UsBT1K?=
 =?us-ascii?Q?0tRDLni9vn6JtsA1K9Nx1AwaEYTOTp5kEfEelsjDWOJAAGp7wYoLKP/RgnXT?=
 =?us-ascii?Q?+rTw9A1Vn1oa7kFIDBhwksbFpKxlJ7ciXodW4OUBkZqQYswAOdDGOjHWwW8f?=
 =?us-ascii?Q?ediWrGGuDX4LSXyfLZPvI5ei6Vibco7tNTrSs98BCpZ4IKBn55GDIvBolgWH?=
 =?us-ascii?Q?KqMHg/8rbTLKVNj58IcihGENjpU1ZfBse2scRDTHInsBQ63IqTVU0duhsUHu?=
 =?us-ascii?Q?+EBzRIujTZChzfNmItn8aCUIy69YDoDfTdVpedjQXwtI+rRIovGWzwy6UZ1s?=
 =?us-ascii?Q?sUrcL6t5qzH3s0WGbnjwiFgEnMQNQk9DYTRfn4Y5zxgctWBeC1mPJna3FfqE?=
 =?us-ascii?Q?C+ttrDsPhHCTeLHMq9NWhL5R/SVP0Z+ZxHOtPX/aevtLwhpBtQ/KPnwxJ9mY?=
 =?us-ascii?Q?iqwnz4bUAfVUWZUa/cdgqVOV7EvQrLPX/kRpz7dVaVtUwY4ioo2+dkYwzJrp?=
 =?us-ascii?Q?SgeUPjhCZi4RgvBLU/xD3Jcx1YmUBqupSJcvtHM7t7s6Wj8g4IE5mJzzCS+0?=
 =?us-ascii?Q?QfwTCuC2vWGdz2OUOI52MyvSrfchOyjnvx5goBF6U8BnoRqEZNeDNX57edI9?=
 =?us-ascii?Q?AK8Kd4AfJJubV57xtf+DhGLNlyaOuurUe+hajH4onlM4j9AfDFzu1z614miU?=
 =?us-ascii?Q?0+dg1D1N1mob61nLTZtO67JhMv7y4dSlk9JVPGFerzF5DcW6YnFOHJZMmn1J?=
 =?us-ascii?Q?+JTtneDLSX1dGR3+A2WuP1vKsq2xa7Po9L65iz8xHMFFLIAilq+HlBGnmbUF?=
 =?us-ascii?Q?nOkKwUy3l9TTRK7KizRB0erI9BIdukUZz7ntccZL63w/TNuyA8mhSlaEsZUh?=
 =?us-ascii?Q?LhxtNrQLEN3Y2NlAwO9EKoNRrGFSyzdQ4HVpNNapC8L5BLyONCwHXPbADsRF?=
 =?us-ascii?Q?1Sn2LGb9au0deXrJe9vakpo59Bfgfu/6pk089iMFpXJIRq1lhQD+9UeKTbAa?=
 =?us-ascii?Q?zyLHEASB4/2wDAmng1rxWYEnVn3RFH1Bt6MHLzEOIb0PhLCZyFWnAUW+3xJr?=
 =?us-ascii?Q?b0B2OasUr5v/h5AThQ3mQUwhl2hN7E9AcxmsntBZKjXiLA7aJGappBJRQ83f?=
 =?us-ascii?Q?RJGp6GmNKrcu9fPOnt6XSZCXGAyYUANuQB8WEyAddeflmD/Mj8fhcuLRc20+?=
 =?us-ascii?Q?wyQpysAfjNg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SloVfcp4E5iigx05lnKHdIMlMYizTmG0N9sCXcBCrUXMAhO98IR3rX89OI+T?=
 =?us-ascii?Q?KlHwbmPxVwaHmwsy7eF7uTRJvzPRyUa6MBoqbMwxIh5i/keziBfnbWQox5ul?=
 =?us-ascii?Q?iKS+JzROrUTCmaxs05yMUNI9ofxhEAaolqK/resNHIO8w9tL3G9bQNbCIMJ3?=
 =?us-ascii?Q?vAPraVfbPpft8X4aF9c+4m391zPGFDb5Qfvuvz23Y16YyTf8y0LdTy1YGfQu?=
 =?us-ascii?Q?/xFvs65znD3FRFrHQnTnjVnuWnMzxQRrKkiHkd925P+S2ikxdaplU+xUhhOb?=
 =?us-ascii?Q?BpB6ICubLGdpBBfULkYa+KwHegVBR9BQNjjzVBrV6jnhLTvPwOHUujcxR+5A?=
 =?us-ascii?Q?8x3vdpGKWxSqsEx0ruyGjKYQD1W60zjpVmOP774W7GTiS+hOhZIx5Up1HXD/?=
 =?us-ascii?Q?AblfbL7ZEW8TwzQ3hl4VgkTLNm0El4r5BWCTDgUmD5oXm/qP8M4CKeo3JK+F?=
 =?us-ascii?Q?UiBKOWmUxQjSTfq1GVN84fWirNCrJRCOUhpohLNu2nZjAzltC7wzKJYjAd/2?=
 =?us-ascii?Q?6LeTx9DGaE9iPQDWMahxoVU1sDtv3HHj2Nd95COiAL16zkS0bm+2Y6nqF+nx?=
 =?us-ascii?Q?Zdm85Dt4j+nQlMq6m+IFA104e1DCxSjQlcP8e0Ue6Kknx33ZjZ1fVl868kb4?=
 =?us-ascii?Q?jH3D+YhWBvch8rWkox/n/XBUf8VaPOmE/OQeWvFR2kQLqBCSlIREcxgDVrBF?=
 =?us-ascii?Q?0+cAVJGFhVOEN6A0fO4giK2pxYSPA83X2NZHDkBxjJqCZVVHHAxEuZKhKqPw?=
 =?us-ascii?Q?IWnLOexmKG6zP4+xSH5MHeEeRxfdS5KfgGs7NzEsivRljxp2YP/dJQw7bq2A?=
 =?us-ascii?Q?Uzlr1XcVr/lJGx518AN69p8K+xuUYrNoqGsQ7Uh1VW507wvB8KmPq43lDb5K?=
 =?us-ascii?Q?w6Fh1mmijfoW+kUO7ez6a0jMEVdab0E+VbbT0y4T+9gzlMwICnFjOBE+GT20?=
 =?us-ascii?Q?XBzrlxHMdT62b9CwaX+4/3uOdUUXBu1mLrVU5fqoPlaVg09ADrZAQGu+Qvyj?=
 =?us-ascii?Q?OLtGRZuyiz4nkh4zg4htULOh54di/3yOfc9x7wixcSQVcLgIoGkx7km9kFtH?=
 =?us-ascii?Q?TIpkbSbIEX5WizkK6W6AliKHQ1EGAN60hqgFZMQmRLTrdLshqfkyoZF3VKlJ?=
 =?us-ascii?Q?yra4JKK4eYX3jnfucz/8rXdnfK9Gu63PWMoeowOZznmiua2xDrtYDRhBOtL3?=
 =?us-ascii?Q?eJBwsTkIQXKTOvsZsVNyKw04Qzcxn8WZ8N5R3XZJPduvRdbUOTUKbvttoUCl?=
 =?us-ascii?Q?q8hpFZTW/70/GSDHL6jZ28HpdLl2LHa7ldCPu6NfvG51215L0RkrPQNX5vq9?=
 =?us-ascii?Q?tmPW1dDqnTvqhNbqZv0jTIPygkEP4u2vSLRVhA5d0M356sAdj1WU/nc5VZcK?=
 =?us-ascii?Q?g5vWT4TcFofenrHzbZbba8MPfLO2jzrHn8n8L2JO1WNDXlwFRxR9sAjCi5bM?=
 =?us-ascii?Q?2OOEr6M9YQa7CXnnkzoQef7Oumi80ZKfnXkBsjXORZiXc0KM+93XE+yqbXuV?=
 =?us-ascii?Q?hi7YoxG6tTDxK9z3N8l7ikT3OhMAFPomM7aTdjMbCyUH58zX9XHCzizP2UIa?=
 =?us-ascii?Q?FidIbJOvjMWLI1BQ2AB6K3ffAFl4ytjD9xqdK1TX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed96e46-21de-4b0a-03ee-08dd941ff00d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 02:18:25.0957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElyMOTqu2vSBFEMXajbUiyiUeDjdhqXjcyJ72isyYM+ztvwabKT0sT/mcadAGPWVS1ooRX7GS6GvdAs8wOq/2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
X-Proofpoint-ORIG-GUID: ed_8bh3pY_jyQTrshhnBk-LtlkwpGMYj
X-Authority-Analysis: v=2.4 cv=P446hjAu c=1 sm=1 tr=0 ts=6826a077 cx=c_pps a=mEL9+5ifO1KfKUNINL6WGg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8 a=5PjkQvkCQFl6gfXuX20A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ed_8bh3pY_jyQTrshhnBk-LtlkwpGMYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAyMCBTYWx0ZWRfXwG/OcYF6i20I kXBgGqiiEQqKBknbj5Smco59/3LRJeLepHzestjHdhAFb2fMRsq4CWhcOpU2EJIdqkcN/ZyasV3 rglZ3y7T/Pe1QGREBPIqcySQ6DE/wzht0suRS1/Sw91/XrKXW9Ug5hFRMLhBqAmIy22LL2F5WCz
 ev9ydf7Fljxog3MOljn5K2UWNyO0J88q5kT5rtmp7XOfsCL3aRpoGRQcbetiMMrZEc1VY/X5TjO IFlnhdEr1UOHzHCkVhnyw1mN+q5zc8w0AjvCpUpLU0FmvyzBA6LT1jvsGL1rcqZpTkQIsLdwmdB Dr0z36G5KSsPfUssnMsKhfHc/bL5yyU5FZqdkCh1NeUGSxlm/HTdcnz4f9bToSkeZbaZd+P47qp
 zVwyxyyByW138J19NmBkkeMxYB6s3dmDXJkSh7oQkXUiiBDOGySh6a//dM2ofw8DuTjOBp/4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=806 suspectscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 02:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216718

CVE-2025-47268
ping in iputils through 20240905 allows a denial of service (application
error or incorrect data collection) via a crafted ICMP Echo Reply
packet, because of a signed 64-bit integer overflow in timestamp
multiplication.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-47268

Patch from:
https://github.com/iputils/iputils/commit/070cfacd7348386173231fb16fad4983d4e6ae40

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../iputils/iputils/CVE-2025-47268.patch      | 143 ++++++++++++++++++
 .../iputils/iputils_20240905.bb               |   4 +-
 2 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch

diff --git a/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch b/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
new file mode 100644
index 0000000000..dd31b79031
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
@@ -0,0 +1,143 @@
+From 070cfacd7348386173231fb16fad4983d4e6ae40 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Mon, 5 May 2025 23:55:57 +0200
+Subject: [PATCH] ping: Fix signed 64-bit integer overflow in RTT calculation
+
+Crafted ICMP Echo Reply packet can cause signed integer overflow in
+
+1) triptime calculation:
+triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+
+2) tsum2 increment which uses triptime
+rts->tsum2 += (double)((long long)triptime * (long long)triptime);
+
+3) final tmvar:
+tmvar = (rts->tsum2 / total) - (tmavg * tmavg)
+
+    $ export CFLAGS="-O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer"
+    $ export LDFLAGS="-fsanitize=address,undefined -fno-omit-frame-pointer"
+    $ meson setup .. -Db_sanitize=address,undefined
+    $ ninja
+    $ ./ping/ping -c2 127.0.0.1
+
+    PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
+    64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.061 ms
+    ../ping/ping_common.c:757:25: runtime error: signed integer overflow: -2513732689199106 * 1000000 cannot be represented in type 'long int'
+    ../ping/ping_common.c:757:12: runtime error: signed integer overflow: -4975495174606980224 + -6510615555425289427 cannot be represented in type 'long int'
+    ../ping/ping_common.c:769:47: runtime error: signed integer overflow: 6960633343677281965 * 6960633343677281965 cannot be represented in type 'long int'
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ./ping/ping: Warning: time of day goes back (-7256972569576721377us), taking countermeasures
+    ./ping/ping: Warning: time of day goes back (-7256972569576721232us), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ../ping/ping_common.c:265:16: runtime error: signed integer overflow: 6960633343677281965 * 2 cannot be represented in type 'long int'
+    64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.565 ms
+
+    --- 127.0.0.1 ping statistics ---
+    2 packets transmitted, 2 received, +2 duplicates, 0% packet loss, time 1002ms
+    ../ping/ping_common.c:940:42: runtime error: signed integer overflow: 1740158335919320832 * 1740158335919320832 cannot be represented in type 'long int'
+    rtt min/avg/max/mdev = 0.000/1740158335919320.832/6960633343677281.965/-1623514645242292.-224 ms
+
+To fix the overflow check allowed ranges of struct timeval members:
+* tv_sec <0, LONG_MAX/1000000>
+* tv_usec <0, 999999>
+
+Fix includes 2 new error messages (needs translation).
+Also existing message "time of day goes back ..." needed to be modified
+as it now prints tv->tv_sec which is a second (needs translation update).
+
+After fix:
+
+    $ ./ping/ping -c2 127.0.0.1
+    64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.057 ms
+    ./ping/ping: Warning: invalid tv_usec -6510615555424928611 us
+    ./ping/ping: Warning: time of day goes back (-3985394643238914 s), taking countermeasures
+    ./ping/ping: Warning: invalid tv_usec -6510615555424928461 us
+    ./ping/ping: Warning: time of day goes back (-3985394643238914 s), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ./ping/ping: Warning: invalid tv_usec -6510615555425884541 us
+    ./ping/ping: Warning: time of day goes back (-4243165695442945 s), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.111 ms
+
+    --- 127.0.0.1 ping statistics ---
+    2 packets transmitted, 2 received, +2 duplicates, 0% packet loss, time 101ms
+    rtt min/avg/max/mdev = 0.000/0.042/0.111/0.046 ms
+
+Fixes: https://github.com/iputils/iputils/issues/584
+Fixes: CVE-2025-472
+Link: https://github.com/Zephkek/ping-rtt-overflow/
+Co-developed-by: Cyril Hrubis <chrubis@suse.cz>
+Reported-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Reviewed-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Reviewed-by: Noah Meyerhans <noahm@debian.org>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+
+CVE: CVE-2025-47268
+
+Upstream-Status: Backport
+[https://github.com/iputils/iputils/commit/070cfacd7348386173231fb16fad4983d4e6ae40]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ iputils_common.h   |  3 +++
+ ping/ping_common.c | 22 +++++++++++++++++++---
+ 2 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/iputils_common.h b/iputils_common.h
+index 49e790d..829a749 100644
+--- a/iputils_common.h
++++ b/iputils_common.h
+@@ -10,6 +10,9 @@
+ 	  !!__builtin_types_compatible_p(__typeof__(arr), \
+ 					 __typeof__(&arr[0]))])) * 0)
+ 
++/* 1000001 = 1000000 tv_sec + 1 tv_usec */
++#define TV_SEC_MAX_VAL (LONG_MAX/1000001)
++
+ #ifdef __GNUC__
+ # define iputils_attribute_format(t, n, m) __attribute__((__format__ (t, n, m)))
+ #else
+diff --git a/ping/ping_common.c b/ping/ping_common.c
+index dadd2a4..4e99d89 100644
+--- a/ping/ping_common.c
++++ b/ping/ping_common.c
+@@ -754,16 +754,32 @@ int gather_statistics(struct ping_rts *rts, uint8_t *icmph, int icmplen,
+ 
+ restamp:
+ 		tvsub(tv, &tmp_tv);
+-		triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+-		if (triptime < 0) {
+-			error(0, 0, _("Warning: time of day goes back (%ldus), taking countermeasures"), triptime);
++
++		if (tv->tv_usec >= 1000000) {
++			error(0, 0, _("Warning: invalid tv_usec %ld us"), tv->tv_usec);
++			tv->tv_usec = 999999;
++		}
++
++		if (tv->tv_usec < 0) {
++			error(0, 0, _("Warning: invalid tv_usec %ld us"), tv->tv_usec);
++			tv->tv_usec = 0;
++		}
++
++		if (tv->tv_sec > TV_SEC_MAX_VAL) {
++			error(0, 0, _("Warning: invalid tv_sec %ld s"), tv->tv_sec);
++			triptime = 0;
++		} else if (tv->tv_sec < 0) {
++			error(0, 0, _("Warning: time of day goes back (%ld s), taking countermeasures"), tv->tv_sec);
+ 			triptime = 0;
+ 			if (!rts->opt_latency) {
+ 				gettimeofday(tv, NULL);
+ 				rts->opt_latency = 1;
+ 				goto restamp;
+ 			}
++		} else {
++			triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+ 		}
++
+ 		if (!csfailed) {
+ 			rts->tsum += triptime;
+ 			rts->tsum2 += (double)((long long)triptime * (long long)triptime);
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/iputils/iputils_20240905.bb b/meta/recipes-extended/iputils/iputils_20240905.bb
index ca8ddc530d..64d58a91c2 100644
--- a/meta/recipes-extended/iputils/iputils_20240905.bb
+++ b/meta/recipes-extended/iputils/iputils_20240905.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 
 DEPENDS = "gnutls"
 
-SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https"
+SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
+           file://CVE-2025-47268.patch \
+          "
 SRCREV = "10b50784aae3fb75c96cdf9b1668916b49557dd5"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


