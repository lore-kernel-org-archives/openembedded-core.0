Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBFBC79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 06:52:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1509.1788850361734667652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 23:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1YPvDBHW;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so2333165f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 23:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788850360; x=1789455160; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=90Q3YLFcO4367uFe6XeRQJDpvFakaSRFJEmStKtyPus=;
        b=1YPvDBHW+7yOhKi8DNgeWhTMqEhHxxL3hGlMzlkgtw5Af6F018KcDlg10VS8xWKWi3
         PibiBuzwjVAq8Yix6+WUysy7VX1wNREnGp2rkZZQ5AemU+Y3mqwZ23+2oMKQrbnMuKJV
         o8VOAfxRFX+RkkDfGeLuvteWF2TdFG556fNEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850360; x=1789455160;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90Q3YLFcO4367uFe6XeRQJDpvFakaSRFJEmStKtyPus=;
        b=IYs6jMuvvDxYm8/qVLLlUcYKa0O0RtPzvMe2jM15Kh9QfVEknF4kZ0M4OIvr/P9MfX
         S2mB2Pt3fxuRyE5PkcmHFRIjNPuD/HyrUrzXsoRElr7z4hobBDFSscGN63Ub4HaljGBN
         g60nOBUjHbC7GoZnZzw0xuH8fnQ/MGNaqrvbLQSa6LRHH3L6OxrEMR8evPpnrtho/6EW
         cfUxHANDi4b9OZ7+TRvLwJL7yExy+yiLBYLjFX5oHXMw/l6O/GjV9lxPHF9Rd4jpYqrX
         zfhYnq7SyXMvyFNSDtrUMnB5F+YS6YGJJTDVVsFyH1Xg5o5CjqwJWgkmYPUUQe8pLDkh
         ysyw==
X-Forwarded-Encrypted: i=1; AKwUvBy243v5ajllBrbX+egh1qPPYXahv2Q975yESSpumTXHdvrdo5OSNtR917wSuAZ9AyAAQ2iMEYSOUhJ+6y2yUWmP7g==@lists.openembedded.org
X-Gm-Message-State: AFuF++n4W6T/2I7gO2IymrtLZhpIoMgJlLXehIuk43p51i0cl9qWTYpT
	B4Tno0Gco3Vz73gmqv2i4deAxIKx+WtE+he+1oBTcpwdpJK/2UJSyaEL0jtbFHkbzcQ=
X-Gm-Gg: AYBFou3OHoYISD7O8lLMaH+Pz9QAZyIoiXsdvvDVDhryL7fvNzFpKPAxOZ7tplaILRS
	kYRSX2dn89M9y7QBDGeNSKNRL8cjh3mGbHVCNELig9Uw8ej+4nya2OFKxMYcLPjA0wybRe1/KYN
	HdWUxsfT6ROpFIkKDNiuINIq0L/qGPYasBXOSAnwH66DoF5FDh4qhQ7LA/LYwpidePfsfTVWdu1
	5UqqTFbwgDEz3VWgusKNf06juD/33zkMQPvilaJsWFn8XvR67mtTaOLwka7bnvDP4xC4zrBkA9r
	ZXdHywioAaO+RonoPxfap6vnRSTg0Nn/FsnEFAsYn73xhgnb5SRpZ+hbmsLrkUqz+J5jZaOWdDa
	tJRIsm+/WbDedqJtNxYXwSQb2bIXX6o/LBVH03Bkmmjgco9cO9Q7siRzn3WEDuxlDfuuZY8JDjd
	L854MnKD5qATGzJqvw8xxioPD0uQWom1ci9C1DJn4ZSI5gHNpB/u0oQaD8kR6LgUlzYCpRYP0Di
	OsfmlPOZEYACoTy0dyhnG1pTxO0cL9bRxGfKV2sE7akEKqDuv4=
X-Received: by 2002:a05:600c:8b8c:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49cf7f4aea6mr255740065e9.0.1788850359624;
        Mon, 07 Sep 2026 23:52:39 -0700 (PDT)
