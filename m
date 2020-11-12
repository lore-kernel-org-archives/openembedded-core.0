Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.2133.1605174738653913715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 01:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JW9k9BIP;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id v16so1673118uat.9
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 01:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BZrqBu0+gGi4iZy5lufyafP+HSGwWSlYTKjhoIkoQo0=;
        b=JW9k9BIP/1AkPsNCKQAs7wMlaa+jJ4GsixeItksQTW5O0oH8c9Y5JNNo5741U4e4Pb
         OjhJ+VacGi8nX0WGlRQrq1DpS66rHA8qoXkgfDdgAlVqz3Vi8RoWxMh6mu8wdYiQz+wb
         oIrayz9SAV5bHaecXy8mtWIWu3khxYTawmMUpMzCMVWDeeTeORMBqygzMV9xSgHZnOju
         jhaUO7l8TPcOjOKlAEzECcfXjV3AtGnPQFHS8p9lpl9Eo4jpUZhG5FCgtu3e1nrzt5Fz
         xf3+Bu8CUDpS5tLdpVQSQbpsqYvnP8PlXvGHzOKo02BWW8gUwQoI0CwMddH4jh8CrQ/2
         SwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BZrqBu0+gGi4iZy5lufyafP+HSGwWSlYTKjhoIkoQo0=;
        b=ioi5gx5WKgJ0IitSADEvFAOpzvCzIEfDykwE+2f30/gVdJsK/P3NHhYRcHjUHeWW/k
         MoLeUBx2IxqOcMbnlYnG/Fb3mpu9dIYkxFd68zoTmnUKhP5O/YzTZTfxtXdRcmHh6Q6t
         4dm3VQclC0aVoKpZV5t54gV2xHFlgIlFzb3R+SMUxhHLc1cCCVNyL+GwEaRpOcGZ3IXU
         C8/SDB6RPuI4o9cApKud2oeSmvDN5imBbZ7ruCT0xi2d7+xwNGxG4fww65yoEV1vYswv
         Jp9df+jlCOu3hmR87bXYO+bVakXtareWtTyiDoGo099N/7MYoxG1bY2EBfBZOt2m7B9F
         +L8A==
X-Gm-Message-State: AOAM530FaGkrRkHKtgiLxTa4rBFC0gkfUVsTTozSdDbJSf9XItcQNQGX
	AvMqDapKBQtdkaN1rHJFQxMirvdY0k7MSc64xnvRSd0Zz9w=
X-Google-Smtp-Source: ABdhPJzbn12xOVzVFwQShT5pKywXVFKizalklItxdsKEKE8uHp/F9ZdKB0oWi3uElDTnxpM5QN79V4Wtvbhge7ORWJs=
X-Received: by 2002:ab0:7103:: with SMTP id x3mr11203844uan.100.1605174737819;
 Thu, 12 Nov 2020 01:52:17 -0800 (PST)
MIME-Version: 1.0
References: <CAGvkhOK+dMYYW2NegYOYWOzNbHRczjJ7Wdb8bwFFxRXVrda+Vw@mail.gmail.com>
 <CANNYZj9JdPhyyTyj9rwRKHNpKdAaK6QiwnbE5_a1AuXyE1zk0w@mail.gmail.com>
In-Reply-To: <CANNYZj9JdPhyyTyj9rwRKHNpKdAaK6QiwnbE5_a1AuXyE1zk0w@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2020 10:52:06 +0100
Message-ID: <CANNYZj-v01JoQuXWg5-erikr3zBzVHwy00nRk2YLWGtX8w6ONw@mail.gmail.com>
Subject: Re: [OE-core] python3-native sysconfig failing to load in dunfell
To: gstroz@uber.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000cdaed05b3e5dec1"

--0000000000000cdaed05b3e5dec1
Content-Type: text/plain; charset="UTF-8"

A quick fix may be to add a target python3 dependency to your recipe, yes
ugly, but I can't figure out how to provide target python configuration to
native python used in the context of building target recipes otherwise.

