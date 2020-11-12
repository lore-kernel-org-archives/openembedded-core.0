Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web09.3429.1605184151927013795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 04:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dUPVTnuU;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id l5so5918977edq.11
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 04:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nMz5k+hzmujC6Q2jr7U3yBm29T+gW5RBo28TH6S11Go=;
        b=dUPVTnuUlBPws4+vYlQid2tfebnpGzunPWq4cJ98hD1A5dSJAVr5QgaMR8ZY8RJJPv
         PGlEkQZFfVFitjGoAX1akC+mbGBtsVAeetnEDLhpCu5KEyST+OxJTWEJgU4o5oV+FI9K
         WkM9enh0JbqhVBGzcDxs8J3VQViu9lfCQVuStSZ6x7B7r9EEoT/xnnHDTYOG9eGs1eTl
         nbRn0A0g1suU81ys2Hm5+6yTjX77yZcQzYiJsWfiukik+xxhby8JACpETVfAv3bPkhwv
         2UqCWIRkU5igeemG8d5vhM5NQoItM/dS1R2ZsLxj+2dCgCJAp0Wl47MG8TPutoR/doRv
         pe4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nMz5k+hzmujC6Q2jr7U3yBm29T+gW5RBo28TH6S11Go=;
        b=BlEH6wl6gQf8UQXWr78K0sdAQPONwB8GjYqlPZcjr8j4W2tmIMy+plVwdLPRByjH+v
         7NIx7kbAsQh7khFefTXV9DiHKUSPb7BWNt7yUooB2+LL4fMdRMaX68QcxASo+O6unW+c
         Cgasvg2hrRaO3ox6m/YmcLiPXFzXhPYuzm1HXKnDPTF2pZwn5oKMmykvGkduI6cbe7Xh
         k/sqRckv9DWVZwBCM18OIsE4orm2nXzELLMiBtqsEgxZycUPMxMgivaN09igVSxzeN9V
         dA+b/L7aXw5UPiZ0DRR8cvEjWkp4zTo0h9k3iCA3Elq8+W72GS4o5s9NcIP/1pHy6gT8
         da9Q==
X-Gm-Message-State: AOAM5301ZJ4eK39m+G41X89LpP1Qg1xETJub5Xgp2RaJd36ysLxc17Cf
	lLGmlVEiU9AwXR0ovAANat+JXZXts2rshOIjcrA=
X-Google-Smtp-Source: ABdhPJw+c1GfN6flsCURcbEtiMLiRRqCutbxj6SLbZY4q/AQ6siIfbX3Xnz2kCW3C8eW7153HugtpUP2NSAzKlALDmE=
X-Received: by 2002:a05:6402:12c1:: with SMTP id k1mr4895061edx.76.1605184150362;
 Thu, 12 Nov 2020 04:29:10 -0800 (PST)
MIME-Version: 1.0
References: <76c7c436-29d1-1687-1889-72e883697a75@berginkonsult.se>
 <29322.1605179238305301621@lists.openembedded.org> <CANNYZj_d6uefKzNP1YQ=zGNuG2z0xRs=37Zv1vz3XFvL4i3KPA@mail.gmail.com>
In-Reply-To: <CANNYZj_d6uefKzNP1YQ=zGNuG2z0xRs=37Zv1vz3XFvL4i3KPA@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2020 13:28:59 +0100
Message-ID: <CA+chaQce6Z58inM+y_FWtpMkbiVXHgjZaoZC6nNGi5AqxLQnjw@mail.gmail.com>
Subject: Re: [OE-core] devtool modify - ModuleNotFoundError: No module named '_sysconfigdata'
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ernst.sjostrand@lists.verisure.com, Peter Bergin <peter@berginkonsult.se>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000014dca705b3e80f2f"

--00000000000014dca705b3e80f2f
Content-Type: text/plain; charset="UTF-8"

