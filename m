Return-Path: <gchoc-openembedded-core@m.gmane.org>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 13 Oct 2019 10:55:03 UTC
Received: from blaine.gmane.org (195-159-176-226.customer.powertech.no
	[195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4B56D545
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 10:55:03 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.89)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1iJbIA-000132-KT for openembedded-core@lists.openembedded.org;
	Sun, 13 Oct 2019 12:40:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Ferry Toth <fntoth@gmail.com>
Date: Sun, 13 Oct 2019 12:32:21 +0200
Message-ID: <a4ef22e6-7c12-027a-b1cd-fa807fcfccb8@gmail.com>
References: <CAA=hcWSN3s3YGNrods9t2bRsAbwVf1x1fRXDofVgjtr-BK29Bg@mail.gmail.com>
	<ce141cece91f76d77a7316394ecd9c8776e4b257.camel@gmail.com>
	<CAA=hcWRXoyXKyZqh-3dXxF6rPSMe2meejtGXK7xQ8ZZB+=-0-g@mail.gmail.com>
	<CAMKF1soEbDhviZb7LR3NcL4ieFr-Qw-G+k0eKVt1iScVDR1NDw@mail.gmail.com>
	<CAA=hcWR8bR0Fs9gGYhF=2n-mUqw4LD3wiEObGtPu1Yc6LmAGkA@mail.gmail.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
In-Reply-To: <CAA=hcWR8bR0Fs9gGYhF=2n-mUqw4LD3wiEObGtPu1Yc6LmAGkA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<public-openembedded-core-ZwoEplunGu3dfDuKDZ/zN51Ccm5ICvs9@plane.gmane.org>
Subject: Re: Failed to build zImage-initramfs
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
X-List-Received-Date: Sun, 13 Oct 2019 10:55:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi

Op 13-10-19 om 11:10 schreef JH:
> On 10/13/19, Khem Raj <raj.khem@gmail.com> wrote:
> 
>>> $ vi local.conf
>>> IMAGE_ROOTFS += " core-image-minimal-initramfs"
>>>
>>
>> INITRAMFS_IMAGE should be an image name. Like core-image-minimal or
>> somesuch
> 
> Hmm, change it to my image, the name is solar-image.bb (bitbake
> solar-image), is it correct to change it in my local.conf as per your
> instruction?
> 
> $ vi local.conf
> INITRAMFS_IMAGE = "solar-image"
> 
> That caused circular dependecies. Without specifying INITRAMFS_IMAGE,
> my build was all fine, as soon as add INITRAMFS_IMAGE, it's first
> error was "Nothing RPROVIDES", I must miss things here.
> 
> ERROR: These are usually caused by circular dependencies and any
> circular dependency chains found will be printed below. Increase the
> debug level to see a list of unbuildable tasks.
> ERROR:
> Dependency loop #1 found:
>    Task /build/Ramdisk/oe-core/../meta-solar/recipes-core/images/solar-image.bb:do_image_complete
> (dependent Tasks ['solar-image.bb:do_image_cpio',
> 'solar-image.bb:do_image_wic', 'solar-image.bb:do_image',
> 'solar-image.bb:do_image_tar'])
>    Task /build/Ramdisk/oe-core/../meta-solar/recipes-kernel/linux/linux-solar_4.19.bb:do_bundle_initramfs
> (dependent Tasks ['solar-image.bb:do_image_complete',
> 'linux-solar_4.19.bb:do_install'])
>    Task /build/Ramdisk/oe-core/../meta-solar/recipes-kernel/linux/linux-solar_4.19.bb:do_deploy
> (dependent Tasks ['linux-solar_4.19.bb:do_packagedata',
> 'depmodwrapper-cross_1.0.bb:do_populate_sysroot',
> 'linux-solar_4.19.bb:do_bundle_initramfs',
> 'linux-solar_4.19.bb:do_populate_sysroot',
> 'linux-solar_4.19.bb:do_assemble_fitimage_initramfs'])
>    Task /build/Ramdisk/oe-core/../meta-solar/recipes-core/images/solar-image.bb:do_image_wic
> (dependent Tasks ['linux-solar_4.19.bb:do_deploy',
> 'u-boot-imx_2017.03.bb:do_deploy',
> 'gptfdisk_1.0.4.bb:do_populate_sysroot',
> 'dosfstools_4.1.bb:do_populate_sysroot',
> 'mtools_4.0.18.bb:do_populate_sysroot',
> 'solar-image.bb:do_rootfs_wicenv', 'solar-image.bb:do_image',
> 'parted_3.2.bb:do_populate_sysroot'])
> 
> 
> ERROR: Command execution failed: 1

As an example you might want to look at my repo, I have 2 images minimal 
and initramfs:
https://github.com/edison-fw/meta-intel-edison/tree/master/meta-intel-edison-distro/recipes-core/images


> 
> Thank you very much Khem,
> 
> Kind regards,
> 
>   - jh
> 



