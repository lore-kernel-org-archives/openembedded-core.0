Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.8068.1586858592306723797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 03:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vIvDx1Lf;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id j65so7267737vsd.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 03:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=641+OnKXCKx/I3Bxv3tAVonNsJ1RXGqyZ7Zu3yaVU8c=;
        b=vIvDx1LfMIYrAIhrH57g0vkJp0133wfkKiBqpOkzn0vs1yVpwocONZPJwHdsJUqzjz
         Hra3bc+aoBnh4mvBZk/i0+h0Ot6UfR/oEKH0GgBrdOvykY+b7wvMG2+hvDkanfsKZrIq
         EJ4vq4GUXKKxMAZMcTgmWHmQmzT2huexiXL/wawO1rci1aC8Ie1yZZQzHVcLCzMLLCLe
         7kp/HUhtbryD6gfOcHNkrgJreGotliIBBuQfyCwHQAGo0HxWwu+qNDb/GC/QtmIGxmKa
         mfoPYQ4/dLliFhxnN2k/o2rF3LMpVrZuzzdxOEo/XXmaakQds7cE3g6V4T0v+8rAhnYm
         J5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=641+OnKXCKx/I3Bxv3tAVonNsJ1RXGqyZ7Zu3yaVU8c=;
        b=V5qYprCdnGeGcuvyYzkjJp0XipZtePF/Am1OP/jUcbgHA11qV7oWXZ2XaH4XdMi2M2
         7jlxdLe31CB8wQbcse4FINHaKSdrY6xuWsBrCz6d4MSiJGq7Ihu3PDvzTYqOjIYPwTnt
         KlqMveu8tarWt8UIrUXaKCETjvR/WNIFRgQ8Higf4BVzJzL7+odPgfKLcyTF5xtto9SP
         jeoqtNcjkXWJkrhIaoYsWa00wSCV4ZBimORPB12Iyn9CDC/+KmYmYbdhrzg8Xr3wOyFB
         /BLv8E/IuwqwErvLm+lkPUlnPpzC8/bdR5BwwJPARl2NgrnXK8XZzLLhus9Smp8UC9tY
         rpwg==
X-Gm-Message-State: AGi0PuZKJE4t20qbHBuNz85GvlTm9vGsvF2v4PJdoeQZ/SAkmsAigwMB
	+nwOsbQKWNl02eiifjBos/SUc2pciZn21DDQAmE=
X-Google-Smtp-Source: APiQypKNXmaZRoh5a4yHoh4M+s+g/YG/W8gBZpdNKMpPnhRBWoy8wsZHXUxeRUICgtxYLlXjcTHb9qkorGBUGC5RgA8=
X-Received: by 2002:a67:fc8d:: with SMTP id x13mr9430508vsp.83.1586858591357;
 Tue, 14 Apr 2020 03:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <gpj5.1586856421429089519.wk1S@lists.openembedded.org>
In-Reply-To: <gpj5.1586856421429089519.wk1S@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 14 Apr 2020 12:02:59 +0200
Message-ID: <CANNYZj_tFEkd1USfo_Pb7b4iMskhgMcWddT3o30S2kXL0cwt3A@mail.gmail.com>
Subject: Re: [OE-core] gnome.gtk-doc() gives permission denied error in Yocto (do_install)
To: vishnumotghare@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a5901f05a33d4ef6"

--000000000000a5901f05a33d4ef6
Content-Type: text/plain; charset="UTF-8"

You need to show the recipe as well. I'd suggest you take an existing
recipe that uses meson and has gtk-doc enabled, and see how it's done in
the source code of the component. fixxref_args in particular look
suspicious to me, maybe you could try removing them.

Alex

On Tue, 14 Apr 2020 at 11:27, <vishnumotghare@gmail.com> wrote:

