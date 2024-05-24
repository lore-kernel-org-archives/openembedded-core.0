Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87486C25B7A
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 16:31:40 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.91.1716568291975409494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 09:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=didI+gCR;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: quaresma.jose@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43fb094da40so7307941cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716568291; x=1717173091; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I5A/rBvd5S/7TY8Pg37uzwdABI8HqbrF5FE5m0sX7LQ=;
        b=didI+gCR1oBg2LalOeqoqDxIsF1aiMMSNzgrl9cMpxncPSlm/aaSjYNAuUBJ4AXV2w
         94JLgVc4APTU8fk/yW3QKdvHrtjKCGMJe2EBR0lzAy94VdyQRHRiAL0K4ERTOL8Xk102
         AfxYo0ZWleo6BUlYBMzA3byA1K0exHbVk1vuiDCczRO9pHa+gjJXkzizMy8Hv+RjtuMz
         XVz6TVgAULEoULdZ5tR9uOuLkulEvTtcN6yAaF07rmZpqf32gJytOnCO73ND0BJljMQJ
         pnV+NWwCA9daP8Obsl2xZmKjp6XaT351HZW+clKX67x10XlcLgFwHlUjTtzfy2StBR4R
         W0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716568291; x=1717173091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5A/rBvd5S/7TY8Pg37uzwdABI8HqbrF5FE5m0sX7LQ=;
        b=pGpEIdaSN6iEsgU2vMMvia4q+y+YzhpoKQHYH78gOseRZIXSmFUTpsqP7SncUUwc9l
         A9OxrQRwxu9rCmyg4sJCd79M5PVP1OeZhhUOT7uIWZozmdYLE6liYZNONTND1PEvRToX
         GTbziCERmGypgdsSwCVK4ikqmYtmuWckdDwb+45jnRjFPjmOWWiCxWmeOMYh33sXffvc
         1Ju0jAWTkx/IVl6ty4tCY1q1kZQoglPcbAYW+tEHIepKDwNJsupgJ9dJJLCiZNwf/vzC
         NMUXzconZGqrP+bSaP+Jp3NNEUjr+QNBzBR2/PGImRFo3TfccPPTeJo+133r+pqrgiDC
         X8QA==
X-Forwarded-Encrypted: i=1; AJvYcCWF/cnZ4KLpTGFklJNhsKGZ1MHpsXlax/gOtRLNVaBhBUaAG+yBVPigKRSWu1a0wHXKYe7ZtMV+nRgEs4Ko+RCLA+NRxIqntQu13LXNN3b7LLuuUO90JSPe
X-Gm-Message-State: AOJu0YysVfZ4g12rwNCJp+5E3uyzoIyN6nXn+22/M9x13C5nWVvk4u02
	iOSRBiRr7JtUkJvb2UdMQSuxHNzHo0KVBw9au8M4crPVWV/+0FkRdLrG+0JYF8H4MLgk+R2B0CW
	BveogjyNxfOdzbUBVG2JIjBu2V8I=
X-Google-Smtp-Source: AGHT+IFlLAToekLgaV3kCP6fS5DZZGad5yPEwjmZcLrJ72vnl6n+9EunTHRhLcbJDD1k8+pzBA+QnRP1VpL9gElZvLo=
X-Received: by 2002:a05:6214:5293:b0:6a9:d5c:73fd with SMTP id
 6a1803df08f44-6ab8f3282famr92872216d6.2.1716568290613; Fri, 24 May 2024
 09:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240524151838.2450718-1-richard.purdie@linuxfoundation.org>
 <CANPvuRk9gEcdqPts-T3tHRS2jZFNiN9+qBQEr_-RY_=h7jzwuQ@mail.gmail.com> <CA+chaQdLP3UD+mSAsZEt8KQ20QT=GXa7Xbiq=FZL6N8fpS47=w@mail.gmail.com>
In-Reply-To: <CA+chaQdLP3UD+mSAsZEt8KQ20QT=GXa7Xbiq=FZL6N8fpS47=w@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 24 May 2024 17:31:19 +0100
Message-ID: <CANPvuRnZUBEGjHHjtUqDZJVGWK=bXau7SLmifuo8Efu-YdcBcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] layer.conf: Add os-release to SIGGEN_EXCLUDERECIPES_ABISAFE
To: Martin Jansa <martin.jansa@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000031e53e061935b37f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 16:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199858

--00000000000031e53e061935b37f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Martin Jansa <martin.jansa@gmail.com> escreveu (sexta, 24/05/2024 =C3=A0(s)
17:22):

> >> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> >> index f2bca0aa5ba..65eb657fd93 100644
> >> --- a/meta/conf/layer.conf
> >> +++ b/meta/conf/layer.conf
> >> @@ -45,6 +45,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> >>    ca-certificates \
> >>    shared-mime-info \
> >>    desktop-file-utils \
> >> +  os-release \
> >
> >
> > Acked-by: Jose Quaresma <jose.quaresma@foundries.io>
> >
> > I've had this on the Linux microPlatform distro for a while now but I
> forgot to submit
> >
> https://github.com/foundriesio/meta-lmp/blob/efe9acade717181a5b9d3c520d90=
aa53049abb27/meta-lmp-base/conf/layer.conf#L37
>
> You can drop few lines from SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS there as well
> :).
>

I can try to see if I still need to have it, this one was to store and
re-use the initramfs on the sstate-cache.
Without that I sometimes need to rebuild the kernel when this would not be
necessary.
All of that was validated on the kirkstone branch.

Anyway, I will take a look.

Thanks for the tip.

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000031e53e061935b37f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; escreveu (sexta, 24/05=
/2024 =C3=A0(s) 17:22):<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">&gt;&gt; diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<b=
r>
&gt;&gt; index f2bca0aa5ba..65eb657fd93 100644<br>
&gt;&gt; --- a/meta/conf/layer.conf<br>
&gt;&gt; +++ b/meta/conf/layer.conf<br>
&gt;&gt; @@ -45,6 +45,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 ca-certificates \<br>
&gt;&gt;=C2=A0 =C2=A0 shared-mime-info \<br>
&gt;&gt;=C2=A0 =C2=A0 desktop-file-utils \<br>
&gt;&gt; +=C2=A0 os-release \<br>
&gt;<br>
&gt;<br>
&gt; Acked-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;<br>
&gt; I&#39;ve had this on the Linux microPlatform distro for a while now bu=
t I forgot to submit<br>
&gt; <a href=3D"https://github.com/foundriesio/meta-lmp/blob/efe9acade71718=
1a5b9d3c520d90aa53049abb27/meta-lmp-base/conf/layer.conf#L37" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/foundriesio/meta-lmp/blob/efe9ac=
ade717181a5b9d3c520d90aa53049abb27/meta-lmp-base/conf/layer.conf#L37</a><br=
>
<br>
You can drop few lines from SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS there as well :=
).<br>
</blockquote></div><br clear=3D"all"><div>I can try to see if I still need =
to have it, this one=C2=A0was to store and re-use the=C2=A0initramfs on the=
 sstate-cache.<br>Without that I sometimes need to rebuild the kernel=C2=A0=
when this would not be necessary.<br>All of that was validated on the kirks=
tone branch.<br><br>Anyway, I will take a look.<br><br>Thanks for the tip.<=
br></div><div><br></div><span class=3D"gmail_signature_prefix">-- </span><b=
r><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Best regards,=
<div><br>Jos=C3=A9 Quaresma</div></div></div></div>

--00000000000031e53e061935b37f--

