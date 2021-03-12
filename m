Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web12.5990.1615541325417444930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kHcXVQOz;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id e21so10189166vsh.5
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H0bgtqb2UkiofCd1TWrsb32w1UzaqVKjX8IutQVeR8o=;
        b=kHcXVQOzWA6BqmBV9qAA5P5ou4e3XrCbIYA28i7LNO+uCXINHJCqHA26hivzICEf3X
         2Ht6vv2Fzvg6LpJC5u8UQgXPqeIqj8Wv5zp6oCq7EyqMmYJx/IoDKzFkIoqyMKxLIEYg
         5ONPnrRkldXgp1zr2pts6ibCC3ZYz7HWKDT+r3JJhaC2PllP0nTH4sv/mhsPzsbuXnpJ
         qyNszVnHnSEleu9I23eeYIjTqktxNpO3AMtWZJVTRjOLkLxaZvhQEVVUSGgH70SwEygh
         U2L8+p5+9mtOBVDsF1Dt/6JT18Vxycb2LJiNIf+AY9dwdbkeJMqpIByPjEKu2j5rzzGa
         txRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H0bgtqb2UkiofCd1TWrsb32w1UzaqVKjX8IutQVeR8o=;
        b=LGWG1Ia2Q7XvTCU/1CKsKAT3Cif98Va43Zm1XquWnShJqv160QpNzZXzdCWvyn+1iO
         ++uClXUJwRpmZy8sUFs3ak/8DNx/AOfwNDeN2fbuIEvKwSN6NgHtWyUr3ck8gYr+NxXw
         61m53zhBVFtvadrizA9CUKTIz9/j5daQFUSQ3MwyP6EI8hEL+ZGp3NuhZqBEcnaPCkh+
         IQZBwSPJuDprZaZ2deHPVw03rlRWouPXrPsQ4+K/JhIhL4trN4Cmjg6um6sx10oL9dRl
         D7nGn9xniJ7+PZvGgsPJmB5T/rMBUjZwqgyhPem07gQo/e7YdVIRnhcHLNa8vCmnFC4M
         wnzw==
X-Gm-Message-State: AOAM530YlsIkVlfwIETa08j2Q02f1ilywlzVBC3zbJ/vfHZtEBEGJRs7
	iup6APP4gr/6CAWQ2el/ihPowNm5NIHsFvvEl7D7fZMtKkM=
X-Google-Smtp-Source: ABdhPJxQevntFeizwi+FofLgGVihRnx45YBL86Qc23NmAa5ChKPhWj6sNqwCfY502yVa6udmJui079TwRqWTpzyPY8A=
X-Received: by 2002:a67:f244:: with SMTP id y4mr7777757vsm.41.1615541324328;
 Fri, 12 Mar 2021 01:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20210312092321.6122-1-mingli.yu@windriver.com>
In-Reply-To: <20210312092321.6122-1-mingli.yu@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 12 Mar 2021 10:28:32 +0100
Message-ID: <CANNYZj-TUfsiK2KPAXmxy1N5Jc7wM-BXdFPBLRZhOh0OJrQasQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: don't generate the .pyc files
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c1b16305bd5386e0"

--000000000000c1b16305bd5386e0
Content-Type: text/plain; charset="UTF-8"

Apologies, I do not think this is appropriate. We generally follow what the
upstream does, and some people might want to package .pyc files to avoid
generating them on target.

If you do not want .pyc, make a .bbappend that deletes them in
do_install_append().

Alex

