Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7C0CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:37:48 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81189.1781015865890493232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dGqFJ6Jh;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6611669cd16so3156724d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 07:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781015865; cv=none;
        d=google.com; s=arc-20240605;
        b=FzVtr7S5uSOJHYxf++SXJCnX1ephtuRCPeGYuOracD/29CTrDvZOsz/13pjcZ10NKD
         l2qfIJCrGAAsMtA62o7iW+WzMyypLbfNM5YkMw4XP8aCmBQw5IzVzI4V3ipU5jOAMYoL
         Iu/fP5SzX6/zyhOObXFbr5aXHKT9C4KEQypb99Fq4vD8kmI0hd5aIvERMeBqDlwNuICH
         anq98dvb7fsLFZigag8Jou+lWLCm5AdgIJWyaf0QYk5dL85xPvsZ7ACIUNsfz+juIH+1
         HH6/DsvvlfzFrBQkCmtLSGraAnvdQZEUj7Dpt8D4jMafamix8DtFpjiAev7XjIvlrHTu
         /j8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V/WNEk7SwQB0XTdTdxRDF7YUMMHWlXFnSTaC+tfX5nU=;
        fh=cbgl5IOPsNxVRhYTH4PVIGJOnA+jpdWoNWXXxuAa4Z0=;
        b=LIXfdDlpvOmZ2sTysjwNHR0/smkZz+U6Kq0uQz8p+xNeVD3uEkhuaqJSaki+qWBuIU
         QXMH3DyClHzxHRfJtLmpAmf1Rq4ySwJKdVjZMmt7Y3yNqujNca3VudTfPxjL+iAjwswd
         XSytkY+CXDVyGYi+TDK5xl5jZoNnS9RtZYKEbWIciQxdFRoCkuQOnN/eAOtn7+i4eQEo
         apskffC8AP0WXlV173h/GGPmXpe269fL0WI+K37gI4v2PLEFOhuVxyEQ/ceqBUSOwEOx
         ZA5GwL/JBGXX0zc6Lr3fku4d2aHaLQiDTLmZumfNAyXlikCCQ/UtE/wJqMljM8Cab4+y
         029g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781015865; x=1781620665; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V/WNEk7SwQB0XTdTdxRDF7YUMMHWlXFnSTaC+tfX5nU=;
        b=dGqFJ6Jhsr6hXbeEIO39VDw536EwE3uQZk3PFDMv8xCNiweG6kOB2h4QLpzjjIsz0o
         iz9bAXRPoubAp+l4lJWcgNXXRVv0x9CchUey5VoTEw70LnxpWJhUCFEr/N9FaFcEE7HQ
         lyfXWY2Uph/Ci0Uz8DK9UnntNftu3LsuBB2eVNQzq+fzS0PPnIaTySMkuubG2vnO+jkn
         sm0ohkwX9p/AkFU2/0XzgVSlurlrRQTxKNz0Rcw2ls11H7CDzcU0LT3bC1J4xDNqFx4P
         1FpCscvmg4a29xKL08+B/n2xOZs8yFZHdIl1I4OD6/nOpI73rn0QnbV3Oe6ugiG4HtfD
         d/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015865; x=1781620665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/WNEk7SwQB0XTdTdxRDF7YUMMHWlXFnSTaC+tfX5nU=;
        b=SUY8ypRsKwywOOXSeynPWsgUJ9u4tp4TQ7rMRPEDCUhwgWoDoU8Q8MDi2WNezCYJUb
         hqjHkp+ixCh8n4da3YHkCwE331uE1IcckA5eHy1zXQzpeNko8T/cZ2bmNQQMEhvZvIp5
         6F8Z3KKnBtrK1NFDV38dyQbALgNd+1f/+HdvaL6F7FsDDnIwgc/al3t3mAleARtkB+Bg
         z49hhGwCFYgw5LvP4q3Z1sE05IIusb9Ox+obUk+u9DDKwSMC9QLAzKhExIYSDfJ/EFbT
         TZyd78fIsXqsOHDmOor4259DN4XhV02bZR6nUqN4oPAFx6L2yMSfLCiWVAjY8HO37AVa
         8BPw==
