Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CD3CD37AE
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 06:42:26 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.44026.1725432141856153181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 23:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VdR5Yuz/;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5353d0b7463so10418263e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 23:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725432140; x=1726036940; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhY1UI3adh2ue7/Cau5kTQmz8xOmd6Miq6lU4Yp/Snc=;
        b=VdR5Yuz/j34o6w9MzyACd6jOuy/YOtuF7E45/hS+uuPYMGTeQDnxJdGCxET/P6LyQx
         YtrGpmPj8a0pw5HGQaOrlNFMaHfyZAwHj9591rQJccQ/bdRJ3z/loGtUVnl4NzOopV4K
         q1LvWFcwp5/2LdmVYLWuZR6o6wJxUvKkj8acM8/PE2RZVaJGjv4FIlUWmAIuiZHBva7F
         Q5/qeZt0KYmqNgjr8OpWKYR79cY06uQHBSHGZWAozobw7/knL9qXNx2ZGpGWqsQ+cJ+s
         yND93wDOLYldSG2/IdxfaFvQ8hPH1sUPt5G1QQSBd5LJX8DpGhBlVDEc5/TdLrLa8Jvi
         uIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725432140; x=1726036940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhY1UI3adh2ue7/Cau5kTQmz8xOmd6Miq6lU4Yp/Snc=;
        b=D+IN+9LiVjDWdgGoog8WNmZ9VmJs0YxNcjVZEGzY+2BaboXIwk7GIwlybml077qPsl
         HXRSqLRfdLzsHE6ONPb7a8RusLD1iCivYdS46VBP+ZC13wpEpNf9sYX7QNS4yhxjupnC
         A8XaMOWUhPzqWtqoXOHUxAy4ywBGKV5tm0oynOP1oGuNqNlGLIsRGLOIfRe+qPlgl7Fd
         WoBNzYcFHc8cHkf1RoKhFPscvJ7gJvo997JwmXzOfmqGhEd0KnnQDWKVJ0XpfRhCkflv
         G3z1w/2udktFUGWzuToGY9zeGu48Cq/lQmcYy4nhIrBtGTxobfAwo0fBaQyDxzK9sA2z
         Y4zA==
X-Gm-Message-State: AOJu0YxSJ1d4flnmUr8+QogNkSEbVf6PavPEmDgrWpH9uj8zdJlPGlF0
	h8lzeEkmp02CfLhxL/st5AkHi6/6cVTxkVaFeFCaKy2uoh2MNzHpWHX3mOLYRLmg5wlK2Mnz8Bo
	mCkmQ7+ina0rPJFGj9J7JcXhDDEA=
X-Google-Smtp-Source: AGHT+IFhaerWpIfrCI233aWPlod+FqHae1CcDu4+yqr/YyHxth1b0npTPyo56Z+HSd0axyNo9PRJ4a8eDCV4OtBbUpg=
X-Received: by 2002:a05:6512:3f06:b0:531:8f2f:8ae7 with SMTP id
 2adb3069b0e04-53546b49f69mr13952663e87.25.1725432138679; Tue, 03 Sep 2024
 23:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <17F17A442A5285BD.17352@lists.openembedded.org>
In-Reply-To: <17F17A442A5285BD.17352@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Sep 2024 08:42:04 +0200
Message-ID: <CA+chaQdzgdZtuq_Ax9B3dQTiaoUnT8hRBPAoZ+2oeRNSSbHksw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: DEBUG_PREFIX_MAP: move
 STAGING_DIR_NATIVE before STAGING_DIR_HOST
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 06:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204190

Please be aware that:
https://git.openembedded.org/openembedded-core/commit/?id=3D593ffffc3baf064=
b982891d61dacebd08aed3e96
claims that these options are evaluated right to left (last one first)
and even shows the same issue as what I was seeing as a reason to do
the opposite (move STAGING_DIR_NATIVE after STAGING_DIR_HOST) and I'm
basically reverting that change (which I didn't noticed until today).

So either the processing order changed since 2018 with gcc-7.3 or
something is wrong (at least the comment above DEBUG_PREFIX_MAP would
be wrong if the processing order was changed).

Regards,

On Mon, Sep 2, 2024 at 6:29=E2=80=AFPM Martin Jansa via lists.openembedded.=
org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
> * and add -fmacro-prefix-map as well
>
> * the default STAGING_DIR_NATIVE starts with STAGING_DIR_HOST and the
>   only difference is '-native' suffix at the end
>
> * this can lead into replacing STAGING_DIR_NATIVE path with just -native
>   if STAGING_DIR_HOST is listed in DEBUG_PREFIX_MAP before STAGING_DIR_NA=
TIVE
>
> * I've noticed this by accident in python3-matplotlib where buildpaths
>   QA warning was triggered only for lib32-python3-matplotlib and it was
>   because pybind11 path to STAGING_DIR_NATIVE was mapped to only
>   '-native/<path>' in python3-matplotlib build (which doesn't trigger
>   buildpaths QA and lib32-python3-matplotlib the macro path wasn't
>   replaced at all, because of 'lib32-' prefix in:
>   -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-li=
nux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D \
>   -fmacro-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-li=
nux/lib32-python3-matplotlib/3.7.2/lib32-recipe-sysroot=3D \
>   -fdebug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/i586-oemllib32-li=
nux/lib32-python3-matplotlib/3.7.2/recipe-sysroot-native=3D \
>
> * more details in meta-python fix for lib32-python3-matplotlib:
>   https://lists.openembedded.org/g/openembedded-devel/message/112074
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> Sending as RFC, because I haven't build whole world with this
> and there might be better way to do this or more buildpaths
> issues triggered by this than fixed
>
>  meta/conf/bitbake.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d8252c5b82..ad152ffb6a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -653,9 +653,10 @@ DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
>   -fdebug-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
>   -fmacro-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
>   -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> + -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> + -fmacro-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
>   -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
>   -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> - -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
>  "
>  DEBUG_LEVELFLAG ?=3D "-g"
>
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204110): https://lists.openembedded.org/g/openembedde=
d-core/message/204110
> Mute This Topic: https://lists.openembedded.org/mt/108229773/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

