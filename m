Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26077C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 11:15:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.19175.1684754106804412988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 04:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DTvnR0RI;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4efe8b3f3f7so6619159e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 04:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684754105; x=1687346105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRvF7e7Stf2cj3ViZFHBoAf4erje3q6q62Iqq2YzMe4=;
        b=DTvnR0RIHH0e931dWHy25Uj9dM9no7/VuduTAkZlxspQIPE2pS5p8AbZX2o+k6d3rd
         1kBftpCPAedQMUCIs/1UaUJegDYxhbjy3laXjy0n3rRDFonbOFGuU7EVzAFwhvfUmJKH
         TA3rQJNx91hRJD+6BpPdPeaJGU1rUxiR9zdX6clWdiCk5knoeaSztS+iwsdvvN5sVa+G
         IssYsHrXqlsLLF0mNZ/yoc+RwceExKbJlsB0dXcNlhoY1birrrFkHNBoGVAfj2Sx8kCK
         2gXRaH5BchV/PIt/HfoI65C3OEkNZwXnbBtpxbof5eX2+TAFunWSaef5mH6hwe57oIhU
         rVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684754105; x=1687346105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRvF7e7Stf2cj3ViZFHBoAf4erje3q6q62Iqq2YzMe4=;
        b=F/hmV/ggIMcPpJcuc5molyCUTdOpyDcQLNVxzT68u5cWaa9a1lF//AnfE2I83yvWeC
         NLZb3qu6EMjvr7Fh3Fu2DQZ+jnXnZ/DHfsh6IJ2+WqvDuQfSq56K0T9TuRUsYD7ZB+YN
         wlgYiC96afyftndM+MhHA/ipkMYV+iRhahQFualRC+wbtAr73dV99vCcGNGvLNyZ9e5/
         3ItWji7v6w70FU3ILtNHvOzFVh5NtMgaiFcU+ZoLsEv+cfEMFQIypIlw/y6Lshmug61V
         FNyBrAV8lz6AdheZzT0YZOklBYOSYi5kBku2c+vVae8UVk4NFwgc1OkIwxTBZQuENH0e
         MB0w==
X-Gm-Message-State: AC+VfDxsEi8HXXvi4f3vf0YUIoMlrl4rd3uKWb6rwxdQ6JV3kJQ3u79Y
	DeDuQ0LfUnQqONnNBiCFv5S323/eG42Or6TveFA=
X-Google-Smtp-Source: ACHHUZ4CMSDuXyVYLSWh5JLiHeBLm9PcGrKJxGn8Vfsc3L5rK3fzr66gYsPeu4xSPEXDVfQxCAb36+gJASWVrJ3gxwQ=
X-Received: by 2002:ac2:5973:0:b0:4f1:26f5:7814 with SMTP id
 h19-20020ac25973000000b004f126f57814mr3104342lfp.20.1684754104608; Mon, 22
 May 2023 04:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230509172344.1516743-1-alex@linutronix.de> <20230509172344.1516743-25-alex@linutronix.de>
 <88BC9F83-117D-4E32-84A4-8AAAFFFC5C99@arm.com> <17608309E5862AE7.26337@lists.openembedded.org>
In-Reply-To: <17608309E5862AE7.26337@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 May 2023 13:14:53 +0200
Message-ID: <CANNYZj9V1BAL33ohmde1wZKC9gfmnxvzr0HJHXqT4iDx2+ZvZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 25/27] gdb: enable python PACKAGECONFIG
To: alex.kanavin@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 11:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181591

On Fri, 19 May 2023 at 11:59, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Thu, 18 May 2023 at 17:52, Ross Burton <Ross.Burton@arm.com> wrote:
> > > -PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_FEATURES', =
'debuginfod', d)}"
> > > +PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_FEATURES', =
'debuginfod', d)} python=E2=80=9D
> >
> > This means that gdb hard-depends on python, can we split that out into =
a separate gdb-python package so we don=E2=80=99t pull the whole Python sta=
ck in with gdb?
>
> Yes, I just sent a revised patchset for this.

So splitting python modules and rdepends into a separate gdb-python
package doesn't quite work, as /usr/bin/gdb directly links with
libpython and then loads its own python modules on startup. But it's
enough to rdepend only on python3-core/codecs, not the whole python3.
I'll revise it once more.

Alex