X-Gm-Message-State: AOJu0Yz32mQuBlBboQvk6rO66TtT3mKgOL5bZYirzB+0c2Z8NthiDjS8
	xFe+14ZDh0paUNoSZGwT9fus4K37FwG6R12wQBGeQ4AVxKvob0GdPoLhug9HS1rBF16L4ACsbkT
	PHawx0SjnPSYnO/H9lgBxil8m9nct/nk=
X-Gm-Gg: Acq92OEpxazh9QUwHyHpSw6RJ296ttvhAHk2CpMXJfEmZ6if6C9RZ9gjfim5YEkCcGM
	6TwHluaaPXRexkvsnV1qD54qCTtH/pDcH9En3ETxPh3/3mytAfx3PSRvVsS2qhBdK4JmiN+BFy1
	yCHJcVoAVXwiJ6QD8idUtsOCODK0CsiryygYmjTrYol2UZBKZiDFP5V4nRsKsJOfk4MTKUgCtWm
	pIObWMCh1oVfnsUEB1BH43+njzkzvLJnH8kN1BPJtuuarmHvQeQOHDWFlfBcZz5Z5l+OsB/PUDj
	KoOcHmc4MmslrwwmCS0mCZDHuTy7GHJaKCT1ztHAbNAudKlychWY/IeRd2QMxjnIrH0sSqod9J2
	20Zf8j/+KCXIrXKMOU4r9lDbIXzfS8WzYqv5D65kwS/93+nzllg8S0TmBx8GJbmqLmgDiDJz8mN
	Z8rV6Vf2epZZxGZ+6e
X-Received: by 2002:a05:690e:b86:b0:661:878d:a772 with SMTP id
 956f58d0204a3-661878dab1emr1145718d50.27.1781015864595; Tue, 09 Jun 2026
 07:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260609074603.1429006-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260609074603.1429006-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jun 2026 07:37:17 -0700
X-Gm-Features: AVVi8CfO-W5wPYUxtaR01uJUA_5VaFD3mO7UCVlmxQUhJa1Rg7uli9v_ALjyUuA
Message-ID: <CAMKF1spxdrjhNCR8MP83GyO4t5TAUcfAKdpDbBBteibFTd3RzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] oe/utils: Drop all_distro_features
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f2dadb0653d311b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 14:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238299

--000000000000f2dadb0653d311b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

there is one recipe atleast in meta-networking which is using it

https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes=
-devtools/python/python3-scapy_2.6.1.bb#n45

