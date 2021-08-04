Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.6587.1628068522011214244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 02:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WxzPgeuO;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id x11so2699485ejj.8
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 02:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E4FVBJZ2WRntrHVEBk59RhLQR3tyLeeYZcFpPRP+IZ4=;
        b=WxzPgeuOpnChGa368Neq6WM+WvFrmgZa7SnehY+osyHAvfAV2cVYNC/eBLX0Y40Bz7
         S4m1e5c5VSFhHjcXPmYdowpofCGPv0MaT6vr4aP8KmX4/xYZc5kGza2eP7t08gOid/Nm
         TBMmiplJRq89J9wf4Y7xCAOxYaKc5A15G/xhKaYbhgKlEZs4iRhwvPuVMH7PDq59KTbC
         aGiFGfHaMOy3TzjcXkjprhJ/qqcDegT6Ga3OyPJN/4J6PUcf2AsfDHpn/u5yTBVHYdCG
         xGmfGDfRamuH/mhX/nU7whA6cFjD2W2P1NOpxRLVCkyBsFXIj7eC8a51JEnpgLrJUc0y
         l1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E4FVBJZ2WRntrHVEBk59RhLQR3tyLeeYZcFpPRP+IZ4=;
        b=ndWztTrKXq/83PtVkmRXVwgQUxAbpbsbDlwTcaYs6P+EuEwv6qY0PkyWQ5eO9as3N8
         IPzInqAqapjfZPLsQxKqxEFAZbHN5Ni+CDu0RUkmsB3+JZ3Cq54aF4fxLREfGlmmltyS
         gp3ArFyqkmrGtcAsEqi+DFBErCmP7Lmu8sWzoq3jTZJAi1x+aaxmVHWWySaTWJXtqFCf
         /Th+K5H+8i3QyZWjBjo18edmNMxGuYerpXl+zchxXAJM/TTrkxHPKLncwC7781dIjQL8
         EzTCQ/rKmmMjvNxBJvOlolf24h3uDjWHLWHwD/Nl7d3PdtolZs5X5kp8OWOH4T4/pnHw
         hpGQ==
X-Gm-Message-State: AOAM5317K3jBvEuNHA/WhJI3s4RkOpnhYxiXCfjSyQzbB3MQc7MFZxMm
	tUQCJXljHjF7ogcSHAozcokDiNV7+drOU8h+0mE=
X-Google-Smtp-Source: ABdhPJw/0ZZ3Fcx5lDyavXSd4fZMNiXjSaBU+xGPEHpGgdW3nvzgogcuJpWbhedA2X/2T03IxKfrXrehbs5yuDep1L0=
X-Received: by 2002:a17:907:990d:: with SMTP id ka13mr25218868ejc.392.1628068520547;
 Wed, 04 Aug 2021 02:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <1697EB16E97488E4.1963@lists.openembedded.org> <20210804080637.5869-1-Martin.Jansa@gmail.com>
 <5d94be69-fd43-ec59-e4c3-362ae295ab84@windriver.com>
In-Reply-To: <5d94be69-fd43-ec59-e4c3-362ae295ab84@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 4 Aug 2021 11:15:09 +0200
Message-ID: <CA+chaQcsW3sMxiGcUZr05cVCb6GQykpVpzFa1VR5KctHYX8vrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] iputils: backport a fix for building on hosts without ip installed
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d6597a05c8b83d8d"

--000000000000d6597a05c8b83d8d
Content-Type: text/plain; charset="UTF-8"

Thanks, I haven't seen your fix before sending mine. Thanks

RP: please ignore my version.

On Wed, Aug 4, 2021 at 10:25 AM ChenQi <Qi.Chen@windriver.com> wrote:

