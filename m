Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.7559.1626959786026262004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 06:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W6BS+dkw;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id nd37so8338267ejc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 06:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=80QoPK1uy2910aeWCVwNOBTx59d5AqxFEm9ByBKngPc=;
        b=W6BS+dkwywu8OQFD6IXv6jWg0tyn84M5ARFAzFwPkSxdMpJR8PXtpZEhmCXb6Lkx+l
         tv/2CsU3f8wP5KLVZ2c4DqBSMpYj7Nu9ynHbg6L4Ee56W1nxWaVSiKElhNK8hfyQSYlD
         oJ71s8/ih+sUE+HzpUwoAoO34bjMi22oHHih0g9mZ1rCggoyMKHJBA/SSUklVbSFCAz+
         z3l2sH7ClNpWE+R/pJQmkFTLpP72VDyu1dGuDwgyeUamWWb7xtZoNxxi/+1vgha3ljzM
         rUvtLKcc5O8v2boFRkl3UD3Hpi66iSZFib7gnKwPOPt0HokiuOarcWoMiqWIjn13gVaJ
         rfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=80QoPK1uy2910aeWCVwNOBTx59d5AqxFEm9ByBKngPc=;
        b=VFMB78ctr1Nh7C6BU3gJ3cvBNaoRzWC9reAAEyKG5Cd7/Epk0rLxwWRixmY1cv7LOk
         QodnSO/nJXBbSDASIAnL/gmmN+q2afO8yFklQDIl9EvYHZChqHRmy7P74x5HuVkWlBYO
         Acxf37xtO8yQ6a/dsvu1Kbqz2fEdBHPKJ9a8MT3H+kMQE8FAiTGKjkQZ30M5hvd9lxao
         vetaH8k/NFWrkWhOrwj1qwCkXRt0fkDIcyuqsaWvZWUyBekcya4VPGW+miEgczHWjG6E
         RHoX+5DAX0SwkYt8dDkjVRUIbdwp7oCcOCT6sXexpDRziHUOdk2E/d6IRDe2GNxxMAXb
         EvAQ==
X-Gm-Message-State: AOAM532KGZVl4CZO2nEXgxmMWmU4Welm7uDIRkG9B9ZR/AgXcrNkDX15
	5b0Pnd5+CkSJ99nVp8z4bKBVpbG4n99Mn0RMJu4=
X-Google-Smtp-Source: ABdhPJwGq9WrFTLYGuAMJJe2xVnq/XYJpogRT62FnG1WobtX5CZJAww6PrJWRJw5O8dMSBVTcoqH+UDrq9i9xNONNO8=
X-Received: by 2002:a17:906:3399:: with SMTP id v25mr44127208eja.357.1626959784351;
 Thu, 22 Jul 2021 06:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org> <20210722124644.19962-5-nicolas.dechesne@linaro.org>
In-Reply-To: <20210722124644.19962-5-nicolas.dechesne@linaro.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 22 Jul 2021 09:16:13 -0400
Message-ID: <CADkTA4MfOnbxF5c9MyfD79r_pmN0Yw4KH6Gx5mjSR1nYkA9Wgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] yocto-check-layer: ensure that all layer dependencies are tested too
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000029afe05c7b6180d"

--000000000000029afe05c7b6180d
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 8:47 AM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> In order to be compliant with the YP compatible status, a layer also
> needs to ensure that all its dependencies are compatible
> too. Currently yocto-check-layer only checks the requested layer,
> without testing any dependencies.
>

Is that actually written into our compliance statements ? (that dependency
layers must also be compliant)

I had never heard that before, and in my opinion, that will actively
encourage people to copy recipes if they want to be compliant but a
dependent layer is problematic.


>
> With this change, all dependencies are also checked by default, so the
> summary printed at the end will give a clear picture whether all
> dependencies pass the script or not.
>
Using --no-auto-dependency can be used to skip that.
>
>
I'd actually prefer the opposite, to make the compliance runs faster by
default, versus someone having to find out about this option later. We
already get complaints about check layer speed, and doing more by default
won't help on that front.

Bruce



> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  scripts/yocto-check-layer | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
> index a179240fd0..e3a4c940ec 100755
> --- a/scripts/yocto-check-layer
> +++ b/scripts/yocto-check-layer
> @@ -24,7 +24,7 @@ import scriptpath
>  scriptpath.add_oe_lib_path()
>  scriptpath.add_bitbake_lib_path()
>
> -from checklayer import LayerType, detect_layers, add_layers,
> add_layer_dependencies, get_signatures, check_bblayers
> +from checklayer import LayerType, detect_layers, add_layers,
> add_layer_dependencies, get_layer_dependencies, get_signatures,
> check_bblayers
>  from oeqa.utils.commands import get_bb_vars
>
>  PROGNAME = 'yocto-check-layer'
> @@ -51,6 +51,8 @@ def main():
>              help='File to output log (optional)', action='store')
>      parser.add_argument('--dependency', nargs="+",
>              help='Layers to process for dependencies', action='store')
> +    parser.add_argument('--no-auto-dependency', help='Disable automatic
> testing of dependencies',
> +            action='store_true')
>      parser.add_argument('--machines', nargs="+",
>              help='List of MACHINEs to be used during testing',
> action='store')
>      parser.add_argument('--additional-layers', nargs="+",
> @@ -121,6 +123,21 @@ def main():
>      if not layers:
>          return 1
>
> +    # Find all dependencies, and get them checked too
> +    if not args.no_auto_dependency:
> +        depends = []
> +        for layer in layers:
> +            layer_depends = get_layer_dependencies(layer, dep_layers,
> logger)
> +            if layer_depends:
> +                for d in layer_depends:
> +                    if d not in depends:
> +                        depends.append(d)
> +
> +        for d in depends:
> +            if d not in layers:
> +                logger.info("Adding %s to the list of layers to test, as
> a dependency", d['name'])
> +                layers.append(d)
> +
>      shutil.copyfile(bblayersconf, bblayersconf + '.backup')
>      def cleanup_bblayers(signum, frame):
>          shutil.copyfile(bblayersconf + '.backup', bblayersconf)
> --
> 2.29.2
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000029afe05c7b6180d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 22, 2021 at 8:47 AM Nicolas Dechesne &l=
t;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>In order to be compliant with the YP compatible status, a layer also<br>
needs to ensure that all its dependencies are compatible<br>
too. Currently yocto-check-layer only checks the requested layer,<br>
without testing any dependencies.<br></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">Is that actually written=
 into our compliance statements ? (that dependency layers must also be comp=
liant)</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">I had never heard =
that before, and in my opinion, that will actively encourage people to copy=
 recipes if they want to be compliant but a dependent layer is problematic.=
</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
With this change, all dependencies are also checked by default, so the<br>
summary printed at the end will give a clear picture whether all<br>
dependencies pass the script or not.=C2=A0<br></blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Using --no-auto-dependency can be used t=
o skip that.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">I&#39;d actually prefer the opposite, to make the complia=
nce runs faster by default, versus someone having to find out about this op=
tion later. We already get complaints about check layer speed, and doing mo=
re by default won&#39;t help on that front.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
Signed-off-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@lin=
aro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
---<br>
=C2=A0scripts/yocto-check-layer | 19 ++++++++++++++++++-<br>
=C2=A01 file changed, 18 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer<br>
index a179240fd0..e3a4c940ec 100755<br>
--- a/scripts/yocto-check-layer<br>
+++ b/scripts/yocto-check-layer<br>
@@ -24,7 +24,7 @@ import scriptpath<br>
=C2=A0scriptpath.add_oe_lib_path()<br>
=C2=A0scriptpath.add_bitbake_lib_path()<br>
<br>
-from checklayer import LayerType, detect_layers, add_layers, add_layer_de=
pendencies, get_signatures, check_bblayers<br>
+from checklayer import LayerType, detect_layers, add_layers, add_layer_de=
pendencies, get_layer_dependencies, get_signatures, check_bblayers<br>
=C2=A0from oeqa.utils.commands import get_bb_vars<br>
<br>
=C2=A0PROGNAME =3D &#39;yocto-check-layer&#39;<br>
@@ -51,6 +51,8 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help=3D&#39;File to output=
 log (optional)&#39;, action=3D&#39;store&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--dependency&#39;, nargs=3D&q=
uot;+&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help=3D&#39;Layers to proc=
ess for dependencies&#39;, action=3D&#39;store&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--no-auto-dependency&#39;, help=3D=
&#39;Disable automatic testing of dependencies&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 action=3D&#39;store_true&#39;)<=
br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--machines&#39;, nargs=3D&quo=
t;+&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help=3D&#39;List of MACHIN=
Es to be used during testing&#39;, action=3D&#39;store&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--additional-layers&#39;, nar=
gs=3D&quot;+&quot;,<br>
@@ -121,6 +123,21 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0if not layers:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
<br>
+=C2=A0 =C2=A0 # Find all dependencies, and get them checked too<br>
+=C2=A0 =C2=A0 if not args.no_auto_dependency:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for layer in layers:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 layer_depends =3D get_layer_dep=
endencies(layer, dep_layers, logger)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if layer_depends:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in layer_de=
pends:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
d not in depends:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 depends.append(d)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in depends:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d not in layers:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http:/=
/logger.info" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;Ad=
ding %s to the list of layers to test, as a dependency&quot;, d[&#39;name&#=
39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 layers.append(d)<=
br>
+<br>
=C2=A0 =C2=A0 =C2=A0shutil.copyfile(bblayersconf, bblayersconf + &#39;.bac=
kup&#39;)<br>
=C2=A0 =C2=A0 =C2=A0def cleanup_bblayers(signum, frame):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copyfile(bblayersconf + &#39;.bac=
kup&#39;, bblayersconf)<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000029afe05c7b6180d--
