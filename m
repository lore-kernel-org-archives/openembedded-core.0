Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE20C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 13:14:59 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.94178.1701090888595620828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 05:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pjm54aZP;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-332ddd8e0bdso2204350f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 05:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701090887; x=1701695687; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nInsRwoJDi6GnD/toDq1Xg38dYagdlYK8Os73UjDjoI=;
        b=Pjm54aZPRBCf5T6guJO0U24C9BvS3olWjCgk5CC8wA9YcwqRUIFXkyqnZLDofD+tdb
         Jim9PxVuItam7hVSEmwu8RUWPZtZw1rxxAUXeYW1k4D+254WAFnEVwEzuQkkNMAZrE5m
         ADRybNuqrUc/h7iljxXsgkKRkCvYV7IrJPYe2O8PhIVlr8XgjGhwCB1Szt8VbVF2v+ly
         l6S3y9IEBFSPHkFXz1gRf/oZ33cGTP40PiFGKZdMZgbtZWQmieNJwnIZh9msYHsn2kZ8
         vfCi8UfMHsfu9tmnlKDwCXQORuTGWjdqcLdpzK8dyUKEkmwtWYX/SQ3q9J9TjIpZSZoP
         CKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701090887; x=1701695687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nInsRwoJDi6GnD/toDq1Xg38dYagdlYK8Os73UjDjoI=;
        b=f0sogUth5SKGllFtmIbaFPw/5RiWv/byZcSNSOfPvjpt5PpoVIWOdBVUID0P6lCF3J
         9CyJR8cFbmML21W1aMQSq7u+Y2sb+cHP5+YGaVuIw5SbXjQCx9r1XH+mp9coF/2OBszc
         p4/43j9T81OHhvoHuJpTIaYOUQb2fRbzB1dfG+//nsf++LVvE2BIlJV0MUozjpuHNfSP
         nwEI7UMbRq+tS5k47fxtcvfIrxEVVFnzN+fPPFOyVO49K2E0StywQcIGy5o2OJhH89MW
         3rg5f+HYh+sp53UsziDfp7dukSB/6ABLyP4vKKzLg2Ra9JvtS2T4NupfdKgt+gRxDdAB
         kF2w==
X-Gm-Message-State: AOJu0Yx6ALnVJsUB1f2Cz26mcbk+/8vl3RIFTLz/3oV55cZ5IN6xex5K
	mr/YdULl/TwTe10yw+mnJa9EGCbfimgM0Vy9ryA=
X-Google-Smtp-Source: AGHT+IGa8SBkI9k7LoCPPZidfMurvwvSnk567SIfT2wH0Gmjk18RhUmWQnkl0F8eAGSiP47FdQ0gUuzov/QRunC61j0=
X-Received: by 2002:a5d:65cb:0:b0:333:2f2:33c1 with SMTP id
 e11-20020a5d65cb000000b0033302f233c1mr1781623wrw.13.1701090886441; Mon, 27
 Nov 2023 05:14:46 -0800 (PST)
MIME-Version: 1.0
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org> <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com>
In-Reply-To: <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 27 Nov 2023 14:14:33 +0100
Message-ID: <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
Subject: Re: [OE-core] bitbake-server does not exit after build ends
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000461e6060b2216f2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 13:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191298

--0000000000000461e6060b2216f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can confirm the same on gentoo with python-3.12.

On Mon, Nov 27, 2023 at 12:29=E2=80=AFPM Zoltan Boszormenyi <zboszor@gmail.=
com>
wrote:

