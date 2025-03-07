Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7349C282DE
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:54:39 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.11346.1741355676353688837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4dbAGCS;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so2510381a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 05:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741355676; x=1741960476; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f0vQlapHkSKeHmMJ3Jfu6qaNsZTrmHaFKTVyB2dZzB8=;
        b=m4dbAGCSdRYL1529mUsjXdIHU5AGvGwt9nh+5Ew3NuB692nYfrYEKWfQ3QB9pyLsKX
         hWFVc1+GYgXpD2TJMryWFq+lUZl74png0tv0VM0LAl00DMxOgqGzzIpwcqqJIYW7jrgX
         GL5Ab6cjM3DI7arZSIvRPBmAu7/OODGt+wQfECcZG14pdQyraPy9jdSUrpTU6Yay82Y5
         TECWEm6drMRETPqP51p3/K6B0zj6ArLCAPPU63f9rhUIV0dGYmQJ30VYAjalCQHpkBvr
         pU21vNpve3wJZiHFnA2BalQ7kSa6tTNh1eGfkm9FNQcQ5TJxXFGyRr8lh8R/yecmyblX
         EAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741355676; x=1741960476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0vQlapHkSKeHmMJ3Jfu6qaNsZTrmHaFKTVyB2dZzB8=;
        b=J9OCFcOEPfBQPucta62ZrWAOI3okEcFBrYa3Y3QgvGUny6KDcOIj2Aoe0Fed3M6jij
         j75Z4k/IvYeQJqR11khpvu9/gUn7NLQTvpDVQIAgydaTfIg7+sPrczOA4CLr+PE0L2RU
         vX+UupgUOJfUMFmVVelICNWj36QLGh+5hmepwsMiaPS58eOfwz4oTAUnShq5T93wXWiB
         XSxFTdrtvrMV0s/vTDVfE5hWrulJdbJQA4Fs75DiLYPymKuHKTpplEFUlPs12X5YfWQH
         I1eAClwVkQ2EzpvN2QrxzQtg82SL3451fqNFMQfyt90/elWlaeMFudG64P+JHaZX2534
         iM9g==
X-Gm-Message-State: AOJu0Yxdb00vmoom2dh/Gk7+7PenFgH/6AXV6jBuEA6hVDK59uaUifMD
	rCeoF1pEkcUINnBd07m7HqVAxw95N3hkxqRX5B2KEDk92cio7uOsuW89brhEPbi1Zzwr9bCRv93
	NXEnlLe+HdXXDpeguiK5SKjZAzgU=
X-Gm-Gg: ASbGnctfsXrgq4uDEQ9JUsteaF1Nuaga127MKnC6BmjX9eadsP4vDd9B3MvQG60YlsF
	yzSSCWW9+FBhQs6uLVZIFOyqEfyhfPB35t68f+Guqv/u5CsR3bomseaY25Ghscjoo9bz0BcEnBt
	Yc+CDj7B2rXVhNyVqamQo+LkxkyA==
X-Google-Smtp-Source: AGHT+IH8I0cdQZdS9SiLCEs6J2pS/dt++W79nem4HDmMrwLbXFbXHEd2dUa5wlt8T7aySfGQfRWNf3Brv50kVoMLMXM=
X-Received: by 2002:a17:90b:1dce:b0:2ee:d63f:d8f with SMTP id
 98e67ed59e1d1-2ff7ce8e739mr5451459a91.13.1741355675495; Fri, 07 Mar 2025
 05:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20250306-qa_kernel-v1-1-e83431c29799@syslinbit.com>
 <CADkTA4ObLCgE_Ra9QoxYSJXYE-Wb8L3VVZ8B9j3jv9=XszxKug@mail.gmail.com> <6209fffe-ae60-4379-b991-9ac6c1bafde3@syslinbit.com>
In-Reply-To: <6209fffe-ae60-4379-b991-9ac6c1bafde3@syslinbit.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 7 Mar 2025 08:54:23 -0500
X-Gm-Features: AQ5f1JqQuV_7RsyMQQdeL9qwoXD1quHe2zYZHDOh8kMfNkUJZXk8KCX0lbd1v3c
Message-ID: <CADkTA4PkHWUKZ-WTzOZP4vmTtsyMSay9AZAb9nERRckJ3maA2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/kernel: add QA to check required or
 forbidden kernel configs
