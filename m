Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B0DC624CF
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 06:21:44 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1704.1788243697599189245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 23:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BPQzDEW9;
 spf=pass (domain: est.tech, ip: 40.107.130.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WE510UeVkvuV4C/Tl1L4kB71X/WY9PChB2zo4QUAKYpZ3qAjLEZqI1vG9QgP19fROIXyALVd5Ol0Zp0YYyxDuAr/Kew5mXX1RqVxsliwQLHKEpnGGeYjNrp5DeEW8naXFPmUP1oE3rljpL05xKAo/KzlIBpy/mD/8iAyuBYf9T7A75WiRu1OMNOL89fsXv35eMfL6Gpcl6YU4iDOU8K1s2C6seH0B/QOUua9qoVhICfAZqij6nYka8wURkfuXzfe9EHTHI4CVxMOSAtwJyLDdOdc8U4hleYNoHl+do2jr+5bFfL1YczzdbHnQ3i9fmf5vr/XX90FmSLudXGSsn1oEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9weWZlQhz4+2HzN70MeC/Lq83eEwitFtf/h9FPI9h4=;
 b=cSXsTHEUMgJKDwcYaSfSDzXyHQPezFxszBjSphciJOmENMdv15GgE6CEWgcqlWUzhPgIRv1J8wQ/dbBD4h7OikwDxoY2yRPGcyNmvdAsQFkp8pCewrgn9KYcYI76EXhfwk8nxcnJAM9rB3TxsPVb8bKqfu1WdZ9dr0Gb8byvpBGFc5JBZDm7fW2ogqTo6NtXW7B7kXCzArw4CYoSlCduNSI8RWwKZrepbb7/BAu43LzJ96GxyfF5Mj4mRL9R7Vu7mP5ns98SJNMIZNAp+OjimCkCmcErk6FvEUVs2K4QFBYpnFIgjqSxmYhIioFjF1lR9FqAggzu5NjNEAuej8VR5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9weWZlQhz4+2HzN70MeC/Lq83eEwitFtf/h9FPI9h4=;
 b=BPQzDEW9g9VTIeIVI5fNT8ap7kkSLNY75D1oMpxCObpEsjvMMdiaJ64BHj+0aPaSq6tSHPnsnDCVs0i4mxabp2cKEKxeEjY8RrWLAYu4Fy2BWD2QvZJLDoxQppOdyDaVMjS3msTQfBJmSzH4t8eUBaGoULQZuwUG07flc7k2sRhhsVDt6q5B3cQhu1lX6v1nIWq8loJnA3dr2ociaAy3fxxMXu7CYuyl8FFec4qHzPVAHIv/MHMUDn613xnXhmSDzHWLQzed78GKyTwFTKFVQGt9xd0/mQnU+aVMg8OikVW9wyVVLGLhMhxUwvO9faEz4F4CJixOopJlj2AgwJdNOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3535.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 06:21:31 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 06:21:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] librepo: upgrade 1.20.0 -> 1.21.0
