Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75477C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 12:35:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.21133.1739968493341124960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 04:34:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BymoNsxJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a39e659cso45707055e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 04:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739968492; x=1740573292; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ixeSa/zXqcaXnuZVXGXjkAhZocNygq2L+ovToFG1JXI=;
        b=BymoNsxJWR1coaZs4L4Ry7CeKgfizRt47QVL73oOfrc9s2Xmtt39fVL2vDqId+rZ2k
         1h8HbsBqp1dvX3cOvZ7MDxIEwJFt7C3tWxAdhYjGPIl/Jyq4TWNRfTX18cBEf6Uax14I
         bGMwWlov5zGH2Y4bphOmWpW7/Xqb8pRgd8NLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968492; x=1740573292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixeSa/zXqcaXnuZVXGXjkAhZocNygq2L+ovToFG1JXI=;
        b=QXsovJou6vFs8hkjyneRnTTqhkCCQOIERQT0CZ520PjqwYYOQ5LUn1U2Vs5moZQL5p
         M9RkLAMbHGYb0wJ9hwC0ZxjvzOsBQgyOFHRk+nYZqnYlgbQoIAN3R3Az7c9Kc3Q4dpCn
         s53xEx5u0VwMVqNRtM0JtgYbsZa2VZteGH9lXcDpiGRH06tndb1hJBf8T7CWMsmTYnE2
         pcy9ZxkCyMzNyZsuUwaBpO3RP9RMn3EEC+D1aY6gDzv8FYagJVNnotRfD0JXa5pYZdaZ
         brx9uXT3y9xuEiekSRwKSKwXURTk9CGJidyQPb5pQvBJmMet0Kw+VU3H9arrcq36rH/u
         0fkw==
X-Gm-Message-State: AOJu0YzHyzr/mFS/F1fH/30/Nw1Ep1ym1PfQnU38O1oKr93Fws3TNyDj
	2+z91BDUSyYDg58xuWVUQMvHAQQ+BaIAbQsg/H292POWk7o0uCjHM9wBnnu8IknI8DxCdc31nZ0
	WQt2K6pBkTkbOcw8Ydae5YuVfaspZg9y/3waVwg==
X-Gm-Gg: ASbGncvyeEc0DgswN/7C62A/JBFEVMPUgZ6Hm9w5xJ2l2yI3pUlknTYLJhMn+B1qj8P
	AF/ggxmeAkK1YsrHrOc9rXmHGqd+r3QPjF26dTkaKqhg3pLSfSIOB6sE4KQgut6+Ttyn3ZvK2gk
	0=
X-Google-Smtp-Source: AGHT+IEszWhU0ij1rmNxhvEdsgoo8hBamCw8gEUrvSaOnwbtDXO6ePsKeckdfW6z/zP9+3ojCZ8ZI3n98V0QCaxgWNY=
X-Received: by 2002:a5d:6c66:0:b0:38d:e3da:8b50 with SMTP id
 ffacd0b85a97d-38f33f4377bmr19751102f8f.39.1739968491590; Wed, 19 Feb 2025
 04:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20250219123102.3288782-2-sofiane.hamam@smile.fr>
In-Reply-To: <20250219123102.3288782-2-sofiane.hamam@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 19 Feb 2025 13:34:25 +0100
X-Gm-Features: AWEUYZlvr4CSR_TzoX-TdgdKJ9e7KalnrrZxQP6gxhxcE7t0let0RL7M4Und9_E
Message-ID: <CAMSfU+7O7H=h4EqbY5rUpkPLgexgOaY_YndbL3cNZi1Z5ZZw_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sanity: Check for non ascii chars in TOPDIR
To: sofiane.hamam@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dcaec8062e7dfb71"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 12:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211704

--000000000000dcaec8062e7dfb71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 19 f=C3=A9vr. 2025 =C3=A0 13:31, Sofiane HAMAM via lists.openembedd=
ed.org
<sofiane.hamam=3Dsmile.fr@lists.openembedded.org> a =C3=A9crit :

