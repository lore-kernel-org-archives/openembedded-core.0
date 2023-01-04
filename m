Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AF6C4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 02:53:38 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.75])
 by mx.groups.io with SMTP id smtpd.web10.2885.1672800816888982756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 18:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=MJFotgSe;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.75, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZrl8SAy68GSHF8gWzKqNKfynt+rBMyXPMhN+iSuFUWwDI4WKb2WSJpYjbZNHlAerKn/dANNgG0eTnYFsBWoSSxMsrBB1JGA8ef20CUycpqC8SFLbikBclkfAmeXsSJzfd0BYOe+RFWajMzlP0+YkPA5HGLkuRQtdUGKlodebrOsosSyeSGOYnNie9Elpn4vImBpROXKpRx1R2z8IfqSlgts1ncChv3OxZKgX0RbAS2IrXmM/wINqz98bRTNuxgWo1RHGAV2B1DzEpqS9uwxZ4rfMddoHO7ZeRdf7UM3BQ9h0i+qYBUU/B2/rUECFOjmtFRK2lPLHfg/QC26LPqRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvpHODOxUS8JO7mbL9CntZtVl+YibQ21JMvNTB6J+Ng=;
 b=PezfxEWLqqaYni4pq3A1uWGT3mOuJllYK4GhyrnysYqRWq2q62nt5GhDHVVPBhyBdYTCELwjzSXKCNSXiDNm3Wz7yCpBLvoLRsz2UNoABY1m10rpD/5/VeyE6kMNsppoRIK0mULYbA5HqYjfzK9fvL0iKxL9CMFxE6ymaEeIG49lbRXCxSVfXsLDZ6PsJM8qk16PYQSi0K6ZUQcQYfT8Ug1Hl1S0dhG00wWNa3x9N6SAQ1Nf+c/OsqajbmqWvalBB7MJCSXywJwYp2fIULRikpHlns5eR8XI3bTzWw/6eaE+iTeKUAn2SHn4GXXxybXa594mYwKN3wUo6BheHR9DMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvpHODOxUS8JO7mbL9CntZtVl+YibQ21JMvNTB6J+Ng=;
 b=MJFotgSe7xXiyr+seKlLi8RLNrDXAD4Fvyusu6UWKCu+rLJYIVYFHMr4/T1Xj2GaJ5rqL3TTksy6EBWiYDBUnkRjnJC4Xl7F+D0hUnEeiG+R26RbeHPeW2qInQMnBpVINcjN4gksMydmut5ATBvF31aibN2xkpmACTbfpzUJLk0=
Received: from BL0PR02CA0079.namprd02.prod.outlook.com (2603:10b6:208:51::20)
 by BL1PR12MB5948.namprd12.prod.outlook.com (2603:10b6:208:39b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 02:53:33 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:208:51:cafe::d3) by BL0PR02CA0079.outlook.office365.com
 (2603:10b6:208:51::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 02:53:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Wed, 4 Jan 2023 02:53:33 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 20:53:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 18:53:32 -0800
Received: from xcoapps69.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Jan 2023 20:53:32 -0600
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: <mark.hatle@kernel.crashing.org>, Sandeep Gundlupet Raju
	<sandeep.gundlupet-raju@amd.com>
Subject: [OE-Core][PATCH 1/2] kernel-fitimage: Adjust order of dtb/dtbo files
Date: Tue, 3 Jan 2023 19:53:29 -0700
Message-ID: <20230104025330.2648640-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|BL1PR12MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d13c63-1ada-4cad-1f63-08daedfede55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qki0L0pjtclF0GnYG0VCvhku/m43JktnxTZSV9PtmBYsZutcD/20M50iO1inyC8oEw0vtgJS8QWcpsLtVu5Z48JvRkUO4BseBbRnAAGpdDfELWI9PfceHviSZxgRX03tU9Ny0CYqW3o/bun4wrQXnhZUM3+nAqm/I1wUW7ICA/T2vLChEuvz+uR58KYcp7mmI2HpXBP+mCbibwTzuQcEUBV58R7m10Nm7JD3IwHYa+Yzb1OTOhdroj6ioFFh5/cAC3fpjIzPi3EF1GrH7X1l1dPNRRWiGjyH5GiB/NwRqNYurrUBLtavXPUryvZ1f6wArLgffzCAGEFXbmsYpgbPzto8dA46oVnj8lsAESFy0rZXaFEhB36Itqw36j5UL2pUWJv4PwGm3Z2a4VZJeS5SYZZofUdMCeZ6VvO+4r49ys7/h5dyzPTw9HGPXRUe2XoKNftcUbur0AOds+jZZtR5bgqnPQCly+eNNF51gBE93RWKo/U1SusDDHsHsgXaQZLa+XhzOsXErKw5WBB9xtPzoY+zHsU2b9Ack7bua3/HPkmtrZLutKwvvcRzVj5cYmp5faJwPXw85K2UQ4OxbiiOreSu1DOOF3/Jwqi8Vvg9kRrL8dzhjnyPgjIFYI0qc898KHqx7PS+d4YqtEPetVzTenUzHTvoF3tbK3/acWzBA+uknBvD1g8HjYmzc5tPrls080c69QWo7Bq0CuuCBwdOu7LdkaGtKnulcP14uPAUNbc=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(41300700001)(8676002)(70206006)(70586007)(54906003)(2906002)(5660300002)(110136005)(8936002)(4326008)(26005)(478600001)(186003)(6666004)(336012)(2616005)(47076005)(40480700001)(86362001)(36860700001)(83380400001)(426003)(82740400003)(81166007)(36756003)(356005)(316002)(1076003)(40460700003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 02:53:33.3316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d13c63-1ada-4cad-1f63-08daedfede55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5948
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 02:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175376

The dtb files must be before the dtbo files, otherwise the overlays may
not be applied correctly.

From Bruce Ashfield:

  We can split between dtbs and dtbos, they just need to be sorted
  for reproducibility reasons. Two loops versus one, would be
  fine, with not too much duplicated code.

  Of course, this was only working by luck previously (before the
  sort), since it has always been gathering dtbs and dtbo's with
  find, depending on filesystem ordering for the order in the
  fitimage).

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 7980910aa8..cb6635a673 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -590,7 +590,7 @@ fitimage_assemble() {
=20
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=3D1
-		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -n=
ame '*.dtbo' \) -printf '%P\n' | sort); do
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtb' -printf =
'%P\n' | sort); do
 			# Skip DTB if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
=20
@@ -599,6 +599,18 @@ fitimage_assemble() {
 			# Also skip if a symlink. We'll later have each config section point at=
 it
 			[ $(symlink_points_below $DTB "${EXTERNAL_KERNEL_DEVICETREE}") ] && con=
tinue
=20
+			DTB=3D$(echo $DTB | tr '/' '_')
+			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
+		done
+		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" -name '*.dtbo' -printf=
 '%P\n' | sort); do
+			# Skip DTBO if we've picked it up previously
+			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
+
+			DTBS=3D"$DTBS $DTB"
+
+			# Also skip if a symlink. We'll later have each config section point at=
 it
+			[ $(symlink_points_below $DTB "${EXTERNAL_KERNEL_DEVICETREE}") ] && con=
tinue
+
 			DTB=3D$(echo $DTB | tr '/' '_')
 			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
 		done
--=20
2.25.1


