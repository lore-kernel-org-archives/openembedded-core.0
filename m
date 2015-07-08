Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id DB933734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 14:12:30 +0000 (UTC)
Received: by qget71 with SMTP id t71so100246692qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 07:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zbPegmgiXkXh9WwPZX1DknqDHfN6UAgsZFABisdcX5Q=;
	b=BkcvCfhI4mI3OUrtf16SV4Cn590D6770g19AskOnQu++KnywBB0YLvnq5rlTh5eWgP
	awdEcJKbBCDnd1aQdfdvvoPUzx26ch8LyxVJUjG1ZFwi7WJvsGTePuXzU8Pm0IZKbOFr
	hC9u+8pu2H0mHzl5owYn8000KblN0TsuDHck4Qu087tU3OLWRixhx0TfQwQNyZmP0bSL
	e/nJ9I+CbboRLPxMB+EE8sIGCGvtL3PA2WSHj8NhurNwWlRlwBfxNdRJypJjOsAmZrb8
	coHlf4xNxyKiiDGaGZ27DfvYxXfMlMw5mnIvKUOMrbRXIXj133k+bh/GKURBKP6i34ze
	+SSQ==
X-Gm-Message-State: ALoCoQm3qqzAJ0Oz74bkYWgXvzT/nNxrC/u10fKvPpIqRJe0Mtvz8Xmw+kzFtiEkg3fiYZUqW+dJ
X-Received: by 10.140.196.129 with SMTP id r123mr17348735qha.93.1436364750414; 
	Wed, 08 Jul 2015 07:12:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 8 Jul 2015 07:12:10 -0700 (PDT)
In-Reply-To: <1436340750-18379-1-git-send-email-wenzong.fan@windriver.com>
References: <1436340750-18379-1-git-send-email-wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Jul 2015 15:12:10 +0100
Message-ID: <CAJTo0LbWB--Pgd9WT_u6R=vcQz65G54YXdjJ2Tw-DwU3VbpbnA@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix packet discards HTTP redirect.
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
X-List-Received-Date: Wed, 08 Jul 2015 14:12:32 -0000
Content-Type: multipart/alternative; boundary=001a11433952b7825a051a5dba26

--001a11433952b7825a051a5dba26
Content-Type: text/plain; charset=UTF-8

As per our commit guidelines, the commit message needs to start with the
name of the recipe that was modified.

Ross

On 8 July 2015 at 08:32, <wenzong.fan@windriver.com> wrote:

