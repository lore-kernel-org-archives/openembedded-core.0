Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UStbe-0007aT-LC
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 20:30:55 +0200
Received: by mail-wi0-f175.google.com with SMTP id h11so2349798wiv.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2013 11:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=t6FFEPcdQMi2YQSp9sArg6IAzAa2Ag56EVkJpWQpmog=;
	b=q/IKKVutyAqcImmvmCn0rl5b9tEda/TIcLiJXY2JnUizgZawvod2ZN5esxHqu+zR5t
	YuaqJ1hi3zA+Ext4KdIduQ8tdIZoB1bNuU8Ha8lRayrezYeVXYReSmYffu27kRTBedxM
	8SMZVHhqy2/dmVT7Vq/kIGLZ5ahICkhOwbHWx1MXhlpfvNoWVFenHT2FWBfGSmXfAHSu
	JWBar/l98K2Zs2HpOTHYAqvH3JzbJfWWefI4pXTjXrTfvdnF9utCBY++vLY+8GQhLXVS
	tfIaEnYkP5VbkSQazpPtAFq2VjXGRwXeHd0t5ASDgPcBwNGQ9JjaVBGZ9p0pF9lo9FCI
	k0hg==
MIME-Version: 1.0
X-Received: by 10.180.183.197 with SMTP id eo5mr20290002wic.28.1366308797282; 
	Thu, 18 Apr 2013 11:13:17 -0700 (PDT)
Received: by 10.194.243.137 with HTTP; Thu, 18 Apr 2013 11:13:17 -0700 (PDT)
In-Reply-To: <1366306413-1336-1-git-send-email-ross.burton@intel.com>
References: <1366306413-1336-1-git-send-email-ross.burton@intel.com>
Date: Thu, 18 Apr 2013 20:13:17 +0200
Message-ID: <CA+chaQdMzU5vxX2G_rAN89gfc0MMhRGbR5hUBE+7Pm8VsM+EEQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: fix systemd service packaging with multilib
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
X-List-Received-Date: Thu, 18 Apr 2013 18:31:02 -0000
Content-Type: multipart/alternative; boundary=001a11c223f884040604daa68e0d

--001a11c223f884040604daa68e0d
Content-Type: text/plain; charset=UTF-8

Doesn't this break avahi-ui again?

http://git.openembedded.org/openembedded-core/commit/?id=02492d43cd7095acb3cf29843a50444c28b4d994


On Thu, Apr 18, 2013 at 7:33 PM, Ross Burton <ross.burton@intel.com> wrote:

