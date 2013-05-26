Return-Path: <net147@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7EABA6968F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 02:10:57 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id xb12so5619493pbc.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2013 19:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=zrB2aVfwHtz5wlZM6kOGy5j/rwShcFPj8xfx6eF4wLo=;
	b=Bfq3NR0O4LhjRl0UjVw4yO1jPgVqBpLkKxqjDSIJAMceunVfXTHp4ZWKuYoAV1M2eE
	W8hpYtfNVehgbneoWklIei/uUKqEXSPEkyu+kTMMky1u5/u2l7ACEiQYd/PErZJHuB6A
	3sphKqYL7S58F2+HkCU1DaYJkEQl5KZLHNo8+qpg33YL54h3pnVl6R7oym0ihQy8Ines
	qpdP8EQo29cWTgZYUKQCAQbizeX24WQ4ZbStwoo4XZuZt3u25DosakFVH51JEitxtqzm
	uFTbFRb6+hE9h1tYtlSLUnalZN7IWXf121QnsbC0RWZijKlYsgKnEA5ievn3885jTD0S
	FC/Q==
X-Received: by 10.68.253.230 with SMTP id ad6mr23368549pbd.182.1369534258897; 
	Sat, 25 May 2013 19:10:58 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	wt5sm22480680pbc.38.2013.05.25.19.10.56 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 25 May 2013 19:10:57 -0700 (PDT)
Message-ID: <51A16E10.5080804@gmail.com>
Date: Sun, 26 May 2013 12:06:08 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1369533437-328-1-git-send-email-net147@gmail.com>
In-Reply-To: <1369533437-328-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] resolvconf: remove /var/volatile/run/resolvconf/interface from package
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
X-List-Received-Date: Sun, 26 May 2013 02:10:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/05/2013 11:57 AM, Jonathan Liu wrote:
> - Remove /etc/resolvconf/run/interface from package as it actually uses
> /etc/resolvconf/run/interface
> - Create /var/run/resolvconf/interface on startup using
> populate-volatiles.sh and tmpfiles.d for systemd
> - Create symbolic link from /etc/resolvconf/run to /var/run/resolvconf
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
> index a96dbff..fc12215 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
> @@ -23,7 +23,16 @@ do_compile () {
>   }
>   
>   do_install () {
> -	install -d ${D}${sysconfdir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
> +	install -d ${D}${sysconfdir}/default/volatiles
> +	echo "d root root 0755 ${localstatedir}/run/${P}/interface none" \
> +	     > ${D}${sysconfdir}/default/volatiles/99_resolvconf
> +	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +		install -d ${D}${sysconfdir}/tmpfiles.d
> +		echo "d /run/${P}/interface - - - -" \
> +		     > ${D}${sysconfdir}/tmpfiles.d/resolvconf.conf
> +	fi
> +	ln -snf ${localstatedir}/run/${P} ${D}${sysconfdir}/${P}/run
Missing creation of ${D}${sysconfdir}/${P} here. Fixed in V4.

Regards,
Jonathan
> +	install -d ${D}${sysconfdir} ${D}${base_sbindir}
>   	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
>   	cp -pPR etc/* ${D}${sysconfdir}/
>   	chown -R root:root ${D}${sysconfdir}/


