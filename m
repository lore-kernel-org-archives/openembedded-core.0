Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 37F6277BEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490866764; x=1522402764;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=yDo/fmfjCwLTo+BFfOSNeB3rDh59d/wYn17FPYaJflg=;
	b=weNWyYP/ku7t85XLrKPMrGayzH2O4+SKGKGvvSRquP3gkvQPe8efz97U
	Q0qKJsx+vJ5MbjNenfBfDQ+pNlFtZw==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 02:39:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,246,1486454400"; d="scan'208";a="66827651"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 30 Mar 2017 02:39:22 -0700
To: openembedded-core@lists.openembedded.org
References: <20170329231606.22118-1-pkj@axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <72959861-69b9-7ed0-7a89-891a4aa9ed26@linux.intel.com>
Date: Thu, 30 Mar 2017 12:38:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170329231606.22118-1-pkj@axis.com>
Subject: Re: [PATCH] update_gio_module_cache: Do not chown a non-existing file
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
X-List-Received-Date: Thu, 30 Mar 2017 09:39:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2017 02:16 AM, Peter Kjellerstedt wrote:
> Only change the ownership of ${libdir}/gio/modules/giomodule.cache if
> it exists.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  scripts/postinst-intercepts/update_gio_module_cache | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
> index 92092f2144..fc3f9d0d6c 100644
> --- a/scripts/postinst-intercepts/update_gio_module_cache
> +++ b/scripts/postinst-intercepts/update_gio_module_cache
> @@ -3,7 +3,7 @@
>  set -e
>
>  PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
> -        $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
> -
> -chown root:root $D${libdir}/gio/modules/giomodule.cache
> +	$D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
>
> +[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
> +	chown root:root $D${libdir}/gio/modules/giomodule.cache
>

Nope. The postinst-intercept scirpts are allowed to fail, and if they 
are, they are deferred to first boot. If giomodule.cache file does not 
exist, that means that qemu does not work for the target machine, which 
is not a bug, and is handled by detecting script failure and taking the 
same action at first boot time - which your change breaks.

Alex

