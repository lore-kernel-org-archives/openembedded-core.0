Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63128C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 14:34:30 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8475.1787150067018039865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 07:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FM4DUNH1;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66825847b2cso1355315d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 07:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787150066; cv=none;
        d=google.com; s=arc-20260327;
        b=FFx1beippnHq+HUjKCeeB6/qfXPJzmwlcUrKWh7Cos6Y+bdTFkLQWe/uiIWwcHkBT4
         fjsTILDGS1JdFQ+12df2Qg7IQ9CePk6rhTwGOJQkWDY/oiWNpQs2BPaNC2j5fhyEy/Z/
         618N13aT6AH0DSD00r8edAbMuWwzJXDHvbFqf1+hvDL8HPwMIPgH5aaWBbkTX++Sqcei
         Ig/G8GFFlDRRzSEBw4g45r1Jk9DU6rT6whcsSVmSIy5w9lj4nF/TSlv3VzWe0Fs6I2/Y
         4Sfqb9FzDipg0xZTCBDLPe6tbko9ceorFz8Se2aMFNsZPMUuA1tKzaQvhytIniFCVOPe
         CvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jH33NPvF6jdFPQOK3HjwgXvWRiSKkwSbxVywKkuAdCU=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=ALD3UlcumSp72mKba/ywD7zVgxD2MVAwrNNex+uPAJiJLpiBZq32LPGB6S4NtefGXK
         dLoQ+Z4HfQGoWpRs5eIdnFyd9gC2NE42JiEjbH/UC8QAYZ/MIUtAV5BbYe9FIU+zr++0
         hUo2+IqFr0nQNe60IpmVIOdR7X5XM/wyd1l9EgDDoBKcYXURzDtU709co+ujP0I7H2tA
         Ue5r4AP0xesgIyNjpP4FHMrsJjIHgzTYViElBwVg/Z1lgsnfFVwkA/+rAyVBkpS4eYGD
         dYtigEus2iIr8iOe/q8i3H55hIRADPpPP37YNQ3ocU5q4YXu2qK47bPfH0RQIMgJF8zP
         wPJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787150066; x=1787754866; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jH33NPvF6jdFPQOK3HjwgXvWRiSKkwSbxVywKkuAdCU=;
        b=FM4DUNH1s5xuurAzMTmKXGtQN5hL14zMPkA7jcaCB0r4bb283ytcO/uM55AC4PEGbS
         uXMDNOOuHPSkqTDSEwMIHgLHCjlpirNkAmok3qYRNj2y8r84wC4/sNY3HxeMb9qQtg/s
         Gx5Z5K37Sg1dkMO9FUNkO2hgj6HfThnQg1a8N7cSAvnzhGw+yzhFu18Fwm4LItoPw4Ex
         Edu/4uB9Hems4nRz+sUNtXm9MctXjXdjc9kJEJj1ZLgdZuUv01DKkFWb8O8SoaD1Alob
         hOjynGnwZ1qx8Vi3pedX53RQYKf5zDGZfL+079zZKFJ/IzB86J0SiGbngR4A9VEXPT//
         bkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150066; x=1787754866;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jH33NPvF6jdFPQOK3HjwgXvWRiSKkwSbxVywKkuAdCU=;
        b=dGr+1q0KWwzFrcvRe9Uv6rStQc8IHLWF3jJlhFFSae8ECQMO2xPGvZwMss6R1kg6k4
         jD5tbas1lpepf+e7Oj5PTx9JlZ8rHd1vEuhWnK//oZiXdRNqn7F4iO2RARyCq5dh177S
         zXCwX9sKm9nG1Bwi+67GqcsBAZFG2dHj/Uc810Mu3e8dj3iKxdqANfmuTPwtkDcOWw3P
         5PgV9TbDGsAmQjltUPVy08RQEblBibNotx08DfuAQuo53tG/idR/iPCAh+nbnlouCzsO
         8CEiNtrsBLL5ARMahDGAY8S0MNTs/RoxH4YCgNhcssudw28qYsMfLj3nI4K1/t7TWCxx
         J5LQ==
X-Gm-Message-State: AFuF++nqlXXs1v2Dj0xA90w7V1Zi2oTEDg8VkKB1+nEDBINiEz142+tg
	eHbgCmC5J6CzygTMohpCZQ7jE6u170CTNq5yNVL9r7WoDchrzwFJ/Oyt5GiKoamSX+DWocR3raR
	Ru2SDiiEyfaet3SXP+6Qs1cf7B5D/GCJC6z8K
