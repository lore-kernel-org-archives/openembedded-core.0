Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.7086.1602337920784714500
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2020 06:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tAO4XeYD;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id x7so6946197eje.8
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2020 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=dGGYZS/j38xZwlLO9YKzaKMvYMaazLc4nNMd90ICcvg=;
        b=tAO4XeYDslJXmay0KPbji8jc4r3S69LmgFvz6eQ8t73ZGv4rf/Cak67JGdBAPnNmt0
         liqiILJbS0y5bn4m4Q4+OZMfFZTSLmRo034YHS7e9sRg6DDkjxCnxJ7nG2JlePybnE6r
         Y0i4l5xaXNwHQqNb4/nLI8+5kyRGhkXg27huriLVKN+Wjv7MIgEbjWNTTETWUINMnGfu
         ky2tp4bsk5f6GPGZMIVUZsK50Y1n++ysknkHUM6xqFzTv11xzxD95pcaOhn2GkES7iRa
         4u42lcSLw7mMLeD0RpeBnNiNOYoP8UlKVYoWsbkPsxl0IydVWmDV5nvsDzyPB0zW0y6J
         YtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=dGGYZS/j38xZwlLO9YKzaKMvYMaazLc4nNMd90ICcvg=;
        b=D76rxaHS6JcAfoC+ra6iqoFV/NQOlBsM69EW+d4V1BnNP4SOX6GI1chbUVWVzNBqvP
         GnEo2Frzl433K3pgFav7MH4YuGvG4j0uHA7vJS/8aLHGJQfDatDt8ZiUfmwDqjIOKPbL
         jA/QbSpubif/T7SDlAkUeDwvxEZIxsbgJJMKqLBnQq6ujkCNhDczUdIBKlOft3T3SitL
         gu2Bb9fPidFbJGuA9bE598D5/gs4gxtoQn542hjqPFo6slYWZxqyahYgemOYMS3LlkLj
         eOIz9J6Lg6vsT0bR4xGcvJlofD6cYfjp5zmLVusVugY1S6+Uhsgczfl92j2YMLrtYRFV
         lnwA==
X-Gm-Message-State: AOAM530LrZHNS461tKxOO+bZaahZYNHtDx0xlRxv1GCq7jvLQ9Cf+xjG
	l2Ml+YGI/65fqkkvy0hVqVsJhVDIEKLMUXDnsYoMDc5MxYs=
X-Google-Smtp-Source: ABdhPJxtz3S16cwXYrN3lh/6C+FqxlMJ5bXeH5KlPLKZOZ4Ctj3Ln1sfYMYGQcptrz8cncBh5LaXT8+nJcFxUW4L8RQ=
X-Received: by 2002:a17:906:4a97:: with SMTP id x23mr18933510eju.471.1602337918591;
 Sat, 10 Oct 2020 06:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201009131616.3036495-1-Martin.Jansa@gmail.com>
In-Reply-To: <20201009131616.3036495-1-Martin.Jansa@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 10 Oct 2020 15:51:47 +0200
Message-ID: <CA+chaQezbMReBYVQ7Wzv5mQu07Oyg0zfBacsauNJ2tV1ODuA7A@mail.gmail.com>
Subject: Re: [RFC][PATCH] meta-skeleton: useradd-dep: add example of recipe using useradd and group created in other recipe
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000072a90d05b1515e3f"

--00000000000072a90d05b1515e3f
Content-Type: text/plain; charset="UTF-8"

This seems to be the same as
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13904

