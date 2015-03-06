Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id A68F76017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 04:22:37 +0000 (UTC)
Received: by iecat20 with SMTP id at20so29244359iec.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 20:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=y/2uINmJ6QRPBP5fJj3bhIJDJc0OPNJCnGSag+d/nyI=;
	b=p0wWIwB6l/zF/9X7pmB8ayKZVTVQgDylgWQg/HrnWBCA+REO9gv23sGyRPBTSHffJW
	k+EjWXJNYnyPFjRontQBVuKkEgXzcI/l+lwBUgSqEmFr8EBtrjBMqEwJoKcWFsxg+AzK
	sWDme6f08hSRAOAf4cQnwE1WpEig0fx7w2XlvorshrJb+xRZS9R1CsZICZMvPg6YyM8I
	v9eB4AuPvxWVW5qdW1riZ6GcLd4ctJwWVC0DkLSwUHyEeb7n94d+mzhzMv93dT2Uuxe4
	a/oPmO6vqx44aV6H4ebLtSXcMhZXfzUp9ucx5cLszlrayAirEJ0m1TUGmuDy/DG0RSib
	k1Fw==
MIME-Version: 1.0
X-Received: by 10.107.157.195 with SMTP id g186mr25768771ioe.72.1425615758443; 
	Thu, 05 Mar 2015 20:22:38 -0800 (PST)
Received: by 10.50.117.7 with HTTP; Thu, 5 Mar 2015 20:22:38 -0800 (PST)
Received: by 10.50.117.7 with HTTP; Thu, 5 Mar 2015 20:22:38 -0800 (PST)
In-Reply-To: <1425607906-21810-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1425607906-21810-1-git-send-email-randy.e.witt@linux.intel.com>
Date: Thu, 5 Mar 2015 20:22:38 -0800
Message-ID: <CAMKF1soVNp5GsNKOkmZRCb9KUkzFcRW337smGBs9YNtVu3XNWQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix the problem of an empty journal on boot
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
X-List-Received-Date: Fri, 06 Mar 2015 04:22:40 -0000
Content-Type: multipart/alternative; boundary=001a11409accde4b7605109708d9

--001a11409accde4b7605109708d9
Content-Type: text/plain; charset=UTF-8

On Mar 5, 2015 6:13 PM, "Randy Witt" <randy.e.witt@linux.intel.com> wrote:
>
> systemd by default tries to write the journal to /var/log/journal.
> But base-files has a symlink /var/log -> /var/volatile/log. And
> /var/volatile is a tmpfs mount in /etc/fstab.
>
> If the journal service started before /var/volatile was mounted (which
> was the typical scenario) then the journal would appear empty since
> the old location was mounted over.
>
> This change fixes the problem by ensuring that the journal doesn't start
> until after the mount happens.
>

What happens if folks have a different fstab then default? Will it still
work

