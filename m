Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70338E67482
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 17:33:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64519.1766338419058278563
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 09:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GAPwSlNM;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso32356305e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 09:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766338417; x=1766943217; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0i4Jjt07ragBn5I05Oqxw/UMq0fo7teBwgbmSVC53iE=;
        b=GAPwSlNMGnxhbhnAHt8A58gyU9SBStF2RWCL/0DZbYKW7vlxFaWUqJMOtAB5+UYtqi
         KklSyqcsZDIoxghAs791/Jljwwgqd8OUvCboPmjj+pKLyjao8LngZ6+QDdAsB4Jpqgqm
         lspeR7kjn2/spj20XU6l9m+XlnECG7UZYzuCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766338417; x=1766943217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0i4Jjt07ragBn5I05Oqxw/UMq0fo7teBwgbmSVC53iE=;
        b=a/FSflxmrExkr2Fyr3HDEBdpKnJ2nuaSc0nDLU+8ns+tboUVS06dB1abOJ6gaHCwbT
         HA6le5tNODUHzpEVgmVrBoGndBNw/lz0gHcLFzQXGH1QWkHXTiVvo4HfrymlYz6ADlqE
         aB8b0MFLMz0OCtTygnCiGPWV0BrOV2ON1h19+Lsi8YWydn0rWY+x6ny/vYvn8tP6TEgc
         YkurPcwAlR6qvlafn7LkMsqXvqattix27auMxAuyOcUqd03h9BZa0tPv1VHrIc5L9aZw
         y+kuIkaKE41HYtg80HfAqtk/t30XWsFOtlj8dMmVGOeZX9/ej7BDhMUpzRfsvsJHkkw4
         sKNw==
X-Forwarded-Encrypted: i=1; AJvYcCWLvKUHKrOnFShes/Dtt0k1GzVDdScNVg7Acq0TVOjm2fvG3NtsJyMY1Fn/13eMTEe1PRgPrU6N7wwassF4JNJ2BA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YysNUG17E1mmxSJQU5vd3xZCV58VsWYcIghLQitxSZQ9FmWacOO
	COfz281DbNelk8A19fNvby6fqqpQe4sPl+rmE2df9TIz4rYNz5TAzhDOjY5dRUMLMOy+aLvLYuV
	p5AUPZshrRRLElVG7A19/gupFPrZsTfylmkJoIf06ug==
X-Gm-Gg: AY/fxX5ptmk7CHTcOlburOcT5Cu6SGG+26qb/ID5/GcGnzR5AATVCsmQAXZWKBc4jzZ
	57leYUV9Yuz9dL+IXp0a49LeZjE8kaxIYj7/fgFsL9j58azdz9Fyq1ss0PJmovR9uHyT27nm9iL
	BP7ENrJvzqivP2CC7I9EtK/QZf3jKGhPjmvsd8i0lCVv3MJHb1iYEB+NqYsF1s23NLkMmHACQJ7
	IAMa9b3fhGROftKVx0MQS0nlVwEgyEVmWvJtZUpxptKnpqx3VqGZlzN+ucWMx9kP7GwrfpX7d5+
	zaYC8wktKgNx0uyHNlU6cjp2EMNq
X-Google-Smtp-Source: AGHT+IFVxbNybBFhjflQbQarYyp/1iP6LiwIM87gB4fca6XLBrWdeeJfsLlXDBVoeC0mGO7iYYr7BDJtqS3gON3W6ow=
X-Received: by 2002:a05:600c:1c1a:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-47d195780eemr97112955e9.11.1766338417408; Sun, 21 Dec 2025
 09:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20251219161311.2293512-1-corentin.guillevic@smile.fr>
 <20251219161311.2293512-2-corentin.guillevic@smile.fr> <DF3RWS2MGAXC.2OYHJPZRGZM9Y@bootlin.com>
In-Reply-To: <DF3RWS2MGAXC.2OYHJPZRGZM9Y@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sun, 21 Dec 2025 18:33:11 +0100
X-Gm-Features: AQt7F2qJDdGz-eutPa4y6u0Qdqj--nk5FL51Xw_hroPiuy4woiYALpcr7JjOctk
Message-ID: <CAMSfU+6rsTevsJqYmHwv3a4Gt2zi4JXg69itOs9R1saX8w2nJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/2] meta/files/layers.schema.json: use URI
 shortcut for some remotes
To: mathieu.dubois-briand@bootlin.com
Cc: corentin.guillevic@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ec4b3c064679b55c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 17:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228257

