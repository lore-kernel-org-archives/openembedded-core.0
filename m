Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D38EA795C
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 09:44:01 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8060.1770371040749228819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 01:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o9u5VNYs;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432da746749so1243050f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 01:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770371039; cv=none;
        d=google.com; s=arc-20240605;
        b=WNiSdb57DhbeTL6pRLX/+L+zLgnNlRyeDGJfspo1zZn++rrTvZoO5dHY6hFbv4p9gM
         PXK5lnvibRnm1jWoWNfNgp9h48TZ/EE4RcK3VViewYu6OKFtYKJQ6w5MEXj3RSHhk7F3
         TeoudcUWvKPcCjkJcozuFma/NVpCzU3W6A0Hfy7uTrHuHL1eEs9trJNa3qZCcf+JAX/h
         yQ2n+fdmDHixAvHpuioql5YsatdyOhTDq0XuOeij5pLrruBFQQMJ/4XMMKMNS6I+QMds
         kDIJpZ+BOIzdSm8bhYE5TTkFc5oP9/ZCslgdRXGaakLuQbhjBWbPPTaAdZ1nfoj8Phyv
         U8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZsnTs6x/prM6gQN5sa/QpyYR15+B/acHgMHC45QLHTY=;
        fh=fqdoH1r71Po/Hewy0YefLkVWNBkPmebTgwLtsZJ5cvM=;
        b=XZ7jVEviG4WhLBBU+pGAytrOmEHaLtTNqiQZz5uzb9edbcsDoPPVFaebiVZZc20e+T
         lkOQg/AT0ZZllg/ncJWUeAoIrp82DooXnPCURauZquy7Q9T/mfMv/kDJ3VfNYCwUXdCX
         SyYgLikHfyShL2sPXIJ0VVGgfQE3MPRr+sxJhzQhN0Voy53/AbNHOHqQUy0KECYoFUtF
         L2VIzEEPzjRmUiQosyvc5tapiURq87aXFg2zHHQpXy1YmN6CV1VTbul6NLzNH0nKOTlB
         OsPw2KaZ10JSiQbDxM2yfxQnpUbzf0dY8Yrnu8CJufNoc/hh5s05q/6vTPbqPacRyPDt
         +YVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770371039; x=1770975839; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsnTs6x/prM6gQN5sa/QpyYR15+B/acHgMHC45QLHTY=;
        b=o9u5VNYsj6sRbBqhShLI9LhQXtFwYsJwWtEtqwjMTE3EW+HJF3EJb6Jr6GHj14gNS4
         Aswl8rhC0Xf7PMNikpeTo4Y5jdgLl/IOOLTnMgu+SafV0VCc6tPUs8ou4cmn2JqmbA4v
         9oNx6iMULB+i2pE0b/UjU/yui3XhMXkRfqHGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770371039; x=1770975839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsnTs6x/prM6gQN5sa/QpyYR15+B/acHgMHC45QLHTY=;
        b=jfYlqIjh7NfEzMX5PCRk/qm7F7uv4WrgGjI5rypQ/5aPKsWW1cchpRTF046VY517AL
         fVRhTdSR+KE9VKA0/7lVbJ4bJ1C0vYM5TaFKg45rl3vHvPK3Nj51BAUpI+5vqwXxAEFn
         i9a+pKRHyHKjr7ZkzP982Xq+8XZ49pYyRbmBfWZsH2MLVQJhNmZFzxZ8cemQ71FQ2dJy
         z8rN7/CPxq3slgY2Got4vgd8Zf5OZ1Rlj+A672glL8EgoQw80vaym91cgPf61QrS37ZR
         OwwhjLmg+F7vN9CIdp7NzKBEldUEIBZ/ZAP/w+h/BMg1h4YswGp/tTDSstK0vxdzh+Oy
         fWnw==
X-Gm-Message-State: AOJu0YzwodQxIQVWtzHskQU3clcopt299ecCYIAdvg0HD4L7oNkOlaUj
	juHYnbcwufQEAXYIzTIfLqzzMsPstsdMROW8wiBJBY1nKvKRexy1eE4iyBmKaHrnFHcBhKxsxXj
	pXFimy4QO+ksGltLIAaFHCj3PQ742E+sSaP4+ZPjA5w==
X-Gm-Gg: AZuq6aLvCPb4eW5wilJdwBRx4SZhlH28p4moB2wSChwZuxw2sWYDmsOwMBar6urRKyQ
	NUh1bq2VlPhcVlqkQC/KLXslX/QHbpL87ixcdwxJ7WgtQ3Cbkrmodh5WQmEc5xUaDfXJnx9FWOZ
	En9+NtkX11qzwPLHPtENfKdOMf2kk6ZvMn/7Dl9e2+1Vet7fOq/1yTcOznZHVLbWQSGTutk7sGo
	FzWJr14eJ191SoxVkhF3MrFaeXfCeYJR2zPiuW5ioImozVt9Y4z+JWN47gAbMN8VQAXBiqjPhdQ
	y9WPQApi4k5rTKCZ3UAT+Tj1ep145gP9LNSxwio=
X-Received: by 2002:a05:6000:1445:b0:432:5c43:76 with SMTP id
 ffacd0b85a97d-4362967e34bmr2873466f8f.39.1770371038990; Fri, 06 Feb 2026
 01:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20260125161623.729884-1-peter.marko@siemens.com>
 <554632.1770355472810056681@lists.openembedded.org> <DG7OEQVVA24V.11T3BEC402DYS@smile.fr>
 <b467cdbc-75d3-4da9-abd6-f5ccdaae4191@windriver.com>
