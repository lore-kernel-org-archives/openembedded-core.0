Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7B5109E534
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 00:36:37 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37492.1774485396395830455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 17:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U1mxKANR;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-649278a69c5so423272d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 17:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774485395; cv=none;
        d=google.com; s=arc-20240605;
        b=gWrWROFfUh8PGCFcfOcrw0WT04JdcuZ3GGa5JljGmPDcn/AaucXUJ4cOFd8/622uvC
         I5T2tALHCYUyX/ZCIWbq6Y+iQ1vHzR36ap0Li47AcWQjKxWPLPmOOtd0ij1+/ipLnqdR
         FeWOa/ZMnPa+g3nNwVyII5pslKiXA77PUy+gmbwGT1YGV1fN1UHCvTE6BcjPwpjSnlNj
         TNfeZvHwHFYfhba8baY57ifQLOjSRYt4fUC/4umX/Cd96ngx4ZhL84mr1mWctMrOKK/z
         y/cVZnttvB2cR2DqZ2R4Y6Og+WOi+gWe62thhfqeAEI7kEWqYEBOHjRSEglfsfbz2S4p
         HQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iKAkCmOKGlUfzjJgstGCyo4VJl6pT2pXhaaeFpJMkEQ=;
        fh=nyLKS3RTbt37a6UzqnbqOAXHmGg17KkfDrkGD9NmF/o=;
        b=VvZuCBQbOLZfE6aOi/VosmPYmI91Hp5f8bNLLoYOX1ZzyzNcIQ4naBbPktKOjWtoeb
         ABeulMFPZ1oDuPJYaoCeU/dIfyRrqHlkPdCD4btN0VAWxuVfRGujaS8Ksnkc2rc+ppLV
         O4YCg6yhRCTLY2ovi+7fAueC9ji4XXrZEsHoN67cTE4m0xYnaRXhgyu5I2H/el7DBvF/
         sNXtzV5knkqQpd2HUmJIYAwI/W0uRCBJWJ4npKnKGz4enLGEyGH+BLgMXYfimLhJH1S8
         Tm5TTdh4liVvyBL+rgABmWeDoFWUFulyXsw0N7JXtsWCtI5f34UGkPWhXgzHYpdTCf2E
         P7ig==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774485395; x=1775090195; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iKAkCmOKGlUfzjJgstGCyo4VJl6pT2pXhaaeFpJMkEQ=;
        b=U1mxKANRVKQOO2/Lx8k8S0OFkScHvKldv7iyKZO0vlpIGjwX2wNTq9vdrjebzKUGRL
         zlgsQBogAGZpo/uwzOKXdyo9P597xBkE8KaQUI5cLx2ENtBvYokDwxQIhcKhduZPwY+I
         R3r42fS9unza0slku01fED+E2V9aSpt1C8koZ+81Z/2EASuJEBTahmxq52+Ev0+PnhhX
         7SjACGJEZyVgG1a43Xdt/4JBLTx5GJltQXwMgJcLDx/pneib0dApJKrZICX9WxfLs0/n
         qkLtBYw0cww7DQ+b2IcUrkqhi+lCKM9j/AFNRT0UvvwiQ0WFAyb/xeriGkxRCaGX7Euo
         Xh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774485395; x=1775090195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKAkCmOKGlUfzjJgstGCyo4VJl6pT2pXhaaeFpJMkEQ=;
        b=jE83CiRQpPkyDakQLTKabSYLphAg+vpADbjhpSL4BaMyE1Pd+xd3chAgA5GCEMTu55
         N4Vhj6eXTe4vs1OarWXOLYjhBMDBhBTAZO+4sK6XhdzsmKOQY7GlgTLM1XyWAgEHMCKL
         6pDmKJ4OP/SDz7KjTv3hrkq1BUKj1fk65YXtwoaV5q70J8WDzCQ/O78zmgSZLjABcg3a
         kGL/FOatAOSWMdGH6nUVbLAGgxW+dJSmyDLpz+iiThxzsMmZGWr7b8IDYgombsv1GPbU
         MgWjZVOoZ580Lc80+CqnmGpC7JPl4sCRU984gpclvp/RmvqFDjcpfV4O2QurcGBmGpNy
         zdiQ==