--000000000000ec4b3c064679b55c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 21 d=C3=A9c. 2025 =C3=A0 10:05, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> a =C3=A9crit :
>
> On Fri Dec 19, 2025 at 5:13 PM CET, Corentin Guillevic via
lists.openembedded.org wrote:
> > Among the three sources, only two have a single remote. So we can
replace
> > their entire structure 'remote' -> 'origin' -> 'uri' with a shorter one
> > (property 'uri' only).
> >
> > Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> > ---
>
> Hi Corentin,
>
> It looks like this is breaking some selftest:
>
> 025-12-19 13:57:11,641 - oe-selftest - INFO -
bblayers.BitbakeLayers.test_validate_examplelayersjson
(subunit.RemotedTestCase)
> 2025-12-19 13:57:11,642 - oe-selftest - INFO -  ... FAIL
>
> Stderr:
> 2025-12-19 13:53:18,059 - oe-selftest - INFO - Adding: "include
selftest.inc" in
/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/conf/l=
ocal.conf
> 2025-12-19 13:53:18,059 - oe-selftest - INFO - Adding: "include
bblayers.inc" in bblayers.conf
> 2025-12-19 13:57:11,642 - oe-selftest - INFO - 6: 13/38 66/653 (0.30s) (0
failed) (bblayers.BitbakeLayers.test_validate_examplelayersjson)
> 2025-12-19 13:57:11,642 - oe-selftest - INFO -
testtools.testresult.real._StringException: Traceback (most recent call
last):
>   File
"/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-c=
ore/meta/lib/oeqa/selftest/cases/bblayers.py",
line 163, in test_validate_examplelayersjson
>     self.validate_layersjson(json)
>   File
"/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-c=
ore/meta/lib/oeqa/selftest/cases/bblayers.py",
line 159, in validate_layersjson
>     self.validate_json(json, "layers.schema.json")
>   File
"/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-c=
ore/meta/lib/oeqa/selftest/cases/bblayers.py",
line 152, in validate_json
>     result =3D runCmd(
>              ^^^^^^^
>   File
"/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-c=
ore/meta/lib/oeqa/utils/commands.py",
line 214, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status
%d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command
'/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/tmp/w=
ork/x86_64-linux/python3-jsonschema-native/4.25.1/recipe-sysroot-native/usr=
/bin/nativepython3
/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/tmp/wo=
rk/x86_64-linux/python3-jsonschema-native/4.25.1/recipe-sysroot-native/usr/=
bin/jsonschema
-i
/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-co=
re/meta/files/layers.example.json
--base-uri
file:///srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake/=
bin/../setup-schema/
/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake/bin/../=
setup-schema/layers.schema.json'
returned non-zero exit status 1:
>
/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/tmp/wo=
rk/x86_64-linux/python3-jsonschema-native/4.25.1/recipe-sysroot-native/usr/=
bin/jsonschema:5:
DeprecationWarning: The jsonschema CLI is deprecated and will be removed in
a future version. Please use check-jsonschema instead, which can be
installed from https://pypi.org/project/check-jsonschema/
>   from jsonschema.cli import main
> {'branch': 'master', 'describe': '', 'uri': '
https://github.com/kanavin/meta-alex', 'rev':
'05b25605fb8b2399e4706d7323828676bf0da0b5'}: Additional properties are not
allowed ('uri' was unexpected)
> {'branch': 'master', 'describe': '15.0-hardknott-3.3-310-g0a96edae',
'uri': 'git://git.yoctoproject.org/meta-intel', 'rev':
'0a96edae609a3f48befac36af82cf1eed6786b4a'}: Additional properties are not
allowed ('uri' was unexpected)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2867
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2762
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3003
>
> Can you have a look at this?

Hello,

The bitbake commit for this run is 96d10e4702b8ef53d9893f9b9e0c1d9c4585667c
(the current mathieu/master-next-success).
It does not contain the needed patches:
* [PATCH v4 1/4] bitbake-setup: add inline URI
    https://lists.openembedded.org/g/bitbake-devel/message/18624
* [PATCH v4 2/4] layers.schema.json: support 'uri'
    https://lists.openembedded.org/g/bitbake-devel/message/18625
* [PATCH v4 3/4] bitbake-setup: use URI shortcut for all configurations
    https://lists.openembedded.org/g/bitbake-devel/message/18626
* [PATCH v4 4/4] doc/bitbake-setup: document "uri" property
    https://lists.openembedded.org/g/bitbake-devel/message/18627

Can you retry this patch with a bitbake branch containing these commits?
(In retrospect, the link between the series should have been made more
clear)

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228252):
https://lists.openembedded.org/g/openembedded-core/message/228252
> Mute This Topic: https://lists.openembedded.org/mt/116862096/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Yoann Congal
Smile ECS

