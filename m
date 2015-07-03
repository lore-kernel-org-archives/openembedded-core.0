Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6C33E65CCC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 08:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7DD0D315748B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 10:00:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5KGIlRV9OjLe
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 10:00:41 +0200 (CEST)
Received: from [172.22.22.61] (55d44c7e.access.ecotel.net [85.212.76.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D53DC31572F5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 10:00:40 +0200 (CEST)
Message-ID: <55964128.4090607@opendreambox.org>
Date: Fri, 03 Jul 2015 10:00:40 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1435905732-15169-1-git-send-email-xiao.zhang@windriver.com>
In-Reply-To: <1435905732-15169-1-git-send-email-xiao.zhang@windriver.com>
Subject: Re: [PATCH] systemd: bug fix for the path of systemd.conf
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
X-List-Received-Date: Fri, 03 Jul 2015 08:00:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Zhang Xiao,

On 03.07.2015 08:42, Zhang Xiao wrote:
> tmpfiles.d/systemd.conf lies in {prefix}/lib not {libdir}.
> Fix it.
> 
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_219.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index 6ed4fe0..04db47b 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -178,7 +178,7 @@ do_install() {
>  	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
>  	# for existence else it fails
>  	if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; the
> -		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
> +		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${prefix}/lib/tmpfiles.d/systemd.conf', d)}

wouldn't it be appropriate to change the conditional above, too?

Regards,
Andreas

