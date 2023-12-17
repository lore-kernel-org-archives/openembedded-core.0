Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDB3C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 17:26:09 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.22935.1702833966817421327
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 09:26:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMHugKKB;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7b6f19f3af9so123536439f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 09:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702833966; x=1703438766; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ViKYz+UCTyzoybrENZfXzy2SimsIcG3H43w2fTzHPA=;
        b=WMHugKKBprcgZp8U//idjLbg4UvT36YpPCTDrXKADoxJcp+34OlVzdKM4Fhs+j2a5x
         YvFLRNw+kU1kAiOK+VeskrxWGbx/tbi9BB/E64InMH5qH+8L2sQRWeGEbyfRpGSS2U89
         5Wp8sy3114slL3Mszq2t3BqUENiEioOqAlxJtIV6WHX+XPjXBoG/8XSVj4CM9PmqLMqF
         RzBhKmTHlOEVLhS3iUpKP6xqyMgXvUgObl/AVOQ7GIhgwflZPQtZwEbu9v7gSln+mLl5
         85MdZTbsaBOCAwaTthfU/Fb0jArenvcpZ18WxjiQOrO1ivJfyNL1iNLz+eNKkyIaPtec
         mP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702833966; x=1703438766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ViKYz+UCTyzoybrENZfXzy2SimsIcG3H43w2fTzHPA=;
        b=BY+ZT2z77p4dqkHdGbAJozfvJTOffGk3itG6AVxR/zMsAubu62lcs+ZgGXUcPucWmW
         +x0e8/rRFhIAwc80e0elTDvde/QHOt1D9M06k7QGEsqNlO3vQXpD5vZSVF9lheLNqEko
         e/9uAFcAvcSJdJGrRzauLp6fmuc+yaaGmXHPurIjkDf0dywzFJGAC7xxxPgBBksY8bpN
         4+20vAdusCb8M4UnDJO41OJFtbyN0mlie1GhnC7b/bekJYceKURVKdtcq775sOmFf9md
         naEFd7/ra3FdtN8O6Jt2zhE6z3OnvxkGsBy4PfID5pJXLZIStGhtUrik5rbxS9//nWSS
         xbzQ==
X-Gm-Message-State: AOJu0YxNrTU2hxdCpNQLzZ34dwUzP86Xv862lTjCLJO/ra6WxcFDquML
	Oa2KPg177J8H6iZPZwe61oQY8IdX3Jm+lNUElz4=
X-Google-Smtp-Source: AGHT+IHVORn5XtTaw7/ii1qq5zh9Hjx3kQzgTE8YPnJAk9ezXNypL5JPiaecgtFrmpYs7UzFXpHBa3iYuav0dkFISPg=
X-Received: by 2002:a6b:5803:0:b0:7b3:9e0d:7e83 with SMTP id
 m3-20020a6b5803000000b007b39e0d7e83mr20188624iob.6.1702833965999; Sun, 17 Dec
 2023 09:26:05 -0800 (PST)
MIME-Version: 1.0
References: <20231216135306.188070-1-ecordonnier@snap.com>
In-Reply-To: <20231216135306.188070-1-ecordonnier@snap.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 17 Dec 2023 12:25:55 -0500
Message-ID: <CADkTA4MtEWviatMwR8vO6TCH6nninLjbe2kjzVMHT9+-BDQsdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 17:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192590

On Sat, Dec 16, 2023 at 8:53=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
wrote:
>
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> The function do_symlink_kernsrc is not reentrant in the case where S is d=
efined
> to a non-default value. This causes build-failures e.g. when building lin=
ux-yocto, then updating
> poky to a commit which modifies kernel.bbclass, and then building linux-y=
octo again.
>
> Bugzilla: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15325
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 9ff37f5c38..130bedd901 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -194,6 +194,11 @@ python do_symlink_kernsrc () {
>              os.symlink(s, kernsrc)
>          else:
>              import shutil
> +            if os.path.islink(s):
> +                # this happens for instance when a poky update forces sy=
mlink_kernsrc to run again
> +                # after s was already moved to kernsrc
> +                bb.warn("%s is already a symlink! Not symlinking kernel =
sources" % s)

I don't think this is a warning situation, perhaps bb.info() is better.

Since nothing is wrong, no unexpected results will occur and I really
don't see any side effects .. is why I don't see it as a warning.

Bruce

> +                return 0
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192564): https://lists.openembedded.org/g/openembedde=
d-core/message/192564
> Mute This Topic: https://lists.openembedded.org/mt/103208527/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

