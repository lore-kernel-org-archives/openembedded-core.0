Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3626EC3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 14:34:56 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.3])
 by mx.groups.io with SMTP id smtpd.web11.38.1721226893130412399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 07:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=YFXoPd9Y;
 spf=pass (domain: axis.com, ip: 52.101.66.3, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOUhqZJhXIXbcJ9W3mfua7UxE/VjiFTUJ5rRldz1PsYyQSqgN/lMmHDpqhRVx2rJ3vIBgJLJYYaT7x35mhupJafOTvuadGA33QMlODBXSe2TSIkuhkIYy9RzA9hwb+MIX0M3UbyQNHOIq6JqID0Uypk74L2+5mbR+nsVgxba6kyNg0VXH4I63Vu2LCxswV7Yb9bNyIcLFIHxaWZkBVfwkgo+96BsAkE0x+6LmhKj0V2zYU8gyDQVOvDSQjQ/j85E6X0v88QEF3lAyLDcI3gVqUBSVsV8MkmRjEbNXUTouabveme9tz979ICO1moRPaNB5FOAyul6nACgnsEvOcQykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qsajq9/jZGSRhaIRYCw0C96AsaYUKnbycGzvadblnlM=;
 b=tO//pRmHxD6oJC9UoRYay/XHV1jfz/bsCDSF/52G8STNSkmxx+TvjCAEg+a/xd71Vnebhamc9R8HrNvSZcBNzGMZjIErKADsTw3PAbuQM1w1TYnOuBPEsk7+FTjmoySbg88S2Cdegn/FSghFmg8Ox2pBMo+X0uhzzYUzebz4qvl2Rl5jrR3+6QyE9a0ua+D8/AdNxrV/waCf+/qGA1m9B44lEoMl3B85alUlX+wnoc5pJjdemPYhIcA9Gh6IBs9n69Z2T4iUnwSKgycTfEhPm6mREoX836qTknY/qfuPPXUrGpG/sIfJh/orH5Y5OpGm9IfHYwF6LfcPVx3uWYCT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=bestguesspass action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qsajq9/jZGSRhaIRYCw0C96AsaYUKnbycGzvadblnlM=;
 b=YFXoPd9YdSZeHyzbCTJhd7qzZxcbwdNKxNXT36MTA33RQR4bLaLsqY0JAeGvPNrCUR+5slzjSgp2+6kv/Gr4VWduQ7FlMvgGA8nZq+pGqoOx/CY/AlhuQslKuZzdzW6vwlnh98OCwrivFBpxnIDMggtpSMkL+0lTIMx8bAttsMI=
Received: from DU2PR04CA0228.eurprd04.prod.outlook.com (2603:10a6:10:2b1::23)
 by DU5PR02MB10906.eurprd02.prod.outlook.com (2603:10a6:10:51b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 14:34:49 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::13) by DU2PR04CA0228.outlook.office365.com
 (2603:10a6:10:2b1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Wed, 17 Jul 2024 14:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 17 Jul 2024 14:34:47 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 16:34:47 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 16:34:46 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 16:34:46 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id CBD2B117
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 16:34:46 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 46HEYkMs804919
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 16:34:46 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 46HEYkpM804916
	for openembedded-core@lists.openembedded.org; Wed, 17 Jul 2024 16:34:46 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] systemd: Correct the indentation in do_install()
Date: Wed, 17 Jul 2024 16:34:40 +0200
Message-ID: <20240717143441.804891-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|DU5PR02MB10906:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c300c0-6399-47e0-a560-08dca66d9bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kArCkCUD1AgM0UHfd+PbwtV6G8JLcD9xbCQvTe/sggn/QuEu6WdpEuCUgbwx?=
 =?us-ascii?Q?nHUTT8tt+lL/p6BKLKcKU3CWOh/OURqV8/gdH4cIuzIEKuRrQRZSPzn7JqSS?=
 =?us-ascii?Q?j+i/GpESYnpkeq8336ms+sSEA3Gbo6Z1DXUUXye0CYGqusy0PRw4da9z850P?=
 =?us-ascii?Q?bSEkGeWT2MVOSH2f0ixqIqGEy3iweg+Mu9JVfCw/L6rGWy5xunPSWdMBEuBn?=
 =?us-ascii?Q?OY8HeZc1srbWKbkY7yiCvq67u6iy0niAeilLZjGECozCPPVqJKid7pM0R5zi?=
 =?us-ascii?Q?HkXDqFW/XqzZ3n/2iqS65jNP8V/YMtd8c1qJVVm70HWX4ph0yWJcthQ+AhCD?=
 =?us-ascii?Q?Av3BqcSCavgOkNniJQDH2WAlt0LwdMj3sjRMHUQfF6guqfyCrOZ+WanIDA7g?=
 =?us-ascii?Q?2itiJc38GRilTymtIVCF1AJdGQh8Y6xZJZhj/4QsIDxrNlCcQ+OA72y3L9pP?=
 =?us-ascii?Q?wQPHMVwDnR/iOdeA7ONrJnMWASpB9K9VpYwVIbyQtn4xkUjvV/SwInM27ZfK?=
 =?us-ascii?Q?O8w29ggJfciV0MRR3GZxO6mUF+U4Y+NvWHb8/LmnqaHcHRZwFZYpSy9gJ7cx?=
 =?us-ascii?Q?t+IG7xClLr+62WFMx7Mt7Z9PKmwyrbxn5MRee0//SVBK63v9lpDQdYQC1MP7?=
 =?us-ascii?Q?MSWsYqSIBD0DMbe7vuFOIqu+sBG7OICzoMuesivPMr/EHqC4DAoL/jPwXtyV?=
 =?us-ascii?Q?Opr2eUMyJDVX/ZV1hGpA2kAizjnhGDOynAnYP6cU4QYc+ogUEI5DsSjAPxEY?=
 =?us-ascii?Q?Qk/pPZyEjVdAQD7gvAIYBFNweZud0sEJoSzKcRbMWtXbzt1e3Jv7KhSjIiWV?=
 =?us-ascii?Q?vGJG+29mQZzHJw/CMw1vx3TBDFCl0uICw7a9CA/sbe7FIExZ3s6MUwjhhkFu?=
 =?us-ascii?Q?EVyOgIMnTorywujE4coqg8rU6uN+7wv2fatwDC/3zftJIcNFMLp7zbS2lrwc?=
 =?us-ascii?Q?d2jNfpSLkv0oFvZHTXqFt6jMHp3RjcNRAyumrEAfd7OGMbBkibqhFVMEZlYf?=
 =?us-ascii?Q?A9yyq1X2ejFlNbQ47orjC2ubYlilmL95ELZFwT9JYSWre17labcFyvpLH4DS?=
 =?us-ascii?Q?hEdpvbCOsvpWwYQWgMtr2ChZfrgXKHRPvTbDu19sO0JUTXk47YqjYIytpsQF?=
 =?us-ascii?Q?3K5mlzx1bXg22K+jiyg8yVRtks6LbhmZx9nUjPOgO2AFv0bowPQ6e8+/Vmgq?=
 =?us-ascii?Q?5ZwdqPCz9L9fH4anyTfwwKjLwvHQetjKz42wW/Zh0DYzMt+MEISjonGMRce/?=
 =?us-ascii?Q?djLVmFmdeDQvgKk0eIZ7NmKnmMmsRaEC5sGvCXoJOnHId4s9snmu0LMf2pkc?=
 =?us-ascii?Q?bt1KAuwZkA40TZh994TjXWaKP1W6XEu//vj7Wk7K0fLkYaHi/Ol+yzmcpHdK?=
 =?us-ascii?Q?+5B4U1tisz9R+mMnND1kWQYJ3u/KUWCKlmBQFhKmTdbZcmw1848aGhH8HYVZ?=
 =?us-ascii?Q?pg657e6Bfg4d+oaCTy1HOL52Qq+YspAw?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 14:34:47.5274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c300c0-6399-47e0-a560-08dca66d9bda
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10906
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 14:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202166

There was a mix of using tabs and spaces for indentation.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd_256.bb | 27 ++++++++++++------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.bb b/meta/recipes-core/s=
ystemd/systemd_256.bb
index 3579c71891..ef243c2ce1 100644
--- a/meta/recipes-core/systemd/systemd_256.bb
+++ b/meta/recipes-core/systemd/systemd_256.bb
@@ -278,16 +278,17 @@ WATCHDOG_TIMEOUT ??=3D "60"
=20
 do_install() {
 	meson_do_install
+
 	if ${@bb.utils.contains('PACKAGECONFIG', 'sysusers', 'true', 'false', d)}=
; then
-            # Change the root user's home directory in /lib/sysusers.d/bas=
ic.conf.
-            # This is done merely for backward compatibility with previous=
 systemd recipes.
-            # systemd hardcodes root user's HOME to be "/root". Changing t=
o use other values
-            # may have unexpected runtime behaviors.
-            if [ "${ROOT_HOME}" !=3D "/root" ]; then
-                    bbwarn "Using ${ROOT_HOME} as root user's home directo=
ry is not fully supported by systemd"
-                    sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/=
lib/sysusers.d/basic.conf
-            fi
-        fi
+		# Change the root user's home directory in /lib/sysusers.d/basic.conf.
+		# This is done merely for backward compatibility with previous systemd r=
ecipes.
+		# systemd hardcodes root user's HOME to be "/root". Changing to use othe=
r values
+		# may have unexpected runtime behaviors.
+		if [ "${ROOT_HOME}" !=3D "/root" ]; then
+			bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully s=
upported by systemd"
+			sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/ba=
sic.conf
+		fi
+	fi
 	install -d ${D}/${base_sbindir}
 	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false=
', 'true', d)}; then
 		# Provided by a separate recipe
@@ -395,10 +396,10 @@ do_install() {
 	# add a profile fragment to disable systemd pager with busybox less
 	install -Dm 0644 ${UNPACKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.=
d/systemd-pager.sh
=20
-    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
-        sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdogSec=3D${WATC=
HDOG_TIMEOUT}/' \
-            ${D}/${sysconfdir}/systemd/system.conf
-    fi
+	if [ -n "${WATCHDOG_TIMEOUT}" ]; then
+		sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdogSec=3D${WATCHDOG_T=
IMEOUT}/' \
+			${D}/${sysconfdir}/systemd/system.conf
+	fi
=20
 	if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)=
}; then
 		if ! grep -q '^NamePolicy=3D.*mac' ${D}${rootlibexecdir}/systemd/network=
/99-default.link; then