Alex


On Thu, 12 Nov 2020 at 10:49, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 12 Nov 2020 at 02:23, Glenn Stroz via lists.openembedded.org
> <gstroz=uber.com@lists.openembedded.org> wrote:
>
>> We've been upgrading our work to Dunfell and have encountered an issue
>> with python3-native.
>>
>> One of our python3-native scripts uses pydoc and that in turn eventually
>> pulls in python's sysconfig. However, this is failing to import with the
>> following stack trace:
>>
>> ```
>>     import pydoc
>>   File
>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
>> line 366, in <module>
>>     class Doc:
>>   File
>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/pydoc.py",
>> line 396, in Doc
>>     def getdocloc(self, object, basedir=sysconfig.get_path('stdlib')):
>>   File
>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>> line 519, in get_path
>>     return get_paths(scheme, vars, expand)[name]
>>   File
>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>> line 509, in get_paths
>>     return _expand_vars(scheme, vars)
>>   File
>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>> line 172, in _expand_vars
>>     _extend_dict(vars, get_config_vars())
>>   File
>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>> line 558, in get_config_vars
>>     _init_posix(_CONFIG_VARS)
>>   File
>> "/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py",
>> line 428, in _init_posix
>>     _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
>> ModuleNotFoundError: No module named '_sysconfigdata'
>> ```
>>
>> I did a little digging and the following commit seems to reference
>> related work:
>>
>>
>> https://github.com/openembedded/openembedded-core/commit/02714c105426b0d687620913c1a7401b386428b6
>>
>> I see that there is a patch added which adds the following to
>> `sysconfig.py`:
>>
>> ```
>>   if 'STAGING_LIBDIR' in os.environ:
>>
>> sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
>> ```
>>
>> However, STAGING_LIBDIR does not contain this path:
>>
>> ```
>> ls
>> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata
>>
>> ls: cannot access
>> '/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata':
>> No such file or directory
>> ```
>>
>> It appears as if this should really be pointing to STAGING_LIBDIR_NATIVE
>> which does exist:
>>
>> ```
>> ls
>> /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-sysconfigdata
>> _sysconfigdata.py
>> ```
>>
>> The referenced commit made efforts to combine the native and cross
>> python3 bbclass files into one. However, I think this may be something that
>> needs to be treated differently.
>>
>> Anyone have any thoughts on how to proceed?
>>
>
> Can you share the exact context where this is happening? Is your script
> coming from a recipe and can you show that recipe?
>
> Alex
>
>

--0000000000000cdaed05b3e5dec1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>A quick fix may be to add a target python3 dependency=
 to your recipe, yes ugly, but I can&#39;t figure out how to provide target=
 python configuration to native python used in the context of building targ=
et recipes otherwise.</div><div><br></div><div>Alex<br></div><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12=
 Nov 2020 at 10:49, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, =
12 Nov 2020 at 02:23, Glenn Stroz via <a href=3D"http://lists.openembedded.=
org" target=3D"_blank">lists.openembedded.org</a> &lt;gstroz=3D<a href=3D"m=
ailto:uber.com@lists.openembedded.org" target=3D"_blank">uber.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">We&#39;ve been upg=
rading our work to Dunfell and have encountered an issue with python3-nativ=
e.=C2=A0<div><br></div><div>One of our python3-native scripts uses pydoc an=
d that in turn eventually pulls in python&#39;s sysconfig. However, this is=
 failing to import with the following stack trace:</div><div><br></div><div=
