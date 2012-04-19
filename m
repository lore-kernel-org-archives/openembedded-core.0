Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SL0Sl-0007gM-Ui
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 01:08:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Apr 2012 15:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155815876"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2012 15:58:56 -0700
Message-ID: <4F9098AB.3040705@linux.intel.com>
Date: Thu, 19 Apr 2012 15:58:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334875218.git.sgw@linux.intel.com>
	<33d6305e28845e6fd225e76f3add810cb0aa7cad.1334875218.git.sgw@linux.intel.com>
In-Reply-To: <33d6305e28845e6fd225e76f3add810cb0aa7cad.1334875218.git.sgw@linux.intel.com>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 04/10] kernel: Fix packaging issue
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
X-List-Received-Date: Thu, 19 Apr 2012 23:08:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/19/2012 03:44 PM, Saul Wold wrote:
> Remove /etc since it is empty, when creating a machine that does not
> deliver any module config files, the /etc is empty and is then warned
> about not being shipped, so we remove it.
>
> This occurs in the routerstationpro with the following warning:
> WARNING: For recipe linux-yocto, the following files/directories were installed but not shipped in any package:
> WARNING:   /etc
>
> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> ---
>   meta/classes/kernel.bbclass |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3519e7c..19dad8e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -464,9 +464,11 @@ python populate_packages_prepend () {
>   	# avoid warnings. removedirs only raises an OSError if an empty
>   	# directory cannot be removed.
>   	dvar = d.getVar('PKGD', True)
> -	for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar)]:
> +	for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" % (dvar), "%s/etc" % (dvar)]:
>   		if len(os.listdir(dir)) == 0:
>   			os.rmdir(dir)
> +	if len(os.listdir("%s/etc" % (dvar))) == 0:
> +		os.rmdir("%s/etc" % (dvar))
>
>   	import re
>   	metapkg = "kernel-modules"
Looks like I grapped the wrong version somehow, will be fixed in the branch!

Sau!


