Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.4323.1594411308915824046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 13:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qc44yvXH;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id t11so3173182qvk.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 13:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M+mK5bhKOEcUmTkpCovhiSa7Ee/NWW9oX1f7ItLhGAs=;
        b=qc44yvXHW0r3+whSU+4nV3lIHoDZqAIq/TmMftC4102Ftn6R65sVr9/ui60Wjh/VOQ
         R35QqyySjJ1BlNp/7PBZaJ1EsNhcWAuJMC/wW04hL7ASsBq1RGBJgumQ1Mbh0S+u0UDw
         2yUiZep3JHdmyeObssx+NW7EkugDUcCeMgOHYgT/yLsx9lINPIIK7wVzY2lKIVzf+L2/
         YFZNTu0yPJi8eGgu/3QbAW4t6VmlP1oe1Cuc40cEV3RrK/Zlamn8UCDDmWos3jo8quJn
         SuprXVJx+2s2xb3mswYDy0qs7q0NDSzCZbbgEvjHroZ7P93NqlSIcOv4tb0zMZ4zT26i
         DawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M+mK5bhKOEcUmTkpCovhiSa7Ee/NWW9oX1f7ItLhGAs=;
        b=cjw5oEPjLtUx8j3aIBfviEKqJpxqPnx3cplQ6BfFjnZapQeL1Th4gMHQ9kAhipT6GO
         LZizu/4J/Sk8bjfgnE5OMJm5KHGrf2n5k6FobZuK5ctFLEQgk0ixKy3+jKzdQhUE/65i
         6VDIYti67jrI0TDlq2/HhhskiwE8daZEtWnFLzZ25aZztc8HcvTE05wgvyatTDCf0Qo4
         I3Q+N9BylTkrHddPxOcyLsB0vYYap8DXClBBoztmHby6MymwFSwDnODP0BlWPE6No5FW
         pVU5ELBmjgiSkpagVJIbmfh06OMOTi1DJhJYIw7pDiBJ3rbESE678vsa9uFLHlUE3siS
         z1Cw==
X-Gm-Message-State: AOAM530YGlu07FcbrQqtM9ea2lijmx4f/wueL0oa9FvTJya2sP5HEA0F
	mX3Q27/ICQvGXMRnyBS2Ujw6noO4F7g08KBlMkc=
X-Google-Smtp-Source: ABdhPJzuDoFb+3JCOhykYLuflZclIS1PSULVLJLkkxEC5ft9b1JDRST8YLAJf9KuWRr432Ep69f0rMoFTWwkuUVgaV8=
X-Received: by 2002:a0c:83a5:: with SMTP id k34mr68665162qva.130.1594411307800;
 Fri, 10 Jul 2020 13:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200710193957.1969769-1-takondra@cisco.com>
In-Reply-To: <20200710193957.1969769-1-takondra@cisco.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 10 Jul 2020 13:01:21 -0700
Message-ID: <CAMKF1sqpr6mf_GcPOf-saR8x8HtZ-CVxh8ZnNLV4km=wdTyjYw@mail.gmail.com>
Subject: Re: [PATCH] openssl: add rdcpu to rand-seed
To: Taras Kondratiuk <takondra@cisco.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, XE-Linux <xe-linux-external@cisco.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 10, 2020 at 12:40 PM Taras Kondratiuk <takondra@cisco.com> wrote:
>
> Native[sdk] openssl fails to initialize RNG on systems where native[sdk]
> glibc is built against pre-3.17 linux-libc-headers, but runs on 4.8+
> kernel:
> 140737348333184:error:2406C06E:random number generator:RAND_DRBG_instantiate:error retrieving entropy:../openssl-1.1.1g/crypto/rand/drbg_lib.c:342
>
> Commit 3ff98f558157 ("Start up DEVRANDOM entropy improvement for older
> Linux devices.") in OpenSSL 1.1.1d has effectively disabled devrandom
> seed source for kernels >=4.8. The assumption is that getrandom(2) will
> be used instead. Getrandom syscall was added in kernel 3.17 by commit
> c6e9d6f38894 ("random: introduce getrandom(2) system call"). So on a
> system with 4.8+ kernel and pre-3.17 libc headers both getrandom and
> devrandom can't be used.
>
> To workaround this issue add 'rdcpu' as additional source of entropy for
> the rand seed. Also devrandom in the list is no-op since os = getrandom
> + devrandom on Linux, so remove it. The comment is also not relevant
> anymore.
>

I think rdcpu will work on x86 hosts but not on say aarch64 build
hosts. Can we still
have devrandom as an option if rdcpu fails ?

> Signed-off-by: Taras Kondratiuk <takondra@cisco.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> index 47ed6b7640b3..2bf7f56183ce 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> @@ -43,10 +43,8 @@ do_configure[cleandirs] = "${B}"
>  EXTRA_OECONF_append_libc-musl = " no-async"
>  EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
>
> -# adding devrandom prevents openssl from using getrandom() which is not available on older glibc versions
> -# (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
> -EXTRA_OECONF_class-native = "--with-rand-seed=os,devrandom"
> -EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
> +EXTRA_OECONF_class-native = "--with-rand-seed=os,rdcpu"
> +EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,rdcpu"
>
>  # Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
>  CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
> --
> 2.25.1
>
