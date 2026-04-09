Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC65E98FCD
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:49 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128075.1775726988125628048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=eNxgCPtY;
 spf=pass (domain: ericsson.com, ip: 52.101.70.14, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgBzMhbeyEme/7PEJhbTdSOjNMHWUNRYrOwHKUrRuJa7JXGyC50StqAZ/N5Tocu0Yu1eoh8jjaxC5ej+pY0zOAk1oZx7xpetU5AbWkjm/WOGSN/FPCS9+3ZTnjA7nKYXeWXNW/3tdpZ1+GXI2L5fECEp9vQSMyA22oL0E7uTQ60kB7oDIFsDOn3jui7GOfHiAHOp2HfSP9qdd5xhiLdWHiCNprWnFAAkizLLc74VE4iQfFC5TPy9vVQBvmsDwrNcu7X/Y48nI85k6D6nkBvthValzR0v1rw1jfljnNfqXl68rLYgktq2forJ9JYp3OWuVJC5Qng0sm8fag5x1DH6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRXOo9j4U+3voLQXIDHdwqmMwyC/5/xPVKGGZz+YZvM=;
 b=e7ThPTVKC5v6ooupdJCMsa47OBxcAMady/2tB7fUG8hr4ITyiGs97E3J7ZmjstDmevBXyIcyxUg2mNImqyMDQvnLPG7ycw+SsbNMD3GYpmL5i6xzA/3+i3n7P6SdRWUzhr/uNhMg6/OBbkWCy30uOStaCotmX7fUtGfCz0Mst5FKfp9P/5muv2f2YbGkXzQREuTTxSuVJW+AYb96uJHNuj1O8FywMF2fHnM4hjoGldpUnzT0vZEBAYOLPeogU/hf/WldeY+Wdy3OBSxiTHEcBw+dgWrA51jctVpt1g9icpb34UOoSYR1+uklyUBgYYJTkezQhFhcY+AlxVSkiYWQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRXOo9j4U+3voLQXIDHdwqmMwyC/5/xPVKGGZz+YZvM=;
 b=eNxgCPtY96F1Pz6hSEU0bR1RY2EsiqgOlA+dJwPlKvUkcRq1XXyjHnAhuYyYKL67VhYDzPC5DIkJfVXzs/QnPM3nxM5VPI0CfZSaZfbmGiNiZSh2GVR+mUXt9clSX/2qqRwX8ZkikJpRnIXphsBrLPfs/4Cdfo7SE7TgY8pC+zOhQLiUk9b2CS2jlrJjNjgkSMl0cEbHz0EUoBiGRzgGWNaYlW2b5HEHqPgrYY3DGRRSsF+ZmpzZhAVSx00KanNLiMendySozFI31Uhs1XIc1rtIK/oX+6jbYjctyYT4jicpL95wVQG+GQYwZmGh++9XjodgW9ywoYi+scyVHnqJ9Q==
Received: from DUZPR01CA0305.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::26) by PR3PR07MB8212.eurprd07.prod.outlook.com
 (2603:10a6:102:177::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 09:29:42 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::62) by DUZPR01CA0305.outlook.office365.com
 (2603:10a6:10:4b7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 09:29:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:29:41 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 11:29:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id E2D174020B70;
	Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id CC3A7700CF09; Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH 0/9] scarthgap updates
Date: Thu, 9 Apr 2026 11:29:27 +0200
Message-ID: <20260409092936.1740143-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|PR3PR07MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f0619e-7948-42d7-c640-08de961a874b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	SPYWDbRXaIe3irhP+jjOUPyTc7MyQm7O87v/dWy8HPZZOfLSCGErcXHPWPRzah2wyyn59pyln6kYG3yqlq6/ue4JzzKOZ6Zj/4hO0yu/YVf3fVMry0KBJsWPJ0FYmgyqDZrBo5qTKfjBSba9xYTkDMoMhbWuH8NG4BAZB1ETkQoPUnSDZn7u3aLNAOjzEg1HZLbWO7gg6OFExD9V9G+66lxSr8fGKcoIEuH32eUYaClYyWy4lIc95UgYUdv157v+H937Q9fRVyroYPQw9eywJ5rxp44voEes4esk44CJ6XPLyCTzkiT+BV8pzwhVFGSAE8bTJw8vYmlq2vexLCh32h0FL6SJ+7MgCUJ6Q2K/fOpfzYUHHeaQqEFqyj2LYPs5hoAqlVlE0K7IjLR3xZEcVHUxfPUX98Kc7zALlKUkeyR+g+AtK4vsd247y8FEuO4IlFvADGzIjQU6HaQbDTlUo+yiuX+LaDF3EgkjNSROu5EIJpnyEi3X84RR6GanJ3kpfcvPdLXwA4BCoW960EDG1BWGC7M0/TzhWrdKObmS+HFIzVo+v4BA+3cl7vl2FyllO3daC0/4d1JWnhU0SZPaKE3RXbpfsASSBajanuFnrESYrgOcGkoS+ASAxb9RNSVicLMZFsAy072AMI5Qiqh2cK9JgYIIuZ19ZFcJzn35GgyNIHKA31Gd0RhfPR4Qb7H4XS9lYnunXfMyRtR9xwca9nkYO4lIs+k812wJsHZYpHERE5Zp/fnTNDyqQP72jFrON0vQgOmY8UDEWIZfv0xyJA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LnaIXyb5uS1d4dXpSPQTWmij5ZpYf2AaLRPTuDvpkXWI5FnrbKOKvk9KWNW9kOiMr2zTS9/YgLbX0wOXHpZEeQR3/zUxiJP2gZlJd/N+ile2b8jhbKcljC5vyvtW0BqZ16fMOPYa7Yy+4814J7L+/3hn7kQLZKvH+GoIbaG3g6sPxznPnt7Eo6XKqKfOHlZS2cArU08T5DgHT40SuFbSwahlKKEgDpb6hUkpQAICEGIISUZl1Ee/a4+E67UHzLVu8cvMFiK8698bgpEOlHaFdB9R0F/7pVO4O5y2FU/rYdPoVdB5HL1j0Z7paVYX9eKZXXV02in6m64OJGfG7qM7dzJzPKRrh6Zs8Z8sG+kXfhjKx4takw/Cm1gSozxE2X1lu/V42XL/cxJZL+6aeEfZMw0QGuq0VfEKPTIGZkwntk0AoMSmq7awyKBLfXx+h3gn
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:29:41.5574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f0619e-7948-42d7-c640-08de961a874b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB8212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234901

