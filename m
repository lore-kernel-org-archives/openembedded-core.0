Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE95C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 22:09:46 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.3510.1654639776704662826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 15:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y92/kX6J;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id h23so30388851lfe.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 15:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Ht4i1dW861SAgcXUpMAmAbZLjVKvAiL7kJBK77/++M=;
        b=Y92/kX6JRRx7oDZm4YBnow+2LRqh7EoBvr0C3EwmbiUV8KCv+gFrgqV8rPQhjVzu+0
         FuucNiSH0FgIu5AKzdeif7wdF+4hhH6N9BjmRPEhS48TL5ZPxGasi2KaFpyr6mGQUUVq
         i0tzTycRqlaurAyp68kRoz1zLlsFXl4tHQwgZ+JvclrNWv7h/+cYssY3jvk/wdMBR07i
         Yjo28516vgAvX+1T49HnMh21uGhY//s0Gtvj+OQkTHyriepLBYpG42tbRHx7KnBRA5X3
         gtFSqZVIsrxOzTGON0rt6L4Vx6np3v6iwwyRA9tJSO8WApEB3o07Z22FE/ActtEwu63w
         PqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Ht4i1dW861SAgcXUpMAmAbZLjVKvAiL7kJBK77/++M=;
        b=ZOUvlV7tzY7SJjrspkuB1Hhoi2Lqso+KGRG5coARHf0J5FEnqYh2n/Jct2EiJBQSUX
         qRJ8DTlJtXGt+7H5AhX9OVfBcxsUJgOW2ul5oU7rWT6Wjsyjg75Cocojixf4JFhaTk7h
         DEh6Camv7BdoPREQrer0UBuh0OGt1sbSmCOvj5DrlifJFWIw5lfydXKxBj7tLmUcW7Y7
         rF/JKUSg78Yaja+lGban/p3y1Vg9poT+uZOdA2gQVxvlVoq/i5rXx4gqTnuIb9jAl+sJ
         VkaOAwk0qpdfMSdLAUDiphsL7cpRfWKfpsopWEHlOCEDPW1yB1KFpIEJ1wBFvtOvkpsR
         fVtg==
X-Gm-Message-State: AOAM531WSc4mBhbxnbVFaWiuOT3B9w9g6yMHBIN+fIVfezBau32W3HSb
	IX4ideoP+vLKB2CoQxNMiy8u9lWZS2cGfJODA9M=
X-Google-Smtp-Source: 
 ABdhPJyIq0hwHL5U00BFSmP+JJtctQrJmWDLpicH2+DONGVWhZxFS2KQDL0xS6Y5h0d7nJIdUOVLBvZbyFrCrPXx6Xs=
X-Received: by 2002:ac2:54b9:0:b0:479:a29:c1ec with SMTP id
 w25-20020ac254b9000000b004790a29c1ecmr19387657lfk.358.1654639774762; Tue, 07
 Jun 2022 15:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220607151123.3588947-1-ptsneves@gmail.com>
 <CANNYZj-YRAU+RJQ8JwqAxgSJto+LAbMQxQ-yOB8c3PBCcsr7OQ@mail.gmail.com>
 <CAJO0J4iAAyOPzy+crXQDBO3hqdE9+Pdhu3hheju+QbpH5=vqFA@mail.gmail.com>
In-Reply-To: 
 <CAJO0J4iAAyOPzy+crXQDBO3hqdE9+Pdhu3hheju+QbpH5=vqFA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Jun 2022 01:09:23 +0300
Message-ID: 
 <CANNYZj_LuqoRFGQ3aRDLWEO7mTBv2xs0-=p5ntUWRtT0Kc3vbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/5] python: Avoid shebang overflow on
 python-config.py
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000001892005e0e2d8e9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 22:09:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166688

--00000000000001892005e0e2d8e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please submit it nevertheless. If upstream says no, we'll just mark it as
denied, but it=E2=80=99s not appropriate to declare it inappropriate a prio=
ri.

Alex

On Tue 7. Jun 2022 at 23.03, Paulo Neves <ptsneves@gmail.com> wrote:

> I think this patch will never be accepted because it hard-codes and
> depends on env. I recall that red hat for example does not accept the use
> of env, possibly for security reasons.
>
> Paulo Neves
>
> On Tue, Jun 7, 2022, 18:53 Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> I'm not sure this is Inappropriate. Can you send this to upstream
>> nevertheless?
>>
>> Alex
>>
>> On Tue, 7 Jun 2022 at 17:11, Paulo Neves <ptsneves@gmail.com> wrote:
>> >
>> > The native path may be too big, leading to shebang
>> > overflow. Just use the #!/usr/bin/env python3.
>> >
>> > Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> > ---
>> >  ...shebang-overflow-on-python-config.py.patch | 29 ++++++++++++++++++=
+
>> >  .../recipes-devtools/python/python3_3.10.4.bb |  1 +
>> >  2 files changed, 30 insertions(+)
>> >  create mode 100644
>> meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-pyth=
on-config.py.patch
>> >
>> > diff --git
>> a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-py=
thon-config.py.patch
>> b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-py=
thon-config.py.patch
>> > new file mode 100644
>> > index 0000000000..9f23278a30
>> > --- /dev/null
>> > +++
>> b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-py=
thon-config.py.patch
>> > @@ -0,0 +1,29 @@
>> > +From f0c9dec63d452a7cd1e15ea653f4aced281f021c Mon Sep 17 00:00:00 200=
1
>> > +From: Paulo Neves <ptsneves@gmail.com>
>> > +Date: Tue, 7 Jun 2022 16:16:41 +0200
>> > +Subject: [PATCH 1/1] Avoid shebang overflow on python-config.py
>> > +
>> > +The whole native path may be too big, leading to shebang
>> > +overflow. Let's just use the env shebang.
>> > +
>> > +Upstream-Status: Inappropriate [distribution]
>> > +---
>> > + Makefile.pre.in | 2 ++
>> > + 1 file changed, 2 insertions(+)
>> > +
>> > +diff --git a/Makefile.pre.in b/Makefile.pre.in
>> > +index
>> f0aedb76cb58999427804255da56fa53284d7032..dd88e43114730f7681715777cc76da=
bb31113176
>> 100644
>> > +--- a/Makefile.pre.in
>> > ++++ b/Makefile.pre.in
>> > +@@ -1638,6 +1638,8 @@ python-config: $(srcdir)/Misc/python-config.in
>> Misc/python-config.sh
>> > +       @ # Substitution happens here, as the completely-expanded BIND=
IR
>> > +       @ # is not available in configure
>> > +       sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," <
>> $(srcdir)/Misc/python-config.in >python-config.py
>> > ++      @ # Otherwise we might get huge shebangs with native paths
>> > ++      sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' python-config.py
>> > +       @ # Replace makefile compat. variable references with shell
>> script compat. ones; $(VAR) -> ${VAR}
>> > +       LC_ALL=3DC sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' <
>> Misc/python-config.sh >python-config
>> > +       @  # In OpenEmbedded, always use the python version of the
>> script, the shell
>> > +--
>> > +2.25.1
>> > +
>> > diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb
>> b/meta/recipes-devtools/python/python3_3.10.4.bb
>> > index 6bd3a6aba8..357025f856 100644
>> > --- a/meta/recipes-devtools/python/python3_3.10.4.bb
>> > +++ b/meta/recipes-devtools/python/python3_3.10.4.bb
>> > @@ -34,6 +34,7 @@ SRC_URI =3D "
>> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>> >
>>  file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch =
\
>> >
>>  file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch =
\
>> >             file://deterministic_imports.patch \
>> > +
>>  file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
>> >             "
>> >
>> >  SRC_URI:append:class-native =3D " \
>> > --
>> > 2.25.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#166670):
>> https://lists.openembedded.org/g/openembedded-core/message/166670
>> > Mute This Topic: https://lists.openembedded.org/mt/91602889/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
>> alex.kanavin@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>

--00000000000001892005e0e2d8e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please submit it nevertheless. If upstream says no, we&#3=
9;ll just mark it as denied, but it=E2=80=99s not appropriate to declare it=
 inappropriate a priori.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue 7. Jun 2022 at 23.03, Paulo Neves &lt;<a href=3D"mailto:pt=
