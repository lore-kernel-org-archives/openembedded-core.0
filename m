Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B9CC83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 12:41:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.54])
 by mx.groups.io with SMTP id smtpd.web11.11675.1753360880821866632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 05:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZKNkyfVj;
 spf=pass (domain: est.tech, ip: 40.107.130.54, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTSZKCe16TebNqkmNwFQ+0Fy1f43yPPXiG0Ej/Y8QVSVrVv+HeM6s6rNtXnrYuSa1jBLHc0PN8g0k5LsYYtqwDcJgLD1KrmUPYA2DHCoB5RmR24+LaK4TTAzYK/S1XzyU57zlbxa9gxStXJ5zCzYK++EfLPQjF0qjPXX7sKS4hJBFzSHa2LB/yXHPhNmFL8OtSNkKDJf2vvWqaxrIu661LtFM8dqOEO3xdXp3YJM7f9dDCpi039FzFgaDsndq23AswxggRh53JTqfHVC6TMWh2WtWTd5Z3UwVtzxyqkFQ7gndxYE6SJq9M+9xuRInSvzcJZScnZgEdAdlrh/LZYVXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTqSpsb6xPE6+Z2wvyfnScIKAVe4OHnhjzqy+mKXb6Q=;
 b=f2quP9QODuMJ0BKkG/UWWP3uXKDrfc+FLR2GFjOXt9ccJJMd1j7OfK7gk1QyRCjsYDijzU3H1KBmsnnVQ+fdvr798KjcS8NjsB+hN5qAWvlb47ul1SJxHJF3cUdmvoIGH9r1JZFLGdU00qiOpkA4Qp6pueybXAtuEQt2ojqYv+urWgYsZ1+VKHQDOmjfzJdIoSAmgTAtRqWgD0Et+1bNZI4+FKMAlU2WEkAM7E+ep+wN2YsXhTC1IXbkY1MPTrzMiWxKZ7anpMaTAgKs5gSwxs+Nxs+Y77tiLKvukbOL/LUdxbH0zw4SgNqcOSRhpB2uDx3xPCyRMj5sC21CLFpFYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTqSpsb6xPE6+Z2wvyfnScIKAVe4OHnhjzqy+mKXb6Q=;
 b=ZKNkyfVjWfC9y8MqahVk1jz+8JeKvBwewOT79xmO/9SIdInfjAOHzZhuqF6RsLhLwtDr+Jlyalg07fxpq28Bk5v/eRdAsMbH2zM2qgCoqaCEWp2RuO4utWJQhfRuvGTjxmVze9NUkZp0BjVD9ObsJ3CDXcAbaJQnP2meAiJMxqpiFL/vHBtufFGeVfvnpr3AAOU2GqyWwk9Thuv4bPRCqsUhnV9YmThRXV2yyK4GRb67PY/7pY5TypGUIfrFjMBx24uLHH+8SMQqnFhffTKJAKTqxW1O+/5i886+c8Es2+CFD+o+eIjit0E7mpnHb2C6xMuCl4CWCFuicASNKRIhhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AM0P189MB0787.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 12:41:15 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::5f39:2db5:a647:ac07%3]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 12:41:14 +0000