--000000000000ec4b3c064679b55c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Le dim. 21 d=C3=A9c. 2025 =C3=A0 10:05, Mathieu Dubois-Bri=
and via<br><a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a><br>&lt;mathieu.dubois-briand=3D<a href=3D"mailto:bootlin.com@lists.ope=
nembedded.org">bootlin.com@lists.openembedded.org</a>&gt; a =C3=A9crit :<br=
>&gt;<br>&gt; On Fri Dec 19, 2025 at 5:13 PM CET, Corentin Guillevic via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> wrote:<b=
r>&gt; &gt; Among the three sources, only two have a single remote. So we c=
an replace<br>&gt; &gt; their entire structure &#39;remote&#39; -&gt; &#39;=
origin&#39; -&gt; &#39;uri&#39; with a shorter one<br>&gt; &gt; (property &=
#39;uri&#39; only).<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Corentin Guill=
evic &lt;<a href=3D"mailto:corentin.guillevic@smile.fr">corentin.guillevic@=
smile.fr</a>&gt;<br>&gt; &gt; ---<br>&gt;<br>&gt; Hi Corentin,<br>&gt;<br>&=
gt; It looks like this is breaking some selftest:<br>&gt;<br>&gt; 025-12-19=
 13:57:11,641 - oe-selftest - INFO - bblayers.BitbakeLayers.test_validate_e=
xamplelayersjson (subunit.RemotedTestCase)<br>&gt; 2025-12-19 13:57:11,642 =
- oe-selftest - INFO - =C2=A0... FAIL<br>&gt;<br>&gt; Stderr:<br>&gt; 2025-=
12-19 13:53:18,059 - oe-selftest - INFO - Adding: &quot;include selftest.in=
c&quot; in /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-91=
7910/conf/local.conf<br>&gt; 2025-12-19 13:53:18,059 - oe-selftest - INFO -=
 Adding: &quot;include bblayers.inc&quot; in bblayers.conf<br>&gt; 2025-12-=
19 13:57:11,642 - oe-selftest - INFO - 6: 13/38 66/653 (0.30s) (0 failed) (=
bblayers.BitbakeLayers.test_validate_examplelayersjson)<br>&gt; 2025-12-19 =
13:57:11,642 - oe-selftest - INFO - testtools.testresult.real._StringExcept=
ion: Traceback (most recent call last):<br>&gt; =C2=A0 File &quot;/srv/poky=
build/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/l=
ib/oeqa/selftest/cases/bblayers.py&quot;, line 163, in test_validate_exampl=
elayersjson<br>&gt; =C2=A0 =C2=A0 self.validate_layersjson(json)<br>&gt; =
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-selftest-debian/build/laye=
rs/openembedded-core/meta/lib/oeqa/selftest/cases/bblayers.py&quot;, line 1=
59, in validate_layersjson<br>&gt; =C2=A0 =C2=A0 self.validate_json(json, &=
quot;layers.schema.json&quot;)<br>&gt; =C2=A0 File &quot;/srv/pokybuild/yoc=
to-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/s=
elftest/cases/bblayers.py&quot;, line 152, in validate_json<br>&gt; =C2=A0 =
=C2=A0 result =3D runCmd(<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0^^^^^^^<br>&gt; =C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-sel=
ftest-debian/build/layers/openembedded-core/meta/lib/oeqa/utils/commands.py=
&quot;, line 214, in runCmd<br>&gt; =C2=A0 =C2=A0 raise AssertionError(&quo=
t;Command &#39;%s&#39; returned non-zero exit status %d:\n%s&quot; % (comma=
nd, result.status, exc_output))<br>&gt; AssertionError: Command &#39;/srv/p=
okybuild/yocto-worker/oe-selftest-debian/build/build-st-917910/tmp/work/x86=
_64-linux/python3-jsonschema-native/4.25.1/recipe-sysroot-native/usr/bin/na=
tivepython3 /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-9=
17910/tmp/work/x86_64-linux/python3-jsonschema-native/4.25.1/recipe-sysroot=
-native/usr/bin/jsonschema -i /srv/pokybuild/yocto-worker/oe-selftest-debia=
n/build/layers/openembedded-core/meta/files/layers.example.json --base-uri =
file:///srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/bitbake/=
bin/../setup-schema/ /srv/pokybuild/yocto-worker/oe-selftest-debian/build/l=
ayers/bitbake/bin/../setup-schema/layers.schema.json&#39; returned non-zero=
 exit status 1:<br>&gt; /srv/pokybuild/yocto-worker/oe-selftest-debian/buil=