> I'm trying to generate html docs using meson build. I used gnome.gtkdoc()
> method for this (meson build system).
>
> Following is my meson.build file
>
> project('mydoc', 'c',
>   version: '0.1.0')
>
> gnome = import('gnome')
>
> glib_prefix = dependency('glib-2.0').get_pkgconfig_variable('prefix')
> glib_docpath = join_paths(glib_prefix, 'share', 'gtk-doc', 'html')
> docpath = join_paths(get_option('datadir'), 'gtk-doc', 'html')
>
> content_files = [
>   'docbook-mydoc.xml',
> ]
> gnome.gtkdoc('mydoc',
>   main_xml : 'main-doc.xml',
>   src_dir : [
>       join_paths(meson.source_root())
>    ],
>   fixxref_args: [
>       '--html-dir=' + (gnome.gtkdoc_html_dir(meson.project_name())),
>       '--extra-dir=@0@'.format(join_paths(glib_docpath, 'glib')),
>       '--extra-dir=@0@'.format(join_paths(glib_docpath, 'gobject')),
>       '--extra-dir=@0@'.format(join_paths(glib_docpath, 'gio')),
>     ],
>   content_files: content_files,
>   install : true,
>   install_dir: join_paths(meson.source_root(), 'doc')
> )
>
> Above meson.build works fine & generates html pages in SDK environment (generated
> by yocto). I've problem when running above meson.build in Yocto. It gives
> me Permission denied error while do_install operation.
>
> *ERROR:*
>
> ERROR: ['gtkdoc-mkhtml','--path=/home/user/yocto/build
> -zeus/tmp/work/cortexa7t2hf-neon-fslc-linux-gnueabi/mydoc/
> 1.0.0-r0/git/:/home/user/yocto/build-zeus/tmp/work/
> cortexa7t2hf-neon-fslc-linux-gnueabi/mydoc/1.0.0-r0/build/','mydoc',
> '../main-doc.xml'] failed with status 1Traceback (most recent call last):File
> "/home/user/yocto/build-zeus/tmp/work/cortexa7t2hf-neon-fslc
> -linux-gnueabi/mydoc/1.0.0-r0/recipe-sysroot-native/usr/bin/
> gtkdoc-mkhtml",line 51, in sys.exit(mkhtml.run(options)) File
> "/home/user/yocto/build-zeus/tmp/work/cortexa7t2hf-neon-fslc
> -linux-gnueabi/mydoc/1.0.0-r0/recipe-sysroot-native/usr/
> share/gtk-doc/python/gtkdoc/mkhtml.py",line 93, in run quiet] +
> remaining_args + [gtkdocdir + '/gtk-doc.xsl',document])File
> "/home/user/yocto/build-zeus/tmp/work/cortexa7t2hf-neon-fslc
> -linux-gnueabi/mydoc/1.0.0-r0/recipe-sysroot-native/usr/
> share/gtk-doc/python/gtkdoc/mkhtml.py",line 42, in run_xsltproc return
> subprocess.call(command + args)File "/home/user/yocto/build-zeus/t
> mp/work/cortexa7t2hf-neon-fslc-linux-gnueabi/mydoc/1.0.0-r0/
> recipe-sysroot-native/usr/lib/python3.7/subprocess.py",line 339, in call
> with Popen(*popenargs, **kwargs) as p:File "/home/user/yocto/build-zeus/t
> mp/work/cortexa7t2hf-neon-fslc-linux-gnueabi/mydoc/1.0.0-r0/
> recipe-sysroot-native/usr/lib/python3.7/subprocess.py",line 800, in init
> restore_signals, start_new_session)File "/home/user/yocto/build-zeus/t
> mp/work/cortexa7t2hf-neon-fslc-linux-gnueabi/mydoc/1.0.0-r0/
> recipe-sysroot-native/usr/lib/python3.7/subprocess.py",line 1551, in
> _execute_child raise child_exception_type(errno_num,err_msg,
> err_filename) PermissionError: [Errno 13] Permission denied:''
>
> I'm not sure why its giving permission denied error. Any help will be
> appreciated. 
>

