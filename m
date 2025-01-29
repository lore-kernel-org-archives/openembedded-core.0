Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A84C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 20:20:48 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.46])
 by mx.groups.io with SMTP id smtpd.web11.22636.1738182039244555624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 12:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=YJPewq10;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.102.46, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWYNnngfaO1iPTQv3glJxKPL8+XJqGs4mVkR7PkmYE8gX/wRXizCDEI8AGtmooCgEi3yUHLDJuWVcDg07OZ/leYEghrzNsbtB54WMaHnEXfNWIlqdlqdwIe0tjWjuitFW9W+gp4tTpj2d6UV0orBgqw6UU7WrhoSQXYnO40ZydGTc9bz+MYilc+0TIP2/ysnQuXEJ9RDjtziCxQnpyQl8q0eaPw23ky90uCM/+L3u9+faZayV5wtowKonpPgkG42UCu+v5HItA00s/2EWRVedr/mqMZZLdqp77qNWySS0G/mr6IbfkuRYONfwxKBBwuPmUELLzq9RAeAiVcHulz2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZxAs3OZReTsx692I5e2LWPsluISO1jrE/4TUjRHMkk=;
 b=Jt+ARnTEQW2AHEaDv4u4GcrmLuLeYhA9WhqVlWJEiKGjyScSvt1NeTTQPSeeMPlVd+shgP3S4OrLTKxQ3qRWfptzD0aHO7JD3Bz6K/WyYpl5H7vjjGf3zzlmiFYqDvi1u2l6AT2cI1954NtrE7buDH1ceAmtDNqoXO8zQQmXNwYi76FwwnMhjZKJ0CSjLOAXJcgrAHu5Tdbd7g45QkiyeUGGWxF37/sUBIR+k3cwT1T3mApvZ1bqI6JsmOCXwHFG/CRRQlxkUz4eK4siTlOol74iKmdcryt0IRuAkG8gP7VUiJzpXuaD4yTyFQFlP5/mQoBT6jPo2msU3La/Fl/5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZxAs3OZReTsx692I5e2LWPsluISO1jrE/4TUjRHMkk=;
 b=YJPewq10F7BYKRsDkRAh4UpAXrKaM80T+zbOqYTcbmuZjZC43OKZ/chhvcwGJDE12GbxO1H1f21O0OrGWrQjxJwWmB4t1nY/wdmiepzeeWkMRtYQJ9plYyHfDpK/P9nK3RcCcF/7VNuGSeyEoJ3sNnU0Pj0iA4eFbbmUJr5N6Q8lLxD96mHr3x5VT+dk71G/rUUg0PguYwO9RvKsC9392PiBhHfilbO/PEnwK06r/oR4bIyGwO8HBl6sr4Rba7rr5A7SJsOtOxeGLArO66d6FCxiX/giS3iyrjLFf/O6Pe79E6KjgVO0h/3Ir1sWc4kOKbE1CAxA9+CFtdLeNSTWMA==
Received: from PH7PR02CA0023.namprd02.prod.outlook.com (2603:10b6:510:33d::30)
 by MN2PR12MB4063.namprd12.prod.outlook.com (2603:10b6:208:1dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 20:20:35 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::e2) by PH7PR02CA0023.outlook.office365.com
 (2603:10b6:510:33d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Wed,
 29 Jan 2025 20:20:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 20:20:34 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 13:20:28 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 4/5] devtool: standard: simplify get_staging_kver
