Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505E0C54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 18:56:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.5159.1710269756523211704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 11:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=vv/TC1Fx;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.50, mailfrom: troth@openavr.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-413e61525c2so2078235e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 11:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1710269755; x=1710874555; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/q3fOsHdE8xY6ifiiDmWOKl8AOvNxQWZhn84Hr36lZQ=;
        b=vv/TC1Fxu9VclVYKZGUf+pfVmQ5CF7qvi9JIhWx4Qv/r2zDKJwTdBgwQzl5KkK9epg
         l1ePNavXY8FX+9Tivaoh+7NXcg323BMzEdDZLBsDHtCOxa/r38TkueVRhbXGIHWBP/aD
         qQ1WUpMFcP6sI0qo/PYMlkIraM7HGcurnblZIZOrwspYFkkmWFJQIMVI09xJOJ7FPP7x
         vEH17787mdAcJBJWjRLeBWN8Qaqx8moVRDIgZCgv71NPZR7IPOX2p30OdnVxTR799wwX
         AtoT64R7E+35GwqPrJp0gUfhGjLMZpjjq8G+0nAmxCtBD7BKTiXrazwkRAPgZL1StzrT
         CpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710269755; x=1710874555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/q3fOsHdE8xY6ifiiDmWOKl8AOvNxQWZhn84Hr36lZQ=;
        b=TFxivHbQpMd278qPq0t5AMz7rLRKNMO9m4QVBOjDT8icL5V1rp2W1RrEPDbuoQYdJF
         VkmRd+28qYtmkkLzAwxp2XTddGxhjtzpEaunhZmq9r7ZWuIpvR3klJ5kJJLUeMGxU3E6
         FdBfvl5PhcGZ7G1gRE/E7v+8h5Qv7kanUYlFsFa+AtcYJTbg7ZItJ/nKqkXMvHb5mZ68
         xlSdKGl50aET6UJEFyCJ8TqV5kXrxDDdHQEptHK+k3JtQHEte3MR5gScrDS0LvDtujo+
         jKBcCnwZ+q9I566P6t9JQvLCtgHn3mXQVRK6u8riY9aKX2kOXUfJoZ0JA5FT41XkgEQJ
         SCbg==
X-Gm-Message-State: AOJu0YyPPODV/eQGhkZ/aSa8Ag0NwqV52/8lIqlgdI1BmY6Fy3qaVVBJ
	br+/PNycglbvoNJBe+sViRvkNcL2WfhEyMayIf5LotG9o0GJJZYDZpeaiNP3KfYbDtN3NbSMekr
	eti3xQYmJvFSjYLja/S+2Hdzn9jIgbAG+YXy1zQ==
X-Google-Smtp-Source: AGHT+IGlADeSR8Jielff9tR7DS6rv5eRU0yX8StFNn8dFaxKg8pURXIrjch5ML01uPiG6ZN0AP9/JuMKBEKAzSsgxnA=
X-Received: by 2002:a05:6000:1b05:b0:33e:d17:76b with SMTP id
 f5-20020a0560001b0500b0033e0d17076bmr241679wrz.7.1710269754615; Tue, 12 Mar
 2024 11:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240306154151.3741709-1-alex@linutronix.de> <20240306154151.3741709-35-alex@linutronix.de>
In-Reply-To: <20240306154151.3741709-35-alex@linutronix.de>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Tue, 12 Mar 2024 12:55:43 -0600
Message-ID: <CAFMvBt0onfsJ3BtzcEn87P4G3g+LQbrg2=f9eEexE80VO2TFPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 35/47] python3-jsonschema: upgrade 4.17.3 ->
 4.21.1 and add new dependencies
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000031c64d06137b35e9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 18:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197001

