Return-Path: <krussell7711@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8516871951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 20:01:12 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id v68so6049778vka.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 13:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=sxSiXDJb5dWf3F3rfnpomu4uMTLT87xhN4Q0NBdzoAg=;
	b=BYVUNQaaHsLgPJFRr522EocgYuLqCh0xTlFcxVWN5Qv7xrpM+0YFlQPsoMDg2OTYGm
	dlJSR0TGiWnaqOLgmBMMXeHZhVq9MQID7SIqNIpm2SFu4xh8eugdsaDORIA4unuWqat7
	QdjCQ9d/alaZkzK4RqXVXV0V22Ybz1egZZbVeKDgWapGdArUyISwcVdowleSM1nY9WmS
	JFluAcvoXRC2fORNH9RFfcP8D+So0VHYsacoEeLbKXWyuj2QyZaFdPJZ6POsobE0H+f7
	Tvqo1Pdv8NMPvmI79/3+GvKJFw+L4Ed9f+eC+cHSQzJKoYBHvf9w8TlDZ614EGFD0VFL
	J4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=sxSiXDJb5dWf3F3rfnpomu4uMTLT87xhN4Q0NBdzoAg=;
	b=d31E+N0/Hk1O1m1HZwnWAiv2qbxoA/TFsG+8fsVVBFTtw30OkGa3S5MLN9kd6y67i4
	FYi9i/+E4ne6um+NU9Fll4Bg01EnRQ4q5Avh6Z1txgLWgdux6+gNQL8BNqXFzPs454a7
	UZTiEVutAWYw/dTwmLsDCLyOiKbZkt5XSU+o+zFPHBXIh3pCRFRmBZd+Yr43z8h4Z4Um
	SZX575XLYGzzi9ON5JZ5bgAFP3NQQdJqmjSmep7qFOUx8BX5mRW15BB85hp2kHQesYMO
	wJPRyOmTrtbZ0283uOmMnIDQzcF67J8Pp4WL0khpqLSy/4qAsCcnfN9jgE2x8TcUJAFV
	l0Ww==
X-Gm-Message-State: AOPr4FVnNj0hMhFvJ8S5k2eQNG7XhmHHhlMLN1OU4LgM8oURPR5PNM28sP1CYrR2MSJHkY/EXCipAgRwNeaPXQ==
X-Received: by 10.176.0.184 with SMTP id 53mr2726701uaj.121.1462996872073;
	Wed, 11 May 2016 13:01:12 -0700 (PDT)
MIME-Version: 1.0
Sender: krussell7711@gmail.com
Received: by 10.31.189.200 with HTTP; Wed, 11 May 2016 13:00:52 -0700 (PDT)
In-Reply-To: <1435902151-4217-1-git-send-email-rongqing.li@windriver.com>
References: <1435902151-4217-1-git-send-email-rongqing.li@windriver.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Wed, 11 May 2016 16:00:52 -0400
X-Google-Sender-Auth: ASc6PlNtRJLP4nGcYsUSqE80FOw
Message-ID: <CAFrQVPPFygTrvh12uxDqUmcc+Brz=chU3geE6KfyLr+-C4QLYQ@mail.gmail.com>
To: rongqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mklibs-native: two fixes
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
X-List-Received-Date: Wed, 11 May 2016 20:01:12 -0000
Content-Type: multipart/alternative; boundary=001a11c16614de1aff0532968011

--001a11c16614de1aff0532968011
Content-Type: text/plain; charset=UTF-8

What was the intent of the last hunk in fix_cross_compile.patch?  It
essentially undoes the following upstream mklibs change, but it doesn't
seem related to whether or not dpkg is used.

http://bazaar.launchpad.net/~ubuntu-installer/mklibs/master/revision/101
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=256998

It also causes breakage in image-mklibs.bbclass in a multilib setup where
there are symlinks to the dynamic loader in both /lib and /lib64 (find
returns more than one result when trying to cp out of mklibs/dest).