On Tue, Jun 9, 2026 at 12:46=E2=80=AFAM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> It is just as easy to use bb.utils.contains("DISTRO_FEATURES", "x y", ...=
)
> and this function is just a wrapper. It isn't used anywhere in core.
>
> The contains function is better optimised in bitbake too.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oe/utils.py | 20 --------------------
>  1 file changed, 20 deletions(-)
>
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 120b6443935..4e09a8b927f 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -170,26 +170,6 @@ def set_class_filter(var, features_var, filter_var,
> d):
>              bb.warn("Unexpanded variable %s in %s is not recommended" %
> (issue, var))
>      d.setVar(var, '${@oe.utils.class_filter_features("' + defaults + '",
> "' + features_var + '", "' + filter_var + '", d)}')
>
> -def all_distro_features(d, features, truevalue=3D"1", falsevalue=3D""):
> -    """
> -    Returns truevalue if *all* given features are set in DISTRO_FEATURES=
,
> -    else falsevalue. The features can be given as single string or
> anything
> -    that can be turned into a set.
> -
> -    This is a shorter, more flexible version of
> -    bb.utils.contains("DISTRO_FEATURES", features, truevalue, falsevalue=
,
> d).
> -
> -    Without explicit true/false values it can be used directly where
> -    Python expects a boolean:
> -       if oe.utils.all_distro_features(d, "foo bar"):
> -           bb.fatal("foo and bar are mutually exclusive DISTRO_FEATURES"=
)
> -
> -    With just a truevalue, it can be used to include files that are mean=
t
> to be
> -    used only when requested via DISTRO_FEATURES:
> -       require ${@ oe.utils.all_distro_features(d, "foo bar",
> "foo-and-bar.inc")
> -    """
> -    return bb.utils.contains("DISTRO_FEATURES", features, truevalue,
> falsevalue, d)
> -
>  def any_distro_features(d, features, truevalue=3D"1", falsevalue=3D""):
>      """
>      Returns truevalue if at least *one* of the given features is set in
> DISTRO_FEATURES,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238271):
> https://lists.openembedded.org/g/openembedded-core/message/238271
> Mute This Topic: https://lists.openembedded.org/mt/119719566/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f2dadb0653d311b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">there is one recipe atleast in meta-networking which is us=
ing it<div><br></div><div><a href=3D"https://git.openembedded.org/meta-open=
embedded/tree/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.b=
b#n45">https://git.openembedded.org/meta-openembedded/tree/meta-networking/=
recipes-devtools/python/python3-scapy_2.6.1.bb#n45</a></div></div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Jun 9, 2026 at 12:46=E2=80=AFAM Richard Purdie via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;richard.p=
urdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded.org">linux=
foundation.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">It is just as easy to use bb.utils.con=
tains(&quot;DISTRO_FEATURES&quot;, &quot;x y&quot;, ...)<br>
and this function is just a wrapper. It isn&#39;t used anywhere in core.<br=
>
<br>
The contains function is better optimised in bitbake too.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/lib/oe/utils.py | 20 --------------------<br>
=C2=A01 file changed, 20 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
index 120b6443935..4e09a8b927f 100644<br>
--- a/meta/lib/oe/utils.py<br>
+++ b/meta/lib/oe/utils.py<br>
@@ -170,26 +170,6 @@ def set_class_filter(var, features_var, filter_var, d)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Unexpanded va=
riable %s in %s is not recommended&quot; % (issue, var))<br>
=C2=A0 =C2=A0 =C2=A0d.setVar(var, &#39;${@oe.utils.class_filter_features(&q=
uot;&#39; + defaults + &#39;&quot;, &quot;&#39; + features_var + &#39;&quot=
;, &quot;&#39; + filter_var + &#39;&quot;, d)}&#39;)<br>
<br>
-def all_distro_features(d, features, truevalue=3D&quot;1&quot;, falsevalue=
=3D&quot;&quot;):<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 Returns truevalue if *all* given features are set in DISTRO_=
FEATURES,<br>
-=C2=A0 =C2=A0 else falsevalue. The features can be given as single string =
or anything<br>
-=C2=A0 =C2=A0 that can be turned into a set.<br>
-<br>
-=C2=A0 =C2=A0 This is a shorter, more flexible version of<br>
-=C2=A0 =C2=A0 bb.utils.contains(&quot;DISTRO_FEATURES&quot;, features, tru=
evalue, falsevalue, d).<br>
-<br>
-=C2=A0 =C2=A0 Without explicit true/false values it can be used directly w=
here<br>
-=C2=A0 =C2=A0 Python expects a boolean:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if oe.utils.all_distro_features(d, &quot;foo ba=
r&quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quot;foo and bar are mu=
tually exclusive DISTRO_FEATURES&quot;)<br>
-<br>
-=C2=A0 =C2=A0 With just a truevalue, it can be used to include files that =
are meant to be<br>
-=C2=A0 =C2=A0 used only when requested via DISTRO_FEATURES:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0require ${@ oe.utils.all_distro_features(d, &qu=
ot;foo bar&quot;, &quot;foo-and-bar.inc&quot;)<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 return bb.utils.contains(&quot;DISTRO_FEATURES&quot;, featur=
es, truevalue, falsevalue, d)<br>
-<br>
=C2=A0def any_distro_features(d, features, truevalue=3D&quot;1&quot;, false=
value=3D&quot;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Returns truevalue if at least *one* of the given featur=
es is set in DISTRO_FEATURES,<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#238271): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/238271" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/238271</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119719566/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119719566/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f2dadb0653d311b7--

