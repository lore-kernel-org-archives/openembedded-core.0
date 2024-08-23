Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B64BC5321E
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 21:33:01 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.1618.1724448773669302957
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 14:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iAZh248s;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6c0e22218d0so27690337b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 14:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724448773; x=1725053573; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLf0eZ3zx2wI0co2OofR1aswiVGFq8RkLN/MeLD0YdI=;
        b=iAZh248sgkAkQGPAiD60anstUYxvnD1rC2cClwWHiKfqZi9laK4+MhxlqDn9KuBgEg
         MzQ4oNh7zURFMotMVByMG8JiY1U9Bo+wBi4pO0QwKi0hBjLWvq43gKsxcc6f+D2p+NuW
         Ox4YnXRl737vPXXNZehkpU6C2sqaMTcvR2tPiLIiOVxd9y1Wq3KyMbsT9L9L+PwCug4n
         uvJNx4yuDe9aC19nscty3WeW93bcmmTKqwwOH9dLJXKSTRZDTTAzHHOrEbkEkwL3PN7p
         VYFy7YK81aC0jEzz6pE/ZdkP0AaXNa9utOV34hMPhJ6LMkSCeRuxVm1ujPtAbZ7/bvyS
         oauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724448773; x=1725053573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLf0eZ3zx2wI0co2OofR1aswiVGFq8RkLN/MeLD0YdI=;
        b=XPdrI42WMAYMuJ8ptfUt3T/duWXesYRycDRj3afyhRtDvjpo/dP+nrZpvWP6+6S6Ps
         VRKUDAJtdfNWPvpzJ1FBjLiM5iA086/nKjOPk//md0zyyj1J8APrIDcRPbFXIS60YsjA
         7hFVWRmexpzjj2oxZDyUIlKSXNerUWXvUlBbDdL089eWsMyKK6+ygwHQcNVTIjDKID5/
         SRHQUOeVWWIbF99WGUqTMBN/Z6SXfbQWMNHrkasDDp6r9fyrauw2nvgA9S+FfLBT1kow
         LtMJ/MX44DLXKTWQypxCt3jvr/An/4Q5CMWzhbsR1l0t/Xf2+oQUg+TWr/CRr0aPcDZA
         YwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsYBv0x/pBiGH6Ls/Yoy2rqH9LRkuMui4XQHvKMSv7g2Ak68RQKUVbIrjFXA+VO9dxakoc07mUZXjO2VdK+iMPpg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/MUcAIYM3ORTrXLDDX+hCMXOQ7+CchCFp5UshhhavDP1wcK50
	K3KYUSeDcm7q/UhAFepbLzOggmx+0Kj641HKBee9M5lASy+hkri+cOtlpzuQEqHM2RlqulQSDsg
	iyijxLYUMnKxQH80gx2tQ3AN88bzIzxt41h6GzA==
X-Google-Smtp-Source: AGHT+IGIvGFVrCCJivyiJpRGTZRzLfWLe5AIb0JKN7I0vTSnXVOTaueEHqx9qzI0K1p1tb8fiv9Qva+82Ud0BWm5uIo=
X-Received: by 2002:a05:690c:450f:b0:6b2:6cd4:7f94 with SMTP id
 00721157ae682-6c629065707mr39686067b3.43.1724448772484; Fri, 23 Aug 2024
 14:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240823054217.167765-1-nikhilr5@kpit.com> <17EE5C7CC26EDD44.23723@lists.openembedded.org>
In-Reply-To: <17EE5C7CC26EDD44.23723@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 23 Aug 2024 14:32:41 -0700
Message-ID: <CAOSpxdY-ET522OWs+A+=8OABrnGJsqUGhpKBP4Eb4M0D9izHnQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v4] expat: fix CVE-2023-52425
To: steve@sakoman.com
Cc: nikhil.r@kpit.com, openembedded-core@lists.openembedded.org, 
	bindudaniel1996@gmail.com, Bindu Bhabu <bhabu.bindu@kpit.com>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 21:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203707

On Fri, Aug 23, 2024 at 5:49=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> Something is still broken in the way you are generating or sending this p=
atch:
>
> Applying: expat: fix CVE-2023-52425
> Using index info to reconstruct a base tree...
> error: patch failed: meta/recipes-core/expat/expat_2.5.0.bb:22
> error: meta/recipes-core/expat/expat_2.5.0.bb: patch does not apply
> error: Did you hand edit your patch?
> It does not apply to blobs recorded in its index.
> Patch failed at 0001 expat: fix CVE-2023-52425
>
> It seems that something has changed the tabs in the expat_2.5.0.bb
> context lines in your patch to spaces.
>
> I've fixed this manually, but you will need to track down what is
> going on for future patch submissions since I really can't take the
> time to fix this sort of thing.

Unfortunately I can't take this patch since it is causing ptest
failures (same as the original version of the patch):

AssertionError: Failed ptests:
{'expat': ['test_return_ns_triplet',
           'test_column_number_after_parse',
           'test_default_current']}

Steve

