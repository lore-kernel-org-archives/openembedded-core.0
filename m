Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.523.1614718524532200670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 12:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nS8lSgmF;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: geoffhp@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id e7so33527876lft.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 12:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=njB+R8OGt/Z1UqiB0dnCHsZWdsiAKfyQ+7lolGoXfX4=;
        b=nS8lSgmF0Gt2vf28Xtsb10ggx6/b3Hywr3zApIeSGMOWpmzvmG/kOu6iMceS8ipLpn
         e52BAjfrQ4uh3PlmHqy820uQxpvFpgi+5Jzh9mWdWF4CxaWRTd78Va/qx85K3TT4DIDr
         G1D12YxkxjLBhizw1kpa6Yf91DH2/pmGDp/d0Z6mHf55/ollP3djfxZK+0xRVFF3kFRL
         XyydHsSKidTOQy08jeEY3x/jVgRFqt5kvDbB7buTkHS9VjMkqozm25dMbsJyb53BYOVu
         CImGnvyiXFlhl0HvnYLFkNi7mNFCkYklJQfJDRrRcQhKymsmOkU4g8iuB8mdezbNCD8w
         r4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=njB+R8OGt/Z1UqiB0dnCHsZWdsiAKfyQ+7lolGoXfX4=;
        b=GZLnQh9MrBM/S5q6FxRJzqTl2GJ9CtPbMvlCNuGjFcbWisC9cTCU9gHGt+xgtqUT8s
         r1e28uglNX0YXqu0Ip0lFPGTHsRIIX1bfmWAvPyjegzGyamSghBAW0+KXAH+yRI1nZRl
         X88aNBCYFghBCuNkIpAqHa7qX28xx4uqp6MwWrUZl9T+hJerH6mxbcsgaSnIGk+y6icj
         OYxJmwnlAPYKlINcvYtlIkW9Hzbh0RMbBn7/yree4WhFVABznZg/KlTW2kTI0GQJN/vh
         i6NbydCtd7X4AhOdBdmnHPzgOaQF9i0pE4zUL2zrczwgF0Q0t4y2c1aejzA/qRF0aNmC
         jniQ==
X-Gm-Message-State: AOAM530MiFc6wKEYJ2ftAkuolz+fRSKifoIS0Mfdc1ZBbTLxstKWQtEF
	S0T7Bi1SBZN+BTIMv04uyThHoGLZ5+Vk4M0LpGc=
X-Google-Smtp-Source: ABdhPJwhvNe5lGJshjytuZqNG8d+1ZDXZzwxGthxKmXHXGyGSHnFgrYb6N0Zk61ZwpNelLjoDlqn+qpSHs49iER53WA=
X-Received: by 2002:a05:6512:3092:: with SMTP id z18mr12816396lfd.249.1614718521651;
 Tue, 02 Mar 2021 12:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20210225174516.639740-1-Martin.Jansa@gmail.com>
 <CA+_AqitMGVbVikHDF2bnimSsXSmM0tfeXBCgYjgeSpFYL2FGOA@mail.gmail.com>
 <CA+chaQevEWE=RaqQzXfGOaQVCSw1Jf814EQF+-Cdx4X46xO1Fg@mail.gmail.com> <CA+_Aqiu_CEOXFCeixDjPU4Wd0qrDS4DRoTGuFb4ccH-qJV0g=Q@mail.gmail.com>
In-Reply-To: <CA+_Aqiu_CEOXFCeixDjPU4Wd0qrDS4DRoTGuFb4ccH-qJV0g=Q@mail.gmail.com>
From: "Geoff Parker" <geoffhp@gmail.com>
Date: Tue, 2 Mar 2021 12:55:10 -0800
Message-ID: <CAHNuFGJD1Cf1osfqokUtQ+J6Zfuq0VMBxSUfx2nUAb8Jbwz+Cw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: replace THISDIR instead of COREBASE in find_meson_cross_files --cross-file paths
To: Anibal Limon <anibal.limon@linaro.org>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e5370f05bc93f364"

--000000000000e5370f05bc93f364
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

The normpath change worked for me also:
-    thisdir = d.getVar("THISDIR")
+    thisdir = os.path.normpath(d.getVar("THISDIR"))

Another work-around was to replace the relative paths in our bblayers.conf
file which looked like:

    ${TOPDIR}/../meta-openembedded/meta-oe \
    ...

With
  YOCTOROOT = "${@os.path.abspath(os.path.join(d.getVar('TOPDIR'),
os.pardir))}"

   ${YOCTOROOT}/meta-poky \
   ...

So it looks like the root cause is related to having our layers and build
dir under the poky directory and relative paths in the bblayers.conf file
(this should be supported, no?).
I plan to change that at some point, but this layout evolved from previous
generations of this project.


