Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id E727C6011D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 10:20:58 +0000 (UTC)
Received: by lffu14 with SMTP id u14so1903655lff.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 02:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lyKHRv+gTwxa7cLwFeI/qiwH0E09GZ4BIwbVxZkB+7k=;
	b=TKQF9YkuEoK2jh6C5Ptaj+64TN4hwmIMFOa0xZoJiUgT6R0G3npoJcrtvaTGG2Q+Zw
	tpz1Z4njmIkomsC8geLLE7FJuSTyCwku1PU/MyHpV78JTifss2mMYyVLy7+JZ9+TYVdr
	elk6Y/V/10r5zZmBJOiEa/kalvkA8LMFW0W7uS2JQuC9tqAFI+UQ3GZI0i5hCWmdi0Hx
	6QLqDruACdNzB8ih40/Mg6/vNpuFuJO4RvsZGdIzTWK1Xf3h9chASQujMGviBznpI+b0
	BabXMQEX9xRKmdko2+t14iXaEJAvtZOPR+oll3mdHseZsU9w6R3zLX7V2mQbwHlC1RsU
	z1KQ==
MIME-Version: 1.0
X-Received: by 10.112.11.163 with SMTP id r3mr28518540lbb.8.1448965258687;
	Tue, 01 Dec 2015 02:20:58 -0800 (PST)
Received: by 10.25.39.72 with HTTP; Tue, 1 Dec 2015 02:20:58 -0800 (PST)
In-Reply-To: <1448905304-21681-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1448905304-21681-1-git-send-email-alexander.kanavin@linux.intel.com>
Date: Tue, 1 Dec 2015 11:20:58 +0100
Message-ID: <CAEGpDubP7DxzxnSZCm-wjjp82uzLgWE2GfrEYJX8TaqRVfyueA@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston-init: add a native systemd unit file
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
X-List-Received-Date: Tue, 01 Dec 2015 10:21:01 -0000
Content-Type: multipart/alternative; boundary=001a11c3c7068941800525d383fc

--001a11c3c7068941800525d383fc
Content-Type: text/plain; charset=UTF-8

Hi,

Better use "${systemd_system_unitdir}" instead of
"${systemd_unitdir}/system".

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2015-11-30 18:41 GMT+01:00 Alexander Kanavin <
alexander.kanavin@linux.intel.com>:

> Previously weston was started by systemd via a classic init script
>
> [YOCTO #5582]
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-graphics/wayland/weston-init.bb             | 13
> ++++++++++---
>  meta/recipes-graphics/wayland/weston-init/weston.service | 15
> +++++++++++++++
>  2 files changed, 25 insertions(+), 3 deletions(-)
>  create mode 100644
> meta/recipes-graphics/wayland/weston-init/weston.service
>
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb
> b/meta/recipes-graphics/wayland/weston-init.bb
> index fc2e4f8..35fd055 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -1,17 +1,22 @@
> -SUMMARY = "Startup script for the Weston Wayland compositor"
> +SUMMARY = "Startup script and systemd unit file for the Weston Wayland
> compositor"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
>
> -SRC_URI = "file://init"
> +SRC_URI = "file://init \
> +           file://weston.service"
>
>  S = "${WORKDIR}"
>
>  do_install() {
>         install -d ${D}/${sysconfdir}/init.d
>         install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
> +
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m0644 ${WORKDIR}/weston.service
> ${D}${systemd_unitdir}/system
>  }
>
> -inherit allarch update-rc.d distro_features_check
> +inherit allarch update-rc.d distro_features_check systemd
> +
>  # rdepends on weston which depends on virtual/egl
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
> @@ -19,3 +24,5 @@ RDEPENDS_${PN} = "weston kbd"
>
>  INITSCRIPT_NAME = "weston"
>  INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> +
> +SYSTEMD_SERVICE_${PN} = "weston.service"
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service
> b/meta/recipes-graphics/wayland/weston-init/weston.service
> new file mode 100644
> index 0000000..4f1f7ff
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston-init/weston.service
> @@ -0,0 +1,15 @@
> +[Unit]
> +Description=Weston Wayland compositor startup
> +RequiresMountsFor=/run
> +
> +[Service]
> +User=root
> +EnvironmentFile=-/etc/default/weston
> +Environment="XDG_RUNTIME_DIR=/run/user/root"
> +ExecStartPre=/bin/mkdir -p /run/user/root
> +ExecStartPre=/bin/chmod 0700 /run/user/root
> +ExecStart=/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS
> +
> +[Install]
> +WantedBy=multi-user.target
> +
> --
> 2.6.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c3c7068941800525d383fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br></div>Better use &quot;${systemd_system_un=
itdir}&quot; instead of &quot;${systemd_unitdir}/system&quot;. </div><div c=
lass=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signature">=
Pau Espin Pedrol<br>mail/jabber: <a href=3D"mailto:pespin.shar@gmail.com" t=
arget=3D"_blank">pespin.shar@gmail.com</a><br><a href=3D"http://blog.espewe=
b.net" target=3D"_blank">http://blog.espeweb.net</a><br></div></div>
<br><div class=3D"gmail_quote">2015-11-30 18:41 GMT+01:00 Alexander Kanavin=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com"=
 target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span>:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Previously weston was started by systemd via a =
classic init script<br>
<br>
[YOCTO #5582]<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/wayland/<a href=3D"http://weston-init.bb" rel=
=3D"noreferrer" target=3D"_blank">weston-init.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++++++++++---<br>
=C2=A0meta/recipes-graphics/wayland/weston-init/weston.service | 15 +++++++=
++++++++<br>
=C2=A02 files changed, 25 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.s=
ervice<br>
<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://weston-init.bb=
" rel=3D"noreferrer" target=3D"_blank">weston-init.bb</a> b/meta/recipes-gr=
aphics/wayland/<a href=3D"http://weston-init.bb" rel=3D"noreferrer" target=
=3D"_blank">weston-init.bb</a><br>
index fc2e4f8..35fd055 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://weston-init.bb" rel=
=3D"noreferrer" target=3D"_blank">weston-init.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://weston-init.bb" rel=
=3D"noreferrer" target=3D"_blank">weston-init.bb</a><br>
@@ -1,17 +1,22 @@<br>
-SUMMARY =3D &quot;Startup script for the Weston Wayland compositor&quot;<b=
r>
+SUMMARY =3D &quot;Startup script and systemd unit file for the Weston Wayl=
and compositor&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;md5=3D4d92cd373=
abda3937c2bc47fbc49d690&quot;<br>
<br>
-SRC_URI =3D &quot;file://init&quot;<br>
+SRC_URI =3D &quot;file://init \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://weston.service&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/init.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m755 ${WORKDIR}/init ${D}/${sysconfdir=
}/init.d/weston<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m0644 ${WORKDIR}/weston.service ${D}$=
{systemd_unitdir}/system<br>
=C2=A0}<br>
<br>
-inherit allarch update-rc.d distro_features_check<br>
+inherit allarch update-rc.d distro_features_check systemd<br>
+<br>
=C2=A0# rdepends on weston which depends on virtual/egl<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
<br>
@@ -19,3 +24,5 @@ RDEPENDS_${PN} =3D &quot;weston kbd&quot;<br>
<br>
=C2=A0INITSCRIPT_NAME =3D &quot;weston&quot;<br>
=C2=A0INITSCRIPT_PARAMS =3D &quot;start 9 5 2 . stop 20 0 1 6 .&quot;<br>
+<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;weston.service&quot;<br>
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/met=
a/recipes-graphics/wayland/weston-init/weston.service<br>
new file mode 100644<br>
index 0000000..4f1f7ff<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service<br>
@@ -0,0 +1,15 @@<br>
+[Unit]<br>
+Description=3DWeston Wayland compositor startup<br>
+RequiresMountsFor=3D/run<br>
+<br>
+[Service]<br>
+User=3Droot<br>
+EnvironmentFile=3D-/etc/default/weston<br>
+Environment=3D&quot;XDG_RUNTIME_DIR=3D/run/user/root&quot;<br>
+ExecStartPre=3D/bin/mkdir -p /run/user/root<br>
+ExecStartPre=3D/bin/chmod 0700 /run/user/root<br>
+ExecStart=3D/usr/bin/openvt -v -e /usr/bin/weston -- $OPTARGS<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.6.2<br>
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

--001a11c3c7068941800525d383fc--