> Some modules (like Perl's MakeMaker) do not support non ASCII
> characters in build folder's path, this would cause build failures
> of software that does not support non ASCII.
> A sanity check is added to warn the user.
>
> Fixes [YOCTO #15764]
>
> Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
>

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>


> ---
>  meta/classes-global/sanity.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes-global/sanity.bbclass
> b/meta/classes-global/sanity.bbclass
> index 66693fc9b9..1bae998f74 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -299,6 +299,11 @@ def check_path_length(filepath, pathname, limit):
>          return "The length of %s is longer than %s, this would cause
> unexpected errors, please use a shorter path.\n" % (pathname, limit)
>      return ""
>
> +def check_non_ascii(filepath, pathname):
> +    if(not filepath.isascii()):
> +        return "Non-ASCII character(s) in %s path (\"%s\") detected. Thi=
s
> would cause build failures as we build software that doesn't support
> this.\n" % (pathname, filepath)
> +    return ""
> +
>  def get_filesystem_id(path):
>      import subprocess
>      try:
> @@ -719,6 +724,7 @@ def check_sanity_version_change(status, d):
>      # Check that TMPDIR isn't on a filesystem with limited filename
> length (eg. eCryptFS)
>      import stat
>      tmpdir =3D d.getVar('TMPDIR')
> +    topdir =3D d.getVar('TOPDIR')
>      status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
>      tmpdirmode =3D os.stat(tmpdir).st_mode
>      if (tmpdirmode & stat.S_ISGID):
> @@ -785,6 +791,9 @@ def check_sanity_version_change(status, d):
>      # The length of TMPDIR can't be longer than 400
>      status.addresult(check_path_length(tmpdir, "TMPDIR", 400))
>
> +    # Check that TOPDIR does not contain non ascii chars (perl_5.40.0,
> Perl-native and shadow-native build failures)
> +    status.addresult(check_non_ascii(topdir, "TOPDIR"))
> +
>      # Check that TMPDIR isn't located on nfs
>      status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211703):
> https://lists.openembedded.org/g/openembedded-core/message/211703
> Mute This Topic: https://lists.openembedded.org/mt/111268354/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000dcaec8062e7dfb71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 19=
 f=C3=A9vr. 2025 =C3=A0=C2=A013:31, Sofiane HAMAM via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;sofiane.hamam=3D<a href=
=3D"mailto:smile.fr@lists.openembedded.org">smile.fr@lists.openembedded.org=
</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Some modules (like Perl&#39;s MakeMaker) do not support non AS=
CII<br>
characters in build folder&#39;s path, this would cause build failures<br>
of software that does not support non ASCII.<br>
A sanity check is added to warn the user.<br>
<br>
Fixes [YOCTO #15764]<br>
<br>
Signed-off-by: Sofiane HAMAM &lt;<a href=3D"mailto:sofiane.hamam@smile.fr" =
target=3D"_blank">sofiane.hamam@smile.fr</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smil=
e.fr">yoann.congal@smile.fr</a>&gt;</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta/classes-global/sanity.bbclass | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanit=
y.bbclass<br>
index 66693fc9b9..1bae998f74 100644<br>
--- a/meta/classes-global/sanity.bbclass<br>
+++ b/meta/classes-global/sanity.bbclass<br>
@@ -299,6 +299,11 @@ def check_path_length(filepath, pathname, limit):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;The length of %s is longer t=
han %s, this would cause unexpected errors, please use a shorter path.\n&qu=
ot; % (pathname, limit)<br>
=C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
<br>
+def check_non_ascii(filepath, pathname):<br>
+=C2=A0 =C2=A0 if(not filepath.isascii()):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;Non-ASCII character(s) in %s path=
 (\&quot;%s\&quot;) detected. This would cause build failures as we build s=
oftware that doesn&#39;t support this.\n&quot; % (pathname, filepath)<br>
+=C2=A0 =C2=A0 return &quot;&quot;<br>
+<br>
=C2=A0def get_filesystem_id(path):<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
@@ -719,6 +724,7 @@ def check_sanity_version_change(status, d):<br>
=C2=A0 =C2=A0 =C2=A0# Check that TMPDIR isn&#39;t on a filesystem with limi=
ted filename length (eg. eCryptFS)<br>
=C2=A0 =C2=A0 =C2=A0import stat<br>
=C2=A0 =C2=A0 =C2=A0tmpdir =3D d.getVar(&#39;TMPDIR&#39;)<br>
+=C2=A0 =C2=A0 topdir =3D d.getVar(&#39;TOPDIR&#39;)<br>
=C2=A0 =C2=A0 =C2=A0status.addresult(check_create_long_filename(tmpdir, &qu=
ot;TMPDIR&quot;))<br>
=C2=A0 =C2=A0 =C2=A0tmpdirmode =3D os.stat(tmpdir).st_mode<br>
=C2=A0 =C2=A0 =C2=A0if (tmpdirmode &amp; stat.S_ISGID):<br>
@@ -785,6 +791,9 @@ def check_sanity_version_change(status, d):<br>
=C2=A0 =C2=A0 =C2=A0# The length of TMPDIR can&#39;t be longer than 400<br>
=C2=A0 =C2=A0 =C2=A0status.addresult(check_path_length(tmpdir, &quot;TMPDIR=
&quot;, 400))<br>
<br>
+=C2=A0 =C2=A0 # Check that TOPDIR does not contain non ascii chars (perl_5=
.40.0, Perl-native and shadow-native build failures)<br>
+=C2=A0 =C2=A0 status.addresult(check_non_ascii(topdir, &quot;TOPDIR&quot;)=
)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Check that TMPDIR isn&#39;t located on nfs<br>
=C2=A0 =C2=A0 =C2=A0status.addresult(check_not_nfs(tmpdir, &quot;TMPDIR&quo=
t;))<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211703): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211703" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211703</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111268354/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111268354/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--000000000000dcaec8062e7dfb71--

