Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 72DA87795C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 14:46:22 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n11so66453193wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qq2kssErQzBHdKbds4tMzlRvwkBQW5hHJV/Ann+FjmI=;
	b=H71xZBklNRxQMQDVTzJez62CU8gg72Io7rhkFNBRYlzxF9iA9ragfHA5BgQTkTvIZW
	+JRBDZsWBljDpWzW8hHj3pbBWEV0n60gEnsCwR8ohUXqWeJ9gLV93y1/91f0a5ka+V65
	KHdvNpkGJhaS5hDRPF9OfBGY7LbNZX/XIi8fOC8UXS2q4L8y5Kni1oXO9JC2M+K9xSbo
	uBfSl/wfNZPufbn3RThbjwMHeQsNYspTI5JfAa1p+Q8plW2HMuaLN114SFNzuSI288MN
	lyHdfJ1wpvtXe8mSHULW1uvsQkw0W8ZbYa0IcpiLjCe3WMif3Zsny+yD4/mWJvR/zrD5
	x4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qq2kssErQzBHdKbds4tMzlRvwkBQW5hHJV/Ann+FjmI=;
	b=eX31ioP+g/ct4sMQKYfsgX8kbP5SSVgR2nmfPRSzXVPEK+Rq2n7XlIDKLMsoWfuKdI
	MtnkOIYOidwLOBcNwArBKMxwRk7RIOnwxrz7/UTiRVlunYkRRtTnTOgJ8HMfFPpBgMs0
	iMS8/NyVC/f5qXeVfx+JjdyK5+t6lhDyu2aEoTSoOMqrUfhDDVbiXPIfvSO+pphDnxe2
	s8YPZePoyiTGB5BjUYuEMBpBM/hrLioADWt3gPqQzB8xWfGP70H+eawNxelueTKqw6Ap
	b9P5u/ve93ACGl9Q1Dw9ejfJ37ITPL93ZDSSDptYIc8tMto5fDTW36cx2a0D8On3YDys
	sJig==
X-Gm-Message-State: AFeK/H38hq2TUwW+CRuVwrD/5KGyqwlOeJXLTpvG5Ylmc4kda5WBriQDtIO0X8o6JBW4KJmrl394DUggNRcAuA==
X-Received: by 10.28.43.129 with SMTP id r123mr2667643wmr.13.1490021183154;
	Mon, 20 Mar 2017 07:46:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Mon, 20 Mar 2017 07:45:52 -0700 (PDT)
In-Reply-To: <1490012430-748-1-git-send-email-ross.burton@intel.com>
References: <1490012430-748-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Mar 2017 07:45:52 -0700
Message-ID: <CAMKF1sqUwxjKc88jNYJOzG-sbAXNN53WCw2_-J59SSgyhaLkaw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: disable gold on mingw
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
X-List-Received-Date: Mon, 20 Mar 2017 14:46:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 5:20 AM, Ross Burton <ross.burton@intel.com> wrote:
> oe-core 759eed (binutils: Enable threading when gold is enabled and is not
> default linker) causes linking in mingw SDKs to fail:
>
> .../work/i686-nativesdk-mingw32-pokysdk-mingw32/binutils-cross-canadian-x86-64/2.28-r0
> /recipe-sysroot-native/usr/bin/i686-pokysdk-mingw32/../../libexec/i686-pokysdk-mingw32/gcc/i686-pokysdk-mingw32/6.3.0/ld:
> cannot find -lpthread
>

looks ok

> Work around this by disabling gold entirely in mingw SDKs.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index 37813dd..7efe13f 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -78,6 +78,7 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>
>  LDGOLD_class-native = ""
>  LDGOLD_class-crosssdk = ""
> +LDGOLD_sdkmingw32 = ""
>  LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
>
>  # This is necessary due to a bug in the binutils Makefiles
> --
> 2.8.1
>

