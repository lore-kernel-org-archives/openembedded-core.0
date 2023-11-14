Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8476C4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 11:00:40 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.76])
 by mx.groups.io with SMTP id smtpd.web10.10162.1699959629235343840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 03:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=Zk+nvZVy;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.76, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=db0D4dit2n04v//BvXBLIHbVEMw+mtDDydb/UxoH+eohRSYE/SA6tv7xh401K+enaqy2Ke3LD0YPVDdMZiSGn4o1UnE0mRRRisHP+/EJ7RXbyW5zIWCw2Jh5q/0Oa2GqBRFpz6In9FRNeINB5TvcdQ4QEyAGmJmfFFEMkO2S89j8AYDYl1Sr9UleLMnCWsY4a7N5HoFV9fkul9HxUOp/+XfHT8E0p+2z2xAC7RwuZVgJzld2W06vS2dUL3ID5UlhNoYClT9kPtjdZJZeXNlApv0ZPgrfBmnH9BRpvGz+0rzxCQxUbkQZmQvds2c1wRh4DHyDrfm+1CkiJOKiCBY9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSeiphtxH3M4khxbLbF2SXb7KrFzNoSZbexrit7SqJ4=;
 b=GLb7nEvd9uMjd9NzJ/AbN2r4wj9rvnFV6Q3Jilj1hl4V5iPlsDboKFbqJYe/Ybs+MahnnSiEPToOfsGlwD/dMDizyBsq+itqYgsiXU4+8V6/7EkzF6cd+jz13AqgAgupKNgSlxPYcyH51JybqNDp5edKPDrgDnjTg0ONcL2RI4iL6TWIcXN68V+a0v+dd1era02IMWLgOvA963cQRrYfC0duGclYWscAX4uAWuedVd8tJC5QpN6XpvB6xW3GRFfrsSE17to5Br7trj297SqDamcYC6iRHivMoQE4btX7npPmptWq9LW4pYDqIyV9pWasFOuI7Jz24uM8EKNuedd26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSeiphtxH3M4khxbLbF2SXb7KrFzNoSZbexrit7SqJ4=;
 b=Zk+nvZVyK0c7oFcJY3Ub85eqGeJ4Hgga7l0DTrkzv4RfF3Pnou4JYPKqgYLoO1bxczJpVAmQHQ4f8AQ5cuecDH43OnV/FqQTL742FLILMoX9tPc+ZwdOW24MDRmYNh6N1iPr7b4iUGVcuRB3OzTW0P8e13aeGZwQHXc2AA7A5ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by VI0PR08MB10797.eurprd08.prod.outlook.com (2603:10a6:800:212::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:00:27 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 11:00:27 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [OE-Core][PATCH 4/4] glibc: use nonarch libdir for tmpfiles.d
Date: Tue, 14 Nov 2023 12:00:18 +0100
Message-ID: <315b15269c0a0cb571a1c69f9c6fd0873bd609e2.1699958492.git.lukas.funke@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1699958492.git.lukas.funke@weidmueller.com>
References: <cover.1699958492.git.lukas.funke@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|VI0PR08MB10797:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c81d640-03ae-44a6-1e21-08dbe500e85e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AAmAqcBCrzcnkqFqbQ6Sw2HOFvqox3CO/YsEOqzCDphtjq29UCk5A8vp/taSNC+MZKZ562knKtJseZmYycaJznO5wuO1sU9w3T0W+gKsJoMdpbHULc3jMmOfnHyXdzfyUDb0Jg1pJA8CnChbl+MXfRUZLN+7wSbcAP26vU0wC6zSWSE7a4EHUFnuPIqPM9m0BgdjFgHvI9uWoCVYNwIVVOwG+XCA4GPGrpruGQ7qQXaxfNmmBZpZaTUHCOgFr2a2SMjnhLOpJ40IID8pltDD6Uvkok/m2n1gGH2moyVHdlTJNfipiSmVqi4MEJM5N9Sp33L4SYfw9NZ4rl/T0k3jHYDbfvhFjPaqRkNScIEDsq23tMF1oVJ1tukBnl6XYDtWGhNj9Xor3gFdc2k6hVMqm1iS2hW29l96uUZymeLlYm94NW2vyWDFTWRJC2HPoZUi+w7F/K60JxHIspOvw+JDfgS9ePMz1H7fJKRcmZ0pfG5wYjMvbF4fBzuY3C2H6LWuFd4FxbCJetDQbU07yPunvxVVvAFjhlcr/Q3QgUXdURFJfZBKCgQovdtuhqFO2D96o92wXYaxMFkJh1f+JbR+SSCqrcrdK2tEDZwAZGYiSP8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(36756003)(83380400001)(38350700005)(26005)(107886003)(2616005)(38100700002)(6666004)(5660300002)(86362001)(4326008)(8936002)(8676002)(966005)(6486002)(478600001)(41300700001)(66476007)(52116002)(66556008)(66946007)(6916009)(6512007)(9686003)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1/fii7IkMVowcu1OYRwpxDyOAgi4Oe3hTapFpfEVVgxLMKbOUkQJivYc0Y/T?=
 =?us-ascii?Q?kX+NFwh+o9sF6hzQMXMVvETM81lrv6b0MWVRdV/GrqGp3Knk6Au8rejRKzHu?=
 =?us-ascii?Q?oxz5qzb4/KmK+uCPprsxiQ0XZroIc3+p7+eFC0VLCcpyqXjLwo5DTrZ4ZwQc?=
 =?us-ascii?Q?m6/Ui9ZWj2LhERzW/NZEgNLGXrRP8fqpNoLNAB1yWUO/p2DaMXMdzrz469ar?=
 =?us-ascii?Q?yLWuHnTQwVGMQ+lYkP/gkhm21rJWiele/WwCXA5n427pXCbUGPLKhhc0WfVy?=
 =?us-ascii?Q?GtS54DliU3/joi1kWEHQZ9Jos9fLKZifgB4QgobWWNrDw1u1XHZ3DOzjs+lQ?=
 =?us-ascii?Q?IfYoN6vAS4Fo/uN/0YjwCmXG/vG1iUDetBWR07KfIhgDPaDyuto9lDaKYi8Y?=
 =?us-ascii?Q?asak0YGwXVIDKXEgJE4X24lHI1rtIgMC+5VNCoKyO/dlCYfvkHwbnG28ItML?=
 =?us-ascii?Q?GVNYrc7+OMC8U/9MAhGYu2Xn5cTBP8wns8QA0g/aANJpeWIlb54fgik1OWAB?=
 =?us-ascii?Q?WPuGz/RNFhi8bMGM5OLyHn4KKj3N/PIpn1cabSNLYzyjr7M9ciTAgkj/2gkF?=
 =?us-ascii?Q?rvsYv5awn2VjV5FY3ZJLUKMAZuxbHHr4P8E2sfUee2qXKytvEuxYY8tVrRO5?=
 =?us-ascii?Q?LvnCMKOWUcEZTDJYAJQlTLGoJnUkPJAihzbr56+1mqxqWm1QjkmPDcHG0f4C?=
 =?us-ascii?Q?sCRTOT8vXzvBbyUfMRcfpoRyDpG9BHKXWgNzQzMfx7zuT70I1HJR6YAHqMLt?=
 =?us-ascii?Q?+Opmn3Miu4WrMM4QXYoc8GxQ8TUD9guMIJZlQq1WpRljscsRnw6QmyWJgpqm?=
 =?us-ascii?Q?+8+psLE4S4IuKf9jM8lOPK1mrR4X6+HV8sU2/0TrFvyaSTw++s2ie83SeZEZ?=
 =?us-ascii?Q?tbgIMt8Vw50FKn0WPyjhjeX0fM8m9IST1TxUKI/ldVM9XobioS3Q/3QrVzQz?=
 =?us-ascii?Q?fSs7zVVhIvl5RMA9Hn+dMM3FWsRX6koVBff+ZokjgA6Gzrk87LrHnh1eE5AC?=
 =?us-ascii?Q?6lD73LMjctX7pU0gUIEXu55y/gU4yKGdTO1CcFpuNmS6fFARDXgAzibWS7n+?=
 =?us-ascii?Q?qYn5CxXm9y6OJKiufeCe/MlShTHGqkwm5g+NPtDUCcYPN18lrYZkYOyMRCbK?=
 =?us-ascii?Q?hQJ/+8iYbdMZ8CzH+PrHqZtG+7MJggMi6IDf6exiBhTyj86eKCNMMQKry4nv?=
 =?us-ascii?Q?Q7Pp29UkQNBkyov9YYHB1OimQuNDlCHtmSrunxBeLO/hL5CFztqzCsrs+DhD?=
 =?us-ascii?Q?gOnhN5qbMcdtsiftqHE3UoqNUhTKOA7gdXUaquQ9zuVm9tVQVkW/mKDacYAT?=
 =?us-ascii?Q?96SPHsGfWGbOnTjX2GL1E3uR9/5wg0sic3aJ9zlut47Wzf1bvfB4khSi75zh?=
 =?us-ascii?Q?SXV2Wj4lYKol+/smZd9PVOD6fpjovI1vUZogse83Lb+GfD6R/Og5ezWfU7kT?=
 =?us-ascii?Q?qvBJvLH+yqWCh/oux77XO7RvUF87qzG0g5SnatlFoWA1ONIoisYl5zv3tFJ0?=
 =?us-ascii?Q?afyrKNe28eh4fpx6XeEl+12lJH9gxVZHE6C/+L1ncYTc+OuK0zmVSSDSf9tS?=
 =?us-ascii?Q?r8GzYRNqAJUMS3SYsNpbP/GPqQuFkgNOvthJ+yjzAl1B+AoK3eV8PQFhVQWT?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c81d640-03ae-44a6-1e21-08dbe500e85e
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:00:26.5479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8f/9yh2oOuKz3d0e59eZ8xQpoWuZuT23zzSxN7a+7c5uNAwTRwCYh4t3EGmEOOjv/FyBRO33vD5RktVjE6UcsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 11:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190496

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The documentation of systemd states that /etc/tmpfiles.d should be
reserved for the local administrator and packages should put their files
in /usr/lib/tmpfiles.d [1].

[1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---
 meta/recipes-core/glibc/glibc-package.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc
index 1d4e4c5274..1ef987be0a 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -42,7 +42,7 @@ FILES_SOLIBSDEV =3D "${libdir}/lib*${SOLIBSDEV}"
 FILES:${PN}-dev +=3D "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/l=
ibutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonsha=
red.a ${base_libdir}/*.o ${datadir}/aclocal"
 RDEPENDS:${PN}-dev =3D "linux-libc-headers-dev"
 FILES:${PN}-staticdev +=3D "${libdir}/*.a ${base_libdir}/*.a"
-FILES:nscd =3D "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_syste=
m_unitdir}/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
+FILES:nscd =3D "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_syste=
m_unitdir}/nscd* ${nonarch_libdir}/tmpfiles.d/nscd.conf \
               ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_n=
scd ${localstatedir}/db/nscd"
 FILES:${PN}-mtrace =3D "${bindir}/mtrace"
 FILES:tzcode =3D "${bindir}/tzselect ${sbindir}/zic ${bindir}/zdump"
@@ -132,9 +132,9 @@ def get_libc_fpu_setting(bb, d):
=20
 do_install:append:class-target() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)=
}; then
-		install -d ${D}${sysconfdir}/tmpfiles.d
+		install -d ${D}${nonarch_libdir}/tmpfiles.d
 		echo "d /run/nscd 755 root root -" \
-			> ${D}${sysconfdir}/tmpfiles.d/nscd.conf
+			> ${D}${nonarch_libdir}/tmpfiles.d/nscd.conf
 	fi
=20
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d=
)}; then
@@ -280,7 +280,7 @@ python populate_packages:prepend () {
 pkg_postinst:nscd () {
 	if [ -z "$D" ]; then
 		if command -v systemd-tmpfiles >/dev/null; then
-			systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/nscd.conf
+			systemd-tmpfiles --create ${nonarch_libdir}/tmpfiles.d/nscd.conf
 		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
 			${sysconfdir}/init.d/populate-volatile.sh update
 		fi
--=20
2.30.2


