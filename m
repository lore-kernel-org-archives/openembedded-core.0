Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 257D46FA62
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 04:46:28 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id y20so10287473ier.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 21:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=nLuMFxc+LRsbGPe/Hye+hFJtOQQR67r3ke4M8Vs2V9A=;
	b=KQdKenuW6C0tJZaicPYbAKUnVfIKWs+Omk4Vgnx03JUJK1ila260wZdKJDIZ/LroxM
	U+ha1lfyXfnjOs1HEpYPpyeLvb17Ng8Oh/4hlXxF7gI1KqDAfyjXQhU2JTRa6DBP6lrA
	jKAPs4fzyHAKqrdQAXM7eCzy2m7ZN/CYyQBRzO/ySxm8R+dogw3BlFjS/uRpQWmUeRch
	GBTLOHkoSbDQRka6ZHzkQIdQjfHLYXe+bdWhUWLsBlZ+K3foRF2Q0dabSDdZGcDng0Cv
	tspixU37mdmnK6QR3FfgSR10xt5vAUOtelhdKPo8+ZRhA0I5BPAZKim2PTN573oUTqo1
	aRLA==
X-Received: by 10.43.90.202 with SMTP id bj10mr39291349icc.48.1396413989287;
	Tue, 01 Apr 2014 21:46:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 1 Apr 2014 21:45:59 -0700 (PDT)
In-Reply-To: <1396346430-12927-1-git-send-email-stefanx.stanacar@intel.com>
References: <1396346430-12927-1-git-send-email-stefanx.stanacar@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2014 21:45:59 -0700
Message-ID: <CAMKF1spO7VZREp8ybQ1s1PtodCL9jwn-e1AfMV7FnScHm9QzWg@mail.gmail.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemux86-64: re-enable paravirt guest, bring it in sync with qemux86
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
X-List-Received-Date: Wed, 02 Apr 2014 04:46:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 1, 2014 at 3:00 AM, Stefan Stanacar
<stefanx.stanacar@intel.com> wrote:
> Seems wrong that qemux86 has this enabled and qemux86-64 doesn't.
> Also this will allow people to use kvm with -cpu=host.
> Right now, runqemu qemux86-64 kvm uses -cpu=kvm64 because without this
> feature you can't use cpu=host on newer host kernels (>= 3.8).
>
> This basically reverts poky e6149ec6c4c14d3a939022cdc29ac94dced836dd /
> oe-core 64749308fadabb4aa7c39f360c6395827bc5eb3a
> The reason of that commit (which is more than a year old) was that on
> the AB running old kernels (2.6.37) we would see occasional shutdown failures.
> (but if memory serves me right the fix might have been just a coincidence).
>
> I've tested this change with by:
>   - run tests on runqemu qemux86-64 (without kvm) (300 seconds)
>   - run tests on runqemu qemux86-64 kvm (which uses by default cpu=kvm64) - (tests
> took 20 seconds)
>   - run tests on runqemu qemux86-64 kvm with cpu=host - (tests took 18 seconds)
>
> [ YOCTO #5956 ]

thanks for doing it. in quick test it seems to boot in the virtual box
case where I was seeing the same problems.

>
> Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_3.14.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> index d5202cd..46c4260 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> @@ -33,5 +33,5 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>  KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> --
> 1.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

