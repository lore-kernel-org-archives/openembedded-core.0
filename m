Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1F2C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 20:04:10 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.25890.1676318644347537971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 12:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gKq9EUBQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a3so674768ejb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 12:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fU1vZyn28pPMHOLTP3vN08KxzW7ayc1iEX7463miUrs=;
        b=gKq9EUBQC5j9B8vOcohW4DVGbDiwBwafZbSv/l9bX/R+qNwmQWclGS5lhPwu98wI4z
         7HA47ELUazlurkUipYCoQBMFrt5pX+PivqfYiawj+PrSj8blisRwLpHr/FnA7K+bos2h
         wZWjdAOldfjCmPTQR33OF4xZfQ51QLtDgoZkmJAtxs4bgCYO0XeCRWpheyy0Db71y7l/
         W5/Eb385u7la7sGj9Mw5BWT0whQ0ZXTlo0W2Y52Y92Bxkh4x3RnK24tNX6ZzlTTwmM+x
         GNNJ1siZnx0MUdanjn8X7WglUNdka9TocB3KKmqN0WAthOHf7j+J4Wfm9TRMEeQNqUOi
         vjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU1vZyn28pPMHOLTP3vN08KxzW7ayc1iEX7463miUrs=;
        b=Fv67FUzY3Qh0X1SfFJ3WWRZR2p+9GKi8SAtGCBgavqUzX3azl0dlMfeqMZaZFQL7oG
         QL4EANy7KyVlFeL5wkSSro45PtSgaVAPrm8lek3tCe9lZqhV/86tf0gajqoZU+X/qhBe
         TktdocnHNcYHYj1Rjrh7X6vCT+uQ8K9pAFVN0b/QOXx4hDOq3o/mFAeUqeyCgwf6HiJN
         +WbTMNvDZQTr0UtbUWSYwEOasOEX8gWm75FG1loR4lyZLXvJFSSK9lA4K2a7bpVlFV/y
         HU/F2wq45v6JOuqlbsq1en6ytv8/UrhAoLJPeWa1ROgE0Ks/MzrqKxb7hZSeWJAMs3w2
         bF/A==
X-Gm-Message-State: AO0yUKX8oUXN/arVQIFBpcJUp180RLcfKJlw/BOGT8tAE2L7SrYtdx4X
	1RDHC0iToVoprWkBbLAcJmH1KMoAR6F6QwVzIq4=
X-Google-Smtp-Source: AK7set/2u/baxBGNJY7med3ROWsXcOYh/xxPw5fWLJuGvokAelSXVlbmWHX4kUd3uM52pUsNRQOm8HUbKSopyw2+/Vw=
X-Received: by 2002:a17:906:8510:b0:888:6294:a1fc with SMTP id
 i16-20020a170906851000b008886294a1fcmr78075ejx.7.1676318642612; Mon, 13 Feb
 2023 12:04:02 -0800 (PST)
MIME-Version: 1.0
References: <20230213195413.3535358-1-saul.wold@windriver.com>
In-Reply-To: <20230213195413.3535358-1-saul.wold@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 13 Feb 2023 14:03:50 -0600
Message-ID: <CAJdd5GZjcOTBy-8LKmqdqzupiCz2mg5_PMtJUtj0juGdbkV1Eg@mail.gmail.com>
Subject: Re: [PATCH] create-spdx-2.2: Add support for custom Annotations
To: Saul Wold <saul.wold@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 20:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177110

On Mon, Feb 13, 2023 at 1:54 PM Saul Wold <saul.wold@windriver.com> wrote:
>
> This change adds a new variable to track which recipe variables
> are added as SPDX Annotations.
>
> Usage: add SPDX_CUSTOME_ANNOTATION_VARS = <some recipe variable>

nit: CUSTOM

>
> The recipe spdx json will contain an annotation stanza that looks
> something like this:
>
>      "annotations": [
>         {
>           "annotationDate": "2023-02-13T19:44:20Z",
>           "annotationType": "OTHER",
>           "annotator": "Tool: oe-spdx-creator - 1.0",
>           "comment": "CUSTOM_VARIABLE=some value or string"
>         },
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
> index f0513af083b..e1bbf646ff9 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -30,6 +30,8 @@ SPDX_PRETTY ??= "0"
>
>  SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
>
> +SPDX_CUSTOM_ANNOTATION_VARS ??= ""
> +
>  SPDX_ORG ??= "OpenEmbedded ()"
>  SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
>  SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
> @@ -402,7 +404,6 @@ def collect_dep_sources(d, dep_recipes):
>
>      return sources
>
> -
>  python do_create_spdx() {
>      from datetime import datetime, timezone
>      import oe.sbom
> @@ -479,6 +480,10 @@ python do_create_spdx() {
>      if description:
>          recipe.description = description
>
> +    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
> +        for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
> +            recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
> +

Seems reasonable. If we need more configuration options, I think we
can add it later with flags, e.g.

 MY_VAR = "foo"
 MY_VAR[spdx-annotator] = "Me!"
 SPDX_CUSTOM_ANNOTATION_VARS = "MY_VAR"

Aslo, in the future if users want package annotations, we can probably do:

 SPDX_CUSTOM_ANNOTATION_VARS:${PN}


>      # Some CVEs may be patched during the build process without incrementing the version number,
>      # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
>      # save the CVEs fixed by patches to source information field in the SPDX.
> --
> 2.25.1
>

