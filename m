Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F783CA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 15:37:52 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.17167.1756481865240703125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 08:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kaqGPEmc;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e951dfcbc5bso2069790276.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 08:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756481864; x=1757086664; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVgt+pVA9EKWOZDZcaVXp0E+HHSCwIOrrmvP0YQ+jkQ=;
        b=kaqGPEmcUCwJnK3wHMBszvv9CCtujI1O9pbMDR5tcOvNtrJV68aSMfsezSwfDpBkHM
         r6NTOsafGvDk4pEO/NXik+ufyJw7BOOhtK6186Ra7ONSljoay/fMP9MPSvnjHEy4h1Ip
         MtyRQ2KlIOXUFHN+18iZKQLZhZj6TSn72NuE8YGE6faOnI/zgMOw+FjwHUe0IgxSbX62
         56Rjl3ga+ASeZZYTAPcjqNG5Ne22hI01+dOVhrAbn7PJnGGcdFMXt4jrLZPHhW7LfOvO
         ou7gl9O6NgmH/VCKTJ7OPOTw8noNyAS3tnlSeGEuNh5Hc+/dhTYwNjQTX0iTML3gY3TG
         VnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756481864; x=1757086664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVgt+pVA9EKWOZDZcaVXp0E+HHSCwIOrrmvP0YQ+jkQ=;
        b=RjiZCWa4V2OY7CD+5LED/mOpwAEyDAu6k7PK0jseMAkKB0df+0Sh7IwGPtDCfuByA7
         kpZXMduhT+yRfkuUncVAYeK795aCESQZFDtp4HDGCkgHp6OoAuXfBs+T0zpG870nTALR
         0DMg6RLMQCaPprrzmI1IetiwCl1CygEJv94Mg/drB/3/KGeuLdoRQ9Emv9sBvz4J3b6G
         fCVbi/bCDfy9rDVSINbfv5Wdu140lRVVVfwk0cMQ74kTnjQNobhdN5XU5CinDhoOmjhZ
         l58MCtBICR47VSkbH+8+xO69r5UFsVeP3iK5Vn2+ToxyH9nr6BhougUmLckGvHlkh5Bk
         suFg==
X-Gm-Message-State: AOJu0YyqzV9v267C4u42NMmqHqMaZ7T/Dooi6eNouBCsOk5nLBSbQx72
	Z1jdBiINqA2NwCKOkn08jyAGmuQkdnx7kbvgoNckYs3Xo128xj1+Tw66xuOQIIvyFVh9HLgpw45
	LByHpSkobIBkuakxXVbF1VyNVB5Wn2AKstIlrbODAnQ==
X-Gm-Gg: ASbGncvdsNsX9/S9j4AOAnqbvVgAoov+7ebVjoOVhbcIdeeohVDuk9SkO1pXfB7as5W
	RnZ6+jFWCOprjn1J8evr1QcTSN8VY7+Jcvmf73/szJsS1OsZZyUnGnutRk27wXS+X/SZSgJXWxB
	cfIVcZeq41onl6nyOsaiseYpl8LZqAOwrc0rFYC1TmkYbT25Wo/046yhqZrYOrZwJa7/97k3V89
	rp0fVt0SD8jrLCAVgqoswK8RczVjIHH4ZonEqg=
X-Google-Smtp-Source: AGHT+IExqlx08mJm5SW83VUgR4FhWXGtsNcZgq1xsYpO3R7DAjoYVuzMvckqjWoC3+UigKbTMnCiqTwwrsEZId6FUbg=
X-Received: by 2002:a05:6902:1895:b0:e97:cf:fde8 with SMTP id
 3f1490d57ef6-e9700d002fbmr9519726276.21.1756481863678; Fri, 29 Aug 2025
 08:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754412086.git.steve@sakoman.com> <4d5093e5103016c08b3a32fd83b1ec9edd87cd5a.1754412086.git.steve@sakoman.com>
 <2fb2bcfc-0bac-4d26-a78f-838084bd67b0@vaisala.com>
