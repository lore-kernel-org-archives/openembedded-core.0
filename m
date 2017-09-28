Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2FB60125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 14:15:13 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Sep 2017 07:14:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,450,1500966000"; d="scan'208";a="317275862"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 28 Sep 2017 07:14:46 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id F170C5802A4;
	Thu, 28 Sep 2017 07:14:45 -0700 (PDT)
Date: Thu, 28 Sep 2017 17:13:03 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20170928141303.a6gdp3fqsyqe3t5n@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1506531609-5917-1-git-send-email-trini@konsulko.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Thu, 28 Sep 2017 14:15:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 27, 2017 at 01:00:09PM -0400, Tom Rini wrote:
> With RSS we need to ensure that when making a bmap image that the
> python3 that we created is found via /usr/bin/env rather than the host
> python3.  Otherwise we're relying on the build host to have bmaptool
> support installed.
> 

Can you suggest how to reproduce the issue you're trying to fix with
this patch?

Here is what I did:

1. Checked if bmaptools are available for host python3:

$ python3 -c 'import bmaptools'
Traceback (most recent call last):
  File "<string>", line 1, in <module>
ImportError: No module named 'bmaptools'

2. Added cpio.bmap to my build configuration:

$ grep ^IMAGE_FSTYPES ./conf/local.conf 
IMAGE_FSTYPES = "cpio.bmap"

3. Built core-image-minimal:
[build (master)]$ rm -rf tmp/
[build (master)]$ bitbake core-image-minimal
...
NOTE: Tasks Summary: Attempted 2395 tasks of which 2186 didn't need to
be rerun and all succeeded.

4. Checked if bmap file has been generated:
[build (master)]$ ls ./tmp/deploy/images/qemux86-64/ |grep cpio
core-image-minimal-qemux86-64-20170928135949.rootfs.cpio.bmap
core-image-minimal-qemux86-64.cpio.bmap

Hm, cpio image got removed for some reason. Looks like a bug, but not
related to bmaptool. (I remember you're fixing that code some time ago).

Should I use another MACHINE or anything else that can trigger build
failure?

PS. I used latest poky master. commit id: fcdfe09d9cc4e2977bd602dfd18f729cd9f6d73d

> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> I played around with a few ways to try and fix this problem, and this
> was the best I could come up with.  Once this is in we need this in pyro
> as well as it's broken there too.
> ---
>  meta/classes/image_types.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 61dca626311e..3ff960e3a889 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
>  # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
>  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
>  IMAGE_TYPES_MASKED ?= ""
> +
> +# bmap requires python3 to be in the PATH
> +EXTRANATIVEPATH += "${@'python3-native' if d.getVar('IMAGE_FSTYPES').find('bmap') else ''}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Regards,
Ed

