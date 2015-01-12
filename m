Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F052A65D19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 03:16:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0C3GT8n027173
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jan 2015 19:16:29 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 11 Jan 2015 19:16:28 -0800
Message-ID: <54B33C91.5050001@windriver.com>
Date: Mon, 12 Jan 2015 11:16:33 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1402915083.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1402915083.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.226]
Subject: Re: [PATCH 0/9] initramfs and UUID support in minimal installer
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
X-List-Received-Date: Mon, 12 Jan 2015 03:16:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2014 06:46 PM, Chen Qi wrote:
> The purpose of this patchset is to add initramfs and UUID support for our minimal installer.
>
> Previously, the installed image may not be able to boot up because we use the hardcoded disk
> names.
>
> To reproduce, use the following commands.
> 1. Enable live image types and build out the minimal installer.
> 2. runqemu qemux86 iso qemuparams="-hdb target-disk"
> 3. qemu-system-i386 -hda target-disk

I recently noticed that other people on mailing list also noticed the 
problem described above.
This patchset provides one way to solve the problem.

Please help review the patches. Any comment or suggest is really welcome.

Regards,
Chen Qi

> We can see that the installed target cannot boot up correctly.
>
> This patchset fixes this problem so that when executing the above commands, the target can
> still correctly boot up as long as we configure in local.conf or some other distro config files
> to select image-initramfs-minimal as the INITRAMFS_IMAGE.
>
> //Chen Qi
>
> The following changes since commit 12bab2d828836c8926f753caff80b61dbe6390a5:
>
>    alsa-tools: Add missing pkgconfg dependency (2014-06-14 08:45:47 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/initramfs-uuid
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/busybox-syslog
>
> Chen Qi (9):
>    initramfs-image-minimal.bb: add recipe
>    initramfs-framework: fix an error in udev module
>    initramfs-framework: modify the fatal behaviour in init
>    initramfs-framework: fix an error in finish module
>    kernel.bbclass: also install the bundled kernel to STAGING_KERNEL_DIR
>    bootimg.bbclass: take initramfs into consideration
>    initramfs-live-install: rdepend on util-linux-blkid
>    busybox: enable uuid support by default
>    init-install.sh: add support for installing initramfs onto the target
>
>   meta/classes/bootimg.bbclass                       |    7 ++-
>   meta/classes/kernel.bbclass                        |    1 +
>   meta/recipes-core/busybox/busybox/defconfig        |   38 +++++++--------
>   .../recipes-core/images/initramfs-image-minimal.bb |   19 ++++++++
>   .../initrdscripts/files/init-install.sh            |   49 ++++++++++++++++----
>   .../initrdscripts/initramfs-framework/finish       |    4 +-
>   .../initrdscripts/initramfs-framework/init         |    5 +-
>   .../initrdscripts/initramfs-framework/udev         |    1 +
>   .../initrdscripts/initramfs-live-install_1.0.bb    |    2 +-
>   9 files changed, 89 insertions(+), 37 deletions(-)
>   create mode 100644 meta/recipes-core/images/initramfs-image-minimal.bb
>


