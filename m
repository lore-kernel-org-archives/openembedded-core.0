Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.12041.1593511319124189636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 03:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MOlEIRN2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id z13so19487382wrw.5
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iesW9xWG85QA1K2bBV7PaUlHrbcv5Kki6fKvsrhYJdo=;
        b=MOlEIRN2Rt8RaDET8D+1VJ5stl/mtlBL93pI8I3b9EF9iz5nnVuraqNLdJWtmPaJ8m
         lDHiDRPY7X3fSmF+b2/QFJtO8+NhG+MYtFuS5v9uqvhqPRX2C9lGjEhXbptIaGI16pS9
         Glb7AXA4A8iOptqkbpvi6QDEWKuXwqP9ZchPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iesW9xWG85QA1K2bBV7PaUlHrbcv5Kki6fKvsrhYJdo=;
        b=SgBPNjxXmnMAAvYmou7wwrLo35iRMrdksuecAqy1ayNQuvTSUYOWteQa+LGG5ChEVt
         EQD8VMd/HeQeJJqxq+3xvLlRtEFzmM7RGZhZ6RoF2SzGXbKiQ6n1cU7QSRygae7dpaO7
         DKkhovUe5HsTrz8FsplZttrK60adBvHUbS9obxEeYowCQwxgcLpxf+Y4EzPTP0kjdEA1
         6ekx6puDACrgcmw1CA+DN2vIgerwVHrDNmLBjaAx7rt7i7HrFaxv+GVwvOQQ5VGFSliE
         zT1+UyKtATp2WpxohiPNetjyNdbYVJFwiCq1KqMZSIQcFKyGufGtWVx52JO7BAxjTPOF
         oShQ==
X-Gm-Message-State: AOAM5337SLTCUjAzI3Gts6L3FdXayT/99c9Szj5mHRuqcFObrP2cujrK
	sdO5s3AdbLaP+YL0zcbBIbD1mg==
X-Google-Smtp-Source: ABdhPJzyWRG3d6tMIAEVAc4urJqV6IYbXkO1BoezAPrtNMV3z0a0iraOMBu2Yu1WenpGVYqUAdk8zA==
X-Received: by 2002:adf:8067:: with SMTP id 94mr20163867wrk.427.1593511317359;
        Tue, 30 Jun 2020 03:01:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g195sm3087812wme.38.2020.06.30.03.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 03:01:56 -0700 (PDT)
Message-ID: <5c6132dcb03b32e9798eb96a437af3dcf650d6c6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gtk-icon-cache.bbclass: update RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2020 11:01:55 +0100
In-Reply-To: <20200630094907.1396284-1-changqing.li@windriver.com>
References: <20200630094907.1396284-1-changqing.li@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-30 at 17:49 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix error:
> + /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
> /var/tmp/rpm-tmp.mdYxY6: line 12: /usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-
> query-loaders: No such file or directory
> %post(adwaita-icon-theme-3.36.1-r0.0.noarch): waitpid(2961) rc 2961
> status 7f00
> warning: %post(adwaita-icon-theme-3.36.1-r0.0.noarch) scriptlet
> failed, exit status 127
> 
> when install adwaita-icon-theme, which inherit gtk-icon-cache
> on target, above error reported,  fix by add needeed packages
> in RDEPENDS
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes/gtk-icon-cache.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-
> icon-cache.bbclass
> index 91cb4ad409..7f218ce7ae 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -4,6 +4,8 @@ DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' ==
> 'hicolor-icon-theme']} gtk
>  
>  PACKAGE_WRITE_DEPS += "gtk+3-native gdk-pixbuf-native"
>  
> +RDEPENDS_${PN} += "gdk-pixbuf gtk+3"
> +
>  gtk_icon_cache_postinst() {
>  if [ "x$D" != "x" ]; then
>  	$INTERCEPT_DIR/postinst_intercept update_gtk_icon_cache ${PKG}
> \

This isn't quite right since the postinst may be added to a package
other than ${PN}.

You need to add the RDEPENDS to the code:

        rdepends = ' ' + d.getVar('MLPREFIX', False) + "hicolor-icon-theme"
        d.appendVar('RDEPENDS_%s' % pkg, rdepends)

later in that class.

Cheers,

Richard

