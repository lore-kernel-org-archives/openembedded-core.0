Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C637C5DF70
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:58:32 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3011.1787032707806703469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Q2zn4NrQ;
 spf=pass (domain: est.tech, ip: 40.107.130.49, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTWNGLLTUmwnvveqZ5Z3N+8XNKQlpx6P/5J/SWnrknbclC9L3v4Ig1yPdja6F0a6DOB/MXk8Ft3h9UBfDCJEAZISj9djs3PjYQirurbT887ILtDanrmUB6ZEXGqXIibVR2+AcNDK1G/W2OvV4AxAkHcTKDxhY8+aeWTyGXHTE/NcPKO7J4elCYLNMu1emdoc9EFp9fXitN6lDZ5rpeiI/gKUMglPnKSMVZLFQw2eW7ayoimVYjvylLyhNQ6PwDfUiada40sDynvgAXw0x+vMBJPU3f4UrM4cfRKae2QdPz3lrOe85U3aeHSlvuxyFdiN+32C/UP5GQvnGs/c9v+OAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhwJOSeLDXHBAfFnN/LilfTc3DOPEpL4eipSVQPoTyY=;
 b=WRtsSO7b6KA0eargTx+wAf2ho/Kpf/2lr8y9GMRvrnIdoK4Tjo4TbH8EpDgFbK6PsepQi/M9KJuqD8RLOvb2wwfjvMOHg9Ctcs6R9tvgurID7HbxLS5kaINY7xUh/2nLomq6sMhcCPh1ssu3Nu98y6fkIKxoPekx5xzaB2ZUDvohuFkT4vzWMy8op9AWbNWgr9Ep+n0vzfUT1OK7J8+N5fdfWKPDVuEQ75gFHEE63NR1shqAXcD340rv8R+OnuG4Hsd8wP+nuabyZQei9NqL05BbSlsczbv6/81fG6HqdwcExFlK9LbetIcvZCMFgWYGHV8yJNNINuB4WHrJQea/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhwJOSeLDXHBAfFnN/LilfTc3DOPEpL4eipSVQPoTyY=;
 b=Q2zn4NrQq/hqX7mmpt65x50VhBKcm7moCXR92lsASPF82fXwfmNv4TS6040mV0vnGvbz1P6sFgE5o2vJb2aa1D5wi1pRyc5XfNxxFUiCabGVKY/RwU1VxuyGibYf1uhjaBK5dyexpXmfMH1bKGcC8ImM77shQAaSXKRD5kylMpmoMrQzHz1/+qP8LgnnFsrCKVnXoC6tSUB+DyiZgsd926biVwCyWxycgcOFxfgJnkBlWhLmPjCT3nOB7b0QX8EMqJQqxehUqmyPZwlgJ6UfkniXcB59T2HZt39wZlB4UTZKsKmkwQO+qlS3YLtUH3QjEkmAoNxDl1/ZZWfpV/lu6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB1872.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 05:58:22 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 05:58:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] dhcpcd: upgrade 10.5.0 -> 10.5.2
