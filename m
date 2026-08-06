Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F2EC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:08:28 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20177.1786025301193012831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 07:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CT3AdU6u;
 spf=pass (domain: est.tech, ip: 40.107.162.44, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoeQZcRcVljWAaSz6VlaW5TvTa/VfQ4kcVu237SXUw1Yj9lt3caM1D49+2/l/X7PPXAGQkgAO5EloG1ZU+kM9G8wd7T1guPGp9+qkGDAfu2t3wfOYNI57WBTv06N8j8RlJaLSE2QwMjsXIFgNd3Qh5+Hk4P646s6ru8tEJ/x7uO6B/y+wa/sdivq12L+iCpCBPD7xH2OuEssqwikSyp66WCNgAPRbsRM9NPBnirTC6dzQQVD4+vd+7CKnT8BDTI1WPByp/UQbIYax+Jki/g7vduPK3x/DLQdHNztHJB9uIceNU9WfKX+ak2i02k/7fLOw9zboESX2eHSOjhI9fmTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjh/GvBX0OiPWSDskUIG58vN71/PiDpZRFHpTLJ1wtQ=;
 b=hTPBYGB33NIyuJWiAzoVEGhvXF338Ex32dnh2b4XZKW7ik3682Sg0IYjtto8h+hfK2cBH+8PP4U0L1t2+LikRGFfr/X3aUh9pvSFzh92EXN92s9E1XdWcYreSq5/L5Mow5DFQbtgEp0Q3QbU3NVtrjtrfYqBZ/gigsbkpXPmlHWns6wLUxPqZpeoe8r/iYow1Kz8ejvG/NRWA/Kni9wfQWHQoKGSXvdR7VvNEj0/onuvPfoufBMb+h4fqyAN00Gf6gagXCuksfRjBDRwZpbQOCjSNlyZ9Bb8CcngdFRIJwpH8PiQUlQtup6dyb2hPdvdbZBjoCBdHpK4+N5Ez/HS5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjh/GvBX0OiPWSDskUIG58vN71/PiDpZRFHpTLJ1wtQ=;
 b=CT3AdU6uLz9MAw95lKKlJysapDj1FAXqFR1bhewed6w8sI+/e3zUfkcqxArmZVGGxkbjjmHfLZ3jd8YXQLvQR5X9Xie18urAZ0Jys0zpMBlT2EvztRUoEwrunLIN/sQtC2WhT5fXjNjUlENM74aeZdugLjlNz/h//NqjGsl0Vbwd+D0OXhDDDix1nHZFltcF90PIWviLXegCqeau+bR8bc6ZHCR9fLhuwl+T/lOQXOlmzB0b4Y2cHMT53H/j1XgoWFDzoYikoUqLhOVoVeA4yC1z2MmBvq8VbkW6ISBnIbcd0kssHojPidboxhh8/jX6CI1I8NP59WQ3oewOFJctMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB1992.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:507::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.6; Thu, 6 Aug 2026
 14:08:16 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 14:08:16 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] dhcpcd: upgrade 10.3.2 -> 10.5.0
