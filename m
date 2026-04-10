Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A718F45A0A
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 18:31:35 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.163111.1775845891871634675
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 11:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=p9JU5Yq/;
 spf=pass (domain: ti.com, ip: 52.101.52.39, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oI6CFrw/iAcFCfGiCndDnv2mN+evkkYyrv5xOz9mgGRI1/e5VR9DbATMSLwkMzbs7MovT7bJB0dOdsDJUlZC1ej4EfXxWAFFA5PJT1Q7e+IfX9OFOTGHD9kuuuCVKQJXnRWxe8D03t2YpHRmE6oJ96PbFUAho9wNqwoj6iBgxhOY5UMkfyqX/EnzIA2WNmRdjo9XvWXYOoc/EGRUQrYCpN4bYr9M9gh2Yshh20kfGnfYmMHD4zWwg5l7p1IWwm8MmQI/AKItHNSwJeMJXTgE7bl5w1AmDUDgR1ka2kwdzP2gRsppOOdLtJJc3YIloAXEPpk7slfnUqFnHojbsgW3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbecB4UpKWQTbL5v5OewjlAmfS3KevFlV6yN6hmNCfY=;
 b=dChKrp+SO8lr3Hdv0FfKVFzTw9VyY1VRXxcVqpTejJSDoNxw6WqjByOdBCbpmn2EVh75lTzd2dS4/Bw3ORKs7KfFHWgMIZJ+xvSw+0zyOlx2ev7/nHuTsW2b8r+l/3j1oiao76lHR2U4ixWy8FL9IElbdkN9PU/POUue/1rOFIXacCkBBAqBHJjuusobH3CVmF1pk4mSetOBdL5Uf8j5AcWAbe6QRnZ7lGr8B0/viv5rL9ZT7pYubKNu8ZwLQO9czZP4IhDX+v5uR5ynAD/X/cJuMKat2YxQ9/E03aZ9XevXggRxxqJOAMsMhsV5PRbn7DAiyywjpEPwlPWMRDN+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=navimatix.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbecB4UpKWQTbL5v5OewjlAmfS3KevFlV6yN6hmNCfY=;
 b=p9JU5Yq/0aqSVA4IuvvOkFYA7sm0GNSXTm1tXmDbJDxfJptEgUcSHwf8KTg9xq1bliMx3PNhp54TMwPayAvps3OMPFe/UgHbxjL3EWua8Yq6eL7uzCYFBjOv9rTFSJecAoNyiRoB2Qk95zgd+XIJ/Jc40DkG4R2IH2sQC2pU3HM=
Received: from SJ0PR05CA0116.namprd05.prod.outlook.com (2603:10b6:a03:334::31)
 by SA1PR10MB997604.namprd10.prod.outlook.com (2603:10b6:806:4b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 10 Apr
 2026 18:31:29 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::cf) by SJ0PR05CA0116.outlook.office365.com
 (2603:10b6:a03:334::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Fri,
 10 Apr 2026 18:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 18:31:27 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:31:27 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 13:31:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 13:31:27 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63AIVROj1846491;
	Fri, 10 Apr 2026 13:31:27 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
	<mathieu.dubois-briand@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>,
	<joerg.sommer@navimatix.de>
Subject: [oe-core][PATCHv2] systemd: fix unmerged-bin tainted message
Date: Fri, 10 Apr 2026 13:27:48 -0500
Message-ID: <20260410182747.1646597-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|SA1PR10MB997604:EE_
X-MS-Office365-Filtering-Correlation-Id: ed47d863-097c-433f-cd3a-08de972f60fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	CcC//bxZuNZEoIbo+xXNNC4td3f5WnpgKH2Hv7CXurWPyEsBxBTgaqfPeQ1+NJqXI7UP9QOldApWNYTnhzqIjgMEg/JLWim6YoiQEq2tmVD7eEbx1QZtHtviaZ72PiFOOyKhMl2VneQmaO0l68r/dHp1QzEh26qOkqRO2mPCi8VHlyyTCHuKb9Xq1jhYRcpJSIJt2PsUOd4+BfJ7+j3P67FFmq0pfAykD2N3qYfmocEOT4Moyfrow6VNgWWDiTBNS8+Hh5ltsldVSamFKGTVGd9AUmRy0K07c2/eWgMERTguQ4upxtoIDaAZuyy/APwMUmj/7LpBhnqgi5l2lAeGNdLGYqqcGMy18XSg813fBtSTCzACr6g5f99l6ANdwK1gVoc6ai8lLoLjZbkcLV16unEo9WKuJ3ne9rX4Zf1cRbNAtfL30ZkNDWxbQp+isry8k/BCVMZy9wKoMg2xp19xcHBhcqI1loKaCtmeE8rkpX42hJtGoLGKEqImGDD/juD/ils0kpdMV7EFaW1xxz3Cmv6yTUHmxe1r5JYUD/oJLwjd4GAXHESyt7FxU3azodVQlRtdUu6XbDG0a3Y2pLCN/y/aQeTJ3mvi5o1U1+XwM+IDzabWDIX9VG3IZbS7G+jFTvSLOIUma3iZgblah24sWGnZ8Aq7S58cIltq+a8U+Es9zrlNaVsbWL9CVKcUVd46FLq5aRtyAfu36Z6D+Sg911qpPgnUhM/Om8slxH18CLs=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xfDd2MEa6rdMwkssW6dmY9zBc/wja0JycVDWZJ6SmFKUNbwnJNcpqAHu3jP8tWmk+zeZZA+L3p7Z+LijpXG0LUai8s5kTr9EhPU1Uaw7HUTdbdQ2y8aPfMbp0fDx7qWrxayx8ZH3qRzxMWMtGCIIBdwDc4+XiKuzTFMfveldW2JPZWQleiHEwsIuklNwYCCEFL0Km+WBQdMKoWgcq9Gyn3sl/hq0Q2F0N1rMD1SvHgeocj1Yh0UxdtVahfBpe9FCZTJfgH7Ko++32UC23yepXyZGbjSUtfWzu34viocn7XCYYECzj3S93/lJJJUu8vu7+tGkJH8zxE++y9aeNhoFt1P1l2bWgLQWjFnaPo+UAFNK55xzYFtoALwVW0EkLEuVrwxX/+gXWW/VZZt6ZM7OMZAvjmk1hQhFmuRo0JEDPXVGcvRjvZiV15tWD8lU56Va
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 18:31:27.8247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed47d863-097c-433f-cd3a-08de972f60fb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997604
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 18:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235039

From: Randolph Sapp <rs@ti.com>

Systemd prefers both /bin and /sbin to link to /usr/bin. If this is not
the case it reports that the system is tainted in systemctl status.

Add a link from /usr/sbin to /usr/bin to prevent anything from being
excluded from the merged bin directory. This mimics the current merged
bin directory structure of Arch Linux [1].

Update the systemd recipe to prevent creating a duplicate link when
sbinmerge is enabled.

Override most sbin variables to point to their bin equivalent when
usermerge is enabled, with the exception being base_sbindir_native and
sbindir_native. There is no guarantee the host machine is using this
filesystem scheme.

This check was added to systemd back in 2024 [2].

[1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesystem/-/=
blob/main/PKGBUILD
[2] https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d1e=
4a6aa6d9f0d

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2:
	- Use recommended replacement variable when usermerge is enabled
	- Apply replacement to other relevant variables in this file
	- Keep usrmerge distro feature separate as I believe there is still some
	  merit to mimicking a systemd filesystem in a non-systemd enabled
	  environment, and I didn't hear too much discussion previously

 meta/classes-recipe/populate_sdk_base.bbclass | 5 +++--
 meta/conf/bitbake.conf                        | 8 ++++----
 meta/recipes-core/systemd/systemd_259.5.bb    | 8 ++++++--
 3 files changed, 13 insertions(+), 8 deletions(-)

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
index 84450386d9..5d27e70b04 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', '${exec_prefi
=20
 # Base paths
 export base_bindir =3D "${root_prefix}/bin"
-export base_sbindir =3D "${root_prefix}/sbin"
+export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge=
', '${base_bindir}', '${root_prefix}/sbin', d)}"
 export base_libdir =3D "${root_prefix}/${baselib}"
 export nonarch_base_libdir =3D "${root_prefix}/lib"
=20
@@ -43,7 +43,7 @@ export systemd_user_unitdir =3D "${nonarch_libdir}/system=
d/user"
=20
 # Architecture dependent paths
 export bindir =3D "${exec_prefix}/bin"
-export sbindir =3D "${exec_prefix}/sbin"
+export sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '$=
{bindir}', '${exec_prefix}/sbin', d)}"
 export libdir =3D "${exec_prefix}/${baselib}"
 export libexecdir =3D "${exec_prefix}/libexec"
 export includedir =3D "${exec_prefix}/include"
@@ -65,9 +65,9 @@ bindir_cross =3D "/bin"
 bindir_crossscripts =3D "${bindir}/crossscripts"
 prefix_nativesdk =3D "/usr"
 bindir_nativesdk =3D "${prefix_nativesdk}/bin"
-sbindir_nativesdk =3D "${prefix_nativesdk}/sbin"
+sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge',=
 '${bindir_nativesdk}', '${prefix_nativesdk}/sbin', d)}"
 base_bindir_nativesdk =3D "/bin"
-base_sbindir_nativesdk =3D "/sbin"
+base_sbindir_nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrme=
rge', '${base_bindir_nativesdk}', '/sbin', d)}"
 includedir_nativesdk =3D "${prefix_nativesdk}/include"
 libdir_nativesdk =3D "${prefix_nativesdk}/lib"
 base_libdir_nativesdk =3D "/lib"
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