Date: Tue, 18 Aug 2026 07:58:11 +0200
Message-ID: <20260818055811.50783-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0190.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::8) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB1872:EE_
X-MS-Office365-Filtering-Correlation-Id: 1074fa9a-55ed-483b-d160-08defcedb562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|6133799003|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pwR7PCUZ7RCviR2wWkJAnm+GIIGAxHGwH47alhAR04MYdFVQnwKOJHYZhwfcC9zBL183Sue4b45m15usGF9Bikg4GuMCa2f536V0mXtD7DepZwl8IKiXnaY5ZR4Bf+j8gkqPo31ngWYCR3yiGiU59D8fCgLmbxhd4/gw6RdPKQIhANQFbpsGX6P7MIoVef0cWLmprfP8mnvh4XjP4XkNk2YxE5qXIXCZvqqN3gfU26by+vCgna1nnLI6lGPG9gAY8Ho8zdFoVIF+ayNTiTEh4XVCghaQE/Dahp+bItaQu6Q4gi7qAIcA3dHgkqh/sYTVn4w2Kjb/RK05/R3adOxISaWCVIMZAtzkHGVs6NCc0TZzdh29yVoPz1W1DmJANCT07qK3SXD+wSRSCT1nO1MaVwy+XX9c6K88CMZadqYBOx+XlOIpqaE73i6fqjBJ2rfW8a0SeRdcg7/m6II4G6X+6xKOdmJYg8J87YP9vPNNDbOcAXPKSoyM61n8nl2Ev/gZ40xLU6cSCe2YNTKKJRErPThim7Rjl3D+oDlf14AmjXjHyP69RfaBcsyf1YRSNM10+7rKMReEEwGHGdOt/gehxUHJXTTsAleq9lEILQoVu2oFYfuqVkadOGuAwsO262xAExQw2LOLbMQno5CTq5TXlzNhbN6q99hW8DNXgjB4cWk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MWQo7AEFBsfMFY1YiKNis7irQmFD7inqxiEY8R+vqerYpXgD0u4uQ95mUdro?=
 =?us-ascii?Q?Xw/fkuTUFWBjdh401eKhEQJr649yk98gX9fNZnqK+DlfA5qXqpRDhHcaNrj4?=
 =?us-ascii?Q?pbL05tCslIp5vEaCO/Z0oQH/3bAsZ3GEaZUv4IyaozAPO4GSGjzyJGCDlvXf?=
 =?us-ascii?Q?G1Vparx1mDTDZCyyyvCa8sx37JSXnXg8wTPPb2nb2udFn8Zvf6tZi21mLSJx?=
 =?us-ascii?Q?m3ZXzqGnRBwqwUYznIa3Nm6XKojCXS9RBlRQ7lpXoXpG7ZeK4NOjPU5Ml2/D?=
 =?us-ascii?Q?8oYtK2o3Wae/VC9T+m5+hu9GvOuaKuXOanGlNPsuhiPpEU8Z7PD7bBa4RgFn?=
 =?us-ascii?Q?HJfkqiWaDsFDfSfn2AxKFQtg0BHoQVUPFDqSlU3XQ4wD3pspetsCzlW8jDYx?=
 =?us-ascii?Q?ioziVK7Mfgs/EIPXDb+F6GhbfhH6ZiCZUBg4sMI5LZEySprwayky9J+OV4iK?=
 =?us-ascii?Q?n60PBtJMs74VyHp0QYYWRuBGL3NxYQo4HUfURleRxCu3eAKQ7KM5u6P07foj?=
 =?us-ascii?Q?3OvUegWTmgskfVXi9AbVUav/qmQ+ik3VQFvs4sDmKDBkUZLt7eQTENe4KaVp?=
 =?us-ascii?Q?h0d5gHa4IK6G5gtNLqUSge5F0axgbcVmaXgOti7HmAiPeZbBe/ka/xELM+HG?=
 =?us-ascii?Q?gg8OxKsQvJzep5yYdRMWza1QVEUILfrgKFOMtP1eVt++KPea+LqHXnLa6MQR?=
 =?us-ascii?Q?7CGxU5AHyvtgHCEHFd//DoyghIT11V5F8vYBmeF3wnCrwNh6pi04lagn6r/U?=
 =?us-ascii?Q?RAWI6hLsJz7CYQB+WCPlmx4+bmKKH/hD5h+Pzy2kSyEU01NjjASSKWxYvklC?=
 =?us-ascii?Q?o9+fH+VpXHGcZitpWmUzLGXFjNwiJhfCvgPXwqHz0IH5EEFc8mo67XSiJO53?=
 =?us-ascii?Q?ZsAOtIr4O3ZzDYO3v/YPrAJ6ZjMXMmMDbAW+a1r6Kcrkroo8spyH+EGNYCtB?=
 =?us-ascii?Q?+/74RVjpVDMTCiEKst14jwk3F7qkhJHTXFcnl2Khxm/WjrcwyETePtX3PHnH?=
 =?us-ascii?Q?LbGrPFVK8n2SR/SBFqY0+8Le4rzwhwmQZqhyavCwPGifGhgDEbQTFyU3iNAU?=
 =?us-ascii?Q?6Gxg6VnN/pANbThiZ4kpoqTKwu+pTSY7rJqRgWmKC3R7wAxwTKNeoMuIe/tf?=
 =?us-ascii?Q?6EP+gJ8J1DehgV+8J6NgmpOVO0U8JJwV5SDcy2BfSK6iTXXpugzqj0KqVhGq?=
 =?us-ascii?Q?ReWj4R3OR5xyKlZLlCUXjGsLB488neBMCtUlwlBoITk7gRw/XqwZ6pi5oT+Q?=
 =?us-ascii?Q?VEMHqQ/IBfKwX16woNP61+O3qHlFAV9OAE352fKwyX4/Wuy+lRdTXEauPbcY?=
 =?us-ascii?Q?BkydBMuXY/daF54s4DQ8pK2Q61g3VQP3nWvliXkUkh6yLudTCZRFxusO/3Hc?=
 =?us-ascii?Q?eS1KJYH4hJajnp786NHhUI8XyhTSb104ZcWSDCcjUwYoiJ0qLNSr4Q/vd46H?=
 =?us-ascii?Q?wfoxL7LKbtTz3BpOQFeDx0zBkLmAceBflLKM9OpjByBKX9KFcCFxUHofLCqz?=
 =?us-ascii?Q?c/CmUhQT2sKUPn8PlIVlumzRCGqYTw6v490TVP0oAMkNJxDabUOLIVEe/ImE?=
 =?us-ascii?Q?C8NzITtKkHusVfSKa6Cvl0Lj2zmXMy3OELtzIhZT3I1bNcbL0QWhK1NHFMl9?=
 =?us-ascii?Q?F7zxoPtFZCcig+QoYN10WDdZ2MCuiuiQykGAjjmmLSHP5bk4WUE/IUDudbny?=
 =?us-ascii?Q?qIdTjmAcGIhJs2pTWCMV2ehzaa9sviABQZQZpNsnvXhZ0bFbZEM2zrcVd3o4?=
 =?us-ascii?Q?xyKpl3yT3w/rnpbVDucTdtTL/sdx8lC7NBPDopzPf73lFvDNEfS2WSydKY4o?=
