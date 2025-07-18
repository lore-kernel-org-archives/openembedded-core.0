Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06458C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 22:10:52 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.34.1752876646457733464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 15:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TWt3OOeY;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so4477146e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 15:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752876644; x=1753481444; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zS4NKVkYL4AOxFGOAECg9lfvXM4R8KvienkVep7hx0c=;
        b=TWt3OOeYnJVF4ir5cCmIe/uiA0URobevhAqCksqENoQNdXhUhZf6Mp4D+Do7azmOhH
         t4IO1FVYR9iSlB7FjSjrh9PyFgtZ/IzgIHHNYoU3Fk7yMLfeuhNXntBSR2RVPQGjK9yW
         41cC06edYUEqG5qxu9u3exDJDsgPjXItvcBdnDEaHeKd6PrTJx6w4D1yl+zWp0KKf+1m
         wUaUZC8zQAhgl9kMF8vPp5ZSIB2A4PDKxcVVI/16yxADBoXqwT+PDzx5CZpENEQwSiCj
         zPgawnKxHrGzoe7F+mEqlXt6CoviR42Fy6qsE9otyuiLAJPk/kUhQR3HsZYeZqT7cdtQ
         7AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752876644; x=1753481444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zS4NKVkYL4AOxFGOAECg9lfvXM4R8KvienkVep7hx0c=;
        b=sTz4NeFLFzDrZHqO23mQmHG/4CKN4snAjbzJkZ2WTSm/4LARS+2LrHhX+bA+AGQbo9
         vDP5p9AT8jsOuHWY+FvAT5VWebf6cQatQjxeChBn8jOKyvCM9lZSkHdM9stiwmVMPGJk
         8fA9WRJvoCw8HQ+NTCC4peD2PIFOuJ1Fo2xbdyXT5yeDIfNoW//imLuWbAwUDqA+i9nE
         QEN0TZxh8/QLHYkYsJD0ohX9i5ZJd+YgN2EUdCJUF6WUETaS5u3/FI/Tce+u52Z8x7O3
         hCufoNMGeKEXwwFjLhlt4AOI/KUygHDt+ajd+h1LZZE0HC/nvXSzwlI6EjL4ZlmrV1g5
         shMg==
X-Gm-Message-State: AOJu0YwURU91dxZi2wgqEGuy0gcKvRGhcqTqBMMIlEullkIXo107jAh0
	QN9erFuyMBpSphVeE6B9Hr6EzxIhRlOmtUYELey9PwtfbVU2aAOxRz13oyzk1Ney9LeGiDTo4Mn
	PffaM95pA5F22QboG+W7B5ySMPrqmHuU=
X-Gm-Gg: ASbGncuNIMsTIeWtAYe0PoesJXgeYR/ngy25oBaytA640y/5AZ/KeXDLykOBihfeDR3
	N1FuEegqlBK2O50e6oZBIz6WmTHmjUFJ+zc7sIy+Ct+ZIbtef6CWokEc5BuCPrFJD6E1TWQwbhC
	TWF89SU6J4x1Mqw7gAczkTXnbuXvsTQLnTCCwmDRre4CQ2C4sfMklu4Inmcb3LlsK6fXnT7ULjl
	V6uBXLUrt+Rs34vcqLEll1Q3wuJccrT
X-Google-Smtp-Source: AGHT+IGPqwaqMwq0QLvmGKDtdngsYJC9NGXcdPgxZzNlgy56LWxoAAYm2546CgsX8DxtiYBcaIPTv6kYCyouuJtMguU=
X-Received: by 2002:a05:6512:10cb:b0:556:fb24:6f85 with SMTP id
 2adb3069b0e04-55a2fe50a35mr1322901e87.22.1752876644019; Fri, 18 Jul 2025
 15:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250716090517.481832-1-kamel.bouhara@bootlin.com> <20250716090517.481832-2-kamel.bouhara@bootlin.com>
In-Reply-To: <20250716090517.481832-2-kamel.bouhara@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 18 Jul 2025 16:10:31 -0600
X-Gm-Features: Ac12FXzRBAqF8x4uctMnDOeTVv3iwPk9z2stYOyREgY7xldCccS4O2oCRqNjbpI
Message-ID: <CAJdd5GYRkptevcv0+4U6fQmVa-MxzB4EbdX=GtfE-21x3rkzEQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] spdx3: Add optional kernel configuration export to
 build_parameter for virtual/kernel
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000b3b363063a3b65bc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 22:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220606

--000000000000b3b363063a3b65bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nak, see inline comment below about erasing the recipe variables

