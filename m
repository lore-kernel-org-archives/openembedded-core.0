Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.36736.1614009508333327339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 07:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SHC11/k0;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: jatedev@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d11so3047082plo.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/RBbqj9BZb4RI47i2cvVZRb6wEs9k2lKvlpYLr9md1c=;
        b=SHC11/k0A4VPxI72SlV5/WnJMcdewFt3FIFAdZRhUOwozoT82wfOXX8dIIlGXrZ2b/
         ce/aW/F1e9Xi2g6dBh40U5vWjDflyhHzMIk66cWBCTw5XBk4lZKPJwkQc2zKbErhkLYX
         04xE13CWPeAm+1C9KrWznyHgx6CBtnqhiF9PKm+azRNZu8AeaexAX2RTIE9jOwN1jc+t
         BaEG9+pP1lJq/rG8e1Q92iQEOtTiHtZMylGLlUwnhwzyErWg2MGPmfU3iXQPum7Nb5Aw
         DJuLR/SLAZj6wSyoQQvQJy/4m5KNcObVscdZOh0zZtpIb30E90qutjI1bmp1PLoJ1M1R
         InIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/RBbqj9BZb4RI47i2cvVZRb6wEs9k2lKvlpYLr9md1c=;
        b=gd59W6H+2tLJp4h6FynqIiLWTk3S0GnusMzbp/n+3XqKpIdFcnqcoSpsmEQe5W1ye3
         he6itguQjPGmwGks+AfCqE49NY9+z9xuwe8s1S9KqScy2R7l+rtJNeSadwiOGKfsaz0W
         p9RsSWM8hcWBcMH0/1KCYzmAvL2gYiZZVJJjTbyTP/FZcs1rg/WA3HRBL20qzjcCr62l
         Ks6BtyO/jHf3mIXCH+8lAj/MiiBNU82ud+lFIxOG3l6Hj0VS34rR/XTrrXdjrq9zqej3
         LOA1REsEDbQNVDM3L1vmhZLd5GeWL8zJUohwtvOl2aH2K7z3LizZHhgyJJNU4AVyYqES
         4gtA==
X-Gm-Message-State: AOAM533sjU6aZlJCTuykWx4Wku9TUN8JobWpQF0Ths03UqEe45DKGIhb
	EpUYnQ9dPiES5vtdRRgo51kUoyJ3UhQTnbcu2N4=
X-Google-Smtp-Source: ABdhPJwVPsAkG73Kr4xGNOnyAaHQPkN6GKByhZnhfGCSPN4PgIAV0jaaDdfEpmQtSEMgqQpo7xFkk/8fg9LGA9pfB6k=
X-Received: by 2002:a17:90a:db8d:: with SMTP id h13mr17651060pjv.159.1614009507787;
 Mon, 22 Feb 2021 07:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20210219175307.46218-1-jatedev@gmail.com> <20210219175307.46218-2-jatedev@gmail.com>
 <CANPvuRkEwbKHMDf7EzD9r8PwDR-akj8JJtc6D3-youOiYiU4Wg@mail.gmail.com>
In-Reply-To: <CANPvuRkEwbKHMDf7EzD9r8PwDR-akj8JJtc6D3-youOiYiU4Wg@mail.gmail.com>
From: "Jate Sujjavanich" <jatedev@gmail.com>
Date: Mon, 22 Feb 2021 10:58:16 -0500
Message-ID: <CAPphmgayRkWXYqSmoCB-8LrTxfuSj+n+cVPX9F7HzpYe3QstCw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iputils: Fix setcap/setuid of executables
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000060387b05bbeedf3f"

--00000000000060387b05bbeedf3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If libcap is disabled in PACKAGECONFIG, then arguments two and three mean
find_program find could setcap on the build machine. This would mean it is
not strictly determined by the recipe and it's determined by the
configuration of the build machine instead.

find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false=
)

- Jate

On Sat, Feb 20, 2021 at 6:01 PM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

