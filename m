Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.43])
 by mx.groups.io with SMTP id smtpd.web10.12623.1604059018869549317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 04:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Hs/+hHSA;
 spf=pass (domain: kpit.com, ip: 40.107.138.43, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mROJIrB965rgW7zSo0LVKLBQ1psDJLpo2Q6rP5EKFWb34qPN83UMFiMOEv/UpupehEhIfUovaKV4Pa6nQcxna4oa+nKWYZvWG6jo82E8F8jCDFZ99OmNu5PSyRJ0pHimkAZ0E8Lfc7vxrfC4jMTx/LXS5vubNsjwyJja3mGHwHdqnkaF8PXygpgR0GtsNT92NTEq4EfVsV5seUY9A/Z3Yw37pvinLGmjEu0iF/fIitiJWSOIzCPumPWKAkUdHoOYWiRNuB1OLpjt2I3nP2FpDLgEKuS46sernZF6Y2fhI8SvzpUw1eAukz8IGs1nMgAcwFixXmw203JHyQhPMdItMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uC2cRn2MaejLRwnKW3Qqz02SvnmGrHvRiLGXMZMvfx0=;
 b=mVm+DJT4z4LMdGR8ieoCaMgtpRDiZhBzlkLEiML00k5UPmYPeRD9c7p2lRqlQM7XVMzi4cI2yc7MDvwWxQxPQHNxDIrdqV8ZaDghEfy0vdIxJ/QEScSprolW36nwonG7I0ilZw5ituztDprwtguoE3WdH+BFJDqfrDI5LzwNV4dWWqeaWBRPKCVwR2wmF2Ih4n0V04rQoMcjiiT40K7BQlYpIMlVCyUmZb26hqRWWlbsGkrcVr9Gx0Qs7lx/XP14eCCLxC2GXUVJYRlnKWRducSMOMNEBqUkJHjpmlVh0n4Cp6oXC+251SV+P/P9Rpq45bWdqeVyp1GPVJ7sdnSA/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uC2cRn2MaejLRwnKW3Qqz02SvnmGrHvRiLGXMZMvfx0=;
 b=Hs/+hHSA+9Vy68xisWzmJzSwQTMcNS2zAkTHTyAsvxRAJIpMNWIZeUa4lE3jV9u6grgBW2BAE7x3PTdiepPAxlZ6Mh5jUnuaAKP4G3tFn/Ic6+fFJTsTfWg75p+2mP8mQrJpkqenMQZgxBh+C6DguDcsyhLExtNPgKYh1ZsHZMo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:45::20)
 by BMXPR01MB2216.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 11:56:51 +0000
Received: from BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ec27:7d5a:5dae:145b]) by BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ec27:7d5a:5dae:145b%7]) with mapi id 15.20.3477.029; Fri, 30 Oct 2020
 11:56:51 +0000
From: akash.hadke@kpit.com
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	aditya.tayade@kpit.com,
	Akash Hadke <akash.hadke@kpit.com>
