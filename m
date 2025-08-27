Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE80C8303F
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 09:39:01 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.10871.1756287540547436363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 02:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fKWTA5zu;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-70ddbb81734so13886546d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756287539; x=1756892339; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJX4TAymG7uJANjsgXP6RWdozOyVbsmTN9eSUF/VT9s=;
        b=fKWTA5zuhGlGn/2jZWSiLRp3qJqnZh+inj16HCI6knr8krD8TPL3ejlGMPfV+VALkN
         PXUgU73xTUXFGtBCHYpV3ZDtOPjNF2B/0/4AnINiivC3iMi8Z/U+qernuZeCeLuK+GXu
         BWTYAqdjGLywfpX7/RPH2HfL/vjm+RV8m2tJ3fPieLZNstRetvdbJ6+fr+ZhkIt0Exgb
         tbDtdvYAc+HHaj4yGiG8u/WrRiVNv9ARF6GFLCNmz4I5+11BbQnqadCqX+UetbKMton6
         zpfm25n+n04ObO41arHWKm9W1vBZ/w9rXsGZmmdl9VHr71Wp5ERM6/BP0d0GF3Rr4vW0
         mj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756287539; x=1756892339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJX4TAymG7uJANjsgXP6RWdozOyVbsmTN9eSUF/VT9s=;
        b=vAu2O8xv8MDYs/2HmMAzZuBeUjQDUsv4o0lK2WaI3Vw8atYq/uHCOPN8DnVLiZzZuX
         G7O8/pHAvosQZlE8P8WxQRimlhukMraKAW5N0UMAXmsMmPi83R8BzP+Hsj08KGlJVfi5
         C+CMtIu6AEbMLq4O4F6aEDbW1q2HDpitv+2skENmT1N3a3362+0i7basAYok3fqDC41Z
         cXbEUTX4ekr933TNN9V8aCVepNL3GG2Y64uz9i0/YEk3bILZEnxQ9TnUgyBbvdxDU3p9
         W9+yMw4Ok9xqbJRG+iod9eCcOo2hXTH2HbtrMNFDHzqGe/RbDo6QIIjHP1SkrXpOUbep
         i/Cg==
X-Gm-Message-State: AOJu0YxFqnO2xgFg7mWNyaVVrKV+ZvqJJtArVpqo2Pz98cwPacj4aJYx
	UewN4VvCqbpgDRiOulg08euRE6FcVovP/BkS29i5FodEVdkbD+TKHw66i6mfE0An5vXiPsbE2Ah
	FyXmHUT/AbnIUtGm07hU86+s1i+nKuVVDaEq1/4A=
X-Gm-Gg: ASbGncvsr1X1WscZsv8vby3uGxsNYPnTyUg3gDnZck3PsHBiCyrtKrP+yt2IbFx1xIV
	Rhcp0kV3VNREMwiog+U6V9WXl+VAi1SCUEINCEvIBrF+X0Xkav6wLg8gnzUNkw8iBpF8YQ+3B0h
	mQ2PU6C6dQSIIkdo3t3rWQTG5UqLqKQBXfqn/0Fe1Us+lJfpdT+8ZqYoW6Put/Jjlhqzsanx6Yi
	iM/Q21StRIps/s3H7iy/jVFaODpY3E=
X-Google-Smtp-Source: AGHT+IGwNwO3WYqqHikCWUoB8HayaHQhjk8CqBu8ODbj8ko6JJ4zOj9kFFLOdfyPoOybhjjFNQ02kAMC/W1FPcjKRxk=
X-Received: by 2002:ad4:5cad:0:b0:70d:774e:942a with SMTP id
 6a1803df08f44-70d9710c391mr227177826d6.19.1756287539444; Wed, 27 Aug 2025
 02:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250827064940.16074-1-r.gruenert@pironex.com>
In-Reply-To: <20250827064940.16074-1-r.gruenert@pironex.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Aug 2025 11:38:48 +0200
X-Gm-Features: Ac12FXzXG94PhYDJaIngtVrL0kzyqJNZz4mxnsf-kqr_nPs2IlSyxBp58tPcT8g
Message-ID: <CANNYZj-Kfj+o1e6fpJhMujVtvSb3-9JCGKtfcfHwv5rjMnsH0Q@mail.gmail.com>
Subject: Re: [PATCH v4] scripts/runqemu: raise an error when bitbake was not found
To: =?UTF-8?Q?Richard_Gr=C3=BCnert?= <r.gruenert@pironex.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 09:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222501

Thanks, I think this is good now.

Alex

On Wed, 27 Aug 2025 at 08:50, Richard Gr=C3=BCnert <r.gruenert@pironex.com>=
 wrote:
>
> Running 'scrupts/runqemu' without bitbake in PATH causes the
> following error:
>
> ```
> Traceback (most recent call last):
>   File "/home/rg/temp_stuff/oe_2/./scripts/runqemu", line 1807, in main
>     config.check_args()
>     ~~~~~~~~~~~~~~~~~^^
>   File "/home/rg/temp_stuff/oe_2/./scripts/runqemu", line 624, in check_a=
rgs
>     s =3D re.search('^DEPLOY_DIR_IMAGE=3D"(.*)"', self.bitbake_e, re.M)
>   File "/usr/lib/python3.13/re/__init__.py", line 177, in search
>     return _compile(pattern, flags).search(string)
>            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^
> TypeError: expected string or bytes-like object, got 'NoneType'
> ```
>
> This patch adds a more helpful error message to inform the user that
> bitbake was not found, e.g. because oe-init-build-env was not sourced.
>
> This is an example of the new error message after the patch:
>
> ```
> runqemu - ERROR - In order for this script to dynamically infer paths
>  kernels or filesystem images, you either need bitbake in your PATH
>  or to source oe-init-build-env before running this script.
>
>  Dynamic path inference can be avoided by passing a *.qemuboot.conf to
>  runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`
>
>  Bitbake is needed to run 'bitbake -e', but it is not found in PATH. Plea=
se source the bitbake build environment.
> ```
>
> CC: Richard Purdie <richard.purdie@linuxfoundation.org>
> CC: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Signed-off-by: Richard Gr=C3=BCnert <r.gruenert@pironex.com>
> ---
> changes in v4:
> Changed commit message and error message string according
> to suggestions by Alexander Kanavin.
>
> changes in v3:
> Messed up the CC tag :)
>
> changes in v2:
> Changed the position according to suggestion by Alexander Kanavin.
> I also changed the error to OEPathError as this seems to be made for
> this exact situation.
> ---
>  scripts/runqemu | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index c24528eac8..69872f6de8 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1713,9 +1713,6 @@ to your build configuration.
>          self.cleaned =3D True
>
>      def run_bitbake_env(self, mach=3DNone, target=3D''):
> -        bitbake =3D shutil.which('bitbake')
> -        if not bitbake:
> -            return
>
>          if not mach:
>              mach =3D self.get('MACHINE')
> @@ -1732,6 +1729,10 @@ to your build configuration.
>          else:
>              cmd =3D 'bitbake -e %s %s' % (multiconfig, target)
>
> +        bitbake =3D shutil.which('bitbake')
> +        if not bitbake:
> +            raise OEPathError("Bitbake is needed to run '%s', but it is =
not found in PATH. Please source the bitbake build environment." % cmd.stri=
p())
> +
>          logger.info('Running %s...' % cmd)
>          try:
>              return subprocess.check_output(cmd, shell=3DTrue).decode('ut=
f-8')

