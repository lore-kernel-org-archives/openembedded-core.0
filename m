Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDA9C4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 10:56:55 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.51])
 by mx.groups.io with SMTP id smtpd.web10.10867.1699441014780139418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 02:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=LvuRfO8z;
 spf=pass (domain: infinera.com, ip: 40.107.220.51, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlmbvHTxWJ8YgkyQK0jTLUUDhJofBjbEthPNNxHaRI+tcohjOTDVp+9cxXWnd+jF2v+E1GRaldRWmxbtfl4mGYBkNRE3w9UK6ehVLLZCZYp7q8pDzTHxclWIrUpq4OLNeH8JiAdqaGfPPI7pBBy8AJfrgrC+PaPCZDNjrWMeJVUL0CDhdazF0U3xxfFMr1VoJRTlNItlx8xR0tmlikwieR6FdmKIugSqQz1aDGB2C3e/z2tCvUskay7pEph6VJM0VkbOm7oAp7r8uAdBiveemLhFXUTKokkUVRZZTSA5sIkVdCsi2zIR1kQ+XrrhLwwMYP5IJuCtt715yWYKI/8zmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMx2EGFj6CA6vhENasevL/ro6mA+dAMW7jOBZ1gmRFo=;
 b=lTVjATHzJYWyuBHgW5OuiKitaRJZ+DHsEw9Rt8NOXeumWsCtrICSopFdNm9BXYYKHCz72Bbhrvkc2D+ydoPg0Ykoj3rmp01KA1V6kEhKEmOqOfIxK5fk+BPGc8HcuRgZXQ+FBFiJo1rMckNh5N6c4ylxIWbb85gC7Kq5G9JUS9yl4gMfRkF7hYeKe+gr5SVNTTCGeJ93AX+EMwiCOOxrCuqQvccRCXbrDfKAQyhSfOLdJYdaDZSvNtgVMOOsLV8Om7meVqBftja05nqDQJqrrD2NTFm5yqrzUqf5YOH5QxRX/NYSByP5QDhJsfMRi00XLkmPkr898PjcN3H/d/Yx5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMx2EGFj6CA6vhENasevL/ro6mA+dAMW7jOBZ1gmRFo=;
 b=LvuRfO8zZ81eOCTsyLLDzgGraOn2r8A/t3ZCd6zwHNaMBL32hEb6a/c3Fslbv9xbYspTzqk3oH3YepGBCogfN0DUWV9pCh5cwD/HHKnH4ZJ/pkE6tiso5OgJWn5S4xY2DkEJSUb+8xRl4VkEEAnBD9E5q3A5NEmxQzfWIrPqtL5zwda6pCAIHU66FkHlcxX/qw6rUNPUSHOSkvO70SE0ZW5BArzJ9Mo8lAaO5dc5iZQR3xmQoW32cHwJUWAH3iPzaO5HOJ/Ei7SkRY+h4Akc2/WfxjKnRWrtpfJTueF5e8Wt5acjQ8rmMwwZ9JyhV5YO4QHGeghZWbyagvYSCOFkmA==
Received: from CH0PR03CA0410.namprd03.prod.outlook.com (2603:10b6:610:11b::22)
 by SJ0PR10MB5597.namprd10.prod.outlook.com (2603:10b6:a03:3d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 10:56:50 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::67) by CH0PR03CA0410.outlook.office365.com
 (2603:10b6:610:11b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 10:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 10:56:49 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 8 Nov 2023 02:56:48 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 8 Nov 2023 02:56:48 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Wed, 8 Nov 2023 02:56:48 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 9944C2C06D80
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Nov 2023 11:56:47 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id 940A440117D6; Wed,  8 Nov 2023 11:56:47 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH] [meta classes] sed -i destroys symlinks
Date: Wed, 8 Nov 2023 11:56:12 +0100
Message-ID: <20231108105644.2884585-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 08 Nov 2023 10:56:48.0571 (UTC) FILETIME=[4591F8B0:01DA1232]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|SJ0PR10MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e98b78-704e-47c7-8a06-08dbe0496879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yuXhlaTFIoYDEP93p/vwySl3Tlh92BM3S2XUbnolL8nUZ5vIFQRhW+Oa47Kl3J/xVxIKIGCEIk5gG8ybgJbFYe7vFFhVn17Wv02sR8bLP45YnJ20A4QJJWBj2O6soockOOQoOan34iRiXsuwYdDxO9HAyKkurZa0+mBQuCK35X9BN0L21muDy+yDy9F7ygdm5Cq647WbtxpU84xffi8VZY2K23OlHjU7dorj2u1ndnhkoAMhenXC7DeqtNqdUt813VmCeBvqK+K5Kj2/yZNDAJJHsfNNG/DmU1hHb4tJR4oRYPTq2hSKINcfpZz4rsnbIWLvsg1z/O1GjAy21pZG9eY4HpkyvBdHNCs4XO5hFmwXKFvlC1M4+wtpHmiF2R/3CTJQLCCOXv1Cser4iutUQq3ZgUSg6ko/YI5N/B/w7LOhAj3KIeppWTwVFiZSBEUfxbEj6UitCLVOS8xcEiC7d0oRZqrEK89OH0Y7R0I/y2e7IIDgH5lKJAwTk1tCaeJrP930ZhMbXGomLBeE0zOZGVSo9YI9SS7Y59opf3/WBZKJiCGYKPEouWVUjA5HbU4sJRbwQAirZa9l/PI1na/ijOWf3GM2/DT9rN06ZExmxWOC80g2hFGtyrBtvhanfaFjjXEDyjAuqhRau1G5ILK6NdJOazpiKnIJMThMo4DR7C619m4u7aOXGrsfZ4UbOvTRzthGJ2olMQR2Xr5hWeO7dep4mAVG0CgPjJRZpntwwnY+n2f6sVh6f6MhsPnWN10k
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(451199024)(82310400011)(64100799003)(1800799009)(186009)(46966006)(36840700001)(316002)(70206006)(6916009)(42186006)(70586007)(336012)(426003)(6266002)(6666004)(8936002)(8676002)(4326008)(47076005)(83380400001)(2616005)(107886003)(1076003)(26005)(478600001)(44832011)(41300700001)(36756003)(5660300002)(36860700001)(40480700001)(2906002)(82740400003)(81166007)(356005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 10:56:49.1993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e98b78-704e-47c7-8a06-08dbe0496879
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5597
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 10:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190315

If /etc/passwd is a symlink, sed -i on same file will replace the
symlink with a new file. Prevent that by expanding the file with realpath
before giving it to sed.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---

 - I have patches which moves shadow/passwd files to an subdir in order to
   have passwd mgmt on a RO RFS. Is there a interest to have that oprion in=
 OE?
  =20
 meta/classes/rootfs-postcommands.bbclass | 4 ++--
 meta/classes/useradd_base.bbclass        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index 5c0b3ec37c..55cc863dbf 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -148,10 +148,10 @@ read_only_rootfs_hook () {
 #
 zap_empty_root_password () {
 	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
-		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/shadow
+		sed -i 's%^root::%root:*:%' $(realpath ${IMAGE_ROOTFS}/etc/shadow)
         fi
 	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
-		sed -i 's%^root::%root:*:%' ${IMAGE_ROOTFS}/etc/passwd
+		sed -i 's%^root::%root:*:%' $(realpath ${IMAGE_ROOTFS}/etc/passwd)
 	fi
 }
=20
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.=
bbclass
index 7f5b9b7219..72732a4d57 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -154,7 +154,7 @@ perform_passwd_expire () {
 	local username=3D`echo "$opts" | awk '{ print $NF }'`
 	local user_exists=3D"`grep "^$username:" $rootdir/etc/passwd || true`"
 	if test "x$user_exists" !=3D "x"; then
-		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i \''s/^\('$userna=
me':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i \''s/^\('$userna=
me':[^:]*\):[^:]*:/\1:0:/'\' $(realpath $rootdir/etc/shadow) \" || true
 		local passwd_lastchanged=3D"`grep "^$username:" $rootdir/etc/shadow | cu=
t -d: -f3`"
 		if test "x$passwd_lastchanged" !=3D "x0"; then
 			bbfatal "${PN}: passwd --expire operation did not succeed."
--=20
2.41.0