Received: from localhost (2a02-8440-250e-20ab-8c49-6efb-1e77-2085.rev.sfr.net. [2a02:8440:250e:20ab:8c49:6efb:1e77:2085])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm226991265e9.1.2026.09.07.23.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 23:52:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 08:52:38 +0200
Message-Id: <DL9QJ1O6HLXE.13XTS84UD6NQM@smile.fr>
To: "Harish Sadineni" <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH] kernel-yocto-rust: skip recipe for
 riscv64 when Rust support is enabled
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
X-Mailer: aerc 0.20.0
References: <20260811115855.4033577-1-Harish.Sadineni@windriver.com>
 <DL605KBROWS4.DZGC5ES0FPEB@smile.fr>
 <ba9f25de-6240-4854-9ee4-83ebaa89de49@windriver.com>
In-Reply-To: <ba9f25de-6240-4854-9ee4-83ebaa89de49@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 06:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245331

On Fri Sep 4, 2026 at 1:40 PM CEST, Harish Sadineni wrote:
>
> On 04-09-2026 03:04 am, Yoann Congal wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Tue Aug 11, 2026 at 1:58 PM CEST, Harish via lists.openembedded.org S=
adineni wrote:
>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>
>>> Kernel Rust support on riscv64 requires building the kernel with Clang.
>>> Since Wrynose does not provide Clang toolchian support for kernel
>>> builds, skip the recipe when TARGET_ARCH is riscv64.
>> Hello,
>>
>> OE-Core/wrynose indeed does not but meta-clang seem to do that:
>> https://github.com/kraj/meta-clang/blob/wrynose/conf/nonclangable.conf#L=
369
>>
>> Wouldn't this patch needlessly prevent user from using meta-clang to get
>> a RISCV rust-enabled kernel?
>>
>> I wonder if we need a patch more like master's:
>> 2b228490b7e (kernel-yocto-rust: Add clang toolchain check for riscv64, 2=
026-08-05)
>>
>> What do you think?
> Hi Yoann,
>
> I understood what you meant, If someone uses 'linux-yocto_%.bbappend' to=
=20
> build the kernel with the clang toolchain [1],
> this patch would prevent them from using rust in the kernel. Is my=20
> understanding correct?

Yes, we don't know how downstream users derive our recipe, we have to
try to not break their use-case. In this case, it is even documented!
Thanks for the link!

> If so, I'll implement the same clang toolchain check as=20
> 'kernel-yocto-rust: Add clang toolchain check for riscv64' for wrynose,
> and just adjust the error message accordingly.

Yes, I think e should do that.=20

Thanks!

>
> [1]https://github.com/kraj/meta-clang/blob/wrynose/README.md#kernel-build=
-with-clang
>
> <https://github.com/kraj/meta-clang/blob/wrynose/README.md#kernel-build-w=
ith-clang>Thanks,
> harish
>>> This avoids attempting an unsupported kernel Rust build and provides a
>>> clear parse-time error explaining the limitation.
>>>
>>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>>> ---
>>>   meta/classes-recipe/kernel-yocto-rust.bbclass | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/class=
es-recipe/kernel-yocto-rust.bbclass
>>> index 49f2bfc1ae..6be97c2db8 100644
>>> --- a/meta/classes-recipe/kernel-yocto-rust.bbclass
>>> +++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
>>> @@ -25,3 +25,12 @@ do_kernel_configme:append () {
>>>   # More details in: https://lists.openembedded.org/g/openembedded-core=
/message/229336
>>>   # Disable ccache for kernel build if kernel rust support is enabled t=
o workaround this.
>>>   CCACHE_DISABLE ?=3D "1"
>>> +
>>> +python () {
>>> +    if d.getVar('TARGET_ARCH') =3D=3D 'riscv64' :
>>> +        raise bb.parse.SkipRecipe(
>>> +            "Rust support in the kernel on riscv64 requires kernel to =
build with clang, "
>>> +            "Wrynose doesn't have clang toolchain support for kernel. =
See "
>>> +            "https://docs.kernel.org/rust/arch-support.html for detail=
s."
>>> +        )
>>> +}
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


