Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340F9D42B83
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 13:52:58 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.87306.1731419570451068966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 05:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vuuelC1f;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e291f1d659aso5460937276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 05:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731419569; x=1732024369; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYkodknAnlyjp0L0OF8lNkBFksvNsHzkxS+yTBKibKs=;
        b=vuuelC1fgjhS6UohMthCj2cufPTGWQBn6SGEHc9OEjpuZJiRwMHLsVHlsJXF8232/P
         2Hjnv1R4RmRObc4jx7oVMM+wkeqOOz5RhPp4KnwtRSEL9Kx0LCLk7xks/RuANCSPHOyr
         H9gKlSgYZFtPYcYAB84N6jK9YpTLjI1YNmju9RPZEJxUHQlgLHKN0CJkrAXQu+3N83kj
         nynbPiwY1EtN/xgXpjK3fiD2f+V+ufA0e74urgEdpfFHT1Kj/2UMqAaqs5SVJam94fhT
         jIoL4m4rzgBKBE22RBWkICMrkwthJ7DpI0bYzaWHlbA0Aem1Ccilc9MyE00PraKrJ9bV
         CkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731419569; x=1732024369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYkodknAnlyjp0L0OF8lNkBFksvNsHzkxS+yTBKibKs=;
        b=NYFhDwKz4pFKkIx+FclCwH+NKAdLV6l7pk48XpTRwEyhfN/Axla6l29uH/B9fkR3eD
         UZK4KiNR66GOO7l8MqmH9nuGcbH3S1KMY+01UX5qxG/l0NQIT+jkObaLA0vMs+Iddkmn
         Ieb6/pIt/jpeXhmKRBNsUdQwTlMWNPlDQAsI4KZlB8o8FSoe1lVgW1ZViiDE+bQOBsTs
         yDM3YHQKO/fFBaMsSRmG4yybHR67G9dDEGj7hzOxq7XLsloLd4XrUn6UzjDl97dOOb/I
         HCnS6cjfHj61GaqQRVrh+NAS092Um4NA3c2wgzEOMqiai/cwmy1t2O6vicKq1jwzIWhD
         ACpg==
X-Gm-Message-State: AOJu0YwS5YLoi/OSW8KTMRxfWlc2vau1rVDC8uYVi4TumrZ3dKNW06LI
	U7vNHf4/M5/7smzUdKrOOyRRPBQe0K3lGSZhvVcwQE6svj/5NGS4lvLsREks/xp+KWOk0JmS82w
	fpH8WlgFhgg4NKRMnZVzEbgjKnMN4oXlLfAGvOA==
X-Google-Smtp-Source: AGHT+IHcmXf8PAdjqgQtaNTay8mxESU4GDIbu7LYZJqvNcs7V5MtNMZ9yPU40YdUXLx1mlgjaVCrDl2TXpWGEClTtqw=
X-Received: by 2002:a05:6902:c0d:b0:e30:c739:8e5a with SMTP id
 3f1490d57ef6-e337f8584c9mr13164940276.14.1731419569558; Tue, 12 Nov 2024
 05:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20241111190447.56468-1-peter.marko@siemens.com> <20241112085129.11176-1-peter.marko@siemens.com>
In-Reply-To: <20241112085129.11176-1-peter.marko@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 12 Nov 2024 05:52:38 -0800
Message-ID: <CAOSpxdZjj3tbVC8jiijEzEG6mNF2nR3C2mOKnne8LG5Gh3KrzA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] expat: patch CVE-2024-50602
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 13:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207054

Hi Peter,

I think you missed adding the patches to the recipe :-)

Steve

