Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6727A609BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 10:33:01 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id q108so707038qgd.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 03:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xDTSXa8S8NTEwY0CR4f8X8cYaUKhbyhnVQku5lhdoVc=;
	b=AbM4CSXwG3zOqhKKRMDVVBX1XDgxonbgBMJu8NQWrrB0QJ0Fg3hKyxu5wTfbtQsQCa
	ZXbMpxF9uYxYNZzSIMK6bI7/mq3wyZA1LtmLDk6o6Dz3UPreeVokzHBD1W04ZdyEVR1a
	u302HC5i/cYwSauoZgf9/hHzAhYJReGBS5dzoXt0BUw0R3noq0FGoYBn8FKE3u1PBZUa
	1E9D4q6ocQFOnE6kj+fFGePt8aUPG0iaEnq8PKugTSd8kR/AjEtjBH9aFleyeMSRpHdI
	ZW2zjHE+nCKPd9wSpoLBylh9iCO6mXx+um8u6XQfJ/ol/q33LgJbqwAmAWbNfkmQmgJP
	WxQQ==
X-Gm-Message-State: ALoCoQn5uh4LfvAc+q+bLOGf2eW38GJTNy7y+vD9wLcEOtW5W0xZYN9PLhiel0Eb8AoVuzGfMwSU
X-Received: by 10.224.147.77 with SMTP id k13mr55215700qav.64.1398249182782;
	Wed, 23 Apr 2014 03:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.19.136 with HTTP; Wed, 23 Apr 2014 03:32:42 -0700 (PDT)
In-Reply-To: <1398189641-16698-1-git-send-email-jslater@windriver.com>
References: <1398189641-16698-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Apr 2014 11:32:42 +0100
Message-ID: <CAJTo0LYiWUZ-RSRnC=RJDLKoDU2xOs2C3qEqC+QOC-z_HSLLTg@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH 1/1] pixbufcache: add error exit in pixbufcache_sstate_postinst
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
X-List-Received-Date: Wed, 23 Apr 2014 10:33:09 -0000
Content-Type: text/plain; charset=UTF-8

Acked-By: Ross Burton <ross.burton@intel.com>

On 22 April 2014 19:00, Joe Slater <jslater@windriver.com> wrote:
> In order to attempt recovery of a failed populate_sysroot_setscene,
> we need to explicitly error exit an SSTATEPOSTINSTFUNC.  So, we test
> the return value of gdk-pixbuf-query-loaders.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/classes/pixbufcache.bbclass |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
> index 922174d..b8d75bd 100644
> --- a/meta/classes/pixbufcache.bbclass
> +++ b/meta/classes/pixbufcache.bbclass
> @@ -46,14 +46,16 @@ python populate_packages_append() {
>  }
>
>  #
> -# Add a sstate postinst hook to update the cache for native packages
> +# Add an sstate postinst hook to update the cache for native packages.
> +# An error exit during populate_sysroot_setscene allows bitbake to
> +# try to recover by re-building the package.
>  #
>  SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
>
>  pixbufcache_sstate_postinst() {
>         if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
>         then
> -               GDK_PIXBUF_FATAL_LOADER=1 gdk-pixbuf-query-loaders --update-cache
> +               GDK_PIXBUF_FATAL_LOADER=1 gdk-pixbuf-query-loaders --update-cache || exit 1
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

