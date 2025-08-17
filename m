Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2637CA0EE9
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:15:12 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.0])
 by mx.groups.io with SMTP id smtpd.web11.59863.1755461707088381459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Vtlf/cBb;
 spf=pass (domain: axis.com, ip: 40.107.130.0, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXyk66KQNUOyvqgZdXAGZCHer2pDwybZbUnTRkNF5wgPzpvM9RhDHQzobAqRrQmD3Aj9SA1xUajQxOPzRSQPNK2D2v33LYb1YYFmqZfZcDbTySThK7Jqx4AGZNTLA/J65dRwM/QrxJcB172WRi9rXYQuK5Eo769vJEz7OQsT/+ftmCt8J2B/W54/fv6y4lA3QM+dqN29rS2QUo0I8BeTNlO6hlLm84A13J7WjjFinPAYlS27/XYDQeZPo0waOAnWyldCsWFSx0MVqNuQHcpkRXI8/a21HRglYfyyJ1Kzflxjl1NQ13nFTKLbHCaSW0Ba0W/CJE9wnwEA1sxgzFJoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RNK8/ImyZZ7R9qgmRniV8UatVAo7eKNdnEVMHLqmMc=;
 b=pKX2uX2R9XStqV1Kn3FRGtn04tSezWK+1JNn80hAh8+Ov+qRYmRj/xgB3kBaqLNLrSOHRm6+mA2L8sJOV5ZqFXCkIoShKhLE9h+D8RnEL8yqYpce6n0Ch2tk3ES+Z3cnK2qGhWODOnoPRUgeRIvIBQdko9nU7NN4vvLOgIW7f2fSQo9Y/VFVho+WZxIGLuH8QCaKS1kOzG+VKADeCLgnSFvQlK1YYk16tpLqErVVB85UgYLu8gOIjc6D6FZ7932rsnbC8ArUeGFnyPGUPwZmkrJBqFkBigpabHob1+oBtF8RBf2TQGhiZqB8veG2MMNSUK6Qgv4sGP+XEScDReep/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RNK8/ImyZZ7R9qgmRniV8UatVAo7eKNdnEVMHLqmMc=;
 b=Vtlf/cBbNjvQiTYffSgq3JzEfasehF0diyGTFoMo5f1Yh9FnqBsuxUsyeWpjB9YDb+nsLt+ettUMqKVECdkMbLFdzvdX4Gbv55n2vJZ+2p1JIPUB36IkDAq7K34jZKSVoAygyzbw0tut+a/WQCXO8dfc9hj+2ndLxq3g4Pt0WhI=
Received: from DU2PR04CA0242.eurprd04.prod.outlook.com (2603:10a6:10:28e::7)
 by PA3PR02MB11163.eurprd02.prod.outlook.com (2603:10a6:102:4b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Sun, 17 Aug
 2025 20:15:01 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::ef) by DU2PR04CA0242.outlook.office365.com
 (2603:10a6:10:28e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.20 via Frontend Transport; Sun,
 17 Aug 2025 20:15:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Sun, 17 Aug 2025 20:15:01 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sun, 17 Aug
 2025 22:14:59 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sun, 17 Aug 2025 22:14:59 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id CDCED2976
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 22:14:59 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id BE2BB12006E; Sun, 17 Aug 2025 22:14:59 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 2/2] systemd.bbclass: Make systemd_postinst run as intended
Date: Sun, 17 Aug 2025 22:14:58 +0200
Message-ID: <20250817201458.2461468-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817201458.2461468-1-pkj@axis.com>
References: <20250817201458.2461468-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|PA3PR02MB11163:EE_
X-MS-Office365-Filtering-Correlation-Id: 847b9346-d057-4ed6-791e-08ddddcabef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iDt5Fog5T3PcTvQtjLgtmcwq4zXyHTnouz3haaYhsnBUOYwJKzvgz8fTHojt?=
 =?us-ascii?Q?ay4s/NKFCYimP1FwCUXj0Rq7kf5AeHiKGrI4GE0xmkyzYz27Nl3sYvwU75Vz?=
 =?us-ascii?Q?tWo8zlcavXnIbdakkRXWoDdb46mrJAX0N+6IkBcN2eyz2BWqiLUGXXPWWUbM?=
 =?us-ascii?Q?lE/HU/fBNZMKpZnQyzUc6/qbsEsBWnKwt2SVSbUnxXTYYgQtDsFWS7b54mJn?=
 =?us-ascii?Q?j4dIHdj+8qDR9vFG7hKGvISnIbd+0bqK57hs8Au8uFGmB91DOkll+VJkzEJq?=
 =?us-ascii?Q?HjOtCGZYosOlvcQNVPbgCWvyk28zlwi+FEtF6qVEf9U+p2fsH5c+2KQFBfV4?=
 =?us-ascii?Q?5hlh8T7eXqRQHgzKr6K8qA7HyoujaSV+Xj+ObBgLTZ8c546PlrSkzV/tDBvn?=
 =?us-ascii?Q?jZjwo7rwh2AiJepP2wxlBnPXpaIh6sJOCRtOJ2yhzqM+4pI5DqgiyEPFJIhZ?=
 =?us-ascii?Q?u0A1Yd9wtJ1oL7Kk0ymW4QBaPM2GDOkpj4Q+3OUhxy9uz9TbNB+52ozbvtp6?=
 =?us-ascii?Q?WxxLmNDFNmi4vUuWWkajL9RoLUmfyCoa1i2xg9LdrCwdSrTaHvDRlpvzQ/AH?=
 =?us-ascii?Q?Y10casOtesqLzOq796HFfMhQk9YRo2aiq+rH2vCOeIFw7hVBy0t8lE9UCojK?=
 =?us-ascii?Q?mLgJ9dAh6sATATbFKy3dpqI90aux5x0XOW9mPvxdRkwvmOKCh+bB703oD92y?=
 =?us-ascii?Q?KyCU0bvy5i32uBePd6nMHDhHMC/Rbt8dN9s47EUEth/dn8DQBxVP4MU3IcaA?=
 =?us-ascii?Q?co61SDtlWWe8M8j2BQN6bze+uITvAPPr532fau9AO1bMdGLZQfYl4J8mISDm?=
 =?us-ascii?Q?hSY/piqQcJh/pbifHLMXGfRZ+UzpeMvUrYqqVmWijTje/NVVXvBtpVXwzD94?=
 =?us-ascii?Q?crKV7YkcGpsigNyAW/mFdga8tut+WTB7V/YJ3zca5WRl94YP9ln805ZNBMNS?=
 =?us-ascii?Q?JybZjEdxj1r0snzMQe3GA3pF6goS5PZPLX3V2deKS21J7xurzFckAFxEkP2L?=
 =?us-ascii?Q?iG7P6iQJiivt8EMWZ34FMrOs8iyfPQbpHSQZNAF08aiPcD+Dt3pvS5kA8pUe?=
 =?us-ascii?Q?WuyuQvLkkd050VnvgPiX9Z9fJwQWrgYifDXqxje0YtYThzOLeeYXiiC7m5ny?=
 =?us-ascii?Q?Qvgu3N3ylYFZepwbHmh/VvfAmGuaGiZTUdQC5mizgsmOjKKj12fxIs0OaZSH?=
 =?us-ascii?Q?u9iGU+J22shMXcN0iDLM6lFHQwSP13Gx2RhuJtFy3SSMhd/gfJAwNJs0ArEy?=
 =?us-ascii?Q?OeT7GBFp1ZjfjpWaKUkKnw/DT7EZHWOKxSKNAnlfWvYGHzQq5XKOSs30dd0g?=
 =?us-ascii?Q?d7cD8B2tfqwQj2MZCr5nxYKoE+yJJNy4NHPT7ZyJ8uEERYewKs+5fiSVdSQ2?=
 =?us-ascii?Q?kyVEPLe99RhSJ6hjg+roiDnPC2sgbprm3qQQ3NDB+b8kuCHBZ1UdJ00E0xDL?=
 =?us-ascii?Q?YJWWibpOXEYp4FSdClNCZJ2F8kBTXYQzqEzgulB4c8ulYC6G7aqxlA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 20:15:01.2622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 847b9346-d057-4ed6-791e-08ddddcabef2
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR02MB11163
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222013

After the switch from using a systemctl written in Python to using the
official version of systemctl from the systemd project, the
systemd_postinst function has effectively not been executed during the
rootfs creation. The reason is that systemctl provided by
systemctl-native fails if run without argument (as systemd_postinst
does):

  Failed to connect to system scope bus via local transport: Operation
  not permitted (consider using --machine=3D<user>@.host --user to connect
  to bus of other user)

This is not seen in the logs since stderr is sent to /dev/null, and the
only way to tell that there is a problem is because systemd services
that are expected to be enabled aren't running.

The reason this has gone unnoticed is because systemd_handle_machine_id
in rootfs-postcommands.bbclass will call systemctl preset-all, which in
most cases will create the missing links to enable the systemd services.

This change effectively reverts commit
a52e66762c0c51918b1ba3d4622759637b6e920a (systemd.bbclass: update
command to check systemctl available) and instead only runs systemctl
without arguments (to determine that it can communicate with systemd)
when executed on target.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Add --sysv-install=3D to $OPTS to instruct systemctl where to
         look for systemd-sysv-install.
PATCHv3: No changes.

 meta/classes-recipe/systemd.bbclass | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 12c59647be..0a7de208e8 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -29,11 +29,16 @@ python __anonymous() {
 }
=20
 systemd_postinst() {
-if systemctl >/dev/null 2>/dev/null; then
+if type systemctl >/dev/null 2>/dev/null; then
 	OPTS=3D""
=20
 	if [ -n "$D" ]; then
-		OPTS=3D"--root=3D$D"
+		# Use ${STAGING_LIBDIR_NATIVE}/systemd rather than
+		# ${STAGING_DIR_NATIVE}${systemd_unitdir} because the latter is
+		# affected by whether the usrmerge distro feature is set _for
+		# target_, and we need to know the path to systemd-sysv-install
+		# where it was installed _for native_.
+		OPTS=3D"--root=3D$D --sysv-install=3D${STAGING_LIBDIR_NATIVE}/systemd/sy=
stemd-sysv-install"
 	fi
=20
 	if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
@@ -46,7 +51,7 @@ if systemctl >/dev/null 2>/dev/null; then
 		done
 	fi
=20
-	if [ -z "$D" ]; then
+	if [ -z "$D" ] && systemctl >/dev/null 2>/dev/null; then
 		# Reload only system service manager
 		# --global for daemon-reload is not supported: https://github.com/system=
d/systemd/issues/19284
 		systemctl daemon-reload
@@ -66,8 +71,8 @@ fi
 }
=20
 systemd_prerm() {
-if systemctl >/dev/null 2>/dev/null; then
-	if [ -z "$D" ]; then
+if type systemctl >/dev/null 2>/dev/null; then
+	if [ -z "$D" ] && systemctl >/dev/null 2>/dev/null; then
 		if [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False,=
 d)}" ]; then
 			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}",=
 False, d)}
 			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED=
}", False, d)}

