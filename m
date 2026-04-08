Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6158B10F9976
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 19:55:28 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.115368.1775678117950533527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 12:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hGemGGst;
 spf=pass (domain: ti.com, ip: 52.101.52.28, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kf4xIgkiR7JRYgykCa326g6WyfN7H803ke5UMrAJ+NkFR9l5wGxiqvPH7N/tpr3mtb2Z8jZbyj4vgIXRyHNnE/DBKeCwXv2tK6xaZwC8tEgOoE1Wl1n3kq3ej+cjRCOoaNz0cJeJYWbL38E2YEYSHdI1tSiiJWXiV1VXuu7pDW6hdv8F+7mHravzgpMQB8cLGYTI3Bf5D0XGnCOqnXojkTGWSGHxaUzId6mr1JqiiGmOjr6nXz4/v6ahZbNhjMMYISoD2VBMHi9KFypDdVN0rxelgtv6hBrfynrMoR44XFfdfCl902fgQXU+Evx88N7IHvNKIn/QtJc+dHJbh3y5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU/rYIkXunYFdfwbUQv1KN2xWnkXlACHi0PxqggGRAo=;
 b=hZtHjFb+S5Ie2kTsU2FHkbZObvOBXr59Jvr0zWIgpxqB7SkXOXYVrIQSGSrZC8aj7+WOAxwRjAgqudp7LBEF8j4M5+15aLxAxL0KrRraSQl3RLLnd0ylCTMOzi5A4Di5JoQdgspc85LJHZwUgsTrCYRqIXcqIiIw/l81W3aGN3JSjYWt68RlTeiUKPj/vm3qGWgauDsILFf8SnIow1Nu09fbtE6VR9l6TNjbZnrfrmyKMIW27Rw3TOhw1IUUgH8d6QHuLvlok6rN4E+UhW5rDI0f/SVjXLy6F0+lxMpApz4iPCVAUC1OJ4l2fV3m8Mts0jr+lxDfGh6RMIw32ekzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UU/rYIkXunYFdfwbUQv1KN2xWnkXlACHi0PxqggGRAo=;
 b=hGemGGstOND1v0ZUxErP4mT/Rs7EwowTSt85LHog5CBf9vPw3LAup0j+N6EDUHncKQC5PBMq26a0ZlS1MPSEl9nbKAMrnIE4ASAmtWCe9RQOEJR4jKiOuEvByq4Rs4bG0+8o9ZYDzwXgSUygLKR12//KTlh8BDAWNoBMWmuHHLs=
Received: from SJ0PR03CA0217.namprd03.prod.outlook.com (2603:10b6:a03:39f::12)
 by DM3PPFC7DCDCAD9.namprd10.prod.outlook.com (2603:10b6:f:fc00::c4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 19:55:14 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::ef) by SJ0PR03CA0217.outlook.office365.com
 (2603:10b6:a03:39f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 19:55:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 19:55:13 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 14:55:13 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 14:55:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 14:55:13 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 638JtDae1305263;
	Wed, 8 Apr 2026 14:55:13 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
	<mathieu.dubois-briand@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
Date: Wed, 8 Apr 2026 14:50:25 -0500
Message-ID: <20260408195024.1874335-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|DM3PPFC7DCDCAD9:EE_
X-MS-Office365-Filtering-Correlation-Id: 45fe3149-f541-4728-077d-08de95a8bfed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	wmoiimenhnFR7B+iROXF5thFGnk/CeZFUSsuwkNzrVbfKRdxDMpxTvrmmaAHFazzuKO/MTFh52gdiSp4IKY/zV29Ov28mdFNvIlCmVluHO74uUNzmv8LEpL2xA00vvX+DKgcTyqdc2YYlXysu6lJDIuDMbchsKjM3CDd7an5UC9FrrT0ZtUkI9DD0EQfGYTvibSzFhKVwnSZql/Qf2uQT5BMD5/OYGQ67yxVROP+6T5UEicI3beVR14lB6HstuZa9+zH1uTSskNoJmRJzCfdiS40LyL2Upwy3lmL+vsoCMKoafV3yy3ZcoH2gQaizGewQ1jQeKfTq07CvKoCiNoSZJ6EKX8bWsOzWqduOmodXav/ad4XQghu6dXLcXBaCP4c7IE+GuOfA52DvndtwBFSdpzeJRTFa1L5AEkgF/r/vlK1/KXfbLoMn8da/PN0CMQNCit8bwtr/fFEcQK9snP8Zhp5cd4N/SmCd5O2jY+9+NWdTkH6ICAbCKydBsX2npdUw+g2NYuU617aL4OXWtemV17UtQ3WXiQjO34y8SYHpMoO4klxMPwEYGwiHAesFWDIbFfIu4m61W1ovb6o/f0S2Y4icVbDme5alLm/9r8kCKkZfuFlK8nTlyP8O+q8mpqSCTbIqQn4BmJX10MxxrfABi7Tq3u65/IeGTcvDYWI0HnaCK6NMUHJ3VYkHQ2S3FnrzCz3VQVyS1VqtC+lQPnNqmcMoVpEZd9MXtx8VS3EZV0=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9sTdvODKFmysr0+DthwH1nLkxffDoRpBmgByfNrzLuX7ZSedzJALl4XFDCydJW3Jjpkfng0WuvmWThAsXBvV5gnKQERzkDKfzT+iZ5ZTuKUQ3Qu6NzwocV3gHnwzKJh48Xh+BOgaTxhd6rrK03rrb8ox7MHsRGOHpuFW1l8KFBcRmZCl0swYOZ9jItpXjLDTV5z4mVoIlI2i/nvx9hg2oGcdqpb5VGE9HaCotxDM0rWphBT6gu5KU6B+IDUOF2GBwiHcWo46HTLuv6dYdarkqiJ4uKwRjl1PZ3OlDbmKa3ePQQDpSC2zbI1dOvQWamRzi5q0HRTlQncVCLRP/DLxgfz5acDEQDEtNxLstvrAVPO4f9PIOv6Hg01/AlKg4QgExhgoZkD1UFCFrXBRUUAeCCdqZG/Xfu7d1pcRiWJBd79vUJr5STX0l7vGoK3Qz2qO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 19:55:13.8993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fe3149-f541-4728-077d-08de95a8bfed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC7DCDCAD9
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 19:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234858

From: Randolph Sapp <rs@ti.com>

Systemd prefers both /bin and /sbin to link to /usr/bin. If this is not
the case it reports that the system is tainted in systemctl status.

Add a link from /usr/sbin to /usr/bin to prevent anything from being
excluded from the merged bin directory. This mimics the current merged
bin directory structure of Arch Linux [1].

Update the systemd recipe to prevent creating a duplicate link when
sbinmerge is enabled.

This check was added to systemd back in 2024 [2].

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesystem/-/=
blob/main/PKGBUILD
[2] https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d1e=
4a6aa6d9f0d

Signed-off-by: Randolph Sapp <rs@ti.com>
---

I feel like this is overloading the "usrmerge" distro feature somewhat. On =
the
other hand, this parameter was added for systemd support, and systemd consi=
ders
all of this to result in an unmerged-bin warning. I figure it's kind of fin=
e.

Open to opinions here, as we could also just add a "sbinmerge" distro featu=
re.
Then again, what would be the expected behavior when usrmerge is disabled? =
Would
/usr/sbin just point to /usr/bin and /sbin to /bin then?

 meta/classes-recipe/populate_sdk_base.bbclass | 5 +++--
 meta/conf/bitbake.conf                        | 2 +-
 meta/recipes-core/systemd/systemd_259.5.bb    | 8 ++++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-r=
ecipe/populate_sdk_base.bbclass
index b427ff2761..15f393a3bb 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -186,9 +186,10 @@ POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sd=
k =3D " write_host_sdk_manif
 # Prepare the root links to point to the /usr counterparts.
 create_merged_usr_symlinks() {
     root=3D"$1"
-    install -d $root${base_bindir} $root${base_sbindir} $root${base_libdir=
}
+    install -d $root${base_bindir} $root${base_libdir}
     ln -rs $root${base_bindir} $root/bin
-    ln -rs $root${base_sbindir} $root/sbin
+    ln -rs $root${base_bindir} $root/sbin
+    ln -rs $root${base_bindir} $root/usr/sbin
     ln -rs $root${base_libdir} $root/${baselib}
=20
     if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 84450386d9..29301534d2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', '${exec_prefi
=20
 # Base paths
 export base_bindir =3D "${root_prefix}/bin"
-export base_sbindir =3D "${root_prefix}/sbin"
+export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge=
', '${root_prefix}/bin', '${root_prefix}/sbin', d)}"
 export base_libdir =3D "${root_prefix}/${baselib}"
 export nonarch_base_libdir =3D "${root_prefix}/lib"
=20
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index c3cb605b4d..d84e38d7cd 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -69,6 +69,7 @@ PACKAGECONFIG ??=3D " \
     quotacheck \
     randomseed \
     resolved \
+    sbinmerge \
     serial-getty-generator \
     set-time-epoch \
     sysusers \
@@ -339,8 +340,11 @@ do_install() {
 		install -m 0644 ${UNPACKDIR}/org.freedesktop.hostname1_no_polkit.conf ${=
D}${datadir}/dbus-1/system.d/
 	fi
=20
-	# create link for existing udev rules
-	ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
+	# create link for existing udev rules if sbinmerge is not enabled
+	if ${@bb.utils.contains('PACKAGECONFIG', 'sbinmerge', 'false', 'true', d)=
}
+	then
+		ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
+	fi
=20
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
--=20
2.53.0