From: roland.kovacs@est.tech
To: openembedded-core@lists.openembedded.org
CC: Roland Kovacs <roland.kovacs@est.tech>
Subject: [scarthgap][PATCH] sqlite3: fix CVE-2025-6965
Date: Thu, 24 Jul 2025 14:40:14 +0200
Message-ID: <20250724124013.240210-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::12) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|AM0P189MB0787:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2c72a1-9901-43f3-6859-08ddcaaf608f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YeE3Zw0EGa5t/aOpAUz0kJvbbN67PgT5N+grgLAkvHeE1+r4NIIbhjRuP3vk?=
 =?us-ascii?Q?cK7T6TrNn2bcl7WyskLJUa6/kXAh2ELTGRrmN+eJkAKMix2fo5zIy11h98Qj?=
 =?us-ascii?Q?EJW3V10guIN+5oq4bAgv3cw63aqUyo3cfcdjtoMLzJmEa1A85YhFXQawVyjS?=
 =?us-ascii?Q?7fdVWQEapOvZiiT9VVR7LGffGZj0xO5XayT5ivRtgwo5yUfpGBBgfPZR/52/?=
 =?us-ascii?Q?23r2VTlETwuuSQNvEg6g/zLbyKT98NhKj5syLwVON7ySjIxMA9g86NjbJtF0?=
 =?us-ascii?Q?adiNVV8to8BmcN2r33M6UtYs2a7r/865+JMvrEOU+J0tfloDELjya5JEVzLD?=
 =?us-ascii?Q?UXO1rkxSj65tM4enbMgSeDXsMFqIeEPMaFOKrjb0ngnVqKlpoX5sQbIcw7aN?=
 =?us-ascii?Q?QOPAOXbmctDe1V73rFK7223y/WXStjRjbTRQ544wQv5+0XBiMEA1bZ0kn7a1?=
 =?us-ascii?Q?/6YVCnszSQej8HTC/hm45uLIQCriGVTFyyFPZFNxZ0Qa6T5ixM/JwrRnQDea?=
 =?us-ascii?Q?CywTwzKCdYkd7CYZ0phmDWjLckYLzbKT+oDzfB7rI6bNNnamKPJOxRj1/ksV?=
 =?us-ascii?Q?GclFeYqbiVWqOJxIq7BQKpsEloCAcu6ew3bywsVA8sU8NEscxgYQwQ1+HgkG?=
 =?us-ascii?Q?6MQ9Tx2J6RKZ9JV0NgRXlSv291KXwJjStSoNWCad+jfE1wE29Y94ZT+/+Wrh?=
 =?us-ascii?Q?aywQo5y9iGnCVwB+68eH+TGSGQ+JZ1zx1z5PBtbmR8h5x6GMTvBMW7aBOodh?=
 =?us-ascii?Q?b+ck0E4egxbUmhlGi0es/9eZxcjNMd7JJ02rWLM3eu+pzcSXYEgxrdgFoQL1?=
 =?us-ascii?Q?l+0fDWemQMZQmnSN2sIDFVx0Lek1LZqmF93B/lyZuutTwnkcxbwbT/qPP5Xy?=
 =?us-ascii?Q?qVsNuO8Z5jZ35T6zWrQxIh82HYYc7+35SbdMrCpFJxJJhed1/+X7VDJ81siZ?=
 =?us-ascii?Q?N8iaeVcBwvzYDkgpSG2S4gWjGjkJSjDEpOMtHZmZ7vrX4Tiz+DfAwMiNNXc6?=
 =?us-ascii?Q?fh9dgI186Sfz7xfjf/Iz3qcXi/Flt/3boMsFpJVDmpCLEkrOY3wFqT1FvGsi?=
 =?us-ascii?Q?QunviYvVjSY+4m3q0kia2hcbPYcpRHm5WRz+MmRSiD9JvZjftTBCF45vo4n9?=
 =?us-ascii?Q?3YcsJshE2y1h4grooxog0rZJzis2Lzrhs/ScNuSwcgqYVKrbH/roB245EUf2?=
 =?us-ascii?Q?J4ZG/zUnim49Z5cqk09fBQu4EbkhEby9yJjnkESPi1WAHtuDd+FdpfhfmXXV?=
 =?us-ascii?Q?4l0jjYo6LkG7VVgzLIDJSrFUrodSJ0FMaGyxXTyV3H8q9FzAOM67MCNqavAu?=
 =?us-ascii?Q?6Y+GDwhEGhTObdQZHfF88e/bS1lWmDaNbOQuERm5r9uBqakx8+T4t17LfW0v?=
 =?us-ascii?Q?+T6jwbm15dhMj7JnRemcGfqFrvxbSVkok/lvdZGt2YFiwE49fzh3OFkYmC7u?=
 =?us-ascii?Q?rDruAsLrLpI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?etYMCsZPKxd4eP7k3eIGkCEtwjg1xTZs7L8ePgC5tvvdLRNw16+4DpEElscR?=
 =?us-ascii?Q?DOqonb7UIZKWBAo+4zpiiSCKArQAVFzrOqM7lHv4uqhRZcjddEV/xLsTgmSz?=
 =?us-ascii?Q?0JZPAfA3gg7UTSQ6EQzS8SRsUk8WY2g8McUSaTh3JW2O/EYeiP+f6KS2+bOD?=
 =?us-ascii?Q?hG7+rwIKMtPnojO1eoWxjZtUZdP+R7X0XgfFPBFjqIittlVYHj4ZJsvpfnuI?=
 =?us-ascii?Q?iBy/LYLJKboz15IlziZjwVOWIA/9sm9vujEV0LUfJT+Xi0iBv92rmn+1dWZT?=
 =?us-ascii?Q?HrBhp3v/TFrj3fKtKlinWcrSCZYP8xZJNwypsQK5Un+wm8XSYoZCPra+DfrI?=
 =?us-ascii?Q?CB9wyqsaurMjiP2DxBkPv6t+7b83sRHTElnN/8TSq6mNAWCUbJtiNKT8jTr6?=
 =?us-ascii?Q?KbgTgQ84mfabwzHPEnV1QuzKNOal3mKDKpHnBir7Bug/d27DKzGBwwyFqQrc?=
 =?us-ascii?Q?bvIPk3jIqMpp2+s8XCHqdssVq21mb1/f8zgXOYxfnb5c+s4tTpvoOGlIm7jA?=
 =?us-ascii?Q?oKv/9+PNTG+983EGUCPe2zy2VjAjcPxxFBDI9hW6fRln8tVVd7oo8gu/ULMF?=
 =?us-ascii?Q?xVgN25U2rBVFR7/7yewxMs9gozxJN7sy8v7oBfiP4ZcEN84lpyakVM+rz8lP?=
 =?us-ascii?Q?iLiVEBQAFi9pRZJ7YbQupLkWDGzV0eQ+CwNVcfGnPH9QKkanY12VsP4nvG0+?=
 =?us-ascii?Q?QxE9X9nBNoauMNti8CEvsaOpHvXWTsDR5DDcupQLinTWykhGZbw3K//1JtBM?=
 =?us-ascii?Q?JgImo+PrmCs4IfovQRMwbKponxRci1/uXAV7rCt3vMbE36iFVnJG1zB2FV+L?=
 =?us-ascii?Q?EXBUYk6eiuy5ATEYmpyeZP7HxUYhXs1SvBnFbrRjsn71PObWRA8ZwNlL6+hG?=
 =?us-ascii?Q?+wXKzMKvG+QvMuOQKmGMsFLMqSijLX6b9rc4rPdriKgsp15gP9aCgojeSILs?=
 =?us-ascii?Q?zImikV16Mdeo5GmL0Qdpi0i11k3/jVWc5+b9JpM7q2fmPa3o+Eo8j2SiBhFK?=
 =?us-ascii?Q?REYTcDNOCh4tGOZe+OZngw5PmD24BU+9r66e2bmJRFMtKcypt2o+0W7Gimj7?=
 =?us-ascii?Q?C7EHlL0FoflZXyJYsOBLWMRJC4DS6eIYME5opwjPVbkWJAR51XJnbzlvMUOV?=
 =?us-ascii?Q?1/ppcooRV9fRS2wnQgUoFSR1u4Bv9suKl7BluAEC5cyvo/0t6cuoSExQFDb6?=
 =?us-ascii?Q?RHyw9D137YoQwoong5mCshJY6ONFfO2gjDCa1IiYw0OoZuDk/pnzaHbjnkZI?=
 =?us-ascii?Q?yMvTZJ6qYMl38wFOClyla1OMwS0qHETTzkulfx+aVgt02cEpjaIotirZkclL?=
 =?us-ascii?Q?PewwckKn24Xu0tyGi+1Qf8PAee/CDk2Wjz8Ban7myC63kjdScRB1DQOWG00f?=
 =?us-ascii?Q?cgTlA6VcR9q6gp4vJYJHBUR+IriwlOM2gNv2IrkGjt/VfIleSt1xUVWPD4fq?=
 =?us-ascii?Q?YlYAiES6E6k3LVXCI2ZlMsBy3mzyzb3jxNmxlF+q2aWpXHoK/bWBFdLxKABv?=
 =?us-ascii?Q?wDHgrhqo4Gb43XLJQb9asEKf/HbTCFwdb9CsdugpThxEcuR8D0CRY2h0+Mmz?=
 =?us-ascii?Q?LUt7hxK2tbHq23UMfHaBhvOWfNjz4BC1bODK9c4d?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2c72a1-9901-43f3-6859-08ddcaaf608f
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 12:41:14.7081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RlJEps4IMYjHX2NUY2AhrGRko3AlLGa/VLy4g7peIxBXysOusUIu5qNiHZHozMQE6v9ImenF6wSP3TNcy01Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0787
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220836

