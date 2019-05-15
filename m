Return-Path: <martin@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id D56337DE2C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 07:06:54 +0000 (UTC)
Received: from [172.21.3.80] (unknown [87.54.42.112])
	by first.geanix.com (Postfix) with ESMTPSA id F0855C0A;
	Wed, 15 May 2019 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1557904004; bh=pX0AtQefTv70e5BoaxmaaZTVWc8weh2GXwyU0uiMxKw=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Fcg+G3JPfe0pNkZvovK/nfkLhPYAxZg3WK49DjLxjdtWiJ7PGkY++PhUA8c3ipyty
	EML3PZtmYrvAqll8G/LmFm8IDxavdq98ULEyY2fapk4GebfnEtsNDBDaYThBkph7Dv
	15TBhXWCZkdOCpx87QrouP4uoXFrQRmGEL6tGXv7iEGkABtrcY0G3csr4TvAzqWOb7
	EnyKm8BOWy8TebVQpNTSWOMQhPBJv1bTJZ3c/VPoqSQHkaQCjE8hh3ds8W6hIHOD42
	x37/kowziAvYPrmgfTZd5Z+U3r3W5quUmBx/eK3pGTeURATnW3OG9WXcqovFunk5HW
	YB4QtFGayoYcQ==
To: Haiqing Bai <Haiqing.Bai@windriver.com>, ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
References: <20190515064209.230282-1-Haiqing.Bai@windriver.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <9aed4d4c-5b2a-77d0-0040-1999b8767015@geanix.com>
Date: Wed, 15 May 2019 09:06:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515064209.230282-1-Haiqing.Bai@windriver.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 796779db2bec
Subject: Re: [V3][PATCH] sysstat: Add PACKAGECONFIG[cron] for '--enable-install-cron' option
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
X-List-Received-Date: Wed, 15 May 2019 07:06:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

Hi,

On 15/05/2019 08.42, Haiqing Bai wrote:
> If 'cron' is added into PACKAGECONFIG, for sysvinit, the related
> cron scripts will be installed; for systemd, the services of
> data collect and summary will be installed.
> 
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>   meta/recipes-extended/sysstat/sysstat.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
> index 0bc7e14d36..79555e6cf3 100644
> --- a/meta/recipes-extended/sysstat/sysstat.inc
> +++ b/meta/recipes-extended/sysstat/sysstat.inc
> @@ -19,6 +19,7 @@ inherit autotools-brokensep gettext systemd
>   
>   PACKAGECONFIG ??= ""
>   PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
> +PACKAGECONFIG[cron] = "--enable-install-cron --enable-copy-only,--disable-install-cron --disable-copy-only"
>   
>   EXTRA_OECONF += "--disable-stripping"
>   
> @@ -59,7 +60,6 @@ pkg_postinst_${PN} () {
>           fi
>   }
>   
> -
> -FILES_${PN} += "${libdir}/sa"
> +FILES_${PN} += "${libdir}/sa ${systemd_unitdir}/system/*"

You can use "${systemd_system_unitdir}" instead of 
"${systemd_unitdir}/system/". And also no need to append the asterisk.

// Martin

