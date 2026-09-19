Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A1EC982DE
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 02:11:39 +0000 (UTC)
Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5514.1789783896817574323
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 19:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fs/zd0D1;
 spf=pass (domain: gmail.com, ip: 74.125.229.205, mailfrom: ticotimo@gmail.com)
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso2296688e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 19:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789783895; cv=none;
        d=google.com; s=arc-20260327;
        b=QXC+nSDsdUMVtFMeWLRNBEHvkeDWUt9xvXkVfDdH+UHuBZwv+V+woSKLweaZwQ74Fl
         r/782fmYDhO+PxdqyYMHnoIWKGDIUYuKmpB0nqRaX+smfgqFMy8SpXVVOKB6z0Xuxgi4
         WhOYIetkOa4fit63ZZB/esRNwJW7+/gVTQK2uoddJugkltafpRNl2zbHI8OjKgCTxlqh
         u1Xm85LChVKlNuz6phJI9IEP+xd7G88omfYVUmMvN5Z1G+zdMGx93unBSGEDmYrrfwf2
         DasliFHXK0D9sDqES+U3Y9auqkax25oQmRvO6YMo3j7T7lyilU6Jkj1dDtShHdDyKItz
         1ang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6exyGUWKq1RI9O7cPdQLdYmZrt7yK+8OtKkU9a0zKIE=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=CxA7O0KvCepLfCfNpOn+SEyRKXMcJMeMqvHRu64ZLwdQ1WszoWvtcMRPCTgIVpAQ5j
         TqI075t/wyDhVAAaZO+gf1xU9/r6Z1ulkDPXgZYUy8w4qIzoUHA+B08s0OQZ3tFr89Al
         jUPZTbN+IyfLwfiIQdKgXuw0N1W3A7wyn0LvC7Y3jpHbzhXkJ4dotZ2pMqf+BOGyP7Ql
         Sm4ftbnkxgYYB66xrdIeMhKEKnOObcP7fXK3jMkXiJ6ph81OeRnySHQoo2OWL8Eph16S
         k6r53SZmgoZODuh10jlDH017qdFPhihjEdutkJcgG4dGPGP6vM0Trb+lHtdJMgnM3kRW
         3FUA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789783895; x=1790388695; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6exyGUWKq1RI9O7cPdQLdYmZrt7yK+8OtKkU9a0zKIE=;
        b=Fs/zd0D105v/KaDd88vNeINId4Hq6wLl1m/RBsmyvukgXv2yES0Lv0xOlPZDedjASb
         oNx9s/PhKytMAgCQvgsOeJW3ZFZ6sei4E6Nw7jKFxmHfQysKjdSpAKKKTJXeB9849M1j
         ipYBEMWYyLvsTgbtsjc/mTv/UQbsc3sA474CyUxO/Y20Q7V8NKKCpuE6M97HD9y4ko7c
         12rs3WnAOvULZoiX8T0Oan8JCDUzzF4Q7vKxtfCHvC8oC10EdrHbrNoZ8RzcnJzADafU
         BWdj1gQHYnGquWChqeFgzyCwrF2nAsZ4SfuLQy+4wQ0LyjOSsD8IszuKUrHKIoKMCcek
         j2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789783895; x=1790388695;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6exyGUWKq1RI9O7cPdQLdYmZrt7yK+8OtKkU9a0zKIE=;
        b=BgGPKZxIRyxqffDzy32dfL4Y6m4tpHOvgr6L2SMwWTDePX2Mp6z0wSfHKE2YkmW+Sc
         Z+5mtOEUlblAnEDS1QYcudDFiaemLGKN9fG4rY+C+NgyrB/4u7oVNPZBqiBpcdpzXIsu
         q18Q/tLlLPK/qOOgGAcy26gz2Vr6AAlKwPobPIx3V130vDjcI0+Q+MmeMtnKcjaRE+FI
         x5imx8yV1muK4n8aj98bHBN2SIlZEU4RQDoVTqvR6cQm0rh2armkYxo1ZcCSDUwke9k1
         GnG6ex0dOnK4RO2ehJ+3bkeMXtkBg4YCDFYl0ISQZ0cvUzpK55ZpxgzAMkbfT+jDogiR
         HkuA==
X-Gm-Message-State: AFuF++lpdVm6A5K0uNjduLocm3ya5oERRsvc1bBl+8+u3kAmZ6TGA27k
	Jr1ueEXAAaUT36pwyKQLt+98yPKHY0eo6XD2SCMCjNx9mUsEzRiKCsFQfO+e65pyG355r0oPYme
	RSYTaUfyWSp3m6Aahyq9/Hvae0GKv/ZY=
