Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023ACC61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 14:11:18 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.60])
 by mx.groups.io with SMTP id smtpd.web11.137919.1700835075557546388
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 06:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=EpCFVBTt;
 spf=pass (domain: infinera.com, ip: 40.107.102.60, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g46R6O3JJTJeM1BEwwz9AyhFEiWFg7NPapIwABAG2CqXKlIjMlGOo1+ZXWPHIzratSQJn6h93VlbwVipR1YUwKeKOQrTvvzR1nJp9v6DGG4OdDWLF+bcuasqLrMwc5AbPOpTwqvfzeHMEXpsVuRVbT9MeFuy9fWbmBTzkLJybjYozx7mCAPJUwmGhM7ofOewFsfbClLvb+ARnkvBmO1ZL32kXYejwdxJ752bcT542K69MgMMgQksEszfh7y93np4LOWhmrmf23JK07qqoO7I/zgwEZ65Zs805l+rvtQIF/o6pJvRPiDaFtvHzBhLHjGL1U1NZtR1R3RVsA5EKhR4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwknF0Mh52+30C3/xH+86OSdTsE8LHsdSTnGkzE/Q4Y=;
 b=EeWIBZ19TulThtBfz4qmKhKmDLhoPLJeBr6xsWfqvRzmnZ4fmc2NVLcMZCVCpl2GU+9Wc2KdP6c+EuUuDfIY5YNK86mkRLXuFquaCjYL+npjhy+AXXUkvkuNmfJqndYUaK41QM4AA6Fn4vvOVk017nNXoxL/Ud/mW2IfXiFjhH5Dn3CT4d3wKTl42heI4pTbQ9p0ESVTk3qYh5UTKczDMHCriGGsDgT52TxeaeA6NPrVqe7iupPEf7qaCycDsPWUGIlDPkDeWoLz9yNcM1z6mTXLNR6IdJTXwJkzliGm0MuSOH7X0qaG2fe/1MAnK0Uc+mmwgJQXoGwYmCanDm2nIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwknF0Mh52+30C3/xH+86OSdTsE8LHsdSTnGkzE/Q4Y=;
 b=EpCFVBTtNhUCif2pZLPwsl++dHuSRQIuTgSpbe7pkhSddtILRC/73AHGQZG3hmBKY243mgH/dYEv1DldktgEs+slT1XAIqrhIc85bB/yma4+Pz92nVU66JFfYL/kE098sU9CEtEO3ry49QZ9z5VfR2Js9ZpHZ7Rcs1VvIYVhRmf6KiZ0w/5ap/zEAdqF1EcOuWX8cfvoB1LdUbuaLjf9ILF1mSxZz3w2ln04NIhs4piOCrgYFzulCXqDjicYcaP8b60yu3bOS/pbGt0k8JeMD7/dPZ2EEEcdaQuoT2OWndPSbIK7ruqFr6t31KW6wyTWShmTJ3GWNOVuR3iB8M/FDw==
Received: from SN7PR04CA0099.namprd04.prod.outlook.com (2603:10b6:806:122::14)
 by DM8PR10MB5398.namprd10.prod.outlook.com (2603:10b6:8:38::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.21; Fri, 24 Nov 2023 14:11:13 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::75) by SN7PR04CA0099.outlook.office365.com
 (2603:10b6:806:122::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 14:11:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 14:11:13 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Fri, 24 Nov 2023 06:11:12 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.6 via Frontend Transport; Fri, 24 Nov 2023 06:11:12 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Fri, 24 Nov 2023 06:11:12 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id CF5A32C06D80
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 15:11:11 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id CDCED41DEBD0; Fri, 24 Nov 2023 15:11:11 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [kirkstone][PATCH 1/4] [meta classes] sed -i destroys symlinks
Date: Fri, 24 Nov 2023 15:10:50 +0100
Message-ID: <20231124141108.1397342-2-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
References: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 24 Nov 2023 14:11:12.0711 (UTC) FILETIME=[148C7D70:01DA1EE0]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|DM8PR10MB5398:EE_
X-MS-Office365-Filtering-Correlation-Id: ef90b1d4-baed-4b68-999c-08dbecf73754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L9ivcJLWtby0uA3R9q6aMj/bbXZ866MIVEY2Fi1RJqvO/Cp4ONsj9gaicwbBIAMuF/ljUO5xgkUua93E4iFgE3VfiqJiga8CbDpZfzKKEh61y51s7TruJ0vPy9isUP73CueXO9q7CgR/EpVK4dRmP1OvC6RFbROjLpEe63JrwlDYp1t1M1jltTi2VjlUQSKHftganNszq5UpA2uW6gR3mEXwMiUeOXNDGeUIb/A+kCgIJdEJNF1Ju+D6FQfsF85NwKUfLOkJ3e/IYSV0BSPwO3l/oOAg1Wg3NU3+s4WDw73scAuiaed5qU0ytLOD4ml1P92rO/2fKkrlAcjvdO3v8JsTNkMAGzskL2EQTOnGymkQW6Yg0s23akZSC6dqpVIiyuAU65Akno4Xzt//kesgtV65LM13LxoMYh2lxspIK0gqh4nrw3MZgxTEu0GZ4EWIfR1t3fYelpK3h42G4hOffkXMe7XoTRP+RsIhW/+SlLeX74I8Acb7B9L7BhOpU8DFcj6kXQ6uBpJPtjvw48zP5aPUtP9DDJSh4nvKJNKruBXvppv0SkxOQDFBLzfoeD/FuxSU/SWU9O7eHOuKklQ38yjq4dD7qh1t28xTPwPeTOfobzXC+OQlPQ8fd6VBe7WZQ0skwiducfaREnAMf46HP3DsGXruHH9vqWXrTnVFuu2sLWRCgD+bh0t5mo68vRic61I/GSU83KhiP7wYikj7mOHrUddQDdJ7g+4N/06A48jRXnj7fuZoUSgV5ShD/VlF
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39850400004)(396003)(346002)(230922051799003)(186009)(82310400011)(451199024)(64100799003)(1800799012)(36840700001)(46966006)(316002)(6916009)(42186006)(83380400001)(44832011)(47076005)(36860700001)(4326008)(8676002)(8936002)(5660300002)(478600001)(82740400003)(36756003)(41300700001)(40480700001)(2616005)(356005)(81166007)(6666004)(107886003)(86362001)(1076003)(26005)(6266002)(70586007)(70206006)(336012)(426003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 14:11:13.1488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef90b1d4-baed-4b68-999c-08dbecf73754
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR10MB5398
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191197

If /etc/passwd is a symlink, sed -i on same file will replace the
symlink with a new file. Prevent that by adding --follow-symlinks
option to sed

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
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
index 7f5b9b7219..da47311e84 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -154,7 +154,7 @@ perform_passwd_expire () {
 	local username=3D`echo "$opts" | awk '{ print $NF }'`
 	local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" !=3D "x"; then
-		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i \''s/^\('$userna=
me':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed --follow-symlinks -=
i \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || tr=
ue
 		local passwd_lastchanged=3D"`grep "^$username:" $rootdir/etc/shadow | cu=
t -d: -f3`"
 		if test "x$passwd_lastchanged" !=3D "x0"; then
 			bbfatal "${PN}: passwd --expire operation did not succeed."
--=20
2.41.0