In general, I'm not too opposed to being able to express this sort of thing
in the SPDX (provided it's optional), there already is precedence for it
(see SPDX_INCLUDE_BUILD_VARIABLES), and it is more or less intended that
SPDX _can_ express these sorts of things (although, just because we can
doesn't mean we have to). However, your approach here is incorrect.

The primary problem is that you are including the config settings in the
recipe Build object; you can't really do that because that recipe Build
object (more or less) represents the build of entire "recipe" (up to the
point of the do_create_spdx task anyway), and already has a defined meaning
for what its build parameters mean (they are the bitbake variables at the
time the do_create_spdx is invoked). Adding in the kernel config options to
this build changes that meaning and means that you can't infer the meaning
of the parameters anymore from the buildType, which is wrong.

Instead, what you need to do is create a new build that represents the
compile (or configuration) of the kernel, and assign it a unique buildType
(or if one already exists for the kernel build with the same meaning, you
could use that.... but I doubt that is the case). Since you have a unique
buildType, you can then define the kernel config parameters as you have
done here for that build and it will be possible to correctly interpret
them. The final step is to link the existing build to your new build using
the ancestorOf relationship to indicate that your new build is a "sub
build" of the parent recipe build.

Ideally, this would not live in spdx30_tasks.py, since it's highly specific
to the kernel build and I really want to avoid putting everyone's specific
reporting requirements in the common code; they need to be more distributed
than that (IMHO).



On Wed, Jul 16, 2025 at 3:05=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bootli=
n.com>
wrote:

> Enhances SPDX Document by extracting kernel build-time configuration
> settings from '${B}/.config'.
>
> Each CONFIG_* line is parsed and exported as a DictionaryEntry in the
> build_Build.build_parameter
> section of the SPDX document. This provides better visibility into kernel
> build behavior and
> configuration, in alignment with the SPDX3 metadata model.
>
> The feature is gated by a new tunable variable:
>
>     SPDX_INCLUDE_KERNEL_CONFIG (default: "1")
>
> Setting this to "0" disables exporting the kernel configuration, which ma=
y
> be useful to improve
> performance or reduce the size of generated SPDX documents.
>
> Example:
>
>     CONFIG_FOO=3Dy  =E2=86=92  { key: "CONFIG_FOO", value: "y" }
>
> This complements existing metadata export features and enables a more
> complete audit trail of how
> the kernel is built within a given build.
>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass |  6 ++++++
>  meta/lib/oe/spdx30_tasks.py          | 32 ++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass
> b/meta/classes/create-spdx-3.0.bbclass
> index c0a5436ad6..cdb9422f37 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -50,6 +50,12 @@ SPDX_INCLUDE_TIMESTAMPS[doc] =3D "Include time stamps =
in
> SPDX output. This is \
>      useful if you want to know when artifacts were produced and when
> builds \
>      occurred, but will result in non-reproducible SPDX output"
>
> +SPDX_INCLUDE_KERNEL_CONFIG ??=3D "1"
> +SPDX_INCLUDE_KERNEL_CONFIG[doc] =3D "If set to '1', the .config file for
> the kernel will be parsed \
> +and each CONFIG_* value will be included in the Build.build_parameter
> list as DictionaryEntry \
> +items. Set to '0' to disable exporting kernel configuration to improve
> performance or reduce \
> +SPDX document size."
> +
>  SPDX_IMPORTS ??=3D ""
>  SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variable that describes =
how
> to \
>      reference external SPDX ids. Each import is defined as a key in this=
 \
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index c352dab152..f87d079cb0 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -18,6 +18,28 @@ from contextlib import contextmanager
>  from datetime import datetime, timezone
>  from pathlib import Path
>
> +def parse_kernel_config(config_path):
> +    entries =3D []
> +    if not os.path.exists(config_path):
> +        bb.warn(f"Kernel config file not found at: {config_path}")
> +        return entries
> +
> +    try:
> +        with open(config_path, 'r') as f:
> +            for line in f:
> +                line =3D line.strip()
> +                if not line or line.startswith("#"):
> +                    continue
> +                if "=3D" in line:
> +                    key, value =3D line.split("=3D", 1)
> +                    entries.append(oe.spdx30.DictionaryEntry(
> +                        key=3Dkey,
> +                        value=3Dvalue.strip('"')
> +                    ))
> +        bb.note(f"Parsed {len(entries)} kernel config entries from
> {config_path}")
> +    except Exception as e:
> +        bb.error(f"Failed to parse kernel config file: {e}")
> +    return entries
>
>  def walk_error(err):
>      bb.error(f"ERROR walking {err.filename}: {err}")
> @@ -495,6 +517,8 @@ def create_spdx(d):
>
>      build_objset.doc.rootElement.append(build)
>
> +    build.build_parameter =3D []
>

This will actually erase the recipe variables when
SPDX_INCLUDE_BUILD_VARIABLES is present, so you can't do this.

+
>      build_objset.set_is_native(is_native)
>
>      for var in (d.getVar("SPDX_CUSTOM_ANNOTATION_VARS") or "").split():
> @@ -815,6 +839,14 @@ def create_spdx(d):
>              sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
>          )
>
> +    if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) !=3D "0":
> +        if "virtual/kernel" in (d.getVar("PROVIDES") or "").split():
> +            bb.note("Detected virtual/kernel provider, extracting kernel
> configuration")
> +            config_path =3D d.expand("${B}/.config")
> +            kernel_params =3D parse_kernel_config(config_path)
> +            if kernel_params:
> +                build.build_parameter.extend(kernel_params)
> +
>      oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes",
> deploydir)
>
>
> --
> 2.43.0
>
>

--000000000000b3b363063a3b65bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div>Nak, see inline comment below =
about erasing the recipe variables</div><div dir=3D"ltr"><br></div><div>In =
general, I&#39;m not too opposed to being able to express this sort of thin=
g in the SPDX (provided it&#39;s optional), there already is precedence for=
 it (see SPDX_INCLUDE_BUILD_VARIABLES), and it is more or less intended tha=
t SPDX _can_ express these sorts of things (although, just because we can d=
oesn&#39;t mean we have to). However, your approach here is incorrect.</div=
><div><br></div><div>The primary problem is that you are including the conf=
ig settings in the recipe Build object; you can&#39;t really do that becaus=
e that recipe Build object (more or less) represents the build of entire &q=
uot;recipe&quot; (up to the point of the do_create_spdx task anyway), and a=
lready has a defined meaning for what its build parameters mean (they are t=
he bitbake variables at the time the do_create_spdx is invoked). Adding in =
the kernel config options to this build changes that meaning and means that=
 you can&#39;t infer the meaning of the parameters anymore from the buildTy=
pe, which is wrong.</div><div><br></div><div>Instead, what you need to do i=
s create a new build that represents the compile (or configuration) of the =
kernel, and assign it a unique buildType (or if one already exists for the =
kernel build with the same meaning, you could use that.... but I doubt that=
 is the case). Since you have a unique buildType, you can then define the k=
ernel config parameters as you have done here for that build and it will be=
 possible to correctly interpret them. The final step is to link the existi=
ng build to your new build using the ancestorOf relationship to indicate th=
at your new build is a &quot;sub build&quot; of the parent recipe build.</d=
iv><div><br></div><div>Ideally, this would not live in spdx30_tasks.py, sin=
ce it&#39;s highly specific to the kernel build and I really want to avoid =
putting everyone&#39;s specific reporting requirements in the common code; =
they need to be more distributed than that (IMHO).</div><div><br></div><div=
><br></div><div dir=3D"ltr"></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 16, 2025 at 3=
:05=E2=80=AFAM Kamel Bouhara &lt;<a href=3D"mailto:kamel.bouhara@bootlin.co=
m">kamel.bouhara@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Enhances SPDX Document by extracting kernel bui=
ld-time configuration settings from &#39;${B}/.config&#39;.<br>
<br>
Each CONFIG_* line is parsed and exported as a DictionaryEntry in the build=
_Build.build_parameter<br>
section of the SPDX document. This provides better visibility into kernel b=
uild behavior and<br>
configuration, in alignment with the SPDX3 metadata model.<br>
<br>
The feature is gated by a new tunable variable:<br>
<br>
=C2=A0 =C2=A0 SPDX_INCLUDE_KERNEL_CONFIG (default: &quot;1&quot;)<br>
<br>
Setting this to &quot;0&quot; disables exporting the kernel configuration, =
which may be useful to improve<br>
performance or reduce the size of generated SPDX documents.<br>
<br>
Example:<br>
<br>
=C2=A0 =C2=A0 CONFIG_FOO=3Dy=C2=A0 =E2=86=92=C2=A0 { key: &quot;CONFIG_FOO&=
quot;, value: &quot;y&quot; }<br>
<br>
This complements existing metadata export features and enables a more compl=
ete audit trail of how<br>
the kernel is built within a given build.<br>
<br>
Signed-off-by: Kamel Bouhara &lt;<a href=3D"mailto:kamel.bouhara@bootlin.co=
m" target=3D"_blank">kamel.bouhara@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/create-spdx-3.0.bbclass |=C2=A0 6 ++++++<br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 ++=
++++++++++++++++++++++++++<br>
=C2=A02 files changed, 38 insertions(+)<br>
<br>
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass<br>
index c0a5436ad6..cdb9422f37 100644<br>
--- a/meta/classes/create-spdx-3.0.bbclass<br>
+++ b/meta/classes/create-spdx-3.0.bbclass<br>
@@ -50,6 +50,12 @@ SPDX_INCLUDE_TIMESTAMPS[doc] =3D &quot;Include time stam=
ps in SPDX output. This is \<br>
=C2=A0 =C2=A0 =C2=A0useful if you want to know when artifacts were produced=
 and when builds \<br>
=C2=A0 =C2=A0 =C2=A0occurred, but will result in non-reproducible SPDX outp=
ut&quot;<br>
<br>
+SPDX_INCLUDE_KERNEL_CONFIG ??=3D &quot;1&quot;<br>
+SPDX_INCLUDE_KERNEL_CONFIG[doc] =3D &quot;If set to &#39;1&#39;, the .conf=
ig file for the kernel will be parsed \<br>
+and each CONFIG_* value will be included in the Build.build_parameter list=
 as DictionaryEntry \<br>
+items. Set to &#39;0&#39; to disable exporting kernel configuration to imp=
rove performance or reduce \<br>
+SPDX document size.&quot;<br>
+<br>
=C2=A0SPDX_IMPORTS ??=3D &quot;&quot;<br>
=C2=A0SPDX_IMPORTS[doc] =3D &quot;SPDX_IMPORTS is the base variable that de=
scribes how to \<br>
=C2=A0 =C2=A0 =C2=A0reference external SPDX ids. Each import is defined as =
a key in this \<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index c352dab152..f87d079cb0 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -18,6 +18,28 @@ from contextlib import contextmanager<br>
=C2=A0from datetime import datetime, timezone<br>
=C2=A0from pathlib import Path<br>
<br>
+def parse_kernel_config(config_path):<br>
+=C2=A0 =C2=A0 entries =3D []<br>
+=C2=A0 =C2=A0 if not os.path.exists(config_path):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(f&quot;Kernel config file not found at=
: {config_path}&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return entries<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(config_path, &#39;r&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D line.stri=
p()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not line or lin=
e.startswith(&quot;#&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;=3D&quot;=
 in line:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 key,=
 value =3D line.split(&quot;=3D&quot;, 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entr=
ies.append(oe.spdx30.DictionaryEntry(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 key=3Dkey,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 value=3Dvalue.strip(&#39;&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ))<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(f&quot;Parsed {len(entries)} kernel co=
nfig entries from {config_path}&quot;)<br>
+=C2=A0 =C2=A0 except Exception as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(f&quot;Failed to parse kernel config =
file: {e}&quot;)<br>
+=C2=A0 =C2=A0 return entries<br>
<br>
=C2=A0def walk_error(err):<br>
=C2=A0 =C2=A0 =C2=A0bb.error(f&quot;ERROR walking {err.filename}: {err}&quo=
t;)<br>
@@ -495,6 +517,8 @@ def create_spdx(d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0build_objset.doc.rootElement.append(build)<br>
<br>
+=C2=A0 =C2=A0 build.build_parameter =3D []<br></blockquote><div><br></div>=
<div>This will actually erase the recipe variables when SPDX_INCLUDE_BUILD_=
VARIABLES is present, so you can&#39;t do this.</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0build_objset.set_is_native(is_native)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for var in (d.getVar(&quot;SPDX_CUSTOM_ANNOTATION_VARS&=
quot;) or &quot;&quot;).split():<br>
@@ -815,6 +839,14 @@ def create_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sorted(list(build_inputs)) =
+ sorted(list(debug_source_ids)),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;SPDX_INCLUDE_KERNEL_CONFIG&quot;, True) !=
=3D &quot;0&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;virtual/kernel&quot; in (d.getVar(&qu=
ot;PROVIDES&quot;) or &quot;&quot;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Detected virtual/k=
ernel provider, extracting kernel configuration&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config_path =3D d.expand(&quot;$=
{B}/.config&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_params =3D parse_kernel_c=
onfig(config_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if kernel_params:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build.build_parame=
ter.extend(kernel_params)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0oe.sbom30.write_recipe_jsonld_doc(d, build_objset, &quo=
t;recipes&quot;, deploydir)<br>
<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000b3b363063a3b65bc--

