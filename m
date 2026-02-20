Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800A3C531FB
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 01:54:38 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29710.1771552468154147879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 17:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fwWKsHV4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.25, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZrv1qDw+J7adHgGtA3O60aF2vvCVaLvfPigFjnbqFFovfX9TYGxl0YlquqDqO4zzp2jFtUKLOTMGP09DvkQimVaDUYDixLLlziSEUrIM+wN1M3oskI+BifTOzdjpidUUhIyn1AZuaV9RqldU5h+DxRjI1bdVAIaq8HwEcmgqxYeKst2mav49bTB3NATMi7LZApbOrwV6k5Eu/JZouxSQZr+Umf9o755CRJ2wLCnDn/ALlx73srjAY/WX9JA3TmS+aYf5FzHxNdb+uKcdf2bdmTdIn+prZL8WLxFRZoWxOlWSkRabXiLOWoK1PQ0ruTZjMH5LFUNqCzFiU0gQXDgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VY6yE9hRugd+hbUXX+aRVbV2/mmKKQgzaGhfPhU+jjQ=;
 b=cunAuab54R0MlG+PeDsDUeIP9Ttq/SCMSUb7swF6uW381cMTEHAWCShPfZl3ZkMo0J/0j31MZvYVYuHOMp5HDr2IqGT0XBgSCshYoSilQrJsjmSV1oocv4tFqMKgbCOAFKWxojRDl3UVFbSabxynvnuBEUgclWaqcw8QNNTVNTwyH2KtdxF+66w6Ew9hYzbPHMmFtLmUMPrSJT1+PcHbg+kXtIXPdoskQquXQotCBzwSBZxe/sFx3224ejItRex+WYSkibNDjY9WMr8D1TEQLzZUIFCvWBPAVVbtd37zIxusmnhhcd8hJAZfaaUNAZDIN01aY56OHxOddadVzGT0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VY6yE9hRugd+hbUXX+aRVbV2/mmKKQgzaGhfPhU+jjQ=;
 b=fwWKsHV4pFCoZHtfVyRyw3XLzykeECInKz8JD7MDIxYtYEy4nYjPYMQUz8P1KixVRhFBu1dnFQ2+/QOEsAiWzwexg3tIL9q2WjUwruljPSkXXEQRdV0R4Q9R5dKyCw8U+H0rY4BAv+PqS9SAf91dIjslAmJ7pkN7ZzYWnHcOWG8=
Received: from BLAPR03CA0065.namprd03.prod.outlook.com (2603:10b6:208:329::10)
 by LV3PR10MB8180.namprd10.prod.outlook.com (2603:10b6:408:286::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 01:54:25 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::5d) by BLAPR03CA0065.outlook.office365.com
 (2603:10b6:208:329::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 01:54:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 01:54:23 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 19:54:23 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 19:54:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 19:54:22 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K1sMsT3535737;
	Thu, 19 Feb 2026 19:54:22 -0600
From: <rs@ti.com>
To: <paul@pbarker.dev>, <raj.khem@gmail.com>,
	<richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
	<alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv3] reproducible: fix git SOURCE_DATE_EPOCH randomness
