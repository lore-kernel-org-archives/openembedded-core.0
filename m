Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSdhL-0005wV-0W for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 02:27:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4B0HCq4018661
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 01:17:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18512-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 01:17:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4B0H2K5018655
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 01:17:03 +0100
Message-ID: <1336695422.2494.177.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 11 May 2012 01:17:02 +0100
In-Reply-To: <8c6c132129d83dca4e5b88a642126901c32a78de.1336691544.git.mark.hatle@windriver.com>
References: <cover.1336691544.git.mark.hatle@windriver.com>
	<8c6c132129d83dca4e5b88a642126901c32a78de.1336691544.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] sstate.bbclass: Improve sstate_installpkg performance
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
X-List-Received-Date: Fri, 11 May 2012 00:27:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-10 at 18:13 -0500, Mark Hatle wrote:
> In a pathological case, lots of files to process, the sstate_installpkg
> performance was very poor.  It interated over each file and ran 3
> individual sed commands per file.  Changing this to keep iterating
> but running only a single command took about 1/3 time time.
> 
> However, when looking at the corresponding sstate_hardcode_path
> function, it was clear we could optimize this further.
> 
> Using the same encoding logic to specify only the minimumal sed
> operation necessary, and using xargs to avoid the os.system call the
> install step was able to be performed in 13% of the original time.
> 
> Example timing numbers for perl:
> 
> 3m7s original code
> 1m20s single sed, but interating
> 0m26s using xargs and limited sed
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/sstate.bbclass |   28 +++++++++++++++++++++-------
>  1 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index a8c98e5..ad7d121 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -174,18 +174,29 @@ def sstate_installpkg(ss, d):
>      bb.build.exec_func('sstate_unpack_package', d)
>  
>      # Fixup hardcoded paths
> +    #
> +    # Note: The logic below must match the reverse logic in
> +    # sstate_hardcode_path(d)
> +
>      fixmefn =  sstateinst + "fixmepath"
>      if os.path.isfile(fixmefn):
>          staging = d.getVar('STAGING_DIR', True)
>          staging_target = d.getVar('STAGING_DIR_TARGET', True)
>          staging_host = d.getVar('STAGING_DIR_HOST', True)
> -        fixmefd = open(fixmefn, "r")
> -        fixmefiles = fixmefd.readlines()
> -        fixmefd.close()
> -        for file in fixmefiles:
> -            os.system("sed -i -e s:FIXMESTAGINGDIRTARGET:%s:g %s" % (staging_target, sstateinst + file))
> -            os.system("sed -i -e s:FIXMESTAGINGDIRHOST:%s:g %s" % (staging_host, sstateinst + file))
> -            os.system("sed -i -e s:FIXMESTAGINGDIR:%s:g %s" % (staging, sstateinst + file))
> +
> +	if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
> +		sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIR:%s:g'" % (staging)
> +	elif bb.data.inherits_class('cross', d):
> +		sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIR:%s:g'" % (staging_target, staging)
> +	else:
> +		sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRHOST:%s:g'" % (staging_host)
> +
> +	# Add sstateinst to each filename in fixmepath, use xargs to efficiently call sed
> +	sstate_hardcode_cmd = "sed -e 's:^:%s:g' %s | xargs %s" % (sstateinst, fixmefn, sstate_sed_cmd)
> +
> +	print "Replacing fixme paths in sstate package: %s" % (sstate_hardcode_cmd)
> +	os.system(sstate_hardcode_cmd)
> +
>          # Need to remove this or we'd copy it into the target directory and may 
>          # conflict with another writer
>          os.remove(fixmefn)
> @@ -300,6 +311,9 @@ python sstate_cleanall() {
>  def sstate_hardcode_path(d):
>  	# Need to remove hardcoded paths and fix these when we install the
>  	# staging packages.
> +	#
> +	# Note: the logic in this function needs to match the reverse logic
> +	# in sstate_installpkg(ss, d)
>  
>  	staging = d.getVar('STAGING_DIR', True)
>  	staging_target = d.getVar('STAGING_DIR_TARGET', True)

I was thinking this looked familiar, it was the other half of the
problem we originally solved:

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/sstate.bbclass?id=db94ad4cf32d8ce3e97a8287d1c89a58d008a142

:)

Cheers,

Richard