On Fri, 12 Mar 2021 at 10:23, Yu, Mingli <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Don't generate the .pyc files to reduce the package size.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...1-Makefile.pre.in-don-t-byte-compile.patch | 55 +++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.9.2.bb |  8 +--
>  2 files changed, 56 insertions(+), 7 deletions(-)
>  create mode 100644
> meta/recipes-devtools/python/python3/0001-Makefile.pre.in-don-t-byte-compile.patch
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Makefile.pre.in-don-t-byte-compile.patch
> b/meta/recipes-devtools/python/python3/0001-Makefile.pre.in-don-t-byte-compile.patch
> new file mode 100644
> index 0000000000..17e904f703
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python3/0001-Makefile.pre.in-don-t-byte-compile.patch
> @@ -0,0 +1,55 @@
> +From 35a61f9eb5360b28c7209ebf152673a7f30fcae5 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Fri, 12 Mar 2021 04:30:10 +0000
> +Subject: [PATCH] Makefile.pre.in: don't byte-compile python files
> +
> +Don't generate the .pyc files.
> +
> +Upstream-Status: Inappropriate [configuration related]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + Makefile.pre.in | 27 ---------------------------
> + 1 file changed, 27 deletions(-)
> +
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index 399dfa6..dfeb280 100644
> +--- a/Makefile.pre.in
> ++++ b/Makefile.pre.in
> +@@ -1528,33 +1528,6 @@ libinstall:     build_all
> $(srcdir)/Modules/xxmodule.c
> +               $(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
> +                       $(DESTDIR)$(LIBDEST)/distutils/tests ; \
> +       fi
> +-      -PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
> +-              $(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py
> \
> +-              -d $(LIBDEST) -f \
> +-              -x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data'
> \
> +-              $(DESTDIR)$(LIBDEST)
> +-      -PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> +-              $(PYTHON_FOR_BUILD) -Wi -O
> $(DESTDIR)$(LIBDEST)/compileall.py \
> +-              -d $(LIBDEST) -f \
> +-              -x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data'
> \
> +-              $(DESTDIR)$(LIBDEST)
> +-      -PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> +-              $(PYTHON_FOR_BUILD) -Wi -OO
> $(DESTDIR)$(LIBDEST)/compileall.py \
> +-              -d $(LIBDEST) -f \
> +-              -x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data'
> \
> +-              $(DESTDIR)$(LIBDEST)
> +-      -PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> +-              $(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py
> \
> +-              -d $(LIBDEST)/site-packages -f \
> +-              -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> +-      -PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> +-              $(PYTHON_FOR_BUILD) -Wi -O
> $(DESTDIR)$(LIBDEST)/compileall.py \
> +-              -d $(LIBDEST)/site-packages -f \
> +-              -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> +-      -PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> +-              $(PYTHON_FOR_BUILD) -Wi -OO
> $(DESTDIR)$(LIBDEST)/compileall.py \
> +-              -d $(LIBDEST)/site-packages -f \
> +-              -x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
> +       -PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> +               $(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver
> $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
> +       -PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb
> b/meta/recipes-devtools/python/python3_3.9.2.bb
> index af1843a180..8239348378 100644
> --- a/meta/recipes-devtools/python/python3_3.9.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.9.2.bb
> @@ -30,6 +30,7 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
>
> file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
>
> file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
> +           file://0001-Makefile.pre.in-don-t-byte-compile.patch \
>             "
>
>  SRC_URI_append_class-native = " \
> @@ -168,13 +169,6 @@ do_install_append() {
>                  -e "/^ 'INCLUDEPY'/s,/usr/include,${STAGING_INCDIR},g" \
>                  ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
>
> -        # Unfortunately the following pyc files are non-deterministc due
> to 'frozenset'
> -        # being written without strict ordering, even with PYTHONHASHSEED
> = 0
> -        # Upstream is discussing ways to solve the issue properly, until
> then let's
> -        # just not install the problematic files.
> -        # More info:
> http://benno.id.au/blog/2013/01/15/python-determinism
> -        rm
> ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
> -        rm
> ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
>  }
>
>  do_install_append_class-nativesdk () {
> --
> 2.29.2
>
>
> 
>
>

--000000000000c1b16305bd5386e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Apologies, I do not think this is appropriate. We gen=
erally follow what the upstream does, and some people might want to package=
 .pyc files to avoid generating them on target.</div><div><br></div><div>If=
 you do not want .pyc, make a .bbappend that deletes them in do_install_app=
end().<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 12 Mar 2021 at 10=
:23, Yu, Mingli &lt;<a href=3D"mailto:mingli.yu@windriver.com">mingli.yu@wi=
ndriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" =
target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
<br>
Don&#39;t generate the .pyc files to reduce the package size.<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" ta=
rget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0...1-Makefile.pre.in-don-t-byte-compile.patch | 55 +++++++++++++++++=
++<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.9.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.9.2.bb</a> |=C2=A0 8 +--<br>
=C2=A02 files changed, 56 insertions(+), 7 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/0001-Makefil=
e.pre.in-don-t-byte-compile.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre.in-don=
-t-byte-compile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.=
pre.in-don-t-byte-compile.patch<br>
new file mode 100644<br>
index 0000000000..17e904f703<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre.in-don-t-byte=
-compile.patch<br>
@@ -0,0 +1,55 @@<br>
+From 35a61f9eb5360b28c7209ebf152673a7f30fcae5 Mon Sep 17 00:00:00 2001<br=
>
+From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"=
_blank">mingli.yu@windriver.com</a>&gt;<br>
+Date: Fri, 12 Mar 2021 04:30:10 +0000<br>
+Subject: [PATCH] <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" ta=
rget=3D"_blank">Makefile.pre.in</a>: don&#39;t byte-compile python files<br=
>
+<br>
+Don&#39;t generate the .pyc files.<br>
+<br>
+Upstream-Status: Inappropriate [configuration related]<br>
+<br>
+Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" t=
arget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_blank">=
Makefile.pre.in</a> | 27 ---------------------------<br>
+ 1 file changed, 27 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=
=
=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" rel=
=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
+index 399dfa6..dfeb280 100644<br>
+--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bl=
ank">Makefile.pre.in</a><br>
++++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D"_bl=
ank">Makefile.pre.in</a><br>
+@@ -1528,33 +1528,6 @@ libinstall:=C2=A0 =C2=A0 =C2=A0build_all $(srcdir)=
/Modules/xxmodule.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL_DATA) $(=
srcdir)/Modules/xxmodule.c \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0$(DESTDIR)$(LIBDEST)/distutils/tests ; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST)=C2=A0 $(RUNSHARE=
D) \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON_FOR_BUILD) -Wi=
 $(DESTDIR)$(LIBDEST)/compileall.py \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -d $(LIBDEST) -f \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -x &#39;bad_coding|bads=
yntax|site-packages|lib2to3/tests/data&#39; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DESTDIR)$(LIBDEST)<br=
>
+-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON_FOR_BUILD) -Wi=
 -O $(DESTDIR)$(LIBDEST)/compileall.py \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -d $(LIBDEST) -f \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -x &#39;bad_coding|bads=
