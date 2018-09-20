Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDE5747E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 16:25:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8KGPhm7024312
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Sep 2018 09:25:43 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 20 Sep 2018 09:25:42 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
	<3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <f0425061-1d49-84f7-33f3-a3f2b3504c43@windriver.com>
Date: Fri, 21 Sep 2018 00:25:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Koen Kooi <koen.kooi@linaro.org>
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
X-List-Received-Date: Thu, 20 Sep 2018 16:25:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月20日 12:54, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2018-09-20 at 09:45 +0800, Hongxu Jia wrote:
>> I will fix it as my top priority today.
>>
>> Reproduce steps:
>>
>> - Build core-image-sato-sdk on qemuarm64
>> - Run qemu
>> - Log over ssh (openssh) failed
>>
> I did have a little bit of a look at this. It seems to hang during key
> generation before starting the server during boot.
>
> I had a suspicion that the problem could be a lack of entropy. We're
> supposed to have the virtio entropy generation being passed through
> from the host to avoid problems with entropy starvation but I'm not
> sure its running for arm64.
>
> I noticed the .config shows CONFIG_CRYPTO_DEV_VIRTIO=m but setting that
> to =y didn't help. The virtio rng connects via pci bus iirc and
> CONFIG_PCI isn't set so I'm now looking into that...
>
> To update, adding this config to the kernel:
>
> CONFIG_CRYPTO_DEV_VIRTIO=y
> CONFIG_PCI=y
> CONFIG_PCI_HOST_GENERIC=y
Hi RP,

Without modify config, just revert two commits on kernel source could 
fix the issue
(sshd start successfully)


1. Revert "random: fix crng_ready() test"

This reverts commit 43838a23a05fbd13e47d750d3dfd77001536dd33


2. Revert "random: use a different mixing algorithm for 
add_device_randomness()"

This reverts commit dc12baacb95f205948f64dc936a47d89ee110117

But I am not sure the affect of the modification to other arch, and the root
cause the above two commits introduced

Still requiring more digging

//Hongxu

> appears to solve the problem and lets my simple tests work. I'll have
> to run some better tests but I think this is the problem, lack pci
> support in the kernel meaning the rng virtio passthrough doesn't work.
>
> Cheers,
>
> Richard
>
>
>
>
>
>


