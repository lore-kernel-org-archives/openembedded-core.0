Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A72DC54E7E
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 20:36:24 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.83])
 by mx.groups.io with SMTP id smtpd.web10.3897.1699994174943597359
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 12:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=BhEc6bgu;
 spf=pass (domain: infinera.com, ip: 40.107.94.83, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVJzQMhgx1IMyiSlGW3OR54Jt1y9qA2XC92UrIF1+2F8lkMtj4YiorxYrC3yPlFy82asEc6YIv2lQ+XphTRlvBZhFbuXOm5vmkshsrLDI0l2bU8gINoUkBHfBq08n8ZIO22RG4rFj7S130BZO/1FBfN1Fm0TODnqSJ7aKuCYbuVVbhZy+icp1PXoBYb27gCP4BAo2NHjb9Co6X7hstoHzVaKx+JAy7BqymlUJvempq7EVRc15i4fxAFK9Ywn2Ie8+K51pa2nL4UJn8+jn2hoB0zojTBOeO70n72w4gZAZsUsekRJWIkDIOJAc9/ZQv4FED6I8im5+j5O48fVpYAn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcRJ6JFfgoZaQW3N6QR28rGr8jrPuYAJtEr/4EF/mDQ=;
 b=gHzj71PU7O9GtLrFW66KoIqkieubBcicy2iPqUCfuYQBiJLDK1ffRotJxBGr+JJ9mphFuEKRWWEqa1Q/8RJ/NkHbWyQV3115HGvYYzjnmx5llHKXe4BsS3d7LOjjADZlybXcoSfbE1Gw3YZz+d7rTvo6pydQjWqa/EIyl58bB9yfsrrjuNg2tXNI58F+MI1BrImj4uXf2OQ2d0eWgEOZHU6PH/bsuYzfqdAJHKPCgnC41WQliUCT5t3t+SJXwXsBuKEj49EoDzAmadZeptTVTvCZKWhygIGRRc3hysRgj9KUv9bEdnnJVwEjeU/j6BV9GVfmhetxQr76RbguPHahtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcRJ6JFfgoZaQW3N6QR28rGr8jrPuYAJtEr/4EF/mDQ=;
 b=BhEc6bgufYoFq4csEEyhRs0JZ7jICkCOCpon6cHuUx2vA+ru75vWhWR2ypYsgI6IBR0X8XF9sweGt8nge4/l6mmDrH5mFe+WXo7lKzpObWguNdbf8N9Wi2sbiSGbc+f9IgB5Q9Elc6EROWnYOurIiUHZtaJEOSE20USUbrJnWc3Oyt0NKkq2Qx3dLUI/xV+OZNfit1Eg6kJYBaextsz7UIwdg8U0oEeRJWEJCHAMyHpGHkqqv25GX7io9Avys4ecpCL/TVUpKUisJCB628pWCfZxC42KcgUo7F9vnF4MYrcxog52ndHHAwONPwuGeKiEpXDXEAf7gIImGh/HsvrBag==
Received: from BLAPR03CA0144.namprd03.prod.outlook.com (2603:10b6:208:32e::29)
 by DM6PR10MB4393.namprd10.prod.outlook.com (2603:10b6:5:223::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 20:36:12 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::20) by BLAPR03CA0144.outlook.office365.com
 (2603:10b6:208:32e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 20:36:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.14 via Frontend Transport; Tue, 14 Nov 2023 20:36:12 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Tue, 14 Nov 2023 12:36:11 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.6 via Frontend Transport; Tue, 14 Nov 2023 12:36:11 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Tue, 14 Nov 2023 12:36:11 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 705A82C06D80
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 21:36:10 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id 6AC39456169E; Tue, 14 Nov 2023 21:36:10 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH 0/3] Add sub dir for passwd files
Date: Tue, 14 Nov 2023 21:34:49 +0100
Message-ID: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 14 Nov 2023 20:36:11.0392 (UTC) FILETIME=[344E0000:01DA173A]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|DM6PR10MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: e144bcbd-d38f-4726-cf60-08dbe5515771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b9lOhL/6DdvUspX5YqNMpev/06DpK3Fhrn8syYzGjxpsTQoOnHk6jIkGQoNw8gYMfmqFOaHT698EPfi4X0Bjk/XoDrHX3Sp0A4akI5GSAgF6iulM0oHmmON+PEltdooKBlLyMKxSZMVXv/nUOzLwz0LPNAjRgSPWUWwfEAVXyFOURa/DKxmRalSCpFbruklCbZHC7noecAwIaGW0J1rlMeLKXSModOmZe3npGA7aBEKHI5wdx3Q8efKp4FlM1WlQXL4W2B6MhAv0qXynbeopx5mUhklLnaPrrrhHPgz/0dxQ1njoD5R/JB2E/7N6wE6lEy/damr6vvCeMEUFyDkY4NV7VaBi/J85UI17g5pjy0VRPy8x0/9QWht68RUBLdNW7Bv6KdMiCYcTdKzFtz6MRAPdgiwLdqJyKGZAieCtSmsACoesHE9HZ6eY95zFDKW8E4OjWG5nLMMz/mIPgJzp3KMUSSlATsq+ffktmnM5Rivx7C8E/BYtq5dnAXv4M/md5QjLeSYlCqUWYNPFim/+xYMJ4IgmUaxKzqonFNnPVDLZ/DZK1fspGrsgMIQUYt2val/QJXdHmqojqjve490CNs+3S/D1+/fuyrCzadOO9zuTLehmlIgBZTSOB8uaWIlAV5gyhLGUQMI+OL+6FBbrsMRxuJ3dThElUyjQnk/AbyGnFevs20p9YUdYK0mNRd4OhiYtioDkGqiBH9dhuSNwXVfn34g/n/n7N8i89n8PxSYN+6USW9obdfIWcvPMbEv8
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(1800799009)(82310400011)(186009)(451199024)(64100799003)(36840700001)(46966006)(47076005)(36860700001)(41300700001)(107886003)(1076003)(2616005)(44832011)(8676002)(4326008)(4744005)(83380400001)(8936002)(26005)(6266002)(336012)(6666004)(426003)(2906002)(478600001)(40480700001)(81166007)(356005)(5660300002)(82740400003)(316002)(6916009)(42186006)(70206006)(70586007)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 20:36:12.3526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e144bcbd-d38f-4726-cf60-08dbe5515771
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4393
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190515

These patches adds the possibility to store passwd/shadow files
in a sub dir, like /etc/pwdb
In a RO Root FS one can bind mount a writeable dir on /etc/pwdb
to support password changes etc.

This patchset is to probe wether OE would be interested in such feature


Joakim Tjernlund (3):
  base-passwd: Add PW_SUBDIR
  shadow: Add PW_SUBDIR
  pseudo: Add PW_SUBDIR

 .../base-passwd/base-passwd_3.5.29.bb         | 24 +++--
 meta/recipes-devtools/pseudo/pseudo.inc       | 11 ++-
 .../0001-Define-SUBUID_FILE-SUBGID_FILE.patch | 92 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       | 30 +++++-
 4 files changed, 142 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Define-SUBUID_F=
ILE-SUBGID_FILE.patch

--=20
2.41.0


