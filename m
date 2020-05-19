Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.1144.1589925770074392501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 15:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G4E8GuEr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id n5so875726wmd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 15:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JmtShEl54Mnydf4BmVUgUE0p0mebnnAB0QWyprcy+Cc=;
        b=G4E8GuErv5KOzXsgd+v75QqT3pzbDdLlYUL+9lqNWfuAcBYIkaxSh5mXxAftcuAJAP
         pm4BAhTm1g7u6CGdAZE+Ujb4Q/aXzGvza1pAOV9//Vf7/6kfaOsAewVheC9isvwv4Uas
         4Krr8D9ePV+qNl6ALV3uDFNjKefiQzUugWwAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JmtShEl54Mnydf4BmVUgUE0p0mebnnAB0QWyprcy+Cc=;
        b=oaQe/f1uH0GAUVf/VpnLlfQhwwAAwBQke7ksJd5H1kkNSwk7nYvTZVWHC1i39W5vBb
         FVuir9aFeHLTUBiVSJeMUiRDeKQEl4Ls/7I53XdLjE4NK3NB897kqULd2scXlR8642IU
         XtWkUX1S5ue4LRWQ34xyo+DFqpnhmgQ5JBd91G2A3ZTf03FfOOasR/m1BuEHaD3g990Y
         xB8MdPE64B4y2Y5gDCw0xHhMtZ+4kM6Pdwxw4T0tcpCyeOwVd8FlgJBvTM68D1IcYcu/
         coJlaDwPYXuh2Mn+acg5Qll45ODLbNbB7aYvIywVzjqZTyBZ4Flr7o1CGJMtWBi4KLzl
         0wrQ==
X-Gm-Message-State: AOAM531obyUCqhjkyYVtY2rgH4lOTfm4JSv/9UepfvOov3YXULnwohpU
	XmLXcCvKh2NaZLLDtrE25jsNEg==
X-Google-Smtp-Source: ABdhPJzyEphs2K6CjEdPNl0u8hnGlWcUefXO8l4qjvUso/VyP642ITQqxEijjqDh2Kjp+BUIktebFw==
X-Received: by 2002:a1c:5402:: with SMTP id i2mr1518100wmb.185.1589925768417;
        Tue, 19 May 2020 15:02:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j190sm1121864wmb.33.2020.05.19.15.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 15:02:47 -0700 (PDT)
Message-ID: <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package_ipk.bbclass: print opkg output on error
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 19 May 2020 23:02:46 +0100
In-Reply-To: <AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: 
	<AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-19 at 20:36 +0200, Konrad Weihmann wrote:
> in case the opkg command fails in before no output of the tool
> itself was printed to assist the user with debugging the issue.
> Print all output of the tool by using CalledProcessError wrapper around
> the call
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/classes/package_ipk.bbclass | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index c008559e4a..5e7d552cc5 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -223,10 +223,13 @@ def ipk_write_pkg(pkg, d):
>              conffiles.close()
>  
>          os.chdir(basedir)
> -        subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
> -                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
> -                                stderr=subprocess.STDOUT,
> -                                shell=True)
> +        try:
> +            subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
> +                                                            d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
> +                                    stderr=subprocess.STDOUT,
> +                                    shell=True)
> +        except subprocess.CalledProcessError as exp:
> +            bb.fatal("{} failed with {}: {}".format(exp.cmd, exp.returncode, exp.output.decode("utf-8")))
>  
>          if d.getVar('IPK_SIGN_PACKAGES') == '1':
>              ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))

I get the feeling we have a problem with our subprocess calls and
debugging but its hard to know what to do about it. We can patch each
call site like this but it starts to make we wonder whether we need a
general wrapper, or we're missing something in bitbake or elsewhere to
help with things.

There is this code:

http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n378

which is meant to help but it clearly isn't helping/catching all cases.

I think we are going to need to look at a wider/more general solution
or at least have a plan for one.

Cheers,

Richard

