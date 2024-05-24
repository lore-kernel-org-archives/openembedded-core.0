Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE2BC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 16:50:10 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.538.1716569407388712196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 09:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eqidBDe6;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e52181c228so89154761fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 09:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716569405; x=1717174205; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdzJKDlForqLKKMzQe0FdH6iGH3/75ngyDn29XAmEOY=;
        b=eqidBDe6FKZERbOFPHgA5E/bXqh7qURY69FhXLpM7+TEFLdFKkwSQKIHRxsIJ8t4Vd
         8+SOML2ypbgQwbhNNo7VSKhXW2Yf5cK/HYjFthSV8Kc9BWlZJjFi+TuIpiGoXOWbUVYE
         DBYKdl7TJZB5lIaY/yOGXVoTS0hn9nyxXWffMaq+74QvanAzRFtZLODUAmkZ2l1LNXKQ
         czeobGV/nEerRPal8QObn2BolpXlUOAyItlYwmhPSAJj96IjjZasrjO+QBU8U9UIvxaE
         ir8KQMpC5p2OGOhKI7vSeA7UrsU5fbdk/HLa+i7JS/nKsRRKVyIUT88jFlRcQ4eEA1LY
         10sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716569405; x=1717174205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdzJKDlForqLKKMzQe0FdH6iGH3/75ngyDn29XAmEOY=;
        b=VHgPoQHWfslTD1ZgBR1HDQZ33zMUIDJLlGe6+fU8qWerYqs2ZrRxHBUDLZ9Tc5ifTo
         zqmf1CSYME0M3mvjdBcCWiQju9QWP7Eg8jniqI1o+lSWhmEvya86KnNnNOv4qTdHmfL+
         k3BuVAvwOqVin/cZ5oYAZ05CX8oS9rFVNHthCDkc0cn+0qXQ8EV0MnpVMHL6GaPD42NX
         +YEbu2NbPxPLY56r5HK+w0Y7F3gdkLsV/yE840TBkuh194S+ntOaupMoyj0/je217ief
         S8nGN8mahd5BMuePuEkDXQoCAf/E1AiXTQis2a2z0cazMYtj1Dl+swsnhHIUI4B3I4Lv
         52Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUSL5K/6DsEqKCS2/zlUxSjaX6MPlVhuds/ZkK60tZ4GsGhMExU7cd6K1HJjkZS0lAdc0IWdFBrfg9AqCMeky++IQWjo5NmllBuR5vp6al73CFgak1hiynz
X-Gm-Message-State: AOJu0YyJF9CAxIOWbzuRGczqEbcgK/2ZrHyP8pIovXHi9uNoZSQcJX0W
	zfCKfw6geNeyZSRN6igG96xjmg10aK5rSaa0qEYuoswxShuqYWZo9Oc4yF1Ua7w/Issz8taKE9Z
	/7vkc4YAFB29HDuhLWe1316sFuaY=
X-Google-Smtp-Source: AGHT+IFXVqLhZbq8AKxhCaJ5dtnYgf0MmVPghKMmQzW1oMSDCn7FJUtefWdatlrLM76yy1Oc/jrjgMFcruoWMn05ovU=
X-Received: by 2002:a2e:9943:0:b0:2e5:6795:f556 with SMTP id
 38308e7fff4ca-2e95b2daf2cmr18041771fa.43.1716569405283; Fri, 24 May 2024
 09:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240524151838.2450718-1-richard.purdie@linuxfoundation.org>
 <CANPvuRk9gEcdqPts-T3tHRS2jZFNiN9+qBQEr_-RY_=h7jzwuQ@mail.gmail.com>
 <CA+chaQdLP3UD+mSAsZEt8KQ20QT=GXa7Xbiq=FZL6N8fpS47=w@mail.gmail.com> <CANPvuRnZUBEGjHHjtUqDZJVGWK=bXau7SLmifuo8Efu-YdcBcA@mail.gmail.com>
In-Reply-To: <CANPvuRnZUBEGjHHjtUqDZJVGWK=bXau7SLmifuo8Efu-YdcBcA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 May 2024 18:49:52 +0200
Message-ID: <CA+chaQf9k2VNdkY0=E2p9eScpiC8jdJTHH=rpoJPoVxhinceZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] layer.conf: Add os-release to SIGGEN_EXCLUDERECIPES_ABISAFE
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 16:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199859

SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS is weaker version of
SIGGEN_EXCLUDERECIPES_ABISAFE to mark it ABI safe only for some
recipes. As you mark it ABI safe globally then the os-release entries
in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS shouldn't be needed, they don't
harm except few more cpu cycles, I've just noticed it's strange.

On Fri, May 24, 2024 at 6:31=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
>
>
> Martin Jansa <martin.jansa@gmail.com> escreveu (sexta, 24/05/2024 =C3=A0(=
s) 17:22):
>>
>> >> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> >> index f2bca0aa5ba..65eb657fd93 100644
>> >> --- a/meta/conf/layer.conf
>> >> +++ b/meta/conf/layer.conf
>> >> @@ -45,6 +45,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>> >>    ca-certificates \
>> >>    shared-mime-info \
>> >>    desktop-file-utils \
>> >> +  os-release \
>> >
>> >
>> > Acked-by: Jose Quaresma <jose.quaresma@foundries.io>
>> >
>> > I've had this on the Linux microPlatform distro for a while now but I =
forgot to submit
>> > https://github.com/foundriesio/meta-lmp/blob/efe9acade717181a5b9d3c520=
d90aa53049abb27/meta-lmp-base/conf/layer.conf#L37
>>
>> You can drop few lines from SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS there as wel=
l :).
>
>
> I can try to see if I still need to have it, this one was to store and re=
-use the initramfs on the sstate-cache.
> Without that I sometimes need to rebuild the kernel when this would not b=
e necessary.
> All of that was validated on the kirkstone branch.
>
> Anyway, I will take a look.
>
> Thanks for the tip.
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

