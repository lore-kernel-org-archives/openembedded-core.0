Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web09.11226.1603987824710715414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 09:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fzFxVwEY;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id f15so847239uaq.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 09:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ro7o/gKAvP6nhF8L3RuCQndIQFBfeox+Tz1bfXvGdtI=;
        b=fzFxVwEYSC7HZtqyRBo0WjoW5RKDmXzgfirJC2Inpg2C/UZ8FAI5w+vtBhqXcOy+lW
         qdK1Prn5j/pkyD14IMKVE9CG1cwPASCJb1raAcuKeH6nz5fobf1pa2184cafdsfX+X3G
         ErsqFxHel9Vm8mq7JMfT+UzCNO0w6SrPuMBA7OXVK3btRweZp/5dnnsBCHDDcBfqs39+
         N9BQLcgLS3QuXL9jhlS2kU4RNesNGU3ml40+5E6cYEBrYkSd3usfY6deEesmLv2PVyhA
         sWbc5262qNSDSmbmiYbjHZZXnlN+jkUYSPot3lpHPqM74sf69NbLoLrQEYwf3L7Zu7wC
         Fyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ro7o/gKAvP6nhF8L3RuCQndIQFBfeox+Tz1bfXvGdtI=;
        b=bEhc09fYjPcbp0M/xTNE0cezoFPvWav5BJC1lM0zyjJst19xUm+FJz3bUUIFLAwcRx
         MGBvIbIdaEDecVl1lbdnUorv8mJz2HDEDfzXXhdRrhkMbiMw9LLP/CUrXS+1POVrpDA3
         LidI55y7vfwz/iuITmd7udwFOyggC5G5TL+f+xqBLNiyh1p0lrh5KI7xnGfXhY8CB+Yu
         b1J71iLhssBSUQqXGimW015Rtm9bIhup7P9uabnFTkwJp6GUss+J3OSyTPXR0wHB1g9s
         MXr4azDDYPbU0VaqFLBeUxQycBRTCuh8gfATZIaafeHNFyijH07FksTbiQf3hHrispiT
         xHww==
X-Gm-Message-State: AOAM532wlwDAdIIsyqrwtP0xyhjY7JqykI6PD7/hdUV4EGGKYhSkG9mN
	2hzt/ZDCYKEmVSR1UE2lp5MS2GQQ+ux/vzBnf3s=
X-Google-Smtp-Source: ABdhPJyRkgJBysr0jh0tv8vAl2VbrZDM+F66elhjGs6uY2DHsIlIll/3PPmz4ACMUtHeW7BQ8IMBbUFmaGQYGeGxnxo=
X-Received: by 2002:ab0:7143:: with SMTP id k3mr3297935uao.93.1603987823854;
 Thu, 29 Oct 2020 09:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAOsEjUKH61YhBDiS7xzhT6kYYeW2Qbr_4GF2ZsM18z4xRGS-Q@mail.gmail.com>
In-Reply-To: <CAAOsEjUKH61YhBDiS7xzhT6kYYeW2Qbr_4GF2ZsM18z4xRGS-Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 29 Oct 2020 17:10:12 +0100
Message-ID: <CANNYZj8TBSHhTguu0g2zkpX7k9LObs6Xzw4C0PUCzEY18gLHeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fix a build error about missing '_sysconfigdata'
To: foremans@google.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Josh Lehan <krellan@google.com>
Content-Type: multipart/alternative; boundary="000000000000770e6505b2d184fd"

--000000000000770e6505b2d184fd
Content-Type: text/plain; charset="UTF-8"

Unfortunately, this doesn't fix the actual issue: why is the build
environment leaking? A few patches similar to this one have been shot down
before.

If you can provide steps to reproduce, I can try to take a look.

Alex

On Thu, 29 Oct 2020 at 16:35, Steve Foreman via lists.openembedded.org
<foremans=google.com@lists.openembedded.org> wrote:

> This error is generated because of internal build environment is leaking
> and pulling in host libraries:
>
> Exception: ModuleNotFoundError: No module named '_sysconfigdata'
>
> In this case, xmlprc.server is pulling in pydoc which ultimately hits
> the error.
>
> Signed-off-by: Steve Foreman <foremans@google.com>
> ---
>  poky/bitbake/lib/prserv/serv.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/poky/bitbake/lib/prserv/serv.py
> b/poky/bitbake/lib/prserv/serv.py
> index 25dcf8a0e..f462f3dcc 100644
> --- a/poky/bitbake/lib/prserv/serv.py
> +++ b/poky/bitbake/lib/prserv/serv.py
> @@ -4,6 +4,11 @@
>
>  import os,sys,logging
>  import signal, time
> +
> +# Otherwise this fails when called from recipes which e.g. inherit
> python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with:
> +# No module named '_sysconfigdata'
> +if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
> +    del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
>  from xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler
>  import threading
>  import queue
> --
> 2.29.1.341.ge80a0c044ae-goog
>
> 
>
>

