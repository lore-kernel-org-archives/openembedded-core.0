Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BE8CD6E79
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:05:05 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75129.1780995897065450807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=buyshN++;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so3192542a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 02:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780995895; x=1781600695; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B660RyaBeeK2Jto8U7GUOpiwkrpZah8CIfSMPOn7aPk=;
        b=buyshN++DhTiXKl3hyD1yPFQ9MHYzKf6L9SJYgbeC+wQSJ7Yo25ot24s7V9YcRNafa
         54PS3bTsKwhA77G0WLzI7c7Hj1AOgMpyCvm8qo/PEKMZxpAs+hhgONY+DcfTBQTL2t6A
         d3I3DDcOaokswJS4n+yOl9fGEDbCxAocXGLfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995895; x=1781600695;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B660RyaBeeK2Jto8U7GUOpiwkrpZah8CIfSMPOn7aPk=;
        b=PLJ1XUUFHTH6ZOdU1iWufMwOWzNdTNs2DSuqN1SCC7VQXkpKJoYLzNnfYbfO7B216A
         qCO8pFPS0s670XZXoPzYuYfXMgihemBOhbyKiQWjlZSUDG0arUQLm8U63i1szYxE7Y7p
         304vGQMUO3tCSWFRUfr/M1fVdMJZwPoKdXXrjWUZFlzkP41bP86BDseOdXsecmaU3axH
         unMWWiyvLbdj3xfxY04sbXqHOKi9/0JAikCS3iu4Wx0llSS8lM2AcmhaF6M56ErxTwLY
         qFySfH5vnwKMk1XbTw5PaG7R+/+WoTem2nucQ1P7cUFGkbt4qIjlF7pqnmvXh5k9nres
         utuQ==
X-Forwarded-Encrypted: i=1; AFNElJ//vi/FmHeeM63m9awbTSWYh1R6s7zHS53udL/QDRYUZnE/8yM9RYYf1Yg/pNNmx6Q8pzoZwxWIhuqp9kR1y4f7FA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyyI6j+pAoBjYD4aO5Ia4+29v+3N6+RBNFEdc3oa79Dwe05g4cB
	sHS3XCtE5QGYmBlrc/rO0FOVEIdUeHsv+SMCUGFN9vNq9WRAK3k8iEGUb/mA9agwmsM=
X-Gm-Gg: Acq92OF89M3Qm193FaADDeJ8hHawrj3OH9z4MdulxsCualkRIChoDBQUznVTlVE9cdf
	wfnUPoOr+WwKSfJFavLBPMiW27VACxfECpXX6G3Wfo1KrQ/+VPPvWKi0uy9W6FThvcfLvk0nAQs
	EWwxVBYpyeYn7TzBFOkXLini9miR6fimH4STUQfG90fuwz4ksEVlXOghxwOBrdq1eXp9riYR6XX
	d3UiWV7tLeKj8+qM7qAyksq58Uhh6gLkcMeKqlSatPGIVpVvGFQiFWBc4R5aRgSFYUmbXtuTcSI
	7oQtlnHp8XNwMYjO7wH7XUl/G5jXWQdRqVssfl1jYa6IQr45qpdc1IsnhMgwazRy9VQz7Cfse+Y
	dDw6vtKfIQOlx7Rv/aKHD7iVjDzJcE/dEFXk4AUlR+IFcFGNfug3j5w8OoKwjiv2fsoAqma/U6H
	gty+OjkNYLzSTMPBbiNldoyZ7+nzBgqUDQkweD+TUHHGmEdY5Gc1H+Tn7y9eXqB8oIOV2kR1Qln
	Iens4kJBk496PZhShATeOlsNpA=
