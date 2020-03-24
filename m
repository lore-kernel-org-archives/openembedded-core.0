Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.822.1585070765096808371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 10:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=elLjW6SB;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: a.manache@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id i24so21679361eds.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 10:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FqRFi0iwgc3BTolorvK/VSFfH3zid7MATZF/dinvlFg=;
        b=elLjW6SBZK5MgdKaKrSCIBirG8mv01vqMUEQ4QW0ubVoPA1n+f3MfzcU5gT499mCtw
         rnJUeFkHveyVtsJDCWtHV+YIUE+cqrdgOhOfXKo1T1La4uG4b8tah96Yb+l9qdCRqSxH
         fbPsjoqfWvWEgtc0VbRMp8ZLdNUYnP6fBHPU1lmOweqF0g0WapE3/LYh0NTJ1/go2+GW
         RYdmFmaNm6EYMDu3PgD5DNmc+fHoi1czOgREXziS3cNMyH2AX70A0NDGE39/BYlvrK6e
         cQH87sIEMVjt3uczyfJ65q2GEu7dAqtN5U8p/fHR58SuKVu4YknJtgF6YE3UEncZ2sCm
         Fp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FqRFi0iwgc3BTolorvK/VSFfH3zid7MATZF/dinvlFg=;
        b=giXodrZGWgJYs8ABaVNwtLL68NF2RW98JpD/l6MtmP9CCr0xCSl4reR/wjJpwW/WTW
         C9OGo4eZ5AZ2q2xJQsvr+U6sLClELIEuD6EleiAYkPpF1VKFDeIsauW5wMundcSeZDyY
         84J01y7ro4c2JOZ/l5pnzNOnbsgdYJaQTEP909fs22Q7D8/jLzccUIswanYBVQhL6zCV
         BEkIMfp/v68+PQARyWeoMQVRd/w5WfFdB9qCCFBk+1Kqpn2HQb7Iyv992GSlIMc45DRc
         CTI8Ggc+95dMyrjbTSA5NcnGQWTiDPnp1I1znveMKSRNCCCBqWLhwcGDnaAL9qWq+qA2
         InXw==
X-Gm-Message-State: ANhLgQ0UAP5BSMJgpwMRV8cb8sIdIC7Clxy3jOaqI0G+7cNTwOJe88vH
	5tUlE4SuWvB9Pk6Ima4ADjPiTcQ55MWkYQFsN2I=
X-Google-Smtp-Source: ADFU+vvd8wdwoviTWEHFYgNwenhodLcPZ73Yt4k+Uw1Hyf0/yfP7wi7SwEHZAZn3lwgx1mP4cfLK0doIvZL8pvzXgjM=
X-Received: by 2002:a17:906:aac3:: with SMTP id kt3mr7274498ejb.16.1585070763463;
 Tue, 24 Mar 2020 10:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200324170259.3206-1-tom.hochstein@nxp.com>
In-Reply-To: <20200324170259.3206-1-tom.hochstein@nxp.com>
From: "Antoine Manache" <a.manache@gmail.com>
Date: Tue, 24 Mar 2020 18:25:46 +0100
Message-ID: <CAMu9SpJmwRw9gmCJS4NkdhMuyNdVij_-C4AsyeLs+zb6+pV2fA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] security_flags.inc: fix flags missing from SDK toolchain
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ccd80405a19d0bcd"

--000000000000ccd80405a19d0bcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've already sent this patch few months ago but not taken into account yet.
AM

From : Antoine Manache <a.manache@gmail.com>
Date: mer. 20 nov. 2019 at 16:44
Subject: [OE-core] [PATCH v2] sdk: environment script doesn't set security
options in CC and LDFLAGS variables
To: <openembedded-core@lists.openembedded.org>

When building a SDK from a DISTRO with security flags enabled, options
added to
CC and LDFLAGS are not replicated in the SDK environment script.
This could lead to some situations where an application compiled with
the SDK and having some security weaknesses correctly runs on target but
crashes once integrated to the core image built with the full Yocto
stack.

