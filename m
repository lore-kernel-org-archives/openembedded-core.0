Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB419C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 21:09:07 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.5728.1749762540293212732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 14:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=WU3NYpwF;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.171, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e5599b795so13815807b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 14:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749762539; x=1750367339; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EY/+LJWCswTkdWFmQe74u7AXdJaxCoT47kJbXKbXz4c=;
        b=WU3NYpwFYDBh2Gt1NB7XtaC8ScT+Qxz29Em5Up1HZnzbmBTF+IFC7dCzJdkPpD/DW9
         2ujwJkGI79feABdC2L2t/fLPr4jSsjENhZc4qfZIy2i2hXZTc+z1ga3K0cE5ERI6IKvI
         an9k4zf4Wrtu8dkLHDOaxK0noy32NJzsex4snqD40TG45823xlBnlsA6Vo836rODST3x
         ThbdvRSgpoq/OlEVlRIWJ+m0qdq73JAeCZHCfelKP8dNUHOxfH6xaxtt0nBx+GAgo0Gu
         RqpiMBOya/QgzwKo+t+I8Rux0YPYeZVaqrY+XeqevxL5K68D8pXFAE26JVA8vd1Xg6Xr
         vMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749762539; x=1750367339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EY/+LJWCswTkdWFmQe74u7AXdJaxCoT47kJbXKbXz4c=;
        b=ocXiYtwb2fjwTFzpzN9nLk3ne9Mi0zXuAWMMOe22okW7x0ggTmpJybLr8sfuVadRfF
         UyE6DAql8kpL1Mwi7oj44VyZ+P7f/J7tOxFob8ekioHDyUnIBOBiLBTX8qm9H/Edn6Px
         EayNI6nA/DpW4uzR+BHZ73SE6FDpCcjWsYb9CKQi1ebr2f13Cn9nQjbeAx8dVFW7PUQ2
         VMhnDPJbtUwD9AitgHJsYEwayuBu8MRxT8qPz1aNbUH107PRYsCYv8fyPQYf0ia2hv4S
         DpQzWnF7UIyGXuuH2Dqs4XtuCZxYToKA4Q5OXlpWzkpIrmgcbQl0R4zxW95TmHkIgwBG
         1xcQ==
X-Gm-Message-State: AOJu0Ywi47jNnlBvwoYgISOTkIKruzbU3y/4GEmpJ6txmio6kf+tXjV1
	Ou4Dt4hBB3qGV4HbVSvq1C0yEScVsVj7HO7WRS+IIihT6iytnlBmXCOZE1Mk0ugaG3AjlqaWDnT
	AJGEeIBPJUPMTk5MOQ6C52yJ3zxVEJGyVmTrpMrD6KQ==
X-Gm-Gg: ASbGncuYoscsmNnfhenKoSc2DjdymwajXx7lzDn6+QO3/ZAKuncYGwJMiiROC9xcunb
	8MCIRmdQzwTmlDDjWGCtt8opW/Cb8NhDAASUfSAbMuFIXgQOQLaOqShZC+85vUmUh3wo38GXH/o
	u53CYm8EfVSeaMACcIG1JprfDJj6bmk4pGNF9sHMniPNjMHA==
X-Google-Smtp-Source: AGHT+IExFXYLuQsVTaOEkrXjmUbIo4E2aiFjitR7NjDTSd9tAqdjZgj+WFjtWeXOfkw4f0fb1+U4jhUODeZADReWuHI=
X-Received: by 2002:a05:690c:ed4:b0:70e:17ec:ce52 with SMTP id
 00721157ae682-7116374f5demr14240007b3.26.1749762539419; Thu, 12 Jun 2025
 14:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250611153319.54778-1-anibal@limonsoftware.com> <20250612210252.GA4509@localhost>
