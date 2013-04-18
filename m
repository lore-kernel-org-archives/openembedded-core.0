Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UStdV-0007j9-M7
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 20:32:49 +0200
Received: by mail-wi0-f172.google.com with SMTP id hq17so4844625wib.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=cwWnKuxlmXnJAEKAOZmzh7MrRcmYWHJOtaIG+dAISH8=;
	b=vZOAPbG7pbte4ntxUOmHV6DK8wJKrEfjrkgOh0Htby95zoR69CAF6Mac4JKNCSfLIt
	+upbxHkEkCJ1ng/iaEtN8EH1zS6G/iFIezXGx7KymEZ9pZX7zhsEk73RA7nj23gkEvxC
	UJfLn5Ly1EC+RyxL2exnaFhj9JVzU5dr4UBr0u/yo/ZvOanNJjObpqB7XedHCMgkSNjM
	xmmHxnuwBU2VWzA20sQptsbQSN+jnYGA/oFZzD5cDh3whI6nOVmVM8jUihit0AgcUb9m
	ir8Ljr92kU9GrZZ0ilKhkNruAb9xqhoT6h3Jj7ZFhAspOOyrsSNyF9ATIFa49D7olyov
	siwQ==
MIME-Version: 1.0
X-Received: by 10.194.178.100 with SMTP id cx4mr20729139wjc.47.1366308912341; 
	Thu, 18 Apr 2013 11:15:12 -0700 (PDT)
Received: by 10.194.243.137 with HTTP; Thu, 18 Apr 2013 11:15:12 -0700 (PDT)
In-Reply-To: <1366308596-21123-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1366308596-21123-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Thu, 18 Apr 2013 20:15:12 +0200
Message-ID: <CA+chaQf+nyQTenBWxo-O_qFyeeAowwWnO_8BbuhXoOR7SB=QUQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: depend on libgcrypt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2013 18:33:01 -0000
Content-Type: multipart/alternative; boundary=089e013d1be85fabe704daa695eb

--089e013d1be85fabe704daa695eb
Content-Type: text/plain; charset=UTF-8

I've seen the same build issue when rebuilding from sstate-cache, fix looks
good.


On Thu, Apr 18, 2013 at 8:09 PM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> Although libgcrypt support is optional, its development files are
> are always required to expand AM_PATH_LIBGCRYPT.  Build might fails else
> with
>
> | libtoolize: copying file `m4/lt~obsolete.m4'
> | configure.ac:446: warning: macro 'AM_PATH_LIBGCRYPT' not found in
> library
> | ...
> | configure.ac:446: error: possibly undefined macro: AM_PATH_LIBGCRYPT
> | autoreconf: .../autoconf failed with exit status: 1
> | + bbfatal 'autoreconf execution failed.'
> | + echo 'ERROR: autoreconf execution failed.'
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/recipes-core/systemd/systemd_199.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_199.bbb/meta/recipes-core/systemd/
> systemd_199.bb
> index 4fabcc9..2596bdf 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -11,7 +11,7 @@ PROVIDES = "udev"
>  PE = "1"
>  PR = "r3"
>
> -DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
> acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
> +DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
> acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 libgcrypt"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
>  SECTION = "base/shell"
> @@ -48,7 +48,7 @@ GTKDOC_DOCDIR = "${S}/docs/"
>
>  PACKAGECONFIG ??= "xz"
>  # Sign the journal for anti-tampering
> -PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
> +PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,,"
>  # Compress the journal
>  PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>
> --
> 1.8.1.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--089e013d1be85fabe704daa695eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve seen the same build issue when rebuilding from ss=
tate-cache, fix looks good.</div><div class=3D"gmail_extra"><br><br><div cl=
ass=3D"gmail_quote">On Thu, Apr 18, 2013 at 8:09 PM, Enrico Scholz <span di=
r=3D"ltr">&lt;<a href=3D"mailto:enrico.scholz@sigma-chemnitz.de" target=3D"=
_blank">enrico.scholz@sigma-chemnitz.de</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Although libgcrypt support is optional, its =
development files are<br>
are always required to expand AM_PATH_LIBGCRYPT. =C2=A0Build might fails el=
se<br>
with<br>
<br>
| libtoolize: copying file `m4/lt~obsolete.m4&#39;<br>
| <a href=3D"http://configure.ac:446" target=3D"_blank">configure.ac:446</a=
>: warning: macro &#39;AM_PATH_LIBGCRYPT&#39; not found in library<br>
| ...<br>
| <a href=3D"http://configure.ac:446" target=3D"_blank">configure.ac:446</a=
>: error: possibly undefined macro: AM_PATH_LIBGCRYPT<br>
| autoreconf: .../autoconf failed with exit status: 1<br>
| + bbfatal &#39;autoreconf execution failed.&#39;<br>
| + echo &#39;ERROR: autoreconf execution failed.&#39;<br>
<br>
Signed-off-by: Enrico Scholz &lt;<a href=3D"mailto:enrico.scholz@sigma-chem=
nitz.de">enrico.scholz@sigma-chemnitz.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" target=3D=
"_blank">systemd_199.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" ta=
rget=3D"_blank">systemd_199.bb</a> b/meta/recipes-core/systemd/<a href=3D"h=
ttp://systemd_199.bb" target=3D"_blank">systemd_199.bb</a><br>
index 4fabcc9..2596bdf 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" target=3D=
"_blank">systemd_199.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" target=3D=
"_blank">systemd_199.bb</a><br>
@@ -11,7 +11,7 @@ PROVIDES =3D &quot;udev&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
=C2=A0PR =3D &quot;r3&quot;<br>
<br>
-DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup tcp-wrappers glib-2.0&quot;<br>
+DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 libgcrypt&qu=
ot;<br>
=C2=A0DEPENDS +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;p=
am&#39;, &#39;libpam&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0SECTION =3D &quot;base/shell&quot;<br>
@@ -48,7 +48,7 @@ GTKDOC_DOCDIR =3D &quot;${S}/docs/&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;xz&quot;<br>
=C2=A0# Sign the journal for anti-tampering<br>
-PACKAGECONFIG[gcrypt] =3D &quot;--enable-gcrypt,--disable-gcrypt,libgcrypt=
&quot;<br>
+PACKAGECONFIG[gcrypt] =3D &quot;--enable-gcrypt,--disable-gcrypt,,&quot;<b=
r>
=C2=A0# Compress the journal<br>
=C2=A0PACKAGECONFIG[xz] =3D &quot;--enable-xz,--disable-xz,xz&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.1.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--089e013d1be85fabe704daa695eb--
