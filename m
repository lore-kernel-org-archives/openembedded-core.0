Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624EFC54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 12:27:58 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web10.7349.1710246472707754623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 05:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EQZKG7Fk;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: rwmacleod@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4d35666c4bcso1050894e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710246472; x=1710851272; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vlP/DUo2AlPt66FwM/g3GjonDJygkL/5Kd1HCdHVYCQ=;
        b=EQZKG7FkXwfuDLXK2I1W9IDq+yXREo9lgoseO133UxhmCy8veDf7tUkHsUjvkgYpqf
         OkpyPk0fADdwhFvGb91t+EgbccmaiRF0bjn1+S+vvcXk3SsSENRUwdzAcDH8fRyqf33P
         YteShyPMPuzdbbNDIpbCVtw7v4VjEahG4k01O2veQoUt75OC55Ru2/PjWFL5iuZsTJGv
         /ZR15V4yQD34jQw8QbsYZbTI+GXbw08PFyHCmhLoH29WXTbtuysJoWT3shZjpevY3MOW
         yo8TBeKups2bB/gZizJM+jaK+5K0p+MFC1mE1bgwn84vfay3P5I1VmNdGUysgDFA7nF/
         FJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710246472; x=1710851272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlP/DUo2AlPt66FwM/g3GjonDJygkL/5Kd1HCdHVYCQ=;
        b=LlLKHNr94n1FyaD6ioiNUC54LjnI/OQogWX0MlBAUoBEkAoIyLAFzgiASUe5xYsRLS
         hjPlraEG0ShrOeb2xubUaehO1hXrKrbKyZAF2LULVu+DDnRruMExje4c4lqgug05ArJF
         I/nRWVSjy2NvMHfo9579HxqiVVSrk6GWehK/wGjxks5VWE5tGT9EFv7Nuy9Z9pzVt9F2
         oQlqVVpRHaaPH6M5xQsFfGkm3jCOLvJ3EmzvtTRZPa7arc55C4Fmhzqd657ysX0QkXLK
         OZuctXqiJhFt8hi+h/7U8ZMGJbzbyoO+qkJd4cFZMCxGYlyGbYQdZ6TwhfAFQ0DeG67C
         1y/A==
X-Forwarded-Encrypted: i=1; AJvYcCWrelHnMKiz/R1B0eohTi+VxyGaukHhMOHkXHBTS11lexmi7Wvoxn6wkeMFa9dW5AWxybtr7k4UXTmyNEZPataqpU/LpJ6TTz/AkkgGBAj8n5PIlopy+8w2
X-Gm-Message-State: AOJu0Yxrao9hcGrnH9wk6o8uxVXZxOG5ubw1pp1xQO6br3w9xpQh2/Fv
	8gX6KSPDL43czHTfCYCeUQWq/xCkcXtyL0cV2iD5rW2ZI2Q7j9PqlUh3f9b+3/Dml67267oKUzr
	NmnrCRMuKx9+11cXzH2Y/tYprBx4=
X-Google-Smtp-Source: AGHT+IEktNUaJ6UYtggfP03DQbDtezkPkFIEsMlLgGTW00LJPPUmEjARm2Fl6OKOTX+JlOoeQhmn0dMl6miZmLSzOr0=
X-Received: by 2002:a1f:7cc4:0:b0:4d4:be1:8196 with SMTP id
 x187-20020a1f7cc4000000b004d40be18196mr406799vkc.11.1710246471561; Tue, 12
 Mar 2024 05:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240308000807.1078261-1-meenali.gupta@windriver.com>
 <61c8e841e7ddb19af71838d171967220977867c9.camel@intel.com> <BY1PR11MB800540D49D0C29C3ADE8794BE52B2@BY1PR11MB8005.namprd11.prod.outlook.com>
In-Reply-To: <BY1PR11MB800540D49D0C29C3ADE8794BE52B2@BY1PR11MB8005.namprd11.prod.outlook.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Tue, 12 Mar 2024 08:27:41 -0400
Message-ID: <CAK6=ix6XCRspoP=Qoe2grQ1qsHvEtqk_n=u-X3Eo93-f1+q81Q@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] expat: fix CVE-2023-52426
To: meenali.gupta@windriver.com
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="0000000000006a797e061375c92e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 12:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196976

--0000000000006a797e061375c92e
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 12, 2024, 03:58 Meenali Gupta via lists.openembedded.org
<meenali.gupta=windriver.com@lists.openembedded.org> wrote:

> Hi Anuj,
>
> I have sent the upgrade to 2.6.0 , it includes the complete security fix
> for CVE-2023-52426 and CVE-2023-52425.
>

Unfortunately that update changes the so version number, so it isn't
acceptable for kirkstone.


  #775 #776  Version info bumped from 9:10:8 (libexpat*.so.1.8.10)
                    to 10:0:9 (libexpat*.so.1.9.0); see https://verbump.de/
                    for what these numbers do


I think you will have to carefully back-port the two CVE fixes.

It looks like Debian devs may have already  back-ported at least one of
these CVs to version 2.5.0-x

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1063238

Thanks,

../Randy


