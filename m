Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.40020.1589802952590816568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 04:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Eh9d3YvM;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id j21so3891684ejy.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 04:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C06Hl86xhTYlB5wkybb82Mvo2PFxwFN7WGBANyuTq4Y=;
        b=Eh9d3YvMobsWmrZDwt3psCSGq+D4qjlP8lM7LHziTTmHpQOHapphtQCUFZFKYaXm8G
         abo4a/arUNX73f6AEUFHckIBB+gV4BNjuir3Os9YaspzKD4EplH5nB4L2U8njvAM3UgU
         pDkt7vQA+uEUA6CkDMJI110GNAGlu+O8q49zfXVVGkYq1XKYj24KCfKp7o8qf7XSviVN
         TV9TMx6Ekq40LX5Dnrbjg/erPjbxErt0GIGf/jxjfgdbuj6hI+alKUnYuxGBvy68x8FC
         L3cRteMSSTAh8igr3d1fzGCiV1XtWpuKVXg7vwuSXv5m4DNhJFi/a79PC52UfCSGeFbK
         iouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C06Hl86xhTYlB5wkybb82Mvo2PFxwFN7WGBANyuTq4Y=;
        b=LiaV5omg9QQFsJIMagozMzJU29QyxjWuLV+BqTUmdEHERU4tsuhUFFBStwYV58wWoy
         Y5ocwtOowt/XPsxvxA4qmHpeo3Jiu7Nz8kVUCNLAocWDLKnKr8BTfkZsfyvor7r4oHvR
         iklU/ZUMyINxyBPU6cRDGh9NneQPHUySP14IijILRF1jB2x65FHn8O/fEhTDymHxg/bE
         vncUyFo+nFg+Jct+V8vXxzbIh0BVH0qNDNfZTcJqMrweI4S2LSwGzRuft20MdiBaJrtP
         qxlBvU7s6Pd3r+3FjHTOAVdfKfBWW+ewaUmS9DKJAKiX6VhoC9z68BAVCVidSMbguygR
         txyw==
X-Gm-Message-State: AOAM531wSqDxhfox6psOg0RgNDmUwIvUU2lSxyMBwyoILZJDMb7PdPHd
	00xncDlCvdfNIBlqC987nJxjk1trsBiLXO97TRM=
X-Google-Smtp-Source: ABdhPJxc3ydFwyjCiCGk4YRKyKh+1B+Tijup/j10dmpYbbKxpx9aygyKL2LXbaOxpl0Vzo16Z5Ijg4PML4HUEWYYGSQ=
X-Received: by 2002:a17:907:420e:: with SMTP id oh22mr14578969ejb.320.1589802950901;
 Mon, 18 May 2020 04:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113617.31831-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20200518113617.31831-1-rasmus.villemoes@prevas.dk>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 18 May 2020 13:55:39 +0200
Message-ID: <CA+chaQdZQRYMwbaAdE-TE9SNuJpwO=0Z6Qy7SR6kZxN7kpJ3qA@mail.gmail.com>
Subject: Re: [PATCH] glibc: move ld.so.conf back to main package
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	Andreas Oberritter <obi@opendreambox.org>
Content-Type: multipart/alternative; boundary="00000000000026c51d05a5ead8aa"

--00000000000026c51d05a5ead8aa
Content-Type: text/plain; charset="UTF-8"

This won't work, because as soon as glibc is upgraded with package
management, the ldconfig files will be restored and there won't be any
do_rootfs hook to remove it.

Why isn't ldconfig installed in your setup in first place? RRECOMMENDS
should be enough to pull it into every image by default.

On Mon, May 18, 2020 at 1:36 PM Rasmus Villemoes <rasmus.villemoes@prevas.dk>
wrote:

> There are cases where one doesn't want ldconfig on target (e.g. for
> read-only root filesystems, it's rather pointless), yet one still
> needs ld.so.conf to be present at image build time:
>
> When some recipe installs libraries to a non-standard location, and
> dutifully drops in a file in /etc/ld.so.conf.d/foo.conf, we need the
> ld.so.conf containing the
>
>   include /etc/ld.so.conf.d/*.conf
>
> stanza to get those other locations picked up.
>
> So change the packaging logic so that there's always an ld.so.conf
> present when the build-time ldconfig runs, then delete it (and the .d
> directory) when they would serve no purpose at run-time.
>
> While here, fix a typo in the bb.note so one can just copy-paste the
> line from the log-file and redo the command.
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta/lib/oe/rootfs.py                     | 11 ++++++++++-
>  meta/recipes-core/glibc/glibc-package.inc |  4 ++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index cd65e62030..0ff4278d15 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -297,9 +297,18 @@ class Rootfs(object, metaclass=ABCMeta):
>
>      def _run_ldconfig(self):
>          if self.d.getVar('LDCONFIGDEPEND'):
> -            bb.note("Executing: ldconfig -r" + self.image_rootfs + "-c
> new -v")
> +            bb.note("Executing: ldconfig -r " + self.image_rootfs + " -c
> new -v")
>              self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs,
> '-c',
>                                    'new', '-v'])
> +        # If DISTRO_FEATURES doesn't contain ldconfig, and the
> +        # ldconfig binary hasn't been pulled in explicitly, remove the
> +        # configuration file(s) from the image.
> +        keep_conf = bb.utils.contains("DISTRO_FEATURES", "ldconfig",
> True, False, self.d)
> +        keep_conf = keep_conf or
> os.path.exists(os.path.join(self.image_rootfs,
> self.d.getVar('base_sbindir'), 'ldconfig'))
> +        if not keep_conf:
> +            sysconfdir = os.path.join(self.image_rootfs,
> self.d.getVar('sysconfdir'))
> +            bb.utils.remove(os.path.join(sysconfdir, 'ld.so.conf'))
> +            bb.utils.remove(os.path.join(sysconfdir, 'ld.so.conf.d'),
> recurse=True)
>
>      def _check_for_kernel_modules(self, modules_dir):
>          for root, dirs, files in os.walk(modules_dir, topdown=True):
> diff --git a/meta/recipes-core/glibc/glibc-package.inc
> b/meta/recipes-core/glibc/glibc-package.inc
> index aa8e059216..387e90a0ab 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -23,9 +23,9 @@ ARCH_DYNAMIC_LOADER_aarch64 =
> "ld-linux-${TARGET_ARCH}.so.1"
>  libc_baselibs_append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER',
> '', '', '${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}', d)}"
>  INSANE_SKIP_${PN}_append_aarch64 = " libdir"
>
> -FILES_${PN} = "${libc_baselibs} ${libexecdir}/*"
> +FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so.conf"
>  RRECOMMENDS_${PN} = "${@bb.utils.filter('DISTRO_FEATURES', 'ldconfig',
> d)}"
> -FILES_ldconfig = "${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
> +FILES_ldconfig = "${base_sbindir}/ldconfig"
>  FILES_ldd = "${bindir}/ldd"
>  FILES_libsegfault = "${base_libdir}/libSegFault*"
>  FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
> --
> 2.23.0
>
>

--00000000000026c51d05a5ead8aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This won&#39;t work, because as soon as glibc is upgraded =
with package management, the ldconfig files will be restored and there won&=
#39;t be any do_rootfs hook to remove it.<div><br></div><div>Why isn&#39;t =
ldconfig installed in your setup in first place? RRECOMMENDS should be enou=
gh to pull it into every image by default.</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 18, 2020 at 1:3=
6 PM Rasmus Villemoes &lt;<a href=3D"mailto:rasmus.villemoes@prevas.dk">ras=
mus.villemoes@prevas.dk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">There are cases where one doesn&#39;t want ldconfig =
on target (e.g. for<br>
read-only root filesystems, it&#39;s rather pointless), yet one still<br>
needs ld.so.conf to be present at image build time:<br>
<br>
When some recipe installs libraries to a non-standard location, and<br>
dutifully drops in a file in /etc/ld.so.conf.d/foo.conf, we need the<br>
ld.so.conf containing the<br>
<br>
=C2=A0 include /etc/ld.so.conf.d/*.conf<br>
<br>
stanza to get those other locations picked up.<br>
<br>
So change the packaging logic so that there&#39;s always an ld.so.conf<br>
present when the build-time ldconfig runs, then delete it (and the .d<br>
directory) when they would serve no purpose at run-time.<br>
<br>
While here, fix a typo in the bb.note so one can just copy-paste the<br>
line from the log-file and redo the command.<br>
<br>
Signed-off-by: Rasmus Villemoes &lt;<a href=3D"mailto:rasmus.villemoes@prev=
as.dk" target=3D"_blank">rasmus.villemoes@prevas.dk</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++++++-<br>
=C2=A0meta/recipes-core/glibc/glibc-package.inc |=C2=A0 4 ++--<br>
=C2=A02 files changed, 12 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py<br>
index cd65e62030..0ff4278d15 100644<br>
--- a/meta/lib/oe/rootfs.py<br>
+++ b/meta/lib/oe/rootfs.py<br>
@@ -297,9 +297,18 @@ class Rootfs(object, metaclass=3DABCMeta):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _run_ldconfig(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.d.getVar(&#39;LDCONFIGDEPEND&#39;=
):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Executing: ldconfi=
g -r&quot; + self.image_rootfs + &quot;-c new -v&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Executing: ldconfi=
g -r &quot; + self.image_rootfs + &quot; -c new -v&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._exec_shell_cmd([&#39;=
ldconfig&#39;, &#39;-r&#39;, self.image_rootfs, &#39;-c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;new&#39;, &#39;-v&=
#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If DISTRO_FEATURES doesn&#39;t contain ldcon=
fig, and the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # ldconfig binary hasn&#39;t been pulled in ex=
plicitly, remove the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # configuration file(s) from the image.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 keep_conf =3D bb.utils.contains(&quot;DISTRO_F=
EATURES&quot;, &quot;ldconfig&quot;, True, False, self.d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 keep_conf =3D keep_conf or os.path.exists(os.p=
ath.join(self.image_rootfs, self.d.getVar(&#39;base_sbindir&#39;), &#39;ldc=
onfig&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not keep_conf:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysconfdir =3D os.path.join(self=
.image_rootfs, self.d.getVar(&#39;sysconfdir&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(os.path.join(sys=
confdir, &#39;ld.so.conf&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(os.path.join(sys=
confdir, &#39;ld.so.conf.d&#39;), recurse=3DTrue)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _check_for_kernel_modules(self, modules_dir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for root, dirs, files in os.walk(modules_=
dir, topdown=3DTrue):<br>
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc<br>
index aa8e059216..387e90a0ab 100644<br>
--- a/meta/recipes-core/glibc/glibc-package.inc<br>
+++ b/meta/recipes-core/glibc/glibc-package.inc<br>
@@ -23,9 +23,9 @@ ARCH_DYNAMIC_LOADER_aarch64 =3D &quot;ld-linux-${TARGET_A=
RCH}.so.1&quot;<br>
=C2=A0libc_baselibs_append =3D &quot; ${@oe.utils.conditional(&#39;ARCH_DYN=
AMIC_LOADER&#39;, &#39;&#39;, &#39;&#39;, &#39;${root_prefix}/lib/${ARCH_DY=
NAMIC_LOADER}&#39;, d)}&quot;<br>
=C2=A0INSANE_SKIP_${PN}_append_aarch64 =3D &quot; libdir&quot;<br>
<br>
-FILES_${PN} =3D &quot;${libc_baselibs} ${libexecdir}/*&quot;<br>
+FILES_${PN} =3D &quot;${libc_baselibs} ${libexecdir}/* ${sysconfdir}/ld.so=
.conf&quot;<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#=
39;, &#39;ldconfig&#39;, d)}&quot;<br>
-FILES_ldconfig =3D &quot;${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf=
&quot;<br>
+FILES_ldconfig =3D &quot;${base_sbindir}/ldconfig&quot;<br>
=C2=A0FILES_ldd =3D &quot;${bindir}/ldd&quot;<br>
=C2=A0FILES_libsegfault =3D &quot;${base_libdir}/libSegFault*&quot;<br>
=C2=A0FILES_libcidn =3D &quot;${base_libdir}/libcidn-*.so ${base_libdir}/li=
bcidn.so.*&quot;<br>
-- <br>
2.23.0<br>
<br>
</blockquote></div>

--00000000000026c51d05a5ead8aa--
