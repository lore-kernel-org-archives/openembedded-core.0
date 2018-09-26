Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6D95879659
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 09:34:32 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id C2DC85C1F77;
	Wed, 26 Sep 2018 11:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1537954472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=J8/E+SRS1eh0yeZl4wiz+m3QCQPnlY61ezVjQf9dl1s=;
	b=fNk1+QXxhK2gZm4EEcFpdCV98/uHuWpuIwn7IkfwcGeYM/odnl/PezP4PUWlzto6imWDKM
	9zJmNyI5XA1q9IXsX+q6KH5uZ+lZChM6pQFUu5aQF+GMQIjE3cUqkoaS8ymE8a0MSLF2y+
	AYOan/Bn8DUY3ws3wBiijWCyhT9kBbs=
MIME-Version: 1.0
Date: Wed, 26 Sep 2018 11:34:31 +0200
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
In-Reply-To: <ae881b799c12d2514345825d8fa5297f@agner.ch>
References: <ae881b799c12d2514345825d8fa5297f@agner.ch>
Message-ID: <abbffc6e7fa60468423b2cf1ec39f311@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.4
Cc: Brandon Shibley <brandon.shibley@toradex.com>, samuel.bissig@toradex.com,
	ricardo@foundries.io
Subject: Re: Build failure with parallel build and opkg
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
X-List-Received-Date: Wed, 26 Sep 2018 09:34:32 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On 12.09.2018 00:49, Stefan Agner wrote:
> Hi,
> 
> We experience build errors as follows every now and then:
> 
> ...
> ERROR: full-container-image-0.1-r0 do_populate_sdk: Unable to install
> packages. Command
> '/workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/recipe-sysroot-native/usr/bin/opkg
> --volatile-cache -f
> /workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/opkg.conf
> -t
> /workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/temp/ipktemp/
> -o
> /workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/sdk/image/usr/local/tordy-x86_64/sysroots/armv7at2hf-neon-lmp-linux-gnueabi
>  --force_postinstall --prefer-arch-to-version   install 96boards-tools
> aktualizr aktualizr-host-tools aktualizr-runtime-prov base-passwd
> coreutils cpufrequtils docker gptfdisk haveged hostapd htop iptables
> kernel-modules ldd less lmp-device-register networkmanager
> networkmanager-nmtui openssh-sftp-server os-release ostree
> packagegroup-base-extended packagegroup-core-boot
> packagegroup-core-full-cmdline-extended
> packagegroup-core-full-cmdline-multiuser
> packagegroup-core-full-cmdline-utils packagegroup-core-ssh-openssh
> packagegroup-core-standalone-sdk-target pciutils python3-compression
> python3-distutils python3-docker python3-docker-compose python3-json
> python3-netclient python3-pkgutil python3-shell python3-unixadmin rsync
> run-postinsts shadow sshfs-fuse strace sudo target-sdk-provides-dummy
> tcpdump vim-tiny' returned 255:
> ...
> Downloading
> file:/workdir/oe/tmp/deploy/ipk/armv7at2hf-neon/nss_3.38-r0_armv7at2hf-neon.ipk.
> Removing corrupt package file
> /workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/sdk/image/usr/local/tordy-x86_64/sysroots/armv7at2hf-neon-lmp-linux-gnueabi//var/cache/opkg/volatile/8e392ecd3611e24a6a49a8b22ad6e1ff_nss_3.38-r0_armv7at2hf-neon.ipk.
> ...
> Installing pam-plugin-faildelay (1.3.0) on root
> Downloading
> file:/workdir/oe/tmp/deploy/ipk/armv7at2hf-neon/pam-plugin-faildelay_1.3.0-r5_armv7at2hf-neon.ipk.
> Removing corrupt package file
> /workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/sdk/image/usr/local/tordy-x86_64/sysroots/armv7at2hf-neon-lmp-linux-gnueabi//var/cache/opkg/volatile/0df6a8bc594a581f6ca3bcfa55e860e2_pam-plugin-faildelay_1.3.0-r5_armv7at2hf-neon.ipk.
> ...
> Collected errors:
>  * opkg_install_pkg: Failed to download nss. Perhaps you need to run
> 'opkg update'?
>  * opkg_install_pkg: Failed to download pam-plugin-faildelay. Perhaps
> you need to run 'opkg update'?
> .
> ...
> 
> We build our own OpenEmbedded core based distribution currently based on
> a recent master state. But we have seen this on and off back since
> rocko.
> 
> We build the image using Jenkins with multiple builders running in
> parallel and sharing sstate. I think the fact that we run similar images
> in parallel is the culprit: Looking closer at the failed build directory
> reveals that the tmp-glibc/deploy/ipk/armv7at2hf-neon/Packages has a
> different MD5Sum than the actual package. We start with two builders
> simultaneously building an image, and it seems that they build the same
> package around the same time. I assume that the two builders somehow
> have a race between when the package get assembled and when the Package
> index gets built...
> 
> We start with a clean sstate, and this typically only happens for the
> very first builds, when the sstate is cold.

We discussed the issue at Linaro Connect a bit.

To recap, we do build in two steps:

1. bitbake full-container-image
2. bitbake -c populate_sdk full-container-image

The issue always happens in the second step.

We also see that in the second step, the do_package_write_ipk_setscene
task for every recipe is executed.

The current assumption is

I tried to reproduce by building a recipe using openembedded-core master
only in two build directories with shared sstate manually:

1. build1 $ bitbake eudev
2. build2 $ bitbake -c cleansstate eudev
3. build2 $ bitbake eudev
4. build1 $ bitbake core-image-minimal

This sequence seems not to have triggered a
do_package_write_ipk_setscene for eudev.

I then tried
5. build1 $ bitbake -c populate_sdk core-image-minimal

Which did trigger a do_package_write_ipk_setscene. However, the issue
did not appear...

I even tried to rebuild and replace the file manually, and run bitbake
-c populate_sdk -f core-image-minimal, but it just seems not to appear.

Last time I have seen it was with oe-core
f6634581fa0a81c4d68dc9179a755ad7b9d99357, I will revert to this version
again to see whether that helps reproducing the issue.

--
Stefan


> 
> I guess there is some race/asynchronous operation going on around
> building index/getting package from sstate/pushing package to sstate.
> 
> It seems an issue others have seen in the past too:
> https://www.yoctoproject.org/irc/%23yocto.2018-07-05.log.html#t2018-07-05T10:07:25
> 
> Any idea?
> 
> --
> Stefan

