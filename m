Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A95ED72370
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 10:36:37 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64563.1769164588622447677
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 02:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KtKwuljT;
 spf=pass (domain: est.tech, ip: 52.101.65.14, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nd8ohNrMbOlxBuUacpMpzyTKC3d9jxwIuAwwyEWhSlW+PkoBr2/3u1q+xbcwO0+6Uq70PesBl3ZEUPhmCBG6V61jc8Jcqz3YDeyc7hoH1f+9Ugpsv+Gu4tp6fq/AxyMFKIQWmZ02iYmY1hY4I9TlJjTsVlHIB+JwJtp2bqD3dFLiSUmWlzKdkZIpKMRfiZBpEW4++5LdwvaetpQevmbVcWU6ZsDQ+RMi6UrNm7GqHdi2/PsukVVTVzojeab1p2D+GGv4MRQvHgeuWNNh5ARWvGNnPge/+/Yb46SWEfZ2kzY/MwqyjoGX1rK/XEaWpiD7d3Op/I/zmd7tSXQtnqz2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKnaYKCkTMB7R4CZZR2EH61ZhKDaG+8Y/dt3oxumT8M=;
 b=syn8j1vcoCDKjOhlHzWDfnz/fmVfk7OFVg/4z9/8Zl4C1Z2pOM5F1S5VFCLVs2dgdPy+GzxVMsSwtrKZVgKQBQyQ+XgKzptb+eTuXCL9TWOij8Rtn3QCXw3CRB3AfqJXEOs55xdZT/ZPQbjqlvCNyxhNfh5cebfc7jI/f5+Uuhp0awvo9bH9rAPfqc+4VhMnTlOyRQ+k01/HCCBwt78lLDwLWGC4r/NVNdRVhj73g6lL7P1c9DCb1sSdeosQ8SMoFe9sig8FIy81J8IHpawqGfcawgri1dHA+Dj1D9ixOi26Nb8Yd/a5yse9MQFbKkK5WwshKO0HMFHzP/ov/Ndapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKnaYKCkTMB7R4CZZR2EH61ZhKDaG+8Y/dt3oxumT8M=;
 b=KtKwuljTE/QGui195KTV2So3hDbcB0Dc05Lml3wUsrd9dQy9nRyg9xlJM1r/CA3S1LO/KS4gWbQ2KXDI1mSBmKd3KleMxqcNf08FY+qHJ9kO7AzkJHm2GcBWT+bi0LKd9Fs+XlwzVLd0R9OLIjXL1G1G2m8euJDFSZQU18+DljjRbKrFkhrISREdfi4RBRdFSYxCbvnvKLrkMNE2xAy1TCI6JsCB/RDpTfXs3j4QFjqPncHv+t/0ZqV/NArdUMfmHHVbryW1/SYUQjvBG8HXIV5+oXas6YWdEPp1/4Ak78Qz8EjOsAoHq3FlUIidxUGtHbZ4vePnexMdz7qMalQP/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by GV2P189MB2305.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:36:23 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 10:36:23 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] avahi: fixes CVE-2025-68471
