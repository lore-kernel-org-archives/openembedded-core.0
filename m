Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QnsEU-0001Fe-7p for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 15:08:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71D4Fst007227
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:04:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04933-07 for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2011 14:04:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p71D49X2007221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 14:04:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d16f8ea81d614e2dd5608cbf8b773de9764b8d56.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d16f8ea81d614e2dd5608cbf8b773de9764b8d56.1312182844.git.sgw@linux.intel.com>
Date: Mon, 01 Aug 2011 14:03:56 +0100
Message-ID: <1312203836.2344.431.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 13/22] sanity: Dont throw a warning if TUNE_PKGARCH is in PACKAGE_ARCHS twice
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
X-List-Received-Date: Mon, 01 Aug 2011 13:08:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/sanity.bbclass |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 999e15d..dc11c9e 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -383,12 +383,14 @@ def check_sanity(e):
>      dups = []
>  
>      for pa in pkgarchs.split():
> -    	if seen.get(pa, 0) == 1:
> +	if pa == tunepkg:
> +	    tunefound = True
> +            if seen.get(pa, 0) == 1:
> +               pkgarchs.remove(pa)
> +    	elif seen.get(pa, 0) == 1:
>  	    dups.append(pa)
>  	else:
>  	    seen[pa] = 1
> -	if pa == tunepkg:
> -	    tunefound = True
>  
>      if len(dups):
>         messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)

How about we don't put duplicates in there in the first place?

Which board/tune files is this occurring with?

Cheers,

Richard



