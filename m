Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD01C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 13:29:31 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.40])
 by mx.groups.io with SMTP id smtpd.web11.12483.1699968565461711731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 05:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=g3Vxnsow;
 spf=pass (domain: infinera.com, ip: 40.107.236.40, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7HURDvjWoL2w7Dj6LVxh6xmMD5J+n4lLs/Ske5e3dwWN0R01WeZ4UIYzRfm0OwjjZlFEOcNZxbfzupp5R2Er1mW/Zke1vwSgSuXnO4Ik+JkI1LIS++o2yBSRR6GYGJNToQFAZuQw70N4Umsk6yZ6CadWeNV03y2GLQJWWBN3O6fXmlUDcSlFu4KFGtNF5cm3O7hzwDGs4SkwH1TlpTocZfi6P4dh4lnPMbCyoTVYNMbFOEBxlbi3aolBI7kzQB7PGPux7XrYyC2oAnxkUPv5Hr7XH8caI6UrDF7VXXFdkmDzeZN0zVPc4Jb1NweKs2/1y7WjAebRzmxxQIB0EviWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzyCjW1M652b5JNAlTSNMEvYV70fyItX7fcaguJqpAo=;
 b=ab7uIPnfv+Lzgl8HubYAZPL3JRj1MqNLJmF7wEZDGEckAxpvyIHgX6fL9UMaexriATUw+fhelwM2k/kcrGSgmxEMvXmlTV244FaHQmoYjXrjd87mdUThqV6o7MSp+S/D6H+I05VjxUluLOdfDvXvYHlAniU7sqc8NwYllqEkN/245H+IHpe5uZnCSs8POHBWcalLlCD8SJ9Q054PUWyURRnuoiUmizdchVEpsyovjItXrcz7D3zDM9Hg4chWXLqX9LmdpTyplp5UrZ+q09PKn+NmmfNuzeWVfg7cL0Mf8MJwZaB+3E/l4UfjE5iCjm2IETD1zYL16MLDecQrTeUX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzyCjW1M652b5JNAlTSNMEvYV70fyItX7fcaguJqpAo=;
 b=g3Vxnsowkazf1G9glEz/tyQxkdRmHt8yjAlH9C083YAl7fAR45M85k2nzlvHTIra7HBb+5BJ+GEgppuGkugWwEvMWeKI3UAO7vugU8tnHH4ijD/tOhcY+FuQyBxPEfiQ/6HzNyyLr2IpUu/r8qG46RylnLRgs6ZrjKc1sd0xlcVVJ2l6pESZFZv6mFLr3vnZLqFGdMANLe+9SHJHYYwoxbDdlVG1+K+9d2b9MVDG1ke4ihGQ1C8fVZTkoiQCRij1qEY57vvfkDGsLmfzjhuzy2sDPs3VKbyCaZOHYtGyNZkNCW6q1xLJZIU8Li3DbWZefI3iyZHT8yfEXnDDpJYB9g==
Received: from MW4PR03CA0358.namprd03.prod.outlook.com (2603:10b6:303:dc::33)
 by DS0PR10MB6871.namprd10.prod.outlook.com (2603:10b6:8:134::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 13:29:23 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::f8) by MW4PR03CA0358.outlook.office365.com
 (2603:10b6:303:dc::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 13:29:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Tue, 14 Nov 2023 13:29:22 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Tue, 14 Nov 2023 05:29:22 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.6 via Frontend Transport; Tue, 14 Nov 2023 05:29:22 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Tue, 14 Nov 2023 05:29:21 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 4A5962C06D80
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 14:29:21 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id 41EAA456169E; Tue, 14 Nov 2023 14:29:21 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: "openembedded-core @ lists . openembedded . org"
	<openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCHv2] [meta classes] sed -i destroys symlinks
Date: Tue, 14 Nov 2023 14:28:42 +0100
Message-ID: <20231114132919.380395-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 14 Nov 2023 13:29:22.0242 (UTC) FILETIME=[940FD220:01DA16FE]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DS0PR10MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b4f2c5-e6b8-4a95-a409-08dbe515b6e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NuOQKZ9CLeXEuLc4Wz3lTuQDT9bZnx8AVdMqqeoTaleeHt67P11sYE37Fz8/YL8AXSgP4CSKmmoWlaurc5mz96DTb9SYC3Pql2d72JdSJdJrXjPim7szjDODf0FnjvA0DOQq/bgZQf34+sRQD3FgsL/Mgqz7kjvPSkZ5CA1jOWS5P0aNwkkpKqZ7RRCNrE6i6dMjv8PJioq7opOEbnHaIqH5sqGNma1bcK16ekC/uOIt7vSkNW+DUI2vd2IcOKjzpgIoF77sK4xLXNjO2WRMRuVVNrlObL1EXMU4JWaX25NvPYeR481AIsQDVL6B4mPCumwS7RM6ZoRxBnqCSXDv0mYlAon6ZmBDpnzgws//7uX80IUX604vb1xUbECOPzNDg69ZaisAlmogZjhtvC5U5/Ojtwz2CGzGQk5dGZBRhhYv1K2P6k/y12A6uUr74wLtDwD+DMrg0DZQqR+WLVRlZ0WLIdx8/VySxyGgyogzKmSArFvcWBa7gdCMVcBJjmDZsOhuwMNtYHCHSY9JfHiBo7n4GPMByPzqbk5Pv5gdAdwWPGKSrGx25TRaH5D3scdsys6+4jMWGrSJoQ8Gq6Gj2+EmmrUI0qc+glfukcIe18qvNZaK9zMbldLdUeghX4GtXBsFv5MFxczEMunqBL1WSaMJxKQTTVAO6ziDBdP8Kw1sq4tsLnUC+Fk4cPpi/OmHo6oCHw2AAWiisRQUo/3y105azkFQ/rr3eGv/MAlbdbBxB8jNcvvgAilhpvmZnEOe
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799009)(36840700001)(46966006)(40480700001)(42186006)(70206006)(6916009)(70586007)(356005)(81166007)(82740400003)(36756003)(86362001)(83380400001)(426003)(336012)(6266002)(26005)(1076003)(2616005)(36860700001)(2906002)(478600001)(107886003)(316002)(6666004)(8676002)(5660300002)(8936002)(44832011)(47076005)(4326008)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 13:29:22.8140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b4f2c5-e6b8-4a95-a409-08dbe515b6e7
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6871
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 13:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190506

If /etc/passwd is a symlink, sed -i on same file will replace the
symlink with a new file. Prevent that by adding --follow-symlinks
option to sed

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 - v2: Use --follow-symlinks rather than realpath

 meta/classes/rootfs-postcommands.bbclass | 4 ++--
 meta/classes/useradd_base.bbclass        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index 5c0b3ec37c..993262dd0c 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -148,10 +148,10 @@ read_only_rootfs_hook () {
 #
 zap_empty_root_password () {
 	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
-		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
+		sed --follow-symlinks -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
         fi
 	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
-		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
+		sed --follow-symlinks -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
 	fi
 }
=20
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.=
bbclass
index 7f5b9b7219..5c34dcaa9a 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -154,7 +154,7 @@ perform_passwd_expire () {
 	local username=3D`echo "$opts" | awk '{ print $NF }'`
 	local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" !=3D "x"; then
-		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i \''s/^\('$userna=
me':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -follow-symlinks -i=
 \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || tru=
e
 		local passwd_lastchanged=3D"`grep "^$username:" $rootdir/etc/shadow | cu=
t -d: -f3`"
 		if test "x$passwd_lastchanged" !=3D "x0"; then
 			bbfatal "${PN}: passwd --expire operation did not succeed."
--=20
2.41.0


