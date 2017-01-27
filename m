Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 17FBF77307
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 06:19:11 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 96so23916064uaq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 22:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rBtXNqUkLPcSAG+dbBriOYsiG8t4+qpkKSE9sSPzoGY=;
	b=JYa1tZjKmwWmW2Nc90p5CepLLKGTXcKvpYmY5H5ckOb5Fyjtkcpep65fr+KnJVsOP/
	u9G3ZhxA2np0c+CNPSHuGltMFO8bv70e23HD6zgwpPFo4FgbnlXMwPwJeUQoWdGCSnep
	IQ6G8PPmBqk0XLthseKmpos/0KM7O1vJz6yhNd+ZayIFVuFZN0ztldnbCZO2XBVMeLpT
	UewppukwrLfbAhNWKJLmWJSoGFeAeYYo1FXZGTW0bIIKIju6UcBYGfwr1GE9dnrZ8n6P
	erHYRlaFyrCYoRQLXYKczv44nDDx4PDJEf9lLDN1Gs54ysktWOc7Bl3j8d+kAoWYc+lz
	uevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rBtXNqUkLPcSAG+dbBriOYsiG8t4+qpkKSE9sSPzoGY=;
	b=DQeDJyRckDP2USYUW5XQ36VhHpIpUpZuRLN1zzfIGccg2lOevavLSRDoPLhU+84avY
	u4M10cjFK2kbj5pSiUIwkHweRY2IiaeQToDAXC77OFyw/kteypBEheTVFZae9rLFtwBB
	WyRpQLWp7+Rf6qNTKMRris5hOTTmRwOUPYnSY6iFt/OazMQP9DCqUOgPCXbY2ZGTgMGC
	03KJ7zTuBC5Kqzb/LNbQTA/GKSkPZTsX1tc3T6CVN76vaL0W/F1FbU5kUqhG51+sxcnZ
	Xog2x/ITaeQoG5O/2UGGdMnebIbKDrKPf2ZaAeplMZQ2qFSXik1K5kq5gyAbRUKxd73u
	wlzw==
X-Gm-Message-State: AIkVDXIBP5V6IlGFwwDNNNfEYxrWpKrQ0YUOnMPaHSqGJDxk8jvrGHP5LDVZ92DgGuSI3GiSpS8R+PTP4X6XRQ==
X-Received: by 10.176.6.130 with SMTP id g2mr2994750uag.91.1485497952226; Thu,
	26 Jan 2017 22:19:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 26 Jan 2017 22:18:41 -0800 (PST)
In-Reply-To: <1485489993-29677-1-git-send-email-armccurdy@gmail.com>
References: <1485489993-29677-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jan 2017 22:18:41 -0800
Message-ID: <CAMKF1spAAtA=vjmUYx-WrpTmZjXrh0bdEmmesO=NS8BYEfNY8w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: respect USE_LDCONFIG when setting default PACKAGECONFIG
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
X-List-Received-Date: Fri, 27 Jan 2017 06:19:12 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 26, 2017 at 8:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Avoid trying to call ldconfig at run-time in distros which force
> USE_LDCONFIG to 0 and therefore don't provide it.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_232.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
> index cc8781e..cfe6958 100644
> --- a/meta/recipes-core/systemd/systemd_232.bb
> +++ b/meta/recipes-core/systemd/systemd_232.bb
> @@ -39,8 +39,10 @@ SRC_URI_append_libc-uclibc = "\
>  "
>  SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>
> +USE_LDCONFIG ?= "1"

now that we have more recipes using this variables. I think it should
to global config space. May be have it as a DISTRO_FEATURE is more
appropriate

> +
>  PACKAGECONFIG ??= "xz \
> -                   ldconfig \
> +                   ${@base_conditional('USE_LDCONFIG', '1', 'ldconfig', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

