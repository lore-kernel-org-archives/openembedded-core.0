Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id AD1DC610D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 21:35:13 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x19so196970qcw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 14:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3yc5PcH/KSMw+uoILcQZ+FOd7Y/6DnWJstQDmw8UtwI=;
	b=XbSh6N7Pohv79PSF7Ab5tgvGO9PAa35da9Vt7bYCB1JeBlggHbYEDscdEhf+L/74II
	RHn754HCcw1IkWkUgPB4/b9ElMFIIeeM/CHWmgPWYyGQ7ccbxGQPd5eETaHZKXSw70LG
	mEcwtkUs8702YSYheIoePAc2manYXbUxRGbmuBTEZNhBeVbCVG2iL0BCsPW8f06UIDwU
	ZHSooiVjwVUL6jvN+tJqWK5WVzBJMyIPjrU5cddgg+FMr4ZJTkzSvmGAQg5Xfy6faBuP
	gAf8ot6T2cYAdPqADwm9DNwtLmo9mKQQzUSZza9O2W6Wv/B1piSyQR6riRef+xJdeQmt
	AsDQ==
X-Received: by 10.224.7.199 with SMTP id e7mr1746103qae.121.1380144915352;
	Wed, 25 Sep 2013 14:35:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.10.201 with HTTP; Wed, 25 Sep 2013 14:34:45 -0700 (PDT)
In-Reply-To: <1380142751.18603.344.camel@ted>
References: <1380142751.18603.344.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Sep 2013 14:34:45 -0700
Message-ID: <CAMKF1srUDexU3NT-g1s9RMZDwhK9WyBMGaJPciAtS=ChROFOXw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Use correct kvm CPU options for qemux86* with kvm
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
X-List-Received-Date: Wed, 25 Sep 2013 21:35:13 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 25, 2013 at 1:59 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The existing -cpu host option caused kernel panics when people attempted to use
> the kvm option. After research and discussion, the best options appear to
> be the kvm32/kvm64 cpu types so lets use these instead. These resolve
> the kernel issues for me.
>
> [YOCTO #3908]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/scripts/runqemu b/scripts/runqemu
> index efab1a2..12c58d9 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -265,7 +265,11 @@ if [ "x$KVM_ENABLED" = "xyes" ]; then
>          exit 1;
>      fi
>      if [ -w /dev/kvm -a -r /dev/kvm ]; then
> -        SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu host"
> +        if [ "x$MACHINE" = "xqemux86" ]; then
> +            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm32"
> +        elif [ "x$MACHINE" = "xqemux86-64" ]; then
> +            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -enable-kvm -cpu kvm64"
> +        fi

may be leave the original in the else clause at the end so it covers
the non x86 cases too

>          KVM_ACTIVE="yes"
>      else
>          echo "You have no rights on /dev/kvm."
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

