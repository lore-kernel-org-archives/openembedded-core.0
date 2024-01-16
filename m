Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D369FC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 22:31:27 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.32805.1705444286037477514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 14:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kfPFIYIC;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5ff59e0dd71so10142877b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 14:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705444284; x=1706049084; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n8A8Ho/2OpWdrEo0HI+QEDU5wGGSlD3tCmcWgO1AKDs=;
        b=kfPFIYIC4U+la5Eqj4WDIE6aXlgmeybwvPVpG8bEg+laAS7uhNTHsbevTTCNph3dK2
         goYtr9dlAZ3IoDnFR5dovhu/ugez3OsSToYS7Pa7/+B3Agi2NtGKjrlo/P1gjdt5rwEh
         cGSjXJ5cz7rIAYya+d8QUyiRkJARKH5O9tAwVPkdP78xVUIsGJJzqE/hTkoKCrlpiur1
         3Iyg9cBJePzBLiHFowxuA289TVlRkwbeI4+Lg4AuSdCLp7hmmAyooA7J8Lp2LmOYcXai
         iTuqT2/MTDUMpSiTYQaEBQFUqnfy0WnUQ08tXt+9Rh5pRzaXuEwdm0Non0VNiQlSxkAI
         uTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705444284; x=1706049084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8A8Ho/2OpWdrEo0HI+QEDU5wGGSlD3tCmcWgO1AKDs=;
        b=tWrcfH1MWF4iEqZnjhewgHdR5TZ3om+dUyiduo+qbY+hxscV8U7YzVqYIbmm3QsZns
         wZz8pz8ZqiILKZYQMakGG99ERGCV/CMhz5NoHy0v9Ch6GZZRS/Czuq4bY07mavYhIlJu
         8VfiSJi8si9SZXa5Cz6ef/E76w6dwxJIWI3e6sEdCoDw1pI5YZs4OXWcP6asQO7IvukZ
         +uz2rE2WvPvCNHq0Fump4V9+3zuzEjr2T3kh5PGyUoj1kbY+EHU8Cnr6hiDi/17lHnH0
         QqNhjFffQBuK7PuZKrdZV/C5OUmsZXQyHF6rWZh/wqApBlo4JpWdKaQVVzQUOFnbBMdy
         VBVw==
X-Gm-Message-State: AOJu0Yx6Z4StoWJY8ycjtYEqTdqd04xmCfLSTZag3vI3BlIyD4H72QqF
	VElMhAWMmvQYCN8x6jjkn3jejnins8/xTO7969s=
X-Google-Smtp-Source: AGHT+IEwYAaFPHo2SxaK/jUJrnltZeboi1sen2PuABFvI+w/PlyEs7GKI4Jko7fIkJA8HTlcJUrsk0+j7RUN3sVdWDM=
X-Received: by 2002:a81:ed0f:0:b0:5fa:ee58:1dc9 with SMTP id
 k15-20020a81ed0f000000b005faee581dc9mr5577841ywm.76.1705444283798; Tue, 16
 Jan 2024 14:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20240116165602.2053194-1-William.Lyu@windriver.com>
 <20240116165602.2053194-2-William.Lyu@windriver.com> <CANNYZj_OVth=cfNE_+VY4gb27hNcx45VagwZf1J_eEUEm0Ltvg@mail.gmail.com>
 <17AAE8D9425F667A.7072@lists.openembedded.org>
In-Reply-To: <17AAE8D9425F667A.7072@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 16 Jan 2024 14:31:12 -0800
Message-ID: <CANx9H-B8L7Lb+EozOWr5Y_SyFiZkM1xiFjyOmYroXexvnAKing@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] openssl: Fix ptest dependencies on
 perl-module-* being ignored by COMPLEMENTARY_GLOB
To: ticotimo@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	william.lyu@windriver.com
Content-Type: multipart/mixed; boundary="000000000000b86ad2060f17b044"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 22:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193877

--000000000000b86ad2060f17b044
Content-Type: multipart/alternative; boundary="000000000000b86ad1060f17b042"

