Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6782CC43602
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 16:23:58 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38731.1782491030566578660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 09:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WonuysdJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49258ac7294so8027605e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782491029; x=1783095829; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7HHRLY7iCfUNZFrq8SYqNot2KywDhffmNUBTc7Z+LU=;
        b=WonuysdJWrIzXnD8eoxhIQrnDbsUNTEJDFADmdS55RKhBTqTprOsxNZi8A5gSmRIGi
         BgsezwQ644SqcsWH2N6e6leBgS+wOgAsPZzcj0ead1fHA1bCW6gFraiUT/uT8nVnlZbw
         p4A5ABhwzHFA0kyCnxBm9GG2vhJEwRYz/gDk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491029; x=1783095829;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7HHRLY7iCfUNZFrq8SYqNot2KywDhffmNUBTc7Z+LU=;
        b=JalvMPj3T3gPgj6MweRKLEtEyPvqAYwPDDdqOUVDxICrDrhZ/Q37l5BvcT5UO0gOmc
         3PTGfu/nYfZ4bvHt2nLIWOd98mBdP6e3KlLigcIE5FslZwVCobQUc+lrKxpGf69VwHGr
         FOXntnwlukr9RtSNu6YL+HFoTIfDNuUeLiOhdZ1rbwnEj1NUROy7HssC4gQvYGn7dWgN
         RwcmC5eTb2pjKzoLjGE/EKFG7syA43OFk1ug+iT6fXEv4sbVG0Cko8isGsHVSIRUGVrp
         7Zcl6Svu+puOMNItMVCepn8pY/q5mQFclexRWt88CHb77TO70s3wq/V8IF6EtSMlaCnJ
         hQhA==
X-Forwarded-Encrypted: i=1; AFNElJ/Tl6MQwvpdv8JZjRudws2iYllc2diNd9p2N/nx6+fsLcdDEQ6aPFlu0BjgKV4bwWmN2x7McOvOxhd9vy/BI3btSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwmadeoS49/nJXXUedkJZyoVmqSg+OyGEtI1EMdrb2DT8O55OSo
	9w3aFwGI0zXJ0IKsNiqetmZIt8e8Bj5EcTv5Cx0/rfstH548IsgVviqVc2LbC7xYfHA=
X-Gm-Gg: AfdE7clzjJLErIrzUQ18i2zkYqqN4yODGl4/75kqHFLYCtXF50rbtEFxURsGwWCBwEx
	TPHIubNDDiwj/aQJD1bpg1bNGnZpOcDzDw5TfZ2SGhvP/KrkklyB/URK0ELognNDHSJ7vsJcHpj
	YxW/eOEVRxoEuSumbJleg8Eg6A7rSrZdbqYUlhm/1rtvMr/eJTarG5h6b2uO1NH+nBT0ItxAPxC
	e3p/VpKhDMSxYaESSaJQ0zWVMbKXrRKlDtcF5F3E3I4zSD+FZ+DtWvbQF+t8Lggg2naOU2xJoob
	/HPmzKlHT9H6o7rZCf7I5GkJKUhyRgx/vtP/A1OTnvUqdauJ177vlAuxX/7l8ZXqUl5mg+PB1y2
	V1hs/htxUVGpPZ4vMFo2TMCxhz78wNspepRDN8fa63bVuOcSTtUFKb4PTDs7E7qRr1WRCuFXMsY
	sCfpHIQ3oCHSgm8bsJcZ7IjMu+TPik7WzT+WIXnoDr/e4u90PEPC7ss8hn3NBCiSyFvzAUGAa84
	585Ow==
X-Received: by 2002:a05:600c:6094:b0:490:da12:f1fa with SMTP id 5b1f17b1804b1-4926689343bmr113836265e9.31.1782491028000;
        Fri, 26 Jun 2026 09:23:48 -0700 (PDT)
Received: from localhost (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9e77sm83677465e9.4.2026.06.26.09.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 09:23:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 18:23:46 +0200
Message-Id: <DJJ4C13UUF69.11ICUQHKB6WN3@smile.fr>
To: <tgaige.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] expat: patch CVE-2026-50219
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <hsimeliere.opensource@witekio.com>
X-Mailer: aerc 0.20.0
References: <20260605083239.1892200-1-tgaige.opensource@witekio.com>
In-Reply-To: <20260605083239.1892200-1-tgaige.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 16:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239653

On Fri Jun 5, 2026 at 10:32 AM CEST, Theo Gaige via lists.openembedded.org =
wrote:
> From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
>
> Backport patches from [1]
>
> [1] https://github.com/libexpat/libexpat/pull/1246

This patch is enormous for a CVE fix! It deserves more justification
than this. For example, you could detail what patch is preparation, what
patch is the proper fix...