In-Reply-To: <b467cdbc-75d3-4da9-abd6-f5ccdaae4191@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 6 Feb 2026 10:43:33 +0100
X-Gm-Features: AZwV_Qio0owXh8GEVze6r_n4p-CBjpcvGAWH0jtTQHwLfDJ8yPSf7nAjKMHWDOU
Message-ID: <CAMSfU+7pjriLZuA2+Bp6g-SsJ+xixP-_tW5g3ahmWF0_brj3zA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>, "Marko, Peter" <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e66b13064a24a009"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 09:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230600

--000000000000e66b13064a24a009
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 6 f=C3=A9vr. 2026 =C3=A0 09:19, Hemanth Kumar M D <
Hemanth.KumarMD@windriver.com> a =C3=A9crit :

>
> On 06-02-2026 12:17 pm, Yoann Congal wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> Hello,
>
> On Fri Feb 6, 2026 at 6:24 AM CET, Hemanth.KumarMD via lists.openembedded=
.org wrote:
>
> Hello Peter,
>
> (Yoann here)
>
>
> We sometimes see regressions in glibc test runs depending on the local
> environment. In such cases, it can help to re-trigger the tests to
> check whether the failures are consistently reproducible. It may also
> be useful to cross-check the results with autobuilder runs, which
> generally provide a more stable baseline before concluding on
> regressions.
>
> I'm willing to test this on the autobuilder. But I never done that...
> Any pointer? Where do I get the nice test report with the comparison to
> the previous version?
>
>
> Hello Yoann,
>
> You can trigger a *qemux86-64-tc* build with this patch applied. Once the=
 build completes,
> the corresponding results link will be available in the published artifac=
ts.
>
> example: https://valkyrie.yocto.io/pub/non-release/20260206-8/testresults=
/qemux86-64-tc/
>
> The *qemux86-64-tc* build artifacts include the test-results.json file. Y=
ou can compare this
> against any recent successful *qemux86-64-tc* autobuilder run as the base=
line.
>
> Hope this helps.
>
>
That does! Thanks!

The result from my first run of this branch (with this patch) shows no
malloc failure:
https://valkyrie.yocto.io/pub/non-release/20260203-124/testresults/qemux86-=
64-tc/testresults.json

So, what I plan to do:
Take this patch into my branch, test it when the branch is ready and add
this info to the commit message.

Thanks,
> Hemanth
>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>
>
> --
> Regards,
> Hemanth Kumar M D
>
>

--=20
Yoann Congal
Smile ECS

--000000000000e66b13064a24a009
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 6 f=C3=
=A9vr. 2026 =C3=A0=C2=A009:19, Hemanth Kumar M D &lt;<a href=3D"mailto:Hema=
nth.KumarMD@windriver.com" target=3D"_blank">Hemanth.KumarMD@windriver.com<=
/a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 06-02-2026 12:17 pm, Yoann Congal
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hello,

On Fri Feb 6, 2026 at 6:24 AM CET, Hemanth.KumarMD via <a href=3D"http://li=
sts.openembedded.org" target=3D"_blank">lists.openembedded.org</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>Hello Peter,
</pre>
      </blockquote>
      <pre>(Yoann here)

</pre>
      <blockquote type=3D"cite">
        <pre>We sometimes see regressions in glibc test runs depending on t=
he local
environment. In such cases, it can help to re-trigger the tests to
check whether the failures are consistently reproducible. It may also
be useful to cross-check the results with autobuilder runs, which
generally provide a more stable baseline before concluding on
regressions.
</pre>
      </blockquote>
      <pre>I&#39;m willing to test this on the autobuilder. But I never don=
e that...
Any pointer? Where do I get the nice test report with the comparison to
the previous version?</pre>
    </blockquote>
    <br>
    <pre><span><p>Hello Yoann,</p><p>You can trigger a <b>qemux86-64-tc</b>=
 build with this patch applied. Once the build completes,=20
the corresponding results link will be available in the published artifacts=
.</p><p>example: <a href=3D"https://valkyrie.yocto.io/pub/non-release/20260=
206-8/testresults/qemux86-64-tc/" rel=3D"noreferrer noopener" title=3D"http=
s://valkyrie.yocto.io/pub/non-release/20260206-8/testresults/qemux86-64-tc/=
" target=3D"_blank">https://valkyrie.yocto.io/pub/non-release/20260206-8/te=
stresults/qemux86-64-tc/</a></p><p><span><span><span style=3D"font-family:-=
apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,system-ui,&quot;Apple =
Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Web&quot;,sans-=
serif;font-size:14px;white-space:pre-wrap"></span></span></span>The <b>qemu=
x86-64-tc</b> build artifacts include the <code>test-results.json</code> fi=
le. You can compare this
against any recent successful <b>qemux86-64-tc</b> autobuilder run as the b=
aseline.</p><p>Hope this helps.</p></span></pre></div></blockquote><div><br=
></div><div>That does! Thanks!</div><div><br></div><div>The result from my =
first run of this branch (with this patch) shows no malloc failure:</div><d=
iv><a href=3D"https://valkyrie.yocto.io/pub/non-release/20260203-124/testre=
sults/qemux86-64-tc/testresults.json" target=3D"_blank">https://valkyrie.yo=
cto.io/pub/non-release/20260203-124/testresults/qemux86-64-tc/testresults.j=
son</a></div><div><br></div><div>So, what I plan to do:</div><div>Take this=
 patch into my branch, test it when the branch is ready and add this info t=
o the commit message.</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div>
    <pre><span><p>Thanks,
Hemanth</p></span></pre>
    <blockquote type=3D"cite">
      <pre>Thanks!
--
Yoann Congal
Smile ECS

</pre>
    </blockquote>
    <pre cols=3D"72">--=20
Regards,
Hemanth Kumar M D</pre>
  </div>

</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</div>

--000000000000e66b13064a24a009--