> 2023. 11. 27. 11:52 keltez=C3=A9ssel, Richard Purdie =C3=ADrta:
> > Is there anything interesting in the bitbake-cookerdaemon.log file?
>
> Actually, yes.
>
> This is obviously the most suspicious:
>
> /usr/lib64/python3.12/multiprocessing/popen_fork.py:66:
> DeprecationWarning: This process
> (pid=3D1605202) is multi-threaded, use of fork() may lead to deadlocks in
> the child.
>    self.pid =3D os.fork()
> /home/zozo/test-yocto-4.3/bitbake/bin/bitbake-worker:210:
> DeprecationWarning: This process
> (pid=3D1605590) is multi-threaded, use of fork() may lead to deadlocks in
> the child.
>    pid =3D os.fork()
> /home/zozo/test-yocto-4.3/bitbake/bin/bitbake-worker:210:
> DeprecationWarning: This process
> (pid=3D1607833) is multi-threaded, use of fork() may lead to deadlocks in
> the child.
>    pid =3D os.fork()
>
> There are a few other deprecation warnings, too,
> which are not relevant to this particular problem
> but may be interesting for the future, nevertheless:
>
> /home/zozo/test-yocto-4.3/bitbake/lib/bb/codeparser.py:260:
> DeprecationWarning: ast.Str is
> deprecated and will be removed in Python 3.14; use ast.Constant instead
>    if name in self.containsfuncs and isinstance(node.args[1], ast.Str):
> /home/zozo/test-yocto-4.3/bitbake/lib/bb/codeparser.py:263:
> DeprecationWarning: Attribute
> s is deprecated and will be removed in Python 3.14; use value instead
>    self.contains[varname].add(node.args[1].s)
>
> ruby.bbclass has a lot of these at different line numbers:
>
> /home/zozo/test-yocto-4.3/conf/../layers/meta-cloud-services/classes/ruby=
.bbclass:28:
>
> SyntaxWarning: invalid escape sequence '\.'
>    r =3D re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
>
> These lines occur at the end (probably normal):
>
> 1605202 10:39:58.854287 Parse cache valid
> 1605202 10:40:13.098694 Registering idle function <function
> BBCooker.buildTargets.<locals>.buildTargetsIdle at 0x7fa3e22e79c0>
> 1605202 10:40:13.098736 Removing idle function <bound method
> Command.runAsyncCommand of
> <bb.command.Command object at 0x7fa41259d580>>
> 1605202 12:17:02.357378 Running command ['stateShutdown']
> 1605202 12:17:02.357622 Sending reply (None, None)
> 1605202 12:17:02.357819 Command Completed (socket: True)
>
> And the remaining child processes:
>
> $ ps auxw | grep bitb | grep -v grep
> zozo     1605202  2.3  3.5 1333384 1151808 ?     Sl   10:39   2:29
> /usr/bin/python3
> /home/zozo/test-yocto-4.3/bitbake/bin/bitbake-server decafbad 3 5
> /home/zozo/test-yocto-4.3/bitbake-cookerdaemon.log
> /home/zozo/test-yocto-4.3/bitbake.lock
> /home/zozo/test-yocto-4.3/bitbake.sock 0 0 None 0
> zozo     1605208  0.0  1.4 559372 466260 ?       S    10:39   0:00
> /usr/bin/python3
> /home/zozo/test-yocto-4.3/bitbake/bin/bitbake-server decafbad 3 5
> /home/zozo/test-yocto-4.3/bitbake-cookerdaemon.log
> /home/zozo/test-yocto-4.3/bitbake.lock
> /home/zozo/test-yocto-4.3/bitbake.sock 0 0 None 0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191294):
> https://lists.openembedded.org/g/openembedded-core/message/191294
> Mute This Topic: https://lists.openembedded.org/mt/102826186/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000461e6060b2216f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can confirm the same on gentoo with python-3.12.</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
Nov 27, 2023 at 12:29=E2=80=AFPM Zoltan Boszormenyi &lt;<a href=3D"mailto:z=
boszor@gmail.com">zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">2023. 11. 27. 11:52 keltez=C3=A9ssel, Ri=
chard Purdie =C3=ADrta:<br>
&gt; Is there anything interesting in the bitbake-cookerdaemon.log file?<br=
>
<br>
Actually, yes.<br>
<br>
This is obviously the most suspicious:<br>
<br>
/usr/lib64/python3.12/multiprocessing/popen_fork.py:66: DeprecationWarning:=
 This process <br>
