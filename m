Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UccS1-000814-C0
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 16:13:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4FDslVO012582
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2013 06:54:47 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 15 May 2013 06:54:47 -0700
Message-ID: <5193939F.5000906@windriver.com>
Date: Wed, 15 May 2013 09:54:39 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Moseley, Drew" <drew_moseley@mentor.com>
References: <1368579545-16079-1-git-send-email-drew_moseley@mentor.com>
	<1368596392.25898.61.camel@ted>
	<58F22199-6AD3-4FB0-9344-43A7BD08D003@mentor.com>
In-Reply-To: <58F22199-6AD3-4FB0-9344-43A7BD08D003@mentor.com>
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Package additional modules files needed for systemtap
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
X-List-Received-Date: Wed, 15 May 2013 14:13:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-15 09:23 AM, Moseley, Drew wrote:
> On May 15, 2013, at 1:39 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2013-05-14 at 17:59 -0700, Drew Moseley wrote:
>>> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
>>> ---
>>> meta/classes/kernel.bbclass |    8 +++++---
>>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 6ba31bd..f23818e 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -108,8 +108,6 @@ kernel_do_install() {
>>> 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>>> 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>>> 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
>>> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
>>> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
>>> 		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
>>> 		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
>>> 	else
>>> @@ -259,7 +257,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>>> # kernel-image becomes kernel-image-${KERNEL_VERISON}
>>> PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
>>> FILES = ""
>>> -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>>> +FILES_kernel-image = " \
>>> +	/boot/${KERNEL_IMAGETYPE}* \
>>> +	${base_libdir}/modules/${KERNEL_VERSION}/modules.order \
>>> +	${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin \
>>> +"
>>> FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
>>> FILES_kernel-vmlinux = "/boot/vmlinux*"
>>> RDEPENDS_kernel = "kernel-base"
>>
>> Should these really be installed into every system with a kernel?
>> Doesn't systemtap also need other symbol information so these files
>> would be better off in whatever other packages systemtap also needs?
>>
>> Cheers,
>>
>> Richard
>
> Running systemtap probes without these files results in warning such as the following when trying to install packages:
>
> Installing kernel-image-3.5.7.11 (3.5.7.11+gitr4+524c7f7782e2c671cccab87aafa1ee41f7202aaf-r6) to root...
> Configuring kernel-image-3.5.7.11.
> WARNING: could not open /lib/modules/3.5.7.11/modules.order: No such file or directory
> WARNING: could not open /lib/modules/3.5.7.11/modules.builtin: No such file or directory
>
> but I suspect systemtap is not the only place where these files are used.  Below is the description of these files from the kernel Documentation/kbuild/kbuild.txt and they seem valuable on any module based system.

It isn't the only place, and there have been a few silent warnings
thrown from tools (most simply continue to work when the files are
missing). We've run into them before, in particular when creating the
depmodwrapper-cross, and I know we considered changing the packaging
at that point, but instead of making it global, we made sure that
it was packaged when needed.

I've added MarkH to see if his memory is better than mine.

The files in question aren't exactly large, and they are useful in
several different scenarios.

My open question is if they should be packaged with kernel-dev, or
with kernel-image ? kernel-dev doesn't exactly fit, but that's where
other Module* artifacts are packaged (somewhat). kernel-image can 
already be removed from the target, so adding the files there isn't
a big overhead.

The question to me is, does the complexity of not "just packaging"
the files, outweigh any size savings we'd have by not packaging
them.

Cheers,

Bruce

>
> modules.order
> --------------------------------------------------
> This file records the order in which modules appear in Makefiles. This
> is used by modprobe to deterministically resolve aliases that match
> multiple modules.
>
> modules.builtin
> --------------------------------------------------
> This file lists all modules that are built into the kernel. This is used
> by modprobe to not fail when trying to load something builtin.
>
>
> Regards,
> Drew
>



