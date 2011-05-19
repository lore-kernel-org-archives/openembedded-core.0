Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN1oP-0005tJ-Du for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 13:54:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JBpkDx007587
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 12:51:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07401-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 12:51:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JBpdgb007581
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 12:51:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <439b9cfa6032b7c51b326a7cf888d83fd55d1305.1305800693.git.lianhao.lu@intel.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
	<439b9cfa6032b7c51b326a7cf888d83fd55d1305.1305800693.git.lianhao.lu@intel.com>
Date: Thu, 19 May 2011 12:51:37 +0100
Message-ID: <1305805897.3424.490.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/5] conf/bitbake.conf: Added variables for PR service.
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
X-List-Received-Date: Thu, 19 May 2011 11:54:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 18:29 +0800, Lianhao Lu wrote:
> From: Lianhao Lu <lianhao.lu@intel.com>
> 
> 1. change BB_SIGNATURE_HANDLER from basic to basichash.
> 
> 2. Added following variables for PR service:
> USE_PR_SERV: flag of whether to use the network PR service
> PRFORMAT: format of revision to be used in tasks package_write_xxx.
> PRAUTOINX: search index for the network PR service
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/conf/bitbake.conf |   14 ++++++++++++--
>  1 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a0af672..381f301 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -153,8 +153,13 @@ PR = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[2] or 'r0
>  PF = "${PN}-${EXTENDPE}${PV}-${PR}"
>  EXTENDPE = "${@['','${PE\x7d_'][bb.data.getVar('PE',d,1) > 0]}"
>  EXTENDPEVER = "${@['','${PE\x7d:'][bb.data.getVar('PE',d,1) > 0]}"
> -EXTENDPV = "${EXTENDPEVER}${PV}-${PR}"
> +EXTENDPV = "${EXTENDPEVER}${PV}-${PRFORMAT}"
>  P = "${PN}-${PV}"
> +EXTENDPREXTRA = "${@['.${PREXTRA\x7d',''][bb.data.getVar('PREXTRA',d,1) is None]}"
> +EXTENDPRAUTO = "${@['.${PRAUTO\x7d',''][bb.data.getVar('PRAUTO',d,1) is None]}"
> +PRAUTOINX = "${PF}${EXTENDPREXTRA}"
> +PRFORMAT = "${PR}${EXTENDPREXTRA}${EXTENDPRAUTO}"
> +

There is also one thing we need to sync up with regarding openembedded
and these patches which is the use of PKGV and PKGR in package.bbclass.
Those patches are not merged into OE-Core yet but are have a similar
intention of allowing customisation to the PV and PR fields. I would
like to see if we can use PKGR for the use case we have here as well.

See:
http://git.openembedded.net/cgit.cgi/openembedded/tree/classes/package.bbclass

(I was only reminded of this recently in an IRC conversation with
Otavio)


Minor nitpick but new code should replace:

bb.data.getVar('PRAUTO',d,1)

with

d.getVar('PRAUTO', True)

which is functionally equivalent, neater and more pythonic. Its not a
major issue but worth highlighting.

Cheers,

Richard