>
> Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio=
.com>
> ---
>  .../expat/expat/CVE-2026-50219-01.patch       |  59 +++++++
>  .../expat/expat/CVE-2026-50219-02.patch       |  82 ++++++++++
>  .../expat/expat/CVE-2026-50219-03.patch       |  90 +++++++++++
>  .../expat/expat/CVE-2026-50219-04.patch       |  32 ++++
>  .../expat/expat/CVE-2026-50219-05.patch       |  46 ++++++
>  .../expat/expat/CVE-2026-50219-06.patch       | 152 ++++++++++++++++++
>  .../expat/expat/CVE-2026-50219-07.patch       |  30 ++++
>  .../expat/expat/CVE-2026-50219-08.patch       |  42 +++++
>  .../expat/expat/CVE-2026-50219-09.patch       |  42 +++++
>  .../expat/expat/CVE-2026-50219-10.patch       |  33 ++++
>  .../expat/expat/CVE-2026-50219-11.patch       |  30 ++++
>  .../expat/expat/CVE-2026-50219-12.patch       |  40 +++++
>  .../expat/expat/CVE-2026-50219-13.patch       |  47 ++++++
>  .../expat/expat/CVE-2026-50219-14.patch       |  72 +++++++++
>  .../expat/expat/CVE-2026-50219-15.patch       |  80 +++++++++
>  .../expat/expat/CVE-2026-50219-16.patch       |  44 +++++
>  .../expat/expat/CVE-2026-50219-17.patch       |  62 +++++++
>  .../expat/expat/CVE-2026-50219-18.patch       |  30 ++++
>  .../expat/expat/CVE-2026-50219-19.patch       |  85 ++++++++++
>  .../expat/expat/CVE-2026-50219-20.patch       |  60 +++++++
>  .../expat/expat/CVE-2026-50219-21.patch       |  44 +++++
>  .../expat/expat/CVE-2026-50219-22.patch       |  46 ++++++
>  .../expat/expat/CVE-2026-50219-23.patch       |  34 ++++
>  .../expat/expat/CVE-2026-50219-24.patch       |  31 ++++
>  .../expat/expat/CVE-2026-50219-25.patch       |  33 ++++
>  .../expat/expat/CVE-2026-50219-26.patch       |  31 ++++
>  .../expat/expat/CVE-2026-50219-27.patch       |  29 ++++
>  .../expat/expat/CVE-2026-50219-28.patch       |  29 ++++
>  .../expat/expat/CVE-2026-50219-29.patch       |  29 ++++
>  .../expat/expat/CVE-2026-50219-30.patch       |  29 ++++
>  .../expat/expat/CVE-2026-50219-31.patch       |  29 ++++
>  .../expat/expat/CVE-2026-50219-32.patch       |  97 +++++++++++
>  .../expat/expat/CVE-2026-50219-33.patch       |  39 +++++
>  .../expat/expat/CVE-2026-50219-34.patch       |  39 +++++
>  meta/recipes-core/expat/expat_2.6.4.bb        |  34 ++++
>  35 files changed, 1731 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-01.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-02.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-03.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-04.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-05.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-06.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-07.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-08.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-09.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-10.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-11.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-12.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-13.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-14.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-15.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-16.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-17.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-18.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-19.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-20.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-21.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-22.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-23.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-24.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-25.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-26.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-27.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-28.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-29.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-30.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-31.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-32.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-33.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-34.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-01.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-01.patch
> new file mode 100644
> index 0000000000..52c97bf26b
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-01.patch
> @@ -0,0 +1,59 @@
> +From 2225503f79c10ca8dc27cc338fbf285aa30a3808 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 15:15:10 +0200
> +Subject: [PATCH 01/34] lib: Introduce handler call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/f69d0719bf01596f1d95c9e902f4a279e62c6305]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 19 +++++++++++++++++++
> + 1 file changed, 19 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 9bc67f38..e2ed3e2d 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -784,6 +784,7 @@ struct XML_ParserStruct {
> +   ENTITY_STATS m_entity_stats;
> + #endif
> +   XML_Bool m_reenter;
> ++  unsigned m_handlerCallDepth;
> + };
> +=20
> + #if XML_GE =3D=3D 1
> +@@ -1248,6 +1249,23 @@ get_hash_secret_salt(XML_Parser parser) {
> +   return parser->m_hash_secret_salt;
> + }
> +=20
> ++static void
> ++beforeHandler(XML_Parser parser) {
> ++  assert(parser->m_handlerCallDepth < UINT_MAX);
> ++  parser->m_handlerCallDepth++;
> ++}
> ++
> ++static void
> ++afterHandler(XML_Parser parser) {
> ++  assert(parser->m_handlerCallDepth > 0);
> ++  parser->m_handlerCallDepth--;
> ++}
> ++
> ++static bool
> ++isCalledFromInsideHandler(XML_Parser parser) {
> ++  return parser->m_handlerCallDepth > 0;
> ++}
> ++
> + static enum XML_Error
> + callProcessor(XML_Parser parser, const char *start, const char *end,
> +               const char **endPtr) {
> +@@ -1600,6 +1618,7 @@ parserInit(XML_Parser parser, const XML_Char *enco=
dingName) {
> +   parser->m_parsingStatus.parsing =3D XML_INITIALIZED;
> +   // Reentry can only be triggered inside m_processor calls
> +   parser->m_reenter =3D XML_FALSE;
> ++  parser->m_handlerCallDepth =3D 0;
> + #ifdef XML_DTD
> +   parser->m_isParamEntity =3D XML_FALSE;
> +   parser->m_useForeignDTD =3D XML_FALSE;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-02.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-02.patch
> new file mode 100644
> index 0000000000..80d28e519b
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-02.patch
> @@ -0,0 +1,82 @@
> +From 63695deacefe467ddf7d4df9ae579f233608a449 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:33:26 +0200
> +Subject: [PATCH 02/34] lib: Prepare `m_notStandaloneHandler` calls for
> + upcoming wrapping
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/cdd21e84e150cc2ca961533e157bd52e3cbb4aa4]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 34 ++++++++++++++++++++++------------
> + 1 file changed, 22 insertions(+), 12 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index e2ed3e2d..1d28940f 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5450,9 +5450,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +                   entity->systemId, entity->publicId))
> +             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +           if (dtd->paramEntityRead) {
> +-            if (! dtd->standalone && parser->m_notStandaloneHandler
> +-                && ! parser->m_notStandaloneHandler(parser->m_handlerAr=
g))
> +-              return XML_ERROR_NOT_STANDALONE;
> ++            if (! dtd->standalone && parser->m_notStandaloneHandler) {
> ++              const int handlerStatus
> ++                  =3D parser->m_notStandaloneHandler(parser->m_handlerA=
rg);
> ++              if (! handlerStatus)
> ++                return XML_ERROR_NOT_STANDALONE;
> ++            }
> +           }
> +           /* if we didn't read the foreign DTD then this means that the=
re
> +              is no external subset and we must reset dtd->hasParamEntit=
yRefs
> +@@ -5490,9 +5493,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +                   entity->systemId, entity->publicId))
> +             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +           if (dtd->paramEntityRead) {
> +-            if (! dtd->standalone && parser->m_notStandaloneHandler
> +-                && ! parser->m_notStandaloneHandler(parser->m_handlerAr=
g))
> +-              return XML_ERROR_NOT_STANDALONE;
> ++            if (! dtd->standalone && parser->m_notStandaloneHandler) {
> ++              const int handlerStatus
> ++                  =3D parser->m_notStandaloneHandler(parser->m_handlerA=
rg);
> ++              if (! handlerStatus)
> ++                return XML_ERROR_NOT_STANDALONE;
> ++            }
> +           }
> +           /* if we didn't read the foreign DTD then this means that the=
re
> +              is no external subset and we must reset dtd->hasParamEntit=
yRefs
> +@@ -5702,9 +5708,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> + #ifdef XML_DTD
> +           && ! parser->m_paramEntityParsing
> + #endif /* XML_DTD */
> +-          && parser->m_notStandaloneHandler
> +-          && ! parser->m_notStandaloneHandler(parser->m_handlerArg))
> +-        return XML_ERROR_NOT_STANDALONE;
> ++          && parser->m_notStandaloneHandler) {
> ++        const int status =3D parser->m_notStandaloneHandler(parser->m_h=
andlerArg);
> ++        if (! status)
> ++          return XML_ERROR_NOT_STANDALONE;
> ++      }
> + #ifndef XML_DTD
> +       break;
> + #else  /* XML_DTD */
> +@@ -6093,9 +6101,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +         }
> +       }
> + #endif /* XML_DTD */
> +-      if (! dtd->standalone && parser->m_notStandaloneHandler
> +-          && ! parser->m_notStandaloneHandler(parser->m_handlerArg))
> +-        return XML_ERROR_NOT_STANDALONE;
> ++      if (! dtd->standalone && parser->m_notStandaloneHandler) {
> ++        const int status =3D parser->m_notStandaloneHandler(parser->m_h=
andlerArg);
> ++        if (! status)
> ++          return XML_ERROR_NOT_STANDALONE;
> ++      }
> +       break;
> +=20
> +       /* Element declaration stuff */
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-03.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-03.patch
> new file mode 100644
> index 0000000000..687c706167
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-03.patch
> @@ -0,0 +1,90 @@
> +From b7e3a0a77f1d62b03f198817668e17a794a56171 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sat, 30 May 2026 00:45:34 +0200
> +Subject: [PATCH 03/34] lib: Prepare `m_externalEntityRefHandler` calls f=
or
> + upcoming wrapping
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/1ffe852fe1d8e1d73eb4eb5798456aefc8300299]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 35 ++++++++++++++++++++---------------
> + 1 file changed, 20 insertions(+), 15 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 1d28940f..07f63928 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3467,9 +3467,10 @@ doContent(XML_Parser parser, int startTagLevel, c=
onst ENCODING *enc,
> +         entity->open =3D XML_FALSE;
> +         if (! context)
> +           return XML_ERROR_NO_MEMORY;
> +-        if (! parser->m_externalEntityRefHandler(
> +-                parser->m_externalEntityRefHandlerArg, context, entity-=
>base,
> +-                entity->systemId, entity->publicId))
> ++        const int status =3D parser->m_externalEntityRefHandler(
> ++            parser->m_externalEntityRefHandlerArg, context, entity->bas=
e,
> ++            entity->systemId, entity->publicId);
> ++        if (! status)
> +           return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +         poolDiscard(&parser->m_tempPool);
> +       } else if (parser->m_defaultHandler)
> +@@ -5445,9 +5446,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +           if (parser->m_useForeignDTD)
> +             entity->base =3D parser->m_curBase;
> +           dtd->paramEntityRead =3D XML_FALSE;
> +-          if (! parser->m_externalEntityRefHandler(
> +-                  parser->m_externalEntityRefHandlerArg, 0, entity->bas=
e,
> +-                  entity->systemId, entity->publicId))
> ++          const int status =3D parser->m_externalEntityRefHandler(
> ++              parser->m_externalEntityRefHandlerArg, 0, entity->base,
> ++              entity->systemId, entity->publicId);
> ++          if (! status)
> +             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +           if (dtd->paramEntityRead) {
> +             if (! dtd->standalone && parser->m_notStandaloneHandler) {
> +@@ -5488,9 +5490,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +             return XML_ERROR_NO_MEMORY;
> +           entity->base =3D parser->m_curBase;
> +           dtd->paramEntityRead =3D XML_FALSE;
> +-          if (! parser->m_externalEntityRefHandler(
> +-                  parser->m_externalEntityRefHandlerArg, 0, entity->bas=
e,
> +-                  entity->systemId, entity->publicId))
> ++          const int status =3D parser->m_externalEntityRefHandler(
> ++              parser->m_externalEntityRefHandlerArg, 0, entity->base,
> ++              entity->systemId, entity->publicId);
> ++          if (! status)
> +             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +           if (dtd->paramEntityRead) {
> +             if (! dtd->standalone && parser->m_notStandaloneHandler) {
> +@@ -6081,9 +6084,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +           dtd->paramEntityRead =3D XML_FALSE;
> +           entity->open =3D XML_TRUE;
> +           entityTrackingOnOpen(parser, entity, __LINE__);
> +-          if (! parser->m_externalEntityRefHandler(
> +-                  parser->m_externalEntityRefHandlerArg, 0, entity->bas=
e,
> +-                  entity->systemId, entity->publicId)) {
> ++          const int status =3D parser->m_externalEntityRefHandler(
> ++              parser->m_externalEntityRefHandlerArg, 0, entity->base,
> ++              entity->systemId, entity->publicId);
> ++          if (! status) {
> +             entityTrackingOnClose(parser, entity, __LINE__);
> +             entity->open =3D XML_FALSE;
> +             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +@@ -6873,9 +6877,10 @@ storeEntityValue(XML_Parser parser, const ENCODIN=
G *enc,
> +             dtd->paramEntityRead =3D XML_FALSE;
> +             entity->open =3D XML_TRUE;
> +             entityTrackingOnOpen(parser, entity, __LINE__);
> +-            if (! parser->m_externalEntityRefHandler(
> +-                    parser->m_externalEntityRefHandlerArg, 0, entity->b=
ase,
> +-                    entity->systemId, entity->publicId)) {
> ++            const int status =3D parser->m_externalEntityRefHandler(
> ++                parser->m_externalEntityRefHandlerArg, 0, entity->base,
> ++                entity->systemId, entity->publicId);
> ++            if (! status) {
> +               entityTrackingOnClose(parser, entity, __LINE__);
> +               entity->open =3D XML_FALSE;
> +               result =3D XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-04.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-04.patch
> new file mode 100644
> index 0000000000..a36f96e16f
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-04.patch
> @@ -0,0 +1,32 @@
> +From 8d7a4bd5734d401a29f912365e80ee6900f2d877 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sat, 30 May 2026 00:46:36 +0200
> +Subject: [PATCH 04/34] lib: Prepare `m_unknownEncodingHandler` calls for
> + upcoming wrapping
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/adcafd4316259ef48b1763e584733a7bff4a8db0]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 07f63928..c5aad0dc 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -4970,8 +4970,9 @@ handleUnknownEncoding(XML_Parser parser, const XML=
_Char *encodingName) {
> +     info.convert =3D NULL;
> +     info.data =3D NULL;
> +     info.release =3D NULL;
> +-    if (parser->m_unknownEncodingHandler(parser->m_unknownEncodingHandl=
erData,
> +-                                         encodingName, &info)) {
> ++    const int status =3D parser->m_unknownEncodingHandler(
> ++        parser->m_unknownEncodingHandlerData, encodingName, &info);
> ++    if (status) {
> +       ENCODING *enc;
> +       parser->m_unknownEncodingMem =3D MALLOC(parser, XmlSizeOfUnknownE=
ncoding());
> +       if (! parser->m_unknownEncodingMem) {
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-05.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-05.patch
> new file mode 100644
> index 0000000000..78c0b4d68e
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-05.patch
> @@ -0,0 +1,46 @@
> +From bf93761c4a40fd32d49fcbe96fea58fc8ecf01a9 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:05:19 +0200
> +Subject: [PATCH 05/34] lib: Register `m_attlistDeclHandler` with handler=
 call
> + depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/781092f189a8c8e8be6640258829a7f783864282]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index c5aad0dc..1551691b 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5595,10 +5595,12 @@ doProlog(XML_Parser parser, const ENCODING *enc,=
 const char *s, const char *end,
> +             poolFinish(&parser->m_tempPool);
> +           }
> +           *eventEndPP =3D s;
> ++          beforeHandler(parser);
> +           parser->m_attlistDeclHandler(
> +               parser->m_handlerArg, parser->m_declElementType->name,
> +               parser->m_declAttributeId->name, parser->m_declAttributeT=
ype, 0,
> +               role =3D=3D XML_ROLE_REQUIRED_ATTRIBUTE_VALUE);
> ++          afterHandler(parser);
> +           handleDefault =3D XML_FALSE;
> +         }
> +       }
> +@@ -5633,10 +5635,12 @@ doProlog(XML_Parser parser, const ENCODING *enc,=
 const char *s, const char *end,
> +             poolFinish(&parser->m_tempPool);
> +           }
> +           *eventEndPP =3D s;
> ++          beforeHandler(parser);
> +           parser->m_attlistDeclHandler(
> +               parser->m_handlerArg, parser->m_declElementType->name,
> +               parser->m_declAttributeId->name, parser->m_declAttributeT=
ype,
> +               attVal, role =3D=3D XML_ROLE_FIXED_ATTRIBUTE_VALUE);
> ++          afterHandler(parser);
> +           poolClear(&parser->m_tempPool);
> +           handleDefault =3D XML_FALSE;
> +         }
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-06.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-06.patch
> new file mode 100644
> index 0000000000..6eb1f12ee4
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-06.patch
> @@ -0,0 +1,152 @@
> +From 2becec67ac41e2fcf8393bb59bf28996ad4fe6d4 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:08:02 +0200
> +Subject: [PATCH 06/34] lib: Register `m_characterDataHandler` with handl=
er
> + call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/5ee607587a997220a48e78b5f6c55a05e50e5b20]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 44 ++++++++++++++++++++++++++++++++++----------
> + 1 file changed, 34 insertions(+), 10 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 1551691b..480d9672 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3362,7 +3362,9 @@ doContent(XML_Parser parser, int startTagLevel, co=
nst ENCODING *enc,
> +       *eventEndPP =3D end;
> +       if (parser->m_characterDataHandler) {
> +         XML_Char c =3D 0xA;
> ++        beforeHandler(parser);
> +         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);
> ++        afterHandler(parser);
> +       } else if (parser->m_defaultHandler)
> +         reportDefault(parser, enc, s, end);
> +       /* We are at the end of the final buffer, should we check for
> +@@ -3415,9 +3417,11 @@ doContent(XML_Parser parser, int startTagLevel, c=
onst ENCODING *enc,
> +                                 ((char *)&ch) + sizeof(XML_Char), __LIN=
E__,
> +                                 XML_ACCOUNT_ENTITY_EXPANSION);
> + #endif /* XML_GE =3D=3D 1 */
> +-        if (parser->m_characterDataHandler)
> ++        if (parser->m_characterDataHandler) {
> ++          beforeHandler(parser);
> +           parser->m_characterDataHandler(parser->m_handlerArg, &ch, 1);
> +-        else if (parser->m_defaultHandler)
> ++          afterHandler(parser);
> ++        } else if (parser->m_defaultHandler)
> +           reportDefault(parser, enc, s, next);
> +         break;
> +       }
> +@@ -3663,8 +3667,10 @@ doContent(XML_Parser parser, int startTagLevel, c=
onst ENCODING *enc,
> +         return XML_ERROR_BAD_CHAR_REF;
> +       if (parser->m_characterDataHandler) {
> +         XML_Char buf[XML_ENCODE_MAX];
> ++        beforeHandler(parser);
> +         parser->m_characterDataHandler(parser->m_handlerArg, buf,
> +                                        XmlEncode(n, (ICHAR *)buf));
> ++        afterHandler(parser);
> +       } else if (parser->m_defaultHandler)
> +         reportDefault(parser, enc, s, next);
> +     } break;
> +@@ -3673,7 +3679,9 @@ doContent(XML_Parser parser, int startTagLevel, co=
nst ENCODING *enc,
> +     case XML_TOK_DATA_NEWLINE:
> +       if (parser->m_characterDataHandler) {
> +         XML_Char c =3D 0xA;
> ++        beforeHandler(parser);
> +         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);
> ++        afterHandler(parser);
> +       } else if (parser->m_defaultHandler)
> +         reportDefault(parser, enc, s, next);
> +       break;
> +@@ -3694,11 +3702,13 @@ doContent(XML_Parser parser, int startTagLevel, =
const ENCODING *enc,
> +          However, now we have a start/endCdataSectionHandler, so it see=
ms
> +          easier to let the user deal with this.
> +       */
> +-      else if ((0) && parser->m_characterDataHandler)
> ++      else if ((0) && parser->m_characterDataHandler) {
> ++        beforeHandler(parser);
> +         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_=
dataBuf,
> +                                        0);
> +-      /* END disabled code */
> +-      else if (parser->m_defaultHandler)
> ++        afterHandler(parser);
> ++        /* END disabled code */
> ++      } else if (parser->m_defaultHandler)
> +         reportDefault(parser, enc, s, next);
> +       result
> +           =3D doCdataSection(parser, enc, &next, end, nextPtr, haveMore=
, account);
> +@@ -3718,13 +3728,18 @@ doContent(XML_Parser parser, int startTagLevel, =
const ENCODING *enc,
> +         if (MUST_CONVERT(enc, s)) {
> +           ICHAR *dataPtr =3D (ICHAR *)parser->m_dataBuf;
> +           XmlConvert(enc, &s, end, &dataPtr, (ICHAR *)parser->m_dataBuf=
End);
> ++          beforeHandler(parser);
> +           parser->m_characterDataHandler(
> +               parser->m_handlerArg, parser->m_dataBuf,
> +               (int)(dataPtr - (ICHAR *)parser->m_dataBuf));
> +-        } else
> ++          afterHandler(parser);
> ++        } else {
> ++          beforeHandler(parser);
> +           parser->m_characterDataHandler(
> +               parser->m_handlerArg, (const XML_Char *)s,
> +               (int)((const XML_Char *)end - (const XML_Char *)s));
> ++          afterHandler(parser);
> ++        }
> +       } else if (parser->m_defaultHandler)
> +         reportDefault(parser, enc, s, end);
> +       /* We are at the end of the final buffer, should we check for
> +@@ -3749,16 +3764,21 @@ doContent(XML_Parser parser, int startTagLevel, =
const ENCODING *enc,
> +             const enum XML_Convert_Result convert_res =3D XmlConvert(
> +                 enc, &s, next, &dataPtr, (ICHAR *)parser->m_dataBufEnd)=
;
> +             *eventEndPP =3D s;
> ++            beforeHandler(parser);
> +             charDataHandler(parser->m_handlerArg, parser->m_dataBuf,
> +                             (int)(dataPtr - (ICHAR *)parser->m_dataBuf)=
);
> ++            afterHandler(parser);
> +             if ((convert_res =3D=3D XML_CONVERT_COMPLETED)
> +                 || (convert_res =3D=3D XML_CONVERT_INPUT_INCOMPLETE))
> +               break;
> +             *eventPP =3D s;
> +           }
> +-        } else
> ++        } else {
> ++          beforeHandler(parser);
> +           charDataHandler(parser->m_handlerArg, (const XML_Char *)s,
> +                           (int)((const XML_Char *)next - (const XML_Cha=
r *)s));
> ++          afterHandler(parser);
> ++        }
> +       } else if (parser->m_defaultHandler)
> +         reportDefault(parser, enc, s, next);
> +     } break;
> +@@ -4643,11 +4663,13 @@ doCdataSection(XML_Parser parser, const ENCODING=
 *enc, const char **startPtr,
> +         parser->m_endCdataSectionHandler(parser->m_handlerArg);
> +       /* BEGIN disabled code */
> +       /* see comment under XML_TOK_CDATA_SECT_OPEN */
> +-      else if ((0) && parser->m_characterDataHandler)
> ++      else if ((0) && parser->m_characterDataHandler) {
> ++        beforeHandler(parser);
> +         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_=
dataBuf,
> +                                        0);
> +-      /* END disabled code */
> +-      else if (parser->m_defaultHandler)
> ++        afterHandler(parser);
> ++        /* END disabled code */
> ++      } else if (parser->m_defaultHandler)
> +         reportDefault(parser, enc, s, next);
> +       *startPtr =3D next;
> +       *nextPtr =3D next;
> +@@ -4658,7 +4680,9 @@ doCdataSection(XML_Parser parser, const ENCODING *=
enc, const char **startPtr,
> +     case XML_TOK_DATA_NEWLINE:
> +       if (parser->m_characterDataHandler) {
> +         XML_Char c =3D 0xA;
> ++        beforeHandler(parser);
> +         parser->m_characterDataHandler(parser->m_handlerArg, &c, 1);
> ++        afterHandler(parser);
> +       } else if (parser->m_defaultHandler)
> +         reportDefault(parser, enc, s, next);
> +       break;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-07.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-07.patch
> new file mode 100644
> index 0000000000..35928cdbfd
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-07.patch
> @@ -0,0 +1,30 @@
> +From e4c15c4600f0a50fd03b4e23cb79c89a2ce6faa9 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:08:40 +0200
> +Subject: [PATCH 07/34] lib: Register `m_commentHandler` with handler cal=
l
> + depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/0e7dbfee7912a8e25aace775be47e5ad570b9cc3]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 480d9672..d1258b81 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -7178,7 +7178,9 @@ reportComment(XML_Parser parser, const ENCODING *e=
nc, const char *start,
> +   if (! data)
> +     return 0;
> +   normalizeLines(data);
> ++  beforeHandler(parser);
> +   parser->m_commentHandler(parser->m_handlerArg, data);
> ++  afterHandler(parser);
> +   poolClear(&parser->m_tempPool);
> +   return 1;
> + }
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-08.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-08.patch
> new file mode 100644
> index 0000000000..3691e6728d
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-08.patch
> @@ -0,0 +1,42 @@
> +From 8e1f2385d561cf1862376759ca85290bd4dba62a Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:14:10 +0200
> +Subject: [PATCH 08/34] lib: Register `m_defaultHandler` with handler cal=
l
> + depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/e5b76bd58dd9984cef46c2a66a98b03c95a3c774]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index d1258b81..23cb2c21 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -7221,15 +7221,20 @@ reportDefault(XML_Parser parser, const ENCODING =
*enc, const char *s,
> +       convert_res
> +           =3D XmlConvert(enc, &s, end, &dataPtr, (ICHAR *)parser->m_dat=
aBufEnd);
> +       *eventEndPP =3D s;
> ++      beforeHandler(parser);
> +       parser->m_defaultHandler(parser->m_handlerArg, parser->m_dataBuf,
> +                                (int)(dataPtr - (ICHAR *)parser->m_dataB=
uf));
> ++      afterHandler(parser);
> +       *eventPP =3D s;
> +     } while ((convert_res !=3D XML_CONVERT_COMPLETED)
> +              && (convert_res !=3D XML_CONVERT_INPUT_INCOMPLETE));
> +-  } else
> ++  } else {
> ++    beforeHandler(parser);
> +     parser->m_defaultHandler(
> +         parser->m_handlerArg, (const XML_Char *)s,
> +         (int)((const XML_Char *)end - (const XML_Char *)s));
> ++    afterHandler(parser);
> ++  }
> + }
> +=20
> + static int
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-09.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-09.patch
> new file mode 100644
> index 0000000000..781e045900
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-09.patch
> @@ -0,0 +1,42 @@
> +From 6852f7b0f8c2ef160aeee1b45d8943e2771cfc68 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:15:01 +0200
> +Subject: [PATCH 09/34] lib: Register `m_elementDeclHandler` with handler=
 call
> + depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/b4a711a33591c0d45d6e630ed6448dcbc5534700]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 23cb2c21..3ff60ce4 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -6173,8 +6173,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +           content->type =3D ((role =3D=3D XML_ROLE_CONTENT_ANY) ? XML_C=
TYPE_ANY
> +                                                           : XML_CTYPE_E=
MPTY);
> +           *eventEndPP =3D s;
> ++          beforeHandler(parser);
> +           parser->m_elementDeclHandler(
> +               parser->m_handlerArg, parser->m_declElementType->name, co=
ntent);
> ++          afterHandler(parser);
> +           handleDefault =3D XML_FALSE;
> +         }
> +         dtd->in_eldecl =3D XML_FALSE;
> +@@ -6256,8 +6258,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +             if (! model)
> +               return XML_ERROR_NO_MEMORY;
> +             *eventEndPP =3D s;
> ++            beforeHandler(parser);
> +             parser->m_elementDeclHandler(
> +                 parser->m_handlerArg, parser->m_declElementType->name, =
model);
> ++            afterHandler(parser);
> +           }
> +           dtd->in_eldecl =3D XML_FALSE;
> +           dtd->contentStringLen =3D 0;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-10.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-10.patch
> new file mode 100644
> index 0000000000..9aac151867
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-10.patch
> @@ -0,0 +1,33 @@
> +From 2c3ffbacf4dbe1e71da7ba2bac347ffcca278597 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:15:40 +0200
> +Subject: [PATCH 10/34] lib: Register `m_endCdataSectionHandler` with han=
dler
> + call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/b08e08c0558152a4180597a3e880dc70040c2b2a]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 3ff60ce4..61890253 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -4659,8 +4659,11 @@ doCdataSection(XML_Parser parser, const ENCODING =
*enc, const char **startPtr,
> +     *eventEndPP =3D next;
> +     switch (tok) {
> +     case XML_TOK_CDATA_SECT_CLOSE:
> +-      if (parser->m_endCdataSectionHandler)
> ++      if (parser->m_endCdataSectionHandler) {
> ++        beforeHandler(parser);
> +         parser->m_endCdataSectionHandler(parser->m_handlerArg);
> ++        afterHandler(parser);
> ++      }
> +       /* BEGIN disabled code */
> +       /* see comment under XML_TOK_CDATA_SECT_OPEN */
> +       else if ((0) && parser->m_characterDataHandler) {
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-11.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-11.patch
> new file mode 100644
> index 0000000000..bbb291bf79
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-11.patch
> @@ -0,0 +1,30 @@
> +From c5d62ac8641754fc5c176c15afe0314b0ddb8778 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:16:13 +0200
> +Subject: [PATCH 11/34] lib: Register `m_endDoctypeDeclHandler` with hand=
ler
> + call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/bd454febe07b931e638f2186755585b67a738d31]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 61890253..9d8d9de9 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5498,7 +5498,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,
> +       }
> + #endif /* XML_DTD */
> +       if (parser->m_endDoctypeDeclHandler) {
> ++        beforeHandler(parser);
> +         parser->m_endDoctypeDeclHandler(parser->m_handlerArg);
> ++        afterHandler(parser);
> +         handleDefault =3D XML_FALSE;
> +       }
> +       break;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-12.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-12.patch
> new file mode 100644
> index 0000000000..0ee5a143d0
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-12.patch
> @@ -0,0 +1,40 @@
> +From 9510f4cec802ea02c6766e34e823ba4f00d1e4b7 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:17:10 +0200
> +Subject: [PATCH 12/34] lib: Register `m_endElementHandler` with handler =
call
> + depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/e411d9907b8addb334d1ed5db1afd5b5bf625f24]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 9d8d9de9..9e95b284 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3579,7 +3579,9 @@ doContent(XML_Parser parser, int startTagLevel, co=
nst ENCODING *enc,
> +       if (parser->m_endElementHandler) {
> +         if (parser->m_startElementHandler)
> +           *eventPP =3D *eventEndPP;
> ++        beforeHandler(parser);
> +         parser->m_endElementHandler(parser->m_handlerArg, name.str);
> ++        afterHandler(parser);
> +         noElmHandlers =3D XML_FALSE;
> +       }
> +       if (noElmHandlers && parser->m_defaultHandler)
> +@@ -3637,7 +3639,9 @@ doContent(XML_Parser parser, int startTagLevel, co=
nst ENCODING *enc,
> +             }
> +             *uri =3D XML_T('\0');
> +           }
> ++          beforeHandler(parser);
> +           parser->m_endElementHandler(parser->m_handlerArg, tag->name.s=
tr);
> ++          afterHandler(parser);
> +         } else if (parser->m_defaultHandler)
> +           reportDefault(parser, enc, s, next);
> +         while (tag->bindings) {
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-13.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-13.patch
> new file mode 100644
> index 0000000000..56b6546043
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-13.patch
> @@ -0,0 +1,47 @@
> +From faecc1168a844fda20c604365dcf01200dd897ed Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:23:59 +0200
> +Subject: [PATCH 13/34] lib: Register `m_endNamespaceDeclHandler` with ha=
ndler
> + call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/274aa82340fe1b2205e8e3ae1cd35e2168cd42e8]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 10 ++++++++--
> + 1 file changed, 8 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 9e95b284..e4c5616e 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3646,9 +3646,12 @@ doContent(XML_Parser parser, int startTagLevel, c=
onst ENCODING *enc,
> +           reportDefault(parser, enc, s, next);
> +         while (tag->bindings) {
> +           BINDING *b =3D tag->bindings;
> +-          if (parser->m_endNamespaceDeclHandler)
> ++          if (parser->m_endNamespaceDeclHandler) {
> ++            beforeHandler(parser);
> +             parser->m_endNamespaceDeclHandler(parser->m_handlerArg,
> +                                               b->prefix->name);
> ++            afterHandler(parser);
> ++          }
> +           tag->bindings =3D tag->bindings->nextTagBinding;
> +           b->nextTagBinding =3D parser->m_freeBindingList;
> +           parser->m_freeBindingList =3D b;
> +@@ -3840,8 +3843,11 @@ freeBindings(XML_Parser parser, BINDING *bindings=
) {
> +     /* m_startNamespaceDeclHandler will have been called for this
> +      * binding in addBindings(), so call the end handler now.
> +      */
> +-    if (parser->m_endNamespaceDeclHandler)
> ++    if (parser->m_endNamespaceDeclHandler) {
> ++      beforeHandler(parser);
> +       parser->m_endNamespaceDeclHandler(parser->m_handlerArg, b->prefix=
->name);
> ++      afterHandler(parser);
> ++    }
> +=20
> +     bindings =3D bindings->nextTagBinding;
> +     b->nextTagBinding =3D parser->m_freeBindingList;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-14.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-14.patch
> new file mode 100644
> index 0000000000..9ff3e03b13
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-14.patch
> @@ -0,0 +1,72 @@
> +From 7790f829712eb6ecb60f8a325f81017a6073c1a5 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:25:42 +0200
> +Subject: [PATCH 14/34] lib: Register `m_entityDeclHandler` with handler =
call
> + depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/6e62649e6b25eb789166b9131dfadfe9d806f5ce]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index e4c5616e..c2d3ef60 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5700,10 +5700,12 @@ doProlog(XML_Parser parser, const ENCODING *enc,=
 const char *s, const char *end,
> +           poolFinish(&dtd->entityValuePool);
> +           if (parser->m_entityDeclHandler) {
> +             *eventEndPP =3D s;
> ++            beforeHandler(parser);
> +             parser->m_entityDeclHandler(
> +                 parser->m_handlerArg, parser->m_declEntity->name,
> +                 parser->m_declEntity->is_param, parser->m_declEntity->t=
extPtr,
> +                 parser->m_declEntity->textLen, parser->m_curBase, 0, 0,=
 0);
> ++            afterHandler(parser);
> +             handleDefault =3D XML_FALSE;
> +           }
> +         } else
> +@@ -5721,10 +5723,12 @@ doProlog(XML_Parser parser, const ENCODING *enc,=
 const char *s, const char *end,
> +=20
> +           if (parser->m_entityDeclHandler) {
> +             *eventEndPP =3D s;
> ++            beforeHandler(parser);
> +             parser->m_entityDeclHandler(
> +                 parser->m_handlerArg, parser->m_declEntity->name,
> +                 parser->m_declEntity->is_param, parser->m_declEntity->t=
extPtr,
> +                 parser->m_declEntity->textLen, parser->m_curBase, 0, 0,=
 0);
> ++            afterHandler(parser);
> +             handleDefault =3D XML_FALSE;
> +           }
> +         }
> +@@ -5802,10 +5806,12 @@ doProlog(XML_Parser parser, const ENCODING *enc,=
 const char *s, const char *end,
> +       if (dtd->keepProcessing && parser->m_declEntity
> +           && parser->m_entityDeclHandler) {
> +         *eventEndPP =3D s;
> ++        beforeHandler(parser);
> +         parser->m_entityDeclHandler(
> +             parser->m_handlerArg, parser->m_declEntity->name,
> +             parser->m_declEntity->is_param, 0, 0, parser->m_declEntity-=
>base,
> +             parser->m_declEntity->systemId, parser->m_declEntity->publi=
cId, 0);
> ++        afterHandler(parser);
> +         handleDefault =3D XML_FALSE;
> +       }
> +       break;
> +@@ -5825,10 +5831,12 @@ doProlog(XML_Parser parser, const ENCODING *enc,=
 const char *s, const char *end,
> +           handleDefault =3D XML_FALSE;
> +         } else if (parser->m_entityDeclHandler) {
> +           *eventEndPP =3D s;
> ++          beforeHandler(parser);
> +           parser->m_entityDeclHandler(
> +               parser->m_handlerArg, parser->m_declEntity->name, 0, 0, 0=
,
> +               parser->m_declEntity->base, parser->m_declEntity->systemI=
d,
> +               parser->m_declEntity->publicId, parser->m_declEntity->not=
ation);
> ++          afterHandler(parser);
> +           handleDefault =3D XML_FALSE;
> +         }
> +       }
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-15.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-15.patch
> new file mode 100644
> index 0000000000..648ee4ef8d
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-15.patch
> @@ -0,0 +1,80 @@
> +From eef385983d91a4675cc992ee1352e7093cbffffa Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sat, 30 May 2026 00:45:50 +0200
> +Subject: [PATCH 15/34] lib: Register `m_externalEntityRefHandler` with h=
andler
> + call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/d4ba1c29165de39605b799223392dfb28bed85d5]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index c2d3ef60..830d5963 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3471,9 +3471,11 @@ doContent(XML_Parser parser, int startTagLevel, c=
onst ENCODING *enc,
> +         entity->open =3D XML_FALSE;
> +         if (! context)
> +           return XML_ERROR_NO_MEMORY;
> ++        beforeHandler(parser);
> +         const int status =3D parser->m_externalEntityRefHandler(
> +             parser->m_externalEntityRefHandlerArg, context, entity->bas=
e,
> +             entity->systemId, entity->publicId);
> ++        afterHandler(parser);
> +         if (! status)
> +           return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +         poolDiscard(&parser->m_tempPool);
> +@@ -5484,9 +5486,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +           if (parser->m_useForeignDTD)
> +             entity->base =3D parser->m_curBase;
> +           dtd->paramEntityRead =3D XML_FALSE;
> ++          beforeHandler(parser);
> +           const int status =3D parser->m_externalEntityRefHandler(
> +               parser->m_externalEntityRefHandlerArg, 0, entity->base,
> +               entity->systemId, entity->publicId);
> ++          afterHandler(parser);
> +           if (! status)
> +             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +           if (dtd->paramEntityRead) {
> +@@ -5530,9 +5534,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +             return XML_ERROR_NO_MEMORY;
> +           entity->base =3D parser->m_curBase;
> +           dtd->paramEntityRead =3D XML_FALSE;
> ++          beforeHandler(parser);
> +           const int status =3D parser->m_externalEntityRefHandler(
> +               parser->m_externalEntityRefHandlerArg, 0, entity->base,
> +               entity->systemId, entity->publicId);
> ++          afterHandler(parser);
> +           if (! status)
> +             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +           if (dtd->paramEntityRead) {
> +@@ -6136,9 +6142,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +           dtd->paramEntityRead =3D XML_FALSE;
> +           entity->open =3D XML_TRUE;
> +           entityTrackingOnOpen(parser, entity, __LINE__);
> ++          beforeHandler(parser);
> +           const int status =3D parser->m_externalEntityRefHandler(
> +               parser->m_externalEntityRefHandlerArg, 0, entity->base,
> +               entity->systemId, entity->publicId);
> ++          afterHandler(parser);
> +           if (! status) {
> +             entityTrackingOnClose(parser, entity, __LINE__);
> +             entity->open =3D XML_FALSE;
> +@@ -6933,9 +6941,11 @@ storeEntityValue(XML_Parser parser, const ENCODIN=
G *enc,
> +             dtd->paramEntityRead =3D XML_FALSE;
> +             entity->open =3D XML_TRUE;
> +             entityTrackingOnOpen(parser, entity, __LINE__);
> ++            beforeHandler(parser);
> +             const int status =3D parser->m_externalEntityRefHandler(
> +                 parser->m_externalEntityRefHandlerArg, 0, entity->base,
> +                 entity->systemId, entity->publicId);
> ++            afterHandler(parser);
> +             if (! status) {
> +               entityTrackingOnClose(parser, entity, __LINE__);
> +               entity->open =3D XML_FALSE;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-16.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-16.patch
> new file mode 100644
> index 0000000000..52541b642e
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-16.patch
> @@ -0,0 +1,44 @@
> +From bf963b8553bb11fcf4f42da91c7a0311265d3990 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:27:13 +0200
> +Subject: [PATCH 16/34] lib: Register `m_notationDeclHandler` with handle=
r call
> + depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/4739ad3fda250cf458d396d9c17a0e0fef571bdd]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 830d5963..a16cd70b 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5949,9 +5949,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +         if (! systemId)
> +           return XML_ERROR_NO_MEMORY;
> +         *eventEndPP =3D s;
> ++        beforeHandler(parser);
> +         parser->m_notationDeclHandler(
> +             parser->m_handlerArg, parser->m_declNotationName, parser->m=
_curBase,
> +             systemId, parser->m_declNotationPublicId);
> ++        afterHandler(parser);
> +         handleDefault =3D XML_FALSE;
> +       }
> +       poolClear(&parser->m_tempPool);
> +@@ -5959,9 +5961,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +     case XML_ROLE_NOTATION_NO_SYSTEM_ID:
> +       if (parser->m_declNotationPublicId && parser->m_notationDeclHandl=
er) {
> +         *eventEndPP =3D s;
> ++        beforeHandler(parser);
> +         parser->m_notationDeclHandler(
> +             parser->m_handlerArg, parser->m_declNotationName, parser->m=
_curBase,
> +             0, parser->m_declNotationPublicId);
> ++        afterHandler(parser);
> +         handleDefault =3D XML_FALSE;
> +       }
> +       poolClear(&parser->m_tempPool);
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-17.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-17.patch
> new file mode 100644
> index 0000000000..97b3a52ff9
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-17.patch
> @@ -0,0 +1,62 @@
> +From cc21091dc63dbe984ea15872ce80dec2a4021517 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:34:29 +0200
> +Subject: [PATCH 17/34] lib: Register `m_notStandaloneHandler` with handl=
er
> + call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/d7a9c975ceeaa24c730e50fef2bedff5f99d2172]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index a16cd70b..4c4708d5 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5495,8 +5495,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +           if (dtd->paramEntityRead) {
> +             if (! dtd->standalone && parser->m_notStandaloneHandler) {
> ++              beforeHandler(parser);
> +               const int handlerStatus
> +                   =3D parser->m_notStandaloneHandler(parser->m_handlerA=
rg);
> ++              afterHandler(parser);
> +               if (! handlerStatus)
> +                 return XML_ERROR_NOT_STANDALONE;
> +             }
> +@@ -5543,8 +5545,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> +           if (dtd->paramEntityRead) {
> +             if (! dtd->standalone && parser->m_notStandaloneHandler) {
> ++              beforeHandler(parser);
> +               const int handlerStatus
> +                   =3D parser->m_notStandaloneHandler(parser->m_handlerA=
rg);
> ++              afterHandler(parser);
> +               if (! handlerStatus)
> +                 return XML_ERROR_NOT_STANDALONE;
> +             }
> +@@ -5766,7 +5770,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,
> +           && ! parser->m_paramEntityParsing
> + #endif /* XML_DTD */
> +           && parser->m_notStandaloneHandler) {
> ++        beforeHandler(parser);
> +         const int status =3D parser->m_notStandaloneHandler(parser->m_h=
andlerArg);
> ++        afterHandler(parser);
> +         if (! status)
> +           return XML_ERROR_NOT_STANDALONE;
> +       }
> +@@ -6170,7 +6176,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,
> +       }
> + #endif /* XML_DTD */
> +       if (! dtd->standalone && parser->m_notStandaloneHandler) {
> ++        beforeHandler(parser);
> +         const int status =3D parser->m_notStandaloneHandler(parser->m_h=
andlerArg);
> ++        afterHandler(parser);
> +         if (! status)
> +           return XML_ERROR_NOT_STANDALONE;
> +       }
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-18.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-18.patch
> new file mode 100644
> index 0000000000..6ce48b881a
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-18.patch
> @@ -0,0 +1,30 @@
> +From 66b312e7ff31f5c824863210ca70710d7b200011 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:35:08 +0200
> +Subject: [PATCH 18/34] lib: Register `m_processingInstructionHandler` wi=
th
> + handler call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/8bb00d345d5f92b17a06e01a926ee1dda797e0af]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 4c4708d5..407d7e0d 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -7207,7 +7207,9 @@ reportProcessingInstruction(XML_Parser parser, con=
st ENCODING *enc,
> +   if (! data)
> +     return 0;
> +   normalizeLines(data);
> ++  beforeHandler(parser);
> +   parser->m_processingInstructionHandler(parser->m_handlerArg, target, =
data);
> ++  afterHandler(parser);
> +   poolClear(&parser->m_tempPool);
> +   return 1;
> + }
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-19.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-19.patch
> new file mode 100644
> index 0000000000..b1af834e1b
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-19.patch
> @@ -0,0 +1,85 @@
> +From 3a187b3b2690763b88a2b77655033b279a511dcd Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:36:39 +0200
> +Subject: [PATCH 19/34] lib: Register `m_skippedEntityHandler` with handl=
er
> + call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/64e3adf0c9d7e1846cff784de3159f1067eb5e06]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 24 ++++++++++++++++++------
> + 1 file changed, 18 insertions(+), 6 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 407d7e0d..fbf081d0 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3441,9 +3441,11 @@ doContent(XML_Parser parser, int startTagLevel, c=
onst ENCODING *enc,
> +         else if (! entity->is_internal)
> +           return XML_ERROR_ENTITY_DECLARED_IN_PE;
> +       } else if (! entity) {
> +-        if (parser->m_skippedEntityHandler)
> ++        if (parser->m_skippedEntityHandler) {
> ++          beforeHandler(parser);
> +           parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0)=
;
> +-        else if (parser->m_defaultHandler)
> ++          afterHandler(parser);
> ++        } else if (parser->m_defaultHandler)
> +           reportDefault(parser, enc, s, next);
> +         break;
> +       }
> +@@ -3454,10 +3456,12 @@ doContent(XML_Parser parser, int startTagLevel, =
const ENCODING *enc,
> +       if (entity->textPtr) {
> +         enum XML_Error result;
> +         if (! parser->m_defaultExpandInternalEntities) {
> +-          if (parser->m_skippedEntityHandler)
> ++          if (parser->m_skippedEntityHandler) {
> ++            beforeHandler(parser);
> +             parser->m_skippedEntityHandler(parser->m_handlerArg, entity=
->name,
> +                                            0);
> +-          else if (parser->m_defaultHandler)
> ++            afterHandler(parser);
> ++          } else if (parser->m_defaultHandler)
> +             reportDefault(parser, enc, s, next);
> +           break;
> +         }
> +@@ -6131,7 +6135,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, c=
onst char *s, const char *end,
> +           /* cannot report skipped entities in declarations */
> +           if ((role =3D=3D XML_ROLE_PARAM_ENTITY_REF)
> +               && parser->m_skippedEntityHandler) {
> ++            beforeHandler(parser);
> +             parser->m_skippedEntityHandler(parser->m_handlerArg, name, =
1);
> ++            afterHandler(parser);
> +             handleDefault =3D XML_FALSE;
> +           }
> +           break;
> +@@ -6802,8 +6808,11 @@ appendAttributeValue(XML_Parser parser, const ENC=
ODING *enc, XML_Bool isCdata,
> +       } else if (! entity) {
> +         /* Cannot report skipped entity here - see comments on
> +            parser->m_skippedEntityHandler.
> +-        if (parser->m_skippedEntityHandler)
> ++        if (parser->m_skippedEntityHandler) {
> ++          beforeHandler(parser);
> +           parser->m_skippedEntityHandler(parser->m_handlerArg, name, 0)=
;
> ++          afterHandler(parser);
> ++        }
> +         */
> +         /* Cannot call the default handler because this would be
> +            out of sync with the call to the startElementHandler.
> +@@ -6936,8 +6945,11 @@ storeEntityValue(XML_Parser parser, const ENCODIN=
G *enc,
> +           /* not a well-formedness error - see XML 1.0: WFC Entity Decl=
ared */
> +           /* cannot report skipped entity here - see comments on
> +              parser->m_skippedEntityHandler
> +-          if (parser->m_skippedEntityHandler)
> ++          if (parser->m_skippedEntityHandler) {
> ++            beforeHandler(parser);
> +             parser->m_skippedEntityHandler(parser->m_handlerArg, name, =
0);
> ++            afterHandler(parser);
> ++          }
> +           */
> +           dtd->keepProcessing =3D dtd->standalone;
> +           goto endEntityValue;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-20.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-20.patch
> new file mode 100644
> index 0000000000..f5a8ba24b1
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-20.patch
> @@ -0,0 +1,60 @@
> +From 3074268d4d1eb1aa36a7df823f40d631fd98175c Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:37:49 +0200
> +Subject: [PATCH 20/34] lib: Register `m_startCdataSectionHandler` with h=
andler
> + call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/222278ad452d27f8c35ba031be14d6e70aab5ab1]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 32 +++++++++++++++++---------------
> + 1 file changed, 17 insertions(+), 15 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index fbf081d0..b6370ea1 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3700,22 +3700,24 @@ doContent(XML_Parser parser, int startTagLevel, =
const ENCODING *enc,
> +       break;
> +     case XML_TOK_CDATA_SECT_OPEN: {
> +       enum XML_Error result;
> +-      if (parser->m_startCdataSectionHandler)
> ++      if (parser->m_startCdataSectionHandler) {
> ++        beforeHandler(parser);
> +         parser->m_startCdataSectionHandler(parser->m_handlerArg);
> +-      /* BEGIN disabled code */
> +-      /* Suppose you doing a transformation on a document that involves
> +-         changing only the character data.  You set up a defaultHandler
> +-         and a characterDataHandler.  The defaultHandler simply copies
> +-         characters through.  The characterDataHandler does the
> +-         transformation and writes the characters out escaping them as
> +-         necessary.  This case will fail to work if we leave out the
> +-         following two lines (because & and < inside CDATA sections wil=
l
> +-         be incorrectly escaped).
> +-
> +-         However, now we have a start/endCdataSectionHandler, so it see=
ms
> +-         easier to let the user deal with this.
> +-      */
> +-      else if ((0) && parser->m_characterDataHandler) {
> ++        afterHandler(parser);
> ++        /* BEGIN disabled code */
> ++        /* Suppose you doing a transformation on a document that involv=
es
> ++           changing only the character data.  You set up a defaultHandl=
er
> ++           and a characterDataHandler.  The defaultHandler simply copie=
s
> ++           characters through.  The characterDataHandler does the
> ++           transformation and writes the characters out escaping them a=
s
> ++           necessary.  This case will fail to work if we leave out the
> ++           following two lines (because & and < inside CDATA sections w=
ill
> ++           be incorrectly escaped).
> ++
> ++           However, now we have a start/endCdataSectionHandler, so it s=
eems
> ++           easier to let the user deal with this.
> ++        */
> ++      } else if ((0) && parser->m_characterDataHandler) {
> +         beforeHandler(parser);
> +         parser->m_characterDataHandler(parser->m_handlerArg, parser->m_=
dataBuf,
> +                                        0);
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-21.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-21.patch
> new file mode 100644
> index 0000000000..22d03381c4
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-21.patch
> @@ -0,0 +1,44 @@
> +From ccb6591176850f051aefc05225d0e9ea1c5ee516 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:38:47 +0200
> +Subject: [PATCH 21/34] lib: Register `m_startDoctypeDeclHandler` with ha=
ndler
> + call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/82f1d14a033f7c5bd6f658c3cdcd2515efe86745]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index b6370ea1..f2ccd00c 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5394,9 +5394,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +       break;
> +     case XML_ROLE_DOCTYPE_INTERNAL_SUBSET:
> +       if (parser->m_startDoctypeDeclHandler) {
> ++        beforeHandler(parser);
> +         parser->m_startDoctypeDeclHandler(
> +             parser->m_handlerArg, parser->m_doctypeName, parser->m_doct=
ypeSysid,
> +             parser->m_doctypePubid, 1);
> ++        afterHandler(parser);
> +         parser->m_doctypeName =3D NULL;
> +         poolClear(&parser->m_tempPool);
> +         handleDefault =3D XML_FALSE;
> +@@ -5463,9 +5465,11 @@ doProlog(XML_Parser parser, const ENCODING *enc, =
const char *s, const char *end,
> +       }
> +=20
> +       if (parser->m_doctypeName) {
> ++        beforeHandler(parser);
> +         parser->m_startDoctypeDeclHandler(
> +             parser->m_handlerArg, parser->m_doctypeName, parser->m_doct=
ypeSysid,
> +             parser->m_doctypePubid, 0);
> ++        afterHandler(parser);
> +         poolClear(&parser->m_tempPool);
> +         handleDefault =3D XML_FALSE;
> +       }
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-22.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-22.patch
> new file mode 100644
> index 0000000000..065cfba5de
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-22.patch
> @@ -0,0 +1,46 @@
> +From 749611ae3b7785d5b4fd679b41ee8b6503556c10 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:39:38 +0200
> +Subject: [PATCH 22/34] lib: Register `m_startElementHandler` with handle=
r call
> + depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/4f9a8f1cc2ed03cd9e23d281a6abac44dc89e8ab]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index f2ccd00c..70f01e95 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -3549,10 +3549,12 @@ doContent(XML_Parser parser, int startTagLevel, =
const ENCODING *enc,
> +           =3D storeAtts(parser, enc, s, &(tag->name), &(tag->bindings),=
 account);
> +       if (result)
> +         return result;
> +-      if (parser->m_startElementHandler)
> ++      if (parser->m_startElementHandler) {
> ++        beforeHandler(parser);
> +         parser->m_startElementHandler(parser->m_handlerArg, tag->name.s=
tr,
> +                                       (const XML_Char **)parser->m_atts=
);
> +-      else if (parser->m_defaultHandler)
> ++        afterHandler(parser);
> ++      } else if (parser->m_defaultHandler)
> +         reportDefault(parser, enc, s, next);
> +       poolClear(&parser->m_tempPool);
> +       break;
> +@@ -3578,8 +3580,10 @@ doContent(XML_Parser parser, int startTagLevel, c=
onst ENCODING *enc,
> +       }
> +       poolFinish(&parser->m_tempPool);
> +       if (parser->m_startElementHandler) {
> ++        beforeHandler(parser);
> +         parser->m_startElementHandler(parser->m_handlerArg, name.str,
> +                                       (const XML_Char **)parser->m_atts=
);
> ++        afterHandler(parser);
> +         noElmHandlers =3D XML_FALSE;
> +       }
> +       if (parser->m_endElementHandler) {
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-23.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-23.patch
> new file mode 100644
> index 0000000000..69b5dd6b2a
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-23.patch
> @@ -0,0 +1,34 @@
> +From bbdf4565ffc47aba55fea3379245d01e626dd229 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:40:13 +0200
> +Subject: [PATCH 23/34] lib: Register `m_startNamespaceDeclHandler` with
> + handler call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/ddd0238420113c97594083194e517e8bc742700c]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 70f01e95..1ae77aae 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -4617,9 +4617,12 @@ addBinding(XML_Parser parser, PREFIX *prefix, con=
st ATTRIBUTE_ID *attId,
> +   b->nextTagBinding =3D *bindingsPtr;
> +   *bindingsPtr =3D b;
> +   /* if attId =3D=3D NULL then we are not starting a namespace scope */
> +-  if (attId && parser->m_startNamespaceDeclHandler)
> ++  if (attId && parser->m_startNamespaceDeclHandler) {
> ++    beforeHandler(parser);
> +     parser->m_startNamespaceDeclHandler(parser->m_handlerArg, prefix->n=
ame,
> +                                         prefix->binding ? uri : 0);
> ++    afterHandler(parser);
> ++  }
> +   return XML_ERROR_NONE;
> + }
> +=20
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-24.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-24.patch
> new file mode 100644
> index 0000000000..5e83b776c4
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-24.patch
> @@ -0,0 +1,31 @@
> +From e763c4db3ea639bc435ca7eaf5ae94ae4beed17b Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sat, 30 May 2026 00:46:47 +0200
> +Subject: [PATCH 24/34] lib: Register `m_unknownEncodingHandler` with han=
dler
> + call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/f66d83c9aecaa802174f95a1348a89f56e3b9441]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 1ae77aae..9c5433cc 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5022,8 +5022,10 @@ handleUnknownEncoding(XML_Parser parser, const XM=
L_Char *encodingName) {
> +     info.convert =3D NULL;
> +     info.data =3D NULL;
> +     info.release =3D NULL;
> ++    beforeHandler(parser);
> +     const int status =3D parser->m_unknownEncodingHandler(
> +         parser->m_unknownEncodingHandlerData, encodingName, &info);
> ++    afterHandler(parser);
> +     if (status) {
> +       ENCODING *enc;
> +       parser->m_unknownEncodingMem =3D MALLOC(parser, XmlSizeOfUnknownE=
ncoding());
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-25.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-25.patch
> new file mode 100644
> index 0000000000..9c0370a3c9
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-25.patch
> @@ -0,0 +1,33 @@
> +From be50a6cd7ac802c27f370c0b9c61920738b33f94 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:41:00 +0200
> +Subject: [PATCH 25/34] lib: Register `m_unparsedEntityDeclHandler` with
> + handler call depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/6e7c5af75a743c609fdb35627554cc7e940e6593]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 9c5433cc..ea29489e 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -5855,10 +5855,12 @@ doProlog(XML_Parser parser, const ENCODING *enc,=
 const char *s, const char *end,
> +         poolFinish(&dtd->pool);
> +         if (parser->m_unparsedEntityDeclHandler) {
> +           *eventEndPP =3D s;
> ++          beforeHandler(parser);
> +           parser->m_unparsedEntityDeclHandler(
> +               parser->m_handlerArg, parser->m_declEntity->name,
> +               parser->m_declEntity->base, parser->m_declEntity->systemI=
d,
> +               parser->m_declEntity->publicId, parser->m_declEntity->not=
ation);
> ++          afterHandler(parser);
> +           handleDefault =3D XML_FALSE;
> +         } else if (parser->m_entityDeclHandler) {
> +           *eventEndPP =3D s;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-26.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-26.patch
> new file mode 100644
> index 0000000000..0e87a361f6
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-26.patch
> @@ -0,0 +1,31 @@
> +From 9e21ad00545e6ea8a02773d4565eb3b2b16eb171 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 21:41:38 +0200
> +Subject: [PATCH 26/34] lib: Register `m_xmlDeclHandler` with handler cal=
l
> + depth tracking
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/91484ffb98ec138df79265e431a55823bc80c6c4]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index ea29489e..f1ba05cc 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -4971,8 +4971,10 @@ processXmlDecl(XML_Parser parser, int isGeneralTe=
xtEntity, const char *s,
> +       if (! storedversion)
> +         return XML_ERROR_NO_MEMORY;
> +     }
> ++    beforeHandler(parser);
> +     parser->m_xmlDeclHandler(parser->m_handlerArg, storedversion, store=
dEncName,
> +                              standalone);
> ++    afterHandler(parser);
> +   } else if (parser->m_defaultHandler)
> +     reportDefault(parser, parser->m_encoding, s, next);
> +   if (parser->m_protocolEncodingName =3D=3D NULL) {
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-27.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-27.patch
> new file mode 100644
> index 0000000000..3f4b1ec9ed
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-27.patch
> @@ -0,0 +1,29 @@
> +From 98218922a1bc94d6eb8371fb7f18abf0e2a76f08 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 15:35:27 +0200
> +Subject: [PATCH 27/34] lib: Protect `XML_GetBuffer` from being called fr=
om a
> + handler
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/5d90d1aebfe606af2550e92983cbe121d7eda032]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index f1ba05cc..e7642d8f 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -2533,7 +2533,7 @@ XML_ParseBuffer(XML_Parser parser, int len, int is=
Final) {
> +=20
> + void *XMLCALL
> + XML_GetBuffer(XML_Parser parser, int len) {
> +-  if (parser =3D=3D NULL)
> ++  if ((parser =3D=3D NULL) || isCalledFromInsideHandler(parser))

Wouldn't that risk breaking legitimate calls as well as blocking the vuln
code path?

> +     return NULL;
> +   if (len < 0) {
> +     parser->m_errorCode =3D XML_ERROR_NO_MEMORY;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-28.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-28.patch
> new file mode 100644
> index 0000000000..f9564ec175
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-28.patch
> @@ -0,0 +1,29 @@
> +From df1172fd2bc3e3be5319e788cb99867bebe6d3c5 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 15:32:38 +0200
> +Subject: [PATCH 28/34] lib: Protect `XML_Parse` from being called from a
> + handler
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/b59f1865e6c0c0ab2c1623b9dfd53aa6fb85bb96]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index e7642d8f..7234cc89 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -2356,6 +2356,8 @@ XML_Parse(XML_Parser parser, const char *s, int le=
n, int isFinal) {
> +       parser->m_errorCode =3D XML_ERROR_INVALID_ARGUMENT;
> +     return XML_STATUS_ERROR;
> +   }
> ++  if (isCalledFromInsideHandler(parser))
> ++    return XML_STATUS_ERROR;
> +   switch (parser->m_parsingStatus.parsing) {
> +   case XML_SUSPENDED:
> +     parser->m_errorCode =3D XML_ERROR_SUSPENDED;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-29.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-29.patch
> new file mode 100644
> index 0000000000..d67bb1462b
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-29.patch
> @@ -0,0 +1,29 @@
> +From dccaa02c0193fbc5fdc0cf5991fa6d1400715fc8 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 15:33:44 +0200
> +Subject: [PATCH 29/34] lib: Protect `XML_ParseBuffer` from being called =
from a
> + handler
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/ef3267d5f8157862e33d87c45c6fe82ac26e557f]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 7234cc89..769eb10a 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -2467,7 +2467,7 @@ XML_ParseBuffer(XML_Parser parser, int len, int is=
Final) {
> +   const char *start;
> +   enum XML_Status result =3D XML_STATUS_OK;
> +=20
> +-  if (parser =3D=3D NULL)
> ++  if ((parser =3D=3D NULL) || isCalledFromInsideHandler(parser))
> +     return XML_STATUS_ERROR;
> +=20
> +   if (len < 0) {
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-30.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-30.patch
> new file mode 100644
> index 0000000000..57dca36e6a
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-30.patch
> @@ -0,0 +1,29 @@
> +From c905fb91906554ed8132c2b11738c2bbdcafaf42 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 15:21:28 +0200
> +Subject: [PATCH 30/34] lib: Protect `XML_ParserFree` from being called f=
rom a
> + handler
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/827fbddcaaa8ba2171ef76a3223d6f403388635c]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 769eb10a..4d2cedac 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -1939,7 +1939,7 @@ void XMLCALL
> + XML_ParserFree(XML_Parser parser) {
> +   TAG *tagList;
> +   OPEN_INTERNAL_ENTITY *entityList;
> +-  if (parser =3D=3D NULL)
> ++  if ((parser =3D=3D NULL) || isCalledFromInsideHandler(parser))
> +     return;
> +   /* free m_tagStack and m_freeTagList */
> +   tagList =3D parser->m_tagStack;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-31.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-31.patch
> new file mode 100644
> index 0000000000..de693a448c
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-31.patch
> @@ -0,0 +1,29 @@
> +From 9e9a6f2de2b9bd399011dd1685b235e0c580f312 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 15:22:41 +0200
> +Subject: [PATCH 31/34] lib: Protect `XML_ParserReset` from being called =
from a
> + handler
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/34bc7e080a1b432ad9d6879a6c718f2d6f12fa22]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + lib/xmlparse.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 4d2cedac..0294d71f 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -1655,7 +1655,7 @@ XML_ParserReset(XML_Parser parser, const XML_Char =
*encodingName) {
> +   TAG *tStk;
> +   OPEN_INTERNAL_ENTITY *openEntityList;
> +=20
> +-  if (parser =3D=3D NULL)
> ++  if ((parser =3D=3D NULL) || isCalledFromInsideHandler(parser))
> +     return XML_FALSE;
> +=20
> +   if (parser->m_parentParser)
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-32.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-32.patch
> new file mode 100644
> index 0000000000..cdd40ad521
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-32.patch
> @@ -0,0 +1,97 @@
> +From 2e706f49a9d764e1170706acca686e17af82c095 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sun, 31 May 2026 13:37:01 +0200
> +Subject: [PATCH 32/34] tests: Cover calls forbidden from handlers
> +
> +[ make void* to XML_Parser conversion explicit ]
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/2e16f4c98f1f28bb9da36108b60c181d77752acb]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + tests/handlers.c   | 24 ++++++++++++++++++++++++
> + tests/handlers.h   |  4 ++++
> + tests/misc_tests.c | 15 +++++++++++++++
> + 3 files changed, 43 insertions(+)
> +
> +diff --git a/tests/handlers.c b/tests/handlers.c
> +index e6582231..b5118347 100644
> +--- a/tests/handlers.c
> ++++ b/tests/handlers.c
> +@@ -1978,3 +1978,27 @@ accumulate_and_suspend_comment_handler(void *user=
Data, const XML_Char *data) {
> +   accumulate_comment(parserPlusStorage->storage, data);
> +   XML_StopParser(parserPlusStorage->parser, XML_TRUE);
> + }
> ++
> ++void XMLCALL
> ++forbidden_calls_character_handler(void *userData, const XML_Char *s, in=
t len) {
> ++  UNUSED_P(s);
> ++  UNUSED_P(len);
> ++  XML_Parser parser =3D (XML_Parser)userData;
> ++
> ++  assert_true(parser !=3D NULL); // self-test
> ++
> ++  assert_true(XML_GetBuffer(parser, 123) =3D=3D NULL); // i.e. rejected
> ++
> ++  assert_true(XML_Parse(parser, "", 0, /*isFinal=3D*/XML_FALSE)
> ++              =3D=3D XML_STATUS_ERROR); // i.e. rejected
> ++
> ++  assert_true(XML_ParseBuffer(parser, 0, /*isFinal=3D*/XML_FALSE)
> ++              =3D=3D XML_STATUS_ERROR); // i.e. rejected
> ++
> ++  XML_ParserFree(parser); // rejected
> ++
> ++  assert_true(XML_ParserReset(parser, /*encodingName=3D*/NULL)
> ++              =3D=3D XML_FALSE); // i.e. rejected
> ++
> ++  assert_true(XML_GetErrorCode(parser) =3D=3D XML_ERROR_NONE);
> ++}
> +diff --git a/tests/handlers.h b/tests/handlers.h
> +index ac4ca940..47623910 100644
> +--- a/tests/handlers.h
> ++++ b/tests/handlers.h
> +@@ -607,6 +607,10 @@ typedef struct {
> + extern void XMLCALL
> + accumulate_and_suspend_comment_handler(void *userData, const XML_Char *=
data);
> +=20
> ++extern void XMLCALL forbidden_calls_character_handler(void *userData,
> ++                                                      const XML_Char *s=
,
> ++                                                      int len);
> ++
> + #endif /* XML_HANDLERS_H */
> +=20
> + #ifdef __cplusplus
> +diff --git a/tests/misc_tests.c b/tests/misc_tests.c
> +index cdcdd507..5e490faf 100644
> +--- a/tests/misc_tests.c
> ++++ b/tests/misc_tests.c
> +@@ -742,6 +742,20 @@ START_TEST(test_misc_no_infinite_loop_issue_1161) {
> + }
> + END_TEST
> +=20
> ++START_TEST(test_misc_calls_forbidden_from_handlers) {
> ++  const char *const doc =3D "<doc>Hello world!</doc>";
> ++
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++  XML_UseParserAsHandlerArg(parser);
> ++  XML_SetCharacterDataHandler(parser, forbidden_calls_character_handler=
);
> ++
> ++  assert_true(XML_Parse(parser, doc, (int)strlen(doc), /*isFinal=3D*/XM=
L_TRUE)
> ++              =3D=3D XML_STATUS_OK);
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> + void
> + make_miscellaneous_test_case(Suite *s) {
> +   TCase *tc_misc =3D tcase_create("miscellaneous tests");
> +@@ -773,4 +787,5 @@ make_miscellaneous_test_case(Suite *s) {
> +   tcase_add_test(tc_misc, test_misc_sync_entity_tolerated);
> +   tcase_add_test(tc_misc, test_misc_async_entity_rejected);
> +   tcase_add_test(tc_misc, test_misc_no_infinite_loop_issue_1161);
> ++  tcase_add_test(tc_misc, test_misc_calls_forbidden_from_handlers);
> + }
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-33.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-33.patch
> new file mode 100644
> index 0000000000..dda72a311e
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-33.patch
> @@ -0,0 +1,39 @@
> +From ea59c2c53276eb44526244def65a7be8f0d617ac Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Tue, 26 May 2026 15:41:46 +0200
> +Subject: [PATCH 33/34] doc: Document that `XML_ParserFree` and
> + `XML_ParserReset` must not
> +
> +.. be called from within handlers for the same parser instance
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/cdeb65e1c4570861ce91c529e934a1f1d9629b3f]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + doc/reference.html | 10 ++++++----
> + 1 file changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/doc/reference.html b/doc/reference.html
> +index 8f14b011..fad5e1ab 100644
> +--- a/doc/reference.html
> ++++ b/doc/reference.html
> +@@ -1095,10 +1095,12 @@ dealing with any memory associated with <a href=
=3D"#userdata">user data</a>.
> + <p>To state the obvious: the three parsing functions <code><a href=3D
> + "#XML_Parse" >XML_Parse</a></code>, <code><a href=3D "#XML_ParseBuffer"=
>
> + XML_ParseBuffer</a></code> and <code><a href=3D "#XML_GetBuffer">
> +-XML_GetBuffer</a></code> must not be called from within a handler
> +-unless they operate on a separate parser instance, that is, one that
> +-did not call the handler. For example, it is OK to call the parsing
> +-functions from within an <code>XML_ExternalEntityRefHandler</code>,
> ++XML_GetBuffer</a></code> as well as the two cleanup functions <code><a
> ++href=3D"#XML_ParserFree">XML_ParserFree</a></code> and <code><a href=3D
> ++"#XML_ParserReset">XML_ParserReset</a></code> must not be called from
> ++within a handler unless they operate on a separate parser instance, tha=
t
> ++is, one that did not call the handler. For example, it is OK to call th=
e
> ++parsing functions from within an <code>XML_ExternalEntityRefHandler</co=
de>,
> + if they apply to the parser created by
> + <code><a href=3D "#XML_ExternalEntityParserCreate"
> + >XML_ExternalEntityParserCreate</a></code>.</p>
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-50219-34.patch b/meta=
/recipes-core/expat/expat/CVE-2026-50219-34.patch
> new file mode 100644
> index 0000000000..54a512d621
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-50219-34.patch
> @@ -0,0 +1,39 @@
> +From bcb2de3b2b03bb67c892dc3c6ac51795c5fb50a5 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sun, 31 May 2026 14:01:51 +0200
> +Subject: [PATCH 34/34] Changes: Document CVE-2026-50219
> +
> +CVE: CVE-2026-50219
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/124=
6/commits/f17ca46befb59098da339ed6d2438de3bdece8b5]
> +Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
> +---
> + Changes | 13 +++++++++++++
> + 1 file changed, 13 insertions(+)
> +
> +diff --git a/Changes b/Changes
> +index 4265d608..b8755c15 100644
> +--- a/Changes
> ++++ b/Changes
> +@@ -30,6 +30,19 @@
> + !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!!!!!!!!
> +=20
> + Patches:
> ++        Security fixes:
> ++           #1246  CVE-2026-50219 -- Disallow calls to functions
> ++                    `XML_GetBuffer`, `XML_Parse`, `XML_ParseBuffer`,
> ++                    `XML_ParserFree`, `XML_ParserReset` to guard e.g.
> ++                    Expat bindings from memory corruption;
> ++                    this CPython issue is related:
> ++                    https://github.com/python/cpython/issues/146169
> ++
> ++        Special thanks to:
> ++            Asher Darden
> ++            Matthew Fernandez
> ++            Yousef Shanableh
> ++

I don't think we should carry a patch solely to patch the Changes
file.

> +         Security fixes:
> +      #1018 #1034  CVE-2025-59375 -- Disallow use of disproportional amo=
unts of
> +                     dynamic memory from within an Expat parser (e.g. pr=
eviously
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/e=
xpat/expat_2.6.4.bb
> index 151720a9e3..cda545d624 100644
> --- a/meta/recipes-core/expat/expat_2.6.4.bb
> +++ b/meta/recipes-core/expat/expat_2.6.4.bb
> @@ -51,6 +51,40 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_T=
AG}/expat-${PV}.tar.bz2  \
>             file://CVE-2026-32777-02.patch \
>             file://CVE-2026-32778-01.patch \
>             file://CVE-2026-32778-02.patch \
> +           file://CVE-2026-50219-01.patch \
> +           file://CVE-2026-50219-02.patch \
> +           file://CVE-2026-50219-03.patch \
> +           file://CVE-2026-50219-04.patch \
> +           file://CVE-2026-50219-05.patch \
> +           file://CVE-2026-50219-06.patch \
> +           file://CVE-2026-50219-07.patch \
> +           file://CVE-2026-50219-08.patch \
> +           file://CVE-2026-50219-09.patch \
> +           file://CVE-2026-50219-10.patch \
> +           file://CVE-2026-50219-11.patch \
> +           file://CVE-2026-50219-12.patch \
> +           file://CVE-2026-50219-13.patch \
> +           file://CVE-2026-50219-14.patch \
> +           file://CVE-2026-50219-15.patch \
> +           file://CVE-2026-50219-16.patch \
> +           file://CVE-2026-50219-17.patch \
> +           file://CVE-2026-50219-18.patch \
> +           file://CVE-2026-50219-19.patch \
> +           file://CVE-2026-50219-20.patch \
> +           file://CVE-2026-50219-21.patch \
> +           file://CVE-2026-50219-22.patch \
> +           file://CVE-2026-50219-23.patch \
> +           file://CVE-2026-50219-24.patch \
> +           file://CVE-2026-50219-25.patch \
> +           file://CVE-2026-50219-26.patch \
> +           file://CVE-2026-50219-27.patch \
> +           file://CVE-2026-50219-28.patch \
> +           file://CVE-2026-50219-29.patch \
> +           file://CVE-2026-50219-30.patch \
> +           file://CVE-2026-50219-31.patch \
> +           file://CVE-2026-50219-32.patch \
> +           file://CVE-2026-50219-33.patch \
> +           file://CVE-2026-50219-34.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"


--=20
Yoann Congal
Smile ECS


