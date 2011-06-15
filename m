Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWg7b-0002Fb-JS
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 04:46:23 +0200
Received: by pvc30 with SMTP id 30so3116043pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 19:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lr08jujcCdbEkpcoqo2Z3S0zCSahiISXytTFl58sxs0=;
	b=gV9c857nrpaql/FMmx6FNg7iOCgl1obiRn9IC6mBAAiEyBS9W89sWpVGJkFssN2ky2
	RjV3W1tK8wFE85qXpKGX0nq6KH4gihpgGxdm/aLZkPkiOmu1F3y2bdg2diBmBLSMt6LJ
	J4MIZIsU7KanXLRu5IMut4dWN/JQBg8aj54kE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=SWlZY9AHsUDtxrA9CjV7AzpVXJhGqD2OzInWVAGVJ3RlneMiXrqydM2u80hDKgl89n
	G/nh9xbIPjhFEC9FkmyAB1sl/GDWjWOwbkR6BROlehhlChFG65FwbJzfl/nkp5aGmQ65
	cXU5jNa9NMeguEwNsRw7CHIvASAmRLH9NhwQI=
Received: by 10.142.249.27 with SMTP id w27mr274247wfh.78.1308105776911;
	Tue, 14 Jun 2011 19:42:56 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n9sm1176337wfk.8.2011.06.14.19.42.54
	(version=SSLv3 cipher=OTHER); Tue, 14 Jun 2011 19:42:55 -0700 (PDT)
Message-ID: <4DF81C2D.70502@gmail.com>
Date: Tue, 14 Jun 2011 19:42:53 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308065443.25285.268.camel@phil-desktop>
In-Reply-To: <1308065443.25285.268.camel@phil-desktop>
Subject: Re: [PATCH RFC] binutils: allow distro to select gold as default cross-linker
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
X-List-Received-Date: Wed, 15 Jun 2011 02:46:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2011 08:30 AM, Phil Blundell wrote:
> This is not particularly pretty but I couldn't think of any obviously
> better way of doing it.  Any suggestions?
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-devtools/binutils/binutils-cross.inc |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
> index 4b90972..5a41970 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross.inc
> @@ -5,7 +5,8 @@ EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
>                   --program-prefix=${TARGET_PREFIX} \
>                   --disable-install-libbfd \
>                   --disable-werror \
> -                --enable-poison-system-directories"
> +                --enable-poison-system-directories \
> +		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)}"
>
>   do_install () {
>   	oe_runmake 'DESTDIR=${D}' install

I think we need to document this distro feature somewhere as well. We 
need the same for target binutils too.


