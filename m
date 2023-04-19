Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41D6C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 22:13:42 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.52370.1681942420744417128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 15:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=v+fIgTnu;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5050497df77so329008a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 15:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681942419; x=1684534419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ea5ZBxGDZPC54Tw5E4062GHDdaGVZuaXQroI1yFTkSY=;
        b=v+fIgTnuryYEqUMrJ1Fd/bL4acmMJEgMy0NjzU/+9AiI0EI21wk2y4zJlwXZqwM/jb
         1yFqxlmMh4qRxHP7zdDtIY0X+gF7uG5fKk7yjFdg3tmTYjIOOetw2Dt0uz2eqTuhWMZx
         aTdwtVVtxaEclSWI8LmYHTZqJcb0uphsxWFWMq50HmWVXhuVeenaCv0ZiwxOafb9ZO6K
         o+GPm2ARPzoVBspOiED8pTJyTNHR6Y2WaxxmVHTbT8SSTNmho5OIm69uITPFxKO5UK7a
         IJNTK9b31k8xpk5UnIYoeH6f+5HUs7bRWnjE5qytWjcfxIP29ARTS/bXxxeyBiiYrYHS
         QY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942419; x=1684534419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ea5ZBxGDZPC54Tw5E4062GHDdaGVZuaXQroI1yFTkSY=;
        b=cxneZ82OCsLFbUr8QYkufYmBUWXnhDexxi+rIlhiJFGBjLhJymFPhTRqeIW3nuyjNK
         L6ws+I4jX0upquUWWg7wGqXBIj4pfjj5HfZRlr0lZSszEhYgZe+2y24S0qshubM2XdKE
         YWSfGFq2oDJejqlT4AMlAcXO9iKkJxYcN0yK3dE3JL3i/cHIVmG5bLnleekFI2lHH+A1
         nykGqqgupUcVc2s5CfEYPz+TmRAUoMGUcHWlu8Q7BVJQewSd3YR2jOSaymaW9bO0DaZW
         cVf97cYQ9H7Qd5LZM4Ny60+Gc43oLgj9QsWvyPTV2+2wbsZPPuQiiI4RhRSknrTW1fq7
         JJTQ==
X-Gm-Message-State: AAQBX9dky3fA0TdjKQ0azaMtAgaGC54UAQujhFzCxvd14hMJ2kZLBSS2
	tuq9UhjfEcSIDvkNDT6lZLKtuwLxo+I3MjsJFOmoQg==
X-Google-Smtp-Source: AKy350aqbFLDwWgKCPojfnIwXy/eLIxByJaj67pGqmJ1RvcaB0fmDd9jlCk6FCGMSGAamVWdHynxW5E1EcZLuuWJdMc=
X-Received: by 2002:aa7:d651:0:b0:506:762c:1423 with SMTP id
 v17-20020aa7d651000000b00506762c1423mr7256672edr.38.1681942418862; Wed, 19
 Apr 2023 15:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230419215408.8314-1-peter.marko@siemens.com>
In-Reply-To: <20230419215408.8314-1-peter.marko@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 19 Apr 2023 12:13:27 -1000
Message-ID: <CAOSpxdZLXS_tzFomxtYyR09+tNoN=UOBUDumQWjkb1KVJ8OsDg@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: ignore CVE-2022-41716
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 22:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180229

On Wed, Apr 19, 2023 at 11:54=E2=80=AFAM Peter Marko via
lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> This CVE is specific to Microsoft Windows, ignore it.
>
> Patch fixing it (https://go-review.googlesource.com/c/go/+/446916)
> also adds a redundant check to generic os/exec which
> could be backported but it should not be necessary as
> backport always takes a small risk to break old code.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/go/go-1.14.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools=
/go/go-1.14.inc
> index f2a5fc3f7c..5ecb10040d 100644
> --- a/meta/recipes-devtools/go/go-1.14.inc
> +++ b/meta/recipes-devtools/go/go-1.14.inc
> @@ -80,3 +80,6 @@ CVE_CHECK_WHITELIST +=3D "CVE-2021-41772"
>
>  # Fixes code that was added in go1.16, does not exist in 1.14
>  CVE_CHECK_WHITELIST +=3D "CVE-2022-30630"
> +
> +# This is specific to Microsoft Windows
> +CVE_CHECK_IGNORE +=3D "CVE-2022-41716"

For dunfell this should be CVE_CHECK_WHITELIST not CVE_CHECK_IGNORE

I've fixed it, so no need for a v2.

Thanks for helping with CVEs!

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180228): https://lists.openembedded.org/g/openembedde=
d-core/message/180228
> Mute This Topic: https://lists.openembedded.org/mt/98377227/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

