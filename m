Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB463C3ABD9
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 07:35:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.96330.1747208153684282732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 00:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7229598d4b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E6vD42009311
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:35:51 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbc8rq7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:35:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUqIE8Hn6fqZkE062QLm1tRSA26l/p/GJDK96nvAmw/12QS13iPNrS3cStrshoCPRn2k1S0xxAVg3oRoxfc43b4kj9bLcz3jR53x5JySn+vVtiXU4I+ZDD+H9j5gGYnUX/Q/9Gh3d7Gru5oS/7Yy+jKR4GREdi7xD0jQYp5/k2rKUVuKyBYZyvBW6bRKL1oYib7wdBNidmlN7WtL5eNaSRPUxOZEF/n4MZkZ7u+rJWO/ZpVDQANmJnUh/JECYpFY+fZcXco//7nqlm3k2pdYbtWdO2oMXKfwpPoYmpsFj6bCkFBhQwCdU6Nz1OXzRPrqeVpLylsStKNlfqIF2dnC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3J9mN7IdBxMuGr6IMhXZPBrThvw33rdXm1cM+f/lfI=;
 b=CQieEKKVTMO+ldnw00njDIFP+Jg+IPEK1a5zoGJ4dXFK2QggMlzzPHIkYy9Zi1lyNK9/dm2PKCjg4Jf4FUZeK4PgWpnc8ZAwx4wQxRg/rsxIoUeS4ukSIt4cDqGG3kOFn6v0H23WOmt1VP2/b422XZsW/lmf8DX3NG0lYNbJ7pTMRP5rGuVC9Ng0cPQXqmTkw9Yt064iPUlSfvuPw60Fm1jfAaJn1XfTZuo022Tbv+wQ9aW4wtDe8j5Caedne21BJGObLFmmH57XGMK35GR3eM/JW/jbqT317Athc/dPS8fxWXKWLWuDGGCZm+bOmK8qKt9FOI1Br0e/WRHPqseNrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.30; Wed, 14 May 2025 07:35:47 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 07:35:47 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] iputils: Security fix for CVE-2025-47268