--000000000000b86ad1060f17b042
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 10:57=E2=80=AFAM Tim Orling via lists.openembedded.=
org
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Tue, Jan 16, 2024 at 9:21=E2=80=AFAM Alexander Kanavin <alex.kanavin@g=
mail.com>
> wrote:
>
>> How about simple depending on specific module packages? I don=E2=80=99t =
think
>> OpenSSL truly needs all modules.
>>
>
> Agreed. I don=E2=80=99t see a compelling reason to add the perl-modules-f=
orce-all
> complication. This will add confusion in my opinion.
>
> Iterate the tests and add the required perl-module-* sub-packages one by
> one (or by inspection if the test cases)
>
> In almost all cases, RDEPENDS on perl-modules is a short cut and should b=
e
> avoided in favor of being explicit.
>
> This inspired me to sweep the dust off of
https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/perl-deps_13376

This detects (but doesn't yet know how to properly handle) the RDEPENDS for
openssl-ptest. See attached snippet of the log.

It is too greedy so some dependencies are not going to be needed.



>> Alex
>>
>> On Tue 16. Jan 2024 at 17.56, Lyu, William via lists.openembedded.org
>> <william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>>> From: William Lyu <William.Lyu@windriver.com>
>>>
>>> Change the openssl-ptest RDEPENDS from perl-modules to
>>> perl-modules-force-all which RDEPENDS on the same set of packages
>>> perl-module-* recommended by perl-modules. So, when openssl-ptest is
>>> added via COMPLEMENTARY_GLOB "ptest-pkgs", its dependencies on these
>>> perl-module-* packages still get added.
>>>
>>> Signed-off-by: William Lyu <William.Lyu@windriver.com>
>>> ---
>>>  meta/recipes-connectivity/openssl/openssl_3.2.0.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>>> b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>>> index d041d2d214..7076bd3a7b 100644
>>> --- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>>> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
>>> @@ -247,7 +247,7 @@ CONFFILES:openssl-conf =3D
>>> "${sysconfdir}/ssl/openssl.cnf"
>>>
>>>  RRECOMMENDS:libcrypto +=3D "openssl-conf ${PN}-ossl-module-legacy"
>>>  RDEPENDS:${PN}-misc =3D "perl"
>>> -RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed"
>>> +RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules-force-all bas=
h
>>> sed"
>>>
>>>  RDEPENDS:${PN}-bin +=3D "openssl-conf"
>>>
>>> --
>>> 2.43.0
>>>
>>>
>>>
>>>
>>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193872):
> https://lists.openembedded.org/g/openembedded-core/message/193872
> Mute This Topic: https://lists.openembedded.org/mt/103766390/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b86ad1060f17b042
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 16, 2024 at 10:57=E2=80=
=AFAM Tim Orling via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div><br></div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 16, 2024=
 at 9:21=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">How abou=
t simple depending on specific module packages? I don=E2=80=99t think OpenS=
SL truly needs all modules.</div><div dir=3D"auto"></div></blockquote><div =
dir=3D"auto"><br></div><div dir=3D"auto">Agreed. I don=E2=80=99t see a comp=
elling reason to add the perl-modules-force-all complication. This will add=
 confusion in my opinion.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Iterate the tests and add the required perl-module-* sub-packages one by =
one (or by inspection if the test cases)</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">In almost all cases, RDEPENDS on perl-modules is a short c=
ut and should be avoided in favor of being explicit.</div><div dir=3D"auto"=
><br></div></div></div></blockquote><div>This inspired me to sweep the dust=
 off of=C2=A0=C2=A0<a href=3D"https://git.yoctoproject.org/poky-contrib/log=