On Fri, Oct 9, 2020 at 3:16 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> * maybe this would be better in meta-selftest, I can move it there
>   once we agree how this is supposed to work
>
> *
> https://www.openembedded.org/pipermail/bitbake-devel/2018-March/009256.html
>   says that RDEPENDS_${PN} should be enough, but in my testing we need
>   built time dependency as well for groups to exist early enough
>
> * and unfortunately even with the "useradd dependency" in DEPENDS is see
>   very rare failures (in dunfell but I haven't found any changes in this
> area
>   in master) when useradd-dep and useradd-example are reused from sstate.
>
>   In these cases I've noticed that useradd-dep.do_package_setscene is
> running before useradd-example.do_package_setscene:
>
>   NOTE: Running setscene task 268 of 3783 (useradd-dep.bb:
> do_package_write_ipk_setscene)
>   NOTE: Running setscene task 269 of 3783 (useradd-dep.bb:
> do_populate_lic_setscene)
>   NOTE: useradd-dep-1.0-r1: task do_package_write_ipk_setscene: Started
>   NOTE: useradd-dep-1.0-r1: task do_populate_lic_setscene: Started
>   NOTE: useradd-dep-1.0-r1: task do_package_write_ipk_setscene: Succeeded
>   NOTE: Running setscene task 279 of 3783 (useradd-dep.bb:
> do_packagedata_setscene)
>   NOTE: useradd-dep-1.0-r1: task do_populate_lic_setscene: Succeeded
>   NOTE: useradd-dep-1.0-r1: task do_packagedata_setscene: Started
>   NOTE: useradd-dep-1.0-r1: task do_packagedata_setscene: Succeeded
>   NOTE: Running setscene task 3336 of 3783 (useradd-dep.bb:
> do_package_setscene)
>   NOTE: Running setscene task 3337 of 3783 (useradd-dep.bb:
> do_populate_sysroot_setscene)
>   NOTE: useradd-dep-1.0-r1: task do_package_setscene: Started
>   NOTE: useradd-dep-1.0-r1: task do_populate_sysroot_setscene: Started
>   ERROR: useradd-dep-1.0-r1 do_package_setscene: useradd-dep: useradd
> command did not succeed.
>   ERROR: useradd-dep-1.0-r1 do_package_setscene: Error executing a python
> function in exec_python_func() autogenerated:
>   ...
>   Exception: bb.process.ExecutionError: Execution of
> 'useradd-dep/1.0-r1/temp/run.useradd_sysroot.8980' failed with exit code 1:
>     useradd-dep/1.0-r1/recipe-sysroot-native/usr/sbin/useradd
>     Running useradd commands...
>     useradd: Warning: missing or non-executable shell '/bin/bash'
>     useradd: group 'group1' does not exist
>     WARNING: exit code 1 from a shell command.
>   ...
>   WARNING: Setscene task (useradd-dep.bb:do_package_setscene) failed with
> exit code '1' - real task will be run instead
>
>   NOTE: Running setscene task 3347 of 3783 (useradd-example.bb:
> do_packagedata_setscene)
>   NOTE: Running setscene task 3348 of 3783 (useradd-example.bb:
> do_populate_sysroot_setscene)
>   NOTE: recipe useradd-example-1.0-r1: task do_packagedata_setscene:
> Started
>   NOTE: recipe useradd-example-1.0-r1: task do_populate_sysroot_setscene:
> Started
>   NOTE: recipe useradd-example-1.0-r1: task do_packagedata_setscene:
> Succeeded
>   NOTE: Running setscene task 3358 of 3783 (useradd-example.bb:
> do_package_setscene)
>   NOTE: recipe useradd-example-1.0-r1: task do_populate_sysroot_setscene:
> Succeeded
>   NOTE: recipe useradd-example-1.0-r1: task do_package_setscene: Started
>   NOTE: recipe useradd-example-1.0-r1: task do_package_setscene: Succeeded
>
>   and then the real task works fine.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../recipes-skeleton/useradd/useradd-dep.bb   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-dep.bb
>
> diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-dep.bb
> b/meta-skeleton/recipes-skeleton/useradd/useradd-dep.bb
> new file mode 100644
> index 0000000000..b5cbc5d170
> --- /dev/null
> +++ b/meta-skeleton/recipes-skeleton/useradd/useradd-dep.bb
> @@ -0,0 +1,39 @@
> +SUMMARY = "Example recipe for using inherit useradd and reusing group
> from useradd-example"
> +DESCRIPTION = "This recipe serves as an example for using features from
> useradd.bbclass"
> +SECTION = "examples"
> +PR = "r1"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +S = "${WORKDIR}"
> +
> +EXCLUDE_FROM_WORLD = "1"
> +
> +inherit useradd
> +
> +#
> https://www.openembedded.org/pipermail/bitbake-devel/2018-March/009256.html
> +# says that RDEPENDS_${PN} should be enough, but in my testing we need
> +# built time dependency as well for groups to exist early enough
> +DEPENDS = "useradd-example"
> +
> +RDEPENDS_${PN} = "useradd-example"
> +RDEPENDS_${PN}-user3 = "useradd-example-user3"
> +
> +# You must set USERADD_PACKAGES when you inherit useradd. This
> +# lists which output packages will include the user/group
> +# creation code.
> +USERADD_PACKAGES = "${PN} ${PN}-user3"
> +
> +# USERADD_PARAM specifies command line options to pass to the
> +# useradd command. Multiple users can be created by separating
> +# the commands with a semicolon. Here we'll create two users,
> +# user1 and user2:
> +USERADD_PARAM_${PN} = "-u 2200 -d /home/user1dep -r -s /bin/bash -G
> group1 user1dep; -u 2201 -d /home/user2dep -r -s /bin/bash -G group2
> user2dep"
> +
> +# user3 will be managed in the useradd-example-user3 pacakge:
> +# As an example, we use the -P option to set clear text password for user3
> +USERADD_PARAM_${PN}-user3 = "-u 2202 -d /home/user3dep -r -s /bin/bash -P
> 'user3' -G group3 user3dep"
> +
> +# Prevents do_package failures with:
> +# debugsources.list: No such file or directory:
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> --
> 2.25.1
>
>

