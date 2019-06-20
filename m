Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id BBA507D716
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 16:20:46 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u19so2094871ior.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 09:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=13vMj4MQkCr9p4Cdbxoq+z+R3p/8+9V7WzQIiH69iJg=;
	b=a8nsnjwf7fllwQ+dz133DVZSKzfg6UqFMxv09Z7HNDxnIIslCmIbCW2arlHZHpuK+m
	h1aARFVIL7HiRGtOZw//niu3QAiiSEIGUyQhMGkNxjIvG3S/kBo9EFOT8vqGRcuffMEl
	N8+aPXOapPAyx8nhnt8D7uj3yAisL5QtNXQzbaUfX07HnxRM8DgKYA3Ty/I/Xa+2VlcF
	GjjvimtT9QDJKSsjrafAEa6L4q+I5MzZjl+8CVwZdRTJXKC8KzXgSRm5teZt9jibxHOk
	HLr2SRmBUTQFkd+PFbQO2oBK9rjuT+3wXnqQTS51Xl4pGUWeGh8Dtn2ds3NfA8+aA6Wf
	3ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=13vMj4MQkCr9p4Cdbxoq+z+R3p/8+9V7WzQIiH69iJg=;
	b=nGABCP8IQh9iHWVfriegKb9fW0Z9x/wR17dkUJVe9aeDAvQLHtR8B+97CQOZapgZMs
	IBG3hTrRo+tmLt5xfOoAiO7J2r0gA2OUeKoRqxjb0cWNnje1UseulrHCt9cfmSsVGbAk
	WdGzXvYXm5p7o5zsrMNRf3fU9SzC/Abn+PljpOTECQOA911hXWD/aOHaevP4bE/x8Oc1
	0FvAwrYB8oLWq2SMzk8DtuySK+ufT3bYZwkNIuCQYd2S/6bf1yVPcdAhOgpY12Gz6B5T
	Wr/Okjz93TcMCNVdOPMKla/X2RmTcpWPPCOrP3RRFOHtwUt+08LHb1piOPJVT5D/O1vU
	nDMQ==
X-Gm-Message-State: APjAAAXcCU3Z0jKYkuisg3uIRGbnkp9kWkzS0vdMQVdGUm4aE1J+vQfK
	Dsd+S2L+Cta/xADy0dEl6EAULju9N1B1M0B4a56FzQ==
X-Google-Smtp-Source: APXvYqxhQaYGPp1DfvgMsOiOlPMaglZGbL/p0hqqmPfHL8xStlS9ZPNMmuCIm3lCAQ9nMt41Ps056WwMMmDicpqZh74=
X-Received: by 2002:a6b:38c3:: with SMTP id
	f186mr28764153ioa.187.1561047646232; 
	Thu, 20 Jun 2019 09:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190620154704.13940-1-JPEWhacker@gmail.com>
In-Reply-To: <20190620154704.13940-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jun 2019 17:20:35 +0100
Message-ID: <CAJTo0LaFrRAchscWMQdQdEUKtqHXJ4kzENrLjPm42Tp4gZwZLw@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Remove .build files for reproducible builds
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
X-List-Received-Date: Thu, 20 Jun 2019 16:20:46 -0000
Content-Type: text/plain; charset="UTF-8"

Is it easier to just always delete those files?  Do they serve any
useful purpose?

Ross

On Thu, 20 Jun 2019 at 16:47, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Bash has an internal "build number" that it tracks and automatically
> increments ever time a given builds is made from the same sandbox.
> However, this can make builds non-reproducible in the event that a build
> directory is reused multiple times.
>
> Remove the .build files after every build if reproducible builds have
> been requested which will reset the build build number for the next
> build.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-extended/bash/bash.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index c91cc8ada8d..e2844dffbad 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -39,6 +39,14 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " \
>
>  CACHED_CONFIGUREVARS += "headersdir=${includedir}/${PN}"
>
> +do_compile_prepend() {
> +    # If reproducible builds are requested, remove any leftover .build files.
> +    # This ensures that bash always has the same version number
> +    if [ "${BUILD_REPRODUCIBLE_BINARIES}" == "1" ]; then
> +        rm -f ${B}/.build
> +    fi
> +}
> +
>  do_compile_ptest () {
>         oe_runmake buildtest
>  }
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

