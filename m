Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.16588.1605144207338292633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 17:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uber.com header.s=google header.b=zBnGFqRW;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: uber.com, ip: 209.85.208.43, mailfrom: gstroz@uber.com)
Received: by mail-ed1-f43.google.com with SMTP id k9so4354179edo.5
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 17:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=dXdWiB/WPH9NATdCNHIE5kr1yhG6KMkEPSaSGKEv8Nw=;
        b=zBnGFqRWzhb2Io6XjBevUf9U6+ImNQ6jnXK9/L36BGTKabfllWw7GQhVqBhDFMvQQL
         P5Hwh7xk1jk1A4jwdEqUFKbWL4pLaPyXP6MIAfNNrEcOqNNJz19oj3FHVhDzhYZGUOzL
         xJXsWRRF9QWGn/iOifzMttUFEc3vx+vWcpc6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dXdWiB/WPH9NATdCNHIE5kr1yhG6KMkEPSaSGKEv8Nw=;
        b=TD/F1IIDc8TRo6OhhmqLGOrkq0QkUOQz8gPb2bBnYXJ1p8fyOlgy4JFstnE+XlOnCs
         c9WcD8fvEINgCf4FQrMUl/llAfRC8+tTFDg9Sf9jWAwF974Nip3Q3/sECNHda+mQ/Dhq
         Q1UfQQmUfAtBHLQaPCwXzZNXVMjyOebUF9Fe0+KI2dyUNmp3KB4rE4kxdpj1li48S7pI
         gkKEgsz4ZfrEMrH0OR0EivlTHDYi5++7njh7oOngh/hHTTPej8waMCYWNCWlpGJYhpSh
         /WGgl1IycXUHvHGd8gtzJeJQyx6jLg7L4bmKO7lT9OKBX72jqy7smOIKgng0CIMJwdnW
         eGwQ==
X-Gm-Message-State: AOAM530Dc2UT70tnWbeSXLdnBTy2iXf1UXDGxh9jgzR6+rvkMwc3u25L
	/nHZRtlgNzygUxPaiZSgjZHKpEwT0Bja9S7QqvSuX4CFCZnv0g==
X-Google-Smtp-Source: ABdhPJwu+VpUf4D35XOUJcoNEbnOGvVlRRfLeg0Zwm6ZxslSD0pBcAuhh6f0B1w7fu7lV+KbwFhpsM6y8PYeC8p4LuI=
X-Received: by 2002:a05:6402:1c9b:: with SMTP id cy27mr2601435edb.161.1605144205019;
 Wed, 11 Nov 2020 17:23:25 -0800 (PST)
MIME-Version: 1.0
From: "Glenn Stroz" <gstroz@uber.com>
Date: Wed, 11 Nov 2020 20:23:14 -0500
Message-ID: <CAGvkhOK+dMYYW2NegYOYWOzNbHRczjJ7Wdb8bwFFxRXVrda+Vw@mail.gmail.com>
Subject: python3-native sysconfig failing to load in dunfell
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002800e305b3dec2b1"

--0000000000002800e305b3dec2b1
Content-Type: text/plain; charset="UTF-8"

Hi all,

We've been upgrading our work to Dunfell and have encountered an issue with
python3-native.

One of our python3-native scripts uses pydoc and that in turn eventually
pulls in python's sysconfig. However, this is failing to import with the
following stack trace:

```
    import pydoc
  File
"/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
line 366, in <module>
    class Doc:
  File
"/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
line 396, in Doc
    def getdocloc(self, object, basedir=sysconfig.get_path('stdlib')):
  File
"/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
line 519, in get_path
    return get_paths(scheme, vars, expand)[name]
  File
"/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
line 509, in get_paths
    return _expand_vars(scheme, vars)
  File
"/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
line 172, in _expand_vars
    _extend_dict(vars, get_config_vars())
  File
"/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
line 558, in get_config_vars
    _init_posix(_CONFIG_VARS)
  File
"/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
line 428, in _init_posix
    _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
ModuleNotFoundError: No module named '_sysconfigdata'
```

I did a little digging and the following commit seems to reference related
work:

https://github.com/openembedded/openembedded-core/commit/02714c105426b0d687620913c1a7401b386428b6

I see that there is a patch added which adds the following to
`sysconfig.py`:

```
  if 'STAGING_LIBDIR' in os.environ:

sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
```

However, STAGING_LIBDIR does not contain this path:

```
ls
/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata

ls: cannot access
'/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata':
No such file or directory
```

