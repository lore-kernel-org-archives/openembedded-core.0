Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8103178890
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 01:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2106220AB9;
	Wed, 10 Jan 2018 01:33:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sPL1M3jJhN8j; Wed, 10 Jan 2018 01:33:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2CBD20189;
	Wed, 10 Jan 2018 01:33:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5285E16325F; Tue,  9 Jan 2018 20:33:47 -0500 (EST)
Date: Tue, 9 Jan 2018 20:33:47 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180110013347.GD9657@denix.org>
References: <1515536661-51529-1-git-send-email-denis@denix.org>
	<1515539516.29722.106.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1515539516.29722.106.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] at: explicitly depend on bison-native for deterministic builds
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
X-List-Received-Date: Wed, 10 Jan 2018 01:33:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 09, 2018 at 11:11:56PM +0000, Richard Purdie wrote:
> On Tue, 2018-01-09 at 17:24 -0500, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Usually bison-native gets into sysroot through indirect dependencies,
> > even with RSS. But when bison-native is not in sysroot, due to
> > different
> > system config,
> 
> Any idea what that "different system config" is?
> 
> I get worried about things like this and would like to understand it a
> little better...

Well, if you check recipe-sysroot-native of any target package, you'll see 
that bison-native gets staged for absolutely all target packages, regardless 
of explicit dependencies listed in the corresponding recipe. So, it must be 
coming indirectly from a toolchain dependency. And binutils-cross appears to 
DEPENDS on bison-native. In my case, I'm using an external toolchain and not 
building binutils-cross, hence not getting its dependencies indirectly.

BTW, to verify this theory, I modified binutils and removed bison-native 
dependency, added bison to HOSTTOOLS and now "at" package doesn't have it in 
recipe-sysroot-native. So, the patch is to make this dependency explicit.

-- 
Denys

