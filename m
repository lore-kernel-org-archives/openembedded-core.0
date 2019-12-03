Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7E5367F639
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 20:16:31 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id x1so4735682qkl.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2019 12:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ytTMGYiP19gojwrkXL+bgvo6BI2k5Ya4u6XmBte6kvQ=;
	b=Ipo6AB0QaW936GXjGj1Io5VCEIpLJKIx98aC4T5f6XCgczeNF6dlrTeZz3+HJ/en4t
	fi5jBVHtu8j2SoQ5fFoX0zs4+nc2mai5HWOIGHDxCWK/UIkNtX4F1xAwyV5j2hL7pCnU
	He1Tq1mkZ4qpVMNLRMfVGMm53iEoYAIxb/G/GQYaCh4XPBO2NmpwpBerJpW+cgBX1k8u
	Unf+xeiYaDEfa5H6JS40+cOgCixWMKgQEsIzY8HhQt90Fbs6rtG2TTA+YiHVZb96kiv0
	8hjaimD90avCChStGO9KR/O5dKoKY9m/zpJZFMj11TM4j8dximN1VvNBx3Cgfn6Utup+
	J51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ytTMGYiP19gojwrkXL+bgvo6BI2k5Ya4u6XmBte6kvQ=;
	b=eDh1z7UBDD6HYjHR/2yqNVT9rzqvhDKmAiMwOe+43b7H/6PazyooGu5TkiwTwys1Fo
	wHENvrz9Q+qkVVls3ACgtLIt33GkxnO1zc7C3POcSr7u+l82nGn3MoYZoQlJXmV7q2cj
	HTopS+BY2lhCjQOdrmL3Jt+cujMkGoRHPha8CP17tkpgsTnGhXcrV2166mgsJZRwkaXe
	sYmgk+baZqkgdt0ERdOA9qdfNthHFIj5TPo8cOY+WST4PSsqxv46non7/rmRI+nvWRSi
	U6Kj48AGXajV4lRwZA4UhjJ3hH2BZ+OIM8OBUddb7pqlr0/aRoxr/iOFx7WGf/2jcmvX
	ob5A==
X-Gm-Message-State: APjAAAWH+kNoCOuLZ+n+J+1CcC0gAE1EL1+8UwBLhQ/Q1Y4eDLtytEf/
	pNVARE41MVZVerToODHX/OT9w3htDLARzbMonWk=
X-Google-Smtp-Source: APXvYqyK7o8SDVaR/T4CqprKPB1MgQoD8ksiNUD92yG73juZr7e8BFJ7gPxFcYEi19mHK8Dsnbow30fsFHS7HBoBdvk=
X-Received: by 2002:a37:a348:: with SMTP id m69mr7337488qke.474.1575404191942; 
	Tue, 03 Dec 2019 12:16:31 -0800 (PST)
MIME-Version: 1.0
References: <1575398680-3272-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1575398680-3272-1-git-send-email-liu.ming50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Dec 2019 12:16:05 -0800
Message-ID: <CAMKF1sqik8nwKMwm98Oxnz+ggvoyf6=+u0jcppCbJ=_4oKC+ZQ@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix ldconfig packaging issue
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
X-List-Received-Date: Tue, 03 Dec 2019 20:16:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 3, 2019 at 10:45 AM <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> ldconfig should be prior to glibc-utils in PACKAGES variable, or else
> ldconfig binary would not be split to its own package, hence will lead
> to runtime issues for the packages that depending on ldconfig, like
> systemd.

hmmm perhaps FILES_ldconfig =+ would help ?

>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index 9dd5a0d..ede9e9b 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -1,6 +1,6 @@
>  INHIBIT_SYSROOT_STRIP = "1"
>
> -PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ldconfig"
> +PACKAGES = "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
>
>  # The ld.so in this glibc supports the GNU_HASH
>  RPROVIDES_${PN} = "eglibc rtld(GNU_HASH)"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