--000000000000a5901f05a33d4ef6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need to show the recipe as well. I&#39;d suggest =
you take an existing recipe that uses meson and has gtk-doc enabled, and se=
e how it&#39;s done in the source code of the component. fixxref_args in pa=
rticular look suspicious to me, maybe you could try removing them.<br></div=
><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, 14 Apr 2020 at 11:27, &lt;<a hre=
f=3D"mailto:vishnumotghare@gmail.com">vishnumotghare@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=
=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:s=
mall">I&#39;m trying to generate html docs using meson build. I used=C2=A0<=
/span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-s=
erif;font-size:small">gnome.gtkdoc() method for this (meson build system).<=
/span><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-ser=
if;font-size:small"><br style=3D"color:rgb(34,34,34);font-family:Arial,Helv=
etica,sans-serif;font-size:small"><span style=3D"color:rgb(34,34,34);font-f=
amily:Arial,Helvetica,sans-serif;font-size:small">Following is my meson.bui=
ld file</span><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,=
sans-serif;font-size:small">
<blockquote><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica=
,sans-serif;font-size:small">project(&#39;mydoc&#39;, &#39;c&#39;,</span><b=
r style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-=
size:small"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,=
sans-serif;font-size:small">=C2=A0 version: &#39;0.1.0&#39;)</span><br styl=
e=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:s=
mall"><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-ser=
if;font-size:small"><span style=3D"color:rgb(34,34,34);font-family:Arial,He=
lvetica,sans-serif;font-size:small">gnome =3D import(&#39;gnome&#39;)</span=
><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;fo=
nt-size:small"><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica=
,sans-serif;font-size:small"><span style=3D"color:rgb(34,34,34);font-family=
:Arial,Helvetica,sans-serif;font-size:small">glib_prefix =3D dependency(&#3=
9;glib-2.0&#39;).get_pkg</span><span style=3D"color:rgb(34,34,34);font-fami=
ly:Arial,Helvetica,sans-serif;font-size:small">config_variable(&#39;prefix&=
#39;)</span><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sa=
ns-serif;font-size:small"><span style=3D"color:rgb(34,34,34);font-family:Ar=
ial,Helvetica,sans-serif;font-size:small">glib_docpath =3D join_paths(glib_=
prefix, &#39;share&#39;, &#39;gtk-doc&#39;, &#39;html&#39;)</span><br style=
=
=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:s=
mall"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-s=
erif;font-size:small">docpath =3D join_paths(get_option(&#39;datadir</span>=
<span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;f=
ont-size:small">&#39;), &#39;gtk-doc&#39;, &#39;html&#39;)</span><br style=
=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:s=
mall"><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-ser=
if;font-size:small"><span style=3D"color:rgb(34,34,34);font-family:Arial,He=
lvetica,sans-serif;font-size:small">content_files =3D [</span><br style=3D"=
color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small"=
><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;=
font-size:small">=C2=A0 &#39;docbook-mydoc.xml&#39;,</span><br style=3D"col=
or:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small"><s=
pan style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;fon=
t-size:small">]</span><br style=3D"color:rgb(34,34,34);font-family:Arial,He=
lvetica,sans-serif;font-size:small"><span style=3D"color:rgb(34,34,34);font=
-family:Arial,Helvetica,sans-serif;font-size:small">gnome.gtkdoc(&#39;mydoc=
&#39;,</span><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,s=
ans-serif;font-size:small"><span style=3D"color:rgb(34,34,34);font-family:A=
rial,Helvetica,sans-serif;font-size:small">=C2=A0 main_xml : &#39;main-doc.=
xml&#39;,</span><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetic=
a,sans-serif;font-size:small"><span style=3D"color:rgb(34,34,34);font-famil=
y:Arial,Helvetica,sans-serif;font-size:small">=C2=A0 src_dir : [</span><br =
style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-si=
ze:small"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sa=
ns-serif;font-size:small">=C2=A0 =C2=A0 =C2=A0 join_paths(meson.source_root=
()</span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,san=
s-serif;font-size:small">)</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:Arial,Helvetica,sans-serif;font-size:small"><span style=3D"color:rgb(34,=
34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">=C2=A0 =C2=
=A0],</span><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,s=
ans-serif;font-size:small"><span style=3D"color:rgb(34,34,34);font-family:A=
rial,Helvetica,sans-serif;font-size:small">=C2=A0 fixxref_args: [</span><br=
 style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-s=