Date: Thu, 19 Feb 2026 19:54:16 -0600
Message-ID: <20260220015416.67093-1-rs@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|LV3PR10MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: ad43d10e-08cf-4970-fc4a-08de7022f8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u700Dajh+LGQ720rPLfWz0WF4ldRXLM42Q58S9Pmn7dEuBCPhLzpuITIHNTm?=
 =?us-ascii?Q?n2TaS59YvysF6CJ8rzkebV76vMtwnY39F79OWR6FjKKabHf2qF482kAxj04r?=
 =?us-ascii?Q?EC/5co7s5HsiuPN9n4VGaRoxUBXQoqIrnIdKmn7b2sw7dWM73Z/Gzy6vYtyf?=
 =?us-ascii?Q?EIlu3PAbXhbvCppRlsnVC9Z+7USqurPNWXvo6d8FtSZqlvjVro+ZmLX4a3Ep?=
 =?us-ascii?Q?Ai7JNVeZBH6IEBHjWF2uhhKOaP3zpc4s1I6jTLgGxW/UILuPsRLyxbO9ZwVw?=
 =?us-ascii?Q?/LpN/BP40cO5nRM7JWVcfG6A+PQKpFOOajgqG4gpqYPLjfanjLEWPPpFTXZc?=
 =?us-ascii?Q?x+0C7tYWiwEl68umpZdWRtdFRInkwT8oc0t4QnSmeKQmoKWRh2A8Dy5HSexr?=
 =?us-ascii?Q?LRLcYvt1Q1W+LRPFvFZwM0imQKBay5nxX2vz1iojQ44qHf/5CxJUDl01eD8b?=
 =?us-ascii?Q?OeGFjOC40uyAiIEikFIoVd2l0ud/Cpmk5Cxl0vZrnXxD/QYW31l8zyBnnCTa?=
 =?us-ascii?Q?b3TV4ZeDyCzpZUTt8TskoAjrDo75oXo6naL7eIDUA0d+ME4BrX9EZF6/664V?=
 =?us-ascii?Q?Nira/Fng9jkUbHHWKeHHbYsKKeQpSoSGcLmqz62j0jNq4kUUT96BxaOZF50D?=
 =?us-ascii?Q?PKBh9dpFtd8SyztvHZqoUXoZSSeImHcoGysXHzRuGSz36/HEadp8YbOHnaqG?=
 =?us-ascii?Q?rzrqUk4LLynr2xy17TPoiJpdIHJCm7K/8KUDC1Zx+19lVEQAtI7okYWq2V/Y?=
 =?us-ascii?Q?NLqWn3aQkRoKeCG4vtJWNv6a1bkVpwYF0BRx4/0Kqmw8SrOfzYmA1o7hZfIE?=
 =?us-ascii?Q?AeEhrXn9n8xLnGER4/08S6ocZ+BVrmBHY7PSDIMvXXQU6xfWPronsN2TG/2B?=
 =?us-ascii?Q?dHgP2YgH5Wa8C6HglE/Y2c4Qn5czbcZgQb1tNkq/G04eOAwyTIjZU6PjSoFq?=
 =?us-ascii?Q?2cFFjaV/7T4WNtvH3zbR0bS+IRDGJpSlsGoeSHhUPNa/kM231VkaS9IBRAvD?=
 =?us-ascii?Q?u2+QN2VySCeJYmY62W6fJwkRsIEuwEMTiHmLaVZ45hD4wEPXhjiQeeOsVy2C?=
 =?us-ascii?Q?IzAeObWfjNqdqDOShhJKakrhPWbU+uCegc6scg1F7qRVJel3uXzr7JLnhl1e?=
 =?us-ascii?Q?NeuLII+eRx7XciVzynoADRPdtXLc6T4Ijwf/MWQMGxfRrmzkgVDFpnnKoBzl?=
 =?us-ascii?Q?0Nshdts37hGUz0dKpu05xpkA7DdPiy9AibfGEAZFjup5FHuX9UhgjKTdYtZY?=
 =?us-ascii?Q?cA5Te0iEtBHa+11XyqbYkKdGeEtFmhyOuTVGSAa35lOGq7yupo5cvgh9GpeT?=
 =?us-ascii?Q?anAy6z5cO8OKG9UvrR7HlLRn+rh8bGh+lCkhdmc/PAUt4iOADs4lZTEMfG1j?=
 =?us-ascii?Q?afMl0KbS/LpmvQjCCc/JV4WakM72jLnBYoNDai7SWhwu0pwzaKBCBF5dUwOb?=
 =?us-ascii?Q?arQxYkfwhAyqi8dkIbrm2VqenScfDSGXoV7g2idZvz/8DcwGGHEkFxi/Cla+?=
 =?us-ascii?Q?BeIWzp9svW7kh0CKlmHkjETWdgD9gQSISLf70T7W0CJ+sot2YCjUOoZvschA?=
 =?us-ascii?Q?U6WPI0RTsv/K1JGP0Nmuy+Ksh36jGm2GHCNwUiNqsQpNE3V2wHT8rxd7nqpS?=
 =?us-ascii?Q?a71c6ITvis8fdevVs8VmHucWPKHlGUsAiLUcMQFWBp3TBGy9VZOLMLd4pKoj?=
 =?us-ascii?Q?cLHUzA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wCo2DSFWI4ULiWnUdnUXo53Ex0aqSntFae6ISIobxwcaW8RF9oq/7Da38hqapj9kprO2MycX1njTZNtIsxQhuRT28ckQkhsKsm3cMIVZJQLjpJ5FUqx6x8tMSKfQCgiHm1tHRtyenf9z9SKEZL/E4qf001HCG4JcKb/31Cm1tK9qk6ZKrFgjVycsSFjcSOO4xvIcRcTJJdGln2e1ARrR3sqhBjoeLcIwSqKY/VhAQCv7F3A19TRKXs88Gv6knlJqrCok4EtH6WbYDIdHvXfELvvBCagOYUNSaJZ2ASQDwl4jGo8cOXPVfTJDwAsaR4rtcg3ZLbY7z6sPTxUjnveqW9GsnB0BHiJxJJ28mWxpGLniN60yEfMQ31etY/zSoCnyz0HNh5RaLltJulG+xBPcsHUHdYxPa3ju+YM47rpNjJF3rohcyF47nA29DgZnZSxY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 01:54:23.6458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad43d10e-08cf-4970-fc4a-08de7022f8be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 01:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231447

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

