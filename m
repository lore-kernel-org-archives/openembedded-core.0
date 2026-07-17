Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31F5C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:59:56 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15505.1784300395208547235
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 07:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KpmZx2mO;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-80cebd41372so75875127b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 07:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784300394; cv=none;
        d=google.com; s=arc-20260327;
        b=LakiOwvjz+8dvku6voeObeaNJtUYxBvqDYRdejNZ3eYSY1BWCX7Jh+tNPuwU6UljIS
         SxWjHY+zKOF9HeWQpQLi0kmGIaJucU6YEWTKJJt8crV9134l7rB1hMDeRe6rki0w/ite
         CV5pKpnIvo3864Vn4g7IUTItWz4UbY1bgOTG6FBbaWn/LzvJV/v9i8iAexUr5Nn3WWIv
         Tskz83zlb/1Q22GkQ0KSNeIDZunSVg34ygmJA9eJId4gwBKXxgH3zNa5e6btGjj4pyGC
         DNZSw6zmCcrWCkK3inrxlkbaD09ZFP599zqsS2HYvgulWcws1+g/VNG/qt52f3tY1iXN
         RFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m3SlJHVEqgdZZcxIWXI1LOBt8/IsG3wioP9Swejui3g=;
        fh=fGH/q3gN1FSW9CUIi9E4Z32b0labO7L5BOdg6QCAdBI=;
        b=LNInCGKR4lutd1/hhDkNrgZnUKB6rBDXD7q+Hk91eZNWyhtXOTn8aLJRjCpla4XWs3
         fPMPTB2XGmLdpDr59sf1yxB5DyiyYMP942nCLi+PpbokmthHOJp9MbxhbH9TTKKRMjVP
         2L5piyGe3dbN3vuul1VI0UNifNvoR4nOjrgkzM09i+bA2KA6t0/Rdw2frSdsDkYMW3YH
         HHmaGwtTLrkEHOHTSXyTp0EiMQ7Vtw5dVUhARmm9oOi+POkgcGofpCfhHpK5yynPmNPI
         eLHqOVjGe4Lp4QvtuTcIP0II2DlGmPtM2a7d53bYVOYN+ErHpI2v44E8TjoZSdwOjqeq
         Dtnw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784300394; x=1784905194; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3SlJHVEqgdZZcxIWXI1LOBt8/IsG3wioP9Swejui3g=;
        b=KpmZx2mOs1n3HO3JGVoYLewvYYxyUeTgVeBkEsJrVnEyez3l7WyMUEdO2H/w5d30SF
         +x+gA0kZDSy/j2VN5IQd0dgcT6jkSEsOMZHdnW7sb+Da025oB1KPrTUttae686McghxD
         7dz5F0B/2X9JVyBVPymSwnP+NSVAPTrz0i+FubuK7xrpCeVxz/qZ2FPxuwu3JqqdxUpM
         o/t0hRNHPQRcuN1yWgEKdQWUcvMMDutKh+rg5lUbSc1JOnKO6dI23vHcVhsuA/dHgfq9
         +dryzGP4ZUgHgQBwFWjD+n2qEoDpFRODOuPHY9MX39Hfo6qx+NhiqI6AqksA0ePiYdkQ
         4dHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300394; x=1784905194;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m3SlJHVEqgdZZcxIWXI1LOBt8/IsG3wioP9Swejui3g=;
        b=a5IHA5ZApysCEWJTa8K4RjBac3PAGJh73/TvcwHykdNXB8Sum61+1B6UbC/8+cdG5E
         bWxv6AbNmqaJvz6w9D05Qqv35GcbbQNXN98DJ3gBDpaR31wizStlSn4MIMjSLawK4zc5
         16Hwe500MI47CjmOHFz1zdYcphxPLtV5WqyMCTj2m7lokaNnkzzy+lnomj22feHTxgJ1
         oWY2GE1HE7eWCAhOwB8/qp1skM275HXKiC0HQHIdOygHVmEkmBGjFAyO68TUt5KZ8R/h
         QcJDd+pzOHzaNN4BkudA9rPOBEQjEd2YwBJ0/zeQ9psqiG+hAsiRmuzUK7rtOTMvSvrW
         g2Pg==