X-Received: by 2002:a05:6402:40d0:b0:691:956a:cf68 with SMTP id 4fb4d7f45d1cf-691956ad249mr5727408a12.7.1780995894906;
        Tue, 09 Jun 2026 02:04:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1? ([2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6914f3b583bsm4279823a12.29.2026.06.09.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:04:54 -0700 (PDT)
Message-ID: <a01cd748059cde8b428886ae7554debbb3f7b63d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] texinfo: add missing perl module runtime
 dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, xiaozhan.li.cn@windriver.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Jun 2026 10:04:53 +0100
In-Reply-To: <DJ4DBGVTHOHE.3UWS9A74I2JNX@bootlin.com>
References: <20260608081230.1144463-1-Xiaozhan.Li.CN@windriver.com>
	 <DJ4DBGVTHOHE.3UWS9A74I2JNX@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 09:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238281

On Tue, 2026-06-09 at 10:16 +0200, Mathieu Dubois-Briand via lists.openembe=
dded.org wrote:
> On Mon Jun 8, 2026 at 10:12 AM CEST, Xiaozhan Li via lists.openembedded.o=
rg wrote:
> > Some makeinfo commands like makeinfo --version, makeinfo --html fail on=
 target
> > with errors like:Can't locate xxx.pm in @INC
> > This is because texinfo's texi2any requires several core Perl modules
> > that are split into separate packages in OE. Add the missing modules
> > to RDEPENDS so they are pulled into the image automatically.
> >=20
> > Signed-off-by: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
>=20
> It looks like this is breaking some builds on the autobuilder:
>=20
> ERROR: buildtools-tarball-1.0-r0 do_populate_sdk: Could not invoke dnf. C=
ommand '/srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-=
nativesdk-pokysdk-linux/buildtools-tarball/1.0/recipe-sysroot-native/usr/bi=
n/dnf -v --rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/buildtools=
/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0=
/sdk/image/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/srv/pokybuild/yocto-work=
er/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtool=
s-tarball/1.0/sdk/image/etc/yum.repos.d --installroot=3D/srv/pokybuild/yoct=
o-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/bui=
ldtools-tarball/1.0/sdk/image --setopt=3Dlogdir=3D/srv/pokybuild/yocto-work=
er/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtool=
s-tarball/1.0/temp --repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/bui=
ldtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarb=
all/1.0/oe-sdk-repo --nogpgcheck install nativesdk-buildtools-perl-dummy na=
tivesdk-ca-certificates nativesdk-chrpath nativesdk-git nativesdk-git-perlt=
ools nativesdk-libacl nativesdk-libnss-nis nativesdk-lz4 nativesdk-make nat=
ivesdk-mtools nativesdk-ncurses-terminfo-base nativesdk-patch nativesdk-pig=
z nativesdk-python3 nativesdk-python3-git nativesdk-python3-jinja2 nativesd=
k-python3-pip nativesdk-python3-pyyaml nativesdk-python3-setuptools natives=
dk-python3-subunit nativesdk-python3-testtools nativesdk-python3-websockets=
 nativesdk-rpcsvc-proto nativesdk-sdk-provides-dummy nativesdk-tar nativesd=
k-texinfo nativesdk-wget nativesdk-zstd' returned 1:
> ...
> Error:
> =C2=A0Problem: package nativesdk-perl-module-locale-5.42.0-r0.x86_64_nati=
vesdk from oe-repo requires nativesdk-perl-module-config, but none of the p=
roviders can be installed
> =C2=A0 - package nativesdk-texinfo-7.3-r0.x86_64_nativesdk from oe-repo r=
equires nativesdk-perl-module-locale, but none of the providers can be inst=
alled
> =C2=A0 - package nativesdk-buildtools-perl-dummy-1.0-r0.buildtools_dummy_=
nativesdk from oe-repo conflicts with nativesdk-perl provided by nativesdk-=
perl-5.42.0-r0.x86_64_nativesdk from oe-repo
> =C2=A0 - package nativesdk-buildtools-perl-dummy-1.0-r0.buildtools_dummy_=
nativesdk from oe-repo conflicts with nativesdk-perl-module-strict provided=
 by nativesdk-perl-5.42.0-r0.x86_64_nativesdk from oe-repo
> =C2=A0 - package nativesdk-buildtools-perl-dummy-1.0-r0.buildtools_dummy_=
nativesdk from oe-repo conflicts with nativesdk-perl-module-warnings provid=
ed by nativesdk-perl-5.42.0-r0.x86_64_nativesdk from oe-repo
> =C2=A0 - package nativesdk-buildtools-perl-dummy-1.0-r0.buildtools_dummy_=
nativesdk from oe-repo conflicts with nativesdk-perl-module-vars provided b=
y nativesdk-perl-5.42.0-r0.x86_64_nativesdk from oe-repo
> =C2=A0 - package nativesdk-buildtools-perl-dummy-1.0-r0.buildtools_dummy_=
nativesdk from oe-repo obsoletes nativesdk-perl provided by nativesdk-perl-=
5.42.0-r0.x86_64_nativesdk from oe-repo
> =C2=A0 - conflicting requests
> (try to add '--allowerasing' to command line to replace conflicting packa=
ges or '--skip-broken' to skip uninstallable packages)
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/3912
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3896
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3866
>=20
> Can you have a look at the issue?

In case it isn't clear, you probably need to add some of your additions
to the PROVIDES of some of the dummy modules to make sure the nativesdk
builds still work.

Cheers,

Richard

