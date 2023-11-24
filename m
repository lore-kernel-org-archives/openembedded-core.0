Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03374C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 14:11:28 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.77])
 by mx.groups.io with SMTP id smtpd.web10.137778.1700835081143381287
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 06:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=iGoMMICb;
 spf=pass (domain: infinera.com, ip: 40.107.220.77, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSmJ1pJdU5c9XOF8ie8FcCmjtIKhzOG+ZPnH0mkVU618CgYjKjyZRaW8s/2UjFHH01qvTG5bGfAcwzRfo+Yol2vMvMKIwangdF1xiZ4lbpFOGR7oJL9m7STgIJFV95omLe6f3qU0oTxvF2pGM4J5VGzX3+jo3DsgsN9EOX54jgIYwDmzgX8qRY9ftK1l0yep5EURDfSrS0BqEJq7vbRV5HPYkt2H5cJLEX7hAB0SbRVD2eqf0bJPSGQq1HnAy32FYCEvyMextkKCJ9v2PuR4XPPij5bgHemqDezxtc2rw9yNpADE8H4uQP2RY0UTme6tlsFiVbqUa2eQRBO5bF4q3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn5j/Q1S+m/nBrGOitYHgwBTbrBRuoOoumtj+UhdGtI=;
 b=W+BI+ij/WYKM2px1ghA34admTr9tU25qYpkHp3+cm0mW4lav2cxP/pRTjmSNMjdHcviNmHT4TeP1bzvgJTb2n8rkV9cemPMCtj20MFtTgWJWH6L/vqzhNZJbo+CtJLP4d48yElIu2MCJ1o6sKOsGCzNAvul4JozOfc/DR0c+3ceY6Sl4WmEQRbGiJ+KW9I0G/TGRUkGhXJr4Dk0VoHMpuHuBwnOiYoO89nouMYkp0QhCsNbo88Gb6zFYJ8Mj+z1ZFPd0KpQyPkLpbRZ55r7PnbsH9R4bUgAFLta636n7r5+xHsIOgHcaL+M2CDBaXdJHDGWjVnANlvuay/Fx/jqWkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn5j/Q1S+m/nBrGOitYHgwBTbrBRuoOoumtj+UhdGtI=;
 b=iGoMMICbyMk+GpudvORBamr9UgObEhcppRZsviOlrBUsbQpSURdFo5iVb4jncWfauSK1264iAp8HhQd5NJBw3DH/PZ+QlXyrwLwd90gVZGzFDgLxGoXddNGUY/9n/b6jAFkxihgZ1lwNavuFfwBQvUqQu4kJi/q2a8lfCfaSfXJCiEDqnyTbaOH7qw7IpUMyMBKr7LfoCnZ506n9b9HoVRW8jce02cvYi2nHUf2p1Wg9nWWQaemC+NsYj/PiZbt7kU5YTiZCw3EjXEAGO3o0cxPIBviSVGrHckJIHhAYT67WydccQ1AKXJD3OHsWgZPYJ7SQLfJE2QckHgRWXwYjuw==
Received: from SA0PR11CA0206.namprd11.prod.outlook.com (2603:10b6:806:1bc::31)
 by CH0PR10MB5290.namprd10.prod.outlook.com (2603:10b6:610:dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 14:11:16 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::98) by SA0PR11CA0206.outlook.office365.com
 (2603:10b6:806:1bc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 14:11:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 14:11:16 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Fri, 24 Nov 2023 06:11:15 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.6 via Frontend Transport; Fri, 24 Nov 2023 06:11:15 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Fri, 24 Nov 2023 06:11:14 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 5DBDF2C06D82
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 15:11:14 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id 5C40541DEBD0; Fri, 24 Nov 2023 15:11:14 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [kirkstone][PATCH 4/4] shadow: Add PW_SUBDIR
Date: Fri, 24 Nov 2023 15:10:53 +0100
Message-ID: <20231124141108.1397342-5-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
References: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 24 Nov 2023 14:11:15.0232 (UTC) FILETIME=[160D2A00:01DA1EE0]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|CH0PR10MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc29e87-2d84-475d-fc38-08dbecf73952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H+wwVWrSYHOTVHrYhQ9xqnjxXUiUAc5Ga7SBF3TBzHEKAFbNH8mpXQIAYP+07c21NsjruC28ZhsoQc3oM3+l1G/mLhOSJ1Mi/KCnAnnPd0wOGQBCqDLfawsm2CWXwf0iXxCx9Er+jzQjcM9C5H2GRFj5ug3luGSrA3dtVUUK1Q0/s7Z72pIn9cXQOKw7LV5KFvIGCpGzfeOxU7OILib9X7GIyRrRtNbUd98+H4uG7jy9HVfqFXQG1+wgL5sN9qbXtQ9r1gNO/zKuwsyrQLQtAdBWf4Qsf8hhbyyIBBICMtZIo/xzkgpNcoV+2UakmtTSzHnGzTUnJRm1LroOCNurR8Tm9PrvepQLyUmLB8IkPRKIBsDedso0AJxPi6DWLMvb+rOh07inBpkl38ng4Nj2mUafFshCZ7WM23XmOtm9ePljFSU0LChJQcuM+dukjd6OYk6goNyHsT9UO+Qn+sKHFwiH2TM4gMu8Bgk1Gd7lnVpSRCZDLRxctGHuw+vm5/2SU8ixLhGpQYZ8f73+8GIusCDB94f6+yp+rnBriIMoycc811+Aikw1MB117eAanLPQFDtwbNHeB9xJCnO44XQ9GrEa8O89Qw0qxjfduWGhbrMN4BxFTa/HsZRSKRW88yfirTAKSP3K1YAMUdVTr7ndWBYpeevbrqPfmeQWdHJ7JQ6E8t6eu0EwBoEXcIiDR4A9K5HMWeiwEPo7EfkPRq8Ob2Q0nkfyLem78uZwPmV49jw=
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(82310400011)(36840700001)(46966006)(83380400001)(40480700001)(336012)(426003)(6266002)(26005)(70586007)(70206006)(2906002)(107886003)(2616005)(47076005)(42186006)(6916009)(356005)(316002)(8936002)(81166007)(4326008)(8676002)(478600001)(82740400003)(44832011)(966005)(5660300002)(36756003)(41300700001)(1076003)(36860700001)(6666004)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 14:11:16.4936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc29e87-2d84-475d-fc38-08dbecf73952
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191200

Add support for creating passwd files in a /etc subdir
Set PW_SUBIR to pwdb to get passwd files in /etc/pwdb

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 .../0001-Define-SUBUID_FILE-SUBGID_FILE.patch | 92 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       | 30 +++++-
 2 files changed, 118 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Define-SUBUID_F=
ILE-SUBGID_FILE.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Define-SUBUID_FILE-SUB=
GID_FILE.patch b/meta/recipes-extended/shadow/files/0001-Define-SUBUID_FILE=
-SUBGID_FILE.patch
new file mode 100644
index 0000000000..9f85159e97
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Define-SUBUID_FILE-SUBGID_FIL=
E.patch
@@ -0,0 +1,92 @@
+From f605fb315faef7ddcad70d638f3b3aa16ea98fc0 Mon Sep 17 00:00:00 2001
+From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
+Date: Thu, 2 Nov 2023 00:27:10 +0100
+Subject: [PATCH] Define SUBUID_FILE/SUBGID_FILE
+
+Upstream-Status: Backport, https://github.com/shadow-maint/shadow/commit/e=
e3a79c6952f8ca649c286c7f76639d9d1dedaad
+
+These where hard coded, make them definable like SHADOW_FILE
+
+Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
+---
+ lib/defines.h         | 8 ++++++++
+ lib/subordinateio.c   | 6 +++---
+ libmisc/prefix_flag.c | 8 ++++----
+ 3 files changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/lib/defines.h b/lib/defines.h
+index fc1521c..27b220f 100644
+--- a/lib/defines.h
++++ b/lib/defines.h
+@@ -312,6 +312,14 @@ char *strchr (), *strrchr (), *strtok ();
+ #define SHADOW_FILE "/etc/shadow"
+ #endif
+=20
++#ifndef SUBUID_FILE
++#define SUBUID_FILE "/etc/subuid"
++#endif
++
++#ifndef SUBGID_FILE
++#define SUBGID_FILE "/etc/subgid"
++#endif
++
+ #ifdef SHADOWGRP
+ #ifndef SGROUP_FILE
+ #define SGROUP_FILE "/etc/gshadow"
+diff --git a/lib/subordinateio.c b/lib/subordinateio.c
+index 9ca70b8..9ddc5e1 100644
+--- a/lib/subordinateio.c
++++ b/lib/subordinateio.c
+@@ -206,7 +206,7 @@ static const struct subordinate_range *find_range(stru=
ct commonio_db *db,
+         /*
+          * We only do special handling for these two files
+          */
+-        if ((0 !=3D strcmp(db->filename, "/etc/subuid")) && (0 !=3D strcm=
p(db->filename, "/etc/subgid")))
++        if ((0 !=3D strcmp(db->filename, SUBUID_FILE)) && (0 !=3D strcmp(=
db->filename, SUBGID_FILE)))
+                 return NULL;
+=20
+         /*
+@@ -554,7 +554,7 @@ static int remove_range (struct commonio_db *db,
+ }
+=20
+ static struct commonio_db subordinate_uid_db =3D {
+-	"/etc/subuid",		/* filename */
++	SUBUID_FILE,		/* filename */
+ 	&subordinate_ops,	/* ops */
+ 	NULL,			/* fp */
+ #ifdef WITH_SELINUX
+@@ -650,7 +650,7 @@ uid_t sub_uid_find_free_range(uid_t min, uid_t max, un=
signed long count)
+ }
+=20
+ static struct commonio_db subordinate_gid_db =3D {
+-	"/etc/subgid",		/* filename */
++	SUBGID_FILE,		/* filename */
+ 	&subordinate_ops,	/* ops */
+ 	NULL,			/* fp */
+ #ifdef WITH_SELINUX
+diff --git a/libmisc/prefix_flag.c b/libmisc/prefix_flag.c
+index d4dfbc2..0e7dfa7 100644
+--- a/libmisc/prefix_flag.c
++++ b/libmisc/prefix_flag.c
+@@ -120,14 +120,14 @@ extern const char* process_prefix_flag (const char* =
short_opt, int argc, char **
+ 		spw_setdbname(spw_db_file);
+=20
+ #ifdef ENABLE_SUBIDS
+-		len =3D strlen(prefix) + strlen("/etc/subuid") + 2;
++		len =3D strlen(prefix) + strlen(SUBUID_FILE) + 2;
+ 		suid_db_file =3D xmalloc(len);
+-		snprintf(suid_db_file, len, "%s/%s", prefix, "/etc/subuid");
++		snprintf(suid_db_file, len, "%s/%s", prefix, SUBUID_FILE);
+ 		sub_uid_setdbname(suid_db_file);
+=20
+-		len =3D strlen(prefix) + strlen("/etc/subgid") + 2;
++		len =3D strlen(prefix) + strlen(SUBGID_FILE) + 2;
+ 		sgid_db_file =3D xmalloc(len);
+-		snprintf(sgid_db_file, len, "%s/%s", prefix, "/etc/subgid");
++		snprintf(sgid_db_file, len, "%s/%s", prefix, SUBGID_FILE);
+ 		sub_gid_setdbname(sgid_db_file);
+ #endif
+=20
+--=20
+2.41.0
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extende=
d/shadow/shadow.inc
index 3c1dd2f98e..bcb9b09a49 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -18,6 +18,7 @@ SRC_URI =3D "https://github.com/shadow-maint/shadow/relea=
ses/download/v${PV}/${BP}
            file://useradd \
            file://CVE-2023-29383.patch \
            file://0001-Overhaul-valid_field.patch \
+           file://0001-Define-SUBUID_FILE-SUBGID_FILE.patch \
            "
=20
 SRC_URI:append:class-target =3D " \
@@ -46,6 +47,21 @@ PAM_SRC_URI =3D "file://pam.d/chfn \
                file://pam.d/passwd \
                file://pam.d/su"
=20
+#Set PW_SUBDIR to pwdb to get passwd files in /etc/pwdb
+PW_SUBDIR ?=3D ""
+PWPRE =3D "/etc/${PW_SUBDIR}"
+CFLAGS:append =3D ' -DPASSWD_FILE=3D\\"${PWPRE}/passwd\\"'
+CFLAGS:append =3D ' -DSHADOW_FILE=3D\\"${PWPRE}/shadow\\"'
+CFLAGS:append =3D ' -DGROUP_FILE=3D\\"${PWPRE}/group\\"'
+CFLAGS:append =3D ' -DSGROUP_FILE=3D\\"${PWPRE}/gshadow\\"'
+CFLAGS:append =3D ' -DSUBUID_FILE=3D\\"${PWPRE}/subuid\\"'
+CFLAGS:append =3D ' -DSUBGID_FILE=3D\\"${PWPRE}/subgid\\"'
+
+#shadow has it own impl. that uses whatever dir passwd files are in
+do_configure:prepend () {
+    sed -i -e 's/lckpwdf//' ${S}/configure.ac
+}
+
 inherit autotools gettext
=20
 export CONFIG_SHELL=3D"/bin/sh"
@@ -157,9 +173,9 @@ do_install:append() {
 	# usermod requires the subuid/subgid files to be in place before being
 	# able to use the -v/-V flags otherwise it fails:
 	# usermod: /etc/subuid does not exist, you cannot use the flags -v or -V
-	install -d ${D}${sysconfdir}
-	touch ${D}${sysconfdir}/subuid
-	touch ${D}${sysconfdir}/subgid
+	install -d ${D}${sysconfdir}/${PW_SUBDIR}
+	touch ${D}${sysconfdir}/${PW_SUBDIR}/subuid
+	touch ${D}${sysconfdir}/${PW_SUBDIR}/subgid
 }
=20
 PACKAGES =3D+ "${PN}-base"
@@ -193,12 +209,18 @@ ALTERNATIVE_LINK_NAME[su] =3D "${base_bindir}/su"
=20
 PACKAGE_WRITE_DEPS +=3D "shadow-native"
 pkg_postinst:${PN}:class-target () {
+	install -d $D${sysconfdir}/${PW_SUBDIR}
 	if [ "x$D" !=3D "x" ]; then
 	  rootarg=3D"--root $D"
 	else
 	  rootarg=3D""
 	fi
-
+	if [ -n "${PW_SUBDIR}" ]; then
+	    ln -fs ${PW_SUBDIR}/subuid $D${sysconfdir}/subuid
+	    ln -fs ${PW_SUBDIR}/subgid $D${sysconfdir}/subgid
+	    ln -fs ${PW_SUBDIR}/shadow $D${sysconfdir}/shadow
+	    ln -fs ${PW_SUBDIR}/gshadow $D${sysconfdir}/gshadow
+	fi
 	pwconv $rootarg || exit 1
 	grpconv $rootarg || exit 1
 }
--=20
2.41.0