d/build-st-917910/tmp/work/x86_64-linux/python3-jsonschema-native/4.25.1/re=
cipe-sysroot-native/usr/bin/jsonschema:5: DeprecationWarning: The jsonschem=
a CLI is deprecated and will be removed in a future version. Please use che=
ck-jsonschema instead, which can be installed from <a href=3D"https://pypi.=
org/project/check-jsonschema/">https://pypi.org/project/check-jsonschema/</=
a><br>&gt; =C2=A0 from jsonschema.cli import main<br>&gt; {&#39;branch&#39;=
: &#39;master&#39;, &#39;describe&#39;: &#39;&#39;, &#39;uri&#39;: &#39;<a =
href=3D"https://github.com/kanavin/meta-alex">https://github.com/kanavin/me=
ta-alex</a>&#39;, &#39;rev&#39;: &#39;05b25605fb8b2399e4706d7323828676bf0da=
0b5&#39;}: Additional properties are not allowed (&#39;uri&#39; was unexpec=
ted)<br>&gt; {&#39;branch&#39;: &#39;master&#39;, &#39;describe&#39;: &#39;=
15.0-hardknott-3.3-310-g0a96edae&#39;, &#39;uri&#39;: &#39;git://<a href=3D=
"http://git.yoctoproject.org/meta-intel">git.yoctoproject.org/meta-intel</a=
>&#39;, &#39;rev&#39;: &#39;0a96edae609a3f48befac36af82cf1eed6786b4a&#39;}:=
 Additional properties are not allowed (&#39;uri&#39; was unexpected)<br>&g=
t;<br>&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/build=
ers/35/builds/2867">https://autobuilder.yoctoproject.org/valkyrie/#/builder=
s/35/builds/2867</a><br>&gt; <a href=3D"https://autobuilder.yoctoproject.or=
g/valkyrie/#/builders/48/builds/2762">https://autobuilder.yoctoproject.org/=
valkyrie/#/builders/48/builds/2762</a><br>&gt; <a href=3D"https://autobuild=
er.yoctoproject.org/valkyrie/#/builders/23/builds/3003">https://autobuilder=
.yoctoproject.org/valkyrie/#/builders/23/builds/3003</a><br>&gt;<br>&gt; Ca=
n you have a look at this?<br><br>Hello,<br><br>The bitbake commit for this=
 run is 96d10e4702b8ef53d9893f9b9e0c1d9c4585667c (the current mathieu/maste=
r-next-success).<br>It does not contain the needed patches:<br>* [PATCH v4 =
1/4] bitbake-setup: add inline URI<br>=C2=A0 =C2=A0 <a href=3D"https://list=
s.openembedded.org/g/bitbake-devel/message/18624">https://lists.openembedde=
d.org/g/bitbake-devel/message/18624</a><br>* [PATCH v4 2/4] layers.schema.j=
son: support &#39;uri&#39;<br>=C2=A0 =C2=A0 <a href=3D"https://lists.openem=
bedded.org/g/bitbake-devel/message/18625">https://lists.openembedded.org/g/=
bitbake-devel/message/18625</a><br>* [PATCH v4 3/4] bitbake-setup: use URI =
shortcut for all configurations<br>=C2=A0 =C2=A0 <a href=3D"https://lists.o=
penembedded.org/g/bitbake-devel/message/18626">https://lists.openembedded.o=
rg/g/bitbake-devel/message/18626</a><br>* [PATCH v4 4/4] doc/bitbake-setup:=
 document &quot;uri&quot; property<br>=C2=A0 =C2=A0 <a href=3D"https://list=
s.openembedded.org/g/bitbake-devel/message/18627">https://lists.openembedde=
d.org/g/bitbake-devel/message/18627</a><br><br>Can you retry this patch wit=
h a bitbake branch containing these commits?<br>(In retrospect, the link be=
tween the series should have been made more clear)<br><br>&gt; Thanks,<br>&=
gt; Mathieu<br>&gt;<br>&gt; --<br>&gt; Mathieu Dubois-Briand, Bootlin<br>&g=
t; Embedded Linux and Kernel engineering<br>&gt; <a href=3D"https://bootlin=
.com">https://bootlin.com</a><br>&gt;<br>&gt;<br>&gt; -=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-<br>&gt; Links: You receive all messages sent to th=
is group.<br>&gt; View/Reply Online (#228252): <a href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/message/228252">https://lists.openembedde=
d.org/g/openembedded-core/message/228252</a><br>&gt; Mute This Topic: <a hr=
ef=3D"https://lists.openembedded.org/mt/116862096/4316185">https://lists.op=
enembedded.org/mt/116862096/4316185</a><br>&gt; Group Owner: <a href=3D"mai=
lto:openembedded-core%2Bowner@lists.openembedded.org">openembedded-core+own=
er@lists.openembedded.org</a><br>&gt; Unsubscribe: <a href=3D"https://lists=
.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org=
/g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr">yo=
ann.congal@smile.fr</a>]<br>&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-<br>&gt;<br><br><br>--<br>Yoann Congal<br>Smile ECS</div>

--000000000000ec4b3c064679b55c--

