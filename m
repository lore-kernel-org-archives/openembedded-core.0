Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1A67D1A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 00:16:19 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id m137so1167770ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 17:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=1palSufknbatZCoNnLacCZbcuZMjXMDM1EXolDh0eJM=;
	b=yPaS7V3odFCavmJUlqa3w8hSb+gIciywqqZssnwMUrNAUt+qZiJVnagp/kvBrWRNQC
	cmYsKLrJHWXcCKJIpyeMw7ik3hBwGcqfY1piDVUmXcQTeA6XOqHwcTK9qQTXyPuLAdvM
	1rX6d7/McloaMq9CmvbcozcJWGs7AfSCMQmh3zH2vFOL0LueAiybzptCPs2WqPoM0/Nt
	bSR+XncUN1rPQ7tW6V2bXz4vqyhl0An/hAe2GMJ6zKzhLmfo74XJoRh6WKAZAykV+Gib
	7d4vDSo0lcGF3VxINyqGivI23Uo7EwPM3wxF1hgEmWYxwmrYs+OBQgLEEZvSGDwWfYPK
	QLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=1palSufknbatZCoNnLacCZbcuZMjXMDM1EXolDh0eJM=;
	b=TJjlw+BC2wMz2l3Pl3Zimk040AoEVrsYqZw1DICX1F7lmhP67TgEliCMroMo9myqCj
	BB3n7lGX235A0QcMWc/dWZOfIFE4rYjj2gmi3+XvHVD8ob1buZZ2ZSsx1T0JN6MXcI37
	0WkHrkJtUBVrKREjmiAmBt3XxCiPDxNic7tMJpP8boTQ65+iaRDTVDtxs1z7VlxY1CKD
	eWrAIWQ/mitADFajDoaMWs8hibe9Z27PdaCRP2vlli++KGRIo/ggUvU4kjh0mu2sY4uX
	PsLY4+fa0g1RcG9cWcdfaM1a+vLDV6ie5uSMoeEqrHDzuqUhoCslZErtqldlg6T90IFg
	or1g==
X-Gm-Message-State: APjAAAV//3CbjZfXGhncoNbm9r6TD1YS633kT2zv/xMDGsfURQIlpF2V
	F5HFLSehrPb/8sjY8GWgLNKZ3qBmOvNSG2WrHGjvUhfR
X-Google-Smtp-Source: APXvYqxG+XoXE+cvnb8qtA6pZ1Fw7mUHFtBW31zZ39lGI2eZmtNkOo08025S9RVp37dRW4LvTyG2MQyl/6DADjwMV8A=
X-Received: by 2002:a24:ad2:: with SMTP id 201mr2273022itw.26.1553818579501;
	Thu, 28 Mar 2019 17:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190328233011.6977-1-ross.burton@intel.com>
In-Reply-To: <20190328233011.6977-1-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Mar 2019 00:16:08 +0000
Message-ID: <CAJTo0LZro+OfeYgfuLZe6=0wBbpV0xQwXV3b8F0gpNRPWRwkHQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: don't build api-documentation for native and nativesdk
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
X-List-Received-Date: Fri, 29 Mar 2019 00:16:19 -0000
Content-Type: text/plain; charset="UTF-8"

Ignore this: totally breaks. I might add a better comment instead.

Ross

On Thu, 28 Mar 2019 at 23:30, Ross Burton <ross.burton@intel.com> wrote:
>
> DISTRO_FEATURES for native and nativesdk is filtered to contain a subset of the
> features for the target DISTRO_FEATURES.  api-documentation was a feature that
> was allowed into the native/nativesdk features if it was in the target, but
> having API documentation for native recipes isn't really useful.
>
> As building this documentation takes time, remove it from native/nativesdk
> builds so that we only build the api-documentation for target recipes.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/bitbake.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 7f8b043cc45..86a9e4b8281 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -833,8 +833,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
>
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value
> -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
> -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
> +DISTRO_FEATURES_FILTER_NATIVE ?= ""
> +DISTRO_FEATURES_FILTER_NATIVESDK ?= ""
>
>  DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data ldconfig"
>  MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
> --
> 2.11.0
>

