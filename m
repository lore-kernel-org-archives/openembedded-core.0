Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwbQn-0004ja-2f for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 17:01:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7PEuXOR031104;
	Thu, 25 Aug 2011 15:56:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30441-03; Thu, 25 Aug 2011 15:56:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7PEuJtR031098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 25 Aug 2011 15:56:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <4E549B97.5060801@windriver.com>
References: <4E549B97.5060801@windriver.com>
Date: Thu, 25 Aug 2011 07:56:16 -0700
Message-ID: <1314284176.5939.195.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bug 1169 eglibc doesn't depend on gcc version correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Aug 2011 15:01:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-24 at 14:35 +0800, Robert Yang wrote:
> Hi experts,
> 
> There is a bug 1169: eglibc doesn't depend on gcc version correctly,
> 
> The produce steps are:
> 
> 1) In the first build dir(e.g, build_1), edit conf/local.conf:
>     SSTATE_DIR = /path/to/share_sstate
> 
>     $ bitbake meta-toolchain
> 
> 2) In the second build dir(e.g, build_2), edit local.conf:
>     SSTATE_DIR = /path/to/share_sstate
>     SDKGCCVERSION="4.5.1"
>     GCCVERSION="4.5.1"
> 
>     $ bitbake meta-toolchain
> 
> Then we will notice the error:
> | error: Failed dependencies:
> |       libgcc1 >= 4.6.0 is needed by eglibc-utils-2.13-r1+svnr14157.armv5te
> 
> The reason is a little complicated:
> As we can see that eglibc's RDPENDS should have 'libgcc', but eglibc's
> DEPENDS(not RDEPENDS) can't have libgcc, otherwise there would be loop
> dependencies(since libgcc already DEPENDS on eglibc), this causes
> eglibc.do_package can't detect that the version of libgcc or gcc
> has been changed from 4.6 to 4.5.1, so it would mirror the
> sstate-eglibc-xxx_package.tgz(which is stored by gcc 4.6) from the
> SSTATE_DIR, and then it would do_package_write_rpm from the data
> of sstate-eglibc-xxx_package.tgz, but the objdump can find that the
> binary file depends on the special version of libgcc, and it would
> write the data( libgcc1 >= 4.6.0) to eglibc.spec, but the current
> version of libgcc is 4.5.1, so there would be dependencies error when
> do_rootfs.
> 
> I don't know how to fix this, maybe we should not mirror the tarball of
> sstate-xxx_package.tgz(which is mirrored according to the DEPENDS) from the
> SSTATE_DIR, but only mirror the tarball of sstate-xxx_deploy-rpm.tgz(which
> is mirrored according to the RDEPENDS, the RDEPENDS is what the binary
> rpm package really cares), the similar to ipk and deb.

The sstate checksum of the sstate-eglibc-xxx_package.tgz package should
have changed when the gcc version changed, such that it would repackage
(based on updated data). I think the problem is that in the sstate code,
we've assumed the toolchain is special and can change:

BB_HASHTASK_WHITELIST ?= "(.*-cross$|.*-native$|.*-cross-initial$|.*-cross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"

and this may be a sign we should reconsider this. Alternatively we could
hiighlight we simply don't support gcc version going backwards...

Cheers,

Richard






