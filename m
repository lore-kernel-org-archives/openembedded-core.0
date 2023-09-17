Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C91BCD37B4
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 16:53:24 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.33500.1694969594696928399
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 09:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDs9ATJl;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1cca0a1b3c7so2412121fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694969594; x=1695574394; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al40hAePtn9XXViAICZ++197zzKem0NeyEDawW1Ozjk=;
        b=jDs9ATJlCC0uSvYUDhBi/5kKVm5nZ8/OWrGI+VxM7YZZCknDp2xUsk33m94M+4bw7L
         33cpacGLw0YNfLp8WY4xhg6JCAphsP38Gk7yXDQ9YN761XqIg1EcK7/fUuvRljj2kqgS
         VMGJQYCQFmZHqjiuiqEw0638EVW0g4hlQ2YgSyZMelhdYuKQ1n+O/30y4RbIQKkEHRd/
         cqbxZ279AePPM7ZaDgdgLjbBQUDGdYiokLrjRHzTE9vgR78SXtt0io6zs7FQsBFAjXoX
         0nVqUjjRJ/X3zkTGfOL1xQrcIjcifds6iGaSxaxCoq2sgF49cIZ76KHdy8KIKeBXbYMp
         TsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694969594; x=1695574394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=al40hAePtn9XXViAICZ++197zzKem0NeyEDawW1Ozjk=;
        b=qhfRlbKt/IlFASyr+EwXEmXNdOqooVfL+FkRY4WIIlh8Yems+GN84mw9IT3BNRwYEg
         wMuvdGBb/oy8WEGwq5IdLRySG57kK6cSI8zZwcqV7n9hanJXvq81+Er33owDb4iYl8Yu
         h98bYhjtO3dW214G4cd6+pCFBl/tTsoy32LH5EHcEOhnsIGLsea+yYoiHdv/Jl/dHf9c
         7n6xrBsae6yBtIjj9t4eE9/20ZLcn06PbWp/75EqRmZLqCvYEAMGQ2kASbTuUGabDkv3
         +MUN86Hqoi6swIyyKITuG4fOoCn1m9dxZLX3KLmbCbOfuHs4+9Ph4cLDfdXe7Mm0X1yA
         LOSQ==
X-Gm-Message-State: AOJu0Yy0z/ocCn0Fw17x1oxWptCJUNtKSLdwn27mLWToAJmFOu085i3y
	nZw64ciPaqfyOMgSWo9IGr9sJc9ODS5+Vp/NBlg=
X-Google-Smtp-Source: AGHT+IGFzFTP8PVpKeDon4pZgBIJT+1x6V4b0jc5XKO7IN4KxybzlmrbtoLTRKEIkZtXBy4mdzOSFzQtfgYvAZy7MqI=
X-Received: by 2002:a05:6870:3313:b0:1d1:39d8:da1a with SMTP id
 x19-20020a056870331300b001d139d8da1amr7611743oae.15.1694969593925; Sun, 17
 Sep 2023 09:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230917093901.428214-1-alex@linutronix.de> <20230917093901.428214-8-alex@linutronix.de>
In-Reply-To: <20230917093901.428214-8-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Sep 2023 09:52:47 -0700
Message-ID: <CAMKF1sr0p49ESE+KRmS2j4NTYm-gxDQ0YJejjpa+nDpcK61WyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/29] strace: parallelize ptest
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 16:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187809

On Sun, Sep 17, 2023 at 2:39=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> strace is one of the slowest tests otherwise (can take 40 minutes or more=
),
> and this brings it to under 10 minutes \0/

This is a good fix. Next in the slowest line is perhaps lttng-tools.

core-image-ptest-strace () - Ran 5 tests in 2213.594s
core-image-ptest-strace - OK - All required tests passed (successes=3D3,
skipped=3D1, failures=3D0, errors=3D0)

core-image-ptest-lttng-tools () - Ran 5 tests in 2086.423s
core-image-ptest-lttng-tools - OK - All required tests passed
(successes=3D3, skipped=3D1, failures=3D0, errors=3D0)

>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/strace/strace/run-ptest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes=
-devtools/strace/strace/run-ptest
> index 86daed92201..1224229e8fc 100755
> --- a/meta/recipes-devtools/strace/strace/run-ptest
> +++ b/meta/recipes-devtools/strace/strace/run-ptest
> @@ -3,7 +3,7 @@
>  set -u
>
>  export TIMEOUT_DURATION=3D240
> -make -B -C tests -k test-suite.log
> +make -j4 -B -C tests -k test-suite.log
>  res=3D$?
>  if [ $res -ne 0 ]; then
>      cat tests/test-suite.log
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187781): https://lists.openembedded.org/g/openembedde=
d-core/message/187781
> Mute This Topic: https://lists.openembedded.org/mt/101411933/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

