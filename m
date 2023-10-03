Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DAFE8FDB2
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 20:20:42 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.50])
 by mx.groups.io with SMTP id smtpd.web10.1165.1696364437136724360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 13:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=pdIUHxaM;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.95.50, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHFagiIlDfhdet5wGhfdPL1XYm1iZLlnaxV6mPhZ+N/oJ5jU+qr03Ns/q29dcqMnrRQqj3P2/xYwPzVxh2dHeOmXyOmPqr4HDSqLtrmVWjdHI5GPFuT1RuDzPV0c+Jby/l5R/SSi0uAY5AOaufl0a37T+engdvovttTIhJAqo+Fb3BQh22MkcTV6HXiID5eZDz3c/FqhfxbC55/2nHGtiLnCqc3ct258bqjo7FvuJ8xpIE3W9H9gB82duYe6PYAi57Mhs+L1oDMKilDGF1dwefo0DHCiWHuBNl4MylPoaTM58Wu677h2lgL9yrWce1j2Qq7/AXffqav7YMfeT5eLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9oELKgPi+En3g+cVdtXhc9lp+pNkGisHs8y7qV+vqc=;
 b=aTzlURSaXmwW4BlpJDnQl0RLV8v3mE8hsDFfiLD6vzm9CyTM9RR7PF2zZr5SRINwXBlMI8UwBrAJgSDAtw9Ez2IuJHCVp2UFZl7IJiM8rlR/PlQfWQl9rVPZ4MopWwScIInJU1CBfEMYQPUUMcUh8jc5XLFi43nEy4av7oz1W26qQR/uywhuYVlmfwpNJbv31/frFwurGW+QvBD0OcjF1LiGD++qb8pPTv5/NZvAQC2xDtvTsLFKv4TW004G9e4p5BXT06RWprFwPdIwqEVYDrq5IzMItEY46apfkzpOI6jUpJruXDOF52tpnl5cafe//V31OzN28ggIPi1SEpJsPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9oELKgPi+En3g+cVdtXhc9lp+pNkGisHs8y7qV+vqc=;
 b=pdIUHxaMPbNEp6e/eQsNjnG0SH/Rz7+ufJ0saP+QQWmn5iKj2k7J2+vWkWyrCqBtuI2OH7CA7gv+LHH7rgjP7hMssJlpA91MVkKa8SpXahqtZAM4OPRmCQDhfsol+Ucuh3h490rw5uLTpju4qT4yM//RKBwuTZudRV8OQwpSWfTXLovvm7duDcy0r9+NnvbxXgy1w9uiyV0KkvRPASq0UzHk78S2KEX0cG5vJmJHn80dhcTXuEIz5oAUAySgB8cE8Py/NvBK55nG5N9tBQDrgy9/SsqGbKGvWZGf7oW/2cDi+ftEviBsUOheuUNqhTzzSIxaNpBIDxw++BITnhG36A==
Received: from MW4PR03CA0202.namprd03.prod.outlook.com (2603:10b6:303:b8::27)
 by MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Tue, 3 Oct
 2023 20:20:34 +0000
Received: from MW2NAM12FT026.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::cd) by MW4PR03CA0202.outlook.office365.com
 (2603:10b6:303:b8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31 via Frontend
 Transport; Tue, 3 Oct 2023 20:20:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 MW2NAM12FT026.mail.protection.outlook.com (10.13.180.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.24 via Frontend Transport; Tue, 3 Oct 2023 20:20:34 +0000
Received: from chris-virtual-machine.localdomain (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 3 Oct 2023 14:20:24 -0600
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] recipetool/create_buildsys_python: use importlib instead of imp
Date: Tue, 3 Oct 2023 16:19:54 -0400
Message-ID: <20231003201954.1182127-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2NAM12FT026:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 42872f01-be9d-4fa7-0e15-08dbc44e3305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HgF+YpxYKEY928Z1M/+M4ZGhxiTWoeVaGvWZxE/SX4x/VlgZKY4w4hj4+eo8LJx1WFchy4ZAEaBd+8c566ISUTtlMoRKM00EKQ6W2U7qaztJxd+YP1iO9dPbMpvQ/YpUNxSklP7Dp/bK7oFAmfzIu+8ZPacBDWdQ9CnT3Rka2AMj6AWBtT18d+eRd+0v/Wa0R319820IoAfL+SgmaulKiv+zbSWgDTNoM6cOiBsUpZGLRHM6An/21x8ah/mjnUIuSh4QZR85euxMs1nA1fNk+vRB6K32m7Uei8FDlBnI7SrIfAdvMThHzd0xqdtxu6FFZNqEXJNNfts+qdUayIKdTtLCXsINrgl7VKuw0fOIWsaFxUc33rngR6H3Aar6LgBeuFWHb0368SEghXvpYZwPHtl8PygPQRUkv3WeAv0A0qPShHoPwUSQ3bNq7a6CpjAD6qwf3jGDAV/p/e9yHgdDa645aAHzKzjQiUQWYAKCrIEs0PElNieeB6iFwCOvh9xxD/8zIaa/vFND0y9KNI1+97kHarEDZEU186GV1uhzzC96kTCMgtxTlW8bZLHtOe0IDtwLZK9FhaMg7Z2X4xpNlQfLlunRSS+200J0KfmXQCTHmHNn+qtJxJ0rp6F8yVm6KolEA5QiDi7Adhs42jPGpu64wN9l5TG+EiAjX2emfRTlwjhi6LRl+7TvyOmGjx/xT3VFr/qdnfI+If6p1NaTzpxcozZ81dcXGqYs57twsOY=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799009)(36840700001)(40470700004)(46966006)(36756003)(40460700003)(40480700001)(36860700001)(107886003)(2616005)(83380400001)(44832011)(4326008)(5660300002)(6666004)(956004)(26005)(8936002)(8676002)(336012)(426003)(47076005)(1076003)(41300700001)(356005)(86362001)(7636003)(478600001)(2906002)(316002)(6916009)(70206006)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 20:20:34.4425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42872f01-be9d-4fa7-0e15-08dbc44e3305
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM12FT026.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 20:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188662

'imp' was deprecated in Python 3.4 and removed in 3.12. The
piece of importlib we use has been around since 3.3.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib=
/recipetool/create_buildsys_python.py
index 4675cc68fa..92468b2254 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -10,7 +10,7 @@ import codecs
 import collections
 import setuptools.command.build_py
 import email
-import imp
+import importlib
 import glob
 import itertools
 import logging
@@ -561,7 +561,6 @@ class PythonRecipeHandler(RecipeHandler):
         return deps
=20
     def parse_pkgdata_for_python_packages(self):
-        suffixes =3D [t[0] for t in imp.get_suffixes()]
         pkgdata_dir =3D tinfoil.config_data.getVar('PKGDATA_DIR')
=20
         ldata =3D tinfoil.config_data.createCopy()
@@ -585,7 +584,7 @@ class PythonRecipeHandler(RecipeHandler):
                     continue
=20
             for fn in files_info:
-                for suffix in suffixes:
+                for suffix in importlib.machinery.all_suffixes():
                     if fn.endswith(suffix):
                         break
                 else:
--=20
2.34.1


