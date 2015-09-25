Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4CBA07391A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 15:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 2BAF9315AEC1;
	Fri, 25 Sep 2015 17:59:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id hU8n1wq8Ogz1; Fri, 25 Sep 2015 17:59:04 +0200 (CEST)
Received: from [172.22.22.61] (55d45210.access.ecotel.net [85.212.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E8D8E315AD2E;
	Fri, 25 Sep 2015 17:59:03 +0200 (CEST)
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1443179044.git.jussi.kukkonen@intel.com>
	<aa28a5439d5375728b83962d6814045053f9fdd6.1443179044.git.jussi.kukkonen@intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <56056F47.7040004@opendreambox.org>
Date: Fri, 25 Sep 2015 17:59:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <aa28a5439d5375728b83962d6814045053f9fdd6.1443179044.git.jussi.kukkonen@intel.com>
Subject: Re: [PATCH 1/2] connman: Depend on xuser-account unconditionally
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Sep 2015 15:59:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Jussi,

On 25.09.2015 13:14, Jussi Kukkonen wrote:
> This means dragging in xuser-account even when it's not used but
> that's a lesser evil than the recipe depending on machine specific
> settings.

that's quite ugly, sorry.

It's true that machine specific variables shouldn't be used in this
recipe, but adding privileged user accounts with regular home
directories is evil as well and confusing for real users.

There must be a better way to solve this.

Whether to add user accounts or not should be a decision made by the
distro. If this setting is machine specific, which to be honest
surprised me, why don't you just let the machine specific xorg video
driver depend on xuser-account unconditionally? Connman really doesn't
need this account.

> This also prevents a warning on connman service startup when
> ROOTLESS_X is not set:
>   Unknown username "xuser" in message bus
> 
> [YOCTO #8005]

This bugzilla entry is just about the warning, which could as well just
get ignored or removed from dbus.

Regards,
Andreas

> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index fd9640e..6c062ae 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -113,7 +113,7 @@ RPROVIDES_${PN} = "\
>  
>  RDEPENDS_${PN} = "\
>  	dbus \
> -	${@base_conditional('ROOTLESS_X', '1', 'xuser-account', '', d)} \
> +	xuser-account \
>  	"
>  
>  PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
> 


