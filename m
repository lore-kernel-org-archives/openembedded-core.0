Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web11.3162.1586206747477909741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 13:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=r8mivKo+;
 spf=pass (domain: blade-group.com, ip: 209.85.210.67, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f67.google.com with SMTP id v2so881710oto.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10U0SH5CTo+DI5YZO7YGCijDVqB5tFxZHB7I4Y6LmWM=;
        b=r8mivKo+CAC5aKjXktCnx8A7LoeQs8Kyycm1imI0PawWwdF99U2LvY+nD9LjW+/21+
         Nsjfmq3UQ9gcGSPGHgVstu3RFkZkzt8sXvoFWI+Yv5YBGuoKf8BAuCj6fTBH8wZKdbbb
         ObKH3kA9U1HbmqUrDt/pFyX7ToAL7iaxJMJYlONpsOtXVhl2J1/JOvTlhEO12ARQHAgB
         cvO9vyaR44DuQ78svqnJhdnnR3qcusX7uKDUMV31lN/Zpw8n0TUzKIfwY8EMsds5GSWi
         2ieGV6WbObmZ+dunVVgK1BAQwWEfZ96fOPoVltTjXm1i7Zq+TaSpYI2gnkErY0adiqBc
         Aagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10U0SH5CTo+DI5YZO7YGCijDVqB5tFxZHB7I4Y6LmWM=;
        b=ukg1HU2Z6lwrRmJARKuhNfeGfU1uJaTUYqYsvzh/ai5R05BV5/5JShUjyiIsBHMc62
         36V8wn7AnhEQV+kyZKcdUVxvdE3TlqTLVb+KeUn2023SfJUi/2qDsy8HMzVW6ceMDUv2
         4tQdmLftN1d+oYfIDFcg6RrJucW4IV2DOUAcGGW32MBTCOzoBK7vjytSQQQEtRev9/es
         AS20Bi1uuhIj5gRc/W0JKjvCJIDEtHDC6XqRRxfVQZBr/ftoo8ud2sEDBWf6760wluO3
         q3j/Hk2VrFj7dW0t4NSL1lklI6qVxXbH6P3pbQ/sAqnmn76LRBOhcsRodoMGaUMxvYQo
         MJRg==
X-Gm-Message-State: AGi0Puaq6ma1nWYjZGF9iSvR1ifHkIYgbZHfT7rmSiLYGJliXH6SacfZ
	0dT+aEI+3Jxorcs1eOQBGUs8LSfNCpqPe191Qhfv4w==
X-Google-Smtp-Source: APiQypKashTudoS6Q+PgNf5ym3qEDJA+A6f9Il9L049ViN/i6d2telAPsFKhpqdEYVI8INP5WwaWXh+QlweV3pXhaLM=
X-Received: by 2002:a9d:4f0:: with SMTP id 103mr18917203otm.336.1586206746743;
 Mon, 06 Apr 2020 13:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200406060014.78150-1-jbroadus@xevo.com> <3d20f00ac2d4f54f6bf4e67998df400548f0bfeb.camel@linuxfoundation.org>
 <ee3a15cb-afde-3b3f-59be-9c279313927c@xevo.com>
In-Reply-To: <ee3a15cb-afde-3b3f-59be-9c279313927c@xevo.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Mon, 6 Apr 2020 22:58:55 +0200
Message-ID: <CA+4=imZeFQwOUtfmD4AR=EJ_sSvqAZy_fiN6xPurTLB-cfBkLA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] curl: allow configuration of default CA bundle location
To: Jim Broadus <jbroadus@xevo.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Jim Broadus <jbroadus@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ae29ee05a2a5890e"

--000000000000ae29ee05a2a5890e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The problem motivating this patch may be the same that motivated a hack of
mine which I never
cleaned up for submit: at least in some early warrior versions curl was
attempting to use cacerts
from the host.

This is a hand-edited copypaste and may not apply cleanly, but you should
get the idea: make it
so curl-native uses its own certs and not the host ones.

commit fde6fcfaae0021d33e917cae81581dbfdb6618de
Author: Yann Dirson <yann@blade-group.com>
Date:   Mon Jun 24 18:18:06 2019 +0200

    curl-native: use a wrapper script to locate cacert

diff --git a/meta-blade/recipes-support/curl/curl_%.bbappend
b/meta-blade/recipes-support/curl/curl_%.bbappend
index 01b203e..650a764 100644
--- a/meta-blade/recipes-support/curl/curl_%.bbappend
+++ b/meta-blade/recipes-support/curl/curl_%.bbappend
@@ -1,3 +1,20 @@
+# install a wrapper script to locate cacert
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
+SRC_URI +=3D "file://curl.in"
+
+do_install_append_class-native () {
+    mv ${D}${bindir}/curl ${D}${bindir}/curl.real
+    sed s:@STAGING@:${STAGING_DIR_NATIVE}: < ${WORKDIR}/curl.in >
${D}${bindir}/curl
+    chmod 755 ${D}${bindir}/curl
+}
+
+FILES_${BPN}-native +=3D "${bindir}/curl.real"
diff --git a/meta-blade/recipes-support/curl/files/curl.in
b/meta-blade/recipes-support/curl/files/curl.in
new file mode 100644
index 0000000..cfb4456
--- /dev/null
+++ b/meta-blade/recipes-support/curl/files/curl.in
@@ -0,0 +1,2 @@
+#!/bin/sh
+exec $0.real --cacert @STAGING@/etc/ssl/certs/ca-certificates.crt "$@"