> Move the systemd class usage to the .inc, and use ${PN} correctly so that
> the files are packaged in multilib configurations.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-connectivity/avahi/avahi.inc       |    6 +++++-
>  meta/recipes-connectivity/avahi/avahi_0.6.31.bb |    6 ------
>  2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc
> b/meta/recipes-connectivity/avahi/avahi.inc
> index c302f87..f31b5e5 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -37,7 +37,7 @@ USERADD_PARAM_avahi-autoipd = "--system --home
> /var/run/avahi-autoipd \
>                                -c \"Avahi autoip daemon\" \
>                                avahi-autoipd"
>
> -inherit autotools pkgconfig update-rc.d gettext useradd
> +inherit autotools pkgconfig update-rc.d gettext useradd systemd
>
>  EXTRA_OECONF = "--disable-introspection \
>               --with-avahi-priv-access-group=adm \
> @@ -115,6 +115,10 @@ INITSCRIPT_PARAMS_avahi-daemon = "defaults 21 19"
>  INITSCRIPT_NAME_avahi-dnsconfd = "avahi-dnsconfd"
>  INITSCRIPT_PARAMS_avahi-dnsconfd = "defaults 22 19"
>
> +SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
> +SYSTEMD_SERVICE_${PN}-daemon = "avahi-daemon.service"
> +SYSTEMD_SERVICE_${PN}-dnsconfd = "avahi-dnsconfd.service"
> +
>  do_install() {
>         autotools_do_install
>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.31.bbb/meta/recipes-connectivity/avahi/
> avahi_0.6.31.bb
> index 22731f9..cff0974 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
> @@ -1,11 +1,5 @@
>  require avahi.inc
>
> -inherit systemd
> -
> -SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
> -SYSTEMD_SERVICE_avahi-daemon = "avahi-daemon.service"
> -SYSTEMD_SERVICE_avahi-dnsconfd = "avahi-dnsconfd.service"
> -
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>
>  file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d
> \
>
>  file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--001a11c223f884040604daa68e0d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Doesn&#39;t this break avahi-ui again?<div><br></div><div>=
<a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=3D02492=
d43cd7095acb3cf29843a50444c28b4d994">http://git.openembedded.org/openembedd=
ed-core/commit/?id=3D02492d43cd7095acb3cf29843a50444c28b4d994</a><br>
</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">O=
n Thu, Apr 18, 2013 at 7:33 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Move the systemd class usage to the .inc, an=
d use ${PN} correctly so that<br>
the files are packaged in multilib configurations.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/avahi/avahi.inc =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A06 +++++-<br>
=C2=A0meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.6.31.bb" ta=
rget=3D"_blank">avahi_0.6.31.bb</a> | =C2=A0 =C2=A06 ------<br>
=C2=A02 files changed, 5 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-conne=
ctivity/avahi/avahi.inc<br>
index c302f87..f31b5e5 100644<br>
--- a/meta/recipes-connectivity/avahi/avahi.inc<br>
+++ b/meta/recipes-connectivity/avahi/avahi.inc<br>
@@ -37,7 +37,7 @@ USERADD_PARAM_avahi-autoipd =3D &quot;--system --home /va=
r/run/avahi-autoipd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-c \&quot;Avahi autoip daemon\&quot; =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi-autoipd&quot;<br>
<br>
-inherit autotools pkgconfig update-rc.d gettext useradd<br>
+inherit autotools pkgconfig update-rc.d gettext useradd systemd<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-introspection \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-avahi-priv-access-g=
roup=3Dadm \<br>
@@ -115,6 +115,10 @@ INITSCRIPT_PARAMS_avahi-daemon =3D &quot;defaults 21 1=
9&quot;<br>
=C2=A0INITSCRIPT_NAME_avahi-dnsconfd =3D &quot;avahi-dnsconfd&quot;<br>
=C2=A0INITSCRIPT_PARAMS_avahi-dnsconfd =3D &quot;defaults 22 19&quot;<br>
<br>
+SYSTEMD_PACKAGES =3D &quot;${PN}-daemon ${PN}-dnsconfd&quot;<br>
+SYSTEMD_SERVICE_${PN}-daemon =3D &quot;avahi-daemon.service&quot;<br>
+SYSTEMD_SERVICE_${PN}-dnsconfd =3D &quot;avahi-dnsconfd.service&quot;<br>
+<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 autotools_do_install<br>
<br>
diff --git a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.6.31=
.bb" target=3D"_blank">avahi_0.6.31.bb</a> b/meta/recipes-connectivity/avah=
i/<a href=3D"http://avahi_0.6.31.bb" target=3D"_blank">avahi_0.6.31.bb</a><=
br>

index 22731f9..cff0974 100644<br>
--- a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.6.31.bb" ta=
rget=3D"_blank">avahi_0.6.31.bb</a><br>
+++ b/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.6.31.bb" ta=
rget=3D"_blank">avahi_0.6.31.bb</a><br>
@@ -1,11 +1,5 @@<br>
=C2=A0require avahi.inc<br>
<br>
-inherit systemd<br>
-<br>
-SYSTEMD_PACKAGES =3D &quot;${PN}-daemon ${PN}-dnsconfd&quot;<br>
-SYSTEMD_SERVICE_avahi-daemon =3D &quot;avahi-daemon.service&quot;<br>
-SYSTEMD_SERVICE_avahi-dnsconfd =3D &quot;avahi-dnsconfd.service&quot;<br>
-<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2d5025d4aa3495befef8f=
17206a5b0a1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://avahi-common/address.h;endline=3D25;md5=3Db1d1d2cda1c07eb848ea7d6=
215712d9d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://avahi-core/dns.h;endline=3D23;md5=3D6fe82590b81aa0ddea5095b548e2f=
dcb \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
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

--001a11c223f884040604daa68e0d--
