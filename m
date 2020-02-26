Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 708F9610DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 04:52:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2020 20:52:04 -0800
X-IronPort-AV: E=Sophos;i="5.70,486,1574150400"; d="scan'208";a="384691011"
Received: from unknown (HELO [10.221.217.137]) ([10.221.217.137])
	by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	25 Feb 2020 20:52:03 -0800
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20200221205942.27168-1-bunk@stusta.de>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <eb97f8a8-caab-cceb-9a30-eb07276772c2@intel.com>
Date: Wed, 26 Feb 2020 12:52:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221205942.27168-1-bunk@stusta.de>
Subject: Re: [zeus][PATCH] sqlite: fix numerous CVEs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Feb 2020 04:52:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22-Feb-20 04:59 AM, Adrian Bunk wrote:
> From: Ross Burton <ross.burton@intel.com>
> 
> Fix the following CVEs:
> 
> - CVE-2019-19244
> - CVE-2019-19880
> - CVE-2019-19923
> - CVE-2019-19924
> - CVE-2019-19925
> - CVE-2019-19926
> - CVE-2019-19959
> - CVE-2019-20218
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   .../sqlite/sqlite3/CVE-2019-19244.patch       | 33 ++++++++++
>   .../sqlite/sqlite3/CVE-2019-19880.patch       | 33 ++++++++++

This one is giving a warning:

WARNING: sqlite3-native-3_3.29.0-r0 do_patch: Fuzz detected:

Applying patch CVE-2019-19880.patch
patching file sqlite3.c
Hunk #1 succeeded at 146849 with fuzz 1 (offset -735 lines).

The context lines in the patches can be updated with devtool:

     devtool modify sqlite3-native
     devtool finish --force-patch-refresh sqlite3-native <layer_path>

Don't forget to review changes done by devtool!

Thanks,

Anuj

