Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rd7KL-0000UX-3W
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 22:34:25 +0100
Received: by eaal1 with SMTP id l1so6189520eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 13:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=uKwSCIaxNoQ1OIIjAcAA13l7N0gH1HfO7NkfzD5d/Lo=;
	b=bOGNajWSqyC3+n1E1bnYuh0Ag2sv6EskvSA9Cd05jDEJLeRF/gMSjEEY4yKfZzAvms
	jBx4mEmYZOJdgQeDGkXHCZlY59xSvofCJrETJq41I3HpV7WW1URTmFOnWtpA3eCvqdWd
	YK6HIiBj/bsjD2jFevcFBy5tqaBQ/CBhcYW1o=
MIME-Version: 1.0
Received: by 10.204.41.66 with SMTP id n2mr1466334bke.77.1324416440857; Tue,
	20 Dec 2011 13:27:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Tue, 20 Dec 2011 13:27:20 -0800 (PST)
In-Reply-To: <90fd35195c25adfe591493ef5863f0b0014d944e.1324407759.git.otavio@ossystems.com.br>
References: <cover.1324407759.git.otavio@ossystems.com.br>
	<90fd35195c25adfe591493ef5863f0b0014d944e.1324407759.git.otavio@ossystems.com.br>
Date: Tue, 20 Dec 2011 19:27:20 -0200
X-Google-Sender-Auth: ToubGs4lDbpalOB-EVUKdlTYPFA
Message-ID: <CAP9ODKoXB-DX7-DWtgdGmRea5TXX+6_XE5KmhVxfYMqo_c8i5A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/9] udev: skip mounting /dev on tmpfs if it is on devtmpfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2011 21:34:25 -0000
Content-Type: multipart/alternative; boundary=bcaec5540aa47df3a304b48cbb6b

--bcaec5540aa47df3a304b48cbb6b
Content-Type: text/plain; charset=ISO-8859-1

A fixed patch for this one is going to be send.

On Tue, Dec 20, 2011 at 17:04, Otavio Salvador <otavio@ossystems.com.br>wrote:

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-core/udev/udev/init   |    2 +-
>  meta/recipes-core/udev/udev_164.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev/init
> b/meta/recipes-core/udev/udev/init
> index edc3c9a..0b25b07 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -28,7 +28,7 @@ export ACTION=add
>  echo -n "Starting udev"
>
>  # mount the tmpfs on /dev, if not already done
> -LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts
> && {
> +LANG=C awk '$2 == "/dev" && $3 == "tmpfs" || $3 == "devtmpfs") { exit 1
> }' /proc/mounts && {
>        mount -n -o mode=0755 -t tmpfs none "/dev"
>        mkdir -m 0755 /dev/pts
>        mkdir -m 1777 /dev/shm
> diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/
> udev_164.bb
> index 3e4e402..f952c90 100644
> --- a/meta/recipes-core/udev/udev_164.bb
> +++ b/meta/recipes-core/udev/udev_164.bb
> @@ -1,6 +1,6 @@
>  include udev.inc
>
> -PR = "r7"
> +PR = "r8"
>
>  SRC_URI += "file://udev-166-v4l1-1.patch"
>
> --
> 1.7.2.5
>
>


-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--bcaec5540aa47df3a304b48cbb6b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

A fixed patch for this one is going to be send.<br><br><div class=3D"gmail_=
quote">On Tue, Dec 20, 2011 at 17:04, Otavio Salvador <span dir=3D"ltr">&lt=
;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;=
</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Otavio Salvador &lt;<a href=
=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;<br>
---<br>
=A0meta/recipes-core/udev/udev/init =A0 | =A0 =A02 +-<br>
=A0meta/recipes-core/udev/<a href=3D"http://udev_164.bb" target=3D"_blank">=
udev_164.bb</a> | =A0 =A02 +-<br>
=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev=
/init<br>
index edc3c9a..0b25b07 100644<br>
--- a/meta/recipes-core/udev/udev/init<br>
+++ b/meta/recipes-core/udev/udev/init<br>
@@ -28,7 +28,7 @@ export ACTION=3Dadd<br>
=A0echo -n &quot;Starting udev&quot;<br>
<br>
=A0# mount the tmpfs on /dev, if not already done<br>
-LANG=3DC awk &quot;\$2 =3D=3D \&quot;/dev\&quot; &amp;&amp; \$4 =3D=3D \&q=
uot;tmpfs\&quot; { exit 1 }&quot; /proc/mounts &amp;&amp; {<br>
+LANG=3DC awk &#39;$2 =3D=3D &quot;/dev&quot; &amp;&amp; $3 =3D=3D &quot;tm=
pfs&quot; || $3 =3D=3D &quot;devtmpfs&quot;) { exit 1 }&#39; /proc/mounts &=
amp;&amp; {<br>
 =A0 =A0 =A0 =A0mount -n -o mode=3D0755 -t tmpfs none &quot;/dev&quot;<br>
 =A0 =A0 =A0 =A0mkdir -m 0755 /dev/pts<br>
 =A0 =A0 =A0 =A0mkdir -m 1777 /dev/shm<br>
diff --git a/meta/recipes-core/udev/<a href=3D"http://udev_164.bb" target=
=3D"_blank">udev_164.bb</a> b/meta/recipes-core/udev/<a href=3D"http://udev=
_164.bb" target=3D"_blank">udev_164.bb</a><br>
index 3e4e402..f952c90 100644<br>
--- a/meta/recipes-core/udev/<a href=3D"http://udev_164.bb" target=3D"_blan=
k">udev_164.bb</a><br>
+++ b/meta/recipes-core/udev/<a href=3D"http://udev_164.bb" target=3D"_blan=
k">udev_164.bb</a><br>
@@ -1,6 +1,6 @@<br>
=A0include udev.inc<br>
<br>
-PR =3D &quot;r7&quot;<br>
+PR =3D &quot;r8&quot;<br>
<br>
=A0SRC_URI +=3D &quot;file://udev-166-v4l1-1.patch&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.2.5<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--bcaec5540aa47df3a304b48cbb6b--