Date: Wed, 14 May 2025 15:35:30 +0800
Message-Id: <20250514073530.918697-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0241.apcprd06.prod.outlook.com
 (2603:1096:4:ac::25) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: c27f6ca8-4672-421b-b582-08dd92b9f165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ik8idypoLw+chWun1yxQp1lG5D1v6hPMj87bJ/2fvDRbUc9vb7gHlT2+PTVg?=
 =?us-ascii?Q?m14jcFyIXCYzW2wPdyz76bbLQDR5IM5OECEVJEFzeSPF8Ybgn9YMeQZz8Y4L?=
 =?us-ascii?Q?STgKjzd+pC4dfNqJnLZyJalXjI4L5r2QN4FqIcvNcfIG3t8HtbdHp2YzQqZC?=
 =?us-ascii?Q?oghX2CKRceBL3PnTZg9RsH8St3MtHjlKt2z4jXRlziao97XdKolxFtLedebY?=
 =?us-ascii?Q?MahHzrrDfit6VSuwjlDw2t8098MTZBeE7UfjC5PI1ilhyY+YyTwj3Qyhq/R4?=
 =?us-ascii?Q?bADccnOK7fzgyRZTdbKgNKykT0gfu4q5uGwj0SsbcSA4eS9lW/Z/riVwf3vl?=
 =?us-ascii?Q?8WEEAHHxbVRSnN3YUd7izjU8IUjF/YhSt9NfNz9FkIJZhv2e9xSft/TUHVqe?=
 =?us-ascii?Q?caCbhNrY1UgwjkCexkLpZ6hFxX9Mzm35vXaRwu/x/9ksKTU/3j87HpQxpghU?=
 =?us-ascii?Q?p9IJro64QF1C7qG1aLRyF3FxamK2TqXY1fZHgJ2LdbfhdPgN6tYlvM08laSA?=
 =?us-ascii?Q?Hk4N+0mRa7j37bwmoJuMxTCvP/McxP4FRfbn51PfKeIa60usRnIDK5WAakzA?=
 =?us-ascii?Q?BOcVufnPlE3DFVtAiE1tLSpwqKwtZACHON6Bgf2Vx3sMcTXsmRfpG4P5KvQo?=
 =?us-ascii?Q?lJbMJG101lmTLfR5kDE8c4i9I2J/4+M1OIQl2HveG5pyBlWPHBvGdVbzTP6b?=
 =?us-ascii?Q?qQLVebxjtaGhb4p/hy76JFwLSCpYg5dTBcBN/oMbMxnRlhjWlPNkNlThy22p?=
 =?us-ascii?Q?oV5DqoZP80Pm8yHI2Z+khstgoiTHmJkmiAPUI1/SdCJFFwX0/g7DQ1IUr+4M?=
 =?us-ascii?Q?pEeYua2ZHrwQpMQVpWgCMnkCe489M5yTVFaskI6UmgZI0FWw5mchDMHsdbV6?=
 =?us-ascii?Q?SAfulj7ekL8EGWF/zr13hM8C9JEtHqFYFglV1QKShpRWATOxQcaaloKSoL6T?=
 =?us-ascii?Q?at8Af++d90vsl1edxQ7WUAbYBLhprWPhbeCqhZflhuy/C6pfycwXooU2KrSW?=
 =?us-ascii?Q?CoT1Wu9VWNjM6sWO04QpeNVdrxYMgNmAAxsKkY9o3nwULSzCfHCEIB1OeSUu?=
 =?us-ascii?Q?EtOXX8YJs0Ni8kjGnekudQn1Jg+/Xlsdarwu854q+Kkhcby9dAzulTwXdWq6?=
 =?us-ascii?Q?W2vDvdhI3iadm7+2ykywU58kq0t/TMchF/7NMJYeUantksfgMtwCx7P1j/Lc?=
 =?us-ascii?Q?QCLPxSmMEz9zCpeZJpxvZ4jnUEsIxKIqIPxYFMRVT9oV5GK5HCeXhKOknDT7?=
 =?us-ascii?Q?JdlI3Yfvhl7wq/URXgoiJhEllw0qFCgZ+HCJ0wI7WFMzN3/MjAedxyyRKGAa?=
 =?us-ascii?Q?ftmQ/30kTfSKmTxiIb3lAf3z4nehA/SyV72RmYq3i4MAOkUwbDaRuaHJPZJt?=
 =?us-ascii?Q?opRyrel7yu/SFgYmpw/gBV78B5cdAnYVOI3V0/wWk3SyVmnxh3qMHwl18moc?=
 =?us-ascii?Q?mdP5E1csbMY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sDtlk2HdECw8LZqr10EeDHoO8/FCE3L/NfUKgaA8F7jb+RabN0szVVdbBqZD?=
 =?us-ascii?Q?A9p63Sf8c3YvlHdugDCNwIUHpqT8CPia0bcO1FzHLQr80aNFbNgL+Qzt0ata?=
 =?us-ascii?Q?DX3KmmuE7ZLTAwa9ICLTormN/hJE/lVqYKfkXrmOmZTagmpBu+dFKUWTdAfR?=
 =?us-ascii?Q?2+4M5kQpvkGzH1Roxq2NnTmfW/EGnwazev/FlpAiyICBhX6gsRDlQ4mInfiv?=
 =?us-ascii?Q?5kE8QzfsNCD/SELgxfrB2kykGpGyN8Q/wwxJ6HMABOgDGlQuesV6kqrdj8Q8?=
 =?us-ascii?Q?KmKGgGOR1b15u24QU7Ec1hyUoDeg6fhZd4uYmz+hAaraMO3PlQ26QsUemeiy?=
 =?us-ascii?Q?oHJtE6rtQAPg/4MjNRcUvj0pRaH+rPzdDXMMyVjmptEnnnA5V+uSYk4KO1Ar?=
 =?us-ascii?Q?G3BpONL6IzCHDnBBpSSBQLGpn3TASoBTyTEtmArBdm1ko+zV6Fzu1ee2uro4?=
 =?us-ascii?Q?kwFrz+b8T4iz6rkiWZYBduWmihtlgVqaB3DfH95IGoiSF3v10q+UJ9uT1ILa?=
 =?us-ascii?Q?gQ19pOYvr387sv2aujED5qjW//LNXXbFAlPNwEem1qfDTZfqoaRuSbdWRpeH?=
 =?us-ascii?Q?TM+AlY9qKBL/aAuAMKqxhxF2LVgK+lSPZp64YXsLh71htJVmAm9UVhL4D0Pe?=
 =?us-ascii?Q?atWA1s+YlmOUIFZDur3KpMBpOBvMmLun/vl8nTJkqBobv1lwpswbGhOGuqOE?=
 =?us-ascii?Q?kiezPcBvTtC+4/fKo38jCwTFLpV78uzNAFxSjZegj8aA3+XbMYexeMkE5atX?=
 =?us-ascii?Q?FNLSwDhN8grgc+fIyPr7Tb6vJd+O80xeVQ+j+ygDO4XRTM47QQNd0QaxAq2m?=
 =?us-ascii?Q?SIs+I00T2/wClg525bc6b0geCAMT34FyINDB/U1KDWvhEbk1D/w2vwcPsU4I?=
 =?us-ascii?Q?DfiCIASDXkoTazmViyXhrxBWB0gnWrh4W/oj1WebH6RktcaoZjZ4UgyCoHLR?=
 =?us-ascii?Q?2Gcuwj1WCKxe1ajpp9AQRsHIhHNwDhU5J7qaYoYzZYANPl+XB721ra/D1dNu?=
 =?us-ascii?Q?BSYvDHBJXc5HEUUjr6M+RMYV0JWMw5Y1VMeHR/XiS0XTTq0T+JoyZL6J7OUJ?=
 =?us-ascii?Q?7Am1g4lyWbAszlDRKyYIB3yBhUAxQKN30iKiAd7GEPXDAGlZ5eOUxmZXpMip?=
 =?us-ascii?Q?sxv0OwYR5Wn/biu60xRt8Mge/rXqArLZb1+2iht2UzkoT/yJ+nLdayeebZFB?=
 =?us-ascii?Q?9pTVAO7V9vzYpr7mNEUU3PGp4eS0J8k953ahTcA1NXFwn0Fi+CUTbRPqgaUm?=
 =?us-ascii?Q?6pBgWSiq8Dg5dTtiNFw6MzgZPsbIUkUOLYe/CPb6C7oY/ssUu5TkfyNuV7ul?=
 =?us-ascii?Q?Dkvgpsuvkj/oo8iztTZxnIbOWNe+sgjlNQ09lHYMWkHCpGkyY8RRHUXnjw1y?=
 =?us-ascii?Q?UkcpH/ol6lIRF2yKqd1tvl64WqwNqLsPneuNwDNAKB55iRM5wuwArOXnDMF0?=
 =?us-ascii?Q?cvHmw6fXXPKAWy065OK5GL1m4nYrkpyMGJMu2r9S+owhRNVIBOUi37CIOGDH?=
 =?us-ascii?Q?x+rNVI1BBiGG6LDtVzWDYl9taU9MgQgGp+wP/LgKPy4uMsFCpA+ehZQvEECF?=
 =?us-ascii?Q?Koc+qICR8qY+3EPKowNrFHxzxDqiVEUxmu8YSfPp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27f6ca8-4672-421b-b582-08dd92b9f165
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 07:35:47.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2IifYq7gSYVLGGTJ+J0Rm5HkFxNjJyHjEeBklkfO8FAl1fHxbHnMDHJzFtPcu2fyE0Y1klDf/15hx7nJHXaPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8775
X-Proofpoint-GUID: ZCFY4WAZltqWltFUWPDK6E6i8iwil_yB
X-Proofpoint-ORIG-GUID: ZCFY4WAZltqWltFUWPDK6E6i8iwil_yB
X-Authority-Analysis: v=2.4 cv=IIACChvG c=1 sm=1 tr=0 ts=682447d6 cx=c_pps a=LJpgAVzrtcldLI4wrjuEkA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8 a=5PjkQvkCQFl6gfXuX20A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA2NSBTYWx0ZWRfX/Si/XKF1drhs QtjKxLmwmBcQaLXz7FON7o6UTxRwSmmV55P6J6AJrTLTBCgzl2fFx7emAS46myctAr6YnD7H+yL rzafoU4B2/0/19QvrtsK/Fdn8uPPL41wVfqI5F08mYoZwABNuuMWUUcdhODdIexjYn0WA6eoUnw
 PbsyiUoAS8UyUkuyirKuu+Rqf3DbpqlSg7bruAINCMl4s0rY+TTDNwsvJ6D9TMveS46NrtCZetD 1fs0VDapuwq8LeWJ/79BF2D3MrUGvJpeq9lMjPmAFQlu7sRy3o6lZVFg0hkBrN0MT8/857KG+6I z9vy3ZHSgmsKFkRex50Z2i8EHCSamFz0DEOz/ziIMqXWdNwBf/IP9uGm2h8vD9OkHI9IV5r9YNi
 MFGYM91rZ29RsWbh/ynFTbKW+DRN9yuqnBgQGWnOoGyjIDmkhW6kWlvQds57jUoOeZyUKv4h
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=804 priorityscore=1501
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216483

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
 .../iputils/iputils_20240117.bb               |   4 +-
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
diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/recipes-extended/iputils/iputils_20240117.bb
index 3880689742..5ff5af8847 100644
--- a/meta/recipes-extended/iputils/iputils_20240117.bb
+++ b/meta/recipes-extended/iputils/iputils_20240117.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627cc07ec86a45951d43e30658bbd819"
 
 DEPENDS = "gnutls"
 
-SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https"
+SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
+           file://CVE-2025-47268.patch \
+          "
 SRCREV = "8372f355bdf7a9b0c79338dd8ef8464c00a5c4e2"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