Subject: [poky][dunfell][PATCH] sqlite3: Apply security fixes from Ubuntu
Date: Fri, 30 Oct 2020 17:26:41 +0530
Message-Id: <1604059001-17159-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [103.207.8.108]
X-ClientProxiedBy: BM1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::25) To BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:45::20)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.207.8.108) by BM1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Fri, 30 Oct 2020 11:56:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 032417b4-a665-4752-45a6-08d87ccae32d
X-MS-TrafficTypeDiagnostic: BMXPR01MB2216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
 <BMXPR01MB2216DBCDB41C3A961999A7F88E150@BMXPR01MB2216.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jMABsWPfcHbXZ/WbJGZrZxvMSySCkImYx4OLR/hVqBXESuSxWywWgrgGWVrU9CDrrEFf9diPWBxj2JIBPuPwDDPAAokweuhSszHhUo0CWsR7ozLS5E6/uXgs6wptIpjXxi7SnPiZdvZsucKSFiDUSe+u77vv30k3KjSjqgSsw/UtVRanGRYna1RbzQaCZVXINBVDbNSyfl/I2jc67SnuMyvzNbYCJ1VLVI3WHsVUBk5ShTNXJizS2zkFjNMnPa4kNmMqbBzJeCxwDKvZUNOCom+a+DKn7Vpoqgx1+V7IhJSJ0anZlXWr2ZZkDCydyB/luudDI61qcmziT0Mc9H4r6yGdDShhDcUCYvszMKp8NuBUuKD4oMXscubdbybBZ9aHG/fo2gogD6e93OunBlOAtmCuMwIi9QtsJh6IlI4l3dAGNnGWV3jd0aDZU7epy2wE5KAIiOYYqiyfNDEqBu1Cxw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(86362001)(5660300002)(30864003)(8936002)(6512007)(6666004)(966005)(956004)(15650500001)(69590400008)(66574015)(83380400001)(19627235002)(36756003)(66946007)(4326008)(186003)(2616005)(16526019)(52116002)(66556008)(66476007)(6486002)(8676002)(478600001)(4001150100001)(107886003)(316002)(2906002)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ZwYLdBJaqD1kBNvQlpUiZvZI3OK/NwEKB/bPUpFtVf03CdiyCWgN53O9UyjrHBPSdKZUD3xmHg0bl6EE/MX4zs307TaE2G5tBZB5EFN9e5vr8SF7sQuFFyo+qXsLoupxk1AQ81CgPtQstUDt9sTP7/sjwkdfodMeZUMD5xRrUiehG/+PF4i++PfrOp6qh31+rhdA+sA4aq8pNjGzhjBgucx3ZBjnvOjsTBr4gFzsNYFivbrUisIH/ZyNiNOfheN2dyfaYQ5C8BmLWUjw/AVxVJnPCwzk5Zp16DCF2QQyRq+wXDxpFg114Nzh+Fes7X5AReTyrH0K6qXLSPm0vjLLzb5qqpWTkKy85sJMlWuAoaIT+rUjlh03R8rC2R8LjwWx18n6YR5oYA46WQESt9EDJIlpki7O37IWDGQeHCTq6ooGzBkxCDeAlpyb28G4ohCOCCCzKme7/Gzok8b/9jpz41DHMO184WAZcxBc0MQakMPwtVSDg4bsCY1iX/wNnFlqFm9RqKxekdmXl3eIXSJbMMyPtclN9VJEfLOdslkX5WfPFEPWwg3pHNLYIiC9iEcmZbnALx5V+hlydxyaSQmxOfP9YHOyj/zFb58CwvzCdEoDw85B9BPFoVYXjk4evuBIPb4AS++wIg2iAg8ie+5HxQ==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032417b4-a665-4752-45a6-08d87ccae32d
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB3089.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 11:56:51.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: riy4UEqsGw2bbrk4xKqQwc1dL7pSSvA4eQfLwmCvk/TLuzf2mObm8l8aIi+LXex+/ZwSG/tkm+SP+88Jlh8/sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2216
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Applied CVE patches of below issues which are present on
ubuntu site given below.

Link: https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/sqlite3/3.=
31.1-4ubuntu0.2/sqlite3_3.31.1-4ubuntu0.2.debian.tar.xz

CVE Issues are as below:
CVE-2020-13434
CVE-2020-13435
CVE-2020-13630
CVE-2020-13631
CVE-2020-13632

Testing was done in an ARM64 product CI system.

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 ...qlite3_CVEs_from_3.31.1-4ubuntu0.2.debian.patch | 334 +++++++++++++++++=
++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb      |   1 +
 2 files changed, 335 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/sqlite3_CVEs_from_3.3=
1.1-4ubuntu0.2.debian.patch