Date: Wed, 29 Jan 2025 15:20:15 -0500
Message-ID: <20250129202016.1833520-5-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129202016.1833520-1-chris.laplante@agilent.com>
References: <20250129202016.1833520-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|MN2PR12MB4063:EE_
X-MS-Office365-Filtering-Correlation-Id: 0529f886-b859-4077-9102-08dd40a2633f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ogmd3zKSwj/vROytUeFG5xtKbkp08veKf6ZKEjViNjCdAh8ZwysXg6SoepgK?=
 =?us-ascii?Q?BJCiVBcyzjuY1SlGDLlErhFKDSt31IUypazGwxJKbFPNGPjpnQ0lmCcIQnDQ?=
 =?us-ascii?Q?QNZQi4Dn1/tRf+yTnRC3sXQe/SPmRe+972CG3RNH0pfZeQL/pQUxgWb80MTg?=
 =?us-ascii?Q?E5fTeHCbnCM8fTtMHi7bxcmm+I/wrBYmm09xcla/5xT2dAK5Q7tMk0UQuqZR?=
 =?us-ascii?Q?C5QGtbFz5DL+td8gIPQpRGJrs2s1HUdOJiJQW7YNU6cV+RUU4Y9XjicH+dIa?=
 =?us-ascii?Q?YDEQk5KZivR7xRvVCIt01Xd7uQ89/pCkyTdVuphkYq8WyFPFMGBPPrbk0cLp?=
 =?us-ascii?Q?JA2j2nXalnOOz2PJAIxWIlUcAijMLn3hQjGOfwrarow12FQdCfupQC7ebY+8?=
 =?us-ascii?Q?7phxGxZ6jH+MtkxRU2sHeePKf44XoNut7WGMXBjMdJJJN55M5veLWFJ7lg+U?=
 =?us-ascii?Q?Jr6x7N63L9fxWra4UUxGQpt9L2E/XPBOAeFxz8j8sYfO2uCalHdIwSc3QVIZ?=
 =?us-ascii?Q?FI5ve5qhcyJv1h1t8XRsIoLHRXh66KdIC6xbxJm27tI5dao+8H4fDYS82Glr?=
 =?us-ascii?Q?QzyzbJcMmhNgkFNCywLFUcA+0hWTZPHhog9aTldsSyyLIAYZ0DUlDyOJddJb?=
 =?us-ascii?Q?UXJeLWSj4fy4xi3hQl3U30e1BgwQMVTmMj0Yf9997DrR7chG06c+TBooitEC?=
 =?us-ascii?Q?wZIdPf4/3VIKSlu8F6jmlaYduzgzX8IYTWK5IP64Px7Z6hutlXzjYykxBg80?=
 =?us-ascii?Q?1SN6wcVjRvvQURUdmG+KxAUoZnE5rZjY1CYkkrpH8yTFh4PSfIWYXTjMRNnC?=
 =?us-ascii?Q?G7q/EbrNxRJAOWhm+4GEZhuSrocZvLkuOKZ+qwXY6JxtTokHzFG21jVp+N/u?=
 =?us-ascii?Q?ETh5VKzZqRpbbvW75J5j6lKos6v5x8tLuarJngJirXDQB8fJaPSFu37581tv?=
 =?us-ascii?Q?yX794y8K4b6N1lA6Lr1WzFALPx+svoxGxyc345hMgcvYKV3uTzOgATgVDpE4?=
 =?us-ascii?Q?7LyLeDFYKIsgn2KbICBPVqXBTzkSINY5b2EpUmuSUs7nqu4nzdEekpn/NfKp?=
 =?us-ascii?Q?r9rNYRzxKmTO8OVwIhCATk7B3ECsSjUPR+oNCBfGgTHSSjrZiXI6XHXO3qEx?=
 =?us-ascii?Q?VKBZ5LZx3jwBvNmDwrsAroi/oHJzMhbjhcyx3EFCrT94JsrIC5gVkmrgB+fk?=
 =?us-ascii?Q?f8xXCOmSHo9UnN7ArIU2bTLRUI5w+JBX+cm1okZHxUt5/dGsCnUp5aD2cw2x?=
 =?us-ascii?Q?YKIY4nL2twGCg3o6EodmUGYrpFp6Ai8Vz7JlszO4VLu97WfjG+d+/t6z6blu?=
 =?us-ascii?Q?nqdv0H1nyJRlHGBr/6+jCxiKtd12PGGCHGGC39GGJELXYi8bLI44FbRA72K5?=
 =?us-ascii?Q?buMnbwFXkk/IojJIhptiGUf5SzGs71vSK0qBz61qp82TLEZA4Idn9JtUFdbE?=
 =?us-ascii?Q?g5l/GNM6ABaLwevYNFvS4XEhP2wc3gpre22/VKiqaOSfJmvtaMmgujIqaLcC?=
 =?us-ascii?Q?IsUHMaDKaGWFCo4=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:20:34.9374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0529f886-b859-4077-9102-08dd40a2633f
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 20:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210414

From: Chris Laplante <chris.laplante@agilent.com>

The goal is to make this more Pythonic, as it was a little cryptic the
first time I looked at it.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/devtool/standard.py | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 20c94616b2..0cdb9c6cfb 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -726,15 +726,13 @@ def _check_preserve(config, recipename):
=20
 def get_staging_kver(srcdir):
     # Kernel version from work-shared
-    kerver =3D []
-    staging_kerVer=3D""
-    if os.path.exists(srcdir) and os.listdir(srcdir):
+    import itertools
+    try:
         with open(os.path.join(srcdir, "Makefile")) as f:
-            version =3D [next(f) for x in range(5)][1:4]
-            for word in version:
-                kerver.append(word.split('=3D ')[1].split('\n')[0])
-            staging_kerVer =3D ".".join(kerver)
-    return staging_kerVer
+            # Take VERSION, PATCHLEVEL, SUBLEVEL from lines 1, 2, 3
+            return ".".join(line.rstrip().split('=3D ')[1] for line in ite=
rtools.islice(f, 1, 4))
+    except FileNotFoundError:
+        return ""
=20
 def get_staging_kbranch(srcdir):
     import bb.process
--=20
2.43.0


