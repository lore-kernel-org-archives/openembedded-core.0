Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id D478874740
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 10:48:31 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id u12-v6so9349370wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2018 03:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t2BorW6dWcHXWwTs8sIC5N0ftixjBh/NdLa9oLEJB8o=;
	b=jt1YoLImRMyHCM076g2eBG8MNFPUbH75ChRhXhg0/eHoEIaDqaP/FtVQEyjwHEBYd1
	cfcI0mM4EKKkfkWprFjSxsk/MehV0oLFD2wOog/GmzN8CqOp5/06Qk35PoM28qpyzyos
	GOUz4NDqh2/vEFMjbxt6C7HIW3JMWcrqipMnxqq2J2mXpo6DsP/sErHzw54eVqajD0+U
	e7iafXG4BB9sBAJhmbOHH6X/9WcEtZR3srFyyr2hpdCLIB0iW5Q0htbR+zN0UTJvyvZD
	cxrtyVuM2i7swuD8ANVrq5bvqbsX5COIDcrhpuxixmEGfhflvSyio2hRNJv3293ofwRo
	yTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t2BorW6dWcHXWwTs8sIC5N0ftixjBh/NdLa9oLEJB8o=;
	b=ZBJkm9FxsdE6ibemhiCfNR06+HSlVMkifXK8mQTp3nNCGnckUN0ZERrR06l72OiRs2
	PuMKqFaEvd2utAgIjp2/4z3tIDwy7ImnQMHhOnO7f3mbn5riDaBJBiIwD6iH04cYNqjH
	o4ujRJVA8s1tSRsjgvw4Wq+u9h3tQkxHJVGYRhcpNxlijLbulCWu80sNgZjoK+AvRWt+
	cR+fYeJL8JWvQXDaI4XdR5g1a5p1+JSDpJxzNWk2vlyM2+BuWj+QGuSLiwb2nhq1nKTs
	Rh7r0KpSvHcq7eURdW2gqo40ZOGo+L6isHPk9bXqa22zR19SQ8aUUPYbb3yH3SXlwP/o
	wF9g==
X-Gm-Message-State: ABuFfoiEnBJoB13KtMpzVCpGfi/vEOxwbKSZkH/tXhoGDH0ts4EPqe9d
	8RXIfwbUwpMmSQ3rcCc5s7eOmVSkXsIs/lMaiks=
X-Google-Smtp-Source: ACcGV60fFgy8vfCg2kfqmHrteam5H42pH19MBoREMgLH6p3JKPuLJ3884I8XlY2CUgvIjrguCZRC563DdC0xGa1RBvE=
X-Received: by 2002:adf:9b19:: with SMTP id
	b25-v6mr4443589wrc.35.1538650112476; 
	Thu, 04 Oct 2018 03:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20181004104147.14644-1-andrej.valek@siemens.com>
In-Reply-To: <20181004104147.14644-1-andrej.valek@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 Oct 2018 12:48:21 +0200
Message-ID: <CA+chaQfiSfhTgs2aJhgy3wNF5nMjiy2AsnGjYMepgk5vaaHjEA@mail.gmail.com>
To: andrej.valek@siemens.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: fix conflict with runlevel applet
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
X-List-Received-Date: Thu, 04 Oct 2018 10:48:32 -0000
Content-Type: multipart/alternative; boundary="000000000000634a99057764e518"

--000000000000634a99057764e518
Content-Type: text/plain; charset="UTF-8"

I'm not against this change, but would it make sense to enable runlevel
applet in:
meta/recipes-core/busybox/busybox/init.cfg
and drop the runlevel shell script completely?

On Thu, Oct 4, 2018 at 12:42 PM Andrej Valek <andrej.valek@siemens.com>
wrote:

