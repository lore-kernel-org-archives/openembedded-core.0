Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C05C77B61
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 05:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.72735.1682399133088278398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 22:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HePWAruB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=347924a3bb=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33P514Ni025054
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 05:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=zMOVAFTFvv4NZ62yOLDuAaCYLUPejAUxMnRNbc2ss7Q=;
 b=HePWAruBlIMb6BQ3VeXaMY5mXxZNWJorgeAXq9P0ncxu0qf48M7FRg9RQsTECDkeZ3AL
 66rKLnsuoAK/0PfsJ/XnoxbEA4o9baMHSm47dLZ+cCWBro1kMCOKwZ7WMuc6g3xZCM+x
 zfvoWd4UAkQJE9oDCndQEilCFt3AYzxB4MAMO2qNNJqMtLVLNl2QhBgASBhKl8XGehXx
 0HZrDsZD8LpSqUBQv3IJivSVL0a6VHR26C32vj4hPjUrD02mpMkveBxw35gyUBalPj4d
 kAtNYUKg2u1R83ElW8TYB4v0QIoaK8kbvzRwiy85rhYniXpKegLlXrHuCqsXv3lDZa/j WQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q44t3u3um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 05:05:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYeQDB0oI0c+Bh2jnYsOQ8ygfGhH3Fzu/Y5CA49bkrpp0a/ndUO/PF6xkFfs35XOa3w9WCx/H+kG1OLIy+P4Tfd2sHNLriWqtW/QtUH/Vbf7p+S6/1GCPIbFzxlGwjJaTOw16uMwTNYN1BinQMMopRaCbQz4MXJJES+KhakOqX6j/6wl/BsyAS6+Mob7SnBKFIkMWKFclgEtRtmzDYsJRJMqXyKMzXgxIIVPA9DE+8mGdi0/rKLIyrqGk80+ECTZFMq3OiEiFd+Kml5QsnZ8GqOOnj2GQFH8Rv/+ypHCzxkfW6JLfXsM2gMzq9+C09PFs61qWcROjBpkJpPqZos3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMOVAFTFvv4NZ62yOLDuAaCYLUPejAUxMnRNbc2ss7Q=;
 b=lALF9hYJPkFyEO11vZtdR4ORaknzCC3a34oInaL5RO/14qL9xAKpz9Wgyr2LeSXpeGSqy1AV9jP6U5kCY6pI5DOD6j7iFcBydDdHAq1Vb8Sno6sa6FcHTyXtBrnMWzMDUErza5VDz97gUncCnVtRH/rIljoKhh43SniCEGl50Ve7kxtAt9w9KlAeBVQzqfJ+fZ+AqvSJmLrD2JPK1/3nCcRzBOGK9tAI4RHYa9MKYe3Sk6bTfGxi+GjCh9qNPNWKD+4gurzMqmawFIg/LGjxKLkN59jTg46q1y87f7w71VOwDU29qLkIB5v7VfvMuCdrlRjhBurpPrNa4O1vYHIftA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 05:05:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 05:05:28 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] unfs3: fix symlink time setting issue
