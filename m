Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CEB04731AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBICMg8s002731; Fri, 18 Dec 2015 12:22:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CeaBN_DwK93S; Fri, 18 Dec 2015 12:22:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBICMevc002727
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 18 Dec 2015 12:22:41 GMT
Message-ID: <1450441360.8461.37.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 12:22:40 +0000
In-Reply-To: <1450427985-12504-3-git-send-email-markus.lehtonen@linux.intel.com>
References: <1450427985-12504-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1450427985-12504-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/5] kernel.bbclass: copy .config instead of moving
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
X-List-Received-Date: Fri, 18 Dec 2015 12:22:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-12-18 at 10:39 +0200, Markus Lehtonen wrote:
> Copy kernel .config from ${S} to ${B}, instead of moving it. This
> prevents mangling the source tree, which is undesirable e.g. when
> externalsrc is used.
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass
> b/meta/classes/kernel.bbclass
> index 4ce1611..7de9f20 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -338,7 +338,7 @@ kernel_do_configure() {
>  	touch ${B}/.scmversion ${S}/.scmversion
>  
>  	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f
> "${B}/.config" ]; then
> -		mv "${S}/.config" "${B}/.config"
> +		cp "${S}/.config" "${B}/.config"
>  	fi
>  
>  	# Copy defconfig to .config if .config does not exist. This
> allows

I'm not sure about this, doesn't this trigger the kernel to see ${S} as
being 'dirty' and cause other issues when you try and do out of tree
builds with it? 

It also means we have two copies of "config" around which can end up
being different and confuse users no end :(.

Cheers,

Richard


