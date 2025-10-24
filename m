Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE3FCCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 06:47:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.3581.1761288439579126058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 23:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EfY94CRc;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47118259fd8so10862525e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761288438; x=1761893238; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cvIIkROiqKjvrfQ4xqsSCVmoBs31I9Jr3Gv53g3SLPE=;
        b=EfY94CRc/oJ0rTpIjQVTQrKtDG8XBA5DBSxlyySRBo+c1vqoZb3HM/2F8VsXXHrCI/
         FU5yQacDZ6zgWC9DDGAK8Uk8BipTqGBhDiFw5NFxwFCEQm1fupEKgiToNIuT2jctfY6v
         1j3Ty6lHIeRpsLgnxB1HAFWz/4t13xwemuTXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761288438; x=1761893238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvIIkROiqKjvrfQ4xqsSCVmoBs31I9Jr3Gv53g3SLPE=;
        b=t3QpvgPtwBng+iQtxMiJ3TlM+oQ98xgJY8nelZ64daZGUaOXXPYk0cyGbsdtsDyXOU
         fiJyejr0M4QdteAUsv+i/K1Ngg07F3LSrdH30YGcmoKqOFLcSOTn/Qxzbkouzww+HUy8
         IzX6R5Gok/eHipctWGoQyUjUF1MIf7LmjzLsAT0ofTehreVsebBU+nHjFWOgDKAAPIm3
         iCYkPKpZu4ojj1ojAdRlQKbWhoprwc1R44OIwtcgDWBXeHpFNAtiokMu76a3BzZf1ysk
         6zdNf4yUllNinLwFEooxLe3R1F9guBWMqv+IWrjUABOjOZWqcmINsKdn0UF8HRaNQVEB
         9pgQ==
X-Gm-Message-State: AOJu0YzyYr7/3FFRjJPo5OLOI5S7ulWR+Q/qLNyZVvEN+tv3VELbX3YU
	6IqA/c8kVI15CaxTTv7vbhgTlzKTU4Ebgb+LUFbedEDYtFFjRQm2Jd9nWfmum0h32jPKN0j1O6j
	B458orCJ5QAuJ18SnoeJkPbQq2ojBO8EN/r5m1eE3Sg==
X-Gm-Gg: ASbGncsJGmFguA2CifdKn3rwhxqiz19I/2Nq0VjXg2rnkOGzTd/JAW6ufTM3g9g9Nez
	ltemC7MWMhr4GIXtUJaP979y7S4/MPQxHcCQ/+ZzzkL7GkOzvC5hN05lu5d83LqrtqtYRa+Ozm1
	1zGcN5JaPeLR6CVzb2W7Eqi6UClfa63jrYHMmeu6ZgWtusqq86xNcHnZrQ+xejrbxgzwbdgF34O
	qI4jRB/+cN4MGI7CTPcYFRXibvSwSDLzhd5c6/DK8exgEO5+TZtx8fhdC6Qm623ykR5NP2VhQ1p
	+T6znOBtGdz4hXsJ2dCXUYWiEjoCaw==
X-Google-Smtp-Source: AGHT+IF1CIyvDIGdYbTFC7AQwQX6rk8gLtJzYJoBDttWWzUZx1LkP0CaWwrdmVl5q0THwxeggoiLivOc1GHUoyNSCSQ=
X-Received: by 2002:a05:600c:1ca0:b0:471:6f4:601f with SMTP id
 5b1f17b1804b1-4711790084amr230723565e9.19.1761288437487; Thu, 23 Oct 2025
 23:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251023072513.280477-1-yoann.congal@smile.fr>
 <20251023072513.280477-2-yoann.congal@smile.fr> <DDQCC5ASH6VD.3LTKDQYDDCFKP@bootlin.com>
