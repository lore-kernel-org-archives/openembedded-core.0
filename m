Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UZkey-0004WT-Nf
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 18:22:37 +0200
Received: by mail-pb0-f54.google.com with SMTP id rr4so501562pbb.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 09:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=6K2X/RTw898SN6eGzvStDJI4PYQy30z3Wh9147ygfBs=;
	b=QguQ3m/hR/wveN9PDa9fv5V7MfRMNmzf5Ep8k+6RQ+aSb1OyEH8JcoQtfpLZmGpUPq
	LQAqkF5ORfcljP+Nd6oVd7VfNSJLJSdb5oUcsNmQq9TWyXvxgj/3dYfGC+We+w7M40bX
	Ul7ytM2QJ3/4YV4irA/aDpqWWlyrb2V2vd+seRmFcNf0HPjAbfMWMR/g8uOsAZQXA6IP
	9KLRkLAU54IPI2Tm2jv0gcBuRiOOIJYPaPmbhBWIhRkK2bqhLoCtei/opPPPR27XH1Q5
	1ykTooqgQZW8Zi+wgb6Oo3DEwkJun3Lk0O2id81kgZKixVjyeyuiPliWi84NMoutsJVn
	44SA==
MIME-Version: 1.0
X-Received: by 10.68.163.225 with SMTP id yl1mr3234752pbb.0.1367942675026;
	Tue, 07 May 2013 09:04:35 -0700 (PDT)
Received: by 10.68.134.234 with HTTP; Tue, 7 May 2013 09:04:34 -0700 (PDT)
In-Reply-To: <1367941787-8508-1-git-send-email-ross.burton@intel.com>
References: <1367941787-8508-1-git-send-email-ross.burton@intel.com>
Date: Tue, 7 May 2013 12:04:34 -0400
Message-ID: <CADkTA4Oq_2OuhPVjBuowpkyoLMrwnPZyKmGxAwTLABQo7wzfiw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemux86: disable paravirt guest, causes test failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 16:22:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 7, 2013 at 11:49 AM, Ross Burton <ross.burton@intel.com> wrote:
> The shutdown sanity test that we previously saw on qemux86-64 in 2.6.37 have
> started to re-appear reproducably on qemux86 in 3.4 in the Danny series.  Until
> this can be root-caused and fixed in the kernel, disable paravirtualisation
> across all kernels and all qemu machines.

Make sure to cc me on linux-yocto patches, I noticed this by chance.

>
> [ YOCTO #4196 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb    |    1 -
>  meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    1 -
>  meta/recipes-kernel/linux/linux-yocto_3.8.bb    |    2 +-
>  4 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index fdea085..fcf37cc 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -44,5 +44,4 @@ COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
>  KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> -KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"

I'd rather keep this on for the -dev kernel, it is development for a reason and
we should leave this on as a leading edge feature.

Bruce

>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
> index 980229c..38e35db 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
> @@ -25,6 +25,6 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
>  KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index b81b9ac..18d665a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -26,5 +26,4 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>  KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> -KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> index 4bf6bf4..75e2dbb 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> @@ -25,6 +25,6 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>  KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


