Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D50CD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:15:01 +0000 (UTC)
Received: from mx-relay22-hz1-if1.hornetsecurity.com (mx-relay22-hz1-if1.hornetsecurity.com [94.100.128.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7226.1779264898028153047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=RXYtTp9k;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.32, mailfrom: hsimeliere@witekio.com)
Received: from mail-norwayeastazon11023134.outbound.protection.outlook.com ([40.107.159.134]) by mx-gate22-hz1;
 Wed, 20 May 2026 10:14:55 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU2LJhHb7UUPSocsrW3SkR3isDZyToeiIjBFbjNvcUNW2hHt0EiwDpSe/dvgL3TtcrzijAQrB8uIsFn0ovcb9FNXeBNtcqbYmfzGRt3O2jpmej6jGgCcTu8I7ol/FZI/O4PMJfhhgbWgL8s8AxsN1fx7X26psn80+dvrRfS+8a3gX5fgeFI2nmPv72GzJqPf5wwbBbNlSoMoVTldJxdYEZQ8u9ipuGCvT4DGykhjNlRb9p7hU+vYA6ikp7H9d2gKhcS1cRGpwJP3C7XIBLilRn8JuorovjYONyv2v+fCXyNyg5OEsNuCMz+cRANaYKUho7TU96l+Y34h0meoZxyT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUziVqOathoOBD9iPDG2Pv3yjUlrOOzg+WpzZ2B5Q7I=;
 b=ZKRoHLpcvWJsdlyISQem/OGzgdYt6OPbN43FV3OmRTD98FHfppCXUDSiMNT/s3qdrwo84VrBIgxBbN8xP8XSe+vHwhqJUIPVXS3RhWehE5317kj6YVIfJJiUdto13whKmvlYnVcE4FkPl8bX5XeTC95WQLeKO4Zau0X1hAfKSCYcX3KmFJpG/4DCGoELYrk0ZOJ9Hu+lqR/FFQ5G0QsaeiDcIPuX1Q3SZpesv0uKXjotxdUCyRwMPdETQ5egFrZYS6F8c2HlkDO0FP0HMggW6vdgEUdYqgVsjIMVwvGQ/YjOiIaWF8O5ZE2WpG7LHwsOaVgIf9Y0YRc9ytbSOImPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUziVqOathoOBD9iPDG2Pv3yjUlrOOzg+WpzZ2B5Q7I=;
 b=RXYtTp9kKzeKT/QnlQtp8FcE7WD4pPl/dd6rIBQpzsbGHLLEHDOVD9zzlAg06Fp9VTZMbFMCXRW+9nPyGuBNiZHtzjy7rkUYWY97iSNQcOk1kOAb5lS2VSHWFQXIob5a9f3wYK91juCeoF4Er8uKr36NT8dwopsWdya2kbev64AT3TKd0pMZoKU4NulCSqqMeLtcu5zAni2vuEQey2CY3XCzYHubKHM2e8JEk7yjBcEMuxBSRk6wj/CMTWlLZe7YbmJ0wfEJAKP0g8nQB9vlf7yhDyoD9OcVd92AzvTodN3+caGjq5nRXZxnziIiiNjXql8t8FsXOAnNw8Mn2z3ZNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DU4P192MB2472.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:573::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 08:14:42 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 08:14:42 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 4/7] gnutls: Fix CVE-2026-42015