Date: Tue,  1 Sep 2026 08:21:25 +0200
Message-ID: <20260901062125.37994-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901062125.37994-1-jaipaul.cheernam@est.tech>
References: <20260901062125.37994-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P250CA0028.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::33) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3535:EE_
X-MS-Office365-Filtering-Correlation-Id: ff62b45a-0698-4f98-c4cf-08df07f14366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|23010399003|18002099003|22082099003|3023799007|11063799006|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	7yn7kScnqZ080H/9i0W0Fwo1wyC2sh/CltxhiGPzZldyoTGc4Qfa92y7SFxwAUuzC6v78PoUCiuqLmghV89w0B115nQSw0WDwePLpqf/it9ahatvqFmnZhJmLx/zfBWqKFHC7WPKwBwrALhvDn5euKle5QpEZ+Dzq6hnm7JBO9ESWe+0U0+2KSLpvSky9UhlspF9P42gNvfopNrPHSh72AgG2CvGluEC3Wby0zQRNxXxMRLsQQZsuiT3ZI6shfuSHa3Ohss9ExR5Rt0inmp+6JeujlH2mLKA8/i1gfVWiLPoqbbaJVaP3AIhTWlqRERtWs41HKYfjP3vWV6/EVh7uyAgBDuQ7bZAKdV5C5NOBtamR7vtH4LO9TtmS7EMDrWZDv7kPLt/AcqtWbz7u0vrwJ9DF3Gb4c1/xboxImqIEjbLv/P20H8vPocoemVJAnoES+43mvEtYJwZgS4i9ReWN+6TrKuNGoOSGK7O2zCHSVSW/x6BNkI5aC/a77pjEp+tpDE/kETR03N6bABgb3o7O0DTjwbpkgOUzRykzmgCL55FqHTKd/bJagp3hOg3vGXygnUqjhPM2gCA8vLZww8pHJzh5uw57PHG9kQXU1rY1/zW00IO63JOPkXjqdHO0ap3or8mWeGNIYTQ8Cba133qPBfrAxclVezV7dKkG7FayF4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C/FalGaoVzgxROZUpe8QBF1GmwsMr3Ga7JWwG5nxWCfK5Xc0U2Obq1jspWFy?=
 =?us-ascii?Q?EKrNXzhNFSLofOysSiaVCkjVE1u/f0RT53Lb0NX4DdDOJfW49kGcvQZ4LI/0?=
 =?us-ascii?Q?S2eodxNNMh/7ektER5jhCAuH08kNN+5OZcKlI8dnB93uIYROnMQ6qGUypEfx?=
 =?us-ascii?Q?8eXI4452bdigYmC4suhDfzng7Jml0c+zJRy8zbyfaV+N02ZiGaGNxPSTeU9j?=
 =?us-ascii?Q?Z3U2BzqcM9n4xMWe1H+6SA4C2qX5YSkqHVrUG9uELUgHcbSUYJbY83qAX9Sg?=
 =?us-ascii?Q?Q97gVoh/i8BaGN12mf6oeS0e2sgoFz4YQUgCVbl+yzB3hGyBinNEWkNGGgyH?=
 =?us-ascii?Q?46QyT5DTeUNQ+ZCMo59aIMQLPngMDAuDUNtswYUoEHJMfamqlWtajejpek+J?=
 =?us-ascii?Q?m8iYn2K8u/M4iGJhI5MhTdo0Gbor39T93LYBFAYD5odvyV/+UGHjzwMFuV/s?=
 =?us-ascii?Q?561Uk/kwVnwEVfa1XRy6bDhHb1/5v3OT+23XAT+F6vIt53sOp6tPdFsXRrlL?=
 =?us-ascii?Q?cJNaq4D3ozFa9h8maCHMyej6bw45jCus+1P7eA7JGYkHXMFwwb32n3miKLB4?=
 =?us-ascii?Q?3WmCqj8SothzEP8p+lAXhCBCDh0ci2C5KA8yS25py6TPlFtlW1QEgGrHfuOv?=
 =?us-ascii?Q?ZP7LyeQpIHhGEfLi3UDK7iWy52bH9cie2DKPRVOOY8WBcCmpHP35kzepZYP3?=
 =?us-ascii?Q?XTV1SHNbP04q8eg0TEf2ehu96eUwN6UInua0LcDlUNyINUq2+JJTbU3x0VSa?=
 =?us-ascii?Q?g30I8Mds8cuA+Ai1X7LwlWbD25DfVuxlyiLIKAORj53u/I0fCV/vN1h6qqKE?=
 =?us-ascii?Q?A9C4rg8vKZzTNivI0+SDE7tFJQJoZT8Yn+kbOa/ojWBn/AwLGj1OPo2883Cg?=
 =?us-ascii?Q?Bdfcoh3n+pEHKpuiQDR30LyDwykV2aPeHc1bPZIvMFhB4cynj3NJXKV98G+r?=
 =?us-ascii?Q?4ppzzcZQFYWa1ibyFjX1a4Kpbz2hPdAuK2Nb8ecbQEs0ksOZhJdArWlDEesH?=
 =?us-ascii?Q?oS7eo+XQ9AGjWdfO02ICtUA367zpvBKNgRhy1x3Azd+vGixQcoHLqgYwMUH7?=
 =?us-ascii?Q?4MT4gin0YuUx3Z7fyLi+WGxXw2ozLXvsqFQ74z29L8Py+Hdb1+xQoaIpx7Kr?=
 =?us-ascii?Q?7SxHABEpqA/GcqNtytTh7et6xciiYlZUmWvATKIZnougiI+mh+nsv4XfRF5g?=
 =?us-ascii?Q?X7eGbu/H/LaZvPIhaXX+hcghKQ15G1KNcOAVF0UPHZFV15//Z8fL7Prr1eJx?=
 =?us-ascii?Q?g7AQy3zr0hXBypXs12OaUZuLLmkQhgkk0cZl7S7Z1hkI+oQYoST373uSO49S?=
 =?us-ascii?Q?jfD1QydUYvP9Yr0o4NBbO3/HP+gog59boebQaY2yHNve1wj7znZMmF6Iv9/h?=
 =?us-ascii?Q?VDMYV7DuKcVjmw63wXXTfOYRoSjoWeRw/VPc5KpaxgUtuQynHlJ5r2I9G510?=
 =?us-ascii?Q?bbT/+sGCg8uECcYZksfL7Z+o6H0StLF3c/wxq4lXp25pmwxJ3JXmiBlXZ5gp?=
 =?us-ascii?Q?mM8HU68vFWpZskBdNb9SRdSajmDEPaVdc5u4rp1IRXjEI/lr8My8vrChc1l/?=
 =?us-ascii?Q?64vzaDAuJoEj0DbdUFCp5rPKKB1orKiGSOjGWYUSmHyh5CKMxAbPbRYyG6OO?=
 =?us-ascii?Q?oijRSAQBLVGM7uwW5hG9kGwTHuExCQMzumWtPC5VP1Fi6cqJ9GJ1TaZdQiRM?=
 =?us-ascii?Q?OCwMD/RP/fqpc3E2NaN7G56uRtSeYCJHTF8SqPsPiEAkK01uQxhcRx5izWnV?=
 =?us-ascii?Q?mDHYtYX/3oizIRdLf0J3aRBF4NPuYfzeKAWMdCJQXNvmIllldOP0EAgwErvK?=