sneves@gmail.com">ptsneves@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204=
)"><div dir=3D"auto">I think this patch will never be accepted because it h=
ard-codes and depends on env. I recall that red hat for example does not ac=
cept the use of env, possibly for security reasons.</div><div dir=3D"auto">=
<div dir=3D"auto"><br></div><div dir=3D"auto">Paulo Neves=C2=A0</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Jun 7, 2022, 18:53 Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)">I&#39;m not sure this is Inappropriate. Can you send this =
to upstream nevertheless?<br>
<br>
Alex<br>
<br>
On Tue, 7 Jun 2022 at 17:11, Paulo Neves &lt;<a href=3D"mailto:ptsneves@gma=
il.com" rel=3D"noreferrer" target=3D"_blank">ptsneves@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; The native path may be too big, leading to shebang<br>
&gt; overflow. Just use the #!/usr/bin/env python3.<br>
&gt;<br>
&gt; Signed-off-by: Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com" r=
el=3D"noreferrer" target=3D"_blank">ptsneves@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...shebang-overflow-on-python-config.py.patch | 29 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3_3.10.4.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.10.4.bb</a> |=C2=
=A0 1 +<br>
&gt;=C2=A0 2 files changed, 30 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3/0001-Avo=
id-shebang-overflow-on-python-config.py.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-o=
verflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/00=
01-Avoid-shebang-overflow-on-python-config.py.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9f23278a30<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow=
-on-python-config.py.patch<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +From f0c9dec63d452a7cd1e15ea653f4aced281f021c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com" rel=3D"no=
referrer" target=3D"_blank">ptsneves@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 7 Jun 2022 16:16:41 +0200<br>
&gt; +Subject: [PATCH 1/1] Avoid shebang overflow on python-config.py<br>
&gt; +<br>
&gt; +The whole native path may be too big, leading to shebang<br>
&gt; +overflow. Let&#39;s just use the env shebang.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [distribution]<br>
&gt; +---<br>
&gt; + <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">Makefile.pre.in</a> | 2 ++<br>
&gt; + 1 file changed, 2 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile=
.pre.in" rel=3D"noreferrer noreferrer" target=3D"_blank">Makefile.pre.in</a=
><br>
&gt; +index f0aedb76cb58999427804255da56fa53284d7032..dd88e43114730f7681715=
777cc76dabb31113176 100644<br>
&gt; +--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer noreferrer=
" target=3D"_blank">Makefile.pre.in</a><br>
&gt; ++++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer noreferrer=
" target=3D"_blank">Makefile.pre.in</a><br>
&gt; +@@ -1638,6 +1638,8 @@ python-config: $(srcdir)/Misc/<a href=3D"http:/=
/python-config.in" rel=3D"noreferrer noreferrer" target=3D"_blank">python-c=
onfig.in</a> Misc/python-config.sh<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@ # Substitution happens here, as the comp=
letely-expanded BINDIR<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@ # is not available in configure<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &quot;s,@EXENAME@,$(BINDIR)/python$=
(LDVERSION)$(EXE),&quot; &lt; $(srcdir)/Misc/<a href=3D"http://python-confi=
g.in" rel=3D"noreferrer noreferrer" target=3D"_blank">python-config.in</a> =
&gt;python-config.py<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @ # Otherwise we might get huge shebangs with n=
ative paths<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s|^#!.*|#!/usr/bin/env python3|=
&#39; python-config.py<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@ # Replace makefile compat. variable refe=
rences with shell script compat. ones; $(VAR) -&gt; ${VAR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0LC_ALL=3DC sed -e &#39;s,\$$(\([A-Za-z0-9_=
]*\)),\$$\{\1\},g&#39; &lt; Misc/python-config.sh &gt;python-config<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@=C2=A0 # In OpenEmbedded, always use the =
python version of the script, the shell<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
10.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.10.4.bb<=
/a> b/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.4.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">python3_3.10.4.bb</a><br>
&gt; index 6bd3a6aba8..357025f856 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.4.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.10.4.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.4.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">python3_3.10.4.bb</a><br>
&gt; @@ -34,6 +34,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/f=
tp/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer" =
target=3D"_blank">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.x=
z</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Lib-pty.py-=
handle-stdin-I-O-errors-same-way-as-maste.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-setup.py-Do=
-not-detect-multiarch-paths-when-cross-co.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://deterministic_im=
ports.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Avoid-shebang-ov=
erflow-on-python-config.py.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI:append:class-native =3D &quot; \<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#166670): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/166670" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1666=
70</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91602889=
/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/91602889/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" rel=3D"noreferrer" target=3D"_blank">alex.kanavin@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>
</blockquote></div></div>

--00000000000001892005e0e2d8e9--

