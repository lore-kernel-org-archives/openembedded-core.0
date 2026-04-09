Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6530FE98FD2
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:59 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128348.1775726994693315003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=oSahMo2c;
 spf=pass (domain: ericsson.com, ip: 40.107.159.57, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5QuoPDo4lRfXXKUQJkaY/zphdvxwQqDulgGX3GtUDQAg3H322g7Zb6oJYMydwLdVAHuVSF8fPEKULfUnnYRfKStQfW69i9gnfhjqWHinHdXFCQx4G5MAPgrL2joUvGEZGoncQTWdZf0M/uwP6Q7ZbD1DmDKpAYnBUolEd7MNBoGPTvslAR/mYZHkG+NJWNHNOwRPG1UdqaGB+VfOTU/PhXIguI7graAMbR/YvPVV7m+XbZdTKWSeHm7Oc5zLgzJt+YSlG1OwHU4QIWZuQzPvwL3E5HJDeHideUzxaCEIst3uAGH5BpD60mBuh5RMEN7O564dqOh5qga2WB3GNvL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qrgTzFKXAeeA7tl7aMBqMRbcrY5XP3+v9fSAk5SdJY=;
 b=C7RaXmGSsFT1K2+6HjFctjzn5Kj1d+M5mzp9Bm48IHpeoo+unCBYImF1Gk6RL3MF1DbD2qiiSwk49j86Vc4gO0ZcDqX/14aS3Oad6WVh+VqN10FIEkbBpekVGkZIkQ2Z19/EIpMqxPXg6tWXYVfHjWvC+EU2I+H14rZ5DZYZtatJJRA/g5CTGGEgiESFq1ilgjPzvrKC6iiDd3TlVu7Ho0jzu+Kh6B4sUiHQfHGerbqeCxGl9QPB9LbbM9lMluKWimcx4xQPIU0yJqZ6X/NZGyw/Kvt6hIGucdPcw7+u5lV2wKgEb1Cwdl0Wnk7qULzEhT2JOJtscvz96IACITxzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qrgTzFKXAeeA7tl7aMBqMRbcrY5XP3+v9fSAk5SdJY=;
 b=oSahMo2cuf5ziIk2yDjDtwgWy0O9j7CrGDKArOAPqydek5P36bVBJtSZZqN96JRM2esD1BlOFku00TnB+TJmk2zbTEEhC0qd/pmoFBFmk/p6H8dSHihYT89VKpwMLvKbIPMVrnXrfqyaAZA30ME/Am41cZiLM+yuMH50tJItqNfyBGktNq3PKSKbmTz0gg4ajieUFpClqsjHCi21utiXAnwUJGrxwnNjjXdOXxZ8v0h3uL8xphbWid/Rq47+yhiH1holFG2q+cX3k+pttqmwi26H4cuwf3algX3X9RynhGjxZjX9xuse1tA1ISlU4Rj/s7sCTtRfYAEQ3w7CEBcg6A==
Received: from DU7P194CA0011.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::17)
 by AM7PR07MB6424.eurprd07.prod.outlook.com (2603:10a6:20b:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 09:29:48 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::4b) by DU7P194CA0011.outlook.office365.com
 (2603:10a6:10:553::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 09:29:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:29:48 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 11:29:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 124484020AA6;
	Thu,  9 Apr 2026 11:29:41 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id DFDC5700DBAF; Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH 5/9] sudo: upgrade 1.9.17p1 -> 1.9.17p2
