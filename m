Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89029CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:49:00 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.26833.1697719735249374300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 05:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gQGaUEeK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40838915cecso18067025e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 05:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697719734; x=1698324534; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EwV44cFc9iuyyRXjyOehicn4kKu3cpL/xNj3SXt5bNM=;
        b=gQGaUEeKUD55T3NJwnsqV8IJZRtD+Qy9A2uTMRgXsSr+rC5FNwoQ/aZpQCiMU5e+Cz
         m+tJOZkJ+ljIVkeVvm7/a/81I2Nbkz7Gorm0LRBAIYELIMzr8bjb6Gc5v07PCnYcnbv3
         fFg3xdoXIsxYRFhDWQ5E7cCqlwqJhaqLBuBgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719734; x=1698324534;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EwV44cFc9iuyyRXjyOehicn4kKu3cpL/xNj3SXt5bNM=;
        b=XYpnW3guYO1TX20cA4rztGsnRmk7PbfDwnH4HS2WrhjD+/M4zGTWSyPWkfOGax5Fy6
         71sWEVb0yd3C0XjUMp4qCOtaNcAXkIDczRDhCBsN2MBUxFg4vkZW0hvXb7O1jDWSJyzc
         pBc7eoTumYrdPkoyX0BsHfW2tnZsJ3sk9pI5uQpEYmZB+deV0eFn8kENstihGE/ALHW2
         w5w86GAcdfF+8l7lIR4GEdG24KCWGp6cAo/Jw09GwRf2rN7MnZ857m2HoKXj8NC/cFKT
         m0NFUwqlgG1DeDOXg7vK6KXpCH9mYEbVvW5E7GpOc3cT8y+VffgAAqyUhFbuL+wDorih
         uQfg==
X-Gm-Message-State: AOJu0Yy0vLcf5n/boErDrNp7ZLVjimGilpeowEqzGXgeQ98W28lYr5tY
	1/B7X3peAPo37di6x6rI7CIC7w==
X-Google-Smtp-Source: AGHT+IF1yBjlGiTY1rJQwzooDBqYusCbLZDj16Rc7VaDmVe26R70Ze4YuiTT4Xqa4Il7VS/UAN/VNw==
X-Received: by 2002:a7b:cd18:0:b0:406:f833:d853 with SMTP id f24-20020a7bcd18000000b00406f833d853mr1827592wmj.15.1697719733569;
        Thu, 19 Oct 2023 05:48:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb? ([2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb])
        by smtp.gmail.com with ESMTPSA id n11-20020a05600c3b8b00b004068de50c64sm4439888wms.46.2023.10.19.05.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 05:48:52 -0700 (PDT)
Message-ID: <a56768bd90877ba40e6856e1324e2ded90b62201.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perf: lift TARGET_CC_ARCH modification out of
 security_flags.inc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rasmus.villemoes@prevas.dk, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Oct 2023 13:48:52 +0100
In-Reply-To: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
References: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 12:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189456

On Thu, 2023-10-19 at 14:32 +0200, Rasmus Villemoes via
lists.openembedded.org wrote:
> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>=20
> Building perf without security_flags.inc being included in one's
> distro results in the buildpaths warning
>=20
> WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in
> package perf contains reference to TMPDIR
>=20
> because the ${DEBUG_PREFIX_MAP} does not get used. Most recipes get
> that from CFLAGS, but the perf recipe explicitly unsets that.
>=20
> Now ${SELECTED_OPTIMIZATION} of course contains more than just
> ${DEBUG_FLAGS}/${DEBUG_PREFIX_MAP}. For most TUs, perf's build system
> adds its own optimization flags (-O6 for odd reasons), so for those
> including the -O2 or -Og doesn't change anything. But looking at the
> .o.cmd files show that there are some TUs which currently get built
> without any -O flag. So for those adding the distro's
> SELECTED_OPTIMIZATION seem to be the right thing to do.
>=20
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta/conf/distro/include/security_flags.inc | 1 -
>  meta/recipes-kernel/perf/perf.bb            | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

The fact this works suggests perf is ignoring TARGET_CFLAGS. Is there
anything in the perf build system where we should be passing in cflags
we really want used?

It feels like the fix is still a little fragile and we should find out
how to get it to use our flags. The security_flags hack really needs to
not be needed.

Cheers,

Richard

