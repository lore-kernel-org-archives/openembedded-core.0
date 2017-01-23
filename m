Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA6A73D46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:54:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 23 Jan 2017 06:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,274,1477983600"; d="scan'208";a="216588180"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 23 Jan 2017 06:54:53 -0800
Date: Mon, 23 Jan 2017 16:55:38 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170123145537.GA6330@mbabyjoh-desk.ger.corp.intel.com>
References: <1481550484-3360-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1481550484-3360-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] sstatesig: don't squash dependencies of useradd packages
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
X-List-Received-Date: Mon, 23 Jan 2017 14:54:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping.

On Mon, Dec 12, 2016 at 03:48:04PM +0200, Maxin B. John wrote:
> Without this change, sstate dependency filter squashes dependencies
> of packages which inherits useradd class. That causes failures while
> rebuilding it for another MACHINE.
> 
> Fixes [YOCTO #8078]
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/lib/oe/sstatesig.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 8224e3a..88b2290 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -17,6 +17,9 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
>      def isAllArch(fn):
>          inherits = " ".join(dataCache.inherits[fn])
>          return "/allarch.bbclass" in inherits
> +    def isUserAdd(fn):
> +        inherits = " ".join(dataCache.inherits[fn])
> +        return "/useradd.bbclass" in inherits
>      def isImage(fn):
>          return "/image.bbclass" in " ".join(dataCache.inherits[fn])
>  
> @@ -39,6 +42,10 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
>  
>      # Only target packages beyond here
>  
> +    # Don't squash the dependencies of packages inheritting useradd class
> +    if  isUserAdd(fn):
> +        return True
> +
>      # allarch packagegroups are assumed to have well behaved names which don't change between architecures/tunes
>      if isPackageGroup(fn) and isAllArch(fn) and not isNative(depname):
>          return False  
> -- 
> 2.4.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

