Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RsccB-0006wp-Da for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 17:00:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q11Fr14F023880;
	Wed, 1 Feb 2012 15:53:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23614-03; Wed,  1 Feb 2012 15:52:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q11FqsBx023874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 1 Feb 2012 15:52:55 GMT
Message-ID: <1328111578.13744.91.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 01 Feb 2012 15:52:58 +0000
In-Reply-To: <1328107366-22541-2-git-send-email-bruce.ashfield@windriver.com>
References: <1328107366-22541-1-git-send-email-bruce.ashfield@windriver.com>
	<1328107366-22541-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: chris_larson@mentor.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/patch: return "other" elements found on the SRC_URI
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
X-List-Received-Date: Wed, 01 Feb 2012 16:00:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-01 at 09:42 -0500, Bruce Ashfield wrote:
> commit:
> 
>   patch.bbclass: abstract out logic that determines patches to apply
> 
> gives the ability for other clases to emit series files for use outside
> of a build system, or even within the build system. There are sometimes
> elements on the SRC_URI that while not directly applicable to patching,
> can be related to patching the package. For example, the yocto kernel
> class would like to know about these 'other' items on the SRC_URI to
> locate out of tree kernel features.
> 
> This change keeps the default the same, but adds the ability to query
> for anything 'non-patch' that may be on the SRC_URI. Additional filtering
> is left up to the caller of the routine.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/patch.bbclass |   11 +++++++++--
>  1 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index 1ea4bc5..d664215 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -7,13 +7,17 @@ PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_sysroot"
>  
>  inherit terminal
>  
> -def src_patches(d):
> +def src_patches(d, type = "patches"):

Knowing "magic" strings to pass to functions isn't very intuitive. You
could do:

+def src_patches(d, all = False):


>  	workdir = d.getVar('WORKDIR', True)
>  	fetch = bb.fetch2.Fetch([], d)
>  	patches = []
> +	others = []
>  	for url in fetch.urls:
>  		local = patch_path(url, fetch, workdir)
>  		if not local:
> +			if type == "others":
> +				local = fetch.localpath(url)
> +				others.append(local)
>  			continue
>  
>  		urldata = fetch.ud[url]
> @@ -43,7 +47,10 @@ def src_patches(d):
>  		localurl = bb.encodeurl(('file', '', local, '', '', patchparm))
>  		patches.append(localurl)
>  
> -	return patches
> +	if type == "others":
> +		return others
> +	else:
> +		return patches

if all:
    return others
return patches

You might want to call it sources instead of others too.

Cheers,

Richard



