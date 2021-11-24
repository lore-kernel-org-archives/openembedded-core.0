Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D870BC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:09:05 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.7354.1637766545273258962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CJwRF9uf;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id e3so11922213edu.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QbiD+Scgefa1mBFvGkUrpw3byIFsemYjZsKyrkqiyWU=;
        b=CJwRF9ufwnt3nddXzsbqVqHP8ist2x3u85kllkg6dTvSEH5wpr4V9s5Q+9UzdA1ppG
         w4kV8vtsNvWDbeyK0B+450XHLYm8BImatGSzvmdDmkNOiCDty8nndN8ca/HU+Sc6JOgC
         MSvQmYBLpWWGgYZnoTkqUliY50M5P+sbgTWzOCa1UgS+O8oONUZ2jIg5HRMpUxt0GgM7
         7mdjSYL+HEwodPDZ7epyCCWDSWah9aimM18Z2bHK4b44qan+EOaQMbST+d70uxrI2a9p
         +Y2yJnU4CbLhoYE0SuhHRh4T+F+ggLBBFnLSa+A5f6R0IXGtkWqh6BSyN7v9NCb7RL2H
         boVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QbiD+Scgefa1mBFvGkUrpw3byIFsemYjZsKyrkqiyWU=;
        b=ntc4+rm7wzelqupxt9mYAf/oqASPJNwQIJ6I24l/U09XFe/hqz9bgD2RBxfXKHMHa4
         8PM05adrLUsYkH4fY2JhpYvzeZmjukePBVJETA/DCA4jFzbBpbUmR0tLYKAQ5azMYBGe
         OEFcbC+YEGXxuEPhjDhHOaLTnIZRklPyaDyVCPAv51ILwdGGGLH78WIIaKynremDPM35
         jWOoQWRtjdPjaec7JG3qA7t4YmU/IByiNqbY9ttrRn5YAvXauSWg7KqpkRjIBcF79+nW
         Sd6GF3lY9gT98iiw97gea1js9jKyHcrbZDzq4vXkAedetoveqsYNLiFuC6ed0aADpg16
         UHeQ==
X-Gm-Message-State: AOAM53317bLXWersrJqIY1CMBXaRFBEmxL6q1N6hLDLJBnn3scSiwyer
	k3bXy0tCDWFaNCN4nUYM2KrEgj99lw4fdvJJ/FE=
X-Google-Smtp-Source: 
 ABdhPJywB5rY0lKBey6cnerz7BE9CcUxW6ffSaf0H2DYuipxo/Gx76Koj/ZADsmtU2mfhF8lVBSic7JYvf4WNMna/eM=
X-Received: by 2002:a17:907:1c0a:: with SMTP id
 nc10mr21349618ejc.211.1637766543634;
 Wed, 24 Nov 2021 07:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-2-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20211124144739.2250-2-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Nov 2021 10:08:52 -0500
Message-ID: 
 <CADkTA4NVG0aBMvshWiDe=nSmKgh2xuvposMQ+NpNZaLhoHs_Hg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 01/15] openssh: Extend to provide native
 recipe
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 15:09:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158714

The extension to provide the native recipe is clear from the patch
itself .. it would be useful to document what is using it on the
-native side.

Bruce

On Wed, Nov 24, 2021 at 9:48 AM Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  meta/recipes-connectivity/openssh/openssh_8.8p1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.8p1.bb b/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
> index ee86bb92ab..33fdf1e8ab 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.8p1.bb
> @@ -182,4 +182,4 @@ ALTERNATIVE_PRIORITY = "90"
>  ALTERNATIVE:${PN}-scp = "scp"
>  ALTERNATIVE:${PN}-ssh = "ssh"
>
> -BBCLASSEXTEND += "nativesdk"
> +BBCLASSEXTEND += "native nativesdk"
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158696): https://lists.openembedded.org/g/openembedded-core/message/158696
> Mute This Topic: https://lists.openembedded.org/mt/87282274/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

