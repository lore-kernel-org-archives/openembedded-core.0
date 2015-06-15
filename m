Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 78C8B759DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 16:05:46 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so8232129qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 09:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VliT2fz1JKllkJamEUqRxJ/B/G8yKjF+r5+uTAg+Y4M=;
	b=Ze/BckaKJL4On19BeSbBJDbNZtdzm4PajKa3P+/HGaFbnj6t/EJVUqpxa8VIBOMARw
	mz8rx048hCrzUs/cPtvmvDASgWMgcC3tuw2NPzz1wvuOSs78HojbhLUW8OP3j48JJR8c
	pZNgBhJjwYPLi/A6VgjPkqZpFNOr2UJq696pLJXkcqMfPFhzQ2Cjth7si58lbsqgsjuw
	ONvSOU00kir2T/xmb9gy0Ip8ziI9OgmP9gtSs6dBJyuLX4ECLPfMzAKZ2JhABa5Claoq
	Fo4Ntxx45EPFjlHR6tiQax0U3nqMdU1FLl3Zw3bqMsb8ykxTH5afPBMmTzW97LAgkRzE
	HDUg==
X-Received: by 10.55.24.167 with SMTP id 39mr60634302qky.43.1434384348054;
	Mon, 15 Jun 2015 09:05:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.73 with HTTP; Mon, 15 Jun 2015 09:05:27 -0700 (PDT)
In-Reply-To: <1433193203.404.176.camel@linuxfoundation.org>
References: <1433193203.404.176.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 15 Jun 2015 09:05:27 -0700
X-Google-Sender-Auth: KtSFdl2nGP9Lrn1a2hzkYeGngdI
Message-ID: <CABcZANnyOcqK=X2vrUCyysjEZhh82uLjT5nVcQpeYZNJo5UoEA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base: Fix license checksum rebuild problems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jun 2015 16:05:49 -0000
Content-Type: multipart/alternative; boundary=001a11440e288988f2051890a198

--001a11440e288988f2051890a198
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2015 at 2:13 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> "MACHINE=3Dqemux86-64 bitbake init-ifupdown; MACHINE=3Dgenericx86-64 bitb=
ake
> init-ifupdown"
> shows a rebuild when it would be expected. The reason is a
> LIC_FILES_CHKSUM which
> contains file://${WORKDIR}, an absolute path which doesn't exist in the
> first build
> but does in the second, causing a signature change and a rebuild.
>
> Fix the problem by ignoring any file:// url which resolves since TMPDIR f=
or
> license file dependency purposes.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 99b512b..7093a19 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -97,6 +97,7 @@ PATH_prepend =3D "${@extra_path_elements(d)}"
>  def get_lic_checksum_file_list(d):
>      filelist =3D []
>      lic_files =3D d.getVar("LIC_FILES_CHKSUM", True) or ''
> +    tmpdir =3D d.getVar("TMPDIR", True)
>
>      urls =3D lic_files.split()
>      for url in urls:
> @@ -105,6 +106,8 @@ def get_lic_checksum_file_list(d):
>          try:
>              path =3D bb.fetch.decodeurl(url)[2]
>              if path[0] =3D=3D '/':
> +                if path.startswith(tmpdir):
> +                    continue
>

Hmm, this would probably never be a real issue, but this is using a string
startswith() without a path separator, meaning it=E2=80=99d match e.g.
/path/to/tmpfoo/ as well as /path/to/tmp/ :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11440e288988f2051890a198
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jun 1, 2015 at 2:13 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div id=3D":316" class=3D"a3s" style=3D"overflow:hidden">&quot;MACHI=
NE=3Dqemux86-64 <span class=3D"il">bitbake</span> init-ifupdown; MACHINE=3D=
genericx86-64 <span class=3D"il">bitbake</span> init-ifupdown&quot;<br>
shows a rebuild when it would be expected. The reason is a LIC_FILES_CHKSUM=
 which<br>
contains file://${WORKDIR}, an absolute path which doesn&#39;t exist in the=
 first build<br>
but does in the second, causing a signature change and a rebuild.<br>
<br>
Fix the problem by ignoring any file:// url which resolves since TMPDIR for=
<br>
license file dependency purposes.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br>
diff --git a/meta/classes/base.<span class=3D"il">bbclass</span> b/meta/cla=
sses/base.<span class=3D"il">bbclass</span><br>
index 99b512b..7093a19 100644<br>
--- a/meta/classes/base.<span class=3D"il">bbclass</span><br>
+++ b/meta/classes/base.<span class=3D"il">bbclass</span><br>
@@ -97,6 +97,7 @@ PATH_prepend =3D &quot;${@extra_path_elements(d)}&quot;<b=
r>
=C2=A0def get_lic_checksum_file_list(d):<br>
=C2=A0 =C2=A0 =C2=A0filelist =3D []<br>
=C2=A0 =C2=A0 =C2=A0lic_files =3D d.getVar(&quot;LIC_FILES_CHKSUM&quot;, Tr=
ue) or &#39;&#39;<br>
+=C2=A0 =C2=A0 tmpdir =3D d.getVar(&quot;TMPDIR&quot;, True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0urls =3D lic_files.split()<br>
=C2=A0 =C2=A0 =C2=A0for url in urls:<br>
@@ -105,6 +106,8 @@ def get_lic_checksum_file_list(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D <span class=3D"il"=
>bb</span>.fetch.decodeurl(url)[2]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if path[0] =3D=3D &#39;/&#3=
9;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if path.startswith=
(tmpdir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue</div></blockquote></div><br>Hmm, this would probably never be a real i=
ssue, but this is using a string startswith() without a path separator, mea=
ning it=E2=80=99d match e.g. /path/to/tmpfoo/ as well as /path/to/tmp/ :)<b=
r>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at ke=
rgoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer =
- Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11440e288988f2051890a198--
