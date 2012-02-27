Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S28fc-0006Xo-K0
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 23:03:48 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Feb 2012 13:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111867329"
Received: from unknown (HELO [10.255.15.37]) ([10.255.15.37])
	by azsmga001.ch.intel.com with ESMTP; 27 Feb 2012 13:55:20 -0800
Message-ID: <4F4BFBC8.4060905@linux.intel.com>
Date: Mon, 27 Feb 2012 13:55:20 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330183874-24088-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1330183874-24088-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] sstatesig: add SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS option to exclude well defined recipe->dependency
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
X-List-Received-Date: Mon, 27 Feb 2012 22:03:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/2012 07:31 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/lib/oe/sstatesig.py |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 7b80c18..1c25823 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -33,6 +33,10 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
>       if depname in siggen.abisaferecipes:
>           return False
>
> +    # Exclude well defined recipe->dependency
> +    if "%s->%s" % (recipename, depname) in siggen.saferecipedeps:
> +        return False
> +
>       # Kernel modules are well namespaced. We don't want to depend on the kernel's checksum
>       # if we're just doing an RRECOMMENDS_xxx = "kernel-module-*", not least because the checksum
>       # is machine specific.
> @@ -51,6 +55,7 @@ class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
>       name = "OEBasic"
>       def init_rundepcheck(self, data):
>           self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
> +        self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
>           pass
>       def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
>           return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
> @@ -59,6 +64,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>       name = "OEBasicHash"
>       def init_rundepcheck(self, data):
>           self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
> +        self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
>           pass
>       def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
>           return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)

Merged into OE-core

Thanks
	Sau!