In-Reply-To: <20250612210252.GA4509@localhost>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Thu, 12 Jun 2025 15:08:47 -0600
X-Gm-Features: AX0GCFtHBngqPNp5-5aULBYUicnVlbSIPkuUUZLa7QkD8q42lJExCcea1HUslGg
Message-ID: <CAOU5ZMvEc=ABgUwHxXUmwQdWdbp9rDWArPWZLB+o7Ors53tr2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] wic: pluginbase workaround on invalid
 module filenames
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, Ross.Burton@arm.com, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="0000000000009a94e306376656f3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 21:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218538

--0000000000009a94e306376656f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 3:02=E2=80=AFPM Trevor Woerner <twoerner@gmail.com>=
 wrote:

> On Wed 2025-06-11 @ 03:33:17 PM, Anibal Limon via lists.openembedded.org
> wrote:
> > Apply a workaround on invalid identifiers replace '-' to '_' to load
> > the module with valid identifier.
> >
> > Let the user know (warning) about plugin doesn't has a valid module
> > identifier to encourage fix, it gives time before rename oe-core wic
> > plugins and drop workaround.
>
> As far as I'm aware, everything in wic currently works, despite these bad
> names. I'm curious to find out what your use-case is that prompted this
> patch.
> Are you hoping to use these plugins with another tool?
>

Is to enable extending wic plugins in other layers, see for example
meta-virtualization
code to enable import, removed after this fix.

https://lists.yoctoproject.org/g/meta-virtualization/message/9240?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2Cwic%2C20%2C2%2C0%2C112618356

Regards!,
Anibal



>
> > Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> > ---
> >  scripts/lib/wic/pluginbase.py | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/lib/wic/pluginbase.py
> b/scripts/lib/wic/pluginbase.py
> > index b64568339b..ec515229e7 100644
> > --- a/scripts/lib/wic/pluginbase.py
> > +++ b/scripts/lib/wic/pluginbase.py
> > @@ -8,6 +8,7 @@
> >  __all__ =3D ['ImagerPlugin', 'SourcePlugin']
> >
> >  import os
> > +import sys
> >  import logging
> >  import types
> >
> > @@ -20,7 +21,8 @@ from wic.misc import get_bitbake_var
> >
> >  PLUGIN_TYPES =3D ["imager", "source"]
> >
> > -SCRIPTS_PLUGIN_DIR =3D ["scripts/lib/wic/plugins", "lib/wic/plugins"]
> > +SCRIPTS_PLUGIN_WIC_DIR =3D "wic/plugins"
> > +SCRIPTS_PLUGIN_BASE_DIR =3D ["scripts/lib", "lib"]
> >
> >  logger =3D logging.getLogger('wic')
> >
> > @@ -40,7 +42,9 @@ class PluginMgr:
> >              cls._plugin_dirs =3D [os.path.join(os.path.dirname(__file_=
_),
> 'plugins')]
> >              layers =3D get_bitbake_var("BBLAYERS") or ''
> >              for layer_path in layers.split():
> > -                for script_plugin_dir in SCRIPTS_PLUGIN_DIR:
> > +                for script_plugin_base_dir in SCRIPTS_PLUGIN_BASE_DIR:
> > +                    script_plugin_dir =3D
> os.path.join(script_plugin_base_dir,
> > +
>  SCRIPTS_PLUGIN_WIC_DIR);
> >                      path =3D os.path.join(layer_path, script_plugin_di=
r)
> >                      path =3D os.path.abspath(os.path.expanduser(path))
> >                      if path not in cls._plugin_dirs and
> os.path.isdir(path):
> > @@ -53,13 +57,26 @@ class PluginMgr:
> >                  if os.path.isdir(ppath):
> >                      for fname in os.listdir(ppath):
> >                          if fname.endswith('.py'):
> > -                            mname =3D fname[:-3]
> >                              mpath =3D os.path.join(ppath, fname)
> > +                            # If module doesn't have a valid identifie=
r
> let the
> > +                            # user know and apply a workaround
> replacing '-'
> > +                            # with '_' to load module with valid
> identifier.
> > +                            mname =3D fname[:-3]
> > +                            if not mname.isidentifier():
> > +                                logger.warn("invalid identifier at
> plugin module"\
> > +                                            " %s, please fix it.",
> mpath)
> > +                                mname =3D mname.replace("-", "_")
>
> There are several ways that a module name could be incorrect in addition =
to
> using dashes (upper vs lower case, periods, etc), and I believe runs of
> dashes/dots/underscores are to be replaced with a single underscore:
>
> https://packaging.python.org/en/latest/specifications/name-normalization/=
#name-normalization
>
> So if we do move forward with this, maybe it should be expanded to includ=
e
> all
> the cases.
>
> > +
> >                              logger.debug("loading plugin module %s",
> mpath)
> > -                            spec =3D
> importlib.util.spec_from_file_location(mname, mpath)
> > +                            spec =3D
> importlib.util.spec_from_file_location(
> > +                                     mname, mpath)
> >                              module =3D
> importlib.util.module_from_spec(spec)
> >                              spec.loader.exec_module(module)
> >
> > +                            cname =3D os.path.join(SCRIPTS_PLUGIN_WIC_=
DIR,
> > +                                                 ptype,
> mname).replace('/', '.')
> > +                            sys.modules[cname] =3D module
> > +
> >          return PLUGINS.get(ptype)
> >
> >  class PluginMeta(type):
> > --
> > 2.39.5
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#218458):
> https://lists.openembedded.org/g/openembedded-core/message/218458
> > Mute This Topic: https://lists.openembedded.org/mt/113590717/900817
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> twoerner@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--0000000000009a94e306376656f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 12,=
 2025 at 3:02=E2=80=AFPM Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmai=
