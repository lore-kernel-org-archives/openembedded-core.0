Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD32DC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 16:45:24 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.46265.1753116316757487203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 09:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gy1ZEMOr;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55a10c74f31so4759068e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753116315; x=1753721115; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d/Fv684nPbJBgJQxZ+S7cWhv1fm6cLYuMuCARW+N5Rs=;
        b=gy1ZEMOrCh6m9C5KqhdNJBSF1cyRgPDXekhGkQFrDw14QmthUjBLTtlfi/Pi58/doM
         If6kJFY8Ie+Eo1DQwiU5UdjAgG3504blr7clfJCp4z1WzNVBBKETpHHLiBzliD9Qgzgt
         QunPCKjHTlglq3NOY+BVeyj+SA+IaV25kzv8ByY8kDqK0rQKqU8VuVyrvBOebO/xKFo2
         FtlWzyIVRyyoGpx5uTIT+HVJ6ixmmCUYpOMt947Pc1PTMfFZqwT3r6bfoMkOqEVFxV5T
         Q+XnF0+vm69AkUvZVXMExPwCaYT28zVYzm4spBjazN3SHyzVIocaIVE7SZb5C7OSWGdl
         fKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753116315; x=1753721115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/Fv684nPbJBgJQxZ+S7cWhv1fm6cLYuMuCARW+N5Rs=;
        b=t1Bz+GNui8WEoGaHoiECIeafoNkh4/Mf9JBE7qFbHs6stypLdjgr3yexedJAoBbd4T
         JdsebfSO4KGK2/22gUBDdji2YJiR/DktJMYP3RfPnAFLkC5b5nnIlu+XBHBkvKQad3HY
         cRXK3qbQ3AOZJlt2JfuM7lLCNTQldvQpxhRAwPF2jvndSp0pcPqlYI2m3/fhf19MQvzL
         /aD0ogqiEocf5w1caVkJMaHvoTE7BwTOFMEI7xt+ZPo6AUfbILy+OGtMqqM/lRm4zVf2
         V+7tt3t8LZlfGj9NlbN7ZlFEN3SHYqn+J2sya4nYJeh9ZuIDt3oiSD5HGBV21WII/oN+
         5riw==
X-Gm-Message-State: AOJu0YxtAxkiCyHIZIfKlW4UM9XyeCDCiVrj3M3FzOUsIkfoU78Wy9e+
	S9rCM+D0aZlHlBzFVezGD9I0m6lXTADq7ReFfil2RfIHfsLWHz2p4mHID2o3SSkUNLBp8hW08FO
	rwU2h+O00VQyePITZ9GOD3+C4BKY4ihM=
X-Gm-Gg: ASbGncs+paj1hayEE0LlP52+wqn1v/ry3uwPmEqwTrb9eOx+LPR/lPCWGFAK4yIX7nl
	qUbPp5gbObNV8Z/dZ/PlGgayLR0ZTbMI7m6pdAQzAQIdX92590StYi7fl76CRuL48oWH+piw+A3
	F1TodsZmRIut5h0/kkgz9jqmUR23ZHTmwPGK5VgfQwQGj1XUrKSoYfJMVf1glZ/Cp2DLKyqyLlw
	IP6hqbPnQbTGUJK99WZAQ==
X-Google-Smtp-Source: AGHT+IGZaAFkXnGpVenZRJh9wU4i0P+LNHehTPtE4NzXpsUTwfgxlF27HR6tZs/RCRLbWAKX9a5syMrk7nExhr7yaeg=
X-Received: by 2002:a05:6512:2393:b0:55a:3317:1831 with SMTP id
 2adb3069b0e04-55a33171b7dmr4349366e87.0.1753116314429; Mon, 21 Jul 2025
 09:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250716090517.481832-1-kamel.bouhara@bootlin.com>
 <20250716090517.481832-2-kamel.bouhara@bootlin.com> <CAJdd5GYRkptevcv0+4U6fQmVa-MxzB4EbdX=GtfE-21x3rkzEQ@mail.gmail.com>
 <20250721145339.GA632744@tpx1.home>
In-Reply-To: <20250721145339.GA632744@tpx1.home>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 21 Jul 2025 10:45:01 -0600
X-Gm-Features: Ac12FXwCcH_FxCx4yzZRgFtqTf2_8crSU84TpswA6OdVbw32ZVhfp0WFoPm5k34
Message-ID: <CAJdd5GZxEjSv0yhx6ESAXHwjok_-3p1iFM3Chk2G8GMHt3y1fA@mail.gmail.com>
Subject: Re: [PATCH 1/1] spdx3: Add optional kernel configuration export to
 build_parameter for virtual/kernel
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000002bf2d7063a733344"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 16:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220705

--0000000000002bf2d7063a733344
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2025 at 8:53=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bootli=
n.com>
wrote:

> On Fri, Jul 18, 2025 at 04:10:31PM -0600, Joshua Watt wrote:
> >    Nak, see inline comment below about erasing the recipe variables
> >    In general, I'm not too opposed to being able to express this sort o=
f
> >    thing in the SPDX (provided it's optional), there already is
> precedence
> >    for it (see SPDX_INCLUDE_BUILD_VARIABLES), and it is more or less
> >    intended that SPDX _can_ express these sorts of things (although, ju=
st
> >    because we can doesn't mean we have to). However, your approach here
> is
> >    incorrect.
>
> Hi Joshua,
>
> >    The primary problem is that you are including the config settings in
> >    the recipe Build object; you can't really do that because that recip=
e
> >    Build object (more or less) represents the build of entire "recipe"
> (up
> >    to the point of the do_create_spdx task anyway), and already has a
> >    defined meaning for what its build parameters mean (they are the
> >    bitbake variables at the time the do_create_spdx is invoked). Adding
> in
> >    the kernel config options to this build changes that meaning and mea=
ns
> >    that you can't infer the meaning of the parameters anymore from the
> >    buildType, which is wrong.
>
>
> OK thanks for clarifying the context around the Build object.
>
> Just to make sure I understand correctly:
>
> The Build object created in create_spdx(d) is intended to represent the
> entire bitbake recipe build (up to do_create_spdx), including any tasks
> like do_configure, do_compile, etc., but it's still scoped to that
> specific recipe, not to the entire image or overall build.
>
> So anything that applies to just a step (like parsing .config for a kerne=
l)
> shouldn't be added directly to this object, and should instead go in a
> separate Build object linked via a relationship like ancestorOf.
>
> Is that the correct way to interpret it?
>

Yes, this is a correct interpretation. In the future, we may also create
sub-builds for the various tasks that run (do_compile, et. al.) in the same
manner, but it's not really needed at this point.


>
> >    Instead, what you need to do is create a new build that represents t=
he
> >    compile (or configuration) of the kernel, and assign it a unique
> >    buildType (or if one already exists for the kernel build with the sa=
me
> >    meaning, you could use that.... but I doubt that is the case). Since
> >    you have a unique buildType, you can then define the kernel config
> >    parameters as you have done here for that build and it will be
> possible
> >    to correctly interpret them. The final step is to link the existing
> >    build to your new build using the ancestorOf relationship to indicat=
e
> >    that your new build is a "sub build" of the parent recipe build.
>
> OK, I've started reworking the patch with that structure in mind.
>
> To create the new build object representing the kernel configuration,
> I=E2=80=99m planning to do the following:
>
>    1. Use oe.spdx30.build_Build(...) to create a new Build, with a unique
>    buildType like "kernel-configuration".
>

Like many other things in SPDX, this is actually a URI which is used to
namespace it (i.e. it doesn't need to be a resolvable _URL_, but it looks
like one). As such, you'd probably want to do:
"https://openembedded.org/kernel-configuration" or similar. This prevents
someone else from squatting on the "kernel-configuration" name and
accidentally giving it a different meaning.


>
>    2. Populate build_parameter with the parsed .config CONFIG_* values as
>    DictionaryEntrys.
>
>    3. Link it to the main recipe Build object via ancestorOf relationship
>    like:
>
>             build_objset.new_relationship(
>                 [build], # Parent: full recipe build
>                 oe.spdx30.RelationshipType.ancestorOf,
>                 [main_recipe_build], # Child: kernel config sub-build
>             )
>
>    4. Set timestamps (seems optional ?)
>

Just make sure to use set_timestamp_now().


>
> Does that approach look correct to you, especially the use of ancestorOf
> and the new buildType?
>
> Below is an example of spdx snippet obtained with your suggestion:
>
>     {
>       "type": "build_Build",
>       "spdxId": "http://spdx.org/spdxdocs/linux-yocto-.../kernel-config",
>       "creationInfo": "_:CreationInfo220",
>       "build_buildType": "kernel-configuration",
>       "build_parameter": [
>         {
>           "type": "DictionaryEntry",
>           "key": "CONFIG_CC_VERSION_TEXT",
>           "value": "x86_64-oe-linux-gcc (GCC) 13.3.0"
>         },
>        ...
>     }
>
> >    Ideally, this would not live in spdx30_tasks.py, since it's highly
> >    specific to the kernel build and I really want to avoid putting
> >    everyone's specific reporting requirements in the common code; they
> >    need to be more distributed than that (IMHO).
>
> I see your point about keeping spdx30_tasks.py free of recipe-specific
> logic, that makes sense from a long-term maintainability standpoint.
>
> That said, I have some doubts about creating a dedicated
> kernel-spdx.bbclass
> just for handling this one case (the .config). It feels a bit heavy unles=
s
> we expect additional kernel-specific SPDX processing in the future.
>

IMHO, it would hopefully live in kernel.bbclass and hook into the SPDX
generation from there (see below). One could imagine similar things for
meson.bbclass, cmake.bbclass et. al.


>
> Would a lighter alternative be acceptable, keeping the
> kernel build injection behind SPDX_INCLUDE_KERNEL_CONFIG? It would keep
> the logic local without needing a new class.
>

It needs the SPDX_INCLUDE_KERNEL_CONFIG regardless. One advantage of being
able to split this out would be that you could add the sub builds using a
bbclass in your own layer if you wanted, which would make it more flexible
to incubate stuff like this in your own layer before moving to core.

Unfortunately, I've not had a chance to think about the best way to do
this, so I'm not exactly sure what makes sense


>
> Curious what you'd prefer here, I want to respect the layering without
> introducing more complexity than necessary.
>
> Cheers,
>
> --
> Kamel Bouhara, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>

--0000000000002bf2d7063a733344
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 21,=
 2025 at 8:53=E2=80=AFAM Kamel Bouhara &lt;<a href=3D"mailto:kamel.bouhara@=
bootlin.com">kamel.bouhara@bootlin.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Fri, Jul 18, 2025 at 04:10:31PM -0=
600, Joshua Watt wrote:<br>
&gt;=C2=A0 =C2=A0 Nak, see inline comment below about erasing the recipe va=
riables<br>
&gt;=C2=A0 =C2=A0 In general, I&#39;m not too opposed to being able to expr=
ess this sort of<br>
&gt;=C2=A0 =C2=A0 thing in the SPDX (provided it&#39;s optional), there alr=
eady is precedence<br>
&gt;=C2=A0 =C2=A0 for it (see SPDX_INCLUDE_BUILD_VARIABLES), and it is more=
 or less<br>
&gt;=C2=A0 =C2=A0 intended that SPDX _can_ express these sorts of things (a=
lthough, just<br>
&gt;=C2=A0 =C2=A0 because we can doesn&#39;t mean we have to). However, you=
r approach here is<br>
&gt;=C2=A0 =C2=A0 incorrect.<br>
<br>
Hi Joshua,<br>
<br>
&gt;=C2=A0 =C2=A0 The primary problem is that you are including the config =
settings in<br>
&gt;=C2=A0 =C2=A0 the recipe Build object; you can&#39;t really do that bec=
ause that recipe<br>
&gt;=C2=A0 =C2=A0 Build object (more or less) represents the build of entir=
e &quot;recipe&quot; (up<br>
&gt;=C2=A0 =C2=A0 to the point of the do_create_spdx task anyway), and alre=
ady has a<br>
&gt;=C2=A0 =C2=A0 defined meaning for what its build parameters mean (they =
are the<br>
&gt;=C2=A0 =C2=A0 bitbake variables at the time the do_create_spdx is invok=
ed). Adding in<br>
&gt;=C2=A0 =C2=A0 the kernel config options to this build changes that mean=
ing and means<br>
&gt;=C2=A0 =C2=A0 that you can&#39;t infer the meaning of the parameters an=
ymore from the<br>
&gt;=C2=A0 =C2=A0 buildType, which is wrong.<br>
<br>
<br>
OK thanks for clarifying the context around the Build object.<br>
<br>
Just to make sure I understand correctly:<br>
<br>
The Build object created in create_spdx(d) is intended to represent the<br>
entire bitbake recipe build (up to do_create_spdx), including any tasks<br>
like do_configure, do_compile, etc., but it&#39;s still scoped to that<br>
specific recipe, not to the entire image or overall build.<br>
<br>
So anything that applies to just a step (like parsing .config for a kernel)=
<br>
shouldn&#39;t be added directly to this object, and should instead go in a<=
br>
separate Build object linked via a relationship like ancestorOf.<br>
<br>
Is that the correct way to interpret it?<br></blockquote><div><br></div><di=
v>Yes, this is a correct interpretation. In the future, we may also create =
sub-builds for the various tasks that run (do_compile, et. al.) in the same=
 manner, but it&#39;s not really needed at this point.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 Instead, what you need to do is create a new build that r=
epresents the<br>
&gt;=C2=A0 =C2=A0 compile (or configuration) of the kernel, and assign it a=
 unique<br>
&gt;=C2=A0 =C2=A0 buildType (or if one already exists for the kernel build =
with the same<br>
&gt;=C2=A0 =C2=A0 meaning, you could use that.... but I doubt that is the c=
ase). Since<br>
&gt;=C2=A0 =C2=A0 you have a unique buildType, you can then define the kern=
el config<br>
&gt;=C2=A0 =C2=A0 parameters as you have done here for that build and it wi=
ll be possible<br>
&gt;=C2=A0 =C2=A0 to correctly interpret them. The final step is to link th=
e existing<br>
&gt;=C2=A0 =C2=A0 build to your new build using the ancestorOf relationship=
 to indicate<br>
&gt;=C2=A0 =C2=A0 that your new build is a &quot;sub build&quot; of the par=
ent recipe build.<br>
<br>
OK, I&#39;ve started reworking the patch with that structure in mind.<br>
<br>
To create the new build object representing the kernel configuration,<br>
I=E2=80=99m planning to do the following:<br>
<br>
=C2=A0 =C2=A01. Use oe.spdx30.build_Build(...) to create a new Build, with =
a unique<br>
=C2=A0 =C2=A0buildType like &quot;kernel-configuration&quot;.<br></blockquo=
te><div><br></div><div>Like many other things in SPDX, this is actually a U=
RI which is used to namespace it (i.e. it doesn&#39;t need to be a resolvab=
le _URL_, but it looks like one). As such, you&#39;d probably want to do:</=
div><div>&quot;<a href=3D"https://openembedded.org/kernel-configuration">ht=
tps://openembedded.org/kernel-configuration</a>&quot; or similar. This prev=
ents someone else from squatting on the &quot;kernel-configuration&quot; na=
me and accidentally giving it a different meaning.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A02. Populate build_parameter with the parsed .config CONFIG_* v=
alues as<br>
=C2=A0 =C2=A0DictionaryEntrys.<br>
<br>
=C2=A0 =C2=A03. Link it to the main recipe Build object via ancestorOf rela=
tionship<br>
=C2=A0 =C2=A0like:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_objset.new_relationship(<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [build], # Parent: =
full recipe build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.Relations=
hipType.ancestorOf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [main_recipe_build]=
, # Child: kernel config sub-build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
<br>
=C2=A0 =C2=A04. Set timestamps (seems optional ?)<br></blockquote><div><br>=
</div><div>Just make sure to use set_timestamp_now().</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Does that approach look correct to you, especially the use of ancestorOf<br=
>
and the new buildType?<br>
<br>
Below is an example of spdx snippet obtained with your suggestion:<br>
<br>
=C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;build_Build&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;spdxId&quot;: &quot;<a href=3D"http://spdx.org/s=
pdxdocs/linux-yocto-.../kernel-config" rel=3D"noreferrer" target=3D"_blank"=
>http://spdx.org/spdxdocs/linux-yocto-.../kernel-config</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;creationInfo&quot;: &quot;_:CreationInfo220&quot=
;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;build_buildType&quot;: &quot;kernel-configuratio=
n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;build_parameter&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;DictionaryEntry&=
quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;key&quot;: &quot;CONFIG_CC_VERSION=
_TEXT&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;value&quot;: &quot;x86_64-oe-linux=
-gcc (GCC) 13.3.0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
=C2=A0 =C2=A0 }<br>
<br>
&gt;=C2=A0 =C2=A0 Ideally, this would not live in spdx30_tasks.py, since it=
&#39;s highly<br>
&gt;=C2=A0 =C2=A0 specific to the kernel build and I really want to avoid p=
utting<br>
&gt;=C2=A0 =C2=A0 everyone&#39;s specific reporting requirements in the com=
mon code; they<br>
&gt;=C2=A0 =C2=A0 need to be more distributed than that (IMHO).<br>
<br>
I see your point about keeping spdx30_tasks.py free of recipe-specific<br>
logic, that makes sense from a long-term maintainability standpoint.<br>
<br>
That said, I have some doubts about creating a dedicated kernel-spdx.bbclas=
s<br>
just for handling this one case (the .config). It feels a bit heavy unless<=
br>
we expect additional kernel-specific SPDX processing in the future.<br></bl=
ockquote><div><br></div><div>IMHO, it would hopefully live in kernel.bbclas=
s and hook into the SPDX generation from there (see below). One could imagi=
ne similar things for meson.bbclass, cmake.bbclass et. al.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Would a lighter alternative be acceptable, keeping the<br>
kernel build injection behind SPDX_INCLUDE_KERNEL_CONFIG? It would keep<br>
the logic local without needing a new class.<br></blockquote><div><br></div=
><div>It needs the=C2=A0SPDX_INCLUDE_KERNEL_CONFIG regardless. One advantag=
e of being able to split this out would be that you could add the sub build=
s using a bbclass in your own layer if you wanted, which would make it more=
 flexible to incubate stuff like this in your own layer before moving to co=
re.</div><div><br></div><div>Unfortunately, I&#39;ve not had a chance to th=
ink about the best way to do this, so I&#39;m not exactly sure what makes s=
ense</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Curious what you&#39;d prefer here, I want to respect the layering without<=
br>
introducing more complexity than necessary.<br>
<br>
Cheers,<br>
<br>
--<br>
Kamel Bouhara, Bootlin<br>
Embedded Linux and kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000002bf2d7063a733344--

