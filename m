Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 18C9573243
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:02:47 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so142189717wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 05:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nWNvRKMkA0DeDlwfi21c0oxjhdqDbOYxAZg5NgaAaVI=;
	b=Iyhq/ExKhYdN5UtNw2LFxIs4aFIqtUbl4eP+hmG5hAabhh5OKOVzBD6L1lM0kzDHzk
	5FgX6ORNuPhOjs3rR9I9eFzjkBQaDxyrKlTjkADDKFLJftKXSbnoF5CmKgCXETaKTjX0
	D1bqcgKLuU8LcGEjJcJYURr44NGCCUWyP28XQEFPIJJqvr2E3hl0P8Q7OMjy+2OpCYRZ
	KU/3d5sZQrwnzZv5ASKxSrXqahaqNAIYR2tDDWs0hOGwxxnlOQpFeGxSLH5XBo2LSbs3
	nJMZqf1Xi/V8fwSvakQsu7bkJiPp//np4Z856tWC8txo+DBn0L0yDBUb8oWl2VMAiOAF
	bf5Q==
X-Gm-Message-State: ALoCoQmbfWEFwDPCR+q7GYLQ9/VbHK3QS/D/C6v51vxPVu9u/eIg0ol2dr5H+i+C1DcSETQsrXqA
X-Received: by 10.180.88.198 with SMTP id bi6mr13717935wib.75.1442836967288;
	Mon, 21 Sep 2015 05:02:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Mon, 21 Sep 2015 05:02:17 -0700 (PDT)
In-Reply-To: <1442833766-16676-1-git-send-email-net147@gmail.com>
References: <1442833766-16676-1-git-send-email-net147@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 21 Sep 2015 15:02:17 +0300
Message-ID: <CAHiDW_EC9LGaxGA7b9=K4kH5iEsw1XrZ0Y2ngs0p-EG0_LN7gg@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: create opkg.lock in /run instead of /var/run
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
X-List-Received-Date: Mon, 21 Sep 2015 12:02:48 -0000
Content-Type: multipart/alternative; boundary=f46d0443040ce78ae3052040a80b

--f46d0443040ce78ae3052040a80b
Content-Type: text/plain; charset=UTF-8

On 21 September 2015 at 14:09, Jonathan Liu <net147@gmail.com> wrote:

> This avoids a "Could not unlink" warning when extracting a /var/run
> symbolic link pointing to /run from the base-files package as it is
> unable to unlink the /var/run directory when it contains opkg.lock.
>
> This also fixes an issue where /var/run is created as a directory
> instead of a symbolic link to /run.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  ...reate-opkg.lock-in-run-instead-of-var-run.patch | 34
> ++++++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg_0.3.0.bb           |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644
> meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
>
> diff --git
> a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
> b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
> new file mode 100644
> index 0000000..255021b
> --- /dev/null
> +++
> b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
> @@ -0,0 +1,34 @@
> +From a4628a6171f393add9a2b287483ca39bb72b4dd6 Mon Sep 17 00:00:00 2001
> +From: Jonathan Liu <net147@gmail.com>
> +Date: Mon, 21 Sep 2015 20:23:23 +1000
> +Subject: [PATCH] opkg_conf: create opkg.lock in /run instead of /var/run
> +
> +This avoids a "Could not unlink" warning when extracting a /var/run
> +symbolic link pointing to /run from a package as it is unable to
> +unlink the /var/run directory when it contains opkg.lock.
> +
> +This also fixes an issue where /var/run is created as a directory
> +instead of a symbolic link to /run.
> +
> +Upstream-Status: Inappropriate [OE-Specific]
>

Isn't using /run for this appropriate for everyone? I would have expected
this to be an uncontroversial change.

Jussi


