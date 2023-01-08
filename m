Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C70C54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 17:25:42 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.52])
 by mx.groups.io with SMTP id smtpd.web10.49660.1673198740545971760
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 09:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=YRu8o8yi;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.52, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYsSPxyumsUamL6q5GrrwMJn+tEu3lcY95AGfpxEEsFVMOdfLacMKGNWs88UvCu8FljIzQhjC/86UrgTuxJIKPq8lMtQeLTCaQrF1VlTZW9vWRpCmzSHJLZUKmypF6QDbPEHMN08QDgyz5tGXmy9RBAlKU86RO8CuOcdaScFzoSNmYz1SvlrFcK/uyt9cunl4eX3DQb2Jt4Mwucpw6C9Y1i9W1Wpk6/2Owy7tX8c6ZG2Mn805m6iYTivClW+fuNUFp48fIdW9uUOQNl3uOtCdr987xxtGij60iUMMOrIHr7rMH1mHMZ2UIZ/mvxcytrPQNoaBv/Z7WCU/1OrLO4UGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPYySPf3R0k3/EEardkl0w1Ji08XVIjnxW9BLLLEP0k=;
 b=jmKfIoajN/Shlxoq0kGYzQ1omt5w+GDRfIOyDNYL9UZloodHn2XleR8F5h/BBvs3W1Rgi3hkNWX8H727Rwd6ynaX5bwfRVl2VLa0QYHgoFMJ1w2hFowXunWQfOA6hextg6kSjiEVZlDE0gV7KlBpdGZFpEpnFNcNsAeNAQpanscdXsX1gANqTVlXJDyTL7zAJiTkbaHRPbNhUu1+wHeAcfl0oEKWw1NaVy55lln2v2kUI0SJcYn/lFvSeDrf0SKpCAjeOI7675qs9yORQRUYtgEzLKwxHJwHNLcYbWn6VocXvJS7GAN54R6xqGHhetC2/bFmeBxW2jEIj5SgT/b6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPYySPf3R0k3/EEardkl0w1Ji08XVIjnxW9BLLLEP0k=;
 b=YRu8o8yiVSIQYZoMGKQCPTIx/gP7gi+aGcbLm669TjqfVdmxl5ylOlo+3vjAj86TOtAOdT7mfnhlqYoMwGia7NQWQoULXoxSIt3Tg2fV2dmsog7/5cxEfG91xIIYlmxPf24DEdc7dx/uNleU/g8UOpi68IFMv97mmRbuxSO3jys=
Received: from DS7PR03CA0297.namprd03.prod.outlook.com (2603:10b6:5:3ad::32)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sun, 8 Jan
 2023 17:25:38 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::1a) by DS7PR03CA0297.outlook.office365.com
 (2603:10b6:5:3ad::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Sun, 8 Jan 2023 17:25:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Sun, 8 Jan 2023 17:25:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 8 Jan
 2023 11:25:36 -0600
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 8 Jan 2023 11:25:36 -0600
From: <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>,
	<michael.opdenacker@bootlin.com>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-Core][langdale][PATCH v2 1/2] kernel-fitimage: Adjust order of dtb/dtbo files
Date: Sun, 8 Jan 2023 10:25:34 -0700
Message-ID: <20230108172535.2366114-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: d272cfd2-f9f4-4c48-a6cc-08daf19d5c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T1mSYafgnu5awReIWx10Z/F/pspIIM3/ZP935RBNqyHic16/5UIBpD7vUIH6SdwW4AAu+Q92n6RRXAboM+f8M8NDNh9a/R/WbGouG818Qg4QM4Jue8mWsNaPvER0Ovfji6gxKwx6pElSryXrIjFvI/ajmBiN5n7qycrYvJglUAXnqQr8OZGYgr+j7tNE0KCm40XIvBJLf3p2Hy/4j56XGaxsTiUfG7DBRhsNMYtXpRGeldqOMqN5FNjHNaId+aJgzG/VxFkAg2swq6JBRuX59JCOx7OuTxXYvHS0dj8anPO8lNQdCNx8RJXp1zunFYLECH6zPfYXCdTKScVnndCH7733usXYqUUl8hAx+pCH1xuHFwhb4PESaePPzTsdkWY8hEmKbnXb6dtYU/juWp/OBe8d/6b0Z1QoXA5hXRyhzm7y46qn/0vr5f4jQwIFxO0iWADiwJknbWEiIq4jDnQYgEY30F+Q0hPuV7d0BuAmT29nARj5BAU6m8Z4wn9ATfEK1gKgIRIPxS5jw2JxClGIzFZVUOxkwCK3pkpXqJvrrqDq0n9L0JrApIz4K31aTYt9fWxs3NmmeGcpIg3Nhw5BpbxPCM28KMq6f3eb3LhZCdRFV7ldUTtcwj9/IxLzq7iF1H3Cxw7UNzDAyzwT0osVpbdXtN5ViTXJpq5EBzIJuaU1Bo24Onf7tLJbQ4CdJuR0+Ggbj9v9y08X265w+WSAvX2Jfp19a7c2oMaJOWqYWHE=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(8676002)(70586007)(4326008)(70206006)(316002)(54906003)(110136005)(356005)(2876002)(2906002)(5660300002)(8936002)(40460700003)(81166007)(41300700001)(426003)(47076005)(36860700001)(86362001)(83380400001)(478600001)(36756003)(40480700001)(336012)(82740400003)(1076003)(2616005)(186003)(26005)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2023 17:25:38.1967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d272cfd2-f9f4-4c48-a6cc-08daf19d5c0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 17:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175633

From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

The dtb files must be before the dtbo files, otherwise the overlays may
not be applied correctly.

From Bruce Ashfield:

  We can split between dtbs and dtbos, they just need to be sorted
  for reproducibility reasons.

  Of course, this was only working by luck previously (before the
  sort), since it has always been gathering dtbs and dtbo's with
  find, depending on filesystem ordering for the order in the
  fitimage).

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---

Changes in v2:
 - Remove 2 loops and use single loop for dtb and dtbo with same logic.

---
 meta/classes-recipe/kernel-fitimage.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 8ddebf8dd8..06cdc4f1ec 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -546,10 +546,11 @@ fitimage_assemble() {
=20
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=3D1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -n=
ame '*.dtbo' \) -printf '%P\n' | sort); do
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf =
'%P\n' | sort) \
+		$(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf '%P\n' | s=
ort); do
 			DTB=3D$(echo "$DTB" | tr '/' '_')
=20
-			# Skip DTB if we've picked it up previously
+			# Skip DTB/DTBO if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
=20
 			DTBS=3D"$DTBS $DTB"
--=20
2.25.1


