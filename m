Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web09.7583.1603355776896391490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 01:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4CH10s6tFVz5tlS;
	Thu, 22 Oct 2020 10:36:13 +0200 (CEST)
Date: Thu, 22 Oct 2020 10:36:12 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Fix install path since S doesnt have a trailing slash
Message-ID: <20201022083612.kourjuijorkmw26a@qschulz>
References: <20201022083222.1506844-1-alejandro@enedino.org>
MIME-Version: 1.0
In-Reply-To: <20201022083222.1506844-1-alejandro@enedino.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alejandro,

On Thu, Oct 22, 2020 at 02:32:22AM -0600, Alejandro Hernandez Samaniego wrote:
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  .../baremetal-examples/baremetal-helloworld_git.bb            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> index 7a580bd885..946a12d0a5 100644
> --- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> @@ -40,8 +40,8 @@ EXTRA_OEMAKE_append = " QEMUARCH=${BAREMETAL_QEMUARCH} V=1"
>  # Install binaries on the proper location for baremetal-image to fetch and deploy
>  do_install(){
>      install -d ${D}/${base_libdir}/firmware
> -    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> -    install -m 755 ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
> +    install -m 755 ${B}/build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> +    install -m 755 ${B}/build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf

I'm almost certain do_install is being run under the ${B} directory by
default:
https://docs.yoctoproject.org/ref-manual/ref-tasks.html#do-install

So I'd actually just remove ${B} (or ${B}/) from the path?

Quentin
