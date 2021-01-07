Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.74])
 by mx.groups.io with SMTP id smtpd.web12.6223.1610013418302851161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 01:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IDFcPKNg;
 spf=pass (domain: windriver.com, ip: 40.107.236.74, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buzc9mPTU4hywkBUmIM+Nagd0ZEZUTKRzQWIt7Hfub6Ncf1L8b1BzZcL4vcG2U43VGkgMaXXHAU31osvK5faSSq0Ni8Jlir3OZQ0WktBfYwgwPTNJjxiIwiaZYnaQQnJ5+REr25mClt16VcUXqDS8nQ4FPUk+zqblReZK2CsR1YH5ly+1u1nGWjpMlY2DToT9QMkMnI8JusyDKjGKplkRR2m0mCR4S5HkMHVu+2S4qo/SbxXEwf17pdpqtpQhzhN4y38h3Jv7FdAWuFYmAvc/kI1hgeVavQTUXGw2yzxJir109OJR43qh6ZWEJXfzW4jWESojFIyVdcr3lQGFVfZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xnkSreqdNZ1wDF1m34bqeaIxnR22tViziuTfnEvSy8=;
 b=mJIB1HfdwzYDIjCEi4gC5HtjmbFPdNmuZZeDiUzRTorcukpbnBeGG12YVSB6lMG8GNVgrZprbPiBiW40MBLFgMW+hEDoLW/by8jwfDoEGGuzhJ84FhuEbbIEXJr0alKluU2N7aS7VOR5FXNY0UkyfF1OzVs1g5Qocx8S98hWwLFiUImI7e6dcKibc0G/uKEYfNj0vm+rXfMz4TeJWXD1A3jSfbW6b5q+gn458iF18opR/InMHDOIMZlSwt787eDFgW/TYYlMAJU/G3HtOFIIFe8vcTUY7sfHdETC84F7B7k8z/1xiQS+2dfQ/ymg27eUaVfqELiEQRgP4BBXnCTr6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xnkSreqdNZ1wDF1m34bqeaIxnR22tViziuTfnEvSy8=;
 b=IDFcPKNgP7vsh1zRYTcBKyaVyQ+I5qJx2bIWQdzyNJxYe3G1LrJobkA6OYJJWqUFb7J0z12DusoZzY5PR3DV5lMm5aY/igQ7Ynqz5zrJBL1r0C7C8BqmI1t7ey7hMTiqoZB92GOpFIbmI5Bm+Pqkf5qqwxr/WtWZ10l29Fg62jY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2192.namprd11.prod.outlook.com (2603:10b6:301:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Thu, 7 Jan
 2021 09:56:55 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 09:56:55 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: use the absolute path in service file
Date: Thu,  7 Jan 2021 17:56:30 +0800
Message-Id: <20210107095630.32609-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0023.apcprd04.prod.outlook.com
 (2603:1096:202:2::33) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR0401CA0023.apcprd04.prod.outlook.com (2603:1096:202:2::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 09:56:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3967106c-9a59-44c5-96f1-08d8b2f29098
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2192:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB21927BDBC0E36DD9CE161001F1AF0@MWHPR1101MB2192.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YruTkdfY//wvs9ttsdR5A9SKbOOiGjTk+5jdXWoEQzQ24UshnVfU6+lpb9MAhak4sLnLG72q1/sqvBp/8joblG/53wPLeaDjU2+UiV8F+5XqcH4Yh08xj6xKE85ULyIttFfIvl/KfoBAhM29eKCaZKDxcXTDFffADqL53AxnSMlD5qmOhG+sMfqHWuuyiEhb9g+/76ywJYtwBtV7d9KkLHD1AjUgd4V2zKf8rL1IAbw6zjvBS3vE7Mj37mOsf3csvAtsDVq0D6TnE4mvaujWWl7tzVGnhrrXxsSNpJNJYawF0wlkYXNN/op89FQ7QHt9GX53UWuTEVDSioqEa9lYf3HngAflOCqQRjSZbH+PU5KQQJ3fExtp3qIf5VoRVLWvAsna4MpGKc+8vcGvXzINIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39850400004)(86362001)(6486002)(6506007)(6512007)(36756003)(6666004)(66556008)(2616005)(66476007)(6916009)(66946007)(9686003)(956004)(52116002)(478600001)(8676002)(16526019)(30864003)(316002)(5660300002)(2906002)(186003)(26005)(83380400001)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?yQoVOhM0HSUghduV3oX5USTjIUxP7TMbTLh3c3Zq4DoFvUeOIxvlVd+qRQi1?=
 =?us-ascii?Q?9tTTSylIeDwxQJOawDaRoXxhgschJB+gtXNk//VmYvDa1clwj4p3X1l01eME?=
 =?us-ascii?Q?ahoh7j7P3ukXUyTJ/BQJFWlrgIAn+NuoVNhnJH1bNYRwsyY04m1gT1fhMkTo?=
 =?us-ascii?Q?hpInK05yUhwD68u12vkZU9XZshG6wNw5X9GORmiBa7r6egzZxdWyEfjTVscw?=
 =?us-ascii?Q?J1eVJyjVMv/Ivh9HXgQCETPb7e2K/bXc62ca6bfAfqCbHmju3eec9cCHX/Vi?=
 =?us-ascii?Q?gm1IJhOE/QVaCBdHqYbullLBiq22Y+p5JO3L8hPbBF6F2KEFGTHlJzZe3mlB?=
 =?us-ascii?Q?OGsShY4Oytmk3pXgwoaGbcVTp2L5MsE88Q1jPEMU17pdjstHRY7v6S/Ir4Vb?=
 =?us-ascii?Q?g6jYacJ8cB87WLFnM+nDl/IHlhGQqAhtKCx/XgzCxmRiChySIQSsOp/kIvGK?=
 =?us-ascii?Q?18vM7DwFid64zI8n7wJYobXRmxCSxckPGBmhysavf3DsikJqTvPGKIzg7l0P?=
 =?us-ascii?Q?r7VbyDBANM4TYtGJHBeeOwZUsmcgbXV/2cCKyRcCfq7ureTg2K04OWO/Pbmc?=
 =?us-ascii?Q?z97kt/rLiFxQbi7HjNX61hppUVfnc3rDljtnBM15mHMMMgjR3ySfg5yBq5U3?=
 =?us-ascii?Q?1L00r+S3NQNqRJO+S3sNQYN/0OK8sxLgl5LQtD2kU4Zjou65YwqZ6D7UrFGy?=
 =?us-ascii?Q?1vIf0q7CKd0oG8/XbcRJJYQ2QSbeTM9Ug7Z5hI7ZQPDmHInZ5vw7gIXwaLxV?=
 =?us-ascii?Q?ygcz6WHfvZ0+A5I+lUP/A8mhJd87gPeP2Id9XN07mvFg29QKbLwXn1Ow70V9?=
 =?us-ascii?Q?RGVIZ0AnmBLZeQfkxKrOyXp5CIdtEMipd9siARVpqaGi0F/DoOsJw1lmVtLS?=
 =?us-ascii?Q?A3xlLYcCXp1+NYT95Mo3/fk5lUxPJVe/wqD8BzJyBJLZmgQPc4AQPR3dvwIv?=
 =?us-ascii?Q?mK8v9B0iTJzwe1QBuJZBBzlfqh7Ca/9Ru8rMyGt5J7U4ipFJIKVI4Nmbu+jd?=
 =?us-ascii?Q?zpEH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 09:56:54.8085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 3967106c-9a59-44c5-96f1-08d8b2f29098
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqgrNiSpwAeN69S+ET5oJNSGjfuuddTIl+tOuDh8hHxRXXTZUabyxT6XTr4SUV3/qbHRzra0euDlwlwVjKPXMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2192
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
 # systemd-analyze --man=false verify /lib/systemd/system/systemd-kexec.service
 systemd-kexec.service: Command systemctl is not executable: No such file or directory

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-service-use-the-abosolute-path.patch | 253 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_247.2.bb    |   5 +
 2 files changed, 258 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-service-use-the-abosolute-path.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-service-use-the-abosolute-path.patch b/meta/recipes-core/systemd/systemd/0001-service-use-the-abosolute-path.patch
new file mode 100644
index 0000000000..dc8e8b3052
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-service-use-the-abosolute-path.patch
@@ -0,0 +1,253 @@
+From 98a60faaca7f1a6b753f73556705cc68aa19e383 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 7 Jan 2021 06:40:29 +0000
+Subject: [PATCH] service: use the abosolute path
+
+Fixes:
+ # systemd-analyze --man=false verify /lib/systemd/system/systemd-kexec.service
+ systemd-kexec.service: Command systemctl is not executable: No such file or directory
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ units/initrd-cleanup.service                 | 2 +-
+ units/initrd-switch-root.service             | 2 +-
+ units/systemd-ask-password-console.service   | 2 +-
+ units/systemd-ask-password-wall.service      | 2 +-
+ units/systemd-halt.service                   | 2 +-
+ units/systemd-hwdb-update.service.in         | 2 +-
+ units/systemd-journal-catalog-update.service | 2 +-
+ units/systemd-journal-flush.service          | 4 ++--
+ units/systemd-kexec.service                  | 2 +-
+ units/systemd-machine-id-commit.service      | 2 +-
+ units/systemd-sysusers.service               | 2 +-
+ units/systemd-tmpfiles-clean.service         | 2 +-
+ units/systemd-tmpfiles-setup-dev.service     | 2 +-
+ units/systemd-tmpfiles-setup.service         | 2 +-
+ units/systemd-udev-settle.service            | 2 +-
+ units/systemd-udev-trigger.service           | 4 ++--
+ units/systemd-udevd.service.in               | 2 +-
+ units/user/systemd-tmpfiles-clean.service    | 2 +-
+ units/user/systemd-tmpfiles-setup.service    | 2 +-
+ 19 files changed, 21 insertions(+), 21 deletions(-)
+
+diff --git a/units/initrd-cleanup.service b/units/initrd-cleanup.service
+index 08ab503962..231dbda0c0 100644
+--- a/units/initrd-cleanup.service
++++ b/units/initrd-cleanup.service
+@@ -17,4 +17,4 @@ After=initrd-root-fs.target initrd-fs.target initrd.target
+ 
+ [Service]
+ Type=oneshot
+-ExecStart=systemctl --no-block isolate initrd-switch-root.target
++ExecStart=#BASE_BINDIR#/systemctl --no-block isolate initrd-switch-root.target
+diff --git a/units/initrd-switch-root.service b/units/initrd-switch-root.service
+index e3d6926711..a18b94df2d 100644
+--- a/units/initrd-switch-root.service
++++ b/units/initrd-switch-root.service
+@@ -17,4 +17,4 @@ AllowIsolate=yes
+ 
+ [Service]
+ Type=oneshot
+-ExecStart=systemctl --no-block switch-root /sysroot
++ExecStart=#BASE_BINDIR#/systemctl --no-block switch-root /sysroot
+diff --git a/units/systemd-ask-password-console.service b/units/systemd-ask-password-console.service
+index d31f3fa70f..16abf1af1f 100644
+--- a/units/systemd-ask-password-console.service
++++ b/units/systemd-ask-password-console.service
+@@ -17,5 +17,5 @@ Before=shutdown.target
+ ConditionPathExists=!/run/plymouth/pid
+ 
+ [Service]
+-ExecStart=systemd-tty-ask-password-agent --watch --console
++ExecStart=#BASE_BINDIR#/systemd-tty-ask-password-agent --watch --console
+ SystemCallArchitectures=native
+diff --git a/units/systemd-ask-password-wall.service b/units/systemd-ask-password-wall.service
+index 6a70b58cef..b30da07865 100644
+--- a/units/systemd-ask-password-wall.service
++++ b/units/systemd-ask-password-wall.service
+@@ -14,5 +14,5 @@ After=systemd-user-sessions.service
+ 
+ [Service]
+ ExecStartPre=-systemctl stop systemd-ask-password-console.path systemd-ask-password-console.service systemd-ask-password-plymouth.path systemd-ask-password-plymouth.service
+-ExecStart=systemd-tty-ask-password-agent --wall
++ExecStart=#BASE_BINDIR#/systemd-tty-ask-password-agent --wall
+ SystemCallArchitectures=native
+diff --git a/units/systemd-halt.service b/units/systemd-halt.service
+index 37bfe285c0..f5b27f9bba 100644
+--- a/units/systemd-halt.service
++++ b/units/systemd-halt.service
+@@ -16,4 +16,4 @@ After=shutdown.target umount.target final.target
+ 
+ [Service]
+ Type=oneshot
+-ExecStart=systemctl --force halt
++ExecStart=#BASE_BINDIR#/systemctl --force halt
+diff --git a/units/systemd-hwdb-update.service.in b/units/systemd-hwdb-update.service.in
+index 57398e5214..2b6a523598 100644
+--- a/units/systemd-hwdb-update.service.in
++++ b/units/systemd-hwdb-update.service.in
+@@ -22,5 +22,5 @@ ConditionDirectoryNotEmpty=|/etc/udev/hwdb.d/
+ [Service]
+ Type=oneshot
+ RemainAfterExit=yes
+-ExecStart=systemd-hwdb update
++ExecStart=#BASE_BINDIR#/systemd-hwdb update
+ TimeoutSec=90s
+diff --git a/units/systemd-journal-catalog-update.service b/units/systemd-journal-catalog-update.service
+index 477925685a..2a29e4e910 100644
+--- a/units/systemd-journal-catalog-update.service
++++ b/units/systemd-journal-catalog-update.service
+@@ -19,5 +19,5 @@ ConditionNeedsUpdate=/var
+ [Service]
+ Type=oneshot
+ RemainAfterExit=yes
+-ExecStart=journalctl --update-catalog
++ExecStart=#BASE_BINDIR#/journalctl --update-catalog
+ TimeoutSec=90s
+diff --git a/units/systemd-journal-flush.service b/units/systemd-journal-flush.service
+index 1a71592b93..1a4d189b51 100644
+--- a/units/systemd-journal-flush.service
++++ b/units/systemd-journal-flush.service
+@@ -17,8 +17,8 @@ Before=systemd-tmpfiles-setup.service
+ RequiresMountsFor=/var/log/journal
+ 
+ [Service]
+-ExecStart=journalctl --flush
+-ExecStop=journalctl --smart-relinquish-var
++ExecStart=#BASE_BINDIR#/journalctl --flush
++ExecStop=#BASE_BINDIR#/journalctl --smart-relinquish-var
+ Type=oneshot
+ RemainAfterExit=yes
+ TimeoutSec=90s
+diff --git a/units/systemd-kexec.service b/units/systemd-kexec.service
+index 0aa7933be4..6977b6faf4 100644
+--- a/units/systemd-kexec.service
++++ b/units/systemd-kexec.service
+@@ -16,4 +16,4 @@ After=shutdown.target umount.target final.target
+ 
+ [Service]
+ Type=oneshot
+-ExecStart=systemctl --force kexec
++ExecStart=#BASE_BINDIR#/systemctl --force kexec
+diff --git a/units/systemd-machine-id-commit.service b/units/systemd-machine-id-commit.service
+index 89e0613955..8ae8f59c69 100644
+--- a/units/systemd-machine-id-commit.service
++++ b/units/systemd-machine-id-commit.service
+@@ -20,5 +20,5 @@ ConditionPathIsMountPoint=/etc/machine-id
+ [Service]
+ Type=oneshot
+ RemainAfterExit=yes
+-ExecStart=systemd-machine-id-setup --commit
++ExecStart=#BASE_BINDIR#/systemd-machine-id-setup --commit
+ TimeoutSec=30s
+diff --git a/units/systemd-sysusers.service b/units/systemd-sysusers.service
+index ff5b3db821..735be55094 100644
+--- a/units/systemd-sysusers.service
++++ b/units/systemd-sysusers.service
+@@ -19,5 +19,5 @@ ConditionNeedsUpdate=/etc
+ [Service]
+ Type=oneshot
+ RemainAfterExit=yes
+-ExecStart=systemd-sysusers
++ExecStart=#BASE_BINDIR#/systemd-sysusers
+ TimeoutSec=90s
+diff --git a/units/systemd-tmpfiles-clean.service b/units/systemd-tmpfiles-clean.service
+index e962954f06..071d8492b2 100644
+--- a/units/systemd-tmpfiles-clean.service
++++ b/units/systemd-tmpfiles-clean.service
+@@ -17,6 +17,6 @@ Before=shutdown.target
+ 
+ [Service]
+ Type=oneshot
+-ExecStart=systemd-tmpfiles --clean
++ExecStart=#BASE_BINDIR#/systemd-tmpfiles --clean
+ SuccessExitStatus=DATAERR
+ IOSchedulingClass=idle
+diff --git a/units/systemd-tmpfiles-setup-dev.service b/units/systemd-tmpfiles-setup-dev.service
+index 0babe78767..f531f175d5 100644
+--- a/units/systemd-tmpfiles-setup-dev.service
++++ b/units/systemd-tmpfiles-setup-dev.service
+@@ -18,5 +18,5 @@ Before=sysinit.target local-fs-pre.target systemd-udevd.service shutdown.target
+ [Service]
+ Type=oneshot
+ RemainAfterExit=yes
+-ExecStart=systemd-tmpfiles --prefix=/dev --create --boot
++ExecStart=#BASE_BINDIR#/systemd-tmpfiles --prefix=/dev --create --boot
+ SuccessExitStatus=DATAERR CANTCREAT
+diff --git a/units/systemd-tmpfiles-setup.service b/units/systemd-tmpfiles-setup.service
+index 3f028d2533..93bb7a2775 100644
+--- a/units/systemd-tmpfiles-setup.service
++++ b/units/systemd-tmpfiles-setup.service
+@@ -19,5 +19,5 @@ RefuseManualStop=yes
+ [Service]
+ Type=oneshot
+ RemainAfterExit=yes
+-ExecStart=systemd-tmpfiles --create --remove --boot --exclude-prefix=/dev
++ExecStart=#BASE_BINDIR#/systemd-tmpfiles --create --remove --boot --exclude-prefix=/dev
+ SuccessExitStatus=DATAERR CANTCREAT
+diff --git a/units/systemd-udev-settle.service b/units/systemd-udev-settle.service
+index 994c47fce4..3a4f03ed1b 100644
+--- a/units/systemd-udev-settle.service
++++ b/units/systemd-udev-settle.service
+@@ -24,4 +24,4 @@ ConditionPathIsReadWrite=/sys
+ Type=oneshot
+ TimeoutSec=180
+ RemainAfterExit=yes
+-ExecStart=udevadm settle
++ExecStart=#BASE_BINDIR#/udevadm settle
+diff --git a/units/systemd-udev-trigger.service b/units/systemd-udev-trigger.service
+index 8b2d88e185..b4012af5c7 100644
+--- a/units/systemd-udev-trigger.service
++++ b/units/systemd-udev-trigger.service
+@@ -19,5 +19,5 @@ ConditionPathIsReadWrite=/sys
+ [Service]
+ Type=oneshot
+ RemainAfterExit=yes
+-ExecStart=udevadm trigger --type=subsystems --action=add
+-ExecStart=udevadm trigger --type=devices --action=add
++ExecStart=#BASE_BINDIR#/udevadm trigger --type=subsystems --action=add
++ExecStart=#BASE_BINDIR#/udevadm trigger --type=devices --action=add
+diff --git a/units/systemd-udevd.service.in b/units/systemd-udevd.service.in
+index f3458d98e6..c36ddbf843 100644
+--- a/units/systemd-udevd.service.in
++++ b/units/systemd-udevd.service.in
+@@ -25,7 +25,7 @@ Sockets=systemd-udevd-control.socket systemd-udevd-kernel.socket
+ Restart=always
+ RestartSec=0
+ ExecStart=@rootlibexecdir@/systemd-udevd
+-ExecReload=udevadm control --reload --timeout 0
++ExecReload=#BASE_BINDIR#/udevadm control --reload --timeout 0
+ KillMode=mixed
+ TasksMax=infinity
+ PrivateMounts=yes
+diff --git a/units/user/systemd-tmpfiles-clean.service b/units/user/systemd-tmpfiles-clean.service
+index 6a937071f7..004f1ca1d9 100644
+--- a/units/user/systemd-tmpfiles-clean.service
++++ b/units/user/systemd-tmpfiles-clean.service
+@@ -16,7 +16,7 @@ Before=basic.target shutdown.target
+ 
+ [Service]
+ Type=oneshot
+-ExecStart=systemd-tmpfiles --user --clean
++ExecStart=#BASE_BINDIR#/systemd-tmpfiles --user --clean
+ SuccessExitStatus=DATAERR
+ IOSchedulingClass=idle
+ Slice=background.slice
+diff --git a/units/user/systemd-tmpfiles-setup.service b/units/user/systemd-tmpfiles-setup.service
+index 156689edcd..bda5a3d22f 100644
+--- a/units/user/systemd-tmpfiles-setup.service
++++ b/units/user/systemd-tmpfiles-setup.service
+@@ -18,7 +18,7 @@ RefuseManualStop=yes
+ [Service]
+ Type=oneshot
+ RemainAfterExit=yes
+-ExecStart=systemd-tmpfiles --user --create --remove --boot
++ExecStart=#BASE_BINDIR#/systemd-tmpfiles --user --create --remove --boot
+ SuccessExitStatus=DATAERR
+ 
+ [Install]
+-- 
+2.26.2
+
diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core/systemd/systemd_247.2.bb
index 8416a522c6..8f8d461924 100644
--- a/meta/recipes-core/systemd/systemd_247.2.bb
+++ b/meta/recipes-core/systemd/systemd_247.2.bb
@@ -23,6 +23,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
+           file://0001-service-use-the-abosolute-path.patch \
            "
 
 # patches needed by musl
@@ -321,6 +322,10 @@ do_install() {
 
 	# add a profile fragment to disable systemd pager with busybox less
 	install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
+
+	# use the absolute path for the command in the service file
+	files=$(ls ${D}${systemd_unitdir}/system/*.service)
+	for i in ${files}; do sed -i -e 's:#BASE_BINDIR#:${base_bindir}:g' $i; done
 }
 
 python populate_packages_prepend (){
-- 
2.17.1