Date: Thu,  6 Aug 2026 16:08:09 +0200
Message-ID: <20260806140809.27090-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB1992:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ae2375-81b2-45b7-1695-08def3c428e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|56012099006|10067099003|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yEiXMs3k2FKPq9JTutEwolwW0RYgUel85GIh+qrmEOzXZ+4SmB3t89u5QDED386uWr/oc25RjIeP9FueaaYbyXh9j7YxfQcR/dt+HnEhlSth34ThNuAr/+CDXMpK6PXRqtdMvMVRHdbPL4QZq81obrvykCt0jdmSS55c0iB7SmQbjoSuYOCUk/b579JVnTwcUqb8v89QFcZej1Zpp+xa4gt2X0II+LQvKI2c/OvIgv7/1BFIpIokxdoy3mgW5uocERzecKOpb1l4wuM1g0bkG6ow0aSBwEZqCdFqDkn7U7Ft8297yC28cEyu4pWbJQRDZJXzxVwK9+8wPYV2dTfCjVcn6B1lP9Usul4kchq06ut8Nv0OSG92Q19/A1dXaa8Q7mL2fpHkHlk3J9D7s+2Fm8KlYaSFO3xM/Y4njVtiqego9EY29Yrfy4mmqMqTZ9FqAaHQxK6DQ/p/qRwZhyOdhrQvUXqSLyyAcx/s/zTbnJW3TSYHM+Sexsb7fMTssboCuW1uuwJVFa1nmNg7sTYVF3B9keaqJRI5CLnl7x7v6AjYEl0h5qGspnDon+TPvJbHi3bxzb3mqFU1x6cVaVqAS47c17u2NoHwJlG76awC7yl+GexDCCz7wRfnrDTcOKvpOfzkgA90xezPdlY42a5sYc/k954RUjYDfXliaxjmT9M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5B8iUKmmvBHQWQemDNKfuk44vxYifGNKDETenXDJjeoStcb7yJEdzJad7m+p?=
 =?us-ascii?Q?OhGUEedvRw9AiDxRJtm6rfNjHZIdJ7pfbwfCA69c6ym4GxC7ZjU1rM8RnNuK?=
 =?us-ascii?Q?hXOaJF8etsIRc+FsHxzDbBJB4yD91ouedTZ9eITQccT0a9ByivofzAXrJGmd?=
 =?us-ascii?Q?Ch8Jw6lIL5UuYdEdyiWgEafMtQM6jCle61MZ3PzmjdjOpfLD3kz1huf89Z3K?=
 =?us-ascii?Q?TVacstjGy++09uMbcxzUeSRIYgbHQ7nPTlhdX4vMg46nh/JrguFFReIMEkBT?=
 =?us-ascii?Q?2vkuexFtTbfg9SjSdq8329TeoEw6dOe5dvokLty4meLTIEq+Z5djNeiE+V29?=
 =?us-ascii?Q?t3jUovcLeaI1WqLqtuzz2NjN0TbJDyNcOD0TE0Tl1ZpES0Z93/Na+sEYUfwO?=
 =?us-ascii?Q?XRemn/cy6z5vIw0rYezn3lzZpR0Rxd3vJOaKf0z+Q4oI39DSD8wVI2jv/3TK?=
 =?us-ascii?Q?gEHL7ttDIIfzD+adTfAu/bYXlYo7rMX2T8dfM+qq1UB6oMNUFGJiG/P+ugmw?=
 =?us-ascii?Q?eGRvt1WS2Pk7OWHiFBGDbcQDY1724q9Wp6WBpwe3QghGSmt1zMo1e1rHvgSc?=
 =?us-ascii?Q?o6qWsXd0/SjNJ795jvQ6Eca3RefBVrZtm/be9hvO2R1oVyy8lx6ixmWpgFl5?=
 =?us-ascii?Q?Zff+7w0ET4v+S79PGvX+9RMx3csR2vHAPdMxq1t4MflATpvXl9NVrGczGgbc?=
 =?us-ascii?Q?Mq2K7UYKcj/SVh3z8n2ThanllGX66F/iO9A7eCLVEkidyTTKiK+ki+YvFe41?=
 =?us-ascii?Q?QqwCQlvcENchp1ILUBmJCxmj54ohKj8TNwpdFcRCVOO09/Qhh+FUI5ixIevP?=
 =?us-ascii?Q?TRdENJFTLkxwb9d6kLHuNPC6KjQmmRP5xPlyy6bncnLxfy23UsNJBzy0jEEl?=
 =?us-ascii?Q?pM3NbTM3P2JPQezeiTAKRsvn1V5oHwTWLW5p0wJJo4LIj640d90WYbPEQI1T?=
 =?us-ascii?Q?Hav1k+6Qnqhz0puYPyEnBxSuMOmyYH79hcRwCE6M7wZsbegRo91vK4rD7d2I?=
 =?us-ascii?Q?sMwON2IKkYx3Wj/G2/GW2d0hdmTW7NaEYTppO7lARHW0vS1BnDxhld8SwdvU?=
 =?us-ascii?Q?pLa4cK6J/V9z4BuVR2gGbgpo25LEOsuOGXZKFAm4PIHh5BjTa/Jl0ZPVvEnw?=
 =?us-ascii?Q?GA9SY0hIKEU2Rx/kHJE8R3iSsKM6f0q0e5K9UN5alSHpN+qhbbd3FUvLE4P2?=
 =?us-ascii?Q?RtVASr/wLlIWmgFiXtoiTzQDZy44MW6GuwFK/F3X75zkv2a99XV/cOrr0fPB?=
 =?us-ascii?Q?p6U7AqmT6Z5q59TfSvffpVKAGnu2QBkqGmxI/IdRAw4J46jHgOQDwfGKZhBH?=
 =?us-ascii?Q?FYV4aYyX+yOYIXudOpAO0kKPkcM0YHsoNXM4IxEVDmVuazKAiTZ5zegSWNav?=
 =?us-ascii?Q?/569Ck+Pcjzj6Pk65cG3JD3TshpTrbmh61b2mhGh1oW+CkHSappuVYVfuf0i?=
 =?us-ascii?Q?LH4Locw3LBKnvG9kxwMi5JwrAHHVm5eI01BBjbNibjQUlS4IxCfsHiG8nn1m?=
 =?us-ascii?Q?IJm3ykmtw/Ua9o4gjDkWQ1h1NVP8g6gW6A7WgJUFsvOK8yp6hbTAI5VbwVDF?=
 =?us-ascii?Q?NazQcM+dY6czrFfmNrMpFdw+M/G3/32vzetaM3FbA/rOAec+XY8V+81aiH0Y?=
 =?us-ascii?Q?SHfg3dEyEc9txch9TTrQ7hrTvwMlK2U6zv2UWcDOGhc/giX+lfZrvFx+0PvM?=
 =?us-ascii?Q?KmyEOYTDEVRedpKVP7ez6pN70sGwNSUcMsCBFsIzfd5p03E+4n8ux9E/JPLG?=
 =?us-ascii?Q?WiNRxSQY0g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ae2375-81b2-45b7-1695-08def3c428e6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:08:16.0305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: II9PGRzCoNnX1W2mz5nVVhXzXkthf3+kdYROF2G5JtpP+1crKht0LI+PI1nU/tEFv4+GSEkQ6HfixXxwGs/9L6DIahpz/BmdW2iAJGNmbU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1992
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 14:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242946

