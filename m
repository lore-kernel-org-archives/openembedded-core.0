Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 682076FE64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:48:49 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id w7so366124qcr.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 07:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fX+oE7VoHsI+0W4jdIGkCMTZeARJIpHdrpSeIdPsDSo=;
	b=SQLOGM/o/9hTGEgxomW7uNe6E9BeJB9OqYdAAj+TfWpcKP1w6fKOppHippuhsgzCzD
	3L4e/M/kfo4cej6rl/4vJiPFiY7K/pj9ZqvDcNcgFN0JdhOINkYbCvsdqHpKnCt/qfw2
	Zk6cTxLv9tlE/STVgtGVXE0mpoMzgd2eVBe7ziw9bU6lGAdQElwps6+mNpwyBiOQGyMv
	lLm4qMCqvc9nVKcujH+xP64xH2ihrPLdwhKeJlFGPr9eppIOZTxZ9NVT2m5AesYGA4O3
	EUgMiRvxqv9NcZAIVTTGsbbYZXzbBIwbMxcsDDchrFI3s/VPwutbBEDCCzpy2Ah8/ejd
	Wvtg==
X-Gm-Message-State: ALoCoQmF2jjfr4FX/HbnJvSgXsekIGf7N5G/YaFv8Mdz6FxMLvQWfP1UJrYrLygnE2kJKp0pVWQF
X-Received: by 10.224.103.65 with SMTP id j1mr27886697qao.17.1409150929355;
	Wed, 27 Aug 2014 07:48:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 27 Aug 2014 07:48:29 -0700 (PDT)
In-Reply-To: <ef8574dfdd5992bdd42b788a909d0610d8b23b21.1409074419.git.max.eliaser@intel.com>
References: <cover.1409074419.git.max.eliaser@intel.com>
	<ef8574dfdd5992bdd42b788a909d0610d8b23b21.1409074419.git.max.eliaser@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Aug 2014 15:48:29 +0100
Message-ID: <CAJTo0LZ_fZsexOVt2M1Tb4Pv-zghRJa=2ALMxxAKrHwFPc9Vqw@mail.gmail.com>
To: Max Eliaser <max.eliaser@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] qemux86: support X11 when QEMU is emulating a different GPU than vmware
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
X-List-Received-Date: Wed, 27 Aug 2014 14:48:57 -0000
Content-Type: text/plain; charset=UTF-8

On 26 August 2014 18:34, Max Eliaser <max.eliaser@intel.com> wrote:
> QEMU is capable of emulating four different VGA adapters: cirrus, std, vmware,
> and QXL. By adding the cirrus and fbdev X.Org drivers to the qemux86 image,
> the image can be made to launch an X server on when cirrus and std are chosen,
> in addition to just vmware. (The build of QEMU in OE-Core appears to have QXL
> disabled, meaning a driver for it is unnecessary.)

I knew there was something missing...

http://lxr.free-electrons.com/source/drivers/gpu/drm/cirrus/Kconfig

The kernel has a minimal DRM/KMS driver for the Cirrus that qemu
emulates, so we should also add xf86-video-modesettings driver to this
list and ensure that the qemu images enable this kernel driver.

Ross