Le lun. 6 avr. 2020 =C3=A0 22:36, Jim Broadus <jbroadus@xevo.com> a =C3=A9=
crit :

> On 4/6/20 5:00 AM, Richard Purdie wrote:
> > On Sun, 2020-04-05 at 23:00 -0700, Jim Broadus wrote:
> >> Add a CA_BUNDLE variable to set the built-in CA bundle location. By
> default,
> >> don't set anything for curl-native since that target's sysconfdir is =
a
> >> location in the recipe's native sysroot directory.
> >>
> >> Signed-off-by: Jim Broadus <jbroadus@xevo.com>
> >
> > That is a huge change in behaviour with potentially quite serious side
> > effects. As far as I remember we deliberately make our native utils
> > self contained rather than relying on the host system (which may or ma=
y
> > not have cert files).
> >
> > We point at sysconfdir in the native case since we install ca-
> > certificates there if I remember correctly?
> >
> > Cheers,
> >
> > Richard
> >
>
> Hi Richard. Currently, I don't see the certs installed in the native
> sysroot, so maybe this was broken recently. If that was the intended
> behavior, I can look for a fix for that instead.
>
> Thanks,
> Jim
>
>=20
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--000000000000ae29ee05a2a5890e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>The problem motivating this patch ma=
y be the same that motivated a hack of mine which I never</div><div>cleaned=
 up for submit: at least in some early warrior versions curl was attempting=
 to use cacerts</div><div>from the host.</div><div><br></div><div>This is a=
 hand-edited copypaste and may not apply cleanly, but you should get the id=
ea: make it</div><div>so curl-native uses its own certs and not the host on=
es.<br></div><div><br></div><div>commit fde6fcfaae0021d33e917cae81581dbfdb6=
618de</div>Author: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com">=
yann@blade-group.com</a>&gt;<br>Date: =C2=A0 Mon Jun 24 18:18:06 2019 +0200=
<br><br>=C2=A0 =C2=A0 curl-native: use a wrapper script to locate cacert<br=
><br>diff --git a/meta-blade/recipes-support/curl/curl_%.bbappend b/meta-bl=
ade/recipes-support/curl/curl_%.bbappend<br>index 01b203e..650a764 100644<b=
r>--- a/meta-blade/recipes-support/curl/curl_%.bbappend<br>+++ b/meta-blade=
/recipes-support/curl/curl_%.bbappend<br>@@ -1,3 +1,20 @@<br>+# install a w=
rapper script to locate cacert<br>+<br>+FILESEXTRAPATHS_prepend :=3D &quot;=
${THISDIR}/files:&quot;<br>+SRC_URI +=3D &quot;file://<a href=3D"http://cur=
l.in">curl.in</a>&quot;<br>+<br>+do_install_append_class-native () {<br>+ =
=C2=A0 =C2=A0mv ${D}${bindir}/curl ${D}${bindir}/curl.real<br>+ =C2=A0 =C2=
=
=A0sed s:@STAGING@:${STAGING_DIR_NATIVE}: &lt; ${WORKDIR}/<a href=3D"http:=
//curl.in">curl.in</a> &gt; ${D}${bindir}/curl<br>+ =C2=A0 =C2=A0chmod 755 =
${D}${bindir}/curl<br>+}<br>+<br>+FILES_${BPN}-native +=3D &quot;${bindir}/=
curl.real&quot;<br>diff --git a/meta-blade/recipes-support/curl/files/<a hr=
ef=3D"http://curl.in">curl.in</a> b/meta-blade/recipes-support/curl/files/<=
a href=3D"http://curl.in">curl.in</a><br>new file mode 100644<br>index 0000=
000..cfb4456<br>--- /dev/null<br>+++ b/meta-blade/recipes-support/curl/file=
s/<a href=3D"http://curl.in">curl.in</a><br>@@ -0,0 +1,2 @@<br>+#!/bin/sh<b=
r>+exec $0.real --cacert @STAGING@/etc/ssl/certs/ca-certificates.crt &quot;=
$@&quot;<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Le=C2=A0lun. 6 avr. 2020 =C3=A0=C2=A022:36, Jim Broadus &lt;<a =
href=3D"mailto:jbroadus@xevo.com">jbroadus@xevo.com</a>&gt; a =C3=A9crit=C2=
=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 4/6/20 =
5:00 AM, Richard Purdie wrote:<br>
&gt; On Sun, 2020-04-05 at 23:00 -0700, Jim Broadus wrote:<br>
&gt;&gt; Add a CA_BUNDLE variable to set the built-in CA bundle location. =
By default,<br>
&gt;&gt; don&#39;t set anything for curl-native since that target&#39;s sy=
sconfdir is a<br>
&gt;&gt; location in the recipe&#39;s native sysroot directory.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jim Broadus &lt;<a href=3D"mailto:jbroadus@xevo.co=
m" target=3D"_blank">jbroadus@xevo.com</a>&gt;<br>
&gt; <br>
&gt; That is a huge change in behaviour with potentially quite serious sid=
e<br>
&gt; effects. As far as I remember we deliberately make our native utils<b=
r>
&gt; self contained rather than relying on the host system (which may or m=
ay<br>
&gt; not have cert files).<br>
&gt; <br>
&gt; We point at sysconfdir in the native case since we install ca-<br>
&gt; certificates there if I remember correctly?<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
<br>
Hi Richard. Currently, I don&#39;t see the certs installed in the native <=
br>
sysroot, so maybe this was broken recently. If that was the intended <br>
behavior, I can look for a fix for that instead.<br>
<br>
Thanks,<br>
Jim<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div></div>

--000000000000ae29ee05a2a5890e--
