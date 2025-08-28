Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADF0C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 11:18:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.18314.1756379881484659127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 04:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ers7vwhf;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c7aa4ce85dso604795f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756379880; x=1756984680; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5f5UYWgjhQJtyAc5utWkK5N6ZBRNJ5CvJBzoXnesc08=;
        b=Ers7vwhfRrV9oz8o8/ai8kUmdl0YvhrUH09kxIYzwL2Spa2uUR3W4lBioTI1l/piVl
         Xg0ZefhQYJZK6m4DgFoPX26Glg6q9pgPAw/C2RdIEnc+R+QuxX9j3V0v/1jXI0k07yxv
         g+ouqln0oUwXQa9fycPxhRJjFJ9BSy71ajYjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756379880; x=1756984680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5f5UYWgjhQJtyAc5utWkK5N6ZBRNJ5CvJBzoXnesc08=;
        b=Q0jlpzY9u73nGtF/dBpfro/v4W0ACln/keJVHD/lPNvz9rQD4+idV7rMEFzVCUTkI6
         SBQJVUUEzvapdoWLoB3Ddz36PTsIqESmX15An9w1T50MxGkw5QHJzkwNTcDx+p99RTtg
         qqpHcFwgcCIX0MFmpI1AWkH8f/51JWp6t4r3AqjhqWxYk1PqJKD2POJGAwXsPwXhPh86
         OrC5GUjTkVs5RP+V/b4htnRMpYoLiIME1jWcC7pzG2FHoo7Tib3XBltxeKPybPdEMLum
         GfVHwNa+g5SY1+haa0OEVgACsvn0P+KQEVff6YJxgepywf+/mdW8c8zQnQUsRwPq6dby
         k3lA==
X-Gm-Message-State: AOJu0YwrwObFuWc4sRSKQ9XnKMF+IrRpOnosIN1Qph1oiJp8wNfTQohe
	8W9gyIMWeS00++soZVS6PGqc8sXllNjIq11y8g4xiioKCFl9UIGGaiJdSPXz90YO+cCR2XWgHzJ
	b3OPF8PbyUlXpSYIetXhlgOzgKA6GG9FkuYiaHEdSyQ==
X-Gm-Gg: ASbGncsKa9rmRAKHI4a32u8LCGcOox/YrezI1eNw1j9Pq2VcnPdppbwfOrqNmxU8+PB
	q3b6Q4PaXehgFBfbglgIRVKZiTHaonsT5UfhryZkQle1zoIpt7hvkghFR+xqt4tAVCpbK2GJ99r
	SkGVPFm0r8JSI3wAZypwcae7J77Sr5ENGyj32omgAMbCE5YTSr3jqMqs1Jn9ZVIpWlekIRwbUbJ
	rKD12bdmq3lkau5y1AU
X-Google-Smtp-Source: AGHT+IGoWvlxp86hPwTm1cS2Kfgos+Ko7QCxFK/wyzfnEYjM5ppkDzJSiLoWI6ETKpsryDfwFz9LecuwOrKoqvE8uMI=
X-Received: by 2002:a05:6000:4283:b0:3ca:3206:292 with SMTP id
 ffacd0b85a97d-3ca3206064fmr10305478f8f.48.1756379879651; Thu, 28 Aug 2025
 04:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250828101857.3947730-1-tgamblin@baylibre.com> <20250828101857.3947730-2-tgamblin@baylibre.com>
In-Reply-To: <20250828101857.3947730-2-tgamblin@baylibre.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 28 Aug 2025 13:17:33 +0200
X-Gm-Features: Ac12FXx4iRs5vaeR1YrOiTBgG6XgGFCG0-4AH7274Dr1VgtdDsP-Q01SPusZbNo
Message-ID: <CAMSfU+4tCg9qeuUO27hfMdjcg7Gh1a=37Nhu9H-RZu7i6u433w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] python3-cython: upgrade 3.1.2 -> 3.1.3
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d15b8c063d6b0e37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222562

--000000000000d15b8c063d6b0e37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 28 ao=C3=BBt 2025 =C3=A0 12:19, Trevor Gamblin via lists.openembedd=
ed.org
<tgamblin=3Dbaylibre.com@lists.openembedded.org> a =C3=A9crit :

> Release notes: https://github.com/cython/cython/releases/tag/3.1.3
>
> Reproducibility OK:
>
> |2025-08-28 06:15:01,526 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> |2025-08-28 06:15:01,526 - oe-selftest - INFO - Ran 1 test in 1173.893s
> |2025-08-28 06:15:01,526 - oe-selftest - INFO - OK
> |2025-08-28 06:15:05,831 - oe-selftest - INFO - RESULTS:
> |2025-08-28 06:15:05,832 - oe-selftest - INFO - RESULTS -
> reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1141.07s=
)
> |2025-08-28 06:15:05,950 - oe-selftest - INFO - SUMMARY:
> |2025-08-28 06:15:05,950 - oe-selftest - INFO - oe-selftest () - Ran 1
> test in 1173.894s
> |2025-08-28 06:15:05,950 - oe-selftest - INFO - oe-selftest - OK - All
> required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=
=3D0)
>

