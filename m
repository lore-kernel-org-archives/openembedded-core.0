Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A1AF36B2CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 17:47:35 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id c11so4019526ieb.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 10:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=g6Zcu79umjP5IilRpn1ravPm7tzTb/xqb/ZKpDIoOx8=;
	b=xhGo6x3VovcOQx7ulf43WpFXv3/XuPgz1iHuQ/2flSyXbsT3A6/gRBd4+KJ3+XdQdu
	kMf3PqmcdOe4fFDMBarIG8vB1Av4ltIA9baUu2uxdzw8yp1WS/1V8ePedpncVrCTenFX
	v9n9wh7XjlD3puEuDgATR+pzuNyzDQiWNu3FYI+I55r7jBRC1Iq31230Ols/9cV05RNA
	rGkYjefzHzhPFx8Nxlwrl/cL2ihlDd2EKCtGd7JP/kdG6QalDfsLLnA6DXi7VSRnadat
	DFUJLzqpzRazaHTRenl7dT+LnfWdMHZW+fuuA3azgzpn80LbWyySI8vzJqVtp4gMtRRY
	ARlw==
X-Received: by 10.50.3.42 with SMTP id 10mr38816igz.39.1376675256295; Fri, 16
	Aug 2013 10:47:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Fri, 16 Aug 2013 10:47:06 -0700 (PDT)
In-Reply-To: <1376674064-14468-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1376674064-14468-1-git-send-email-muhammad_shakeel@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2013 10:47:06 -0700
Message-ID: <CAMKF1srCL2f+Cxb+2xvLY4_+oikJgXtj0vcR3=9h0tbDf1jGSg@mail.gmail.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] [v3] openssh: Add systemd support
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
X-List-Received-Date: Fri, 16 Aug 2013 17:47:37 -0000
Content-Type: multipart/alternative; boundary=089e013c6a729f94d704e4142fbe

--089e013c6a729f94d704e4142fbe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2013 at 10:27 AM, Shakeel, Muhammad <
muhammad_shakeel@mentor.com> wrote:

> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> -Remove dependency on meta-systemd
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>  .../openssh/openssh-6.2p2/sshd.socket              |   11 +++++++++++
>  .../openssh/openssh-6.2p2/sshd@.service            |    9 +++++++++
>  .../openssh/openssh-6.2p2/sshdgenkeys.service      |   10 ++++++++++
>  meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   20
> ++++++++++++++++++--
>  4 files changed, 48 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
> b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
> new file mode 100644
> index 0000000..753a33b
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
> @@ -0,0 +1,11 @@
> +[Unit]
> +Conflicts=3Dsshd.service
> +
> +[Socket]
> +ExecStartPre=3D/bin/mkdir -p /var/run/sshd
> +ListenStream=3D22
> +Accept=3Dyes
> +
> +[Install]
> +WantedBy=3Dsockets.target
> +Also=3Dsshdgenkeys.service
> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.servic=
e
> b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
> new file mode 100644
> index 0000000..d118490
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=3DOpenSSH Per-Connection Daemon
> +After=3Dsshdgenkeys.service
> +
> +[Service]
> +ExecStart=3D-/usr/sbin/sshd -i
> +ExecReload=3D/bin/kill -HUP $MAINPID
> +StandardInput=3Dsocket
> +StandardError=3Dsyslog
> diff --git
> a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
> b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
> new file mode 100644
> index 0000000..c717214
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=3DSSH Key Generation
> +
> +[Service]
> +ExecStart=3D/usr/bin/ssh-keygen -A
> +Type=3Doneshot
> +RemainAfterExit=3Dyes
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
>



it would be nice if it was using libdir/bindir instead of hardcoded paths
coudld be achieved by generating the unit files from some sort of .in files
at build time so it could benefit
the distros which dont use /usr e.g.

=E2=80=8B=E2=80=8B

> diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bbb/meta/rec=
ipes-connectivity/openssh/
> openssh_6.2p2.bb
> index c76f9ac..8dac2f1 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> @@ -26,14 +26,17 @@ SRC_URI =3D "
> ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>             file://init \
>             file://openssh-CVE-2011-4327.patch \
>             file://mac.patch \
> -           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}',
> '', d)}"
> +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}',
> '', d)} \
> +           file://sshd.socket \
> +           file://sshd@.service \
> +           file://sshdgenkeys.service "
>
>  PAM_SRC_URI =3D "file://sshd"
>
>  SRC_URI[md5sum] =3D "be46174dcbb77ebb4ea88ef140685de1"
>  SRC_URI[sha256sum] =3D
> "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e90c766432e32161b842313b"
>
> -inherit useradd update-rc.d update-alternatives
> +inherit useradd update-rc.d update-alternatives systemd
>
>  USERADD_PACKAGES =3D "${PN}-sshd"
>  USERADD_PARAM_${PN}-sshd =3D "--system --no-create-home --home-dir
> /var/run/sshd --shell /bin/false --user-group sshd"
> @@ -41,6 +44,10 @@ INITSCRIPT_PACKAGES =3D "${PN}-sshd"
>  INITSCRIPT_NAME_${PN}-sshd =3D "sshd"
>  INITSCRIPT_PARAMS_${PN}-sshd =3D "defaults 9"
>
> +SYSTEMD_PACKAGES =3D "${PN}-sshd"
> +SYSTEMD_SERVICE_${PN}-sshd =3D "sshd.socket sshd@.service
> sshdgenkeys.service"
> +SYSTEMD_AUTO_ENABLE =3D "enable"
> +
>  PACKAGECONFIG ??=3D "tcp-wrappers"
>  PACKAGECONFIG[tcp-wrappers] =3D "--with-tcp-wrappers,,tcp-wrappers"
>
> @@ -93,6 +100,14 @@ do_install_append () {
>         echo "HostKey /var/run/ssh/ssh_host_rsa_key" >>
> ${D}${sysconfdir}/ssh/sshd_config_readonly
>         echo "HostKey /var/run/ssh/ssh_host_dsa_key" >>
> ${D}${sysconfdir}/ssh/sshd_config_readonly
>         echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >>
> ${D}${sysconfdir}/ssh/sshd_config_readonly
> +
> +       install -d ${D}${systemd_unitdir}/system
> +       install -m 0644 ${WORKDIR}/sshd.socket
> ${D}${systemd_unitdir}/system
> +       install -m 0644 ${WORKDIR}/sshd@.service
> ${D}${systemd_unitdir}/system
> +       install -m 0644 ${WORKDIR}/sshdgenkeys.service
> ${D}${systemd_unitdir}/system
> +       sed -i 's,/bin/,${base_bindir}/,g'
> ${D}${systemd_unitdir}/system/sshd.socket
> ${D}${systemd_unitdir}/system/sshd@.service
> +       sed -i 's,/usr/sbin/,${sbindir}/,g'
> ${D}${systemd_unitdir}/system/sshd@.service
> +       sed -i 's,/usr/bin/,${bindir}/,g'
> ${D}${systemd_unitdir}/system/sshdgenkeys.service
>  }
>
>  ALLOW_EMPTY_${PN} =3D "1"
> @@ -102,6 +117,7 @@ FILES_${PN}-scp =3D "${bindir}/scp.${BPN}"
>  FILES_${PN}-ssh =3D "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
>  FILES_${PN}-sshd =3D "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
>  FILES_${PN}-sshd +=3D "${sysconfdir}/ssh/moduli
> ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly"
> +FILES_${PN}-sshd +=3D "${systemd_unitdir}"
>  FILES_${PN}-sftp =3D "${bindir}/sftp"
>  FILES_${PN}-sftp-server =3D "${libexecdir}/sftp-server"
>  FILES_${PN}-misc =3D "${bindir}/ssh* ${libexecdir}/ssh*"
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e013c6a729f94d704e4142fbe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:courier =
new,monospace;font-size:small"><br></div><div class=3D"gmail_extra"><br><br=
><div class=3D"gmail_quote">On Fri, Aug 16, 2013 at 10:27 AM, Shakeel, Muha=
mmad <span dir=3D"ltr">&lt;<a href=3D"mailto:muhammad_shakeel@mentor.com" t=
arget=3D"_blank">muhammad_shakeel@mentor.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Muhammad Shakeel &lt;<a href=3D"mailto=
:muhammad_shakeel@mentor.com">muhammad_shakeel@mentor.com</a>&gt;<br>
<br>
-Remove dependency on meta-systemd<br>
<br>
Signed-off-by: Muhammad Shakeel &lt;<a href=3D"mailto:muhammad_shakeel@ment=
or.com">muhammad_shakeel@mentor.com</a>&gt;<br>
---<br>
=C2=A0.../openssh/openssh-6.2p2/sshd.socket =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 11 +++++++++++<br>
=C2=A0.../openssh/openssh-6.2p2/sshd@.service =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A09 +++++++++<br>
=C2=A0.../openssh/openssh-6.2p2/sshdgenkeys.service =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 10 ++++++++++<br>
=C2=A0meta/recipes-connectivity/openssh/<a href=3D"http://openssh_6.2p2.bb"=
 target=3D"_blank">openssh_6.2p2.bb</a> | =C2=A0 20 ++++++++++++++++++--<br=
