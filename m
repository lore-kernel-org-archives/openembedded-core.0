Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 30CBC65E94
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 18:00:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Nov 2014 10:00:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,321,1413270000"; d="scan'208";a="627130578"
Received: from sergeypo-mobl1.ccr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.106])
	by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2014 10:00:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Date: Wed, 05 Nov 2014 18:00:13 +0000
Message-ID: <3489220.ni93R9xSTH@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.2 (Linux/3.16.7-200.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <1415124553-9122-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1415124553-9122-1-git-send-email-alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] image-buildinfo.bbclass: New class, writes
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
X-List-Received-Date: Wed, 05 Nov 2014 18:00:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alejandro,

We're getting there, thanks for your patience - just a few more tweaks:

On Tuesday 04 November 2014 12:09:13 Alejandro Hernandez wrote:
> build information to target filesystem on /etc/build

Looks like the shortlog has been split over two lines here...

> such as enabled layers, their current status and commit.
> 
> [YOCTO #6770]
> 
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/classes/image-buildinfo.bbclass | 76
> ++++++++++++++++++++++++++++++++++++ 1 file changed, 76 insertions(+)
>  create mode 100644 meta/classes/image-buildinfo.bbclass
> 
> diff --git a/meta/classes/image-buildinfo.bbclass
> b/meta/classes/image-buildinfo.bbclass new file mode 100644
> index 0000000..d695d24
> --- /dev/null
> +++ b/meta/classes/image-buildinfo.bbclass
> @@ -0,0 +1,76 @@
> +#
> +# Writes build information to target filesystem on /etc/build
> +#
> +# Copyright (C) 2014 Intel Corporation
> +# Author: Alejandro Enedino Hernandez Samaniego
> <alejandro.hernandez@intel.com> +#
> +# Licensed under the MIT license, see COPYING.MIT for details
> +#
> +# Usage: add INHERIT += "image-buildinfo" to your conf file
> +#
> +# Desired variables to display
> +# * If it is a list if values it must be present in both (e.g.
> IMAGE_FEATURES) +
> +IMAGE_BUILDINFO_VARS ?= "DISTRO DISTRO_VERSION IMAGE_FEATURES
> +IMAGE_INSTALL" 

I'm not sure we really want IMAGE_FEATURES and IMAGE_INSTALL in the default 
value; it seems to me at the moment the main usage for this is to help 
determine the version of the build system & metadata that was used.

> +IMAGE_BUILDINFO_LVARS ?= "IMAGE_FEATURES IMAGE_INSTALL"

I didn't think to use it when I wrote the original implementation, but it 
turns out that at least for both of these two variables, they have a set type 
i.e. from meta/classes/image.bbclass:

IMAGE_INSTALL[type] = "list"

So we could use d.getVarFlag(varname, 'type') to determine the type and then 
we can avoid having to explicitly list them - could you please make this 
change for this version of the function? (Let's leave fixing the buildhistory 
version as a separate exercise for now.)

> +# From buildhistory.bbclass
> +def squashspaces(string):
> +    import re
> +    return re.sub("\s+", " ", string).strip()

To be honest I had thought squashspaces() would still be moved to oe.utils 
since this function is generic.

> +# From buildhistory.bbclass
> +def outputvars(vars, listvars, d):
> +    vars = vars.split()
> +    listvars = listvars.split()
> +    ret = ""
> +    for var in vars:
> +        value = d.getVar(var, True) or ""
> +        if var in listvars:
> +            value = squashspaces(value)
> +        ret += "%s = %s\n" % (var, value)
> +    return ret.rstrip('\n')

I've just realised, if we're inheriting both this class and buildhistory 
globally and these have the same name, that might be a problem. Can we rename 
this version to something lime image_buildinfo_outputvars?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