To: Louis Rannou <louis.rannou@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org, pascal.eberhard@se.com, 
	Louis Rannou <louis.rannou@non.se.com>
Content-Type: multipart/alternative; boundary="00000000000077370f062fc0f686"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212437

--00000000000077370f062fc0f686
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 2:45=E2=80=AFAM Louis Rannou <louis.rannou@syslinbit=
.com>
wrote:

>
>
> On 06/03/2025 16:36, Bruce Ashfield wrote:
> >
> >
> > On Thu, Mar 6, 2025 at 10:04=E2=80=AFAM Louis Rannou via lists.openembe=
dded.org
> > <http://lists.openembedded.org>
> > <louis.rannou=3Dsyslinbit.com@lists.openembedded.org
> > <mailto:syslinbit.com@lists.openembedded.org>> wrote:
> >
> >     From: Louis Rannou <louis.rannou@non.se.com
> >     <mailto:louis.rannou@non.se.com>>
> >
> >     Add a QARECIPETEST kernel-config to the kernel to check the kernel
> >     config has
> >     set (or unset) config listed in variables QA_KERNEL_CONFIGS_REQUIRE=
D
> (or
> >     QA_KERNEL_CONFIGS_FORBIDDEN).
> >
> >
> > We already have audit tools that can do this, the approach of opening
> > the .config, iterating and then hard binding ourselves to the very
> specific
> > kernel configuration names has been considered and rejected many
> > times.
> >
> > What exactly isn't working with the already supported mechanism ?
>
> My ignorance I suppose. I didn't know about the audit phase and
> kernel-cache. I guess I have to read the doc...
>

If it doesn't work for your use case, or is otherwise causing issues, let
me know and I'll make changes as required.

I've taken a note to pull together a short presentation on this, as more
documentation/examples can only be a good thing.

Cheers,

Bruce



