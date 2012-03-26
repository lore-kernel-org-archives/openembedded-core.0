Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SCF5l-0004XI-2e
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 20:56:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Mar 2012 11:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="125300319"
Received: from unknown (HELO envy.home) ([10.7.199.147])
	by orsmga002.jf.intel.com with ESMTP; 26 Mar 2012 11:47:32 -0700
Message-ID: <4F70B998.3070405@linux.intel.com>
Date: Mon, 26 Mar 2012 11:46:48 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
	<4e31dfddbb238cd5e3c2ce19a49996e113419212.1332507302.git.Martin.Jansa@gmail.com>
In-Reply-To: <4e31dfddbb238cd5e3c2ce19a49996e113419212.1332507302.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.4
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 2/6] kernel.bbclass: use symlinks for modutils files
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
X-List-Received-Date: Mon, 26 Mar 2012 18:56:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

What is the motivation?

On 03/23/2012 05:56 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/kernel.bbclass |    8 +++-----
>  1 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 975ae13..54ed7f7 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -407,16 +407,14 @@ python populate_packages_prepend () {
>  		# appropriate modprobe commands to the postinst
>  		autoload = d.getVar('module_autoload_%s' % basename, True)
>  		if autoload:
> -			name = '%s/etc/modutils/%s' % (dvar, basename)
> -			f = open(name, 'w')
> -			for m in autoload.split():
> -				f.write('%s\n' % m)
> -			f.close()
>  			name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
>  			f = open(name, 'w')
>  			for m in autoload.split():
>  				f.write('%s\n' % m)
>  			f.close()
> +			modutils_name = '%s/etc/modutils/%s' % (dvar, basename)
> +			modutils_target = '../modules-load.d/%s.conf' % (basename)
> +			os.symlink(modutils_target, modutils_name)

This basically undoes what was added in 1/2 and replaces it with
symblinks right?

If so, just do it as symlinks in the first place.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


