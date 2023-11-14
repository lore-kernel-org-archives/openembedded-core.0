Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786CAC54E7C
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 20:36:24 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.48])
 by mx.groups.io with SMTP id smtpd.web11.3921.1699994177718438836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 12:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=njqRhB+i;
 spf=pass (domain: infinera.com, ip: 40.107.93.48, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uxmdoidi4+JIiwcPuECftYAfesRJbsjGJrQ7Lwq9XEilMNvO4aVr4cnWDeXeIry8BPXDZZ4iEV/j+aLI3Q/InUj4W4RaFUXTsqeUjvu848MVMK5QFICKaPSWuKzmFrJAwBd+qWmBaGrkbUl4qOHT+0NtFd4B5KSRYBh56/7s6ZS910e8xdi11KDHGt1w06z+HeJdgo4Pvbx4JmUKGINH1AUPnJcCYrubs8toIvk5hiuBJlC6cPlOIqtUPyr3toCBabzTg4WbcItpahNG7Y6ZJ/ZQVKRqBEJH7ZlV+YjXXDdQ1K2qqvR3dk1Bpl+SULFOFA68KiS5NSuJs0w5vrw1Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF4rCN5qOM2LapRa2BNt7X7ofq+40Cua1WlH0Oz3C8Y=;
 b=lTcrk22uhUaBK2WO7/CSzcGPJNFnK/RGEivMFOja5m66EfenR0o3fDJrGOL8YgpVAXgQOY9QuCcqwRWFWphiNGFWpnRCnOrCXFIpUMSZhc/WVoH4f8ep5a95WA7Q/JTbHEYYc+B7Nhj1bn+qtb8Q+PCBIgv+LippcYm2Dkos66jDzvzTiLlcPud+wodziXF1MZqlvstRN0KN4mQGmN4MdTGhjzFHwQBDiJZHltXTn77N+H5IbA+I082zwhiuUy4o1zG/uV6mfBkQbGve0PurDKiUChsj9JG4oCDePez2QPMiS918A+cacbHQEC+pZ3KNhlqfZF7N61O1nuxGQkE5Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF4rCN5qOM2LapRa2BNt7X7ofq+40Cua1WlH0Oz3C8Y=;
 b=njqRhB+irjHeYChlLG+EKQKneTGT6xKCqI3ZlsA5gSMTgvbs2uxpq38f+Ajhd044ZwfThnTWnDNh56t+BPGwGrPiXjwWuEs2QFkyV1Sv+vsQDW44KofbOe00BuJsLwswHO99isx1xBX3xvYPEQy1FpuaU7J5wGKxD9fMUf4UElMUGBJ5dfhh9+jTgGDnwsJzAmHThuaYimenJg/p6sHo/aZ8QOGYtP3dq5thlvEmg7ZujC7nDwCYD3+MyruNsR9rGKsT3x4abBkfVvjRlihjoN6Ku7D5QX/UvE+gUv6OtdMQ3eubOeZKFaxu6/qYTFv2p2+O+80oiCOxtdFrwSlGeA==
Received: from BLAPR03CA0123.namprd03.prod.outlook.com (2603:10b6:208:32e::8)
 by BLAPR10MB4833.namprd10.prod.outlook.com (2603:10b6:208:333::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 20:36:13 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::31) by BLAPR03CA0123.outlook.office365.com
 (2603:10b6:208:32e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 20:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.14 via Frontend Transport; Tue, 14 Nov 2023 20:36:13 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Tue, 14 Nov 2023 12:36:12 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.6 via Frontend Transport; Tue, 14 Nov 2023 12:36:12 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Tue, 14 Nov 2023 12:36:11 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 5FC9A2C06D83
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 21:36:11 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id 5D891456169E; Tue, 14 Nov 2023 21:36:11 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH 1/3] base-passwd: Add PW_SUBDIR
Date: Tue, 14 Nov 2023 21:34:50 +0100
Message-ID: <20231114203608.1490318-2-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 14 Nov 2023 20:36:12.0323 (UTC) FILETIME=[34DC0F30:01DA173A]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|BLAPR10MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: f077a11b-5d1c-475b-2eed-08dbe551580f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wYjAqvJmOwVmL/9q0jkZim57vWeq4irLMrp+E7belCBrkUQyxPggFhKMu/nt8n94R7HdzupEYvziBzPw81xxmjPylUxfGCCNYaRgsys80bTDWYL+kw+KgbjA30JNMW2VqThZ1dyXJyBcYvfz5a7yGuelZnmdmqDPEEsIpWHHPlVI++NYSUHcLKAfKAUSwHGWhdB2T4wXGPbKgkYnRiNZNVb1Aolgs6Jjj+6r+7yvMH81KCaHtOa0VkAB4MrR7mchMS3mUUUwXd2YJuxkXH0LOZUevwuydp1OvY8CNXVxwh3BV2IcGTvC/NDXU1qk6C5Uoq8hOjsv8vBeGeEc/dM9VS8mZ1NqkFc3breoZvb42HQKVT3n6Y4VJfixGKGBXKcBCEateBQnHajzgRKSfl4xb6qYdAP3CVRGed/TAUZmEzqN0YPMBjug+UhFC/0YWmPsNyEBMmTRnUqbgfn148ai0k6nzEr6nN0/EqeR1Yrgj27qzqA4csJlxsOtxzwSOflJaaCgTmq/jloG7Yq34nauZeMySt+gLl7zf74SqG4uHWqxFdwL1Ntz/Crjo4XDZdBlFl96PhKQlFliH/A67rRpQfTM+eh1tHA13iL8Q5in9dEBIXrNwF/I0QQ6Xq+78YJt38UKt0zyrTCoL7wLq5aDvwekzzKoOR9qG1GVQ1C47vnnlnPvXE70xrHFGZpyRVbM7yEL5g5vHTvOfWBHdtVOg7KDAPuyHKUlXSzo3rs7vNE=
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(46966006)(36840700001)(70206006)(1076003)(107886003)(5660300002)(478600001)(316002)(70586007)(42186006)(40480700001)(6916009)(8936002)(8676002)(4326008)(6666004)(44832011)(86362001)(36860700001)(41300700001)(356005)(83380400001)(82740400003)(47076005)(2616005)(81166007)(336012)(426003)(6266002)(36756003)(26005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 20:36:13.3995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f077a11b-5d1c-475b-2eed-08dbe551580f
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4833
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190517

Add support for creating passwd files in a /etc subdir
Set PW_SUBIR to pwdb to get passwd  files in /etc/pwdb

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 .../base-passwd/base-passwd_3.5.29.bb         | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/rec=
ipes-core/base-passwd/base-passwd_3.5.29.bb
index ef7792ae49..e453be0763 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -20,6 +20,9 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/primar=
y/+files/${BPN}_${PV}.tar
 SRC_URI[md5sum] =3D "6beccac48083fe8ae5048acd062e5421"
 SRC_URI[sha256sum] =3D "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64=
accc55986b6a36"
=20
+#Set PW_SUBDIR to pwdb to get passwd  files in /etc/pwdb
+PW_SUBDIR ?=3D ""
+
 # the package is taken from launchpad; that source is static and goes stal=
e
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/b/base-passwd/"
@@ -50,10 +53,11 @@ basepasswd_sysroot_postinst() {
 #!/bin/sh
=20
 # Install passwd.master and group.master to sysconfdir
-install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
+install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}/${PW_SUBDIR}
 for i in passwd group; do
 	install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/\$i.master =
\
-		${STAGING_DIR_TARGET}${sysconfdir}/\$i
+		${STAGING_DIR_TARGET}${sysconfdir}/${PW_SUBDIR}/\$i
+	[ -n "${PW_SUBDIR}" ] && ln -fs ${PW_SUBDIR}/\$i ${STAGING_DIR_TARGET}${s=
ysconfdir}/\$i
 done
=20
 # Run any useradd postinsts
@@ -89,15 +93,19 @@ python populate_packages:prepend() {
     f.close()
=20
     preinst =3D """#!/bin/sh
-mkdir -p $D${sysconfdir}
-if [ ! -e $D${sysconfdir}/passwd ]; then
-\tcat << 'EOF' > $D${sysconfdir}/passwd
+mkdir -p $D${sysconfdir}/${PW_SUBDIR}
+if [ ! -e $D${sysconfdir}/${PW_SUBDIR}/passwd ]; then
+\tcat << 'EOF' > $D${sysconfdir}/${PW_SUBDIR}/passwd
 """ + passwd + """EOF
 fi
-if [ ! -e $D${sysconfdir}/group ]; then
-\tcat << 'EOF' > $D${sysconfdir}/group
+if [ ! -e $D${sysconfdir}/${PW_SUBDIR}/group ]; then
+\tcat << 'EOF' > $D${sysconfdir}/${PW_SUBDIR}/group
 """ + group + """EOF
 fi
+if [ -n "${PW_SUBDIR}" ]; then
+ln -fs ${PW_SUBDIR}/passwd $D${sysconfdir}/passwd
+ln -fs ${PW_SUBDIR}/group $D${sysconfdir}/group
+fi
 """
     d.setVar(d.expand('pkg_preinst:${PN}'), preinst)
 }
@@ -114,5 +122,5 @@ pkg_postinst:${PN}-update () {
 if [ -n "$D" ]; then
 	exit 0
 fi
-${sbindir}/update-passwd
+${sbindir}/update-passwd -P /etc/${PW_SUBDIR}/passwd -S /etc/${PW_SUBDIR}/=
shadow -G /etc/${PW_SUBDIR}/group
 }
--=20
2.41.0