v3: Cover submodule / worktree related cases by using -C and checking for .=
git
files.

 meta/lib/oe/reproducible.py | 66 ++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 37 deletions(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 0270024a83..a80376010a 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -74,52 +74,44 @@ def get_source_date_epoch_from_known_files(d, sourcedir=
):
         bb.debug(1, "SOURCE_DATE_EPOCH taken from: %s" % newest_file)
     return source_date_epoch

-def find_git_folder(d, sourcedir):
-    # First guess: UNPACKDIR/BB_GIT_DEFAULT_DESTSUFFIX
-    # This is the default git fetcher unpack path
+def find_git_repositories(d, sourcedir):
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
+    git_repositories =3D []

-    for root, dirs, files in os.walk(sourcedir, topdown=3DTrue):
-        if '.git' in dirs:
-            return os.path.join(root, ".git")
+    for mainpath in (sourcedir, unpackdir):
+        for root, dirs, files in os.walk(mainpath, topdown=3DTrue):
+            if '.git' in dirs or '.git' in files:
+                git_repositories.append(root)

-    bb.warn("Failed to find a git repository in UNPACKDIR: %s" % unpackdir=
)
-    return None
+    if not git_repositories:
+        bb.warn('Failed to find any git repositories in UNPACKDIR or S')
+
+    return git_repositories

 def get_source_date_epoch_from_git(d, sourcedir):
     if not "git://" in d.getVar('SRC_URI') and not "gitsm://" in d.getVar(=
'SRC_URI'):
         return None

-    gitpath =3D find_git_folder(d, sourcedir)
-    if not gitpath:
-        return None
+    # Get an epoch from all valid git repositories
+    source_dates =3D []
+    for repo_path in find_git_repositories(d, sourcedir):
+        # Check that the repository has a valid HEAD; it may not if subdir=
 is used
+        # in SRC_URI
+        p =3D subprocess.run(['git', '-C', repo_path, 'rev-parse', 'HEAD']=
,
+                           check=3DFalse, stdout=3Dsubprocess.PIPE, stderr=
=3Dsubprocess.STDOUT)
+        if p.returncode !=3D 0:
+            bb.debug(1, "%s does not have a valid HEAD: %s" % (repo_path, =
p.stdout.decode('utf-8')))
+            continue
+
+        bb.debug(1, "git repository: %s" % repo_path)
+        p =3D subprocess.run(['git', '-C', repo_path, 'log', '-1', '--pret=
ty=3D%ct'],
+                           check=3DTrue, stdout=3Dsubprocess.PIPE)
+        source_dates.append(int(p.stdout.decode('utf-8')))
+
+    if source_dates:
+        return max(source_dates)

-    # Check that the repository has a valid HEAD; it may not if subdir is =
used
-    # in SRC_URI
-    p =3D subprocess.run(['git', '--git-dir', gitpath, 'rev-parse', 'HEAD'=
], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)
-    if p.returncode !=3D 0:
-        bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.stdo=
ut.decode('utf-8')))
-        return None
-
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


