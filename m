Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.408.1597423801439722035
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 09:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K0rj4UIY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id r2so8923718wrs.8
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hQGmzUfwiVgdvN0vmF3xqfJWKRIi/rqhhFq3880floQ=;
        b=K0rj4UIYWnOee8MjbTFfGLAYDBrTkZL4SioOsepY1a/B7ycdtsjds04829E01J+SfD
         hup2D0g+lLkFEK5gZxPceNkbSdfwAo2w36GxSURXAIjBW2RnA+lASR/sum3caMLqPx+R
         AG+ZsEi8GWVUXzUc7BhNlxb5R18c+IQKjwWog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hQGmzUfwiVgdvN0vmF3xqfJWKRIi/rqhhFq3880floQ=;
        b=Nu3ioEjX89/45UTbA/A8YTA0m1lQmd3z/WFR7lJTeUFoCnibpUiXE1vvjt85SoAZu/
         shkAcT4p69iDCcTybZVFhahCvJT5yK/dMWZJFdGkAk+peqoX+QCeYxk8lZviGGztFvy2
         CoRhx0FtKgwm9txmfQu4hJs+FV/uDdTfMgMfZLk+ZHL+s+VDKGG9etFLvLtDZ1E/8Cxm
         G2uO10MCZJVfOUEItiG/vW3+4ZwcXwjG5vdAWUL/fz24tOCz64saJkY0RUW8e9/AyGux
         AAPFMZI0Z2yGI8GOics8ZR//CV2Jrivll43a0UGGPKTYB+QiH22MVan4GmyGsstjzenj
         Y4rA==
X-Gm-Message-State: AOAM531tHolmt+7VxBNRHRQg2AizXDSYdL8TkNp6C5BKYJR/sMWrFwmx
	pPNeWkd+evpjKde+27eeV7sBGA==
X-Google-Smtp-Source: ABdhPJyKqI9cdSkkrkrHcGCtewl/EzbSxk0M9PaNMO5+jHqZQRo35VfTvUopL7ZsDisSZ4IYvLkrEA==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr3299371wrn.385.1597423799948;
        Fri, 14 Aug 2020 09:49:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:edc4:7dfa:277e:8b29])
        by smtp.gmail.com with ESMTPSA id c10sm16416792wrx.15.2020.08.14.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 09:49:59 -0700 (PDT)
Message-ID: <a6acd2d8a5d7389363d3e45b230c253ccbdc5e91.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2] gpgme: fix multilib header conflict
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2020 17:49:58 +0100
In-Reply-To: <20200814063112.333841-1-changqing.li@windriver.com>
References: <162B0E429CD0C931.6763@lists.openembedded.org>
	 <20200814063112.333841-1-changqing.li@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-14 at 14:31 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix error:
> file /usr/include/gpgme.h conflicts between attempted installs of gpgme-dev-1.13.1-r0.core2_64 and lib32-gpgme-dev-1.13.1-r0.core2_32
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-support/gpgme/gpgme_1.13.1.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
> index 9fc1ae24a4..b51534351d 100644
> --- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
> +++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
> @@ -59,7 +59,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
>                   --disable-lang-python-test \
>  '
>  
> -inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT}
> +inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT} multilib_header
>  
>  export PKG_CONFIG='pkg-config'
>  
> @@ -83,3 +83,7 @@ do_configure_prepend () {
>  	rm -f ${S}/m4/libassuan.m4
>  	rm -f ${S}/m4/python.m4
>  }
> +
> +do_install_append() {
> +       oe_multilib_header gpgme.h
> +}

These kinds of changes are hard to review. Could you please include a
diff of the header issues in the commit message please?

Cheers,

Richard

