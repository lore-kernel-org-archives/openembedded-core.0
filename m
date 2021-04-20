Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web08.2630.1618950527652594002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 13:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oDnlGXkp;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id q22so976844lfu.8
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 13:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZsAVD/VVDHp+GH+Qz5dqa7cU7c1CWl74C4nzThU5Ti8=;
        b=oDnlGXkp2+KNnZpmXcDGiFJ42eBdrAUccL2zyRVb1ouTfGtvcuHb+aSxKWZhxLryi1
         U3Gz1p9vS9FK8UrWQHgrL4wfhOhmqXyP7TWPv2tzuhoz2K8IKuCNLIhB/zthYARuquNK
         oK7HHgUyASdGrOUl8wnPeGoWhkib/V6Dgy7SdrtOYl/sh7aYi9epF3iORfS+jfW+ppYh
         xslKlhVPOpBcey2z/AP9PQ4+UoEeuboVEeBmmvxe3KlPU6jVwaMjJsDuVJ8vIl/bdUYj
         VNcaGumkL2tAiWWqbMJmqdq2j2CSjQX7tzpwlY5TJ03RXjIr/pcuGKF6aAil5njqHAUW
         ehrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZsAVD/VVDHp+GH+Qz5dqa7cU7c1CWl74C4nzThU5Ti8=;
        b=kEECIJxKyzUJSWFfADb0xcAWi1uakNovp6v/JGoCCnxERZDzC4s9zBR2ce76W7J913
         wrMbffTw/QAPODIQu38zIl+P5pxxYD7SLiET1mDE6WpgbR4fF1d3wLcrD4fiRQza2pwe
         JrNT1qriBmpYE0uiFU79/mfTzNhE6Y1J4/BKY7RyZILaHtI3Vq9SPalJP35G2No1gYk1
         k9UpOvjLmKy9XWt252zPJBIpwX65CgD2opYHjrScSx1RR4J7YFW7WkI21Apaj8iTHzrj
         A5JPO12YphLVHZmuy6od7yMZZRW6KLDrmcUO5eH6a8CfPSPnyp4pff0aXNp1+E8fxIhO
         eOHA==
X-Gm-Message-State: AOAM533zxxQ/OJx1OlbGrNfqh2QxDxEwlCZnO0JPFPxGJgQhbrfTSGJe
	ylgcpykgBta1FEWq4oiO5CScDzQfiMTTjG+8GWI=
X-Google-Smtp-Source: ABdhPJw3EzFVraxWJQIukqbFIJMETDryuzpduGm8AzAcxqfx2kbSr9rZIokKNVNJQYFmTP6BhFMmkVf/ektBoUb9T7g=
X-Received: by 2002:a05:6512:22cb:: with SMTP id g11mr296421lfu.568.1618950525752;
 Tue, 20 Apr 2021 13:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <mMlg.1618670463873919193.89er@lists.yoctoproject.org> <c80d4ed8-13a1-94a7-9a26-6b4183e89940@windriver.com>
In-Reply-To: <c80d4ed8-13a1-94a7-9a26-6b4183e89940@windriver.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 20 Apr 2021 13:28:34 -0700
Message-ID: <CAJ86T=XGxEyZYc7pH3Me1_Cx+H1+OAjNjo45veLhyPFv+eEWsA@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] [PATCH] busybox: use openssl for TLS connections whenever possible
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Shachar Menashe <shachar@vdoo.com>, yocto-security@lists.yoctoproject.org, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 20, 2021 at 10:23 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Add the oe-core list where patches are usually discussed.
>
> On 2021-04-17 10:41 a.m., Shachar Menashe wrote:
>
> This adds proper TLS verification to wget
>
> I think you should add some of the comments you made in the bugzilla here:
>
> ---
>
> By enabling the busybox feature: WGET_OPENSSL it means that in builds WITH openssl (ex. sato)
> the issue will be completely fixed, and in builds WITHOUT openssl, busybox will fallback
> to using the internal (insecure) client which will print out a message
> "note: TLS certificate validation not implemented" Note that busybox does not rely in any way on the OpenSSL library
> (it just executes the standalone binary, if it is found) so
> we shouldn't have linkage issues is CONFIG_FEATURE_WGET_OPENSSL is enabled but OpenSSL is not getting built.
>
> ---
>
> Thanks for the explanation.
> We could add a RSUGGESTS make the coupling more clear:
>
> http://docs.yoctoproject.org/ref-manual/variables.html?highlight=rrecommends#term-RSUGGESTS
>
> I don't use that feature at all and it's not widely used in oe-core so hopefully someone
> opinionated will reply and help us out.
>
> ../Randy


> Signed-off-by: Shachar Menashe <shachar@vdoo.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 47fcb59302..8f274bd263 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -77,6 +77,7 @@ def features_to_busybox_settings(d):
>      busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv4', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
>      busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'ipv6', True, False, d), 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
>      busybox_cfg(bb.utils.contains_any('DISTRO_FEATURES', 'bluetooth wifi', True, False, d), 'CONFIG_RFKILL', cnf, rem)
> +    busybox_cfg(True, 'CONFIG_FEATURE_WGET_OPENSSL', cnf, rem)
>      return "\n".join(cnf), "\n".join(rem)
>
>  # X, Y = ${@features_to_busybox_settings(d)}
> --
> 2.17.1
>

This was discussed on the list last year. The conclusion was that
FEATURE_WGET_HTTPS should be disabled by default (ie giving anyone who
needs to fetch from https URLs to clear hint that that should be using
full featured wget or curl) rather than enabling a hacky solution to
have busybox call out to the openssl command line tool. Has something
changed since then?