Breaking host python in ubuntu 18.04-20.10 like this is very easy, just
exporting _PYTHON_SYSCONFIGDATA_NAME like OE tasks do is enough.

I can reproduce it e.g. with command_not_found_handle in ubuntu:

$ export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
$ command_not_found_handle foo
Failed to import the site module
Traceback (most recent call last):
  File "/usr/lib/python3.6/site.py", line 570, in <module>
    main()
  File "/usr/lib/python3.6/site.py", line 556, in main
    known_paths = addusersitepackages(known_paths)
  File "/usr/lib/python3.6/site.py", line 288, in addusersitepackages
    user_site = getusersitepackages()
  File "/usr/lib/python3.6/site.py", line 264, in getusersitepackages
    user_base = getuserbase() # this will also set USER_BASE
  File "/usr/lib/python3.6/site.py", line 254, in getuserbase
    USER_BASE = get_config_var('userbase')
  File "/usr/lib/python3.6/sysconfig.py", line 607, in get_config_var
    return get_config_vars().get(name)
  File "/usr/lib/python3.6/sysconfig.py", line 550, in get_config_vars
    _init_posix(_CONFIG_VARS)
  File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
    _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
ModuleNotFoundError: No module named '_sysconfigdata'

$ unset _PYTHON_SYSCONFIGDATA_NAME
$ command_not_found_handle foo

Command 'foo' not found, did you mean:

  command 'fox' from deb objcryst-fox
  command 'fio' from deb fio
  command 'goo' from deb goo
  command 'fop' from deb fop
  command 'fog' from deb ruby-fog
  command 'woo' from deb python-woo
  command 'fgo' from deb fgo

Try: sudo apt install <deb name>

So whenever _PYTHON_SYSCONFIGDATA_NAME is exported you need to ensure that
you're exclusively using python from python3native any call from this
environment to host python (other than  python3 --version: Python 3.6.9).
With 20.04 it's usually more common to see, because default python on host
will be most likely python3 not python2 which doesn't have this issue.

On Thu, Nov 12, 2020 at 12:38 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> If you can provide exact steps to reproduce (the recipe is not available
> in oe-core), I can take a look. It's been reported plenty of times, but
> always with something not in core and not easily available.
>
> Alex
>
> On Thu, 12 Nov 2020 at 12:07, <ernst.sjostrand@lists.verisure.com> wrote:
>
>> Here are two other threads on the same topic. I've also run into this.
>>
>> https://lists.yoctoproject.org/g/yocto/topic/74637733#51189
>>
>> and
>>
>>
>> https://lists.yoctoproject.org/g/yocto/message/50856?p=,,,20,0,0,0::Created,,devtool,20,2,0,77178360
>>
>> Regards
>> //Ernst
>>
>>
>>
> 
>
>

--00000000000014dca705b3e80f2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Breaking host python in ubuntu 18.04-20.10 like this is ve=
ry easy, just exporting=C2=A0_PYTHON_SYSCONFIGDATA_NAME like OE tasks do is=
 enough.<div><br></div><div>I can reproduce it e.g. with=C2=A0command_not_f=
