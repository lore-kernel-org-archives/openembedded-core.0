Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E5AC54E7C
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 20:36:34 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.54])
 by mx.groups.io with SMTP id smtpd.web11.3924.1699994191260043788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 12:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector1 header.b=rEk7PoZw;
 spf=pass (domain: infinera.com, ip: 40.107.243.54, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BemXIOGimKIrUGDtKht8IpJrRRs2+rB6pbbVmDmaXhIa9qWvajdC4p49RjP3dVTnIoh5Uz3J06PlLhUSgR8oT4Zw9J/k7v5ZAeDEVEcQu6qkdEQptIcCF1gDWaMB2lgZiKuGfiaGrmmXUIznDwoPJeaU+FZPZducMTYXbOzYJpP2328yqHMVHh14uZ6zy0JuT8SJpGWe4zv7UCOppQW+QPEYD4Nupa4AHZUzoo6tip6dclaoCKOP96iRIi0r3w/p69k3d6B6+HeYasd9AI/D4m4ideh+Tr16B8iRAeTgj1/R5HAL2YscyCpxWOfAIf3TN2HhgOxCqH+XdFDVWjdg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4RlG+dHLFDkqzxMq2eYZ5HQTcsv63VE3XhsYvq4i0Q=;
 b=Tx6vu7o/4k0PjktCELJupw7yM3CuiT1AyoMeaP9GJ9NX7f7wafwsegkUvCKtFuKqNlKvCxGIzlXbLF4W9T9yG4ufAdZLmnWKPVdHanqe8mygftDJAygC7THLnM9fEqup9DOfcQkEqm225utXEpqTnw98kNF68rZ0f3pbrZcYqDDeniL4tkL4C8LpdJL4bpPMhf63/57NT+6+62H8kikXk99MPAza/Nqii8nRy6IXJNtVWbaQYGdyJfPoYFusd+1sYxJVzSevjPicETPTGqXZPmVzHm9vL5MRdHAAdNZGJ5ho2FP4eCUqO3wPFFmAKSftyd940cUsTJnMpoaq+fptUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4RlG+dHLFDkqzxMq2eYZ5HQTcsv63VE3XhsYvq4i0Q=;
 b=rEk7PoZwz4ZEy8t+/ybGgwZCtFn7dHJmAIJujUAotYI3J5ypxEm0i7sj8W9SoEnGtAI84CJZIUwyAntVo3T4E+VP+Bz/47G2BKaiAS4aNSKixI1FB/tqMlqaM1WjdCcjOGvPCa+NGm/1bRFqJJpGjHfoa+bRPC+7fFPtWK0zz9e7tthcIFSPtFyYWlqRZUpZDEgDZtkT8ZFri/NZsGG4ZLxMdQ8GKhV/T/FVq6bNarX5JjZd06Cb1hBd/Nrk1IFmo+LhgvwNxeEh1B91WkMLx0o9aLQeD1ue5UBvVyV3VLT+LtnPy3ndLDs7OxCT3nZG7L8iAzkPugSkmhLBfGJfqQ==
Received: from MN2PR20CA0010.namprd20.prod.outlook.com (2603:10b6:208:e8::23)
 by DS7PR10MB7373.namprd10.prod.outlook.com (2603:10b6:8:ef::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 20:36:27 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::26) by MN2PR20CA0010.outlook.office365.com
 (2603:10b6:208:e8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 20:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.13 via Frontend Transport; Tue, 14 Nov 2023 20:36:26 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Tue, 14 Nov 2023 12:36:13 -0800
Received: from sv-smtp-prod3.infinera.com (10.100.98.58) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.6 via Frontend Transport; Tue, 14 Nov 2023 12:36:13 -0800
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod3.infinera.com with Microsoft SMTPSVC(8.5.9600.16384);
	 Tue, 14 Nov 2023 12:36:12 -0800
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.73])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 2DB3C2C06D81
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 21:36:12 +0100 (CET)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id 2CA45456169E; Tue, 14 Nov 2023 21:36:12 +0100 (CET)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH 2/3] shadow: Add PW_SUBDIR
Date: Tue, 14 Nov 2023 21:34:51 +0100
Message-ID: <20231114203608.1490318-3-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 14 Nov 2023 20:36:13.0150 (UTC) FILETIME=[355A3FE0:01DA173A]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DS7PR10MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a7c979-1de6-4ec0-15c6-08dbe5515fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9OtRuS/+mb9XH+b9fQIFZD0BfB28AA3z8i5LlCRhLP0vfbHrW6pCdFsZR6hKMdNQNyf4YKlIwaBusgUeGND9qcguCRN1HgvUUiDHO/vO9v/Zd2KcnMIFqlcb3tgOBIh+p7fpmARYtDsdFHqVrolehWALf5+YVYEltvGv/6nd/apRi9dCWYpW5mwbKj+a8GZgmNop0llEEFU9vwo4fpgPk6Etu0HJqGV1hGUQcOA4WKiAn1Lfzx51LeWKv+wm0sU7IipABf4SwkT5bEi4RrN2gIhGWnkV274XS0UC61TfYGApAXWe6mdn6sySrDvIwNFJ5VJcRg76Aeg0CFFxn+glDFqlRdSb614jv2uidWTdluvVnCoWCnALvZRqwE8Kc0MsGThHf9fVMjB3MgpCNDrY+9vuUJGGM3b72Nsfv2hPB9mWGXzwalEIBB0oqXejKE8feaAmdymR62AAEuROD5gcNSTGro3lvrpBQ41UGOjB9iQqJQZixnnoZFUDg9Evw45t3iFYi/lkVQN9Bl5xROAv3aeCldfdhjacZ5cKB2awAqyfB/ZgBCpMVYJpkLzNW5JdUB7kcV9W5hzkMCClSCJSeXh9U5WZ50nbcYrnF1oPuRu+pKgAOISjDkZ2G1va9adnXaMY0sXiofaNZh6wKhR/nTxqZisN0feWYh+PCXI79kQFx5j21akIKCWzeewFcyEhTzXyHq1OLhlNfuXR67mz8mKRPo7qHaDIFvAk6DGhmkY=
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(82310400011)(451199024)(36840700001)(46966006)(2616005)(107886003)(6666004)(1076003)(478600001)(36860700001)(336012)(6266002)(26005)(47076005)(83380400001)(426003)(44832011)(6916009)(8676002)(5660300002)(4326008)(70206006)(8936002)(70586007)(316002)(42186006)(2906002)(41300700001)(36756003)(82740400003)(81166007)(356005)(86362001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 20:36:26.4013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a7c979-1de6-4ec0-15c6-08dbe5515fcf
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7373
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 20:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190518

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
index 0000000000..b02a61e3c2
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Define-SUBUID_FILE-SUBGID_FIL=
E.patch
@@ -0,0 +1,92 @@
+From f605fb315faef7ddcad70d638f3b3aa16ea98fc0 Mon Sep 17 00:00:00 2001
+From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
+Date: Thu, 2 Nov 2023 00:27:10 +0100
+Subject: [PATCH] Define SUBUID_FILE/SUBGID_FILE
+
+Upstream-Status: Pending
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


