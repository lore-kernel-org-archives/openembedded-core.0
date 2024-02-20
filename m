Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D990BC48BC4
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 07:42:42 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.8647.1708414956484968890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 23:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MKSy/ZMv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.173, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d208d0b282so68456211fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 23:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708414954; x=1709019754; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cR52hMKi9NR5Pd0p1EUvvtquHBgSZ5W9TqUiVRy+BXM=;
        b=MKSy/ZMvr+/YDHWb/G6G0+g19Kf95k0u4mrXCN9tKWT8LWGFS3ojpI9BpjdSd/Iyjf
         cQzIkwdWL4NANOTeLeIVoYJR9rikmo7UsmVWdc7OdzYunmB5ZrA+CJg/kR99URyTkLAV
         ZwPf3psB5mty7+RFXCjc9dUnmz1L08WgydGW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708414954; x=1709019754;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cR52hMKi9NR5Pd0p1EUvvtquHBgSZ5W9TqUiVRy+BXM=;
        b=HtlyMuWznIseL5PVl1j+K/1HjYKSM4MLWay7lECnABnIRDy08/kwucNZCAhXRqMHDt
         GOO44/Anj7Br/CABbn+1AML3RqPmv7EelQA4jLjTXqfu13EH9QXXPsUSwpzq5vOSA066
         H9riG8frbRdIE9OVBnu1qfki2fshytldoDNwmY2gJHCzlDgIX1K8b7hKB4cB6KRCf0iQ
         3N8mQyWrzTU274gWCvFtwgKHhZl57DdEbG/V4t7P8QuA34QdLLh8EnCADk4r/YbTkE1Z
         NKbXdgPHjpJX1wmliMRycHy1ub8O/4ewjwmhKpvHEQ8/dHIq5esEpJ+kKLKlM7la7Z3p
         StpA==
X-Forwarded-Encrypted: i=1; AJvYcCVjk0wmqRQW8D4Aoeqc1S5l07jh28ZUJPb71sVVsqUeEpHOnZ9JVTfCv9BCh2qt85BlgAwq68O0BZelkLK6wfcNA634xn5Noyoi1tgzfLekZxVTwoS864Uu
X-Gm-Message-State: AOJu0YxdUsmeNtoG4tMVOiE7XRfaPoUEcaN0tQaxd/OADuovo+ilUPPh
	8hrldUuHIDT7DT9aW3L6tCBokaNLy0IeUreuHEUKR7e7f0aGXYZnVJamEBgBFLA=
X-Google-Smtp-Source: AGHT+IFwu4NMjWw2xCDz7DFKB+zS6kEGj9qYIvpFnucpv6L5J9BHIjb0hr0F1NEd77YFudmvDNgIww==
X-Received: by 2002:a2e:8945:0:b0:2d2:2dbb:389e with SMTP id b5-20020a2e8945000000b002d22dbb389emr5432900ljk.23.1708414954074;
        Mon, 19 Feb 2024 23:42:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b883:fc21:a202:c294? ([2001:8b0:aba:5f3c:b883:fc21:a202:c294])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c215000b004104bc8d841sm13445924wml.13.2024.02.19.23.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 23:42:33 -0800 (PST)
Message-ID: <d3665f861467336a8c697f7994336de892a4192b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/package: fix LOCALE_PATHS scan to
 create locale packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan GUILLOT <jonathan@joggee.fr>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2024 07:42:32 +0000
In-Reply-To: <CZ977GGGE9KN.16KHH2G2CQ1NJ@joggee.fr>
References: <CZ977GGGE9KN.16KHH2G2CQ1NJ@joggee.fr>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 07:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195905

On Mon, 2024-02-19 at 16:19 +0000, Jonathan GUILLOT wrote:
> split_locales() must only check subdirectories in paths added to
> LOCALE_PATHS to avoid creating weird packages based on filenames also
> present in paths.
>=20
> Without such a filter, cups recipe adding ${datadir}/cups/templates
> to
> LOCALE_PATHS creates the following incorrect packages:
> - cups-locale-add-class.tmpl
> - cups-locale-add-printer.tmpl
> - cups-locale-admin.tmpl
>=20
> Signed-off-by: Jonathan GUILLOT <jonathan@joggee.fr>
> ---
> =C2=A0meta/conf/documentation.conf |=C2=A0 2 +-
> =C2=A0meta/lib/oe/package.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +++=
++++++-----
> =C2=A02 files changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/conf/documentation.conf
> b/meta/conf/documentation.conf
> index 90d8e82932..b0591881ba 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -271,7 +271,7 @@ LICENSE_PATH[doc] =3D "Path to additional licenses
> used during the build."
> =C2=A0LINUX_KERNEL_TYPE[doc] =3D "Defines the kernel type to be used in
> assembling the configuration."
> =C2=A0LINUX_VERSION[doc] =3D "The Linux version from kernel.org on which =
the
> Linux kernel image being built using the OpenEmbedded build system is
> based. You define this variable in the kernel recipe."
> =C2=A0LINUX_VERSION_EXTENSION[doc] =3D "A string extension compiled into =
the
> version string of the Linux kernel built with the OpenEmbedded build
> system. You define this variable in the kernel recipe."
> -LOCALE_PATHS[doc] =3D "Whitespace separated list of paths that are
> scanned to construct locale packages. The list already contains
> ${datadir}/locale by default."
> +LOCALE_PATHS[doc] =3D "Whitespace separated list of paths that are
> scanned to construct locale packages. The list already contains
> ${datadir}/locale by default. Note that all subdirectories in these
> paths are assumed to be locales."
> =C2=A0LOCALE_UTF8_IS_DEFAULT[doc] =3D "If set, locale names are renamed s=
uch
> that those lacking an explicit encoding (e.g. en_US) will always be
> UTF-8, and non-UTF-8 encodings are renamed to, e.g., en_US.ISO-8859-
> 1. Otherwise, the encoding is specified by glibc's SUPPORTED file.
> Not supported for precompiled locales."
> =C2=A0LOG_DIR[doc] =3D "Specifies the directory to which the OpenEmbedded
> build system writes overall log files. The default directory is
> ${TMPDIR}/log"
> =C2=A0
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index d1738d3b61..587810bdaf 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -652,11 +652,15 @@ def split_locales(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 locales =3D set()
> =C2=A0=C2=A0=C2=A0=C2=A0 for localepath in (d.getVar('LOCALE_PATHS') or "=
").split():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localedir =3D dvar + loc=
alepath
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if cpath.isdir(localedir):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local=
es.update(os.listdir(localedir))
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local=
epaths.append(localepath)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.de=
bug(1, "No locale files in %s" % localepath)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not cpath.isdir(localedir)=
:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.de=
bug(1, 'No locale files in %s' % localepath)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conti=
nue
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localepaths.append(localepath=
)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with os.scandir(localedir) as=
 it:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for e=
ntry in it:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if entry.is_dir():
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 locales.add(entry.name)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if len(locales) =3D=3D 0:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.debug(1, "No locale f=
iles in this package")
>=20
> base-commit: f5e6183b9557477bef74024a587de0bfcc2b7c0d

Unfortunately this breaks glibc-locale:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6379/step=
s/14/logs/stdio

ERROR: glibc-locale-2.39+git-r0 do_package: QA Issue: glibc-locale: Files/d=
irectories were installed but not shipped in any package:
  /usr/share/locale/locale.alias
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.

Cheers,

Richard