X-MS-Exchange-AntiSpam-MessageData-1: Q9T2zOFKja6uok0e1CEDDCm4FANSorPBKuU=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1074fa9a-55ed-483b-d160-08defcedb562
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 05:58:21.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BwHn6HGQrasdnCC5pSrbcc9fobLNJnFzpJUoO5h38dA5qcZF4MQuiwTEsMWOe1PB3H1x9uVJEkLWDX4WtybyB8C1kve4q2AZ/4NfxA99CI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1872
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243651

ChangeLog: https://github.com/NetworkConfiguration/dhcpcd/compare/v10.5.0..=
.v10.5.2

7c50b51a Release dhcpcd-10.5.2
c8887d0d IPv6: Allocate the interface state before adding a static address
03091088 Fix build
2bb381e9 Release dhcpcd-10.5.1
b19746fd configure: Generate .clangd
23b6790d privsep: Fix capsicum support on the control socket
a14857d1 privsep: re-enable capsicum and pledge
50857dd2 hooks: Document that new_delegated_dhcp6_prefix contains addresses
f6dabfe2 control: Harden the socket the the fs level
97b50d2e Improve the IDE experience
9cd9d2df DHCP: script reason should be RELEASE on RELEASE, not STOP
79936c28 linux: workaround a gcc compile warning issue
dfaaa5ea remove accidental debug
737091d2 ipv4: clear added state if we didn't delete the address
b83fe28c compat: define __STDC_WANT_LIB_EXT1__ 1 before including config
0c1f4074 ipv6nd: don't leave a carrier expiry timeout on a freed interface
fadc4ed6 compat: call setprogname during early init
7c87dfdf privsep: Allow __NR__llseek as well as __NR_llseek on linux
8d499db1 route: keep acquisition timestamp when matched route isn't updated
c5605040 DHCP6: Mirror the prior DHCP rapid commit fix to DHCPv6
0406dd87 DHCP: Only send the rapid commit option when configured to
eb9fd7df control: Fix non privsep builds

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../dhcpcd/{dhcpcd_10.5.0.bb =3D> dhcpcd_10.5.2.bb}             | 2 +-
 ...20-resolv.conf-improve-the-sitation-of-working-with-.patch | 2 +-
 ...001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 2 +-
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch      | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.5.0.bb =3D> dhcpcd_10.5=
.2.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb b/meta/recip=
es-connectivity/dhcpcd/dhcpcd_10.5.2.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.2.bb
index 73f55969cd..d8017693e7 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.5.2.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "git://github.com/NetworkConfiguration/dhcpcd=
;protocol=3Dhttps;branch=3Dma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.pa=
tch \
            "
=20
-SRCREV =3D "1d608519abb398006b77f11c7b720147adf4cfcc"
+SRCREV =3D "7c50b51a142ca5e8cbbf8f65cd8111d6f200608a"
=20
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-imp=
rove-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd=
/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 04c1d92897..e5483c747d 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-th=
e-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-th=
e-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From a3e397d3764fdb779e2f995b690ba365956612f5 Mon Sep 17 00:00:00 2001
+From 5f9b3c4aa7965cf9edf7d6adc8626f50462ad979 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with syst=
emd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-confl=
ict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/fil=
es/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index c2afb83b54..17d5685334 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-err=
or-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-err=
or-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From d3e517be04e660d72233cde91b44c3cf705126e2 Mon Sep 17 00:00:00 2001
+From e9b462a5b3fe875effc05a246948533da1c5baaf Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-=
to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001=
-remove-INCLUDEDIR-to-prevent-build-issues.patch
index 69ebc6026f..ed412c3d94 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prev=
ent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prev=
ent-build-issues.patch
@@ -1,4 +1,4 @@
-From 278ef78e007ab74c701961e108262d9d733a3975 Mon Sep 17 00:00:00 2001
+From ab9ae52e0b7cf53266c99fd00d23d9c2f9cb308e Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,7 +11,7 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.co=
m>
  1 file changed, 5 deletions(-)
=20
 diff --git a/configure b/configure
-index 32bf96ef..ab4aa901 100755
+index 43a40a7d..71707073 100755
 --- a/configure
 +++ b/configure
 @@ -29,7 +29,6 @@ BUILD=3D