X-Gm-Gg: AR+sD10aCQwEzK8/xWL+0y8PU+PUXJFLEUwtg1tEpGh+XpFwg4jA0fUuaYXCHJajcXt
	zZVMhMj0yBFjnUk/FO5dy2/8K8dqlBWyGPMLPoCMTYkkUryvf3nyBh4+ipjLairpAeX6aRP0HLT
	xBjGJDguP+AvxYwiELYcoYQiz+rVUhtPvsS3B7kT3ZEHa8naEUkrOm4RBAkkXLF0s4COdBZbap/
	8+6DzSH3AK3n/YJaHoZT0USss8N1uqL7uaW0yogJLrKTACeT7dmAbM5KVRFuZkJoopaGIs5LBa5
	xGkIT3cXv7d+E56IaQnJw+8cQU/Y/GRUb3XR0WOI5xajMP5RpkxJRMlaR9M=
X-Received: by 2002:a05:690e:445b:b0:66c:7a77:1edf with SMTP id
 956f58d0204a3-66ccb752bbcmr1318929d50.48.1787150065812; Wed, 19 Aug 2026
 07:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260818221721.3820389-1-JPEWhacker@gmail.com> <DKSZSLHAIC87.T4Z052L890U2@bootlin.com>
In-Reply-To: <DKSZSLHAIC87.T4Z052L890U2@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 19 Aug 2026 08:34:14 -0600
X-Gm-Features: AcwNN1W4yobq410mgxvhzeR9XCx9IxbIONcS7Bvr3jPQ0yqv11NYqSuNY6seb6Y
Message-ID: <CAJdd5GYvRtNWB9bO04FzwGb9godiF+7PJDh87D4iJa=ESaPTfA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] licences: Move exceptions to subdirectory
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d54b570659674cdd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 14:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243732

