Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB7827969B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 10:01:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8C9xcUH022972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Sep 2018 02:59:48 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 12 Sep 2018 02:59:27 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1536656353-30689-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com>
	<41457254-4083-3d7c-4e93-95b320fe7dbb@windriver.com>
	<CANNYZj9EZF5u2R55LBnBooyPpAhi7O69kVtWsvZesXZ3H7qxOQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <0a2370ce-a756-5cf8-256b-929b70367e3a@windriver.com>
Date: Wed, 12 Sep 2018 17:59:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj9EZF5u2R55LBnBooyPpAhi7O69kVtWsvZesXZ3H7qxOQ@mail.gmail.com>
Cc: lpd-cdc-core-dev <lpd-cdc-core-dev@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: build support openssl 1.1
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
X-List-Received-Date: Wed, 12 Sep 2018 10:01:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月12日 17:26, Alexander Kanavin wrote:
> 2018-09-11 17:18 GMT+02:00 Hongxu Jia <hongxu.jia@windriver.com>:
>> Here are my suggestions
>>
>> 1: Replace dependence openssl10  -> openssl, such as this fix, and drop
>> recipe openssl10 finally;
>>      1 (openssh) in oe-core, 3 (umip, ipsec-tools, mailx) in oe, 3
>> (openssl-tpm-engine,
>>      tpm-tools, trousers) in meta-secure-core
>>
>> Or 2: Unify openssl,openssl10 and libressl to provide one ssl,
>>          we could add PROVIDER = 'virtual/ssl' to above recipe, any recipe
>>          depends on `openssl' will be replced with `virtual/ssl', the recipe
>>         depends on `openssl10' will not be changed.
>>
>>         Set PREFERRED_PROVIDER_virtual//ssl = "openssl | openssl10 |
>> libressl" in conf
>>
>> Or 3: Revert previously patch, rename recipe openssl10 -> openssl 1.0, and
>> set
>>        PREFERRED_VERSION
> Option 1 creates a maintainability issue for openssh. You add the big
> patch that no one understands, then someone else has to rebase it
> later. Of course over time we need to move everything to 1.1 across
> all layers, but at the moment it is not feasible for openssh
> specifically.

It's a long term target, we should try to push upstream to accept
openssl 1.1, such as split one patch to multiple sub patches step
by step, make it more reviewable,  not only openssh, ideally any
recipe depends on 1.0 should be turned to 1.1

> Option 2 implies that openssl, openssl10 and libressl are all drop-in
> replacements for each other which is not true. openssl 1.1 API is
> significantly different, and choosing one or the other option will
> cause significant build breakage. Especially as upstream components
> begin to drop 1.0 support.

Currently, use openssl10 as the standalone recipe to provide openssl,
everything works well in oe-core + oe.

As I mention before, there is still a issue at run time image. Even though
openssh depends on `openssl10',  but the `openssl' is installed at do_rootfs

It breaks DEPEND/RDEPENDS principle

[local.conf]
IMAGE_INSTALL_append = " openssh"
[local.conf]

$ bitbake core-image-minimal

[log.do_rootfs]
   Installing       : openssl-1.1.1~pre9-r0.core2_64
[log.do_rootfs]

The recipe depends on openssl10, but openssl10 will not be installed.
BTW, Is pre9 1.1.1 openssl a stable release?

> Option 3 has the same issue.
>
> Can I suggest option 4? As openssh is already patched in meta-selinux,
> and the problem is specific to that layer, you can add the 1.1 support
> patch there, and replace the openssl10 dependency with openssl (1.1).
> If, over time, that patch can be rebased to new versions of openssh
> without too much trouble, and upstream still hasn't taken it, we can
> re-consider adding it to oe-core.

The meta-selinux only exposes the issue, any recipe depends on
openssl10 and indirect depends openssl will trigger the conflict.

A -> openssl10
A -> B
B -> openssl

In oe-core, the most common situation is any recipe depends on
openssl10 and python2/3, will have the problem

Only openssh patched to meta-selinux is not enough, there are  3
(umip, ipsec-tools, mailx) in oe, 3 (openssl-tpm-engine, tpm-tools,
trousers) in meta-secure-core required to be patched. I think it is
not acceptable for meta-selinux maintainer.

Hi RP,

What about your suggestions?

//Hongxu

> Alex



