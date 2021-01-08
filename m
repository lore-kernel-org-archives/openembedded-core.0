Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.81])
 by mx.groups.io with SMTP id smtpd.web11.1253.1610095404184973906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 00:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IDQN9EhW;
 spf=pass (domain: windriver.com, ip: 40.107.70.81, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lieycYG8QVK4FxCcTP5+w0vaWgrO+XuavMvGi4bnKh4bZAczwlZ56NvdkjqzBMOUGT666g4CLt/WXmLGww4heYLHrlLQ5KNrxtxp9Kujjfo2W5TtzqQptKoitKLCkI+qKhlPxSwPSI047EKCmBlXn73XLzoYlPcvL79DrA8b1keMyzW5EciU+un42ndj6iY2tz4jz6BnJ5QPe8yNdEhZBqAXHdDColh/eUPMCFiz0EB/mmSK3D67eisXG9TLgwEF3rgDEO3Ej/9OoJasMTcuYlPaalKHE5gL5JGFdaNit6tMREr3v3x10GaUVHBJq8Q3fg2QU0o/skz9bnn5nQXGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ahpkbh+64JK+JWZtnOhazPDl0H0eJHbE64v5VYZ4zk=;
 b=UHeUgtiRbue0HfyxoUCeVWJkNCNxos+vsf2IJT/vyJHRo8UfioRHAHUzvKeHbQVl43Mzhjxnk72mhdwLP4Nwmd9o9mgNNzn69BAhYJl1/MYZVSo3kUfv5dWe1T8A1lK1LhAlyVMgSaCMyEZVGRaUJnjAFltUe3MI6uW89jmVZZEOcXrGGIawuiRGYTeSjpDwJpdQYP+MK9xwWWo96iEPnY8Liksq/ZuYmtU+qdis7T9+J8u+qztMAbMINJg7KteLDMh1y7W+PChGMoYHPovXvzxaxBFRXDfQeHQpI41ociMEIbOPIw0cU8S0UQifnDqZRFQVnHH+cTiZq8Y6Wu84Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ahpkbh+64JK+JWZtnOhazPDl0H0eJHbE64v5VYZ4zk=;
 b=IDQN9EhWQSS+auI8QOzQkEpVUIyTpgiquqyp+Ea6QRIK+c0p65eHIFdIao7PNHrbOEJdKjKQJQrRBxuFH0RgnxP/AdlJuWwiyoz1w9jnJBZMMKt93bPl7bS4guVin9ZbqBn+V2boMjpjEzmIh90/bw2GryR7ewAtk5qQMVKDmtw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by PH0PR11MB4870.namprd11.prod.outlook.com (2603:10b6:510:34::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 08:43:22 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::587f:54db:8f1e:5e2f]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::587f:54db:8f1e:5e2f%6]) with mapi id 15.20.3742.008; Fri, 8 Jan 2021
 08:43:21 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] systemd: use the absolute path in service file
