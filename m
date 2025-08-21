Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12660CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 12:51:42 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.8641.1755780698084594499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 05:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FWJGEeGu;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55ce521f77bso1012781e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 05:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755780696; x=1756385496; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJcgrbIkq0kOAQV+Qgj0t9jmXIeZ7o57RXDM+7uOX0E=;
        b=FWJGEeGuf1jN5ur8tsqc5qt8hfg1rGs/mMRBZsBTm4e0DT9eZEZ8fva1Pnf/4UnQ1C
         I7tyAFGvPfYTGqeECIsOqebUkwxV5fel8a6yh1sMWQzHm2ZqEKDRnnzohbMEG2u4QufX
         ws1GWRIpno/9yDRathId/25mInF+ec2F3JmUBlzHHTgs+yzpAh62Jhy0xkwMMotBswkU
         av5MskX7TzwDiTBQHmu/THsdJ2edJHDM6v5k0Afff0H2PmmekzcDGlCU2/2Je8063mtk
         9HDoOkRo3WifWKsgDdvessj2vtjSE3Xp/aT1AuzqMGKEQYzfM61EIXHbF/LLVBtI/l8Y
         +FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755780696; x=1756385496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJcgrbIkq0kOAQV+Qgj0t9jmXIeZ7o57RXDM+7uOX0E=;
        b=NGEawfZzBwDL7YdUoCVeel8403Zed+n2XxUIsN22dezbdcOLSks632fVHEwt6jk/wT
         R8/9nrvyLznz2rn1CF/9CMhHq0vh+KtPH1+Y8dopjS+waw79bjdIE+uDESdrEabFQhd/
         0SAW7qFJWVUZ9f7vKjlQP0tiofvBToFKjYxPpII7fSgPzrY8C2X8BkTeBu+8qw5x6SGx
         +OoEajticw+dDd5rUlcm1XDm9du0wzT3XUFZ93sZbK1yk+8XJilrXsrbXzHnW515t7Vv
         U/iNn6iX5Mo/n1h53F4jSVmstT0QQvqte58cnVV2L61oUPnAzBkY2G+XdGwWN8kdxxtB
         wtlQ==
X-Gm-Message-State: AOJu0YxnmH23pL+ygTBnBADQzIEYuRYUnonAzPNjlRKbJYnZMsFVYdyE
	q16juxfjSQL69Pc+9gG0x8CYsYwmPSQSqHl/HgVEwYo4rcjLkEmM8gTzgZpcskWEbusJgzBXTn8
	4JWZ+GmqXqeUYEZrJqQRZCh9ZKX6ZLiI=
X-Gm-Gg: ASbGncvOWOUlKKWrMEbNEZZtYr9Uc1LtJe+kL3XBiQQzkz0zt7XL1Wv+orAgv6ZBPEA
	qbKrGZcBcwr1I8BRqcReMiQijyNgljAN31+yIYXzht35VTU3sytXNCKQnlwBNlNEnvHZpsPnQO2
	RPdaGbyLaUO5UdiYG30rM7zWsyojV2W3PlhvqP7L7A/vVZ3vn5DH8Z+n4jz8qdr4Xbv4bNR6RR5
	BPqOIlZGg==
X-Google-Smtp-Source: AGHT+IEgDjr6hG0oPuear4XELdLK24OgjsuMx92yqifs1W4bgy1SWfzqj1hdLgOUFRHAbeezMQI0woVvA6BTwW/2JZs=
X-Received: by 2002:a05:6512:4504:b0:55b:93f2:6b58 with SMTP id
 2adb3069b0e04-55e0d524e51mr709976e87.8.1755780695939; Thu, 21 Aug 2025
 05:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250821122655.14029-1-peter.marko@siemens.com>
In-Reply-To: <20250821122655.14029-1-peter.marko@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 21 Aug 2025 14:51:22 +0200
X-Gm-Features: Ac12FXzreC26dZmwosa2ZKd9iqssgaMAPBoQqLx_Jasam38EVopP7gcuP35q87Y
Message-ID: <CA+chaQf7m=2=M=5XPbxonwM3+BQmg3qGd4v56tCMVL1R9uEagQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rust: handle softfp fpu
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 12:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222234

On Thu, Aug 21, 2025 at 2:27=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> With TARGET_FPU set to "softfp" stdlib-rs fails with:
> error: Error loading target specification: ARM targets must specify their=
 float ABI. Run `rustc --print target-list` for a list of built-in targets
>
> This fpu type is set for example for arm in file
> meta/conf/machine/include/arm/feature-arm-vfp.inc
> when TUNE_FEATURES do not contain "callconvention-hard",
> e.g. when using tune
> DEFAULTTUNE =3D "cortexa8"
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
> index cac6e90a9e..fc926fe778 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -409,7 +409,7 @@ def rust_gen_target(d, thing, wd, arch):
>      if features !=3D "":
>          tspec['features'] =3D features
>      fpu =3D d.getVar('TARGET_FPU')
> -    if fpu =3D=3D "soft":
> +    if fpu in ["soft", "softfp"]:
>          tspec['llvm-floatabi'] =3D "soft"
>      elif fpu =3D=3D "hard":
>          tspec['llvm-floatabi'] =3D "hard"

Does it really work now? Last time I've tried as mentioned in
https://lists.openembedded.org/g/openembedded-core/message/214843 it
was segfaulting a bit later as shown in:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ma=
ster&id=3D36a4154e0dd28b6a7be53d622cea0254bfeeb4b5

"rust-target-config: handle softfp TARGET_FPU as soft" in jansa/master
branch https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djans=
a/master

rust was updated couple times since that 1.84.1, so maybe it was fixed
since then.

Regards,

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222233): https://lists.openembedded.org/g/openembedde=
d-core/message/222233
> Mute This Topic: https://lists.openembedded.org/mt/114816317/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