On Tue, Mar 2, 2021 at 11:01 AM Anibal Limon <anibal.limon@linaro.org>
wrote:

>
>
> On Tue, 2 Mar 2021 at 11:32, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> what's the value of COREBASE in that build? Wasn't full path already in
>> your sstate signatures - in that case this change didn't break your builds,
>> just highlighted an issue in your builds which was already there.
>>
>> Our COREBASE is,
>
>   COREBASE="/home/builds/oe-rpb-master/layers/openembedded-core"
>
> Expands as follows,
>
> ...
> # $COREBASE [3 operations]
> #   set
> /home/builds/oe-rpb-master/build-845c/conf/../../layers/openembedded-core/meta/conf/layer.conf:20
> #     "${@os.path.normpath("${LAYERDIR}/../")}"
> #   set data_smart.py:931 [expandVarref]
> #
> "${@os.path.normpath("/home/builds/oe-rpb-master/build-845c/conf/../../layers/openembedded-core/meta/../")}"
> #   set
> /home/builds/oe-rpb-master/build-845c/conf/../../layers/openembedded-core/meta/conf/documentation.conf:124
> #     [doc] "Specifies the parent directory of the OpenEmbedded Core
> Metadata layer (i.e. meta)."
> # pre-expansion value:
> #
> "${@os.path.normpath("/home/builds/oe-rpb-master/build-845c/conf/../../layers/openembedded-core/meta/../")}"
> COREBASE="/home/builds/oe-rpb-master/layers/openembedded-core"
> ...
>
>
>> We can fix that by calling os.path.normpath on THISDIR, but I would like
>> to know the reason why THISDIR is set this way for you (also to reproduce
>> it locally to verify the fix).
>>
>
> I tried it and fixes the issue,
>
> -    thisdir = d.getVar("THISDIR")
> +    thisdir = os.path.normpath(d.getVar("THISDIR"))
>
> We use the next config files for bblayers and local.conf,
>
> https://github.com/96boards/oe-rpb-manifest/tree/qcom/master/conf
>
> Regards,
> Anibal
>
>
>>
>>
>>
>> On Tue, Mar 2, 2021 at 6:14 PM Anibal Limon <anibal.limon@linaro.org>
>> wrote:
>>
>>> This breaks our builds,
>>>
>>> ...
>>> ERROR: Cannot add
>>> '/home/builds/oe-rpb-master/layers/openembedded-core/meta/recipes-core/glib-2.0/files/meson.cross.d/common'
>>> to --cross-file, because it's not relative to THISDIR
>>> '/home/builds/oe-rpb-master/build-410c-2/conf/../../layers/openembedded-core/meta/recipes-core/glib-2.0'
>>> and sstate signature would contain this full path
>>> ...
>>>
>>> In,
>>>
>>>
>>> https://ci.linaro.org/job/lt-qcom-openembedded-rpb-master/DISTRO=rpb,MACHINE=dragonboard-410c,label=docker-buster-amd64/470/console
>>>
>>> Regards,
>>> Anibal
>>>
>>> On Thu, 25 Feb 2021 at 11:45, Martin Jansa <Martin.Jansa@gmail.com>
>>> wrote:
>>>
>>>> * COREBASE works correctly only as long as this recipe is inside of
>>>>   COREBASE directory and leaves the full absolute paths if you copy
>>>>   this recipe into your own layer (e.g. to backport newer version)
>>>>
>>>> * use THISDIR as all FILESPATH should be relative to that, unless
>>>>   there is a .bbappend not only extending FILESPATH, but also adding
>>>>   meson.cross.d files there (at which point it also didn't work with
>>>>   COREBASE replacements as well already) - show an ERROR in such case,
>>>>   I don't think it's common scenario to spend more time to support that.
>>>>
>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>> ---
>>>>  meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 8 ++++++--
>>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>>> b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>>> index 15e9dbaf6f..882a89da7a 100644
>>>> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>>> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
>>>> @@ -31,7 +31,7 @@ def find_meson_cross_files(d):
>>>>      if bb.data.inherits_class('native', d):
>>>>          return ""
>>>>
>>>> -    corebase = d.getVar("COREBASE")
>>>> +    thisdir = d.getVar("THISDIR")
>>>>      import collections
>>>>      sitedata = siteinfo_data(d)
>>>>      # filename -> found
>>>> @@ -39,7 +39,11 @@ def find_meson_cross_files(d):
>>>>      for path in d.getVar("FILESPATH").split(":"):
>>>>          for element in sitedata:
>>>>              filename = os.path.normpath(os.path.join(path,
>>>> "meson.cross.d", element))
>>>> -            files[filename.replace(corebase, "${COREBASE}")] =
>>>> os.path.exists(filename)
>>>> +            sanitized_path = filename.replace(thisdir, "${THISDIR}")
>>>> +            if sanitized_path == filename:
>>>> +                bb.error("Cannot add '%s' to --cross-file, because
>>>> it's not relative to THISDIR '%s' and sstate signature would contain this
>>>> full path" % (filename, thisdir))
>>>> +                continue
>>>> +            files[filename.replace(thisdir, "${THISDIR}")] =
>>>> os.path.exists(filename)
>>>>
>>>>      items = ["--cross-file=" + k for k,v in files.items() if v]
>>>>      d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
>>>> --
>>>> 2.27.0
>>>>
>>>>
>>>>
>>>>
>>>>
> 
>
>

--000000000000e5370f05bc93f364
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Martin,</div><div><br></div><div>=
The=C2=A0normpath change worked for me also:</div><div>- =C2=A0 =C2=A0thisd=
ir =3D d.getVar(&quot;THISDIR&quot;)<br>+ =C2=A0 =C2=A0thisdir =3D os.path.=
normpath(d.getVar(&quot;THISDIR&quot;))<br></div><div><br>Another work-arou=
nd was to replace the relative paths in our bblayers.conf file which looked=
 like:<br><br>=C2=A0 =C2=A0 ${TOPDIR}/../meta-openembedded/meta-oe \<br>=C2=
=
=A0 =C2=A0 ...<br><br>With</div>=C2=A0 YOCTOROOT =3D &quot;${@os.path.absp=
ath(os.path.join(d.getVar(&#39;TOPDIR&#39;), os.pardir))}&quot;<br><br></di=
v>=C2=A0 =C2=A0${YOCTOROOT}/meta-poky \<br>=C2=A0 =C2=A0...<br><div dir=3D"=
ltr"><br></div><div>So it looks like the root cause is related to having ou=
r layers and build dir under the poky directory and relative paths in the b=
blayers.conf file (this should be supported, no?).</div><div>I plan to chan=
ge that at some point, but this layout evolved from previous generations of=
 this project.</div><div dir=3D"ltr"><br><br></div><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 11:01 AM An=
ibal Limon &lt;<a href=3D"mailto:anibal.limon@linaro.org">anibal.limon@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 2 Mar 2021 at 11:32, Ma=
rtin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">=
martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr">what&#39;s the value of COREBASE in =
that build? Wasn&#39;t full path already in your sstate signatures - in tha=
t case this change didn&#39;t break your builds, just highlighted an issue =
in your builds which was already there.<div><br></div></div></blockquote><d=
iv>Our COREBASE is,</div><div><br></div><div>=C2=A0 COREBASE=3D&quot;/home/=
builds/oe-rpb-master/layers/openembedded-core&quot;=C2=A0</div><div><br></d=
iv><div>Expands as follows,</div><div><br></div><div>...</div><div># $COREB=
ASE [3 operations]<br># =C2=A0 set /home/builds/oe-rpb-master/build-845c/co=
nf/../../layers/openembedded-core/meta/conf/layer.conf:20<br># =C2=A0 =C2=
=A0 &quot;${@os.path.normpath(&quot;${LAYERDIR}/../&quot;)}&quot;<br># =C2=
=
=A0 set data_smart.py:931 [expandVarref]<br># =C2=A0 =C2=A0 &quot;${@os.pa=
th.normpath(&quot;/home/builds/oe-rpb-master/build-845c/conf/../../layers/o=
penembedded-core/meta/../&quot;)}&quot;<br># =C2=A0 set /home/builds/oe-rpb=
-master/build-845c/conf/../../layers/openembedded-core/meta/conf/documentat=
ion.conf:124<br># =C2=A0 =C2=A0 [doc] &quot;Specifies the parent directory =
of the OpenEmbedded Core Metadata layer (i.e. meta).&quot;<br># pre-expansi=
on value:<br># =C2=A0 &quot;${@os.path.normpath(&quot;/home/builds/oe-rpb-m=
aster/build-845c/conf/../../layers/openembedded-core/meta/../&quot;)}&quot;=
<br>COREBASE=3D&quot;/home/builds/oe-rpb-master/layers/openembedded-core&qu=
ot;<br></div><div>...</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div></div><div>We can fix that by call=
ing=C2=A0os.path.normpath on THISDIR, but I would like to know the reason w=
hy THISDIR is set this way for you (also to reproduce it locally to verify =
the fix).</div></div></blockquote><div><br></div><div>I tried it and fixes =
the issue,</div><div><br></div><div>- =C2=A0 =C2=A0thisdir =3D d.getVar(&qu=
ot;THISDIR&quot;)<br>+ =C2=A0 =C2=A0thisdir =3D os.path.normpath(d.getVar(&=
quot;THISDIR&quot;))<br></div><div><br></div><div>We use the next config fi=
les for bblayers and local.conf,</div><div><br></div><div><a href=3D"https:=
//github.com/96boards/oe-rpb-manifest/tree/qcom/master/conf" target=3D"_bla=
nk">https://github.com/96boards/oe-rpb-manifest/tree/qcom/master/conf</a><b=
r></div><div><br></div><div>Regards,</div><div>Anibal</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br>=
</div><div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 6:14 PM Anibal L=
imon &lt;<a href=3D"mailto:anibal.limon@linaro.org" target=3D"_blank">aniba=
l.limon@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr">This breaks our builds,<div><br></div><d=
iv>...</div><div>ERROR: Cannot add &#39;/home/builds/oe-rpb-master/layers/o=
penembedded-core/meta/recipes-core/glib-2.0/files/meson.cross.d/common&#39;=
 to --cross-file, because it&#39;s not relative to THISDIR &#39;/home/build=
s/oe-rpb-master/build-410c-2/conf/../../layers/openembedded-core/meta/recip=
es-core/glib-2.0&#39; and sstate signature would contain this full path<br>=
</div><div>...</div><div><br></div><div>In,</div><div><br></div><div><a hre=
f=3D"https://ci.linaro.org/job/lt-qcom-openembedded-rpb-master/DISTRO=3Drpb=
,MACHINE=3Ddragonboard-410c,label=3Ddocker-buster-amd64/470/console" target=
=
=3D"_blank">https://ci.linaro.org/job/lt-qcom-openembedded-rpb-master/DIST=
RO=3Drpb,MACHINE=3Ddragonboard-410c,label=3Ddocker-buster-amd64/470/console=
</a><br></div><div><br></div><div>Regards,</div><div>Anibal</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 25=
 Feb 2021 at 11:45, Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">* COREBASE works correctly only=
 as long as this recipe is inside of<br>
=C2=A0 COREBASE directory and leaves the full absolute paths if you copy<b=
r>
=C2=A0 this recipe into your own layer (e.g. to backport newer version)<br=
>
<br>
* use THISDIR as all FILESPATH should be relative to that, unless<br>
=C2=A0 there is a .bbappend not only extending FILESPATH, but also adding<=
br>
=C2=A0 meson.cross.d files there (at which point it also didn&#39;t work w=
ith<br>
=C2=A0 COREBASE replacements as well already) - show an ERROR in such case=
,<br>
=C2=A0 I don&#39;t think it&#39;s common scenario to spend more time to su=
pport that.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a> | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.=
bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a> b/meta/reci=
pes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=3D"noreferrer" =
target=3D"_blank">glib-2.0_2.66.7.bb</a><br>
index 15e9dbaf6f..882a89da7a 100644<br>
--- a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a><br>
+++ b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.66.7.bb" rel=
=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.66.7.bb</a><br>
@@ -31,7 +31,7 @@ def find_meson_cross_files(d):<br>
=C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#39;native&#39;, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 corebase =3D d.getVar(&quot;COREBASE&quot;)<br>
+=C2=A0 =C2=A0 thisdir =3D d.getVar(&quot;THISDIR&quot;)<br>
=C2=A0 =C2=A0 =C2=A0import collections<br>
=C2=A0 =C2=A0 =C2=A0sitedata =3D siteinfo_data(d)<br>
=C2=A0 =C2=A0 =C2=A0# filename -&gt; found<br>
@@ -39,7 +39,11 @@ def find_meson_cross_files(d):<br>
=C2=A0 =C2=A0 =C2=A0for path in d.getVar(&quot;FILESPATH&quot;).split(&quo=
t;:&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for element in sitedata:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename =3D os.path.normp=
ath(os.path.join(path, &quot;meson.cross.d&quot;, element))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files[filename.replace(corebase=
, &quot;${COREBASE}&quot;)] =3D os.path.exists(filename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sanitized_path =3D filename.rep=
lace(thisdir, &quot;${THISDIR}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sanitized_path =3D=3D filena=
me:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;Ca=
nnot add &#39;%s&#39; to --cross-file, because it&#39;s not relative to THI=
SDIR &#39;%s&#39; and sstate signature would contain this full path&quot; %=
 (filename, thisdir))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files[filename.replace(thisdir,=
 &quot;${THISDIR}&quot;)] =3D os.path.exists(filename)<br>
<br>
=C2=A0 =C2=A0 =C2=A0items =3D [&quot;--cross-file=3D&quot; + k for k,v in =
files.items() if v]<br>
=C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;EXTRA_OEMESON&quot;, &quot; &quot; +=
 &quot; &quot;.join(items))<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>
</blockquote></div></div>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000e5370f05bc93f364--
