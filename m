Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id C0D14609BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 14:07:43 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id f51so5309701qge.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 07:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iPV2Gb9gYpr4HNVL1D0W0p26qUm25WvRxtxq8my+b30=;
	b=RQ5jRovbYC8I0e9HPH5OvQR1CqaBgGpN+i915ure1cMS8aIymi1WlJoyZxB3UyEbZe
	VkjNvpclBI74qe0T7e5Cezu3Xy6znqrYkdAeGF2lH7NF7IssMVT50ZofN/6lJxU9uidU
	6x6DZycwCAwSfiyvf4oVWKLJqM+9IrG1llde8/0KueNLfVGb4ZFOLfvs6Yt0ov9DIcrX
	R+BVNGukatjXdIHz5mK9kGhYOLirE2GUjCI2kVloQRoUwIzQjxPSaT/r22ON7N2AX+Dq
	Am0FQliORbvzqs66K4Y1iiQWkgj25HwzBR5XPeuXBCV7m0WqA89Bs9XRIK7Sae5M26Hv
	azXw==
X-Gm-Message-State: ALoCoQk8Nc/N1Y0ZRmRMfWBTk0OXeIPi/bk2gpsE8z19FTE9qmRwWFAHj9sBiIrPZsmJuZWcQz03
X-Received: by 10.224.75.10 with SMTP id w10mr47682839qaj.52.1398175663996;
	Tue, 22 Apr 2014 07:07:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.19.136 with HTTP; Tue, 22 Apr 2014 07:07:23 -0700 (PDT)
In-Reply-To: <1397438532-16886-1-git-send-email-jslater@windriver.com>
References: <1397438532-16886-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Apr 2014 15:07:23 +0100
Message-ID: <CAJTo0LagCvf=vEHvKkiKN+PoBukUjS281MveS0_Vq8ud9X=eHw@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pixbuff.bbclass: check for gdk-pixbuf-query-loaders errors
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
X-List-Received-Date: Tue, 22 Apr 2014 14:07:47 -0000
Content-Type: text/plain; charset=UTF-8

This needs rebasing onto current master as there's an attempt at
failing fatally in master (which then won't get noticed, due to the
issue this fixes).

Ross

On 14 April 2014 02:22, Joe Slater <jslater@windriver.com> wrote:
> If we do not see all the bits we need during populate_sysroot_setscene,
> we do not want to keep quiet about it and let somebody get screwed
> later.  By error exiting, we let bitbake try to recover by
> rebuilding the package.  This will, hopefully, fix any dependency
> issues, etc, but if not, at least we tried.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/classes/pixbufcache.bbclass |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
> index 414fd30..edbb948 100644
> --- a/meta/classes/pixbufcache.bbclass
> +++ b/meta/classes/pixbufcache.bbclass
> @@ -53,7 +53,10 @@ SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
>  pixbufcache_sstate_postinst() {
>         if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
>         then
> -               gdk-pixbuf-query-loaders --update-cache
> +               if ! gdk-pixbuf-query-loaders --update-cache
> +               then
> +                       exit 1
> +               fi
>         fi
>  }
>
> --
> 1.7.3.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