> Hi Jate,
>
> IMHO as I mention on the last version of this patch
> the file 0001-Limit-setcap-search-to-PATH-for-cross-builds.patch is not
> needed
> to make the iputils deterministic, the PACKAGECONFIG[libcap] changes on
> this [Patch 2/2] will do it.
>
> On [Patch 1/2] the option -DNO_SETCAP_OR_SUID=3Dtrue has been removed wit=
h
> the reverted change.
> This will make the meson to use the setuid when setcap and libcap not
> found and -DUSE_CAP=3Dfalse.
>
> Only with the addition of the libcap-native on the DEPENDS the meson will
> use the native setcap
> without host contamination.
>
> When the libcap package config is enabled (default option).
> The libcap-native will provide the setcap binary in the sysoot
> native STAGING_DIR_NATIVE so the meson
> will find the setcaps binary on the STAGING_DIR_NATIVE.
>
> The find_program('setcaps', ....) will return the full path of the native
> setcap and not the host setcap.
> Without the libcap-native the meson find_program('setcaps', ....) will
> fail to find the first argument
> because it not found on the PATH and will fallback to the next argument.
> The next argument have a full PATH so the find_program will find on the
> host in this case
> and this will cause the contamination.
>
> from the meson help:
>
>     program find_program(program_name1, program_name2, ...)
>
> program_name1 here is a string that can be an executable or script to be
> searched for in PATH or other places inside the project.
> (since 0.37.0) program_name2 and later positional arguments are used as
> fallback strings to search for.
> This is meant to be used for cases where the program may have many
> alternative names, such as foo and foo.py.
> The function will check for the arguments one by one and the first one
> that is found is returned.
>
> Jose
>
> Jate Sujjavanich <jatedev@gmail.com> escreveu no dia sexta, 19/02/2021
> =C3=A0(s) 17:53:
>
>> Limit setcap search to PATH for cross builds preventing host
>> contamination. Add DEPENDS for libcap-native to supply this for
>> PACKAGECONFIG libcap.
>>
>> The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of
>> /bin/ping and other executables.
>>
>> Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
>> ---
>>  ...tcap-search-to-PATH-for-cross-builds.patch | 33 +++++++++++++++++++
>>  .../iputils/iputils_s20200821.bb              |  3 +-
>>  2 files changed, 35 insertions(+), 1 deletion(-)
>>  create mode 100644
>> meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-f=
or-cross-builds.patch
>>
>> diff --git
>> a/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH=
-for-cross-builds.patch
>> b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH=
-for-cross-builds.patch
>> new file mode 100644
>> index 0000000000..b09cdb5f13
>> --- /dev/null
>> +++
>> b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH=
-for-cross-builds.patch
>> @@ -0,0 +1,33 @@
>> +From aedb7811d1e9b0eae5d33b5bed39f6219a06a8dc Mon Sep 17 00:00:00 2001
>> +From: Jate Sujjavanich <jatedev@gmail.com>
>> +Date: Thu, 18 Feb 2021 21:35:03 -0500
>> +Subject: [PATCH] Limit setcap search to PATH for cross builds
>> +
>> +Upstream-Status: Pending
>> +---
>> + meson.build | 9 ++++++++-
>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index aff75a2..16bbfb6 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -215,7 +215,14 @@ config_h =3D configure_file(
>> +       output : 'config.h',
>> +       configuration : conf)
>> +
>> +-setcap =3D find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap',
>> required : false)
>> ++if meson.is_cross_build()
>> ++      message('limit setcap search to PATH')
>> ++      path_setcap =3D ['setcap']
>> ++else
>> ++      message('search for setcap in PATH and admin dirs')
>> ++      path_setcap =3D ['setcap', '/usr/sbin/setcap', '/sbin/setcap']
>> ++endif
>> ++setcap =3D find_program(path_setcap, required : false)
>> + if cap_dep.found() and setcap.found()
>> +       perm_type =3D 'caps'
>> +       setcap_path =3D setcap.path()
>> +--
>> +2.30.0
>> +
>> diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb
>> b/meta/recipes-extended/iputils/iputils_s20200821.bb
>> index 8b63a23c61..31fe1acdaf 100644
>> --- a/meta/recipes-extended/iputils/iputils_s20200821.bb
>> +++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
>> @@ -12,6 +12,7 @@ DEPENDS =3D "gnutls"
>>
>>  SRC_URI =3D "git://github.com/iputils/iputils \
>>             file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
>> +
>>  file://0001-Limit-setcap-search-to-PATH-for-cross-builds.patch \
>>             "
>>  SRCREV =3D "23c3782ae0c7f9c6ae59dbed8ad9204f8758542b"
>>
>> @@ -26,7 +27,7 @@ CVE_CHECK_WHITELIST +=3D "CVE-2000-1213 CVE-2000-1214"
>>  PACKAGECONFIG ??=3D "libcap rarpd \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6',
>> 'ninfod traceroute6', '', d)} \
>>                     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
>> -PACKAGECONFIG[libcap] =3D "-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libcap"
>> +PACKAGECONFIG[libcap] =3D "-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libcap
>> libcap-native"
>>  PACKAGECONFIG[libidn] =3D "-DUSE_IDN=3Dtrue, -DUSE_IDN=3Dfalse, libidn2=
"
>>  PACKAGECONFIG[gettext] =3D "-DUSE_GETTEXT=3Dtrue, -DUSE_GETTEXT=3Dfalse=
,
>> gettext"
>>  PACKAGECONFIG[ninfod] =3D "-DBUILD_NINFOD=3Dtrue,-DBUILD_NINFOD=3Dfalse=
,"
>> --
>> 2.25.1
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>