> On Thu, Aug 22, 2024 at 10:45=E2=80=AFPM Nikhil via lists.openembedded.or=
g
> <nikhil.r=3Dkpit.com@lists.openembedded.org> wrote:
> >
> > libexpat through 2.5.0 allows a denial of service
> > (resource consumption) because many full reparsings
> > are required in the case of a large token for which
> > multiple buffer fills are needed.
> >
> > References:
> > https://security-tracker.debian.org/tracker/CVE-2023-52425
> > https://ubuntu.com/security/CVE-2023-52425
> > https://packages.ubuntu.com/mantic/expat
> > https://github.com/libexpat/libexpat/pull/789
> > https://launchpad.net/ubuntu/+source/expat/2.5.0-2ubuntu0.1
> >
> > Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
> > ---
> >  .../expat/expat/CVE-2023-52425.patch          | 581 ++++++++++++++++++
> >  meta/recipes-core/expat/expat_2.5.0.bb        |   1 +
> >  2 files changed, 582 insertions(+)
> >  create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425.patch
> >
> > diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425.patch b/meta/=
recipes-core/expat/expat/CVE-2023-52425.patch
> > new file mode 100644
> > index 0000000000..1434bb6f52
> > --- /dev/null
> > +++ b/meta/recipes-core/expat/expat/CVE-2023-52425.patch
> > @@ -0,0 +1,581 @@
> > +Backport of https://github.com/libexpat/libexpat/pull/789
> > +
> > +From 9cdf9b8d77d5c2c2a27d15fb68dd3f83cafb45a1 Mon Sep 17 00:00:00 2001
> > +From: Snild Dolkow <snild@sony.com>
> > +Date: Thu, 17 Aug 2023 16:25:26 +0200
> > +Subject: [PATCH] Skip parsing after repeated partials on the same toke=
n
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +When the parse buffer contains the starting bytes of a token but not
> > +all of them, we cannot parse the token to completion. We call this a
> > +partial token.  When this happens, the parse position is reset to the
> > +start of the token, and the parse() call returns. The client is then
> > +expected to provide more data and call parse() again.
> > +
> > +In extreme cases, this means that the bytes of a token may be parsed
> > +many times: once for every buffer refill required before the full toke=
n
> > +is present in the buffer.
> > +
> > +Math:
> > +  Assume there's a token of T bytes
> > +  Assume the client fills the buffer in chunks of X bytes
> > +  We'll try to parse X, 2X, 3X, 4X ... until mX =3D=3D T (technically =
>=3D)
> > +  That's (m=C3=82=C2=B2+m)X/2 =3D (T=C3=82=C2=B2/X+T)/2 bytes parsed (=
arithmetic progression)
> > +  While it is alleviated by larger refills, this amounts to O(T=C3=82=
=C2=B2)
> > +
> > +Expat grows its internal buffer by doubling it when necessary, but has
> > +no way to inform the client about how much space is available. Instead=
,
> > +we add a heuristic that skips parsing when we've repeatedly stopped on
> > +an incomplete token. Specifically:
> > +
> > + * Only try to parse if we have a certain amount of data buffered
> > + * Every time we stop on an incomplete token, double the threshold
> > + * As soon as any token completes, the threshold is reset
> > +
> > +This means that when we get stuck on an incomplete token, the threshol=
d
> > +grows exponentially, effectively making the client perform larger buff=
er
> > +fills, limiting how many times we can end up re-parsing the same bytes=
.
> > +
> > +Math:
> > +  Assume there's a token of T bytes
> > +  Assume the client fills the buffer in chunks of X bytes
> > +  We'll try to parse X, 2X, 4X, 8X ... until (2^k)X =3D=3D T (or large=
r)
> > +  That's (2^(k+1)-1)X bytes parsed -- e.g. 15X if T =3D 8X
> > +  This is equal to 2T-X, which amounts to O(T)
> > +
> > +We could've chosen a faster growth rate, e.g. 4 or 8. Those seem to
> > +increase performance further, at the cost of further increasing the
> > +risk of growing the buffer more than necessary. This can easily be
> > +adjusted in the future, if desired.
> > +
> > +This is all completely transparent to the client, except for:
> > +1. possible delay of some callbacks (when our heuristic overshoots)
> > +2. apps that never do isFinal=3DXML_TRUE could miss data at the end
> > +
> > +For the affected testdata, this change shows a 100-400x speedup.
> > +The recset.xml benchmark shows no clear change either way.
> > +
> > +Before:
> > +benchmark -n ../testdata/largefiles/recset.xml 65535 3
> > +  3 loops, with buffer size 65535. Average time per loop: 0.270223
> > +benchmark -n ../testdata/largefiles/aaaaaa_attr.xml 4096 3
> > +  3 loops, with buffer size 4096. Average time per loop: 15.033048
> > +benchmark -n ../testdata/largefiles/aaaaaa_cdata.xml 4096 3
> > +  3 loops, with buffer size 4096. Average time per loop: 0.018027
> > +benchmark -n ../testdata/largefiles/aaaaaa_comment.xml 4096 3
> > +  3 loops, with buffer size 4096. Average time per loop: 11.775362
> > +benchmark -n ../testdata/largefiles/aaaaaa_tag.xml 4096 3
> > +  3 loops, with buffer size 4096. Average time per loop: 11.711414
> > +benchmark -n ../testdata/largefiles/aaaaaa_text.xml 4096 3
> > +  3 loops, with buffer size 4096. Average time per loop: 0.019362
> > +
> > +After:
> > +./run.sh benchmark -n ../testdata/largefiles/recset.xml 65535 3
> > +  3 loops, with buffer size 65535. Average time per loop: 0.269030
> > +./run.sh benchmark -n ../testdata/largefiles/aaaaaa_attr.xml 4096 3
> > +  3 loops, with buffer size 4096. Average time per loop: 0.044794
> > +./run.sh benchmark -n ../testdata/largefiles/aaaaaa_cdata.xml 4096 3
> > +  3 loops, with buffer size 4096. Average time per loop: 0.016377
> > +./run.sh benchmark -n ../testdata/largefiles/aaaaaa_comment.xml 4096 3
> > +  3 loops, with buffer size 4096. Average time per loop: 0.027022
> > +./run.sh benchmark -n ../testdata/largefiles/aaaaaa_tag.xml 4096 3
> > +  3 loops, with buffer size 4096. Average time per loop: 0.099360
> > +./run.sh benchmark -n ../testdata/largefiles/aaaaaa_text.xml 4096 3
> > +  3 loops, with buffer size 4096. Average time per loop: 0.017956
> > +
> > +CVE: CVE-2023-52425
> > +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/7=
89]
> > +Comments: Hunks refreshed.
> > +          Patch difference/summary has also been modified.
> > +Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> > +
> > +---
> > + lib/expat.h            | 5   +++++
> > + lib/libexpat.def.cmake | 2   ++
> > + lib/xmlparse.c         | 228 ++++++++++++++++++++++++++++++++++++++++=
++----------------------------------
> > + xmlwf/xmlwf.c          | 20  ++++++++++++++++++++
> > + xmlwf/xmlwf_helpgen.py | 4   ++++
> > + 5 files changed, 156 insertions(+), 103 deletions(-)
> > +
> > +--- a/lib/expat.h
> > ++++ b/lib/expat.h
> > +@@ -16,6 +16,7 @@
> > +    Copyright (c) 2016      Thomas Beutlich <tc@tbeu.de>
> > +    Copyright (c) 2017      Rhodri James <rhodri@wildebeest.org.uk>
> > +    Copyright (c) 2022      Thijs Schreijer <thijs@thijsschreijer.nl>
> > ++   Copyright (c) 2023      Sony Corporation / Snild Dolkow <snild@son=
y.com>
> > +    Licensed under the MIT license:
> > +
> > +    Permission is  hereby granted,  free of charge,  to any  person ob=
taining
> > +@@ -1050,6 +1051,10 @@ XML_SetBillionLaughsAttackProtectionActi
> > +     XML_Parser parser, unsigned long long activationThresholdBytes);
> > + #endif
> > +
> > ++/* Added in Expat 2.6.0. */
> > ++XMLPARSEAPI(XML_Bool)
> > ++XML_SetReparseDeferralEnabled(XML_Parser parser, XML_Bool enabled);
> > ++
> > + /* Expat follows the semantic versioning convention.
> > +    See http://semver.org.
> > + */
> > +--- a/lib/libexpat.def.cmake
> > ++++ b/lib/libexpat.def.cmake
> > +@@ -77,3 +77,5 @@ EXPORTS
> > + ; added with version 2.4.0
> > + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetBillionLaughsAttackProtectionActiva=
tionThreshold @69
> > + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetBillionLaughsAttackProtectionMaximu=
mAmplification @70
> > ++; added with version 2.6.0
> > ++  XML_SetReparseDeferralEnabled @71
> > +--- a/lib/xmlparse.c
> > ++++ b/lib/xmlparse.c
> > +@@ -36,6 +36,7 @@
> > +    Copyright (c) 2022      Samanta Navarro <ferivoz@riseup.net>
> > +    Copyright (c) 2022      Jeffrey Walton <noloader@gmail.com>
> > +    Copyright (c) 2022      Jann Horn <jannh@google.com>
> > ++   Copyright (c) 2023      Sony Corporation / Snild Dolkow <snild@son=
y.com>
> > +    Licensed under the MIT license:
> > +
> > +    Permission is  hereby granted,  free of charge,  to any  person ob=
taining
> > +@@ -73,6 +74,7 @@
> > + #  endif
> > + #endif
> > +
> > ++#include <stdbool.h>
> > + #include <stddef.h>
> > + #include <string.h> /* memset(), memcpy() */
> > + #include <assert.h>
> > +@@ -196,6 +198,8 @@ typedef char ICHAR;
> > + /* Do safe (NULL-aware) pointer arithmetic */
> > + #define EXPAT_SAFE_PTR_DIFF(p, q) (((p) && (q)) ? ((p) - (q)) : 0)
> > +
> > ++#define EXPAT_MIN(a, b) (((a) < (b)) ? (a) : (b))
> > ++
> > + #include "internal.h"
> > + #include "xmltok.h"
> > + #include "xmlrole.h"
> > +@@ -617,6 +621,9 @@ struct XML_ParserStruct {
> > +   const char *m_bufferLim;
> > +   XML_Index m_parseEndByteIndex;
> > +   const char *m_parseEndPtr;
> > ++  size_t m_partialTokenBytesBefore; /* used in heuristic to avoid O(n=
^2) */
> > ++  XML_Bool m_reparseDeferralEnabled;
> > ++  int m_lastBufferRequestSize;
> > +   XML_Char *m_dataBuf;
> > +   XML_Char *m_dataBufEnd;
> > +   XML_StartElementHandler m_startElementHandler;
> > +@@ -948,6 +955,46 @@ get_hash_secret_salt(XML_Parser parser)
> > +   return parser->m_hash_secret_salt;
> > + }
> > +
> > ++static enum XML_Error
> > ++callProcessor(XML_Parser parser, const char *start, const char *end,
> > ++              const char **endPtr) {
> > ++  const size_t have_now =3D EXPAT_SAFE_PTR_DIFF(end, start);
> > ++
> > ++  if (parser->m_reparseDeferralEnabled
> > ++      && ! parser->m_parsingStatus.finalBuffer) {
> > ++    // Heuristic: don't try to parse a partial token again until the =
amount of
> > ++    // available data has increased significantly.
> > ++    const size_t had_before =3D parser->m_partialTokenBytesBefore;
> > ++    // ...but *do* try anyway if we're close to causing a reallocatio=
n.
> > ++    size_t available_buffer
> > ++        =3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferPtr, parser->m_buffer=
);
> > ++#if XML_CONTEXT_BYTES > 0
> > ++    available_buffer -=3D EXPAT_MIN(available_buffer, XML_CONTEXT_BYT=
ES);
> > ++#endif
> > ++    available_buffer
> > ++        +=3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_buffe=
rEnd);
> > ++    // m_lastBufferRequestSize is never assigned a value < 0, so the =
cast is ok
> > ++    const bool enough
> > ++        =3D (have_now >=3D 2 * had_before)
> > ++          || ((size_t)parser->m_lastBufferRequestSize > available_buf=
fer);
> > ++
> > ++    if (! enough) {
> > ++      *endPtr =3D start; // callers may expect this to be set
> > ++      return XML_ERROR_NONE;
> > ++    }
> > ++  }
> > ++  const enum XML_Error ret =3D parser->m_processor(parser, start, end=
, endPtr);
> > ++  if (ret =3D=3D XML_ERROR_NONE) {
> > ++    // if we consumed nothing, remember what we had on this parse att=
empt.
> > ++    if (*endPtr =3D=3D start) {
> > ++      parser->m_partialTokenBytesBefore =3D have_now;
> > ++    } else {
> > ++      parser->m_partialTokenBytesBefore =3D 0;
> > ++    }
> > ++  }
> > ++  return ret;
> > ++}
> > ++
> > + static XML_Bool /* only valid for root parser */
> > + startParsing(XML_Parser parser) {
> > +   /* hash functions must be initialized before setContext() is called=
 */
> > +@@ -1129,6 +1176,9 @@ parserInit(XML_Parser parser, const XML_
> > +   parser->m_bufferEnd =3D parser->m_buffer;
> > +   parser->m_parseEndByteIndex =3D 0;
> > +   parser->m_parseEndPtr =3D NULL;
> > ++  parser->m_partialTokenBytesBefore =3D 0;
> > ++  parser->m_reparseDeferralEnabled =3D XML_TRUE;
> > ++  parser->m_lastBufferRequestSize =3D 0;
> > +   parser->m_declElementType =3D NULL;
> > +   parser->m_declAttributeId =3D NULL;
> > +   parser->m_declEntity =3D NULL;
> > +@@ -1298,6 +1348,7 @@ XML_ExternalEntityParserCreate(XML_Parse
> > +      to worry which hash secrets each table has.
> > +   */
> > +   unsigned long oldhash_secret_salt;
> > ++  XML_Bool oldReparseDeferralEnabled;
> > +
> > +   /* Validate the oldParser parameter before we pull everything out o=
f it */
> > +   if (oldParser =3D=3D NULL)
> > +@@ -1342,6 +1393,7 @@ XML_ExternalEntityParserCreate(XML_Parse
> > +      to worry which hash secrets each table has.
> > +   */
> > +   oldhash_secret_salt =3D parser->m_hash_secret_salt;
> > ++  oldReparseDeferralEnabled =3D parser->m_reparseDeferralEnabled;
> > +
> > + #ifdef XML_DTD
> > +   if (! context)
> > +@@ -1394,6 +1446,7 @@ XML_ExternalEntityParserCreate(XML_Parse
> > +   parser->m_defaultExpandInternalEntities =3D oldDefaultExpandInterna=
lEntities;
> > +   parser->m_ns_triplets =3D oldns_triplets;
> > +   parser->m_hash_secret_salt =3D oldhash_secret_salt;
> > ++  parser->m_reparseDeferralEnabled =3D oldReparseDeferralEnabled;
> > +   parser->m_parentParser =3D oldParser;
> > + #ifdef XML_DTD
> > +   parser->m_paramEntityParsing =3D oldParamEntityParsing;
> > +@@ -1848,55 +1901,8 @@ XML_Parse(XML_Parser parser, const char
> > +     parser->m_parsingStatus.parsing =3D XML_PARSING;
> > +   }
> > +
> > +-  if (len =3D=3D 0) {
> > +-    parser->m_parsingStatus.finalBuffer =3D (XML_Bool)isFinal;
> > +-    if (! isFinal)
> > +-      return XML_STATUS_OK;
> > +-    parser->m_positionPtr =3D parser->m_bufferPtr;
> > +-    parser->m_parseEndPtr =3D parser->m_bufferEnd;
> > +-
> > +-    /* If data are left over from last buffer, and we now know that t=
hese
> > +-       data are the final chunk of input, then we have to check them =
again
> > +-       to detect errors based on that fact.
> > +-    */
> > +-    parser->m_errorCode
> > +-        =3D parser->m_processor(parser, parser->m_bufferPtr,
> > +-                              parser->m_parseEndPtr, &parser->m_buffe=
rPtr);
> > +-
> > +-    if (parser->m_errorCode =3D=3D XML_ERROR_NONE) {
> > +-      switch (parser->m_parsingStatus.parsing) {
> > +-      case XML_SUSPENDED:
> > +-        /* It is hard to be certain, but it seems that this case
> > +-         * cannot occur.  This code is cleaning up a previous parse
> > +-         * with no new data (since len =3D=3D 0).  Changing the parsi=
ng
> > +-         * state requires getting to execute a handler function, and
> > +-         * there doesn't seem to be an opportunity for that while in
> > +-         * this circumstance.
> > +-         *
> > +-         * Given the uncertainty, we retain the code but exclude it
> > +-         * from coverage tests.
> > +-         *
> > +-         * LCOV_EXCL_START
> > +-         */
> > +-        XmlUpdatePosition(parser->m_encoding, parser->m_positionPtr,
> > +-                          parser->m_bufferPtr, &parser->m_position);
> > +-        parser->m_positionPtr =3D parser->m_bufferPtr;
> > +-        return XML_STATUS_SUSPENDED;
> > +-        /* LCOV_EXCL_STOP */
> > +-      case XML_INITIALIZED:
> > +-      case XML_PARSING:
> > +-        parser->m_parsingStatus.parsing =3D XML_FINISHED;
> > +-        /* fall through */
> > +-      default:
> > +-        return XML_STATUS_OK;
> > +-      }
> > +-    }
> > +-    parser->m_eventEndPtr =3D parser->m_eventPtr;
> > +-    parser->m_processor =3D errorProcessor;
> > +-    return XML_STATUS_ERROR;
> > +-  }
> > +-#ifndef XML_CONTEXT_BYTES
> > +-  else if (parser->m_bufferPtr =3D=3D parser->m_bufferEnd) {
> > ++#if XML_CONTEXT_BYTES =3D=3D 0
> > ++  if (parser->m_bufferPtr =3D=3D parser->m_bufferEnd) {
> > +     const char *end;
> > +     int nLeftOver;
> > +     enum XML_Status result;
> > +@@ -1907,12 +1913,15 @@ XML_Parse(XML_Parser parser, const char
> > +       parser->m_processor =3D errorProcessor;
> > +       return XML_STATUS_ERROR;
> > +     }
> > ++    // though this isn't a buffer request, we assume that `len` is th=
e app's
> > ++    // preferred buffer fill size, and therefore save it here.
> > ++    parser->m_lastBufferRequestSize =3D len;
> > +     parser->m_parseEndByteIndex +=3D len;
> > +     parser->m_positionPtr =3D s;
> > +     parser->m_parsingStatus.finalBuffer =3D (XML_Bool)isFinal;
> > +
> > +     parser->m_errorCode
> > +-        =3D parser->m_processor(parser, s, parser->m_parseEndPtr =3D =
s + len, &end);
> > ++        =3D callProcessor(parser, s, parser->m_parseEndPtr =3D s + le=
n, &end);
> > +
> > +     if (parser->m_errorCode !=3D XML_ERROR_NONE) {
> > +       parser->m_eventEndPtr =3D parser->m_eventPtr;
> > +@@ -1939,23 +1948,25 @@ XML_Parse(XML_Parser parser, const char
> > +                       &parser->m_position);
> > +     nLeftOver =3D s + len - end;
> > +     if (nLeftOver) {
> > +-      if (parser->m_buffer =3D=3D NULL
> > +-          || nLeftOver > parser->m_bufferLim - parser->m_buffer) {
> > +-        /* avoid _signed_ integer overflow */
> > +-        char *temp =3D NULL;
> > +-        const int bytesToAllocate =3D (int)((unsigned)len * 2U);
> > +-        if (bytesToAllocate > 0) {
> > +-          temp =3D (char *)REALLOC(parser, parser->m_buffer, bytesToA=
llocate);
> > +-        }
> > +-        if (temp =3D=3D NULL) {
> > +-          parser->m_errorCode =3D XML_ERROR_NO_MEMORY;
> > +-          parser->m_eventPtr =3D parser->m_eventEndPtr =3D NULL;
> > +-          parser->m_processor =3D errorProcessor;
> > +-          return XML_STATUS_ERROR;
> > +-        }
> > +-        parser->m_buffer =3D temp;
> > +-        parser->m_bufferLim =3D parser->m_buffer + bytesToAllocate;
> > ++      // Back up and restore the parsing status to avoid XML_ERROR_SU=
SPENDED
> > ++      // (and XML_ERROR_FINISHED) from XML_GetBuffer.
> > ++      const enum XML_Parsing originalStatus =3D parser->m_parsingStat=
us.parsing;
> > ++      parser->m_parsingStatus.parsing =3D XML_PARSING;
> > ++      void *const temp =3D XML_GetBuffer(parser, nLeftOver);
> > ++      parser->m_parsingStatus.parsing =3D originalStatus;
> > ++      // GetBuffer may have overwritten this, but we want to remember=
 what the
> > ++      // app requested, not how many bytes were left over after parsi=
ng.
> > ++      parser->m_lastBufferRequestSize =3D len;
> > ++      if (temp =3D=3D NULL) {
> > ++        // NOTE: parser->m_errorCode has already been set by XML_GetB=
uffer().
> > ++        parser->m_eventPtr =3D parser->m_eventEndPtr =3D NULL;
> > ++        parser->m_processor =3D errorProcessor;
> > ++        return XML_STATUS_ERROR;
> > +       }
> > ++      // Since we know that the buffer was empty and XML_CONTEXT_BYTE=
S is 0, we
> > ++      // don't have any data to preserve, and can copy straight into =
the start
> > ++      // of the buffer rather than the GetBuffer return pointer (whic=
h may be
> > ++      // pointing further into the allocated buffer).
> > +       memcpy(parser->m_buffer, end, nLeftOver);
> > +     }
> > +     parser->m_bufferPtr =3D parser->m_buffer;
> > +@@ -1966,16 +1977,15 @@ XML_Parse(XML_Parser parser, const char
> > +     parser->m_eventEndPtr =3D parser->m_bufferPtr;
> > +     return result;
> > +   }
> > +-#endif /* not defined XML_CONTEXT_BYTES */
> > +-  else {
> > +-    void *buff =3D XML_GetBuffer(parser, len);
> > +-    if (buff =3D=3D NULL)
> > +-      return XML_STATUS_ERROR;
> > +-    else {
> > +-      memcpy(buff, s, len);
> > +-      return XML_ParseBuffer(parser, len, isFinal);
> > +-    }
> > ++#endif /* XML_CONTEXT_BYTES =3D=3D 0 */
> > ++  void *buff =3D XML_GetBuffer(parser, len);
> > ++  if (buff =3D=3D NULL)
> > ++    return XML_STATUS_ERROR;
> > ++  if (len > 0) {
> > ++    assert(s !=3D NULL); // make sure s=3D=3DNULL && len!=3D0 was rej=
ected above
> > ++    memcpy(buff, s, len);
> > +   }
> > ++  return XML_ParseBuffer(parser, len, isFinal);
> > + }
> > +
> > + enum XML_Status XMLCALL
> > +@@ -2015,8 +2025,8 @@ XML_ParseBuffer(XML_Parser parser, int l
> > +   parser->m_parseEndByteIndex +=3D len;
> > +   parser->m_parsingStatus.finalBuffer =3D (XML_Bool)isFinal;
> > +
> > +-  parser->m_errorCode =3D parser->m_processor(
> > +-      parser, start, parser->m_parseEndPtr, &parser->m_bufferPtr);
> > ++  parser->m_errorCode =3D callProcessor(parser, start, parser->m_pars=
eEndPtr,
> > ++                                      &parser->m_bufferPtr);
> > +
> > +   if (parser->m_errorCode !=3D XML_ERROR_NONE) {
> > +     parser->m_eventEndPtr =3D parser->m_eventPtr;
> > +@@ -2061,8 +2071,12 @@ XML_GetBuffer(XML_Parser parser, int len
> > +   default:;
> > +   }
> > +
> > +-  if (len > EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_buffer=
End)) {
> > +-#ifdef XML_CONTEXT_BYTES
> > ++  // whether or not the request succeeds, `len` seems to be the app's=
 preferred
> > ++  // buffer fill size; remember it.
> > ++  parser->m_lastBufferRequestSize =3D len;
> > ++  if (len > EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_buffer=
End)
> > ++      || parser->m_buffer =3D=3D NULL) {
> > ++#if XML_CONTEXT_BYTES > 0
> > +     int keep;
> > + #endif /* defined XML_CONTEXT_BYTES */
> > +     /* Do not invoke signed arithmetic overflow: */
> > +@@ -2083,10 +2097,11 @@ XML_GetBuffer(XML_Parser parser, int len
> > +       return NULL;
> > +     }
> > +     neededSize +=3D keep;
> > +-#endif /* defined XML_CONTEXT_BYTES */
> > +-    if (neededSize
> > +-        <=3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_buffe=
r)) {
> > +-#ifdef XML_CONTEXT_BYTES
> > ++#endif /* XML_CONTEXT_BYTES > 0 */
> > ++    if (parser->m_buffer && parser->m_bufferPtr
> > ++        && neededSize
> > ++               <=3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->=
m_buffer)) {
> > ++#if XML_CONTEXT_BYTES > 0
> > +       if (keep < EXPAT_SAFE_PTR_DIFF(parser->m_bufferPtr, parser->m_b=
uffer)) {
> > +         int offset
> > +             =3D (int)EXPAT_SAFE_PTR_DIFF(parser->m_bufferPtr, parser-=
>m_buffer)
> > +@@ -2099,19 +2114,17 @@ XML_GetBuffer(XML_Parser parser, int len
> > +         parser->m_bufferPtr -=3D offset;
> > +       }
> > + #else
> > +-      if (parser->m_buffer && parser->m_bufferPtr) {
> > +-        memmove(parser->m_buffer, parser->m_bufferPtr,
> > +-                EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_bu=
fferPtr));
> > +-        parser->m_bufferEnd
> > +-            =3D parser->m_buffer
> > +-              + EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_bu=
fferPtr);
> > +-        parser->m_bufferPtr =3D parser->m_buffer;
> > +-      }
> > +-#endif /* not defined XML_CONTEXT_BYTES */
> > ++      memmove(parser->m_buffer, parser->m_bufferPtr,
> > ++              EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_buff=
erPtr));
> > ++      parser->m_bufferEnd
> > ++          =3D parser->m_buffer
> > ++            + EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_buff=
erPtr);
> > ++      parser->m_bufferPtr =3D parser->m_buffer;
> > ++#endif /* XML_CONTEXT_BYTES > 0 */
> > +     } else {
> > +       char *newBuf;
> > +       int bufferSize
> > +-          =3D (int)EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m=
_bufferPtr);
> > ++          =3D (int)EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m=
_buffer);
> > +       if (bufferSize =3D=3D 0)
> > +         bufferSize =3D INIT_BUFFER_SIZE;
> > +       do {
> > +@@ -2208,7 +2221,7 @@ XML_ResumeParser(XML_Parser parser) {
> > +   }
> > +   parser->m_parsingStatus.parsing =3D XML_PARSING;
> > +
> > +-  parser->m_errorCode =3D parser->m_processor(
> > ++  parser->m_errorCode =3D callProcessor(
> > +       parser, parser->m_bufferPtr, parser->m_parseEndPtr, &parser->m_=
bufferPtr);
> > +
> > +   if (parser->m_errorCode !=3D XML_ERROR_NONE) {
> > +@@ -2576,6 +2576,15 @@ XML_SetBillionLaughsAttackProtectionActi
> > + }
> > + #endif /* XML_GE =3D=3D 1 */
> > +
> > ++XML_Bool XMLCALL
> > ++XML_SetReparseDeferralEnabled(XML_Parser parser, XML_Bool enabled) {
> > ++  if (parser !=3D NULL && (enabled =3D=3D XML_TRUE || enabled =3D=3D =
XML_FALSE)) {
> > ++    parser->m_reparseDeferralEnabled =3D enabled;
> > ++    return XML_TRUE;
> > ++  }
> > ++  return XML_FALSE;
> > ++}
> > ++
> > + /* Initially tag->rawName always points into the parse buffer;
> > +    for those TAG instances opened while the current parse buffer was
> > +    processed, and not yet closed, we need to store tag->rawName in a =
more
> > +@@ -4497,15 +4506,15 @@ entityValueInitProcessor(XML_Parser pars
> > +       parser->m_processor =3D entityValueProcessor;
> > +       return entityValueProcessor(parser, next, end, nextPtr);
> > +     }
> > +-    /* If we are at the end of the buffer, this would cause XmlProlog=
Tok to
> > +-       return XML_TOK_NONE on the next call, which would then cause t=
he
> > +-       function to exit with *nextPtr set to s - that is what we want=
 for other
> > +-       tokens, but not for the BOM - we would rather like to skip it;
> > +-       then, when this routine is entered the next time, XmlPrologTok=
 will
> > +-       return XML_TOK_INVALID, since the BOM is still in the buffer
> > ++    /* XmlPrologTok has now set the encoding based on the BOM it foun=
d, and we
> > ++       must move s and nextPtr forward to consume the BOM.
> > ++
> > ++       If we didn't, and got XML_TOK_NONE from the next XmlPrologTok =
call, we
> > ++       would leave the BOM in the buffer and return. On the next call=
 to this
> > ++       function, our XmlPrologTok call would return XML_TOK_INVALID, =
since it
> > ++       is not valid to have multiple BOMs.
> > +     */
> > +-    else if (tok =3D=3D XML_TOK_BOM && next =3D=3D end
> > +-             && ! parser->m_parsingStatus.finalBuffer) {
> > ++    else if (tok =3D=3D XML_TOK_BOM) {
> > + #  if XML_GE =3D=3D 1
> > +       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > +                                     XML_ACCOUNT_DIRECT)) {
> > +@@ -4500,7 +4522,7 @@ entityValueInitProcessor(XML_Parser pars
> > + #  endif
> > +
> > +       *nextPtr =3D next;
> > +-      return XML_ERROR_NONE;
> > ++      s =3D next;
> > +     }
> > +     /* If we get this token, we have the start of what might be a
> > +        normal tag, but not a declaration (i.e. it doesn't begin with
> > +--- a/xmlwf/xmlwf.c
> > ++++ b/xmlwf/xmlwf.c
> > +@@ -914,6 +914,9 @@ usage(const XML_Char *prog, int rc) {
> > +       T("  -a FACTOR     set maximum tolerated [a]mplification factor=
 (default: 100.0)\n")
> > +       T("  -b BYTES      set number of output [b]ytes needed to activ=
ate (default: 8 MiB)\n")
> > +       T("\n")
> > ++      T("reparse deferral:\n")
> > ++      T("  -q             disable reparse deferral, and allow [q]uadr=
atic parse runtime with large tokens\n")
> > ++      T("\n")
> > +       T("info arguments:\n")
> > +       T("  -h            show this [h]elp message and exit\n")
> > +       T("  -v            show program's [v]ersion number and exit\n")
> > +@@ -967,6 +970,8 @@ tmain(int argc, XML_Char **argv) {
> > +   unsigned long long attackThresholdBytes;
> > +   XML_Bool attackThresholdGiven =3D XML_FALSE;
> > +
> > ++  XML_Bool disableDeferral =3D XML_FALSE;
> > ++
> > +   int exitCode =3D XMLWF_EXIT_SUCCESS;
> > +   enum XML_ParamEntityParsing paramEntityParsing
> > +       =3D XML_PARAM_ENTITY_PARSING_NEVER;
> > +@@ -1089,6 +1094,11 @@ tmain(int argc, XML_Char **argv) {
> > + #endif
> > +       break;
> > +     }
> > ++    case T('q'): {
> > ++      disableDeferral =3D XML_TRUE;
> > ++      j++;
> > ++      break;
> > ++    }
> > +     case T('\0'):
> > +       if (j > 1) {
> > +         i++;
> > +@@ -1134,6 +1144,16 @@ tmain(int argc, XML_Char **argv) {
> > + #endif
> > +     }
> > +
> > ++    if (disableDeferral) {
> > ++      const XML_Bool success =3D XML_SetReparseDeferralEnabled(parser=
, XML_FALSE);
> > ++      if (! success) {
> > ++        // This prevents tperror(..) from reporting misleading "[..]:=
 Success"
> > ++        errno =3D EINVAL;
> > ++        tperror(T("Failed to disable reparse deferral"));
> > ++        exit(XMLWF_EXIT_INTERNAL_ERROR);
> > ++      }
> > ++    }
> > ++
> > +     if (requireStandalone)
> > +       XML_SetNotStandaloneHandler(parser, notStandalone);
> > +     XML_SetParamEntityParsing(parser, paramEntityParsing);
> > +--- a/xmlwf/xmlwf_helpgen.py
> > ++++ b/xmlwf/xmlwf_helpgen.py
> > +@@ -81,6 +81,10 @@ billion_laughs.add_argument('-a', metava
> > +                             help=3D'set maximum tolerated [a]mplifica=
tion factor (default: 100.0)')
> > + billion_laughs.add_argument('-b', metavar=3D'BYTES', help=3D'set numb=
er of output [b]ytes needed to activate (default: 8 MiB)')
> > +
> > ++reparse_deferral =3D parser.add_argument_group('reparse deferral')
> > ++reparse_deferral.add_argument('-q', metavar=3D'FACTOR',
> > ++                            help=3D'disable reparse deferral, and all=
ow [q]uadratic parse runtime with large tokens')
> > ++
> > + parser.add_argument('files', metavar=3D'FILE', nargs=3D'*', help=3D'f=
ile to process (default: STDIN)')
> > +
> > + info =3D parser.add_argument_group('info arguments')
> > diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core=
/expat/expat_2.5.0.bb
> > index 31e989cfe2..09bc7a0a0b 100644
> > --- a/meta/recipes-core/expat/expat_2.5.0.bb
> > +++ b/meta/recipes-core/expat/expat_2.5.0.bb
> > @@ -22,6 +22,7 @@ SRC_URI =3D "https://github.com/libexpat/libexpat/rel=
eases/download/R_${VERSION_TA
> >            file://CVE-2023-52426-009.patch \
> >            file://CVE-2023-52426-010.patch \
> >            file://CVE-2023-52426-011.patch \
> > +           file://CVE-2023-52425.patch \
> >             "
> >
> >  UPSTREAM_CHECK_URI =3D "https://github.com/libexpat/libexpat/releases/=
"
> > --
> > 2.25.1
> >
> > This message contains information that may be privileged or confidentia=
l and is the property of the KPIT Technologies Ltd. It is intended only for=
 the person to whom it is addressed. If you are not the intended recipient,=
 you are not authorized to read, print, retain copy, disseminate, distribut=
e, or use this message or any part thereof. If you receive this message in =
error, please notify the sender immediately and delete all copies of this m=
essage. KPIT Technologies Ltd. does not accept any liability for virus infe=
cted mails.
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203686): https://lists.openembedded.org/g/openembedde=
d-core/message/203686
> Mute This Topic: https://lists.openembedded.org/mt/108051712/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