> Regards
> Meenali
> ------------------------------
> *From:* Mittal, Anuj <anuj.mittal@intel.com>
> *Sent:* 11 March 2024 08:37
> *To:* Gupta, Meenali <Meenali.Gupta@windriver.com>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [oe-core][kirkstone][PATCH 1/1] expat: fix CVE-2023-52426
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and
> know the content is safe.
>
> On Thu, 2024-03-07 at 16:08 -0800, Meenali Gupta via
> lists.openembedded.org wrote:
> > From: Meenali Gupta <meenali.gupta@windriver.com>
> >
> > A flaw was found in Expat (libexpat). If XML_DTD is undefined at
> > compile time, a recursive XML Entity
> > Expansion condition can be triggered. This issue may lead to a
> > condition where data is expanded exponentially,
> > which will quickly consume system resources and cause a denial of
> > service.
> >
> > Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> > ---
> >  .../expat/expat/CVE-2023-52426.patch          | 429
> > ++++++++++++++++++
> >  meta/recipes-core/expat/expat_2.5.0.bb        |   1 +
> >  2 files changed, 430 insertions(+)
> >  create mode 100644 meta/recipes-core/expat/expat/CVE-2023-
> > 52426.patch
> >
> > diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426.patch
> > b/meta/recipes-core/expat/expat/CVE-2023-52426.patch
> > new file mode 100644
> > index 0000000000..b78a8ee0dc
> > --- /dev/null
> > +++ b/meta/recipes-core/expat/expat/CVE-2023-52426.patch
> > @@ -0,0 +1,429 @@
> > +From 0f075ec8ecb5e43f8fdca5182f8cca4703da0404 Mon Sep 17 00:00:00
> > 2001
> > +From: Sebastian Pipping <sebastian@pipping.org>
> > +Date: Thu, 26 Oct 2023 00:43:22 +0200
> > +Subject: [PATCH] lib|xmlwf|cmake: Extend scope of billion laughs
> > attack
> > + protection
> > +
> > +.. from "defined(XML_DTD)" to "defined(XML_DTD) || XML_GE==1".
> > +
> > +CVE: CVE-2023-52426
> > +Upstream-Status: Backport
> > [https://github.com/libexpat/libexpat/commit/0f075ec8ecb5e43f8fdca518
> > 2f8cca4703da0404]
>
> The PR that this commit is part of includes other commits as well. Is
> there any reason why only this is included or required?
>
> I didn't check in detail but as an example, it seems this commit uses
> EXPAT_GE which was introduced in an earlier commit in that PR:
>
>
> https://github.com/libexpat/libexpat/pull/777/commits/daa89e42c005cc7f4f7af9eee271ae0723d30300
>
> So, is this supposed to work as intended?
>
> Thanks,
>
> Anuj
>
> > +
> > +Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> > +---
> > + CMakeLists.txt         |  8 ++++-
> > + lib/expat.h            |  8 +++--
> > + lib/internal.h         |  2 +-
> > + lib/libexpat.def.cmake |  4 +--
> > + lib/xmlparse.c         | 71 ++++++++++++++++++++++-----------------
> > ---
> > + xmlwf/xmlwf.c          | 18 ++++++-----
> > + 6 files changed, 62 insertions(+), 49 deletions(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 2b4c13c..183c5c2 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -381,7 +381,13 @@ if(EXPAT_SHARED_LIBS)
> > +             endif()
> > +         endmacro()
> > +
> > +-        _expat_def_file_toggle(EXPAT_DTD _EXPAT_COMMENT_DTD)
> > ++    if(EXPAT_DTD OR EXPAT_GE)
> > ++            set(_EXPAT_DTD_OR_GE TRUE)
> > ++        else()
> > ++            set(_EXPAT_DTD_OR_GE FALSE)
> > ++        endif()
> > ++
> > ++        _expat_def_file_toggle(_EXPAT_DTD_OR_GE
> > _EXPAT_COMMENT_DTD_OR_GE)
> > +         _expat_def_file_toggle(EXPAT_ATTR_INFO
> > _EXPAT_COMMENT_ATTR_INFO)
> > +
> > +
> > configure_file("${CMAKE_CURRENT_SOURCE_DIR}/lib/libexpat.def.cmake"
> > "${CMAKE_CURRENT_BINARY_DIR}/lib/libexpat.def")
> > +diff --git a/lib/expat.h b/lib/expat.h
> > +index 1c83563..33c94af 100644
> > +--- a/lib/expat.h
> > ++++ b/lib/expat.h
> > +@@ -1038,13 +1038,15 @@ typedef struct {
> > + XMLPARSEAPI(const XML_Feature *)
> > + XML_GetFeatureList(void);
> > +
> > +-#ifdef XML_DTD
> > +-/* Added in Expat 2.4.0. */
> > ++#if defined(XML_DTD) || XML_GE == 1
> > ++/* Added in Expat 2.4.0 for XML_DTD defined and
> > ++ * added in Expat 2.6.0 for XML_GE == 1. */
> > + XMLPARSEAPI(XML_Bool)
> > + XML_SetBillionLaughsAttackProtectionMaximumAmplification(
> > +     XML_Parser parser, float maximumAmplificationFactor);
> > +
> > +-/* Added in Expat 2.4.0. */
> > ++/* Added in Expat 2.4.0 for XML_DTD defined and
> > ++ * added in Expat 2.6.0 for XML_GE == 1. */
> > + XMLPARSEAPI(XML_Bool)
> > + XML_SetBillionLaughsAttackProtectionActivationThreshold(
> > +     XML_Parser parser, unsigned long long
> > activationThresholdBytes);
> > +diff --git a/lib/internal.h b/lib/internal.h
> > +index e09f533..1851925 100644
> > +--- a/lib/internal.h
> > ++++ b/lib/internal.h
> > +@@ -154,7 +154,7 @@ extern "C" {
> > + void _INTERNAL_trim_to_complete_utf8_characters(const char *from,
> > +                                                 const char
> > **fromLimRef);
> > +
> > +-#if defined(XML_DTD)
> > ++#if defined(XML_DTD) || XML_GE == 1
> > + unsigned long long testingAccountingGetCountBytesDirect(XML_Parser
> > parser);
> > + unsigned long long
> > testingAccountingGetCountBytesIndirect(XML_Parser parser);
> > + const char *unsignedCharToPrintable(unsigned char c);
> > +diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
> > +index cf434a2..61a4f00 100644
> > +--- a/lib/libexpat.def.cmake
> > ++++ b/lib/libexpat.def.cmake
> > +@@ -75,5 +75,5 @@ EXPORTS
> > +   XML_SetHashSalt @67
> > + ; internal @68 removed with version 2.3.1
> > + ; added with version 2.4.0
> > +-@_EXPAT_COMMENT_DTD@
> > XML_SetBillionLaughsAttackProtectionActivationThreshold @69
> > +-@_EXPAT_COMMENT_DTD@
> > XML_SetBillionLaughsAttackProtectionMaximumAmplification @70
> > ++@_EXPAT_COMMENT_DTD_OR_GE@
> > XML_SetBillionLaughsAttackProtectionActivationThreshold @69
> > ++@_EXPAT_COMMENT_DTD_OR_GE@
> > XML_SetBillionLaughsAttackProtectionMaximumAmplification @70
> > +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> > +index b6c2eca..e23441e 100644
> > +--- a/lib/xmlparse.c
> > ++++ b/lib/xmlparse.c
> > +@@ -408,7 +408,7 @@ enum XML_Account {
> > +   XML_ACCOUNT_NONE              /* i.e. do not account, was
> > accounted already */
> > + };
> > +
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > + typedef unsigned long long XmlBigCount;
> > + typedef struct accounting {
> > +   XmlBigCount countBytesDirect;
> > +@@ -424,7 +424,7 @@ typedef struct entity_stats {
> > +   unsigned int maximumDepthSeen;
> > +   int debugLevel;
> > + } ENTITY_STATS;
> > +-#endif /* XML_DTD */
> > ++#endif /* defined(XML_DTD) || XML_GE == 1 */
> > +
> > + typedef enum XML_Error PTRCALL Processor(XML_Parser parser, const
> > char *start,
> > +                                          const char *end, const
> > char **endPtr);
> > +@@ -562,7 +562,7 @@ static XML_Parser parserCreate(const XML_Char
> > *encodingName,
> > +
> > + static void parserInit(XML_Parser parser, const XML_Char
> > *encodingName);
> > +
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > + static float accountingGetCurrentAmplification(XML_Parser
> > rootParser);
> > + static void accountingReportStats(XML_Parser originParser, const
> > char *epilog);
> > + static void accountingOnAbort(XML_Parser originParser);
> > +@@ -585,7 +585,7 @@ static void entityTrackingOnClose(XML_Parser
> > parser, ENTITY *entity,
> > +
> > + static XML_Parser getRootParserOf(XML_Parser parser,
> > +                                   unsigned int *outLevelDiff);
> > +-#endif /* XML_DTD */
> > ++#endif /* defined(XML_DTD) || XML_GE == 1 */
> > +
> > + static unsigned long getDebugLevel(const char *variableName,
> > +                                    unsigned long
> > defaultDebugLevel);
> > +@@ -703,7 +703,7 @@ struct XML_ParserStruct {
> > +   enum XML_ParamEntityParsing m_paramEntityParsing;
> > + #endif
> > +   unsigned long m_hash_secret_salt;
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +   ACCOUNTING m_accounting;
> > +   ENTITY_STATS m_entity_stats;
> > + #endif
> > +@@ -1163,7 +1163,7 @@ parserInit(XML_Parser parser, const XML_Char
> > *encodingName) {
> > + #endif
> > +   parser->m_hash_secret_salt = 0;
> > +
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +   memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
> > +   parser->m_accounting.debugLevel =
> > getDebugLevel("EXPAT_ACCOUNTING_DEBUG", 0u);
> > +   parser->m_accounting.maximumAmplificationFactor
> > +@@ -2522,8 +2522,9 @@ XML_GetFeatureList(void) {
> > + #ifdef XML_ATTR_INFO
> > +       {XML_FEATURE_ATTR_INFO, XML_L("XML_ATTR_INFO"), 0},
> > + #endif
> > +-#ifdef XML_DTD
> > +-      /* Added in Expat 2.4.0. */
> > ++#if defined(XML_DTD) || XML_GE == 1
> > ++    /* Added in Expat 2.4.0 for XML_DTD defined and
> > ++     * added in Expat 2.6.0 for XML_GE == 1. */
> > +
> > {XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_D
> > EFAULT,
> > +        XML_L("XML_BLAP_MAX_AMP"),
> > +        (long int)
> > +@@ -2537,7 +2538,7 @@ XML_GetFeatureList(void) {
> > +   return features;
> > + }
> > +
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > + XML_Bool XMLCALL
> > + XML_SetBillionLaughsAttackProtectionMaximumAmplification(
> > +     XML_Parser parser, float maximumAmplificationFactor) {
> > +@@ -2559,7 +2560,7 @@
> > XML_SetBillionLaughsAttackProtectionActivationThreshold(
> > +   parser->m_accounting.activationThresholdBytes =
> > activationThresholdBytes;
> > +   return XML_TRUE;
> > + }
> > +-#endif /* XML_DTD */
> > ++#endif /* defined(XML_DTD) || XML_GE == 1 */
> > +
> > + /* Initially tag->rawName always points into the parse buffer;
> > +    for those TAG instances opened while the current parse buffer
> > was
> > +@@ -2645,13 +2646,13 @@ externalEntityInitProcessor2(XML_Parser
> > parser, const char *start,
> > +   int tok = XmlContentTok(parser->m_encoding, start, end, &next);
> > +   switch (tok) {
> > +   case XML_TOK_BOM:
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +     if (! accountingDiffTolerated(parser, tok, start, next,
> > __LINE__,
> > +                                   XML_ACCOUNT_DIRECT)) {
> > +       accountingOnAbort(parser);
> > +       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > +     }
> > +-#endif /* XML_DTD */
> > ++#endif /* defined(XML_DTD) || XML_GE == 1 */
> > +
> > +     /* If we are at the end of the buffer, this would cause the
> > next stage,
> > +        i.e. externalEntityInitProcessor3, to pass control directly
> > to
> > +@@ -2765,7 +2766,7 @@ doContent(XML_Parser parser, int
> > startTagLevel, const ENCODING *enc,
> > +   for (;;) {
> > +     const char *next = s; /* XmlContentTok doesn't always set the
> > last arg */
> > +     int tok = XmlContentTok(enc, s, end, &next);
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +     const char *accountAfter
> > +         = ((tok == XML_TOK_TRAILING_RSQB) || (tok ==
> > XML_TOK_TRAILING_CR))
> > +               ? (haveMore ? s /* i.e. 0 bytes */ : end)
> > +@@ -2831,14 +2832,14 @@ doContent(XML_Parser parser, int
> > startTagLevel, const ENCODING *enc,
> > +       XML_Char ch = (XML_Char)XmlPredefinedEntityName(
> > +           enc, s + enc->minBytesPerChar, next - enc-
> > >minBytesPerChar);
> > +       if (ch) {
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +         /* NOTE: We are replacing 4-6 characters original input for
> > 1 character
> > +          *       so there is no amplification and hence recording
> > without
> > +          *       protection. */
> > +         accountingDiffTolerated(parser, tok, (char *)&ch,
> > +                                 ((char *)&ch) + sizeof(XML_Char),
> > __LINE__,
> > +                                 XML_ACCOUNT_ENTITY_EXPANSION);
> > +-#endif /* XML_DTD */
> > ++#endif /* defined(XML_DTD) || XML_GE == 1 */
> > +         if (parser->m_characterDataHandler)
> > +           parser->m_characterDataHandler(parser->m_handlerArg, &ch,
> > 1);
> > +         else if (parser->m_defaultHandler)
> > +@@ -4040,7 +4041,7 @@ doCdataSection(XML_Parser parser, const
> > ENCODING *enc, const char **startPtr,
> > +   for (;;) {
> > +     const char *next = s; /* in case of XML_TOK_NONE or
> > XML_TOK_PARTIAL */
> > +     int tok = XmlCdataSectionTok(enc, s, end, &next);
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > account)) {
> > +       accountingOnAbort(parser);
> > +       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > +@@ -4192,7 +4193,7 @@ doIgnoreSection(XML_Parser parser, const
> > ENCODING *enc, const char **startPtr,
> > +   *eventPP = s;
> > +   *startPtr = NULL;
> > +   tok = XmlIgnoreSectionTok(enc, s, end, &next);
> > +-#  ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +   if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > +                                 XML_ACCOUNT_DIRECT)) {
> > +     accountingOnAbort(parser);
> > +@@ -4284,7 +4285,7 @@ processXmlDecl(XML_Parser parser, int
> > isGeneralTextEntity, const char *s,
> > +   const XML_Char *storedversion = NULL;
> > +   int standalone = -1;
> > +
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +   if (! accountingDiffTolerated(parser, XML_TOK_XML_DECL, s, next,
> > __LINE__,
> > +                                 XML_ACCOUNT_DIRECT)) {
> > +     accountingOnAbort(parser);
> > +@@ -4491,7 +4492,7 @@ entityValueInitProcessor(XML_Parser parser,
> > const char *s, const char *end,
> > +     */
> > +     else if (tok == XML_TOK_BOM && next == end
> > +              && ! parser->m_parsingStatus.finalBuffer) {
> > +-#  ifdef XML_DTD
> > ++#  if defined(XML_DTD) || XML_GE == 1
> > +       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > +                                     XML_ACCOUNT_DIRECT)) {
> > +         accountingOnAbort(parser);
> > +@@ -4707,11 +4708,13 @@ doProlog(XML_Parser parser, const ENCODING
> > *enc, const char *s, const char *end,
> > +       }
> > +     }
> > +     role = XmlTokenRole(&parser->m_prologState, tok, s, next, enc);
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +     switch (role) {
> > +     case XML_ROLE_INSTANCE_START: // bytes accounted in
> > contentProcessor
> > +     case XML_ROLE_XML_DECL:       // bytes accounted in
> > processXmlDecl
> > +-    case XML_ROLE_TEXT_DECL:      // bytes accounted in
> > processXmlDecl
> > ++    #  ifdef XML_DTD
> > ++    case XML_ROLE_TEXT_DECL: // bytes accounted in processXmlDecl
> > ++#  endif
> > +       break;
> > +     default:
> > +       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > account)) {
> > +@@ -5648,7 +5651,7 @@ epilogProcessor(XML_Parser parser, const char
> > *s, const char *end,
> > +   for (;;) {
> > +     const char *next = NULL;
> > +     int tok = XmlPrologTok(parser->m_encoding, s, end, &next);
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +     if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > +                                   XML_ACCOUNT_DIRECT)) {
> > +       accountingOnAbort(parser);
> > +@@ -5728,7 +5731,7 @@ processInternalEntity(XML_Parser parser,
> > ENTITY *entity, XML_Bool betweenDecl) {
> > +       return XML_ERROR_NO_MEMORY;
> > +   }
> > +   entity->open = XML_TRUE;
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +   entityTrackingOnOpen(parser, entity, __LINE__);
> > + #endif
> > +   entity->processed = 0;
> > +@@ -5762,9 +5765,9 @@ processInternalEntity(XML_Parser parser,
> > ENTITY *entity, XML_Bool betweenDecl) {
> > +       entity->processed = (int)(next - textStart);
> > +       parser->m_processor = internalEntityProcessor;
> > +     } else {
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +       entityTrackingOnClose(parser, entity, __LINE__);
> > +-#endif /* XML_DTD */
> > ++#endif /* defined(XML_DTD) || XML_GE == 1 */
> > +       entity->open = XML_FALSE;
> > +       parser->m_openInternalEntities = openEntity->next;
> > +       /* put openEntity back in list of free instances */
> > +@@ -5813,7 +5816,7 @@ internalEntityProcessor(XML_Parser parser,
> > const char *s, const char *end,
> > +     return result;
> > +   }
> > +
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +   entityTrackingOnClose(parser, entity, __LINE__);
> > + #endif
> > +   entity->open = XML_FALSE;
> > +@@ -5892,7 +5895,7 @@ appendAttributeValue(XML_Parser parser, const
> > ENCODING *enc, XML_Bool isCdata,
> > +     const char *next
> > +         = ptr; /* XmlAttributeValueTok doesn't always set the last
> > arg */
> > +     int tok = XmlAttributeValueTok(enc, ptr, end, &next);
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +     if (! accountingDiffTolerated(parser, tok, ptr, next, __LINE__,
> > account)) {
> > +       accountingOnAbort(parser);
> > +       return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > +@@ -5957,14 +5960,14 @@ appendAttributeValue(XML_Parser parser,
> > const ENCODING *enc, XML_Bool isCdata,
> > +       XML_Char ch = (XML_Char)XmlPredefinedEntityName(
> > +           enc, ptr + enc->minBytesPerChar, next - enc-
> > >minBytesPerChar);
> > +       if (ch) {
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +         /* NOTE: We are replacing 4-6 characters original input for
> > 1 character
> > +          *       so there is no amplification and hence recording
> > without
> > +          *       protection. */
> > +         accountingDiffTolerated(parser, tok, (char *)&ch,
> > +                                 ((char *)&ch) + sizeof(XML_Char),
> > __LINE__,
> > +                                 XML_ACCOUNT_ENTITY_EXPANSION);
> > +-#endif /* XML_DTD */
> > ++#endif /* defined(XML_DTD) || XML_GE == 1 */
> > +         if (! poolAppendChar(pool, ch))
> > +           return XML_ERROR_NO_MEMORY;
> > +         break;
> > +@@ -6042,14 +6045,14 @@ appendAttributeValue(XML_Parser parser,
> > const ENCODING *enc, XML_Bool isCdata,
> > +         enum XML_Error result;
> > +         const XML_Char *textEnd = entity->textPtr + entity-
> > >textLen;
> > +         entity->open = XML_TRUE;
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +         entityTrackingOnOpen(parser, entity, __LINE__);
> > + #endif
> > +         result = appendAttributeValue(parser, parser-
> > >m_internalEncoding,
> > +                                       isCdata, (const char
> > *)entity->textPtr,
> > +                                       (const char *)textEnd, pool,
> > +
> > XML_ACCOUNT_ENTITY_EXPANSION);
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +         entityTrackingOnClose(parser, entity, __LINE__);
> > + #endif
> > +         entity->open = XML_FALSE;
> > +@@ -6105,7 +6108,7 @@ storeEntityValue(XML_Parser parser, const
> > ENCODING *enc,
> > +         = entityTextPtr; /* XmlEntityValueTok doesn't always set
> > the last arg */
> > +     int tok = XmlEntityValueTok(enc, entityTextPtr, entityTextEnd,
> > &next);
> > +
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +     if (! accountingDiffTolerated(parser, tok, entityTextPtr, next,
> > __LINE__,
> > +                                   account)) {
> > +       accountingOnAbort(parser);
> > +@@ -7651,7 +7654,7 @@ copyString(const XML_Char *s, const
> > XML_Memory_Handling_Suite *memsuite) {
> > +   return result;
> > + }
> > +
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +
> > + static float
> > + accountingGetCurrentAmplification(XML_Parser rootParser) {
> > +@@ -8382,7 +8385,7 @@ unsignedCharToPrintable(unsigned char c) {
> > +   assert(0); /* never gets here */
> > + }
> > +
> > +-#endif /* XML_DTD */
> > ++#endif /* defined(XML_DTD) || XML_GE == 1 */
> > +
> > + static unsigned long
> > + getDebugLevel(const char *variableName, unsigned long
> > defaultDebugLevel) {
> > +diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
> > +index 471f2a2..be23f5a 100644
> > +--- a/xmlwf/xmlwf.c
> > ++++ b/xmlwf/xmlwf.c
> > +@@ -1062,9 +1062,10 @@ tmain(int argc, XML_Char **argv) {
> > +             " (needs a floating point number greater or equal than
> > 1.0)"));
> > +         exit(XMLWF_EXIT_USAGE_ERROR);
> > +       }
> > +-#ifndef XML_DTD
> > +-      ftprintf(stderr, T("Warning: Given amplification limit
> > ignored") T(
> > +-                           ", xmlwf has been compiled without DTD
> > support.\n"));
> > ++#if ! defined(XML_DTD) && XML_GE == 0
> > ++      ftprintf(stderr,
> > ++               T("Warning: Given amplification limit ignored")
> > ++                   T(", xmlwf has been compiled without DTD/GE
> > support.\n"));
> > + #endif
> > +       break;
> > +     }
> > +@@ -1083,9 +1084,10 @@ tmain(int argc, XML_Char **argv) {
> > +         exit(XMLWF_EXIT_USAGE_ERROR);
> > +       }
> > +       attackThresholdGiven = XML_TRUE;
> > +-#ifndef XML_DTD
> > +-      ftprintf(stderr, T("Warning: Given attack threshold ignored")
> > T(
> > +-                           ", xmlwf has been compiled without DTD
> > support.\n"));
> > ++#if ! defined(XML_DTD) && XML_GE == 0
> > ++      ftprintf(stderr,
> > ++               T("Warning: Given attack threshold ignored")
> > ++                   T(", xmlwf has been compiled without DTD/GE
> > support.\n"));
> > + #endif
> > +       break;
> > +     }
> > +@@ -1120,13 +1122,13 @@ tmain(int argc, XML_Char **argv) {
> > +     }
> > +
> > +     if (attackMaximumAmplification != -1.0f) {
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +       XML_SetBillionLaughsAttackProtectionMaximumAmplification(
> > +           parser, attackMaximumAmplification);
> > + #endif
> > +     }
> > +     if (attackThresholdGiven) {
> > +-#ifdef XML_DTD
> > ++#if defined(XML_DTD) || XML_GE == 1
> > +       XML_SetBillionLaughsAttackProtectionActivationThreshold(
> > +           parser, attackThresholdBytes);
> > + #else
> > +--
> > +2.40.0
> > diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-
> > core/expat/expat_2.5.0.bb
> > index 7080f934d1..e427020534 100644
> > --- a/meta/recipes-core/expat/expat_2.5.0.bb
> > +++ b/meta/recipes-core/expat/expat_2.5.0.bb
> > @@ -10,6 +10,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.',
> > '_')}"
> >
> >  SRC_URI =
> > "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_T
> > AG}/expat-${PV}.tar.bz2  \
> >             file://run-ptest \
> > +           file://CVE-2023-52426.patch \
> >             "
> >
> >  UPSTREAM_CHECK_URI =
> > "https://github.com/libexpat/libexpat/releases/"
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196973):
> https://lists.openembedded.org/g/openembedded-core/message/196973
> Mute This Topic: https://lists.openembedded.org/mt/104800121/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006a797e061375c92e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Mar 12, 2024, 03:58 Meenali Gupta via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;meenali.g=
upta=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Anuj,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">I have sent=
 the upgrade to 2.6.0 , it includes the complete security fix for
</span><span style=3D"font-family:&quot;Segoe UI&quot;,&quot;Segoe UI Web (=
West European)&quot;,&quot;Segoe UI&quot;,-apple-system,BlinkMacSystemFont,=
Roboto,&quot;Helvetica Neue&quot;,sans-serif;font-size:14.6667px;color:rgb(=
66,66,66);background-color:rgb(255,255,255)">CVE-2023-52426</span><span sty=
le=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helv=
etica,sans-serif;font-size:12pt;color:rgb(0,0,0)">=C2=A0and
</span><span style=3D"font-family:&quot;Segoe UI&quot;,&quot;Segoe UI Web (=
West European)&quot;,&quot;Segoe UI&quot;,-apple-system,BlinkMacSystemFont,=
Roboto,&quot;Helvetica Neue&quot;,sans-serif;font-size:14.6667px;color:rgb(=
66,66,66);background-color:rgb(255,255,255)">CVE-2023-5242</span><span styl=
e=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helve=
tica,sans-serif;font-size:12pt;color:rgb(0,0,0)">5.</span></div></div></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><span sty=
le=3D"font-size:12.8px">Unfortunately that update changes the so version nu=
mber, so it isn&#39;t acceptable for kirkstone.</span></div><div dir=3D"aut=
o"><span style=3D"font-size:12.8px"><br></span></div><div dir=3D"auto"><spa=
n style=3D"font-size:12.8px"><br></span></div><div dir=3D"auto"><span style=
=3D"font-size:12.8px">=C2=A0 #775 #776=C2=A0 Version info bumped from 9:10:=
8 (libexpat*.so.1.8.10)</span><br style=3D"font-size:12.8px"><span style=3D=
"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 to 10:0:9 (libexpat*.so.1.9.0); see=C2=A0</span><a href=3D"ht=
tps://verbump.de/" style=3D"text-decoration-line:none;color:rgb(66,133,244)=
;font-size:12.8px">https://verbump.de/</a><br style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for what these numbers do</span><br style=3D"fo=
nt-size:12.8px"></div><div dir=3D"auto"><span style=3D"font-size:12.8px"><b=
r></span></div><div dir=3D"auto"><span style=3D"font-size:12.8px"><br></spa=
n></div><div dir=3D"auto"><span style=3D"font-size:12.8px">I think you will=
 have to carefully back-port the two CVE fixes.</span></div><div dir=3D"aut=
o"><span style=3D"font-size:12.8px"><br></span></div><div dir=3D"auto"><spa=
n style=3D"font-size:12.8px">It looks like Debian devs may have already=C2=
=A0 back-ported at least one of these CVs to version 2.5.0-x</span></div><d=
iv dir=3D"auto"><span style=3D"font-size:12.8px"><br></span></div><div dir=
=3D"auto"><span style=3D"font-size:12.8px"><a href=3D"https://bugs.debian.o=
rg/cgi-bin/bugreport.cgi?bug=3D1063238">https://bugs.debian.org/cgi-bin/bug=
report.cgi?bug=3D1063238</a></span><br></div><div dir=3D"auto"><span style=
=3D"font-size:12.8px"><br></span></div><div dir=3D"auto"><span style=3D"fon=
t-size:12.8px">Thanks,</span></div><div dir=3D"auto"><span style=3D"font-si=
ze:12.8px"><br></span></div><div dir=3D"auto"><span style=3D"font-size:12.8=
px">../Randy</span></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><br>
</span></div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">Regards</sp=
an></div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">Meenali</sp=
an></div>
<div id=3D"m_-6430478624202595408appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-6430478624202595408divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 Mittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank=
" rel=3D"noreferrer">anuj.mittal@intel.com</a>&gt;<br>
<b>Sent:</b> 11 March 2024 08:37<br>
<b>To:</b> Gupta, Meenali &lt;<a href=3D"mailto:Meenali.Gupta@windriver.com=
" target=3D"_blank" rel=3D"noreferrer">Meenali.Gupta@windriver.com</a>&gt;;=
 <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_bla=
nk" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a> &lt;<a =
href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank" =
rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [oe-core][kirkstone][PATCH 1/1] expat: fix CVE-2023-524=
26</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>CAUTION: This email comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Thu, 2024-03-07 at 16:08 -0800, Meenali Gupta via<br>
<a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferr=
er">lists.openembedded.org</a> wrote:<br>
&gt; From: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windriver.com"=
 target=3D"_blank" rel=3D"noreferrer">meenali.gupta@windriver.com</a>&gt;<b=
r>
&gt;<br>
&gt; A flaw was found in Expat (libexpat). If XML_DTD is undefined at<br>
&gt; compile time, a recursive XML Entity<br>
&gt; Expansion condition can be triggered. This issue may lead to a<br>
&gt; condition where data is expanded exponentially,<br>
&gt; which will quickly consume system resources and cause a denial of<br>
&gt; service.<br>
&gt;<br>
&gt; Signed-off-by: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">meenali.gupta@windriver.com<=
/a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../expat/expat/CVE-2023-52426.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 429<br>
&gt; ++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/expat/<a href=3D"http://expat_2.5.0.bb" target=
=3D"_blank" rel=3D"noreferrer">expat_2.5.0.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 430 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-<br>
&gt; 52426.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/expat/expat/CVE-2023-52426.patch<br>
&gt; b/meta/recipes-core/expat/expat/CVE-2023-52426.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b78a8ee0dc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/expat/expat/CVE-2023-52426.patch<br>
&gt; @@ -0,0 +1,429 @@<br>
&gt; +From 0f075ec8ecb5e43f8fdca5182f8cca4703da0404 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Sebastian Pipping &lt;<a href=3D"mailto:sebastian@pipping.org" =
target=3D"_blank" rel=3D"noreferrer">sebastian@pipping.org</a>&gt;<br>
&gt; +Date: Thu, 26 Oct 2023 00:43:22 +0200<br>
&gt; +Subject: [PATCH] lib|xmlwf|cmake: Extend scope of billion laughs<br>
&gt; attack<br>
&gt; + protection<br>
&gt; +<br>
&gt; +.. from &quot;defined(XML_DTD)&quot; to &quot;defined(XML_DTD) || XML=
_GE=3D=3D1&quot;.<br>
&gt; +<br>
&gt; +CVE: CVE-2023-52426<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a rel=3D"noreferrer"></a><a href=3D"https://github.com/libexpat/libe=
xpat/commit/0f075ec8ecb5e43f8fdca518" target=3D"_blank" rel=3D"noreferrer">=
https://github.com/libexpat/libexpat/commit/0f075ec8ecb5e43f8fdca518</a><br=
>
&gt; 2f8cca4703da0404]<br>
<br>
The PR that this commit is part of includes other commits as well. Is<br>
there any reason why only this is included or required?<br>
<br>
I didn&#39;t check in detail but as an example, it seems this commit uses<b=
r>
EXPAT_GE which was introduced in an earlier commit in that PR:<br>
<br>
<a href=3D"https://github.com/libexpat/libexpat/pull/777/commits/daa89e42c0=
05cc7f4f7af9eee271ae0723d30300" target=3D"_blank" rel=3D"noreferrer">https:=
//github.com/libexpat/libexpat/pull/777/commits/daa89e42c005cc7f4f7af9eee27=
1ae0723d30300</a><br>
<br>
So, is this supposed to work as intended?<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; +<br>
&gt; +Signed-off-by: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@wind=
river.com" target=3D"_blank" rel=3D"noreferrer">meenali.gupta@windriver.com=
</a>&gt;<br>
&gt; +---<br>
&gt; + CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 8 ++++-<br>
&gt; + lib/expat.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 +++--<br>
&gt; + lib/internal.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-<br>
&gt; + lib/libexpat.def.cmake |=C2=A0 4 +--<br>
&gt; + lib/xmlparse.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 71 =
++++++++++++++++++++++-----------------<br>
&gt; ---<br>
&gt; + xmlwf/xmlwf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 18 ++++++-----<br>
&gt; + 6 files changed, 62 insertions(+), 49 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; +index 2b4c13c..183c5c2 100644<br>
&gt; +--- a/CMakeLists.txt<br>
&gt; ++++ b/CMakeLists.txt<br>
&gt; +@@ -381,7 +381,13 @@ if(EXPAT_SHARED_LIBS)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 endif()<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 endmacro()<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _expat_def_file_toggle(EX=
PAT_DTD _EXPAT_COMMENT_DTD)<br>
&gt; ++=C2=A0=C2=A0=C2=A0 if(EXPAT_DTD OR EXPAT_GE)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
et(_EXPAT_DTD_OR_GE TRUE)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else()<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
et(_EXPAT_DTD_OR_GE FALSE)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 endif()<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _expat_def_file_toggle(_E=
XPAT_DTD_OR_GE<br>
&gt; _EXPAT_COMMENT_DTD_OR_GE)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _expat_def_file_togg=
le(EXPAT_ATTR_INFO<br>
&gt; _EXPAT_COMMENT_ATTR_INFO)<br>
&gt; +<br>
&gt; +<br>
&gt; configure_file(&quot;${CMAKE_CURRENT_SOURCE_DIR}/lib/libexpat.def.cmak=
e&quot;<br>
&gt; &quot;${CMAKE_CURRENT_BINARY_DIR}/lib/libexpat.def&quot;)<br>
&gt; +diff --git a/lib/expat.h b/lib/expat.h<br>
&gt; +index 1c83563..33c94af 100644<br>
&gt; +--- a/lib/expat.h<br>
&gt; ++++ b/lib/expat.h<br>
&gt; +@@ -1038,13 +1038,15 @@ typedef struct {<br>
&gt; + XMLPARSEAPI(const XML_Feature *)<br>
&gt; + XML_GetFeatureList(void);<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; +-/* Added in Expat 2.4.0. */<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; ++/* Added in Expat 2.4.0 for XML_DTD defined and<br>
&gt; ++ * added in Expat 2.6.0 for XML_GE =3D=3D 1. */<br>
&gt; + XMLPARSEAPI(XML_Bool)<br>
&gt; + XML_SetBillionLaughsAttackProtectionMaximumAmplification(<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 XML_Parser parser, float maximumAmplificatio=
nFactor);<br>
&gt; +<br>
&gt; +-/* Added in Expat 2.4.0. */<br>
&gt; ++/* Added in Expat 2.4.0 for XML_DTD defined and<br>
&gt; ++ * added in Expat 2.6.0 for XML_GE =3D=3D 1. */<br>
&gt; + XMLPARSEAPI(XML_Bool)<br>
&gt; + XML_SetBillionLaughsAttackProtectionActivationThreshold(<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 XML_Parser parser, unsigned long long<br>
&gt; activationThresholdBytes);<br>
&gt; +diff --git a/lib/internal.h b/lib/internal.h<br>
&gt; +index e09f533..1851925 100644<br>
&gt; +--- a/lib/internal.h<br>
&gt; ++++ b/lib/internal.h<br>
&gt; +@@ -154,7 +154,7 @@ extern &quot;C&quot; {<br>
&gt; + void _INTERNAL_trim_to_complete_utf8_characters(const char *from,<br=
>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=
 char<br>
&gt; **fromLimRef);<br>
&gt; +<br>
&gt; +-#if defined(XML_DTD)<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; + unsigned long long testingAccountingGetCountBytesDirect(XML_Parser<b=
r>
&gt; parser);<br>
&gt; + unsigned long long<br>
&gt; testingAccountingGetCountBytesIndirect(XML_Parser parser);<br>
&gt; + const char *unsignedCharToPrintable(unsigned char c);<br>
&gt; +diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake<br>
&gt; +index cf434a2..61a4f00 100644<br>
&gt; +--- a/lib/libexpat.def.cmake<br>
&gt; ++++ b/lib/libexpat.def.cmake<br>
&gt; +@@ -75,5 +75,5 @@ EXPORTS<br>
&gt; +=C2=A0=C2=A0 XML_SetHashSalt @67<br>
&gt; + ; internal @68 removed with version 2.3.1<br>
&gt; + ; added with version 2.4.0<br>
&gt; +-@_EXPAT_COMMENT_DTD@<br>
&gt; XML_SetBillionLaughsAttackProtectionActivationThreshold @69<br>
&gt; +-@_EXPAT_COMMENT_DTD@<br>
&gt; XML_SetBillionLaughsAttackProtectionMaximumAmplification @70<br>
&gt; ++@_EXPAT_COMMENT_DTD_OR_GE@<br>
&gt; XML_SetBillionLaughsAttackProtectionActivationThreshold @69<br>
&gt; ++@_EXPAT_COMMENT_DTD_OR_GE@<br>
&gt; XML_SetBillionLaughsAttackProtectionMaximumAmplification @70<br>
&gt; +diff --git a/lib/xmlparse.c b/lib/xmlparse.c<br>
&gt; +index b6c2eca..e23441e 100644<br>
&gt; +--- a/lib/xmlparse.c<br>
&gt; ++++ b/lib/xmlparse.c<br>
&gt; +@@ -408,7 +408,7 @@ enum XML_Account {<br>
&gt; +=C2=A0=C2=A0 XML_ACCOUNT_NONE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* i.e. do not account, was<br>
&gt; accounted already */<br>
&gt; + };<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; + typedef unsigned long long XmlBigCount;<br>
&gt; + typedef struct accounting {<br>
&gt; +=C2=A0=C2=A0 XmlBigCount countBytesDirect;<br>
&gt; +@@ -424,7 +424,7 @@ typedef struct entity_stats {<br>
&gt; +=C2=A0=C2=A0 unsigned int maximumDepthSeen;<br>
&gt; +=C2=A0=C2=A0 int debugLevel;<br>
&gt; + } ENTITY_STATS;<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +<br>
&gt; + typedef enum XML_Error PTRCALL Processor(XML_Parser parser, const<br=
>
&gt; char *start,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *end, const<br>
&gt; char **endPtr);<br>
&gt; +@@ -562,7 +562,7 @@ static XML_Parser parserCreate(const XML_Char<br>
&gt; *encodingName,<br>
&gt; +<br>
&gt; + static void parserInit(XML_Parser parser, const XML_Char<br>
&gt; *encodingName);<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; + static float accountingGetCurrentAmplification(XML_Parser<br>
&gt; rootParser);<br>
&gt; + static void accountingReportStats(XML_Parser originParser, const<br>
&gt; char *epilog);<br>
&gt; + static void accountingOnAbort(XML_Parser originParser);<br>
&gt; +@@ -585,7 +585,7 @@ static void entityTrackingOnClose(XML_Parser<br>
&gt; parser, ENTITY *entity,<br>
&gt; +<br>
&gt; + static XML_Parser getRootParserOf(XML_Parser parser,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int *=
outLevelDiff);<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +<br>
&gt; + static unsigned long getDebugLevel(const char *variableName,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long<br>
&gt; defaultDebugLevel);<br>
&gt; +@@ -703,7 +703,7 @@ struct XML_ParserStruct {<br>
&gt; +=C2=A0=C2=A0 enum XML_ParamEntityParsing m_paramEntityParsing;<br>
&gt; + #endif<br>
&gt; +=C2=A0=C2=A0 unsigned long m_hash_secret_salt;<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0 ACCOUNTING m_accounting;<br>
&gt; +=C2=A0=C2=A0 ENTITY_STATS m_entity_stats;<br>
&gt; + #endif<br>
&gt; +@@ -1163,7 +1163,7 @@ parserInit(XML_Parser parser, const XML_Char<br=
>
&gt; *encodingName) {<br>
&gt; + #endif<br>
&gt; +=C2=A0=C2=A0 parser-&gt;m_hash_secret_salt =3D 0;<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0 memset(&amp;parser-&gt;m_accounting, 0, sizeof(ACCOUNTIN=
G));<br>
&gt; +=C2=A0=C2=A0 parser-&gt;m_accounting.debugLevel =3D<br>
&gt; getDebugLevel(&quot;EXPAT_ACCOUNTING_DEBUG&quot;, 0u);<br>
&gt; +=C2=A0=C2=A0 parser-&gt;m_accounting.maximumAmplificationFactor<br>
&gt; +@@ -2522,8 +2522,9 @@ XML_GetFeatureList(void) {<br>
&gt; + #ifdef XML_ATTR_INFO<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {XML_FEATURE_ATTR_INFO, XML_L(&q=
uot;XML_ATTR_INFO&quot;), 0},<br>
&gt; + #endif<br>
&gt; +-#ifdef XML_DTD<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Added in Expat 2.4.0. */<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; ++=C2=A0=C2=A0=C2=A0 /* Added in Expat 2.4.0 for XML_DTD defined and<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 * added in Expat 2.6.0 for XML_GE =3D=3D 1.=
 */<br>
&gt; +<br>
&gt; {XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_D<=
br>
&gt; EFAULT,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_L(&quot;XML_BLAP_MAX_A=
MP&quot;),<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (long int)<br>
&gt; +@@ -2537,7 +2538,7 @@ XML_GetFeatureList(void) {<br>
&gt; +=C2=A0=C2=A0 return features;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; + XML_Bool XMLCALL<br>
&gt; + XML_SetBillionLaughsAttackProtectionMaximumAmplification(<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 XML_Parser parser, float maximumAmplificatio=
nFactor) {<br>
&gt; +@@ -2559,7 +2560,7 @@<br>
&gt; XML_SetBillionLaughsAttackProtectionActivationThreshold(<br>
&gt; +=C2=A0=C2=A0 parser-&gt;m_accounting.activationThresholdBytes =3D<br>
&gt; activationThresholdBytes;<br>
&gt; +=C2=A0=C2=A0 return XML_TRUE;<br>
&gt; + }<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +<br>
&gt; + /* Initially tag-&gt;rawName always points into the parse buffer;<br=
>
&gt; +=C2=A0=C2=A0=C2=A0 for those TAG instances opened while the current p=
arse buffer<br>
&gt; was<br>
&gt; +@@ -2645,13 +2646,13 @@ externalEntityInitProcessor2(XML_Parser<br>
&gt; parser, const char *start,<br>
&gt; +=C2=A0=C2=A0 int tok =3D XmlContentTok(parser-&gt;m_encoding, start, =
end, &amp;next);<br>
&gt; +=C2=A0=C2=A0 switch (tok) {<br>
&gt; +=C2=A0=C2=A0 case XML_TOK_BOM:<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if (! accountingDiffTolerated(parser, tok, s=
tart, next,<br>
&gt; __LINE__,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_ACCOUNT_DI=
RECT)) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accountingOnAbort(parser);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return XML_ERROR_AMPLIFICATION_L=
IMIT_BREACH;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* If we are at the end of the buffer, this =
would cause the<br>
&gt; next stage,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i.e. externalEntityInitPro=
cessor3, to pass control directly<br>
&gt; to<br>
&gt; +@@ -2765,7 +2766,7 @@ doContent(XML_Parser parser, int<br>
&gt; startTagLevel, const ENCODING *enc,<br>
&gt; +=C2=A0=C2=A0 for (;;) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const char *next =3D s; /* XmlContentTok doe=
sn&#39;t always set the<br>
&gt; last arg */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 int tok =3D XmlContentTok(enc, s, end, &amp;=
next);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const char *accountAfter<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D ((tok =3D=3D XML=
_TOK_TRAILING_RSQB) || (tok =3D=3D<br>
&gt; XML_TOK_TRAILING_CR))<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ? (haveMore ? s /* i.e. 0 bytes */ : end)<br>
&gt; +@@ -2831,14 +2832,14 @@ doContent(XML_Parser parser, int<br>
&gt; startTagLevel, const ENCODING *enc,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_Char ch =3D (XML_Char)XmlPre=
definedEntityName(<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enc, s +=
 enc-&gt;minBytesPerChar, next - enc-<br>
&gt; &gt;minBytesPerChar);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ch) {<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* NOTE: We are repl=
acing 4-6 characters original input for<br>
&gt; 1 character<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 so there is no amplification and hence recording<b=
r>
&gt; without<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 protection. */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accountingDiffTolera=
ted(parser, tok, (char *)&amp;ch,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((char *)&amp;ch) + sizeof=
(XML_Char),<br>
&gt; __LINE__,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_ACCOUNT_ENTITY_EXPANSI=
ON);<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (parser-&gt;m_cha=
racterDataHandler)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser-&=
gt;m_characterDataHandler(parser-&gt;m_handlerArg, &amp;ch,<br>
&gt; 1);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (parser-&gt;=
m_defaultHandler)<br>
&gt; +@@ -4040,7 +4041,7 @@ doCdataSection(XML_Parser parser, const<br>
&gt; ENCODING *enc, const char **startPtr,<br>
&gt; +=C2=A0=C2=A0 for (;;) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const char *next =3D s; /* in case of XML_TO=
K_NONE or<br>
&gt; XML_TOK_PARTIAL */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 int tok =3D XmlCdataSectionTok(enc, s, end, =
&amp;next);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if (! accountingDiffTolerated(parser, tok, s=
, next, __LINE__,<br>
&gt; account)) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accountingOnAbort(parser);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return XML_ERROR_AMPLIFICATION_L=
IMIT_BREACH;<br>
&gt; +@@ -4192,7 +4193,7 @@ doIgnoreSection(XML_Parser parser, const<br>
&gt; ENCODING *enc, const char **startPtr,<br>
&gt; +=C2=A0=C2=A0 *eventPP =3D s;<br>
&gt; +=C2=A0=C2=A0 *startPtr =3D NULL;<br>
&gt; +=C2=A0=C2=A0 tok =3D XmlIgnoreSectionTok(enc, s, end, &amp;next);<br>
&gt; +-#=C2=A0 ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0 if (! accountingDiffTolerated(parser, tok, s, next, __LI=
NE__,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_ACCOUNT_DIRECT)) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 accountingOnAbort(parser);<br>
&gt; +@@ -4284,7 +4285,7 @@ processXmlDecl(XML_Parser parser, int<br>
&gt; isGeneralTextEntity, const char *s,<br>
&gt; +=C2=A0=C2=A0 const XML_Char *storedversion =3D NULL;<br>
&gt; +=C2=A0=C2=A0 int standalone =3D -1;<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0 if (! accountingDiffTolerated(parser, XML_TOK_XML_DECL, =
s, next,<br>
&gt; __LINE__,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_ACCOUNT_DIRECT)) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 accountingOnAbort(parser);<br>
&gt; +@@ -4491,7 +4492,7 @@ entityValueInitProcessor(XML_Parser parser,<br>
&gt; const char *s, const char *end,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 else if (tok =3D=3D XML_TOK_BOM &amp;&amp; n=
ext =3D=3D end<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &amp;&amp; ! parser-&gt;m_parsingStatus.finalBuffer) {<br>
&gt; +-#=C2=A0 ifdef XML_DTD<br>
&gt; ++#=C2=A0 if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (! accountingDiffTolerated(pa=
rser, tok, s, next, __LINE__,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XM=
L_ACCOUNT_DIRECT)) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accountingOnAbort(pa=
rser);<br>
&gt; +@@ -4707,11 +4708,13 @@ doProlog(XML_Parser parser, const ENCODING<br=
>
&gt; *enc, const char *s, const char *end,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 role =3D XmlTokenRole(&amp;parser-&gt;m_prol=
ogState, tok, s, next, enc);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 switch (role) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 case XML_ROLE_INSTANCE_START: // bytes accou=
nted in<br>
&gt; contentProcessor<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 case XML_ROLE_XML_DECL:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 // bytes accounted in<br>
&gt; processXmlDecl<br>
&gt; +-=C2=A0=C2=A0=C2=A0 case XML_ROLE_TEXT_DECL:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 // bytes accounted in<br>
&gt; processXmlDecl<br>
&gt; ++=C2=A0=C2=A0=C2=A0 #=C2=A0 ifdef XML_DTD<br>
&gt; ++=C2=A0=C2=A0=C2=A0 case XML_ROLE_TEXT_DECL: // bytes accounted in pr=
ocessXmlDecl<br>
&gt; ++#=C2=A0 endif<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 default:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (! accountingDiffTolerated(pa=
rser, tok, s, next, __LINE__,<br>
&gt; account)) {<br>
&gt; +@@ -5648,7 +5651,7 @@ epilogProcessor(XML_Parser parser, const char<b=
r>
&gt; *s, const char *end,<br>
&gt; +=C2=A0=C2=A0 for (;;) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const char *next =3D NULL;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 int tok =3D XmlPrologTok(parser-&gt;m_encodi=
ng, s, end, &amp;next);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if (! accountingDiffTolerated(parser, tok, s=
, next, __LINE__,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_ACCOUNT_DI=
RECT)) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accountingOnAbort(parser);<br>
&gt; +@@ -5728,7 +5731,7 @@ processInternalEntity(XML_Parser parser,<br>
&gt; ENTITY *entity, XML_Bool betweenDecl) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return XML_ERROR_NO_MEMORY;<br>
&gt; +=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0 entity-&gt;open =3D XML_TRUE;<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0 entityTrackingOnOpen(parser, entity, __LINE__);<br>
&gt; + #endif<br>
&gt; +=C2=A0=C2=A0 entity-&gt;processed =3D 0;<br>
&gt; +@@ -5762,9 +5765,9 @@ processInternalEntity(XML_Parser parser,<br>
&gt; ENTITY *entity, XML_Bool betweenDecl) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity-&gt;processed =3D (int)(n=
ext - textStart);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser-&gt;m_processor =3D inter=
nalEntityProcessor;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 } else {<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entityTrackingOnClose(parser, en=
tity, __LINE__);<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity-&gt;open =3D XML_FALSE;<b=
r>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser-&gt;m_openInternalEntitie=
s =3D openEntity-&gt;next;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* put openEntity back in list o=
f free instances */<br>
&gt; +@@ -5813,7 +5816,7 @@ internalEntityProcessor(XML_Parser parser,<br>
&gt; const char *s, const char *end,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 return result;<br>
&gt; +=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0 entityTrackingOnClose(parser, entity, __LINE__);<br>
&gt; + #endif<br>
&gt; +=C2=A0=C2=A0 entity-&gt;open =3D XML_FALSE;<br>
&gt; +@@ -5892,7 +5895,7 @@ appendAttributeValue(XML_Parser parser, const<b=
r>
&gt; ENCODING *enc, XML_Bool isCdata,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const char *next<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D ptr; /* XmlAttri=
buteValueTok doesn&#39;t always set the last<br>
&gt; arg */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 int tok =3D XmlAttributeValueTok(enc, ptr, e=
nd, &amp;next);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if (! accountingDiffTolerated(parser, tok, p=
tr, next, __LINE__,<br>
&gt; account)) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accountingOnAbort(parser);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return XML_ERROR_AMPLIFICATION_L=
IMIT_BREACH;<br>
&gt; +@@ -5957,14 +5960,14 @@ appendAttributeValue(XML_Parser parser,<br>
&gt; const ENCODING *enc, XML_Bool isCdata,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_Char ch =3D (XML_Char)XmlPre=
definedEntityName(<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enc, ptr=
 + enc-&gt;minBytesPerChar, next - enc-<br>
&gt; &gt;minBytesPerChar);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ch) {<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* NOTE: We are repl=
acing 4-6 characters original input for<br>
&gt; 1 character<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 so there is no amplification and hence recording<b=
r>
&gt; without<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 protection. */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accountingDiffTolera=
ted(parser, tok, (char *)&amp;ch,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((char *)&amp;ch) + sizeof=
(XML_Char),<br>
&gt; __LINE__,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_ACCOUNT_ENTITY_EXPANSI=
ON);<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (! poolAppendChar=
(pool, ch))<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return X=
ML_ERROR_NO_MEMORY;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt; +@@ -6042,14 +6045,14 @@ appendAttributeValue(XML_Parser parser,<br>
&gt; const ENCODING *enc, XML_Bool isCdata,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum XML_Error resul=
t;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const XML_Char *text=
End =3D entity-&gt;textPtr + entity-<br>
&gt; &gt;textLen;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity-&gt;open =3D =
XML_TRUE;<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entityTrackingOnOpen=
(parser, entity, __LINE__);<br>
&gt; + #endif<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D appendAtt=
ributeValue(parser, parser-<br>
&gt; &gt;m_internalEncoding,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 isCdata, (const char<br>
&gt; *)entity-&gt;textPtr,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (const char *)textEnd, pool,<br>
&gt; +<br>
&gt; XML_ACCOUNT_ENTITY_EXPANSION);<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entityTrackingOnClos=
e(parser, entity, __LINE__);<br>
&gt; + #endif<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entity-&gt;open =3D =
XML_FALSE;<br>
&gt; +@@ -6105,7 +6108,7 @@ storeEntityValue(XML_Parser parser, const<br>
&gt; ENCODING *enc,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D entityTextPtr; /=
* XmlEntityValueTok doesn&#39;t always set<br>
&gt; the last arg */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 int tok =3D XmlEntityValueTok(enc, entityTex=
tPtr, entityTextEnd,<br>
&gt; &amp;next);<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if (! accountingDiffTolerated(parser, tok, e=
ntityTextPtr, next,<br>
&gt; __LINE__,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 account)) {<br=
>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accountingOnAbort(parser);<br>
&gt; +@@ -7651,7 +7654,7 @@ copyString(const XML_Char *s, const<br>
&gt; XML_Memory_Handling_Suite *memsuite) {<br>
&gt; +=C2=A0=C2=A0 return result;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +<br>
&gt; + static float<br>
&gt; + accountingGetCurrentAmplification(XML_Parser rootParser) {<br>
&gt; +@@ -8382,7 +8385,7 @@ unsignedCharToPrintable(unsigned char c) {<br>
&gt; +=C2=A0=C2=A0 assert(0); /* never gets here */<br>
&gt; + }<br>
&gt; +<br>
&gt; +-#endif /* XML_DTD */<br>
&gt; ++#endif /* defined(XML_DTD) || XML_GE =3D=3D 1 */<br>
&gt; +<br>
&gt; + static unsigned long<br>
&gt; + getDebugLevel(const char *variableName, unsigned long<br>
&gt; defaultDebugLevel) {<br>
&gt; +diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c<br>
&gt; +index 471f2a2..be23f5a 100644<br>
&gt; +--- a/xmlwf/xmlwf.c<br>
&gt; ++++ b/xmlwf/xmlwf.c<br>
&gt; +@@ -1062,9 +1062,10 @@ tmain(int argc, XML_Char **argv) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot; (needs a floating point number greater or equal than<br>
&gt; 1.0)&quot;));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(XMLWF_EXIT_USAG=
E_ERROR);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +-#ifndef XML_DTD<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ftprintf(stderr, T(&quot;Warning: Giv=
en amplification limit<br>
&gt; ignored&quot;) T(<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &quot;, xmlwf has been compiled without DTD<br>
&gt; support.\n&quot;));<br>
&gt; ++#if ! defined(XML_DTD) &amp;&amp; XML_GE =3D=3D 0<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ftprintf(stderr,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 T(&quot;Warning: Given amplification limit ignored&quot;=
)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T(&quot;, xmlwf has been compile=
d without DTD/GE<br>
&gt; support.\n&quot;));<br>
&gt; + #endif<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +@@ -1083,9 +1084,10 @@ tmain(int argc, XML_Char **argv) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(XMLWF_EXIT_USAG=
E_ERROR);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 attackThresholdGiven =3D XML_TRU=
E;<br>
&gt; +-#ifndef XML_DTD<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ftprintf(stderr, T(&quot;Warning: Giv=
en attack threshold ignored&quot;)<br>
&gt; T(<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &quot;, xmlwf has been compiled without DTD<br>
&gt; support.\n&quot;));<br>
&gt; ++#if ! defined(XML_DTD) &amp;&amp; XML_GE =3D=3D 0<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ftprintf(stderr,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 T(&quot;Warning: Given attack threshold ignored&quot;)<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 T(&quot;, xmlwf has been compile=
d without DTD/GE<br>
&gt; support.\n&quot;));<br>
&gt; + #endif<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +@@ -1120,13 +1122,13 @@ tmain(int argc, XML_Char **argv) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if (attackMaximumAmplification !=3D -1.0f) {=
<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_SetBillionLaughsAttackProtec=
tionMaximumAmplification(<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser, =
attackMaximumAmplification);<br>
&gt; + #endif<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if (attackThresholdGiven) {<br>
&gt; +-#ifdef XML_DTD<br>
&gt; ++#if defined(XML_DTD) || XML_GE =3D=3D 1<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XML_SetBillionLaughsAttackProtec=
tionActivationThreshold(<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parser, =
attackThresholdBytes);<br>
&gt; + #else<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta/recipes-core/expat/<a href=3D"http://expat_2.5.0.bb"=
 target=3D"_blank" rel=3D"noreferrer">expat_2.5.0.bb</a> b/meta/recipes-<br=
>
&gt; core/expat/<a href=3D"http://expat_2.5.0.bb" target=3D"_blank" rel=3D"=
noreferrer">expat_2.5.0.bb</a><br>
&gt; index 7080f934d1..e427020534 100644<br>
&gt; --- a/meta/recipes-core/expat/<a href=3D"http://expat_2.5.0.bb" target=
=3D"_blank" rel=3D"noreferrer">expat_2.5.0.bb</a><br>
&gt; +++ b/meta/recipes-core/expat/<a href=3D"http://expat_2.5.0.bb" target=
=3D"_blank" rel=3D"noreferrer">expat_2.5.0.bb</a><br>
&gt; @@ -10,6 +10,7 @@ VERSION_TAG =3D &quot;${@d.getVar(&#39;PV&#39;).repl=
ace(&#39;.&#39;,<br>
&gt; &#39;_&#39;)}&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D<br>
&gt; &quot;<a rel=3D"noreferrer"></a><a href=3D"https://github.com/libexpat=
/libexpat/releases/download/R_$%7BVERSION_T" target=3D"_blank" rel=3D"noref=
errer">https://github.com/libexpat/libexpat/releases/download/R_${VERSION_T=
</a><br>
&gt; AG}/expat-${PV}.tar.bz2=C2=A0 \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <a rel=3D"noreferrer">file://run-ptest</a> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a rel=
=3D"noreferrer">file://CVE-2023-52426.patch</a> \<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D<br>
&gt; &quot;<a href=3D"https://github.com/libexpat/libexpat/releases/" targe=
t=3D"_blank" rel=3D"noreferrer">https://github.com/libexpat/libexpat/releas=
es/</a>&quot;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</div>
</span></font></div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196973): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196973" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/196973</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104800121/953=
399" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/104800121/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000006a797e061375c92e--

