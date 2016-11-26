Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 868A971B13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7DC7531C143A;
	Sat, 26 Nov 2016 21:59:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id PoYgevM80ONZ; Sat, 26 Nov 2016 21:59:18 +0100 (CET)
Received: from [172.22.22.61] (55d45673.access.ecotel.net [85.212.86.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id C6F8C31C13C7;
	Sat, 26 Nov 2016 21:59:17 +0100 (CET)
To: Mark Asselstine <mark.asselstine@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1480047434-20600-1-git-send-email-mark.asselstine@windriver.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <b0072da0-ee70-0b57-7cf8-e1e800a591bc@opendreambox.org>
Date: Sat, 26 Nov 2016 21:59:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480047434-20600-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [PATCH] systemd.bbclass: don't block on service restart
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
X-List-Received-Date: Sat, 26 Nov 2016 20:59:21 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 25.11.2016 05:17, Mark Asselstine wrote:
> The current class works fine when a recipe uses SYSTEMD_AUTO_ENABLE
> 'enable' and has no on device pkg_postinst(), ie when the postinst is
> run as part of rootfs creation.  However, when there is a component of
> pkg_postinst() that is run on device the 'systemctl restart' is run as
> part of the run_postinsts.service at boot. This results in the boot
> spinning indefinitely with:
> 
> [ *** ] A start job is running for Run pending postinsts (7s / no limit)
> 
> The issue could potentially be that the packages service has an
> 'After' clause which comes later in the boot, beyond
> run_postinsts.service, creating a chicken before the egg
> scenario. Even service files without an 'After' clause cause this
> situation however. Despite this not being the cause of the issue this
> fix will prevent this scenario from happenning.
> 
> Using strace we are able to find that during boot, when
> run_postinsts.service is running attempting to start or restart any
> service will result in the call get stuck on poll(). Since the
> run_postinsts.service does not monitor the outcome of the call to
> restart we can work around this by using '--no-block'.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>

I was going to submit the exact same patch soon. It also helps to
complete system updates if a service fails to restart properly.

Acked-by: Andreas Oberritter <obi@opendreambox.org>

> ---
>  meta/classes/systemd.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index 7e51ed6..99a08a0 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -36,7 +36,7 @@ if type systemctl >/dev/null 2>/dev/null; then
>  	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>  
>  	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
> -		systemctl restart ${SYSTEMD_SERVICE}
> +		systemctl --no-block restart ${SYSTEMD_SERVICE}
>  	fi
>  fi
>  }
> 


