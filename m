Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 22DC87FC84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 21:10:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47MKSQ19jSz4K;
	Mon, 25 Nov 2019 22:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574716230;
	bh=mAf4hs+lRKJ1Jz+LSpjJ/lKUpAO5xo5itN3CXArI95o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LhrqUjRWdyzwiThUnpaKWR7EetY7/neLaA1KHYlpuCPUus1B3yLtHlrPrl/0sdILN
	FoqYg/r5VUueV04s9nF9FNA2lNPajCuhfehLO0MYu4cRe2FC/Qw1PihLwrqB/lxSAM
	Et9FBcRMMzLa/GxN33qU4GS1x3+LiiBOLqIkpjzhdyd3RlR+RVqrd4IGU8zxpPFEBZ
	98R7zl88wZbAvDXl2q252w9/ctXvw66/fSbS+SP8km/aavBKmkiw+50fkGt3hwMZgQ
	37hRuEyI9tpJcWFzS0IdFQm+eNO0/kqEUZd5y0ySpJWAtnV9YAlIR9C7YnpRghpdVG
	p2VgyoBEqshDHcoirUYEiChJPDIGY1KwhqExpYMeeexw3QKsworG/I3ji4BnvdJRqy
	HXCN1iR3Olfwh0qMcl4QhfsUaq3KTQxzmmhwKBAxkYItDrZf26kW6TB1OSe6j1OlVU
	uOJTLvVBKEx0jcy8FlpU1NkshRQuDcF5uh+gF/073qyzJt2EkuvLLS7Mku6LMWuaHX
	Mhim2xxkJH15LELCmdhqQnpirZyoMGGzRdYZN9NF8wHNepcnZptJHOQeFu4e+Yzwvk
	Pt6P4VK1xQvYh252+PjIpUhwwPgnzkZRNZY3A4vT9B9ojdzUExPbUZf0bp3G8cg+Rx
	VpXfqZDk12G2mnVUTI6U/TVk=
Date: Mon, 25 Nov 2019 23:10:27 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191125211027.GA32080@localhost>
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
MIME-Version: 1.0
In-Reply-To: <e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Mon, 25 Nov 2019 21:10:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 25, 2019 at 07:26:58PM +0000, Ross Burton wrote:
> On 25/11/2019 18:37, Ankur Tyagi wrote:
> > Hi,
> > 
> > Based upon "thud" branch, I created core-image-minimal for am335x-evm
> > board and resulting image size is very big(71M)
> 
> If disk size is important then a good first step is to use musl instead of
> glibc:
> 
> TCLIBC = "musl"
>...

musl is mainly useful for tiny systems, a 40 MB partition is such a huge
amount of space that the size of the C library no longer matters much.

The size benefit of replacing glibc with musl is around 2 MB.

A partition with an -Os build of Yocto with glibc+systemd (sic)
is around 9 MB, together with bootloader and kernel this all
fits in a 16 MB flash. Use compression for kernel and root
filesystem and everything fits in a 8 MB flash.

> Ross

cu
Adrian