ChangeLog: https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.=
5.0

Compare with 10.3.2 to 10.5.0: https://github.com/NetworkConfiguration/dhcp=
cd/compare/v10.3.2...v10.5.0

Drop backported CVE patches (now included upstream):
CVE-2026-56113
CVE-2026-56114
CVE-2026-56116
CVE-2026-56117

This upgrade contains below CVE fix:
CVE-2026-14258

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{dhcpcd_10.3.2.bb =3D> dhcpcd_10.5.0.bb}    |   6 +-
 ...mprove-the-sitation-of-working-with-.patch |  14 +-
 ...-conflict-error-when-enable-multilib.patch |   6 +-
 ...e-INCLUDEDIR-to-prevent-build-issues.patch |  10 +-
 .../dhcpcd/files/CVE-2026-56113.patch         |  92 ----------
 .../dhcpcd/files/CVE-2026-56114.patch         |  34 ----
 .../dhcpcd/files/CVE-2026-56116.patch         |  31 ----
 .../dhcpcd/files/CVE-2026-56117.patch         | 167 ------------------
 8 files changed, 16 insertions(+), 344 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.2.bb =3D> dhcpcd_10.5=
.0.bb} (91%)
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.p=
atch
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.p=
atch
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.p=
atch
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.p=
atch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb b/meta/recip=
es-connectivity/dhcpcd/dhcpcd_10.5.0.bb
similarity index 91%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb
index cc12b4a005..73f55969cd 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb
@@ -15,13 +15,9 @@ SRC_URI =3D "git://github.com/NetworkConfiguration/dhcpc=
d;protocol=3Dhttps;branch=3Dma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.pa=
tch \
-           file://CVE-2026-56113.patch \
-           file://CVE-2026-56114.patch \
-           file://CVE-2026-56116.patch \
-           file://CVE-2026-56117.patch \
            "
=20
-SRCREV =3D "243ad84ac67a87d631ff7eb83b2eed2727acebb5"
+SRCREV =3D "1d608519abb398006b77f11c7b720147adf4cfcc"
=20
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-imp=
rove-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd=
/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 7e04b5c303..04c1d92897 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-th=
e-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-th=
e-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From c91f9cdc0ef56fa64f6ffdd811cc5b0e41991b2e Mon Sep 17 00:00:00 2001
+From a3e397d3764fdb779e2f995b690ba365956612f5 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with syst=
emd
@@ -27,10 +27,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 13 insertions(+), 4 deletions(-)
=20
 diff --git a/hooks/20-resolv.conf b/hooks/20-resolv.conf
