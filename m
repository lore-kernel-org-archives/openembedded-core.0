Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9443C83F25
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 06:37:14 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.7861.1753252625261916369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 23:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WCvgIx3/;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-712be7e034cso62565447b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 23:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753252624; x=1753857424; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxx9h+DpCbNmV+H0XHxDndHGqAmSGWhtQFtDefyDJxw=;
        b=WCvgIx3/RkLcV5nY+V2zGvm+kLSMLG2o6EuMwmSVKEqwRWshNd9t3V9HJmkP5lsU2M
         zNeXCgCs77Vum2mw97yYskBkeJ3gn7bXBfXjbLXHWfoTuxKVgyy9ZEo6cSpi+v/Afna9
         BluQD6KpJZOYsJc97UxoWqjmoBVInY3t9CZ97zXIzCAwdlqvUSPR2F5POXOLCDvv9ybA
         DSldhiYGmVBYNZCbk0cS3d/YgBgiQNfhV3YOaJlVOW2psJEERxj/wkcaV15oWp44wtqh
         MZyfxqcOHJVO8xYot8XGfdtYQPnLMFIf38+zhumAolSmlzEtlAMy6MJyzT1rJs7YrftC
         p3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753252624; x=1753857424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxx9h+DpCbNmV+H0XHxDndHGqAmSGWhtQFtDefyDJxw=;
        b=CfmfYzqoGdV/NJufBCUY2/ARQ4tjKbomdvopnOi5DqzAg4glefUWHGFqXcZWmyiMey
         aHOYOK7mbo0Griy2iqqxhOVktr2kcOzjS/ez+6Z+l5f0vhbU4fp3YadbMN4H+t0nIxCN
         PUIS517jI9VDG1FSbyBXAwPZEJjw8z9F5oI39Sd33/5vopi+YjuRMHshfyKNlzAsPT1Q
         I6RSmiRUMObG60HS4W+/p3jJJTpR1Q1/L9F5UbS4ZkWhxe9l4BTMnyf6Re0mr/Ny7aaY
         y/+ADHDJm8SDFg8e3FCv9eDoYbCk/wh3MeIXbMO1nqE4Fln5HpY00trLIfy6uZTXGX98
         8W7Q==
X-Gm-Message-State: AOJu0Ywj3Ued8olGrRJyWl/1ZIXdg5DFuirU0OJyHSw4butRIJiuCcd7
	6dVKT71f8FxTVGXgb9Mnzyf7nrDhfVHQw8JCClpZGLlf81g9cbmK/QVwVkXz27h54uNkpB3H7LI
	JKdRHgj4wyAvXxNMdHcy/MDtqN0ejbD4=
X-Gm-Gg: ASbGncsob0LiK21Y9uzCFRhX/0wR/r3iEBI3LpDcCVNZffODMhohyOIGeuUpBkD3xpu
	3lOOQYv6bw5PcMEesvzp+Ey61d4jjXTfmJIhfjcj5nOZbZLxLfF/4dna8eTzgC24TH4+XBez3fv
	XdogdIBy+l/Pbr213CYSpk+uPF/GbgeztXDfaH7FPyFxREVzXwhyDt2TPgdHB1w2Sbc7ah+uQjV
	o8r+w==
X-Google-Smtp-Source: AGHT+IHzKp7q10XRpZNGjUbX6js7xNHs5JR6g69Js9lli2Et1gwHXIz73szL5yeLiDezLOKw05nVZToVFOSPlliySFA=
X-Received: by 2002:a05:690c:4493:b0:719:592e:cfb7 with SMTP id
 00721157ae682-719b4235420mr25678207b3.28.1753252624273; Tue, 22 Jul 2025
 23:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250723062616.101590-1-peter.marko@siemens.com>
In-Reply-To: <20250723062616.101590-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Jul 2025 23:36:37 -0700
X-Gm-Features: Ac12FXw7cGQuuY0aW-6iAK3QsZLcS8ODKShcBUmYXxuiM_NzWc22ae_LlQb0Cyo
Message-ID: <CAMKF1soxZmW8zEDy3SNoqPrzRTvDjQ4BqjXwrN0qB2ke_0NMWw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] oeqa: do not fail when sdk package is not available
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 06:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220793

On Tue, Jul 22, 2025 at 11:26=E2=80=AFPM Peter Marko <peter.marko@siemens.c=
om> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Prior to commits:
> * 11277efd057685558a744e98082b5709e849dd2a
> * d0e8b83d05957b1f22d08582e364afa4b522801e
> the tests were skipped if package was not available.
> Now the code calls function ensure_host_package which says
> "try to sdk-install missing dependencies", however in fact for sdkext it
> causes a failure if the installation is not available.
>
> Since maturin is not installed in any image, it cannot be installed
> unless it's downloaded from sstate-cache mirror populated by a world
> build. These builds are however now not done for powerpc and mips.

Yeah I was doing riscv32 build which is also not part of world targets

> It also does not work in local builds without sstate-cache mirror.
>
> Fix this by skipping the test if the package cannot be installed to
> match the original behavior before those commits.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Cc: Ross Burton <ross.burton@arm.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oeqa/sdk/case.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> index 1fd3b3b569..002eed271d 100644
> --- a/meta/lib/oeqa/sdk/case.py
> +++ b/meta/lib/oeqa/sdk/case.py
> @@ -44,7 +44,10 @@ class OESDKTestCase(OETestCase):
>              if isinstance(self.tc, OESDKExtTestContext):
>                  recipe =3D (recipe or packages[0]) + "-native"
>                  print("Trying to install %s..." % recipe)
> -                self._run('devtool sdk-install %s' % recipe)
> +                try:
> +                    self._run('devtool sdk-install %s' % recipe)
> +                except:
> +                    raise unittest.SkipTest("Test %s needs one of %s" % =
(self.id(), ", ".join(packages)))
>              else:
>                  raise unittest.SkipTest("Test %s needs one of %s" % (sel=
f.id(), ", ".join(packages)))
>

