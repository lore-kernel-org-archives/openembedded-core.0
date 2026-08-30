Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDEDC61DDE
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 13:50:31 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8795.1788097830587946857
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 06:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=Uq67OhxY;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.201.23, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dg4sH0hzImsgletwWU++NBvS3ZDotv+o8uqEJZoUkxhWZYa1phn4+jRYdOkHraNHe0Mv0LN8Hal/N72ZJLGLKU7xtKa9ezkJcTQpqqWHKEXCigDR5A82xs7mARkeitGkco6wQiZAmOe2knfK/FfBHu2VXLOvHuZoX7JDYEb2fnKwiRQmCyJ7st3SAke3D3cA1Ne6xpj6htYiQxNlym9iB8874Y0POXjNQ7Gr8k9UQs0dQR95vyk5yNOQ2u/eEE41VIhPYuYYI/GHl0+MraLMAHlcXvYLHWVlORSDfFZRyj3J0iDoujFTbtH1GUQI+yAcv8/QMwEUIpZymWu4EsdC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0aMtuTiR9naBI29VQkAkfIB81fIHqbVfoCefgj8zIk=;
 b=eCHXBhITqy5mGzeYMECKLl9Rx1h2+5xp1K0nOZnbNKf915frUPV4e5yV26lJmD9H/PZK39pm4gddluu5RllxCHkBbhQI2Tr5JXVe6Nl1TotYkKALnvKRNXHsec298071vXhAW35BC7nClj+McG7pduXdot3y2xFJv7VyC1Y8QzdxzC+g0EHT7N+FdNA2hN74PNfj7x9GPnkFq4qSSI4hQimmb2liuRdii1Lo+Mg1Ywl6fZ1+nVSAygzh8oJiTIDGX2n3oIkJkzQWeWxkCoRqfmfh0jq4WqdQebFFyKZACC2VpeMqnJtBdVdoBBYeX90kwJ6JdJRqAGuoo9+kkdkPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.39) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=bestguesspass action=none
 header.from=agilent.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0aMtuTiR9naBI29VQkAkfIB81fIHqbVfoCefgj8zIk=;
 b=Uq67OhxYNTvv04n64bKG2cff6H5VLOHtHS7rKxQiKcYoBPLYlg+UgEfG+jGcBe5awO/8aT6qn6wdI8W4jZotclZe34VtcQe1QzoI6ZNOKILoBReS45Mrv9j4y3mCPITLMoxyhCshQ4ygKjgrR8i55FskQ1LCdslh6O3pRh6u9ROSJ1zz52bhKNiRclJ0n+7FcnKc2vTZcqveZwqkqBKLPlrcnqJbjkbxFxczO7qaogePmcOBP572UmycA+VWFW2MykYfHpgSAP9jpiSmP/LYYutwELS+qojEdHLQPqknGaIxtAtzp+qS5XpUDQrIhvxAwAh2eABBtti5RCiRtkXgFg==
Received: from BN0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:408:e6::8)
 by PH7PR12MB7259.namprd12.prod.outlook.com (2603:10b6:510:207::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 13:50:24 +0000
Received: from BN5PEPF0004698C.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::89) by BN0PR03CA0003.outlook.office365.com
 (2603:10b6:408:e6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 13:50:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.39)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.39; helo=wpcosapexchedg6.windmz.agilent.com; pr=C
Received: from wpcosapexchedg6.windmz.agilent.com (192.25.218.39) by
 BN5PEPF0004698C.mail.protection.outlook.com (10.167.245.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 13:50:22 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Sun, 30 Aug 2026 07:50:16 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] oeqa/selftest/bbtests: tweak test_git_unpack_nonetwork_fail to match either fetch or fetch2 in error message
