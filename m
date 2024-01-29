Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00764C47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 18:03:55 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.1739.1706551430714123337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 10:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=OU74dep5;
 spf=pass (domain: madison.systems, ip: 209.85.218.47, mailfrom: matt@madison.systems)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a35ba5744e0so145042166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 10:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google; t=1706551429; x=1707156229; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kRK6FTGe7uiglNUh4FNpLqDQc8x/izjj8gLYjlY217Q=;
        b=OU74dep5aVSi7Ipnh8lofaV+8yuUv/JzUUfPuWOl6Jw1kKTsqw0/qQRN+qYQw+3ol2
         ma8cweJ53SoFrMVCGfPQx35ey8Va7b4uXrDxjz6voBOrGpAE0SvT7+OSuELsgoVn4Lbl
         9YaUQF84nrUvWH7KUIO8T+vZ7EcT/6+FyIGVpbweMCN0aPoLf/ytQeeMXHtm0LVyBvPT
         NNZkCnzrZDaCA2AepVvyO5X8BK3ovTTF0IceL+EHCqsadVtxa4i3cPA5tAmlJGghN9GY
         EX9X1sPqttd+MaduGg+4S9HXFr+BgjkydqyBPpI8fYCpaKxAaE9CQAt5e4g2vHdM8O+C
         HXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551429; x=1707156229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRK6FTGe7uiglNUh4FNpLqDQc8x/izjj8gLYjlY217Q=;
        b=IJRNOWBHAaJdhaLSelqAZeTRRv27r0v2NMoIESPwjB6OYQihAthvwVEE6mhV5lNTB2
         yxoF58G+L3eOukFvwZ44PiFTn1eUQAzG98pcwCMQY3YezjLo2biKfI5dJdyb2q//S1tP
         RufjsfXgV5mQku9MGKOlNFHmNTU0crHMbJkkCLQUSCc5KFzpB+12XBrlaBIFsFsdE5qL
         /qQbzwMtOJ3Kd0C71O0MvPON301HvvSMCCVxwp/JI3o5Xbz2CeS4J+kBv0+M0jWnaQS3
         hf6omYlL2atlrWw1mSCz++Lg/hYO4RGK1Uh1qvl7NMj2ToFJl+T62fV+YIWVcMOIvgjk
         beWw==
X-Gm-Message-State: AOJu0YzIr5mUNuaOBYJBZksmMVCMu6JqGnOl/vBy0bdpJG5+aqaCcirr
	t8Mn4EC8qVO1IO2hgeH+ZTx802UZRmsQF5Xfq43tI6m4BLp6wFgrCFu0YADtUtt2cYk2dxKnHw/
	uTLVJv+YrT5lfXAO3FR+m1QKqgJSA3KoC+Zdjvw==
X-Google-Smtp-Source: AGHT+IHlYcBDknbOn9GdRm89DfDbMMLDPefg3Tsfvo1o3buNYG2y178SLuVAmg966EFI4wfW2fTInTra6T7Dg540dnQ=
X-Received: by 2002:a17:906:c091:b0:a2e:4a46:adf6 with SMTP id
 f17-20020a170906c09100b00a2e4a46adf6mr5363803ejz.6.1706551429022; Mon, 29 Jan
 2024 10:03:49 -0800 (PST)
MIME-Version: 1.0
References: <20240129162615.3724802-1-matt@madison.systems> <CAMKF1sqfi=O0Bw26Wj3bsx=aUWe2thHw7Jt1_nzsxttD6NwNmQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqfi=O0Bw26Wj3bsx=aUWe2thHw7Jt1_nzsxttD6NwNmQ@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Mon, 29 Jan 2024 10:03:37 -0800
Message-ID: <CAGgRHJrfSuW84beU_VgyHLBVydHg_OSxXZ6XvHH6U6FRpA6QxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][pseudo] ports/linux: add wrapper for statvfs64
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b7d3010610197797"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 18:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194472

--000000000000b7d3010610197797
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Should be covered by the same conditional - the guts are in the same
directory.

-M

On Mon, Jan 29, 2024 at 8:48=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

