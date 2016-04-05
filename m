Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88AA376651
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 02:48:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u352muXl000885
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 4 Apr 2016 19:48:56 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Apr 2016 19:48:56 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1459677330.git.liezhi.yang@windriver.com>
	<637f6783157bb0e9449d153133485401bcf2dbb1.1459677330.git.liezhi.yang@windriver.com>
	<CADkTA4NVbCvZwHt62hZzrV+NLpq0qytN_duRv8EigM12mUJs7g@mail.gmail.com>
	<1459719999.7348.142.camel@linuxfoundation.org>
	<CADkTA4Pz5sHPmRMVmQQsoPoQH1tmPkK93QUhtA7LmzibH7-tjQ@mail.gmail.com>
	<57031A9C.3040000@windriver.com>
	<CADkTA4M=kwVZnHi-3EfdjkhV4rA6Ep+hWw3EpZrcfu3Q7pz85A@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57032796.3020302@windriver.com>
Date: Tue, 5 Apr 2016 10:48:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4M=kwVZnHi-3EfdjkhV4rA6Ep+hWw3EpZrcfu3Q7pz85A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto 4.4: enable overlayfs by default
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
X-List-Received-Date: Tue, 05 Apr 2016 02:49:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/05/2016 10:31 AM, Bruce Ashfield wrote:
>
>
> On Mon, Apr 4, 2016 at 9:53 PM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>
>     Hi Bruce,
>
>     How many union fs on Linux, please? AFAIK:
>     * unionfs: not supported by kernel any more.
>     * aufs
>     * overlayfs
>
>     If aufs and overlayfs are conflicted, how about:
>
>     KERNEL_UNION_FS ?= "features/overlayfs/overlayfs.scc"
>
>     KERNEL_EXTRA_FEATURES ?= "[snip] ${KERNEL_UNION_FS}"
>
>     I think that we really need a way to make iso/hddimg work by default
>     to enhance the OOBE.
>
>
> That sort of mechanism can work, but not if it is enabled by default. out of box
> experience
> is one thing, but there are plenty of boot and image types that don't need a
> unionfs, and
> we can't force these as =y for those image types.
>
> If we make a modular config, and a built-in config, we could pick the modular
> config by
> default, and then have the package list for the images that need them, rdepend
> on the
> appropriate modules.

Sounds good, so how about:

1) Update kernel to make overlayfs as module rather than builtin
2) let core-image-minimal-initramfs RDEPENEDS on the module.

// Robert

>
> Bruce
>
>
>     // Robert
>
>     On 04/04/2016 07:56 AM, Bruce Ashfield wrote:
>
>
>
>         On Sun, Apr 3, 2016 at 5:46 PM, Richard Purdie
>         <richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>
>         <mailto:richard.purdie@linuxfoundation.org
>         <mailto:richard.purdie@linuxfoundation.org>>>
>         wrote:
>
>              On Sun, 2016-04-03 at 06:11 -0400, Bruce Ashfield wrote:
>              >
>              >
>              > On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang <
>              >liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>
>         <mailto:liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>>>
>         wrote:
>              > > So that iso can work well, otherwise the iso is readonly and there
>              > > would
>              > > be errors. The other way is aufs, but overlayfs is more pupolar and
>              > > had
>              > > been merged by kernel mainline, we need make iso work well by
>              > > default.
>              > Nope. As I mentioned before, this can't be a always on default. It
>              > will conflict
>              > with other unionFS use cases.
>              >
>              > If you want overlayfs enabled, it needs to be triggered from a
>              > specific image
>              > or distro feature.
>
>              We can't change the kernel config from an image so it would have to be
>              a distro setting. Is there a problem with enabling both as modules btw?
>              I assume they can coexist?
>
>
>         I've always found it limiting that we can't trigger kernel features based on
>         what an image'
>         type actually needs, but I understand why/how it works like this.
>
>         If it can't be triggered by an image setting, then just keeping a layer
>         that is
>         added
>         to the build, that has a bbappend with the appropriate KERNEL_FEATURES would
>         also work, and is the approach that I've also taken.
>
>         Not that the existing configs are great in this respect (they need a lot of
>         streamlining),
>         but building modules 'just in case' eventually leads to allmodconfig :)
>
>         I'd imagine they could co-exist, but it isn't something I've tried.
>
>         Bruce
>
>
>              Cheers,
>
>              Richard
>
>
>
>
>         --
>         "Thou shalt not follow the NULL pointer, for chaos and madness await
>         thee at its
>         end"
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
> end"