X-Forwarded-Encrypted: i=1; AHgh+Rpf8x3PodAEX8lpnsuBp3mpEh42p9JyrgFQsVxiEgkvJxUALzFApRhFvTft+c2udxEn6smYzwZCbkqkNCEQvEJudg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwN7v+fUhhPSvVySq4Gute48t7XsyyBwWjvIjgrDvsxh4/U2O+V
	EtQp3dVoaWOy4HeU2A31gPwMgWQ3De9jLzvHFdRobrMMabO9rUC80JzxXmH4I3HGrdsM4a3wwyV
	SyiI7hezdGwW3kB9DyipZAXaOTN20KC0=
X-Gm-Gg: AfdE7ck7xQSAteOCxmfsvCn906jskaQwC7DqZE86plUFY7+O6lRwWnLcscy97KWGPEu
	MO8+0ZV72shv7IV1/pux/p2XoD3ai4QZLzDLAEdNoCKyvKMt7FPoGdtPPfDAIv2ZGrxM6XK65cv
	SzgfMnGNMR1eEPhkMTfT2jsvgkmlnrE8zORg/f08RZl5Tt96Y8HF0hOd52pOTmnqiJ38Gu/HqTe
	4YmuLBsZHy5rXO4MpS8j2patw7KCqwWUPcq9Jv8r8i1QkAh+2iYNQfKdrtKstIfp/P0TrLCQOo0
	mAV4mGqIyVIdVtmQ5WFITeJR0fAOR5feylZM8d27YX9CcDPIiR3osS2zPTvWdyYFkAT0Pjh9P51
	4QIy1pcfL7pz55KoGjucqg3PUXQtaXFp0nv/ewM839VOp9hXGN+uE77iwZPI=
X-Received: by 2002:a05:690c:660c:b0:81e:6915:b442 with SMTP id
 00721157ae682-81ef25378a6mr9132687b3.31.1784300393226; Fri, 17 Jul 2026
 07:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260715140507.2329605-1-ross.burton@arm.com> <20260715140507.2329605-4-ross.burton@arm.com>
 <CAMKF1soJNFHLg3ChGnfT7DHNdR8XF9WeTrHqLVxY5e48a_Q4Eg@mail.gmail.com> <CANNYZj9jKGugpVhDSXVadnpjMy6VxsfX+c4dbM0dcUj=qk9QmA@mail.gmail.com>
In-Reply-To: <CANNYZj9jKGugpVhDSXVadnpjMy6VxsfX+c4dbM0dcUj=qk9QmA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Jul 2026 07:59:41 -0700
X-Gm-Features: AUfX_mwVUJC_Rt6YOLAwmU3ghouRpAXCFx5d6GqEV5E0Xu4Pkc93duxcwbLKqEA
Message-ID: <CAMKF1srnoZO0x_UWQ-kWf8PyEbJzg9dRbAtNmS1TGPzvxmiA8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/12] patchelf: build with meson
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001c65480656cfcf7b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241203

--0000000000001c65480656cfcf7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026, 7:53=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmail=
.com>
wrote:

> On Fri, 17 Jul 2026 at 04:30, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> > README "Compiling and Testing" documents them in order: Autotools first=
,
> then CMake, then Meson. It seems meson is still work in progress
> > E.g. tests support is TODO I wonder if its too early for distros to use
> it
>
> I assure you, even experimental and incomplete meson is a better
> choice than autotools. Especialy 'mature' autotools which tends to
> grow so many custom warts that we have to figure various
> 'Inappropriate' ways to patch them out.
>

Perhaps it will be better to get a sense of it from patchelf developers
upstream. If it is where they are headed that might justify early switch a
little bit

>
> Alex
>

--0000000000001c65480656cfcf7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 17, 2026, 7:53=E2=80=
=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.=
kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Fri, 17 Jul 2026 at 04:30, Khem Raj via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">=
lists.openembedded.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br>
<br>
&gt; README &quot;Compiling and Testing&quot; documents them in order: Auto=
tools first, then CMake, then Meson. It seems meson is still work in progre=
ss<br>
&gt; E.g. tests support is TODO I wonder if its too early for distros to us=
e it<br>
<br>
I assure you, even experimental and incomplete meson is a better<br>
choice than autotools. Especialy &#39;mature&#39; autotools which tends to<=
br>
grow so many custom warts that we have to figure various<br>
&#39;Inappropriate&#39; ways to patch them out.<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Perhaps it will be better to=
 get a sense of it from patchelf developers upstream. If it is where they a=
re headed that might justify early switch a little bit=C2=A0</div><div dir=
=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
Alex<br>
</blockquote></div></div></div>

--0000000000001c65480656cfcf7b--

