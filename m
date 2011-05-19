Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN1r5-0005xV-G0 for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 13:57:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JBsVDa007597
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 12:54:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07427-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 12:54:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JBsOtg007591
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 12:54:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <c75426ee78c4ed4dae65ba35fc8781be4afdc701.1305800693.git.lianhao.lu@intel.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
	<c75426ee78c4ed4dae65ba35fc8781be4afdc701.1305800693.git.lianhao.lu@intel.com>
Date: Thu, 19 May 2011 12:54:21 +0100
Message-ID: <1305806061.3424.493.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/5] classes/package(prserv).bbclass: Added PR service support.
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
X-List-Received-Date: Thu, 19 May 2011 11:57:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 18:29 +0800, Lianhao Lu wrote:
> From: Lianhao Lu <lianhao.lu@intel.com>
> 
> 1. Added package_get_auto_rev to PACKAGEFUNCS to get the auto
> incremented value(PRAUTO) from remote PR service.
> 
> 2. Save PRFORMAT to pkgdata to be used by package_write_xxx.
> 
> 3. Added supporting functions in prserv.bbclass.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/classes/package.bbclass |   36 +++++++++++++++++++++++++-----------
>  meta/classes/prserv.bbclass  |   29 +++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 11 deletions(-)
>  create mode 100644 meta/classes/prserv.bbclass
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 4eb349d..efadbbd 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -324,6 +327,15 @@ def runtime_mapping_rename (varname, d):
>  # Package functions suitable for inclusion in PACKAGEFUNCS
>  #
>  
> +python package_get_auto_rev() {
> +	if bb.data.getVar('USE_PR_SERV', d, True):
> +		auto_rev=get_auto_rev(d)
> +		if auto_rev is None:
> +			bb.fatal("Can NOT get auto revision from remote PR service")
> +			return
> +		bb.data.setVar('PRAUTO',str(auto_rev),d)
> +}
> +
>  python package_do_split_locales() {
>  	if (bb.data.getVar('PACKAGE_NO_LOCALE', d, True) == '1'):
>  		bb.debug(1, "package requested not splitting locales")

This looks a little confusing to me as at first glance I'd have said it
was related to SRCREV auto incrementing. Can we add something to to with
pr to the function name? Function names like get_auto_rev() and
make_conf() also need clearer namespacing to include prserv as a prefix
so its clearer where the functions are from and what they do.

Cheers,

Richard



