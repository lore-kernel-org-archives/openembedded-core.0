Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDzAk-00038z-Kr for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 16:20:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VEBnHA024191
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 15:11:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23140-04 for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 15:11:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VEBgx8024185
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 15:11:43 +0100
Message-ID: <1333203102.18082.231.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 31 Mar 2012 15:11:42 +0100
In-Reply-To: <eb2bbe99f15183d5c82ab5c12178a1e336a7c5ce.1333176251.git.lianhao.lu@intel.com>
References: <d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
	<eb2bbe99f15183d5c82ab5c12178a1e336a7c5ce.1333176251.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/5] eglibc-nativesdk: Set GCC_ADDONS.
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
X-List-Received-Date: Sat, 31 Mar 2012 14:20:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-31 at 14:49 +0800, Lianhao Lu wrote:
> Set only necessary GCC_ADDONS for eglibc-nativesdk so that it is not
> dependant on the target eglibc's GCC_ADDONS settings.

You mean GLIBC_ADDONS, right? :)

> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc_2.13.bb |    3 ++-
>  meta/recipes-core/eglibc/eglibc_2.15.bb |    3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

This is a tricky problem as this is only correct for SDKMACHINEs which
are IA based (which the only tested combinations are atm).

Ideally this would go in conf/machine-sdk/* as SDK_GLIBC_ADDONS and then
in eglibc.inc we'd do:

GLIBC_ADDONS ?= "ports,nptl,libidn"
SDK_GLIBC_ADDONS ?= "${GLIBC_ADDONS}"
GLIBC_ADDONS_virtclass-nativesdk = "${SDK_GLIBC_ADDONS}"

which I appreciate is more complex but I think its more correct in case
someone wants to try a different SDKMACHINE.

Cheers,

Richard




