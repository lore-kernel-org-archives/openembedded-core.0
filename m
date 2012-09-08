Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TANQo-0002GI-MN
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 17:58:50 +0200
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 9D79C20E9D;
	Sat,  8 Sep 2012 11:37:03 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute6.internal (MEProxy); Sat, 08 Sep 2012 11:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=zgNiNzRkS2MY+7ToTzvxgl
	hg/K8=; b=FSBdXcWLreyQBeWESAJ3cbb5+9aCvEC4g612FBOv2KyJ5sWHih4olD
	K1a/GXdBTefX66VCBnLklqyxTYBrnpuLCLy3AUfnlpt+Mxz/8nqnVKSUwmIar/Tb
	Noh47nt9dNGn6ttacW6UEWZrBktJkyfK/HM8Oas0eDWV0j2DMoEFQ=
X-Sasl-enc: jaDPJUaGD2wHAxYv358NC3GaFqiah3ky1XFCrfuJmJXc 1347118623
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1FC188E0206;
	Sat,  8 Sep 2012 11:37:03 -0400 (EDT)
Message-ID: <1347118585.2583.14.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Sat, 08 Sep 2012 11:36:25 -0400
In-Reply-To: <504B4880.5000304@windriver.com>
References: <1347033943.8619.0.camel@ted> <504A21A5.7000309@windriver.com>
	<CAJTo0LYnG1BdZ=UkKPWju7UwBZWjEJhQ_svmO4bVwaSL1ZGGkA@mail.gmail.com>
	<1347037772.8619.24.camel@ted> <1347038143.2673.226.camel@phil-desktop>
	<20120908080502.GC3903@sakrah.homelinux.org>
	<504B4880.5000304@windriver.com>
X-Mailer: Evolution 3.4.3 (3.4.3-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a distclean when reconfiguring
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
X-List-Received-Date: Sat, 08 Sep 2012 15:58:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-08 at 08:30 -0500, Mark Hatle wrote:

> In principal I agree completely, however in practice at least 20-30% of the 
> packages I try won't deal w/ the B/S separation properly.

So what I did in my most recent build system[1] is:

1) Default to srcdir != builddir
2) Tag modules which don't support that

See: http://people.gnome.org/~walters/docs/build-api.txt

If a module doesn't support srcdir != builddir, I simply copy the source
tree to the builddir.  This is can be a confusing trap from a developer
perspective; I've caught myself editing the copied source files, and
then had them blown away during a build. 

But in general we should pressure upstreams to support srcdir !=
builddir, because the benefits are great and the drawbacks small.

It'd be awesome if you guys considered having the bitbake autotools
class implement the same semantics.

[1]
http://git.gnome.org/browse/gnome-ostree/tree/src/ostbuild/pyostbuild/builtin_compile_one.py#n132




