Return-Path: <net147@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id BF3FF61A80
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 01:45:26 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id uo1so5583522pbc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2013 18:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=UmUHlL9pEMC7TSJKcmoj3WF3Nb2ZFX5Vua5z+AxVd64=;
	b=m8Yi12gA35ZfAZ2cv6qsz8BCYt2BwPeMP2KVOc+gf5IA8tNskX7SBDzFWpv7xdV3NQ
	xC3ACho5LMcIAxyGc69w2iY2BpRTZECK9fQDRlHGmZVJ001Z9heBtNGGk0cFrXIGrxwc
	22qw1YoyQpXDqPb9dCrVbBcH9R1P64DvAosypk6S7mNHnfIxx1Gc1l4TugLuKoinu3sm
	3kmR60cp44tso3HNmqv7RbhgBBPwqCRkrkSj745wchXX6MkfsfXnIAzaEfKsAE8cGtab
	9uzRxh2dMaHmrAEGXHvOO4caygn48GOcxTqtkqOpM73v2qzcWn695xsDL5qhv+8Jl17m
	udqg==
X-Received: by 10.66.21.38 with SMTP id s6mr24043197pae.103.1369532727852;
	Sat, 25 May 2013 18:45:27 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	xl10sm24078128pac.15.2013.05.25.18.45.25 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 25 May 2013 18:45:26 -0700 (PDT)
Message-ID: <51A16815.7050002@gmail.com>
Date: Sun, 26 May 2013 11:40:37 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1369354206-9466-1-git-send-email-net147@gmail.com>
In-Reply-To: <1369354206-9466-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] resolvconf: remove /var/volatile/run/resolvconf/interface from package
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
X-List-Received-Date: Sun, 26 May 2013 01:45:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 24/05/2013 10:10 AM, Jonathan Liu wrote:
> - Remove /etc/resolvconf/run/interface from package as it actually uses
> /etc/resolvconf/run/interface
> - Create /var/run/resolvconf/interface on startup using
> populate-volatiles.sh and tmpfiles.d for systemd
> - Create symbolic link from /etc/resolvconf/run to /var/run/resolvconf
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
> index d342a6e..78de492 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
> @@ -23,7 +23,15 @@ do_compile () {
>   }
>   
>   do_install () {
> -	install -d ${D}${sysconfdir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
> +	install -d ${D}${sysconfdir}/default/volatiles
> +	echo "d root root 0755 ${localstatedir}/run/${P}/interface none" \
> +	     > ${D}${sysconfdir}/default/volatiles/99_resolvconf
> +	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
Looks like I forgot to create ${D}${sysconfdir}/tmpfiles.d directory 
here. Fixed in V3 patch.

Regards,
Jonathan
> +		echo "d /run/${P}/interface - - - -" \
> +		     > ${D}${sysconfdir}/tmpfiles.d/resolvconf.conf
> +	fi
> +	ln -snf ${localstatedir}/run/${P} ${D}${sysconfdir}/${P}/run
> +	install -d ${D}${sysconfdir} ${D}${base_sbindir}
>   	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
>   	cp -pPR etc/* ${D}${sysconfdir}/
>   	chown -R root:root ${D}${sysconfdir}/


