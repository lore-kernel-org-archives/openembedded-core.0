Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8C0C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 08:18:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16362.1668845878901872675
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 00:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=832241a076=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AJ8HWUf021765
	for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 08:17:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj05mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 08:17:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bN8axkZj6U6IG4M2qYM5F7tljgD3aYhuiGpmsZyLr2FxsKyZKSrqozCgNV0OG51gXCbKKX+IjeM6m3t0JgDxEa1dNx6wYuIHGf/mW3hYptLDjJazd4DTvWudUcoUp+4QPUv3ScNv6thXR9v54wC4lZ8UY8yRHLEUZmoqZ2A0Dt284RX7LyjSx3QvKmcLwsrt9WPKUnhBoHcHzVfrrDV29zgcLf1w3P6AS5CnyRus4EgoTaYOOOS4BcdEzk/YuFVKJEqjLe29xl3bZFwmYQoRaRrTefXszndKp6RSIqf5+LByrbMk6Slv9E3cSo9ZuagmnQDT5cC2ujNnEmmERoxczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqXljBrrrmLffzUknnB/0x8JlOBzFzlDttyRB46NBfI=;
 b=hhIF4CDvGsafcViSJF9zp51SLwhlvTRYqCfxnVgjZRGzmipAJAUFe6UJAWQsNv5sUSHdi5DYYVE3lkUUcAO/6sveYhPJqeox5Vyq7SHOpcXJqivitAAXPjOkKD9dKNFsgu9Bfez3hSF/hF9D/zpTNjfm+Sops7zPOWvN33hFENT9UCmFPc/RGoAtWlOcZKP/xfNmOSkosUV6Mccbdb6b1aaJbYD4Ok5DcI8pRQ20Pc+y28EaOmfhjBCwduSFPLDKTcEwQVWG2S+1PnmDBgysR+4QAMs9mN/Y419LY6zdkPFq78K/QylXT2brTdVKpiXy2AYrCeoO1h7HIfjB5fx1Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Sat, 19 Nov
 2022 08:17:54 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 08:17:54 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][Kirkstone][PATCH] sysstat: fix CVE-2022-39377
