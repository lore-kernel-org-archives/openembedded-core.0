Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094E1CA1010
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 23:03:16 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.26708.1756940593005604056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 16:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GnmlBpue;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d71bcab6fso4643277b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756940592; x=1757545392; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=75zX6qW9+WeztJk2bFA/kYBA+6RlQFRFrEhqDXaZ6vw=;
        b=GnmlBpue8d1QmxEGe6FK5TlNRmbyeyQ9flWvjby0dZLsxOrzpYftQSDqxKdqR/RW6s
         zrNBVaU6YELTMlTr+eIhgdxG4dY/3OEJxS0MqZIlFRgJYAm6LcFetCRVJKV1BOkynzgy
         7ibYqOy4I1dpb1+GAtEvsxRhxJunHKCjReANYk5q90gu7CJzjCYp5mtkdPhmHqGtRB5P
         54DbreErJEdPjF4XU7XMYfvgmLz7HXlC5KT09UC+L4b9qXprcxX0MLM4KtRiyVlUeqc/
         8X1qtCHHkihLWQcJpMdd7YZ6Nc/1Yv4mUcDXAtiQxRfp6+T2BzJ2lx4PSXvZ5i0zBsoG
         82Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756940592; x=1757545392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75zX6qW9+WeztJk2bFA/kYBA+6RlQFRFrEhqDXaZ6vw=;
        b=gNHY8zoUtO5Q59+FaMf6Ht+1fzaAKd/OA8si811fKTKOPaxnrR0anWhDPiuaVJkxt8
         8GD/Nc9roZNVnCwvzmKvNpEscVXzdSg2axWFsNyD4LY0+CyFvCuad0i5JDw+rWazJisW
         7Ge2qhI+MmlRjrLDydUCJAOgOpi1wjeBr13ZpPSmSVkMDQoJltN8mHDF6r0ZUVgsWDGR
         M/xXmyc4hVJY8fPzd1Winz0Nb3BzbHwY3abInvyiZjAhirSwhamBba7x9sTH8Qyg//Td
         qjV2OHgtWewCeh7eFrfYSYMbwTt6Q9uALtCiGUwMgo5LD4OKywVv/1lmeUAFo5f1qli4
         8dsQ==
X-Gm-Message-State: AOJu0YzQrbYAHN8H/Rz+7CJDf/stYP1OcV8xrI9gogMOpdXG+uk6sTyK
	tdEIRwYCNR4GXYEU6RZ+CITApEh5iTNArSzjC6zqrX9tiBwc/6asiDVwA/2aIqIJfC1G4ykpPWF
	rcmT5F3DgY7hq9ZCSKV4xHe7uXWt5FmGNPnHtM7/1tQ==
X-Gm-Gg: ASbGnctcC4kl4slI3CNIC/BDatC/Yy/M7s/NtFsOwII1/ItGZ/ng78ug7vavManFIQN
	m8+3OSFvSHUNLLqjZi/tZcXMJasME/DaYIcdoszv29S8w7SNaib16L0hTK1xEG5vM1D4uYwwDs1
	6T7y+/PhVMktDLi0OOPV2EnQgSqnYIx9BPEeMdidQo9FIcPsJdMFVkGH1HM560ifLqfa3NYGfd8
	TScqYU/Hfjpt1EqOyhTdaN8H3yLNQQFLJXHwQ8=
X-Google-Smtp-Source: AGHT+IEfLDQrP170Qc4q9M4zePV3MW7AWq7dhrtVAc1ItMH1LGKFf0fIpDtK3ckoAPTmdy0vH1x7nPqvyNRfE2gngVU=
X-Received: by 2002:a05:690e:1516:b0:5f3:316d:1ced with SMTP id
 956f58d0204a3-60175b8f7f0mr1376772d50.12.1756940591728; Wed, 03 Sep 2025
 16:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754412086.git.steve@sakoman.com> <4d5093e5103016c08b3a32fd83b1ec9edd87cd5a.1754412086.git.steve@sakoman.com>
 <2fb2bcfc-0bac-4d26-a78f-838084bd67b0@vaisala.com> <CAOSpxdYz3okwSRDHpHRwRWqZExsqw5LPJZfwL8qWcjm5hta-zw@mail.gmail.com>
 <AS1PR10MB5697FC66C6C3C1C167364CA9FD04A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB5697CC0999EE0944C8E64F88FD01A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697CC0999EE0944C8E64F88FD01A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 3 Sep 2025 16:03:01 -0700
X-Gm-Features: Ac12FXw7QxB9OW1grVeO6EWpmCXgEbbIWHS8_a_cs5jpZfnYMMeBdwNim0VyYwo
Message-ID: <CAOSpxdaJn=6v6ZSc1Na27HH-WkZ4-04PkhD7wFxhZLe-em0szA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 2/4] sqlite3: patch CVE-2025-7458
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Niko Mauno <niko.mauno@vaisala.com>
Content-Type: multipart/alternative; boundary="000000000000dc9e5a063ded9be8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 23:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222886

--000000000000dc9e5a063ded9be8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025, 3:34=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.com>=
 wrote:

> I have looked at the problem and reverting was the correct action.
> Trying to identify missing patch I realized that the CVE does not affect
> our version,
> so I'd have to backport additional patches which would first introduce th=
e
> CVE and then fix it
>


Thanks for investigating!

Steve


> Sorry for this inconvenience.
>
> Peter
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1)
> > Sent: Sunday, August 31, 2025 23:12
> > To: Steve Sakoman <steve@sakoman.com>
> > Cc: openembedded-core@lists.openembedded.org; Niko Mauno
> > <niko.mauno@vaisala.com>
> > Subject: RE: [OE-core][kirkstone 2/4] sqlite3: patch CVE-2025-7458
> >
> >
> >
> > > -----Original Message-----
> > > From: Steve Sakoman <steve@sakoman.com>
> > > Sent: Friday, August 29, 2025 17:38
> > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > > Cc: openembedded-core@lists.openembedded.org; Niko Mauno
> > > <niko.mauno@vaisala.com>
> > > Subject: Re: [OE-core][kirkstone 2/4] sqlite3: patch CVE-2025-7458
> > >
> > > On Fri, Aug 29, 2025 at 4:25=E2=80=AFAM Niko Mauno <niko.mauno@vaisal=
a.com>
> > wrote:
> > > >
> > > > We have found that since this patch SELECT queries with
> > > COUNT(DISTINCT(column)) seem to cause sqlite to segfault. E.g.
> > > >
> > > > # sqlite3 :memory: 'create table foo (x int); select
> count(distinct(x)) from foo;'
> > > > Segmentation fault (core dumped)
> > >
> > > Hi Peter,
> > >
> > > Could you check this to see if you can reproduce it?
> >
> > I'll be offline for next two weeks, please revert and I'll check it whe=
n
> I'm back.
> >
> > >
> > > If so, we should revert this patch.
> > >
> > > Steve
> > >
> > > > On 5.8.2025 19.43, Steve Sakoman via lists.openembedded.org wrote:
> > > > > From: Peter Marko <peter.marko@siemens.com>
> > > > >
> > > > > Pick patch [1] listed in [2].
> > > > > Also pick another patch which is precondition to this one
> introducing
> > > > > variable needed for the check.
> > > > >
> > > > > [1] https://sqlite.org/src/info/12ad822d9b827777
> > > > > [2] https://nvd.nist.gov/vuln/detail/CVE-2025-7458
> > > > >
> > > > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > > > ---
> > > > >   ...mpts-to-improve-the-detection-of-cov.patch | 91
> > +++++++++++++++++++
> > > > >   .../sqlite/files/CVE-2025-7458.patch          | 32 +++++++
> > > > >   meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  2 +
> > > > >   3 files changed, 125 insertions(+)
> > > > >   create mode 100644
> meta/recipes-support/sqlite/files/0001-This-branch-
> > > attempts-to-improve-the-detection-of-cov.patch
> > > > >   create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-
> > 7458.patch
> > > > >
> > > > > diff --git
> a/meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-
> > > improve-the-detection-of-cov.patch
> b/meta/recipes-support/sqlite/files/0001-
> > This-
> > > branch-attempts-to-improve-the-detection-of-cov.patch
> > > > > new file mode 100644
> > > > > index 0000000000..8fb037bb0f
> > > > > --- /dev/null
> > > > > +++
> b/meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-
> > > improve-the-detection-of-cov.patch
> > > > > @@ -0,0 +1,91 @@
> > > > > +From f55a7dad195994f2bb24db7df0a0515502386fe2 Mon Sep 17 00:00:0=
0
> > > 2001
> > > > > +From: drh <>
> > > > > +Date: Sat, 22 Oct 2022 14:16:02 +0000
> > > > > +Subject: [PATCH] This branch attempts to improve the detection o=
f
> > covering
> > > > > + indexes.  This first check-in merely improves a parameter name =
to
> > > > > + sqlite3WhereBegin() to be more descriptive of what it contains,
> and
> > ensures
> > > > > + that a subroutine is not inlines so that sqlite3WhereBegin()
> runs slightly
> > > > > + faster.
> > > > > +
> > > > > +FossilOrigin-Name:
> > > cadf5f6bb1ce0492ef858ada476288e8057afd3609caa18b09c818d3845d7244
> > > > > +
> > > > > +Upstream-Status: Backport
> > >
> > [
> https://github.com/sqlite/sqlite/commit/f55a7dad195994f2bb24db7df0a051550=
238
> > > 6fe2]
> > > > > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > > > +---
> > > > > + sqlite3.c | 28 +++++++++++++---------------
> > > > > + 1 file changed, 13 insertions(+), 15 deletions(-)
> > > > > +
> > > > > +diff --git a/sqlite3.c b/sqlite3.c
> > > > > +index 4cbc2d0..b7ed991 100644
> > > > > +--- a/sqlite3.c
> > > > > ++++ b/sqlite3.c
> > > > > +@@ -147371,9 +147371,7 @@ struct WhereInfo {
> > > > > +   ExprList *pOrderBy;       /* The ORDER BY clause or NULL */
> > > > > +   ExprList *pResultSet;     /* Result set of the query */
> > > > > +   Expr *pWhere;             /* The complete WHERE clause */
> > > > > +-#ifndef SQLITE_OMIT_VIRTUALTABLE
> > > > > +-  Select *pLimit;           /* Used to access LIMIT
> expr/registers for vtabs */
> > > > > +-#endif
> > > > > ++  Select *pSelect;          /* The entire SELECT statement
> containing
> > > WHERE */
> > > > > +   int aiCurOnePass[2];      /* OP_OpenWrite cursors for the
> ONEPASS opt
> > */
> > > > > +   int iContinue;            /* Jump here to continue with next
> record */
> > > > > +   int iBreak;               /* Jump here to break out of the
> loop */
> > > > > +@@ -149070,9 +149068,9 @@ SQLITE_PRIVATE Bitmask
> > > sqlite3WhereCodeOneLoopStart(
> > > > > +          && pLoop->u.vtab.bOmitOffset
> > > > > +         ){
> > > > > +           assert( pTerm->eOperator=3D=3DWO_AUX );
> > > > > +-          assert( pWInfo->pLimit!=3D0 );
> > > > > +-          assert( pWInfo->pLimit->iOffset>0 );
> > > > > +-          sqlite3VdbeAddOp2(v, OP_Integer, 0,
> pWInfo->pLimit->iOffset);
> > > > > ++          assert( pWInfo->pSelect!=3D0 );
> > > > > ++          assert( pWInfo->pSelect->iOffset>0 );
> > > > > ++          sqlite3VdbeAddOp2(v, OP_Integer, 0,
> pWInfo->pSelect->iOffset);
> > > > > +           VdbeComment((v,"Zero OFFSET counter"));
> > > > > +         }
> > > > > +       }
> > > > > +@@ -151830,10 +151828,10 @@ static void whereAddLimitExpr(
> > > > > + ** exist only so that they may be passed to the xBestIndex
> method of the
> > > > > + ** single virtual table in the FROM clause of the SELECT.
> > > > > + */
> > > > > +-SQLITE_PRIVATE void sqlite3WhereAddLimit(WhereClause *pWC,
> > Select
> > > *p){
> > > > > +-  assert( p=3D=3D0 || (p->pGroupBy=3D=3D0 && (p->selFlags &
> > SF_Aggregate)=3D=3D0)
> > > );
> > > > > +-  if( (p && p->pLimit)
> /* 1 */
> > > > > +-   && (p->selFlags & (SF_Distinct|SF_Aggregate))=3D=3D0
>  /* 2 */
> > > > > ++SQLITE_PRIVATE void SQLITE_NOINLINE
> > > sqlite3WhereAddLimit(WhereClause *pWC, Select *p){
> > > > > ++  assert( p!=3D0 && p->pLimit!=3D0 );                 /* 1 --
> checked by caller */
> > > > > ++  assert( p->pGroupBy=3D=3D0 && (p->selFlags & SF_Aggregate)=3D=
=3D0 );
> > > > > ++  if( (p->selFlags & (SF_Distinct|SF_Aggregate))=3D=3D0
>  /* 2 */
> > > > > +    && (p->pSrc->nSrc=3D=3D1 && IsVirtual(p->pSrc->a[0].pTab))
>  /* 3 */
> > > > > +   ){
> > > > > +     ExprList *pOrderBy =3D p->pOrderBy;
> > > > > +@@ -157427,7 +157425,7 @@ SQLITE_PRIVATE WhereInfo
> > > *sqlite3WhereBegin(
> > > > > +   Expr *pWhere,           /* The WHERE clause */
> > > > > +   ExprList *pOrderBy,     /* An ORDER BY (or GROUP BY) clause, =
or
> > NULL
> > > */
> > > > > +   ExprList *pResultSet,   /* Query result set.  Req'd for
> DISTINCT */
> > > > > +-  Select *pLimit,         /* Use this LIMIT/OFFSET clause, if
> any */
> > > > > ++  Select *pSelect,        /* The entire SELECT statement */
> > > > > +   u16 wctrlFlags,         /* The WHERE_* flags defined in
> sqliteInt.h */
> > > > > +   int iAuxArg             /* If WHERE_OR_SUBCLAUSE is set, inde=
x
> cursor
> > > number
> > > > > +                           ** If WHERE_USE_LIMIT, then the limit
> amount */
> > > > > +@@ -157504,9 +157502,7 @@ SQLITE_PRIVATE WhereInfo
> > > *sqlite3WhereBegin(
> > > > > +   pWInfo->wctrlFlags =3D wctrlFlags;
> > > > > +   pWInfo->iLimit =3D iAuxArg;
> > > > > +   pWInfo->savedNQueryLoop =3D pParse->nQueryLoop;
> > > > > +-#ifndef SQLITE_OMIT_VIRTUALTABLE
> > > > > +-  pWInfo->pLimit =3D pLimit;
> > > > > +-#endif
> > > > > ++  pWInfo->pSelect =3D pSelect;
> > > > > +   memset(&pWInfo->nOBSat, 0,
> > > > > +          offsetof(WhereInfo,sWC) - offsetof(WhereInfo,nOBSat));
> > > > > +   memset(&pWInfo->a[0], 0,
> > > sizeof(WhereLoop)+nTabList*sizeof(WhereLevel));
> > > > > +@@ -157575,7 +157571,9 @@ SQLITE_PRIVATE WhereInfo
> > > *sqlite3WhereBegin(
> > > > > +
> > > > > +   /* Analyze all of the subexpressions. */
> > > > > +   sqlite3WhereExprAnalyze(pTabList, &pWInfo->sWC);
> > > > > +-  sqlite3WhereAddLimit(&pWInfo->sWC, pLimit);
> > > > > ++  if( pSelect && pSelect->pLimit ){
> > > > > ++    sqlite3WhereAddLimit(&pWInfo->sWC, pSelect);
> > > > > ++  }
> > > > > +   if( db->mallocFailed ) goto whereBeginError;
> > > > > +
> > > > > +   /* Special case: WHERE terms that do not refer to any tables
> in the join
> > > > > diff --git a/meta/recipes-support/sqlite/files/CVE-2025-7458.patc=
h
> > > b/meta/recipes-support/sqlite/files/CVE-2025-7458.patch
> > > > > new file mode 100644
> > > > > index 0000000000..6b041d9332
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-support/sqlite/files/CVE-2025-7458.patch
> > > > > @@ -0,0 +1,32 @@
> > > > > +From b816ca9994e03a8bc829b49452b8158a731e81a9 Mon Sep 17
> > 00:00:00
> > > 2001
> > > > > +From: drh <>
> > > > > +Date: Thu, 16 Mar 2023 20:54:29 +0000
> > > > > +Subject: [PATCH] Correctly handle SELECT DISTINCT ... ORDER BY
> > when
> > > all of the
> > > > > + result set terms are constant and there are more result set
> terms than
> > > ORDER
> > > > > + BY terms. Fix for these tickets: [c36cdb4afd504dc1],
> [4051a7f931d9ba24],
> > > > > + [d6fd512f50513ab7].
> > > > > +
> > > > > +FossilOrigin-Name:
> > > 12ad822d9b827777526ca5ed5bf3e678d600294fc9b5c25482dfff2a021328a4
> > > > > +
> > > > > +CVE: CVE-2025-7458
> > > > > +Upstream-Status: Backport
> > >
> > [
> github.com/sqlite/sqlite/commit/b816ca9994e03a8bc829b49452b8158a731e81a9]
> > > > > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > > > +---
> > > > > + sqlite3.c | 4 ++++
> > > > > + 1 file changed, 4 insertions(+)
> > > > > +
> > > > > +diff --git a/sqlite3.c b/sqlite3.c
> > > > > +index 19d0438..6d92184 100644
> > > > > +--- a/sqlite3.c
> > > > > ++++ b/sqlite3.c
> > > > > +@@ -156989,6 +156989,10 @@ static int wherePathSolver(WhereInfo
> > > *pWInfo, LogEst nRowEst){
> > > > > +       if( pFrom->isOrdered=3D=3DpWInfo->pOrderBy->nExpr ){
> > > > > +         pWInfo->eDistinct =3D WHERE_DISTINCT_ORDERED;
> > > > > +       }
> > > > > ++      if( pWInfo->pSelect->pOrderBy
> > > > > ++       && pWInfo->nOBSat > pWInfo->pSelect->pOrderBy->nExpr ){
> > > > > ++        pWInfo->nOBSat =3D pWInfo->pSelect->pOrderBy->nExpr;
> > > > > ++      }
> > > > > +     }else{
> > > > > +       pWInfo->nOBSat =3D pFrom->isOrdered;
> > > > > +       pWInfo->revMask =3D pFrom->revLoop;
> > > > > diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> b/meta/recipes-
> > > support/sqlite/sqlite3_3.38.5.bb
> > > > > index 656e2d8bd8..86d9b4b33b 100644
> > > > > --- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> > > > > +++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> > > > > @@ -10,6 +10,8 @@ SRC_URI =3D "http://www.sqlite.org/2022/sqlite-
> > autoconf-
> > > ${SQLITE_PV}.tar.gz \
> > > > >              file://CVE-2023-7104.patch \
> > > > >              file://CVE-2025-29088.patch \
> > > > >              file://CVE-2025-6965.patch \
> > > > > +
>  file://0001-This-branch-attempts-to-improve-the-detection-of-
> > > cov.patch \
> > > > > +           file://CVE-2025-7458.patch \
> > > > >              "
> > > > >   SRC_URI[sha256sum] =3D
> > > "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#221481):
> > > https://lists.openembedded.org/g/openembedded-core/message/221481
> > > > > Mute This Topic:
> https://lists.openembedded.org/mt/114551672/3618471
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub
> > > [niko.mauno@vaisala.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >
> > > >
>

--000000000000dc9e5a063ded9be8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Sep 3, 2025, 3:34=E2=80=AFPM Marko, Peter &lt;=
<a href=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank" rel=3D"norefer=
rer">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">I have looked at the problem and reverting was the correct action.=
<br>
Trying to identify missing patch I realized that the CVE does not affect ou=
r version,<br>
so I&#39;d have to backport additional patches which would first introduce =
the CVE and then fix it<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for investigating=
!=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Steve</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
Sorry for this inconvenience.<br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Marko, Peter (FT D EU SK BFS1)<br>
&gt; Sent: Sunday, August 31, 2025 23:12<br>
&gt; To: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" rel=3D=
"noreferrer noreferrer" target=3D"_blank">openembedded-core@lists.openembed=
ded.org</a>; Niko Mauno<br>
&gt; &lt;<a href=3D"mailto:niko.mauno@vaisala.com" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
&gt; Subject: RE: [OE-core][kirkstone 2/4] sqlite3: patch CVE-2025-7458<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt; &gt; Sent: Friday, August 29, 2025 17:38<br>
&gt; &gt; To: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Ma=
rko@siemens.com" rel=3D"noreferrer noreferrer" target=3D"_blank">Peter.Mark=
o@siemens.com</a>&gt;<br>
&gt; &gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" r=
el=3D"noreferrer noreferrer" target=3D"_blank">openembedded-core@lists.open=
embedded.org</a>; Niko Mauno<br>
&gt; &gt; &lt;<a href=3D"mailto:niko.mauno@vaisala.com" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">niko.mauno@vaisala.com</a>&gt;<br>
&gt; &gt; Subject: Re: [OE-core][kirkstone 2/4] sqlite3: patch CVE-2025-745=
8<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Aug 29, 2025 at 4:25=E2=80=AFAM Niko Mauno &lt;<a href=3D=
"mailto:niko.mauno@vaisala.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">niko.mauno@vaisala.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We have found that since this patch SELECT queries with<br>
&gt; &gt; COUNT(DISTINCT(column)) seem to cause sqlite to segfault. E.g.<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; # sqlite3 :memory: &#39;create table foo (x int); select cou=
nt(distinct(x)) from foo;&#39;<br>
&gt; &gt; &gt; Segmentation fault (core dumped)<br>
&gt; &gt;<br>
&gt; &gt; Hi Peter,<br>
&gt; &gt;<br>
&gt; &gt; Could you check this to see if you can reproduce it?<br>
&gt; <br>
&gt; I&#39;ll be offline for next two weeks, please revert and I&#39;ll che=
ck it when I&#39;m back.<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; If so, we should revert this patch.<br>
&gt; &gt;<br>
&gt; &gt; Steve<br>
&gt; &gt;<br>
&gt; &gt; &gt; On 5.8.2025 19.43, Steve Sakoman via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; &gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@sie=
mens.com" rel=3D"noreferrer noreferrer" target=3D"_blank">peter.marko@sieme=
ns.com</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Pick patch [1] listed in [2].<br>
&gt; &gt; &gt; &gt; Also pick another patch which is precondition to this o=
ne introducing<br>
&gt; &gt; &gt; &gt; variable needed for the check.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; [1] <a href=3D"https://sqlite.org/src/info/12ad822d9b82=
7777" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://sq=
lite.org/src/info/12ad822d9b827777</a><br>
&gt; &gt; &gt; &gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-202=
5-7458" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://=
nvd.nist.gov/vuln/detail/CVE-2025-7458</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.=
marko@siemens.com" rel=3D"noreferrer noreferrer" target=3D"_blank">peter.ma=
rko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:stev=
e@sakoman.com" rel=3D"noreferrer noreferrer" target=3D"_blank">steve@sakoma=
n.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0...mpts-to-improve-the-detection-of-cov.pat=
ch | 91<br>
&gt; +++++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0.../sqlite/files/CVE-2025-7458.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 +++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0meta/recipes-support/sqlite/<a href=3D"http=
://sqlite3_3.38.5.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_b=
lank">sqlite3_3.38.5.bb</a> |=C2=A0 2 +<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A03 files changed, 125 insertions(+)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/sql=
ite/files/0001-This-branch-<br>
&gt; &gt; attempts-to-improve-the-detection-of-cov.patch<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-support/sql=
ite/files/CVE-2025-<br>
&gt; 7458.patch<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-support/sqlite/files/0001-Thi=
s-branch-attempts-to-<br>
&gt; &gt; improve-the-detection-of-cov.patch b/meta/recipes-support/sqlite/=
files/0001-<br>
&gt; This-<br>
&gt; &gt; branch-attempts-to-improve-the-detection-of-cov.patch<br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000000..8fb037bb0f<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-support/sqlite/files/0001-This-branc=
h-attempts-to-<br>
&gt; &gt; improve-the-detection-of-cov.patch<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,91 @@<br>
&gt; &gt; &gt; &gt; +From f55a7dad195994f2bb24db7df0a0515502386fe2 Mon Sep =
17 00:00:00<br>
&gt; &gt; 2001<br>
&gt; &gt; &gt; &gt; +From: drh &lt;&gt;<br>
&gt; &gt; &gt; &gt; +Date: Sat, 22 Oct 2022 14:16:02 +0000<br>
&gt; &gt; &gt; &gt; +Subject: [PATCH] This branch attempts to improve the d=
etection of<br>
&gt; covering<br>
&gt; &gt; &gt; &gt; + indexes.=C2=A0 This first check-in merely improves a =
parameter name to<br>
&gt; &gt; &gt; &gt; + sqlite3WhereBegin() to be more descriptive of what it=
 contains, and<br>
&gt; ensures<br>
&gt; &gt; &gt; &gt; + that a subroutine is not inlines so that sqlite3Where=
Begin() runs slightly<br>
&gt; &gt; &gt; &gt; + faster.<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +FossilOrigin-Name:<br>
&gt; &gt; cadf5f6bb1ce0492ef858ada476288e8057afd3609caa18b09c818d3845d7244<=
br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +Upstream-Status: Backport<br>
&gt; &gt;<br>
&gt; [<a href=3D"https://github.com/sqlite/sqlite/commit/f55a7dad195994f2bb=
24db7df0a051550238" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bla=
nk">https://github.com/sqlite/sqlite/commit/f55a7dad195994f2bb24db7df0a0515=
50238</a><br>
&gt; &gt; 6fe2]<br>
&gt; &gt; &gt; &gt; +Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter=
.marko@siemens.com" rel=3D"noreferrer noreferrer" target=3D"_blank">peter.m=
arko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; &gt; +---<br>
&gt; &gt; &gt; &gt; + sqlite3.c | 28 +++++++++++++---------------<br>
&gt; &gt; &gt; &gt; + 1 file changed, 13 insertions(+), 15 deletions(-)<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +diff --git a/sqlite3.c b/sqlite3.c<br>
&gt; &gt; &gt; &gt; +index 4cbc2d0..b7ed991 100644<br>
&gt; &gt; &gt; &gt; +--- a/sqlite3.c<br>
&gt; &gt; &gt; &gt; ++++ b/sqlite3.c<br>
&gt; &gt; &gt; &gt; +@@ -147371,9 +147371,7 @@ struct WhereInfo {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ExprList *pOrderBy;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* The ORDER BY clause or NULL */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ExprList *pResultSet;=C2=A0 =C2=A0 =C2=A0=
/* Result set of the query */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0Expr *pWhere;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* The complete WHERE clause */<br>
&gt; &gt; &gt; &gt; +-#ifndef SQLITE_OMIT_VIRTUALTABLE<br>
&gt; &gt; &gt; &gt; +-=C2=A0 Select *pLimit;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Used to access LIMIT expr/registers for vtabs */<br>
&gt; &gt; &gt; &gt; +-#endif<br>
&gt; &gt; &gt; &gt; ++=C2=A0 Select *pSelect;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* The entire SELECT statement containing<br>
&gt; &gt; WHERE */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0int aiCurOnePass[2];=C2=A0 =C2=A0 =C2=A0 =
/* OP_OpenWrite cursors for the ONEPASS opt<br>
&gt; */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0int iContinue;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* Jump here to continue with next record */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0int iBreak;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Jump here to break out of the loop */<br>
&gt; &gt; &gt; &gt; +@@ -149070,9 +149068,9 @@ SQLITE_PRIVATE Bitmask<br>
&gt; &gt; sqlite3WhereCodeOneLoopStart(<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; pLoop-&g=
t;u.vtab.bOmitOffset<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0){<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert( pTerm=
-&gt;eOperator=3D=3DWO_AUX );<br>
&gt; &gt; &gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert( pWInfo-&gt=
;pLimit!=3D0 );<br>
&gt; &gt; &gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert( pWInfo-&gt=
;pLimit-&gt;iOffset&gt;0 );<br>
&gt; &gt; &gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3VdbeAddOp2(=
v, OP_Integer, 0, pWInfo-&gt;pLimit-&gt;iOffset);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert( pWInfo-&gt=
;pSelect!=3D0 );<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert( pWInfo-&gt=
;pSelect-&gt;iOffset&gt;0 );<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3VdbeAddOp2(=
v, OP_Integer, 0, pWInfo-&gt;pSelect-&gt;iOffset);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VdbeComment((=
v,&quot;Zero OFFSET counter&quot;));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; +@@ -151830,10 +151828,10 @@ static void whereAddLimitE=
xpr(<br>
&gt; &gt; &gt; &gt; + ** exist only so that they may be passed to the xBest=
Index method of the<br>
&gt; &gt; &gt; &gt; + ** single virtual table in the FROM clause of the SEL=
ECT.<br>
&gt; &gt; &gt; &gt; + */<br>
&gt; &gt; &gt; &gt; +-SQLITE_PRIVATE void sqlite3WhereAddLimit(WhereClause =
*pWC,<br>
&gt; Select<br>
&gt; &gt; *p){<br>
&gt; &gt; &gt; &gt; +-=C2=A0 assert( p=3D=3D0 || (p-&gt;pGroupBy=3D=3D0 &am=
p;&amp; (p-&gt;selFlags &amp;<br>
&gt; SF_Aggregate)=3D=3D0)<br>
&gt; &gt; );<br>
&gt; &gt; &gt; &gt; +-=C2=A0 if( (p &amp;&amp; p-&gt;pLimit)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 1 */<br>
&gt; &gt; &gt; &gt; +-=C2=A0 =C2=A0&amp;&amp; (p-&gt;selFlags &amp; (SF_Dis=
tinct|SF_Aggregate))=3D=3D0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* 2 */<br>
&gt; &gt; &gt; &gt; ++SQLITE_PRIVATE void SQLITE_NOINLINE<br>
&gt; &gt; sqlite3WhereAddLimit(WhereClause *pWC, Select *p){<br>
&gt; &gt; &gt; &gt; ++=C2=A0 assert( p!=3D0 &amp;&amp; p-&gt;pLimit!=3D0 );=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1 -- check=
ed by caller */<br>
&gt; &gt; &gt; &gt; ++=C2=A0 assert( p-&gt;pGroupBy=3D=3D0 &amp;&amp; (p-&g=
t;selFlags &amp; SF_Aggregate)=3D=3D0 );<br>
&gt; &gt; &gt; &gt; ++=C2=A0 if( (p-&gt;selFlags &amp; (SF_Distinct|SF_Aggr=
egate))=3D=3D0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2 */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 &amp;&amp; (p-&gt;pSrc-&gt;nSrc=3D=3D1 &=
amp;&amp; IsVirtual(p-&gt;pSrc-&gt;a[0].pTab))=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 3 */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0){<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ExprList *pOrderBy =3D p-&gt;pOrde=
rBy;<br>
&gt; &gt; &gt; &gt; +@@ -157427,7 +157425,7 @@ SQLITE_PRIVATE WhereInfo<br>
&gt; &gt; *sqlite3WhereBegin(<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0Expr *pWhere,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* The WHERE clause */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ExprList *pOrderBy,=C2=A0 =C2=A0 =C2=A0/*=
 An ORDER BY (or GROUP BY) clause, or<br>
&gt; NULL<br>
&gt; &gt; */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0ExprList *pResultSet,=C2=A0 =C2=A0/* Quer=
y result set.=C2=A0 Req&#39;d for DISTINCT */<br>
&gt; &gt; &gt; &gt; +-=C2=A0 Select *pLimit,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Use this LIMIT/OFFSET clause, if any */<br>
&gt; &gt; &gt; &gt; ++=C2=A0 Select *pSelect,=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 The entire SELECT statement */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0u16 wctrlFlags,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* The WHERE_* flags defined in sqliteInt.h */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0int iAuxArg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* If WHERE_OR_SUBCLAUSE is set, index cursor<br>
&gt; &gt; number<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0** If WHERE_USE_LIMIT, then th=
e limit amount */<br>
&gt; &gt; &gt; &gt; +@@ -157504,9 +157502,7 @@ SQLITE_PRIVATE WhereInfo<br>
&gt; &gt; *sqlite3WhereBegin(<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0pWInfo-&gt;wctrlFlags =3D wctrlFlags;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0pWInfo-&gt;iLimit =3D iAuxArg;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0pWInfo-&gt;savedNQueryLoop =3D pParse-&gt=
;nQueryLoop;<br>
&gt; &gt; &gt; &gt; +-#ifndef SQLITE_OMIT_VIRTUALTABLE<br>
&gt; &gt; &gt; &gt; +-=C2=A0 pWInfo-&gt;pLimit =3D pLimit;<br>
&gt; &gt; &gt; &gt; +-#endif<br>
&gt; &gt; &gt; &gt; ++=C2=A0 pWInfo-&gt;pSelect =3D pSelect;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0memset(&amp;pWInfo-&gt;nOBSat, 0,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offsetof(WhereInfo,=
sWC) - offsetof(WhereInfo,nOBSat));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0memset(&amp;pWInfo-&gt;a[0], 0,<br>
&gt; &gt; sizeof(WhereLoop)+nTabList*sizeof(WhereLevel));<br>
&gt; &gt; &gt; &gt; +@@ -157575,7 +157571,9 @@ SQLITE_PRIVATE WhereInfo<br>
&gt; &gt; *sqlite3WhereBegin(<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0/* Analyze all of the subexpressions. */<=
br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0sqlite3WhereExprAnalyze(pTabList, &amp;pW=
Info-&gt;sWC);<br>
&gt; &gt; &gt; &gt; +-=C2=A0 sqlite3WhereAddLimit(&amp;pWInfo-&gt;sWC, pLim=
it);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 if( pSelect &amp;&amp; pSelect-&gt;pLimit ){<b=
r>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 sqlite3WhereAddLimit(&amp;pWInfo-&gt;sW=
C, pSelect);<br>
&gt; &gt; &gt; &gt; ++=C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0if( db-&gt;mallocFailed ) goto whereBegin=
Error;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0/* Special case: WHERE terms that do not =
refer to any tables in the join<br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-support/sqlite/files/CVE-2025=
-7458.patch<br>
&gt; &gt; b/meta/recipes-support/sqlite/files/CVE-2025-7458.patch<br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000000..6b041d9332<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-support/sqlite/files/CVE-2025-7458.p=
atch<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,32 @@<br>
&gt; &gt; &gt; &gt; +From b816ca9994e03a8bc829b49452b8158a731e81a9 Mon Sep =
17<br>
&gt; 00:00:00<br>
&gt; &gt; 2001<br>
&gt; &gt; &gt; &gt; +From: drh &lt;&gt;<br>
&gt; &gt; &gt; &gt; +Date: Thu, 16 Mar 2023 20:54:29 +0000<br>
&gt; &gt; &gt; &gt; +Subject: [PATCH] Correctly handle SELECT DISTINCT ... =
ORDER BY<br>
&gt; when<br>
&gt; &gt; all of the<br>
&gt; &gt; &gt; &gt; + result set terms are constant and there are more resu=
lt set terms than<br>
&gt; &gt; ORDER<br>
&gt; &gt; &gt; &gt; + BY terms. Fix for these tickets: [c36cdb4afd504dc1], =
[4051a7f931d9ba24],<br>
&gt; &gt; &gt; &gt; + [d6fd512f50513ab7].<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +FossilOrigin-Name:<br>
&gt; &gt; 12ad822d9b827777526ca5ed5bf3e678d600294fc9b5c25482dfff2a021328a4<=
br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +CVE: CVE-2025-7458<br>
&gt; &gt; &gt; &gt; +Upstream-Status: Backport<br>
&gt; &gt;<br>
&gt; [<a href=3D"http://github.com/sqlite/sqlite/commit/b816ca9994e03a8bc82=
9b49452b8158a731e81a9" rel=3D"noreferrer noreferrer noreferrer" target=3D"_=
blank">github.com/sqlite/sqlite/commit/b816ca9994e03a8bc829b49452b8158a731e=
81a9</a>]<br>
&gt; &gt; &gt; &gt; +Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter=
.marko@siemens.com" rel=3D"noreferrer noreferrer" target=3D"_blank">peter.m=
arko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; &gt; +---<br>
&gt; &gt; &gt; &gt; + sqlite3.c | 4 ++++<br>
&gt; &gt; &gt; &gt; + 1 file changed, 4 insertions(+)<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +diff --git a/sqlite3.c b/sqlite3.c<br>
&gt; &gt; &gt; &gt; +index 19d0438..6d92184 100644<br>
&gt; &gt; &gt; &gt; +--- a/sqlite3.c<br>
&gt; &gt; &gt; &gt; ++++ b/sqlite3.c<br>
&gt; &gt; &gt; &gt; +@@ -156989,6 +156989,10 @@ static int wherePathSolver(=
WhereInfo<br>
&gt; &gt; *pWInfo, LogEst nRowEst){<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if( pFrom-&gt;isOrdered=3D=
=3DpWInfo-&gt;pOrderBy-&gt;nExpr ){<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pWInfo-&gt;eDistinct=
 =3D WHERE_DISTINCT_ORDERED;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 if( pWInfo-&gt;pSelect-&gt;pOrde=
rBy<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; pWInfo-&gt;nOBS=
at &gt; pWInfo-&gt;pSelect-&gt;pOrderBy-&gt;nExpr ){<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pWInfo-&gt;nOBSat =3D pWI=
nfo-&gt;pSelect-&gt;pOrderBy-&gt;nExpr;<br>
&gt; &gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}else{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pWInfo-&gt;nOBSat =3D pFrom=
-&gt;isOrdered;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pWInfo-&gt;revMask =3D pFro=
m-&gt;revLoop;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-support/sqlite/<a href=3D"htt=
p://sqlite3_3.38.5.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_=
blank">sqlite3_3.38.5.bb</a> b/meta/recipes-<br>
&gt; &gt; support/sqlite/<a href=3D"http://sqlite3_3.38.5.bb" rel=3D"norefe=
rrer noreferrer noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</a><br>
&gt; &gt; &gt; &gt; index 656e2d8bd8..86d9b4b33b 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/recipes-support/sqlite/<a href=3D"http://sql=
ite3_3.38.5.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">=
sqlite3_3.38.5.bb</a><br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-support/sqlite/<a href=3D"http://sql=
ite3_3.38.5.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">=
sqlite3_3.38.5.bb</a><br>
&gt; &gt; &gt; &gt; @@ -10,6 +10,8 @@ SRC_URI =3D &quot;<a href=3D"http://w=
ww.sqlite.org/2022/sqlite-" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">http://www.sqlite.org/2022/sqlite-</a><br>
&gt; autoconf-<br>
&gt; &gt; ${SQLITE_PV}.tar.gz \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://=
CVE-2023-7104.patch \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://=
CVE-2025-29088.patch \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://=
CVE-2025-6965.patch \<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-T=
his-branch-attempts-to-improve-the-detection-of-<br>
&gt; &gt; cov.patch \<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-20=
25-7458.patch \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<=
br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D<br>
&gt; &gt; &quot;5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e3=
9869c&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; &gt; &gt; View/Reply Online (#221481):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/221481" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">htt=
ps://lists.openembedded.org/g/openembedded-core/message/221481</a><br>
&gt; &gt; &gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.=
org/mt/114551672/3618471" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/mt/114551672/3618471</a><br>
&gt; &gt; &gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowne=
r@lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">o=
penembedded-core+owner@lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/=
g/openembedded-core/unsub" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/unsub</a><br=
>
&gt; &gt; [<a href=3D"mailto:niko.mauno@vaisala.com" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">niko.mauno@vaisala.com</a>]<br>
&gt; &gt; &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
</blockquote></div></div></div>

--000000000000dc9e5a063ded9be8--