>
=C2=A04 files changed, 48 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket b/=
meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket<br>
new file mode 100644<br>
index 0000000..753a33b<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket<br>
@@ -0,0 +1,11 @@<br>
+[Unit]<br>
+Conflicts=3Dsshd.service<br>
+<br>
+[Socket]<br>
+ExecStartPre=3D/bin/mkdir -p /var/run/sshd<br>
+ListenStream=3D22<br>
+Accept=3Dyes<br>
+<br>
+[Install]<br>
+WantedBy=3Dsockets.target<br>
+Also=3Dsshdgenkeys.service<br>
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service =
b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service<br>
new file mode 100644<br>
index 0000000..d118490<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd@.service<br>
@@ -0,0 +1,9 @@<br>
+[Unit]<br>
+Description=3DOpenSSH Per-Connection Daemon<br>
+After=3Dsshdgenkeys.service<br>
+<br>
+[Service]<br>
+ExecStart=3D-/usr/sbin/sshd -i<br>
+ExecReload=3D/bin/kill -HUP $MAINPID<br>
+StandardInput=3Dsocket<br>
+StandardError=3Dsyslog<br>
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.se=
rvice b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service=
<br>
new file mode 100644<br>
index 0000000..c717214<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshdgenkeys.service<b=
r>
@@ -0,0 +1,10 @@<br>
+[Unit]<br>
+Description=3DSSH Key Generation<br>
+<br>
+[Service]<br>
+ExecStart=3D/usr/bin/ssh-keygen -A<br>
+Type=3Doneshot<br>
+RemainAfterExit=3Dyes<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br></blockquote><div><br></div><div><br></div=
><div><br></div><div style=3D"font-family:&#39;courier new&#39;,monospace;f=
ont-size:small" class=3D"gmail_default">it would be nice if it was using li=
bdir/bindir instead of hardcoded paths</div>

<div style=3D"font-family:&#39;courier new&#39;,monospace;font-size:small" =
class=3D"gmail_default">coudld be achieved by generating the unit files fro=
m some sort of .in files at build time so it could benefit</div><div style=
=3D"font-family:&#39;courier new&#39;,monospace;font-size:small" class=3D"g=
mail_default">

the distros which dont use /usr e.g.</div><div style=3D"font-family:&#39;co=
urier new&#39;,monospace;font-size:small" class=3D"gmail_default"><br></div=
><div style=3D"font-family:&#39;courier new&#39;,monospace;font-size:small"=
 class=3D"gmail_default">

=E2=80=8B=E2=80=8B</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_6.=
2p2.bb" target=3D"_blank">openssh_6.2p2.bb</a> b/meta/recipes-connectivity/=
openssh/<a href=3D"http://openssh_6.2p2.bb" target=3D"_blank">openssh_6.2p2=
.bb</a><br>


index c76f9ac..8dac2f1 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_6.2p2.bb"=
 target=3D"_blank">openssh_6.2p2.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_6.2p2.bb"=
 target=3D"_blank">openssh_6.2p2.bb</a><br>
