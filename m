Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1052EC624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 13:24:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29518.1788182633532338222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 06:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Mw4kH6+D;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so33116565e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788182632; x=1788787432; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qOPf5RK9O4AZzLt4bzPge5MfhVHYTG4yOQS+CnhupD0=;
        b=Mw4kH6+DBCxr2Iv2J9wA5h8U69KYItEc4MvZ8t+e+DHKBHvGs+Fxo6l9i8tNz0w5y+
         erqBlGaj2RnlK2cZePq/pOQUk9C6LNeeX/VgWiDd8ouKEhRh5ELSmdIMohySPypVOuoF
         3klxA1e9Zwn2qBCxCKevQVx7EVxFPVpGRE3Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788182632; x=1788787432;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOPf5RK9O4AZzLt4bzPge5MfhVHYTG4yOQS+CnhupD0=;
        b=APqKBW36TlK7oimP/IoMLajdcDEzL8t9k9xqnJFV3zRrxzCRhM4GWBqvxCGkFGCLxb
         rUYvaQj8LG7uAmc69mhOA3G8+LmhiiTGZTy2pFPT3Tutwy8hIs9XoD+Rf+9lEHOaagrm
         R0rt9hEkjQ5if1u+QenJrc/uriaaLAWr1ONrp7NCBnv7F1esTsv9Y8jaWFdFntL9m/9p
         MVmWfg/qb2kVrB6LmNxNu3cql/Hlt1npAMnI//E4LdQyO1XVPfiBQ/CyPNpG0rN0dbwn
         uqYcn0jreaJFfLnitOmP4igWHacrkLHXflu/KzL4MqpD0w/5d9MmpVN8+G58nWT/nUES
         2CxQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAfiuGsWTMVVTKXFAWXlxEx533FrgJTYz7G6QXl1ybe0B5HBFLWHZURf/9aua+L7qODAlm9jmOaPZHH/HODuOfkw==@lists.openembedded.org
X-Gm-Message-State: AFuF++l9U+njLRlihR49rvwdjoyI6hf4jr/vQ0hSsbBuhIxx/IoSuumK
	KGLuSJjczss5jq6da4T/ILNdrV7CFx7jotHfDnzsab1qp70zpN0tG8cT7dyOYOy0Tig=
X-Gm-Gg: AR+sD10cc6hZXt1hdx63IIibnFneIhhpFRrAltXy19WuOf8aLvrrHMlnSX0TFYPYQ1b
	nniuoLfqrSKixvsNBZ/+j211orfTdl6fSARK9lp1Yso7d+jv/txApv07lxlZVAnpoQFUJuLDy04
	Ujzt57cWVL/kES+ifOFH/OkOxys1f0tcnBrFcLShYodDN8XYSVp67xBonQWaJkMuhKaKlkRA34I
	w6LueUEmQL6D//CET7GonjLQ1kucOG3nCeWGmIWyz1NBmvJmU1KC1j68rD3n5ZaaCSKPB9yg6I+
	KQpk5DN2KyaOsu1fCHfMsPt4fgIIJkWFUg58YJnkt1gk/f0mL4LPYWTkV1qOkgIpCJLD+kTPlY3
	OBlgZ1Q4UU8rCT0v1ObObIHETlRD+mOmbGDGcfhCFM7s6kLtMEutwvlKjte+mapIWLHxsbL2mRR
	JISFiTYPUbUYFvJ6lV9onq+d9s0CYFsiMFmAvXyvVBFLIFQPEy6ErXi1CMcV8JNigIVzHMmknBw
	LC4DUxcVQdmGbzgvd7ynFCCRXajr+fLhzoKHC3zSdXp3RDr
X-Received: by 2002:a05:600c:c0cf:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49b91c51e62mr359259905e9.14.1788182631591;
        Mon, 31 Aug 2026 06:23:51 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dcaf61sm268222085e9.4.2026.08.31.06.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:23:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 15:23:50 +0200
Message-Id: <DL35U7WTHLGH.1EDKQXKX03YE9@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH] vim: add PACKAGECONFIG option for
 desktop files
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: <shinucha@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260724061324.1541029-1-shinucha@cisco.com>
In-Reply-To: <20260724061324.1541029-1-shinucha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 13:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244764

On Fri Jul 24, 2026 at 8:13 AM CEST, Shinu Chandran via lists.openembedded.=
org wrote:
> The recipe currently always inherits mime-xdg and keeps the installed des=
ktop
> files. Add a desktop PACKAGECONFIG option so configurations can disable t=
hat
> desktop integration while preserving the current default behavior.
>
> When desktop support is disabled, remove the generated desktop files duri=
ng
> do_install and avoid inheriting mime-xdg.
>
> Signed-off-by: Shinu Chandran <shinucha@cisco.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 942813bf3f249f80f3154ba8137d172c406bf319)
> ---
>  meta/recipes-support/vim/vim.inc | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index d69a337b4e..f97062aede 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -50,7 +50,7 @@ S =3D "${WORKDIR}/git"
> =20
>  VIMDIR =3D "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('=
.')[1]}"
> =20
> -inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
> +inherit autotools-brokensep update-alternatives pkgconfig
> =20
>  CLEANBROKEN =3D "1"
> =20
> @@ -76,9 +76,11 @@ do_configure () {
>  PACKAGECONFIG ??=3D "\
>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)}=
 \
> +    desktop \
>      nls \
>  "

Hello,

Thanks for the patch, but PACKAGECONFIG changes are usually unacceptable
for stable. Are clear bugfix could provide an exception but here I don't
see a "real" bug:
IIUC, using this patch would only cut the dependencies and remove 2
files from the package and this looks more like a cleanup than a real
bugfix.

So, unless you can provide compelling reason to merge this, I won't
accept this for now.

Regards,
--=20
Yoann Congal
Smile ECS


