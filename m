Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.10681.1593092076359949276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 06:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CrZ8pwvk;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id k13so3525132vsm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LfmuyW3qnOKWhDj+56ZuqXMS682KSK+uHTy//aG9W7c=;
        b=CrZ8pwvksaKQlK7uZSUO/GHorww9MID0nQUcRKdXOnMJxaWJZauSffelZt+RMkC8fp
         QkTLcqGSqkmpYPdoC5vzucJTjoLDX9j3U7wrnl4pqZdUeclK53bXiDolBhxk/wioS6jN
         ky6yt7reN4ZS1r0iB1OhmVeptwoVdLXTYJG9G3haFsLUtPC++0IsZhJZf3gP2zd7f08w
         54sUlNJIShdzsbu7Uhnk3pQ/P5Ep7ICPbbl2gvC+tPDRMJLwtFaubj6lPiilTIyjBWsz
         nBglVzlooM6jjXegaPOsTgvDqOVpCgfU6gTDymiCn2pjAkk1FkQsOYJghd6zDYAzTJPd
         clzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LfmuyW3qnOKWhDj+56ZuqXMS682KSK+uHTy//aG9W7c=;
        b=Ho79nXPFRf1tl3kIpTtaYF2qjtjKNVJZpfiYRQYcNFgRIlc2UbWApE8wK1GRXhbbDx
         9Cy9LJniKmFLMDpCSwD9KxG+MTuxzamJ9mlaoB9hJKhjY3YMfZFTymueEbOyHm11Yp84
         xDAYbENs65vEgSv8XutmOhbh2JoZG4eEDj4GrCDcDj5qoWo3f3HUed6a7OgLXuJczxeW
         95CPpHOgPOEhat9kbdFWfe0mnXJgqO9B/EDQH4pfRyMw149Id+fTrd+R6voRNvSg7D1e
         tEKyYh66LI921f5bnnEBLdPdFiwWY47F4z2bUid1jOELGgXQrHNhIZVHKhXeyDI5m46H
         zRnA==
X-Gm-Message-State: AOAM530ZpfcgQXJlWMYxSqM27u4SKY71YyBqJpQ2q9qZEE3H9b1vNQ68
	pSTdcXqL1VRGGynoUZ5Kd/zHQ9mLXJq414827X4=
X-Google-Smtp-Source: ABdhPJxkaofeXM8xh2Ol4TkgoN3BXsVjrZSLLLgd9gxsGS+efVwHl4pbR8Ubvc23HKQEeo6EoxVXR1TXX/YsNt9kzio=
X-Received: by 2002:a67:db0b:: with SMTP id z11mr27011374vsj.25.1593092075389;
 Thu, 25 Jun 2020 06:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200623234246.7355-1-trevor.gamblin@windriver.com> <20200623234246.7355-2-trevor.gamblin@windriver.com>
In-Reply-To: <20200623234246.7355-2-trevor.gamblin@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2020 15:34:23 +0200
Message-ID: <CANNYZj9eObYLK4hT0j3GEYBgcckmjgvgLkw7yqttSXyxmhrkkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1 v3] python3-setuptools: patch entrypoints for faster initialization
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003f84e805a8e8a7a1"

--0000000000003f84e805a8e8a7a1
Content-Type: text/plain; charset="UTF-8"

Unfortunately I have to add a revert of this, as the patch is really not
possible to rebase onto latest setuptools. Please submit it upstream and
get it accepted there first.

Alex

On Wed, 24 Jun 2020 at 01:43, Trevor Gamblin <trevor.gamblin@windriver.com>
wrote:

