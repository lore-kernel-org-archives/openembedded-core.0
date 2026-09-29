Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55678CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 17:27:35 +0000 (UTC)
Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1935.1790702848857738639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 10:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GARnTiyH;
 spf=pass (domain: gmail.com, ip: 74.125.230.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-9142a19ebedso49871666d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 10:27:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790702848; cv=none;
        d=google.com; s=arc-20260327;
        b=NSl7wHodXUt4PBM7eY8yMinYZfehDMOpTnw5yliWXZ8sksKedpsnGpR8XmiD96VPr9
         f3KXuUR6h/kpsUC1LpYXCGPE7zp50G2NbMDytH25Lfej/xiw7Herng9Mnb9G9L8KTohQ
         RdSNx5fkzIjBOeF1i+DhABr3gsztvOsHF2rGGzeg8wgSGWoFFpsuRW1WX2JfSYKfwtX1
         dHBfVUFhJjUFsjAEmif4rGxYBaSVns3TAz8dQulOaUZZPQPDOjY95vuq3k+qU0CJxWSW
         Cj9yOxb+QVREqWwYtyUJ1V868Xq8JSfUWVBHhuyhwshwibDbk3L0fE0NS2uuGJux1nWe
         bb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cupPwPQAyjQhxqw5YEWJc5FZLa6gl1q06p5rc015TUc=;
        fh=CBzNg/NL21DWTHY4T0WFOKUAyqx0HIPJNzSHf+IjR2E=;
        b=gB3yOOTjeOtd/2qTO51hPu2xbK/6PzmBYmJXAT5aBBPjtQ7yLxD3ZX+jGAYqM5zqSR
         BAfPEMdPb0kDac0gHuzU31ejMOyC5wwjahhHwfzSp/+hdRlTtmCHONqCjfDnnNoPILa2
         tVbWH1tOOvLiIj9cZ2b4Ep+RpPSBHtx/o7WYvPJP0LdsmiqPtXO6Ts6Bc6zjgySFqIf9
         KG14QyVYaDTl4tKjqDo00bBXW06wJpQpkQatUyhNjDMB1VupDIw+o6ArUjzqvnxYTB2f
         A1HFgymJLMi8qCDkKY1zQt9FVgYEvRRi47ErXtkZ/WhyOfww6wNg3pUBonZ/BSwm8YFD
         CxHw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790702848; x=1791307648; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cupPwPQAyjQhxqw5YEWJc5FZLa6gl1q06p5rc015TUc=;
        b=GARnTiyH1V6vt9a3V3/QSacL5+OV98vwl857SlaRo5AfOqNl1E6LQtISaZ87ZdqcPJ
         H0yPV1HBZn92jieWPixQxUanBZak72NYoixWXopgtvneqTeDKxzZQBoS7cGvdJ2GlT1A
         8x5siugZU3jKKuQ0FL8TmvssdhyL5Vl9rqit7H0wToFIJ+cg5hfFq07LQI4Ms25f/SKk
         atzxHrmElxkVThQ2tgqkSIRGED55+xI2NRfjAw7cogLQTclZ9Ri7j0oiCn+uhchyTHZZ
         Raq7lmAeqRU1OgbjiIw/TIQu9yr1PWQUTDUpjuVn6xF1sGQgyjezgo7IqMjXrZve9E55
         z/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790702848; x=1791307648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cupPwPQAyjQhxqw5YEWJc5FZLa6gl1q06p5rc015TUc=;
        b=2Eljlqwm49bP29TJ3bnygeq4oAE0iv/lUPY0VbrbNn2r3JwO/yBo19d9+tfu2x7yvT
         sDGmGzQoKPeTaAuqarX6Q4V59P8RyY5QI8cE/6zQxDqGNKZLrNSMZ3Bt2mQRkpZ3LFIv
         TZbc1+5jkVlKJxb469cM7I/XyOVXB7g9VlyMiw7YJ9mAr54G38Ee7Mi7R1xo0nilBpJL
         lDGhjq8siZGaJpYew6sTMSQrKHem2yN4HncA59qZYN8PuCKClqlapFUWZUc/0kxAlOaD
         LJ+pkUKnIcfVDQgaKeYJJiGgJJ56WFyJoii2KtphKSjMuB4qVySq1D8+4bjs+j2HiSYV
         HNXw==
X-Gm-Message-State: AFuF++kLpvs/oQBXkidBomDFtNJvtC2qcnZ1HyE2MPu+wfNJTBbzISpd
	6BL24jQ5xPbukRDhv8BV4MxZ3SrgJWY/YH69R4QPIay0VO9dSF/B4JuUZYb/jP+dZ0rYhecJHh8
	OgpPGBUpLxOXxLBt3X4vUIgV93G6fU/E=
X-Gm-Gg: AYBFou1jxur1itStDDPpkVeQI/fy4FWFMSOVGiBzP5LHg15z+tblCAESuEfpmafnIby
	VRLTa2ERUh6ovhsXsHJ47ZTeazBA857FKMejFfuXqxykjM1GDR8pzrXH6arOACOB9cJ09dvmmLz
	HAt4m1BRhbrGvwUTQm78MSITPIiRVE8yosf9/ZNfT3UQQ/7IciJaLGBYpUXF2pwG5qoI5TKaUJl
	jX7M+Guv4E8UixLh/+LfQrnL7PLT+aVqS1Gya9kSWeSQh+tg93Ge+eLnqJy2aRmNUiBEZRiUssU
	/bSwcAb5Rii76NQuSjOWRFGSCk/Jms7YMWHaIptEUQHzB2KS7B6hIn8C/mZcejj1gozvedIeX7e
	Y9Nf3s3oeWr045jJf2F4JbcMZ
X-Received: by 2002:a05:6214:416:b0:912:517b:20e2 with SMTP id
 6a1803df08f44-9142f94d505mr284309406d6.42.1790702847604; Tue, 29 Sep 2026
 10:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260928193559.3922884-1-daniel.turull@ericsson.com>
In-Reply-To: <20260928193559.3922884-1-daniel.turull@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Sep 2026 19:27:15 +0200
X-Gm-Features: AclHuK8s-w42LnIqDdQp2fvMbhVdRxblkzhvVZ9vipP1WKUSe7lTpKb0z-ab9PY
Message-ID: <CANNYZj-=Vu2wPk9-phsuxLsne+j+8Zc+aOAT55DmTLZeWRs8UA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/recipeutils: honor stable_upgrade for
 UPSTREAM_CHECK_COMMITS recipes
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000213fdf065ca27f26"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 17:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246887

--000000000000213fdf065ca27f26
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sept 2026 at 21:36, Daniel Turull via lists.openembedded.org
<daniel.turull=ericsson.com@lists.openembedded.org> wrote:

> -        if rd.getVar("UPSTREAM_CHECK_COMMITS") == "1":
> +        if rd.getVar("UPSTREAM_CHECK_COMMITS") == "1" and not
> stable_upgrade:
>              bb.fetch.get_srcrev(rd)
>              upversion = None
>              revision = None
> @@ -1079,6 +1079,12 @@ def get_recipe_upstream_version(rd,
> stable_upgrade=False):
>                      upversion = upversion + "-new-commits-available"
>              except bb.fetch.FetchError as e:
>                  bb.warn("Unable to obtain latest revision: {}".format(e))
> +        elif rd.getVar("UPSTREAM_CHECK_COMMITS") == "1":


 It took me a moment (and inspecting the actual code as it is now) to
realize that you're modifying the same if block, and adding an elif to it:

if rd.getVar("UPSTREAM_CHECK_COMMITS") == "1" and not stable_upgrade:
 ... // yocto master
elif rd.getVar("UPSTREAM_CHECK_COMMITS") == "1":
... // stable yocto release

I assume AI can't see that it made the conditional logic less
understandable than it was, but you should. Better:

if rd.getVar("UPSTREAM_CHECK_COMMITS") == "1":
  if not stable_upgrade:
  ...
  else:
  ...

Alex

--000000000000213fdf065ca27f26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 28 Sept 2026 at 21:36, Daniel Tur=
ull via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;daniel.turull=3D<a href=3D"mailto:ericsson.com@lists.openembedded.org=
">ericsson.com@lists.openembedded.org</a>&gt; wrote:</div><div class=3D"gma=
il_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if rd.getVar(&quot;UPSTREAM_CHECK_COMMI=
TS&quot;) =3D=3D &quot;1&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if rd.getVar(&quot;UPSTREAM_CHECK_COMMITS&quot=
;) =3D=3D &quot;1&quot; and not stable_upgrade:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fetch.get_srcrev(rd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0upversion =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0revision =3D None<br>
@@ -1079,6 +1079,12 @@ def get_recipe_upstream_version(rd, stable_upgrade=
=3DFalse):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0upversion =3D upversion + &quot;-new-commits-available&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except bb.fetch.FetchError =
as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot=
;Unable to obtain latest revision: {}&quot;.format(e))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif rd.getVar(&quot;UPSTREAM_CHECK_COMMITS&qu=
ot;) =3D=3D &quot;1&quot;:</blockquote><div><br></div><div>=C2=A0It took me=
 a moment (and inspecting the actual code as it is now) to realize that you=
&#39;re modifying the same if block, and adding an elif to it:</div><div><b=
r></div><div>if rd.getVar(&quot;UPSTREAM_CHECK_COMMITS&quot;) =3D=3D &quot;=
1&quot; and not stable_upgrade:</div><div>=C2=A0... // yocto master</div><d=
iv>elif rd.getVar(&quot;UPSTREAM_CHECK_COMMITS&quot;) =3D=3D &quot;1&quot;:=
</div><div>... // stable yocto release</div><div><br></div><div>I assume AI=
 can&#39;t see that it made the conditional logic less understandable than =
it was, but you should. Better:</div><div><br></div><div>if rd.getVar(&quot=
;UPSTREAM_CHECK_COMMITS&quot;) =3D=3D &quot;1&quot;:</div><div>=C2=A0 if no=
t stable_upgrade:</div><div>=C2=A0 ...</div><div>=C2=A0 else:</div><div>=C2=
=A0 ...</div><div><br></div><div>Alex</div></div></div>

--000000000000213fdf065ca27f26--

