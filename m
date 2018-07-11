Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B511B7719F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 08:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 27C1D31E29FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 10:42:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ZonFXQrTDh10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 10:42:48 +0200 (CEST)
Received: from t460p (p57A61AF4.dip0.t-ipconnect.de [87.166.26.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 3F62631E29EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 10:42:48 +0200 (CEST)
Date: Wed, 11 Jul 2018 10:42:47 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180711104247.4f8b6dbe@t460p>
In-Reply-To: <1531294187-8173-1-git-send-email-Haiqing.Bai@windriver.com>
References: <1531294187-8173-1-git-send-email-Haiqing.Bai@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ifupdown: fix issue that ifupdown does not configure local interface
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
X-List-Received-Date: Wed, 11 Jul 2018 08:48:37 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Jul 2018 15:29:46 +0800
Haiqing Bai <Haiqing.Bai@windriver.com> wrote:

> The patch "inet-6-.defn-fix-inverted-checks-for-loopback.patch" is not
> needed for ifupdown-0.8.16. And it causes the issue that ifupdown can
> not configure the loopback interface like:
> $cat /etc/network/interfaces
> auto lo
> iface lo inet loopback
> $ifconfig shows all up interfaces including 'lo'
> $ifup lo
> ifup: interface lo already configured
> $ifdown lo
> $ifconfig still shows the up interface 'lo'
> 
> The function of ifup/ifdown depends on '/bin/ip' which is provided by
> iproute2, so here add this runtime dependency.
> 
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>  meta/recipes-core/ifupdown/ifupdown_0.8.16.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
> index e9f3a2a..f91831f 100644
> --- a/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
> +++ b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
> @@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  
>  SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
>  	   file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
> -	   file://inet-6-.defn-fix-inverted-checks-for-loopback.patch \
>  	   file://99_network \
>  	  "
>  SRCREV = "11b9f99f7ecc7052497e6786156cfed531f11823"
>  
>  S = "${WORKDIR}/git"
>  
> +RDEPENDS_${PN} = "iproute2"

Does busybox RPROVIDE iproute2?

>  
>  inherit update-alternatives
>  