Date: Sat, 19 Nov 2022 16:17:35 +0800
Message-Id: <20221119081735.92669-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9f4f3d-120b-4fd8-62c3-08daca068ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v6R9qa8v8So1/rjwhPA6ozhcIpFOb3Mcm4tWesPau4K+4Jt2fuFmOpFbqHVAhQBSJwvdWdbCx24cx1+pO64YvU+QxsmUVBPQxk5BThrz/ok4PEFadounfFvqDnrDXb8pZRZV6TmsLn1EVGfSmSqls7p4CfG694sbm1wct1Cj6K0+v8ZvCMiCx5sKTt3OQ0aobPLqZqISybxToVABdmahqZNaSK1R9PBjO12TPUbdNbz2vpUWfaS3dOqllnTBB/OLwVNlSktXkHSA4SbklAZyD+oBiDiu9EudHk8g2MEZK3Y51hRZsNhjZsMSHys0rDdWAPf+S9e7E3FBVoET+/C2FJ5g8fASYYtwY3mp1LNtmzqCN5P9V3v6fSIWtKVnspy95bE6mh1TCAgkZPaO58g+bJBv3xomzMkx4gLPqQdEZBI2R7Smbd0GaU17X0XIz+4urW4QmOPmw/rEEhDaTM0mxfc3FZEyRcWVIrHn+o5gDjfoiwk8E0DAX2IAV7FJkuGaVbbI7V/BMxhF8gBCLN2JOII0zhB6Erpmw6dhbZe88DgPzVQDFLX3rOd+0OYNjZRI4izLFD79dCQ+wem11EmymP+IubHgHdd9ZltvMwiSN3DYyKyVrhlpvx7NTPRQ1TS2rZVnzd0mzvnpRiGixFTm3otwS5XMlxT9NUIyWhonWZ/jWYc8lQFifCOvAj33trbSZPr6Hhi8oLgc/pu8rX5kfvWv1unl4g8xPuUYD/EeCUc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(451199015)(2906002)(38100700002)(38350700002)(6666004)(44832011)(83170400001)(6916009)(478600001)(6506007)(1076003)(41300700001)(186003)(316002)(66946007)(8676002)(8936002)(66476007)(66556008)(5660300002)(2616005)(6486002)(26005)(83380400001)(6512007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QPQkEqtWvVyuAc7PhkW0M9XmbnDM/toxUn2GKzBLRMEys4EsvzkSRYlGbklE?=
 =?us-ascii?Q?8HwO5Elm9vWM4QZAwPzD/tAMAFJMAJSuT8xyD/yJXHJWG8Nk1mW5C+sqUkj0?=
 =?us-ascii?Q?A8TCMzPVoXKVD2o7x0N1a5Atfd8e3UAAb58+leSwTnR2AbokRE5IKbwBZGIp?=
 =?us-ascii?Q?huaVdOaDb7fFUUJT+dKOcW0zUvp/sHmV/yIuShn8I/NAsqfo3YWIVCpZSRSg?=
 =?us-ascii?Q?i87UYkD51qLLzbYMIx9TTQNKMr79FbVSGmSUklMtmSVk57d3dkNEr3IX4E8p?=
 =?us-ascii?Q?gFe5R6lT1AORXsdqJ9i1oKySBn0XBxyeybZuyXS+nqdEIKTKtW875nMn5non?=
 =?us-ascii?Q?lpNyAKR6nGKrKtqwH6YcHVuGVfqU4qjG5cTkkM5cN+OsgkTtuS+FZVGVQRd7?=
 =?us-ascii?Q?G6mT05pciVg/LfAulZQhXlc03RXjrh+eFpMY4EWQuEwd7/tVPvUjJ2wfLBvh?=
 =?us-ascii?Q?v9miE+R+6yFAbwaAv1mwqfWVOyuJSxmskPpVtuOf2d0DDwyoAKq0JY8qMEB/?=
 =?us-ascii?Q?nTaXkGPqNLIqfQKQBdYFwzJZKWuqdGMKGUk/fpDkiRdvJ1BFtHR3+U9jaci6?=
 =?us-ascii?Q?6LYTILAtKvT4KByQBE3EnUusMNxl7JWsr+sQ9S/7qDsxXNvaEowJ/Zz75TTh?=
 =?us-ascii?Q?g9uNT8ZCjVtllbNkPxfhNRDiM+z3M8Rn9mL9fONOuzrZA3X6NBIiBWKvbD13?=
 =?us-ascii?Q?TBCmyR8HO+OFTFMsIl4xDHepl36un5gcwJeyPVV1OR9skgTZccBT1Tba0Pse?=
 =?us-ascii?Q?u/5ixNYwEl6wkeFt/Wek0rWGuWxO0G4wkdifEgRR7eSf88B8kZqPcSj6vF/2?=
 =?us-ascii?Q?b8QsQ/DO2WDF5DyLPK4Bswt5ohm9CVwpOWOwggUQdtqIhkLqGllHeHijBZ2n?=
 =?us-ascii?Q?u1vYp2HUBqbvwq0FJpS1CWqFeWAHFW55xFQ/K6h8LZX0Pgrh0vvz33HYFpsk?=
 =?us-ascii?Q?V6AmIm5k02r9tGTOJoJNOe67BaCD4Eru3R7wsxnVVsbGxXPpI3Mr44gAaiyc?=
 =?us-ascii?Q?XM5FosjU9v/kHH1GVqWIbwbX1nIE/On1vr9KauZFmSL7TOUGTta21vnNxoO4?=
 =?us-ascii?Q?JiMOvbR4i4oQEz7bqpCkw00dH/Osaq1/+FzEThbtP1fbgokYfC4tHJSIJ4Yw?=
 =?us-ascii?Q?EeGTTXOdEcSfNp9aC9CVcXAQMlt56bUjgq2p1teaj21PUjJ9Pz26pqRaA1w4?=
 =?us-ascii?Q?8o8huTbre7dRBdWzyt7v2bOtautNttppZPvELOWWA56PiaWIAHLxkluX9tsX?=
 =?us-ascii?Q?GCH6cZpNPnwPaXUyGPgAXOVhI8JJFt8ox0aFH9wl61/oeD3cxKhAAMkAs2Nd?=
 =?us-ascii?Q?stuxKQKXkGdM0rEC6hZzdoYA3xCyXYbxvsWp8yY6xNuwl609T34qHF8rtHpw?=
 =?us-ascii?Q?+cc/c8GVU9xJumJaCdWphu8qlDHyxmEiZfPs7ZhJfb/375N7QkJPRAj//Zzf?=
 =?us-ascii?Q?uRpcXS1rNmmx1asI0oeJtpeez/snyD34jFTlTI36MEcxiWertvY2f6MPSL/L?=
 =?us-ascii?Q?Yk9m3wlLJj0NFqX22I5AhjeqhS7Pf42oKo3MdA8p7JBoo4kRby0SoV6iovvy?=
 =?us-ascii?Q?3+TZyg329jLZkxq0vikaiqFqVK4vsF6mDSdmpHrCE8O2Jl7snnWJux+DYweS?=
 =?us-ascii?Q?nA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9f4f3d-120b-4fd8-62c3-08daca068ef0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 08:17:54.4485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEeKzoS61I51M4YNOK54r+6yMgREQxPExVfnUhT7TFaIbG1xFfHy3igoNFSLFv2EZgo6bX7m99qP161bf8SQ4xw50lcq/Kj2rEz2pLZWkTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
X-Proofpoint-GUID: Dd90y4sw5Fp7XiIVwYbqWI-Ly3cfc_Ty
X-Proofpoint-ORIG-GUID: Dd90y4sw5Fp7XiIVwYbqWI-Ly3cfc_Ty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_08,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=956
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211190057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 08:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173512

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../sysstat/sysstat/CVE-2022-39377.patch      | 93 +++++++++++++++++++
 .../sysstat/sysstat_12.4.5.bb                 |  3 +-
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
new file mode 100644
index 0000000000..dce7b0d61f
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
@@ -0,0 +1,93 @@
+From 9c4eaf150662ad40607923389d4519bc83b93540 Mon Sep 17 00:00:00 2001
+From: Sebastien <seb@fedora-2.home>
+Date: Sat, 15 Oct 2022 14:24:22 +0200
+Subject: [PATCH] Fix size_t overflow in sa_common.c (GHSL-2022-074)
+
+allocate_structures function located in sa_common.c insufficiently
+checks bounds before arithmetic multiplication allowing for an
+overflow in the size allocated for the buffer representing system
+activities.
+
+This patch checks that the post-multiplied value is not greater than
+UINT_MAX.
+
+Signed-off-by: Sebastien <seb@fedora-2.home>
+
+Upstream-Status: Backport from
+[https://github.com/sysstat/sysstat/commit/a953ee3307d51255cc96e1f211882e97f795eed9]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ common.c    | 25 +++++++++++++++++++++++++
+ common.h    |  2 ++
+ sa_common.c |  6 ++++++
+ 3 files changed, 33 insertions(+)
+
+diff --git a/common.c b/common.c
+index 81c7762..1a84b05 100644
+--- a/common.c
++++ b/common.c
+@@ -1655,4 +1655,29 @@ int parse_values(char *strargv, unsigned char bitmap[], int max_val, const char
+ 
+ 	return 0;
+ }
++
++/*
++ ***************************************************************************
++ * Check if the multiplication of the 3 values may be greater than UINT_MAX.
++ *
++ * IN:
++ * @val1	First value.
++ * @val2	Second value.
++ * @val3	Third value.
++ ***************************************************************************
++ */
++void check_overflow(size_t val1, size_t val2, size_t val3)
++{
++	if ((unsigned long long) val1 *
++	    (unsigned long long) val2 *
++	    (unsigned long long) val3 > UINT_MAX) {
++#ifdef DEBUG
++		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
++			__FUNCTION__,
++			(unsigned long long) val1 * (unsigned long long) val2 *	(unsigned long long) val3);
++#endif
++	exit(4);
++	}
++}
++
+ #endif /* SOURCE_SADC undefined */
+diff --git a/common.h b/common.h
+index 55b6657..e8ab98a 100644
+--- a/common.h
++++ b/common.h
+@@ -260,6 +260,8 @@ int check_dir
+ 	(char *);
+ 
+ #ifndef SOURCE_SADC
++void check_overflow
++	(size_t, size_t, size_t);
+ int count_bits
+ 	(void *, int);
+ int count_csvalues
+diff --git a/sa_common.c b/sa_common.c
+index 3699a84..b2cec4a 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -459,7 +459,13 @@ void allocate_structures(struct activity *act[])
+ 	int i, j;
+ 
+ 	for (i = 0; i < NR_ACT; i++) {
++
+ 		if (act[i]->nr_ini > 0) {
++
++			/* Look for a possible overflow */
++			check_overflow((size_t) act[i]->msize, (size_t) act[i]->nr_ini,
++				       (size_t) act[i]->nr2);
++
+ 			for (j = 0; j < 3; j++) {
+ 				SREALLOC(act[i]->buf[j], void,
+ 						(size_t) act[i]->msize * (size_t) act[i]->nr_ini * (size_t) act[i]->nr2);
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
index fe3db4d8a5..3a3d1fb6ba 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
@@ -2,6 +2,7 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
+SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
+           file://CVE-2022-39377.patch"
 
 SRC_URI[sha256sum] = "ef445acea301bbb996e410842f6290a8d049e884d4868cfef7e85dc04b7eee5b"
-- 
2.34.1


