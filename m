Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 405487D74A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 14:07:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44zdZk6w5pz5Q;
	Wed,  8 May 2019 16:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557324431;
	bh=Mhks+hWfLHuAqXI5MVYjU3vvNgehYj4SSN6Zz3ehl3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBjL0tz5RchrxFsPNTNqSqPZrhFqOH9+IJVLerNzXPPIjWPVE5kPOtnOb1CDnlNhA
	C47Vr6d3iAm410Z1Ukh3dxzPzdAs4MBdl48cNCaScYYDV9e3UuDyY25NmwXomLE4Pe
	4lvTVavCpsBXPr5TB5EoWSq/EX3eoDMk12ewHVFQiedw+SWswC5PQrDp0wKqrBvlKw
	pC3ab5KLTW3UMWnjG648YvwxUpR/JBuPn8ueJhz2TzOgoDKMlaFIoGdMoxYCyOui+P
	tBJiQ76ttVKm73a3qP4KwywdbyaivB5McjEhC1ogFT/Vsslf6iztEz45Y8ep/hrmZo
	aQiNnJ8Hy6KeIi3M/FKH5+68BUuxRq3dMas8DFaBjMkYg3m9OZkZbAtpIi852wwXqr
	0G2VgU6PAdsj/nGe71EWAMEEgx9h27mcZ3JP9sRzzr30pInD0TzMbutSqtAL4hDccW
	DqeLgjcMc7eUxv1mqBhO1pDeJYKCNbadd7OXkSLDbDT2mk237n6HVHSqsb5uLFziCw
	FXLMjL9181bfxDlwFa21i3LfazQ/9SFhFmmPbtOCXdWGxZnJX+ENegMyZfVYeSyoqU
	z+n/EhkYiOkkPoz1Aq60XbCNGSp3piKG4JQi4zdN9d8Gb2HnsnhM8ph9rtGDDLawBW
	nnEo09/AASQNa4mI3VmSr/Ms=
Date: Wed, 8 May 2019 17:07:08 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Message-ID: <20190508140708.GC25917@localhost>
References: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
	<1557321969-28686-2-git-send-email-mikko.rapeli@bmw.de>
MIME-Version: 1.0
In-Reply-To: <1557321969-28686-2-git-send-email-mikko.rapeli@bmw.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] openssh: usable sshd depends on rngd from rng-tools
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
X-List-Received-Date: Wed, 08 May 2019 14:07:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 08, 2019 at 04:26:09PM +0300, Mikko Rapeli wrote:
> Since openssl 1.1.1 and openssh which uses it, sshd
> startup is delayed. The delays range from few seconds
> to minutes and even to hours. The delays are visible
> in host keys generation and when sshd process is started
> in response to incoming TCP connection but is failing
> to provide SSH version string and clients or tests time out.
> 
> In all cases traces show that sshd is waiting for getentropy()
> system call to return from Linux kernel, which returns only
> after kernel side random number pool is initialized. The pool
> is initialized via various entropy source which may be
> missing on embedded development boards or via rngd from
> rng-tools package from userspace. HW random number generation
> and kernel support help but rngd is till needed to feed that data
> back to the Linux kernel.
> 
> Example from an NXP imx8 board shows that kernel random number pool
> initialization can take over 400 seconds without rngd,
> and with rngd it is initialized at around 4 seconds after boot.
> The completion of initialization is visible in kernel dmesg with line
> "random: crng init done".
>...
> --- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> @@ -148,6 +148,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
>  
>  RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>  RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> +RDEPENDS_${PN}-sshd += "rng-tools"
>...

This should only be an RRECOMMENDS so that people can opt out of it.

E.g. CONFIG_RANDOM_TRUST_CPU in the kernel can solve the same 
problem without using rng-tools on some platforms.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