X-MS-Exchange-AntiSpam-MessageData-1: i+07iHjc52TLpp9MPjRmeQhJhMqekbUE1s4=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ff62b45a-0698-4f98-c4cf-08df07f14366
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 06:21:31.0346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRyilXo7rVo6E9gNOlR9z1DIJT0dAwNeA5PW67y/TvuVZcqQml+1xavtyR1YxjCt2IWsHm7j39AlIBmTqpFIOIMUPSlN40Q4hJm+uU0Mzts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 06:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244797

5e5bdda use PROV for pkcs11 URIs with OpenSSL 4.x
54e8496 test: verify missing key error message consistency across backends
ea33d57 gpgme: report "Signing key not found" when signing key is missing
13e2a9b PGP: define shared error message constants for both backends
f756add Optionally build librepo as a static library as well
adf4afa test: don't expect empty file when downloading fails
84ce760 Fix metadata file descriptor leaks
ec49f22 Close zchunk seed fd in find_local_zck_header
a42277a Do not fail in lr_prepare_repodata_dir() if repodata/ dir exists
84206b2 Fix download resume within a single session
23a958f Configure packit to use caret notation for postrelease snapshots
9e5b003 Set CMAKE_SKIP_RPATH to TRUE
5d8b0ea Fix memory leaks in `lr_yum_download_repos`
e39ef74 Fix: actually store metalink and mirrorlist download targets
9eff2fc PGP: Fix creating /run/gnupg/user
731b5f9 Replace deprecated CURLOPT_PROGRESSFUNCTION
be788e8 spec: Postrelease version bump
5d52606 gpgme: Improve handling of expired GPG signatures with key rotation=
 support
067e0ea Merge packit copr_build jobs into one
310d247 CI: Correct a link to packit documentation
03a20b2 Add build requirements installation instructions
0fc4b98 Test importing keys with prefix and suffix
a260f21 We cannot build for epel-8 due to glib2 =E2=89=A5 2.66 requirement
f22fc30 Add packit copr-builds and tests

- Refresh patches context

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 4 ++--
 .../librepo/{librepo_1.20.0.bb =3D> librepo_1.21.0.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.20.0.bb =3D> librepo_1.21.=
0.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtai=
n-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/lib=
repo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index ac5373f2e7..6cfe970c2f 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHO=
N_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From 0062f49b62ce014dc81485c6ae101d49399d22cf Mon Sep 17 00:00:00 2001
+From ba81dfc3aaeadad0e22272136740864bc95d4f6b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python=
.
@@ -11,7 +11,7 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 6 insertions(+), 6 deletions(-)
=20
 diff --git a/librepo/python/CMakeLists.txt b/librepo/python/CMakeLists.txt
-index 8523ca7..06e5f7b 100644
+index 91b7385..b08358b 100644
 --- a/librepo/python/CMakeLists.txt
 +++ b/librepo/python/CMakeLists.txt
 @@ -16,12 +16,12 @@ SET (librepomodule_SRCS
diff --git a/meta/recipes-devtools/librepo/librepo_1.20.0.bb b/meta/recipes=
-devtools/librepo/librepo_1.21.0.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.20.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.21.0.bb
index 7a2e9e6b9b..72ee9a627c 100644
--- a/meta/recipes-devtools/librepo/librepo_1.20.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.0.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/libre=
po.git;branch=3Dmaster;pr
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-=
p.patch \
            "
=20
-SRCREV =3D "363cb70c6548be900832bc9b18ced3e7569da15a"
+SRCREV =3D "5e5bddacad52121f970c499e13a98d936dcdc7b6"
=20
 DEPENDS =3D "curl glib-2.0 openssl attr gpgme libxml2"
=20

