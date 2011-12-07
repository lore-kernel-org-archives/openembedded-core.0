Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYPXL-0003Zd-PS
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 23:00:24 +0100
Received: by iadj38 with SMTP id j38so1512880iad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 13:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+EdA8TfRqUb8iiONAoDP/KI9VO0gbmJTrbPxPfW9AJU=;
	b=dhosakGiNgWoG680fdB5jX7PJ2qk754oUgW90eMY0pV3Uo/z4lnaRJjdVXUjYW3Vs3
	sACtSeiHzxm6lImmw09mnM8GK3af5GUY0K05f5z4Ndry7S0waL0VNi39UBPSD+xthGR4
	yvaAWPXUYrTeYSVCwxiKRFe99+mJXsEgarW4E=
Received: by 10.42.19.195 with SMTP id d3mr759547icb.21.1323294814262;
	Wed, 07 Dec 2011 13:53:34 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id dd36sm11162714ibb.7.2011.12.07.13.53.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 13:53:29 -0800 (PST)
Date: Wed, 7 Dec 2011 13:53:06 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111207215306.GE6351@sakrah.homelinux.org>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<6c65669e1c223d59020c581750599c11ee222063.1323286080.git.elizabeth.flanagan@intel.com>
MIME-Version: 1.0
In-Reply-To: <6c65669e1c223d59020c581750599c11ee222063.1323286080.git.elizabeth.flanagan@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 4/8] Add copyleft compliance class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Dec 2011 22:00:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/12/11 11:34), Beth Flanagan wrote:
> From: Christopher Larson <kergoth@gmail.com>
> 
> Deploys sources for recipes for compliance with copyleft-style licenses
> Defaults to using symlinks, as it's a quick operation, and one can easily
> follow the links when making use of the files (e.g. tar with the -h arg).
> 
> By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
> 
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  meta/classes/copyleft_compliance.bbclass |   94 ++++++++++++++++++++++++++++++
>  1 files changed, 94 insertions(+), 0 deletions(-)
>  create mode 100644 meta/classes/copyleft_compliance.bbclass
> 
> diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
> new file mode 100644
> index 0000000..5d9ab11
> --- /dev/null
> +++ b/meta/classes/copyleft_compliance.bbclass
> @@ -0,0 +1,94 @@
> +# Deploy sources for recipes for compliance with copyleft-style licenses
> +# Defaults to using symlinks, as it's a quick operation, and one can easily
> +# follow the links when making use of the files (e.g. tar with the -h arg).
> +#
> +# By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
> +#
> +# vi:sts=4:sw=4:et
> +
> +COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
> +
> +COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
> +COPYLEFT_LICENSE_INCLUDE[type] = 'list'
> +COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
> +
> +COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
> +COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
> +COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which exclude licenses'
> +
> +
> +def copyleft_should_include(d):
> +    """Determine if this recipe's sources should be deployed for compliance"""
> +    import ast
> +    import oe.license
> +    from fnmatch import fnmatchcase as fnmatch
> +
> +    if oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'crossdk'):

we do ship some of them in SDK so IMO they should not be excluded.


