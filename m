Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-10.prod.phx3.secureserver.net
	(p3plsmtpa09-10.prod.phx3.secureserver.net [173.201.193.239])
	by mail.openembedded.org (Postfix) with ESMTP id 9929C71F2C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 20:15:12 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-10.prod.phx3.secureserver.net with 
	id 9wFB1p00M0BVjqb01wFBu9; Fri, 31 Oct 2014 13:15:13 -0700
Message-ID: <5453EDCF.6000808@pabigot.com>
Date: Fri, 31 Oct 2014 15:15:11 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: maciej.borzecki@open-rnd.pl, Tom Zanussi <tom.zanussi@intel.com>
References: <5453AC6C.5090206@pabigot.com>	
	<1414774022.3268.18.camel@empanada.home.network>
	<1414785345.7533.1.camel@open-rnd.pl>
In-Reply-To: <1414785345.7533.1.camel@open-rnd.pl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: issues encountered using wic
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
X-List-Received-Date: Fri, 31 Oct 2014 20:15:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/31/2014 02:55 PM, Maciek Borzecki wrote:
> On pią, 2014-10-31 at 11:47 -0500, Tom Zanussi wrote:
>> Hi,
>>
>> On Fri, 2014-10-31 at 10:36 -0500, Peter A. Bigot wrote:
>>> I've started to transition to wic (in master) in hopes it reduces the
>>> amount of host passwd contamination resulting from creating SD images by
>>> untarring the rootfs onto an SD card.  I've run into the following
>>> initial issues:
>>>
>>> First, wic requires a populated rootfs, by default in the recipe build
>>> directory.  Two issues: (1) this normally removed by rm_work, and (2)
>>> bitbake foo-image will not populate that directory if the required
>>> artifacts are available from sstate-cache (as happens when you then add
>>> foo-image to RM_WORK_EXCLUDE and reinvoke bitbake).
>>>
>>> Both could be solved by getting the rootfs contents from an archive
>>> created by the image instead of assuming it's unpacked somewhere
>>> already.  Requiring IMAGE_FSTYPES to contain "tar.bz2" for wic doesn't
>>> seem burdensome.  Taking this path also opens up the possibility for wic
>>> plug-ins to customize configuration files (such as host keys) in the
>>> image rootfs without contaminating a shared resource used by other
>>> invocations of wic.
>>>
>>> If this seems like a reasonable approach and the wic maintainers would
>>> like assistance with it, I'd be happy to put together a patch.
>>>
>> It sounds like a nice enhancement, though I'm not sure about the exact
>> implementation.  As it happens, someone just today asked me to review
>> some changes to wic that include a 'rootfs building functionality' that
>> might overlap with this.  Let me take a look at that and get back to
>> once I've taken a look.

That might be exactly what I want; I'll put wic adoption on hold until 
it's available to test.

>>
>>> Second, wic requires IMAGE_BOOT_FILES to be provided (normally in
>>> machine.conf, as with meta-yocto-bsp's beaglebone.conf).  I normally use
>>> the beaglebone.conf from meta-ti, and found copying the IMAGE_BOOT_FILES
>>> setting to that BSP layer didn't work because the reference to
>>> ${UBOOT_SUFFIX} remained empty. meta-yocto-bsp's beaglebone.conf defines
>>> and uses UBOOT_SUFFIX="img", but this is fragile as the real
>>> UBOOT_SUFFIX comes from u-boot.inc (where the default is "bin") or some
>>> other override.
>>>
>>> Is there a way to resolve the potential inconsistency other than
>>> hard-coding a specific suffix in machine.conf?  "include u-boot.inc" in
>>> the machine.conf seems like a bad idea.
>>>
>> I don't see any way around this, unless you added wildcarding.  Adding
>> Maciej, who added this capability for uboot and might have some ideas...
> The value of IMAGE_BOOT_FILES is boot process specific and I would
> expect a machine definition to specify a sane value for particular
> platform. In case of meta-yocto-bsp it is set to "${KERNEL_IMAGETYPE}
> u-boot.${UBOOT_SUFFIX}" so that you can build a useable image out of the
> box with officially supported board (and BBB happens to be one).

Agreed; on further reflection the lack of UBOOT_* settings in meta-ti's 
beaglebone machine definition (instead inheriting setting the defaults 
from their u-boot recipe) is a problem that should be fixed in meta-ti.

Peter

> For instance, for meta-raspberrypi I have set the value IMAGE_BOOT_FILES
> so that ${DEPLOY_DIR_IMAGE}/bcm2835-bootfiles/* are picked up when
> generating the image (and because of laziness I added globbing,
> hopefully I'll clean that up soon enough and post patches). Still I'd be
> wary of picking up u-boot binary through globbing.
>
> Since we're already discussing wic, the things that I have on my
> TODO-properly list are adding a manual --start offset for partition (had
> to use --align to make the partition start at 4MB offset for rspi, not
> really a functional problem, just looks a bit weird in *.wks) and
> enhancing 'bootloader' stanza handling to support u-boot and rspi boot
> (unless rspi moves to u-boot finally).
>
> --
> Maciej Borzęcki
> Senior Software Developer at Open-RnD Sp. z o.o., Poland
> www.open-rnd.pl
> mobile: +48 889 117 365, fax: +48 42 657 9079
>
> Niniejsza wiadomość wraz z załącznikami może zawierać chronione prawem
> lub poufne informacje i została wysłana wyłącznie do wiadomości i
> użytku osób, do których została zaadresowana. Jeśli wiadomość została
> otrzymana przypadkowo zabrania się jej kopiowania lub rozsyłania do
> osób trzecich. W takim przypadku uprasza się o natychmiastowe
> zniszczenie wiadomości oraz poinformowanie nadawcy o zaistniałej
> sytuacji za pomocą wiadomości zwrotnej. Dziękujemy.
>
> This message, including any attachments hereto, may contain privileged
> or confidential information and is sent solely for the attention and
> use of the intended addressee(s). If you are not an intended addressee,
> you may neither use this message nor copy or deliver it to anyone. In
> such case, you should immediately destroy this message and kindly notify
> the sender by reply email. Thank you.
>
>
>


