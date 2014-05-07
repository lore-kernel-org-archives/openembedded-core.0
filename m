Return-Path: <nickdademo@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id CF01860167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 08:51:00 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id j17so824985oag.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SmXHe5gHYAKqmQDvo475yLwZ0qhA2GUxaopgMcEEs1M=;
	b=Owl4ybOGqMIMHdNRMuhX1ANp1ITBa/msnxCIB6tAN2t7mzkPwjDob63wJaF/MLh1ul
	CBCcACRAnUMZ/BtzyDGGK8aYX8WAijp6wspFBMAAq68Zvvgt5o5IgJzCCNPOf8XYXGyx
	e8SQvdNBOuVM98D1thbeRmAriwD4QOpb0ZtbPz5z7aJw8tlccmC/a9DMounkBpE8bS3Z
	EYgo3AhW8VfvNTaHRVnHPjlb5oOgLNu2w++sKQG5w7LlekgBcJhXF7tvvJ3HS5OJh2p4
	Ju/YtHv3msU7/0li5h9VqEIi+MWnmTuBAZlaSRIe38XyVsRvwvn3RIbU32dnOGKE7Yc1
	9+Ew==
X-Received: by 10.60.176.9 with SMTP id ce9mr13713500oec.55.1399452661800;
	Wed, 07 May 2014 01:51:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.85.33 with HTTP; Wed, 7 May 2014 01:50:41 -0700 (PDT)
In-Reply-To: <1399257033-7155-1-git-send-email-ming.liu@windriver.com>
References: <1399257033-7155-1-git-send-email-ming.liu@windriver.com>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Wed, 7 May 2014 18:50:41 +1000
Message-ID: <CANR6C57rRhM=uSs9segE=ZcGMVaT4EUFbP8PCzg2F_=_REd28w@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] ldconfig-native: also default to lib32 and lib64 directories
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
X-List-Received-Date: Wed, 07 May 2014 08:51:05 -0000
Content-Type: multipart/alternative; boundary=089e0118226cc9626304f8cb769b

--089e0118226cc9626304f8cb769b
Content-Type: text/plain; charset=ISO-8859-1

This patch actually breaks my MULTILIB build (Intel NUC platform).
I'll try and get some more details.


On Mon, May 5, 2014 at 12:30 PM, Ming Liu <ming.liu@windriver.com> wrote:

> make ldconfig default to /lib+/usr/lib, /lib32+/usr/lib32 and
> /lib64+/usr/lib64 on bi-ABI architectures.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  .../ldconfig-default-to-all-multilib-dirs.patch    | 37
> ++++++++++++++++++++++
>  meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |  4 ++-
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
>
> diff --git
> a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
> b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
> new file mode 100644
> index 0000000..5ed4f6f
> --- /dev/null
> +++
> b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
> @@ -0,0 +1,37 @@
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +make ldconfig default to both /lib+/usr/lib, /lib32+/usr/lib32 and
> +/lib64+/usr/lib64 on bi-ABI architectures.
> +
> +---
> + ldconfig.c |   10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff -urpN a/ldconfig.c b/ldconfig.c
> +--- a/ldconfig.c
> ++++ b/ldconfig.c
> +@@ -52,7 +52,11 @@
> +
> + #define SYSCONFDIR "/etc"
> + #define LIBDIR "/usr/lib"
> ++#define LIBDIR32 "/usr/lib32"
> ++#define LIBDIR64 "/usr/lib64"
> + #define SLIBDIR "/lib"
> ++#define SLIBDIR32 "/lib32"
> ++#define SLIBDIR64 "/lib64"
> + # define N_(msgid)  msgid
> + #define _(msg) msg
> +
> +@@ -1373,6 +1377,12 @@ main (int argc, char **argv)
> +       add_system_dir (SLIBDIR);
> +       if (strcmp (SLIBDIR, LIBDIR))
> +       add_system_dir (LIBDIR);
> ++      add_system_dir (SLIBDIR32);
> ++      if (strcmp (SLIBDIR32, LIBDIR32))
> ++      add_system_dir (LIBDIR32);
> ++      add_system_dir (SLIBDIR64);
> ++      if (strcmp (SLIBDIR64, LIBDIR64))
> ++      add_system_dir (LIBDIR64);
> +     }
> +
> +   const char *aux_cache_file = _PATH_LDCONFIG_AUX_CACHE;
> diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bbb/meta/recipes-core/eglibc/
> ldconfig-native_2.12.1.bb
> index d7bc444..75ffbf6 100644
> --- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> +++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
> @@ -10,7 +10,9 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
>             file://32and64bit.patch \
>             file://endian-ness_handling.patch \
>             file://flag_fix.patch \
> -           file://endianess-header.patch"
> +           file://endianess-header.patch \
> +           file://ldconfig-default-to-all-multilib-dirs.patch \
> +"
>
>  PR = "r2"
>
> --
> 1.8.4.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0118226cc9626304f8cb769b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch actually breaks my MULTILIB build (Intel NUC pl=
atform).<br>I&#39;ll try and get some more details.<br><div><div class=3D"g=
mail_extra">
<br><br><div class=3D"gmail_quote">On Mon, May 5, 2014 at 12:30 PM, Ming Li=
u <span dir=3D"ltr">&lt;<a href=3D"mailto:ming.liu@windriver.com" target=3D=
"_blank">ming.liu@windriver.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

