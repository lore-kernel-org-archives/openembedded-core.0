Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF7FCA0EDF
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 13:54:34 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.75389.1755006870008097974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 06:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PTkWwakv;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8da9b7386dso5431456276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 06:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755006869; x=1755611669; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mYSDKxWeBnrU4v2NwEP5RxdwwOXOA+YOl3le6eqTt1s=;
        b=PTkWwakvA8Kzhqm0C399srfu2tmIMqex3qSOT0Ys82k6rWVJAAX/Ahg9XeThAedfTO
         zZv2kceIEpPnC6GA+63lIdE5cXzB2FCoU6tgoSDlsv7Y9laBzn6M9zL/e8lIRct3zHiB
         itD8a08R5pb5WG6FU/HkyoNvyrBUjS+2oZMAoLuozuP7j9wV/DhnD1a5ibgR1GG5vjlG
         ylWLoqCWkvsXw4M+0FWhbYA1mliCJ4bgezaHV/tiCVDbgHV9SYH29OHXlKCDCmi5s5se
         eqAwYbDjHSXt+GZBQhW2IphIDwaeqiT+tVbaPIikh0Smn2Qko/FMubnoa7QV/S71aDqb
         3HEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755006869; x=1755611669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYSDKxWeBnrU4v2NwEP5RxdwwOXOA+YOl3le6eqTt1s=;
        b=F6U3+mwgFwQLuhxckBfT/138QFXUi4RzWRL1tc5Nn2JFuxSWs28uwHANJWHZ/qRmNH
         W6MOncoiBU5imI05e0AO3bnL7hwOKyfoHOy2lVGgKhIDXzSSG7XDwKDxFn15Zotda1ZL
         qi1kwCT2LK0vs2HSwzWLXqgpjlSG7z9LfjIr1Ubqj1sMIECKO1ujRJSJ7hVv2DiU6nN3
         Qv8zuZ+m7/iD6sekIcmym7NKmyoTJBiX8a3vJ8ngv5qjMKEEy630nV7S7PXqlBQdhGTS
         R63yzMu+hDouQ9gARP/YT+kbufwwa5vSY+Ess5w3+GWOrp/wip2sz5UDz4LvJIeIJGfM
         o5sw==
X-Gm-Message-State: AOJu0YzFXjowTDSEwlPocRW6bntaeohtri6CnSngNshaGtxzbK5+jMn7
	RhVk45DvN+tkMCxnEkgTa35DHuAjlXuXEwJPRcKKKa2qm628VI53DdJyL07RNlHSX6ZEPJDQPMa
	alWJMAsyb2E5aZYnSp0zwtZYitTCWLZU=
X-Gm-Gg: ASbGnctBtHQ+KLD6f83DhHtbv26fUzAyu3U3EKh6S+IwXq+EhB/fnFNRq0pPhzFlFi7
	xJDeNTZBaw7zBa/kdpfaTWWR1qpDsfaid1lYntvp0Oy8DfFkgJUYQP/qu4DBEAP5MxEFDpLbker
	ZYGKynDCQSrxq1wVmCkl3OroHdnsbpDEIgZLnbkZ4R43xm4mdY54Dq7erLn0BH37tOQIH0rvYxi
	sDy4H+bMdvKh7STCCB88w==
X-Google-Smtp-Source: AGHT+IFpC/HMjn5GH/1IdtXCSwb6O2XXiR4/6jJnE6NPaAVE/ku2hR4vS6mFeMuMJcw8eCYK+16vQG+TE+oDgOYW3WU=
X-Received: by 2002:a05:6902:4205:b0:e90:68fc:cb3d with SMTP id
 3f1490d57ef6-e917a6a6f76mr4038666276.2.1755006868789; Tue, 12 Aug 2025
 06:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250812093943.1499454-1-martin.jansa@gmail.com>
In-Reply-To: <20250812093943.1499454-1-martin.jansa@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 12 Aug 2025 07:54:16 -0600
X-Gm-Features: Ac12FXzS8IJL4PnFNxeMDZ3CWG4vsq1NhqJOwulmfDC_G_g_z1gU8AV5G_Srq6o
Message-ID: <CAJdd5GZSiTfoGSYoS3P+7GhvTxp0D9=RTA2Kxt1HOqT22YMq1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] utils.py: use multiprocessing from bb
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fe1b5b063c2b601e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 13:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221773

--000000000000fe1b5b063c2b601e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Aug 12, 2025 at 3:39=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> Fixes build with python-3.14
>
> It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
> and oe-core now requires latest bitbake already, so we can use this.
>
> [YOCTO #15858]
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/lib/oe/utils.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 8aa15373f1..0128ee411d 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -5,11 +5,11 @@
>  #
>
>  import subprocess
> -import multiprocessing
>  import traceback
>  import errno
>
>  import bb.parse
> +from bb import multiprocessing
>
>  def read_file(filename):
>      try:
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221758):
> https://lists.openembedded.org/g/openembedded-core/message/221758
> Mute This Topic: https://lists.openembedded.org/mt/114662985/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fe1b5b063c2b601e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>LGTM</div><div><br></div><div>Reviewed-by: Joshua Wat=
t &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com</a>&gt;<=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Aug 12, 2025 at 3:39=E2=80=AFAM Martin Jansa v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">From: Martin Jansa &lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
<br>
Fixes build with python-3.14<br>
<br>
It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6<br>
and oe-core now requires latest bitbake already, so we can use this.<br>
<br>
[YOCTO #15858]<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/utils.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
index 8aa15373f1..0128ee411d 100644<br>
--- a/meta/lib/oe/utils.py<br>
+++ b/meta/lib/oe/utils.py<br>
@@ -5,11 +5,11 @@<br>
=C2=A0#<br>
<br>
=C2=A0import subprocess<br>
-import multiprocessing<br>
=C2=A0import traceback<br>
=C2=A0import errno<br>
<br>
=C2=A0import bb.parse<br>
+from bb import multiprocessing<br>
<br>
=C2=A0def read_file(filename):<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#221758): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/221758" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/221758</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114662985/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114662985/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000fe1b5b063c2b601e--

