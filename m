Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.10728.1603985751459132037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 08:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=h0c+myKO;
 spf=pass (domain: google.com, ip: 209.85.167.47, mailfrom: foremans@google.com)
Received: by mail-lf1-f47.google.com with SMTP id 141so3872905lfn.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=jsTnKhKiGsZKxkqdg2g+RJAj2Ix/m/3q3Odr2CVoQxo=;
        b=h0c+myKO2m19dkiJXpKTxU/4ViE545T1caJfppUmTPFYRcH1yTzyaYCD/e5wKdpx3C
         krHrJqzKZuiVFG4O2F2zMzXAsb9sPSrDlp5iGXa49VDFiNjeze4fDbdxuIU+D3qsTzo0
         6Y1X2yN8j2RhNtdFFJvgty9tK4o0R2kjSsp4Vh3DxYpwKGXEHHYJGbN3ATsZ/GF8HzJf
         vC0Y7YtmIXui/eYlZYP3sEXluKN9gFtQrIaKerG+/Oh6ErrlFMqXfcfGPK9d6WOJ1SDE
         UJBHugaqTEk1idwn0Gq4Vs4hfPa87bpH4J79oWXjRX+OmmdQkhgqyUgth6eSiibkKeGa
         XNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=jsTnKhKiGsZKxkqdg2g+RJAj2Ix/m/3q3Odr2CVoQxo=;
        b=gZS/yhqltAYyX6ccX2VyxE7cSOHPCi83TPZGAa3v/hZuKdM+UtNHN+Zokg/Py6lHlG
         3ioQ16YroF75JBJBJoPrKiOoD4ZiupKoD4DNY/87OFB90hyXGpmr5/l9IPT2iAQQKqdA
         6GOZ6pkxgyQIQmiltEAVFTEkKz7rb+aE/X2C4NOJMxTTXVpeqm+iG9G6j553+oVSNhY6
         QwIi4WdBvMPuPLrQNfhxY03GshmnTQcQphYCutTEZC1bWHGKPQ6zecoXSCleBUQVHV6K
         tpm1a26hO0UtmK3Zr6rJtyjcYAT43OdY9E0uh6e729QnI5n0msA0x5o65Gsdlq6dosZM
         NXFA==
X-Gm-Message-State: AOAM532lTExJPxp/y7RF2Y2HaHZq7drZq9V7BhKusbtY+fChN5ydJwnd
	WDIXYRNkRBmtsbtFyVa+Fb5JW4Z9vnN4Y2ydb+buNbKGGoraiw==
X-Google-Smtp-Source: ABdhPJwIiUAbfOrKmC2/hD781JhUmaUFJ0P7/a1cpox8672WzDvFmCXf8GkoMBUsmhOlo97456Onr5H0XJNpcCsPk4Y=
X-Received: by 2002:ac2:5294:: with SMTP id q20mr1958969lfm.538.1603985748992;
 Thu, 29 Oct 2020 08:35:48 -0700 (PDT)
MIME-Version: 1.0
From: "Steve Foreman" <foremans@google.com>
Date: Thu, 29 Oct 2020 08:35:37 -0700
Message-ID: <CAAOsEjUKH61YhBDiS7xzhT6kYYeW2Qbr_4GF2ZsM18z4xRGS-Q@mail.gmail.com>
Subject: [PATCH] Fix a build error about missing '_sysconfigdata'
To: openembedded-core@lists.openembedded.org
Cc: Josh Lehan <krellan@google.com>
Content-Type: multipart/alternative; boundary="000000000000cb9eda05b2d108fe"

--000000000000cb9eda05b2d108fe
Content-Type: text/plain; charset="UTF-8"

This error is generated because of internal build environment is leaking
and pulling in host libraries:

Exception: ModuleNotFoundError: No module named '_sysconfigdata'

In this case, xmlprc.server is pulling in pydoc which ultimately hits
the error.

Signed-off-by: Steve Foreman <foremans@google.com>
---
 poky/bitbake/lib/prserv/serv.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/poky/bitbake/lib/prserv/serv.py
