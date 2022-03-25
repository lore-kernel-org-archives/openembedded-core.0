Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F74C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 10:48:49 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web08.3554.1648205328284144926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 03:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CCRbKWNj;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id c4so4004690vkq.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 03:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EFfwb/5iNwtUk5QaiLOlMEv35PorpzwQLBj11Uj3IO4=;
        b=CCRbKWNj+V+4hHrDOJo3h9CfUddk3WqAF1q+Elgiv7W9WHvZ0+7JvVeWLWW6PLiUFf
         PuV6en0Zl8uXkVV7guGCNKXEk1uY0qIC0IE8DxJJGqdrme7nvh8uAdvKG5Xc0FAajJMj
         rwR2nnOWJs2jfxx4pLndoCz86P669MLzHx/E+6SdIK9mnEA85CqOt7Ti2t+zhHO506rk
         XscEd2bVrHZvqlBRBVc8JIlwAHjB2igJpBpKdctEtwMlCfsSj/aq2WQ9Y9TWURrToYsv
         3jb7X/MMc8lGoeXvsek63WlEQYhwMaLuzfqXQE+5n126GHoDVYe05vgkUSwfNge2iXAy
         ZRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EFfwb/5iNwtUk5QaiLOlMEv35PorpzwQLBj11Uj3IO4=;
        b=Bqq714eDup7gx9qLVn9Lo1EItOaUhZNrCg+QJhabKmIeWFFnzWqCDY7lNLRGY5qA5Q
         taU5e2cVcuFLf0vi3hvtYQ0IcR96CPD5WJZLHTS+fz7ns21S5gYSlg+LH+pEqRfH48de
         awgwFXKCj/m+0NBbUqJVQEkA92egJfPWNiziVBKaa77gtVI19PJBll3s7phjBfiqVA9n
         MXuem3DAXPCmoT5UzV2jrJ4Mt6OJ6izrGn5DWTuxZk+rjsK+cBRTc5ocs2QXPbIIs9nG
         4KawawX+9o4ONCiDmQHYAbYpJiqShIbH0vKyqem22tWU4XJFDGDXyxshbCj60iEdR6vS
         gtcg==
X-Gm-Message-State: AOAM531kNvU70fIV1ATLK/yXNr3U+31xGzthXq7Tzm1Wcd2LDYTXQD+T
	xaxDoiIhufwl6f+KCZOTTfmeHlkA2vRoBUTlWYw=
X-Google-Smtp-Source: 
 ABdhPJxhVBi+N0bLWAes/lb0eIXh6HUHeGZKrrgua4DpfByWqLv9RCr3KhLi9+yVEn6HKnAp0YTwPBD453jzYS9gN5s=
X-Received: by 2002:a05:6122:130b:b0:337:bd1a:7f74 with SMTP id
 e11-20020a056122130b00b00337bd1a7f74mr5068270vkp.4.1648205327294; Fri, 25 Mar
 2022 03:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220325101831.1451-1-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20220325101831.1451-1-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Mar 2022 11:48:36 +0100
Message-ID: 
 <CANNYZj9htpDkynv-8hcJPA_MU18TtH83bbu_e15rG37z_+RfnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] zstd: add libzstd package to minimize runtime
 dependencies
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 10:48:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163633

The standard way to do this is to inherit lib_package.

Alex

On Fri, 25 Mar 2022 at 11:19, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Add a libzstd package to remove libstdc++ runtime dependency from
> library users and reduce the size of the library package and its
> dependencies.
>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> ---
>
>  meta/recipes-extended/zstd/zstd_1.5.2.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> index 0ddff469b8..3887f31ecf 100644
> --- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
> +++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> @@ -36,4 +36,8 @@ do_install () {
>      oe_runmake install 'DESTDIR=${D}' PREFIX=${prefix} -C contrib/pzstd
>  }
>
> +PACKAGE_BEFORE_PN = "libzstd"
> +
> +FILES:libzstd = "${libdir}/libzstd${SOLIBS}"
> +
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163632): https://lists.openembedded.org/g/openembedded-core/message/163632
> Mute This Topic: https://lists.openembedded.org/mt/90019254/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