+Signed-off-by: Jonathan Liu <net147@gmail.com>
> +---
> + libopkg/opkg_conf.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
> +index 7bca948..5a1bc44 100644
> +--- a/libopkg/opkg_conf.h
> ++++ b/libopkg/opkg_conf.h
> +@@ -40,7 +40,7 @@ extern "C" {
> + #define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
> + #define OPKG_CONF_DEFAULT_CACHE_DIR     "/var/cache/opkg"
> + #define OPKG_CONF_DEFAULT_CONF_FILE_DIR "/etc/opkg"
> +-#define OPKG_CONF_DEFAULT_LOCK_FILE     "/var/run/opkg.lock"
> ++#define OPKG_CONF_DEFAULT_LOCK_FILE     "/run/opkg.lock"
> +
> + /* In case the config file defines no dest */
> + #define OPKG_CONF_DEFAULT_DEST_NAME "root"
> +--
> +2.5.0
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
> b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
> index f4dbb2d..08fb62c 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.3.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.3.0.bb
> @@ -15,6 +15,7 @@ SRC_URI = "
> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
>             file://opkg-configure.service \
>             file://opkg.conf \
>
> file://0001-opkg_archive-add-support-for-empty-compressed-files.patch \
> +
>  file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
>  "
>
>  SRC_URI[md5sum] = "3412cdc71d78b98facc84b19331ec64e"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d0443040ce78ae3052040a80b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
1 September 2015 at 14:09, Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">This avoids a &quot;Could not unlink=
&quot; warning when extracting a /var/run<br>
symbolic link pointing to /run from the base-files package as it is<br>
unable to unlink the /var/run directory when it contains opkg.lock.<br>
<br>
This also fixes an issue where /var/run is created as a directory<br>
instead of a symbolic link to /run.<br>
<br>
Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0...reate-opkg.lock-in-run-instead-of-var-run.patch | 34 +++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 35 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg_conf-cre=
ate-opkg.lock-in-run-instead-of-var-run.patch<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.loc=
k-in-run-instead-of-var-run.patch b/meta/recipes-devtools/opkg/opkg/0001-op=
kg_conf-create-opkg.lock-in-run-instead-of-var-run.patch<br>
new file mode 100644<br>
index 0000000..255021b<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-ru=
n-instead-of-var-run.patch<br>
@@ -0,0 +1,34 @@<br>
+From a4628a6171f393add9a2b287483ca39bb72b4dd6 Mon Sep 17 00:00:00 2001<br>
+From: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@gmail.co=
m</a>&gt;<br>
+Date: Mon, 21 Sep 2015 20:23:23 +1000<br>
+Subject: [PATCH] opkg_conf: create opkg.lock in /run instead of /var/run<b=
r>
+<br>
+This avoids a &quot;Could not unlink&quot; warning when extracting a /var/=
run<br>
+symbolic link pointing to /run from a package as it is unable to<br>
+unlink the /var/run directory when it contains opkg.lock.<br>
+<br>
+This also fixes an issue where /var/run is created as a directory<br>
+instead of a symbolic link to /run.<br>
+<br>
+Upstream-Status: Inappropriate [OE-Specific]<br>
</blockquote><div><br></div><div>Isn&#39;t using /run for this appropriate =
for everyone? I would have expected this to be an uncontroversial change.</=
div><div><br></div><div>Jussi</div><div><br></div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">+Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net=
147@gmail.com">net147@gmail.com</a>&gt;<br>
+---<br>
+ libopkg/opkg_conf.h | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h<br>
+index 7bca948..5a1bc44 100644<br>
+--- a/libopkg/opkg_conf.h<br>
++++ b/libopkg/opkg_conf.h<br>
+@@ -40,7 +40,7 @@ extern &quot;C&quot; {<br>
+ #define OPKG_CONF_DEFAULT_STATUS_FILE=C2=A0 =C2=A0&quot;/var/lib/opkg/sta=
tus&quot;<br>
+ #define OPKG_CONF_DEFAULT_CACHE_DIR=C2=A0 =C2=A0 =C2=A0&quot;/var/cache/o=
pkg&quot;<br>
+ #define OPKG_CONF_DEFAULT_CONF_FILE_DIR &quot;/etc/opkg&quot;<br>
+-#define OPKG_CONF_DEFAULT_LOCK_FILE=C2=A0 =C2=A0 =C2=A0&quot;/var/run/opk=
g.lock&quot;<br>
++#define OPKG_CONF_DEFAULT_LOCK_FILE=C2=A0 =C2=A0 =C2=A0&quot;/run/opkg.lo=
ck&quot;<br>
+<br>
+ /* In case the config file defines no dest */<br>
+ #define OPKG_CONF_DEFAULT_DEST_NAME &quot;root&quot;<br>
+--<br>
+2.5.0<br>
+<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.3.0.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.3.0.bb</a><br>
index f4dbb2d..08fb62c 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.3.0.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.3.0.bb</a><br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoprojec=
t.org/releases/${BPN}/${BPN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_bl=
ank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opkg-configure.service \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opkg.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-opkg_archive-add-supp=
ort-for-empty-compressed-files.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-opkg_conf-create-opkg=
.lock-in-run-instead-of-var-run.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;3412cdc71d78b98facc84b19331ec64e&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--f46d0443040ce78ae3052040a80b--
