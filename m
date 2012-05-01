Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPAn3-0000Gb-JK for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 12:58:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41Amw77013777
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 11:48:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13377-03 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2012 11:48:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41Amo66013771
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 11:48:51 +0100
Message-ID: <1335869332.7415.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 May 2012 11:48:52 +0100
In-Reply-To: <c2cec8404ac996817bc7ec44fc4d800ae2735989.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
	<c2cec8404ac996817bc7ec44fc4d800ae2735989.1335824356.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 18/19] libgcc: Add MLPREFIX to sanity check skip
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
X-List-Received-Date: Tue, 01 May 2012 10:58:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-30 at 15:21 -0700, Saul Wold wrote:
> Fixes:
> ERROR: QA Issue: non -staticdev package contains static .a library: lib32-libgcov-dev path '/work/x86-pokymllib32-linux/lib32-libgcc-4.7.0+svnr186651-r0/packages-split/lib32-libgcov-dev/usr/lib/i586-pokymllib32-linux/4.7.1/libgcov.a'
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/build/tmp/work/x86-pokymllib32-linux/lib32-libgcc-4.7.0+svnr186651-r0/temp/log.do_package.9691
> NOTE: package lib32-libgcc-4.7.0+svnr186651-r0: task do_package: Failed
> ERROR: Task 1077 (virtual:multilib:lib32:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-multilib/build/meta/recipes-devtools/gcc/libgcc_4.7.bb, do_package) failed with exit code '1'
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-devtools/gcc/libgcc_4.7.bb |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
> index 8529755..1262fd3 100644
> --- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
> +++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
> @@ -66,6 +66,5 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_package"
>  
>  BBCLASSEXTEND = "nativesdk"
>  
> -INSANE_SKIP_${PN}-dev = "staticdev"
> -INSANE_SKIP_libgcov${PKGSUFFIX}-dev = "staticdev"
> -
> +INSANE_SKIP_${MLPREFIX}${PN}-dev = "staticdev"
> +INSANE_SKIP_${MLPREFIX}libgcov${PKGSUFFIX}-dev = "staticdev"

You only need to add this in the non ${PN} (second) case. I suspect the
above causes different warnings.

Cheers,

Richard