>```</div><div>=C2=A0 =C2=A0 import pydoc<br>=C2=A0 File &quot;/home/gstroz=
/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-=
linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/py=
doc.py&quot;, line 366, in &lt;module&gt;<br>=C2=A0 =C2=A0 class Doc:<br>=
=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/=
build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysro=
ot-native/usr/lib/python3.8/pydoc.py&quot;, line 396, in Doc<br>=C2=A0 =C2=
=A0 def getdocloc(self, object, basedir=3Dsysconfig.get_path(&#39;stdlib&#3=
9;)):<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto=
-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/rec=
ipe-sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, line 519, in get_p=
ath<br>=C2=A0 =C2=A0 return get_paths(scheme, vars, expand)[name]<br>=C2=A0=
 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/=
tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-nat=
ive/usr/lib/python3.8/sysconfig.py&quot;, line 509, in get_paths<br>=C2=A0 =
=C2=A0 return _expand_vars(scheme, vars)<br>=C2=A0 File &quot;/home/gstroz/=
.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-l=
inux/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sys=
config.py&quot;, line 172, in _expand_vars<br>=C2=A0 =C2=A0 _extend_dict(va=
rs, get_config_vars())<br>=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_=
gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2=
020.282.17-r0/recipe-sysroot-native/usr/lib/python3.8/sysconfig.py&quot;, l=
ine 558, in get_config_vars<br>=C2=A0 =C2=A0 _init_posix(_CONFIG_VARS)<br>=
=C2=A0 File &quot;/home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/=
build/tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysro=
ot-native/usr/lib/python3.8/sysconfig.py&quot;, line 428, in _init_posix<br=
>=C2=A0 =C2=A0 _temp =3D __import__(name, globals(), locals(), [&#39;build_=
time_vars&#39;], 0)<br>ModuleNotFoundError: No module named &#39;_sysconfig=
data&#39;<br></div><div>```</div><div><br></div><div>I did a little digging=
 and the following commit seems to reference related work:</div><div><br></=
div><div><a href=3D"https://github.com/openembedded/openembedded-core/commi=
t/02714c105426b0d687620913c1a7401b386428b6" target=3D"_blank">https://githu=
b.com/openembedded/openembedded-core/commit/02714c105426b0d687620913c1a7401=
b386428b6</a></div><div><br></div><div>I see that there is a patch added wh=
ich adds the following to `sysconfig.py`:</div><div><br></div><div>```</div=
><div>=C2=A0 if &#39;STAGING_LIBDIR&#39; in os.environ:<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sys.path.append(os.environ[&#39;STAGING_LIBDIR&#39;]+&#39;/py=
thon-sysconfigdata&#39;)<br></div><div>```</div><div><br></div><div>However=
, STAGING_LIBDIR does not contain this path:</div><div><br></div><div>```</=
div><div>ls /home/gstroz/.cache/avos/_avos_gstroz/avos/yocto-dunfell/build/=
tmp/work/corei7-64-poky-linux/ebpf-daemon/2020.282.17-r0/recipe-sysroot/usr=
/lib/python-sysconfigdata <br>ls: cannot access &#39;/home/gstroz/.cache/av=
os/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linux/ebpf=
-daemon/2020.282.17-r0/recipe-sysroot/usr/lib/python-sysconfigdata&#39;: No=
 such file or directory<br></div><div>```</div><div><br></div><div>It appea=
rs as if this should really be pointing to=C2=A0STAGING_LIBDIR_NATIVE which=
 does exist:</div><div><br></div><div>```<br></div><div>ls /home/gstroz/.ca=
che/avos/_avos_gstroz/avos/yocto-dunfell/build/tmp/work/corei7-64-poky-linu=
x/ebpf-daemon/2020.282.17-r0/recipe-sysroot-native/usr/lib/python-sysconfig=
data</div>_sysconfigdata.py<br><div>```</div><div><br></div><div>The refere=
nced commit made efforts to combine the native and cross python3 bbclass fi=
les into one. However, I think this may be something that needs to be treat=
ed differently.</div><div><br></div><div>Anyone have any thoughts on how to=
 proceed?=C2=A0</div></div></blockquote><div><br></div><div>Can you share t=
he exact context where this is happening? Is your script coming from a reci=
pe and can you show that recipe?</div><div><br></div><div>Alex<br></div><di=
v>=C2=A0</div></div></div>
</blockquote></div>

--0000000000000cdaed05b3e5dec1--