>
>
> On Mon, Jan 29, 2024 at 8:26=E2=80=AFAM Matt Madison <matt@madison.system=
s> wrote:
>
>> rpm 4.19 now builds with LFS64 support enabled by default,
>> so it calls statvfs64() to get the space available on the
>> filesystem it is installing packages into.  Add a wrapper
>> for this call so the right filesystem is used.
>>
>> Signed-off-by: Matt Madison <matt@madison.systems>
>> ---
>>  ports/linux/statvfs/guts/statvfs64.c | 15 +++++++++++++++
>>  ports/linux/statvfs/wrapfuncs.in     |  1 +
>>  2 files changed, 16 insertions(+)
>>  create mode 100644 ports/linux/statvfs/guts/statvfs64.c
>>
>> diff --git a/ports/linux/statvfs/guts/statvfs64.c
>> b/ports/linux/statvfs/guts/statvfs64.c
>> new file mode 100644
>> index 0000000..856d3db
>> --- /dev/null
>> +++ b/ports/linux/statvfs/guts/statvfs64.c
>> @@ -0,0 +1,15 @@
>> +/*
>> + * Copyright (c) 2018 Wind River Systems; see
>> + * guts/COPYRIGHT for information.
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1-only
>> + *
>> + * int statvfs64(const char *path, struct statvfs64 *buf)
>> + *     int rc =3D -1;
>> + */
>> +
>> +       rc =3D real_statvfs64(path, buf);
>> +
>> +/*     return rc;
>> + * }
>> + */
>> diff --git a/ports/linux/statvfs/wrapfuncs.in b/ports/linux/statvfs/
>> wrapfuncs.in
>> index 1afb64d..6a59660 100644
>> --- a/ports/linux/statvfs/wrapfuncs.in
>> +++ b/ports/linux/statvfs/wrapfuncs.in
>> @@ -1 +1,2 @@
>>  int statvfs(const char *path, struct statvfs *buf);
>> +int statvfs64(const char *path, struct statvfs64 *buf);
>
>
> Statvfs is under a conditional I wonder if this should be too
>
>>
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#194464):
>> https://lists.openembedded.org/g/openembedded-core/message/194464
>> Mute This Topic: https://lists.openembedded.org/mt/104034596/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000b7d3010610197797
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Should be covered by the same conditional - the guts are i=
n the same directory.<div><br></div><div>-M</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 29, 2024 at 8:=
48=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Jan 29, 2024 at 8:26=E2=80=AFAM Matt Madison =
&lt;matt@madison.systems&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">rpm 4.19 now builds with LFS64 support enabled by defau=
lt,<br>
so it calls statvfs64() to get the space available on the<br>
filesystem it is installing packages into.=C2=A0 Add a wrapper<br>
for this call so the right filesystem is used.<br>
<br>
Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
---<br>
=C2=A0ports/linux/statvfs/guts/statvfs64.c | 15 +++++++++++++++<br>
=C2=A0ports/linux/statvfs/<a href=3D"http://wrapfuncs.in" rel=3D"noreferrer=
" target=3D"_blank">wrapfuncs.in</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 16 insertions(+)<br>
=C2=A0create mode 100644 ports/linux/statvfs/guts/statvfs64.c<br>
<br>
diff --git a/ports/linux/statvfs/guts/statvfs64.c b/ports/linux/statvfs/gut=
s/statvfs64.c<br>
new file mode 100644<br>
index 0000000..856d3db<br>
--- /dev/null<br>
+++ b/ports/linux/statvfs/guts/statvfs64.c<br>
@@ -0,0 +1,15 @@<br>
+/*<br>
+ * Copyright (c) 2018 Wind River Systems; see<br>
+ * guts/COPYRIGHT for information.<br>
+ *<br>
+ * SPDX-License-Identifier: LGPL-2.1-only<br>
+ *<br>
+ * int statvfs64(const char *path, struct statvfs64 *buf)<br>
+ *=C2=A0 =C2=A0 =C2=A0int rc =3D -1;<br>
+ */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D real_statvfs64(path, buf);<br>
+<br>
+/*=C2=A0 =C2=A0 =C2=A0return rc;<br>
+ * }<br>
+ */<br>
diff --git a/ports/linux/statvfs/<a href=3D"http://wrapfuncs.in" rel=3D"nor=
eferrer" target=3D"_blank">wrapfuncs.in</a> b/ports/linux/statvfs/<a href=
=3D"http://wrapfuncs.in" rel=3D"noreferrer" target=3D"_blank">wrapfuncs.in<=
/a><br>
index 1afb64d..6a59660 100644<br>
--- a/ports/linux/statvfs/<a href=3D"http://wrapfuncs.in" rel=3D"noreferrer=
" target=3D"_blank">wrapfuncs.in</a><br>
+++ b/ports/linux/statvfs/<a href=3D"http://wrapfuncs.in" rel=3D"noreferrer=
" target=3D"_blank">wrapfuncs.in</a><br>
@@ -1 +1,2 @@<br>
=C2=A0int statvfs(const char *path, struct statvfs *buf);<br>
+int statvfs64(const char *path, struct statvfs64 *buf);</blockquote><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Statvfs is under a conditional I wo=
nder if this should be too=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex" dir=3D"auto"><br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194464): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194464" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194464</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104034596/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104034596/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000b7d3010610197797--