Date: Wed, 20 May 2026 10:14:00 +0200
Message-ID: <20260520081403.3052797-4-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
References: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0410.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DU4P192MB2472:EE_
X-MS-Office365-Filtering-Correlation-Id: 02384f97-aaa0-4a89-c1de-08deb647d829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|52116014|366016|13003099007|22082099003|56012099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	kSxC8mjyUF3Yek0NQNmG0FTtJQ8rVnJCZbQvr/jrydI1+BzF+TTxElIpkJBMmsF2UMIU+VUTUVasiRiKGQZUGNKM8zRQgIDsTQ1w+YcYHCv7t2XJVKL4l02NmkuATIfDE+twEFTinzB/TEvQTnVSIIsywGZbCggbIcnTpEb8gNH+/MXnft6dGazRo2fO0fPz+SFNcDCKCy1G17vHxuwDAo2nX0E+d2i9XawBqop1ilneq87z2sm0GHJaceUzSnNMNjXSgwJdYYtF2v9Adu/u3Qgj5urAE95nFMUyzgZjy+7tt3fEaAk8SI2CDGm/5yxddvl4qwhDTTHE9T7W7TMX8OnYzRVC1SR4kMglxx9WCW8GE7zjcuIZRp2PzBC/2I5szL44nVuMsYHWcM2BOnAih7YDg61W22rggV7OJTwlmY3b79qGawHr+lnneSdFLMBs2ZVo1c4Rl69L1JrhcWlsm+7zCfHjLaE002LHqdwdmW3mrfqf9CAwK+26L8oEok/N0lyEeViL+66XeUHJPqWhFhszyQkbxe0WzLnsNSAL1xSTIUavuLXBTJNN7csECrHZYP5Pz+eTgTRo3Z2PZs0tcpgQIVY70k3ofRAW0qSd9UnGAxodI1sDAetrxjGYGCj4tZc0tlc6SNlTF8VENybaLlfPk4xuev3RpPGOaOhQoOe58pO83h9VQGVhXVCnHc1E
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(52116014)(366016)(13003099007)(22082099003)(56012099003)(18002099003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ev83YQTEVTJrpjYJ1nI/RWt0dgBi73y3fxQyU7NoadiMxtUe89chp+WF3MNa?=
 =?us-ascii?Q?LomubuN0fFzDPMPEs4Nm1zrdH373FeCsobcKTaQrAtygps7WwurVxyqA0lR2?=
 =?us-ascii?Q?31fR2dZrx0QqGgGDtVIJ8NPbSAiiDd3kod2QsyVqoY/XTtmbVaaCvenqRe62?=
 =?us-ascii?Q?k01akxgOkZla8bBwaUbNN0QAO0MHOCWMeLTOqpDxqX8KDIYHXxH2DAOBPliG?=
 =?us-ascii?Q?F4c8THvlRi6I5ZA5P3efj/rFN+BENLjAEj12RFmznmZsuIzLIWq35pWMGmxb?=
 =?us-ascii?Q?D0HOAsleGcjLVZG4ks6zkrUxjedKWPA5FqwJJfUtPLtYSQ6BbCAyAuvV60II?=
 =?us-ascii?Q?XR95KFsJ74kIDvoZ2agS9LqZbVU1dKpBkRjYZUyAQFpLnjKZiQFJpL/lxFk3?=
 =?us-ascii?Q?D+KaRS8Y3lqZfdGwABgCqT415EDAaw5pP9eKr8vjvM8qLm1wIR89mbVkSUm8?=
 =?us-ascii?Q?QMhG/hkHNn01Ciff88UiMYnNjDY37M03TAe+SEBG1nL3N3ebDHcBEba2gUw1?=
 =?us-ascii?Q?K2mOSGjuYStTFFbFd4R475RUWxUh6rokB6gOGhzPIHvZ/27QoIgjRKYLbTvk?=
 =?us-ascii?Q?bfHkB6mfrtYRQuddKL99YPm/lBnSMyk35UEUJFXD+HGh3iJVbd3Ti1yzS9bD?=
 =?us-ascii?Q?jrLlw4N7OI42Es5M0Jw2hWQ5CSO9vd9NQe+yiNxZAcowRgR3o7jMfS2ngZW9?=
 =?us-ascii?Q?ZU1v3GzPv2IeWvep7Y9v7ZjiNg/WUU6F4wc5GhSyEngAzfsX20e2IQZWjWfX?=
 =?us-ascii?Q?E8lOlWkbK2Og2HZGHekE22JlVRwSK2U57OPXPWNtgnAzBLbK8Wq9GLePnk0k?=
 =?us-ascii?Q?1jx3OW1fcA6hG6zjRrMMTWqj2yH2X7TPWkGBsNI+1kLJ4H91VAQcbudLUFbL?=
 =?us-ascii?Q?bvscWEEIeFUwv03YExZjB5uraSVygyjzicxiPCsp26PlukXeVd870INMIM+L?=
 =?us-ascii?Q?MbL55r3M3o0zw4rZT0pqfa+pu33YcLkmKT3snJkOps7Dxh9yL3nYRln9JCD6?=
 =?us-ascii?Q?OO34HZjH4WkUYf0r/IRdJE5V0K0kpa916GA29OpWmi1OfO5cEJMD+jSogX03?=
 =?us-ascii?Q?ClAVo9pnyx+Rhon4o9mIMdQfcGij1BvfP5WEZIO6dd1nIWo2r1m+FfGC+2+6?=
 =?us-ascii?Q?y3b5JxAMmcy2e28CC9s1jSExpB7+zVm2QqvtjVjGQSXZwbcoid9pjpLkOLvn?=
 =?us-ascii?Q?nbuG8YFrzWqh81YXZ6veVnChpuO56zTAQ87DKlzQ/tF/KF9NAfZVixyMDoU9?=
 =?us-ascii?Q?HQ9MBq0aGInZd8ZIWXYQP5MUkAZenaGyVIqvXH06/7sz6y1EYLisIqms+Fhi?=
 =?us-ascii?Q?PFC/qbuPpZIFKX3qK09R70ltAY0EQkbxRZ6xDeSaQ24TPfiqqCTL1Qk1kDop?=
 =?us-ascii?Q?uDij6H7mHWiqMTzGuvrz2qKFqWQIRRGLPk9kBTJS7nybk1xOBVgOAW5DpeWz?=
 =?us-ascii?Q?wUnEBHsO737JF+RuKNA5qFYuLCnazksfCA/x2oBC+7CR8QL5t8SRF+kxT7Tn?=
 =?us-ascii?Q?T3ConnTBd4SrwHtwr8PDkAzePzDLaVJq87eHsIrGUa3LeGa7htavUeXRJRqo?=
 =?us-ascii?Q?ecqb8hfGJofJiTGSN3J2FZ7eJOBoebJ+Omozbt6WpHy04SW2O+Jc8/C1mqoc?=
 =?us-ascii?Q?5YSaljkK8HTMkkY6i0mwX7hlA4YUopB9OlHAyP+a4QYfIBo/7I3er8bLkUNj?=
 =?us-ascii?Q?pzpYPs6u71Rd6YMP4tg/o7mccc3y8NttCBxky5pCfZY72aHRB+QFQQfPzSi7?=
 =?us-ascii?Q?ITWaB2VaQ5LmCZLj2zgS9OGh9hOyWpDu0fV3TfLc0cPQ00O2pNy9pCHMsd2P?=
X-MS-Exchange-AntiSpam-MessageData-1: x4rboUtOTQ8kUA==
X-Exchange-RoutingPolicyChecked: 
	IOe+L7dqvTUdw4/nPeqzZrYKOJ+6OjqgORIs/RVj/zNEUzQg/z3KRRfgr8iy6wCZT/CBcA+4lde/vwDaOicC/YNgEBnaW70so4uxH1KWJYQugL1Jr0uAVW4GWc8/N8roRwuS29F+PZkn6Nj5xDKJeDce8k+xRQpQocYQ2+Njf2Zq+w4kt0wvfDll8ceoSjdEk10+rlLiQ7rBMyq3xMNGGH8PTsFzNApyLUEoWEfCgPlpSjgXY6ECYSh7caPCeU7TbfaaG2kWlUuMBfVYmlLUS6dV+/O34JmyJZ3Jg5QtMKlkKqKEep71922zEowB79u0zSy/ZoUWVxrAGkVAaPRJJQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	1uZZyaYpZwoGQBJL3+b6D1IERvUOzjeiydyfus1qJNVwyjc/kv3t1A3Ds5QJkslM8TT/MC4X/tUFFjpi4jl69exLCQrSt4FjTW/GUtx8tVFSN7JNtoz+/t6MMMvxLnAK8/29Uiv7kGekyYLn/ZBJDyVzTOfnUO7d78M9VIIG5QC8i7MyFo4Fgi2q5L9rVJ/pmcpvu9GOUyNYskWQcAzb1KolJAiU0rRcQa+FecsVvq4bdUEycIkVfLWOTElPvH5sD2QRLx0pXHGHfhf6Bi043LnROK3K23SoIccCJdyMCzWq15ZJsxG8z9u+iw2P+j9CJdIWsTjPJt5iLdm+QqaRYPmAMuHbsiRJ8rQoWRvbz0MbILe3enpDZxm410cAybTa+11e1K4iakS3sFp2pOCljMvtg4cUI8rvAsqWAGclVbSAHxzfctbacF3smrkYV6jZ4QSHKJUq8sw7j5FI/gmyfO8IRmGIL9g7mhD+Ln7MwiGyL4VUGDfIG6FdKurZhJMNOk8sWp0baEa20iL/xRPzBv8MGBPMGEf+TXOaCC1XffNTvhWjcWoWRsENeGdBNdlupqkCC+OVCBZXXwIm2U53k5J12/ZZkGnp4+dG5eX+VPyZGrwRH8hmaLthhR58yxc5
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02384f97-aaa0-4a89-c1de-08deb647d829
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:14:41.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kbdOThJ3+p8lab5NSHNijLFFBBsT4T6SLjDQMUH3b1N0y+y8CpldR6LscG8L2S/tFc3QXNJff8WRskCSpQh91A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P192MB2472
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate22-hz1 with 4gL48T2v8zz2Bdl0
X-cloud-security-connect: mail-norwayeastazon11023134.outbound.protection.outlook.com[40.107.159.134], TLS=1, IP=40.107.159.134
X-cloud-security-Digest: 27e3e6f74cf0db4885abb81c4d12ab1b
X-cloud-security: scantime:1.771
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237395

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as mentioned in Debian report in [2].

[1] https://gitlab.com/gnutls/gnutls/-/commit/a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca
[2] https://security-tracker.debian.org/tracker/CVE-2026-42015

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../gnutls/gnutls/CVE-2026-42015.patch        | 50 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch
new file mode 100644
index 0000000000..dfc3506ccc
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42015.patch
@@ -0,0 +1,50 @@
+From 264da2a72033ed8890105231e5d36263d403ca60 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 20 Apr 2026 22:42:20 +0200
+Subject: [PATCH] x509/pkcs12_bag: fix off-by-one in bag element bounds check
+
+Appending elements to a PKCS#12 bag had a bounds check that
+prevented adding the 32nd element.
+On the other hand, it is possible to import one that already has 32.
+Subsequent appending then led to writing past the 32-element array,
+smashing its length.
+
+Tighten the check to reject any bag with 32 or more elements.
+
+We'll treat this vulnerability as a Low due to how contrived
+the requirements are: for the code to be vulnerable,
+it needs to append to an imported untrusted unencrypted PKCS#12 structure.
+
+Reported-by: Zou Dikai
+Fixes: #1840
+Fixes: CVE-2026-42015
+Fixes: GNUTLS-SA-2026-04-29-11
+CVSS: 6.1 Medium CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:N/I:L/A:H
+Severity: Low
+
+CVE: CVE-2026-42015
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca]
+
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit a3e7c50d3e1761e5ef1d4b225507cab8f2b2c3ca)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ lib/x509/pkcs12_bag.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/x509/pkcs12_bag.c b/lib/x509/pkcs12_bag.c
+index 911aeff93..38228613c 100644
+--- a/lib/x509/pkcs12_bag.c
++++ b/lib/x509/pkcs12_bag.c
+@@ -375,7 +375,7 @@ int gnutls_pkcs12_bag_set_data(gnutls_pkcs12_bag_t bag,
+ 		return GNUTLS_E_INVALID_REQUEST;
+ 	}
+ 
+-	if (bag->bag_elements == MAX_BAG_ELEMENTS - 1) {
++	if (bag->bag_elements >= MAX_BAG_ELEMENTS - 1) {
+ 		gnutls_assert();
+ 		/* bag is full */
+ 		return GNUTLS_E_MEMORY_ERROR;
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 69f90a3c01..20946c1030 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-33845-pre.patch \
            file://CVE-2026-33845.patch \
            file://CVE-2026-3833.patch \
+           file://CVE-2026-42015.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
-- 
2.43.0