l.com">twoerner@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Wed 2025-06-11 @ 03:33:17 PM, Anibal Limon via =
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Apply a workaround on invalid identifiers replace &#39;-&#39; to &#39;=
_&#39; to load<br>
&gt; the module with valid identifier.<br>
&gt; <br>
&gt; Let the user know (warning) about plugin doesn&#39;t has a valid modul=
e<br>
&gt; identifier to encourage fix, it gives time before rename oe-core wic<b=
r>
&gt; plugins and drop workaround.<br>
<br>
As far as I&#39;m aware, everything in wic currently works, despite these b=
ad<br>
names. I&#39;m curious to find out what your use-case is that prompted this=
 patch.<br>
Are you hoping to use these plugins with another tool?<br></blockquote><div=
><br></div><div>Is to enable=C2=A0extending wic plugins in other layers, se=
e for example meta-virtualization</div><div>code to enable import, removed =
after this fix.</div><div><br></div><div><a href=3D"https://lists.yoctoproj=
ect.org/g/meta-virtualization/message/9240?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3=
Acreated%2C%2Cwic%2C20%2C2%2C0%2C112618356">https://lists.yoctoproject.org/=
g/meta-virtualization/message/9240?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated=
%2C%2Cwic%2C20%2C2%2C0%2C112618356</a></div><div><br></div><div>Regards!,</=
div><div>Anibal</div><div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware=
.com" target=3D"_blank">anibal@limonsoftware.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/lib/wic/pluginbase.py | 25 +++++++++++++++++++++----<br>
&gt;=C2=A0 1 file changed, 21 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbas=
e.py<br>
&gt; index b64568339b..ec515229e7 100644<br>
&gt; --- a/scripts/lib/wic/pluginbase.py<br>
&gt; +++ b/scripts/lib/wic/pluginbase.py<br>
&gt; @@ -8,6 +8,7 @@<br>
&gt;=C2=A0 __all__ =3D [&#39;ImagerPlugin&#39;, &#39;SourcePlugin&#39;]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 import os<br>
&gt; +import sys<br>
&gt;=C2=A0 import logging<br>
&gt;=C2=A0 import types<br>
&gt;=C2=A0 <br>
&gt; @@ -20,7 +21,8 @@ from wic.misc import get_bitbake_var<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PLUGIN_TYPES =3D [&quot;imager&quot;, &quot;source&quot;]<br>
&gt;=C2=A0 <br>
&gt; -SCRIPTS_PLUGIN_DIR =3D [&quot;scripts/lib/wic/plugins&quot;, &quot;li=
b/wic/plugins&quot;]<br>
&gt; +SCRIPTS_PLUGIN_WIC_DIR =3D &quot;wic/plugins&quot;<br>
&gt; +SCRIPTS_PLUGIN_BASE_DIR =3D [&quot;scripts/lib&quot;, &quot;lib&quot;=
]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 logger =3D logging.getLogger(&#39;wic&#39;)<br>
&gt;=C2=A0 <br>
&gt; @@ -40,7 +42,9 @@ class PluginMgr:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls._plugin_dirs =3D [=
os.path.join(os.path.dirname(__file__), &#39;plugins&#39;)]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 layers =3D get_bitbake=
_var(&quot;BBLAYERS&quot;) or &#39;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for layer_path in laye=
rs.split():<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for script_pl=
ugin_dir in SCRIPTS_PLUGIN_DIR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for script_pl=
ugin_base_dir in SCRIPTS_PLUGIN_BASE_DIR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 script_plugin_dir =3D os.path.join(script_plugin_base_dir,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SCRIPTS_PLUGIN_WIC_DIR);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 path =3D os.path.join(layer_path, script_plugin_dir)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 path =3D os.path.abspath(os.path.expanduser(path))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if path not in cls._plugin_dirs and os.path.isdir(path):<br>
&gt; @@ -53,13 +57,26 @@ class PluginMgr:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.pa=
th.isdir(ppath):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for fname in os.listdir(ppath):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if fname.endswith(&#39;.py&#39;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mname =3D fname[:-3]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mpath =3D os.path.join(ppath, fname)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If module doesn&#39;t have a valid identifie=
r let the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # user know and apply a workaround replacing &=
#39;-&#39; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # with &#39;_&#39; to load module with valid i=
dentifier.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mname =3D fname[:-3]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not mname.isidentifier():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warn(&quot;invalid identi=
fier at plugin module&quot;\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot; %s, please fix it.&quot;, mpath)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mname =3D mname.replace(&quot;-&=
quot;, &quot;_&quot;)<br>
<br>
There are several ways that a module name could be incorrect in addition to=
<br>
using dashes (upper vs lower case, periods, etc), and I believe runs of<br>
dashes/dots/underscores are to be replaced with a single underscore:<br>
<a href=3D"https://packaging.python.org/en/latest/specifications/name-norma=
lization/#name-normalization" rel=3D"noreferrer" target=3D"_blank">https://=
packaging.python.org/en/latest/specifications/name-normalization/#name-norm=
alization</a><br>
<br>
So if we do move forward with this, maybe it should be expanded to include =
all<br>
the cases.<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;loading plugin module=
 %s&quot;, mpath)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec =3D importlib.util.spec_from_file_locatio=
n(mname, mpath)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec =3D importlib.util.spec_from_file_locatio=
n(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mname, mpath=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module =3D importlib.util.module_from_sp=
ec(spec)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spec.loader.exec_module(module)<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cname =3D os.path.join(SCRIPTS_PLUGIN_WIC_DIR,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptype, mname).replace(&#39;/&#39;, &#39;.&#3=
9;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.modules[cname] =3D module<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PLUGINS.get(ptype)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 class PluginMeta(type):<br>
&gt; -- <br>
&gt; 2.39.5<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#218458): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/218458" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/218458</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11359071=
7/900817" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/113590717/900817</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:twoerner@gmail.com" t=
arget=3D"_blank">twoerner@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000009a94e306376656f3--

