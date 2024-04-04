Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A54CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 14:17:04 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.39204.1712240220477172156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 07:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vry0CGTl;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516a01c8490so1983154e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712240219; x=1712845019; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cmV5gPICGV/yArXdAvNpO9KAqN9vRFNocTLSfUDk0n8=;
        b=vry0CGTl2k+I/NmUaHsh15FmTtqzaYLwqMiwuBOuJOqaoHLbzqzxTIg3mzzY8LtcqG
         BQQBp7AQLhPZPu6DZcuC0fBUE7oqyLrDwJvi73a1/L1tBwFvbefqHxwnY8QXSptHo8ui
         xIrhDW1iAnUr783JVOSWyj6Eq3YOEKGJ7LQYhThveRdK+j6JcUCMcFBf+laj/QkvV/3g
         2nurG8Fr1bfoTop4QIfrw4InT5ToH1P5eek9wpBLJIi4eMAmKZruZ9jHXRj5D7Fw8dip
         L2jQmFBORrh8RKn88lFj20nq+WN8aqNPEaVNLPqyyLOuyKRjtltYYAf03fhxCyAEc4Nc
         EzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712240219; x=1712845019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmV5gPICGV/yArXdAvNpO9KAqN9vRFNocTLSfUDk0n8=;
        b=MirDT3urA9DE6D74b//qssj2efwq8oa8UNfi09GXZH7mtD+zTqAkb7rq9nqiqriTQS
         8FwKbLyGp6RkxGVABtS2FH5H4DLzT3t9K1ZZ9WA0gNeJ+5KEfYww35bUw7zIW6Jmu5fr
         UhfCmB/Bm6tVGjWT6w/dIg6/EKlUf9p4Pp7qs+ecPV9BH6zxGSyNQMZPftZz3hus8VCi
         F+KvmLkaKG2ZEJmBZx5ymivjMvndW4VE9Ew1NqJ1VV/R89nZKsjPECq+QukSC8CXDTra
         Bkycx/wQlvpDEzKgKByPIusBPaGRZsT11ZRhk49hwE6KCkWJPXY08dJlEcc8i8XzWe0o
         me5A==
X-Gm-Message-State: AOJu0YyfwWE3EGKEhp7zRcqUJ5c8u4m6Bk+SwE6wK6rAYIgPOEbFtq+I
	WCwKqo7FU6jBR8d+H35cdPKtVXYbbgrYTIViu5fONrQjb16944QSKV/C8NZQq1c=
X-Google-Smtp-Source: AGHT+IHqxGmerrx+GFlO72p+BTtJ6f9oJRqH7EVHsWGUc7UMeUWy4z3ddF3119QW3InSJ6WQM2RiNg==
X-Received: by 2002:ac2:5f97:0:b0:515:d3e4:4581 with SMTP id r23-20020ac25f97000000b00515d3e44581mr2242502lfe.30.1712240218646;
        Thu, 04 Apr 2024 07:16:58 -0700 (PDT)
Received: from nuoska (drt4d6yywjht56pm8q3st-3.rev.dnainternet.fi. [2001:14ba:7430:3d00:1239:a19d:315c:6ddf])
        by smtp.gmail.com with ESMTPSA id d11-20020a05651233cb00b00515d106fec5sm1942082lfg.283.2024.04.04.07.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 07:16:58 -0700 (PDT)
Date: Thu, 4 Apr 2024 17:16:55 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [OE-core] [PATCH 2/2] curl: disable ca-certificates.crt path
 setting for native build
Message-ID: <Zg62V6u3HKPqsjHk@nuoska>
References: <20240404132902.68631-1-mikko.rapeli@linaro.org>
 <20240404132902.68631-2-mikko.rapeli@linaro.org>
 <e9e514b8e6efd729c33c7dd99706397c745c8ad2.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9e514b8e6efd729c33c7dd99706397c745c8ad2.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 14:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197968

Hi,

On Thu, Apr 04, 2024 at 03:13:08PM +0100, Richard Purdie wrote:
> On Thu, 2024-04-04 at 16:29 +0300, Mikko Rapeli wrote:
> > If linux-yocto-dev is compiled without specific SRCREV, it uses
> > AUTOREV which tries to update to latest available commit. This is
> > currently failing with these steps:
> > 
> > $ rm -rf tmp*/work/*/linux-yocto-dev && \
> > bitbake -c do_configure mc:machine:linux-yocto-dev ; \
> > bitbake -c do_clean mc:machine:linux-yocto-dev
> > [...]
> 
> > The variable dependency chain for the failure is: fetcher_hashes_dummyfunc[vardepvalue]
> > 
> > ERROR: Parsing halted due to errors, see error messages above
> > 
> > Summary: There were 6 WARNING messages.
> > Summary: There were 2 ERROR messages, returning a non-zero exit code.
> > 
> > This state is not recoverable with bitbake calls. All of them fail from now on.
> > "rm -rf tmp/work/*/linux-yocto-dev" recovers the situation
> > and bitbake commands work again.
> > 
> > Root cause is curl-native, dependency of git-native, which
> > has --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt
> > which for native build target is wrong and points to curl-native build
> > directory path
> > /home/builder/src/base/build/tmp_poky/work/x86_64-linux/curl-native/8.6.0/recipe-sysroot-native/etc/ssl/certs/ca-certificates.crt
> > 
> > Since git is a build time host package dependency listed in
> > https://docs.yoctoproject.org/dev/singleindex.html#build-host-packages
> > then its dependencies like curl and ca-certificates are too, it should
> > be safe for curl-native to use the default host ca-certificates path
> > instead of the one in recipe specific sysroots which would need to be set with complicated
> > environment variables. Set non-default ca-certificates path only for
> > target and nativesdk builds.
> > 
> > Reported-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/recipes-support/curl/curl_8.6.0.bb | 7 ++++++-
> > �1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-support/curl/curl_8.6.0.bb b/meta/recipes-support/curl/curl_8.6.0.bb
> > index 49ba0cb4a7..da5571ca14 100644
> > --- a/meta/recipes-support/curl/curl_8.6.0.bb
> > +++ b/meta/recipes-support/curl/curl_8.6.0.bb
> > @@ -73,11 +73,16 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
> > �EXTRA_OECONF = " \
> > ���� --disable-libcurl-option \
> > ���� --disable-ntlm-wb \
> > -��� --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
> > ���� --without-libpsl \
> > ���� --enable-optimize \
> > ���� ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
> > �"
> > +EXTRA_OECONF:class-target = " \
> > +��� --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
> > +"
> > +EXTRA_OECONF:class-nativesdk = " \
> > +��� --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
> > +"
> > �
> > �fix_absolute_paths () {
> > �	# cleanup buildpaths from curl-config
> 
> This change is fraught with danger :(.
> 
> I have a feeling we've gone around in circles as in some cases you
> don't have the ca-certs on the host, or they're in unusual paths so the
> previous conclusion was we should always have them present in the
> sysroot if curl-native is being used. Yes, that does mean we have to
> set the environment correctly to relocate curl's paths appropriately.
> 
> Certainly at this point in the release cycle I'm very nervous about
> changing this around.

No worries, 421083c46c97bf758496b8c58402aea5d74aa097 already on master fixes
the issue. We're lagging few weeks behind master branch but trying
to catch up.

Cheers,

-Mikko