> From: Li Wang <li.wang@windriver.com>
>
> Disconnect the connection by poll() timeout.
> If timeout=0 and apr_wait_for_io_or_timeout()=APR_TIMEUP then
> apr_socket_recv() returns EAGAIN.
>
> Signed-off-by: Noriaki Yoshitane <yoshitane.nrs@cnt.ncos.nec.co.jp>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>  .../apr/Fix-packet-discards-HTTP-redirect.patch    | 32
> ++++++++++++++++++++++
>  meta/recipes-support/apr/apr_1.5.2.bb              |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644
> meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
>
> diff --git
> a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
> b/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
> new file mode 100644
> index 0000000..6805b8b
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch
> @@ -0,0 +1,32 @@
> +Fix packet discards HTTP redirect.
> +
> +Disconnect the connection by poll() timeout.
> +If timeout=0 and apr_wait_for_io_or_timeout()=APR_TIMEUP then
> +apr_socket_recv() returns EAGAIN.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Noriaki Yoshitane <yoshitane.nrs@cnt.ncos.nec.co.jp>
> +Signed-off-by: Li Wang <li.wang@windriver.com>
> +---
> + network_io/unix/sendrecv.c |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/network_io/unix/sendrecv.c b/network_io/unix/sendrecv.c
> +index c133a26..e8faf15 100644
> +--- a/network_io/unix/sendrecv.c
> ++++ b/network_io/unix/sendrecv.c
> +@@ -85,6 +85,10 @@ apr_status_t apr_socket_recv(apr_socket_t *sock, char
> *buf, apr_size_t *len)
> +                       && (sock->timeout > 0)) {
> + do_select:
> +         arv = apr_wait_for_io_or_timeout(NULL, sock, 1);
> ++        if ((arv == APR_TIMEUP) && (sock->timeout == 0)) {
> ++            *len = 0;
> ++            return EAGAIN;
> ++        }
> +         if (arv != APR_SUCCESS) {
> +             *len = 0;
> +             return arv;
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-support/apr/apr_1.5.2.bb
> b/meta/recipes-support/apr/apr_1.5.2.bb
> index aac6276..c1f7f38 100644
> --- a/meta/recipes-support/apr/apr_1.5.2.bb
> +++ b/meta/recipes-support/apr/apr_1.5.2.bb
> @@ -15,6 +15,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
>             file://configfix.patch \
>             file://run-ptest \
>             file://upgrade-and-fix-1.5.1.patch \
> +           file://Fix-packet-discards-HTTP-redirect.patch \
>  "
>
>  SRC_URI[md5sum] = "4e9769f3349fe11fc0a5e1b224c236aa"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11433952b7825a051a5dba26
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As per our commit guidelines, the commit message needs to =
start with the name of the recipe that was modified.<div><br></div><div>Ros=
s</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 8=
 July 2015 at 08:32,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenzong.fan@w=
indriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">From: Li Wang &lt;<a href=3D"mailto:=
li.wang@windriver.com">li.wang@windriver.com</a>&gt;<br>
<br>
Disconnect the connection by poll() timeout.<br>
If timeout=3D0 and apr_wait_for_io_or_timeout()=3DAPR_TIMEUP then<br>
apr_socket_recv() returns EAGAIN.<br>
<br>
Signed-off-by: Noriaki Yoshitane &lt;<a href=3D"mailto:yoshitane.nrs@cnt.nc=
os.nec.co.jp">yoshitane.nrs@cnt.ncos.nec.co.jp</a>&gt;<br>
Signed-off-by: Li Wang &lt;<a href=3D"mailto:li.wang@windriver.com">li.wang=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../apr/Fix-packet-discards-HTTP-redirect.patch=C2=A0 =C2=A0 | 32 +++=
+++++++++++++++++++<br>
=C2=A0meta/recipes-support/apr/<a href=3D"http://apr_1.5.2.bb" rel=3D"noref=
errer" target=3D"_blank">apr_1.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 33 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/apr/apr/Fix-packet-discards-H=
TTP-redirect.patch<br>
<br>
diff --git a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect=
.patch b/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.pat=
ch<br>
new file mode 100644<br>
index 0000000..6805b8b<br>
--- /dev/null<br>
+++ b/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patch<=
br>
@@ -0,0 +1,32 @@<br>
+Fix packet discards HTTP redirect.<br>
+<br>
+Disconnect the connection by poll() timeout.<br>
+If timeout=3D0 and apr_wait_for_io_or_timeout()=3DAPR_TIMEUP then<br>
+apr_socket_recv() returns EAGAIN.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Noriaki Yoshitane &lt;<a href=3D"mailto:yoshitane.nrs@cnt.n=
cos.nec.co.jp">yoshitane.nrs@cnt.ncos.nec.co.jp</a>&gt;<br>
+Signed-off-by: Li Wang &lt;<a href=3D"mailto:li.wang@windriver.com">li.wan=
g@windriver.com</a>&gt;<br>
+---<br>
+ network_io/unix/sendrecv.c |=C2=A0 =C2=A0 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/network_io/unix/sendrecv.c b/network_io/unix/sendrecv.c<br>
+index c133a26..e8faf15 100644<br>
+--- a/network_io/unix/sendrecv.c<br>
++++ b/network_io/unix/sendrecv.c<br>
+@@ -85,6 +85,10 @@ apr_status_t apr_socket_recv(apr_socket_t *sock, char *=
buf, apr_size_t *len)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;&amp; (sock-&gt;timeout &gt; 0)) {<br>
+ do_select:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arv =3D apr_wait_for_io_or_timeout(NULL,=
 sock, 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((arv =3D=3D APR_TIMEUP) &amp;&amp; (sock-=
&gt;timeout =3D=3D 0)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *len =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return EAGAIN;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (arv !=3D APR_SUCCESS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*len =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return arv;<br>
+--<br>
+1.7.9.5<br>
+<br>
diff --git a/meta/recipes-support/apr/<a href=3D"http://apr_1.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">apr_1.5.2.bb</a> b/meta/recipes-support/a=
pr/<a href=3D"http://apr_1.5.2.bb" rel=3D"noreferrer" target=3D"_blank">apr=
_1.5.2.bb</a><br>
index aac6276..c1f7f38 100644<br>
--- a/meta/recipes-support/apr/<a href=3D"http://apr_1.5.2.bb" rel=3D"noref=
errer" target=3D"_blank">apr_1.5.2.bb</a><br>
+++ b/meta/recipes-support/apr/<a href=3D"http://apr_1.5.2.bb" rel=3D"noref=
errer" target=3D"_blank">apr_1.5.2.bb</a><br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.b=
z2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configfix.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://upgrade-and-fix-1.5.1.patc=
h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Fix-packet-discards-HTTP-r=
edirect.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;4e9769f3349fe11fc0a5e1b224c236aa&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11433952b7825a051a5dba26--