-index bd0b0df5..9c7721de 100644
+index 6aae9cc1..0fbcc9e8 100644
 --- a/hooks/20-resolv.conf
 +++ b/hooks/20-resolv.conf
-@@ -11,8 +11,12 @@ nocarrier_roaming_dir=3D"$state_dir/roaming"
+@@ -14,8 +14,12 @@ nocarrier_roaming_dir=3D"$state_dir/roaming"
  NL=3D"
  "
  : ${resolvconf:=3Dresolvconf}
@@ -43,9 +43,9 @@ index bd0b0df5..9c7721de 100644
  else
  	have_resolvconf=3Dfalse
  fi
-@@ -69,8 +73,13 @@ build_resolv_conf()
+@@ -72,8 +76,13 @@ build_resolv_conf()
  	else
- 		echo "# /etc/resolv.conf.tail can replace this line" >> "$cf"
+ 		printf '%s\n' "# /etc/resolv.conf.tail can replace this line" >> "$cf"
  	fi
 -	if change_file /etc/resolv.conf "$cf"; then
 -		chmod 644 /etc/resolv.conf
@@ -59,7 +59,7 @@ index bd0b0df5..9c7721de 100644
  	fi
  	rm -f "$cf"
  }
-@@ -179,7 +188,7 @@ add_resolv_conf()
+@@ -182,7 +191,7 @@ add_resolv_conf()
  	for x in ${new_domain_name_servers}; do
  		conf=3D"${conf}nameserver $x$NL"
  	done
@@ -68,7 +68,7 @@ index bd0b0df5..9c7721de 100644
  		[ -n "$ifmetric" ] && export IF_METRIC=3D"$ifmetric"
  		printf %s "$conf" | "$resolvconf" -a "$ifname"
  		return $?
-@@ -195,7 +204,7 @@ add_resolv_conf()
+@@ -198,7 +207,7 @@ add_resolv_conf()
 =20
  remove_resolv_conf()
  {
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-confl=
ict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/fil=
es/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 9d3065a48b..c2afb83b54 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-err=
or-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-err=
or-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From dd892eba0147120efdcae923746c444a9d2a76d2 Mon Sep 17 00:00:00 2001
+From d3e517be04e660d72233cde91b44c3cf705126e2 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -29,10 +29,10 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index ebbf06c0..c7ffee6b 100644
+index 26d37772..1b13dc4e 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
-@@ -826,7 +826,7 @@ Configuration file for dhcpcd.
+@@ -825,7 +825,7 @@ Configuration file for dhcpcd.
  If you always use the same options, put them here.
  .It Pa @SCRIPT@
  Bourne shell script that is run to configure or de-configure an interface=
.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-=
to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001=
-remove-INCLUDEDIR-to-prevent-build-issues.patch
index bebc79831d..69ebc6026f 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prev=
ent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prev=
ent-build-issues.patch
@@ -1,4 +1,4 @@
-From 0775eb1b965bbf9b0efb0b1c42c3adf3d8cd31cb Mon Sep 17 00:00:00 2001
+From 278ef78e007ab74c701961e108262d9d733a3975 Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,10 +11,10 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.=
com>
  1 file changed, 5 deletions(-)
=20
 diff --git a/configure b/configure
-index e9c08f18..3f0770b7 100755
+index 32bf96ef..ab4aa901 100755
 --- a/configure
 +++ b/configure
-@@ -26,7 +26,6 @@ BUILD=3D
+@@ -29,7 +29,6 @@ BUILD=3D
  HOST=3D
  HOSTCC=3D
  TARGET=3D
@@ -22,7 +22,7 @@ index e9c08f18..3f0770b7 100755
  DEBUG=3D
  FORK=3D
  STATIC=3D
-@@ -89,7 +88,6 @@ for x do
+@@ -93,7 +92,6 @@ for x do
  	--mandir) MANDIR=3D$var;;
  	--datadir) DATADIR=3D$var;;
  	--with-ccopts|CFLAGS) CFLAGS=3D$var;;
@@ -30,7 +30,7 @@ index e9c08f18..3f0770b7 100755
  	CC) CC=3D$var;;
  	CPPFLAGS) CPPFLAGS=3D$var;;
  	PKG_CONFIG) PKG_CONFIG=3D$var;;
