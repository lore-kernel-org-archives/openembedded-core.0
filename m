Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269FBE9A03C
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 20:02:39 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21412.1771358557382472347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 12:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fI1ODTmS;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.20, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMw+r59W1UouOU092o1GAxaa+tMC4VhV1r+/RMV5Md+02dDiR+QniyNV71/MD7ekRpcrrrFWKQgfFmhoW72nGK/PgioKk1ahJ6XTU5HFDy/zMs3FVMvaJLGt/b4uIh2vGZ8Ev7BIdBhzcDfXNBd0cGXUyWR6OxLm9qwZQWSEq4CuXVMm+hPhlZ/2jVsajA1UYbbmooVXTlggXjqgTHB4NUrqn7BNYEyIUkZ50C/PS5jqPkKqa+l3E8EzPOunnFX068RLnjdOYi/RL456Vy27+aaZeLQpXbkqvQ/Byo6wgQ46d460DYuEk2Z8PT89N1PHmPkIVy7a1b0e5Y3wYZQ93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkJaGZBul85JK+zH9fSM2JmEiVcOdHQeto9831/5BBI=;
 b=DvN96kgVL7ZTD+lOlP7sV7uYznfQk3dS3RCh1JnA/DNScc6zUI/JLndJd9o4RppPTIbR1jT2aQ11OgficrD/WHLAiD3Kq7jsIUBAQFEnMbUFgs7ghzKFTyhaDgJO9VarWrF1tnos1mWxATHRs/jQONX2x8KcfZnj8vY4aaL92FuDPJ6TT8obSa3cuDMGrXeEXIPlNWLLTBBU3QYqOtiAFkMowP1LgYdPmKND9dQnASe1wzY/tykuw3mrUrpQB4gdpwkFi1TUtGn/fi2H9K6E17OHEJhQkVi7bzxomTyIrQZ3t7RH4HbYOldvPckSE0L9GcAVcvIgAHiKMYMpf42nlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkJaGZBul85JK+zH9fSM2JmEiVcOdHQeto9831/5BBI=;
 b=fI1ODTmSV0OSIe2tBQd86CewsKcVA98jHCHjlKfBu9hso0mPp7VS1On4WzR14JFd8VOBxGwdOhJXu3UFydBan3NboZCPsrtHTfcwxcTGQbQonkwFNWcUct2OzLR2Ydq72pbNhn42/lw+o1CFUkBIv5qAMwdC0vl2A8+wy2Zc4Lw=