@@ -26,14 +26,17 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.openbsd.org/pub/=
OpenBSD/OpenSSH/portable/openssh-${PV}.tar" target=3D"_blank">ftp://ftp.ope=
nbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar</a>.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openssh-CVE-2011-4327.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mac.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@base_contains(&#39;DISTRO_FEATURES&=
#39;, &#39;pam&#39;, &#39;${PAM_SRC_URI}&#39;, &#39;&#39;, d)}&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@base_contains(&#39;DISTRO_FEATURES&=
#39;, &#39;pam&#39;, &#39;${PAM_SRC_URI}&#39;, &#39;&#39;, d)} \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sshd.socket \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sshd@.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sshdgenkeys.service &quot;<br>
<br>
=C2=A0PAM_SRC_URI =3D &quot;file://sshd&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;be46174dcbb77ebb4ea88ef140685de1&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194=
e90c766432e32161b842313b&quot;<br>
<br>
-inherit useradd update-rc.d update-alternatives<br>
+inherit useradd update-rc.d update-alternatives systemd<br>
<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}-sshd&quot;<br>
=C2=A0USERADD_PARAM_${PN}-sshd =3D &quot;--system --no-create-home --home-d=
ir /var/run/sshd --shell /bin/false --user-group sshd&quot;<br>
@@ -41,6 +44,10 @@ INITSCRIPT_PACKAGES =3D &quot;${PN}-sshd&quot;<br>
=C2=A0INITSCRIPT_NAME_${PN}-sshd =3D &quot;sshd&quot;<br>
=C2=A0INITSCRIPT_PARAMS_${PN}-sshd =3D &quot;defaults 9&quot;<br>
<br>
+SYSTEMD_PACKAGES =3D &quot;${PN}-sshd&quot;<br>
+SYSTEMD_SERVICE_${PN}-sshd =3D &quot;sshd.socket sshd@.service sshdgenkeys=
.service&quot;<br>
+SYSTEMD_AUTO_ENABLE =3D &quot;enable&quot;<br>
+<br>
=C2=A0PACKAGECONFIG ??=3D &quot;tcp-wrappers&quot;<br>
=C2=A0PACKAGECONFIG[tcp-wrappers] =3D &quot;--with-tcp-wrappers,,tcp-wrappe=
rs&quot;<br>
<br>
@@ -93,6 +100,14 @@ do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;HostKey /var/run/ssh/ssh_host_rsa_ke=
y&quot; &gt;&gt; ${D}${sysconfdir}/ssh/sshd_config_readonly<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;HostKey /var/run/ssh/ssh_host_dsa_ke=
y&quot; &gt;&gt; ${D}${sysconfdir}/ssh/sshd_config_readonly<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;HostKey /var/run/ssh/ssh_host_ecdsa_=
key&quot; &gt;&gt; ${D}${sysconfdir}/ssh/sshd_config_readonly<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system<br>
+ =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd=
_unitdir}/system<br>
+ =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/sshd@.service ${D}${syste=
md_unitdir}/system<br>
+ =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}$=
{systemd_unitdir}/system<br>
+ =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,/bin/,${base_bindir}/,g&#39; ${D}${sys=
temd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/sshd@.servic=
e<br>
+ =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,/usr/sbin/,${sbindir}/,g&#39; ${D}${sy=
stemd_unitdir}/system/sshd@.service<br>
+ =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,/usr/bin/,${bindir}/,g&#39; ${D}${syst=
emd_unitdir}/system/sshdgenkeys.service<br>
=C2=A0}<br>
<br>
=C2=A0ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
@@ -102,6 +117,7 @@ FILES_${PN}-scp =3D &quot;${bindir}/scp.${BPN}&quot;<br=
>
=C2=A0FILES_${PN}-ssh =3D &quot;${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_=
config&quot;<br>
=C2=A0FILES_${PN}-sshd =3D &quot;${sbindir}/sshd ${sysconfdir}/init.d/sshd&=
quot;<br>
=C2=A0FILES_${PN}-sshd +=3D &quot;${sysconfdir}/ssh/moduli ${sysconfdir}/ss=
h/sshd_config ${sysconfdir}/ssh/sshd_config_readonly&quot;<br>
+FILES_${PN}-sshd +=3D &quot;${systemd_unitdir}&quot;<br>
=C2=A0FILES_${PN}-sftp =3D &quot;${bindir}/sftp&quot;<br>
=C2=A0FILES_${PN}-sftp-server =3D &quot;${libexecdir}/sftp-server&quot;<br>
=C2=A0FILES_${PN}-misc =3D &quot;${bindir}/ssh* ${libexecdir}/ssh*&quot;<br=
>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div></div>

--089e013c6a729f94d704e4142fbe--