--00000000000031c64d06137b35e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 8:42=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |  3 +
>  ...on3-jsonschema-specifications_2023.12.1.bb | 18 +++++
>  ...4.17.3.bb =3D> python3-jsonschema_4.21.1.bb} |  4 +-
>  .../python/python3-referencing_0.33.0.bb      | 14 ++++
>  .../python/python3-rpds-py-crates.inc         | 80 +++++++++++++++++++
>  .../python/python3-rpds-py_0.18.0.bb          | 17 ++++
>  6 files changed, 135 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/
python3-jsonschema-specifications_2023.12.1.bb
>  rename meta/recipes-devtools/python/{python3-jsonschema_4.17.3.bb =3D>
python3-jsonschema_4.21.1.bb} (88%)
>  create mode 100644 meta/recipes-devtools/python/
python3-referencing_0.33.0.bb
>  create mode 100644
meta/recipes-devtools/python/python3-rpds-py-crates.inc
>  create mode 100644 meta/recipes-devtools/python/python3-rpds-py_0.18.0.b=
b
>

Hi,

Since this was merged to poky master our application which uses jsonschema
dies with a stack
trace indicating a failure to import rpds.

After a bit of investigation, I found that it looks like yocto is
installing the rust library
module into the site-packages on the device as '
rpds.cpython-312-armv7l-linux-gnueabihf.so' and the
python interpreter is looking for 'rpds.cpython-312-arm-linux-gnueabihf.so'=
.

When I rename the .so file to what the python interpreter is looking for,
things work and I can
import rpds successfully.

It seems like something is going wrong with maturin building the wheel for
the armv7l target, but
unfortunately my skills with rust and maturin are lacking, so I can't
figure out how to fix this.

We are building our images using HEAD of master/main for all of our meta
layers, so this landed
in our builds a few days ago.

Simple way to tickle the error on a device:

#######################################################################

root@mp1010:~# find /usr/lib/python3.12/site-packages/ -name '*.so'
/usr/lib/python3.12/site-packages/_
cffi_backend.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/cryptography/hazmat/bindings/_
rust.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/markupsafe/_
speedups.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/pkcs11/_
pkcs11.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/
pvectorc.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/pycurl.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/rpds/
rpds.cpython-312-armv7l-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/rpds/
rpds.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/sdbus/
sd_bus_internals.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/simplejson/_
speedups.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/spidev.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/tornado/speedups.abi3.so
/usr/lib/python3.12/site-packages/yaml/_
yaml.cpython-312-arm-linux-gnueabihf.so
/usr/lib/python3.12/site-packages/zenoh/zenoh.abi3.so

root@mp1010:~# python3
Python 3.12.2 (main, Feb  6 2024, 20:19:44) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import rpds
>>>

root@mp1010:~# cd /lib/python3.12/site-packages/rpds

root@mp1010:/lib/python3.12/site-packages/rpds# ls -1
__init__.py
__init__.pyi
__pycache__/
py.typed
rpds.cpython-312-arm-linux-gnueabihf.so*
rpds.cpython-312-armv7l-linux-gnueabihf.so*
root@mp1010:/lib/python3.12/site-packages/rpds# rm
rpds.cpython-312-arm-linux-gnueabihf.so
rm: remove regular file 'rpds.cpython-312-arm-linux-gnueabihf.so'? y

root@mp1010:/lib/python3.12/site-packages/rpds# python3
Python 3.12.2 (main, Feb  6 2024, 20:19:44) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import rpds
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.12/site-packages/rpds/__init__.py", line 1, in
<module>
    from .rpds import *
ModuleNotFoundError: No module named 'rpds.rpds'
>>>

#######################################################################

Target processor is a TI AM57xx.

Any help or things to try would be appreciated. More than happy to provide
more information if needed.

