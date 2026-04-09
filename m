Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D59E98FD6
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:59 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128346.1775726991485326286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=I9UDjeb1;
 spf=pass (domain: ericsson.com, ip: 52.101.83.55, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAQPu8N+RNktiVdk+LNZqfBya7uHVdvYZqNEz3Pk/yDNmAhSdB3g/1eBaSDv+L50F+c4FtIv+mG4oXcuLMDn6t8i1heT8eiEL5Hkmga4FY5qlCWuXysuUvmqyMhe+kNtH61xxN4DY0FJN8Nwzerc1dCgZ4ylcLkq7NluymW0av7KkZfBpy4+we+UFJnPvc7rqaFogPZwLTnYUHBQxHcwOvWp0q8WheS49Jm7HkZbuYfpbMu2sXGEQS6yRWLbF+jN8V2gMzRJM4majuGR5SFvyNiANXHuk5KoWQN77Z6i82ZYt/XMRze4lbD8d0d9vBGBGQFPEsUWwXiSphH19MCiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzeFIEhPao2WrlmNHsFKFNAfdON6x60Ihn7g/uRY05U=;
 b=SFT7Z4U1rjpjjkBCjgJ/sjQ9uA/2erS+rbiWf5uqQ0ryl/U8RPfeDWvvVVnBqFRUqmoCXfbciURkaVmiJYH2BJPXHmSCR5a9yfl1qY7Mi9rgPa1djreGVXBwOyF3OkCcZcHWC2K05ZGYqh+gXmf7Zh517hwZZMjXFzB8p4LfRfMSTczZ9OJnT8WB6UoCU3Xx46n2IdX99hpxBcFWTl8+/92E0u7ccXizQhEJZKuqUmF0Q1E2OebpA8u8xj0546cSeYhxzvT6YCHan0uXCsiLny9e6RCSPe4mMlRvNBFqPPezZcdmqLXdCa3M11Nx3nBGilMwrKTs9YmmLdBnsRWAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzeFIEhPao2WrlmNHsFKFNAfdON6x60Ihn7g/uRY05U=;
 b=I9UDjeb1Tjn2xNbpsc99CRMiI3NlDxUtI7/SBLlfxU3RWM5aGTviNJuENSZMcG5kxqnH4Fzs2dLK+qKS2dNXQokELgFDl46N0Wj0+dvPBQbgwAftwZJjyniomUpnnbucXKxybjnMqTlT4fqNIBMgDsJNzr+vAE8Zu6E4z1jJ8kB6LMR+BKOm+Qt0CvBLLrwmcW/5cOPeWYwlo/ZKuJx9dztd5GsVjN4hTX2GSyD57LLs3PDAsXD3LpIMFWoi+bFbdDX9WkX8XGnwdizBfvDfykLC9NMxPWUs4uDU30UaGcd96jFNP/DFyhf4DdJF3ysLSdZ3aDVEnVm2Nq2jrdCh+A==
Received: from DU7P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::17)
 by VI1PR07MB6512.eurprd07.prod.outlook.com (2603:10a6:800:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 09:29:43 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::9d) by DU7P194CA0011.outlook.office365.com
 (2603:10a6:10:553::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 09:29:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:29:42 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 11:29:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id E77324020840;
	Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id CEE3A700DB92; Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH 1/9] base-passwd: upgrade 3.6.3 -> 3.6.8