ize:small"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,s=
ans-serif;font-size:small">=C2=A0 =C2=A0 =C2=A0 &#39;--html-dir=3D&#39; + (=
gnome.gtkdoc_html_dir(meson.p</span><span style=3D"color:rgb(34,34,34);font=
-family:Arial,Helvetica,sans-serif;font-size:small">roject_name())),</span>=
<br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;fon=
t-size:small"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetic=
a,sans-serif;font-size:small">=C2=A0 =C2=A0 =C2=A0 &#39;--extra-dir=3D@0@&#=
39;.format(join_</span><span style=3D"color:rgb(34,34,34);font-family:Arial=
,Helvetica,sans-serif;font-size:small">paths(glib_docpath, &#39;glib&#39;))=
,</span><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-s=
erif;font-size:small"><span style=3D"color:rgb(34,34,34);font-family:Arial,=
Helvetica,sans-serif;font-size:small">=C2=A0 =C2=A0 =C2=A0 &#39;--extra-dir=
=
=3D@0@&#39;.format(join_</span><span style=3D"color:rgb(34,34,34);font-fam=
ily:Arial,Helvetica,sans-serif;font-size:small">paths(glib_docpath, &#39;go=
bject&#39;)),</span><br style=3D"color:rgb(34,34,34);font-family:Arial,Helv=
etica,sans-serif;font-size:small"><span style=3D"color:rgb(34,34,34);font-f=
amily:Arial,Helvetica,sans-serif;font-size:small">=C2=A0 =C2=A0 =C2=A0 &#39=
;--extra-dir=3D@0@&#39;.format(join_</span><span style=3D"color:rgb(34,34,3=
4);font-family:Arial,Helvetica,sans-serif;font-size:small">paths(glib_docpa=
th, &#39;gio&#39;)),</span><br style=3D"color:rgb(34,34,34);font-family:Ari=
al,Helvetica,sans-serif;font-size:small"><span style=3D"color:rgb(34,34,34)=
;font-family:Arial,Helvetica,sans-serif;font-size:small">=C2=A0 =C2=A0 ],</=
span><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-seri=
f;font-size:small"><span style=3D"color:rgb(34,34,34);font-family:Arial,Hel=
vetica,sans-serif;font-size:small">=C2=A0 content_files: content_files,</sp=
an><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;=
font-size:small"><span style=3D"color:rgb(34,34,34);font-family:Arial,Helve=
tica,sans-serif;font-size:small">=C2=A0 install : true,</span><br style=3D"=
color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small"=
><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;=
font-size:small">=C2=A0 install_dir: join_paths(meson.source_root()</span><=
span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;fo=
nt-size:small">, &#39;doc&#39;)</span><br style=3D"color:rgb(34,34,34);font=
-family:Arial,Helvetica,sans-serif;font-size:small"><span style=3D"color:rg=
b(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">)</span=
></blockquote>
<span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;=
font-size:small">Above meson.build works fine &amp; generates html pages in=
 SDK environment=C2=A0</span><span style=3D"color:rgb(34,34,34);font-family=
:Arial,Helvetica,sans-serif;font-size:small">(generated by yocto). I&#39;ve=
 problem when running above meson.build in=C2=A0</span><span style=3D"color=
:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">Yoct=
o. It gives me Permission denied error while do_install operation.</span><b=
r style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-=
size:small"><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sa=
ns-serif;font-size:small"><strong><span style=3D"color:rgb(34,34,34);font-f=
amily:Arial,Helvetica,sans-serif;font-size:small">ERROR:</span></strong><br=
 style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-s=
ize:small"><br style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,san=
s-serif;font-size:small">
<blockquote><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica=
,sans-serif;font-size:small">ERROR: [&#39;gtkdoc-mkhtml&#39;,</span><span s=
tyle=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-siz=
e:small">&#39;--path=3D/home/user/yocto/build</span><span style=3D"color:rg=
b(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">-zeus/t=
mp/work/cortexa7t2hf-</span><span style=3D"color:rgb(34,34,34);font-family:=
Arial,Helvetica,sans-serif;font-size:small">neon-fslc-linux-gnueabi/mydoc/<=
/span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-s=
erif;font-size:small">1.0.0-r0/git/:/home/user/</span><span style=3D"color:=
rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">yocto=
/build-zeus/tmp/work/</span><span style=3D"color:rgb(34,34,34);font-family:=
Arial,Helvetica,sans-serif;font-size:small">cortexa7t2hf-neon-fslc-linux-</=
span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-se=
rif;font-size:small">gnueabi/mydoc/1.0.0-r0/build/&#39;</span><span style=
=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:s=
mall">,</span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetic=
a,sans-serif;font-size:small">&#39;mydoc&#39;, &#39;../main-doc.xml&#39;] f=
ailed with status 1</span><span style=3D"color:rgb(34,34,34);font-family:Ar=
ial,Helvetica,sans-serif;font-size:small">Traceback (most recent call last)=
:</span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans=
-serif;font-size:small">File &quot;/home/user/yocto/build-zeus/t</span><spa=
n style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-=
size:small">mp/work/cortexa7t2hf-neon-fslc</span><span style=3D"color:rgb(3=
4,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">-linux-gnu=
eabi/mydoc/1.0.0-r0/</span><span style=3D"color:rgb(34,34,34);font-family:A=
rial,Helvetica,sans-serif;font-size:small">recipe-sysroot-native/usr/bin/</=
span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-se=
rif;font-size:small">gtkdoc-mkhtml&quot;,</span><span style=3D"color:rgb(34=
,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">line 51, in=
 sys.exit(mkhtml.run(options)) File</span><span style=3D"color:rgb(34,34,34=
);font-family:Arial,Helvetica,sans-serif;font-size:small">&quot;/home/user/=
yocto/build-zeus/t</span><span style=3D"color:rgb(34,34,34);font-family:Ari=
al,Helvetica,sans-serif;font-size:small">mp/work/cortexa7t2hf-neon-fslc</sp=
an><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-seri=
f;font-size:small">-linux-gnueabi/mydoc/1.0.0-r0/</span><span style=3D"colo=
r:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">rec=
ipe-sysroot-native/usr/</span><span style=3D"color:rgb(34,34,34);font-famil=
y:Arial,Helvetica,sans-serif;font-size:small">share/gtk-doc/python/gtkdoc/<=
/span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-s=
erif;font-size:small">mkhtml.py&quot;,</span><span style=3D"color:rgb(34,34=
,34);font-family:Arial,Helvetica,sans-serif;font-size:small">line 93, in ru=
n quiet] + remaining_args + [gtkdocdir + &#39;/gtk-doc.xsl&#39;,</span><spa=
n style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-=
size:small">document])</span><span style=3D"color:rgb(34,34,34);font-family=
:Arial,Helvetica,sans-serif;font-size:small">File &quot;/home/user/yocto/bu=
ild-zeus/t</span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helve=
tica,sans-serif;font-size:small">mp/work/cortexa7t2hf-neon-fslc</span><span=
 style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-s=
ize:small">-linux-gnueabi/mydoc/1.0.0-r0/</span><span style=3D"color:rgb(34=
,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">recipe-sysr=
oot-native/usr/</span><span style=3D"color:rgb(34,34,34);font-family:Arial,=
Helvetica,sans-serif;font-size:small">share/gtk-doc/python/gtkdoc/</span><s=
pan style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;fon=
t-size:small">mkhtml.py&quot;,</span><span style=3D"color:rgb(34,34,34);fon=
t-family:Arial,Helvetica,sans-serif;font-size:small">line 42, in run_xsltpr=
oc return subprocess.call(command + args)</span><span style=3D"color:rgb(34=
,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">File &quot;=
/home/user/yocto/build-zeus/t</span><span style=3D"color:rgb(34,34,34);font=
-family:Arial,Helvetica,sans-serif;font-size:small">mp/work/cortexa7t2hf-ne=
on-fslc</span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetic=
a,sans-serif;font-size:small">-linux-gnueabi/mydoc/1.0.0-r0/</span><span st=
yle=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size=
:small">recipe-sysroot-native/usr/lib/</span><span style=3D"color:rgb(34,34=
,34);font-family:Arial,Helvetica,sans-serif;font-size:small">python3.7/subp=
rocess.py&quot;,</span><span style=3D"color:rgb(34,34,34);font-family:Arial=
,Helvetica,sans-serif;font-size:small">line 339, in call with Popen(*popena=
rgs, **kwargs) as p:</span><span style=3D"color:rgb(34,34,34);font-family:A=
rial,Helvetica,sans-serif;font-size:small">File &quot;/home/user/yocto/buil=
d-zeus/t</span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helveti=
ca,sans-serif;font-size:small">mp/work/cortexa7t2hf-neon-fslc</span><span s=
tyle=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-siz=
e:small">-linux-gnueabi/mydoc/1.0.0-r0/</span><span style=3D"color:rgb(34,3=
4,34);font-family:Arial,Helvetica,sans-serif;font-size:small">recipe-sysroo=
t-native/usr/lib/</span><span style=3D"color:rgb(34,34,34);font-family:Aria=
l,Helvetica,sans-serif;font-size:small">python3.7/subprocess.py&quot;,</spa=
n><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif=
;font-size:small">line 800, in init restore_signals, start_new_session)</sp=
an><span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-seri=
f;font-size:small">File &quot;/home/user/yocto/build-zeus/t</span><span sty=
le=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:=
small">mp/work/cortexa7t2hf-neon-fslc</span><span style=3D"color:rgb(34,34,=
34);font-family:Arial,Helvetica,sans-serif;font-size:small">-linux-gnueabi/=
mydoc/1.0.0-r0/</span><span style=3D"color:rgb(34,34,34);font-family:Arial,=
Helvetica,sans-serif;font-size:small">recipe-sysroot-native/usr/lib/</span>=
<span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;f=
ont-size:small">python3.7/subprocess.py&quot;,</span><span style=3D"color:r=
gb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:small">line 1=
551, in _execute_child raise child_exception_type(errno_num</span><span sty=
le=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:=
small">,</span><span style=3D"color:rgb(34,34,34);font-family:Arial,Helveti=
ca,sans-serif;font-size:small">err_msg, err_filename) PermissionError: [Err=
no 13] Permission denied:</span><span style=3D"color:rgb(34,34,34);font-fam=
ily:Arial,Helvetica,sans-serif;font-size:small">&#39;&#39;</span></blockquo=
te>
<span style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;=
font-size:small">I&#39;m not sure why its giving permission denied error. A=
ny help will be=C2=A0</span><span style=3D"color:rgb(34,34,34);font-family:=
Arial,Helvetica,sans-serif;font-size:small">appreciated.</span>
<br>
</blockquote></div>

--000000000000a5901f05a33d4ef6--