b/poky/bitbake/lib/prserv/serv.py
index 25dcf8a0e..f462f3dcc 100644
--- a/poky/bitbake/lib/prserv/serv.py
+++ b/poky/bitbake/lib/prserv/serv.py
@@ -4,6 +4,11 @@

 import os,sys,logging
 import signal, time
+
+# Otherwise this fails when called from recipes which e.g. inherit
python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with:
+# No module named '_sysconfigdata'
+if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
+    del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
 from xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler
 import threading
 import queue
--
2.29.1.341.ge80a0c044ae-goog

--000000000000cb9eda05b2d108fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This error is generated because of internal build environm=
ent is leaking<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,He=
lvetica,Arial,sans-serif">and pulling in host libraries:<br style=3D"font-f=
amily:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><br sty=
le=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-se=
rif">Exception: ModuleNotFoundError: No module named &#39;_sysconfigdata&#3=
9;<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Aria=
l,sans-serif"><br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,He=
lvetica,Arial,sans-serif">In this case, xmlprc.server is pulling in pydoc w=
hich ultimately hits<br style=3D"font-family:Roboto,&quot;Helvetica Neue&qu=
ot;,Helvetica,Arial,sans-serif">the error.<br style=3D"font-family:Roboto,&=
quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><br style=3D"font-fam=
ily:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">Signed-of=
f-by: Steve Foreman &lt;<a href=3D"mailto:foremans@google.com" target=3D"_b=
lank" style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Aria=
l,sans-serif">foremans@google.com</a>&gt;<br style=3D"font-family:Roboto,&q=
uot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">---<br style=3D"font-f=
amily:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">=C2=A0p=
oky/bitbake/lib/prserv/serv.py | 5 +++++<br style=3D"font-family:Roboto,&qu=
ot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">=C2=A01 file changed, 5=
 insertions(+)<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,He=
lvetica,Arial,sans-serif"><br style=3D"font-family:Roboto,&quot;Helvetica N=
eue&quot;,Helvetica,Arial,sans-serif">diff --git a/poky/bitbake/lib/prserv/=
serv.py b/poky/bitbake/lib/prserv/serv.py<br style=3D"font-family:Roboto,&q=
uot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">index 25dcf8a0e..f462f=
3dcc 100644<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helve=
tica,Arial,sans-serif">--- a/poky/bitbake/lib/prserv/serv.py<br style=3D"fo=
nt-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">+++=
 b/poky/bitbake/lib/prserv/serv.py<br style=3D"font-family:Roboto,&quot;Hel=
vetica Neue&quot;,Helvetica,Arial,sans-serif">@@ -4,6 +4,11 @@<br style=3D"=
font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"><=
br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,s=
ans-serif">=C2=A0import os,sys,logging<br style=3D"font-family:Roboto,&quot=
;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">=C2=A0import signal, time=
<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,=
sans-serif">+<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Hel=
vetica,Arial,sans-serif">+# Otherwise this fails when called from recipes w=
hich e.g. inherit python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) wit=
h:<br style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Aria=
l,sans-serif">+# No module named &#39;_sysconfigdata&#39;<br style=3D"font-=
family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">+if &#=
39;_PYTHON_SYSCONFIGDATA_NAME&#39; in os.environ:<br style=3D"font-family:R=
oboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">+=C2=A0 =C2=A0=
 del os.environ[&#39;_PYTHON_SYSCONFIGDATA_NAME&#39;]<br style=3D"font-fami=
ly:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif">=C2=A0from=
 xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler<br sty=
le=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-se=
rif">=C2=A0import threading<br style=3D"font-family:Roboto,&quot;Helvetica =
Neue&quot;,Helvetica,Arial,sans-serif">=C2=A0import queue<font color=3D"#88=
8888" style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Aria=
l,sans-serif"><br>--<br>2.29.1.341.ge80a0c044ae-goog</font><br></div>

--000000000000cb9eda05b2d108fe--
