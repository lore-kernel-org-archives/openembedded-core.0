Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0A65E70E5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 00:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 712F2314DDA4;
	Tue, 26 Aug 2014 02:51:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id FYknrdasjP6M; Tue, 26 Aug 2014 02:51:17 +0200 (CEST)
Received: from [172.22.22.61] (55d44efc.access.ecotel.net [85.212.78.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 47671314DDA2;
	Tue, 26 Aug 2014 02:51:17 +0200 (CEST)
Message-ID: <53FBDA04.4070609@opendreambox.org>
Date: Tue, 26 Aug 2014 02:51:16 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1321087015.26881.15.camel@ted>
In-Reply-To: <1321087015.26881.15.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk.bbclass: Ensure bad recommendations persist in the status file
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
X-List-Received-Date: Tue, 26 Aug 2014 00:51:28 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Richard,

sorry for digging out such an old message, but please see below.

On 12.11.2011 09:36, Richard Purdie wrote:
> Currently bad recommendations are added to the status file with status
> "ok". After a single opkg command, whilst it will ignore the recommendation,
> the status changes to "installed" even if the recommended package was not
> installed. Whilst this is likely a glitch in opkg's logic, the correct
> way to persist the information in the status file is to set the status
> to "hold" as deinstall packages with that status remain. With this change
> the bad recommendations persist accross multiple opkg runs and the system
> behaves as expected.
> 
> [YOCTO #1758]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index 3b4c392..4a5a2dd 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -44,7 +44,7 @@ fakeroot rootfs_ipk_do_rootfs () {
>  		pkginfo="`opkg-cl ${IPKG_ARGS} info $i`"
>  		if [ ! -z "$pkginfo" ]; then
>  			echo "$pkginfo" | grep -e '^Package:' -e '^Architecture:' -e '^Version:' >> $STATUS
> -			echo "Status: deinstall ok not-installed" >> $STATUS
> +			echo "Status: deinstall hold not-installed" >> $STATUS

I just implemented bad recommendations for deb (in dora) and by looking
at dpkg's source code I realized that "hold" is only a valid value for
the first field. Maybe you meant to write "Status: hold ok
not-installed" instead? Valid values for the second field are ok and
reinstreq.

The code above doesn't exist in master anymore, but the status line
hasn't changed in the newer version implemented in python.

Regards,
Andreas

