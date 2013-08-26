Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8D46A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 04:24:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7Q4Ovw1002468
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Aug 2013 00:24:58 -0400 (EDT)
Received: from bruce-ashfields-macbook.local (128.224.21.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 25 Aug 2013 21:24:57 -0700
Message-ID: <521AD896.3000503@windriver.com>
Date: Mon, 26 Aug 2013 00:24:54 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Elvis Dowson <elvis.dowson@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
In-Reply-To: <7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Mon, 26 Aug 2013 04:25:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-25 11:58 PM, Elvis Dowson wrote:
> Hi Bruce,
>
> On Aug 26, 2013, at 5:03 AM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>
>> On 13-08-25 3:09 PM, Elvis Dowson wrote:
>>> I noticed that you've committed the changes for qemuarma9 KMACHINE configuration to the linux-yocto kernel.
>>>
>>> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.8/tree/meta/cfg/kernel-cache/bsp?h=meta
>>>
>>> I adapted the qemuarm.conf configuration and booted it up, but nothing shows up in the QEMU window, I just get a black screen.
>>>
>>> Has qemu with the qemuarma9 configuration been successfully built and tested before?
>>
>> It has been, but not with a machine definition that is part of oe-core
>> or Yocto.
>>
>> It was contributed as the output from some cortexA9 testing, and I've
>> been carrying the kernel parts ever since.
>
> Can you share the qemucortexa9.conf machine definition please?

It's nearly identical to the one you posted:


require conf/machine/include/qemu.inc
require conf/machine/include/tune-cortexa9.inc


KERNEL_IMAGETYPE = "uImage"

SERIAL_CONSOLE = "115200 ttyAMA0"


>
>>
>>>
>>> This is how my qemuarm.conf looks like, locally at the moment:
>>>
>>> #@TYPE: Machine
>>> #@NAME: qemuarmhf
>>> #@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9 hard float.
>>>
>>> # Specify the default tune.
>>> DEFAULTTUNE = "armv7a-neon"
>>>
>>> require conf/machine/include/qemu.inc
>>> require conf/machine/include/tune-cortexa9.inc
>>>
>>> # Specify the machine name used by the kernel.
>>> KMACHINE_qemuarm = "qemuarma9"
>>
>> This is a default, so you don't need to set it.
>
>
> The default for qemuarm, as documented in
>
> http://www.yoctoproject.org/docs/1.5/ref-manual/ref-manual.html#var-KFEATURE_DESCRIPTION
>
> is arm_versatile926ejs.
>
> So I had to modify it to force it to use qemuarma9.

Hah, when I read this I was thinking that you were talking about your new
machine name, and not clobbering qemuarm. So in this case, yes, that
would have been required.

>
>>
>>>
>>> # Specify the kernel image type.
>>> KERNEL_IMAGETYPE = "zImage"
>>
>> I recall booting it with a uImage, but maybe my memory is failing.
>>
>>>
>>> # Specify the serial console parameters.
>>> SERIAL_CONSOLE = "115200 ttyAMA0"
>>
>> All of the above looks reasonably sane, but it's more about how you
>> launch qemu than the kernel build that is probably resulting in your
>> issues. What machine subtype did you use ?
>
> I used -M versatilepb. I also passed the -cpu cortex-a9 parameter to qemu.

I launch with these:

  machine: -M vexpress-a9
  memory: 128
  console: ttyAMA0,115200"
  kernel options: oprofile.timer=1"

>
> I just got a blank screen.
>
> FYI, I was able to get the qemuzynq machine working with the meta-xilinx
> layer, and in that, there was also a blank screen, but the QEMU output
> and login prompt came on the console from where the rumqemu qemuzynq
> command was run. A different type of behaviour from that of qemuarm running
> arm_versatile926ejs.
>
> The qemuzynq machine uses the linux-xlnx kernel.

I've booted the same machine/qemu on kernels ranging from 3.4 to
3.10 with a few patches. :)

>
> I'd like to get a generic qemuarma9 machine configuration working with
> linux-yocto, if possible, and add it to the standard list of qemu targets.

The kernel support has been in place for some time, the problem is really
with the qemu system emulation. The vexpress-a9 doesn't support all of the
boot methods that other qemu models do, in particular I only NFS boot it
versus net boot, etc.

When I worked on this before (2 years ago now), I didn't want to just
switch the cpu, but was looking for a platform like the vexpress.

Perhaps the zynq machine definition is the right way to go, since nearly
enough support is mainline (in both qemu and the kernel), and we can
motivate the rest into their respective upstreams.

If someone can come up the right conf files, and machine definition, I
can pretty easily support it in linux-yocto.

Cheers,

Bruce

>
> Best regards,
>
> Elvis Dowson
>