> When CONFIG_RUNLEVEL is enabled, it conflicts with installed OE's script.
> Make grep quite for prevent to write information into logs.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc
> index e1fba4243a..9c546927ab 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -279,32 +279,32 @@ do_install () {
>                 install -m 644 ${WORKDIR}/syslog-startup.conf
> ${D}${sysconfdir}/syslog-startup.conf
>                 install -m 644 ${WORKDIR}/syslog.conf
> ${D}${sysconfdir}/syslog.conf
>         fi
> -       if grep "CONFIG_CROND=y" ${B}/.config; then
> +       if grep -q "CONFIG_CROND=y" ${B}/.config; then
>                 install -m 0755 ${WORKDIR}/busybox-cron
> ${D}${sysconfdir}/init.d/
>         fi
> -       if grep "CONFIG_HTTPD=y" ${B}/.config; then
> +       if grep -q "CONFIG_HTTPD=y" ${B}/.config; then
>                 install -m 0755 ${WORKDIR}/busybox-httpd
> ${D}${sysconfdir}/init.d/
>                 install -d ${D}/srv/www
>         fi
> -       if grep "CONFIG_UDHCPD=y" ${B}/.config; then
> +       if grep -q "CONFIG_UDHCPD=y" ${B}/.config; then
>                 install -m 0755 ${WORKDIR}/busybox-udhcpd
> ${D}${sysconfdir}/init.d/
>         fi
> -       if grep "CONFIG_HWCLOCK=y" ${B}/.config; then
> +       if grep -q "CONFIG_HWCLOCK=y" ${B}/.config; then
>                 install -m 0755 ${WORKDIR}/hwclock.sh
> ${D}${sysconfdir}/init.d/
>         fi
> -       if grep "CONFIG_UDHCPC=y" ${B}/.config; then
> +       if grep -q "CONFIG_UDHCPC=y" ${B}/.config; then
>                 install -d ${D}${sysconfdir}/udhcpc.d
>                 install -d ${D}${datadir}/udhcpc
>                 install -m 0755 ${WORKDIR}/simple.script
> ${D}${sysconfdir}/udhcpc.d/50default
>                 sed -i "s:/SBIN_DIR/:${base_sbindir}/:"
> ${D}${sysconfdir}/udhcpc.d/50default
>                 install -m 0755 ${WORKDIR}/default.script
> ${D}${datadir}/udhcpc/default.script
>         fi
> -       if grep "CONFIG_INETD=y" ${B}/.config; then
> +       if grep -q "CONFIG_INETD=y" ${B}/.config; then
>                 install -m 0755 ${WORKDIR}/inetd
> ${D}${sysconfdir}/init.d/inetd.${BPN}
>                 sed -i "s:/usr/sbin/:${sbindir}/:"
> ${D}${sysconfdir}/init.d/inetd.${BPN}
>                 install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
>         fi
> -        if grep "CONFIG_MDEV=y" ${B}/.config; then
> +        if grep -q "CONFIG_MDEV=y" ${B}/.config; then
>                 install -m 0755 ${WORKDIR}/mdev
> ${D}${sysconfdir}/init.d/mdev
>                 if grep "CONFIG_FEATURE_MDEV_CONF=y" ${B}/.config; then
>                         install -m 644 ${WORKDIR}/mdev.conf
> ${D}${sysconfdir}/mdev.conf
> @@ -313,10 +313,12 @@ do_install () {
>                         install -m 0755 ${WORKDIR}/mdev-mount.sh
> ${D}${sysconfdir}/mdev
>                 fi
>         fi
> -        if grep "CONFIG_INIT=y" ${B}/.config; then
> +        if grep -q "CONFIG_INIT=y" ${B}/.config; then
>                  install -D -m 0777 ${WORKDIR}/rcS
> ${D}${sysconfdir}/init.d/rcS
>                  install -D -m 0777 ${WORKDIR}/rcK
> ${D}${sysconfdir}/init.d/rcK
> -                install -D -m 0755 ${WORKDIR}/runlevel
> ${D}${base_sbindir}/runlevel
> +                if ! grep -q "CONFIG_RUNLEVEL=y" ${B}/.config; then
> +                        install -D -m 0755 ${WORKDIR}/runlevel
> ${D}${base_sbindir}/runlevel
> +                fi
>          fi
>
>      if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000634a99057764e518
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I&#39;m not against this change, but woul=
d it make sense to enable runlevel applet in:<div>meta/recipes-core/busybox=
/busybox/init.cfg<br></div><div>and drop the runlevel shell script complete=
ly?</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, Oct 4, 2018 at 12:42 PM Andrej Valek &lt;<a href=3D"mailto:andrej.valek@s=
iemens.com">andrej.valek@siemens.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">When CONFIG_RUNLEVEL is enabled, it conflicts with install=
ed OE&#39;s script.<br>
Make grep quite for prevent to write information into logs.<br>
<br>
Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com"=
 target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/busybox/busybox.inc | 20 +++++++++++---------<br>
=C2=A01 file changed, 11 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc<br>
index e1fba4243a..9c546927ab 100644<br>
--- a/meta/recipes-core/busybox/busybox.inc<br>
+++ b/meta/recipes-core/busybox/busybox.inc<br>
@@ -279,32 +279,32 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${WO=
RKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${WO=
RKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep &quot;CONFIG_CROND=3Dy&quot; ${B}/.conf=
ig; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;CONFIG_CROND=3Dy&quot; ${B}/.c=
onfig; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${W=
ORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep &quot;CONFIG_HTTPD=3Dy&quot; ${B}/.conf=
ig; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;CONFIG_HTTPD=3Dy&quot; ${B}/.c=
onfig; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${W=
ORKDIR}/busybox-httpd ${D}${sysconfdir}/init.d/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/srv=
/www<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep &quot;CONFIG_UDHCPD=3Dy&quot; ${B}/.con=
fig; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;CONFIG_UDHCPD=3Dy&quot; ${B}/.=
config; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${W=
ORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep &quot;CONFIG_HWCLOCK=3Dy&quot; ${B}/.co=
nfig; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;CONFIG_HWCLOCK=3Dy&quot; ${B}/=
.config; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${W=
ORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep &quot;CONFIG_UDHCPC=3Dy&quot; ${B}/.con=
fig; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;CONFIG_UDHCPC=3Dy&quot; ${B}/.=
config; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sy=
sconfdir}/udhcpc.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${da=
tadir}/udhcpc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${W=
ORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s:/SBI=
N_DIR/:${base_sbindir}/:&quot; ${D}${sysconfdir}/udhcpc.d/50default<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${W=
ORKDIR}/default.script ${D}${datadir}/udhcpc/default.script<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep &quot;CONFIG_INETD=3Dy&quot; ${B}/.conf=
ig; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q &quot;CONFIG_INETD=3Dy&quot; ${B}/.c=
onfig; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${W=
ORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s:/usr=
/sbin/:${sbindir}/:&quot; ${D}${sysconfdir}/init.d/inetd.${BPN}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${W=
ORKDIR}/inetd.conf ${D}${sysconfdir}/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep &quot;CONFIG_MDEV=3Dy&quot; ${B}/.conf=
ig; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep -q &quot;CONFIG_MDEV=3Dy&quot; ${B}/.c=
onfig; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${W=
ORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep &quot;CONFI=
G_FEATURE_MDEV_CONF=3Dy&quot; ${B}/.config; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf<=
br>
@@ -313,10 +313,12 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install -m 0755 ${WORKDIR}/mdev-mount.sh ${D}${sysconfdir}/mdev<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep &quot;CONFIG_INIT=3Dy&quot; ${B}/.conf=
ig; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep -q &quot;CONFIG_INIT=3Dy&quot; ${B}/.c=
onfig; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m=
 0777 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m=
 0777 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 0755=
 ${WORKDIR}/runlevel ${D}${base_sbindir}/runlevel<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! grep -q &quot=
;CONFIG_RUNLEVEL=3Dy&quot; ${B}/.config; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 install -D -m 0755 ${WORKDIR}/runlevel ${D}${base_sbindir}/runle=
vel<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,&#39;=
systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
-- <br>
2.11.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000634a99057764e518--
