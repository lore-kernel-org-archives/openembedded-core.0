Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.6332.1585057598704592927
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 06:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j80/h10b;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id h14so19225146qke.5
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BaGmquXU0RcYW/c4c5iuovaJv9Mndw/dmutvufVxOc4=;
        b=j80/h10bqdWiTm4+14FQE/BDP5XDhDap/pm8rbCHo3i1Ty0rZ4WcqfdT6+B+AeIjLm
         dZFEg7BMLNKNSnJNL3/xb79ev+2xc9+LXSi+Fim3oUWRmeDjSFKjFcgNJRixEBPXuk+s
         mzRVMhPidNasbclF2Oo+0CPsz6Kw5WRPbn79h5rKWh7vCLQhB2uNwtPN9KJdPqVSsE/t
         I/NWIxCapAB9xj80VwSIAegMGCXYWCrpNMLJrqrgt3kWoDiQ+I2E0qiaHvlUoSjYvZws
         rkgBOjCTaby/Z7zjI+Z90+yVs9cRJM0LhkdMU6DVMyMDIWYH+Yb+K+kAKsUobhfkPM23
         1Jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BaGmquXU0RcYW/c4c5iuovaJv9Mndw/dmutvufVxOc4=;
        b=P73eaN1AL+QhFwVl6NU1GzLU9cUgMX3C63KuBwjxCEhN4HayH/USWxqF27LlJaDvn4
         DprsaIexwmlYHDVO9OvigjPZDhA43Vw5AypwNCIlrF3V5RMxmpds5wSN+yvoqYNlXrwP
         1M1vmhFMwlrAckhs7OzU6EgcLUjHXaWyEYZc3HQt1dI0ysxSHDULbZlG7KJkgqd8xqL3
         g08JtJfJdN4bmFijPVET3DtFHP4JKPo0VOv2iVVeCOgBH60kW5J6S6jR5ocznb+avNNq
         esOD26ZSFMcfondJzxPf59Y+xIISPbcENogN2vqqY7/CN6Ui4hs2guppBHFRuVtaLLte
         jJ3g==
X-Gm-Message-State: ANhLgQ3O5z0MKZE9wGU+niU0bUHgGNH0gDvxQnyy7SSC4C49VPe9AEPF
	gxs7+TAZ0bRjUmXfr5MjlMKu0Uf4npUiBDPdncE=
X-Google-Smtp-Source: ADFU+vsKhjBLhl7nq1LCb21O9O26uK44mXEYP+UBF0zr0fnz8nvie1dVuR15rehF0bzPdJtOCdsGa16yl/LuwOUT1YI=
X-Received: by 2002:a37:bec5:: with SMTP id o188mr25323489qkf.165.1585057597613;
 Tue, 24 Mar 2020 06:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200323232529.3658577-1-raj.khem@gmail.com> <abaddad171ffa75900059fffee546157544befae.camel@linuxfoundation.org>
In-Reply-To: <abaddad171ffa75900059fffee546157544befae.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 24 Mar 2020 06:46:11 -0700
Message-ID: <CAMKF1sqQ2J-vG3S=L8uNAoCGw_ktnqtgZeuPxrAJ7Sxf-DCgew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lto.inc: Add global LTO distro policy file
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 24, 2020 at 1:37 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-03-23 at 16:25 -0700, Khem Raj wrote:
> > Distros which want to enable LTO can utilize this file, it only
> > covers
> > packages from OE-Core, other layers should include there own
> > exclusion
> > list for recipe which dont work with LTO
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/lto.inc | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 meta/conf/distro/include/lto.inc
> >
> > diff --git a/meta/conf/distro/include/lto.inc
> > b/meta/conf/distro/include/lto.inc
> > new file mode 100644
> > index 0000000000..0cedc8deca
> > --- /dev/null
> > +++ b/meta/conf/distro/include/lto.inc
> > @@ -0,0 +1,23 @@
> > +LTO_pn-glibc = ""
> > +LTO_pn-gcc-runtime = ""
> > +LTO_pn-libgcc-initial = ""
> > +LTO_pn-libgcc = ""
> > +LTO_pn-libpam = ""
> > +LTO_pn-elfutils = ""
> > +LTO_pn-perl = ""
> > +LTO_pn-busybox = ""
> > +LTO_pn-libxcrypt = ""
> > +LTO_pn-curl = ""
> > +LTO_pn-libcap = ""
> > +LTO_pn-python3 = ""
> > +LTO_pn-libproxy = ""
> > +LTO_pn-libbsd = ""
> > +
> > +LTO ?= "-flto"
> > +
> > +SELECTED_OPTIMIZATION_append_class-target = " ${LTO}"
> > +TARGET_LDFLAGS_append_class-target = " ${LTO}"
> > +
> > +SELECTED_OPTIMIZATION[vardeps] += "LTO"
> > +
> > +PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
>
> Why do we need to specify the debug split style here?
>

debug file generator does  not generate debugsrc packages with lto i
have not investigates in
detail but its due to the fact that .o files are not normal elf objs

> Cheers,
>
> Richard
>
>
