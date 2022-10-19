Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595CCC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 21:18:01 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.2340.1666214276051891662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 14:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pzHda7kk;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id b2so42967656eja.6
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK1c/MzzUB6uuGV24cSXWsHLesj2QqV4ADw3AkgmemA=;
        b=pzHda7kk0NDxtVwTxXCCNjul5/qjFlXRtSqHOFWp0HdpmeQszsJazy0XO08AoiEYro
         bDOj7djndwT0lEyIAL/Wn3slgsUpcLkdZ2tolq0LCoZlf7nbP/oI4abTM8TjFRFQJOTh
         Wp9ntlnh7PcSP1Gb7ALkVt18XJy5HVFXqe8L6wLG5OWgEBtHz2BX9VyOVAEqdz1r56y9
         C9inWqez1h4IJL6VUYTL44MrYHX20Gt7jmjOSvVCSSc1KTyAlvw+nDJ5w0LLAAy+uIDQ
         davBcHZooMYkP+TGP4weqBNtrVQBf9Nt4INxFCkMUAXXs//OB42Os9uq9T447GFYjqO6
         gsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZK1c/MzzUB6uuGV24cSXWsHLesj2QqV4ADw3AkgmemA=;
        b=WgAFGAHj7LYITAQ2YlFX1DBFMnl/1bhbwxzftFjQ3FqeWH2K02RVFDf4A8XrVRSzbO
         pAmz4/mmNNAxCCTHn9J4zdXBjhXUUcYVPjORZ0NgQr1iMT5Jj0Jpn4uHTNKWLx7XQK8J
         aRlMloW+mevq47vJI3vWvMRUdQkTdFm3dMGtXRPKd3zrxDVqvYSJk0NDxTyvhZU47xXN
         INMEkU+8IBuY25MRFIAPiQC9PoPuBJZmtm/cau5AyB+CkakZQoc78rPBP/z15VtgqP9G
         OypTtGyWqX3nQHfPmpq+K+zHdKHklVnY3IO6rS+mh3DEZ6ud8ToCaYMO2YjMr7G4795T
         FWtQ==
X-Gm-Message-State: ACrzQf3arcdPkkVFn4k2zQvcBztEkEAhmg6DlgLNorVas/CeSMMKIL9B
	JyfNzyJdxWjaISr9FYJD0uXzaXnDS2DzxxasVGc=
X-Google-Smtp-Source: AMsMyM7UUbcM6nwJ9p8IxmPUjZ5unA6TI6V4IxaExeB2lKqHwjP9HrnBtAznvtoDGz6QCbhEfxb8g8ejzs38a7m1P9U=
X-Received: by 2002:a17:907:25c5:b0:783:f5df:900e with SMTP id
 ae5-20020a17090725c500b00783f5df900emr8109694ejc.491.1666214274301; Wed, 19
 Oct 2022 14:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221019105739.2279010-1-nobuta.keiya@fujitsu.com> <20221019105739.2279010-2-nobuta.keiya@fujitsu.com>
In-Reply-To: <20221019105739.2279010-2-nobuta.keiya@fujitsu.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 19 Oct 2022 16:17:42 -0500
Message-ID: <CAJdd5GYUxEHhZGNfj_7FL9_=7KF158kLoKmuSmEZR6q+5WdeKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] create-spdx: Fix "licenseDeclared" shows
 weird value
To: Keiya Nobuta <nobuta.keiya@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 21:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171984

On Wed, Oct 19, 2022 at 6:08 AM Keiya Nobuta <nobuta.keiya@fujitsu.com> wrote:
>
> Fixed an issue that "licenseDeclared" shows weird value, for example
> `busybox.spdx.json` shows like:
>
> "GPL-2.0-only AND DocumentRef-recipe-busybox:LicenseRef-bzip2-1.0.4"
>                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                    unwanted value

I don't believe this is unwanted: the license text lives in another
document (ecipe-busybox.spdx.json) so we need to indicate that here

>
> Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
> ---
>  meta/classes/create-spdx.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
> index c190ad3889..1661c7d2f0 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -534,7 +534,7 @@ python do_create_spdx() {
>      recipe_ref.checksum.checksumValue = doc_sha1
>
>      sources = collect_dep_sources(d, dep_recipes)
> -    found_licenses = {license.name:recipe_ref.externalDocumentId + ":" + license.licenseId for license in doc.hasExtractedLicensingInfos}
> +    found_licenses = {license.name: license.licenseId for license in doc.hasExtractedLicensingInfos}
>
>      if not recipe_spdx_is_native(d, recipe):
>          bb.build.exec_func("read_subpackage_metadata", d)
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171967): https://lists.openembedded.org/g/openembedded-core/message/171967
> Mute This Topic: https://lists.openembedded.org/mt/94428131/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

