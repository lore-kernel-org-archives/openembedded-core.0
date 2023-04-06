Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8B4C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 07:26:43 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.152945.1680765994458429811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 00:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MiIsxJx6;
 spf=pass (domain: linaro.org, ip: 209.85.219.178, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f178.google.com with SMTP id f188so26768366ybb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 00:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680765993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cGq3g3WOx7Lu57q8VLG6Pqy+ltdUktcjatlGM9DobJw=;
        b=MiIsxJx6lf49zZKUiOPIjGxjzte5OlV8iP/4xQQ0joNK7KmGuH6uNJ/XvkGRZ/mMv5
         tuaBEuoKob69XSaYhlOjzbitmJO8ieoN6zTIfN3En1T5Erw8uSvLDxoHCm4mgbFBN5Xm
         29k0sVCygnytABpTfLxqE4Sbatk7fcSAlguYSNYfPqICrSW69ottbql4A97RFyzh/9jy
         QWLvzqyC61aqGtaDahhdwfRjimnyJr7xsGKs1uapaX9j51cVrqKGSIJL+SVJham/ZnMu
         j6K/RV8pGUHrQgCvihEto7G/oKBBODJo+wC/tp9nZ9l45exdNLClzviu2FIDkNAVQulq
         Ji0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680765993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGq3g3WOx7Lu57q8VLG6Pqy+ltdUktcjatlGM9DobJw=;
        b=i32HlC1WdT7UWErg7zgLih0JpX4Vr4Py6dzO+DLv/XMSVvOW2TrunokE9vUcuHMsM+
         nt89TBYdMBssZBOzEQcJworpMXj6QSGUjih6UjVp5Yq+aqf3a0gXuujNSndYB7C9Nb2K
         05AIQF1fmemqxoKZok/v/POnly0npX12Lt8AWDjtcwjrQxkiE4rAjNQJGqTypPR+8BST
         hy+P9iVLfeCft8cnJzjRpCkjqNS5sbco85U/TaPRxLLXH0QZ4tPUJ7bEU8MDXCPdrGUP
         7nxrJ1ft7QaFeUMlICjLt3vTsF4BlLKc4PdOmhPw5KH9CR9vJCjczZUSHxT+1PniDWTO
         ZpBw==
X-Gm-Message-State: AAQBX9dVZK7kxiwb9SLvio+Ri+QZboEuzJHI7xS0DrNLBw+LKEy4wyop
	KIXxhA2+jqV/L4sdHsaOVFoVFnZF3GGLLJTDTdUhJQ==
X-Google-Smtp-Source: AKy350YLd6x3UOZDVOOv3y/UkdCO3coPZyvBsdmAb2Vo3NXFIPAqtzNtELlyBipKPeMNzkZvTN5fTxy0eYlp3iPlLYo=
X-Received: by 2002:a25:d2c7:0:b0:ad2:3839:f49 with SMTP id
 j190-20020a25d2c7000000b00ad238390f49mr1419705ybg.5.1680765993408; Thu, 06
 Apr 2023 00:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230404213605.170461-1-marex@denx.de> <CAP71WjyQOZNY5bnDkN33_nCfv8R3MBVb+MGDX1A1F+Jfg-m3_g@mail.gmail.com>
 <4868dfb7-b70d-ad1a-6107-1b95e918660e@denx.de>
In-Reply-To: <4868dfb7-b70d-ad1a-6107-1b95e918660e@denx.de>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 6 Apr 2023 09:26:22 +0200
Message-ID: <CAP71Wjyg56cyDjw9pABbthgXupaMW_NY=YJH8x2BHVqDZOAo8w@mail.gmail.com>
Subject: Re: [PATCH] yocto-check-layer: scan additional layers for tested
 layer dependencies
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000fcf49605f8a5d3ec"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 07:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179756

--000000000000fcf49605f8a5d3ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 5, 2023 at 2:29=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> On 4/5/23 08:48, Nicolas Dechesne wrote:
> > On Tue, Apr 4, 2023 at 11:36=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> >
> >> In case a LAYERDEPENDS of a tested layer contains a dependency which i=
s
> >> present in additional layers, such dependency does not get pulled into
> >> the layer test as a dependency be default and instead of YCL stops and
> >> reports it cannot find dependent layers.
> >>
> >
> > Hmm. I know this script is slightly (!) convoluted.
>
> Well ... yes.
>
> > But I think this is done 'by design'. Since you are expected to list al=
l
> > your dependencies with --dependency when you are testing a layer.
>
> I am not sure that is correct. I believe the script is designed to
> attempt to look up the dependencies of a layer automatically. That is
> what the --additional-layers parameter is for, to specify the search
> paths for the automatic layer dependency lookup. The --dependency is
> there to hard-include a layer in the test, e.g. in case it cannot be
> automatically detected because that dependency (layer) is somehow not
> resolvable.
>
> At least that is my understanding.
>

I don't think it's right. --dependency holds the list of all layers that
can potentially be a dependency. So yes, YCL is designed to search all
dependencies automatically, but it is looking for them in the list of
layers from --dependency (the list of layers to test is also added in the
list of 'potential' dependencies).
So up to now, the script is designed to search for dependencies only there.
With your change you are trying to search for dependencies in layers
provided in --additional-layers too.

Layers in --dependencies are not 'hard included' in the test. only if they
are effectively a dependency of a tested layer.


>
> And the result then is, you can have a directory with various layers,
> but the YCL with --additional-layers pointed into that directory will
> only pick the layers which are really required for validation of that
> tested layer, not the rest of them layers in that directory, which makes
> YCL runtime shorter . And that way, YCL can be used to test multiple
> arbitrary layers, which is useful in CI.
>

On the opposite, layers from --additional-layers are 'hard included' in the
build, as per the commit message mentioned in my previous response.


> >> An example of this is a layer with LAYERDEPENDS =3D " core
> openembedded-core
> >> "
> >> and then by running YCL on such layer using the following invocation:
> >> $ yocto-check-layer -d --additional-layers ../meta-openembedded/ --
> >> ../meta-board-distro
> >>
> >
> > In this specific example, you are supposed to use --dependency
> > ../meta-openembedded instead of --additional-layers, no?
>
> I don't think so, the YCL should auto-lookup and auto-add the layers
> into dependencies from --additional-layers. That is my understanding of
> what --additional-layers is for, to do the auto-lookup/auto-add without
> having to explicitly list the dependencies on command line.
>

No, this code :

        missing_dependencies =3D not add_layer_dependencies(bblayersconf,
layer, dep_layers, logger)
        if not missing_dependencies:
            for additional_layer in additional_layers:
                if not add_layer_dependencies(bblayersconf,
additional_layer, dep_layers, logger):
                    missing_dependencies =3D True
                    break

is adding layers from --additional-layers, unconditionally, assuming all
dependencies from the 'layer' to test and from the 'additional-layer' are
found in the layers listed in --dependency.

So effectively, dependencies are only searched in --dependencies. I am not
saying it is the right thing and should stay like that, but it's the
current semantic of the 'api'.


>
> > --additional-layers (see 31e53430f1bb6f73b82698b20ef7f1047313214a) is
> > supposed to bring extra layers when parsing/testing to mimic a full
> distro
> > or to manually force optional layers to be present. But --dependency is
> > still required to contain all potential dependencies.
>
> Errr, uhhh.
>
> That is really weird, the first question which comes to my mind
> regarding that commit message is -- why not use --dependency to cover
> those use cases listed in the commit message.
>

layers in --dependency are *not* added into the build, unless they are
found to be an actual dependency of a layer which is added to the build.


>
> The second question which comes to my mind is, why does the
> additional-layers do automatic layer look up (based on LAYERDEPENDS) in
> the specified additional-layer directories, but then fails to actually
> add those layers into the build during the test (I think maybe that is
> what I am solving with this patch, without describing it well).
>

I am assuming you are refering to line 191 here, e.g.

                if not add_layer_dependencies(bblayersconf,
additional_layer, dep_layers, logger):
                    missing_dependencies =3D True
                    break

Here we are searching for dependencies of the additional layer in order to
pull them into the build, which makes sense.


>
> Well that turned out to be a wall of text too, sigh ...
>

--000000000000fcf49605f8a5d3ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 5, 2023 at 2:29=E2=80=AFP=
M Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 4/5/23 0=
8:48, Nicolas Dechesne wrote:<br>
&gt; On Tue, Apr 4, 2023 at 11:36=E2=80=AFPM Marek Vasut &lt;<a href=3D"mai=
lto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; In case a LAYERDEPENDS of a tested layer contains a dependency whi=
ch is<br>
&gt;&gt; present in additional layers, such dependency does not get pulled =
into<br>
&gt;&gt; the layer test as a dependency be default and instead of YCL stops=
 and<br>
&gt;&gt; reports it cannot find dependent layers.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Hmm. I know this script is slightly (!) convoluted.<br>
<br>
Well ... yes.<br>
<br>
&gt; But I think this is done &#39;by design&#39;. Since you are expected t=
o list all<br>
&gt; your dependencies with --dependency when you are testing a layer.<br>
<br>
I am not sure that is correct. I believe the script is designed to <br>
attempt to look up the dependencies of a layer automatically. That is <br>
what the --additional-layers parameter is for, to specify the search <br>
paths for the automatic layer dependency lookup. The --dependency is <br>
there to hard-include a layer in the test, e.g. in case it cannot be <br>
automatically detected because that dependency (layer) is somehow not <br>
resolvable.<br>
<br>
At least that is my understanding.<br></blockquote><div><br></div><div>I do=
n&#39;t think it&#39;s right. --dependency holds the list of all layers tha=
t can potentially be a dependency. So yes, YCL is designed to search all de=
pendencies automatically, but it is looking for them in the list of layers =
from --dependency (the list of layers to test is also added in the list of =
&#39;potential&#39; dependencies).=C2=A0</div><div>So up to now, the script=
 is designed to search for dependencies only there. With your change you ar=
e trying to search for dependencies in layers provided in --additional-laye=
rs too.=C2=A0</div><div><br></div><div>Layers in --dependencies are not &#3=
9;hard included&#39; in the test. only if they are effectively a dependency=
 of a tested layer.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
And the result then is, you can have a directory with various layers, <br>
but the YCL with --additional-layers pointed into that directory will <br>
only pick the layers which are really required for validation of that <br>
tested layer, not the rest of them layers in that directory, which makes <b=
r>
YCL runtime shorter . And that way, YCL can be used to test multiple <br>
arbitrary layers, which is useful in CI.<br></blockquote><div><br></div><di=
v>On the opposite, layers from --additional-layers are &#39;hard included&#=
39; in the build, as per the commit message mentioned in my previous respon=
se.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt; An example of this is a layer with LAYERDEPENDS =3D &quot; core op=
enembedded-core<br>
&gt;&gt; &quot;<br>
&gt;&gt; and then by running YCL on such layer using the following invocati=
on:<br>
&gt;&gt; $ yocto-check-layer -d --additional-layers ../meta-openembedded/ -=
-<br>
&gt;&gt; ../meta-board-distro<br>
&gt;&gt;<br>
&gt; <br>
&gt; In this specific example, you are supposed to use --dependency<br>
&gt; ../meta-openembedded instead of --additional-layers, no?<br>
<br>
I don&#39;t think so, the YCL should auto-lookup and auto-add the layers <b=
r>
into dependencies from --additional-layers. That is my understanding of <br=
>
what --additional-layers is for, to do the auto-lookup/auto-add without <br=
>
having to explicitly list the dependencies on command line.<br></blockquote=
><div><br></div><div>No, this code :=C2=A0</div><div><br></div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 missing_dependencies =3D not add_layer_dependencies(bblay=
ersconf, layer, dep_layers, logger)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not m=
issing_dependencies:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for addit=
ional_layer in additional_layers:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if not add_layer_dependencies(bblayersconf, additional_la=
yer, dep_layers, logger):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 missing_dependencies =3D True<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br><div><br></di=
v><div>is adding layers from --additional-layers, unconditionally, assuming=
 all dependencies from the &#39;layer&#39; to test and from the &#39;additi=
onal-layer&#39; are found in the layers listed in --dependency.=C2=A0</div>=
<div><br></div><div>So effectively, dependencies are only searched in --dep=
endencies. I am not saying it is the right thing and should stay like that,=
 but it&#39;s the current semantic of the &#39;api&#39;.=C2=A0</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; --additional-layers (see 31e53430f1bb6f73b82698b20ef7f1047313214a) is<=
br>
&gt; supposed to bring extra layers when parsing/testing to mimic a full di=
stro<br>
&gt; or to manually force optional layers to be present. But --dependency i=
s<br>
&gt; still required to contain all potential dependencies.<br>
<br>
Errr, uhhh.<br>
<br>
That is really weird, the first question which comes to my mind <br>
regarding that commit message is -- why not use --dependency to cover <br>
those use cases listed in the commit message.<br></blockquote><div><br></di=
v><div>layers in --dependency are *not* added into the build, unless they a=
re found to be an actual dependency of a layer which is added to the build.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The second question which comes to my mind is, why does the <br>
additional-layers do automatic layer look up (based on LAYERDEPENDS) in <br=
>
the specified additional-layer directories, but then fails to actually <br>
add those layers into the build during the test (I think maybe that is <br>
what I am solving with this patch, without describing it well).<br></blockq=
uote><div><br></div><div>I am assuming you are refering to line 191 here, e=
.g.=C2=A0</div><div><br></div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if not add_layer_dependencies(bblayersconf, additional_layer, de=
p_layers, logger):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 missing_dependencies =3D True<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br><div><br></div><div>=
Here we are searching for dependencies of the additional layer in order to =
pull them into the build, which makes sense.=C2=A0</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Well that turned out to be a wall of text too, sigh ...<br>
</blockquote></div></div>

--000000000000fcf49605f8a5d3ec--