From: Daniel Turull <daniel.turull@ericsson.com>

This series is a subset of the recipes updated with AUH.

I have reviewed the patches, build and ptest them.

The patches has been generated with the updated AUH

See [AUH] PATCH 0/6] Make upgrade-helper compatible with scarthgap and mast=
er in
yocto-patches

The series applied on top of contrib/scarthgap-nut

Daniel

Daniel Turull (9):
  base-passwd: upgrade 3.6.3 -> 3.6.8
  gnupg: upgrade 2.4.8 -> 2.4.9
  python3-requests: upgrade 2.32.4 -> 2.32.5
  bash: upgrade 5.2.21 -> 5.2.37
  sudo: upgrade 1.9.17p1 -> 1.9.17p2
  lttng-ust: upgrade 2.13.8 -> 2.13.10
  libatomic-ops: upgrade 7.8.2 -> 7.8.4
  liburcu: upgrade 0.14.0 -> 0.14.2
  numactl: upgrade 2.0.18 -> 2.0.19

 .../0001-Add-a-shutdown-group.patch           |   6 +-
 .../0001-base-passwd-Add-the-sgx-group.patch  |   4 +-
 ...nstead-of-bin-bash-for-the-root-user.patch |   4 +-
 ...t-since-we-do-not-have-an-etc-shadow.patch |   4 +-
 ...nput-group-for-the-dev-input-devices.patch |   4 +-
 .../base-passwd/0005-Add-kvm-group.patch      |   6 +-
 .../base-passwd/0007-Add-wheel-group.patch    |  18 +-
 ...e-passwd_3.6.3.bb =3D> base-passwd_3.6.8.bb} |   2 +-
 ...s_2.32.4.bb =3D> python3-requests_2.32.5.bb} |   2 +-
 ...T-handler-while-waiting-for-a-child-.patch |  21 +--
 .../bash/bash/0001-fix-c99.patch              |  20 +--
 .../bash/bash/build-tests.patch               |   7 +-
 .../bash/bash/fix-filesubst-errexit.patch     |   7 +-
 .../bash/bash/fix-run-builtins.patch          |   9 +-
 .../bash/bash/mkbuiltins_have_stringize.patch |  18 +-
 .../bash/bash/test-output.patch               |  11 +-
 .../bash/bash/use_aclocal.patch               |   5 +-
 .../bash/{bash_5.2.21.bb =3D> bash_5.2.37.bb}   |   2 +-
 ...o.conf.in-fix-conflict-with-multilib.patch |   2 +-
 .../{sudo_1.9.17p1.bb =3D> sudo_1.9.17p2.bb}    |   2 +-
 ...es-when-rpath-is-stripped-from-in-bu.patch | 161 ------------------
 ...-common-link-with-liburcu-explicitly.patch |   3 +-
 ...Makefile.am-Add-install-lib-to-setup.patch |   3 +-
 ...tng-ust_2.13.8.bb =3D> lttng-ust_2.13.10.bb} |   3 +-
 ...erride-init-is-not-needed-with-gcc-9.patch |   7 +-
 ...-a-custom-value-for-the-location-of-.patch |   5 +-
 ...use-pkgconfig-instead-of-npth-config.patch |   3 +-
 ...h-fix-find-version-for-beta-checking.patch |   3 +-
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 ------------
 .../gnupg/gnupg/relocate.patch                |  19 +--
 .../gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb}  |   4 +-
 ...ic-ops_7.8.2.bb =3D> libatomic-ops_7.8.4.bb} |   2 +-
 .../{liburcu_0.14.0.bb =3D> liburcu_0.14.2.bb}  |   2 +-
 .../numactl/0001-define-run-test-target.patch |   3 +-
 .../numactl/Fix-the-test-output-format.patch  |   5 +-
 meta/recipes-support/numactl/numactl_git.bb   |   4 +-
 36 files changed, 99 insertions(+), 390 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.3.bb =3D> base-passw=
d_3.6.8.bb} (98%)
 rename meta/recipes-devtools/python/{python3-requests_2.32.4.bb =3D> pytho=
n3-requests_2.32.5.bb} (91%)
 rename meta/recipes-extended/bash/{bash_5.2.21.bb =3D> bash_5.2.37.bb} (92=
%)
 rename meta/recipes-extended/sudo/{sudo_1.9.17p1.bb =3D> sudo_1.9.17p2.bb}=
 (96%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Fix-Build-exam=
ples-when-rpath-is-stripped-from-in-bu.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.8.bb =3D> lttng-ust_2.13.=
10.bb} (92%)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb} (96=
%)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.8.2.bb =3D> lib=
atomic-ops_7.8.4.bb} (89%)
 rename meta/recipes-support/liburcu/{liburcu_0.14.0.bb =3D> liburcu_0.14.2=
.bb} (91%)


