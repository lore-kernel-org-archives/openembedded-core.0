Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8179F6160B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 09:17:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g134so1092340wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 01:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eCnZQUTwDiwxP3dyhkkVicPx5AEv3xYQsPoNj6Vvegw=;
	b=f1c2b56s2WGqDxq1bkMC9/9lWO447sGQG8+DazcDzhBopJlLfrN5RY5a+QQcp3eDRG
	iirwsCZaEw7bKhydweYRTxNqTFigS8Y9tOZa0m+BH6IoLusX0p+Sfl1VYymjPMci9+5g
	Dwt6afUQ4T8nqpFD5zsz6bvLeUT+JFmcpPwOKBRt63vBqCmLWKhE327h6nqYdZA+AoVW
	63KPUKiMJ05iwiCo1sYFHMIrWucLQ9yAr2U9ysFjNMDI9pJJm6MGamiKD7+TzUz1R/2B
	ZUipqcgAXeaw4esmeM0kIP2mX3zvtGKPGI62pMaZrv7GqTbH0NDph1JxDEIfHk53orYm
	BPwg==
X-Gm-Message-State: ANhLgQ3fMasL5sEZUvsB1eQbGCgYaM7TfcV2vZAdxiHXinBoEOQLcgun
	W8yFDukmuawXcBvRpOhZPYHgz00x
X-Google-Smtp-Source: ADFU+vuuJLim1kluaKTZOT/WN5TSP4qbPOhdbV3mj+tNffH41b5XTVop9h0f82J57IvuMNwqB92Kpw==
X-Received: by 2002:a1c:9c87:: with SMTP id f129mr2769641wme.26.1583313450719; 
	Wed, 04 Mar 2020 01:17:30 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s14sm26154893wrv.44.2020.03.04.01.17.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 01:17:30 -0800 (PST)
Message-ID: <2588ab8f2899ec2b139a9ce3619ae6ed06648ba3.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 04 Mar 2020 09:17:29 +0000
In-Reply-To: <20200129090738.1398-9-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
	<20200129090738.1398-9-alex.kanavin@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: linux-firmware broken (was: Re: [PATCH 09/24] linux-firmware: upgrade to latest revision)
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
X-List-Received-Date: Wed, 04 Mar 2020 09:17:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-29 at 10:07 +0100, Alexander Kanavin wrote:
> License-Update: Copyright years, file lists
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

This recipe update has broken linux-firmware for various devices I think.

It appears that since upstream's 20191022 release, linux-firmware is not
meant to be installed via simple copying anymore  (as this recipe still
does in do_install()), but instead you're meant to use their
copy-firmware.sh script.

In particular, all the symlinks that used to be part of the upstream git
are missing now, because copy-firmware extracts them on the fly from the
WHENCE file, they're not part of the git repository anymore. Without those
various kernel drivers will fail to load their firmware...


Cheers,
Andre'


> ---
>  ...ux-firmware_20190815.bb => linux-firmware_20200117.bb} | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20190815.bb => linux-firmware_20200117.bb} (99%)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb b/meta/recipes-kernel/linux-firmware/linux-
> firmware_20200117.bb
> similarity index 99%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200117.bb
> index d83000b64f0..8111c410161 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200117.bb
> @@ -66,7 +66,7 @@ LICENSE = "\
>  LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
>                      file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
> -                    file://LICENSE.amdgpu;md5=ab515ef6495ab5c5a3b08ab2db62df11 \
> +                    file://LICENSE.amdgpu;md5=d357524f5099e2a3db3c1838921c593f \
>                      file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
>                      file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
>                      file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
> @@ -88,6 +88,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
>                      file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
>                      file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
> +                    file://LICENSE.ice;md5=742ab4850f2670792940e6d15c974b2f \
>                      file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
>                      file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
>                      file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
> @@ -98,6 +99,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
>                      file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
>                      file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
> +                    file://LICENCE.NXP;md5=58bb8ba632cd729b9ba6183bc6aed36f \
>                      file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
>                      file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
>                      file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
> @@ -123,7 +125,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
>                      file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
>                      file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
> -                    file://WHENCE;md5=37a01e379219d1e06dbccfa90a8fc0ad \
> +                    file://WHENCE;md5=cdcd9f664a404c681bb745bcac6253a3 \
>                      "
>  
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
> @@ -192,7 +194,7 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
>  
>  PE = "1"
>  
> -SRCREV = "07b925b450bfb4cf3e141c612ec5b104658cd020"
> +SRCREV = "9c340bd1bdabf53808a9178a7be98c5f2ad599a7"
>  
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
>  
> -- 
> 2.25.0
> 