In-Reply-To: <DDQCC5ASH6VD.3LTKDQYDDCFKP@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 24 Oct 2025 08:47:04 +0200
X-Gm-Features: AWmQ_bm-8gQJof7QnDAG5avmZ0qOtkRiLnngaG9I5gWNvanVqAGVyuagUs27k_g
Message-ID: <CAMSfU+4RASuj7X43ped+ZtiLVM_gKsehh9t2WSksNDuDbBp1SA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] selftest/bblayers: Refactor JSON schema validation
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a9eb530641e1ebe0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 06:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225284

--000000000000a9eb530641e1ebe0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 24 oct. 2025 =C3=A0 08:32, Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> a =C3=A9crit :

> On Thu Oct 23, 2025 at 9:25 AM CEST, Yoann Congal via
> lists.openembedded.org wrote:
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > * Extract a function "validate_json"
> > * Allow to specify the schema relative to $COREBASE/meta/files/
> > * Specify the Base URI to allow schema to reference each other
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> > RFC: Maybe I should split this commit?
> > ---
> >  meta/lib/oeqa/selftest/cases/bblayers.py | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py
> b/meta/lib/oeqa/selftest/cases/bblayers.py
> > index 982287c9a5..43a158fcf2 100644
> > --- a/meta/lib/oeqa/selftest/cases/bblayers.py
> > +++ b/meta/lib/oeqa/selftest/cases/bblayers.py
> > @@ -136,15 +136,24 @@ class BitbakeLayers(OESelftestTestCase):
> >          self.assertTrue(os.path.isfile(recipe_file), msg =3D "Can't fi=
nd
> recipe file for %s" % recipe)
> >          return os.path.basename(recipe_file)
> >
> > -    def validate_layersjson(self, json):
> > -        python =3D os.path.join(get_bb_var('STAGING_BINDIR',
> 'python3-jsonschema-native'), 'nativepython3')
> > -        jsonvalidator =3D os.path.join(get_bb_var('STAGING_BINDIR',
> 'python3-jsonschema-native'), 'jsonschema')
> > -        jsonschema =3D os.path.join(get_bb_var('COREBASE'),
> 'meta/files/layers.schema.json')
> > -        result =3D runCmd("{} {} -i {} {}".format(python, jsonvalidato=
r,
> json, jsonschema))
> > +    def validate_json(self, json, jsonschema):
> > +        staging_bindir =3D get_bb_var('STAGING_BINDIR',
> 'python3-jsonschema-native')
> > +        python =3D os.path.join(staging_bindir, 'nativepython3')
> > +        jsonvalidator =3D os.path.join(staging_bindir, 'jsonschema')
> > +        schemas_dir =3D os.path.join(get_bb_var('COREBASE'),
> "meta/files/")
> > +        if not os.path.isabs(jsonschema):
> > +            jsonschema =3D os.path.join(schemas_dir, jsonschema)
> > +
> > +        result =3D runCmd(
> > +            "{} {} -i {} --base-uri file://{}/ {}".format(
> > +                python, jsonvalidator, json, schemas_dir, jsonschema
> > +            )
> > +        )
> >
> >      def test_validate_examplelayersjson(self):
> >          json =3D os.path.join(get_bb_var('COREBASE'),
> "meta/files/layers.example.json")
> > -        self.validate_layersjson(json)
> > +        jsonschema =3D "layers.schema.json"
> > +        self.validate_json(json, jsonschema)
>
> Hi Yoann,
>
> Did you forget to replace some uses of validate_layersjson() or did I
> miss a commit? I still have 5 calls to it in bblayers.py, after your
> patches are applied.
>

Yes I did in v1.


> 2025-10-23 14:30:16,772 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedded=
-core/meta/lib/oeqa/selftest/cases/bblayers.py",
> line 175, in test_bitbakelayers_setup
>     self.validate_layersjson(jsonfile)
>     ^^^^^^^^^^^^^^^^^^^^^^^^
> AttributeError: 'BitbakeLayers' object has no attribute
> 'validate_layersjson'
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2499
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2589
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2737
>
> I had a quick look at the v2 and I believe we have the same issue.
>

I think I fixed that in v2 by keeping validate_layersjson() but changing it
to use the refactored function. Can you test this?

Thanks!

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

--000000000000a9eb530641e1ebe0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 24 oct. 2025 =C3=A0 =
08:32, Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bo=
otlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu Oct 23, 202=
5 at 9:25 AM CEST, Yoann Congal via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</=
a> wrote:<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt;<br>
&gt; * Extract a function &quot;validate_json&quot;<br>
&gt; * Allow to specify the schema relative to $COREBASE/meta/files/<br>
&gt; * Specify the Base URI to allow schema to reference each other<br>
&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; RFC: Maybe I should split this commit?<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/bblayers.py | 21 +++++++++++++++---=
---<br>
&gt;=C2=A0 1 file changed, 15 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/=
selftest/cases/bblayers.py<br>
&gt; index 982287c9a5..43a158fcf2 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/bblayers.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/bblayers.py<br>
&gt; @@ -136,15 +136,24 @@ class BitbakeLayers(OESelftestTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.isfile(recip=
e_file), msg =3D &quot;Can&#39;t find recipe file for %s&quot; % recipe)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return os.path.basename(recipe_file)=
<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def validate_layersjson(self, json):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 python =3D os.path.join(get_bb_var(&#39;S=
TAGING_BINDIR&#39;, &#39;python3-jsonschema-native&#39;), &#39;nativepython=
3&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 jsonvalidator =3D os.path.join(get_bb_var=
(&#39;STAGING_BINDIR&#39;, &#39;python3-jsonschema-native&#39;), &#39;jsons=
chema&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 jsonschema =3D os.path.join(get_bb_var(&#=
39;COREBASE&#39;), &#39;meta/files/layers.schema.json&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&quot;{} {} -i {} {}&qu=
ot;.format(python, jsonvalidator, json, jsonschema))<br>
&gt; +=C2=A0 =C2=A0 def validate_json(self, json, jsonschema):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 staging_bindir =3D get_bb_var(&#39;STAGIN=
G_BINDIR&#39;, &#39;python3-jsonschema-native&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 python =3D os.path.join(staging_bindir, &=
#39;nativepython3&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 jsonvalidator =3D os.path.join(staging_bi=
ndir, &#39;jsonschema&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 schemas_dir =3D os.path.join(get_bb_var(&=
#39;COREBASE&#39;), &quot;meta/files/&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isabs(jsonschema):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jsonschema =3D os.path.join=
(schemas_dir, jsonschema)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;{} {} -i {} --base-ur=
i file://{}/ {}&quot;.format(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python, jsonv=
alidator, json, schemas_dir, jsonschema<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_validate_examplelayersjson(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json =3D os.path.join(get_bb_var(&#3=
9;COREBASE&#39;), &quot;meta/files/layers.example.json&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.validate_layersjson(json)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 jsonschema =3D &quot;layers.schema.json&q=
uot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.validate_json(json, jsonschema)<br>
<br>
Hi Yoann,<br>
<br>
Did you forget to replace some uses of validate_layersjson() or did I<br>
miss a commit? I still have 5 calls to it in bblayers.py, after your<br>
patches are applied.<br></blockquote></div></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Yes I did in v1.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
2025-10-23 14:30:16,772 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/laye=
rs/openembedded-core/meta/lib/oeqa/selftest/cases/bblayers.py&quot;, line 1=
75, in test_bitbakelayers_setup<br>
=C2=A0 =C2=A0 self.validate_layersjson(jsonfile)<br>
=C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^^^^^^^^<br>
AttributeError: &#39;BitbakeLayers&#39; object has no attribute &#39;valida=
te_layersjson&#39;<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/buil=
ds/2499" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/48/builds/2499</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/buil=
ds/2589" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/35/builds/2589</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/buil=
ds/2737" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/23/builds/2737</a><br>
<br>
I had a quick look at the v2 and I believe we have the same issue.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I think I=
 fixed that in v2 by keeping validate_layersjson() but changing it to use t=
he refactored function. Can you test this?</div><div dir=3D"auto"></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thanks!</div><div dir=3D"auto"><=
div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div></div></div>

--000000000000a9eb530641e1ebe0--

