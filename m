Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092F1C624B4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 14:11:28 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.64])
 by mx.groups.io with SMTP id smtpd.web10.137777.1700835077773955992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 06:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=Gpm1/eVC;
 spf=pass (domain: infinera.com, ip: 40.107.92.64, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heXBTWXQIPRTdog+pAEPkCgKX8N1tRnr76SXUP4wZ5rFgVHUN4KJIyexzXQH9BYSjo1Cg5Ul5BQBWHYY8lIbEkL8gVpRZwoTliXefXp1o+BS189afCRT1U3VQnTEgWtvZ/BntNn6ZZRn0Q4v+qcrwxFfNTPwTZ8Kz6SFRmAWNt+zKpwT0l8dhhFP7jaIx6xUUgzBY2TeyApaf1o1MVEssp94P/44INvAoC+SE9hXimqYO37WNIkcatMVt5jBbYQLlquzzJO4a04ZM2Xi/G1UC3sWeHwhcsDgWwGmb7cjH6hRqmEX0T1CF1PwNR0czPpUH9Oi2j/mIHs3K1DzFt0hpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF4rCN5qOM2LapRa2BNt7X7ofq+40Cua1WlH0Oz3C8Y=;
 b=TIP2PZmUW5elEtgY32kegAsH1mHOn3baHjVwe+Vd1s3kzS5+gVIk7u5Mcwl1HpZ/tmAwiyBzj34TlFieb1Py6MkerbINgSowQIxTlz5KutstdpjJ9vdOmXk1rBDmULwtqA4aLeCsC8C1/bx9u4McJOptAPiiuFwOrbDXrfijVk0KPRSqf7+C9SDmsugSMpWjfwysVKdrGakbGKF5OgnN5cZfd98EbaVXcYcQ8ZXJiPgVaC+Xgush1HUalMwDP/4hRJco/8O91A/eUSGtA/V6wqdZ5SnsauoWY+BLr49mCovL7Q3/ilqFjDqaBFx/Ua7RRKuTN7QsS6lcviGaCKu0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF4rCN5qOM2LapRa2BNt7X7ofq+40Cua1WlH0Oz3C8Y=;
 b=Gpm1/eVCCAi7R3JpWnxg+1zbcXmohKBmuA8nUpV86s0lOsMq/d3nf+s/wy/CMJJMTmcbPkPVTAUWhqjO7gNwMGwkK6JU01Xe8UnbsnyhTP5LrdmYyVFG7q5UvkvvlKRupsXxifx3L38bTPl6HQxkpDXlk4IpByN2ALLc11Y6+CEOItbABDtMsTj7exQJ14/0NW2FRpINY/mr/OjFQtf1sHcwEC5AA2XpUFj0fRQRrOZHijd9/LQ/Bd5dbI6dg6jPOf+BHI0Wz9h08iGd1yvPnZhiY8zua8cXvSlJwXH8mDZYvRT1+oJWVYAwd4KoitF+clZmhYis4vuIkz2n3i9SSw==
Received: from SA0PR11CA0210.namprd11.prod.outlook.com (2603:10b6:806:1bc::35)
 by DS7PR10MB7189.namprd10.prod.outlook.com (2603:10b6:8:ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 14:11:15 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::8b) by SA0PR11CA0210.outlook.office365.com
 (2603:10b6:806:1bc::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 14:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 14:11:14 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Fri, 24 Nov 2023 06:11:13 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.6 via Frontend Transport; Fri, 24 Nov 2023 06:11:13 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Fri, 24 Nov 2023 06:11:13 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id AD8992C06D83
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 15:11:12 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id ACC4941DEBD0; Fri, 24 Nov 2023 15:11:12 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [kirkstone][PATCH 2/4] base-passwd: Add PW_SUBDIR
Date: Fri, 24 Nov 2023 15:10:51 +0100
Message-ID: <20231124141108.1397342-3-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
References: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 24 Nov 2023 14:11:13.0570 (UTC) FILETIME=[150F9020:01DA1EE0]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|DS7PR10MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: 940969d2-a396-490c-31b9-08dbecf73805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wp7/zFHUs6GPkNV2X0TH9FKX0LShmtUWA7WvSCWCVmiYDJ7gbX+HwD+wDZtB/S3tVBSipILvswCYexJVAHMNdBgWdmU2QZq93GcLzekCDh5g9T/xu11ijdOKl9/JYJuuixcJ5JCM4xCgYZvCGRroZEVLq/l2JFRVrCQcJSOaxhP0xJ1BvZc8HYK7pH6h/6CkufrGnUeRhpXZOvQ/b1dI0owPgO7g0WKdFE7u5nk4j3k0tWjpZzsUcT6QdBB236MVuhNisXx4OHUv+AiCSFdRTlOk8s1ejvd/u9ucrp0eFLQcxa1hqq/7RbVtm8Ks4EDnSHHRflOODeMwVzOIGPXpkXfCC7i1oE23Kj6pDw8T9M6gxyXH2XOPAXyNYJeS1vBraH968rW9ArtsEuQEmcg2ggmvIDCeNI4RGjkFSAroSDSeFBdbjhcUaveK+PP18pOsox2XQcyJtLkjaycd4+wPqTENJH/vajbd8iuRFtK9MsL74188W7J6vOQ5papaJUhq0ti0aKd54M3pm79TYJeQWo+vUT8Zpko2N6otMrJKyR7N26AOsAqmI1JomZpzg9zZr71WK6vOlGlNO9/Sai8Go1Dazg3z+Pfggjt2K0NaULT3hY/nS4k76qUOG3KgZzFxJKYlJJRg+B0737wEd7KEkxinBfaU+Qw+gBeNvexPEzRnnDKLsTqeFxR9QoXiZ4uSy4cqOg2Tm+1+9HL88W5uXtqR9n7r82P6bAt3zpYeYxY=
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39850400004)(396003)(346002)(376002)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(1800799012)(46966006)(36840700001)(26005)(2616005)(6266002)(336012)(426003)(1076003)(478600001)(6666004)(36860700001)(5660300002)(107886003)(47076005)(8676002)(4326008)(8936002)(41300700001)(316002)(6916009)(44832011)(42186006)(83380400001)(70586007)(2906002)(70206006)(81166007)(36756003)(82740400003)(86362001)(356005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 14:11:14.3061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 940969d2-a396-490c-31b9-08dbecf73805
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191198

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