--00000000000031c64d06137b35e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:monospace">On Wed, Mar 6, 2024 =
at 8:42=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gma=
il.com">alex.kanavin@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt; Signed-off-by=
: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de">alex@linutron=
ix.de</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/conf/distro/include/maintainer=
s.inc =C2=A0 =C2=A0 =C2=A0| =C2=A03 +<br>&gt; =C2=A0...<a href=3D"http://on=
3-jsonschema-specifications_2023.12.1.bb">on3-jsonschema-specifications_202=
3.12.1.bb</a> | 18 +++++<br>&gt; =C2=A0...<a href=3D"http://4.17.3.bb">4.17=
.3.bb</a> =3D&gt; <a href=3D"http://python3-jsonschema_4.21.1.bb">python3-j=
sonschema_4.21.1.bb</a>} | =C2=A04 +-<br>&gt; =C2=A0.../python/<a href=3D"h=
ttp://python3-referencing_0.33.0.bb">python3-referencing_0.33.0.bb</a> =C2=
=A0 =C2=A0 =C2=A0| 14 ++++<br>&gt; =C2=A0.../python/python3-rpds-py-crates.=
inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 80 +++++++++++++++++++<br>&gt; =C2=A0.../=
python/<a href=3D"http://python3-rpds-py_0.18.0.bb">python3-rpds-py_0.18.0.=
bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ++++<br>&gt; =C2=A06 files ch=
anged, 135 insertions(+), 1 deletion(-)<br>&gt; =C2=A0create mode 100644 me=
ta/recipes-devtools/python/<a href=3D"http://python3-jsonschema-specificati=
ons_2023.12.1.bb">python3-jsonschema-specifications_2023.12.1.bb</a><br>&gt=
; =C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-json=
schema_4.17.3.bb">python3-jsonschema_4.17.3.bb</a> =3D&gt; <a href=3D"http:=
//python3-jsonschema_4.21.1.bb">python3-jsonschema_4.21.1.bb</a>} (88%)<br>=
&gt; =C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-referencing_0.33.0.bb">python3-referencing_0.33.0.bb</a><br>&gt; =
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-rpds-py-crate=
s.inc<br>&gt; =C2=A0create mode 100644 meta/recipes-devtools/python/<a href=
=3D"http://python3-rpds-py_0.18.0.bb">python3-rpds-py_0.18.0.bb</a><br>&gt;=
<br><br>Hi,<br><br></span><div><span style=3D"font-family:monospace">Since =
this was merged to poky master our application which uses jsonschema dies w=
ith a stack</span></div><div><span style=3D"font-family:monospace">trace in=
dicating a failure to import rpds.</span></div><div><span style=3D"font-fam=
ily:monospace"><br></span></div><div><span style=3D"font-family:monospace">=
After a bit of investigation, I found that it <span>looks like yocto is ins=
talling the rust library</span></span></div><div><span style=3D"font-family=
:monospace"><span>module into the site-packages on the device as &#39;<span=
><a href=3D"http://rpds.cpython-312-armv7l-linux-gnueabihf.so">rpds.cpython=
-312-armv7l-linux-gnueabihf.so</a>&#39;</span> and the</span></span></div><=
div><span style=3D"font-family:monospace"><span>python interpreter is looki=
ng for <span>&#39;<a href=3D"http://rpds.cpython-312-arm-linux-gnueabihf.so=
">rpds.cpython-312-arm-linux-gnueabihf.so</a></span>&#39;.</span></span></d=
iv><div><span style=3D"font-family:monospace"></span></div><span style=3D"f=
ont-family:monospace"><span><br></span></span><div><span style=3D"font-fami=
ly:monospace"><span>When I rename the <span>.so</span> file to what the pyt=
hon interpreter is looking for, things work and I can</span></span></div><d=
iv><span style=3D"font-family:monospace"><span>import rpds successfully.</s=
pan></span></div><div><span style=3D"font-family:monospace"><span><br></spa=
n></span></div><div><span style=3D"font-family:monospace"><span>It seems li=
ke something is going wrong with maturin building the wheel for the armv7l =
target, but</span></span></div><div><span style=3D"font-family:monospace"><=
span>unfortunately my skills with rust and maturin are lacking, so I can&#3=
9;t figure out how to fix this.</span></span></div><div><span style=3D"font=
-family:monospace"><span><br></span></span></div><div><span style=3D"font-f=
amily:monospace"><span>We are building our images using HEAD of master/main=
 for all of our meta layers, so this landed</span></span></div><div><span s=