Hello,

FYI, the same upgrade was sent earlier
https://lists.openembedded.org/g/openembedded-core/message/222404


>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../python/{python3-cython_3.1.2.bb =3D> python3-cython_3.1.3.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-cython_3.1.2.bb =3D>
> python3-cython_3.1.3.bb} (93%)
>
> diff --git a/meta/recipes-devtools/python/python3-cython_3.1.2.bb
> b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
> similarity index 93%
> rename from meta/recipes-devtools/python/python3-cython_3.1.2.bb
> rename to meta/recipes-devtools/python/python3-cython_3.1.3.bb
> index 77dbbe8b2c..dcb61a3634 100644
> --- a/meta/recipes-devtools/python/python3-cython_3.1.2.bb
> +++ b/meta/recipes-devtools/python/python3-cython_3.1.3.bb
> @@ -7,7 +7,7 @@ SECTION =3D "devel/python"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D61c3ee8961575861fa86c7e62bc9f69c"
>
> -SRC_URI[sha256sum] =3D
> "6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381"
> +SRC_URI[sha256sum] =3D
> "10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089"
>
>  inherit pypi setuptools3 cython
>
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222555):
> https://lists.openembedded.org/g/openembedded-core/message/222555
> Mute This Topic: https://lists.openembedded.org/mt/114932433/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000d15b8c063d6b0e37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28=
 ao=C3=BBt 2025 =C3=A0=C2=A012:19, Trevor Gamblin via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;tgamblin=3D<a href=3D"m=
ailto:baylibre.com@lists.openembedded.org">baylibre.com@lists.openembedded.=
org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Release notes: <a href=3D"https://github.com/cython/cython/=
releases/tag/3.1.3" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/cython/cython/releases/tag/3.1.3</a><br>
<br>
Reproducibility OK:<br>
<br>
|2025-08-28 06:15:01,526 - oe-selftest - INFO - ---------------------------=
-------------------------------------------<br>
|2025-08-28 06:15:01,526 - oe-selftest - INFO - Ran 1 test in 1173.893s<br>
|2025-08-28 06:15:01,526 - oe-selftest - INFO - OK<br>
|2025-08-28 06:15:05,831 - oe-selftest - INFO - RESULTS:<br>
|2025-08-28 06:15:05,832 - oe-selftest - INFO - RESULTS - reproducible.Repr=
oducibleTests.test_reproducible_builds: PASSED (1141.07s)<br>
|2025-08-28 06:15:05,950 - oe-selftest - INFO - SUMMARY:<br>
|2025-08-28 06:15:05,950 - oe-selftest - INFO - oe-selftest () - Ran 1 test=
 in 1173.894s<br>
|2025-08-28 06:15:05,950 - oe-selftest - INFO - oe-selftest - OK - All requ=
ired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)<br=
></blockquote><div><br></div><div>Hello,</div><div><br></div><div>FYI, the =
same upgrade was sent earlier</div><div><a href=3D"https://lists.openembedd=
ed.org/g/openembedded-core/message/222404">https://lists.openembedded.org/g=
/openembedded-core/message/222404</a></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-cython_3.1.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-cython_3.1.2.bb</a> =3D&gt; <a href=3D"http:=
//python3-cython_3.1.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-cyt=
hon_3.1.3.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-cython=
_3.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.1.2.bb</a>=
 =3D&gt; <a href=3D"http://python3-cython_3.1.3.bb" rel=3D"noreferrer" targ=
et=3D"_blank">python3-cython_3.1.3.bb</a>} (93%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cython_=
3.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.1.2.bb</a> =
b/meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.1.3.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-cython_3.1.3.bb</a><br>
similarity index 93%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-cython_3=
.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.1.2.bb</a><b=
r>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.1=
.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.1.3.bb</a><br>
index 77dbbe8b2c..dcb61a3634 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.1.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.1.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.1.3.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.1.3.bb</a><br>
@@ -7,7 +7,7 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D61c3ee8961575861f=
a86c7e62bc9f69c&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad=
851fa130f63f5331381&quot;<br>
+SRC_URI[sha256sum] =3D &quot;10ee785e42328924b78f75a74f66a813cb956b4a9bc91=
c44816d089d5934c089&quot;<br>
<br>
=C2=A0inherit pypi setuptools3 cython<br>
<br>
-- <br>
2.50.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#222555): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/222555" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/222555</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114932433/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114932433/4316185</a><br>
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
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000d15b8c063d6b0e37--

