Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 304E56D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 10:34:37 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id i8so2714204qcq.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2014 02:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=T8UHm242vJnXy2+Kh/nMhgsh8jfhn8sWTdKK/dS23xo=;
	b=cRx8RRZhLDeTDYBGImeByjk9r1aGlAUAN+6aQHKGOZ6raqVkull20Da+4OcOmcrE7E
	luntxj1nIt1pLL02iUUAxU6dqCZthQ6gp1xVL2SdJY2xV1MYeFXwmrXF4h1cr+JqudGg
	wLEIcS97cQnog92PhpkKBfBgaxuIYehuCIZLB/utZ6SuBgdGlAuUgR75/zOuUPuRjxl1
	LzfrUO2BrsvuLH4NgxE9pxSC61n+W7W7YrUVA1Q2Nt3fDNFYNAHIDLvtrLGFKsXz7dts
	lEgVGp+fA1I2gjQVH7cdxePjOMWcZEZq2Oh1w5NmEF+IVLOhX/qgllsaCTYnLLHXIjBd
	YBew==
X-Received: by 10.140.21.179 with SMTP id 48mr10395100qgl.78.1391682877580;
	Thu, 06 Feb 2014 02:34:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Thu, 6 Feb 2014 02:34:17 -0800 (PST)
In-Reply-To: <1391245631-10681-1-git-send-email-diego.sueiro@gmail.com>
References: <1391245631-10681-1-git-send-email-diego.sueiro@gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 6 Feb 2014 08:34:17 -0200
Message-ID: <CAMCfZKFMzmfNxOSF+_QymoQyDi_U0c+NMkGFt=9Kihw3swn0KQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [for-dora] systemd: journald fix ignored disk space restrictions
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
X-List-Received-Date: Thu, 06 Feb 2014 10:34:38 -0000
Content-Type: multipart/alternative; boundary=001a11c11fee8eef6804f1ba6bbb

--001a11c11fee8eef6804f1ba6bbb
Content-Type: text/plain; charset=ISO-8859-1

Folks,

Any chance to get this up-streamed?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/


On Sat, Feb 1, 2014 at 7:07 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:

> The upstream bug report can be seen at:
> [Systemd #68161] -- https://bugs.freedesktop.org/show_bug.cgi?id=68161
>
> This backports patches come from 207 and need to address this in the 206
> version for dora branch.
>
> Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
> ---
>  ...ournald-fix-fd-leak-in-journal_file_empty.patch |   27 ++++++++++++++
>  ...urnald-fix-vacuuming-of-archived-journals.patch |   37
> ++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_206.bb           |    2 ++
>  3 files changed, 66 insertions(+)
>  create mode 100644
> meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
>
> diff --git
> a/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
> b/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
> new file mode 100644
> index 0000000..a83c858
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_file_empty.patch
> @@ -0,0 +1,27 @@
> +journald: fix fd leak in journal_file_empty
> +Before my previous patch, journal_file_empty wasn't be called with the
> +correct filename. Now that it's being called with the correct filename
> +it leaks file descriptors. This patch closes the file descriptors before
> +returning.
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +
> +
> +Index: systemd-206/src/journal/journal-vacuum.c
> +===================================================================
> +--- systemd-206.orig/src/journal/journal-vacuum.c      2013-07-21
> 19:43:28.146183128 -0300
> ++++ systemd-206/src/journal/journal-vacuum.c   2014-01-29
> 20:43:27.492343295 -0200
> +@@ -129,9 +129,9 @@
> + }
> +
> + static int journal_file_empty(int dir_fd, const char *name) {
> +-        int fd, r;
> ++        int r;
> +         le64_t n_entries;
> +-
> ++        _cleanup_close_ int fd;
> +         fd = openat(dir_fd, name,
> O_RDONLY|O_CLOEXEC|O_NOFOLLOW|O_NONBLOCK);
> +         if (fd < 0)
> +                 return -errno;
> +
> +Upstream-Status: Backport [207]
> diff --git
> a/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
> b/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
> new file mode 100644
> index 0000000..7c59200
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-journals.patch
> @@ -0,0 +1,37 @@
> +journald: fix vacuuming of archived journals
> +d_name is modified on line 227 so if the entire journal name is needed
> +again p must be used. Before this change when journal_file_empty was
> called
> +on archived journals it would always return with -2.
> +
> +Signed-off-by: George McCollister <george.mccollister@gmail.com>
> +
> +Index: systemd-206/src/journal/journal-vacuum.c
> +===================================================================
> +--- systemd-206.orig/src/journal/journal-vacuum.c      2014-01-29
> 20:43:27.492343295 -0200
> ++++ systemd-206/src/journal/journal-vacuum.c   2014-01-29
> 20:48:55.076356876 -0200
> +@@ -265,18 +265,18 @@
> +                         /* We do not vacuum active files or unknown
> files! */
> +                         continue;
> +
> +-                if (journal_file_empty(dirfd(d), de->d_name)) {
> ++                if (journal_file_empty(dirfd(d), p)) {
> +
> +                         /* Always vacuum empty non-online files. */
> +
> +-                        if (unlinkat(dirfd(d), de->d_name, 0) >= 0)
> +-                                log_debug("Deleted empty journal
> %s/%s.", directory, de->d_name);
> ++                        if (unlinkat(dirfd(d), p, 0) >= 0)
> ++                                log_debug("Deleted empty journal
> %s/%s.", directory, p);
> +                         else if (errno != ENOENT)
> +-                                log_warning("Failed to delete %s/%s:
> %m", directory, de->d_name);
> ++                                log_warning("Failed to delete %s/%s:
> %m", directory, p);
> +                         continue;
> +                 }
> +
> +-                patch_realtime(directory, de->d_name, &st, &realtime);
> ++                patch_realtime(directory, p, &st, &realtime);
> +
> +                 GREEDY_REALLOC(list, n_allocated, n_list + 1);
> +
> +
> +Upstream-Status: Backport [207]
> diff --git a/meta/recipes-core/systemd/systemd_206.bbb/meta/recipes-core/systemd/
> systemd_206.bb
> index a1a8bd7..e7d0f1f 100644
> --- a/meta/recipes-core/systemd/systemd_206.bb
> +++ b/meta/recipes-core/systemd/systemd_206.bb
> @@ -21,6 +21,8 @@ SRC_URI = "
> http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>             file://0001-use-CAP_MKNOD-ConditionCapability.patch \
>             file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
>             file://binfmt-install.patch \
> +           file://journald-fix-fd-leak-in-journal_file_empty.patch \
> +           file://journald-fix-vacuuming-of-archived-journals.patch \
>             file://touchscreen.rules \
>             ${UCLIBCPATCHES} \
>             file://00-create-volatile.conf \
> --
> 1.7.10.4
>
>

--001a11c11fee8eef6804f1ba6bbb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Folks,<div><br></div><div style>Any chance to get this=A0u=
p-streamed?</div><div class=3D"gmail_extra"><br clear=3D"all"><div><div dir=
=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br=
>Administrador do Embarcados<br>

<a href=3D"http://www.embarcados.com.br" target=3D"_blank">www.embarcados.c=
om.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div>
<br><br><div class=3D"gmail_quote">On Sat, Feb 1, 2014 at 7:07 AM, Diego Su=
eiro <span dir=3D"ltr">&lt;<a href=3D"mailto:diego.sueiro@gmail.com" target=
=3D"_blank">diego.sueiro@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">

The upstream bug report can be seen at:<br>
[Systemd #68161] -- <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D68161" target=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D=
68161</a><br>
<br>
This backports patches come from 207 and need to address this in the 206 ve=
rsion for dora branch.<br>
<br>
Signed-off-by: Diego Sueiro &lt;<a href=3D"mailto:diego.sueiro@gmail.com">d=
iego.sueiro@gmail.com</a>&gt;<br>
---<br>
=A0...ournald-fix-fd-leak-in-journal_file_empty.patch | =A0 27 ++++++++++++=
++<br>
=A0...urnald-fix-vacuuming-of-archived-journals.patch | =A0 37 ++++++++++++=
++++++++<br>
=A0meta/recipes-core/systemd/<a href=3D"http://systemd_206.bb" target=3D"_b=
lank">systemd_206.bb</a> =A0 =A0 =A0 =A0 =A0 | =A0 =A02 ++<br>
=A03 files changed, 66 insertions(+)<br>
=A0create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-fd-lea=
k-in-journal_file_empty.patch<br>
=A0create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-vacuum=
ing-of-archived-journals.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-jour=
nal_file_empty.patch b/meta/recipes-core/systemd/systemd/journald-fix-fd-le=
ak-in-journal_file_empty.patch<br>
new file mode 100644<br>
index 0000000..a83c858<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/journald-fix-fd-leak-in-journal_fil=
e_empty.patch<br>
@@ -0,0 +1,27 @@<br>
+journald: fix fd leak in journal_file_empty<br>
+Before my previous patch, journal_file_empty wasn&#39;t be called with the=
<br>
+correct filename. Now that it&#39;s being called with the correct filename=
<br>
+it leaks file descriptors. This patch closes the file descriptors before<b=
r>
+returning.<br>
+<br>
+Signed-off-by: George McCollister &lt;<a href=3D"mailto:george.mccollister=
@gmail.com">george.mccollister@gmail.com</a>&gt;<br>
+<br>
+<br>
+Index: systemd-206/src/journal/journal-vacuum.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- systemd-206.orig/src/journal/journal-vacuum.c =A0 =A0 =A02013-07-21 19=
:43:28.146183128 -0300<br>
++++ systemd-206/src/journal/journal-vacuum.c =A0 2014-01-29 20:43:27.49234=
3295 -0200<br>
+@@ -129,9 +129,9 @@<br>
+ }<br>
+<br>
+ static int journal_file_empty(int dir_fd, const char *name) {<br>
+- =A0 =A0 =A0 =A0int fd, r;<br>
++ =A0 =A0 =A0 =A0int r;<br>
+ =A0 =A0 =A0 =A0 le64_t n_entries;<br>
+-<br>
++ =A0 =A0 =A0 =A0_cleanup_close_ int fd;<br>
+ =A0 =A0 =A0 =A0 fd =3D openat(dir_fd, name, O_RDONLY|O_CLOEXEC|O_NOFOLLOW=
|O_NONBLOCK);<br>
+ =A0 =A0 =A0 =A0 if (fd &lt; 0)<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -errno;<br>
+<br>
+Upstream-Status: Backport [207]<br>
diff --git a/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-ar=
chived-journals.patch b/meta/recipes-core/systemd/systemd/journald-fix-vacu=
uming-of-archived-journals.patch<br>
new file mode 100644<br>
index 0000000..7c59200<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/journald-fix-vacuuming-of-archived-=
journals.patch<br>
@@ -0,0 +1,37 @@<br>
+journald: fix vacuuming of archived journals<br>
+d_name is modified on line 227 so if the entire journal name is needed<br>
+again p must be used. Before this change when journal_file_empty was calle=
d<br>
+on archived journals it would always return with -2.<br>
+<br>
+Signed-off-by: George McCollister &lt;<a href=3D"mailto:george.mccollister=
@gmail.com">george.mccollister@gmail.com</a>&gt;<br>
+<br>
+Index: systemd-206/src/journal/journal-vacuum.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- systemd-206.orig/src/journal/journal-vacuum.c =A0 =A0 =A02014-01-29 20=
:43:27.492343295 -0200<br>
++++ systemd-206/src/journal/journal-vacuum.c =A0 2014-01-29 20:48:55.07635=
6876 -0200<br>
+@@ -265,18 +265,18 @@<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* We do not vacuum activ=
e files or unknown files! */<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
+<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (journal_file_empty(dirfd(d), de-&gt;d=
_name)) {<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (journal_file_empty(dirfd(d), p)) {<br=
>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Always vacuum empty no=
n-online files. */<br>
+<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (unlinkat(dirfd(d), de=
-&gt;d_name, 0) &gt;=3D 0)<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0log_debug=
(&quot;Deleted empty journal %s/%s.&quot;, directory, de-&gt;d_name);<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (unlinkat(dirfd(d), p,=
 0) &gt;=3D 0)<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0log_debug=
(&quot;Deleted empty journal %s/%s.&quot;, directory, p);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if (errno !=3D ENOEN=
T)<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0log_warni=
ng(&quot;Failed to delete %s/%s: %m&quot;, directory, de-&gt;d_name);<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0log_warni=
ng(&quot;Failed to delete %s/%s: %m&quot;, directory, p);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
+<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0patch_realtime(directory, de-&gt;d_name, =
&amp;st, &amp;realtime);<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0patch_realtime(directory, p, &amp;st, &am=
p;realtime);<br>
+<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GREEDY_REALLOC(list, n_allocated, n_list =
+ 1);<br>
+<br>
+<br>
+Upstream-Status: Backport [207]<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_206.bb" ta=
rget=3D"_blank">systemd_206.bb</a> b/meta/recipes-core/systemd/<a href=3D"h=
ttp://systemd_206.bb" target=3D"_blank">systemd_206.bb</a><br>
index a1a8bd7..e7d0f1f 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_206.bb" target=3D=
"_blank">systemd_206.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_206.bb" target=3D=
"_blank">systemd_206.bb</a><br>
@@ -21,6 +21,8 @@ SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/s=
oftware/systemd/systemd-${PV}.tar.xz" target=3D"_blank">http://www.freedesk=
top.org/software/systemd/systemd-${PV}.tar.xz</a> \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://0001-use-CAP_MKNOD-ConditionCapability.patch=
 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://0001-Use-bin-mkdir-instead-of-host-mkdir-pat=
h.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://binfmt-install.patch \<br>
+ =A0 =A0 =A0 =A0 =A0 file://journald-fix-fd-leak-in-journal_file_empty.pat=
ch \<br>
+ =A0 =A0 =A0 =A0 =A0 file://journald-fix-vacuuming-of-archived-journals.pa=
tch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://touchscreen.rules \<br>
=A0 =A0 =A0 =A0 =A0 =A0 ${UCLIBCPATCHES} \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://00-create-volatile.conf \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.10.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11c11fee8eef6804f1ba6bbb--