> Hi Martin,
>
> I met the same problem and sent out a similar patch.
> More accurately, the problem is about 'testsdk' and 'testimage' not being
> inherited in configuration.
>
> meta/conf/bitbake.conf:HOSTTOOLS += "${@'ip ping ps scp ssh stty' if
> (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False,
> d) or any(x in (d.getVar("
> <$%7B@'ippingpsscpsshstty'if(bb.utils.contains_any('IMAGE_CLASSES','testimagetestsdk',True,False,d)orany(xin(d.getVar(>BBINCLUDED")
> or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
>
> Best Regards,
> Chen Qi
>
> On 08/04/2021 04:06 PM, Martin Jansa wrote:
>
> * otherwise fails with:
>   ../git/ping/meson.build:38:0: ERROR: Program or command 'ip' not found or not executable
>   on hosts without ip command
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> <Martin.Jansa@gmail.com>
> ---
>  .../0001-meson-Make-tests-optional.patch      | 217 ++++++++++++++++++
>  .../iputils/iputils_20210722.bb               |   8 +-
>  2 files changed, 222 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
>
> diff --git a/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
> new file mode 100644
> index 0000000000..0e47a8f047
> --- /dev/null
> +++ b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional.patch
> @@ -0,0 +1,217 @@
> +From c50aa971b9f7bf3212c48cb271ab2b1e804aef7f Mon Sep 17 00:00:00 2001
> +From: Heiko Becker <heirecka@exherbo.org> <heirecka@exherbo.org>
> +Date: Fri, 23 Jul 2021 16:32:46 +0200
> +Subject: [PATCH] meson: Make tests optional
> +
> +Now can be disabled with -DSKIP_TESTS=true.
> +
> +It allows to avoid meson error during build when ip isn't installed.
> +
> +Closes: #359
> +
> +Reviewed-by: Petr Vorel <petr.vorel@gmail.com> <petr.vorel@gmail.com>
> +Signed-off-by: Heiko Becker <heirecka@exherbo.org> <heirecka@exherbo.org>
> +[ pvorel: Rename variable TEST => SKIP_TESTS, default false, adjust
> +the description ]
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com> <petr.vorel@gmail.com>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> <Martin.Jansa@gmail.com>
> +---
> + meson_options.txt     |  3 ++
> + ping/meson.build      | 84 ++-----------------------------------------
> + ping/test/meson.build | 81 +++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 86 insertions(+), 82 deletions(-)
> + create mode 100644 ping/test/meson.build
> +
> +diff --git a/meson_options.txt b/meson_options.txt
> +index ac5f5d9..517667f 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -72,3 +72,6 @@ option('INSTALL_SYSTEMD_UNITS', type: 'boolean', value: false,
> +
> + option('USE_GETTEXT', type: 'boolean', value: true,
> + 	description: 'Enable I18N')
> ++
> ++option('SKIP_TESTS', type: 'boolean', value: false,
> ++	description: 'Skip tests during build')
> +diff --git a/ping/meson.build b/ping/meson.build
> +index 1e678ec..83ea353 100644
> +--- a/ping/meson.build
> ++++ b/ping/meson.build
> +@@ -27,86 +27,6 @@ if (setcap_ping)
> + 	)
> + endif
> +
> +-##### TESTS #####
> +-
> +-# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
> +-
> +-# GitHub CI does not have working IPv6
> +-# https://github.com/actions/virtual-environments/issues/668
> +-ipv6_dst = []
> +-ipv6_switch = []
> +-r = run_command('ip', '-6', 'a')
> +-if r.stdout().strip().contains('::1')
> +-  message('IPv6 enabled')
> +-  ipv6_dst = [ '::1' ]
> +-  ipv6_switch = [ '-6' ]
> +-else
> +-  message('WARNING: IPv6 disabled')
> ++if not get_option('SKIP_TESTS')
> ++	subdir('test')
> + endif
> +-
> +-run_as_root = false
> +-r = run_command('id', '-u')
> +-if r.stdout().strip().to_int() == 0
> +-  message('running as root')
> +-  run_as_root = true
> +-else
> +-  message('running as normal user')
> +-endif
> +-
> +-foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
> +-  foreach switch : [ '', '-4' ] + ipv6_switch
> +-	args = [ '-c1', dst ]
> +-	should_fail = false
> +-
> +-	if switch != ''
> +-	  args = [switch] + args
> +-	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
> +-		 should_fail = true
> +-	  endif
> +-	endif
> +-
> +-	name = 'ping ' + ' '.join(args)
> +-	test(name, ping, args : args, should_fail : should_fail)
> +-  endforeach
> +-endforeach
> +-
> +-ping_tests_opt = [
> +-  [ '-c1' ],
> +-  [ '-c5', '-i0.1' ],
> +-  [ '-c1', '-I', 'lo' ],
> +-  [ '-c1', '-w1' ],
> +-  [ '-c1', '-W1' ],
> +-  [ '-c1', '-W1.1' ],
> +-]
> +-foreach dst : [ '127.0.0.1' ] + ipv6_dst
> +-  foreach args : ping_tests_opt
> +-	args += [ dst ]
> +-	name = 'ping ' + ' '.join(args)
> +-	test(name, ping, args : args)
> +-  endforeach
> +-endforeach
> +-
> +-ping_tests_opt_fail = [
> +-  [ '-c1.1' ],
> +-  [ '-I', 'nonexisting' ],
> +-  [ '-w0.1' ],
> +-  [ '-w0,1' ],
> +-]
> +-foreach dst : [ '127.0.0.1' ] + ipv6_dst
> +-  foreach args : ping_tests_opt_fail
> +-	args += [ dst ]
> +-	name = 'ping ' + ' '.join(args)
> +-	test(name, ping, args : args, should_fail : true)
> +-  endforeach
> +-endforeach
> +-
> +-ping_tests_user_fail = [
> +-  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
> +-]
> +-foreach dst : [ '127.0.0.1' ] + ipv6_dst
> +-  foreach args : ping_tests_user_fail
> +-	args += [ dst ]
> +-	name = 'ping ' + ' '.join(args)
> +-	test(name, ping, args : args, should_fail : not run_as_root)
> +-  endforeach
> +-endforeach
> +diff --git a/ping/test/meson.build b/ping/test/meson.build
> +new file mode 100644
> +index 0000000..43aed75
> +--- /dev/null
> ++++ b/ping/test/meson.build
> +@@ -0,0 +1,81 @@
> ++# TODO: ::1 generates DEPRECATION: ":" is not allowed in test name "ping -c1 ::1", it has been replaced with "_"
> ++
> ++# GitHub CI does not have working IPv6
> ++# https://github.com/actions/virtual-environments/issues/668
> ++ipv6_dst = []
> ++ipv6_switch = []
> ++r = run_command('ip', '-6', 'a')
> ++if r.stdout().strip().contains('::1')
> ++  message('IPv6 enabled')
> ++  ipv6_dst = [ '::1' ]
> ++  ipv6_switch = [ '-6' ]
> ++else
> ++  message('WARNING: IPv6 disabled')
> ++endif
> ++
> ++run_as_root = false
> ++r = run_command('id', '-u')
> ++if r.stdout().strip().to_int() == 0
> ++  message('running as root')
> ++  run_as_root = true
> ++else
> ++  message('running as normal user')
> ++endif
> ++
> ++foreach dst : [ 'localhost', '127.0.0.1' ] + ipv6_dst
> ++  foreach switch : [ '', '-4' ] + ipv6_switch
> ++	args = [ '-c1', dst ]
> ++	should_fail = false
> ++
> ++	if switch != ''
> ++	  args = [switch] + args
> ++	  if (switch == '-4' and dst == '::1') or (switch == '-6' and dst == '127.0.0.1')
> ++		 should_fail = true
> ++	  endif
> ++	endif
> ++
> ++	name = 'ping ' + ' '.join(args)
> ++	test(name, ping, args : args, should_fail : should_fail)
> ++  endforeach
> ++endforeach
> ++
> ++ping_tests_opt = [
> ++  [ '-c1' ],
> ++  [ '-c5', '-i0.1' ],
> ++  [ '-c1', '-I', 'lo' ],
> ++  [ '-c1', '-w1' ],
> ++  [ '-c1', '-W1' ],
> ++  [ '-c1', '-W1.1' ],
> ++]
> ++foreach dst : [ '127.0.0.1' ] + ipv6_dst
> ++  foreach args : ping_tests_opt
> ++	args += [ dst ]
> ++	name = 'ping ' + ' '.join(args)
> ++	test(name, ping, args : args)
> ++  endforeach
> ++endforeach
> ++
> ++ping_tests_opt_fail = [
> ++  [ '-c1.1' ],
> ++  [ '-I', 'nonexisting' ],
> ++  [ '-w0.1' ],
> ++  [ '-w0,1' ],
> ++]
> ++foreach dst : [ '127.0.0.1' ] + ipv6_dst
> ++  foreach args : ping_tests_opt_fail
> ++	args += [ dst ]
> ++	name = 'ping ' + ' '.join(args)
> ++	test(name, ping, args : args, should_fail : true)
> ++  endforeach
> ++endforeach
> ++
> ++ping_tests_user_fail = [
> ++  [ '-c1', '-i0.001' ], # -c1 required to quit ping when running as root
> ++]
> ++foreach dst : [ '127.0.0.1' ] + ipv6_dst
> ++  foreach args : ping_tests_user_fail
> ++	args += [ dst ]
> ++	name = 'ping ' + ' '.join(args)
> ++	test(name, ping, args : args, should_fail : not run_as_root)
> ++  endforeach
> ++endforeach
> diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/recipes-extended/iputils/iputils_20210722.bb
> index c2a5bf44ea..2e4ff2e826 100644
> --- a/meta/recipes-extended/iputils/iputils_20210722.bb
> +++ b/meta/recipes-extended/iputils/iputils_20210722.bb
> @@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
>  DEPENDS = "gnutls"
>
>  SRC_URI = "git://github.com/iputils/iputils \
> -           file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
> -           "
> +    file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
> +    file://0001-meson-Make-tests-optional.patch \
> +"
>  SRCREV = "71bb2a6c72e9f658e90ac618c73d873a76bbaa81"
>
>  S = "${WORKDIR}/git"
> @@ -38,7 +39,8 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
>
>  inherit meson systemd update-alternatives
>
> -EXTRA_OEMESON += "--prefix=${root_prefix}/"
> +# skip tests as they require ip to be installed on host
> +EXTRA_OEMESON += "--prefix=${root_prefix}/ -DSKIP_TESTS=true"
>
>  ALTERNATIVE_PRIORITY = "100"
>
>
>
>
> 
>
>
>
>

--000000000000d6597a05c8b83d8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, I haven&#39;t seen your fix before sending mine. T=
hanks<div><br></div><div>RP: please ignore my version.</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 4, =
2021 at 10:25 AM ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">

  
  <div bgcolor=3D"#FFFFFF">
    <div>Hi Martin,<br>
      <br>
      I met the same problem and sent out a similar patch.<br>
      More accurately, the problem is about &#39;testsdk&#39; and &#39;tes=
timage&#39;
      not being inherited in configuration.<br>
      <br>
      meta/conf/bitbake.conf:HOSTTOOLS +=3D <a href=3D"mailto:$%7B@&#39;ip=
pingpsscpsshstty&#39;if(bb.utils.contains_any(&#39;IMAGE_CLASSES&#39;,&#39;=
testimagetestsdk&#39;,True,False,d)orany(xin(d.getVar(" target=3D"_blank">&=
quot;${@&#39;ip ping ps scp ssh stty&#39;
      if (bb.utils.contains_any(&#39;IMAGE_CLASSES&#39;, &#39;testimage te=
stsdk&#39;,
      True, False, d) or any(x in (d.getVar(&quot;</a>BBINCLUDED&quot;) or=
 &quot;&quot;) for x
      in [&quot;testimage.bbclass&quot;, &quot;testsdk.bbclass&quot;])) el=
se &#39;&#39;}&quot;<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 08/04/2021 04:06 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>* otherwise fails with:
  ../git/ping/meson.build:38:0: ERROR: Program or command &#39;ip&#39; not=
 found or not executable
  on hosts without ip command

Signed-off-by: Martin Jansa <a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">&lt;Martin.Jansa@gmail.com&gt;</a>
---
 .../0001-meson-Make-tests-optional.patch      | 217 ++++++++++++++++++
 .../iputils/<a href=3D"http://iputils_20210722.bb" target=3D"_blank">iput=
ils_20210722.bb</a>               |   8 +-
 2 files changed, 222 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-meson-Make-=
tests-optional.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-o=
ptional.patch b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests=
-optional.patch
new file mode 100644
index 0000000000..0e47a8f047
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-meson-Make-tests-optional=
.patch
@@ -0,0 +1,217 @@
+From c50aa971b9f7bf3212c48cb271ab2b1e804aef7f Mon Sep 17 00:00:00 2001
+From: Heiko Becker <a href=3D"mailto:heirecka@exherbo.org" target=3D"_bla=
nk">&lt;heirecka@exherbo.org&gt;</a>
+Date: Fri, 23 Jul 2021 16:32:46 +0200
+Subject: [PATCH] meson: Make tests optional
+
+Now can be disabled with -DSKIP_TESTS=3Dtrue.
+
+It allows to avoid meson error during build when ip isn&#39;t installed.
+
+Closes: #359
+
+Reviewed-by: Petr Vorel <a href=3D"mailto:petr.vorel@gmail.com" target=3D=
"_blank">&lt;petr.vorel@gmail.com&gt;</a>
+Signed-off-by: Heiko Becker <a href=3D"mailto:heirecka@exherbo.org" targe=
t=3D"_blank">&lt;heirecka@exherbo.org&gt;</a>
+[ pvorel: Rename variable TEST =3D&gt; SKIP_TESTS, default false, adjust
+the description ]
+Signed-off-by: Petr Vorel <a href=3D"mailto:petr.vorel@gmail.com" target=
=3D"_blank">&lt;petr.vorel@gmail.com&gt;</a>
+
+Upstream-Status: Backport
+Signed-off-by: Martin Jansa <a href=3D"mailto:Martin.Jansa@gmail.com" tar=
get=3D"_blank">&lt;Martin.Jansa@gmail.com&gt;</a>
+---
+ meson_options.txt     |  3 ++
+ ping/meson.build      | 84 ++-----------------------------------------
+ ping/test/meson.build | 81 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 86 insertions(+), 82 deletions(-)
+ create mode 100644 ping/test/meson.build
+
+diff --git a/meson_options.txt b/meson_options.txt
+index ac5f5d9..517667f 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -72,3 +72,6 @@ option(&#39;INSTALL_SYSTEMD_UNITS&#39;, type: &#39;bool=
ean&#39;, value: false,
+=20
+ option(&#39;USE_GETTEXT&#39;, type: &#39;boolean&#39;, value: true,
+ =09description: &#39;Enable I18N&#39;)
++
++option(&#39;SKIP_TESTS&#39;, type: &#39;boolean&#39;, value: false,
++	description: &#39;Skip tests during build&#39;)
+diff --git a/ping/meson.build b/ping/meson.build
+index 1e678ec..83ea353 100644
+--- a/ping/meson.build
++++ b/ping/meson.build
+@@ -27,86 +27,6 @@ if (setcap_ping)
+ =09)
+ endif
+=20
+-##### TESTS #####
+-
+-# TODO: ::1 generates DEPRECATION: &quot;:&quot; is not allowed in test =
name &quot;ping -c1 ::1&quot;, it has been replaced with &quot;_&quot;
+-
+-# GitHub CI does not have working IPv6
+-# <a href=3D"https://github.com/actions/virtual-environments/issues/668"=
 target=3D"_blank">https://github.com/actions/virtual-environments/issues/6=
68</a>
+-ipv6_dst =3D []
+-ipv6_switch =3D []
+-r =3D run_command(&#39;ip&#39;, &#39;-6&#39;, &#39;a&#39;)
+-if r.stdout().strip().contains(&#39;::1&#39;)
+-  message(&#39;IPv6 enabled&#39;)
+-  ipv6_dst =3D [ &#39;::1&#39; ]
+-  ipv6_switch =3D [ &#39;-6&#39; ]
+-else
+-  message(&#39;WARNING: IPv6 disabled&#39;)
++if not get_option(&#39;SKIP_TESTS&#39;)
++	subdir(&#39;test&#39;)
+ endif
+-
+-run_as_root =3D false
+-r =3D run_command(&#39;id&#39;, &#39;-u&#39;)
+-if r.stdout().strip().to_int() =3D=3D 0
+-  message(&#39;running as root&#39;)
+-  run_as_root =3D true
+-else
+-  message(&#39;running as normal user&#39;)
+-endif
+-
+-foreach dst : [ &#39;localhost&#39;, &#39;127.0.0.1&#39; ] + ipv6_dst
+-  foreach switch : [ &#39;&#39;, &#39;-4&#39; ] + ipv6_switch
+-	args =3D [ &#39;-c1&#39;, dst ]
+-	should_fail =3D false
+-
+-	if switch !=3D &#39;&#39;
+-	  args =3D [switch] + args
+-	  if (switch =3D=3D &#39;-4&#39; and dst =3D=3D &#39;::1&#39;) or (swit=
ch =3D=3D &#39;-6&#39; and dst =3D=3D &#39;127.0.0.1&#39;)
+-	=09 should_fail =3D true
+-	  endif
+-	endif
+-
+-	name =3D &#39;ping &#39; + &#39; &#39;.join(args)
+-	test(name, ping, args : args, should_fail : should_fail)
+-  endforeach
+-endforeach
+-
+-ping_tests_opt =3D [
+-  [ &#39;-c1&#39; ],
+-  [ &#39;-c5&#39;, &#39;-i0.1&#39; ],
+-  [ &#39;-c1&#39;, &#39;-I&#39;, &#39;lo&#39; ],
+-  [ &#39;-c1&#39;, &#39;-w1&#39; ],
+-  [ &#39;-c1&#39;, &#39;-W1&#39; ],
+-  [ &#39;-c1&#39;, &#39;-W1.1&#39; ],
+-]
+-foreach dst : [ &#39;127.0.0.1&#39; ] + ipv6_dst
+-  foreach args : ping_tests_opt
+-	args +=3D [ dst ]
+-	name =3D &#39;ping &#39; + &#39; &#39;.join(args)
+-	test(name, ping, args : args)
+-  endforeach
+-endforeach
+-
+-ping_tests_opt_fail =3D [
+-  [ &#39;-c1.1&#39; ],
+-  [ &#39;-I&#39;, &#39;nonexisting&#39; ],
+-  [ &#39;-w0.1&#39; ],
+-  [ &#39;-w0,1&#39; ],
+-]
+-foreach dst : [ &#39;127.0.0.1&#39; ] + ipv6_dst
+-  foreach args : ping_tests_opt_fail
+-	args +=3D [ dst ]
+-	name =3D &#39;ping &#39; + &#39; &#39;.join(args)
+-	test(name, ping, args : args, should_fail : true)
+-  endforeach
+-endforeach
+-
+-ping_tests_user_fail =3D [
+-  [ &#39;-c1&#39;, &#39;-i0.001&#39; ], # -c1 required to quit ping when=
 running as root
+-]
+-foreach dst : [ &#39;127.0.0.1&#39; ] + ipv6_dst
+-  foreach args : ping_tests_user_fail
+-	args +=3D [ dst ]
+-	name =3D &#39;ping &#39; + &#39; &#39;.join(args)
+-	test(name, ping, args : args, should_fail : not run_as_root)
+-  endforeach
+-endforeach
+diff --git a/ping/test/meson.build b/ping/test/meson.build
+new file mode 100644
+index 0000000..43aed75
+--- /dev/null
++++ b/ping/test/meson.build
+@@ -0,0 +1,81 @@
++# TODO: ::1 generates DEPRECATION: &quot;:&quot; is not allowed in test =
name &quot;ping -c1 ::1&quot;, it has been replaced with &quot;_&quot;
++
++# GitHub CI does not have working IPv6
++# <a href=3D"https://github.com/actions/virtual-environments/issues/668"=
 target=3D"_blank">https://github.com/actions/virtual-environments/issues/6=
68</a>
++ipv6_dst =3D []
++ipv6_switch =3D []
++r =3D run_command(&#39;ip&#39;, &#39;-6&#39;, &#39;a&#39;)
++if r.stdout().strip().contains(&#39;::1&#39;)
++  message(&#39;IPv6 enabled&#39;)
++  ipv6_dst =3D [ &#39;::1&#39; ]
++  ipv6_switch =3D [ &#39;-6&#39; ]
++else
++  message(&#39;WARNING: IPv6 disabled&#39;)
++endif
++
++run_as_root =3D false
++r =3D run_command(&#39;id&#39;, &#39;-u&#39;)
++if r.stdout().strip().to_int() =3D=3D 0
++  message(&#39;running as root&#39;)
++  run_as_root =3D true
++else
++  message(&#39;running as normal user&#39;)
++endif
++
++foreach dst : [ &#39;localhost&#39;, &#39;127.0.0.1&#39; ] + ipv6_dst
++  foreach switch : [ &#39;&#39;, &#39;-4&#39; ] + ipv6_switch
++	args =3D [ &#39;-c1&#39;, dst ]
++	should_fail =3D false
++
++	if switch !=3D &#39;&#39;
++	  args =3D [switch] + args
++	  if (switch =3D=3D &#39;-4&#39; and dst =3D=3D &#39;::1&#39;) or (swit=
ch =3D=3D &#39;-6&#39; and dst =3D=3D &#39;127.0.0.1&#39;)
++	=09 should_fail =3D true
++	  endif
++	endif
++
++	name =3D &#39;ping &#39; + &#39; &#39;.join(args)
++	test(name, ping, args : args, should_fail : should_fail)
++  endforeach
++endforeach
++
++ping_tests_opt =3D [
++  [ &#39;-c1&#39; ],
++  [ &#39;-c5&#39;, &#39;-i0.1&#39; ],
++  [ &#39;-c1&#39;, &#39;-I&#39;, &#39;lo&#39; ],
++  [ &#39;-c1&#39;, &#39;-w1&#39; ],
++  [ &#39;-c1&#39;, &#39;-W1&#39; ],
++  [ &#39;-c1&#39;, &#39;-W1.1&#39; ],
++]
++foreach dst : [ &#39;127.0.0.1&#39; ] + ipv6_dst
++  foreach args : ping_tests_opt
++	args +=3D [ dst ]
++	name =3D &#39;ping &#39; + &#39; &#39;.join(args)
++	test(name, ping, args : args)
++  endforeach
++endforeach
++
++ping_tests_opt_fail =3D [
++  [ &#39;-c1.1&#39; ],
++  [ &#39;-I&#39;, &#39;nonexisting&#39; ],
++  [ &#39;-w0.1&#39; ],
++  [ &#39;-w0,1&#39; ],
++]
++foreach dst : [ &#39;127.0.0.1&#39; ] + ipv6_dst
++  foreach args : ping_tests_opt_fail
++	args +=3D [ dst ]
++	name =3D &#39;ping &#39; + &#39; &#39;.join(args)
++	test(name, ping, args : args, should_fail : true)
++  endforeach
++endforeach
++
++ping_tests_user_fail =3D [
++  [ &#39;-c1&#39;, &#39;-i0.001&#39; ], # -c1 required to quit ping when=
 running as root
++]
++foreach dst : [ &#39;127.0.0.1&#39; ] + ipv6_dst
++  foreach args : ping_tests_user_fail
++	args +=3D [ dst ]
++	name =3D &#39;ping &#39; + &#39; &#39;.join(args)
++	test(name, ping, args : args, should_fail : not run_as_root)
++  endforeach
++endforeach
diff --git a/meta/recipes-extended/iputils/<a href=3D"http://iputils_20210=
722.bb" target=3D"_blank">iputils_20210722.bb</a> b/meta/recipes-extended/i=
putils/<a href=3D"http://iputils_20210722.bb" target=3D"_blank">iputils_202=
10722.bb</a>
index c2a5bf44ea..2e4ff2e826 100644
--- a/meta/recipes-extended/iputils/<a href=3D"http://iputils_20210722.bb"=
 target=3D"_blank">iputils_20210722.bb</a>
+++ b/meta/recipes-extended/iputils/<a href=3D"http://iputils_20210722.bb"=
 target=3D"_blank">iputils_20210722.bb</a>
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM =3D <a>&quot;file://LICENSE;md5=3D55aa8=
c9fcad0691cef0ecd420361e390&quot;</a>
 DEPENDS =3D &quot;gnutls&quot;
=20
 SRC_URI =3D &quot;git://<a href=3D"http://github.com/iputils/iputils" tar=
get=3D"_blank">github.com/iputils/iputils</a> \
-           <a>file://0001-rarpd-rdisc-Drop-PrivateUsers.patch</a> \
-           &quot;
+    <a>file://0001-rarpd-rdisc-Drop-PrivateUsers.patch</a> \
+    <a>file://0001-meson-Make-tests-optional.patch</a> \
+&quot;
 SRCREV =3D &quot;71bb2a6c72e9f658e90ac618c73d873a76bbaa81&quot;
=20
 S =3D &quot;${WORKDIR}/git&quot;
@@ -38,7 +39,8 @@ PACKAGECONFIG[docs] =3D &quot;-DBUILD_HTML_MANS=3Dtrue -=
DBUILD_MANS=3Dtrue,-DBUILD_HTML_MAN
=20
 inherit meson systemd update-alternatives
=20
-EXTRA_OEMESON +=3D &quot;--prefix=3D${root_prefix}/&quot;
+# skip tests as they require ip to be installed on host
+EXTRA_OEMESON +=3D &quot;--prefix=3D${root_prefix}/ -DSKIP_TESTS=3Dtrue&q=
uot;
=20
 ALTERNATIVE_PRIORITY =3D &quot;100&quot;
=20
</pre>
      <br>
      <fieldset></fieldset>
      <br>
      <pre>

</pre>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div>

--000000000000d6597a05c8b83d8d--