tyle=3D"font-family:monospace"><span>in our builds a few days ago.</span></=
span></div><div><span style=3D"font-family:monospace"><span><br></span></sp=
an></div><div><span style=3D"font-family:monospace"><span>Simple way to tic=
kle the error on a device:<br></span></span></div><div><br><span style=3D"f=
ont-family:monospace"><span></span></span></div><div><span style=3D"font-fa=
mily:monospace">###########################################################=
############<br></span></div><div><span style=3D"font-family:monospace"><br=
></span></div><div><span style=3D"font-family:monospace">root@mp1010:~# fin=
d /usr/lib/python3.12/site-packages/ -name &#39;*.so&#39;<br>/usr/lib/pytho=
n3.12/site-packages/_<a href=3D"http://cffi_backend.cpython-312-arm-linux-g=
nueabihf.so">cffi_backend.cpython-312-arm-linux-gnueabihf.so</a><br>/usr/li=
b/python3.12/site-packages/cryptography/hazmat/bindings/_<a href=3D"http://=
rust.cpython-312-arm-linux-gnueabihf.so">rust.cpython-312-arm-linux-gnueabi=
hf.so</a><br>/usr/lib/python3.12/site-packages/markupsafe/_<a href=3D"http:=
//speedups.cpython-312-arm-linux-gnueabihf.so">speedups.cpython-312-arm-lin=
ux-gnueabihf.so</a><br>/usr/lib/python3.12/site-packages/pkcs11/_<a href=3D=
"http://pkcs11.cpython-312-arm-linux-gnueabihf.so">pkcs11.cpython-312-arm-l=
inux-gnueabihf.so</a><br>/usr/lib/python3.12/site-packages/<a href=3D"http:=
//pvectorc.cpython-312-arm-linux-gnueabihf.so">pvectorc.cpython-312-arm-lin=
ux-gnueabihf.so</a><br>/usr/lib/python3.12/site-packages/<a href=3D"http://=
pycurl.cpython-312-arm-linux-gnueabihf.so">pycurl.cpython-312-arm-linux-gnu=
eabihf.so</a><br>/usr/lib/python3.12/site-packages/rpds/<a href=3D"http://r=
pds.cpython-312-armv7l-linux-gnueabihf.so">rpds.cpython-312-armv7l-linux-gn=
ueabihf.so</a><br>/usr/lib/python3.12/site-packages/rpds/<a href=3D"http://=
rpds.cpython-312-arm-linux-gnueabihf.so">rpds.cpython-312-arm-linux-gnueabi=
hf.so</a><br>/usr/lib/python3.12/site-packages/sdbus/<a href=3D"http://sd_b=
us_internals.cpython-312-arm-linux-gnueabihf.so">sd_bus_internals.cpython-3=
12-arm-linux-gnueabihf.so</a><br>/usr/lib/python3.12/site-packages/simplejs=
on/_<a href=3D"http://speedups.cpython-312-arm-linux-gnueabihf.so">speedups=
.cpython-312-arm-linux-gnueabihf.so</a><br>/usr/lib/python3.12/site-package=
s/<a href=3D"http://spidev.cpython-312-arm-linux-gnueabihf.so">spidev.cpyth=
on-312-arm-linux-gnueabihf.so</a><br>/usr/lib/python3.12/site-packages/torn=
ado/<a href=3D"http://speedups.abi3.so">speedups.abi3.so</a><br>/usr/lib/py=
thon3.12/site-packages/yaml/_<a href=3D"http://yaml.cpython-312-arm-linux-g=
nueabihf.so">yaml.cpython-312-arm-linux-gnueabihf.so</a><br>/usr/lib/python=
3.12/site-packages/zenoh/<a href=3D"http://zenoh.abi3.so">zenoh.abi3.so</a>=
<br></span></div><div><span style=3D"font-family:monospace"><br></span></di=
v><div><span style=3D"font-family:monospace">root@mp1010:~# python3<br>Pyth=
on 3.12.2 (main, Feb =C2=A06 2024, 20:19:44) [GCC 13.2.0] on linux<br>Type =
&quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;licen=
se&quot; for more information.<br>&gt;&gt;&gt; import rpds<br>&gt;&gt;&gt; =
<br></span></div><div><span style=3D"font-family:monospace"><br></span></di=
v><div><span style=3D"font-family:monospace">root@mp1010:~# cd /lib/python3=
.12/site-packages/rpds<br></span></div><div><span style=3D"font-family:mono=
space"><br></span></div><div><span style=3D"font-family:monospace">root@mp1=
010:/lib/python3.12/site-packages/rpds# ls -1<br>__init__.py</span></div><d=
iv><span style=3D"font-family:monospace">__init__.pyi</span></div><div><spa=
n style=3D"font-family:monospace">__pycache__/</span></div><div><span style=
=3D"font-family:monospace">py.typed</span></div><div><span style=3D"font-fa=
mily:monospace"><a href=3D"http://rpds.cpython-312-arm-linux-gnueabihf.so">=
rpds.cpython-312-arm-linux-gnueabihf.so</a>*</span></div><div><span style=
=3D"font-family:monospace"><a href=3D"http://rpds.cpython-312-armv7l-linux-=
gnueabihf.so">rpds.cpython-312-armv7l-linux-gnueabihf.so</a>*<br>root@mp101=
0:/lib/python3.12/site-packages/rpds# rm <a href=3D"http://rpds.cpython-312=
-arm-linux-gnueabihf.so">rpds.cpython-312-arm-linux-gnueabihf.so</a><br>rm:=
 remove regular file &#39;<a href=3D"http://rpds.cpython-312-arm-linux-gnue=
