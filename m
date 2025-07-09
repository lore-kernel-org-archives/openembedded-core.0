Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19656C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 04:38:32 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.7210.1752035902919812749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 21:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g03/sm75;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso4174438276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 21:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752035902; x=1752640702; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8/o51bSSY3pmVEp5JggJ/bZZkoUNp5Atr9Bn7D/1ZU=;
        b=g03/sm755Saa7kgz4KgLTdKKwLZE474TEn2yO2wedP8WBV7T9YNXp28j8W4WU4Goqm
         SGyltCodN7CKCOgsP686kKQtTvQ/xN3F4DrvCDurvtfDz3vjo3eocOcdMXl/isaYfnk4
         e5tLpHCVio2Gz1VD9p/cw9V5H2/bLGsDRGmfinh/9N9NFaU0sfnO2MCMmDyZACrKfdh7
         dgg344e2tpmm39cDbYUC4Cba22QYLVgsfXrm8HVEF0jlBHlsOPZrvgwEHrCu0s5iuFN4
         82oh3LE3FCkPqV2MQnNbaS6gcHbnOMXCqI4ZkHWwtdrBUMmbqXxgYnNmx0k/vsS/CNo/
         as7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752035902; x=1752640702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8/o51bSSY3pmVEp5JggJ/bZZkoUNp5Atr9Bn7D/1ZU=;
        b=NoCbNuPlQy5m3yNxagc9EbtWfMKgThXWvE4V8nYHIy6/p9vaF8qXxyYkBjOJfvrOCx
         je0XezOfT7vtshoGlqvgthdYqFhhKm5bYJiDDtdaeiRsd2h9Pxr9ghTKPdFiH40Dh/Zq
         gD2UzvJh9vVCgoLiz7f89FctnGEpePaAuQ7qYPFexRcgKwMljqjkM5Pc5suyFFiNVkD7
         dVe73vCgE6SXwgHyWCw5iwL9XPnDWtNJZDofG9CSSuTIJmY8IOdk9RbQv26RHo/mkDim
         yc8kH8MQR/yQiCbdBdU//kKdaVdlq2jmNXQyX8wjeQxYUVIzAGOnWq8qZpqeDIaAfGL1
         KVrg==
X-Gm-Message-State: AOJu0Yw16K8600r9+S8qnRoMnZxUSw2c756LacjXXURyIHpKRPUL8VCa
	wImCkVyzkHvjHuqy2tJ3a4f5QABMCf/sLKo40nw88giQq/4EKD30JPnzH4uOZapHgfeYjRg1l+r
	g0EGmip4Y8+4dpiPXKLqwpoDjRbbFJWOKsBUp
X-Gm-Gg: ASbGncs3a1N0gW9ReUg86dcx344aEoxcV3jbt+3P0rXjn/uwcPvFbOHTxTqYSIIwnlw
	8GzXGfSXk0/sGugv7XuZT5aWt8AIOs++8B99KS9I/OpIYMZqHx6zKK2mITbb0Dv8lAX3o9k417Q
	yZrjGfyk5avmo1/wlH6JaF0SO7cTOi5H1WECMLT6PjFJY=
X-Google-Smtp-Source: AGHT+IG322L21KDo5vyX2zE6sYU/zw0VsPsxwkXJiQLNP6XYf32//r0n3qZ6slXyBpjce4SiUXNpw7CnF/qxhSn2obQ=
X-Received: by 2002:a05:690c:6310:b0:710:e6b0:1688 with SMTP id
 00721157ae682-717b16a9207mr19032337b3.14.1752035901805; Tue, 08 Jul 2025
 21:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250708221814.791307-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250708221814.791307-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jul 2025 21:37:55 -0700
X-Gm-Features: Ac12FXzq8EKi8UC4Lo2YC0glVcg40HWASt1J4Mcu8bdcDjUPWKDKy7uIHMm7sT0
Message-ID: <CAMKF1sqqB3=1rfK96b2DJcM8Hqt5v=mwcih5da7D_dFGDrutbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: Add sanity test for 'bad' gcc installs
 on ubuntu 24.04
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 04:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220073

On Tue, Jul 8, 2025 at 3:18=E2=80=AFPM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> Installing emacs on Ubuntu 24.04 pulls in emacs-gtk which leads to libgcc=
-14-dev
> despite gcc being 13. This breaks libcxx-native and compiler-rt-native bu=
ilds.
> We've tried various ways of addressing this buit they don't work. Instead=
, detect
> this situation and tell the user to either install or remove a package.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/sanity.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index 1044ed9cc69..d875a022db0 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -672,6 +672,8 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
>      return testmsg
>
>  def check_sanity_version_change(status, d):
> +    import glob
> +
>      # Sanity checks to be done when SANITY_VERSION or NATIVELSBSTRING ch=
anges
>      # In other words, these tests run once in a given build directory an=
d then
>      # never again until the sanity version or host distribution id/versi=
on changes.
> @@ -703,6 +705,11 @@ def check_sanity_version_change(status, d):
>      if not check_app_exists('g++', d):
>          missing =3D missing + "C++ Compiler (g++),"
>
> +    # installing emacs on Ubuntu 24.04 pulls in emacs-gtk -> libgcc-14-d=
ev despite gcc being 13
> +    # this breaks libcxx-native and compiler-rt-native builds so tell th=
e user to fix things
> +    if glob.glob("/usr/lib/gcc/*/14/libgcc_s.so") and not glob.glob("/us=
r/lib/gcc/*/14/libstdc++.so"):
> +        status.addresult('libgcc-14-dev is installed and not libstdc++-1=
4-dev which will break clang native compiles. Please remove one or install =
the other.')
> +

TBH this is good to bring to notice of such installations, since this
situation happens with special installations
and not with standard vanilla systems, it might be good for users to
know these caveats. Good that you found
out a package installed on top of  vanilla ubuntu 24.04 which can
cause this situation.

>      required_utilities =3D d.getVar('SANITY_REQUIRED_UTILITIES')
>
>      for util in required_utilities.split():
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220053): https://lists.openembedded.org/g/openembedde=
d-core/message/220053
> Mute This Topic: https://lists.openembedded.org/mt/114055527/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