--00000000000072a90d05b1515e3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to be the same as<div><a href=3D"https://bugzil=
la.yoctoproject.org/show_bug.cgi?id=3D13904">https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D13904</a><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 9, 2020 at 3:16 PM Mar=
tin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">* maybe this would be better in meta-selftest, I can move it there<br>
=C2=A0 once we agree how this is supposed to work<br>
<br>
* <a href=3D"https://www.openembedded.org/pipermail/bitbake-devel/2018-Marc=
h/009256.html" rel=3D"noreferrer" target=3D"_blank">https://www.openembedde=
d.org/pipermail/bitbake-devel/2018-March/009256.html</a><br>
=C2=A0 says that RDEPENDS_${PN} should be enough, but in my testing we need=
<br>
=C2=A0 built time dependency as well for groups to exist early enough<br>
<br>
* and unfortunately even with the &quot;useradd dependency&quot; in DEPENDS=
 is see<br>
=C2=A0 very rare failures (in dunfell but I haven&#39;t found any changes i=
n this area<br>
=C2=A0 in master) when useradd-dep and useradd-example are reused from ssta=
te.<br>
<br>
=C2=A0 In these cases I&#39;ve noticed that useradd-dep.do_package_setscene=
 is running before useradd-example.do_package_setscene:<br>