-@@ -346,9 +344,6 @@ if [ -n "$CPPFLAGS" ]; then
+@@ -356,9 +354,6 @@ if [ -n "$CPPFLAGS" ]; then
  	echo "CPPFLAGS=3D" >>$CONFIG_MK
  	echo "CPPFLAGS+=3D	$CPPFLAGS" >>$CONFIG_MK
  fi
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch b/=
meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
deleted file mode 100644
index 14095685ed..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From f0e7f32646004a472f8322bcee4a38416f88a130 Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Tue, 23 Jun 2026 02:17:10 +0100
-Subject: [PATCH] DHCPv6: When deprecating addresses, restart on prefix
- deletions
-
-As that might invalidate the next address to iterate on.
-
-Reported-by: CuB3y0nd <root@cubeyond.net>
-
-(cherry picked from commit 5733d3c59a5651f64357ac11c98b4f39895c8d25)
-
-CVE: CVE-2026-56113
-Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/=
commit/5733d3c59a5651f64357ac11c98b4f39895c8d25]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.=
com>
----
- src/dhcp6.c | 21 ++++++++++++++++++---
- 1 file changed, 18 insertions(+), 3 deletions(-)
-
-diff --git a/src/dhcp6.c b/src/dhcp6.c
-index 91341994..8a8a20a0 100644
---- a/src/dhcp6.c
-+++ b/src/dhcp6.c
-@@ -2593,12 +2593,13 @@ dhcp6_findia(struct interface *ifp, struct dhcp6_m=
essage *m, size_t l,
- }
-=20
- #ifndef SMALL
--static void
-+static bool
- dhcp6_deprecatedele(struct ipv6_addr *ia)
- {
- 	struct ipv6_addr *da, *dan, *dda;
- 	struct timespec now;
- 	struct dhcp6_state *state;
-+	bool freed =3D false;
-=20
- 	timespecclear(&now);
- 	TAILQ_FOREACH_SAFE(da, &ia->pd_pfxs, pd_next, dan) {
-@@ -2624,11 +2625,14 @@ dhcp6_deprecatedele(struct ipv6_addr *ia)
- 			if (IN6_ARE_ADDR_EQUAL(&dda->addr, &da->addr))
- 				break;
- 		}
--		if (dda !=3D NULL) {
-+		if (dda !=3D ia && dda !=3D NULL) {
- 			TAILQ_REMOVE(&state->addrs, dda, next);
- 			ipv6_freeaddr(dda);
-+			freed =3D true;
- 		}
- 	}
-+
-+	return freed;
- }
- #endif
-=20
-@@ -2636,7 +2640,11 @@ static void
- dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
- {
- 	struct ipv6_addr *ia, *ian;
-+#ifndef SMALL
-+	bool again;
-+#endif
-=20
-+again:
- 	TAILQ_FOREACH_SAFE(ia, addrs, next, ian) {
- 		if (ia->flags & IPV6_AF_EXTENDED)
- 			;
-@@ -2658,7 +2666,9 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
- 		/* If we delegated from this prefix, deprecate or remove
- 		 * the delegations. */
- 		if (ia->flags & IPV6_AF_PFXDELEGATION)
--			dhcp6_deprecatedele(ia);
-+			again =3D dhcp6_deprecatedele(ia);
-+		else
-+			again =3D false;
- #endif
-=20
- 		if (ia->flags & IPV6_AF_REQUEST) {
-@@ -2671,6 +2681,11 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
- 		if (!(ia->flags & IPV6_AF_EXTENDED))
- 			ipv6_deleteaddr(ia);
- 		ipv6_freeaddr(ia);
-+#ifndef SMALL
-+		/* Deletion may invalidate the next pointer so restart */
-+		if (again)
-+			goto again;
-+#endif
- 	}
- }
-=20
---=20
-2.43.0
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch b/=
meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
deleted file mode 100644
index a6b8a44515..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2e27969699676e664898c8f82e2c047762fc426f Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Tue, 23 Jun 2026 02:06:55 +0100
-Subject: [PATCH] DHCPv6: Prefix exclude option can be 17 octets (#671)
-
-Well that's a simple off by one error
-
-Reported-by: CuB3y0nd <root@cubeyond.net>
-
-(cherry picked from commit 2f00c7bfc408b6582d331932dfa47829c4819029)
-
-CVE: CVE-2026-56114
-Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/=
commit/2f00c7bfc408b6582d331932dfa47829c4819029]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.=
com>
----
- src/dhcp6.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/dhcp6.c b/src/dhcp6.c
-index 8a8a20a0..5e497cfd 100644
---- a/src/dhcp6.c
-+++ b/src/dhcp6.c
-@@ -1093,7 +1093,7 @@ dhcp6_makemessage(struct interface *ifp)
-=20
- 				/* RFC6603 Section 4.2 */
- 				if (ap->prefix_exclude_len) {
--					uint8_t exb[16], *ep, u8;
-+					uint8_t exb[17], *ep, u8;
- 					const uint8_t *pp;
-=20
- 					n =3D (size_t)((ap->prefix_exclude_len -
---=20
-2.43.0
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch b/=
meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
deleted file mode 100644
index 2d8345cf18..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ae33c2d8fc7319a2957acd6e8efad99116b68dc6 Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Tue, 23 Jun 2026 00:34:58 +0100
-Subject: [PATCH] IPv6ND: Free routeinfo when it expires (#670)
-
-Reported-by: CuB3y0nd <root@cubeyond.net>
-
-(cherry picked from commit 708b4a56bae080a5b18c2e0c4c6fbe103131a2b0)
-
-CVE: CVE-2026-56116
-Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/=
commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.=
com>
----
- src/ipv6nd.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ipv6nd.c b/src/ipv6nd.c
-index ccf71241..557ff50e 100644
---- a/src/ipv6nd.c
-+++ b/src/ipv6nd.c
-@@ -1789,6 +1789,7 @@ ipv6nd_expirera(void *arg)
- 				logwarnx("%s: expired route %s",
- 				    rap->iface->name, rinfo->sprefix);
- 				TAILQ_REMOVE(&rap->rinfos, rinfo, next);
-+				free(rinfo);
- 			}
- 		}
-=20
---=20
-2.43.0
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch b/=
meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
deleted file mode 100644
index 6ef86204f2..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From b7bf047e30217e144235a6b00d4c81afbcc5d6ab Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Mon, 22 Jun 2026 23:41:53 +0100
-Subject: [PATCH] control: Avoid hangup in the recvdata path
-
-Instead return an error and bubble it up where it can be
-hangup / freed more cleanly.
-
-Reported-by: CuB3y0nd <root@cubeyond.net>
-
-(cherry picked from commit 78ea09ed1633a583dbcde6e7bab9df4639ec8a34)
-
-CVE: CVE-2026-56117
-Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/=
commit/78ea09ed1633a583dbcde6e7bab9df4639ec8a34]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.=
com>
----
- src/control.c         | 47 ++++++++++++++++++++++++-------------------
- src/control.h         |  2 +-
- src/privsep-control.c |  7 ++++++-
- 3 files changed, 33 insertions(+), 23 deletions(-)
-
-diff --git a/src/control.c b/src/control.c
-index ec1c633c..e6115f66 100644
---- a/src/control.c
-+++ b/src/control.c
-@@ -115,10 +115,8 @@ control_handle_read(struct fd_list *fd)
- 	bytes =3D read(fd->fd, buffer, sizeof(buffer) - 1);
- 	if (bytes =3D=3D -1)
- 		logerr(__func__);
--	if (bytes =3D=3D -1 || bytes =3D=3D 0) {
--		control_hangup(fd);
--		return -1;
--	}
-+	if (bytes =3D=3D -1 || bytes =3D=3D 0)
-+		return (int)bytes;
-=20
- #ifdef PRIVSEP
- 	if (IN_PRIVSEP(fd->ctx)) {
-@@ -134,15 +132,13 @@ control_handle_read(struct fd_list *fd)
- 		if (err =3D=3D 1 &&
- 		    ps_ctl_sendargs(fd, buffer, (size_t)bytes) =3D=3D -1) {
- 			logerr(__func__);
--			control_free(fd);
- 			return -1;
- 		}
--		return 0;
-+		return 1;
- 	}
- #endif
-=20
--	control_recvdata(fd, buffer, (size_t)bytes);
--	return 0;
-+	return control_recvdata(fd, buffer, (size_t)bytes);
- }
-=20
- static int
-@@ -205,23 +201,31 @@ static void
- control_handle_data(void *arg, unsigned short events)
- {
- 	struct fd_list *fd =3D arg;
-+	int err;
-=20
- 	if (!(events & (ELE_READ | ELE_WRITE | ELE_HANGUP)))
- 		logerrx("%s: unexpected event 0x%04x", __func__, events);
-=20
- 	if (events & ELE_WRITE && !(events & ELE_HANGUP)) {
--		if (control_handle_write(fd) =3D=3D -1)
--			return;
-+		err =3D control_handle_write(fd);
-+		if (err =3D=3D -1)
-+			goto hangup;
- 	}
- 	if (events & ELE_READ) {
--		if (control_handle_read(fd) =3D=3D -1)
--			return;
-+		err =3D control_handle_read(fd);
-+		if (err =3D=3D -1 || err =3D=3D 0)
-+			goto hangup;
- 	}
- 	if (events & ELE_HANGUP)
--		control_hangup(fd);
-+		goto hangup;
-+
-+	return;
-+
-+hangup:
-+	control_hangup(fd);
- }
-=20
--void
-+int
- control_recvdata(struct fd_list *fd, char *data, size_t len)
- {
- 	char *p =3D data, *e;
-@@ -243,12 +247,13 @@ control_recvdata(struct fd_list *fd, char *data, siz=
e_t len)
- 			if (e =3D=3D NULL) {
- 				errno =3D EINVAL;
- 				logerrx("%s: no terminator", __func__);
--				return;
-+				return -1;
- 			}
--			if ((size_t)argc >=3D sizeof(argvp) / sizeof(argvp[0])) {
-+			if ((size_t)argc + 1 >=3D
-+			    sizeof(argvp) / sizeof(argvp[0])) {
- 				errno =3D ENOBUFS;
- 				logerrx("%s: no arg buffer", __func__);
--				return;
-+				return -1;
- 			}
- 			*ap++ =3D p;
- 			argc++;
-@@ -268,12 +273,12 @@ control_recvdata(struct fd_list *fd, char *data, siz=
e_t len)
- 		*ap =3D NULL;
- 		if (dhcpcd_handleargs(fd->ctx, fd, argc, argvp) =3D=3D -1) {
- 			logerr(__func__);
--			if (errno !=3D EINTR && errno !=3D EAGAIN) {
--				control_free(fd);
--				return;
--			}
-+			if (errno !=3D EINTR && errno !=3D EAGAIN)
-+				return -1;
- 		}
- 	}
-+
-+	return 1;
- }
-=20
- struct fd_list *
-diff --git a/src/control.h b/src/control.h
-index ef592268..1f09fc8f 100644
---- a/src/control.h
-+++ b/src/control.h
-@@ -76,5 +76,5 @@ struct fd_list *control_new(struct dhcpcd_ctx *, int, un=
signed int);
- void control_free(struct fd_list *);
- void control_delete(struct fd_list *);
- int control_queue(struct fd_list *, void *, size_t);
--void control_recvdata(struct fd_list *fd, char *, size_t);
-+int control_recvdata(struct fd_list *fd, char *, size_t);
- #endif
-diff --git a/src/privsep-control.c b/src/privsep-control.c
-index b9ea7f9c..3cdeedea 100644
---- a/src/privsep-control.c
-+++ b/src/privsep-control.c
-@@ -110,6 +110,7 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, stru=
ct msghdr *msg)
- 	struct iovec *iov =3D msg->msg_iov;
- 	struct fd_list *fd;
- 	unsigned int fd_flags =3D FD_SENDLEN;
-+	int err;
-=20
- 	switch (psm->ps_flags) {
- 	case PS_CTL_PRIV:
-@@ -133,7 +134,11 @@ ps_ctl_dispatch(void *arg, struct ps_msghdr *psm, str=
uct msghdr *msg)
- 		if (fd =3D=3D NULL)
- 			return -1;
- 		ctx->ps_control_client =3D fd;
--		control_recvdata(fd, iov->iov_base, iov->iov_len);
-+		err =3D control_recvdata(fd, iov->iov_base, iov->iov_len);
-+		if (err =3D=3D -1 || err =3D=3D 0) {
-+			control_free(fd);
-+			ctx->ps_control_client =3D NULL;
-+		}
- 		break;
- 	case PS_CTL_EOF:
- 		ctx->ps_control_client =3D NULL;
---=20
-2.43.0
-