Date: Mon, 24 Apr 2023 22:05:17 -0700
Message-Id: <20230425050517.2562368-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:a03:255::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd6b165-2cfe-4baa-4281-08db454aafcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zcx/EBJ6260aad93QX+v6IQhU4qPrvlX/SAhFVLeH8WX4vgIzzXW6O6fAl3JIzLMGoeGNYqdkfhOx5oq5xju0+ebKApcvmZbzA0u7sYzUVIFvp17sQUpRJHn6ty9ugdPPb/H3bFUt3hOUBBQHsM2DPw2Zj8AiX35ia+r2e3Z9BA25yBMY2n72t2L5yO/GhrBCSiRZtM9DVDxiWrlPZZ87CEf2I94j4z/bKyrNAw4BU9+M5tHkaP7kpzUt5RgBNs0rxCnp5P+puGrsrsFYN+dnVsfOY2YEaMq27B2dAv2A2FZLvVl+nKq8ZpPw6AOLmmnD+pFhUNgtMt2WmC7UKk4xws2ieoznR/XyLxMk/rHfWsiHDCEm1VG6P/8193IuwKPFNTANPmz1IGBy5bhMttPwnywAei8JtHXij8zSqCcpl818cPLp1pC7X3Z8H7tUhO1GH7LQl7GqOc4/oJCdV1fHy44fzf+kk+Pen4PbeIFcR2nuB0W2OmetsL4CcSzDdnUBbdiuYbu6j8d9Ax2Ob2A25xzNaJqY67+XZYrTB3IRs4FRSO/5EVaQcozwCpqWBHjFFyQ+X/ZT5/hs88qfqg4EXFJCcN//8Fdo9kDD8kOS8g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39850400004)(366004)(396003)(451199021)(52116002)(6512007)(6506007)(41300700001)(186003)(5660300002)(1076003)(26005)(8676002)(8936002)(86362001)(6486002)(38350700002)(38100700002)(36756003)(316002)(6916009)(2616005)(66946007)(66556008)(66476007)(6666004)(83380400001)(2906002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ibkru7tf71tzGhiNQRjbrL8SP2ElzQfiNJrBoOUSVc+9XvxiDpQr2LUZ5bmY?=
 =?us-ascii?Q?b3hsylRklFF6BP6pM9wuf0vt1dLAjwlaVr5TPhazM7f0xF60+fl7wNnKGCVn?=
 =?us-ascii?Q?2yXH9rhiTz+MesAAQFYBMpFy4rfzPJ9nyHiMtiA1Aq8DNfj3Lbp4FWDUmgxq?=
 =?us-ascii?Q?12yDDyNkGwFCfMHQ6MTdODib6FEwdrdGnOaaWMYRcT3cDOX3U012xjkZZiqK?=
 =?us-ascii?Q?GuB1hyP6dKgmprScx4ZV0X2wYt7zW0KChY7NwepPMuqvOKtnYKmhkN9YFLJ7?=
 =?us-ascii?Q?AfcCiPHhyFT5t4eGyACWD4f13YMNLjNMauINrSuHSDMKTTaSuajQ11i84oKY?=
 =?us-ascii?Q?8CAHn6/8h3O/M8RcIeBp31+/MIHJsD85kjImo+FjuBTt5i+xrbE8dxSjtZAA?=
 =?us-ascii?Q?JAS5zVETpwGirqDF1MC7JdRrSlIoYxINdmX+x5w9v5P9HdWsGRp5quHuX/Lp?=
 =?us-ascii?Q?RILhI+9y+UNc5Iv+PntM+nM7KnmWrWBXbFQlDVrOAqbAjiEQdFfMoNBO7f1k?=
 =?us-ascii?Q?c4mCW23+a7KHKp437CYxk/uLUSlLyTNheM8GVgpG2H46gOuh0ZY1M6NBDnI/?=
 =?us-ascii?Q?14A34OR2W9nxmImpZ4yPmnEEIK8LVTKXxvrMOKBIqPgSgDXwCvoYLTzLeAJQ?=
 =?us-ascii?Q?2IgmCgaRJ4XxcpsURyGAuC/Xi3y55T37/+SokkTwlDSM3sFBaVvXnK3bvr0r?=
 =?us-ascii?Q?eLnyEOkkeQBhG0PcbKoo4Eewsy8eeI3umLMxgL4BdjyI32wYnMF7IgI+RG3F?=
 =?us-ascii?Q?4waih9+XDtKTXl+AdfTiSESudxIA+I7EqEkLUz1uWTKfmZRMgxbcFBWMiHGZ?=
 =?us-ascii?Q?eIap7uPCtEyzNEFnGifatd6RjTSPS0+KhX4d+7pRPL2lvJYMZYRw+Toe0OZ3?=
 =?us-ascii?Q?0qZSN/zLvX2klzXjJoOk0uZb6WXKq49vMIbpDDSTB6pMGhx0liBlV4CLP0oc?=
 =?us-ascii?Q?HAXozcT5HnhP6iMvA8BoQuQOEEspxCvOOENg/mUm6VBX0Mj2Jsh8md3yn3b0?=
 =?us-ascii?Q?KikfoFYXetmhAfPBtUkq1ez7QC4uKTirq1u8zZxXecrpcoLzjF5nwWIIHYrP?=
 =?us-ascii?Q?Oi1YQNwkkWg/SW1dM3+UBTr4YT3gwD8KiRE9166aWqXimwvw4Wb9/GFiWFUf?=
 =?us-ascii?Q?ywnCvp9y0CSUgGzazXF4At4QkQFjySraGYdiEyKPv4ZDIJ+f0kC+syTY9076?=
 =?us-ascii?Q?kQ57wnwiGoIqiSoQU+eMdTJGOL0gwW4N0vTiMB9EBEu+81I4s1L1CmgVHhzr?=
 =?us-ascii?Q?741ZZLk6F5YHzdjkdsQblkt/n1BnJEW6s9jw687phIHJkJ8OXhrhkjMu489F?=
 =?us-ascii?Q?B8SkEMzVbuW0IqBXlJirMWyJwMfCS0rLTNstxeg5LIp7WNg+1iEM0gPxT3Jw?=
 =?us-ascii?Q?hNdaydgDaTOwYvYK72DgH9hATaejOocNJLibEGwGq3873W8U0zVF19j/fv20?=
 =?us-ascii?Q?2HpOEqJhk9GDUcbrtLKG0JoDJbi52KZgY8hgveqTHwccI1KzkqLe8GbFHe76?=
 =?us-ascii?Q?CunfHl0ZnqSAx76DvU+GuDUBFIobk0XFfHZOeJhUXd2X5+z2LCCqbosoztwX?=
 =?us-ascii?Q?FHym7jaSS0FrjfQokmebmK29omgpx/pwyqEXZbkNUBs1DN0mrmhWAy0F6qAa?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd6b165-2cfe-4baa-4281-08db454aafcc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 05:05:28.3787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5iJeyiv2uGbOCWdu5HZ+2ByVmZJyZZ0zPjlAkZu4KEch0BRk8FuM4L/KlHtHhK1K7QYxGM17Z8r9VMM5hvVVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