/?h=3Dtimo/perl-deps_13376">https://git.yoctoproject.org/poky-contrib/log/?=
h=3Dtimo/perl-deps_13376</a></div><div><br></div><div>This detects (but doe=
sn&#39;t yet know how to properly handle) the RDEPENDS for openssl-ptest. S=
ee attached snippet of the log.</div><div><br></div><div>It is too greedy s=
o some dependencies are not going to be needed.</div><div><br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=
=3D"gmail_quote"><div dir=3D"auto"></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue 16. Jan 2024 at 17.56, Lyu, William via <a href=3D"http://lists.openembe=
dded.org" target=3D"_blank">lists.openembedded.org</a> &lt;william.lyu=3D<a=
 href=3D"mailto:windriver.com@lists.openembedded.org" target=3D"_blank">win=
driver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: William Lyu &lt;<a href=3D"mailto:Wi=
lliam.Lyu@windriver.com" target=3D"_blank">William.Lyu@windriver.com</a>&gt=
;<br>
<br>
Change the openssl-ptest RDEPENDS from perl-modules to<br>
perl-modules-force-all which RDEPENDS on the same set of packages<br>
perl-module-* recommended by perl-modules. So, when openssl-ptest is<br>
added via COMPLEMENTARY_GLOB &quot;ptest-pkgs&quot;, its dependencies on th=
ese<br>
perl-module-* packages still get added.<br>
<br>
Signed-off-by: William Lyu &lt;<a href=3D"mailto:William.Lyu@windriver.com"=
 target=3D"_blank">William.Lyu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a> b/meta/re=
cipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb" rel=3D"noref=
errer" target=3D"_blank">openssl_3.2.0.bb</a><br>
index d041d2d214..7076bd3a7b 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a><br>
@@ -247,7 +247,7 @@ CONFFILES:openssl-conf =3D &quot;${sysconfdir}/ssl/open=
ssl.cnf&quot;<br>
<br>
=C2=A0RRECOMMENDS:libcrypto +=3D &quot;openssl-conf ${PN}-ossl-module-legac=
y&quot;<br>
=C2=A0RDEPENDS:${PN}-misc =3D &quot;perl&quot;<br>
-RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl perl-modules bash sed&quo=
t;<br>
+RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl perl-modules-force-all ba=
sh sed&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-bin +=3D &quot;openssl-conf&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193872): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193872" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193872</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103766390/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103766390/924729</a><br>
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

--000000000000b86ad1060f17b042--

--000000000000b86ad2060f17b044
Content-Type: text/x-log; charset="US-ASCII"; name="openssl-perldeps.log"
Content-Disposition: attachment; filename="openssl-perldeps.log"
Content-Transfer-Encoding: base64
Content-ID: <f_lrgxfwf90>
X-Attachment-Id: f_lrgxfwf90

REVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6IGxlbih1bnJlc29sdmVkX3JkZXBz
W29wZW5zc2wtcHRlc3RdKSA9IDgyCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3BlcmxkZXBz
OiB1bnJlc29sdmVkX3JkZXBzW29wZW5zc2wtcHRlc3RdOgpERUJVRzogb3BlbnNzbC0zLjIuMC1y
MCBkb19wZXJsZGVwczogCXBlcmwoVExTUHJveHk6OlNlcnZlckhlbGxvKQpERUJVRzogb3BlbnNz
bC0zLjIuMC1yMCBkb19wZXJsZGVwczogCXBlcmwoT3BlblNTTDo6VXRpbCkKREVCVUc6IG9wZW5z
c2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6IAlwZXJsKEVycm5vKQpERUJVRzogb3BlbnNzbC0zLjIu
MC1yMCBkb19wZXJsZGVwczogCXBlcmwoR2V0b3B0OjpTdGQpCkRFQlVHOiBvcGVuc3NsLTMuMi4w
LXIwIGRvX3BlcmxkZXBzOiAJcGVybCA+PSAwOjUuMDA4CkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIw
IGRvX3BlcmxkZXBzOiAJcGVybChwYXJlbnQpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3Bl
cmxkZXBzOiAJcGVybChGaW5kQmluKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVw
czogCXBlcmwocGxhdGZvcm06Om1pbmd3KQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJs
ZGVwczogCXBlcmwoTGlzdDo6VXRpbCkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRl
cHM6IAlwZXJsKHdhcm5pbmdzKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVwczog
CXBlcmwoRmlsZTo6QmFzZW5hbWUpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3BlcmxkZXBz
OiAJcGVybChJTzo6U29ja2V0KQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVwczog
CXBlcmwoT3BlblNTTDo6R2xvYikKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6
IAlwZXJsKFRpbWU6OkxvY2FsKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVwczog
CXBlcmwgPj0gMTo1LjEwLjAKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6IAlw
ZXJsKE9wZW5TU0w6OlRlbXBsYXRlKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVw
czogCXBlcmwoVGVzdDo6UG9kKSA+PSAxLjQxCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3Bl
cmxkZXBzOiAJcGVybChUTFNQcm94eTo6TmV3U2Vzc2lvblRpY2tldCkKREVCVUc6IG9wZW5zc2wt
My4yLjAtcjAgZG9fcGVybGRlcHM6IAlwZXJsKEZpbGU6Okdsb2IpCkRFQlVHOiBvcGVuc3NsLTMu
Mi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVybChDYXJwKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBk
b19wZXJsZGVwczogCXBlcmwoVGV4dDo6RGlmZikKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9f
cGVybGRlcHM6IAlwZXJsKFRleHQ6OlRlbXBsYXRlKSA+PSAxLjQ2CkRFQlVHOiBvcGVuc3NsLTMu
Mi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVybChPcGVuU1NMOjpUZXN0OjpTaW1wbGUpCkRFQlVHOiBv
cGVuc3NsLTMuMi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVybChQb2Q6Okh0bWwpCkRFQlVHOiBvcGVu
c3NsLTMuMi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVybChHZXRvcHQ6OkxvbmcpCkRFQlVHOiBvcGVu
c3NsLTMuMi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVybChGaWxlOjpQYXRoKSA+PSAyLjAwCkRFQlVH
OiBvcGVuc3NsLTMuMi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVybChzc2x0ZXN0c19iYXNlKQpERUJV
Rzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVwczogCXBlcmwoVExTUHJveHk6OkNlcnRpZmlj
YXRlUmVxdWVzdCkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6IAlwZXJsKHBs
YXRmb3JtOjpCQVNFKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVwczogCXBlcmwo
VExTUHJveHk6OkFsZXJ0KQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVwczogCXBl
cmwoT3BlblNTTDo6VGVzdCkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6IAlw
ZXJsKFRlc3Q6Ok1vcmUpID49IDAuOTYKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRl
cHM6IAlwZXJsKFRMU1Byb3h5OjpTZXJ2ZXJLZXlFeGNoYW5nZSkKREVCVUc6IG9wZW5zc2wtMy4y
LjAtcjAgZG9fcGVybGRlcHM6IAlwZXJsKHBsYXRmb3JtKQpERUJVRzogb3BlbnNzbC0zLjIuMC1y
MCBkb19wZXJsZGVwczogCXBlcmwoQ29uZmlnKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19w
ZXJsZGVwczogCXBlcmwoRmlsZTo6VGVtcCkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVy
bGRlcHM6IAlwZXJsKHBsYXRmb3JtOjpXaW5kb3dzKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBk
b19wZXJsZGVwczogCXBlcmwoRGF0YTo6RHVtcGVyKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBk
b19wZXJsZGVwczogCXBlcmwoT3BlblNTTDo6ZmFsbGJhY2spCkRFQlVHOiBvcGVuc3NsLTMuMi4w
LXIwIGRvX3BlcmxkZXBzOiAJcGVybChPcGVuU1NMOjpPcmRpbmFscykKREVCVUc6IG9wZW5zc2wt
My4yLjAtcjAgZG9fcGVybGRlcHM6IAlwZXJsKE1hdGg6OkJpZ0ludCkKREVCVUc6IG9wZW5zc2wt
My4yLjAtcjAgZG9fcGVybGRlcHM6IAlwZXJsKFBvZDo6VXNhZ2UpCkRFQlVHOiBvcGVuc3NsLTMu
Mi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVybChFbmNvZGUpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIw
IGRvX3BlcmxkZXBzOiAJcGVybChDd2QpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3Blcmxk
ZXBzOiAJcGVybChzdHJpY3QpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3BlcmxkZXBzOiAJ
cGVybChwbGF0Zm9ybTo6V2luZG93czo6TVNWQykKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9f
cGVybGRlcHM6IAlwZXJsKHBsYXRmb3JtOjpVbml4KQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBk
b19wZXJsZGVwczogCXBlcmwodXRmOCkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRl
cHM6IAlwZXJsKEV4cG9ydGVyKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVwczog
CXBlcmwoVExTUHJveHk6OkVuY3J5cHRlZEV4dGVuc2lvbnMpCkRFQlVHOiBvcGVuc3NsLTMuMi4w
LXIwIGRvX3BlcmxkZXBzOiAJcGVybChjb25zdGFudCkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAg
ZG9fcGVybGRlcHM6IAlwZXJsKEZjbnRsKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJs
ZGVwczogCXBlcmwoYmFzZSkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6IAlw
ZXJsKEZpbGU6OkNvcHkpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVy
bChQT1NJWCkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6IAlwZXJsKGNoZWNr
aGFuZHNoYWtlKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVwczogCXBlcmwoVExT
UHJveHk6Ok1lc3NhZ2UpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVy
bChTdG9yYWJsZSkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6IAlwZXJsKE9w
ZW5TU0w6OkNvbmZpZzo6UXVlcnkpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3BlcmxkZXBz
OiAJcGVybChUTFNQcm94eTo6Q2VydGlmaWNhdGVWZXJpZnkpCkRFQlVHOiBvcGVuc3NsLTMuMi4w
LXIwIGRvX3BlcmxkZXBzOiAJcGVybCh2YXJzKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19w
ZXJsZGVwczogCXBlcmwoRmlsZTo6Q29tcGFyZSkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9f
cGVybGRlcHM6IAlwZXJsKGNvbmZpZ2RhdGEpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3Bl
cmxkZXBzOiAJcGVybChJUEM6Ok9wZW4yKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJs
ZGVwczogCXBlcmwoRmlsZUhhbmRsZSkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRl
cHM6IAlwZXJsKFNjYWxhcjo6VXRpbCkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRl
cHM6IAlwZXJsKE9wZW5TU0w6OlRlc3Q6OlV0aWxzKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBk
b19wZXJsZGVwczogCXBlcmwoTUlNRTo6QmFzZTY0KQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBk
b19wZXJsZGVwczogCXBlcmwoVExTUHJveHk6OkNlcnRpZmljYXRlKQpERUJVRzogb3BlbnNzbC0z
LjIuMC1yMCBkb19wZXJsZGVwczogCXBlcmwoZ2VudGVtcGxhdGUpCkRFQlVHOiBvcGVuc3NsLTMu
Mi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVybChsaWIpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRv
X3BlcmxkZXBzOiAJcGVybChEaWdlc3Q6OlNIQSkKREVCVUc6IG9wZW5zc2wtMy4yLjAtcjAgZG9f
cGVybGRlcHM6IAlwZXJsKElPOjpTZWxlY3QpCkRFQlVHOiBvcGVuc3NsLTMuMi4wLXIwIGRvX3Bl
cmxkZXBzOiAJcGVybChmZWF0dXJlKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBkb19wZXJsZGVw
czogCXBlcmwoRmlsZTo6U3BlYzo6RnVuY3Rpb25zKQpERUJVRzogb3BlbnNzbC0zLjIuMC1yMCBk
b19wZXJsZGVwczogCXBlcmwoVExTUHJveHk6OlByb3h5KQpERUJVRzogb3BlbnNzbC0zLjIuMC1y
MCBkb19wZXJsZGVwczogCXBlcmwoVGVzdDo6SGFybmVzcykKREVCVUc6IG9wZW5zc2wtMy4yLjAt
cjAgZG9fcGVybGRlcHM6IAlwZXJsKFRMU1Byb3h5OjpSZWNvcmQpCkRFQlVHOiBvcGVuc3NsLTMu
Mi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVybChPcGVuU1NMOjpQYXJzZUMpCkRFQlVHOiBvcGVuc3Ns
LTMuMi4wLXIwIGRvX3BlcmxkZXBzOiAJcGVybChJUEM6OkNtZCkKREVCVUc6IG9wZW5zc2wtMy4y
LjAtcjAgZG9fcGVybGRlcHM6IAlwZXJsKFRMU1Byb3h5OjpDbGllbnRIZWxsbykKREVCVUc6IG9w
ZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6IAlwZXJsKEZpbGU6OlNwZWMpCldBUk5JTkc6IG9w
ZW5zc2wtMy4yLjAtcjAgZG9fcGVybGRlcHM6IFtvcGVuc3NsLXB0ZXN0XSBQb3NzaWJsZSBtaXNz
aW5nIHJ1bnRpbWUgZGVwZW5kZW5jaWVzIGRldGVjdGVkLCBidXQgdGhleSBjb3VsZCBub3QgYmUg
cmVzb2x2ZWQgInBlcmwoVExTUHJveHk6OlNlcnZlckhlbGxvKSBwZXJsKE9wZW5TU0w6OlV0aWwp
IHBlcmwoRXJybm8pIHBlcmwoR2V0b3B0OjpTdGQpIHBlcmwgPj0gMDo1LjAwOCBwZXJsKHBhcmVu
dCkgcGVybChGaW5kQmluKSBwZXJsKHBsYXRmb3JtOjptaW5ndykgcGVybChMaXN0OjpVdGlsKSBw
ZXJsKHdhcm5pbmdzKSBwZXJsKEZpbGU6OkJhc2VuYW1lKSBwZXJsKElPOjpTb2NrZXQpIHBlcmwo
T3BlblNTTDo6R2xvYikgcGVybChUaW1lOjpMb2NhbCkgcGVybCA+PSAxOjUuMTAuMCBwZXJsKE9w
ZW5TU0w6OlRlbXBsYXRlKSBwZXJsKFRlc3Q6OlBvZCkgPj0gMS40MSBwZXJsKFRMU1Byb3h5OjpO
ZXdTZXNzaW9uVGlja2V0KSBwZXJsKEZpbGU6Okdsb2IpIHBlcmwoQ2FycCkgcGVybChUZXh0OjpE
aWZmKSBwZXJsKFRleHQ6OlRlbXBsYXRlKSA+PSAxLjQ2IHBlcmwoT3BlblNTTDo6VGVzdDo6U2lt
cGxlKSBwZXJsKFBvZDo6SHRtbCkgcGVybChHZXRvcHQ6OkxvbmcpIHBlcmwoRmlsZTo6UGF0aCkg
Pj0gMi4wMCBwZXJsKHNzbHRlc3RzX2Jhc2UpIHBlcmwoVExTUHJveHk6OkNlcnRpZmljYXRlUmVx
dWVzdCkgcGVybChwbGF0Zm9ybTo6QkFTRSkgcGVybChUTFNQcm94eTo6QWxlcnQpIHBlcmwoT3Bl
blNTTDo6VGVzdCkgcGVybChUZXN0OjpNb3JlKSA+PSAwLjk2IHBlcmwoVExTUHJveHk6OlNlcnZl
cktleUV4Y2hhbmdlKSBwZXJsKHBsYXRmb3JtKSBwZXJsKENvbmZpZykgcGVybChGaWxlOjpUZW1w
KSBwZXJsKHBsYXRmb3JtOjpXaW5kb3dzKSBwZXJsKERhdGE6OkR1bXBlcikgcGVybChPcGVuU1NM
OjpmYWxsYmFjaykgcGVybChPcGVuU1NMOjpPcmRpbmFscykgcGVybChNYXRoOjpCaWdJbnQpIHBl
cmwoUG9kOjpVc2FnZSkgcGVybChFbmNvZGUpIHBlcmwoQ3dkKSBwZXJsKHN0cmljdCkgcGVybChw
bGF0Zm9ybTo6V2luZG93czo6TVNWQykgcGVybChwbGF0Zm9ybTo6VW5peCkgcGVybCh1dGY4KSBw
ZXJsKEV4cG9ydGVyKSBwZXJsKFRMU1Byb3h5OjpFbmNyeXB0ZWRFeHRlbnNpb25zKSBwZXJsKGNv
bnN0YW50KSBwZXJsKEZjbnRsKSBwZXJsKGJhc2UpIHBlcmwoRmlsZTo6Q29weSkgcGVybChQT1NJ
WCkgcGVybChjaGVja2hhbmRzaGFrZSkgcGVybChUTFNQcm94eTo6TWVzc2FnZSkgcGVybChTdG9y
YWJsZSkgcGVybChPcGVuU1NMOjpDb25maWc6OlF1ZXJ5KSBwZXJsKFRMU1Byb3h5OjpDZXJ0aWZp
Y2F0ZVZlcmlmeSkgcGVybCh2YXJzKSBwZXJsKEZpbGU6OkNvbXBhcmUpIHBlcmwoY29uZmlnZGF0
YSkgcGVybChJUEM6Ok9wZW4yKSBwZXJsKEZpbGVIYW5kbGUpIHBlcmwoU2NhbGFyOjpVdGlsKSBw
ZXJsKE9wZW5TU0w6OlRlc3Q6OlV0aWxzKSBwZXJsKE1JTUU6OkJhc2U2NCkgcGVybChUTFNQcm94
eTo6Q2VydGlmaWNhdGUpIHBlcmwoZ2VudGVtcGxhdGUpIHBlcmwobGliKSBwZXJsKERpZ2VzdDo6
U0hBKSBwZXJsKElPOjpTZWxlY3QpIHBlcmwoZmVhdHVyZSkgcGVybChGaWxlOjpTcGVjOjpGdW5j
dGlvbnMpIHBlcmwoVExTUHJveHk6OlByb3h5KSBwZXJsKFRlc3Q6Okhhcm5lc3MpIHBlcmwoVExT
UHJveHk6OlJlY29yZCkgcGVybChPcGVuU1NMOjpQYXJzZUMpIHBlcmwoSVBDOjpDbWQpIHBlcmwo
VExTUHJveHk6OkNsaWVudEhlbGxvKSBwZXJsKEZpbGU6OlNwZWMpIgo=
--000000000000b86ad2060f17b044--