yntax|site-packages|lib2to3/tests/data&#39; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DESTDIR)$(LIBDEST)<br=
>
+-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON_FOR_BUILD) -Wi=
 -OO $(DESTDIR)$(LIBDEST)/compileall.py \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -d $(LIBDEST) -f \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -x &#39;bad_coding|bads=
yntax|site-packages|lib2to3/tests/data&#39; \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DESTDIR)$(LIBDEST)<br=
>
+-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON_FOR_BUILD) -Wi=
 $(DESTDIR)$(LIBDEST)/compileall.py \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -d $(LIBDEST)/site-pack=
ages -f \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -x badsyntax $(DESTDIR)=
$(LIBDEST)/site-packages<br>
+-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON_FOR_BUILD) -Wi=
 -O $(DESTDIR)$(LIBDEST)/compileall.py \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -d $(LIBDEST)/site-pack=
ages -f \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -x badsyntax $(DESTDIR)=
$(LIBDEST)/site-packages<br>
+-=C2=A0 =C2=A0 =C2=A0 -PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(PYTHON_FOR_BUILD) -Wi=
 -OO $(DESTDIR)$(LIBDEST)/compileall.py \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -d $(LIBDEST)/site-pack=
ages -f \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -x badsyntax $(DESTDIR)=
$(LIBDEST)/site-packages<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED=
) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_FOR_BUILD=
) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED=
) \<br>
+-- <br>
+2.29.2<br>
+<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.9.2.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.9.2.bb</a> b/meta/recipe=
s-devtools/python/<a href=3D"http://python3_3.9.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3_3.9.2.bb</a><br>
index af1843a180..8239348378 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.9.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.9.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.9.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.9.2.bb</a><br>
@@ -30,6 +30,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/p=
ython/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blan=
k">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-do-not-comp=
ile-.pyc-in-parallel.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0020-configure.ac-setup.p=
y-do-not-add-a-curses-include-pa.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Lib-sysconfig.py-use=
-libdir-values-from-configuratio.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.pre.in-don-=
t-byte-compile.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot; \<br>
@@ -168,13 +169,6 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &quot;/^ =
&#39;INCLUDEPY&#39;/s,/usr/include,${STAGING_INCDIR},g&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${libdir=
}/python-sysconfigdata/_sysconfigdata.py<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Unfortunately the following pyc files are n=
on-deterministc due to &#39;frozenset&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # being written without strict ordering, even=
 with PYTHONHASHSEED =3D 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Upstream is discussing ways to solve the is=
sue properly, until then let&#39;s<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # just not install the problematic files.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # More info: <a href=3D"http://benno.id.au/bl=
og/2013/01/15/python-determinism" rel=3D"noreferrer" target=3D"_blank">http=
://benno.id.au/blog/2013/01/15/python-determinism</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/=
__pycache__/test_range.cpython*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/=
__pycache__/test_xml_etree.cpython*<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_class-nativesdk () {<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000c1b16305bd5386e0--
