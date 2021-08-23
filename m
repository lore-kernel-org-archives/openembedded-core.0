Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web09.23816.1629725403660117854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=fUkm6/ey;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mIA1Z-0007q8-Ha; Mon, 23 Aug 2021 15:30:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MgGklh7KvGD33zOwWt4kZvbhlHnq8qs4Ksb8SQvOcIQ=; b=fUkm6/eyuIQRPoze2PcaA8Apm/
	jrVNpwqoTUzSg1UgAdou+BRePnIDvxMhdCj4Nd6WaN0oZ1kCssP+wh91i4Dp5V+vKd8HLD+FhQ7UI
	U+v6p1TtUeq/dDW6o94ExsLL6iUUncM38gRz9jnfSrWySo+oQvTsm7AWM4T+GaGuIqJKh/+w75+tq
	UK++kPhEsXWOgpAC6L421f8PeIkgUUX7HxE6qJ0RHOgxdKNWcsqPqNak+kChKHYGs1GMnpdZzJmsW
	kk/ANKN/5i4DAXdT4lPIErocwmN16IUc9YTVVMc4rhLBmKxVTVMWf5igLVMgZUJDN25hV0BXeXbKG
	97TEuWBw==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mIA1V-0003gO-5j; Mon, 23 Aug 2021 15:29:59 +0200
Subject: Re: [OE-core] [PATCH 5/6] kernel.bbclass: Use full versions for inter-package dependencies
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, zboszor@gmail.com
References: <20210823122323.97400-1-zboszor@pr.hu>
 <20210823122323.97400-6-zboszor@pr.hu>
 <CADkTA4NwEYtyROR_DDC=mK=7UCRR7eYeLi=KTEHBuc8-z9u7FA@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <9c84e9ba-6661-c23f-eca0-06845f7a6d21@pr.hu>
Date: Mon, 23 Aug 2021 15:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NwEYtyROR_DDC=mK=7UCRR7eYeLi=KTEHBuc8-z9u7FA@mail.gmail.com>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: dab294d4183cf9e03e4524a81d6e641d
X-Spam-Tracer: backend.mail.pr.hu -1.9 20210823132959Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 08. 23. 15:03 keltezéssel, Bruce Ashfield írta:
> On Mon, Aug 23, 2021 at 8:23 AM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>>
>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>
>> Some Yocto users do use package repositories and sometimes the PR
>> value is forgotten. Use full versions for inter-package dependencies
>> for the kernel subpackages.
> 
> Can you expand this commit message ?

I will send a new version with the expanded message.

> What is the observable problem
> with the full versions not being in the rdpends ?

Currently the kernel creates such subpackages:

kernel
kernel-x.y.z
kernel-image-x.y.z
kernel-image-bzimage-x.y.z
kernel-modules-x.y.z

and in the split modules case, a lot of

kernel-module-*-x.y.z

RDEPENDS currently only references the package names.

The issue I observe is this: I have enabled kernel module signing
but I don't provide a key, so the kernel will generate one at
every rebuild.

You get the idea what problem this can make if there's a
rebuild:

x.y.z-r0.0 -> x.y.z-r1.0 (in which case the PR value was duly changed)
or
x.y.z-r0.0 -> x.y.z-r0.1 (where not)

It's actually indifferent, but the same issue occurs if
only the kernel-image-bzimage is upgraded: the modules either
won't work or taint the kernel.

This scenario is currently valid in the package manager because
of the versionless RDEPENDS.

> 
> I've run many different package feeds with different kernels and
> modules, and haven't run into anything on this front, in my experience
> the extended version in the package depends/provides causes issues
> with some package managers .. so we'd need the testing for this
> documented/provided so we could ensure that there are no hidden
> issues.
> 
> Bruce
> 
> 
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/classes/kernel.bbclass | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 6dc5387a9b..9ec7daa17a 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -91,17 +91,18 @@ python __anonymous () {
>>       kname = d.getVar('KERNEL_PACKAGE_NAME') or "kernel"
>>       imagedest = d.getVar('KERNEL_IMAGEDEST')
>>
>> +    fullver = d.getVar('EXTENDPKGV')
>>       for type in types.split():
>>           if bb.data.inherits_class('nopackages', d):
>>               continue
>>           typelower = type.lower()
>>           d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
>>           d.setVar('FILES:' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
>> -        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s' % (kname, typelower))
>> +        d.appendVar('RDEPENDS:%s-image' % kname, ' %s-image-%s (= %s)' % (kname, typelower, fullver))
>>           splitmods = d.getVar("KERNEL_SPLIT_MODULES")
>>           if splitmods != '1':
>> -            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules' % kname)
>> -            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
>> +            d.appendVar('RDEPENDS:%s-image' % kname, ' %s-modules (= %s)' % (kname, fullver))
>> +            d.appendVar('RDEPENDS:%s-image-%s' % (kname, typelower), ' %s-modules-${KERNEL_VERSION_PKG_NAME} (= %s)' % (kname, fullver))
>>               d.setVar('PKG:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
>>               d.appendVar('RPROVIDES:%s-modules' % kname, '%s-modules-${KERNEL_VERSION_PKG_NAME}' % kname)
>>
>> @@ -628,12 +629,12 @@ FILES:${KERNEL_PACKAGE_NAME}-image = ""
>>   FILES:${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>>   FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>>   FILES:${KERNEL_PACKAGE_NAME}-modules = ""
>> -RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base"
>> +RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
>>   # Allow machines to override this dependency if kernel image files are
>>   # not wanted in images as standard
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image (= ${EXTENDPKGV})"
>>   PKG:${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux', '', d)}"
>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (= ${EXTENDPKGV})', '', d)}"
>>   PKG:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
>>   RPROVIDES:${KERNEL_PACKAGE_NAME}-base += "${KERNEL_PACKAGE_NAME}-${KERNEL_VERSION}"
>>   ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
>> --
>> 2.31.1
>>
>>
>> 
>>
> 
> 