It appears as if this should really be pointing to STAGING_LIBDIR_NATIVE
which does exist:

```
ls
/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-sysconfigdata
_sysconfigdata.py
```

The referenced commit made efforts to combine the native and cross python3
bbclass files into one. However, I think this may be something that needs
to be treated differently.

Anyone have any thoughts on how to proceed?

-Glenn

--0000000000002800e305b3dec2b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>We&#39;ve been upgrading our wo=
rk to Dunfell and have encountered an issue with python3-native.=C2=A0</div=
><div><br></div><div>One of our python3-native scripts uses pydoc and that =
in turn eventually pulls in python&#39;s sysconfig. However, this is failin=
g to import with the following stack trace:</div><div><br></div><div>```</d=
iv><div>=C2=A0 =C2=A0 import pydoc<br>=C2=A0 File &quot;/home/gstroz/.cache=
/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/e=
bpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py&=
quot;, line 366, in &lt;module&gt;<br>=C2=A0 =C2=A0 class Doc:<br>=C2=A0 Fi=
le &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp=
/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native=
/usr/lib/python3.8/pydoc.py&quot;, line 396, in Doc<br>=C2=A0 =C2=A0 def ge=
tdocloc(self, object, basedir=3Dsysconfig.get_path(&#39;stdlib&#39;)):<br>=
=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/=
build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysro=
ot-native/usr/lib/python3.8/sysconfig.py&quot;, line 519, in get_path<br>=
=C2=A0 =C2=A0 return get_paths(scheme, vars, expand)[name]<br>=C2=A0 File &=
quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/wor=
k/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr=
/lib/python3.8/sysconfig.py&quot;, line 509, in get_paths<br>=C2=A0 =C2=A0 =
return _expand_vars(scheme, vars)<br>=C2=A0 File &quot;/home/gstroz/.cache/=
avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/eb=
pf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.=
py&quot;, line 172, in _expand_vars<br>=C2=A0 =C2=A0 _extend_dict(vars, get=
_config_vars())<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/=
avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282=
.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, line 558=
, in get_config_vars<br>=C2=A0 =C2=A0 _init_posix(_CONFIG_VARS)<br>=C2=A0 F=
ile &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tm=
p/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-nativ=
e/usr/lib/python3.8/sysconfig.py&quot;, line 428, in _init_posix<br>=C2=A0 =
=C2=A0 _temp =3D __import__(name, globals(), locals(), [&#39;build_time_var=
s&#39;], 0)<br>ModuleNotFoundError: No module named &#39;_sysconfigdata&#39=
;<br></div><div>```</div><div><br></div><div>I did a little digging and the=
 following commit seems to reference related work:</div><div><br></div><div=
><a href=3D"https://github.com/openembedded/openembedded-core/commit/02714c=
105426b0d687620913c1a7401b386428b6">https://github.com/openembedded/openemb=
edded-core/commit/02714c105426b0d687620913c1a7401b386428b6</a></div><div><b=
r></div><div>I see that there is a patch added which adds the following to =
`sysconfig.py`:</div><div><br></div><div>```</div><div>=C2=A0 if &#39;STAGI=
NG_LIBDIR&#39; in os.environ:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.path.appen=
d(os.environ[&#39;STAGING_LIBDIR&#39;]+&#39;/python-sysconfigdata&#39;)<br>=
</div><div>```</div><div><br></div><div>However, STAGING_LIBDIR does not co=
ntain this path:</div><div><br></div><div>```</div><div>ls /home/gstroz/.ca=
che/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linu=
x/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata <b=
r>ls: cannot access &#39;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-d=
unfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recip=
e-sysroot/usr/lib/python-sysconfigdata&#39;: No such file or directory<br><=
/div><div>```</div><div><br></div><div>It appears as if this should really =
be pointing to=C2=A0STAGING_LIBDIR_NATIVE which does exist:</div><div><br><=
/div><div>```<br></div><div>ls /home/gstroz/.cache/avos/_avos_gstroz/avos/y=
octo-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0=
/recipe-sysroot-native/usr/lib/python-sysconfigdata</div>_sysconfigdata.py<=
br><div>```</div><div><br></div><div>The referenced commit made efforts to =
combine the native and cross python3 bbclass files into one. However, I thi=
nk this may be something that needs to be treated differently.</div><div><b=
r></div><div>Anyone have any thoughts on how to proceed?=C2=A0</div><div><b=
r clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr">-Glenn</div></div></div></div></di=
v>

--0000000000002800e305b3dec2b1--
