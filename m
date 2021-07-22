Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.5562.1626946510333829810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 02:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ep1h8G+A;
 spf=pass (domain: linaro.org, ip: 209.85.208.41, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f41.google.com with SMTP id v1so5968437edt.6
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sesB0ZMbYzDM/9QINf2A+oFLpUNHdV6sH3KGNJDYbNw=;
        b=Ep1h8G+AkiIS3yiH9BDArwBhY9bpLi4XTOUs1hGXvIxdUTqZYdmRzIBcfcr9La1Xl2
         0bmgdn34MpLdMO2DPsWlsZTX3b4VgD9nAe2uUruSxKhTTMDhUQGa4ou9hiHyBCUBO0hH
         WDJEPmx2m+VuLMlPm7OOn8/s2okbgm67TqfrGAEaYp8tvOzp4ABR0Bzwvta3QgESCgh2
         8b+b9Mv1uaVjcG1ToMzQEjsxUHVMqOQXt/YSL0r5jjvbSVIhjmT4GBucGYeCsAmr6HnI
         9hZ6YNmcwZhs7cco+AKC/XyqAMzlw55w9SXzKt6yg9Q3r0vUdzHarAURjDQDH8jiGGrR
         DY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sesB0ZMbYzDM/9QINf2A+oFLpUNHdV6sH3KGNJDYbNw=;
        b=udrPGfOQ3Ju0tUgSZZ7aVslIgmbwIR5b24abjTrr4cuio5T3aLL1OKOQZsUnhlBju1
         vcQbQbV1JYT+yhbW92xTYbaQPxx7yrNtU8uT9gpJqOUtP2RC975dRO4JmdRlXGWJt85T
         6NwH7xv0dLK/jJ7zstdtvDbIYoVP3Fbor/E4bHW3otftsZuFVunywJeRlMQHxK8EBq8B
         Q8suddq1wU5ByuBrufPjr3G3GFQlNubSxzb18fgbgXWi5xw4viyOZN3GuGZDdjltRcK4
         +5syYnOycjRHMJ7bRVHncj9IRcNNbaPvWSOIg82hctrgAtgBjhoopdBe/M7XejF2pnK5
         XXnw==
X-Gm-Message-State: AOAM530pVD1f2YOFAf1pBKzfP12TR5jQ/t2EY/9aDXYu6wZ+LlteZ2+U
	rR3EcPa2bSnUQ1igs9/djasgit96nUW3e+Lpt1pgvw==
X-Google-Smtp-Source: ABdhPJzKs4TefDVDf7b0ftF5xeR6fsVTVrm5CVNEH6BVyI+pvLWZ1dcgsEQfI50+OfFGTnddcU+j7I5KhR6Q24ZC6oE=
X-Received: by 2002:aa7:cc8e:: with SMTP id p14mr26520151edt.26.1626946508768;
 Thu, 22 Jul 2021 02:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210424142633.1646440-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210424142633.1646440-1-richard.purdie@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 22 Jul 2021 11:34:58 +0200
Message-ID: <CAP71Wjyp8kXrxzKU0DZA5Znvg+5vgy50pU16k668nUueSqGhpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] yocto-check-layer: Avoid bug when iterating and autoadding dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b9620e05c7b3003c"

--000000000000b9620e05c7b3003c
Content-Type: text/plain; charset="UTF-8"

hey Richard,

better late than never they say ;)

On Sat, Apr 24, 2021 at 4:26 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> If iterating a layer with multiple components and auto-adding dependencies
> the tests can break since layers are never removed and order isn't
> guaranteed
> to account for that.
>
> Fix this by resetting the layer list back to the original list each time
> before auto-adding the dependencies in each case.
>
> This fixes scanning of meta-openembedded in particular where the sublayers
> may not be added in order of minimal dependency.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  scripts/yocto-check-layer | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
> index b7c83c8b543..deba3cb4f8c 100755
> --- a/scripts/yocto-check-layer
> +++ b/scripts/yocto-check-layer
> @@ -138,6 +138,9 @@ def main():
>                  layer['type'] == LayerType.ERROR_BSP_DISTRO:
>              continue
>
> +        # Reset to a clean backup copy for each run
> +        shutil.copyfile(bblayersconf + '.backup', bblayersconf)
> +
>

I was spending some time in yocto-check-layer, and noticed this patch. You
have the exact same statement 10 lines later. I think this patch should
have moved the statement before the call to check_bblayers() instead of
duplicating it. And I think this patch is a fix for a problem introduced in
be02e8dbfb0d (checklayer: check layer in BBLAYERS before test).

I can send a patch to remove the duplicate statement, or if simpler for
you, you can do it directly.


>          if check_bblayers(bblayersconf, layer['path'], logger):
>              logger.info("%s already in %s. To capture initial
> signatures, layer under test should not present "
>                 "in BBLAYERS. Please remove %s from BBLAYERS." %
> (layer['name'], bblayersconf, layer['name']))
> --
> 2.30.2
>
>
> 
>
>

--000000000000b9620e05c7b3003c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hey Richard,</div><div><br></div><div>better late tha=
n never they say ;)=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, Apr 24, 2021 at 4:26 PM Richard Purdie &lt=
;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linux=
foundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">If iterating a layer with multiple components and auto-adding=
 dependencies<br>
the tests can break since layers are never removed and order isn&#39;t gua=
ranteed<br>
to account for that.<br>
<br>
Fix this by resetting the layer list back to the original list each time<b=
r>
before auto-adding the dependencies in each case.<br>
<br>
This fixes scanning of meta-openembedded in particular where the sublayers=
<br>
may not be added in order of minimal dependency.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0scripts/yocto-check-layer | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer<br>
index b7c83c8b543..deba3cb4f8c 100755<br>
--- a/scripts/yocto-check-layer<br>
+++ b/scripts/yocto-check-layer<br>
@@ -138,6 +138,9 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer[&#39;t=
ype&#39;] =3D=3D LayerType.ERROR_BSP_DISTRO:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Reset to a clean backup copy for each run<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copyfile(bblayersconf + &#39;.backup&#=
39;, bblayersconf)<br>
+<br></blockquote><div><br></div><div>I was spending some time in yocto-ch=
eck-layer, and noticed this patch. You have the exact same statement 10 lin=
es later. I think this patch should have moved the statement before the cal=
l to check_bblayers() instead of duplicating=C2=A0it. And I think this patc=
h is a fix for a problem introduced in=C2=A0</div><div>be02e8dbfb0d (checkl=
ayer: check layer in BBLAYERS before test).<br></div><div><br></div><div>I =
can send a patch to remove the duplicate statement, or if simpler for you, =
you can do it directly.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if check_bblayers(bblayersconf, layer[&#=
39;path&#39;], logger):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://logger.i=
nfo" rel=3D"noreferrer" target=3D"_blank">logger.info</a>(&quot;%s already =
in %s. To capture initial signatures, layer under test should not present &=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;in BBLAYERS.=
 Please remove %s from BBLAYERS.&quot; % (layer[&#39;name&#39;], bblayersco=
nf, layer[&#39;name&#39;]))<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000b9620e05c7b3003c--