X-Gm-Message-State: AOJu0YzqZs7aFY3NP/2tZY9SAdO3I4yjez/TCtHyerNfBdsriCR/hyKG
	etLseqhV2MGhRTcXBHmeUINFap19NFpvNI8GVwDGIzt72SXdyjLIbshDCUgdMT2NimSYfPPJIWc
	PdSkROUCx4E0/0NJBPuM/DKNgkuaR6Ww=
X-Gm-Gg: ATEYQzxh8dqina3GGDgEN9dUx4HukG/OVNcEV4heYT81+Xl+r24sX8AMA+j7Te+SBgM
	49naLXfItKCR0CFHJv7eLh3ceSfdvhWrVqB90VwD9W7vFg3C5ExgYOPeUnXhb5co2vxQsim3Vjo
	5ngz3uynzOtiSqQG0UaayhZyRLnbDS5EA7HpSEI82DVjztdDbj3Q06NcthI5DiBhwgQLpr4nUSY
	uDgNwzVKtXpfM1J0ZZVNKtCDdn68hLIN7rrtwLSV+1fKRk8Vk3TlJldjKusd5jmb4H4seUBDn4q
	HGCyBTPJWAdz2RTukU1PUqxtPWyEJqEiD+B0HC/Mw7YjW+HlS+wkb3p9WO7+BZV/pwo7EU55NoW
	34t58CCVSZWXeZMJcc7oUf+G0e4g=
X-Received: by 2002:a53:d017:0:b0:64e:b638:aecc with SMTP id
 956f58d0204a3-64ee608e003mr5190234d50.20.1774485395395; Wed, 25 Mar 2026
 17:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260325163842.2672762-1-khem.raj@oss.qualcomm.com> <6864521c-ea84-48ba-ae36-c23ca6f68232@cherry.de>
In-Reply-To: <6864521c-ea84-48ba-ae36-c23ca6f68232@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Mar 2026 17:36:08 -0700
X-Gm-Features: AaiRm51v8FQxyQOhGR669wYD6HM_E1W9Nx_osPHV_qIMc3IUbLYCzu9Dr4Gt6XU
Message-ID: <CAMKF1spHxZZbS1ELTkU0gGRcDvYxe=KSVw0jK7z_6yA=e+Gr+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa-tools-native: Add dependency on
 libdrm-native for panfront tools
To: quentin.schulz@cherry.de
Cc: openembedded-core@lists.openembedded.org, 
	Changqing Li <changqing.li@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000a6d88a064de293bd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 00:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233940

--000000000000a6d88a064de293bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 10:00=E2=80=AFAM Quentin Schulz via lists.openembed=
ded.org
<quentin.schulz=3Dcherry.de@lists.openembedded.org> wrote:

> Hi Khem,
>
> On 3/25/26 5:38 PM, Khem Raj wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > Fix do_compile failure:
> > ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal
> error: xf86drm.h: No such file or directory
> >
>
> Hold on a second. In v1 you patched mesa-tools-native and I based the
> whole discussion on that but the error message is actually about target
> mesa? You also said in v1 you're building mesa-gl so the error message
> is also not related. The commit title also is wrong now as you're
> changing mesa.inc.
>
> What's actually going on. How do I reproduce? Also mesa-26.0.1 may be
> **before** mesa-tools-native was even introduced.
>
> The gallium PACKAGECONFIG should bring this dependency in. If vulkan is
> selected, libdrm will be a required dependency and it should fail the
> build if we don't find it and try to build Vulkan panfrost (panvk). I'm
> suspecting we need to add libdrm to vulkan PACKAGECONFIG but maybe it's
> not required for *all* drivers (though all vulkan drivers currently in
> mesa do seem to require it for some shared/static libs so maybe that's
> fine there).
>
> So we would only be missing this dependency for the panfrost (possibly
> others) tools. Then, this needs to be put in TOOLS_DEPS like I suggested
> in v1.
>
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Quentin Schulz <quentin.schulz@cherry.de>
> > ---
> >   meta/recipes-graphics/mesa/mesa.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> > index a95adfc960..ecd3b3780e 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -111,7 +111,7 @@ PACKAGECONFIG[imagination] =3D
> "-Dimagination-srv=3Dtrue,-Dimagination-srv=3Dfalse"
> >   PACKAGECONFIG[intel] =3D ""
> >   PACKAGECONFIG[lima] =3D ""
> >   PACKAGECONFIG[nouveau] =3D ""
> > -PACKAGECONFIG[panfrost] =3D ""
> > +PACKAGECONFIG[panfrost] =3D ",,libdrm-native"
>
> Also, I'm pretty sure it should be libdrm and not libdrm-native, as
> what's gonna happen when a user requests building the tools for a target
> package? It needs to be the same architecture as the one you're building
> for, hence not forced to native.
>