Date: Fri, 23 Jan 2026 11:35:49 +0100
Message-ID: <20260123103610.32043-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::31) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|GV2P189MB2305:EE_
X-MS-Office365-Filtering-Correlation-Id: b60bc284-b0dd-487a-1760-08de5a6b4153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EMDvWukxEtsW8ssfmArHjta73913widpt/BEcSIXCyEyyDcgXaKq18+tcBxz?=
 =?us-ascii?Q?bpfZ5reYuVTPxoepfbfKNFBtEWsLnvgXITPhDnkpBYxdldMmL2gwUoBmk20J?=
 =?us-ascii?Q?oY4zZWxwHVKx6LZ9PMPNnejKQphKAjDmERnKZeT+f/gNc3BOYTaYxl/8bfV6?=
 =?us-ascii?Q?uOxMzzzvEHxC+vJ8xP4zNuoB46IQeQ6sKUigSaepRSYCZSVQwK9VgNyAWTVG?=
 =?us-ascii?Q?x7bt28lfDKz8ryLNFHVeEUnL/IN++mXrzcWqY2L8Zkuv7ehN4nb6TJhVWrH0?=
 =?us-ascii?Q?lie/XNOiPWFHhna+JKgSNVJD/oleelL1qPUPkObCwvDaIl/fhd/TgLyeNMLk?=
 =?us-ascii?Q?rPjkG49AMZzPtP9UWrzoE2VFYrIsry11kYP54WGaRAouehOZ0ylEOXwHkreE?=
 =?us-ascii?Q?bFx4yVk7mcMDxKb4QjnoleCJmFNbT0RyhvuKq2BpZd4KReqtyR7sh28rQq3f?=
 =?us-ascii?Q?jMPUbDnkXUHs9J3HSgjiX3XliCP7ak7i1MdPA1Rl37z18TjT6HJm/arg6s9w?=
 =?us-ascii?Q?NrSXxMLt7rvUsrWiXQSWGVoXJ+CZ7O0doG+9hWPsXWam1WMiup9gZ5mQgaSK?=
 =?us-ascii?Q?UORcMOtkQhH1y3Mjb7Fm7lyoDkIrkPtkxkXUSePm7wudtYQBK7xVq5UL8753?=
 =?us-ascii?Q?AJ/ds8PGi9pmExsTrd8AjuqnUjvOvSq35KmKTmp8TAGkKdN3Vhu0i3kznqhD?=
 =?us-ascii?Q?I2wKVAGhLKHKjFQlXXmS3VkK4kD0GiZQVfYUM71qq9UebDNee71t9ZyM2W+w?=
 =?us-ascii?Q?VWN6z0S+nN3CPwwOL0gER3zaQPPhGNozIxOszeOvhUy2OmX0u0+XvpfkaJ7o?=
 =?us-ascii?Q?M5E3uERokpi7v3XsOlPRFNQnVzVzUOWZrdbVA2YgOS5/xIUez126mE/2/L7Y?=
 =?us-ascii?Q?pMrmScoHhB8fxCyC4fNwT+Qi6Ss7sog/hKKyrGDt+NG3Y1JmgYEwDzi+/vMO?=
 =?us-ascii?Q?YsTNjBDEme/zkQekndRjvIsDnP0t8SImPFlfk9Q4jnEPgS7ji+FFPKhojaej?=
 =?us-ascii?Q?id4byVGxb+orxgeFfL5yumdVolxk8vpZy/hezBia9jXk3BCnqGEZqo2ctbAF?=
 =?us-ascii?Q?AKCPXkcQqbfEzYBtsxGmhIQtQvP7gyYmlEggPDglkPNSqah5bhVB3tsB69Tv?=
 =?us-ascii?Q?7k4wvnOikwfwZdThqIeSQyc/pcUHmgH/hfb6sZj3igsyzt41RfXPZ2ykQhJL?=
 =?us-ascii?Q?aumlY9HC96Wz8gfp2hi9ZwE3+Qtlip1NkT+XCsdo4RHxRrNnrsK+K+QO36pv?=
 =?us-ascii?Q?PAqj/VpTFHWKsXWQrszDPYpP+oVyChthy/v3V6O9Ee1QyCQtIMyRn0HZKabm?=
 =?us-ascii?Q?1CjQ7tvdzsXzXgsY9D/jUhGGTB89f/4SG+aCgE04fOhrSXNXHYz6XoYEuAxh?=
 =?us-ascii?Q?UUPmcC/whsn+iD9QNGWN7t5IKHBdlMq7Ew+hSrwOxGJyy0+mA36Y66vkF9cZ?=
 =?us-ascii?Q?1t9fHN68LcnY8XwpLd/RWJ5QxYY3kPVBwpmVUBBbx0qJPkENN8EB72+P8W5A?=
 =?us-ascii?Q?vbB8rTmo5Uwm0JmBvvuWyQKORk593wY/fjgYcg31QxK5kDDofnOWhE6J0pWZ?=
 =?us-ascii?Q?jGULkCpz/5qg5KBXg3y3taR33+Kav/LI3cTYUYqB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GeAEAsryfSwL8Q5WXzwS0YFdeRRqcnBA0XZGEeVySP4cntlUx2Kqx8zakElL?=
 =?us-ascii?Q?CIBQQmG1peUiaBxkgDo6UXa41YfSMY6Yqh+FPM4reHORkfWZFBXSAkRvZxfc?=
 =?us-ascii?Q?kljNs6LJSgLwmWeY493oo61KQ1MUr/x9NcgaPko46LGB1+2w8941J3vKsC4C?=
 =?us-ascii?Q?ht8BxBqM+U/ncq1WIkK6tG6Jg5koIkLK9JWIK3Twxcwj1UmkQF+jyDc2TuSS?=
 =?us-ascii?Q?6s/VhdPXJYFVUjEKKrIucio4uKmIX1i6XHLak0VTVEbfuogXH8yLU6XXnIDj?=
 =?us-ascii?Q?PxhE0WsYofEvTxb1c7y8nzgu+E9ZAaLthTFjEn5wKYvmfVcz8Jhl1rImZJmn?=
 =?us-ascii?Q?p/MMPcddhJjvu70GgJfj9mf3+bDv4SH15e8Lxixkkf4qVMdGthtpIfq5W8Po?=
 =?us-ascii?Q?1BaWknV9OUCDNp0KRmnNVuc8j6LOOkUAzpZceRJzOpeh1uy6Yw34BLxmWo1T?=
 =?us-ascii?Q?m+XwBjDIjecCyhX9WpI/KoKwEzxJUqfn2wi1vSIN0Qt0dw2Quw2Wfd/3pkdU?=
 =?us-ascii?Q?tgPgPcA83GGKF50zDEZU1wNQkQsuZ0y1zYGH0fbrTuN/U2F9IWcuxqLMJ8o2?=
 =?us-ascii?Q?JacN7LPXwKuomHdg8vGfY1UkLtSIZ4Q1Fyf1oX4gfoE+/2h4bFzpD2ZTPdG+?=
 =?us-ascii?Q?7KnLk/774p+F4/fl/SvIxsu99Ut1evNp9TzsVeHLzW+1+39xvoU9OvXGx5wi?=
 =?us-ascii?Q?T8kdOJ+nIbBg3g6Fbq4ocY+bssA99aB5frhgjgJU6WVBjRm0hN5aHv6++x8x?=
 =?us-ascii?Q?B86/EFMXUWv2OymtZ5RfqnFH0OGh4iLlOVtyfpzJVIby5YAYhbbSSROtD6ZE?=
 =?us-ascii?Q?SkylLZYcTUUDdKq1zw4uMzERMTS6orApSXHAho7tMcimueaAKUqyOmFnIh4K?=
 =?us-ascii?Q?1EszoJr9FiAKN71Fp7rPLQGkWMVFS32Kv6Q3DLDQGpTODjWn3vHNwWxgZ0Sc?=
 =?us-ascii?Q?TTwa9P4udCUcorbjPN2avSMcmjiSm0I8OPO39o9ROxIxKic5KE2CFkY5E3MC?=
 =?us-ascii?Q?B/Pog6bsSNYEd5rp248RLWGci26hNriPQ8151zr5oFM+P5WxjHyNlNHSQmfU?=
 =?us-ascii?Q?mrCFdIda9DPCY0wVYLYCh33DBpmAD3pW3LVPfGXFcWxYXDvZL/EQIkZ0mP4q?=
 =?us-ascii?Q?FZl+bTtrZVx65caGQgmPUnEqfWCXNDwqSYlNlXAjV/CkINflIQBpiwP6bZBY?=
 =?us-ascii?Q?YmJzI5oFTPYJR7XkeB5O1B1ly8OGYvRtiytx9N9pWW7MmnGH5ti+fDPuG1cl?=
 =?us-ascii?Q?Ju5ozSxNqdb/wQP3X+K+vtwfSMYY7wVIN7shoOxmSsBQP3hBlg8VaTkXs37N?=
 =?us-ascii?Q?nUKgDv4tTij1Ox5U4rWz2Rk2e3Lko6rVZpHtaB6tgZgbPRdvKLLqe8Ya1fem?=
 =?us-ascii?Q?KsA+y8dd1t9WnAfSiL0/PnVhOT0oi76CugWe7KSlg+H/iNKP5ZqD4wMtTf7L?=
 =?us-ascii?Q?AEPw/aSHbwfFNpc9Y2AJo0mY32ZDmMyifZitoAtr72QhuRSt9vs2a4wUseEC?=
 =?us-ascii?Q?2ArZKw6WBaWRlIYwou7w7Yb6TZ+j0GDdaBkex6k8K/knIUfOhVhuT9a3GjWf?=
 =?us-ascii?Q?x2oRXnYmUGp7i2BPxAu+08amZTDNjEpQHVgjCkT6lUwyRmN2/uerqLMRwHY4?=
 =?us-ascii?Q?m7FVzrtBnTL689PS+zJ4BhuI/BTeU8C+pdg66/jeo/hIwbpPKMWouQQUue8P?=
 =?us-ascii?Q?cdlURllb4GUJuPx8KJOB5tCY0ac5q2vWe46D27R1EFwQCAIpmb4MXjNMSpbS?=
 =?us-ascii?Q?f+vr38QSgw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b60bc284-b0dd-487a-1760-08de5a6b4153
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:36:23.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opsvxITDwRKpixLsFfeXbUw+fi7PUhbTXQ4aP0Zkj/U/N8L8WwalQ9Gf8rbHyhogMA5cnZ3kCdshTCAM9KkvEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2305
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 10:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229880

From: Amaury Couderc <amaury.couderc@est.tech>

avahi: fix DoS bug by changing assert to return

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68471.patch          | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.pa=
tch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index 7930bd3037..ffda85c0e7 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${P=
V}.tar.gz \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
+           file://CVE-2025-68471.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
new file mode 100644
index 0000000000..210565cdd6
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
@@ -0,0 +1,36 @@
+From 4e84c1d6eb2f54d1643bd7ce62817c722ca36d25 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by changing assert to return
+
+Closes https://github.com/avahi/avahi/issues/678
+
+CVE: CVE-2025-68471
+
+Upstream-Status: Backport
+[https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c54c=
c0aa1]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ avahi-core/browse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 2941e57..86e4432 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -320,7 +320,10 @@ static int lookup_start(AvahiSRBLookup *l) {
+     assert(l);
+=20
+     assert(!(l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) !=3D !(l->flags & AVA=
HI_LOOKUP_USE_MULTICAST));
+-    assert(!l->wide_area && !l->multicast);
++    if (l->wide_area || l->multicast) {
++        /* Avoid starting a duplicate lookup */
++        return 0;
++    }
+=20
+     if (l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) {
+=20
+--=20
+2.43.0
+
--=20
2.52.0