Date: Thu, 9 Apr 2026 11:29:32 +0200
Message-ID: <20260409092936.1740143-6-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409092936.1740143-1-daniel.turull@ericsson.com>
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|AM7PR07MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: d1504bc6-30de-4e18-7f97-08de961a8b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	G3aGzqs6yyYr8xCx5ygNryl3nA7zcrdLX4DtBPbbYncgLktqgcwPJ4Ajc8YVjj7aA3YvIgiOtiVcH967dclQtptP/Blyk00UiMIsbQjXCOonWUpWLbuIc3snWX3z8TWCQT5JULrdBbrtqpu4mZZaP4aoJq9oMTqC1uO0quCR8SqpyNrKLT3pH7qtaUdXBGhB/OgD8av+C9sSuzXh1sT5HY6qOHtU+yKOw/Yo/5Ow2d9YoaUnNQZmr9w7thGVMEZx2iuOiSSewprig27oIH99aBPbLDHxoVCNTXqCSvlyG0QUrSfXF+fLk6xasoIkcPsRW1ucZ+YB5lQUSSsyzLasnxon1MdgW7Xhjlzs6j2PILkI+jjGpg5PBMrBTgCNwtbZfctTaUHXSmMNsrbl3r32Er3nTWVOgmWhbyvhBxaCn2Hr/IhdkE9Dla+WgOwCEVxRBYbbf6nDunc1zNI33aaEx77KcqDPe15zvSXSnh1TN+JjcPXOr7CuE3KDmwr2XBJYdS3+/6XZnx5fNSl2vdzonkHMcuxj7js8ygrLVYrZUTaglEsrZn/E7ocPVZgzVuQonfvkQ7cASRcT0v6ZXUQwWmRmkWYJIUEZ+Ax7bycqun8H5cd5m+fz5M/PP8c+tXSY1nOknT4meFlrHFw8N7zebhkVBhTKOINOmnUeUh9zKyCOWY9uIBiHEa33t7atybDHru2KisShY7AmQmm2sZnxZhGWmSwXo1cq6MMpggqNQ+UdhRNlWZLuEZlRFx+79LXzQAExbfIxkTAFv+yP13E7Pg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9DAcxjTN27nPT5oplvAhEs1HFyPxr4E2XSLMWJojtXi0EU8pjBkrrot+UOMOO7NLIAbzW1tDrb3vhy8S4c2mETbuyehX/7zLz0pxavJM1Geda3IV+xTPhvCyo5F1weLC/dDKfLPFX56LhqqPT8h13MBD9svSklyRW4ez/XPHDTx7p1PkD2q9EteCT308SciV/rPtseei5tt9l4KvevgZ995xbaHpWwQtzQpkaEi15N22ZqWHRzIXa++9z5wzb7WJ1TR1gRRTBoQJ7dxd99vbJFIEA/SRyh1MHona3mtIfVMcS3Wzqdqkj3+ui2Sg3XK8mqBfYlSwEYPLpl2sWWc246tJpk+IAL87KhBDjTNY89hscUTsjfcDrOmOALSDyXp9X0BQZWVVmBvxbGI390TLYA145qJPeyDjcAofpSUdRf2Zn5Cp8V2vOIL8oRg8SQSR
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:29:48.3669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1504bc6-30de-4e18-7f97-08de961a8b5a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6424
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234909

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for sudo: 1.9.17p1 -> 1.9.17p2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

	Merge sudo 1.9.17p2 from branch 'main' into sudo-1.9
	[d1b48c651]

	* configure, configure.ac:
	Fix check for which man page type to use with nroff

	Fixes a bug where configure would use *.man instead of *.mdoc on
	systems without mandoc. Bug #1077.
	[aa2498e46]

	* plugins/sudoers/log_client.c:
	client_msg_cb: make warning match the function that failed
	[f73162df3]

2025-07-23  Todd C. Miller  <Todd.Miller@sudo.ws>

	* NEWS, configure, configure.ac:
	Sudo 1.9.17p2
	[f0e1a5ca3]

	* plugins/sudoers/match_command.c, plugins/sudoers/match_digest.c:
	digest_matches: plug fd leak on snprinf() failure
	[26a1a7529]

