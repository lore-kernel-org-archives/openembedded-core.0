Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 440 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Jul 2018 08:48:37 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9770277195
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 08:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 8903F31E29F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 10:41:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id P91GdzPMfTKF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 10:41:15 +0200 (CEST)
Received: from t460p (p57A61AF4.dip0.t-ipconnect.de [87.166.26.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 89F4931E29EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 10:41:15 +0200 (CEST)
Date: Wed, 11 Jul 2018 10:41:11 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180711104111.722b3643@t460p>
In-Reply-To: <20180711060118.30193-1-Haiqing.Bai@windriver.com>
References: <20180711060118.30193-1-Haiqing.Bai@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH] iproute2: create symbol link '/bin/ip' to '/sbin/ip.iproute2'
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

On Wed, 11 Jul 2018 14:01:17 +0800
Haiqing Bai <Haiqing.Bai@windriver.com> wrote:

> Some applications which depend on iproute/iproute2 need to
> run '/sbin/ip.iproute2' through the symbol link '/bin/ip'
> e.g ifupdown.

Update-alternatives is supposed to create this link already.

> 
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>  meta/recipes-connectivity/iproute2/iproute2.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 4fbfec6f08..71d04a1021 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -29,6 +29,8 @@ do_configure_append () {
>  do_install () {
>      oe_runmake DESTDIR=${D} install
>      mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
> +    install -d ${D}${base_bindir}
> +    ln -s ${base_sbindir}/ip.iproute2 ${D}${base_bindir}/ip
>      install -d ${D}${datadir}
>      mv ${D}/share/* ${D}${datadir}/ || true
>      rm ${D}/share -rf || true