On Tue, Nov 12, 2024 at 12:52=E2=80=AFAM Peter Marko via
lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick commits from https://github.com/libexpat/libexpat/pull/915
>
> Not picking test is suboptimal, but test structure was changed meanwhile
> so we'd have to invent new code.
> Skipping tests was already done in previous expat/kirkstone CVE patches.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> v2: fixed upstream patch lik in CVE-2024-50602-01.patch
>
>  .../expat/expat/CVE-2024-50602-01.patch       | 56 +++++++++++++++++++
>  .../expat/expat/CVE-2024-50602-02.patch       | 38 +++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2024-50602-01.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2024-50602-02.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2024-50602-01.patch b/meta=
/recipes-core/expat/expat/CVE-2024-50602-01.patch
> new file mode 100644
> index 0000000000..18dc392f67
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2024-50602-01.patch
> @@ -0,0 +1,56 @@
> +From 51c7019069b862e88d94ed228659e70bddd5de09 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Mon, 21 Oct 2024 01:42:54 +0200
> +Subject: [PATCH 1/2] lib: Make XML_StopParser refuse to stop/suspend an
> + unstarted parser
> +
> +CVE: CVE-2024-50602
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5=
1c7019069b862e88d94ed228659e70bddd5de09]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + expat/lib/expat.h    | 4 +++-
> + expat/lib/xmlparse.c | 6 ++++++
> + 2 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/expat/lib/expat.h b/expat/lib/expat.h
> +index d0d6015a..3ba61304 100644
> +--- a/expat/lib/expat.h
> ++++ b/expat/lib/expat.h
> +@@ -127,7 +127,9 @@ enum XML_Error {
> +   /* Added in 2.3.0. */
> +   XML_ERROR_NO_BUFFER,
> +   /* Added in 2.4.0. */
> +-  XML_ERROR_AMPLIFICATION_LIMIT_BREACH
> ++  XML_ERROR_AMPLIFICATION_LIMIT_BREACH,
> ++  /* Added in 2.6.4. */
> ++  XML_ERROR_NOT_STARTED,
> + };
> +
> + enum XML_Content_Type {
> +diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
> +index d9285b21..fa02537f 100644
> +--- a/expat/lib/xmlparse.c
> ++++ b/expat/lib/xmlparse.c
> +@@ -2189,6 +2189,9 @@ XML_StopParser(XML_Parser parser, XML_Bool resumab=
le) {
> +   if (parser =3D=3D NULL)
> +     return XML_STATUS_ERROR;
> +   switch (parser->m_parsingStatus.parsing) {
> ++  case XML_INITIALIZED:
> ++    parser->m_errorCode =3D XML_ERROR_NOT_STARTED;
> ++    return XML_STATUS_ERROR;
> +   case XML_SUSPENDED:
> +     if (resumable) {
> +       parser->m_errorCode =3D XML_ERROR_SUSPENDED;
> +@@ -2474,6 +2477,9 @@ XML_ErrorString(enum XML_Error code) {
> +   case XML_ERROR_AMPLIFICATION_LIMIT_BREACH:
> +     return XML_L(
> +         "limit on input amplification factor (from DTD and entities) br=
eached");
> ++  /* Added in 2.6.4. */
> ++  case XML_ERROR_NOT_STARTED:
> ++    return XML_L("parser not started");
> +   }
> +   return NULL;
> + }
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2024-50602-02.patch b/meta=
/recipes-core/expat/expat/CVE-2024-50602-02.patch
> new file mode 100644
> index 0000000000..e714daade5
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2024-50602-02.patch
> @@ -0,0 +1,38 @@
> +From 5fb89e7b3afa1c314b34834fe729cd063f65a4d4 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Mon, 21 Oct 2024 01:46:11 +0200
> +Subject: [PATCH 2/2] lib: Be explicit about XML_PARSING in XML_StopParse=
r
> +
> +CVE: CVE-2024-50602
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5=
fb89e7b3afa1c314b34834fe729cd063f65a4d4]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + expat/lib/xmlparse.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
> +index fa02537f..983f6df0 100644
> +--- a/expat/lib/xmlparse.c
> ++++ b/expat/lib/xmlparse.c
> +@@ -2202,7 +2202,7 @@ XML_StopParser(XML_Parser parser, XML_Bool resumab=
le) {
> +   case XML_FINISHED:
> +     parser->m_errorCode =3D XML_ERROR_FINISHED;
> +     return XML_STATUS_ERROR;
> +-  default:
> ++  case XML_PARSING:
> +     if (resumable) {
> + #ifdef XML_DTD
> +       if (parser->m_isParamEntity) {
> +@@ -2213,6 +2213,9 @@ XML_StopParser(XML_Parser parser, XML_Bool resumab=
le) {
> +       parser->m_parsingStatus.parsing =3D XML_SUSPENDED;
> +     } else
> +       parser->m_parsingStatus.parsing =3D XML_FINISHED;
> ++    break;
> ++  default:
> ++    assert(0);
> +   }
> +   return XML_STATUS_OK;
> + }
> +--
> +2.30.2
> +
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206987): https://lists.openembedded.org/g/openembedde=
d-core/message/206987
> Mute This Topic: https://lists.openembedded.org/mt/109531698/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