ound_handle in ubuntu:</div><div><br></div><div>$ export _PYTHON_SYSCONFIGD=
ATA_NAME=3D&quot;_sysconfigdata&quot;<br>$ command_not_found_handle foo<br>=
Failed to import the site module<br>Traceback (most recent call last):<br>=
=C2=A0 File &quot;/usr/lib/python3.6/site.py&quot;, line 570, in &lt;modul=
e&gt;<br>=C2=A0 =C2=A0 main()<br>=C2=A0 File &quot;/usr/lib/python3.6/site.=
py&quot;, line 556, in main<br>=C2=A0 =C2=A0 known_paths =3D addusersitepac=
kages(known_paths)<br>=C2=A0 File &quot;/usr/lib/python3.6/site.py&quot;, l=
ine 288, in addusersitepackages<br>=C2=A0 =C2=A0 user_site =3D getusersitep=
ackages()<br>=C2=A0 File &quot;/usr/lib/python3.6/site.py&quot;, line 264, =
in getusersitepackages<br>=C2=A0 =C2=A0 user_base =3D getuserbase() # this =
will also set USER_BASE<br>=C2=A0 File &quot;/usr/lib/python3.6/site.py&quo=
t;, line 254, in getuserbase<br>=C2=A0 =C2=A0 USER_BASE =3D get_config_var(=
&#39;userbase&#39;)<br>=C2=A0 File &quot;/usr/lib/python3.6/sysconfig.py&qu=
ot;, line 607, in get_config_var<br>=C2=A0 =C2=A0 return get_config_vars().=
get(name)<br>=C2=A0 File &quot;/usr/lib/python3.6/sysconfig.py&quot;, line =
550, in get_config_vars<br>=C2=A0 =C2=A0 _init_posix(_CONFIG_VARS)<br>=C2=
=A0 File &quot;/usr/lib/python3.6/sysconfig.py&quot;, line 421, in _init_p=
osix<br>=C2=A0 =C2=A0 _temp =3D __import__(name, globals(), locals(), [&#39=
;build_time_vars&#39;], 0)<br>ModuleNotFoundError: No module named &#39;_sy=
sconfigdata&#39;<br></div><div><br></div><div>$ unset _PYTHON_SYSCONFIGDATA=
_NAME<br>$ command_not_found_handle foo<br><br>Command &#39;foo&#39; not fo=
und, did you mean:<br><br>=C2=A0 command &#39;fox&#39; from deb objcryst-fo=
x<br>=C2=A0 command &#39;fio&#39; from deb fio<br>=C2=A0 command &#39;goo&#=
39; from deb goo<br>=C2=A0 command &#39;fop&#39; from deb fop<br>=C2=A0 com=
mand &#39;fog&#39; from deb ruby-fog<br>=C2=A0 command &#39;woo&#39; from d=
eb python-woo<br>=C2=A0 command &#39;fgo&#39; from deb fgo<br><br>Try: sudo=
 apt install &lt;deb name&gt;<br></div><div><br></div><div>So whenever=C2=
=A0_PYTHON_SYSCONFIGDATA_NAME is exported you need to ensure that you&#39;=
re exclusively using python from python3native any call from this environme=
nt to host python (other than=C2=A0=C2=A0python3 --version:=C2=A0Python 3.6=
.9). With 20.04 it&#39;s usually more common to see, because default python=
 on host will be most likely python3 not python2 which doesn&#39;t have thi=
s issue.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 12, 2020 at 12:38 PM Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div>If you can provide exact steps to reproduce (the recipe is not avai=
lable in oe-core), I can take a look. It&#39;s been reported plenty of time=
s, but always with something not in core and not easily available.</div><di=
v><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, 12 Nov 2020 at 12:07, &lt;<a href=3D=
"mailto:ernst.sjostrand@lists.verisure.com" target=3D"_blank">ernst.sjostra=
nd@lists.verisure.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Here are two other threads on the same topic. I&#39;ve=
 also run into this.<br>=C2=A0<br><a href=3D"https://lists.yoctoproject.org=
/g/yocto/topic/74637733#51189" target=3D"_blank">https://lists.yoctoproject=
.org/g/yocto/topic/74637733#51189</a> <br>=C2=A0<br>and <br>=C2=A0<br><a hr=
ef=3D"https://lists.yoctoproject.org/g/yocto/message/50856?p=3D,,,20,0,0,0:=
:Created,,devtool,20,2,0,77178360" target=3D"_blank">https://lists.yoctopro=
ject.org/g/yocto/message/50856?p=3D,,,20,0,0,0::Created,,devtool,20,2,0,771=
78360</a> <br>=C2=A0<br>Regards <br>//Ernst
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>

--00000000000014dca705b3e80f2f--