abihf.so">rpds.cpython-312-arm-linux-gnueabihf.so</a>&#39;? y<br></span></d=
iv><div><span style=3D"font-family:monospace"><br></span></div><div><span s=
tyle=3D"font-family:monospace">root@mp1010:/lib/python3.12/site-packages/rp=
ds# python3<br>Python 3.12.2 (main, Feb =C2=A06 2024, 20:19:44) [GCC 13.2.0=
] on linux<br>Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&q=
uot; or &quot;license&quot; for more information.<br>&gt;&gt;&gt; import rp=
ds<br>Traceback (most recent call last):<br>=C2=A0 File &quot;&lt;stdin&gt;=
&quot;, line 1, in &lt;module&gt;<br>=C2=A0 File &quot;/usr/lib/python3.12/=
site-packages/rpds/__init__.py&quot;, line 1, in &lt;module&gt;<br>=C2=A0 =
=C2=A0 from .rpds import *<br>ModuleNotFoundError: No module named &#39;rpd=
s.rpds&#39;<br>&gt;&gt;&gt;</span></div><div><span style=3D"font-family:mon=
ospace"><br></span></div><div><span style=3D"font-family:monospace">#######=
################################################################</span></di=
v><div><span style=3D"font-family:monospace"><br></span></div><div><span st=
yle=3D"font-family:monospace">Target processor is a TI AM57xx.<br></span></=
div><div><span style=3D"font-family:monospace"><br></span></div><div><span =
style=3D"font-family:monospace"><span>Any help or things to try would be ap=
preciated. More than happy to provide more information if needed.<br></span=
></span></div><div><span style=3D"font-family:monospace"><span></span></spa=
n></div></div>

--00000000000031c64d06137b35e9--