Should that hunk be reverted?

On Fri, Jul 3, 2015 at 1:42 AM, <rongqing.li@windriver.com> wrote:

> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>
> 1. Show GNU unique symbols as provided symbols
> 2. Remove dependency on dpkg
> Both have been submitted to mklibs maillist:
> https://lists.debian.org/debian-boot/2015/07/msg00018.html
> https://lists.debian.org/debian-boot/2015/07/msg00004.html
>
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../mklibs/files/fix_cross_compile.patch           | 81
> ++++++++++++++++++++++
>  ...ow-GNU-unique-symbols-as-provided-symbols.patch | 34 +++++++++
>  .../mklibs/mklibs-native_0.1.40.bb                 |  2 +
>  3 files changed, 117 insertions(+)
>  create mode 100644
> meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
>  create mode 100644
> meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
>
> diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> new file mode 100644
> index 0000000..7eb8659
> --- /dev/null
> +++ b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> @@ -0,0 +1,81 @@
> +Remove dependency on dpkg
> +
> +Upstream-Status Submitted
> +
> +Asking the host OS whether it supports multiarch is not useful
> +in a cross-compilation environment, or if the user has specified
> +a libdir explicitly. So this patch, based on the work of Mentor
> +Graphics, removes mklibs's dependency on dpkg package.
> +
> +Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
> + src/mklibs | 30 +++++++++++++++++++-----------
> + 1 file changed, 19 insertions(+), 11 deletions(-)
> +
> +diff --git a/src/mklibs b/src/mklibs
> +index d9b784b..c5614ea 100755
> +--- a/src/mklibs
> ++++ b/src/mklibs
> +@@ -261,6 +261,11 @@ def extract_soname(so_file):
> +     return ""
> +
> + def multiarch(paths):
> ++    # Asking the host OS whether it supports multiarch is not useful
> ++    # in a cross-compilation environment, or if the user has specified
> ++    # a libdir explicitly.
> ++    if sysroot != "" or libdir != "":
> ++        return paths
> +     devnull = open('/dev/null', 'w')
> +     dpkg_architecture = subprocess.Popen(
> +         ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
> +@@ -340,7 +345,7 @@ lib_path = []
> + dest_path = "DEST"
> + ldlib = "LDLIB"
> + include_default_lib_path = "yes"
> +-default_lib_path = multiarch(["/lib/", "/usr/lib/", "/usr/X11R6/lib/"])
> ++default_lib_path = ["/lib/", "/usr/lib/", "/usr/X11R6/lib/"]
> + libc_extras_dir = "/usr/lib/libc_pic"
> + libc_extras_dir_default = True
> + libdir = "lib"
> +@@ -386,7 +391,7 @@ for opt, arg in optlist:
> +     elif opt == "--libdir":
> +         libdir = arg
> +     elif opt in ("--help", "-h"):
> +-      usage(0)
> ++        usage(0)
> +         sys.exit(0)
> +     elif opt in ("--version", "-V"):
> +         version(vers)
> +@@ -395,6 +400,7 @@ for opt, arg in optlist:
> +         print "WARNING: unknown option: " + opt + "\targ: " + arg
> +
> + if include_default_lib_path == "yes":
> ++    default_lib_path = multiarch(default_lib_path)
> +     lib_path.extend([a.replace("/lib/", "/" + libdir + "/") for a in
> default_lib_path])
> +
> + if libc_extras_dir_default:
> +@@ -661,16 +669,16 @@ ld_path_name = os.path.dirname(ldlib)
> + ld_full_path = "../" + ldlib
> + ld_file = find_lib(ld_file_name)
> +
> +-if ld_path_name != "/lib":
> +-    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
> +-        os.remove(dest_path + "/" + ld_file_name)
> ++#if ld_path_name != "/lib":
> ++#    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
> ++#        os.remove(dest_path + "/" + ld_file_name)
> +
> +-if not os.path.exists(dest_path + "/../" + ld_path_name):
> +-    os.mkdir(dest_path + "/../" + ld_path_name)
> ++#if not os.path.exists(dest_path + "/../" + ld_path_name):
> ++#    os.mkdir(dest_path + "/../" + ld_path_name)
> +
> +-if not os.access(dest_path + "/" + ld_full_path, os.F_OK):
> +-    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " +
> ld_full_path)
> ++if not os.access(dest_path + "/" + ld_file_name, os.F_OK):
> ++    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " +
> ld_file_name)
> +     command(target + "objcopy", "--strip-unneeded -R .note -R .comment",
> +-            ld_file, dest_path + "/" + ld_full_path)
> ++            ld_file, dest_path + "/" + ld_file_name)
> +
> +-os.chmod(dest_path + "/" + ld_full_path, 0755)
> ++os.chmod(dest_path + "/" + ld_file_name, 0755)
> diff --git
> a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> new file mode 100644
> index 0000000..3f14ca1
> --- /dev/null
> +++
> b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
> @@ -0,0 +1,34 @@
> +From eddf04c7f8312e9c29cdb24e431b7e4fb2cc70ed Mon Sep 17 00:00:00 2001
> +From: Yuanjie Huang <yuanjie.huang@windriver.com>
> +Date: Wed, 15 Apr 2015 14:00:06 +0800
> +Subject: [PATCH] Show GNU unique symbols as provided symbols
> +
> +Upstream-Status Submitted
> +
> +GNU Unique symbol is a GNU extension employed by new version of GCC
> +by default. Even Standard C++ library in GCC 4.9 provides some symbols,
> +such as _ZNSs4_Rep20_S_empty_rep_storageE in this binding type instead
> +of ELF standard weak binding.
> +This patch adds support of this new binding type to mklibs-readelf.
> +
> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> +---
> + src/mklibs-readelf/main.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
> +index 56d93f8..0134530 100644
> +--- a/src/mklibs-readelf/main.cpp
> ++++ b/src/mklibs-readelf/main.cpp
> +@@ -88,7 +88,7 @@ static void process_symbols_provided (const
> Elf::section_type<Elf::section_type_
> +     uint8_t type = symbol->get_type ();
> +     const std::string &name = symbol->get_name_string ();
> +
> +-    if (bind != STB_GLOBAL && bind != STB_WEAK)
> ++    if (bind != STB_GLOBAL && bind != STB_WEAK && bind != STB_GNU_UNIQUE)
> +       continue;
> +     if (shndx == SHN_UNDEF || shndx == SHN_ABS)
> +       continue;
> +--
> +1.8.5.2.233.g932f7e4
> +
> diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
> b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
> index 0bb5f21..d6905ac 100644
> --- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
> +++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
> @@ -11,6 +11,8 @@ SRC_URI = "
> http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.x
>         file://fix_STT_GNU_IFUNC.patch\
>         file://sysrooted-ldso.patch \
>         file://avoid-failure-on-symbol-provided-by-application.patch \
> +       file://show-GNU-unique-symbols-as-provided-symbols.patch \
> +       file://fix_cross_compile.patch \
>  "
>
>  SRC_URI[md5sum] = "e1dafe5f962caa9dc5f2651c0723812a"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c16614de1aff0532968011
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What was the intent of the last hunk in fix_cross_compile.=
patch?=C2=A0 It essentially undoes the following upstream mklibs change, bu=
t it doesn&#39;t seem related to whether or not dpkg is used.<div><br></div=
><div><a href=3D"http://bazaar.launchpad.net/~ubuntu-installer/mklibs/maste=
r/revision/101">http://bazaar.launchpad.net/~ubuntu-installer/mklibs/master=
/revision/101</a><br></div><div><a href=3D"https://bugs.debian.org/cgi-bin/=
bugreport.cgi?bug=3D256998">https://bugs.debian.org/cgi-bin/bugreport.cgi?b=
ug=3D256998</a><br></div><div><br></div><div>It also causes breakage in ima=
ge-mklibs.bbclass in a multilib setup where there are symlinks to the dynam=
ic loader in both /lib and /lib64 (find returns more than one result when t=
rying to cp out of mklibs/dest).</div><div><br></div><div>Should that hunk =
be reverted?</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Fri, Jul 3, 2015 at 1:42 AM,  <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:rongqing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Yuanjie Huan=
g &lt;<a href=3D"mailto:yuanjie.huang@windriver.com">yuanjie.huang@windrive=
r.com</a>&gt;<br>
<br>
1. Show GNU unique symbols as provided symbols<br>
2. Remove dependency on dpkg<br>
Both have been submitted to mklibs maillist:<br>
<a href=3D"https://lists.debian.org/debian-boot/2015/07/msg00018.html" rel=
=3D"noreferrer" target=3D"_blank">https://lists.debian.org/debian-boot/2015=
/07/msg00018.html</a><br>
<a href=3D"https://lists.debian.org/debian-boot/2015/07/msg00004.html" rel=
=3D"noreferrer" target=3D"_blank">https://lists.debian.org/debian-boot/2015=
/07/msg00004.html</a><br>
<br>
Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver.=
com">yuanjie.huang@windriver.com</a>&gt;<br>
Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">rong=
qing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../mklibs/files/fix_cross_compile.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 81 ++++++++++++++++++++++<br>
=C2=A0...ow-GNU-unique-symbols-as-provided-symbols.patch | 34 +++++++++<br>
=C2=A0.../mklibs/<a href=3D"http://mklibs-native_0.1.40.bb" rel=3D"noreferr=
er" target=3D"_blank">mklibs-native_0.1.40.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A03 files changed, 117 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/mklibs/files/fix_cross_compi=
le.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/mklibs/files/show-GNU-unique=
-symbols-as-provided-symbols.patch<br>
<br>
diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch b/m=
eta/recipes-devtools/mklibs/files/fix_cross_compile.patch<br>
new file mode 100644<br>
index 0000000..7eb8659<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch<br>
@@ -0,0 +1,81 @@<br>
+Remove dependency on dpkg<br>
+<br>
+Upstream-Status Submitted<br>
+<br>
+Asking the host OS whether it supports multiarch is not useful<br>
+in a cross-compilation environment, or if the user has specified<br>
+a libdir explicitly. So this patch, based on the work of Mentor<br>
+Graphics, removes mklibs&#39;s dependency on dpkg package.<br>
+<br>
+Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:Yuanjie.Huang@windriver=
.com">Yuanjie.Huang@windriver.com</a>&gt;<br>
+ src/mklibs | 30 +++++++++++++++++++-----------<br>
+ 1 file changed, 19 insertions(+), 11 deletions(-)<br>
+<br>
+diff --git a/src/mklibs b/src/mklibs<br>
+index d9b784b..c5614ea 100755<br>
+--- a/src/mklibs<br>
++++ b/src/mklibs<br>
+@@ -261,6 +261,11 @@ def extract_soname(so_file):<br>
+=C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
+<br>
+ def multiarch(paths):<br>
++=C2=A0 =C2=A0 # Asking the host OS whether it supports multiarch is not u=
seful<br>
++=C2=A0 =C2=A0 # in a cross-compilation environment, or if the user has sp=
ecified<br>
++=C2=A0 =C2=A0 # a libdir explicitly.<br>
++=C2=A0 =C2=A0 if sysroot !=3D &quot;&quot; or libdir !=3D &quot;&quot;:<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return paths<br>
+=C2=A0 =C2=A0 =C2=A0devnull =3D open(&#39;/dev/null&#39;, &#39;w&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0dpkg_architecture =3D subprocess.Popen(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;dpkg-architecture&#39;, &#39;-qDEB=
_HOST_MULTIARCH&#39;],<br>
+@@ -340,7 +345,7 @@ lib_path =3D []<br>
+ dest_path =3D &quot;DEST&quot;<br>
+ ldlib =3D &quot;LDLIB&quot;<br>
+ include_default_lib_path =3D &quot;yes&quot;<br>
+-default_lib_path =3D multiarch([&quot;/lib/&quot;, &quot;/usr/lib/&quot;,=
 &quot;/usr/X11R6/lib/&quot;])<br>
++default_lib_path =3D [&quot;/lib/&quot;, &quot;/usr/lib/&quot;, &quot;/us=
r/X11R6/lib/&quot;]<br>
+ libc_extras_dir =3D &quot;/usr/lib/libc_pic&quot;<br>
+ libc_extras_dir_default =3D True<br>
+ libdir =3D &quot;lib&quot;<br>
+@@ -386,7 +391,7 @@ for opt, arg in optlist:<br>
+=C2=A0 =C2=A0 =C2=A0elif opt =3D=3D &quot;--libdir&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libdir =3D arg<br>
+=C2=A0 =C2=A0 =C2=A0elif opt in (&quot;--help&quot;, &quot;-h&quot;):<br>
+-=C2=A0 =C2=A0 =C2=A0 usage(0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 usage(0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(0)<br>
+=C2=A0 =C2=A0 =C2=A0elif opt in (&quot;--version&quot;, &quot;-V&quot;):<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version(vers)<br>
+@@ -395,6 +400,7 @@ for opt, arg in optlist:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print &quot;WARNING: unknown option: &qu=
ot; + opt + &quot;\targ: &quot; + arg<br>
+<br>
+ if include_default_lib_path =3D=3D &quot;yes&quot;:<br>
++=C2=A0 =C2=A0 default_lib_path =3D multiarch(default_lib_path)<br>
+=C2=A0 =C2=A0 =C2=A0lib_path.extend([a.replace(&quot;/lib/&quot;, &quot;/&=
quot; + libdir + &quot;/&quot;) for a in default_lib_path])<br>
+<br>
+ if libc_extras_dir_default:<br>
+@@ -661,16 +669,16 @@ ld_path_name =3D os.path.dirname(ldlib)<br>
+ ld_full_path =3D &quot;../&quot; + ldlib<br>
+ ld_file =3D find_lib(ld_file_name)<br>
+<br>
+-if ld_path_name !=3D &quot;/lib&quot;:<br>
+-=C2=A0 =C2=A0 if os.access(dest_path + &quot;/&quot; + ld_file_name, os.F=
_OK):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(dest_path + &quot;/&quot; + ld_file=
_name)<br>
++#if ld_path_name !=3D &quot;/lib&quot;:<br>
++#=C2=A0 =C2=A0 if os.access(dest_path + &quot;/&quot; + ld_file_name, os.=
F_OK):<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(dest_path + &quot;/&quot; + ld_fil=
e_name)<br>
+<br>
+-if not os.path.exists(dest_path + &quot;/../&quot; + ld_path_name):<br>
+-=C2=A0 =C2=A0 os.mkdir(dest_path + &quot;/../&quot; + ld_path_name)<br>
++#if not os.path.exists(dest_path + &quot;/../&quot; + ld_path_name):<br>
++#=C2=A0 =C2=A0 os.mkdir(dest_path + &quot;/../&quot; + ld_path_name)<br>
+<br>
+-if not os.access(dest_path + &quot;/&quot; + ld_full_path, os.F_OK):<br>
+-=C2=A0 =C2=A0 debug(DEBUG_NORMAL, &quot;I: stripping and copying dynamic =
linker to &quot; + ld_full_path)<br>
++if not os.access(dest_path + &quot;/&quot; + ld_file_name, os.F_OK):<br>
++=C2=A0 =C2=A0 debug(DEBUG_NORMAL, &quot;I: stripping and copying dynamic =
linker to &quot; + ld_file_name)<br>
+=C2=A0 =C2=A0 =C2=A0command(target + &quot;objcopy&quot;, &quot;--strip-un=
needed -R .note -R .comment&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_file, dest_path + &quot;/&qu=
ot; + ld_full_path)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ld_file, dest_path + &quot;/&qu=
ot; + ld_file_name)<br>
+<br>
+-os.chmod(dest_path + &quot;/&quot; + ld_full_path, 0755)<br>
++os.chmod(dest_path + &quot;/&quot; + ld_file_name, 0755)<br>
diff --git a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-=
provided-symbols.patch b/meta/recipes-devtools/mklibs/files/show-GNU-unique=
-symbols-as-provided-symbols.patch<br>
new file mode 100644<br>
index 0000000..3f14ca1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provide=
d-symbols.patch<br>
@@ -0,0 +1,34 @@<br>
+From eddf04c7f8312e9c29cdb24e431b7e4fb2cc70ed Mon Sep 17 00:00:00 2001<br>
+From: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver.com">yua=
njie.huang@windriver.com</a>&gt;<br>
+Date: Wed, 15 Apr 2015 14:00:06 +0800<br>
+Subject: [PATCH] Show GNU unique symbols as provided symbols<br>
+<br>
+Upstream-Status Submitted<br>
+<br>
+GNU Unique symbol is a GNU extension employed by new version of GCC<br>
+by default. Even Standard C++ library in GCC 4.9 provides some symbols,<br=
>
+such as _ZNSs4_Rep20_S_empty_rep_storageE in this binding type instead<br>
+of ELF standard weak binding.<br>
+This patch adds support of this new binding type to mklibs-readelf.<br>
+<br>
+Signed-off-by: Yuanjie Huang &lt;<a href=3D"mailto:yuanjie.huang@windriver=
.com">yuanjie.huang@windriver.com</a>&gt;<br>
+---<br>
+ src/mklibs-readelf/main.cpp | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp<br>
+index 56d93f8..0134530 100644<br>
+--- a/src/mklibs-readelf/main.cpp<br>
++++ b/src/mklibs-readelf/main.cpp<br>
+@@ -88,7 +88,7 @@ static void process_symbols_provided (const Elf::section=
_type&lt;Elf::section_type_<br>
+=C2=A0 =C2=A0 =C2=A0uint8_t type =3D symbol-&gt;get_type ();<br>
+=C2=A0 =C2=A0 =C2=A0const std::string &amp;name =3D symbol-&gt;get_name_st=
ring ();<br>
+<br>
+-=C2=A0 =C2=A0 if (bind !=3D STB_GLOBAL &amp;&amp; bind !=3D STB_WEAK)<br>
++=C2=A0 =C2=A0 if (bind !=3D STB_GLOBAL &amp;&amp; bind !=3D STB_WEAK &amp=
;&amp; bind !=3D STB_GNU_UNIQUE)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0if (shndx =3D=3D SHN_UNDEF || shndx =3D=3D SHN_ABS)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+--<br>
+1.8.5.2.233.g932f7e4<br>
+<br>
diff --git a/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-native_0=
.1.40.bb" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.40.bb</a> =
b/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-native_0.1.40.bb" r=
el=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.40.bb</a><br>
index 0bb5f21..d6905ac 100644<br>
--- a/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-native_0.1.40.b=
b" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.40.bb</a><br>
+++ b/meta/recipes-devtools/mklibs/<a href=3D"http://mklibs-native_0.1.40.b=
b" rel=3D"noreferrer" target=3D"_blank">mklibs-native_0.1.40.bb</a><br>
@@ -11,6 +11,8 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.de.debian.org/deb=
ian/pool/main/m/mklibs/${BPN}_${PV}.tar.x" rel=3D"noreferrer" target=3D"_bl=
ank">http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.x<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix_STT_GNU_IFUNC.patch\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sysrooted-ldso.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://avoid-failure-on-symbol-provided-by-appl=
ication.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://show-GNU-unique-symbols-as-provided-symb=
ols.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix_cross_compile.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;e1dafe5f962caa9dc5f2651c0723812a&quot;<br>
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

--001a11c16614de1aff0532968011--
