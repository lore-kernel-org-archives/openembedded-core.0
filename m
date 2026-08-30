Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123F2C61DDE
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 14:17:02 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9225.1788099418650221702
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 07:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=TZkytoCD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.93.196.22, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/9o6PBKmhgj+mGy1Z5AFIXK2jJjKQyVIvJavFz97RknBmR+TigYjIkG77dJoq4+9CUgnfhTfocTrU204XNetV9heDXN+ETHGJp0EQMEE7pj0ah+w5Huo+yRpPgs8BhwKC0wdszfbhLtbmOOEELiPkKQuEcn0fO5Ja1g7uP/JB1VxNh1GCExl/6V77fNaZVWnwjRYsfLDA842W5Xcnkq6gv3CIBlv9BzFQLxBqV28DBNGv7o6wE72lVG3SBVIaT7Q6ftXbFdqQ/25OXQyU5Q6Y8WTYgzgbZ8E99aco3KV/FYXaH16L/H+yK2K/CSV/CH71yfZ47j4QK7URHRRs5Uww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0aMtuTiR9naBI29VQkAkfIB81fIHqbVfoCefgj8zIk=;
 b=gWJnIe5yJPbXAVAgNjoD9M6Z7IH7sFQ7mGgE/eANHoygAx8Y6rj4xrykC0nMWtXL8pVb5PhRyPeRRpm7Ww8N98Ta7IHlqODMoAvPWzIlkJYZxkvVXbOmJUkQNFMr9AKidz6L/r14+QEb/RNVYHSxtUHkr6McnVWOEV/+Hgos4BEqZJ9cF5HNqJzPALr7GILp1TfeTrh0KCNvEQhetjDjvRRSGpPvxeUPXClx3VQOX9jRA8iYpyXNzQuOf/1uyqmC5nN7tZxM3/s5k1hpaYsQxaTbHJC5XMhiFOxuemk6WP8NtqA88e4U2JJBUghtyI3/86aXfEPcCEoN8P7HlAzv6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.39) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0aMtuTiR9naBI29VQkAkfIB81fIHqbVfoCefgj8zIk=;
 b=TZkytoCD0WyiwHEB1TtpHYO2+xU32/bO5rPXYfK4jpFbwGCgUX32/1LG4DY/Y0wtvqeEUasURsS9rkAn8az1eNkMR6HUGNwtjplYDwe5yKBgM7XlvsOMy6BRPpbSFISLI5A3mQMkBA7zoQc83gtVLrYXuM6nMlwcuRN9mSnAYG4qAB+nUn5HzxEJcO/pUkVOsTKo7nzup+j0IWhUyy1lVAkBS8i3UmT9YJ+OWVmTqu8RkCGef+kX+tGeJ3O355LRjd6aagMcqTuMwuZu19dWl0H7Bf8yQ86744T6hm10Vacp2UvSbG4VvNJg6eCKGq/laKF4nC6uoCRb8T3+qnqsmw==
Received: from CH2PR14CA0004.namprd14.prod.outlook.com (2603:10b6:610:60::14)
 by SN7PR12MB6672.namprd12.prod.outlook.com (2603:10b6:806:26c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Sun, 30 Aug
 2026 14:16:54 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::3f) by CH2PR14CA0004.outlook.office365.com
 (2603:10b6:610:60::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Sun,
 30 Aug 2026 14:16:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.39)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.39; helo=wpcosapexchedg6.windmz.agilent.com; pr=C
Received: from wpcosapexchedg6.windmz.agilent.com (192.25.218.39) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sun, 30 Aug 2026 14:16:53 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Sun, 30 Aug 2026 08:16:48 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2] oeqa/selftest/bbtests: tweak test_git_unpack_nonetwork_fail to support bb.fetch2/bb.fetch
Date: Sun, 30 Aug 2026 10:15:50 -0400
Message-ID: <20260830141549.8956-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|SN7PR12MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: b8fa0e6e-e507-47d3-5aa2-08df06a1578f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|3023799007|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	K0VjpTMHZT2/jtG08FzMFlkQChExcGcc5USAJw9hjuraHA0tZurchlSu4cpXOgYc9lFdA3/kp6Tt9vD3X1MT7s4tE7gY4UPguSXv4yddb3+IdTMYrGFqI+tYh0vNoSrXxNmpRw6UndrGgd5dXz74IjUM3mSLwMfJLzCanhAv4g4FEHz3TAzYq7wIvgizxPgYVi6XqgSVBACJrMGYdVK4o08wkSEAT5GhyIRv0JwZMe3PnG6r5gIWnz6O8/pCVHqQBmmiTl3+dG9q7eBU5C3gwazkMHVjUSJ+TD0bGbIyy64UGhV99D6M6tq+eHcjHZRvsUmeaXIL3Y7Kqc/tR60jRr3WzFPXH86Z+2VuIMGRtEt8ueBwS3Lq0yFWdwk6HpjORlb+jg/atYLKvG46wzOaM57CEP5wJ5jZW6CtjsczmPGyTrI4BuG5m/2ib8D6h/gxELMn8oILDcqOvh3u6wCFIpwclQJV48WZCIe7RBaDifL3tBU4rkQpHLl+s6b/m7aY8ewr7fCqEuA6FBkOkN14sKM1FH4VY/s0ZL/20lQBGWJNmaSviFX6Stc2YYPYw0wEaU6K17aWzk7CR6EsnDTnGJMBwVmEJG1ZqS2MjdQqGjmIRRFDqE0dVsXcixo6FkWJrP0cukjOSc+h/w9BmEpC3g==
X-Forefront-Antispam-Report: 
	CIP:192.25.218.39;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:wpcosapexchedg6.windmz.agilent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(3023799007)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VL1JNVrBorDcgVtFalP5fotsyPahb2QaKsrRUM+e8JH3rvUlvs2FKXdqlDwrsIgzWrPoTC8b6IFE41MCQnV68fWu7Qa9+BjBeE62C3+bd6I6N18worbLFLyBiFerTclm2I3fJpXKoUj9JMD0iAkEwRkTxnkoxOoX4u5MB6tcU6HF2FFG8ySN+6lkD3XfUYGuggvv0i6JwJuLRGQnRgHVx50xgK6lgKcNneJDkfqedBn4bHKDAx28as2O42SVeDjf6RA7p1e2udU3V6HPky3RTpH0neZ1i5nT0zgirWQ5MfAUMmDpiWOvg5a4HTaYiPlfS7xloLSplPcgulGP+si6uYnjgctC1L3icwJUGlXKkhVVDITAP2+tfZWhqdTTQBvpwXdqKvZje0u1An/kGxVWHeGVihy4JbjODZGfLm03MztAF/nXgRplHkSMmxmASWh1
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 14:16:53.7395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fa0e6e-e507-47d3-5aa2-08df06a1578f
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.39];Helo=[wpcosapexchedg6.windmz.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 14:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244658

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