--00000000000060387b05bbeedf3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If libcap is disabled in PACKAGECONFIG, then argument=
s two and three mean find_program find could setcap on the build machine. T=
his would mean it is not strictly determined by the recipe and it&#39;s det=
ermined by the configuration of the build machine instead.<br></div><div><b=
r></div><div>find_program(&#39;setcap&#39;, &#39;/usr/sbin/setcap&#39;, &#3=
9;/sbin/setcap&#39;, required : false)</div><div><br></div><div>- Jate<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sat, Feb 20, 2021 at 6:01 PM Jose Quaresma &lt;<a href=3D"mailto:qu=
aresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr">Hi Jate,</div><div><br></div>IMHO as I mention on the last version of =
this patch<div>the=C2=A0<span style=3D"color:rgb(0,0,0)">file 0001-Limit-se=
tcap-sear</span><span style=3D"color:rgb(0,0,0)">ch-to-PATH-for-cross-build=
s.</span><span style=3D"color:rgb(0,0,0)">patch is not needed</span><div><f=
ont color=3D"#000000">to make the iputils=C2=A0</font><span style=3D"color:=
rgb(0,0,0)">deterministic, the=C2=A0</span>PACKAGECONFIG[libcap]<span style=
=3D"color:rgb(0,0,0)">=C2=A0changes on this=C2=A0</span>[Patch 2/2]<span st=
yle=3D"color:rgb(0,0,0)">=C2=A0will do it.</span></div><div><font color=3D"=
#000000"><br></font></div><div><font color=3D"#000000">On [Patch 1/2] the o=
ption=C2=A0</font><span style=3D"color:rgb(0,0,0)">-DNO_SETCAP_OR_SUID=3Dtr=
ue has been removed with the reverted=C2=A0</span>change<span style=3D"colo=
r:rgb(0,0,0)">.</span></div><div><div><font color=3D"#000000">This will mak=
e the meson to use the=C2=A0</font>setuid when=C2=A0setcap and libcap not f=
ound and -DUSE_CAP=3Dfalse.</div><div><font color=3D"#000000"><br></font></=
div><div><font color=3D"#000000">Only with the addition of the=C2=A0</font>=
libcap-native on the=C2=A0<span style=3D"color:rgb(0,0,0)">DEPENDS the meso=
n will use the native setcap=C2=A0</span></div><div><span style=3D"color:rg=
b(0,0,0)">without host contamination.</span></div><div><span style=3D"color=
:rgb(0,0,0)"><br></span></div><div><font color=3D"#000000">W</font>hen the=
=C2=A0libcap package config is enabled (default option).</div><div class=3D=
"gmail_attr"></div><div>The libcap-native will provide the setcap binary in=
 the sysoot native=C2=A0STAGING_DIR_NATIVE so the meson<br></div><div><div =
class=3D"gmail_quote"><div class=3D"gmail_attr">will find the setcaps binar=
y on the=C2=A0STAGING_DIR_NATIVE.</div><div class=3D"gmail_attr"><br></div>=
<div class=3D"gmail_attr">The find_program(&#39;setcaps&#39;, ....) will re=
turn the full path of the native setcap  and not the host setcap.</div><div=
 class=3D"gmail_attr">Without the=C2=A0libcap-native the meson=C2=A0find_pr=
ogram(&#39;setcaps&#39;, ....) will fail to find the first argument</div><d=
iv class=3D"gmail_attr">because it not found on the PATH and will=C2=A0fall=
back to the next argument.</div><div class=3D"gmail_attr">The next argument=
 have a full PATH so the=C2=A0find_program will find on the host in this ca=
se</div><div class=3D"gmail_attr">and this will cause the contamination.</d=
iv><div class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">from the m=
eson help:</div><div class=3D"gmail_attr"><br></div><div class=3D"gmail_att=
r">=C2=A0 =C2=A0 program find_program(program_name1, program_name2, ...)<br=
></div><div class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">progra=
m_name1 here is a string that can be an executable or script to be searched=
 for in PATH or other places inside the project.<br></div><div class=3D"gma=
il_attr">(since 0.37.0) program_name2 and later positional arguments are us=
ed as fallback strings to search for.</div><div class=3D"gmail_attr">This i=
s meant to be used for cases where the program may have many alternative na=
mes, such as foo and foo.py.</div><div class=3D"gmail_attr">The function wi=
ll check for the arguments one by one and the first one that is found is re=
turned.<br></div><div class=3D"gmail_attr"><br></div><div class=3D"gmail_at=
tr">Jose</div><div class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D=
"gmail_attr">Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com" targ=
et=3D"_blank">jatedev@gmail.com</a>&gt; escreveu no dia sexta, 19/02/2021 =
=C3=A0(s) 17:53:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Limit setcap search to PATH for cross builds preventing host<br>
contamination. Add DEPENDS for libcap-native to supply this for<br>
PACKAGECONFIG libcap.<br>
<br>
The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of<br>
/bin/ping and other executables.<br>
<br>
Signed-off-by: Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com" ta=
rget=3D"_blank">jatedev@gmail.com</a>&gt;<br>
---<br>
=C2=A0...tcap-search-to-PATH-for-cross-builds.patch | 33 ++++++++++++++++++=
+<br>
=C2=A0.../iputils/<a href=3D"http://iputils_s20200821.bb" rel=3D"noreferrer=
" target=3D"_blank">iputils_s20200821.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
=C2=A02 files changed, 35 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/iputils/iputils/0001-Limit-s=
etcap-search-to-PATH-for-cross-builds.patch<br>
<br>
diff --git a/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search=
-to-PATH-for-cross-builds.patch b/meta/recipes-extended/iputils/iputils/000=
1-Limit-setcap-search-to-PATH-for-cross-builds.patch<br>
new file mode 100644<br>
index 0000000000..b09cdb5f13<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PAT=
H-for-cross-builds.patch<br>
@@ -0,0 +1,33 @@<br>
+From aedb7811d1e9b0eae5d33b5bed39f6219a06a8dc Mon Sep 17 00:00:00 2001<br>
+From: Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com" target=3D"=
_blank">jatedev@gmail.com</a>&gt;<br>
+Date: Thu, 18 Feb 2021 21:35:03 -0500<br>
+Subject: [PATCH] Limit setcap search to PATH for cross builds<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ meson.build | 9 ++++++++-<br>
+ 1 file changed, 8 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index aff75a2..16bbfb6 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -215,7 +215,14 @@ config_h =3D configure_file(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0output : &#39;config.h&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration : conf)<br>
+ <br>
+-setcap =3D find_program(&#39;setcap&#39;, &#39;/usr/sbin/setcap&#39;, &#3=
9;/sbin/setcap&#39;, required : false)<br>
++if meson.is_cross_build()<br>
++=C2=A0 =C2=A0 =C2=A0 message(&#39;limit setcap search to PATH&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 path_setcap =3D [&#39;setcap&#39;]<br>
++else<br>
++=C2=A0 =C2=A0 =C2=A0 message(&#39;search for setcap in PATH and admin dir=
s&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 path_setcap =3D [&#39;setcap&#39;, &#39;/usr/sbin/se=
tcap&#39;, &#39;/sbin/setcap&#39;]<br>
++endif<br>
++setcap =3D find_program(path_setcap, required : false)<br>
+ if cap_dep.found() and setcap.found()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0perm_type =3D &#39;caps&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0setcap_path =3D setcap.path()<br>
+-- <br>
+2.30.0<br>
+<br>
diff --git a/meta/recipes-extended/iputils/<a href=3D"http://iputils_s20200=
821.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a> b/met=
a/recipes-extended/iputils/<a href=3D"http://iputils_s20200821.bb" rel=3D"n=
oreferrer" target=3D"_blank">iputils_s20200821.bb</a><br>
index 8b63a23c61..31fe1acdaf 100644<br>
--- a/meta/recipes-extended/iputils/<a href=3D"http://iputils_s20200821.bb"=
 rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a><br>
+++ b/meta/recipes-extended/iputils/<a href=3D"http://iputils_s20200821.bb"=
 rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a><br>
@@ -12,6 +12,7 @@ DEPENDS =3D &quot;gnutls&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/iputils/iputils"=
 rel=3D"noreferrer" target=3D"_blank">github.com/iputils/iputils</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-rarpd-rdisc-Drop-Priv=
ateUsers.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Limit-setcap-search-t=
o-PATH-for-cross-builds.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;23c3782ae0c7f9c6ae59dbed8ad9204f8758542b&quot;<br>
<br>
@@ -26,7 +27,7 @@ CVE_CHECK_WHITELIST +=3D &quot;CVE-2000-1213 CVE-2000-121=
4&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;libcap rarpd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ipv6&#39;, &#39;ninfod trac=
eroute6&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, d)}&quot;<br>
-PACKAGECONFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libca=
p&quot;<br>
+PACKAGECONFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libca=
p libcap-native&quot;<br>
=C2=A0PACKAGECONFIG[libidn] =3D &quot;-DUSE_IDN=3Dtrue, -DUSE_IDN=3Dfalse, =
libidn2&quot;<br>
=C2=A0PACKAGECONFIG[gettext] =3D &quot;-DUSE_GETTEXT=3Dtrue, -DUSE_GETTEXT=
=3Dfalse, gettext&quot;<br>
=C2=A0PACKAGECONFIG[ninfod] =3D &quot;-DBUILD_NINFOD=3Dtrue,-DBUILD_NINFOD=
=3Dfalse,&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div></div></div></div>
</blockquote></div>

--00000000000060387b05bbeedf3f--