> setuptools' pkg_resources module has major performance issues with how
> it loads entry points (e.g. the console_script entry point, which sets
> up a module as a command-line executable), leading even the simplest
> "hello world" scripts to take on the order of 150ms to run if
> pkg_resources is incorporated. This is prohibitive for code that needs
> to run quickly, and so we patch setuptools to reduce this time. As of
> Python 3.7, importlib.resources is available and intended to replace
> much of the functionality that causes this sluggishness, but since
> many projects still utilize the legacy setuptools modules, a patch is
> still required. Note that python3-fastentrypoints (which is available
> in the meta-virtualization layer) is also intended to help alleviate
> the problem, but since it must be added to existing projects it has
> the same disadvantage as resorting to importlib.resources, requiring
> manual additions to existing code to see the performance gains.
>
> The intent here is to patch easy_install to load module entry points
> directly with the installed setuptools, rather than importing
> pkg_resources and having it search out the entry points itself. This
> leads to a drastic performance improvement - the changes in this patch
> have been shown to result in load time ~6-8x lower, depending on the
> complexity of the code it is tested with. A simple "hello world"
> example on core-image-full-cmdline gave these results with and without
> the patch:
>
> core-image-full-cmdline, without setuptools ScriptWriter patch:
>
> root@qemux86-64:~# time /usr/bin/minimal
> hello world
>
> real    0m0.198s
> user    0m0.174s
> sys     0m0.023s
>
> core-image-full-cmdline, with setuptools ScriptWriter patch:
>
> root@qemux86-64:~# time /usr/bin/minimal
> hello world
>
> real    0m0.034s
> user    0m0.024s
> sys     0m0.010s
>
> More details on the pkg_resources issue are available at:
> https://github.com/pypa/setuptools/issues/510
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>
> v2 added the missing Upstream-Status in the patch file.
> v3 fixes the location of the v2 notice in the patch, and
> adds a missing series number to the patch subject line.
>
>  .../python/python-setuptools.inc              |  4 +-
>  ...nt-usr-bin-wrappers-signoff-included.patch | 62 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> b/meta/recipes-devtools/python/python-setuptools.inc
> index 9322ca9a05..3222de7079 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -10,7 +10,9 @@ inherit pypi
>
>  SRC_URI_append_class-native = "
> file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
>
> -SRC_URI += "file://0001-change-shebang-to-python3.patch"
> +SRC_URI += "file://0001-change-shebang-to-python3.patch \
> +
> file://0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
> \
> +            "
>
>  SRC_URI[md5sum] = "6e9de90b242fdd60ef59f497424ce13a"
>  SRC_URI[sha256sum] =
> "145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f758b7cd674af09a92736aff74"
> diff --git
> a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
> b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
> new file mode 100644
> index 0000000000..7e931c845c
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
> @@ -0,0 +1,62 @@
> +From aae8cd3de3f289cea3db01212579913c925191e8 Mon Sep 17 00:00:00 2001
> +From: Lauri Tirkkonen <lauri.tirkkonen.ext@nokia.com>
> +Date: Thu, 26 Mar 2020 14:24:25 +0000
> +Subject: [PATCH] ScriptWriter: create more efficient /usr/bin wrappers
> +
> +Upstream setuptools writes scripts to /usr/bin that do insanely much
> +stuff at runtime. https://github.com/pypa/setuptools/issues/510
> +
> +Since the script entry points are already known at build time, we can
> +just write those directly into the /usr/bin wrapper, avoiding the
> +expensive 'pkg_resources' import at runtime. The idea is from
> +https://github.com/ninjaaron/fast-entry_points but patched directly into
> +the native build of setuptools here, so that all Python modules under
> +bitbake automatically use it without needing additional build time
> +dependencies.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Lauri Tirkkonen <lauri.tirkkonen.ext@nokia.com>
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +---
> + setuptools/command/easy_install.py | 14 ++++++--------
> + 1 file changed, 6 insertions(+), 8 deletions(-)
> +
> +diff --git a/setuptools/command/easy_install.py
> b/setuptools/command/easy_install.py
> +index 8fba7b41..03a72714 100755
> +--- a/setuptools/command/easy_install.py
> ++++ b/setuptools/command/easy_install.py
> +@@ -2023,17 +2023,12 @@ class ScriptWriter(object):
> +     """
> +
> +     template = textwrap.dedent(r"""
> +-        # EASY-INSTALL-ENTRY-SCRIPT: %(spec)r,%(group)r,%(name)r
> +-        __requires__ = %(spec)r
> +-        import re
> +         import sys
> +-        from pkg_resources import load_entry_point
> ++
> ++        from %(module)s import %(ep0)s
> +
> +         if __name__ == '__main__':
> +-            sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '',
> sys.argv[0])
> +-            sys.exit(
> +-                load_entry_point(%(spec)r, %(group)r, %(name)r)()
> +-            )
> ++            sys.exit(%(entrypoint)s())
> +     """).lstrip()
> +
> +     command_spec_class = CommandSpec
> +@@ -2068,6 +2063,9 @@ class ScriptWriter(object):
> +         for type_ in 'console', 'gui':
> +             group = type_ + '_scripts'
> +             for name, ep in dist.get_entry_map(group).items():
> ++                module = ep.module_name
> ++                ep0 = ep.attrs[0]
> ++                entrypoint = '.'.join(ep.attrs)
> +                 cls._ensure_safe_name(name)
> +                 script_text = cls.template % locals()
> +                 args = cls._get_script_args(type_, name, header,
> script_text)
> +--
> +2.24.1
> +
> --
> 2.26.2
>
> 
>

--0000000000003f84e805a8e8a7a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Unfortunately I have to add a revert of this, as the =
patch is really not possible to rebase onto latest setuptools. Please submi=
t it upstream and get it accepted there first.</div><div><br></div><div>Ale=
x<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, 24 Jun 2020 at 01:43, Trevor Gamblin &lt;<a href=3D"mail=
to:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">setuptools&#39=
; pkg_resources module has major performance issues with how<br>
it loads entry points (e.g. the console_script entry point, which sets<br>
up a module as a command-line executable), leading even the simplest<br>
&quot;hello world&quot; scripts to take on the order of 150ms to run if<br=
>
pkg_resources is incorporated. This is prohibitive for code that needs<br>
to run quickly, and so we patch setuptools to reduce this time. As of<br>
Python 3.7, importlib.resources is available and intended to replace<br>
much of the functionality that causes this sluggishness, but since<br>
many projects still utilize the legacy setuptools modules, a patch is<br>
still required. Note that python3-fastentrypoints (which is available<br>
in the meta-virtualization layer) is also intended to help alleviate<br>
the problem, but since it must be added to existing projects it has<br>
the same disadvantage as resorting to importlib.resources, requiring<br>
manual additions to existing code to see the performance gains.<br>
<br>
The intent here is to patch easy_install to load module entry points<br>
directly with the installed setuptools, rather than importing<br>
pkg_resources and having it search out the entry points itself. This<br>
leads to a drastic performance improvement - the changes in this patch<br>
have been shown to result in load time ~6-8x lower, depending on the<br>
complexity of the code it is tested with. A simple &quot;hello world&quot;=
<br>
example on core-image-full-cmdline gave these results with and without<br>
the patch:<br>
<br>
core-image-full-cmdline, without setuptools ScriptWriter patch:<br>
<br>
root@qemux86-64:~# time /usr/bin/minimal<br>
hello world<br>
<br>
real=C2=A0 =C2=A0 0m0.198s<br>
user=C2=A0 =C2=A0 0m0.174s<br>
sys=C2=A0 =C2=A0 =C2=A00m0.023s<br>
<br>
core-image-full-cmdline, with setuptools ScriptWriter patch:<br>
<br>
root@qemux86-64:~# time /usr/bin/minimal<br>
hello world<br>
<br>
real=C2=A0 =C2=A0 0m0.034s<br>
user=C2=A0 =C2=A0 0m0.024s<br>
sys=C2=A0 =C2=A0 =C2=A00m0.010s<br>
<br>
More details on the pkg_resources issue are available at:<br>
<a href=3D"https://github.com/pypa/setuptools/issues/510" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/pypa/setuptools/issues/510</a><br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriv=
er.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
---<br>
<br>
v2 added the missing Upstream-Status in the patch file.<br>
v3 fixes the location of the v2 notice in the patch, and <br>
adds a missing series number to the patch subject line.<br>
<br>
=C2=A0.../python/python-setuptools.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A0...nt-usr-bin-wrappers-signoff-included.patch | 62 +++++++++++++++++=
++<br>
=C2=A02 files changed, 65 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-setuptools/0=
001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.pa=
tch<br>
<br>
diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/rec=
ipes-devtools/python/python-setuptools.inc<br>
index 9322ca9a05..3222de7079 100644<br>
--- a/meta/recipes-devtools/python/python-setuptools.inc<br>
+++ b/meta/recipes-devtools/python/python-setuptools.inc<br>
@@ -10,7 +10,9 @@ inherit pypi<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot; file://0001-conditionally-do-=
not-fetch-code-by-easy_install.patch&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-change-shebang-to-python3.patch&quot;<br>
+SRC_URI +=3D &quot;file://0001-change-shebang-to-python3.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ScriptWriter-create=
-more-efficient-usr-bin-wrappers-signoff-included.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;6e9de90b242fdd60ef59f497424ce13a&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;145fa62b9d7bb544fce16e9b5a9bf4ab2032d2f=
758b7cd674af09a92736aff74&quot;<br>
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWr=
iter-create-more-efficient-usr-bin-wrappers-signoff-included.patch b/meta/r=
ecipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-eff=
icient-usr-bin-wrappers-signoff-included.patch<br>
new file mode 100644<br>
index 0000000000..7e931c845c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-cr=
eate-more-efficient-usr-bin-wrappers-signoff-included.patch<br>
@@ -0,0 +1,62 @@<br>
+From aae8cd3de3f289cea3db01212579913c925191e8 Mon Sep 17 00:00:00 2001<br=
>
+From: Lauri Tirkkonen &lt;<a href=3D"mailto:lauri.tirkkonen.ext@nokia.com=
" target=3D"_blank">lauri.tirkkonen.ext@nokia.com</a>&gt;<br>
+Date: Thu, 26 Mar 2020 14:24:25 +0000<br>
+Subject: [PATCH] ScriptWriter: create more efficient /usr/bin wrappers<br=
>
+<br>
+Upstream setuptools writes scripts to /usr/bin that do insanely much<br>
+stuff at runtime. <a href=3D"https://github.com/pypa/setuptools/issues/51=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/pypa/setuptools/=
issues/510</a><br>
+<br>
+Since the script entry points are already known at build time, we can<br>
+just write those directly into the /usr/bin wrapper, avoiding the<br>
+expensive &#39;pkg_resources&#39; import at runtime. The idea is from<br>
+<a href=3D"https://github.com/ninjaaron/fast-entry_points" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/ninjaaron/fast-entry_points</a> b=
ut patched directly into<br>
+the native build of setuptools here, so that all Python modules under<br>
+bitbake automatically use it without needing additional build time<br>
+dependencies.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Lauri Tirkkonen &lt;<a href=3D"mailto:lauri.tirkkonen.ext@=
nokia.com" target=3D"_blank">lauri.tirkkonen.ext@nokia.com</a>&gt;<br>
+Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windri=
ver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
+---<br>
+ setuptools/command/easy_install.py | 14 ++++++--------<br>
+ 1 file changed, 6 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy=
_install.py<br>
+index 8fba7b41..03a72714 100755<br>
+--- a/setuptools/command/easy_install.py<br>
++++ b/setuptools/command/easy_install.py<br>
+@@ -2023,17 +2023,12 @@ class ScriptWriter(object):<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0template =3D textwrap.dedent(r&quot;&quot;&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # EASY-INSTALL-ENTRY-SCRIPT: %(spec)r,%(grou=
p)r,%(name)r<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __requires__ =3D %(spec)r<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import sys<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 from pkg_resources import load_entry_point<b=
r>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 from %(module)s import %(ep0)s<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if __name__ =3D=3D &#39;__main__&#39;:<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.argv[0] =3D re.sub(r&#39;(=
-script\.pyw?|\.exe)?$&#39;, &#39;&#39;, sys.argv[0])<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 load_entry_point=
(%(spec)r, %(group)r, %(name)r)()<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(%(entrypoint)s())<br>
+=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;).lstrip()<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0command_spec_class =3D CommandSpec<br>
+@@ -2068,6 +2063,9 @@ class ScriptWriter(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type_ in &#39;console&#39;, &#39;gu=
i&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0group =3D type_ + &#39;_s=
cripts&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for name, ep in dist.get_=
entry_map(group).items():<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module =3D ep.mo=
dule_name<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ep0 =3D ep.attrs=
[0]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entrypoint =3D &=
#39;.&#39;.join(ep.attrs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cls._ensure=
_safe_name(name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0script_text=
 =3D cls.template % locals()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args =3D cl=
s._get_script_args(type_, name, header, script_text)<br>
+-- <br>
+2.24.1<br>
+<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div>

--0000000000003f84e805a8e8a7a1--
