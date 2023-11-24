Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031BBC624B4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 14:11:18 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.47])
 by mx.groups.io with SMTP id smtpd.web11.137918.1700835074992332498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 06:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=GWPpmNqr;
 spf=pass (domain: infinera.com, ip: 40.107.102.47, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frVueoZsFNfvATomtwQG74ilFO7rj4MabHdoeE4RKTp6yW377ZkA9ScE8yyDDQRCjp0Guupp20f7cjn+RT6NzcgUXo4TU/EUhqeL0ckmJC5HQkMOlENPkrSaQ/0Ipd+1KjC9bbXdz4yhgGEDnAdlxs4RBj8DJEyx26A2uEPRGqbugtHvWgIs1m3oiCf8+jSnL46bvcroszBl2y4++1+XIvHAc/AK9bVWvOm/VRpn42Aw90pA6cmTW2CzGYkCHIZCygzDVtfZqiNKWdBVtYDf8GxDmb6GiV1cGguyCLpSWWZfkLTN4ACmlmwBq3trSjxNBkwghC+Xdod9x4rqaEvl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9sK16ekKpN0Dy+9KbXMMtzFtxkHWQhOFFGnil6ONvE=;
 b=bPV5xQEcVEJC2MRr7Jx59le65L+6RTs2ClZdWaKUk8x+lzTmU/C7PGPDYZ5V0sNz2FYgcbL83NjcPLlKIE6zXJeRCsSLejvmAWx/qVJUHEWmn97s0j3AHRHwQHLK/nLENblaxmShEoer9ubzVRBHqtAtSou/08punBD0hEMDlkNu/CBoEfjl09Vq2yi83I8I9pyZKTmuJYhlMhy/pC8W/HEI0gXYf5zz8BL7kmbJI0OIKsKoru29WkltC6PYTzAnlLKoLIHe/fj5Vq67BvVXAP2R7C/hfO67LiBVIHpEYLe4oR6RYamLtNhYBQojPq9s1iX9+5ry7oS1v8OKEGoKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9sK16ekKpN0Dy+9KbXMMtzFtxkHWQhOFFGnil6ONvE=;
 b=GWPpmNqrvSqtZkAWM40yWve4fagzkzVvyMJJAPhyZUM/wv8aHLljF/KdI2Tl6uLLcE+5wf0Xa56SRoiJm9I9Yuqe/8q/TPoMQ/pvU+zP0x2MHEG374eXzoOpa2Px6CG3IbTTVEWqlKeyj/XnsPUUfH84ycRoyzwJC0zpVbaKy1EDTEvVin83HCRj0nN3EnM5WO/34hN6XRAfEWlfxhtM4457J1KQC88n6rZ7GN4snyRXOporhs1Y819GoE+4LT2/xnIkA7Hc5YzN3AcQmWeAZkmmoNnUxUwfZoV/kaqsAc3zYTh2c++8L6cqKdC1M2vKZusdU/++Tlc7pv8V2WUBBw==
Received: from SN7PR04CA0094.namprd04.prod.outlook.com (2603:10b6:806:122::9)
 by CH3PR10MB7119.namprd10.prod.outlook.com (2603:10b6:610:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 14:11:12 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::72) by SN7PR04CA0094.outlook.office365.com
 (2603:10b6:806:122::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 14:11:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 14:11:12 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Fri, 24 Nov 2023 06:11:11 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.6 via Frontend Transport; Fri, 24 Nov 2023 06:11:11 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Fri, 24 Nov 2023 06:11:11 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id BC35B2C06D80
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 15:11:10 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id B5BEB41DEBD0; Fri, 24 Nov 2023 15:11:10 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [kirkstone][PATCH 0/4] Add sub dir for passwd files
Date: Fri, 24 Nov 2023 15:10:49 +0100
Message-ID: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 24 Nov 2023 14:11:11.0613 (UTC) FILETIME=[13E4F2D0:01DA1EE0]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|CH3PR10MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ee6562-049c-4597-ee91-08dbecf736c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hHbB29pFJp3OILifQQ1QVW3tqm1GSvPwDpoMdfVwAZ9YsLqJvfwbsV1OK6hFgXFl3U0WGCq9wseg5rzmNyx3VOAykZrKjXZqXKQb613Fq8mT+1zJSX5+QrUkxn2bYZaboRczuiWr7FP1ZHvLZRRULwnKdTLkMQ8AuP+UhzjGF9G102XtXuHCgEWQAh9xT8X1G4C7N9NKn+VwLf4Qxo6piQett4BX9Ux0b4FHE+/Pni0z/nKLp8VdIAk5x8ufIlNkBP6Bg6gekJuMODz97+bUVGnjxKfTQz0OC+4AWC6qc+hqL1u23KFWRwEr3Hk2FVB0BlH2CAdC0dVy6W/x3dsUN1dwYQ72teS4qrjQQMSD6AHuMLeVr6UBaxsWaZ8NTKIGOhIqHAGVjiXGsgCE5AxOhvwx/XO8LUW525OC6Og3pwDOyAUmHZucm1iMGxQatnK+ErF3bBVif9uPPfDrYtVEsi23m+ytyEWPbNvOi5SgUGGU6RL3rMtEa9x8YL2L3lc0BQ6pKa5I6QBdv5LTeR29C1aoHDbr/2K8gmixyZew1HBO37jZPclC2sFc7vJCEoc4JkWHSrEFjtoEnWPcUXKv4bLw+Vk4QG6f8WQ3xmHnnZzN/49KfryHOhtcsqZw5tRpITkaV8AQiyzJlWAsnmFXFiRb/4Z+YqocYMmIk6exdltPvkUIPbwnQEc62CDZT14uUWohoXQgdG/RVoC1buloZvZ19imjMBArOQrn/Cjaya0=
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(1800799012)(64100799003)(82310400011)(186009)(451199024)(46966006)(36840700001)(5660300002)(4744005)(2906002)(8676002)(8936002)(4326008)(42186006)(316002)(6916009)(70206006)(70586007)(40480700001)(41300700001)(6666004)(1076003)(107886003)(478600001)(44832011)(26005)(2616005)(426003)(336012)(6266002)(83380400001)(47076005)(36860700001)(81166007)(82740400003)(356005)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 14:11:12.2269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ee6562-049c-4597-ee91-08dbecf736c7
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191196

These patches adds the possibility to store passwd/shadow files
in a sub dir, like /etc/pwdb
In a RO Root FS one can bind mount a writeable dir on /etc/pwdb
to support password changes etc.


Joakim Tjernlund (4):
  [meta classes] sed -i destroys symlinks
  base-passwd: Add PW_SUBDIR
  pseudo: Add PW_SUBDIR
  shadow: Add PW_SUBDIR

 meta/classes/rootfs-postcommands.bbclass      |  4 +-
 meta/classes/useradd_base.bbclass             |  2 +-
 .../base-passwd/base-passwd_3.5.29.bb         | 24 +++--
 meta/recipes-devtools/pseudo/pseudo.inc       | 11 ++-
 .../0001-Define-SUBUID_FILE-SUBGID_FILE.patch | 92 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       | 30 +++++-
 6 files changed, 145 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Define-SUBUID_F=
ILE-SUBGID_FILE.patch

--=20
2.41.0