Date: Thu, 9 Apr 2026 11:29:28 +0200
Message-ID: <20260409092936.1740143-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409092936.1740143-1-daniel.turull@ericsson.com>
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|VI1PR07MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b49330c-a64c-4c75-242a-08de961a87cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	BMwqBDBind6TYkUudmBo/3FEfQy56ZNd0zBsTIQF6KWRJ4NGyGbTkDQsE7vB25HszU4qMS/5jJ9D1LtTOtfMmjg0dpTZ8ndiR2368How58eMEtOcAV65WD0hz0Aj1MUXSLJTAACfWZ55FAvvcVaM68IX+wuSP0ItKOve2tDi5CnDMvyBb2Yx4aI1tymXfU83fCbNwcPHcsleUGjkDJ31g4Dxcp3ZVAOYTFqCicmGxZukON7W+5qgRITWYKgd9Ge2XWCZq2R0Dsm9LpW+9+Fu+lnRKeH3HHLV0XzIdbqFZiQR2RRxkcUYDuOjvG5TbWzr8Svme0GvFekmKBBF5C3zKxBfNkKeYZuho9TpeGYgq9bp7pxsUAo3srVdV4bzdV8zjQGuOKCQb5mvvpL0XueQ8R91AaDc3mjTv4E7Shl+FJmvj9Pp+7Oq/6KMxix8l5Brm6Y9ixKrKUVETVLrwJ5lA1nrylS0+uvwSEZ3Xe796pBOSPnmcMQ06saBI/xbqsrztGHzIVd56OmwhlC+VIMfxbRbi8XtrY6EWH/GSP8j5ak6q6a8Q47DZ4IL9IAWwSqiNmRt18EXQoBaNVAuEIk3a++CRUORF2jwOukxiICDpDDiU8f44To2QCgl+FwpYGN8YO9vX+Woz6Egukntry9nreuWWnlQcPh0Z5xLH3xXtQELJLCgmFB5jA85lT/pke4ZzXPqgacWw/VRRAUfbFH35fMJxy/Xgej2RIvE2f9DYDo=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rzBtsZKc26irDknxrqEy1GDGtHmLZ/fmsc/losXUdNxeitB6+LvDJI5NXjkrXhuvoxu73h8J0Z2eRniEazgexZ6tc8PqYi5IuLNiQkE1ljVDCeRvXWW3ZMT+yTJfEg/YlRXTBUPY9swvAsb54B4oXEIEF2ZPcPxcOSOTs4wsGuPLQKCsus+9jE8SaVvWF8ifYxP2+85QkNpB8OoZi5Su4Xn3MmQ52FGBpOp8wPHVmD60gN5Mnv9vrAfvjOiDHefdHWklqWLUkslbm+9UXNXYFDcvmHwmRGvfMzA5oadD4aMhVr6q/i31MRSobqlJj+lfv/Mpiv7pabAkKLJJsjZcptNDqiqAL9kkRvWx//6y/QNujb6ZXBEUED524vN2hbcZ27gmN7BmS4EUez6PYaQ65NX5eEOrWsQO8gJG3YEtVWOX3yBkljZZZixevNlXr8I+
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:29:42.4197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b49330c-a64c-4c75-242a-08de961a87cf
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6512
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234907

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for base-passwd: 3.6.3 -> 3.6.8
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