<br>
=C2=A0 NOTE: Running setscene task 268 of 3783 (useradd-dep.bb:do_package_w=
rite_ipk_setscene)<br>
=C2=A0 NOTE: Running setscene task 269 of 3783 (useradd-dep.bb:do_populate_=
lic_setscene)<br>
=C2=A0 NOTE: useradd-dep-1.0-r1: task do_package_write_ipk_setscene: Starte=
d<br>
=C2=A0 NOTE: useradd-dep-1.0-r1: task do_populate_lic_setscene: Started<br>
=C2=A0 NOTE: useradd-dep-1.0-r1: task do_package_write_ipk_setscene: Succee=
ded<br>
=C2=A0 NOTE: Running setscene task 279 of 3783 (useradd-dep.bb:do_packageda=
ta_setscene)<br>
=C2=A0 NOTE: useradd-dep-1.0-r1: task do_populate_lic_setscene: Succeeded<b=
r>
=C2=A0 NOTE: useradd-dep-1.0-r1: task do_packagedata_setscene: Started<br>
=C2=A0 NOTE: useradd-dep-1.0-r1: task do_packagedata_setscene: Succeeded<br=
>
=C2=A0 NOTE: Running setscene task 3336 of 3783 (useradd-dep.bb:do_package_=
setscene)<br>
=C2=A0 NOTE: Running setscene task 3337 of 3783 (useradd-dep.bb:do_populate=
_sysroot_setscene)<br>
=C2=A0 NOTE: useradd-dep-1.0-r1: task do_package_setscene: Started<br>
=C2=A0 NOTE: useradd-dep-1.0-r1: task do_populate_sysroot_setscene: Started=
<br>
=C2=A0 ERROR: useradd-dep-1.0-r1 do_package_setscene: useradd-dep: useradd =
command did not succeed.<br>
=C2=A0 ERROR: useradd-dep-1.0-r1 do_package_setscene: Error executing a pyt=
hon function in exec_python_func() autogenerated:<br>
=C2=A0 ...<br>
=C2=A0 Exception: bb.process.ExecutionError: Execution of &#39;useradd-dep/=
1.0-r1/temp/run.useradd_sysroot.8980&#39; failed with exit code 1:<br>
=C2=A0 =C2=A0 useradd-dep/1.0-r1/recipe-sysroot-native/usr/sbin/useradd<br>
=C2=A0 =C2=A0 Running useradd commands...<br>
=C2=A0 =C2=A0 useradd: Warning: missing or non-executable shell &#39;/bin/b=
ash&#39;<br>
=C2=A0 =C2=A0 useradd: group &#39;group1&#39; does not exist<br>
=C2=A0 =C2=A0 WARNING: exit code 1 from a shell command.<br>
=C2=A0 ...<br>
=C2=A0 WARNING: Setscene task (useradd-dep.bb:do_package_setscene) failed w=
ith exit code &#39;1&#39; - real task will be run instead<br>
<br>
=C2=A0 NOTE: Running setscene task 3347 of 3783 (useradd-example.bb:do_pack=
agedata_setscene)<br>
=C2=A0 NOTE: Running setscene task 3348 of 3783 (useradd-example.bb:do_popu=
late_sysroot_setscene)<br>
=C2=A0 NOTE: recipe useradd-example-1.0-r1: task do_packagedata_setscene: S=
tarted<br>
=C2=A0 NOTE: recipe useradd-example-1.0-r1: task do_populate_sysroot_setsce=
ne: Started<br>
=C2=A0 NOTE: recipe useradd-example-1.0-r1: task do_packagedata_setscene: S=
ucceeded<br>
=C2=A0 NOTE: Running setscene task 3358 of 3783 (useradd-example.bb:do_pack=
age_setscene)<br>
=C2=A0 NOTE: recipe useradd-example-1.0-r1: task do_populate_sysroot_setsce=
ne: Succeeded<br>
=C2=A0 NOTE: recipe useradd-example-1.0-r1: task do_package_setscene: Start=
ed<br>
=C2=A0 NOTE: recipe useradd-example-1.0-r1: task do_package_setscene: Succe=
eded<br>
<br>
=C2=A0 and then the real task works fine.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-skeleton/useradd/<a href=3D"http://useradd-dep.bb" rel=3D=
"noreferrer" target=3D"_blank">useradd-dep.bb</a>=C2=A0 =C2=A0| 39 ++++++++=
+++++++++++<br>
=C2=A01 file changed, 39 insertions(+)<br>
=C2=A0create mode 100644 meta-skeleton/recipes-skeleton/useradd/<a href=3D"=
http://useradd-dep.bb" rel=3D"noreferrer" target=3D"_blank">useradd-dep.bb<=
/a><br>
<br>
diff --git a/meta-skeleton/recipes-skeleton/useradd/<a href=3D"http://usera=
dd-dep.bb" rel=3D"noreferrer" target=3D"_blank">useradd-dep.bb</a> b/meta-s=
keleton/recipes-skeleton/useradd/<a href=3D"http://useradd-dep.bb" rel=3D"n=
oreferrer" target=3D"_blank">useradd-dep.bb</a><br>
new file mode 100644<br>
index 0000000000..b5cbc5d170<br>
--- /dev/null<br>
+++ b/meta-skeleton/recipes-skeleton/useradd/<a href=3D"http://useradd-dep.=
bb" rel=3D"noreferrer" target=3D"_blank">useradd-dep.bb</a><br>
@@ -0,0 +1,39 @@<br>
+SUMMARY =3D &quot;Example recipe for using inherit useradd and reusing gro=
up from useradd-example&quot;<br>
+DESCRIPTION =3D &quot;This recipe serves as an example for using features =
from useradd.bbclass&quot;<br>
+SECTION =3D &quot;examples&quot;<br>
+PR =3D &quot;r1&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9c=
fbcb788c80a0384361b4de20420&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}&quot;<br>
+<br>
+EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
+<br>
+inherit useradd<br>
+<br>
+# <a href=3D"https://www.openembedded.org/pipermail/bitbake-devel/2018-Mar=
ch/009256.html" rel=3D"noreferrer" target=3D"_blank">https://www.openembedd=
ed.org/pipermail/bitbake-devel/2018-March/009256.html</a><br>
+# says that RDEPENDS_${PN} should be enough, but in my testing we need<br>
+# built time dependency as well for groups to exist early enough<br>
+DEPENDS =3D &quot;useradd-example&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;useradd-example&quot;<br>
+RDEPENDS_${PN}-user3 =3D &quot;useradd-example-user3&quot;<br>
+<br>
+# You must set USERADD_PACKAGES when you inherit useradd. This<br>
+# lists which output packages will include the user/group<br>
+# creation code.<br>
+USERADD_PACKAGES =3D &quot;${PN} ${PN}-user3&quot;<br>
+<br>
+# USERADD_PARAM specifies command line options to pass to the<br>
+# useradd command. Multiple users can be created by separating<br>
+# the commands with a semicolon. Here we&#39;ll create two users,<br>
+# user1 and user2:<br>
+USERADD_PARAM_${PN} =3D &quot;-u 2200 -d /home/user1dep -r -s /bin/bash -G=
 group1 user1dep; -u 2201 -d /home/user2dep -r -s /bin/bash -G group2 user2=
dep&quot;<br>
+<br>
+# user3 will be managed in the useradd-example-user3 pacakge:<br>
+# As an example, we use the -P option to set clear text password for user3=
<br>
+USERADD_PARAM_${PN}-user3 =3D &quot;-u 2202 -d /home/user3dep -r -s /bin/b=
ash -P &#39;user3&#39; -G group3 user3dep&quot;<br>
+<br>
+# Prevents do_package failures with:<br>
+# debugsources.list: No such file or directory:<br>
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--00000000000072a90d05b1515e3f--