--000000000000770e6505b2d184fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Unfortunately, this doesn&#39;t fix the actual issue:=
 why is the build environment leaking? A few patches similar to this one ha=
ve been shot down before.</div><div><br></div><div>If you can provide steps=
 to reproduce, I can try to take a look.<br></div><div><br></div><div>Alex<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, 29 Oct 2020 at 16:35, Steve Foreman via <a href=3D"http://=
lists.openembedded.org">lists.openembedded.org</a> &lt;foremans=3D<a href=
=3D"mailto:google.com@lists.openembedded.org">google.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr">This error is generated because of internal build env=
ironment is leaking<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quo=
t;,Helvetica,Arial,sans-serif">and pulling in host libraries:<br style=3D"f=
ont-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><b=
r style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sa=
ns-serif">Exception: ModuleNotFoundError: No module named &#39;_sysconfigda=
ta&#39;<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica=
,Arial,sans-serif"><br style=3D"font-family:Roboto,&quot;Helvetica Neue&quo=
t;,Helvetica,Arial,sans-serif">In this case, xmlprc.server is pulling in py=
doc which ultimately hits<br style=3D"font-family:Roboto,&quot;Helvetica Ne=
ue&quot;,Helvetica,Arial,sans-serif">the error.<br style=3D"font-family:Rob=
oto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><br style=3D"fon=
t-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">Sign=
ed-off-by: Steve Foreman &lt;<a href=3D"mailto:foremans@google.com" style=
=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-ser=
if" target=3D"_blank">foremans@google.com</a>&gt;<br style=3D"font-family:R=
oboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">---<br style=
=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-ser=
if">=C2=A0poky/bitbake/lib/prserv/serv.py | 5 +++++<br style=3D"font-family=
:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">=C2=A01 file=
 changed, 5 insertions(+)<br style=3D"font-family:Roboto,&quot;Helvetica Ne=
ue&quot;,Helvetica,Arial,sans-serif"><br style=3D"font-family:Roboto,&quot;=
Helvetica Neue&quot;,Helvetica,Arial,sans-serif">diff --git a/poky/bitbake/=
lib/prserv/serv.py b/poky/bitbake/lib/prserv/serv.py<br style=3D"font-famil=
y:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">index 25dcf=
8a0e..f462f3dcc 100644<br style=3D"font-family:Roboto,&quot;Helvetica Neue&=
quot;,Helvetica,Arial,sans-serif">--- a/poky/bitbake/lib/prserv/serv.py<br =
style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans=
-serif">+++ b/poky/bitbake/lib/prserv/serv.py<br style=3D"font-family:Robot=
o,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">@@ -4,6 +4,11 @@<b=
r style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sa=
ns-serif"><br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvet=
ica,Arial,sans-serif">=C2=A0import os,sys,logging<br style=3D"font-family:R=
oboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">=C2=A0import s=
ignal, time<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helve=
tica,Arial,sans-serif">+<br style=3D"font-family:Roboto,&quot;Helvetica Neu=
e&quot;,Helvetica,Arial,sans-serif">+# Otherwise this fails when called fro=
m recipes which e.g. inherit python3native (which sets _PYTHON_SYSCONFIGDAT=
A_NAME) with:<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Hel=
vetica,Arial,sans-serif">+# No module named &#39;_sysconfigdata&#39;<br sty=
le=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-se=
rif">+if &#39;_PYTHON_SYSCONFIGDATA_NAME&#39; in os.environ:<br style=3D"fo=
nt-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">+=
=C2=A0 =C2=A0 del os.environ[&#39;_PYTHON_SYSCONFIGDATA_NAME&#39;]<br styl=
e=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-ser=
if">=C2=A0from xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequest=
Handler<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica=
,Arial,sans-serif">=C2=A0import threading<br style=3D"font-family:Roboto,&q=
uot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">=C2=A0import queue<fon=
t style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sa=
ns-serif" color=3D"#888888"><br>--<br>2.29.1.341.ge80a0c044ae-goog</font><b=
r></div>
<br>
<br>
<br>
</blockquote></div>

--000000000000770e6505b2d184fd--