Well my build failure was in mesa-tools-native which is in chain of
dependencies for mesa-gl/mesa which tries to build panfrost-tools

../sources/mesa-26.0.2/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error:
xf86drm.h: No such file or directory
    7 | #include <xf86drm.h>
      |          ^~~~~~~~~~~

mesa is not built for opengl ( no-x11 no-wayland ) case with mali driver on
mesa-gl is used and that builds ok.


>
> Cheers,
> Quentin
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233929):
> https://lists.openembedded.org/g/openembedded-core/message/233929
> Mute This Topic: https://lists.openembedded.org/mt/118504425/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a6d88a064de293bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25,=
 2026 at 10:00=E2=80=AFAM Quentin Schulz via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;quentin.schulz=3D<a href=3D"mail=
to:cherry.de@lists.openembedded.org">cherry.de@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Khe=
m,<br>
<br>
On 3/25/26 5:38 PM, Khem Raj wrote:<br>
&gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" t=
arget=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; <br>
&gt; Fix do_compile failure:<br>
&gt; ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal er=
ror: xf86drm.h: No such file or directory<br>
&gt; <br>
<br>
Hold on a second. In v1 you patched mesa-tools-native and I based the <br>
whole discussion on that but the error message is actually about target <br=
>
mesa? You also said in v1 you&#39;re building mesa-gl so the error message =
<br>
is also not related. The commit title also is wrong now as you&#39;re <br>
changing mesa.inc.<br>
<br>
What&#39;s actually going on. How do I reproduce? Also mesa-26.0.1 may be <=
br>
**before** mesa-tools-native was even introduced.<br>
<br>
The gallium PACKAGECONFIG should bring this dependency in. If vulkan is <br=
>
selected, libdrm will be a required dependency and it should fail the <br>
build if we don&#39;t find it and try to build Vulkan panfrost (panvk). I&#=
39;m <br>
suspecting we need to add libdrm to vulkan PACKAGECONFIG but maybe it&#39;s=
 <br>
not required for *all* drivers (though all vulkan drivers currently in <br>
mesa do seem to require it for some shared/static libs so maybe that&#39;s =
<br>
fine there).<br>
<br>
So we would only be missing this dependency for the panfrost (possibly <br>
others) tools. Then, this needs to be put in TOOLS_DEPS like I suggested <b=
r>
in v1.<br>
<br>
&gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriv=
er.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@cherry.de" tar=
get=3D"_blank">quentin.schulz@cherry.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-graphics/mesa/mesa.inc | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc<br>
&gt; index a95adfc960..ecd3b3780e 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; @@ -111,7 +111,7 @@ PACKAGECONFIG[imagination] =3D &quot;-Dimagination=
-srv=3Dtrue,-Dimagination-srv=3Dfalse&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[intel] =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[lima] =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[nouveau] =3D &quot;&quot;<br>
&gt; -PACKAGECONFIG[panfrost] =3D &quot;&quot;<br>
&gt; +PACKAGECONFIG[panfrost] =3D &quot;,,libdrm-native&quot;<br>
<br>
Also, I&#39;m pretty sure it should be libdrm and not libdrm-native, as <br=
>
what&#39;s gonna happen when a user requests building the tools for a targe=
t <br>
package? It needs to be the same architecture as the one you&#39;re buildin=
g <br>
for, hence not forced to native.<br></blockquote><div><br></div><div>Well m=
y build failure was in mesa-tools-native which is in chain of dependencies =
for mesa-gl/mesa which tries to build panfrost-tools</div><div><br></div>..=
/sources/mesa-26.0.2/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error: xf=
86drm.h: No such file or directory<br>=C2=A0 =C2=A0 7 | #include &lt;xf86dr=
m.h&gt;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~=
~~~~<br><div>=C2=A0</div><div>mesa is not built for opengl ( no-x11 no-wayl=
and ) case with mali driver on mesa-gl is used and that builds ok.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
Quentin<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233929): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233929" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233929</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118504425/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118504425/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a6d88a064de293bd--