diff --git a/meta/recipes-support/sqlite/files/sqlite3_CVEs_from_3.31.1-4ub=
untu0.2.debian.patch b/meta/recipes-support/sqlite/files/sqlite3_CVEs_from_=
3.31.1-4ubuntu0.2.debian.patch
new file mode 100644
index 0000000..d10c9af
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/sqlite3_CVEs_from_3.31.1-4ubuntu0.2=
.debian.patch
@@ -0,0 +1,334 @@
+Downloaded Ubuntu 20.04 LTS Sources
+https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/sqlite3/3.31.1-=
4ubuntu0.2/sqlite3_3.31.1-4ubuntu0.2.debian.tar.xz
+
+Then copied the full tree and applied following CVE patches from
+Ubuntu debian tar ball from path debian/patches using "patch -p1":
+CVE-2020-13434
+CVE-2020-13435-1
+CVE-2020-13435-2
+CVE-2020-13435-pre1
+CVE-2020-13630
+CVE-2020-13631
+CVE-2020-13632
+
+These patches were applied in the file sqlite3.c since we are
+following amalgam format and the final patch was created after
+taking diff of file sqlite3.c
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+=
sourcefiles/sqlite3/3.31.1-4ubuntu0.2/sqlite3_3.31.1-4ubuntu0.2.debian.tar.=
xz]
+
+Comment: Refreshed some hunks by adding SQLITE_PRIVATE to some functions.
+         As our codebase having SQLITE_PRIVATE for functions.
+
+CVE: CVE-2020-13434
+CVE: CVE-2020-13435
+CVE: CVE-2020-13630
+CVE: CVE-2020-13631
+CVE: CVE-2020-13632
+
+--- a/sqlite3.c       2020-01-27 20:25:19.000000000 +0000
++++ b/sqlite3.c   2020-10-10 11:28:20.622405611 +0000
+@@ -18965,6 +18965,9 @@
+ SQLITE_PRIVATE int sqlite3ExprWalkNoop(Walker*, Expr*);
+ SQLITE_PRIVATE int sqlite3SelectWalkNoop(Walker*, Select*);
+ SQLITE_PRIVATE int sqlite3SelectWalkFail(Walker*, Select*);
++SQLITE_PRIVATE int sqlite3WalkerDepthIncrease(Walker*,Select*);
++SQLITE_PRIVATE void sqlite3WalkerDepthDecrease(Walker*,Select*);
++
+ #ifdef SQLITE_DEBUG
+ SQLITE_PRIVATE void sqlite3SelectWalkAssert2(Walker*, Select*);
+ #endif
+@@ -19945,8 +19948,10 @@
+ SQLITE_PRIVATE int sqlite3ReadOnlyShadowTables(sqlite3 *db);
+ #ifndef SQLITE_OMIT_VIRTUALTABLE
+ SQLITE_PRIVATE   int sqlite3ShadowTableName(sqlite3 *db, const char *zNam=
e);
++SQLITE_PRIVATE   int sqlite3IsShadowTableOf(sqlite3*,Table*,const char*);
+ #else
+ # define sqlite3ShadowTableName(A,B) 0
++# define sqlite3IsShadowTableOf(A,B,C) 0
+ #endif
+ SQLITE_PRIVATE int sqlite3VtabEponymousTableInit(Parse*,Module*);
+ SQLITE_PRIVATE void sqlite3VtabEponymousTableClear(sqlite3*,Module*);
+@@ -28148,6 +28153,13 @@
+ #define etBUFSIZE SQLITE_PRINT_BUF_SIZE  /* Size of the output buffer */
+
+ /*
++** Hard limit on the precision of floating-point conversions.
++*/
++#ifndef SQLITE_PRINTF_PRECISION_LIMIT
++# define SQLITE_FP_PRECISION_LIMIT 100000000
++#endif
++
++/*
+ ** Render a string given by "fmt" into the StrAccum object.
+ */
+ SQLITE_API void sqlite3_str_vappendf(
+@@ -28468,6 +28480,11 @@
+         length =3D 0;
+ #else
+         if( precision<0 ) precision =3D 6;         /* Set default precisi=
on */
++#ifdef SQLITE_FP_PRECISION_LIMIT
++        if( precision>SQLITE_FP_PRECISION_LIMIT ){
++          precision =3D SQLITE_FP_PRECISION_LIMIT;
++        }
++#endif
+         if( realvalue<0.0 ){
+           realvalue =3D -realvalue;
+           prefix =3D '-';
+@@ -96761,6 +96778,42 @@
+   return WRC_Continue;
+ }
+
++/* Increase the walkerDepth when entering a subquery, and
++** descrease when leaving the subquery.
++*/
++SQLITE_PRIVATE int sqlite3WalkerDepthIncrease(Walker *pWalker, Select *pS=
elect){
++  UNUSED_PARAMETER(pSelect);
++  pWalker->walkerDepth++;
++  return WRC_Continue;
++}
++SQLITE_PRIVATE void sqlite3WalkerDepthDecrease(Walker *pWalker, Select *p=
Select){
++  UNUSED_PARAMETER(pSelect);
++  pWalker->walkerDepth--;
++}
++
++/*
++** No-op routine for the parse-tree walker.
++**
++** When this routine is the Walker.xExprCallback then expression trees
++** are walked without any actions being taken at each node.  Presumably,
++** when this routine is used for Walker.xExprCallback then
++** Walker.xSelectCallback is set to do something useful for every
++** subquery in the parser tree.
++*/
++SQLITE_PRIVATE int sqlite3ExprWalkNoop(Walker *NotUsed, Expr *NotUsed2){
++  UNUSED_PARAMETER2(NotUsed, NotUsed2);
++  return WRC_Continue;
++}
++
++/*
++** No-op routine for the parse-tree walker for SELECT statements.
++** subquery in the parser tree.
++*/
++SQLITE_PRIVATE int sqlite3SelectWalkNoop(Walker *NotUsed, Select *NotUsed=
2){
++  UNUSED_PARAMETER2(NotUsed, NotUsed2);
++  return WRC_Continue;
++}
++
+ /************** End of walker.c *****************************************=
*****/
+ /************** Begin file resolve.c ************************************=
*****/
+ /*
+@@ -96789,6 +96842,8 @@
+ **
+ ** incrAggFunctionDepth(pExpr,n) is the main routine.  incrAggDepth(..)
+ ** is a helper function - a callback for the tree walker.
++**
++** See also the sqlite3WindowExtraAggFuncDepth() routine in window.c
+ */
+ static int incrAggDepth(Walker *pWalker, Expr *pExpr){
+   if( pExpr->op=3D=3DTK_AGG_FUNCTION ) pExpr->op2 +=3D pWalker->u.n;
+@@ -102447,7 +102502,10 @@
+   switch( op ){
+     case TK_AGG_COLUMN: {
+       AggInfo *pAggInfo =3D pExpr->pAggInfo;
+-      struct AggInfo_col *pCol =3D &pAggInfo->aCol[pExpr->iAgg];
++      struct AggInfo_col *pCol;
++      assert( pAggInfo!=3D0 );
++      assert( pExpr->iAgg>=3D0 && pExpr->iAgg<pAggInfo->nColumn );
++      pCol =3D &pAggInfo->aCol[pExpr->iAgg];
+       if( !pAggInfo->directMode ){
+         assert( pCol->iMem>0 );
+         return pCol->iMem;
+@@ -102741,7 +102799,10 @@
+     }
+     case TK_AGG_FUNCTION: {
+       AggInfo *pInfo =3D pExpr->pAggInfo;
+-      if( pInfo=3D=3D0 ){
++      if( pInfo=3D=3D0
++       || NEVER(pExpr->iAgg<0)
++       || NEVER(pExpr->iAgg>=3DpInfo->nFunc)
++      ){
+         assert( !ExprHasProperty(pExpr, EP_IntValue) );
+         sqlite3ErrorMsg(pParse, "misuse of aggregate: %s()", pExpr->u.zTo=
ken);
+       }else{
+@@ -104480,15 +104541,6 @@
+   }
+   return WRC_Continue;
+ }
+-static int analyzeAggregatesInSelect(Walker *pWalker, Select *pSelect){
+-  UNUSED_PARAMETER(pSelect);
+-  pWalker->walkerDepth++;
+-  return WRC_Continue;
+-}
+-static void analyzeAggregatesInSelectEnd(Walker *pWalker, Select *pSelect=
){
+-  UNUSED_PARAMETER(pSelect);
+-  pWalker->walkerDepth--;
+-}
+
+ /*
+ ** Analyze the pExpr expression looking for aggregate functions and
+@@ -104502,8 +104554,8 @@
+ SQLITE_PRIVATE void sqlite3ExprAnalyzeAggregates(NameContext *pNC, Expr *=
pExpr){
+   Walker w;
+   w.xExprCallback =3D analyzeAggregate;
+-  w.xSelectCallback =3D analyzeAggregatesInSelect;
+-  w.xSelectCallback2 =3D analyzeAggregatesInSelectEnd;
++  w.xSelectCallback =3D sqlite3WalkerDepthIncrease;
++  w.xSelectCallback2 =3D sqlite3WalkerDepthDecrease;
+   w.walkerDepth =3D 0;
+   w.u.pNC =3D pNC;
+   w.pParse =3D 0;
+@@ -104742,7 +104794,10 @@
+   /* Check that a table or index named 'zName' does not already exist
+   ** in database iDb. If so, this is an error.
+   */
+-  if( sqlite3FindTable(db, zName, zDb) || sqlite3FindIndex(db, zName, zDb=
) ){
++  if( sqlite3FindTable(db, zName, zDb)
++   || sqlite3FindIndex(db, zName, zDb)
++   || sqlite3IsShadowTableOf(db, pTab, zName)
++  ){
+     sqlite3ErrorMsg(pParse,
+         "there is already another table or index with this name: %s", zNa=
me);
+     goto exit_rename_table;
+@@ -111252,6 +111307,28 @@
+   recomputeColumnsNotIndexed(pPk);
+ }
+
++
++#ifndef SQLITE_OMIT_VIRTUALTABLE
++/*
++** Return true if pTab is a virtual table and zName is a shadow table nam=
e
++** for that virtual table.
++*/
++SQLITE_PRIVATE int sqlite3IsShadowTableOf(sqlite3 *db, Table *pTab, const=
 char *zName){
++  int nName;                    /* Length of zName */
++  Module *pMod;                 /* Module for the virtual table */
++
++  if( !IsVirtual(pTab) ) return 0;
++  nName =3D sqlite3Strlen30(pTab->zName);
++  if( sqlite3_strnicmp(zName, pTab->zName, nName)!=3D0 ) return 0;
++  if( zName[nName]!=3D'_' ) return 0;
++  pMod =3D (Module*)sqlite3HashFind(&db->aModule, pTab->azModuleArg[0]);
++  if( pMod=3D=3D0 ) return 0;
++  if( pMod->pModule->iVersion<3 ) return 0;
++  if( pMod->pModule->xShadowName=3D=3D0 ) return 0;
++  return pMod->pModule->xShadowName(zName+nName+1);
++}
++#endif /* ifndef SQLITE_OMIT_VIRTUALTABLE */
++
+ #ifndef SQLITE_OMIT_VIRTUALTABLE
+ /*
+ ** Return true if zName is a shadow table name in the current database
+@@ -111263,8 +111340,6 @@
+ SQLITE_PRIVATE int sqlite3ShadowTableName(sqlite3 *db, const char *zName)=
{
+   char *zTail;                  /* Pointer to the last "_" in zName */
+   Table *pTab;                  /* Table that zName is a shadow of */
+-  Module *pMod;                 /* Module for the virtual table */
+-
+   zTail =3D strrchr(zName, '_');
+   if( zTail=3D=3D0 ) return 0;
+   *zTail =3D 0;
+@@ -111272,11 +111347,7 @@
+   *zTail =3D '_';
+   if( pTab=3D=3D0 ) return 0;
+   if( !IsVirtual(pTab) ) return 0;
+-  pMod =3D (Module*)sqlite3HashFind(&db->aModule, pTab->azModuleArg[0]);
+-  if( pMod=3D=3D0 ) return 0;
+-  if( pMod->pModule->iVersion<3 ) return 0;
+-  if( pMod->pModule->xShadowName=3D=3D0 ) return 0;
+-  return pMod->pModule->xShadowName(zTail+1);
++  return sqlite3IsShadowTableOf(db, pTab, zName);
+ }
+ #endif /* ifndef SQLITE_OMIT_VIRTUALTABLE */
+
+@@ -133053,29 +133124,6 @@
+   return WRC_Continue;
+ }
+
+-/*
+-** No-op routine for the parse-tree walker.
+-**
+-** When this routine is the Walker.xExprCallback then expression trees
+-** are walked without any actions being taken at each node.  Presumably,
+-** when this routine is used for Walker.xExprCallback then
+-** Walker.xSelectCallback is set to do something useful for every
+-** subquery in the parser tree.
+-*/
+-SQLITE_PRIVATE int sqlite3ExprWalkNoop(Walker *NotUsed, Expr *NotUsed2){
+-  UNUSED_PARAMETER2(NotUsed, NotUsed2);
+-  return WRC_Continue;
+-}
+-
+-/*
+-** No-op routine for the parse-tree walker for SELECT statements.
+-** subquery in the parser tree.
+-*/
+-SQLITE_PRIVATE int sqlite3SelectWalkNoop(Walker *NotUsed, Select *NotUsed=
2){
+-  UNUSED_PARAMETER2(NotUsed, NotUsed2);
+-  return WRC_Continue;
+-}
+-
+ #if SQLITE_DEBUG
+ /*
+ ** Always assert.  This xSelectCallback2 implementation proves that the
+@@ -150214,6 +150262,23 @@
+ }
+
+ /*
++** When rewriting a query, if the new subquery in the FROM clause
++** contains TK_AGG_FUNCTION nodes that refer to an outer query,
++** then we have to increase the Expr->op2 values of those nodes
++** due to the extra subquery layer that was added.
++**
++** See also the incrAggDepth() routine in resolve.c
++*/
++static int sqlite3WindowExtraAggFuncDepth(Walker *pWalker, Expr *pExpr){
++  if( pExpr->op=3D=3DTK_AGG_FUNCTION
++   && pExpr->op2>=3DpWalker->walkerDepth
++  ){
++    pExpr->op2++;
++  }
++  return WRC_Continue;
++}
++
++/*
+ ** If the SELECT statement passed as the second argument does not invoke
+ ** any SQL window functions, this function is a no-op. Otherwise, it
+ ** rewrites the SELECT statement so that window function xStep functions
+@@ -150321,6 +150386,7 @@
+     p->pSrc =3D sqlite3SrcListAppend(pParse, 0, 0, 0);
+     if( p->pSrc ){
+       Table *pTab2;
++      Walker w;
+       p->pSrc->a[0].pSelect =3D pSub;
+       sqlite3SrcListAssignCursors(pParse, p->pSrc);
+       pSub->selFlags |=3D SF_Expanded;
+@@ -150335,6 +150401,11 @@
+         pTab->tabFlags |=3D TF_Ephemeral;
+         p->pSrc->a[0].pTab =3D pTab;
+         pTab =3D pTab2;
++        memset(&w, 0, sizeof(w));
++        w.xExprCallback =3D sqlite3WindowExtraAggFuncDepth;
++        w.xSelectCallback =3D sqlite3WalkerDepthIncrease;
++        w.xSelectCallback2 =3D sqlite3WalkerDepthDecrease;
++        sqlite3WalkSelect(&w, pSub);
+       }
+     }else{
+       sqlite3SelectDelete(db, pSub);
+@@ -170206,6 +170277,7 @@
+                 fts3EvalNextRow(pCsr, pLeft, pRc);
+               }
+             }
++            pRight->bEof =3D pLeft->bEof =3D 1;
+           }
+         }
+         break;
+@@ -181747,7 +181819,7 @@
+     iStart =3D pExpr->iPhrase * ((p->nCol + 31) / 32);
+   }
+
+-  while( 1 ){
++  if( pIter ) while( 1 ){
+     int nHit =3D fts3ColumnlistCount(&pIter);
+     if( (pPhrase->iColumn>=3DpTab->nColumn || pPhrase->iColumn=3D=3DiCol)=
 ){
+       if( p->flag=3D=3DFTS3_MATCHINFO_LHITS ){
diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-s=
upport/sqlite/sqlite3_3.31.1.bb
index e5071b4..9017593 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -8,6 +8,7 @@ SRC_URI =3D "http://www.sqlite.org/2020/sqlite-autoconf-${S=
QLITE_PV}.tar.gz \
            file://CVE-2020-11656.patch \
            file://CVE-2020-11655.patch \
            file://CVE-2020-15358.patch \
+           file://sqlite3_CVEs_from_3.31.1-4ubuntu0.2.debian.patch \
            "
 SRC_URI[md5sum] =3D "2d0a553534c521504e3ac3ad3b90f125"
 SRC_URI[sha256sum] =3D "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b78=
25a2b6b51949ae"
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