Date: Fri,  8 Jan 2021 16:43:01 +0800
Message-Id: <20210108084301.43284-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <b4307af4a02b5d302e06ed776cab0cf84d5ced30.camel@linuxfoundation.org>
References: <b4307af4a02b5d302e06ed776cab0cf84d5ced30.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0011.apcprd03.prod.outlook.com
 (2603:1096:202::21) To PH0PR11MB5014.namprd11.prod.outlook.com
 (2603:10b6:510:31::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR0302CA0011.apcprd03.prod.outlook.com (2603:1096:202::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Fri, 8 Jan 2021 08:43:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5058d692-ebb5-4ac0-def8-08d8b3b17491
X-MS-TrafficTypeDiagnostic: PH0PR11MB4870:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB487027E9E407DFC5C6DF92EEF1AE0@PH0PR11MB4870.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8i1XndqzuAhysZchKtfB5LQFpcI4ATwfRRRN5Sswxzu+DK8zr5XeB1e1xg0A2OcyX0o41+8qcKNu5ezBJdBRLWvt7PXzCuVSMhdVYQU9HFhzCjFUfEa79EoYL8NyIXL3/TrrWB3prt7F0t/0EJsfpTR8gNcWywka5DYZV4y52LPwDYubGpUWY15/fMBgJveiASbuYDjgt1Mg/hU9+MqRhv6Gr6Jb+nCrue6YH9fJD7QE4bzWBG3PK0if2ZpqnGbBom9DZYqNoAnZagiarbvwmivrtvzU6BLEibHXc94+JCZSzKMZfMcm+OyHiGOxpVfww9iSFfGl0miVOzEPt824qwbt/U84nOUS9sQjNcMOcls19s5HgTegMX2WsQsKIuesb85Wo3OaSvUN9LFM1G2qoA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(136003)(396003)(346002)(6506007)(478600001)(316002)(6512007)(6916009)(9686003)(956004)(2616005)(66556008)(86362001)(52116002)(6486002)(66476007)(66946007)(83380400001)(36756003)(8936002)(8676002)(5660300002)(26005)(2906002)(6666004)(1076003)(186003)(16526019)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?CkJ8ZSOTN8W5uIc9HkRwQZObghLJpVlHA4bskfRMWxKAdNzoahB2+T+0RiXb?=
 =?us-ascii?Q?755jbuqhk0IEHaYgpMzSiDNND72zj62KhbXRNVNtJ+hW9BAfjxeU4ggcRli1?=
 =?us-ascii?Q?MbOW9ltTIqxD2jkVGWgQ+RBvtyTAXmNvFS+T1ipJtQl6TT/FKGIKOkktTJLS?=
 =?us-ascii?Q?IwtrJ4m/Ojpg/hiufRhbO2LkU7rFa7sEly5UKRs3whjbN1O08NKwiAqLyavF?=
 =?us-ascii?Q?Tnf82Sxs/z0nKZhNyA+vkevdPitzyxEJr1iezPo25pib+bbCUqGgj1491Zd3?=
 =?us-ascii?Q?FiYjsz+2zqUDL8wH3PrsArtz1b6360rvBKMvBo7OL1erGMriP9mh42QuECkD?=
 =?us-ascii?Q?R0WuKTaFkL+w7qR9q49Eq5J++m66n6NKotZu9y6TeQCPBZ3yO6ixKuPto2N7?=
 =?us-ascii?Q?y+AENtAVkEuxB65pg8uS8iusRapnDF9tPXwkTC/59HgWb+4kYi6ECz9oqLw3?=
 =?us-ascii?Q?Dd2zEq6unm+0Qf0hzWq4feXAdH9tAiYxUINZ3JrrrOVfIiQ/J9y0STcJMPHB?=
 =?us-ascii?Q?epyHdiM9rLJ4/or0t5IOhz35nYUm/V7H/oA1GPNQUKfh1oXnAyxcSRhXdp/3?=
 =?us-ascii?Q?gTwKe+3AB836tjsUIXbRGikZWo+ZWPbtoSYzVqYq6wMKRfDdkVp5cM8AkodB?=
 =?us-ascii?Q?sO/d1apIAoEOoCLjPqm2oUn3TP0VZV0LKmrXIPXotBzgPKAHBbZmcJSDtzbJ?=
 =?us-ascii?Q?tr/mngi8fO380I0b0bHLcdI77wx3oybahZWmLY9rN1njmLsSKE06aPS4Z+N/?=
 =?us-ascii?Q?n4s79Z/8f8WFVc/xmD8sytfm1Bd8jNIVI4JHJqGEryhnBKVcXX7VDpuJAbKk?=
 =?us-ascii?Q?ViUOxXHmIbq2A8WyMn4NGPjTQry0wLnnK0ncMpsjizaduFbp5ghJEbOcXdn+?=
 =?us-ascii?Q?JhLLvRbXG0zsSEadi9AV592xZtDA3gI6ciioFkx6FtFqaZs/Dfton6eTq4ql?=
 =?us-ascii?Q?Zzodyr7hm+Nyz3NciEP3g1Bcp7WpiJlouoOOjAqfmcpCEacXfmTMoKcLnt9M?=
 =?us-ascii?Q?YeUF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 08:43:21.7891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 5058d692-ebb5-4ac0-def8-08d8b3b17491
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGCUR3e8XUgPfRTVDOIL2fQIM12f43rAS5o0dLnJ4Zs4F1S/h4ApoqK9ETRX4SjORUpVG2UOJbVZyNvdJ2qptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4870
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
index 0000000000..db89be3a26
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
+Upstream-Status: Inappropriate [configuration specific]
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