In-Reply-To: <2fb2bcfc-0bac-4d26-a78f-838084bd67b0@vaisala.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 29 Aug 2025 08:37:32 -0700
X-Gm-Features: Ac12FXyTyVkCfp20NSwlkYkXspVhRemuebSE0DgJEcEFCiohXvBKunyhwtuxqbU
Message-ID: <CAOSpxdYz3okwSRDHpHRwRWqZExsqw5LPJZfwL8qWcjm5hta-zw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 2/4] sqlite3: patch CVE-2025-7458
To: "Marko, Peter" <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org, 
	Niko Mauno <niko.mauno@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 15:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222617

On Fri, Aug 29, 2025 at 4:25=E2=80=AFAM Niko Mauno <niko.mauno@vaisala.com>=
 wrote:
>
> We have found that since this patch SELECT queries with COUNT(DISTINCT(co=
lumn)) seem to cause sqlite to segfault. E.g.
>
> # sqlite3 :memory: 'create table foo (x int); select count(distinct(x)) f=
rom foo;'
> Segmentation fault (core dumped)

Hi Peter,

Could you check this to see if you can reproduce it?

If so, we should revert this patch.

Steve

> On 5.8.2025 19.43, Steve Sakoman via lists.openembedded.org wrote:
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Pick patch [1] listed in [2].
> > Also pick another patch which is precondition to this one introducing
> > variable needed for the check.
> >
> > [1] https://sqlite.org/src/info/12ad822d9b827777
> > [2] https://nvd.nist.gov/vuln/detail/CVE-2025-7458
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >   ...mpts-to-improve-the-detection-of-cov.patch | 91 ++++++++++++++++++=
+
> >   .../sqlite/files/CVE-2025-7458.patch          | 32 +++++++
> >   meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  2 +
> >   3 files changed, 125 insertions(+)
> >   create mode 100644 meta/recipes-support/sqlite/files/0001-This-branch=
-attempts-to-improve-the-detection-of-cov.patch
> >   create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-7458.pa=
tch
> >
> > diff --git a/meta/recipes-support/sqlite/files/0001-This-branch-attempt=
s-to-improve-the-detection-of-cov.patch b/meta/recipes-support/sqlite/files=
/0001-This-branch-attempts-to-improve-the-detection-of-cov.patch
> > new file mode 100644
> > index 0000000000..8fb037bb0f
> > --- /dev/null
> > +++ b/meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-im=
prove-the-detection-of-cov.patch
> > @@ -0,0 +1,91 @@
> > +From f55a7dad195994f2bb24db7df0a0515502386fe2 Mon Sep 17 00:00:00 2001
> > +From: drh <>
> > +Date: Sat, 22 Oct 2022 14:16:02 +0000
> > +Subject: [PATCH] This branch attempts to improve the detection of cove=
ring
> > + indexes.  This first check-in merely improves a parameter name to
> > + sqlite3WhereBegin() to be more descriptive of what it contains, and e=
nsures
> > + that a subroutine is not inlines so that sqlite3WhereBegin() runs sli=
ghtly
> > + faster.
> > +
> > +FossilOrigin-Name: cadf5f6bb1ce0492ef858ada476288e8057afd3609caa18b09c=
818d3845d7244
> > +
> > +Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/f55=
a7dad195994f2bb24db7df0a0515502386fe2]
> > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > +---
> > + sqlite3.c | 28 +++++++++++++---------------
> > + 1 file changed, 13 insertions(+), 15 deletions(-)
> > +
> > +diff --git a/sqlite3.c b/sqlite3.c
> > +index 4cbc2d0..b7ed991 100644
> > +--- a/sqlite3.c
> > ++++ b/sqlite3.c
> > +@@ -147371,9 +147371,7 @@ struct WhereInfo {
> > +   ExprList *pOrderBy;       /* The ORDER BY clause or NULL */
> > +   ExprList *pResultSet;     /* Result set of the query */
> > +   Expr *pWhere;             /* The complete WHERE clause */
> > +-#ifndef SQLITE_OMIT_VIRTUALTABLE
> > +-  Select *pLimit;           /* Used to access LIMIT expr/registers fo=
r vtabs */
> > +-#endif
> > ++  Select *pSelect;          /* The entire SELECT statement containing=
 WHERE */
> > +   int aiCurOnePass[2];      /* OP_OpenWrite cursors for the ONEPASS o=
pt */
> > +   int iContinue;            /* Jump here to continue with next record=
 */
> > +   int iBreak;               /* Jump here to break out of the loop */
> > +@@ -149070,9 +149068,9 @@ SQLITE_PRIVATE Bitmask sqlite3WhereCodeOneLo=
opStart(
> > +          && pLoop->u.vtab.bOmitOffset
> > +         ){
> > +           assert( pTerm->eOperator=3D=3DWO_AUX );
> > +-          assert( pWInfo->pLimit!=3D0 );
> > +-          assert( pWInfo->pLimit->iOffset>0 );
> > +-          sqlite3VdbeAddOp2(v, OP_Integer, 0, pWInfo->pLimit->iOffset=
);
> > ++          assert( pWInfo->pSelect!=3D0 );
> > ++          assert( pWInfo->pSelect->iOffset>0 );
> > ++          sqlite3VdbeAddOp2(v, OP_Integer, 0, pWInfo->pSelect->iOffse=
t);
> > +           VdbeComment((v,"Zero OFFSET counter"));
> > +         }
> > +       }
> > +@@ -151830,10 +151828,10 @@ static void whereAddLimitExpr(
> > + ** exist only so that they may be passed to the xBestIndex method of =
the
> > + ** single virtual table in the FROM clause of the SELECT.
> > + */
> > +-SQLITE_PRIVATE void sqlite3WhereAddLimit(WhereClause *pWC, Select *p)=
{
> > +-  assert( p=3D=3D0 || (p->pGroupBy=3D=3D0 && (p->selFlags & SF_Aggreg=
ate)=3D=3D0) );
> > +-  if( (p && p->pLimit)                                          /* 1 =
*/
> > +-   && (p->selFlags & (SF_Distinct|SF_Aggregate))=3D=3D0             /=
* 2 */
> > ++SQLITE_PRIVATE void SQLITE_NOINLINE sqlite3WhereAddLimit(WhereClause =
*pWC, Select *p){
> > ++  assert( p!=3D0 && p->pLimit!=3D0 );                 /* 1 -- checked=
 by caller */
> > ++  assert( p->pGroupBy=3D=3D0 && (p->selFlags & SF_Aggregate)=3D=3D0 )=
;
> > ++  if( (p->selFlags & (SF_Distinct|SF_Aggregate))=3D=3D0             /=
* 2 */
> > +    && (p->pSrc->nSrc=3D=3D1 && IsVirtual(p->pSrc->a[0].pTab))       /=
* 3 */
> > +   ){
> > +     ExprList *pOrderBy =3D p->pOrderBy;
> > +@@ -157427,7 +157425,7 @@ SQLITE_PRIVATE WhereInfo *sqlite3WhereBegin(
> > +   Expr *pWhere,           /* The WHERE clause */
> > +   ExprList *pOrderBy,     /* An ORDER BY (or GROUP BY) clause, or NUL=
L */
> > +   ExprList *pResultSet,   /* Query result set.  Req'd for DISTINCT */
> > +-  Select *pLimit,         /* Use this LIMIT/OFFSET clause, if any */
> > ++  Select *pSelect,        /* The entire SELECT statement */
> > +   u16 wctrlFlags,         /* The WHERE_* flags defined in sqliteInt.h=
 */
> > +   int iAuxArg             /* If WHERE_OR_SUBCLAUSE is set, index curs=
or number
> > +                           ** If WHERE_USE_LIMIT, then the limit amoun=
t */
> > +@@ -157504,9 +157502,7 @@ SQLITE_PRIVATE WhereInfo *sqlite3WhereBegin(
> > +   pWInfo->wctrlFlags =3D wctrlFlags;
> > +   pWInfo->iLimit =3D iAuxArg;
> > +   pWInfo->savedNQueryLoop =3D pParse->nQueryLoop;
> > +-#ifndef SQLITE_OMIT_VIRTUALTABLE
> > +-  pWInfo->pLimit =3D pLimit;
> > +-#endif
> > ++  pWInfo->pSelect =3D pSelect;
> > +   memset(&pWInfo->nOBSat, 0,
> > +          offsetof(WhereInfo,sWC) - offsetof(WhereInfo,nOBSat));
> > +   memset(&pWInfo->a[0], 0, sizeof(WhereLoop)+nTabList*sizeof(WhereLev=
el));
> > +@@ -157575,7 +157571,9 @@ SQLITE_PRIVATE WhereInfo *sqlite3WhereBegin(
> > +
> > +   /* Analyze all of the subexpressions. */
> > +   sqlite3WhereExprAnalyze(pTabList, &pWInfo->sWC);
> > +-  sqlite3WhereAddLimit(&pWInfo->sWC, pLimit);
> > ++  if( pSelect && pSelect->pLimit ){
> > ++    sqlite3WhereAddLimit(&pWInfo->sWC, pSelect);
> > ++  }
> > +   if( db->mallocFailed ) goto whereBeginError;
> > +
> > +   /* Special case: WHERE terms that do not refer to any tables in the=
 join
> > diff --git a/meta/recipes-support/sqlite/files/CVE-2025-7458.patch b/me=
ta/recipes-support/sqlite/files/CVE-2025-7458.patch
> > new file mode 100644
> > index 0000000000..6b041d9332
> > --- /dev/null
> > +++ b/meta/recipes-support/sqlite/files/CVE-2025-7458.patch
> > @@ -0,0 +1,32 @@
> > +From b816ca9994e03a8bc829b49452b8158a731e81a9 Mon Sep 17 00:00:00 2001
> > +From: drh <>
> > +Date: Thu, 16 Mar 2023 20:54:29 +0000
> > +Subject: [PATCH] Correctly handle SELECT DISTINCT ... ORDER BY when al=
l of the
> > + result set terms are constant and there are more result set terms tha=
n ORDER
> > + BY terms. Fix for these tickets: [c36cdb4afd504dc1], [4051a7f931d9ba2=
4],
> > + [d6fd512f50513ab7].
> > +
> > +FossilOrigin-Name: 12ad822d9b827777526ca5ed5bf3e678d600294fc9b5c25482d=
fff2a021328a4
> > +
> > +CVE: CVE-2025-7458
> > +Upstream-Status: Backport [github.com/sqlite/sqlite/commit/b816ca9994e=
03a8bc829b49452b8158a731e81a9]
> > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > +---
> > + sqlite3.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/sqlite3.c b/sqlite3.c
> > +index 19d0438..6d92184 100644
> > +--- a/sqlite3.c
> > ++++ b/sqlite3.c
> > +@@ -156989,6 +156989,10 @@ static int wherePathSolver(WhereInfo *pWInf=
o, LogEst nRowEst){
> > +       if( pFrom->isOrdered=3D=3DpWInfo->pOrderBy->nExpr ){
> > +         pWInfo->eDistinct =3D WHERE_DISTINCT_ORDERED;
> > +       }
> > ++      if( pWInfo->pSelect->pOrderBy
> > ++       && pWInfo->nOBSat > pWInfo->pSelect->pOrderBy->nExpr ){
> > ++        pWInfo->nOBSat =3D pWInfo->pSelect->pOrderBy->nExpr;
> > ++      }
> > +     }else{
> > +       pWInfo->nOBSat =3D pFrom->isOrdered;
> > +       pWInfo->revMask =3D pFrom->revLoop;
> > diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recip=
es-support/sqlite/sqlite3_3.38.5.bb
> > index 656e2d8bd8..86d9b4b33b 100644
> > --- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> > +++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> > @@ -10,6 +10,8 @@ SRC_URI =3D "http://www.sqlite.org/2022/sqlite-autoco=
nf-${SQLITE_PV}.tar.gz \
> >              file://CVE-2023-7104.patch \
> >              file://CVE-2025-29088.patch \
> >              file://CVE-2025-6965.patch \
> > +           file://0001-This-branch-attempts-to-improve-the-detection-o=
f-cov.patch \
> > +           file://CVE-2025-7458.patch \
> >              "
> >   SRC_URI[sha256sum] =3D "5af07de982ba658fd91a03170c945f99c971f6955bc79=
df3266544373e39869c"
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#221481): https://lists.openembedded.org/g/openembed=
ded-core/message/221481
> > Mute This Topic: https://lists.openembedded.org/mt/114551672/3618471
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
niko.mauno@vaisala.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

