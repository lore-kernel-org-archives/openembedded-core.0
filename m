Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RvgGg-00046o-2w
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 03:31:22 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Feb 2012 18:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105194113"
Received: from unknown (HELO [10.255.14.206]) ([10.255.14.206])
	by azsmga001.ch.intel.com with ESMTP; 09 Feb 2012 18:23:15 -0800
Message-ID: <4F347F92.2000501@linux.intel.com>
Date: Thu, 09 Feb 2012 18:23:14 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1328832425.10451.48.camel@ted>
In-Reply-To: <1328832425.10451.48.camel@ted>
Subject: Re: [PATCH] sstate.bbclass: Optimise sstate_hardcode_path
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
X-List-Received-Date: Fri, 10 Feb 2012 02:31:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/12 16:07, Richard Purdie wrote:
> The sstate_hardcode_path() function triggered large numbers of exec()
> calls when processing packages with large numbers of file relocations
> (e.g. perl). This patch optimises those calls into longer single commands
> which make the code significantly more efficient.
>
> This reduced the do_package time for perl by 2 minutes (from 4.75 minutes)
> for me.

Very nice speed up!

> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>

A minor api/style nit below but:

Acked-by: Joshua Lock <josh@linux.intel.com>

> ---
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 4bd3712..d4f95c1 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -317,19 +317,24 @@ def sstate_hardcode_path(d):
>   	staging_host = d.getVar('STAGING_DIR_HOST', True)
>   	sstate_builddir = d.getVar('SSTATE_BUILDDIR', True)
>
> -	for i in file_list.split('\n'):
> -		if not i:
> -			continue
> -		if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
> -			cmd = "sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging, i)
> -		elif bb.data.inherits_class('cross', d):
> -			cmd = "sed -i -e s:%s:FIXMESTAGINGDIRTARGET:g %s \
> -				sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging_target, i, staging, i)
> -		else:
> -			cmd = "sed -i -e s:%s:FIXMESTAGINGDIRHOST:g %s" % (staging_host, i)
> +	files = " ".join(file_list.split('\n'))
>
> +	if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):

I think this can be replaced by a single call to the inherits method of 
the oe.utils module:

oe.utils.inherits(d, 'native', 'nativesdk', 'crosssdk', 'cross-canadian')

which makes this a little more concise.

> +		cmd = "sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging, files)
> +	elif bb.data.inherits_class('cross', d):
> +		cmd = "sed -i -e s:%s:FIXMESTAGINGDIRTARGET:g %s \
> +			sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging_target, files, staging, files)
> +	else:
> +		cmd = "sed -i -e s:%s:FIXMESTAGINGDIRHOST:g %s" % (staging_host, files)
> +
> +	if files:
>   		os.system(cmd)
> -		os.system("echo %s | sed -e 's:%s::'>>  %sfixmepath" % (i, sstate_builddir, sstate_builddir))
> +		fix = open("%sfixmepath" % (sstate_builddir), "w")
> +		fixme = []
> +		for f in file_list.split('\n'):
> +			fixme.append(f.replace(sstate_builddir, ""))
> +		fix.write("\n".join(fixme))
> +		fix.close()
>   	p.close()
>
>   def sstate_package(ss, d):
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


