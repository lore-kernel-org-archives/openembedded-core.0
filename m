Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE1BD7307F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 07:22:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8K7MPtJ017410
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Sep 2018 00:22:25 -0700 (PDT)
Received: from [0.0.0.0] (128.224.56.115) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 20 Sep 2018 00:22:24 -0700
To: <richard.purdie@linuxfoundation.org>, Hongxu Jia
	<hongxu.jia@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
	<3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <417d48ba-fb59-266c-1293-e41919e6efb5@windriver.com>
Date: Thu, 20 Sep 2018 03:22:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Thu, 20 Sep 2018 07:22:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/20/2018 12:54 AM, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2018-09-20 at 09:45 +0800, Hongxu Jia wrote:
>> I will fix it as my top priority today.
>>
>> Reproduce steps:
>>
>> - Build core-image-sato-sdk on qemuarm64
>> - Run qemu
>> - Log over ssh (openssh) failed
>>
> 
> I did have a little bit of a look at this. It seems to hang during key
> generation before starting the server during boot.
> 
> I had a suspicion that the problem could be a lack of entropy. We're
> supposed to have the virtio entropy generation being passed through
> from the host to avoid problems with entropy starvation but I'm not
> sure its running for arm64.

We ran into this with OVS in meta-virt as well. The new ssl + the
4.16+ kernel jams initializing crypto. The solution there was to
turn off ssl by default.

Author: Jason Wessel <jason.wessel@windriver.com>
Date:   Wed Sep 5 15:44:45 2018 -0700

     openvswitch: Turn off ssl integration by default

     The openssl library is an optional component for the openvswitch.  The
     problem with it enabled by default is that it will consume system
     entropy to try to initialize the openssl library even though we are not
     using it by default.  With the 4.16 kernel and up there is not always
     enough entropy available at the early boot time which can cause a
     lengthy stall, while waiting to initialize the openvswitch.

     If ssl is needed, it can of course be turned on with the package
     config option "ssl".

     Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>


> 
> I noticed the .config shows CONFIG_CRYPTO_DEV_VIRTIO=m but setting that
> to =y didn't help. The virtio rng connects via pci bus iirc and
> CONFIG_PCI isn't set so I'm now looking into that...

This was the 2nd solution, but it did work in our cases without hang.

Which is to add: -device virtio-rng-pci to the qemu command line.
But yes, you need PCI for that to work.


> 
> To update, adding this config to the kernel:
> 
> CONFIG_CRYPTO_DEV_VIRTIO=y
> CONFIG_PCI=y
> CONFIG_PCI_HOST_GENERIC=y
> 
> appears to solve the problem and lets my simple tests work. I'll have
> to run some better tests but I think this is the problem, lack pci
> support in the kernel meaning the rng virtio passthrough doesn't work.
> 

Yes. That should be it. If someone sends me a config fragment tweak,
I'll get it into my queue that should come out in the next day or so.

Bruce

> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
> 