> [Yocto #7388]
>
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>  meta/recipes-core/systemd/systemd/journald-volatile.conf | 6 ++++++
>  meta/recipes-core/systemd/systemd_219.bb                 | 2 ++
>  2 files changed, 8 insertions(+)
>  create mode 100644
meta/recipes-core/systemd/systemd/journald-volatile.conf
>
> diff --git a/meta/recipes-core/systemd/systemd/journald-volatile.conf
b/meta/recipes-core/systemd/systemd/journald-volatile.conf
> new file mode 100644
> index 0000000..b11e160
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/journald-volatile.conf
> @@ -0,0 +1,6 @@
> +# If /var/volatile is a mount point then make sure to mount it before
> +# the journal starts. This is because base-files creates a symlink
> +# /var/log -> /var/volatile/log. And if the journal starts before the
mount
> +# happens, the journal will appear empty until restarted.
> +[Unit]
> +After=var-volatile.mount
> diff --git a/meta/recipes-core/systemd/systemd_219.bb
b/meta/recipes-core/systemd/systemd_219.bb
> index 3c4b6cf..2be66af 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -48,6 +48,7 @@ SRC_URI = "git://
anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
>             file://00-create-volatile.conf \
>             file://init \
>             file://run-ptest \
> +           file://journald-volatile.conf \
>            "
>
>  S = "${WORKDIR}/git"
> @@ -143,6 +144,7 @@ do_install() {
>         install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
>
>         install -m 0644 ${WORKDIR}/00-create-volatile.conf
${D}${sysconfdir}/tmpfiles.d/
> +       install -D -m 0644 ${WORKDIR}/journald-volatile.conf
${D}${systemd_unitdir}/system/systemd-journald.service.d/journald-volatile.conf
>
>         if
${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>                 install -d ${D}${sysconfdir}/init.d
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a11409accde4b7605109708d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Mar 5, 2015 6:13 PM, &quot;Randy Witt&quot; &lt;<a href=3D"mailto:randy.=
e.witt@linux.intel.com">randy.e.witt@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; systemd by default tries to write the journal to /var/log/journal.<br>
&gt; But base-files has a symlink /var/log -&gt; /var/volatile/log. And<br>
&gt; /var/volatile is a tmpfs mount in /etc/fstab.<br>
&gt;<br>
&gt; If the journal service started before /var/volatile was mounted (which=
<br>
&gt; was the typical scenario) then the journal would appear empty since<br=
>
&gt; the old location was mounted over.<br>
&gt;<br>
&gt; This change fixes the problem by ensuring that the journal doesn&#39;t=
 start<br>
&gt; until after the mount happens.<br>
&gt;</p>
<p dir=3D"ltr">What happens if folks have a different fstab then default? W=
ill it still=C2=A0 work </p>
<p dir=3D"ltr">&gt; [Yocto #7388]<br>
&gt;<br>
&gt; Signed-off-by: Randy Witt &lt;<a href=3D"mailto:randy.e.witt@linux.int=
el.com">randy.e.witt@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-core/systemd/systemd/journald-volatile.conf | 6 +++=
+++<br>
&gt; =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_219.bb">syst=
emd_219.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 ++<br>
&gt; =C2=A02 files changed, 8 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-core/systemd/systemd/journald-vo=
latile.conf<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/systemd/journald-volatile.conf =
b/meta/recipes-core/systemd/systemd/journald-volatile.conf<br>
&gt; new file mode 100644<br>
&gt; index 0000000..b11e160<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/systemd/systemd/journald-volatile.conf<br>
&gt; @@ -0,0 +1,6 @@<br>
&gt; +# If /var/volatile is a mount point then make sure to mount it before=
<br>
&gt; +# the journal starts. This is because base-files creates a symlink<br=
>
&gt; +# /var/log -&gt; /var/volatile/log. And if the journal starts before =
the mount<br>
&gt; +# happens, the journal will appear empty until restarted.<br>
&gt; +[Unit]<br>
&gt; +After=3Dvar-volatile.mount<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_219.b=
b">systemd_219.bb</a> b/meta/recipes-core/systemd/<a href=3D"http://systemd=
_219.bb">systemd_219.bb</a><br>
&gt; index 3c4b6cf..2be66af 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_219.bb">syst=
emd_219.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_219.bb">syst=
emd_219.bb</a><br>
&gt; @@ -48,6 +48,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://anongit.fr=
eedesktop.org/systemd/systemd;branch=3Dmaster;protocol=3D">anongit.freedesk=
top.org/systemd/systemd;branch=3Dmaster;protocol=3D</a><br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00-create-volatile.co=
nf \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://journald-volatile.con=
f \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; @@ -143,6 +144,7 @@ do_install() {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/*.rules ${D}${s=
ysconfdir}/udev/rules.d/<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/00-create-volat=
ile.conf ${D}${sysconfdir}/tmpfiles.d/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 0644 ${WORKDIR}/journald-vol=
atile.conf ${D}${systemd_unitdir}/system/systemd-journald.service.d/journal=
d-volatile.conf<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATUR=
ES&#39;,&#39;sysvinit&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D=
}${sysconfdir}/init.d<br>
&gt; --<br>
&gt; 1.9.3<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a11409accde4b7605109708d9--