Signed-off-by: Antoine Manache <a.manache@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc
b/meta/conf/distro/include/security_flags.inc
index 620978a8ed..329482bfa3 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -56,7 +56,9 @@ SECURITY_STRINGFORMAT_pn-busybox =3D ""
 SECURITY_STRINGFORMAT_pn-gcc =3D ""

 TARGET_CC_ARCH_append_class-target =3D " ${SECURITY_CFLAGS}"
+TARGET_CC_ARCH_append_class-cross-canadian =3D " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target =3D " ${SECURITY_LDFLAGS}"
+TARGET_LDFLAGS_append_class-cross-canadian =3D " ${SECURITY_LDFLAGS}"

 SECURITY_STACK_PROTECTOR_pn-gcc-runtime =3D ""
 SECURITY_STACK_PROTECTOR_pn-glibc =3D ""

--
2.11.0

Le mar. 24 mars 2020 =C3=A0 18:03, Tom Hochstein <tom.hochstein@nxp.com> a
=C3=A9crit :

> The security flags were missing from the SDK toolchain
> because they were added specifically to class-target.
> Add them to class-cross-canadian as well.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/distro/include/security_flags.inc
> b/meta/conf/distro/include/security_flags.inc
> index aaf04e9e59..568d03693c 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -57,6 +57,8 @@ SECURITY_STRINGFORMAT_pn-gcc =3D ""
>
>  TARGET_CC_ARCH_append_class-target =3D " ${SECURITY_CFLAGS}"
>  TARGET_LDFLAGS_append_class-target =3D " ${SECURITY_LDFLAGS}"
> +TARGET_CC_ARCH_append_class-cross-canadian =3D " ${SECURITY_CFLAGS}"
> +TARGET_LDFLAGS_append_class-cross-canadian =3D " ${SECURITY_LDFLAGS}"
>
>  SECURITY_STACK_PROTECTOR_pn-gcc-runtime =3D ""
>  SECURITY_STACK_PROTECTOR_pn-glibc =3D ""
> --
> 2.17.1
>
>=20
>

--000000000000ccd80405a19d0bcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve already sent this patch few months ago but n=
ot taken into account yet.<br></div><div>AM<br></div><div><br></div><div><d=
iv dir=3D"ltr" class=3D"gmail_attr">From : <span class=3D"gmail_sendername"=
>Antoine Manache</span> <span dir=3D"auto">&lt;<a href=3D"mailto:a.manache@=
gmail.com">a.manache@gmail.com</a>&gt;</span><br>Date: mer. 20 nov. 2019 at=
 16:44<br>Subject: [OE-core] [PATCH v2] sdk: environment script doesn&#39;t=
 set security options in CC and  LDFLAGS variables<br>To:  &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.ope=