>   .../sqlite/sqlite3/CVE-2019-19923.patch       | 50 ++++++++++++++
>   .../sqlite/sqlite3/CVE-2019-19924.patch       | 65 +++++++++++++++++++
>   .../sqlite/sqlite3/CVE-2019-19925.patch       | 33 ++++++++++
>   .../sqlite/sqlite3/CVE-2019-19926.patch       | 31 +++++++++
>   .../sqlite/sqlite3/CVE-2019-19959.patch       | 46 +++++++++++++
>   .../sqlite/sqlite3/CVE-2019-20218.patch       | 31 +++++++++
>   meta/recipes-support/sqlite/sqlite3_3.29.0.bb | 11 +++-
>   9 files changed, 332 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
>   create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch
>   create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
>   create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch
>   create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch
>   create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch
>   create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch
>   create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch
> 
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
> new file mode 100644
> index 0000000000..3f70979acc
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19244.patch
> @@ -0,0 +1,33 @@
> +CVE: CVE-2019-19244
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 0f690d4ae5ffe656762fdbb7f36cc4c2dcbb2d9d Mon Sep 17 00:00:00 2001
> +From: dan <dan@noemail.net>
> +Date: Fri, 22 Nov 2019 10:14:01 +0000
> +Subject: [PATCH] Fix a crash that could occur if a sub-select that uses both
> + DISTINCT and window functions also used an ORDER BY that is the same as its
> + select list.
> +
> +Amalgamation version of the patch:
> +FossilOrigin-Name: bcdd66c1691955c697f3d756c2b035acfe98f6aad72e90b0021bab6e9023b3ba
> +---
> + sqlite3.c | 5 +++--
> + sqlite3.h | 2 +-
> + 2 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 8fd740b..db1c649 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -131679,6 +131679,7 @@ SQLITE_PRIVATE int sqlite3Select(
> +   */
> +   if( (p->selFlags & (SF_Distinct|SF_Aggregate))==SF_Distinct
> +    && sqlite3ExprListCompare(sSort.pOrderBy, pEList, -1)==0
> ++   && p->pWin==0
> +   ){
> +     p->selFlags &= ~SF_Distinct;
> +     pGroupBy = p->pGroupBy = sqlite3ExprListDup(db, pEList, 0);
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch
> new file mode 100644
> index 0000000000..ca5c31c57b
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19880.patch
> @@ -0,0 +1,33 @@
> +CVE: CVE-2019-19880
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 3622d20ad10dfac9586d4423547ed960cbc66fcf Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Wed, 18 Dec 2019 00:05:50 +0000
> +Subject: [PATCH] When processing constant integer values in ORDER BY clauses
> + of window definitions (see check-in [7e4 ---
> +
> +---
> + sqlite3.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index db1c649..a83b3d2 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -147584,9 +147584,11 @@ static ExprList *exprListAppendList(
> +     int nInit = pList ? pList->nExpr : 0;
> +     for(i=0; i<pAppend->nExpr; i++){
> +       Expr *pDup = sqlite3ExprDup(pParse->db, pAppend->a[i].pExpr, 0);
> ++      assert( pDup==0 || !ExprHasProperty(pDup, EP_MemToken) );
> +       if( bIntToNull && pDup && pDup->op==TK_INTEGER ){
> +         pDup->op = TK_NULL;
> +         pDup->flags &= ~(EP_IntValue|EP_IsTrue|EP_IsFalse);
> ++        pDup->u.zToken = 0;
> +       }
> +       pList = sqlite3ExprListAppend(pParse, pList, pDup);
> +       if( pList ) pList->a[nInit+i].sortFlags = pAppend->a[i].sortFlags;
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
> new file mode 100644
> index 0000000000..b1b866b250
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19923.patch
> @@ -0,0 +1,50 @@
> +CVE: CVE-2019-19923
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From b64463719dc53bde98b0ce3930b10a32560c3a02 Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Wed, 18 Dec 2019 20:51:58 +0000
> +Subject: [PATCH] Continue to back away from the LEFT JOIN optimization of
> + check-in [41c27bc0ff1d3135] by disallowing query flattening if the outer
> + query is DISTINCT.  Without this fix, if an index scan is run on the table
> + within the view on the right-hand side of the LEFT JOIN, stale result
> + registers might be accessed yielding incorrect results, and/or an
> + OP_IfNullRow opcode might be invoked on the un-opened table, resulting in a
> + NULL-pointer dereference.  This problem was found by the Yongheng and Rui
> + fuzzer.
> +
> +FossilOrigin-Name: 862974312edf00e9d1068115d1a39b7235b7db68b6d86b81d38a12f025a4748e
> +---
> + sqlite3.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index d29da07..5bc06c8 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -129216,6 +129216,7 @@ static void substSelect(
> + **        (3b) the FROM clause of the subquery may not contain a virtual
> + **             table and
> + **        (3c) the outer query may not be an aggregate.
> ++**        (3d) the outer query may not be DISTINCT.
> + **
> + **   (4)  The subquery can not be DISTINCT.
> + **
> +@@ -129412,8 +129413,11 @@ static int flattenSubquery(
> +   */
> +   if( (pSubitem->fg.jointype & JT_OUTER)!=0 ){
> +     isLeftJoin = 1;
> +-    if( pSubSrc->nSrc>1 || isAgg || IsVirtual(pSubSrc->a[0].pTab) ){
> +-      /*  (3a)             (3c)     (3b) */
> ++    if( pSubSrc->nSrc>1                   /* (3a) */
> ++     || isAgg                             /* (3b) */
> ++     || IsVirtual(pSubSrc->a[0].pTab)     /* (3c) */
> ++     || (p->selFlags & SF_Distinct)!=0    /* (3d) */
> ++    ){
> +       return 0;
> +     }
> +   }
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch
> new file mode 100644
> index 0000000000..80d5edbb0c
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19924.patch
> @@ -0,0 +1,65 @@
> +CVE: CVE-2019-19924
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 854fe21e8a987f84da81f6bb9e90abc5355c6621 Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Thu, 19 Dec 2019 20:37:32 +0000
> +Subject: [PATCH] When an error occurs while rewriting the parser tree for
> + window functions in the sqlite3WindowRewrite() routine, make sure that
> + pParse->nErr is set, and make sure that this shuts down any subsequent code
> + generation that might depend on the transformations that were implemented.
> + This fixes a problem discovered by the Yongheng and Rui fuzzer.
> +
> +Amalgamation format of backported patch
> +FossilOrigin-Name: e2bddcd4c55ba3cbe0130332679ff4b048630d0ced9a8899982edb5a3569ba7f
> +---
> + sqlite3.c | 16 +++++++++++-----
> + sqlite3.h |  2 +-
> + 2 files changed, 12 insertions(+), 6 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 408ec4c..857c28e 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -77798,7 +77798,8 @@ SQLITE_PRIVATE void sqlite3VdbeSetP4KeyInfo(Parse *pParse, Index *pIdx){
> + */
> + static void vdbeVComment(Vdbe *p, const char *zFormat, va_list ap){
> +   assert( p->nOp>0 || p->aOp==0 );
> +-  assert( p->aOp==0 || p->aOp[p->nOp-1].zComment==0 || p->db->mallocFailed );
> ++  assert( p->aOp==0 || p->aOp[p->nOp-1].zComment==0 || p->db->mallocFailed
> ++          || p->pParse->nErr>0 );
> +   if( p->nOp ){
> +     assert( p->aOp );
> +     sqlite3DbFree(p->db, p->aOp[p->nOp-1].zComment);
> +@@ -97872,6 +97873,7 @@ static int codeCompare(
> +   int addr;
> +   CollSeq *p4;
> +
> ++  if( pParse->nErr ) return 0;
> +   p4 = sqlite3BinaryCompareCollSeq(pParse, pLeft, pRight);
> +   p5 = binaryCompareP5(pLeft, pRight, jumpIfNull);
> +   addr = sqlite3VdbeAddOp4(pParse->pVdbe, opcode, in2, dest, in1,
> +@@ -147627,7 +147629,7 @@ SQLITE_PRIVATE int sqlite3WindowRewrite(Parse *pParse, Select *p){
> +
> +     pTab = sqlite3DbMallocZero(db, sizeof(Table));
> +     if( pTab==0 ){
> +-      return SQLITE_NOMEM;
> ++      return sqlite3ErrorToParser(db, SQLITE_NOMEM);
> +     }
> +
> +     p->pSrc = 0;
> +@@ -147731,6 +147733,10 @@ SQLITE_PRIVATE int sqlite3WindowRewrite(Parse *pParse, Select *p){
> +     sqlite3DbFree(db, pTab);
> +   }
> +
> ++  if( rc && pParse->nErr==0 ){
> ++    assert( pParse->db->mallocFailed );
> ++    return sqlite3ErrorToParser(pParse->db, SQLITE_NOMEM);
> ++  }
> +   return rc;
> + }
> +
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch
> new file mode 100644
> index 0000000000..ffc2c6afff
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19925.patch
> @@ -0,0 +1,33 @@
> +CVE: CVE-2019-19925
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From e92580434d2cdca228649d32f76167492de4f512 Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Thu, 19 Dec 2019 15:15:40 +0000
> +Subject: [PATCH] Fix the zipfile extension so that INSERT works even if the
> + pathname of the file being inserted is a NULL.  Bug discovered by the
> + Yongheng and Rui fuzzer.
> +
> +FossilOrigin-Name: a80f84b511231204658304226de3e075a55afc2e3f39ac063716f7a57f585c06
> +---
> + shell.c   | 1 +
> + sqlite3.c | 4 ++--
> + sqlite3.h | 2 +-
> + 3 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/shell.c b/shell.c
> +index 053180c..404a8d4 100644
> +--- a/shell.c
> ++++ b/shell.c
> +@@ -5827,6 +5827,7 @@ static int zipfileUpdate(
> +
> +     if( rc==SQLITE_OK ){
> +       zPath = (const char*)sqlite3_value_text(apVal[2]);
> ++      if( zPath==0 ) zPath = "";
> +       nPath = (int)strlen(zPath);
> +       mTime = zipfileGetTime(apVal[4]);
> +     }
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch
> new file mode 100644
> index 0000000000..92bc7908bc
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19926.patch
> @@ -0,0 +1,31 @@
> +CVE: CVE-2019-19926
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 4165b1e1e0001165ace9051a70f938099505eadc Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Thu, 19 Dec 2019 22:08:19 +0000
> +Subject: [PATCH] Continuation of [e2bddcd4c55ba3cb]: Add another spot where it
> + is necessary to abort early due to prior errors in sqlite3WindowRewrite().
> +
> +FossilOrigin-Name: cba2a2a44cdf138a629109bb0ad088ed4ef67fc66bed3e0373554681a39615d2
> +---
> + sqlite3.c | 7 ++++---
> + sqlite3.h | 2 +-
> + 2 files changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 857c28e..19a474d 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -128427,6 +128427,7 @@ static int multiSelect(
> +     }
> +   #endif
> +   }
> ++  if( pParse->nErr ) goto multi_select_end;
> +
> +   /* Compute collating sequences used by
> +   ** temporary tables needed to implement the compound select.
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch
> new file mode 100644
> index 0000000000..cba8ec9d30
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-19959.patch
> @@ -0,0 +1,46 @@
> +CVE: CVE-2019-19959
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From f83f7e8141ee7cbbf7f2dc8985279a7372b259b6 Mon Sep 17 00:00:00 2001
> +From: "D. Richard Hipp" <drh@hwaci.com>
> +Date: Mon, 23 Dec 2019 21:04:33 +0000
> +Subject: [PATCH] Fix the zipfile() function in the zipfile extension so that
> + it is able to deal with goofy filenames that contain embedded zeros.
> +
> +FossilOrigin-Name: cc0fb00a128fd0773db5ff7891f7aa577a3671d570166d2cbb30df922344adcf
> +---
> + shell.c   | 4 ++--
> + sqlite3.c | 4 ++--
> + sqlite3.h | 2 +-
> + 3 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/shell.c b/shell.c
> +index 404a8d4..48065e9 100644
> +--- a/shell.c
> ++++ b/shell.c
> +@@ -5841,7 +5841,7 @@ static int zipfileUpdate(
> +         zFree = sqlite3_mprintf("%s/", zPath);
> +         if( zFree==0 ){ rc = SQLITE_NOMEM; }
> +         zPath = (const char*)zFree;
> +-        nPath++;
> ++        nPath = (int)strlen(zPath);
> +       }
> +     }
> +
> +@@ -6242,11 +6242,11 @@ void zipfileStep(sqlite3_context *pCtx, int nVal, sqlite3_value **apVal){
> +   }else{
> +     if( zName[nName-1]!='/' ){
> +       zName = zFree = sqlite3_mprintf("%s/", zName);
> +-      nName++;
> +       if( zName==0 ){
> +         rc = SQLITE_NOMEM;
> +         goto zipfile_step_out;
> +       }
> ++      nName = (int)strlen(zName);
> +     }else{
> +       while( nName>1 && zName[nName-2]=='/' ) nName--;
> +     }
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch
> new file mode 100644
> index 0000000000..fb6cd6df2d
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2019-20218.patch
> @@ -0,0 +1,31 @@
> +CVE: CVE-2019-20218
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 6bbd76d34f29f61483791231f2ce579dcadab8a5 Mon Sep 17 00:00:00 2001
> +From: Dan Kennedy <danielk1977@gmail.com>
> +Date: Fri, 27 Dec 2019 20:54:42 +0000
> +Subject: [PATCH] Do not attempt to unwind the WITH stack in the Parse object
> + following an error. This fixes a separate case to [de6e6d68].
> +
> +FossilOrigin-Name: d29edef93451cc67a5d69c1cce1b1832d9ca8fff1f600afdd51338b74d077b92
> +---
> + sqlite3.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index 5bc06c8..408ec4c 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -130570,7 +130570,7 @@ static int selectExpander(Walker *pWalker, Select *p){
> +
> +   /* Process NATURAL keywords, and ON and USING clauses of joins.
> +   */
> +-  if( db->mallocFailed || sqliteProcessJoin(pParse, p) ){
> ++  if( pParse->nErr || db->mallocFailed || sqliteProcessJoin(pParse, p) ){
> +     return WRC_Abort;
> +   }
> +
> +--
> +2.24.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
> index 34066fbe89..61145851be 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
> @@ -4,6 +4,15 @@ LICENSE = "PD"
>   LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
>   
>   SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
> -           file://0001-Fix-CVE-2019-16168.patch"
> +           file://0001-Fix-CVE-2019-16168.patch \
> +           file://CVE-2019-19244.patch \
> +           file://CVE-2019-19880.patch \
> +           file://CVE-2019-19923.patch \
> +           file://CVE-2019-19924.patch \
> +           file://CVE-2019-19925.patch \
> +           file://CVE-2019-19926.patch \
> +           file://CVE-2019-19959.patch \
> +           file://CVE-2019-20218.patch \
> +"
>   SRC_URI[md5sum] = "8f3dfe83387e62ecb91c7c5c09c688dc"
>   SRC_URI[sha256sum] = "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b"
> 

