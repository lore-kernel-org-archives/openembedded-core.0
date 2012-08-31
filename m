Received: from gravedo.de ([85.214.79.159] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1T7MBN-0003N7-N1
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 10:02:25 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id AA297204004; Fri, 31 Aug 2012 09:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=6.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from [192.168.178.27] (dslb-092-076-173-241.pools.arcor-ip.net
	[92.76.173.241]) by gravedo.de (Postfix) with ESMTPSA id 5EA5F204001;
	Fri, 31 Aug 2012 09:42:28 +0200 (CEST)
Message-ID: <50406AE3.1020208@gravedo.de>
Date: Fri, 31 Aug 2012 09:42:27 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1346369662-17265-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1346369662-17265-1-git-send-email-sgw@linux.intel.com>
X-Enigmail-Version: 1.4.4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: Ignore eth0 cleanup when booting over the network
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 08:02:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 31.08.2012 01:34, schrieb Saul Wold:
> There was a change to connman, such that it cleans up the
> route table for devices at startup, this was causing the
> network to get lost and NFS to loose it connection.
> 
> The -I option will cause the device to be ignored.
> 
> [YOCTO #3008]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-connectivity/connman/connman/connman |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
> index f01bf37..2c8354a 100644
> --- a/meta/recipes-connectivity/connman/connman/connman
> +++ b/meta/recipes-connectivity/connman/connman/connman
> @@ -29,7 +29,7 @@ done
>  do_start() {
>  	EXTRA_PARAM=""
>  	if test $nfsroot -eq 1 ; then
> -		EXTRA_PARAM="-P ethernet"
> +		EXTRA_PARAM="-P ethernet -I eth0"
>  	fi
>  	$DAEMON $EXTRA_PARAM
>  }
> 

What about other devices where eht0 is not available but rndis0 for
example which has to be ignored?

As of right we have this fix for several machines in meta-smartphone
already ignoring rndis0 and usb0.

regards,
Simon

-- 
Simon Busch - http://mm.gravedo.de/blog/