Date: Sun, 30 Aug 2026 09:49:53 -0400
Message-ID: <20260830134952.4182115-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698C:EE_|PH7PR12MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: de69006c-21e5-4435-756b-08df069da35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|10067099003|11063799006|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	a2Izlp0OemH1kjiDu3YTQXZQrHxEU0RJuiWG8ZHsvozwb3eiUvcYhAIdjqNanS58N83pQVBvneAZWg5V4qqGzI1v8ZR6dJHm1OhZ8BWEtkXTpFUvaWTTcCy94HxVtQmT7LZoa8uJHfj0TPAAsiEKkEAQLqJW5WGLnLMGXkQAYVcKvC7lEIDU8YM+cWJBj4aszU7X8y5E6bHKWQQvvJnBnp+AcTmJdyWZel8bLmYjBTBPYxUiCbUixix4GQY+rM++OqKgqoNhsygr7WhIuRDjAUvL5flx6F8zfOaFfWdv4nPvo6MW9CWP9aFAkCS52S7w1ALIEQLyseUJKqmYoth7ztncNhdYTe0nxPC2SfWKYShkTKXrGglXAgbSK8pgxVwEAglJPye0tHrXbRODRz1Q7QJUdx59hWLoeKiIEiKJteGtgxNP8RH6YV4Q8X+SIPh96c8ky1JE3OYGCsmSD0Q7oy9jcoLawA84yZtBgF0PtZlCcYkcnV7kuKyx4C/fG7NdN5OPWhDSWchIozVhlCzG7s98Srd09hdIeVH3uzkPIP2eZh5Ntd8ztf85k5bI29ITh+/y0424VpGJHYvpSYLvFBGzNtPYuOxxL/pEQy2+1ny3FMEfqOgae5roIFkcQ8kQ0gjpxoHGZffP5C1kedbHPA==
X-Forefront-Antispam-Report: 
	CIP:192.25.218.39;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:wpcosapexchedg6.windmz.agilent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2nmTpCWiU9IrknKJnOzU+GamLDPLGfAOi7C27rnpBc5AwVgQ7mWy4qyT3nP/1E1KnSDzgfwLq54WjdqvN+VL7mATj79lX8oQZluOBsghxEUIXpwo6TGpDVxIokXmiAxAZa5Wd2qCNicavPcm+qeL64Ws1sWFXbC/3mdK7vSQiNdIAXbv2gjyAtJPPJdK1at4jzT587IDPsDDeRTrjFZXCCyucilmD47VnQpplHQdUZGjqU81SYkJ30XeHmRZlYXr8fU13iJbYSxo9zAV8C2j+lIvdUFHOig3fQgU03qJsZ8cdAMTuw3ba/W74K7GYyN9B3tTIcdPN3wEG8YVOg/MdIrFgdfcuDdlv1zRMQKdQk1USn0uGboVAAN0gXi/+u71AC/RIXCJaMIEP8hdkVMkjvfUYTIsyX0uQ56mPwRswN0olsSD+qp/OyLj0FvMGa9W
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 13:50:22.8905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de69006c-21e5-4435-756b-08df069da35c
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.39];Helo=[wpcosapexchedg6.windmz.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN5PEPF0004698C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7259
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 13:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244654

From: Chris Laplante <chris.laplante@agilent.com>

BitBake is renaming bb.fetch2 to bb.fetch, but the existing srcrev test
looks for bb.fetch2.get_srcrev() in the assertion. Change the regex to
match either fetch or fetch2.

This avoids https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/bui=
lds/4744/steps/17/logs/errors

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selfte=
st/cases/bbtests.py
index 860f499269..519d96d4b4 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -365,7 +365,9 @@ require conf/distro/include/no-gplv3.inc
         self.write_config("DISTROOVERRIDES .=3D \":gitunpack-enable-recipe=
\"")
=20
         result =3D bitbake('gitunpackoffline-fail -c fetch', ignore_status=
=3DTrue)
-        self.assertTrue(re.search("Recipe uses a floating tag/branch .* fo=
r repo .* without a fixed SRCREV yet doesn't call bb.fetch2.get_srcrev()", =
result.output), msg =3D "Recipe without PV set to SRCPV should have failed:=
 %s" % result.output)
+        # Match either 'bb.fetch2.get_srcrev()' or 'bb.fetch.get_srcrev()'=
 in the
+        # error message, in preparation for bb.fetch2 =3D> bb.fetch migrat=
ion in BitBake.
+        self.assertTrue(re.search("Recipe uses a floating tag/branch .* fo=
r repo .* without a fixed SRCREV yet doesn't call bb.fetch2?.get_srcrev()",=
 result.output), msg =3D "Recipe without PV set to SRCPV should have failed=
: %s" % result.output)
=20
     def test_unexpanded_variable_in_path(self):
         """
--=20
2.43.0


