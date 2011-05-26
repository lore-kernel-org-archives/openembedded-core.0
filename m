Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPkjl-00032g-HK for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 02:17:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QNkljk028811;
	Fri, 27 May 2011 00:46:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28361-09; Fri, 27 May 2011 00:46:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QNkc6v028805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 27 May 2011 00:46:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <f2eb88161222a6df60739367d2f44342d3bfbbf2.1306364294.git.dvhart@linux.intel.com>
References: <cover.1306364294.git.dvhart@linux.intel.com>
	<f2eb88161222a6df60739367d2f44342d3bfbbf2.1306364294.git.dvhart@linux.intel.com>
Date: Fri, 27 May 2011 00:46:33 +0100
Message-ID: <1306453593.27470.226.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] utils.bbclass: make FILESEXTRAPATHS colon delimited
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
X-List-Received-Date: Fri, 27 May 2011 00:17:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 16:05 -0700, Darren Hart wrote:
> Fixes [YOCTO 1102]
> 
> Path variables are typically : delimited. White space is allowed in paths, so
> is not a good choice for separating paths. Currently utils.bbclass performs the
> following:
> 
>     extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()
> 
> This splits FILESEXTRAPATHS on whitespace. It later splits overrides on : and
> reassembles them all together as : delimited.
> 
> There is only one user of FILESEXTRAPATHS in oe-core (qt4-tools-native, which
> uses : anyway) and none in oe.
> 
> Change the split() in utils.bbclass to split on : instead of whitespace. When
> splitting on a defined string (":") we must be careful to handle the empty
> string case which returns [''] instead of [].
> 
> Tested building qt4-tools-native and core-image-minimal for surgarbay from
> meta-intel with a couple extra layers with FILESEXTRAPATHS modifications added.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Phil Blundell <pb@pbcl.net>
> ---
>  meta/classes/utils.bbclass |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index e103351..9930a24 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -331,8 +331,10 @@ def explode_deps(s):
>  
>  def base_set_filespath(path, d):
>  	filespath = []
> -	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()
> -	path = extrapaths + path
> +	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "")
> +	# Don't prepend empty strings to the path list
> +	if extrapaths != "":
> +		path = extrapaths.split(":") + path
>  	# The ":" ensures we have an 'empty' override
>  	overrides = (bb.data.getVar("OVERRIDES", d, 1) or "") + ":"
>  	for p in path:

This is being a little picky but I find the above hard to read and can't
we just do:

-	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split()
+	extrapaths = (bb.data.getVar("FILESEXTRAPATHS", d, True) or "").split(":")

?

Cheers,

Richard