From: Roland Kovacs <roland.kovacs@est.tech>

There exists a vulnerability in SQLite versions before 3.50.2 where the
number of aggregate terms could exceed the number of columns available.
This could lead to a memory corruption issue.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../sqlite/sqlite3/CVE-2025-6965.patch        | 112 ++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch b/meta=
/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
new file mode 100644
index 0000000000..233d8697ec
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2025-6965.patch
@@ -0,0 +1,112 @@
+From a91c0d55011d06858726d4783fd16ed8ec71e793 Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Fri, 27 Jun 2025 19:02:21 +0000
+Subject: [PATCH] Raise an error right away if the number of aggregate term=
s in
+ a query exceeds the maximum number of columns.
+
+FossilOrigin-Name: 5508b56fd24016c13981ec280ecdd833007c9d8dd595edb295b984c=
2b487b5c8
+
+CVE: CVE-2025-6965
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/c52e9d9=
7d485a3eb168e3f8f3674a7bc4b419703]
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ sqlite3.c | 30 ++++++++++++++++++++++++++----
+ 1 file changed, 26 insertions(+), 4 deletions(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1ee8de4a85..5c7c126076 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -15000,6 +15000,14 @@ typedef INT16_TYPE LogEst;
+ #define LARGEST_UINT64 (0xffffffff|(((u64)0xffffffff)<<32))
+ #define SMALLEST_INT64 (((i64)-1) - LARGEST_INT64)
+=20
++/*
++** Macro SMXV(n) return the maximum value that can be held in variable n,
++** assuming n is a signed integer type.  UMXV(n) is similar for unsigned
++** integer types.
++*/
++#define SMXV(n) ((((i64)1)<<(sizeof(n)*8-1))-1)
++#define UMXV(n) ((((i64)1)<<(sizeof(n)*8))-1)
++
+ /*
+ ** Round up a number to the next larger multiple of 8.  This is used
+ ** to force 8-byte alignment on 64-bit architectures.
+@@ -18785,7 +18793,7 @@ struct AggInfo {
+                           ** from source tables rather than from accumula=
tors */
+   u8 useSortingIdx;       /* In direct mode, reference the sorting index =
rather
+                           ** than the source table */
+-  u16 nSortingColumn;     /* Number of columns in the sorting index */
++  u32 nSortingColumn;     /* Number of columns in the sorting index */
+   int sortingIdx;         /* Cursor number of the sorting index */
+   int sortingIdxPTab;     /* Cursor number of pseudo-table */
+   int iFirstReg;          /* First register in range for aCol[] and aFunc=
[] */
+@@ -18794,8 +18802,8 @@ struct AggInfo {
+     Table *pTab;             /* Source table */
+     Expr *pCExpr;            /* The original expression */
+     int iTable;              /* Cursor number of the source table */
+-    i16 iColumn;             /* Column number within the source table */
+-    i16 iSorterColumn;       /* Column number in the sorting index */
++    int iColumn;             /* Column number within the source table */
++    int iSorterColumn;       /* Column number in the sorting index */
+   } *aCol;
+   int nColumn;            /* Number of used entries in aCol[] */
+   int nAccumulator;       /* Number of columns that show through to the o=
utput.
+@@ -115162,7 +115170,9 @@ static void findOrCreateAggInfoColumn(
+ ){
+   struct AggInfo_col *pCol;
+   int k;
++  int mxTerm =3D pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
+=20
++  assert( mxTerm <=3D SMXV(i16) );
+   assert( pAggInfo->iFirstReg=3D=3D0 );
+   pCol =3D pAggInfo->aCol;
+   for(k=3D0; k<pAggInfo->nColumn; k++, pCol++){
+@@ -115180,6 +115190,10 @@ static void findOrCreateAggInfoColumn(
+     assert( pParse->db->mallocFailed );
+     return;
+   }
++  if( k>mxTerm ){
++    sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm);
++    k =3D mxTerm;
++  }
+   pCol =3D &pAggInfo->aCol[k];
+   assert( ExprUseYTab(pExpr) );
+   pCol->pTab =3D pExpr->y.pTab;
+@@ -115213,6 +115227,7 @@ fix_up_expr:
+   if( pExpr->op=3D=3DTK_COLUMN ){
+     pExpr->op =3D TK_AGG_COLUMN;
+   }
++  assert( k <=3D SMXV(pExpr->iAgg) );
+   pExpr->iAgg =3D (i16)k;
+ }
+=20
+@@ -115297,13 +115312,19 @@ static int analyzeAggregate(Walker *pWalker, E=
xpr *pExpr){
+         ** function that is already in the pAggInfo structure
+         */
+         struct AggInfo_func *pItem =3D pAggInfo->aFunc;
++        int mxTerm =3D pParse->db->aLimit[SQLITE_LIMIT_COLUMN];
++        assert( mxTerm <=3D SMXV(i16) );
+         for(i=3D0; i<pAggInfo->nFunc; i++, pItem++){
+           if( NEVER(pItem->pFExpr=3D=3DpExpr) ) break;
+           if( sqlite3ExprCompare(0, pItem->pFExpr, pExpr, -1)=3D=3D0 ){
+             break;
+           }
+         }
+-        if( i>=3DpAggInfo->nFunc ){
++        if( i>mxTerm ){
++          sqlite3ErrorMsg(pParse, "more than %d aggregate terms", mxTerm)=
;
++          i =3D mxTerm;
++          assert( i<pAggInfo->nFunc );
++        }else if( i>=3DpAggInfo->nFunc ){
+           /* pExpr is original.  Make a new entry in pAggInfo->aFunc[]
+           */
+           u8 enc =3D ENC(pParse->db);
+@@ -115357,6 +115378,7 @@ static int analyzeAggregate(Walker *pWalker, Exp=
r *pExpr){
+         */
+         assert( !ExprHasProperty(pExpr, EP_TokenOnly|EP_Reduced) );
+         ExprSetVVAProperty(pExpr, EP_NoReduce);
++        assert( i <=3D SMXV(pExpr->iAgg) );
+         pExpr->iAgg =3D (i16)i;
+         pExpr->pAggInfo =3D pAggInfo;
+         return WRC_Prune;
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.45.3.bb
index d39cb3805b..60a8f1449b 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D7=
86d3dc581eff03f4fd9e4a77ed0
 SRC_URI =3D "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.g=
z \
            file://CVE-2025-3277.patch \
            file://CVE-2025-29088.patch \
+           file://CVE-2025-6965.patch \
           "
 SRC_URI[sha256sum] =3D "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270=
a5ee9a38191531"
=20