Received: from SJ0PR13CA0146.namprd13.prod.outlook.com (2603:10b6:a03:2c6::31)
 by CY8PR10MB6827.namprd10.prod.outlook.com (2603:10b6:930:9e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 20:02:34 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::3b) by SJ0PR13CA0146.outlook.office365.com
 (2603:10b6:a03:2c6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 20:02:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 20:02:34 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 14:02:33 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 14:02:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 14:02:33 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HK2XIn3410977;
	Tue, 17 Feb 2026 14:02:33 -0600
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv2] reproducible: fix git SOURCE_DATE_EPOCH randomness
Date: Tue, 17 Feb 2026 14:01:06 -0600
Message-ID: <20260217200105.2234389-2-rs@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|CY8PR10MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: d571ef57-8d89-4ae5-0e51-08de6e5f7dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kllPr0QUyBRyrK9l+6ahVzHIb+C/xsl9yMixy3BvNzCS0mZ/FmMQx3vwEDn1?=
 =?us-ascii?Q?ge59lIeVP3FEQGzahETbsC21p6l0LrIRbQXYfVHJtjhWn2X4lFHhJxQoEIEW?=
 =?us-ascii?Q?SlDMijKBdneqZX4ahtT+vQNXAPgHTue/WZsdUGzjbcceLHcINkzcpi4kbcqN?=
 =?us-ascii?Q?WZx30QJSPjyDur7IaiMPQQLIWcuqVRJiB9DO1VSsdewAXHZ6MI5/DBTjQnLm?=
 =?us-ascii?Q?Myxo7jATPV0UgZHW8UqUt0Y1eykn5gbFYOuXttSUAuvPIwiraqDUDI+OzZ7Z?=
 =?us-ascii?Q?eU1HBAguusdlUvesjfLddmXM2bd3dDxaLTrNQnGix3WO4cgSnyYqkPRzCIqX?=
 =?us-ascii?Q?rxqmTDqjC3mSkisn9iHnwHyb9LPMcMkb1th6aLnEGoyMeKLYBdC1XjPWeR8p?=
 =?us-ascii?Q?s2aT9uzac5mBZhQgWbMedS5l3ku7zbr97LAOsgMmgFWW2mb/SnSx/fmN9lpi?=
 =?us-ascii?Q?11t0XDmvkdHxMRpWJjOTHR4q+e4aY4S6weJODoKafIxQOXSNmrCo99lHQ6Mx?=
 =?us-ascii?Q?5j1uqvI7yRvPG9Bm0MMFIZKgXLiJ7Tj8nuPdkzgtmOCs1aDFIAStgF/uwArg?=
 =?us-ascii?Q?B/QMArKACDmbCtm1zCNnsqXcYBiZpXQPf4bogv/OKKBn0hqQWuwM7dQkHCHQ?=
 =?us-ascii?Q?LmwdDvMHBdmJA4JOzKitqZyd+aRNn4yfwTMZbFbXhVGSb1R5q8mixXzSDjXo?=
 =?us-ascii?Q?QoIIcFmM/X8kyheMmmshnk+CVAR55ped8fnOYgQTYC7KAwKPpj7XVIb5jYwZ?=
 =?us-ascii?Q?PQs3YevNbWxbvDhJ5hXJ2SF1CI6ybytOCtlfAWctBzuFxcw/CUrD5Yaitm3/?=
 =?us-ascii?Q?VRgzYmJ6XoMolzTjoNS0VaATVBybWruWZkFcaONQ4jxAzJZCHhSOE0ntuMNv?=
 =?us-ascii?Q?SsqGjFGKErgCTtxv4vEO303sdAvKwBusK4VCS0IgYnongzW8jxQA6ql8vUgD?=
 =?us-ascii?Q?J4PWe3mraM1q3LxXX3UtrzWy8Rgcrna4ePstEDf0WJuJrVJvv9x9xylswaB5?=
 =?us-ascii?Q?WeMeLAoaofbMoAGGW80ndlvbloMaCQXj8yjmjc8CiZgXxVoI+sUeMtPyWx3w?=
 =?us-ascii?Q?Sw+2dNDqGQuPPcUL3E+o+orUZiBp2E6gcbpza3PYHQW1au/SxYuBL5F9qAD7?=
 =?us-ascii?Q?nSjkBEVk/GRz8KBNyDc19Xuv2Gu3nUqJW8+0mBZ5lB8wLgjdM2EV7n19jlc0?=
 =?us-ascii?Q?vmkZ4NVSYSFNtPH5qyRisoH9dOnaYfsQO0ODqCsK8Z/s5/PWnFIhkSy2d47e?=
 =?us-ascii?Q?5p5UmSc6UZZJkQAd2I102STG1HRy7etf+V8lHIDin2lkmqBhOr3Q/mwHXLQp?=
 =?us-ascii?Q?7o1qzGSvaA/lCpGFGhwPA8yjvepnI7fGy+wPm23o4svUoV3ZGFHzGSULb6ot?=
 =?us-ascii?Q?f95m/n3RUvTbcMnkyzXf0jSPD25kmR/gv5G8lxrS8LG1RI1dVKAVaZ1Uq+DT?=
 =?us-ascii?Q?1sJdQiABqDhcFaH4x+nKGW0PbZcnyD7gQOuD/jDQvFlDNEAelrqtci1d5lKY?=
 =?us-ascii?Q?dkDQUEzP3C4zuOSexp7JLQDB4DZVxWS+baoi/M4W0ATs454qObvCNz8MQYJe?=
 =?us-ascii?Q?dRGOJVT65KtmdCPm05fInTFSLQh55HReS0DjZ6vNsymczPruCdGXv14q+Wvd?=
 =?us-ascii?Q?N6hYJxGINuz5SJ1I84LGO+33O0KzPtvAHbgNyW04fJ4Kdu/71QLQ2Pw9eGvN?=
 =?us-ascii?Q?emc8yg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9WVVg42cq7Fu5CFEZC8KT993jopt9UpFXuQ7x2KnGQBI8qVbsyLRlgtqEqnx05e5MjrcK4lmOSsBphnB2+VwsE4Vjk8ut8j9PYzLtHEvt1pTz4PzvYk8zbH+ktf7VYPmr44WLw1Zx4T8f41d0ulnzF9PZCFQtnp8geJHmT+WTskJpPx//j2pHHWW/BnkOkbgQa90ijfXJ18QKdwBI5E6aLT0O28hJQoV0kmGFyEMsnoKwk1XXh7+36WVIK4ofl1hcdRm/i8FJ44eo+7eCOZn07Xo/OtcaP+bXRqynzYARgNXdubtcjkIKK/vKiUC04gBuLPna33OsZ+yp/wpn4gFEj4FaLuakZdWI8CXEL77nTLvob/pOn83l2fcWKEAmxxMpfoJxMPU3BcyzChoiBh0nMKbGJyf0A0gBd3mr9PktkFtGUPSEHNc77qSfS22SdnB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 20:02:34.3391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d571ef57-8d89-4ae5-0e51-08de6e5f7dcd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 20:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231273

