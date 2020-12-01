Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.8203.1606819057932508620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 02:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=crwz2YPi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t4so1833994wrr.12
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 02:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ZzLQmvP/xQ45zplchVNphTkq7I/10vdKroaPIxKIMt4=;
        b=crwz2YPixnpYkhG9rZ/yIG0fEbwGSMU5GAjYAJ+dWc2WBMABSdj0W6ChykZJRX9gPd
         G2wDQjgdo3N0uEuRB02d1iKUjGms+EgjA/w+TwfNIfpbVff3fcoJibxoB93hGRaWVj6C
         2ATWcdbT08as2IX+c5Nb3fR8M2irrnWj69XFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZzLQmvP/xQ45zplchVNphTkq7I/10vdKroaPIxKIMt4=;
        b=QIgqbhOJ6seAWAV2XPIkzYI6KJGXi1ADwdEvQcZuzs6OpmngOE47zRgj0ZhUCJLBtv
         SSIOIW3AEpvnNxqOOWW+W3W/LLaO4KpH2xcR6z/jQ7gXcDwaWSFYxp58wpmPPi2er9kg
         YvbcrxuDvlWmBttkr4QqX0uvZqthsmPeKpTktnFyYo4s7U2o+sWN2FeOJLZ2tX9aTOE3
         nGhXEQPaT4Y6DZD5CCkP6qkFEDyi5h0VlH0cwmTn1RspOsVKrhOjrJmIXxaYTIB9okba
         i+lM3jZOCsRSMAceNZuRhbCTApvbHV8Ps+0D+SvbEeu20t1gjwhzJg+8U5lEaALDVnYr
         0xbQ==
X-Gm-Message-State: AOAM531HAQVu0SMsYboUHBp7bXHjvI7Co9cru1NSCipc42JjLr1oWRHK
	WKnMn7Nm4cImmJOhkqHmqE5LSw==
X-Google-Smtp-Source: ABdhPJyUPsH1nyuyGEnRYHIhgoYvAwL0leWMiJjBhb66vssxbbhsUCsGLCgeMedevJDupTvtWm+kZA==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr2992612wrv.181.1606819056419;
        Tue, 01 Dec 2020 02:37:36 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b1c8:3e5a:82cc:7486])
        by smtp.gmail.com with ESMTPSA id g11sm2437796wrq.7.2020.12.01.02.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 02:37:36 -0800 (PST)
Message-ID: <2d6b4cd69ed05454b7936f0a3a1c320db1c56558.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] procps: split into binary subpackages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
Date: Tue, 01 Dec 2020 10:37:34 +0000
In-Reply-To: <20201201034326.11447-1-okaya@kernel.org>
References: <20201201034326.11447-1-okaya@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-12-01 at 03:43 +0000, Sinan Kaya wrote:
> This change allows you to pull individual binaries into the
> target without including the entire suite.
> 
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  meta/recipes-extended/procps/procps_3.3.16.bb | 51 +++++++++++++++++--
>  1 file changed, 48 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
> index 2810ebd285a..1b62ae33f5c 100644
> --- a/meta/recipes-extended/procps/procps_3.3.16.bb
> +++ b/meta/recipes-extended/procps/procps_3.3.16.bb
> @@ -50,15 +50,13 @@ do_install_append () {
>  
>  CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
>  
> -bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
> +bindir_progs = "free pkill pmap pgrep pwdx skill slabtop snice tload top uptime vmstat w"
>  base_bindir_progs += "kill pidof ps watch"
>  base_sbindir_progs += "sysctl"
>  
>  ALTERNATIVE_PRIORITY = "200"
>  ALTERNATIVE_PRIORITY[pidof] = "150"
>  
> -ALTERNATIVE_${PN} = "${bindir_progs} ${base_bindir_progs} ${base_sbindir_progs}"
> -
>  ALTERNATIVE_${PN}-doc = "kill.1 uptime.1"
>  ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
>  ALTERNATIVE_LINK_NAME[uptime.1] = "${mandir}/man1/uptime.1"
> @@ -69,8 +67,55 @@ python __anonymous() {
>  
>      for prog in d.getVar('base_sbindir_progs').split():
>          d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
> +
> +    for prog in d.getVar('bindir_progs').split():
> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('bindir'), prog))
>  }
>  
>  # 'ps' isn't suitable for use as a security tool so whitelist this CVE.
>  # https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
>  CVE_CHECK_WHITELIST += "CVE-2018-1121"
> +
> +python __anonymous () {
> +    packages = []
> +    for prog in d.getVar('bindir_progs').split():
> +        pkg = "procps-%s" % prog.replace("_", "-")
> +        packages.append(pkg)
> +        d.setVar("RDEPENDS_%s" % pkg, "procps-lib")
> +        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
> +        if not d.getVar("FILES_%s" % pkg):
> +                d.setVar("FILES_%s" % pkg, "${bindir}/%s*" % prog)
> +    for prog in d.getVar('base_sbindir_progs').split():
> +        pkg = "procps-%s" % prog.replace("_", "-")
> +        packages.append(pkg)
> +        d.setVar("RDEPENDS_%s" % pkg, "procps-lib")
> +        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
> +        if not d.getVar("FILES_%s" % pkg):
> +                d.setVar("FILES_%s" % pkg, "${base_sbindir}/%s*" % prog)
> +    for prog in d.getVar('base_bindir_progs').split():
> +        pkg = "procps-%s" % prog.replace("_", "-")
> +        packages.append(pkg)
> +        d.setVar("RDEPENDS_%s" % pkg, "procps-lib")
> +        d.setVar("ALTERNATIVE_%s" % pkg, prog.replace("_", "-"))
> +        if not d.getVar("FILES_%s" % pkg):
> +                d.setVar("FILES_%s" % pkg, "${base_bindir}/%s*" % prog)
> +    pkg = "procps-man"
> +    packages.append(pkg)
> +    if not d.getVar("FILES_%s" % pkg):
> +            d.setVar("FILES_%s" % pkg, "${mandir}/*")
> +    pkg = "procps-lib"
> +    packages.append(pkg)
> +    if not d.getVar("FILES_%s" % pkg):
> +            d.setVar("FILES_%s" % pkg, "${libdir}/*")
> +    pkg = "procps-sysctl"
> +    d.appendVar("FILES_%s" % pkg, " ${sysconfdir}/sysctl.conf")
> +
> +    d.setVar("PROCPS_PACKAGES", " ".join(packages))
> +}
> +# "procps" is a metapackage which pulls in all procps binaries
> +PACKAGES += "${PROCPS_PACKAGES}"
> +PROVIDES += "${PROCPS_PACKAGES}"
> +FILES_${PN} = ""
> +ALLOW_EMPTY_${PN} = "1"
> +RRECOMMENDS_${PN} += "${PROCPS_PACKAGES}"

I am starting to get a little worried about the direction these patches
are heading in. How much of the system are we going to split into
individual package per binaries?

At some point the packages stop becoming useful and you have to
consider whather package management is the best way to build these
rootfs since I doubt you're enabling package management in the end
result anyway given the size gains you're aiming for?

I'd like to understand and discuss the end goal here before we merge
too many large chunks of custom python like the above?

An alternative may be to create a library function which can be
optionally enabled for recipes as this code and the other code you sent
does look similar, at least superficially...

Cheers,

Richard