make ldconfig default to /lib+/usr/lib, /lib32+/usr/lib32 and<br>
/lib64+/usr/lib64 on bi-ABI architectures.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@windriver.com">ming.=
liu@windriver.com</a>&gt;<br>
---<br>
=A0.../ldconfig-default-to-all-multilib-dirs.patch =A0 =A0| 37 ++++++++++++=
++++++++++<br>
=A0meta/recipes-core/eglibc/<a href=3D"http://ldconfig-native_2.12.1.bb" ta=
rget=3D"_blank">ldconfig-native_2.12.1.bb</a> | =A04 ++-<br>
=A02 files changed, 40 insertions(+), 1 deletion(-)<br>
=A0create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldcon=
fig-default-to-all-multilib-dirs.patch<br>
<br>
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-defau=
lt-to-all-multilib-dirs.patch b/meta/recipes-core/eglibc/ldconfig-native-2.=
12.1/ldconfig-default-to-all-multilib-dirs.patch<br>
new file mode 100644<br>
index 0000000..5ed4f6f<br>
--- /dev/null<br>
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-a=
ll-multilib-dirs.patch<br>
@@ -0,0 +1,37 @@<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+make ldconfig default to both /lib+/usr/lib, /lib32+/usr/lib32 and<br>
+/lib64+/usr/lib64 on bi-ABI architectures.<br>
+<br>
+---<br>
+ ldconfig.c | =A0 10 ++++++++++<br>
+ 1 file changed, 10 insertions(+)<br>
+<br>
+diff -urpN a/ldconfig.c b/ldconfig.c<br>
+--- a/ldconfig.c<br>
++++ b/ldconfig.c<br>
+@@ -52,7 +52,11 @@<br>
+<br>
+ #define SYSCONFDIR &quot;/etc&quot;<br>
+ #define LIBDIR &quot;/usr/lib&quot;<br>
++#define LIBDIR32 &quot;/usr/lib32&quot;<br>
++#define LIBDIR64 &quot;/usr/lib64&quot;<br>
+ #define SLIBDIR &quot;/lib&quot;<br>
++#define SLIBDIR32 &quot;/lib32&quot;<br>
++#define SLIBDIR64 &quot;/lib64&quot;<br>
+ # define N_(msgid) =A0msgid<br>
+ #define _(msg) msg<br>
+<br>
+@@ -1373,6 +1377,12 @@ main (int argc, char **argv)<br>
+ =A0 =A0 =A0 add_system_dir (SLIBDIR);<br>
+ =A0 =A0 =A0 if (strcmp (SLIBDIR, LIBDIR))<br>
+ =A0 =A0 =A0 add_system_dir (LIBDIR);<br>
++ =A0 =A0 =A0add_system_dir (SLIBDIR32);<br>
++ =A0 =A0 =A0if (strcmp (SLIBDIR32, LIBDIR32))<br>
++ =A0 =A0 =A0add_system_dir (LIBDIR32);<br>
++ =A0 =A0 =A0add_system_dir (SLIBDIR64);<br>
++ =A0 =A0 =A0if (strcmp (SLIBDIR64, LIBDIR64))<br>
++ =A0 =A0 =A0add_system_dir (LIBDIR64);<br>
+ =A0 =A0 }<br>
+<br>
+ =A0 const char *aux_cache_file =3D _PATH_LDCONFIG_AUX_CACHE;<br>
diff --git a/meta/recipes-core/eglibc/<a href=3D"http://ldconfig-native_2.1=
2.1.bb" target=3D"_blank">ldconfig-native_2.12.1.bb</a> b/meta/recipes-core=
/eglibc/<a href=3D"http://ldconfig-native_2.12.1.bb" target=3D"_blank">ldco=
nfig-native_2.12.1.bb</a><br>


index d7bc444..75ffbf6 100644<br>
--- a/meta/recipes-core/eglibc/<a href=3D"http://ldconfig-native_2.12.1.bb"=
 target=3D"_blank">ldconfig-native_2.12.1.bb</a><br>
+++ b/meta/recipes-core/eglibc/<a href=3D"http://ldconfig-native_2.12.1.bb"=
 target=3D"_blank">ldconfig-native_2.12.1.bb</a><br>
@@ -10,7 +10,9 @@ SRC_URI =3D &quot;file://ldconfig-native-2.12.1.tar.bz2 \=
<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://32and64bit.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://endian-ness_handling.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://flag_fix.patch \<br>
- =A0 =A0 =A0 =A0 =A0 file://endianess-header.patch&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 file://endianess-header.patch \<br>
+ =A0 =A0 =A0 =A0 =A0 file://ldconfig-default-to-all-multilib-dirs.patch \<=
br>
+&quot;<br>
<br>
=A0PR =3D &quot;r2&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.4.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div></div></div>

--089e0118226cc9626304f8cb769b--