X-Proofpoint-GUID: l1nr19ybh89HG9nItohqHG2xD5fbfJq3
X-Proofpoint-ORIG-GUID: l1nr19ybh89HG9nItohqHG2xD5fbfJq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_03,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 05:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180370

Add back the dropped 0001-attr-fix-utime-for-symlink.patch
to fix symlink time setting issue on NFS.

The problem could be reproduced by runing the following command
on nfs booted qemu:

  ln -s dest src && touch -h src

Apart from the rpm operations mentioned in the original patch,
'docker pull' also fails with a 'stale file' error. The common
pattern here is extracting files from a bundle and setting times
for them.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-attr-fix-utime-for-symlink.patch     | 88 +++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch b/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
new file mode 100644
index 0000000000..a0f3740d6a
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
@@ -0,0 +1,88 @@
+From 7e789895919d57d573ebb8faa147d1286104cd01 Mon Sep 17 00:00:00 2001
+From: Rui Wang <rui.wang@windriver.com>
+Date: Mon, 24 Apr 2023 02:57:57 -0700
+Subject: [PATCH] attr: fix utime for symlink
+
+unfs3 has an old defect that it can not change the timestamps of a
+symlink file because it only uses utime(), which will follow the
+symlink. This will not cause an error if the symlink points to an
+existent file. But under some special situation, such as installing
+a rpm package, rpm tool will create the symlink first and try to
+modify the timestamps of it, when the target file is non-existent.
+This will cause an ESTALE error. Making rpm tool ignore this error
+is a solution, but not the best one. An acceptable approach is
+Making unfs3 support lutimes(), which can modify the symlink file
+itself. Considering not every system support this function, so a
+function checking is necessary.
+
+Upstream-Status: Submitted [https://github.com/unfs3/unfs3/pull/35]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ attr.c         | 15 +++++++++++----
+ backend_unix.h |  2 ++
+ configure.ac   |  1 +
+ 3 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/attr.c b/attr.c
+index 0ce9375..930ce6e 100644
+--- a/attr.c
++++ b/attr.c
+@@ -285,7 +285,7 @@ post_op_attr get_post_cached(struct svc_req * req)
+ static nfsstat3 set_time(const char *path, backend_statstruct buf, sattr3 new)
+ {
+     time_t new_atime, new_mtime;
+-    struct utimbuf utim;
++    struct timeval stamps[2];
+     int res;
+ 
+     /* set atime and mtime */
+@@ -307,10 +307,17 @@ static nfsstat3 set_time(const char *path, backend_statstruct buf, sattr3 new)
+ 	else			       /* DONT_CHANGE */
+ 	    new_mtime = buf.st_mtime;
+ 
+-	utim.actime = new_atime;
+-	utim.modtime = new_mtime;
++	stamps[0].tv_sec = new_atime;
++	stamps[0].tv_usec = 0;
++	stamps[1].tv_sec = new_mtime;
++	stamps[1].tv_usec = 0;
++
++#if HAVE_LUTIMES
++	res = backend_lutimes(path, stamps);
++#else
++	res = backend_utimes(path, stamps);
++#endif
+ 
+-	res = backend_utime(path, &utim);
+ 	if (res == -1)
+ 	    return setattr_err();
+     }
+diff --git a/backend_unix.h b/backend_unix.h
+index 4db72ae..9cce9ab 100644
+--- a/backend_unix.h
++++ b/backend_unix.h
+@@ -61,6 +61,8 @@
+ #define backend_symlink symlink
+ #define backend_truncate truncate
+ #define backend_utime utime
++#define backend_utimes utimes
++#define backend_lutimes lutimes
+ #define backend_statstruct struct stat
+ #define backend_dirstream DIR
+ #define backend_statvfsstruct struct statvfs
+diff --git a/configure.ac b/configure.ac
+index d46c905..c21afe3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -32,6 +32,7 @@ AC_CHECK_FUNCS(setresuid setresgid)
+ AC_CHECK_FUNCS(vsyslog)
+ AC_CHECK_FUNCS(lchown)
+ AC_CHECK_FUNCS(setgroups)
++AC_CHECK_FUNCS(lutimes)
+ UNFS3_COMPILE_WARNINGS
+ 
+ PKG_CHECK_MODULES([TIRPC], [libtirpc])
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index 9913a503e8..c5b7898b3c 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://0001-Alias-off64_t-to-off_t-on-linux-if-not-defined.patch \
            file://0001-locate.c-Include-attr.h.patch \
            file://0001-fix-building-on-macOS.patch \
+           file://0001-attr-fix-utime-for-symlink.patch \
            "
 SRCREV = "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.0