--000000000000d54b570659674cdd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 8:33=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Wed Aug 19, 2026 at 12:17 AM CEST, Joshua Watt via
> lists.openembedded.org wrote:
> > Moves the SPDX license exceptions to a subdirectory to make the easier
> > to identify as license exceptions vs. actual licenses
> >
> > This should have no effect on other layers since SPDX doesn't allow
> > custom Exceptions like it does for Licenses (via LicenseRef-); since we
> > have already enumerated all known exceptions, its unlikely any other
> > layer have added their own
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
>
> Hi Joshua,
>
> Thanks for your patch.
>
> It looks like this is breaking devtool/recipetool:
>
> Traceback (most recent call last):
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/meta/=
lib/oeqa/sdkext/cases/devtool.py",
> line 59, in test_devtool_add_reset
>     self._run('devtool add myapp %s' % self.myapp_dst)
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/meta/=
lib/oeqa/sdkext/case.py",
> line 22, in _run
>     return subprocess.check_output(". %s > /dev/null;"\
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib64/python3.12/subprocess.py", line 466, in check_output
>     return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue=
,
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib64/python3.12/subprocess.py", line 571, in run
>     raise CalledProcessError(retcode, process.args,
> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '.
> /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-lin=
ux/core-image-minimal/1.0/testsdkext/environment-setup-core2-32-poky-linux
> > /dev/null; devtool add myapp
> /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-lin=
ux/core-image-minimal/1.0/testsdkext/myapp;'
> returned non-zero exit status 1.
> Standard Output: NOTE: Reconnecting to bitbake server...
> NOTE: Reconnecting to bitbake server...
> Traceback (most recent call last):
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/scripts/reci=
petool",
> line 111, in <module>
>     ret =3D main()
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/scripts/reci=
petool",
> line 100, in main
>     ret =3D args.func(args)
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/scripts/lib/=
recipetool/create.py",
> line 798, in create_recipe
>     handle_license_vars(srctree_use, lines_before, handled, extravalues,
> tinfoil.config_data)
>
> ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/scripts/lib/=
recipetool/create.py",
> line 965, in handle_license_vars
>     for node, licfile, md5 in find_licenses(srctree, d):
>                               ~~~~~~~~~~~~~^^^^^^^^^^^^
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/meta/lib/oe/=
license_finder.py",
> line 201, in find_licenses
>     licenses =3D match_licenses(licfiles, srctree, d, extra_hashes)
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/meta/lib/oe/=
license_finder.py",
> line 173, in match_licenses
>     md5sums.update(_crunch_known_licenses(d))
>                    ~~~~~~~~~~~~~~~~~~~~~~^^^
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/meta/lib/oe/=
license_finder.py",
> line 52, in _crunch_known_licenses
>     md5value =3D bb.utils.md5_file(path)
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/bitbake/lib/=
bb/utils.py",
> line 648, in md5_file
>     return _hasher(sig, filename)
>   File
> "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/bitbake/lib/=
bb/utils.py",
> line 623, in _hasher
>     with open(filename, "rb") as f:
>          ~~~~^^^^^^^^^^^^^^^^
> IsADirectoryError: [Errno 21] Is a directory:
> '/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/meta/files/c=
ommon-licenses/exceptions'
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/4408
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/4463
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/4420
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2154
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/4537
>
> Everything else looks fine here. Can you have a look at that?
>

Yes


>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000d54b570659674cdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 19, 2026 at 8:3=
3=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-bri=
and@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Wed Aug 19, 2026 at 12=
:17 AM CEST, Joshua Watt via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Moves the SPDX license exceptions to a subdirectory to make the easier=
<br>
&gt; to identify as license exceptions vs. actual licenses<br>
&gt;<br>
&gt; This should have no effect on other layers since SPDX doesn&#39;t allo=
w<br>
&gt; custom Exceptions like it does for Licenses (via LicenseRef-); since w=
e<br>
&gt; have already enumerated all known exceptions, its unlikely any other<b=
r>
&gt; layer have added their own<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Joshua,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like this is breaking devtool/recipetool:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/layers/openembe=
dded-core/meta/lib/oeqa/sdkext/cases/devtool.py&quot;, line 59, in test_dev=
tool_add_reset<br>
=C2=A0 =C2=A0 self._run(&#39;devtool add myapp %s&#39; % self.myapp_dst)<br=
>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/layers/openembe=
dded-core/meta/lib/oeqa/sdkext/case.py&quot;, line 22, in _run<br>
=C2=A0 =C2=A0 return subprocess.check_output(&quot;. %s &gt; /dev/null;&quo=
t;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^<br>
=C2=A0 File &quot;/usr/lib64/python3.12/subprocess.py&quot;, line 466, in c=
heck_output<br>
=C2=A0 =C2=A0 return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, chec=
k=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^<br>
=C2=A0 File &quot;/usr/lib64/python3.12/subprocess.py&quot;, line 571, in r=
un<br>
=C2=A0 =C2=A0 raise CalledProcessError(retcode, process.args,<br>
oeqa.utils.subprocesstweak.OETestCalledProcessError: Command &#39;. /srv/po=
kybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-i=
mage-minimal/1.0/testsdkext/environment-setup-core2-32-poky-linux &gt; /dev=
/null; devtool add myapp /srv/pokybuild/yocto-worker/qemux86/build/build/tm=
p/work/qemux86-poky-linux/core-image-minimal/1.0/testsdkext/myapp;&#39; ret=
urned non-zero exit status 1.<br>
Standard Output: NOTE: Reconnecting to bitbake server...<br>
NOTE: Reconnecting to bitbake server...<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/=
qemux86-poky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-co=
re/scripts/recipetool&quot;, line 111, in &lt;module&gt;<br>
=C2=A0 =C2=A0 ret =3D main()<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/=
qemux86-poky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-co=
re/scripts/recipetool&quot;, line 100, in main<br>
=C2=A0 =C2=A0 ret =3D args.func(args)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/=
qemux86-poky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-co=
re/scripts/lib/recipetool/create.py&quot;, line 798, in create_recipe<br>
=C2=A0 =C2=A0 handle_license_vars(srctree_use, lines_before, handled, extra=
values, tinfoil.config_data)<br>
=C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/=
qemux86-poky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-co=
re/scripts/lib/recipetool/create.py&quot;, line 965, in handle_license_vars=
<br>
=C2=A0 =C2=A0 for node, licfile, md5 in find_licenses(srctree, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~^^^^^^^^^^^^<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/=
qemux86-poky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-co=
re/meta/lib/oe/license_finder.py&quot;, line 201, in find_licenses<br>
=C2=A0 =C2=A0 licenses =3D match_licenses(licfiles, srctree, d, extra_hashe=
s)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/=
qemux86-poky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-co=
re/meta/lib/oe/license_finder.py&quot;, line 173, in match_licenses<br>
=C2=A0 =C2=A0 md5sums.update(_crunch_known_licenses(d))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~=
~~~~~~~~~~~~~~~~^^^<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/=
qemux86-poky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-co=
re/meta/lib/oe/license_finder.py&quot;, line 52, in _crunch_known_licenses<=
br>
=C2=A0 =C2=A0 md5value =3D bb.utils.md5_file(path)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/=
qemux86-poky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-co=
re/bitbake/lib/bb/utils.py&quot;, line 648, in md5_file<br>
=C2=A0 =C2=A0 return _hasher(sig, filename)<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/=
qemux86-poky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-co=
re/bitbake/lib/bb/utils.py&quot;, line 623, in _hasher<br>
=C2=A0 =C2=A0 with open(filename, &quot;rb&quot;) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~^^^^^^^^^^^^^^^^<br>
IsADirectoryError: [Errno 21] Is a directory: &#39;/srv/pokybuild/yocto-wor=
ker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0/=
testsdkext/layers/openembedded-core/meta/files/common-licenses/exceptions&#=
39;<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/buil=
ds/4408" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/30/builds/4408</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/buil=
ds/4463" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/16/builds/4463</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/buil=
ds/4420" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/36/builds/4420</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/buil=
ds/2154" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/45/builds/2154</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/buil=
ds/4537" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/68/builds/4537</a><br>
<br>
Everything else looks fine here. Can you have a look at that?<br></blockquo=
te><div><br></div><div>Yes</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000d54b570659674cdd--