>
> Louis
>
> >
> > Bruce
> >
> >     Signed-off-by: Louis Rannou <louis.rannou@non.se.com
> >     <mailto:louis.rannou@non.se.com>>
> >     ---
> >       meta/classes-recipe/kernel.bbclass | 38 +++++++++++++++++++++++++=
+
> >     ++++++++++++
> >       1 file changed, 38 insertions(+)
> >
> >     diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-
> >     recipe/kernel.bbclass
> >     index
> >
>  64a685a964dab942db05b8d9e08cc22a3bbb152e..4a82b84d479667bf4a6e64ad3e99d9=
34c6868b98
> 100644
> >     --- a/meta/classes-recipe/kernel.bbclass
> >     +++ b/meta/classes-recipe/kernel.bbclass
> >     @@ -867,3 +867,41 @@ EXPORT_FUNCTIONS do_deploy
> >
> >       # Add using Device Tree support
> >       inherit kernel-devicetree
> >     +
> >     +
> >     +# Add QA test to check some required/forbidden kernel configs are
> >     set or not.
> >     +QA_KERNEL_CONFIGS_REQUIRED ??=3D ""
> >     +QA_KERNEL_CONFIGS_FORBIDDEN ??=3D ""
> >     +
> >     +WARN_QA:append =3D " kernel-config"
> >     +
> >     +QARECIPETEST[kernel-config] =3D "package_qa_check_kernel_config"
> >     +def package_qa_check_kernel_config(pn, d):
> >     +    from pathlib import Path
> >     +    import re
> >     +
> >     +    config_path =3D Path(d.getVar("B"), ".config")
> >     +    if not config_path.exists():
> >     +        oe.qa.handle_error("kernel-config",
> >     +                           "Kernel configs have not been checked "=
\
> >     +                           "as the kernel .config is not found: "\
> >     +                           "%s." % config_path)
> >     +        return
> >     +
> >     +    config_list =3D {}
> >     +    with config_path.open('r') as f_config:
> >     +        for line in f_config.read().splitlines():
> >     +            configset =3D re.match(r'# (\w+) is not set|
> >     (\w+)=3D([ymn])', line)
> >     +            if configset is not None:
> >     +                if configset.group(1) is not None:
> >     +                    config_list[configset.group(1)] =3D "n"
> >     +                else:
> >     +                    config_list[configset.group(2)] =3D
> >     configset.group(3)
> >     +
> >     +    for conf in d.getVar("QA_KERNEL_CONFIGS_REQUIRED").split():
> >     +        if conf not in config_list or config_list[conf] =3D=3D "n"=
:
> >     +            oe.qa.handle_error("kernel-config", "Kernel config is
> >     required: %s" % conf, d)
> >     +
> >     +    for conf in d.getVar("QA_KERNEL_CONFIGS_FORBIDDEN").split():
> >     +        if conf in config_list and config_list[conf] in "ym":
> >     +            oe.qa.handle_error("kernel-config", "Kernel config is
> >     forbidden: %s" % conf, d)
> >
> >     ---
> >     base-commit: b72823fc09674f78ad452250f453f6e47d9444de
> >     change-id: 20250306-qa_kernel-061a37e316c4
> >
> >     Best regards,
> >     --
> >     Louis Rannou <louis.rannou@syslinbit.com
> >     <mailto:louis.rannou@syslinbit.com>>
> >
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#212394): https://lists.openembedded.org/g/
> >     openembedded-core/message/212394 <https://lists.openembedded.org/g/
> >     openembedded-core/message/212394>
> >     Mute This Topic: https://lists.openembedded.org/mt/111549046/105081=
0
> >     <https://lists.openembedded.org/mt/111549046/1050810>
> >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/
> >     unsub <https://lists.openembedded.org/g/openembedded-core/unsub>
> >     [bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000077370f062fc0f686
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 7, 2025 at 2:45=
=E2=80=AFAM Louis Rannou &lt;<a href=3D"mailto:louis.rannou@syslinbit.com">=
louis.rannou@syslinbit.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
<br>
On 06/03/2025 16:36, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Mar 6, 2025 at 10:04=E2=80=AFAM Louis Rannou via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a> <br>
&gt; &lt;<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://lists.openembedded.org</a>&gt; <br>
&gt; &lt;louis.rannou=3D<a href=3D"mailto:syslinbit.com@lists.openembedded.=
org" target=3D"_blank">syslinbit.com@lists.openembedded.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:syslinbit.com@lists.openembedded.org" tar=
get=3D"_blank">syslinbit.com@lists.openembedded.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Louis Rannou &lt;<a href=3D"mailto:louis.rann=
ou@non.se.com" target=3D"_blank">louis.rannou@non.se.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:louis.rannou@non.se.co=
m" target=3D"_blank">louis.rannou@non.se.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Add a QARECIPETEST kernel-config to the kernel to c=
heck the kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0config has<br>
&gt;=C2=A0 =C2=A0 =C2=A0set (or unset) config listed in variables QA_KERNEL=
_CONFIGS_REQUIRED (or<br>
&gt;=C2=A0 =C2=A0 =C2=A0QA_KERNEL_CONFIGS_FORBIDDEN).<br>
&gt; <br>
&gt; <br>
&gt; We already have audit tools that can do this, the approach of opening<=
br>
&gt; the .config, iterating and then hard binding ourselves to the very spe=
cific<br>
&gt; kernel configuration names has been considered and rejected many<br>
&gt; times.<br>
&gt; <br>
&gt; What exactly isn&#39;t working with the already supported mechanism ?<=
br>
<br>
My ignorance I suppose. I didn&#39;t know about the audit phase and <br>
kernel-cache. I guess I have to read the doc...<br></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">If it doesn=
&#39;t work for your use case, or is otherwise causing issues, let</div><di=
v class=3D"gmail_default" style=3D"font-size:small">me know and I&#39;ll ma=
ke changes as required.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I=
&#39;ve taken a note to pull together a short presentation on this, as more=
</div><div class=3D"gmail_default" style=3D"font-size:small">documentation/=
examples can only be a good thing.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Cheers,</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Louis<br>
<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:l=
ouis.rannou@non.se.com" target=3D"_blank">louis.rannou@non.se.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:louis.rannou@non.se.co=
m" target=3D"_blank">louis.rannou@non.se.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes-recipe/kernel.bbclass | 38 ++++=
++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 38 insertions(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes-recipe/kernel.bbclass b/m=
eta/classes-<br>
&gt;=C2=A0 =C2=A0 =C2=A0recipe/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0index<br>
&gt;=C2=A0 =C2=A0 =C2=A064a685a964dab942db05b8d9e08cc22a3bbb152e..4a82b84d4=
79667bf4a6e64ad3e99d934c6868b98 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes-recipe/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes-recipe/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -867,3 +867,41 @@ EXPORT_FUNCTIONS do_deploy<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Add using Device Tree support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0inherit kernel-devicetree<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# Add QA test to check some required/forbidden ker=
nel configs are<br>
&gt;=C2=A0 =C2=A0 =C2=A0set or not.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+QA_KERNEL_CONFIGS_REQUIRED ??=3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+QA_KERNEL_CONFIGS_FORBIDDEN ??=3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+WARN_QA:append =3D &quot; kernel-config&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+QARECIPETEST[kernel-config] =3D &quot;package_qa_c=
heck_kernel_config&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+def package_qa_check_kernel_config(pn, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 from pathlib import Path<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 import re<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 config_path =3D Path(d.getVar(&quot;=
B&quot;), &quot;.config&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if not config_path.exists():<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&qu=
ot;kernel-config&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Kernel configs have n=
ot been checked &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;as the kernel .config=
 is not found: &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s.&quot; % config_pa=
th)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 config_list =3D {}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 with config_path.open(&#39;r&#39;) a=
s f_config:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f_config.r=
ead().splitlines():<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 configse=
t =3D re.match(r&#39;# (\w+) is not set|<br>
&gt;=C2=A0 =C2=A0 =C2=A0(\w+)=3D([ymn])&#39;, line)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if confi=
gset is not None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if configset.group(1) is not None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 config_list[configset.group(1)] =3D &quot;n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 config_list[configset.group(2)] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0configset.group(3)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 for conf in d.getVar(&quot;QA_KERNEL=
_CONFIGS_REQUIRED&quot;).split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if conf not in config_=
list or config_list[conf] =3D=3D &quot;n&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.ha=
ndle_error(&quot;kernel-config&quot;, &quot;Kernel config is<br>
&gt;=C2=A0 =C2=A0 =C2=A0required: %s&quot; % conf, d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 for conf in d.getVar(&quot;QA_KERNEL=
_CONFIGS_FORBIDDEN&quot;).split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if conf in config_list=
 and config_list[conf] in &quot;ym&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.ha=
ndle_error(&quot;kernel-config&quot;, &quot;Kernel config is<br>
&gt;=C2=A0 =C2=A0 =C2=A0forbidden: %s&quot; % conf, d)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0base-commit: b72823fc09674f78ad452250f453f6e47d9444=
de<br>
&gt;=C2=A0 =C2=A0 =C2=A0change-id: 20250306-qa_kernel-061a37e316c4<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Louis Rannou &lt;<a href=3D"mailto:louis.rannou@sys=
linbit.com" target=3D"_blank">louis.rannou@syslinbit.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:louis.rannou@syslinbit=
.com" target=3D"_blank">louis.rannou@syslinbit.com</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#212394): <a href=3D"https://lis=
ts.openembedded.org/g/" rel=3D"noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0openembedded-core/message/212394 &lt;<a href=3D"htt=
ps://lists.openembedded.org/g/" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0openembedded-core/message/212394&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/111549046/1050810" rel=3D"noreferrer" target=3D"_blank">https://=
lists.openembedded.org/mt/111549046/1050810</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/mt/11=
1549046/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/111549046/1050810</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-core%2B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe: <a href=3D"https://lists.openembedded.=
org/g/openembedded-core/" rel=3D"noreferrer" target=3D"_blank">https://list=
s.openembedded.org/g/openembedded-core/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0unsub &lt;<a href=3D"https://lists.openembedded.org=
/g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/g/openembedded-core/unsub</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a> &lt;mailto:<a href=3D"mailto:bruce=
.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;]<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; <br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000077370f062fc0f686--

