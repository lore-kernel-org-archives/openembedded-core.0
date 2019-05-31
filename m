Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E24207E510
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:05:25 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b18so5804210wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 01:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=cX+KoQoI6ZmOhTk4Jsr9bgL0qzYZpiZf66gWrPKq57A=;
	b=XRWF4jysmRlaTtTjiyJu3TpBCvKL/pPCUr2OFPOXHO/1YrYHB2KPKtXBgsMfjM34K7
	4i0qf2zSxAt9UFF4hBd9Gr1+CNlaCTFdNDFEqgrihF6dY7dHtYgs+LJ2PE3a4vxZBv3o
	aW2hFXQAQeke4Rs43ur84moq/bxj43EBtSQsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cX+KoQoI6ZmOhTk4Jsr9bgL0qzYZpiZf66gWrPKq57A=;
	b=rv1Qzl6dngBeELRXpD+oASiPXUMxiqXCOB80ZeAAJnOH8JMDTQwdo/TZVjH8K2kd/0
	yNsid26/nJrUbL4iVF0UV0vdNbZjWNnzPcMt1bCZvDdXKDgO0rO3Guf3+sMGAtZ4jzTw
	X5lN6GXAm38RIotf2C1oKiK/ieV18Xc1wxxHEq6q1qlKeS7Oa5wvc21YxZliuGLVhbKn
	S2bgMKCGoyS/s1UJI2RSMrx2DfM5CMJFF7xzyIsQfkugmWlbi5yrmeHmX+FVh+WjJGB/
	al2qmlUFzjXHcZToWXl2v57P2yNSJl41XWwdx9VUFicNxzXawOTv9NRqOcVaPW2+h4RA
	d00Q==
X-Gm-Message-State: APjAAAUdJTYtEnloSWdbggIZT4nnjOLVazHJ8ewmtZ2A3HL7+JzLaRB6
	PBWFLaWO+y4EfBGTKfm2amFMnQ==
X-Google-Smtp-Source: APXvYqw7Ygy+PuDWWcNXI9iJPGmBMTjNtSWWuuZvZsCo2U952BUfRD4GFdzb20/wguxH7WIB6NDCKQ==
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr5586794wrw.306.1559289926527; 
	Fri, 31 May 2019 01:05:26 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o3sm3379497wrv.94.2019.05.31.01.05.25
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 01:05:25 -0700 (PDT)
Message-ID: <b102cae942b39bdae25026e645e3ae92dddbf9e7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 09:05:24 +0100
In-Reply-To: <20190530184954.2188-1-JPEWhacker@gmail.com>
References: <20190530184954.2188-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] perl: Set build date to SOURCE_DATE_EPOCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 May 2019 08:05:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 13:49 -0500, Joshua Watt wrote:
> Perl uses an internal #define called PERL_BUILD_DATE as the string for
> the date when perl was built. If undefined, it defaults to using
> __DATE__ and __TIME__, which is not reproducible. If SOURCE_DATE_EPOCH
> is set at do_configure time, use it to generate a reproducible string
> for PERL_BUILD_DATE.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-devtools/perl-sanity/perl_5.28.2.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
> index f175e87a12e..b74acfbbc4d 100644
> --- a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
> +++ b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
> @@ -34,7 +34,7 @@ S = "${WORKDIR}/perl-${PV}"
>  
>  inherit upstream-version-is-even
>  
> -DEPENDS += "db gdbm zlib virtual/crypt"
> +DEPENDS += "db gdbm zlib virtual/crypt coreutils-native"
>  
>  PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
>  
> @@ -90,6 +90,12 @@ do_configure_class-native() {
>      -Ui_xlocale
>  }
>  
> +do_configure_append() {
> +    if [ -n "$SOURCE_DATE_EPOCH" ]; then
> +        echo "#define PERL_BUILD_DATE \"$(date --utc --date="@$SOURCE_DATE_EPOCH")\"" >> config.h
> +    fi
> +}
> +

As discussed on irc, lets see if we can avoid a coreutils-native
dependency and use python to do the conversion (or similar).

Cheers,

Richard