X-Gm-Gg: AYBFou2Xw2hzaoU5Pcr1MZS6PrJeYad6lKIEGN9vjTOh+DHRTEAwxMaBSmxvv6LdhtJ
	rHomvMchEhinSRlxz1gwMO7hq899JfOA4k0KFax7WL+UHxYe7b65MGP5litRsdrz34X0DjhsIX8
	FA0ILH6lK5b4/l4pAGRxuaTwmnioOibYhDdFSU0mSq5nEowTYjpkJEX7DRaW7GXnHS+xBejJCHe
	KfmjtOWPECdkmcOvrUIEyd6y3v/TfnFQp2FeiVPHkZqlP9dojmAPcMTwQBgO+3aj2NbPumk13wC
	flfygqEygJGMyXB6jSDzKAJvls+5gt1qPpHsSiBNQgv66qeZUUxEnpcyBh0xyUg4kb2zVbtCiX9
	eqwlhGl4mpbuJ
X-Received: by 2002:a05:6512:3f26:b0:5b6:183c:5c8c with SMTP id
 2adb3069b0e04-5b8c1846e3dmr1468870e87.42.1789783894305; Fri, 18 Sep 2026
 19:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-1-jaipaul.cheernam@est.tech> <20260917212435.93696-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260917212435.93696-2-jaipaul.cheernam@est.tech>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 18 Sep 2026 19:11:22 -0700
X-Gm-Features: AcwNN1UsUJIgjVFO-1j8PcD3slWDyRBuWogchCqAxTzKqUECkzAQQKw6YcJPaiU
Message-ID: <CANx9H-BBO4DTKQEzfRECyUQ_4R5tVCQ6CEB6SLSAtn3nXG3uQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] gnomebase: fix gnome_verdir for
 four-component versions
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003eadd0065bcc89ff"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 02:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246227

--0000000000003eadd0065bcc89ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This also fixes the upgrade to at-spi2-core 2.62.0.1

On Thu, Sep 17, 2026 at 2:24=E2=80=AFPM Jaipaul Cheernam via lists.openembe=
dded.org
<jaipaul.cheernam=3Dest.tech@lists.openembedded.org> wrote:

> gnome_verdir() stripped the last version component, so four-component
> versions broke: libsecret 0.21.8.2 resolved to 0.21.8/ instead of 0.21/,
> causing a fetch 404. Use the first two components instead, which is
> unchanged for existing recipes.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
> Changes since v1: shorten commit message and code comment; no functional
> change.
>
>  meta/classes-recipe/gnomebase.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/gnomebase.bbclass
> b/meta/classes-recipe/gnomebase.bbclass
> index 57933dda71a..9715e90f165 100644
> --- a/meta/classes-recipe/gnomebase.bbclass
> +++ b/meta/classes-recipe/gnomebase.bbclass
> @@ -5,7 +5,9 @@
>  #
>
>  def gnome_verdir(v):
> -    return ".".join(v.split(".")[:-1]) or v
> +    # GNOME dirs use the first two version components, e.g. 0.21.8.2 ->
> 0.21
> +    parts =3D v.split(".")
> +    return ".".join(parts[:2] if len(parts) >=3D 3 else parts[:-1]) or v
>
>
>  GNOME_COMPRESS_TYPE ?=3D "xz"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246093):
> https://lists.openembedded.org/g/openembedded-core/message/246093
> Mute This Topic: https://lists.openembedded.org/mt/121304875/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003eadd0065bcc89ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This also fixes the upgrade to at-spi2-core 2.62.0.1</div=
><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, Sep 17, 2026 at 2:24=E2=80=AFPM Jaipaul Cheer=
nam via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;jaipaul.cheernam=3D<a href=3D"mailto:est.tech@lists.openembedded.org"=
>est.tech@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">gnome_verdir() stripped the last version c=
omponent, so four-component<br>
versions broke: libsecret 0.21.8.2 resolved to 0.21.8/ instead of 0.21/,<br=
>
causing a fetch 404. Use the first two components instead, which is<br>
unchanged for existing recipes.<br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
Changes since v1: shorten commit message and code comment; no functional ch=
ange.<br>
<br>
=C2=A0meta/classes-recipe/gnomebase.bbclass | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/gnomebase.bbclass b/meta/classes-recipe/gn=
omebase.bbclass<br>
index 57933dda71a..9715e90f165 100644<br>
--- a/meta/classes-recipe/gnomebase.bbclass<br>
+++ b/meta/classes-recipe/gnomebase.bbclass<br>
@@ -5,7 +5,9 @@<br>
=C2=A0#<br>
<br>
=C2=A0def gnome_verdir(v):<br>
-=C2=A0 =C2=A0 return &quot;.&quot;.join(v.split(&quot;.&quot;)[:-1]) or v<=
br>
+=C2=A0 =C2=A0 # GNOME dirs use the first two version components, e.g. 0.21=
.8.2 -&gt; 0.21<br>
+=C2=A0 =C2=A0 parts =3D v.split(&quot;.&quot;)<br>
+=C2=A0 =C2=A0 return &quot;.&quot;.join(parts[:2] if len(parts) &gt;=3D 3 =
else parts[:-1]) or v<br>
<br>
<br>
=C2=A0GNOME_COMPRESS_TYPE ?=3D &quot;xz&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#246093): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/246093" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/246093</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121304875/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/121304875/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003eadd0065bcc89ff--

