Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55EDE784B8
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 14:34:43 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.83523.1696257279988618369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 07:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TGST9G2R;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53447d0241eso15755786a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 07:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696257278; x=1696862078; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tG/DpPgUzDD38L7QCSDqGI/TlQTWxwy2ch7mM5EcWII=;
        b=TGST9G2RrHiIWMln/9gxdVfU6svQeSBdFBxZ/9Nu9Z31sFuf5ELp/cnB+pRhP556tK
         OWfxRLsqok3q+Pvc/GFXGPAilJEbHcrgLHZXKbZdgYtfrVQon+ETCnXZ3d04u3JQEdB1
         Lp3Q6TLNxH3SEILXRbsSaknwoz8GPChnIViU7vXMrFC+02Qd7qhjcMnPcSQGWnd4mVwT
         1z8ul/dSnKAY2cMwA4j+WDIOH7nA+iBP8DTDWdspBK2XhJaD9ocq33noLtWu/kYJovpX
         tv+aCyc0fi3BlWrzAHcAP/BsY1jNRFnQPSfvrT5TPwU8YpX8T2uY14LOd4DHKaGzrCgl
         nXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696257278; x=1696862078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tG/DpPgUzDD38L7QCSDqGI/TlQTWxwy2ch7mM5EcWII=;
        b=ioY9QimBppybjyN395a1dbqd042QZk3WmnCiXQhHEWFdgBwSpfZZJuM8nT0flmTIrH
         iBUFcKnO+AE9mQ62l/1Dv1Z5aCkiHoTOM8jCCZ352GwQeJjDurQ1OMp36j8XJaS6htYG
         pbBMdQUshRe7KdY3bg4JXJe5zJsMqLdSwidEeG2MztAEY0alka/GSZCdHn47D7Fp8arl
         Cr21HIhBrLg76Rchctl0DjnOGRkyYOiCSEdZR5MJWK6LuoGAVuqFN1jlRpR9C8JgABCm
         6g9I0h0wQlCtgzGMmWJjaF2H/gAclwJkFIRFO5ieT+O86nfHL4p7uHRfcn58QalxIz9U
         Xuag==
X-Gm-Message-State: AOJu0Yw+qdlx59IhhlJqaFpgECse2DQoupMN7oJeeIRvy0NfMyx39Hb6
	pVEHoIKDnk8nRulIn3+DMyfGAuWrzf7aHHVk/HlPHQ==
X-Google-Smtp-Source: AGHT+IFPLlhcHlmI7hEIPiic8jIz6whL7uMU4Vphj1p4niAWNcR73bdnOtahLvqwSpclwLLUdDZEjc8mIGm9gMalCXA=
X-Received: by 2002:a17:907:7854:b0:9b2:b9bf:e28f with SMTP id
 lb20-20020a170907785400b009b2b9bfe28fmr9849296ejc.34.1696257277968; Mon, 02
 Oct 2023 07:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230929082419.3767306-1-narpat.mali@windriver.com>
In-Reply-To: <20230929082419.3767306-1-narpat.mali@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 2 Oct 2023 04:34:26 -1000
Message-ID: <CAOSpxdaUj7LKkPi51=ziCcyArmSLOg70snjFJm5Bk5qrz0gkWA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] python3-jinja2: fix for the ptest
 result format
To: narpat.mali@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 14:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188614

On Thu, Sep 28, 2023 at 10:24=E2=80=AFPM Narpat Mali via
lists.openembedded.org
<narpat.mali=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Narpat Mali <narpat.mali@windriver.com>
>
> The output of python3-jinja2 ptest should follow a unified format as belo=
w
> result: testname
>
> Reference:
> https://wiki.yoctoproject.org/wiki/Ptest

Is this also an issue with the version in the master branch?

If so, please submit a patch for master branch too.  We don't want to
fix this in a stable branch without also fixing it in master.

Thanks!

Steve

> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  meta/recipes-devtools/python/python3-jinja2/run-ptest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta=
/recipes-devtools/python/python3-jinja2/run-ptest
> index 5cec711696..3004024619 100644
> --- a/meta/recipes-devtools/python/python3-jinja2/run-ptest
> +++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/sh
>
> -pytest
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'| sed -e 's/SKIPPED/SK=
IP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $=
NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s : %s\n", $NF, $0}else{print=
}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188394): https://lists.openembedded.org/g/openembedde=
d-core/message/188394
> Mute This Topic: https://lists.openembedded.org/mt/101653794/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