nembedded.org</a>&gt;<br></div><br><div dir=3D"auto"><p style=3D"margin-top=
:0px;margin-bottom:0px;font-family:calibri,arial,helvetica,sans-serif;font-=
size:16px"><span style=3D"font-family:&quot;consolas&quot;,monospace;font-s=
ize:10pt">When building a SDK from a DISTRO with security flags enabled, op=
tions added to</span><br style=3D"font-family:&quot;consolas&quot;,monospac=
e;font-size:10pt"><span style=3D"font-family:&quot;consolas&quot;,monospace=
;font-size:10pt">CC and LDFLAGS are not replicated in the SDK environment s=
cript.</span><br style=3D"font-family:&quot;consolas&quot;,monospace;font-s=
ize:10pt"><span style=3D"font-family:&quot;consolas&quot;,monospace;font-si=
ze:10pt">This could lead to some situations where an application compiled w=
ith</span><br style=3D"font-family:&quot;consolas&quot;,monospace;font-size=
:10pt"><span style=3D"font-family:&quot;consolas&quot;,monospace;font-size:=
10pt">the SDK and having some security weaknesses correctly runs on target =
but</span><br style=3D"font-family:&quot;consolas&quot;,monospace;font-size=
:10pt"><span style=3D"font-family:&quot;consolas&quot;,monospace;font-size:=
10pt">crashes once integrated to the core image built with the full Yocto</=
span><br style=3D"font-family:&quot;consolas&quot;,monospace;font-size:10pt=
"><span style=3D"font-family:&quot;consolas&quot;,monospace;font-size:10pt"=
>stack.</span><br style=3D"font-family:&quot;consolas&quot;,monospace;font-=
size:10pt"><br style=3D"font-family:&quot;consolas&quot;,monospace;font-siz=
e:10pt"><span style=3D"font-family:&quot;consolas&quot;,monospace;font-size=
:10pt">Signed-off-by: Antoine Manache &lt;<a href=3D"mailto:a.manache@gmail=
.com" style=3D"text-decoration-line:none;color:rgb(66,133,244)" target=3D"_=
blank">a.manache@gmail.com</a>&gt;</span><br style=3D"font-family:&quot;con=
solas&quot;,monospace;font-size:10pt"><span style=3D"font-family:&quot;cons=
olas&quot;,monospace;font-size:10pt">---</span><br style=3D"font-family:&qu=
ot;consolas&quot;,monospace;font-size:10pt"><span style=3D"font-family:&quo=
t;consolas&quot;,monospace;font-size:10pt">=C2=A0meta/conf/distro/include/s=
ecurity_flags.inc | 2 ++</span><br style=3D"font-family:&quot;consolas&quot=
;,monospace;font-size:10pt"><span style=3D"font-family:&quot;consolas&quot;=
,monospace;font-size:10pt">=C2=A01 file changed, 2 insertions(+)</span><br =
style=3D"font-family:&quot;consolas&quot;,monospace;font-size:10pt"><br sty=
le=3D"font-family:&quot;consolas&quot;,monospace;font-size:10pt"><span styl=
e=3D"font-family:&quot;consolas&quot;,monospace;font-size:10pt">diff --git =
a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/se=
curity_flags.inc</span><br style=3D"font-family:&quot;consolas&quot;,monosp=
ace;font-size:10pt"><span style=3D"font-family:&quot;consolas&quot;,monospa=
ce;font-size:10pt">index 620978a8ed..329482bfa3 100644</span><br style=3D"f=
ont-family:&quot;consolas&quot;,monospace;font-size:10pt"><span style=3D"fo=
nt-family:&quot;consolas&quot;,monospace;font-size:10pt">--- a/meta/conf/di=
stro/include/security_flags.inc</span><br style=3D"font-family:&quot;consol=
as&quot;,monospace;font-size:10pt"><span style=3D"font-family:&quot;consola=
s&quot;,monospace;font-size:10pt">+++ b/meta/conf/distro/include/security_f=
lags.inc</span><br style=3D"font-family:&quot;consolas&quot;,monospace;font=
-size:10pt"><span style=3D"font-family:&quot;consolas&quot;,monospace;font-=
size:10pt">@@ -56,7 +56,9 @@ SECURITY_STRINGFORMAT_pn-busybox =3D &quot;&qu=
ot;</span><br style=3D"font-family:&quot;consolas&quot;,monospace;font-size=
:10pt"><span style=3D"font-family:&quot;consolas&quot;,monospace;font-size:=
10pt">=C2=A0SECURITY_STRINGFORMAT_pn-gcc =3D &quot;&quot;</span><br style=
=3D"font-family:&quot;consolas&quot;,monospace;font-size:10pt"><span style=
=
=3D"font-family:&quot;consolas&quot;,monospace;font-size:10pt">=C2=A0</spa=
n><br style=3D"font-family:&quot;consolas&quot;,monospace;font-size:10pt"><=
span style=3D"font-family:&quot;consolas&quot;,monospace;font-size:10pt">=
=C2=A0TARGET_CC_ARCH_append_class-target =3D &quot; ${SECURITY_CFLAGS}&quo=
t;</span><br style=3D"font-family:&quot;consolas&quot;,monospace;font-size:=
10pt"><span style=3D"font-family:&quot;consolas&quot;,monospace;font-size:1=
0pt">+TARGET_CC_ARCH_append_class-cross-canadian =3D &quot; ${SECURITY_CFLA=
GS}&quot;</span><br style=3D"font-family:&quot;consolas&quot;,monospace;fon=
t-size:10pt"><span style=3D"font-family:&quot;consolas&quot;,monospace;font=
-size:10pt">=C2=A0TARGET_LDFLAGS_append_class-target =3D &quot; ${SECURITY_=
LDFLAGS}&quot;</span><br style=3D"font-family:&quot;consolas&quot;,monospac=
e;font-size:10pt"><span style=3D"font-family:&quot;consolas&quot;,monospace=
;font-size:10pt">+TARGET_LDFLAGS_append_class-cross-canadian =3D &quot; ${S=
ECURITY_LDFLAGS}&quot;</span><br style=3D"font-family:&quot;consolas&quot;,=
monospace;font-size:10pt"><span style=3D"font-family:&quot;consolas&quot;,m=
onospace;font-size:10pt">=C2=A0</span><br style=3D"font-family:&quot;consol=
as&quot;,monospace;font-size:10pt"><span style=3D"font-family:&quot;consola=
s&quot;,monospace;font-size:10pt">=C2=A0SECURITY_STACK_PROTECTOR_pn-gcc-run=
time =3D &quot;&quot;</span><br style=3D"font-family:&quot;consolas&quot;,m=
onospace;font-size:10pt"><span style=3D"font-family:&quot;consolas&quot;,mo=
nospace;font-size:10pt">=C2=A0SECURITY_STACK_PROTECTOR_pn-glibc =3D &quot;&=
quot;</span></p><div dir=3D"auto" style=3D"color:rgb(136,136,136);font-fami=
ly:calibri,arial,helvetica,sans-serif;font-size:16px"><br style=3D"font-fam=
ily:&quot;consolas&quot;,monospace;font-size:10pt"><span style=3D"font-fami=
ly:&quot;consolas&quot;,monospace;font-size:10pt">--</span><br style=3D"fon=
t-family:&quot;consolas&quot;,monospace;font-size:10pt"><span style=3D"font=
-family:&quot;consolas&quot;,monospace;font-size:10pt">2.11.0</span></div><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">Le=C2=A0mar. 24 mars 2020 =C3=A0=C2=A018:03, Tom Hochstein &lt;<a href=
=
=3D"mailto:tom.hochstein@nxp.com">tom.hochstein@nxp.com</a>&gt; a =C3=A9cr=
it=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The se=
curity flags were missing from the SDK toolchain<br>
because they were added specifically to class-target.<br>
Add them to class-cross-canadian as well.<br>
<br>
Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.com" =
target=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/security_flags.inc | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distr=
o/include/security_flags.inc<br>
index aaf04e9e59..568d03693c 100644<br>
--- a/meta/conf/distro/include/security_flags.inc<br>
+++ b/meta/conf/distro/include/security_flags.inc<br>
@@ -57,6 +57,8 @@ SECURITY_STRINGFORMAT_pn-gcc =3D &quot;&quot;<br>
<br>
=C2=A0TARGET_CC_ARCH_append_class-target =3D &quot; ${SECURITY_CFLAGS}&quo=
t;<br>
=C2=A0TARGET_LDFLAGS_append_class-target =3D &quot; ${SECURITY_LDFLAGS}&qu=
ot;<br>
+TARGET_CC_ARCH_append_class-cross-canadian =3D &quot; ${SECURITY_CFLAGS}&=
quot;<br>
+TARGET_LDFLAGS_append_class-cross-canadian =3D &quot; ${SECURITY_LDFLAGS}=
&quot;<br>
<br>
=C2=A0SECURITY_STACK_PROTECTOR_pn-gcc-runtime =3D &quot;&quot;<br>
=C2=A0SECURITY_STACK_PROTECTOR_pn-glibc =3D &quot;&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000ccd80405a19d0bcd--
