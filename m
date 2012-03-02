Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3TF1-0007Cb-GE for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 15:13:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22E5E3q001191;
	Fri, 2 Mar 2012 14:05:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01088-01; Fri,  2 Mar 2012 14:05:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22E55wC001167
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 2 Mar 2012 14:05:06 GMT
Message-ID: <1330697109.309.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 14:05:09 +0000
In-Reply-To: <CAEsOVNfTjTNi_nBy=Fd98JURMMLAwvcpQs=zbxihMKeRgn_ehA@mail.gmail.com>
References: <CAEsOVNfTjTNi_nBy=Fd98JURMMLAwvcpQs=zbxihMKeRgn_ehA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Yoder Stuart-B08248 <B08248@freescale.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: qemu.inc do_install question / qemu-targets.inc
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
X-List-Received-Date: Fri, 02 Mar 2012 14:13:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-28 at 21:40 +0000, McClintock Matthew-B29882 wrote:
> All,
> 
> I'm wanting to remove this:
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index 58049b9..3be46f2 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -49,13 +49,6 @@ do_configure() {
>      test ! -e ${S}/target-i386/beginend_funcs.sh || chmod a+x
> ${S}/target-i386/beginend_funcs.s
>  }
> 
> -do_install () {
> -       export STRIP="true"
> -       autotools_do_install
> -       install -d ${D}${datadir}/qemu
> -       install -m 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
> -}
> -
> 
> Can anyone comment why it's there? Can we move it up a level to a
> specific recipe? We don't want to include this powerpc_rom.bin..
> should we just fork our qemu recipe instead?

From what I remember our qemuppc image didn't boot without that file
being present. Whether that is still the case I don't know.

I care that qemuppc continues to boot correctly, not about the location
the file is installed.

> Also, can we make this change? I don't think we want ppc-linux-user on
> our ppc-softmmu target.
> 
> diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc
> b/meta/recipes-devtools/qemu/qemu-targe
> index 550a7fe..8423aa1 100644
> --- a/meta/recipes-devtools/qemu/qemu-targets.inc
> +++ b/meta/recipes-devtools/qemu/qemu-targets.inc
> @@ -6,7 +6,7 @@ def get_qemu_target_list(d):
>      import bb
>      archs = bb.data.getVar('QEMU_TARGETS', d, True).split()
>      targets = ""
> -    for arch in ['mips64', 'mips64el', 'ppcemb']:
> +    for arch in ['mips64', 'mips64el', 'ppcemb', 'ppc']:
>          if arch in archs:
>              targets += arch + "-softmmu,"
>             archs.remove(arch)

I've no hard feelings on that one.

Cheers,

Richard



