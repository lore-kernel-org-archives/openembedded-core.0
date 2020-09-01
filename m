Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.15683.1598974226191400371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 08:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ze8/jmSM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id q9so1589075wmj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 08:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=w8WVtA2qFG60utrzaf2ubkRYyA8ipU2tk752PiEuddA=;
        b=Ze8/jmSMoZHfIJjRlT1d/lEdCjSheouSUch0fhVobFz+AnxTluH5LgdOpfAdaaq4ql
         dzDm6L73vY/WLfPOPAH9RQNHNClrI8nWzWRdEwzuD7rhDBoF1S+mmHQikD07oVefxj5E
         1RKWTprtt0tbGo0zFFmEe3AMQ1FjLgPohXyWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=w8WVtA2qFG60utrzaf2ubkRYyA8ipU2tk752PiEuddA=;
        b=das2w0yln6nbYnTwHc9yA50KvkFQasSBndPI6x3PnBY3zL4pM/1bsTJlvBSoLeRyat
         4o3qCGqAe9fJxBR9PHS7ibbqneM5RW4W1A1+DLfA8XlVJYtJriz702fcaDtsn+m98raF
         LyowXwZmcz5F72iaRr6qCNLgrGIET6awxvZO5FyRTdZNAXvgDGh6+0yhoRrQRq22L2A4
         neL2yg/eLiSxPVKSz27zqM1doSgXKm4yQ3FEulD6H2nbyazGDL68sFn4vgTH47jU/00T
         aQFwoxYILb6ZhBeYuBhE/Dgdt7ZUKlO86sVZ/eAGfwvdEFKVYkaFaA8wUpkjmXRPmHJm
         Jnaw==
X-Gm-Message-State: AOAM531M9IKKOi1qhk1/2Uh/lbnZTSzHYxS7Gj8+7hxpQ/fG+PD+4KA7
	/sHAbz3qk9AFdbG99FS8NhkjFw==
X-Google-Smtp-Source: ABdhPJxV2FrsVLD8FzffWilXvqOFLL/Ss+DRrgMULDcXSoDlcf5NRqupEZBH9SZH5wgcvYdMQFR/Gg==
X-Received: by 2002:a1c:a746:: with SMTP id q67mr2458705wme.128.1598974224463;
        Tue, 01 Sep 2020 08:30:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d5a2:f86:9f9a:72df])
        by smtp.gmail.com with ESMTPSA id b1sm2740497wru.54.2020.09.01.08.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:30:23 -0700 (PDT)
Message-ID: <7b9cc8aa19ed85ce167fa577bafaa053f1a0e172.camel@linuxfoundation.org>
Subject: Re: [OE-core][Patch v2 1/2] xinput-calibrator: avoid defunct process
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Asselstine <mark.asselstine@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Sep 2020 16:30:23 +0100
In-Reply-To: <20200828212920.2919-1-mark.asselstine@windriver.com>
References: <20200828212920.2919-1-mark.asselstine@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-28 at 17:29 -0400, Mark Asselstine wrote:
> The xinput_calibrator_once.sh script produces output on stdout and
> stderr which the current 'Exec' doesn't consume. This results in a
> [xinput_calibrator_once.sh] defunct process which will remain around
> until we exit the X11 session.
> 
> Add a redirect to the Exec which will consume this output and avoid
> the defunct process.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
> 
> V2: * no changes
> 
>  .../recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> index 4f831932e7..c59f97895c 100644
> --- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -31,7 +31,7 @@ do_install_append() {
>      install -m 0755 ${WORKDIR}/30xinput_calibrate.sh ${D}${sysconfdir}/X11/Xsession.d/
>  
>      install -d ${D}${sysconfdir}/xdg/autostart
> -    sed -e 's,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh,' ${S}/scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
> +    sed -e 's,^Exec=.*,Exec=${bindir}/sh -c "${bindir}/xinput_calibrator_once.sh 2>\&1 > /dev/null",' ${S}/scripts/xinput_calibrator.desktop > ${D}${sysconfdir}/xdg/autostart/xinput_calibrator.desktop
>  }
>  
>  FILES_${PN} += "${sysconfdir}/xdg/autostart"

That appears to fail in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/1281/steps/8/logs/step1c

Presumably it should be base_bindir?

Cheers,

Richard