(pid=3D1605202) is multi-threaded, use of fork() may lead to deadlocks in t=
he child.<br>
=C2=A0=C2=A0 self.pid =3D os.fork()<br>
/home/zozo/test-yocto-4.3/bitbake/bin/bitbake-worker:210: DeprecationWarnin=
g: This process <br>
(pid=3D1605590) is multi-threaded, use of fork() may lead to deadlocks in t=
he child.<br>
=C2=A0=C2=A0 pid =3D os.fork()<br>
/home/zozo/test-yocto-4.3/bitbake/bin/bitbake-worker:210: DeprecationWarnin=
g: This process <br>
(pid=3D1607833) is multi-threaded, use of fork() may lead to deadlocks in t=
he child.<br>
=C2=A0=C2=A0 pid =3D os.fork()<br>
<br>
There are a few other deprecation warnings, too,<br>
which are not relevant to this particular problem<br>
but may be interesting for the future, nevertheless:<br>
<br>
/home/zozo/test-yocto-4.3/bitbake/lib/bb/codeparser.py:260: DeprecationWarn=
ing: ast.Str is <br>
deprecated and will be removed in Python 3.14; use ast.Constant instead<br>
=C2=A0=C2=A0 if name in self.containsfuncs and isinstance(node.args[1], ast=
.Str):<br>
/home/zozo/test-yocto-4.3/bitbake/lib/bb/codeparser.py:263: DeprecationWarn=
ing: Attribute <br>
s is deprecated and will be removed in Python 3.14; use value instead<br>
=C2=A0=C2=A0 self.contains[varname].add(node.args[1].s)<br>
<br>
ruby.bbclass has a lot of these at different line numbers:<br>
<br>
/home/zozo/test-yocto-4.3/conf/../layers/meta-cloud-services/classes/ruby.b=
bclass:28: <br>
SyntaxWarning: invalid escape sequence &#39;\.&#39;<br>
=C2=A0=C2=A0 r =3D re.compile(&quot;ruby ([0-9]+\.[0-9]+\.[0-9]+)*&quot;)<b=
r>
<br>
These lines occur at the end (probably normal):<br>
<br>
1605202 10:39:58.854287 Parse cache valid<br>
1605202 10:40:13.098694 Registering idle function &lt;function <br>
BBCooker.buildTargets.&lt;locals&gt;.buildTargetsIdle at 0x7fa3e22e79c0&gt;=
<br>
1605202 10:40:13.098736 Removing idle function &lt;bound method Command.run=
AsyncCommand of <br>
&lt;bb.command.Command object at 0x7fa41259d580&gt;&gt;<br>
1605202 12:17:02.357378 Running command [&#39;stateShutdown&#39;]<br>
1605202 12:17:02.357622 Sending reply (None, None)<br>
1605202 12:17:02.357819 Command Completed (socket: True)<br>
<br>
And the remaining child processes:<br>
<br>
$ ps auxw | grep bitb | grep -v grep<br>
zozo=C2=A0=C2=A0=C2=A0=C2=A0 1605202=C2=A0 2.3=C2=A0 3.5 1333384 1151808 ?=
=C2=A0=C2=A0=C2=A0=C2=A0 Sl=C2=A0=C2=A0 10:39=C2=A0=C2=A0 2:29 /usr/bin/pyt=
hon3 <br>
/home/zozo/test-yocto-4.3/bitbake/bin/bitbake-server decafbad 3 5 <br>
/home/zozo/test-yocto-4.3/bitbake-cookerdaemon.log /home/zozo/test-yocto-4.=
3/bitbake.lock <br>
/home/zozo/test-yocto-4.3/bitbake.sock 0 0 None 0<br>
zozo=C2=A0=C2=A0=C2=A0=C2=A0 1605208=C2=A0 0.0=C2=A0 1.4 559372 466260 ?=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 S=C2=A0=C2=A0=C2=A0 10:39=C2=A0=C2=A0 0:0=
0 /usr/bin/python3 <br>
/home/zozo/test-yocto-4.3/bitbake/bin/bitbake-server decafbad 3 5 <br>
/home/zozo/test-yocto-4.3/bitbake-cookerdaemon.log /home/zozo/test-yocto-4.=
3/bitbake.lock <br>
/home/zozo/test-yocto-4.3/bitbake.sock 0 0 None 0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#191294): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/191294" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/191294</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102826186/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102826186/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000461e6060b2216f2--

