Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <94115621dac10ec60dbb9e16ffc18688f7e0b32e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] python3-cryptography: enforce identical version for -cryptography-vectors
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 07 Apr 2022 22:10:16 +0100
In-Reply-To: <CA+chaQduTDhBx33DP0ChwQ0y+Foqt6Kx5cSZABqvRi3kriMtfA@mail.gmail.com>
References: <20220317164434.387779-1-ross.burton@arm.com>
	 <20220317164434.387779-2-ross.burton@arm.com>
	 <16E1E04DCAF22D86.750@lists.openembedded.org>
	 <CA+chaQduTDhBx33DP0ChwQ0y+Foqt6Kx5cSZABqvRi3kriMtfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, Alejandro del Castillo <alejandro.delcastillo@ni.com>, Alex Stewart <alex.stewart@ni.com>
Cc: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org

On Thu, 2022-04-07 at 16:48 +0200, Martin Jansa wrote:
> I've tried with rpm and surprisingly it works and dnf was able to
> install python3-cryptography-ptest in the image (even after bumping PR to r1 -
> n python3-cryptography-vectors recipe).
> 
> But still not clear why it works and if it's expected behavior.
> 
> In fresh fedora:37 docker image with rpmdevtools installed I see:
> 
> [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r1
> 36.0.2-r0 < 36.0.2-r1
> [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r0
> 36.0.2-r0 == 36.0.2-r0
> [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0.0 36.0.2-r0.1
> 36.0.2-r0.0 < 36.0.2-r0.1
> 
> But I'm not familiar with dnf/rpm to see how the versioned runtime dependency
> is handled during installation (isn't it resolved by the same libsolv as what
> opkg is using now by default as well?
> 
> + Alejandro in case it should be fixed in opkg somehow.

I did a bit of digging on this and it is basically a difference in behaviour
between the debian and rpm worlds.

In Debian, "1.2.3" != "1.2.3-r0" but in the rpm world, a recipe saying "(=
1.2.3)" with PR=r0 is ok and matches.

We can't obtain the PR of another recipe when writing package manager fields so
this is rather tricky to solve. Debian doesn't support any kind of wildcard in
the versioning either. I've proposed a patch which uses >= and << to force a
very specific range which is horrible but the best I could come up with. I'm
open to other ideas...

Cheers,

Richard

