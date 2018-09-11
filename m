Return-Path: <stefan@agner.ch>
X-Greylist: delayed 315 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Sep 2018 22:55:08 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 79B0178DFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 22:55:08 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 95EAA5C1877;
	Wed, 12 Sep 2018 00:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1536706193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=xLgn5QtLFLxrtvtjM1G8Xi6lNHDunJ4OVMPLvxCW8Sc=;
	b=e8r8eVv8ki9UipLSaESnRzNSUmhEPj23HTSbEs0c172XedyNEfKwZblqVLF4t+nOsIQbiE
	Gz75n4JUmkK2A9cVHBJ5mM1qgD9S5cF8dR4kQ4OMuyuRhb3VhSiWXdl3qoGMv2zWK6xqmf
	CK1DYbIoVCzs4+XYp62X5N4toljGkTo=
MIME-Version: 1.0
Date: Tue, 11 Sep 2018 15:49:53 -0700
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Message-ID: <ae881b799c12d2514345825d8fa5297f@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.4
Cc: Brandon Shibley <brandon.shibley@toradex.com>, samuel.bissig@toradex.com,
	ricardo@foundries.io
Subject: Build failure with parallel build and opkg
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
X-List-Received-Date: Tue, 11 Sep 2018 22:55:09 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

We experience build errors as follows every now and then:

...
ERROR: full-container-image-0.1-r0 do_populate_sdk: Unable to install
packages. Command
'/workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/recipe-sysroot-native/usr/bin/opkg
--volatile-cache -f
/workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/opkg.conf
-t
/workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/temp/ipktemp/
-o
/workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/sdk/image/usr/local/tordy-x86_64/sysroots/armv7at2hf-neon-lmp-linux-gnueabi
 --force_postinstall --prefer-arch-to-version   install 96boards-tools
aktualizr aktualizr-host-tools aktualizr-runtime-prov base-passwd
coreutils cpufrequtils docker gptfdisk haveged hostapd htop iptables
kernel-modules ldd less lmp-device-register networkmanager
networkmanager-nmtui openssh-sftp-server os-release ostree
packagegroup-base-extended packagegroup-core-boot
packagegroup-core-full-cmdline-extended
packagegroup-core-full-cmdline-multiuser
packagegroup-core-full-cmdline-utils packagegroup-core-ssh-openssh
packagegroup-core-standalone-sdk-target pciutils python3-compression
python3-distutils python3-docker python3-docker-compose python3-json
python3-netclient python3-pkgutil python3-shell python3-unixadmin rsync
run-postinsts shadow sshfs-fuse strace sudo target-sdk-provides-dummy
tcpdump vim-tiny' returned 255:
...
Downloading
file:/workdir/oe/tmp/deploy/ipk/armv7at2hf-neon/nss_3.38-r0_armv7at2hf-neon.ipk.
Removing corrupt package file
/workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/sdk/image/usr/local/tordy-x86_64/sysroots/armv7at2hf-neon-lmp-linux-gnueabi//var/cache/opkg/volatile/8e392ecd3611e24a6a49a8b22ad6e1ff_nss_3.38-r0_armv7at2hf-neon.ipk.
...
Installing pam-plugin-faildelay (1.3.0) on root
Downloading
file:/workdir/oe/tmp/deploy/ipk/armv7at2hf-neon/pam-plugin-faildelay_1.3.0-r5_armv7at2hf-neon.ipk.
Removing corrupt package file
/workdir/oe/tmp/work/colibri_imx7-lmp-linux-gnueabi/full-container-image/0.1-r0/sdk/image/usr/local/tordy-x86_64/sysroots/armv7at2hf-neon-lmp-linux-gnueabi//var/cache/opkg/volatile/0df6a8bc594a581f6ca3bcfa55e860e2_pam-plugin-faildelay_1.3.0-r5_armv7at2hf-neon.ipk.
...
Collected errors:
 * opkg_install_pkg: Failed to download nss. Perhaps you need to run
'opkg update'?
 * opkg_install_pkg: Failed to download pam-plugin-faildelay. Perhaps
you need to run 'opkg update'?
.
...

We build our own OpenEmbedded core based distribution currently based on
a recent master state. But we have seen this on and off back since
rocko.

We build the image using Jenkins with multiple builders running in
parallel and sharing sstate. I think the fact that we run similar images
in parallel is the culprit: Looking closer at the failed build directory
reveals that the tmp-glibc/deploy/ipk/armv7at2hf-neon/Packages has a
different MD5Sum than the actual package. We start with two builders
simultaneously building an image, and it seems that they build the same
package around the same time. I assume that the two builders somehow
have a race between when the package get assembled and when the Package
index gets built...

We start with a clean sstate, and this typically only happens for the
very first builds, when the sstate is cold.

I guess there is some race/asynchronous operation going on around
building index/getting package from sstate/pushing package to sstate.

It seems an issue others have seen in the past too:
https://www.yoctoproject.org/irc/%23yocto.2018-07-05.log.html#t2018-07-05T10:07:25

Any idea?

--
Stefan