base-passwd (3.6.8) unstable; urgency=3Dmedium

  * Debconf translations:
    - Turkish (thanks, Nuri K=C3=9C=C3=87=C3=9CKLER; closes: #1102464).
  * update-passwd(8) translations:
    - French (thanks, Baptiste Jammet; closes: #1119914).

 -- Colin Watson <cjwatson@debian.org>  Mon, 03 Nov 2025 11:03:53 +0000

base-passwd (3.6.7) unstable; urgency=3Dmedium

  [ Marc Haber ]
  * Add myself to Uploaders.

  [ Colin Watson ]
  * Debconf translations:
    - Catalan (thanks, Carles Pina i Estany; closes: #1101110).

 -- Colin Watson <cjwatson@debian.org>  Sun, 23 Mar 2025 15:30:08 +0000

base-passwd (3.6.6) unstable; urgency=3Dmedium

  * Move to team maintenance under pkg-shadow-devel.

 -- Colin Watson <cjwatson@debian.org>  Sun, 29 Dec 2024 13:43:54 +0000

base-passwd (3.6.5) unstable; urgency=3Dmedium

  [ Colin Watson ]
  * Apply X-Style: black.
  * Add Romanian translation of update-passwd(8) (thanks, Remus-Gabriel
    Chelu; closes: #1055383).

  [ Maks Mishin ]
  * Fix potential descriptor leaks.

 -- Colin Watson <cjwatson@debian.org>  Mon, 21 Oct 2024 18:26:50 +0100

base-passwd (3.6.4) unstable; urgency=3Dmedium

  [ Chris Hofstaedtler ]
  * Ensure that /etc/subuid and /etc/subgid exist (closes: #1074121).

 -- Colin Watson <cjwatson@debian.org>  Mon, 01 Jul 2024 12:20:04 +0100

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../0001-Add-a-shutdown-group.patch            |  6 +++---
 .../0001-base-passwd-Add-the-sgx-group.patch   |  4 ++--
 ...instead-of-bin-bash-for-the-root-user.patch |  4 ++--
 ...ot-since-we-do-not-have-an-etc-shadow.patch |  4 ++--
 ...input-group-for-the-dev-input-devices.patch |  4 ++--
 .../base-passwd/0005-Add-kvm-group.patch       |  6 +++---
 .../base-passwd/0007-Add-wheel-group.patch     | 18 +++++++++++++-----
 ...se-passwd_3.6.3.bb =3D> base-passwd_3.6.8.bb} |  2 +-
 8 files changed, 28 insertions(+), 20 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.3.bb =3D> base-passw=
d_3.6.8.bb} (98%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-=
group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown=
-group.patch
index e50efc9623..f0e1539ca7 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.p=
atch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-Add-a-shutdown-group.p=
atch
@@ -1,4 +1,4 @@
-From 8f3ace87df3aaad85946c22cae240532ea3e73b8 Mon Sep 17 00:00:00 2001
+From 6f714635792a14fd3ee8d2ce0318c0185add5c00 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Add a shutdown group
@@ -14,10 +14,10 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/group.master b/group.master
-index ad1dd2d..1b5e2fb 100644
+index 3e7bf1c..72108a8 100644
 --- a/group.master
 +++ b/group.master
-@@ -35,5 +35,6 @@ sasl:*:45:
+@@ -34,5 +34,6 @@ sasl:*:45:
  plugdev:*:46:
  staff:*:50:
  games:*:60:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add=
-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-base-=
passwd-Add-the-sgx-group.patch
index e1340e1b70..d50136b24e 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sg=
x-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-sg=
x-group.patch
@@ -1,4 +1,4 @@
-From 9e57771d138ac423d5139b984b8c869122ce4976 Mon Sep 17 00:00:00 2001
+From ff622d69e9c06c00dacdffc163a383f8d2903475 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alexk@zuma.ai>
 Date: Fri, 28 Jul 2023 10:28:57 +0100
 Subject: [PATCH] base-passwd: Add the sgx group
@@ -17,7 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/group.master b/group.master
-index d34d2b832d43..e54fd1d2c6dc 100644
+index d34d2b8..e54fd1d 100644
 --- a/group.master
 +++ b/group.master
 @@ -34,6 +34,7 @@ video:*:44:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-inst=
ead-of-bin-bash-for-the-root-user.patch b/meta/recipes-core/base-passwd/bas=
e-passwd/0002-Use-bin-sh-instead-of-bin-bash-for-the-root-user.patch
index 09f8cfea9c..0fa6b8138d 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-=
bin-bash-for-the-root-user.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0002-Use-bin-sh-instead-of-=
bin-bash-for-the-root-user.patch
@@ -1,4 +1,4 @@
-From 4411fc0df77566d52bee11ec0bad4be30a96e99e Mon Sep 17 00:00:00 2001
+From c30862c6892d17ae2f4578101dcb050250956cec Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:27 +0000
 Subject: [PATCH] Use /bin/sh instead of /bin/bash for the root user
@@ -12,7 +12,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/passwd.master b/passwd.master
-index 7cd4e24..041685a 100644
+index 90514a5..bd3efc2 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root=
-since-we-do-not-have-an-etc-shadow.patch b/meta/recipes-core/base-passwd/b=
ase-passwd/0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch
index 06222ab04c..4be487cc3f 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-=
we-do-not-have-an-etc-shadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0003-Remove-for-root-since-=
we-do-not-have-an-etc-shadow.patch
@@ -1,4 +1,4 @@
-From 13a1a284a134d18a454625a5b4485c0d99079ae9 Mon Sep 17 00:00:00 2001
+From 0d35229f01e3a38a27338320e67c4cb5652a3249 Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Remove "*" for root since we do not have an /etc/shadow
@@ -10,7 +10,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/passwd.master b/passwd.master
-index 041685a..31a84d4 100644
+index bd3efc2..66e9033 100644
 --- a/passwd.master
 +++ b/passwd.master
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-gr=
oup-for-the-dev-input-devices.patch b/meta/recipes-core/base-passwd/base-pa=
sswd/0004-Add-an-input-group-for-the-dev-input-devices.patch
index 394a0f01d3..a3502c3d86 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for=
-the-dev-input-devices.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0004-Add-an-input-group-for=
-the-dev-input-devices.patch
@@ -1,4 +1,4 @@
-From c5f012750f8102ff54af73ccc2d2b7bfa1f26db4 Mon Sep 17 00:00:00 2001
+From d2cdd4c8d7332d05ac86fb0625e8c2b3c7bf7728 Mon Sep 17 00:00:00 2001
 From: Darren Hart <dvhart@linux.intel.com>
 Date: Fri, 29 Apr 2022 13:32:28 +0000
 Subject: [PATCH] Add an input group for the /dev/input/* devices
@@ -10,7 +10,7 @@ Signed-off-by: Darren Hart <dvhart@linux.intel.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/group.master b/group.master
-index 1b5e2fb..cea9d60 100644
+index 72108a8..7d794b2 100644
 --- a/group.master
 +++ b/group.master
 @@ -12,6 +12,7 @@ uucp:*:10:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.p=
atch b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
index 72e6ee333c..4f8278e5cd 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0005-Add-kvm-group.patch
@@ -1,4 +1,4 @@
-From 6cf19461fb31d7a7a3010629aae9aab49c26a01b Mon Sep 17 00:00:00 2001
+From 07af34abb10b1455e065cfb1ce7ce766614da7e8 Mon Sep 17 00:00:00 2001
 From: Jacob Kroon <jacob.kroon@gmail.com>
 Date: Wed, 30 Jan 2019 04:53:48 +0000
 Subject: [PATCH] Add kvm group
@@ -10,10 +10,10 @@ Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/group.master b/group.master
-index cea9d60..5b62284 100644
+index 7d794b2..7fdd8bf 100644
 --- a/group.master
 +++ b/group.master
-@@ -34,6 +34,7 @@ utmp:*:43:
+@@ -33,6 +33,7 @@ utmp:*:43:
  video:*:44:
  sasl:*:45:
  plugdev:*:46:
diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group=
.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.pat=
ch
index d77122789d..91bbb453e3 100644
--- a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
@@ -1,3 +1,7 @@
+From 3c88afb923de603d126f89f2979b2cd232a180c8 Mon Sep 17 00:00:00 2001
+From: Louis Rannou <lrannou@baylibre.com>
+Date: Thu, 15 Jun 2023 13:43:55 +0200
+Subject: [PATCH] base-passwd: add the wheel group
=20
 We need to have a wheel group which has some system privileges to consult =
the
 systemd journal or manage printers with cups.
@@ -7,11 +11,15 @@ Upstream says the group does not exist by default.
 Upstream-Status: Inappropriate [enable feature]
=20
 Signed-off-by: Louis Rannou <lrannou@baylibre.com>
-Index: base-passwd-3.5.26/group.master
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- base-passwd-3.5.29.orig/group.master
-+++ base-passwd-3.5.29/group.master
-@@ -38,5 +38,6 @@
+---
+ group.master | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/group.master b/group.master
+index 7fdd8bf..d34d2b8 100644
+--- a/group.master
++++ b/group.master
+@@ -37,5 +37,6 @@ kvm:*:47:
  staff:*:50:
  games:*:60:
  shutdown:*:70:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb b/meta/reci=
pes-core/base-passwd/base-passwd_3.6.8.bb
similarity index 98%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
index bf50b01fd5..a072791dcf 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/primar=
y/+files/${BPN}_${PV}.tar
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
=20
-SRC_URI[sha256sum] =3D "83575327d8318a419caf2d543341215c046044073d1afec2ac=
c0ac4d8095ff39"
+SRC_URI[sha256sum] =3D "fab3d0e6e8b641e116bda9bd5f7a7ed24482384c1513f6a369=
b506327fbc8dde"
=20
 # the package is taken from launchpad; that source is static and goes stal=
e
 # so we check the latest upstream from a directory that does get updated

