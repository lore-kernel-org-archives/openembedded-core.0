Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.20731.1601385441856495438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 06:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gXmI2BVU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id c18so5340266wrm.9
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2P77OFNfpZPlWwhB1AmkduYJ1EC7WBT6+VX7fL14fGU=;
        b=gXmI2BVUG5zsXRVoJfxMjCBJKKiaAOj3oEpRGlAD3uJG4JfDvXbfi0ZjdjmttpGEKy
         M/VJA0RaWOf4+YwtRsfb5FogjqnpouTllZaGYkeYx9V1GKoXli90BmspvFwjmZKPEWl+
         UG6mY0QSnI4a570NGPigeO+zANlyjFtTZlH+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2P77OFNfpZPlWwhB1AmkduYJ1EC7WBT6+VX7fL14fGU=;
        b=gBdAqbig58mJulc30KOxULBV8MrpAH//mOCCr3ycoJIt9Bql1yZyArGtAR2Oyp1WSx
         QZBWm2FP7GMugkh7gxpeBoSdyU40Un2Iw5j3jejKog8tnBB79urZ63pFWV4Lb5pkkkLh
         j6mOBw0DjkjLN9S7OqIcRCNiDNGFjcqUABgQSkvp0iiMfSHjlEpJAA0R/8uiVpWYACQe
         faTqw1d3KWm677gv2xss7IzQZ/8L7vxnnbppAUBKB3HCoJlLbjAfbpzLmk/UfuI2bhRU
         oMOO88PEd3wP+t9agMtRNnKsldVXhhlEU5xVZLtlgbSFM3y3iz7rwfJIhQMjKLH8nxLp
         Hdyw==
X-Gm-Message-State: AOAM530E9XOq6GtYWSJY91KUyO276/GlnuOoaxdDkbQYZ9ZNoXjg+Il/
	XOuzBPEUhOQfoG1ANyUz3Rx9JQ==
X-Google-Smtp-Source: ABdhPJwMd8rhYz0wOmH7aEmAFqBzY0hwGtVwbMvw9gp5n2ocFNeozMLFzr0hXFKQ+qs4D29D6cjHzA==
X-Received: by 2002:a5d:61c2:: with SMTP id q2mr4657903wrv.25.1601385440222;
        Tue, 29 Sep 2020 06:17:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id p1sm13748282wma.0.2020.09.29.06.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 06:17:03 -0700 (PDT)
Message-ID: <be59e6bbc011ac54bb46aa4363463a9188c5c331.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] meson: set correct cpu and cpu-family for multilib SDKs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: christian.perkonig@sigmatek.at, openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2020 14:17:02 +0100
In-Reply-To: <20200918095004.34894-2-christian.perkonig@sigmatek.at>
References: <20200918095004.34894-1-christian.perkonig@sigmatek.at>
	 <20200918095004.34894-2-christian.perkonig@sigmatek.at>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-18 at 11:50 +0200, Christian Perkonig via lists.openembedded.org wrote:
> meson use to cross compile a cross-file. This file is special for
> every build environment. So if you have a multilib SDK for aarch64
> and arm the cpu_family and the cpu variable in the [HOST]-section
> of the cross-file must be set correctly.
> 
> Currently these variables are statically set to TARGET_ARCH during
> generation of the meson.cross.template file. Now the post-relocate
> scripts sets these variable for every environment.
> 
> Signed-off-by: Christian Perkonig <christian.perkonig@sigmatek.at>
> ---
>  meta/recipes-devtools/meson/meson/meson-setup.py      | 11 ++++++++++-
>  meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb |  8 +++++---
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipes-devtools/meson/meson/meson-setup.py
> index 808e2a062f..a6b716c731 100755
> --- a/meta/recipes-devtools/meson/meson/meson-setup.py
> +++ b/meta/recipes-devtools/meson/meson/meson-setup.py
> @@ -7,6 +7,10 @@ import sys
>  class Template(string.Template):
>      delimiter = "@"
>  
> +
> +class TemplateSingle(string.Template):
> +    delimiter = "@@"
> +
>  class Environ():
>      def __getitem__(self, name):
>          val = os.environ[name]
> @@ -15,6 +19,10 @@ class Environ():
>          val = '[%s]' % val
>          return val
>  
> +class SingleEnv():
> +    def __getitem__(self, name):
> +        return '%s' % os.environ[name]
> +
>  try:
>      sysroot = os.environ['OECORE_NATIVE_SYSROOT']
>  except KeyError:
> @@ -26,6 +34,7 @@ cross_file = os.path.join(sysroot, 'usr/share/meson/%smeson.cross' % os.environ[
>  
>  with open(template_file) as in_file:
>      template = in_file.read()
> -    output = Template(template).substitute(Environ())
> +    s = TemplateSingle(template).substitute(SingleEnv())
> +    output = Template(s).substitute(Environ())
>      with open(cross_file, "w") as out_file:
>          out_file.write(output)
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
> index 3c8c4fbc37..67fdd2235d 100644
> --- a/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
> +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.55.1.bb
> @@ -30,6 +30,7 @@ c = @CC
>  cpp = @CXX
>  ar = @AR
>  nm = @NM
> +ld = @LD
>  strip = @STRIP
>  pkgconfig = 'pkg-config'
>  
> @@ -40,10 +41,11 @@ c_link_args = @LDFLAGS
>  cpp_args = @CPPFLAGS
>  cpp_link_args = @LDFLAGS
>  
> +# Host configuration form the meson point of view 
>  [host_machine]
> -system = '${SDK_OS}'
> -cpu_family = '${SDK_ARCH}'
> -cpu = '${SDK_ARCH}'
> +system = '${TARGET_OS}'
> +cpu_family = '@@ARCH'
> +cpu = '@@OECORE_TARGET_ARCH'
>  endian = '${@meson_endian("SDK", d)}'
>  EOF
>  

We can build SDKs where there are multiple different target components.
"nativesdk" components therefore need to be architecture independent.
As far as I can see, this encodes target information into the nativesdk
tooling and is therefore totally incorrect. This would make it a
"cross" tool in Yocto Project terms and nativesdk is not a cross tool.

I don't doubt there are issues here but this patch is therefore not the
right way to fix this. 

Cheers,

Richard