2025-07-21  Todd C. Miller  <Todd.Miller@sudo.ws>

	* etc/sudo-logsrvd.pp, etc/sudo-python.pp, etc/sudo.pp,
	scripts/mkpkg:
	Add a way to override pp_rpm_arch when building rpms

	This will be used to build x86_64_v2 packages for Alma Linux.
	[55d3c99c4]

	* configure, configure.ac:
	Fix check for which man page type to use with nroff

	Fixes a bug where configure would use *.man instead of *.mdoc on
	systems without mandoc.
	[2dc10cfbd]

	* plugins/sudoers/timestamp.c:
	ts_write: call lseek after fruncate on short write

	We need to make sure the file position is reset to the old EOF on
	error.
	[8e7e0e23f]

2025-07-20  Todd C. Miller  <Todd.Miller@sudo.ws>

	* src/exec_ptrace.c:
	ptrace_readv_string: quiet sign-compare warning
	[fac2a49e7]

	* src/exec_ptrace.c:
	ptrace_readv_string: properly handle reads of more than one page

	When the intercept and intercept_verify options are enabled and
	either argv[] or envp[] contains a string larger than the page size
	(usually 4096), ptrace_readv_string() would fill the buffer with
	mutiple copies of the same string. Fixes GitHub issue #453.
	[2e93eabed]

2025-07-14  Todd C. Miller  <Todd.Miller@sudo.ws>

	* src/exec_pty.c:
	revoke_pty: use killpg() not kill() to send HUP to the process group

	Also make sure we never call killpg(-1, SIGHUP), which would send
	SIGHUP to process 1 (init). It is possible for cmnd_pid to be -1 in
	certain error conditions where sudo killed the command itself. This
	may explain GitHub issue #458.
	[fb208d383]

2025-07-08  Todd C. Miller  <Todd.Miller@sudo.ws>

	* etc/sudo-logsrvd.pp, etc/sudo-python.pp, etc/sudo.pp, scripts/pp:
	Don't assume RHEL major version is only a single digit

	Fixes handling of RHEL 10 and higher.
	[e5d953f33]

	* plugins/sudoers/visudo.c:
	visudo: create temporary file as mod 0600 not 0700

	This was due to a typo in the mode field when the temporary file was
	created. Noticed by Bjorn Baron of the sudo-rs project.
	[1c254b330]

2025-06-30  Todd C. Miller  <Todd.Miller@sudo.ws>

	* Makefile.in:
	We now build sudo releases from git, not mercurial
	[cb4e26734]

2025-06-28  Todd C. Miller  <Todd.Miller@sudo.ws>

	* NEWS, configure, configure.ac:

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../files/0001-sudo.conf.in-fix-conflict-with-multilib.patch    | 2 +-
 .../sudo/{sudo_1.9.17p1.bb =3D> sudo_1.9.17p2.bb}                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.17p1.bb =3D> sudo_1.9.17p2.bb}=
 (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflic=
t-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-=
fix-conflict-with-multilib.patch
index 1989c5abd7..f96ab4b1f6 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-=
multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-=
multilib.patch
@@ -1,4 +1,4 @@
-From 8c69192754ba73dd6e3273728a21aa73988f4bfb Mon Sep 17 00:00:00 2001
+From 3b9ed5e1ae1e217158af7d9128e35ef3463bc107 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb b/meta/recipes-ext=
ended/sudo/sudo_1.9.17p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.17p1.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 5b9d73b33b..d715bc2075 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -7,7 +7,7 @@ SRC_URI =3D "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
=20
 PAM_SRC_URI =3D "file://sudo.pam"
=20
-SRC_URI[sha256sum] =3D "ff607ea717072197738a78f778692cd6df9a7e3e404565f51d=
e063ca27455d32"
+SRC_URI[sha256sum] =3D "4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b0436884=
3b06dada2cfcfb"
=20
 DEPENDS +=3D " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam'=
, 'libpam', '', d)}"
 RDEPENDS:${PN} +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-=
plugin-limits pam-plugin-keyinit', '', d)}"