From: Randolph Sapp <rs@ti.com>

Anything that defines multiple git sources should have the largest value
taken when calculating the SOURCE_DATE_EPOCH for a package.

The previous iteration actually introduced some degree of randomness, as
it would stop on the first git repository reported by os.walk, which
does not assure any specific ordering by default.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2: Use os.walk method as opposed to glob to avoid infinite recursion when
navigating symbolic links

 meta/lib/oe/reproducible.py | 63 ++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 36 deletions(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 0270024a83..c58db48fb1 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -74,52 +74,43 @@ def get_source_date_epoch_from_known_files(d, sourcedir=
):
         bb.debug(1, "SOURCE_DATE_EPOCH taken from: %s" % newest_file)
     return source_date_epoch

-def find_git_folder(d, sourcedir):
-    # First guess: UNPACKDIR/BB_GIT_DEFAULT_DESTSUFFIX
-    # This is the default git fetcher unpack path
+def find_git_folders(d, sourcedir):
     unpackdir =3D d.getVar('UNPACKDIR')
-    default_destsuffix =3D d.getVar('BB_GIT_DEFAULT_DESTSUFFIX')
-    gitpath =3D os.path.join(unpackdir, default_destsuffix, ".git")
-    if os.path.isdir(gitpath):
-        return gitpath
-
-    # Second guess: ${S}
-    gitpath =3D os.path.join(sourcedir, ".git")
-    if os.path.isdir(gitpath):
-        return gitpath
-
-    # Perhaps there was a subpath or destsuffix specified.
-    # Go looking in the UNPACKDIR
-    for root, dirs, files in os.walk(unpackdir, topdown=3DTrue):
-        if '.git' in dirs:
-            return os.path.join(root, ".git")
+    git_folders =3D []

-    for root, dirs, files in os.walk(sourcedir, topdown=3DTrue):
-        if '.git' in dirs:
-            return os.path.join(root, ".git")
+    for mainpath in (sourcedir, unpackdir):
+        for root, dirs, _ in os.walk(mainpath, topdown=3DTrue):
+            if ".git" in dirs:
+                git_folders.append(os.path.join(root, ".git"))

-    bb.warn("Failed to find a git repository in UNPACKDIR: %s" % unpackdir=
)
-    return None
+    if not git_folders:
+        bb.warn("Failed to find any git repository in UNPACKDIR or S")
+
+    return git_folders

 def get_source_date_epoch_from_git(d, sourcedir):
     if not "git://" in d.getVar('SRC_URI') and not "gitsm://" in d.getVar(=
'SRC_URI'):
         return None

-    gitpath =3D find_git_folder(d, sourcedir)
-    if not gitpath:
-        return None
+    # Get an epoch from all valid git repositoies
+    sources_dates =3D []
+    for gitpath in find_git_folders(d, sourcedir):
+        # Check that the repository has a valid HEAD; it may not if subdir=
 is used
+        # in SRC_URI
+        p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', 'H=
EAD'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
+        if p.returncode !=3D 0:
+            bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.=
stdout.decode('utf-8')))
+            continue

-    # Check that the repository has a valid HEAD; it may not if subdir is =
used
-    # in SRC_URI
-    p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', 'HEAD'=
], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
-    if p.returncode !=3D 0:
-        bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.stdo=
ut.decode('utf-8')))
-        return None
+        bb.debug(1, "git repository: %s" % gitpath)
+        p =3D subprocess.run(['git', '-c', 'log.showSignature=3Dfalse', '-=
-git-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
+                           check=3DTrue, stdout=3Dsubprocess.PIPE)
+        sources_dates.append(int(p.stdout.decode('utf-8')))
+
+    if sources_dates:
+        return sorted(sources_dates, reverse=3DTrue)[0]

-    bb.debug(1, "git repository: %s" % gitpath)
-    p =3D subprocess.run(['git', '-c', 'log.showSignature=3Dfalse', '--git=
-dir', gitpath, 'log', '-1', '--pretty=3D%ct'],
-                       check=3DTrue, stdout=3Dsubprocess.PIPE)
-    return int(p.stdout.decode('utf-8'))
+    return None

 def get_source_date_epoch_from_youngest_file(d, sourcedir):
     if sourcedir =3D=3D d.getVar('UNPACKDIR'):
--
2.52.0


